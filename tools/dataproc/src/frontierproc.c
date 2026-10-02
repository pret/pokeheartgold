#include <getopt.h>
#include <stdarg.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "common.h"
#include "dataproc.h"
#include "nitroarc.h"

#include "constants/moves.h"
#include "generated/frontier_trainers.h"

#include "struct_defs/battle_frontier_pokemon_data.h"

static enum_template_t enums[] = {
    include_enum("generated/items.h",                 "enum Item"),
    include_enum("generated/moves.h",                 "enum Move"),
    include_enum("generated/natures.h",               "enum Nature"),
    include_enum("generated/species.h",               "enum Species"),
    include_enum("generated/trainer_classes.h",       "enum TrainerClass"),
    include_enum("generated/trainer_message_types.h", "enum TrainerMessageType"),
    { .from_file = NULL },
};

enum {
    A_FRONTIER_TRAINERS,
    A_FRONTIER_POKEMON,
};

static archive_template_t archives[] = {
    [A_FRONTIER_TRAINERS] = { .out_filename = "pl_btdtr.narc" },
    [A_FRONTIER_POKEMON]  = { .out_filename = "pl_btdpm.narc" },
    { .out_filename = NULL },
};

static header_template_t headers[] = {
    { .out_filename = "frontier_trainer_classes.h" },
    { .out_filename = NULL },
};

enum {
    T_TRAINER_MESSAGES,
    T_TRAINER_NAMES,
};

static textbank_template_t textbanks[] = {
    [T_TRAINER_MESSAGES] = { .key = 35392, .out_filename = "frontier_trainer_messages.json" },
    [T_TRAINER_NAMES]    = { .key = 26501, .out_filename = "frontier_trainer_names.json"    },
    { .out_filename = NULL },
};

static char  *program_name    = NULL;
static char  *base_dir        = NULL;
static char  *depfile_fpath   = "frontier_data.d";
static char  *output_dir      = ".";
static char **tr_registry     = NULL;
static size_t len_tr_registry = 0;
static char **pk_registry     = NULL;
static size_t len_pk_registry = 0;

static void parse_args(int *pargc, char ***pargv);
static int  sort_strcmp(const void *lhs, const void *rhs);

static void pack_pokemon_set(datafile_t *df);
static void pack_trainer(datafile_t *df);
static void emit_trainer_name(datafile_t *df, const char *stem);
static void emit_trainer_messages(datafile_t *df, const char *stem);
static void emit_trainer_classes(datafile_t *df, size_t trainer_idx);

typedef struct dynlookup dynlookup_t;
struct dynlookup {
    lookup_t *data;
    size_t    len;
    size_t    cap;
};

int main(int argc, char *argv[]) {
    parse_args(&argc, &argv);

    splitenv("TRAINERS", &tr_registry, &len_tr_registry, NULL, 0);
    splitenv("POKEMON",  &pk_registry, &len_pk_registry, NULL, 0);
    archives[A_FRONTIER_TRAINERS].num_files = (u16)len_tr_registry;
    archives[A_FRONTIER_POKEMON].num_files  = (u16)len_pk_registry;

    common_init(DATAPROC_F_JSON, enums, archives, headers, textbanks, __FILE__, depfile_fpath, output_dir, NULL, NULL);

    char       buf[BUFSIZE];
    datafile_t df   = { 0 };
    unsigned   errc = EXIT_SUCCESS;
    lookup_t  *sets = calloc(len_pk_registry, sizeof(*sets));

    // Parse available Pokemon sets and ingest their names into a lookup table.
    for (size_t i = 0; i < len_pk_registry; i++) {
        char *path = pathjoin(base_dir, "pokemon", strfmt("%s.json", pk_registry[i]));
        if (dp_load(&df, path) == 0) {
            pack_pokemon_set(&df);
            sets[i] = (lookup_t){ .val = i, .def = pk_registry[i] };
        }

        if (dp_report(&df) == DIAG_ERROR) errc = EXIT_FAILURE;

        free(path);
        dp_free(&df);
    }

    qsort(sets, len_pk_registry, sizeof(*sets), sort_strcmp);
    dp_register(sets, len_pk_registry, "FrontierPokemonSet");

    // Now we can process the trainers.
    for (size_t i = 0; i < len_tr_registry; i++) {
        char *path = pathjoin(base_dir, "data", strfmt("%s.json", tr_registry[i]));
        if (dp_load(&df, path) == 0) {
            pack_trainer(&df);
            emit_trainer_name(&df, tr_registry[i]);
            emit_trainer_messages(&df, tr_registry[i]);
            emit_trainer_classes(&df, i);
        }

        if (dp_report(&df) == DIAG_ERROR) errc = EXIT_FAILURE;

        free(path);
        dp_free(&df);
    }

    return common_done(errc, NULL);
}

static const char *ev_flags[] = {
    ".evFlags.hp",
    ".evFlags.attack",
    ".evFlags.defense",
    ".evFlags.speed",
    ".evFlags.special_attack",
    ".evFlags.special_defense",
};

