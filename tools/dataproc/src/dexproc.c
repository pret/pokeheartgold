#include <assert.h>
#include <getopt.h>
#include <stdarg.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include "common.h"
#include "dataproc.h"

#include "constants/species.h"

static enum_template_t enums[] = {
    include_enum("generated/species.h", "enum Species"),
    { .from_file = NULL },
};

static header_template_t headers[] = {
    { .out_filename = "regional_pokedex_size.h" },
    { .out_filename = NULL                      },
};

static char *program_name   = NULL;
static char *regional_fpath = NULL;
static char *depfile_fpath  = "pokedex_listings.d";
static char *output_dir     = ".";

static u16   *regional       = NULL;
static u16    regional_count = 0;
static u16   *national       = NULL;
static u16    national_count = 0;

static void parse_args(int *pargc, char ***pargv);
static void pre_init(void);
static void proc_regional(datafile_t *df);
static int  addl_done(void);

int main(int argc, char *argv[]) {
    parse_args(&argc, &argv);
    common_init(DATAPROC_F_JSON, enums, NULL, headers, NULL, __FILE__, depfile_fpath, output_dir, pre_init, NULL);

    datafile_t df   = { 0 };
    unsigned   errc = EXIT_SUCCESS;

    if (dp_load(&df, regional_fpath) == 0) proc_regional(&df);
    if (dp_report(&df) == DIAG_ERROR) errc = EXIT_FAILURE;

    dp_free(&df);
    return common_done(errc, addl_done);
}

static void pre_init(void) {
    assert(NATIONAL_DEX_COUNT < UINT16_MAX);
    national_count = NATIONAL_DEX_COUNT + 1; // include SPECIES_NONE
    national       = calloc(national_count, sizeof(*national));
}

static void proc_regional(datafile_t *df) {
    datanode_t array = dp_get(df, ".");
    size_t     count = dp_arrlen(array);
    if (count == 0) dp_warn(&array, "regional Pokedex has no members");
    if (count > UINT16_MAX) {
        dp_error(&array, "regional Pokedex size exceeds maximum allowed of '%u'", UINT16_MAX);
        return;
    }

    regional_count = (u16)count;
    regional       = calloc(regional_count, sizeof(*regional));
    for (u16 i = 0; i < regional_count; i++) {
        datanode_t curr   = dp_arrelem(array, i);
        datanode_t mapped = dp_lookup(curr, "enum Species");
        if (mapped.type != DATAPROC_T_MAPPED) continue;

        const u16 species = dp_u16(mapped);
        for (size_t j = 0; j < i; j++) {
            if (regional[j] == species) {
                datanode_t  prev   = dp_arrelem(array, j);
                const char *s_curr = dp_string(curr);
                dp_warn(&curr, "species '%s' is already listed in regional Pokedex", s_curr);
                dp_note(&prev, "species '%s' was previously listed here", s_curr);
            }
        }

        regional[i]       = species;
        national[species] = i;
    }

    fprintf(headers[0].out_file, "#define REGIONAL_DEX_COUNT %u\n", regional_count - 1);
}

static int addl_done(void) {
    return fdump_blobnarc(regional, regional_count * sizeof(*regional), "regional_to_national.narc")
        || fdump_blobnarc(national, national_count * sizeof(*national), "national_to_regional.narc")
        || EXIT_SUCCESS;
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
    fputf("usage: %s [-M DEPFILE] [-o OUTDIR] REGIONAL_JSON\n", program_name);
    fputs("\n", f);
    fputs("options:\n", f);
    fputs("  -o OUTDIR            Write output files to OUTDIR. Does not affect DEPFILE.\n", f);
    fputs("                       Defaults to the current working directory.\n", f);
    fputs("  -M DEPFILE           Specify the full path to an output dependency file.\n", f);
    fputs("                       Defaults to 'pokedex_listings.d'.\n", f);
#undef fputf

    exit(f == stdout ? EXIT_SUCCESS : EXIT_FAILURE);
}

static void parse_args(int *pargc, char ***pargv) {
    program_name = (*pargv)[0];
    opterr       = 0;

    int c = 0;
    while ((c = getopt(*pargc, *pargv, ":o:t:s:M:h")) != -1) {
        switch (c) {
        case 'o': output_dir    = optarg; break;
        case 'M': depfile_fpath = optarg; break;

        case 'h': usage(NULL);                                 break;
        case ':': usage("missing argument for '-%c'", optopt); break;
        default:  usage("unknown option '-%c'", optopt);       break;
        }
    }

    *pargc -= optind;
    *pargv += optind;
    if (*pargc < 1) usage("missing required argument REGIONAL_JSON");

    regional_fpath = (*pargv)[0];
}
