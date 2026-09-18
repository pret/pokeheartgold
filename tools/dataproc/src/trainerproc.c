#include <getopt.h>
#include <stdarg.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "common.h"
#include "dataproc.h"
#include "libenum.h"
#include "nitroarc.h"

#include "constants/battle.h"
#include "constants/moves.h"
#include "constants/pokemon.h"
#include "generated/trainers.h"
#include "generated/trainer_classes.h"

#include "struct_defs/trainer_data.h"

static enum_template_t enums[] = {
    include_enum("generated/ai_flags.h",              "enum AIFlag"),
    include_enum("generated/items.h",                 "enum Item"),
    include_enum("generated/moves.h",                 "enum Move"),
    include_enum("generated/species.h",               "enum Species"),
    include_enum("generated/trainer_classes.h",       "enum TrainerClass"),
    include_enum("generated/trainer_message_types.h", "enum TrainerMessageType"),
    { .from_file = NULL },
};

enum {
    A_TRAINER_HEADERS,
    A_TRAINER_PARTIES,
};

static archive_template_t archives[] = {
    [A_TRAINER_HEADERS] = { .out_filename = "trdata.narc" },
    [A_TRAINER_PARTIES] = { .out_filename = "trpoke.narc" },
    { .out_filename = NULL },
};

static header_template_t headers[] = {
    { .out_filename = "trainer_scripts.h" },
    { .out_filename = NULL                },
};

enum {
    T_TRAINER_MESSAGES,
    T_TRAINER_NAMES,
};

static textbank_template_t textbanks[] = {
    [T_TRAINER_MESSAGES] = { .key =  6120, .out_filename = "npc_trainer_messages.json" },
    [T_TRAINER_NAMES]    = { .key = 55533, .out_filename = "npc_trainer_names.json"    },
    { .out_filename = NULL },
};

static char *program_name  = NULL;
static char *filename     = NULL;
static char *base_dir      = NULL;
static char *depfile_path = "trainer_data.d";
static char *output_dir    = ".";

typedef struct TrainerParty {
    TrainerMonWithMovesAndItem party[MAX_PARTY_SIZE];
    unsigned size;
} TrainerParty;

typedef struct Container {
    TrainerHeader header;
    TrainerParty  party;
} Container;

static void parse_args(int *pargc, char ***pargv);

static Container proc_trainer(datafile_t *df, enum TrainerID trainer);
static void emit_name(datafile_t *df, enum TrainerID trainer, const TrainerHeader *trainer_header, const char *stem);
static void proc_messages(datafile_t *df, enum TrainerID trainer);
static void pack(Container *trainer);
static void emit_trainer_scripts(size_t trainer_count);
static int  emit_trainer_messages(enum_seq_t *trainers);
static void prep_trainer_messages(size_t trainer_count);

int main(int argc, char *argv[]) {
    char       buf[BUFSIZE];
    datafile_t df   = { 0 };
    unsigned   errc = EXIT_SUCCESS;

    parse_args(&argc, &argv);
    enum_seq_t trainers = common_initenum(
        filename, "TrainerID",
        .sourcefile  = __FILE__,
        .depfile     = depfile_path,
        .outdir      = output_dir,
        .format      = DATAPROC_F_JSON,
        .enums       = enums,
        .archives    = archives,
        .headers     = headers,
        .textbanks   = textbanks,
    );

    // The primary processing loop here handles all trainer headers and parties, and also
    // emits the name of each trainer to a text-bank. It does not actually emit any of the
    // message data, which is handled by emit_trainer_messages.
    prep_trainer_messages(trainers.size);
    for (size_t i = 0; i < trainers.size; i++) {
        const char *stem = trainers.members[i].name + lengthof("TRAINER_");

        char *basename = strlower(stem);
        char *filepath = pathjoin(base_dir, NULL, strfmt("%s.json", basename));
        declare_dep(filepath);

        if (dp_load(&df, filepath) == 0) {
            enum TrainerID id      = (enum TrainerID)i;
            Container      trainer = proc_trainer(&df, id);

            emit_name(&df, id, &trainer.header, basename);
            proc_messages(&df, id); // For post-processing
            pack(&trainer);
        }

        if (dp_report(&df) == DIAG_ERROR) errc = EXIT_FAILURE;

        free(filepath);
        dp_free(&df);
    }

    emit_trainer_scripts(trainers.size);
    if (emit_trainer_messages(&trainers)) errc = EXIT_FAILURE;
    return common_done(errc, NULL);
}

