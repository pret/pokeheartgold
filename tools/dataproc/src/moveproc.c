#include <assert.h>
#include <getopt.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>

#include "common.h"
#include "dataproc.h"
#include "libenum.h"
#include "nitroarc.h"

#include "move_table.h"
#include "generated/move_battle_effects.h"
#include "generated/move_classes.h"
#include "generated/move_contest_effects.h"
#include "generated/move_flags.h"
#include "generated/move_ranges.h"
#include "generated/moves.h"
#include "generated/pokemon_contest_types.h"
#include "generated/pokemon_types.h"

static enum_template_t enums[] = {
    include_enum("generated/move_battle_effects.h",   "enum MoveBattleEffect"),
    include_enum("generated/move_contest_effects.h",  "enum MoveContestEffect"),
    include_enum("generated/move_classes.h",          "enum MoveClass"),
    include_enum("generated/move_flags.h",            "enum MoveFlag"),
    include_enum("generated/move_ranges.h",           "enum MoveRange"),
    include_enum("generated/pokemon_contest_types.h", "enum PokemonContestType"),
    include_enum("generated/pokemon_types.h",         "enum PokemonType"),
    { .from_file = NULL },
};

static archive_template_t archives[] = {
    { .out_filename = "move_data.narc" },
    { .out_filename = NULL },
};

enum {
    T_MOVE_NAMES,
    T_MOVE_NAMES_UPPERCASE,
    T_MOVE_DESCRIPTIONS,
    T_MOVES_USED_IN_BATTLE,
};

static textbank_template_t textbanks[] = {
    [T_MOVE_NAMES]           = { .key = 63689, .out_filename = "move_names.json"           },
    [T_MOVE_NAMES_UPPERCASE] = { .key = 22192, .out_filename = "move_names_uppercase.json" },
    [T_MOVE_DESCRIPTIONS]    = { .key = 27800, .out_filename = "move_descriptions.json"    },
    [T_MOVES_USED_IN_BATTLE] = { .key = 22758, .out_filename = "moves_used_in_battle.json" },
    { .out_filename = NULL },
};

static void parse_args(int *pargc, char ***pargv);
static void proc_move(datafile_t *df);
static void proc_text(datafile_t *df, size_t i, const char *basename);
static void prep_scripts(const char *basename);
static void pack_extra_moves(void);
static void prep_extra_scripts(void);
static void init_orderfiles(void);
static int  close_orderfiles(void);

static char *filename     = NULL;
static char *base_dir     = NULL;
static char *depfile_path = "move_data.d";
static char *output_dir   = ".";

int main(int argc, char **argv) {
    int        errc = EXIT_SUCCESS;
    datafile_t df   = { 0 };

    parse_args(&argc, &argv);
    enum_seq_t moves = common_initenum(
        filename, "Move",
        .sourcefile  = __FILE__,
        .depfile     = depfile_path,
        .outdir      = output_dir,
        .format      = DATAPROC_F_JSON,
        .enums       = enums,
        .archives    = archives,
        .textbanks   = textbanks,
        .extra_files = 3,
        .hook_before = init_orderfiles,
    );

    for (size_t i = 0; i < moves.size; i++) {
        const char *stem = moves.members[i].name + lengthof("MOVE_");

        char *basename = strlower(stem);
        char *filepath = pathjoin(base_dir, basename, "data.json");
        declare_dep(filepath);

        if (dp_load(&df, filepath) == 0) {
            proc_move(&df);
            proc_text(&df, i, basename);
            prep_scripts(basename);
        }

        if (dp_report(&df) == DIAG_ERROR) errc = EXIT_FAILURE;

        free(basename);
        free(filepath);
        dp_free(&df);
    }

    pack_extra_moves();
    prep_extra_scripts();
    return common_done(errc, close_orderfiles);
}

