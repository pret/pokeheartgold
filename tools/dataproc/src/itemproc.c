#include <stdarg.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "common.h"
#include "dataproc.h"
#include "libenum.h"
#include "nitroarc.h"

#undef  ALIGN_4 // MATCH DETAIL: We must re-define this to include a properly-sized ItemData struct.
#define ALIGN_4

#include "constants/items.h"
#include "data/field/hidden_items.h"
#include "berry_data.h"
#include "item.h"

static enum_template_t enums[] = {
    include_defs("constants/items.h",             "POCKET"),
    include_defs("constants/items.h",             "BATTLE_POCKET_MASK"),
    include_defs("constants/items.h",             "PLUCK_EFFECT"),
    include_defs("constants/items.h",             "FLING_EFFECT"),
    include_defs("constants/items.h",             "ITEM_USE_FUNC"),
    include_defs("berry_data.h",                  "FIRMNESS"),
    include_defs("res/items/item_icon.naix",      NULL),
    include_enum("generated/item_hold_effects.h", "enum ItemHoldEffect"),
    include_enum("generated/moves.h",             "enum Move"),
    include_enum("generated/pokemon_types.h",     "enum PokemonType"),
    { .from_file = NULL },
};

static archive_template_t archives[] = {
    { .out_filename = "pl_item_data.narc" },
    { .out_filename = NULL },
};

enum {
    H_ITEM_ID_MAP,
    H_TM_MOVE_MAP,
    H_BERRY_LIST,
    H_MAIL_LIST,
    H_HIDDEN_ITEM_SCRIPTS,
};

static header_template_t headers[] = {
    [H_ITEM_ID_MAP]         = { .out_filename = "item_id_map.h"         },
    [H_TM_MOVE_MAP]         = { .out_filename = "item_tm_move_map.h"    },
    [H_BERRY_LIST]          = { .out_filename = "item_berry_list.h"     },
    [H_MAIL_LIST]           = { .out_filename = "item_mail_list.h"      },
    [H_HIDDEN_ITEM_SCRIPTS] = { .out_filename = "hidden_item_scripts.h" },
    { 0 },
};

enum {
    T_ITEM_NAMES,
    T_ITEM_NAMES_PLURAL,
    T_ITEM_NAMES_WITH_ARTICLE,
    T_ITEM_DESCRIPTIONS,
};

static textbank_template_t textbanks[] = {
    [T_ITEM_NAMES]              = { .key = 51885, .out_filename = "item_names.json"               },
    [T_ITEM_NAMES_PLURAL]       = { .key = 11181, .out_filename = "item_names_plural.json"        },
    [T_ITEM_NAMES_WITH_ARTICLE] = { .key = 41760, .out_filename = "item_names_with_articles.json" },
    [T_ITEM_DESCRIPTIONS]       = { .key = 24316, .out_filename = "item_descriptions.json"        },
    { 0 },
};

static void parse_args(int *pargc, char ***pargv);

static bool has_data(const char *name);
static void proc_item(datafile_t *df, const char *member);
static void proc_text(const char *stem, const char *name, const char *plural, datanode_t *article, datanode_t *desc);
static void add_idmap(datafile_t *df, size_t i, size_t data_id);
static int  pack_berries(void);
static void emit_hidden_scripts(void);

static char *filename     = NULL;
static char *base_dir     = NULL;
static char *depfile_path = "item_data.d";
static char *output_dir   = ".";

static size_t iter_data = 0;

int main(int argc, char **argv) {
    int        errc         = EXIT_SUCCESS;
    char       buf[BUFSIZE] = { 0 };
    datafile_t df           = { 0 };

    parse_args(&argc, &argv);
    enum_seq_t items = common_initenum(
        filename, "Item",
        .sourcefile  = __FILE__,
        .depfile     = depfile_path,
        .outdir      = output_dir,
        .format      = DATAPROC_F_JSON,
        .enums       = enums,
        .archives    = archives,
        .headers     = headers,
        .textbanks   = textbanks,
        .filter      = has_data,
    );

    for (size_t i = 0; i < items.size; i++) {
        const char *stem = items.members[i].name + lengthof("ITEM_");
        if (has_data(items.members[i].name)) {
            char *basename = strlower(strfmt("%s.json", stem));
            char *filepath = pathjoin(base_dir, NULL, basename);
            declare_dep(filepath);

            if (dp_load(&df, filepath) == 0) {
                datanode_t name    = dp_get(&df, ".name");
                datanode_t plural  = dp_get(&df, ".plural");
                datanode_t article = dp_get(&df, ".article");
                datanode_t desc    = dp_get(&df, ".description");

                proc_item(&df, items.members[i].name);
                proc_text(stem, dp_string(name), dp_string(plural), &article, &desc);
                add_idmap(&df, i, iter_data++);
            }

            if (dp_report(&df) == DIAG_ERROR) errc = EXIT_FAILURE;

            free(basename);
            free(filepath);
            dp_free(&df);
        }
        else {
            proc_text(stem, "???", "???", NULL, NULL);
            add_idmap(NULL, i, 0);
        }
    }

    emit_hidden_scripts();

    return common_done(errc, pack_berries);
}