Container proc_trainer(datafile_t *df, enum TrainerID trainer) {
    datanode_t party      = dp_get(df, ".party");
    size_t     party_size = dp_arrlen(party);
    if (trainer > TRAINER_NONE && party_size < 1) dp_error(&party, "expected trainer party size to be at least 1");
    else if (party_size > MAX_PARTY_SIZE) {
        dp_warn(&party, "more than %d party members defined; the rest will be ignored!", MAX_PARTY_SIZE);
        party_size = MAX_PARTY_SIZE;
    }

    TrainerHeader header = {
        .monDataType = 0, // initiailized below
        .trainerType = enum_u8(".class", enum TrainerClass),
        .sprite      = 0,
        .partySize   = (u8)party_size,
        .items       = { 0 }, // initialized below
        .aiMask      = 0,     // initialized below
        .battleType  = boolean(".double_battle") ? BATTLE_TYPE_DOUBLES : 0,
    };

    datanode_t ai_flags      = dp_get(df, ".ai_flags");
    size_t     ai_flags_size = dp_arrlen(ai_flags);
    for (size_t i = 0; i < ai_flags_size; i++) {
        header.aiMask = header.aiMask | dp_u32(dp_lookup(dp_arrelem(ai_flags, i), "enum AIFlag"));
    }

    datanode_t items      = dp_get(df, ".items");
    size_t     items_size = dp_arrlen(items);
    if (items_size > MAX_TRAINER_ITEMS) {
        dp_warn(&items, "more than %d items defined; the rest will be ignored!", MAX_TRAINER_ITEMS);
        items_size = MAX_TRAINER_ITEMS;
    }
    for (size_t i = 0; i < items_size; i++) {
        header.items[i] = dp_u16(dp_lookup(dp_arrelem(items, i), "enum Item"));
    }

    TrainerParty trparty = { .size = (unsigned)party_size };
    if (trainer == TRAINER_NONE) goto early_exit;

    // We peek at the first party-member to determine the data-type and the expected
    // member-values which should exist for the rest of them.
    //
    // The actual data-type value is a bitmask with 8 possible bitflags.
    datanode_t party_member    = dp_arrelem(party, 0);
    const bool party_has_items = dp_objmemb(party_member, "item").type == DATAPROC_T_STRING;
    const bool party_has_moves = dp_objmemb(party_member, "moves").type == DATAPROC_T_ARRAY;
    header.monDataType = (u8)((party_has_moves << 0) | (party_has_items << 1));

    for (size_t i = 0; i < party_size; i++) {
        party_member = dp_arrelem(party, i);

        // We always store the maximum possible data, then trim it when packing
        u16 species = dp_u16(dp_lookup(dp_objmemb(party_member, "species"), "enum Species"));
        u16 form    = dp_u8(dp_objmemb(party_member, "form"));
        trparty.party[i] = (TrainerMonWithMovesAndItem){
            .ivScale = dp_u16(dp_objmemb(party_member, "iv_scale")),
            .level   = dp_u16(dp_objmemb(party_member, "level")),
            .species = (u16)(species | (form << TRAINER_MON_FORM_SHIFT)),
            .cbSeal  = dp_u16(dp_objmemb(party_member, "ball_seal")),
        };

        if (party_has_items) trparty.party[i].item = dp_u16(dp_lookup(dp_objmemb(party_member, "item"), "enum Item"));
        if (party_has_moves) {
            datanode_t moves      = dp_objmemb(party_member, "moves");
            size_t     moves_size = dp_arrlen(moves);
            if (moves_size > LEARNED_MOVES_MAX) {
                dp_warn(&party, "more than %d moves defined for party member; the rest will be ignored!", LEARNED_MOVES_MAX);
                moves_size = LEARNED_MOVES_MAX;
            }

            for (size_t j = 0; j < moves_size; j++) {
                trparty.party[i].moves[j] = dp_u16(dp_lookup(dp_arrelem(moves, j), "enum Move"));
            }
            for (size_t j = moves_size; j < LEARNED_MOVES_MAX; j++) {
                trparty.party[i].moves[j] = MOVE_NONE;
            }
        }
    }

early_exit:
    return (Container){ .header = header, .party = trparty };
}