static void pack_pokemon_set(datafile_t *df) {
    BattleFrontierPokemonData result = {
        .species = enum_u16(".species", enum Species),
        .nature  = enum_u8(".nature", enum Nature),
        .item    = enum_u16(".item", enum Item),
        .form    = u16(".form"),
    };

    datanode_t moves     = dp_get(df, ".moves");
    size_t     num_moves = dp_arrlen(moves);
    if (num_moves > LEARNED_MOVES_MAX) {
        dp_warn(&moves, "more than %d moves defined for frontier set; the rest will be ignored!", LEARNED_MOVES_MAX);
        num_moves = LEARNED_MOVES_MAX;
    }

    size_t i = 0;
    for (; i < num_moves; i++) result.moves[i] = dp_u16(dp_lookup(dp_arrelem(moves, i), "enum Move"));
    for (; i < LEARNED_MOVES_MAX; i++) result.moves[i] = MOVE_NONE;

    for (i = 0; i < countof(ev_flags); i++) {
        if (dp_bool(dp_get(df, ev_flags[i]))) result.evFlags |= (u8)(1 << i);
    }

    nitroarc_ppack(
        &archives[A_FRONTIER_POKEMON].packer,
        &result,
        sizeof(result),
        NULL);
}

static void pack_trainer(datafile_t *df) {
    datanode_t   sets   = dp_get(df, ".availableSets");
    const size_t n_sets = dp_arrlen(sets);
    const size_t size   = 2 + n_sets;

    u16 *trainer = calloc(size, sizeof(*trainer));
    trainer[0]   = dp_u16(dp_lookup(dp_get(df, ".class"), "enum TrainerClass"));
    trainer[1]   = 0;

    for (size_t i = 0; i < n_sets; i++) {
        u16 set = dp_u16(dp_lookup(dp_arrelem(sets, i), "FrontierPokemonSet"));
        if (set != 0) {
            trainer[2 + i] = set;
            trainer[1]++;
        }
    }

    nitroarc_ppack(&archives[A_FRONTIER_TRAINERS].packer, trainer, (u32)(size * sizeof(*trainer)), NULL);
}

static void emit_trainer_name(datafile_t *df, const char *stem) {
    char buf[BUFSIZE] = { 0 };

    bank_push(T_TRAINER_NAMES, strfmt("FrontierTrainerNames_Text_%s", stem), string(".name"));
}

static void emit_trainer_messages(datafile_t *df, const char *stem) {
    char buf[BUFSIZE] = { 0 };

    datanode_t   messages   = dp_get(df, ".messages");
    const size_t n_messages = dp_arrlen(messages);
    for (size_t i = 0; i < n_messages; i++) {
        datanode_t message   = dp_arrelem(messages, i);
        datanode_t type_node = dp_objmemb(message, "type");
        datanode_t lookup    = dp_lookup(type_node, "enum TrainerMessageType");
        if (lookup.type != DATAPROC_T_MAPPED) continue;

        const char *type  = dp_string(type_node);
        const char *id    = strfmt("FrontierTrainerMessages_Text_%s_%s", stem, type);
        if      (dp_hasmemb(message, "en_US"))   bank_push(T_TRAINER_MESSAGES, id, dp_objmemb(message, "en_US"));
        else if (dp_hasmemb(message, "garbage")) bank_push(T_TRAINER_MESSAGES, id, dp_u64(dp_objmemb(message, "garbage")));
        else {
            dp_warn(&message, "expected exactly one of either 'en_US' or 'garbage'; preferring 'en_US'");
        }
    }
}

static FILE **f_trainer_classes = &headers[0].out_file;

static void emit_trainer_classes(datafile_t *df, size_t trainer_idx) {
    const char *trainer_class = string(".class");

    if (trainer_idx < FRONTIER_TRAINER_TRAINER_CHERYL_CHERYL) {
        fprintf(*f_trainer_classes, "    %s,\n", trainer_class);
    }
}

static int sort_strcmp(const void *lhs, const void *rhs) {
    const lookup_t *l = lhs;
    const lookup_t *r = rhs;

    if (l->def == NULL && r->def == NULL) return 0;
    else if (l->def == NULL) return 1;
    else if (r->def == NULL) return -1;

    return strcmp(l->def, r->def);
}

static void usage(const char *fmt, ...);

static void parse_args(int *pargc, char ***pargv) {
    program_name = (*pargv)[0];
    opterr       = 0;

    int c = 0;
    while ((c = getopt(*pargc, *pargv, ":o:t:s:M:h")) != -1) {
        switch (c) {
        case 'o': output_dir       = optarg; break;
        case 'M': depfile_fpath    = optarg; break;

        case 'h': usage(NULL);                                 break;
        case ':': usage("missing argument for '-%c'", optopt); break;
        default:  usage("unknown option '-%c'", optopt);     break;
        }
    }

    *pargc -= optind;
    *pargv += optind;
    if (*pargc < 1) usage("missing required argument BASEDIR");

    base_dir = (*pargv)[0];
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
    fputs("               Defaults to 'frontier_data.d'.\n", f);
#undef fputf

    exit(f == stdout ? EXIT_SUCCESS : EXIT_FAILURE);
}