static bool has_data(const char *name) {
    return strncmp(name, "ITEM_", lengthof("ITEM_")) == 0
        && strncmp(name + lengthof("ITEM_"), "UNUSED_", lengthof("UNUSED_")) != 0;
}

static u8  iter_balls   = 0;
static u8  iter_mail    = 0;
static u8  iter_rods    = 0;
static u16 iter_tms     = 0;
static u16 iter_berries = 0;

static void proc_berry(datanode_t berry_data);
static void proc_params(datafile_t *df, ItemData *item);

#define towidth(a, bits) ((typeof(a))((a) & maxbit(bits)))

static void proc_item(datafile_t *df, const char *member) {
    ItemData item = {
        .price            = u16(".price"),
        .effectParam      = u8(".effectParam"),
        .holdEffect       = enum_u8(".holdEffect", enum ItemHoldEffect),
        .pluckEffect      = enum_u8(".pluckEffect", PLUCK_EFFECT),
        .flingEffect      = enum_u8(".flingEffect", FLING_EFFECT),
        .flingPower       = u8(".flingPower"),
        .naturalGiftPower = u8(".naturalGiftPower"),
        .preventToss      = boolean(".preventToss"),
        .canRegister      = boolean(".canRegister"),
        .fieldPocket      = towidth(enum_u8(".fieldPocket", POCKET), 4),
        .battlePocket     = towidth(enum_u8(".battlePocket", BATTLE_POCKET_MASK), 5),
        .fieldUseFunc     = enum_u8(".fieldUseFunc", ITEM_USE_FUNC),
        .battleUseFunc    = u8(".battleUseFunc"),
    };

    datanode_t nat_gift_type = dp_get(df, ".naturalGiftType");
    item.naturalGiftType = towidth(
        (u8)(nat_gift_type.type != DATAPROC_T_NULL
            ? dp_u8range(dp_lookup(nat_gift_type, "enum PokemonType"), 0, maxbit(5))
            : ~0),
        5
    );

    switch (item.fieldUseFunc) {
    case ITEM_USE_FUNC_NONE:
        if (item.fieldPocket == POCKET_BALLS) item.dummy = iter_balls++;
        else proc_params(df, &item);
        break;

    case ITEM_USE_FUNC_OLD_ROD:   // fall-through
    case ITEM_USE_FUNC_GOOD_ROD:  // fall-through
    case ITEM_USE_FUNC_SUPER_ROD: item.dummy = iter_rods++; break;

    case ITEM_USE_FUNC_MAIL:
        item.dummy = iter_mail++;
        fprintf(headers[H_MAIL_LIST].out_file, "    [%u] = %s,\n", item.dummy, member);
        break;

    case ITEM_USE_FUNC_TM_HM: {
        datanode_t move = dp_get(df, ".teachesMove");
        if (move.type == DATAPROC_T_ERR) break;

        datanode_t move_id = dp_lookup(move, "enum Move");
        if (move_id.type != DATAPROC_T_MAPPED) break;

        fprintf(headers[H_TM_MOVE_MAP].out_file, "    [%u] = %s,\n", iter_tms++, dp_string(move));
        break;
    }

    case ITEM_USE_FUNC_EVO_STONE: // Special case to remove a foot-gun for evolution items
        proc_params(df, &item);
        item.partyUseParam.evolve = true;
        break;

    case ITEM_USE_FUNC_BERRY:
        fprintf(headers[H_BERRY_LIST].out_file, "    [%u] = %s,\n", iter_berries++, member);
        proc_berry(dp_get(df, ".berryData"));
        // fall-through

    default: proc_params(df, &item); break;
    }

    nitroarc_ppack(&archives[0].packer, &item, sizeof(item), NULL);
}

#define tryparam(params, key) (dp_hasmemb(params, key) ? dp_objmemb(params, key) : (datanode_t){ .type = DATAPROC_T_MAPPED, .mapped = 0 })