static void emit_name(datafile_t *df, enum TrainerID trainer, const TrainerHeader *trainer_header, const char *stem) {
#define strfmt2(fmt, ...) (snprintf(buf2, BUFSIZE, fmt, __VA_ARGS__), buf2)
    static const enum TrainerClass uncompressed_classes[] = {
        TRAINER_CLASS_RIVAL,
        TRAINER_CLASS_TOWER_TYCOON,
        TRAINER_CLASS_HALL_MATRON,
        TRAINER_CLASS_FACTORY_HEAD,
        TRAINER_CLASS_ARCADE_STAR,
        TRAINER_CLASS_CASTLE_VALET
    };

    static const enum TrainerID uncompressed_trainers[] = {
        TRAINER_RILEY_BATTLEGROUND,
        TRAINER_BUCK_BATTLEGROUND,
        TRAINER_MARLEY_BATTLEGROUND,
        TRAINER_MIRA_BATTLEGROUND,
        TRAINER_CHERYL_BATTLEGROUND,
    };

    char buf[BUFSIZE]  = { 0 };
    char buf2[BUFSIZE] = { 0 };

    const char       *name  = string(".name");
    enum TrainerClass class = trainer_header->trainerType;

    bool compressed = true;
    for (size_t i = 0; i < countof(uncompressed_classes) && compressed; i++) {
        if (uncompressed_classes[i] == class) compressed = false;
    }
    for (size_t i = 0; i < countof(uncompressed_trainers) && compressed; i++) {
        if (uncompressed_trainers[i] == trainer) compressed = false;
    }

    bank_push(T_TRAINER_NAMES, strfmt("NPCTrainerNames_Text_%s", stem),
              strfmt2(compressed ? "{TRNAME}%s" : "%s", name));
#undef strfmt2
}

typedef struct TrainerMessagesEntry {
    size_t  count;      // The number of messages for this trainer
    u16     trainer;    // The actual ID of this trainer.
    u16     index;      // The ordered-index of this trainer in trtbl
    u16    *types;      // An array of message-types for this trainer
    char ***messages;   // An array of message-content for this trainer
    size_t *line_count; // The number of lines for each message
    size_t *garbage;    // An array of entries that are garbage, not real messages.
} TrainerMessagesEntry;

static TrainerMessagesEntry *trainer_messages = NULL;
static size_t                count_trtbl      = 0;

#define VANILLA_TRAINER_COUNT          928
#define VANILLA_TRAINERS_WITH_MESSAGES 836

static const u16 trtbl_indices[VANILLA_TRAINER_COUNT];

char* strdupe(const char *s) {
    if (!s) return NULL;

    size_t l = strlen(s);
    char  *r = calloc(l + 1, sizeof(*r));
    return memcpy(r, s, l);
}

