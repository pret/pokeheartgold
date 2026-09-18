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

#include "constants/string.h"
#include "overlay006/npc_trade.h"

static enum_template_t enums[] = {
    include_enum("generated/species.h",  "enum Species"),
    include_enum("generated/items.h",    "enum Item"),
    include_enum("generated/genders.h",  "enum Gender"),
    include_enum("constants/versions.h", "enum Language"),
    { .from_file = NULL },
};

static archive_template_t archives[] = {
    { .out_filename = "npc_trades.narc" },
    { .out_filename = NULL },
};

static textbank_template_t textbanks[] = {
    { .out_filename = "npc_trade_names.json", .key = 4839 },
    { .out_filename = NULL },
};

static void parse_args(int *pargc, char ***pargv);
static void prep_trainernames(size_t count);
static void proc_trade(datafile_t *df);
static void proc_text(datafile_t *df, size_t i);
static void pack_trainernames(size_t count);

static char *filename     = NULL;
static char *base_dir     = NULL;
static char *depfile_path = "npctrade_data.d";
static char *output_dir   = ".";

int main(int argc, char **argv) {
    int        errc         = EXIT_SUCCESS;
    char       buf[BUFSIZE] = { 0 };
    datafile_t df           = { 0 };

    parse_args(&argc, &argv);
    enum_seq_t trades = common_initenum(
        filename, "NPCTradeID",
        .sourcefile  = __FILE__,
        .depfile     = depfile_path,
        .outdir      = output_dir,
        .format      = DATAPROC_F_JSON,
        .enums       = enums,
        .archives    = archives,
        .textbanks   = textbanks,
    );

    prep_trainernames(trades.size);
    for (size_t i = 0; i < trades.size; i++) {
        const char *stem = trades.members[i].name + lengthof("NPC_TRADE_");

        char *basename = strlower(strfmt("%s.json", stem));
        char *filepath = pathjoin(base_dir, NULL, basename);
        declare_dep(filepath);

        if (dp_load(&df, filepath) == 0) {
            proc_trade(&df);
            proc_text(&df, i);
        }

        if (dp_report(&df) == DIAG_ERROR) errc = EXIT_FAILURE;

        free(basename);
        free(filepath);
        dp_free(&df);
    }

    pack_trainernames(trades.size);
    return common_done(errc, NULL);
}

static void proc_trade(datafile_t *df) {
    NPCTradeMon mon = {
        .species          = enum_u16(".species", enum Species),
        .hpIV             = u8_maxbits(".hpIV", 5),
        .atkIV            = u8_maxbits(".atkIV", 5),
        .defIV            = u8_maxbits(".defIV", 5),
        .speedIV          = u8_maxbits(".speedIV", 5),
        .spAtkIV          = u8_maxbits(".spAtkIV", 5),
        .spDefIV          = u8_maxbits(".spDefIV", 5),
        .unused1          = u32(".unused1"),
        .otID             = u32(".otID"),
        .cool             = u32(".cool"),
        .beauty           = u32(".beauty"),
        .cute             = u32(".cute"),
        .smart            = u32(".smart"),
        .tough            = u32(".tough"),
        .personality      = u32(".personality"),
        .heldItem         = enum_u16(".heldItem", enum Item),
        .otGender         = enum_u16(".otGender", enum Gender),
        .unused2          = u32(".unused2"),
        .language         = enum_u16(".language", enum Language),
        .requestedSpecies = enum_u16(".requestedSpecies", enum Species),
    };

    nitroarc_ppack(&archives[0].packer, &mon, sizeof(mon), NULL);
}

static char **s_trainernames = NULL;

static void prep_trainernames(size_t count) {
    char *buf_trainernames = calloc(count * (TRAINER_NAME_LEN + 1), sizeof(*buf_trainernames));
    s_trainernames         = calloc(count, sizeof(*s_trainernames));

    for (size_t i = 0; i < count; i++) {
        s_trainernames[i] = &buf_trainernames[i * (TRAINER_NAME_LEN + 1)];
    }
}

static void check_name(datanode_t *node, const char *val, size_t len, size_t max, const char *domain) {
    if (!val) return;

    if (len > max) {
        dp_error(node,
                 "%s name '%s' exceeds maximum length of %zu",
                 domain, val, max);
        return;
    }

    if (len == 0) dp_warn(node, "%s name has length 0", domain);
}

static void proc_text(datafile_t *df, size_t i) {
    char buf[BUFSIZE] = { 0 };

    datanode_t   pk_name     = dp_get(df, ".name");
    datanode_t   tr_name     = dp_get(df, ".otName");
    const char  *pk_name_val = dp_string(pk_name);
    const char  *tr_name_val = dp_string(tr_name);
    const size_t pk_name_len = pk_name_val ? strlen(pk_name_val) : 0;
    const size_t tr_name_len = tr_name_val ? strlen(tr_name_val) : 0;

    check_name(&pk_name, pk_name_val, pk_name_len, MON_NAME_LEN, "traded Pokemon");
    check_name(&tr_name, tr_name_val, tr_name_len, TRAINER_NAME_LEN, "trading Trainer");

    bank_push(0, strfmt("NPCTradeNames_Text_Mon%zu", i), pk_name_val);
    memcpy(s_trainernames[i], tr_name_val, tr_name_len); // store for later
}

static void pack_trainernames(size_t count) {
    char buf[BUFSIZE] = { 0 };

    for (size_t i = 0; i < count; i++) {
        bank_push(0, strfmt("NPCTradeNames_Text_Trainer%zu", i), s_trainernames[i]);
    }

    free(s_trainernames[0]);
    free(s_trainernames);
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
    fputs("                       Defaults to 'npctrade_data.d'.\n", f);
#undef fputf

    exit(f == stdout ? EXIT_SUCCESS : EXIT_FAILURE);
}