static void proc_params(datafile_t *df, ItemData *item) {
    datanode_t params = dp_get(df, ".itemUseParams");
    if (params.type == DATAPROC_T_NULL) return;
    if (params.type != DATAPROC_T_OBJECT) {
        dp_error(&params, "expected either an object or null");
        return;
    }

    item->partyUse      = true;
    item->partyUseParam = (ItemPartyParam){
        .healSleep     = dp_bool(tryparam(params, "healSleep")),
        .healPoison    = dp_bool(tryparam(params, "healPoison")),
        .healBurn      = dp_bool(tryparam(params, "healBurn")),
        .healFreeze    = dp_bool(tryparam(params, "healFreeze")),
        .healParalysis = dp_bool(tryparam(params, "healParalysis")),
        .healConfusion = dp_bool(tryparam(params, "healConfusion")),
        .healAttract   = dp_bool(tryparam(params, "healAttract")),
        .guardSpec     = dp_bool(tryparam(params, "guardSpec")),
        .revive        = dp_bool(tryparam(params, "revive")),
        .reviveAll     = dp_bool(tryparam(params, "reviveAll")),
        .levelUp       = dp_bool(tryparam(params, "levelUp")),
        .ppUp          = dp_bool(tryparam(params, "ppUp")),
        .ppMax         = dp_bool(tryparam(params, "ppMax")),
        .ppRestoreAll  = dp_bool(tryparam(params, "restorePPAllMoves")),

        .atkStages   = (u8)(dp_u8range(tryparam(params, "atkStages"),   0, maxbit(4)) & maxbit(4)),
        .defStages   = (u8)(dp_u8range(tryparam(params, "defStages"),   0, maxbit(4)) & maxbit(4)),
        .spatkStages = (u8)(dp_u8range(tryparam(params, "spatkStages"), 0, maxbit(4)) & maxbit(4)),
        .spdefStages = (u8)(dp_u8range(tryparam(params, "spdefStages"), 0, maxbit(4)) & maxbit(4)),
        .speedStages = (u8)(dp_u8range(tryparam(params, "speedStages"), 0, maxbit(4)) & maxbit(4)),
        .accStages   = (u8)(dp_u8range(tryparam(params, "accStages"),   0, maxbit(4)) & maxbit(4)),
        .critStages  = (u8)(dp_u8range(tryparam(params, "critStages"),  0, maxbit(2)) & maxbit(2)),

        .hpRestored = dp_s8(tryparam(params, "hpRestored")),
        .ppRestored = dp_s8(tryparam(params, "ppRestored")) & maxbit(7),

        .hpEVs          = dp_s8(tryparam(params, "hpEVs")),
        .atkEVs         = dp_s8(tryparam(params, "atkEVs")),
        .defEVs         = dp_s8(tryparam(params, "defEVs")),
        .speedEVs       = dp_s8(tryparam(params, "speedEVs")),
        .spatkEVs       = dp_s8(tryparam(params, "spatkEVs")),
        .spdefEVs       = dp_s8(tryparam(params, "spdefEVs")),
        .friendshipLow  = dp_s8(tryparam(params, "friendshipLow")),
        .friendshipMed  = dp_s8(tryparam(params, "friendshipMed")),
        .friendshipHigh = dp_s8(tryparam(params, "friendshipHigh")),
    };

    item->partyUseParam.ppRestore = item->partyUseParam.ppRestored > 0 && item->partyUseParam.ppRestoreAll == 0;
    item->partyUseParam.hpRestore = item->partyUseParam.hpRestored > 0;

    item->partyUseParam.giveHPEVs    = item->partyUseParam.hpEVs != 0;
    item->partyUseParam.giveAtkEVs   = item->partyUseParam.atkEVs != 0;
    item->partyUseParam.giveDefEVs   = item->partyUseParam.defEVs != 0;
    item->partyUseParam.giveSpeedEVs = item->partyUseParam.speedEVs != 0;
    item->partyUseParam.giveSpAtkEVs = item->partyUseParam.spatkEVs != 0;
    item->partyUseParam.giveSpDefEVs = item->partyUseParam.spdefEVs != 0;

    item->partyUseParam.giveFriendshipLow  = item->partyUseParam.friendshipLow != 0;
    item->partyUseParam.giveFriendshipMed  = item->partyUseParam.friendshipMed != 0;
    item->partyUseParam.giveFriendshipHigh = item->partyUseParam.friendshipHigh != 0;
}

static BerryData berries[UINT8_MAX] = { 0 };
static size_t    len_berries        = 0;

static void proc_berry(datanode_t berry_data) {
    berries[len_berries++] = (BerryData){
        .size              = dp_u16(dp_objmemb(berry_data, "size")),
        .firmness          = dp_u8(dp_lookup(dp_objmemb(berry_data, "firmness"), "FIRMNESS")),
        .baseYield         = dp_u8(dp_objmemb(berry_data, "baseYield")),
        .stageDuration     = dp_u8(dp_objmemb(berry_data, "stageDuration")),
        .moistureDrainRate = dp_u8(dp_objmemb(berry_data, "moistureDrainRate")),
        .spiciness         = dp_u8(dp_objmemb(berry_data, "spiciness")),
        .dryness           = dp_u8(dp_objmemb(berry_data, "dryness")),
        .sweetness         = dp_u8(dp_objmemb(berry_data, "sweetness")),
        .bitterness        = dp_u8(dp_objmemb(berry_data, "bitterness")),
        .sourness          = dp_u8(dp_objmemb(berry_data, "sourness")),
        .smoothness        = dp_u8(dp_objmemb(berry_data, "smoothness")),
    };
}