static void proc_messages(datafile_t *df, enum TrainerID trainer) {
    TrainerMessagesEntry *p_messages = &trainer_messages[trainer];

    datanode_t messages = dp_get(df, ".messages");
    p_messages->count   = dp_arrlen(messages);
    if (p_messages->count == 0) return;

    p_messages->index      = trainer < VANILLA_TRAINER_COUNT ? trtbl_indices[trainer] : -1;
    p_messages->trainer    = (u16)trainer;
    p_messages->types      = calloc(p_messages->count, sizeof(*p_messages->types));
    p_messages->messages   = calloc(p_messages->count, sizeof(*p_messages->messages));
    p_messages->line_count = calloc(p_messages->count, sizeof(*p_messages->line_count));
    p_messages->garbage    = calloc(p_messages->count, sizeof(*p_messages->garbage));

    for (size_t i = 0; i < p_messages->count; i++) {
        datanode_t entry     = dp_arrelem(messages, i);
        p_messages->types[i] = dp_u16(dp_lookup(dp_objmemb(entry, "type"), "enum TrainerMessageType"));

        for (size_t j = 0; j < i; j++) {
            if (p_messages->types[j] == p_messages->types[i]) {
                datanode_t  prev = dp_arrelem(messages, j);
                const char *type = dp_string(prev);
                dp_warn(&entry, "trainer message with type '%s' was already defined", type);
                dp_note(&prev,  "previous definition was here");
            }
        }

        if (dp_hasmemb(entry, "en_US")) {
            datanode_t content = dp_objmemb(entry, "en_US");
            if (content.type == DATAPROC_T_STRING) {
                const char *line           = dp_string(content);
                p_messages->line_count[i]  = 1;
                p_messages->messages[i]    = calloc(1, sizeof(char *));
                p_messages->messages[i][0] = strdupe(line);
            }
            else if (content.type == DATAPROC_T_ARRAY) {
                p_messages->line_count[i] = dp_arrlen(content);
                p_messages->messages[i]   = calloc(p_messages->line_count[i], sizeof(char *));

                for (size_t j = 0; j < p_messages->line_count[i]; j++) {
                    p_messages->messages[i][j] = strdupe(dp_string(dp_arrelem(content, j)));
                }
            }
            else {
                dp_error(&content, "expected message content to be a string or an array");
            }
        }
        else if (dp_hasmemb(entry, "garbage")) {
            p_messages->garbage[i] = dp_u64(dp_objmemb(entry, "garbage"));
        }
        else {
            dp_error(&entry, "expected exactly one of either 'en_US' or 'garbage'");
        }
    }

    count_trtbl += p_messages->count;
}

static int sort_byindex(const void *lhs, const void *rhs) {
    const TrainerMessagesEntry *l = lhs;
    const TrainerMessagesEntry *r = rhs;

    if (l->index < r->index) return -1;
    if (l->index > r->index) return  1;
    return 0;
}

typedef struct TrainerMessage {
    u16 trainerID;
    u16 messageType;
} TrainerMessage;

static TrainerMessage *trtbl    = NULL;
static u16            *trtblofs = NULL;
static TrainerMessage *p_trtbl  = NULL;

static int emit_trainer_messages(enum_seq_t *trainers) {
    qsort(trainer_messages, trainers->size, sizeof(*trainer_messages), sort_byindex);

    trtbl    = calloc(count_trtbl,    sizeof(*trtbl));
    trtblofs = calloc(trainers->size, sizeof(*trtblofs));
    p_trtbl  = trtbl;

    char buf[BUFSIZE] = { 0 };
    for (size_t i = 0; i < trainers->size; i++) {
        TrainerMessagesEntry *entry = &trainer_messages[i];
        if (entry->count == 0) continue;

        trtblofs[entry->trainer] = (u16)((p_trtbl - trtbl) & 0xFFFF) * sizeof(*trtbl);
        for (size_t message_id = 0; message_id < entry->count; message_id++) {
            p_trtbl->trainerID   = entry->trainer;
            p_trtbl->messageType = entry->types[message_id];
            p_trtbl++;

            // Insert the messages here more mechanically due to the structure.
            datanode_t bank_entry = dp_arr_appobject(&textbanks[T_TRAINER_MESSAGES].root);
            dp_obj_putstring(&bank_entry, "id",
                             strfmt("NPCTrainerMessages_Text_%s_%zu", trainers->members[i].name, message_id));
            if (entry->garbage[message_id]) {
                dp_obj_putint(&bank_entry, "garbage", entry->garbage[message_id]);
            }
            else if (entry->line_count[message_id] == 1) {
                dp_obj_putstring(&bank_entry, "en_US", entry->messages[message_id][0]);
            }
            else {
                datanode_t lines = dp_obj_putarray(&bank_entry, "en_US");
                for (size_t line = 0; line < entry->line_count[message_id]; line++) {
                    dp_arr_appstring(&lines, entry->messages[message_id][line]);
                }
            }
        }
    }

    return fdump_blobnarc(trtbl,    (u32)(count_trtbl  * sizeof(*trtbl)),      "trtbl.narc")
        || fdump_blobnarc(trtblofs, (u32)(trainers->size * sizeof(*trtblofs)), "trtblofs.narc")
        || EXIT_SUCCESS;
}