static void proc_move(datafile_t *df) {
    MoveTable data = {
        .class          = enum_u8(".class", enum MoveClass),
        .type           = enum_u8(".type", enum PokemonType),
        .power          = u8(".power"),
        .accuracy       = u8(".accuracy"),
        .pp             = u8(".pp"),
        .effect         = enum_u16(".effect.type", enum MoveBattleEffect),
        .effectChance   = u8(".effect.chance"),
        .range          = enum_u16(".range", enum MoveRange),
        .priority       = s8(".priority"),
        .contest.effect = enum_u8(".contest.effect", enum MoveContestEffect),
        .contest.type   = enum_u8(".contest.type", enum PokemonContestType),
    };

    datanode_t flags   = dp_get(df, ".flags");
    size_t     n_flags = dp_arrlen(flags);
    for (size_t i = 0; i < n_flags; i++) {
        u8 flag     = dp_u8(dp_lookup(dp_arrelem(flags, i), "enum MoveFlag"));
        data.flags |= flag;
    }

    if (data.power != 0 && data.class == CLASS_STATUS) {
        datanode_t power = dp_get(df, ".power");
        datanode_t class = dp_get(df, ".class");
        dp_warn(&power, "this Status move has a base power other than 0 and will be fixed");
        dp_note(&class, "inferred as a Status move here");
        data.power = 0;
    }

    if (data.accuracy > 100) {
        datanode_t accuracy = dp_get(df, ".accuracy");
        dp_warn(&accuracy, "value is greater than 100 and will be clamped");
        data.accuracy = 100;
    }

    if (data.effectChance > 100) {
        datanode_t chance = dp_get(df, ".effect.chance");
        dp_warn(&chance, "value is greater than 100 and will be clamped");
        data.effectChance = 100;
    }

    nitroarc_ppack(&archives[0].packer, &data, sizeof(data), NULL);
}

static void proc_text(datafile_t *df, size_t i, const char *basename) {
#define strfmt2(fmt, ...) (snprintf(buf2, BUFSIZE, fmt, __VA_ARGS__), buf2)

    char buf[BUFSIZE]  = { 0 };
    char buf2[BUFSIZE] = { 0 };

    const char *name        = string(".name");
    char       *name_upper  = strupper(name);
    datanode_t  description = dp_get(df, ".description");

    bank_push(T_MOVE_NAMES,           strfmt("MoveNames_Text_%s", basename),          name);
    bank_push(T_MOVE_NAMES_UPPERCASE, strfmt("MoveNamesUppercase_Text_%s", basename), name_upper);
    bank_push(T_MOVE_DESCRIPTIONS,    strfmt("MoveDescriptions_Text_%s", basename),   description);

    if (i == MOVE_NONE) {
        bank_push(T_MOVES_USED_IN_BATTLE, strfmt("MovesUsedInBattle_Text_%s_Ally", basename), "!");
        bank_push(T_MOVES_USED_IN_BATTLE, strfmt("MovesUsedInBattle_Text_%s_Wild", basename), "!");
        bank_push(T_MOVES_USED_IN_BATTLE, strfmt("MovesUsedInBattle_Text_%s_Foe",  basename), "!");
    }
    else {
        char *nameline = strfmt2("%s!", name);
        if (i == MOVE_U_TURN) { // MATCH DETAIL: The retail game uses "U-Turn" in battle instead of "U-turn"
            nameline[2] = 'T';
        }

        bank_pushm(T_MOVES_USED_IN_BATTLE, strfmt("MovesUsedInBattle_Text_%s_Ally", basename),
                   "{STRVAR_1 1, 0, 0} used\n",
                   nameline);
        bank_pushm(T_MOVES_USED_IN_BATTLE, strfmt("MovesUsedInBattle_Text_%s_Wild", basename),
                   "The wild {STRVAR_1 1, 0, 0} used\n",
                   nameline);
        bank_pushm(T_MOVES_USED_IN_BATTLE, strfmt("MovesUsedInBattle_Text_%s_Foe",  basename),
                   "The foe’s {STRVAR_1 1, 0, 0} used\n",
                   nameline);
    }

    free(name_upper);

#undef strfmt2
}

static FILE *f_anim_scripts = NULL;
static FILE *f_move_scripts = NULL;

static void init_orderfiles(void) {
    char buf[BUFSIZE] = { 0 };

    f_anim_scripts = fopen(strfmt("%s/%s", output_dir, "anim_scripts.order"), "wb");
    f_move_scripts = fopen(strfmt("%s/%s", output_dir, "move_scripts.order"), "wb");
}