static int pack_berries(void) {
    nitroarc_packer_t p = init_narc((u16)len_berries, false, false);
    for (size_t i = 0; i < len_berries; i++) {
        nitroarc_ppack(&p, &berries[i], sizeof(*berries), NULL);
    }

    return fdump_narc(&p, "nuts_data.narc", true);
}

static void proc_text(const char *stem, const char *name, const char *plural, datanode_t *article, datanode_t *desc) {
#define strfmt2(fmt, ...) (snprintf(buf2, BUFSIZE, fmt, __VA_ARGS__), buf2)
    char buf[BUFSIZE] = { 0 };
    char buf2[BUFSIZE] = { 0 };

    bank_push(T_ITEM_NAMES, strfmt("ItemNames_Text_%s", stem), name);
    bank_push(T_ITEM_NAMES_PLURAL, strfmt("ItemNamesPlural_Text_%s", stem), plural);

    char *article_id = strfmt2("ItemNamesWithArticles_Text_%s", stem);
    if (strcmp(plural, "???") == 0) {
        bank_push(T_ITEM_NAMES_WITH_ARTICLE, article_id, plural);
    }
    else if (article->type == DATAPROC_T_NULL) {
        bank_push(T_ITEM_NAMES_WITH_ARTICLE, article_id, strfmt("{COLOR 255}%s{COLOR 0}", name));
    }
    else {
        bank_push(T_ITEM_NAMES_WITH_ARTICLE, article_id, strfmt("%s {COLOR 255}%s{COLOR 0}", dp_string(*article), name));
    }

    if (desc) bank_push(T_ITEM_DESCRIPTIONS, strfmt("ItemDescriptions_Text_%s", stem), *desc);
    else      bank_push(T_ITEM_DESCRIPTIONS, strfmt("ItemDescriptions_Text_%s", stem), 0);
#undef strfmt2
}

static void add_idmap(datafile_t *df, size_t i, size_t data_id) {
    const char *icon, *palette, *gba_id;
    if (!df) {
        icon    = "none_NCGR";
        palette = "none_NCLR";
        gba_id  = "GBA_ITEM_NONE";
    }
    else {
        icon    = string(".icon.sprite");
        palette = string(".icon.palette");
        gba_id  = string(".gbaID");
    }

    fprintf(headers[H_ITEM_ID_MAP].out_file,
            "    [%zu] = {\n"
            "        .dataID = %zu,\n"
            "        .iconID = %s,\n"
            "        .paletteID = %s,\n"
            "        .gen3ID = %s,\n"
            "    },\n",
            i, data_id, icon, palette, gba_id);
}

static void emit_hidden_scripts(void) {
    size_t maxScriptID = 0; 

    for (size_t i = 0; i < countof(gHiddenItems); i++) {
        if (gHiddenItems[i].script > maxScriptID) {
            maxScriptID = gHiddenItems[i].script;
        }
    }

    for (size_t i = 0; i <= maxScriptID; i++) {
        fputs("    ScriptEntry HiddenItems_Item\n", headers[H_HIDDEN_ITEM_SCRIPTS].out_file);
    }
    fputs("    ScriptEntryEnd\n", headers[H_HIDDEN_ITEM_SCRIPTS].out_file);
}

static void usage(const char *fmt, ...);

static char *program_name  = NULL;

static void parse_args(int *pargc, char ***pargv) {
    program_name = (*pargv)[0];
    opterr       = 0;

    int c = 0;
    while ((c = getopt(*pargc, *pargv, ":o:M:h")) != -1) {
        switch (c) {
        case 'o': output_dir    = optarg; break;
        case 'M': depfile_path  = optarg; break;

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
    fputf("usage: %s [-M DEPFILE] [-o OUTDIR] ENUMFILE BASEDIR\n", program_name);
    fputs("\n", f);
    fputs("options:\n", f);
    fputs("  -o OUTDIR            Write output files to OUTDIR. Does not affect DEPFILE.\n", f);
    fputs("                       Defaults to the current working directory.\n", f);
    fputs("  -M DEPFILE           Specify the full path to an output dependency file.\n", f);
    fputs("                       Defaults to 'item_data.d'.\n", f);
#undef fputf

    exit(f == stdout ? EXIT_SUCCESS : EXIT_FAILURE);
}