#define PARTY_HAS_MOVES (!!(trainer->header.monDataType & 0x01))
#define PARTY_HAS_ITEMS (!!(trainer->header.monDataType & 0x02))

static void pack(Container *trainer) {
    char   party_buf[sizeof(trainer->party.party)] = { 0 };
    size_t mon_size = sizeof(TrainerMonBase)
        + (PARTY_HAS_MOVES ? (sizeof(u16) * LEARNED_MOVES_MAX) : 0)
        + (PARTY_HAS_ITEMS ? sizeof(u16) : 0);

    char  *p = party_buf;
    for (size_t i = 0; i < trainer->party.size; i++) {
        size_t copy_size = offsetof(TrainerMonBase, cbSeal);
        memcpy(p, &trainer->party.party[i], copy_size);
        p += copy_size;

        if (PARTY_HAS_ITEMS) {
            copy_size = sizeof(trainer->party.party[i].item);
            memcpy(p, &trainer->party.party[i].item, copy_size);
            p += copy_size;
        }

        if (PARTY_HAS_MOVES) {
            copy_size = sizeof(trainer->party.party[i].moves);
            memcpy(p, &trainer->party.party[i].moves, copy_size);
            p += copy_size;
        }

        copy_size = sizeof(trainer->party.party[i].cbSeal);
        memcpy(p, &trainer->party.party[i].cbSeal, copy_size);
        p += copy_size;
    }

    // TRAINER_NONE has 0 party members, but a non-zero file size in the archive
    u32 party_buf_size = (u32)(mon_size * (trainer->party.size ? trainer->party.size : 1));
    party_buf_size    += (-party_buf_size & 3); // align to a 4-byte boundary

    nitroarc_ppack(
        &archives[A_TRAINER_HEADERS].packer,
        &trainer->header,
        sizeof(trainer->header),
        NULL);
    nitroarc_ppack(
        &archives[A_TRAINER_PARTIES].packer,
        party_buf,
        party_buf_size,
        NULL);
}

static void prep_trainer_messages(size_t count) {
    trainer_messages = calloc(count, sizeof(*trainer_messages));
}

static void emit_trainer_scripts(size_t trainer_count) {
    for (size_t i = 0; i < trainer_count; i++) {
        fputs("    ScriptEntry Battles_Trainer\n", headers[0].out_file);
    }

    fputs("    ScriptEntry Battles_ApproachingTrainer\n", headers[0].out_file);
    fputs("    ScriptEntryEnd\n", headers[0].out_file);
}

static void usage(const char *fmt, ...);

static void parse_args(int *pargc, char ***pargv) {
    program_name = (*pargv)[0];
    opterr       = 0;

    int c = 0;
    while ((c = getopt(*pargc, *pargv, ":o:t:s:M:h")) != -1) {
        switch (c) {
        case 'o': output_dir   = optarg; break;
        case 'M': depfile_path = optarg; break;

        case 'h': usage(NULL);                                 break;
        case ':': usage("missing argument for '-%c'", optopt); break;
        default:  usage("unknown option '-%c'", optopt);     break;
        }
    }

    *pargc -= optind;
    *pargv += optind;
    if (*pargc < 1) usage("missing required argument ENUMFILE");
    if (*pargc < 2) usage("missing required argument BASEDIR");

    filename = (*pargv)[0];
    base_dir = (*pargv)[1];
}

static void usage(const char *fmt, ...) {
    FILE *f = stdout;
    if (fmt != NULL) {
        f = stderr;

        va_list args;
        va_start(args, fmt);
        fputs(program_name, f);
        fputs(": ", f);
        vfprintf(f, fmt, args);
        fputc('\n', f);
        va_end(args);
    }

#define fputf(fmt, ...) fprintf(f, fmt, __VA_ARGS__)
    fputf("usage: %s [-M DEPFILE] [-o OUTDIR] BASEDIR\n", program_name);
    fputs("\n", f);
    fputs("options:\n", f);
    fputs("  -o OUTDIR    Write output files to OUTDIR. Does not affect DEPFILE.\n", f);
    fputs("               Defaults to the current working directory.\n", f);
    fputs("  -M DEPFILE   Specify the full path to an output dependency file.\n", f);
    fputs("               Defaults to 'trainer_data.d'.\n", f);
#undef fputf

    exit(f == stdout ? EXIT_SUCCESS : EXIT_FAILURE);
}