static void prep_scripts(const char *basename) {
    order_subfile(basename, "anim",   f_anim_scripts);
    order_subfile(basename, "script", f_move_scripts);
}

static int close_orderfiles(void) {
    fclose(f_anim_scripts);
    fclose(f_move_scripts);
    return EXIT_SUCCESS;
}

static void pack_extra_moves(void) {
    // MATCH DETAIL: The retail game contains these 3 additional entries at the tail of the move data
    // archive. They are inaccessible, but must be present to produce a binary match.

    MoveTable m468 = {
        .class          = CLASS_SPECIAL,
        .type           = TYPE_NORMAL,
        .power          = 100,
        .accuracy       = 100,
        .pp             = 10,
        .effect         = BATTLE_EFFECT_HIT,
        .effectChance   = 0,
        .range          = RANGE_SINGLE_TARGET,
        .priority       = 0,
        .flags          = MOVE_FLAG_CAN_PROTECT | MOVE_FLAG_CAN_MIRROR_MOVE | MOVE_FLAG_TRIGGERS_KINGS_ROCK,
        .contest.effect = CONTEST_EFFECT_LOW_VOLTAGE_ADVANTAGE,
        .contest.type   = CONTEST_TYPE_BEAUTY,
    };

    MoveTable m469 = {
        .class          = CLASS_SPECIAL,
        .type           = TYPE_NORMAL,
        .power          = 100,
        .accuracy       = 100,
        .pp             = 10,
        .effect         = BATTLE_EFFECT_HIT,
        .effectChance   = 0,
        .range          = RANGE_SINGLE_TARGET,
        .priority       = 0,
        .flags          = MOVE_FLAG_CAN_PROTECT | MOVE_FLAG_CAN_MIRROR_MOVE | MOVE_FLAG_TRIGGERS_KINGS_ROCK,
        .contest.effect = CONTEST_EFFECT_FIRST_PERFORMANCE_ADVANTAGE,
        .contest.type   = CONTEST_TYPE_CUTE,
    };

    MoveTable m470 = {
        .class          = CLASS_SPECIAL,
        .type           = TYPE_NORMAL,
        .power          = 100,
        .accuracy       = 100,
        .pp             = 10,
        .effect         = BATTLE_EFFECT_HIT,
        .effectChance   = 0,
        .range          = RANGE_SINGLE_TARGET,
        .priority       = 0,
        .flags          = MOVE_FLAG_CAN_PROTECT | MOVE_FLAG_CAN_MIRROR_MOVE | MOVE_FLAG_TRIGGERS_KINGS_ROCK,
        .contest.effect = CONTEST_EFFECT_FINAL_PERFORMANCE_ADVANTAGE,
        .contest.type   = CONTEST_TYPE_SMART,
    };

    nitroarc_ppack(&archives[0].packer, &m468, sizeof(m468), NULL);
    nitroarc_ppack(&archives[0].packer, &m469, sizeof(m469), NULL);
    nitroarc_ppack(&archives[0].packer, &m470, sizeof(m470), NULL);
}

static void prep_extra_scripts(void) {
    // MATCH DETAIL: The retail game contains additional entries in the animation scripts archive that
    // must be present to produce a binary match.
    for (size_t i = 468; i <= 474; i++) {
        order_subfile(".shared", "anim_0468_0474", f_anim_scripts);
    }

    for (size_t i = 475; i <= 500; i++) {
        order_subfile(".shared", "anim_0475_0500", f_anim_scripts);
    }

    // MATCH DETAIL: The retail game contains additional entries in the move scripts archive that
    // must be present to produce a binary match.
    for (size_t i = 468; i <= 500; i++) {
        order_subfile(".shared", "script_0468_0500", f_move_scripts);
    }
}

static char *program_name  = NULL;

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
    fputs("                       Defaults to 'move_data.d'.\n", f);
#undef fputf

    exit(f == stdout ? EXIT_SUCCESS : EXIT_FAILURE);
}

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