// WARNING: HERE BE DRAGONS. You probably don't want to touch this!
static const u16 trtbl_indices[] = {
    -1,
    4,
    5,
    6,
    7,
    -1,
    -1,
    -1,
    -1,
    -1,
    13,
    14,
    12,
    15,
    16,
    17,
    18,
    20,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    91,
    92,
    93,
    95,
    96,
    97,
    99,
    100,
    101,
    102,
    103,
    119,
    104,
    105,
    106,
    108,
    109,
    110,
    111,
    112,
    113,
    114,
    115,
    116,
    117,
    118,
    107,
    125,
    126,
    127,
    128,
    129,
    130,
    131,
    132,
    133,
    134,
    136,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    149,
    150,
    151,
    152,
    153,
    154,
    155,
    156,
    157,
    162,
    163,
    164,
    165,
    166,
    167,
    168,
    169,
    170,
    172,
    173,
    174,
    175,
    176,
    177,
    178,
    179,
    180,
    181,
    182,
    183,
    184,
    187,
    185,
    186,
    190,
    191,
    192,
    195,
    196,
    197,
    198,
    199,
    200,
    202,
    203,
    204,
    205,
    206,
    207,
    208,
    210,
    211,
    212,
    213,
    214,
    215,
    216,
    217,
    218,
    227,
    228,
    230,
    231,
    232,
    233,
    234,
    235,
    236,
    237,
    238,
    239,
    240,
    241,
    242,
    243,
    244,
    245,
    246,
    247,
    248,
    249,
    250,
    251,
    252,
    254,
    256,
    257,
    258,
    259,
    260,
    261,
    262,
    263,
    264,
    265,
    266,
    267,
    268,
    269,
    270,
    271,
    272,
    273,
    274,
    275,
    276,
    277,
    278,
    279,
    280,
    294,
    282,
    283,
    284,
    285,
    286,
    -1,
    -1,
    289,
    290,
    291,
    292,
    2,
    3,
    1,
    0,
    306,
    307,
    293,
    -1,
    -1,
    -1,
    -1,
    -1,
    295,
    296,
    171,
    319,
    320,
    550,
    551,
    552,
    553,
    287,
    338,
    554,
    347,
    348,
    349,
    350,
    145,
    146,
    209,
    308,
    309,
    362,
    158,
    297,
    339,
    354,
    363,
    298,
    340,
    355,
    364,
    159,
    365,
    366,
    77,
    61,
    75,
    322,
    64,
    301,
    304,
    305,
    302,
    303,
    188,
    356,
    357,
    358,
    160,
    367,
    76,
    161,
    63,
    333,
    334,
    335,
    336,
    368,
    299,
    316,
    321,
    332,
    337,
    346,
    353,
    -1,
    10,
    11,
    318,
    341,
    94,
    122,
    123,
    288,
    342,
    359,
    124,
    220,
    315,
    221,
    314,
    219,
    189,
    324,
    343,
    360,
    370,
    344,
    361,
    371,
    135,
    223,
    317,
    351,
    352,
    328,
    329,
    330,
    331,
    8,
    9,
    345,
    193,
    225,
    194,
    226,
    369,
    311,
    312,
    313,
    310,
    300,
    375,
    373,
    378,
    372,
    397,
    419,
    -1,
    -1,
    498,
    19,
    398,
    409,
    410,
    120,
    147,
    411,
    -1,
    -1,
    420,
    -1,
    399,
    421,
    422,
    -1,
    400,
    423,
    424,
    253,
    425,
    426,
    255,
    427,
    428,
    323,
    -1,
    749,
    750,
    506,
    381,
    745,
    511,
    515,
    382,
    383,
    384,
    385,
    379,
    380,
    505,
    512,
    513,
    507,
    509,
    386,
    387,
    388,
    389,
    514,
    508,
    510,
    518,
    522,
    525,
    374,
    499,
    490,
    491,
    492,
    493,
    486,
    487,
    488,
    489,
    62,
    98,
    412,
    281,
    401,
    429,
    430,
    -1,
    -1,
    413,
    37,
    402,
    403,
    414,
    415,
    21,
    404,
    416,
    417,
    376,
    494,
    495,
    496,
    497,
    377,
    500,
    222,
    -1,
    -1,
    538,
    539,
    540,
    541,
    542,
    543,
    544,
    545,
    546,
    547,
    548,
    549,
    229,
    325,
    -1,
    -1,
    121,
    501,
    78,
    79,
    80,
    148,
    224,
    502,
    201,
    -1,
    418,
    326,
    327,
    431,
    432,
    503,
    504,
    405,
    406,
    407,
    408,
    516,
    517,
    519,
    520,
    521,
    523,
    524,
    526,
    528,
    529,
    530,
    531,
    532,
    533,
    742,
    527,
    534,
    535,
    536,
    537,
    743,
    744,
    394,
    391,
    392,
    396,
    393,
    395,
    721,
    714,
    731,
    726,
    720,
    723,
    728,
    718,
    719,
    725,
    716,
    717,
    727,
    722,
    730,
    715,
    729,
    724,
    390,
    433,
    434,
    470,
    435,
    436,
    437,
    438,
    471,
    472,
    439,
    440,
    441,
    442,
    443,
    444,
    473,
    474,
    475,
    476,
    445,
    446,
    447,
    448,
    449,
    450,
    477,
    478,
    479,
    480,
    451,
    481,
    452,
    482,
    453,
    454,
    483,
    484,
    455,
    456,
    457,
    458,
    459,
    460,
    461,
    462,
    463,
    464,
    465,
    466,
    467,
    468,
    469,
    485,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    585,
    586,
    587,
    602,
    603,
    604,
    599,
    600,
    601,
    624,
    625,
    700,
    605,
    606,
    607,
    608,
    609,
    610,
    579,
    580,
    581,
    675,
    676,
    685,
    614,
    615,
    590,
    591,
    592,
    593,
    594,
    595,
    622,
    623,
    696,
    701,
    683,
    666,
    667,
    702,
    703,
    684,
    668,
    669,
    704,
    705,
    660,
    661,
    697,
    706,
    662,
    663,
    698,
    707,
    618,
    619,
    588,
    589,
    681,
    686,
    616,
    617,
    664,
    665,
    634,
    635,
    636,
    682,
    629,
    630,
    759,
    760,
    674,
    708,
    637,
    638,
    573,
    574,
    575,
    570,
    571,
    572,
    596,
    597,
    598,
    576,
    577,
    578,
    648,
    649,
    650,
    582,
    583,
    584,
    611,
    612,
    613,
    651,
    652,
    653,
    689,
    690,
    631,
    632,
    633,
    639,
    640,
    641,
    709,
    642,
    643,
    644,
    710,
    687,
    688,
    691,
    645,
    646,
    647,
    626,
    627,
    628,
    658,
    659,
    670,
    671,
    677,
    678,
    672,
    673,
    679,
    680,
    692,
    693,
    711,
    694,
    695,
    712,
    564,
    565,
    566,
    567,
    568,
    569,
    654,
    655,
    656,
    620,
    657,
    621,
    699,
    713,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    555,
    556,
    557,
    558,
    559,
    560,
    561,
    562,
    563,
    -1,
    733,
    734,
    736,
    737,
    735,
    738,
    -1,
    -1,
    751,
    752,
    753,
    754,
    755,
    756,
    757,
    758,
    732,
    739,
    740,
    741,
    748,
    746,
    747,
    761,
    762,
    763,
    807,
    805,
    809,
    808,
    803,
    802,
    804,
    806,
    811,
    813,
    812,
    814,
    810,
    821,
    822,
    823,
    824,
    825,
    826,
    827,
    828,
    769,
    770,
    771,
    773,
    774,
    775,
    765,
    766,
    767,
    777,
    778,
    779,
    781,
    782,
    783,
    785,
    786,
    787,
    798,
    799,
    789,
    790,
    791,
    793,
    794,
    795,
    796,
    797,
    817,
    818,
    819,
    820,
    772,
    776,
    768,
    780,
    784,
    788,
    792,
    764,
    830,
    831,
    829,
    832,
    833,
    834,
    835,
    800,
    801,
    -1,
    -1,
    -1,
    815,
    816,
};
