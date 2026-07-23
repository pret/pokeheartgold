#include <errno.h>
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

#define MAX_LOADED_NAIX  16

static enum_template_t enums[MAX_LOADED_NAIX + 1] = {
    { .from_file = "constants/narc.h", .for_type = "enum NarcID" },
};

enum restype {
    RESDAT_T_CHARS,
    RESDAT_T_PLTTS,
    RESDAT_T_CELLS,
    RESDAT_T_ANIMS,
    RESDAT_T_TEMPLATES,
};

typedef struct resource resource_t;
struct resource {
    const char *id;
    const char *from_narc;
    unsigned    from_file_id;
    unsigned    from_narc_id;
    unsigned    palette_slot;
    bool        dummy;
    bool        compressed;
    bool        on_main;
    bool        on_sub;
};

typedef struct resources resources_t;
struct resources {
    resource_t  *arr;
    lookup_t    *map;
    size_t       len;
    enum restype type;
};

typedef struct template template_t;
struct template {
    const char *id;

    u32      char_id;
    u32      pltt_id;
    u32      cell_id;
    u32      anim_id;
    bool     transfer;
    unsigned priority;
};

typedef struct templates templates_t;
struct templates {
    template_t *arr;
    size_t      len;
};

static void parse_args(int *pargc, char ***pargv);

static resources_t proc_resources(datafile_t *df, enum restype type);
static templates_t proc_templates(
    datafile_t *df,
    resources_t *chars,
    resources_t *pltts,
    resources_t *cells,
    resources_t *anims
);

static int  dump_resources(resources_t *resources, enum restype type);
static int  dump_templates(templates_t *templates);
static int  dump_header(templates_t *templates);
static void free_resources(resources_t *resources);

static char  *program_name  = NULL;
static char  *filename      = NULL;
static char  *depfile_path  = NULL;
static char  *output_prefix = "";
static char  *output_dir    = ".";
static size_t arr_index     = 0;
static size_t len_prefix    = 0;
static bool   create_index  = false;
static bool   free_depfile  = false;

static enum restype filter = 0;

#define SOURCE_NAME "tools/dataproc/src/resdatproc.c"

int main(int argc, char **argv) {
    parse_args(&argc, &argv);
    common_init(DATAPROC_F_JSON, enums, NULL, NULL, NULL, SOURCE_NAME, depfile_path, output_dir, NULL, NULL);

    datafile_t df   = { 0 };
    unsigned   errc = EXIT_SUCCESS;
    if (dp_load(&df, filename) == 0) {
        resources_t chars = proc_resources(&df, RESDAT_T_CHARS);
        resources_t pltts = proc_resources(&df, RESDAT_T_PLTTS);
        resources_t cells = proc_resources(&df, RESDAT_T_CELLS);
        resources_t anims = proc_resources(&df, RESDAT_T_ANIMS);
        templates_t temps = proc_templates(&df, &chars, &pltts, &cells, &anims);

        if (df.diag_head == NULL) {
            errc = dump_resources(&chars, RESDAT_T_CHARS)
                || dump_resources(&pltts, RESDAT_T_PLTTS)
                || dump_resources(&cells, RESDAT_T_CELLS)
                || dump_resources(&anims, RESDAT_T_ANIMS)
                || dump_templates(&temps)
                || (create_index ? dump_header(&temps) : EXIT_SUCCESS);
        }

        free_resources(&chars);
        free_resources(&pltts);
        free_resources(&cells);
        free_resources(&anims);
        free(temps.arr);
    }

    if (dp_report(&df) == DIAG_ERROR) errc = EXIT_FAILURE;
    if (free_depfile) free(depfile_path);

    dp_free(&df);
    return common_done(errc, NULL);
}

int sort_strcmp(const void *lhs, const void *rhs) {
    const lookup_t *l = lhs;
    const lookup_t *r = rhs;

    if (l->def == NULL && r->def == NULL) return 0;
    else if (l->def == NULL) return 1;
    else if (r->def == NULL) return -1;

    return strcmp(l->def, r->def);
}

void free_resources(resources_t *res) {
    free(res->arr);
    free(res->map);
}

static inline bool has_vram(enum restype type) {
    return type == RESDAT_T_PLTTS || type == RESDAT_T_CHARS;
}

static inline bool has_slot(enum restype type) {
    return type == RESDAT_T_PLTTS;
}

static resources_t proc_resources(datafile_t *df, enum restype type) {
    datanode_t array = { 0 };

    switch (type) {
    case RESDAT_T_PLTTS: array = dp_get(df, ".palettes");   break;
    case RESDAT_T_CHARS: array = dp_get(df, ".characters"); break;
    case RESDAT_T_CELLS: array = dp_get(df, ".cells");      break;
    case RESDAT_T_ANIMS: array = dp_get(df, ".animations"); break;
    default: abort(); // unreachable
    }

    const size_t array_len = dp_arrlen(array);
    if (array_len > INT32_MAX) {
        dp_error(&array, "number of elements exceeds INT32_MAX = %d", INT32_MAX);
        return (resources_t){ 0 };
    }

    resources_t result = {
        .arr  = calloc(array_len, sizeof(*result.arr)),
        .map  = calloc(array_len, sizeof(*result.map)),
        .len  = array_len,
        .type = type,
    };

    for (size_t i = 0; i < array_len; i++) {
        datanode_t node = dp_arrelem(array, i);
        if (dp_hasmemb(node, "dummy") && dp_bool(dp_objmemb(node, "dummy"))) {
            result.arr[i].dummy = true;
            continue;
        }

        datanode_t node_narc   = dp_objmemb(node, "from_narc");
        datanode_t node_file   = dp_objmemb(node, "from_file");
        datanode_t node_narc_i = dp_lookup(node_narc, "enum NarcID");

        result.arr[i].id         = dp_string(dp_objmemb(node, "id"));
        result.arr[i].compressed = dp_bool(dp_objmemb(node, "compressed"));

        result.arr[i].from_narc    = dp_string(node_narc);
        result.arr[i].from_narc_id = (unsigned)node_narc_i.mapped;
        if (result.arr[i].from_narc && node_narc_i.type == DATAPROC_T_MAPPED) {
            if (node_file.type == DATAPROC_T_ARRAY) node_file = dp_arrelem(node_file, arr_index);

            datanode_t node_file_i = dp_lookup(node_file, result.arr[i].from_narc);

            if (node_file_i.type == DATAPROC_T_MAPPED) {
                result.arr[i].from_file_id = (unsigned)node_file_i.mapped;
            }
            else {
                dp_note(&node_narc, "type '%s' defined here",
                        result.arr[i].from_narc);
            }
        }

        if (has_vram(type)) {
            result.arr[i].on_main = dp_bool(dp_objmemb(node, "on_main_screen"));
            result.arr[i].on_sub  = dp_bool(dp_objmemb(node, "on_sub_screen"));
        }

        if (has_slot(type)) {
            result.arr[i].palette_slot = dp_u8range(dp_objmemb(node, "load_in_slot"), 0, 15);
        }

        result.map[i].def = result.arr[i].id;
        result.map[i].val = i;
    }

    qsort(result.map, result.len, sizeof(*result.map), sort_strcmp);
    return result;
}

static inline void putleu32(void *p, u32 u) {
    u8 *b = p;
    b[0]  = (u8)((u >>  0) & 0xFF);
    b[1]  = (u8)((u >>  8) & 0xFF);
    b[2]  = (u8)((u >> 16) & 0xFF);
    b[3]  = (u8)((u >> 24) & 0xFF);
}

static inline char* prefix(const char *base) {
    size_t len_base   = strlen(base);
    char  *prefixed   = calloc(len_prefix + 1 + len_base + 1, sizeof(*prefixed));
    memcpy(prefixed, output_prefix, len_prefix);
    memcpy(prefixed + len_prefix + 1, base, len_base);
    prefixed[len_prefix] = '_';

    return prefixed;
}

static inline bool is_disabled(enum restype type) {
    return filter != 0 && (filter & (1 << type)) == 0;
}

#define SENTINEL     0xFFFFFFFE
#define SENTINEL_RES (serial_t){ SENTINEL, SENTINEL, SENTINEL, SENTINEL, SENTINEL, SENTINEL }
#define SENTINEL_TMP (serial_t){ SENTINEL, SENTINEL, SENTINEL, SENTINEL, SENTINEL, SENTINEL, SENTINEL, SENTINEL }

static int dump_resources(resources_t *resources, enum restype type) {
    if (is_disabled(type)) return EXIT_SUCCESS;

    typedef struct serial serial_t;
    struct serial {
        u32 narc;
        u32 member;
        u32 is_compressed;
        u32 id;
        u32 screen_mask;
        u32 palette_slot;
    };

    char *output_path = NULL;

    switch (type) {
    case RESDAT_T_CHARS: output_path = prefix("chars.resdat"); break;
    case RESDAT_T_PLTTS: output_path = prefix("pltts.resdat"); break;
    case RESDAT_T_CELLS: output_path = prefix("cells.resdat"); break;
    case RESDAT_T_ANIMS: output_path = prefix("anims.resdat"); break;
    default: abort(); // unreachable
    }

    size_t size = sizeof(u32) + (sizeof(serial_t) * (resources->len + 1));
    void  *data = calloc(size, 1);
    if (data == NULL) return EXIT_FAILURE;

    putleu32(data, type);
    serial_t *ser = (void *)(((u8 *)data) + sizeof(u32));

    size_t ser_count = 0; // Only serialize non-dummy entries
    for (size_t i = 0; i < resources->len; i++) {
        resource_t *res = &resources->arr[i];
        if (res->dummy) continue;

        ser[ser_count++] = (serial_t){
            .narc          = res->from_narc_id,
            .member        = res->from_file_id,
            .is_compressed = res->compressed ? 1 : 0,
            .id            = (u32)i,
            .screen_mask   = has_vram(type) ? (res->on_main ? 1 : 0) | (res->on_sub ? 2 : 0) : res->from_narc_id,
            .palette_slot  = has_slot(type) ? res->palette_slot : res->from_narc_id,
        };
    }

    ser[ser_count++] = SENTINEL_RES;
    size = sizeof(u32) + (sizeof(serial_t) * ser_count);

    int errc = fdump_blob(data, size, output_path);
    free(data);
    free(output_path);
    return errc;
}

static int check_lookup(const void *key_v, const void *memb_v) {
    const char     *key  = key_v;
    const lookup_t *memb = memb_v;
    return strcmp(key, memb->def);
}

static lookup_t* find_resource(datanode_t parent, const char *key, resources_t *resources) {
    datanode_t  node = dp_objmemb(parent, key);
    const char *str  = dp_string(node);
    if (str == NULL) return NULL;

    lookup_t *found = bsearch(str, resources->map, resources->len, sizeof(*resources->map), check_lookup);
    if (!found) {
        dp_error(&node, "undefined %s-resource identifier", key);
        return NULL;
    }

    return found;
}

static templates_t proc_templates(
    datafile_t *df,
    resources_t *chars,
    resources_t *pltts,
    resources_t *cells,
    resources_t *anims
) {
    datanode_t   array     = dp_get(df, ".templates");
    const size_t array_len = dp_arrlen(array);
    templates_t  result    = {
        .arr  = calloc(array_len, sizeof(*result.arr)),
        .len  = array_len,
    };

    for (size_t i = 0; i < array_len; i++) {
        datanode_t node = dp_arrelem(array, i);

        lookup_t *match_char = find_resource(node, "characters", chars);
        lookup_t *match_pltt = find_resource(node, "palette",    pltts);
        lookup_t *match_cell = find_resource(node, "cells",      cells);
        lookup_t *match_anim = find_resource(node, "animations", anims);

        // We want to assert that these keys are present even if a resource-identifier is undefined.
        const char *id       = dp_string(dp_objmemb(node, "id"));
        bool        transfer = dp_bool(dp_objmemb(node, "vram_transfer"));
        unsigned    priority = (unsigned)dp_int(dp_objmemb(node, "priority"));

        if (match_char && match_pltt && match_cell && match_anim) {
            result.arr[i] = (template_t){
                .id       = id,
                .char_id  = (u32)match_char->val,
                .pltt_id  = (u32)match_pltt->val,
                .cell_id  = (u32)match_cell->val,
                .anim_id  = (u32)match_anim->val,
                .transfer = transfer,
                .priority = priority,
            };
        }
    }

    return result;
}

static int dump_templates(templates_t *templates) {
    if (is_disabled(RESDAT_T_TEMPLATES)) return EXIT_SUCCESS;

    typedef struct serial serial_t;
    struct serial {
        s32 char_id;
        s32 pltt_id;
        s32 cell_id;
        s32 anim_id;
        s32 mcel_id; // unused by gen4 games
        s32 mani_id; // unused by gen4 games
        s32 transfer;
        s32 priority;
    };

    serial_t *ser = calloc(templates->len + 1, sizeof(*ser));
    if (ser == NULL) return EXIT_FAILURE;

    for (size_t i = 0; i < templates->len; i++) {
        template_t *tmp = &templates->arr[i];

        ser[i] = (serial_t){
            .char_id  = tmp->char_id,
            .pltt_id  = tmp->pltt_id,
            .cell_id  = tmp->cell_id,
            .anim_id  = tmp->anim_id,
            .mcel_id  = -1,
            .mani_id  = -1,
            .transfer = tmp->transfer ? 1 : 0,
            .priority = tmp->priority,
        };
    }

    ser[templates->len] = SENTINEL_TMP;
    char *output_path   = "templates.cldat";
    if (*output_prefix != 0) {
        size_t size = len_prefix + sizeof(".cldat") + 1;
        output_path = calloc(size, sizeof(*output_path));
        snprintf(output_path, size, "%s.cldat", output_prefix);
    }

    int   errc        = fdump_blob(ser, sizeof(serial_t) * (templates->len + 1), output_path);
    free(ser);
    if (*output_prefix != 0) free(output_path);
    return errc;
}

static int dump_header(templates_t *templates) {
    if (is_disabled(RESDAT_T_TEMPLATES)) return EXIT_SUCCESS;

    char *output_path = "templates.h";
    if (*output_prefix != 0) {
        size_t size = len_prefix + sizeof(".h") + 1;
        output_path = calloc(size, sizeof(*output_path));
        snprintf(output_path, size, "%s.h", output_prefix);
    }

    int   errc   = EXIT_SUCCESS;
    char *h_path = pathjoin(output_dir, NULL, output_path);
    char *guard  = guardify(h_path);
    FILE *header = fopen(h_path, "wb");
    if (header == NULL) {
        fprintf(stderr, "could not open output file '%s': %s\n", h_path, strerror(errno));
        errc = EXIT_FAILURE;
        goto cleanup;
    }

    fprintf(header, "#ifndef %s\n", guard);
    fprintf(header, "#define %s\n", guard);
    fputc('\n', header);

    for (size_t i = 0; i < templates->len; i++) {
        fprintf(header, "#define %s %zu\n", templates->arr[i].id, i);
    }

    fputc('\n', header);
    fprintf(header, "#endif // %s\n", guard);

    fclose(header);

cleanup:
    free(h_path);
    free(guard);
    if (*output_prefix != 0) free(output_path);
    return errc;
}

static void usage(const char *fmt, ...) __attribute__((format(printf, 1, 2)));

static void parse_args(int *pargc, char ***pargv) {
    program_name = (*pargv)[0];
    opterr       = 0;

    int num_naix = 0, c = 0;
    while ((c = getopt(*pargc, *pargv, "D:f:n:o:p:M:Nh")) != -1) {
        switch (c) {
        case 'D':
            if (num_naix == MAX_LOADED_NAIX) {
                usage("too many '-D' options; max is %d", MAX_LOADED_NAIX);
            }

            char *pargsep = strchr(optarg, ':');
            if (!pargsep) {
                usage("missing ':' separator in argument '%s'", optarg);
            }

            // NOTE: ideally this would produce an error if the NARC constant is
            // unknown, but that requires loading `constants/narc.h` independently
            // of the common init routines, which is a big scope increase.

            *pargsep = 0;
            enums[++num_naix] = (enum_template_t){
                .from_file   = pargsep + 1,
                .with_prefix = NULL,
                .for_type    = optarg,
                .from_defs   = true,
            };
            break;

        case 'f':
            if (strcmp(optarg, "characters") == 0) { filter |= (1 << RESDAT_T_CHARS); break; }
            if (strcmp(optarg, "palettes") == 0)   { filter |= (1 << RESDAT_T_PLTTS); break; }
            if (strcmp(optarg, "cells") == 0)      { filter |= (1 << RESDAT_T_CELLS); break; }
            if (strcmp(optarg, "animations") == 0) { filter |= (1 << RESDAT_T_ANIMS); break; }
            if (strcmp(optarg, "templates") == 0)  { filter |= (1 << RESDAT_T_TEMPLATES); break; }

            usage("invalid argument '%s' for option '-%c'", optarg, optopt);
            break;

        case 'n':
            if (optarg[0] == '-') usage("argument for option '-%c' must be a nonnegative integer", optopt);
            char *endp = NULL;
            arr_index  = strtol(optarg, &endp, 0);
            if (*endp) usage("argument for option '-%c' must be a nonnegative integer", optopt);
            break;

        case 'o': output_dir    = optarg; break;
        case 'p': output_prefix = optarg; break;
        case 'M': depfile_path  = optarg; break;
        case 'N': create_index  = true;   break;

        case 'h': usage(NULL);                                 break;
        case ':': usage("missing argument for '-%c'", optopt); break;
        default:  usage("unknown option '-%c'", optopt);     break;
        }
    }

    *pargc -= optind;
    *pargv += optind;
    if (*pargc < 1) usage("missing required argument RESDAT_JSON");

    filename = (*pargv)[0];
    if (depfile_path == NULL) {
        char *tmp    = prefix("resdat.d");
        depfile_path = pathjoin(output_dir, NULL, tmp);
        free_depfile = true;
        free(tmp);
    }

    len_prefix = strlen(output_prefix);
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
    fputf("usage: %s [-D NARC_ID:PATH] [-o OUTDIR] [-N] RESDAT_JSON\n", program_name);
    fputs("\n", f);
    fputs("options:\n", f);
    fputs("  -D NARC_ID:PATH   Load PATH as a set of enum-constants for the members of\n", f);
    fputf("                    NARC_ID. Up to %d instances may be given.\n", MAX_LOADED_NAIX);
    fputs("  -o OUTDIR         Write output files to OUTDIR.\n", f);
    fputs("  -p PREFIX         Prefix all output '.resdat' files with PREFIX, followed by\n", f);
    fputs("                    an underscore '_'. PREFIX will also be used as the filename\n", f);
    fputs("                    stem of the output '.cldat' file and -- when the '-N' option\n", f);
    fputs("                    is present -- the output '.h' file.\n", f);
    fputs("  -f TYPE           Filter the output-types that will generated. By default,\n", f);
    fputs("                    all possible outputs are generated.\n", f);
    fputs("                    TYPE must be one of 'characters', 'palettes', 'cells',\n", f);
    fputs("                    'animations', or 'templates'.\n", f);
    fputs("  -n INDEX          Specify the index of any array-type 'from_file' properties\n", f);
    fputs("                    in the input JSON which will be used for the output.\n", f);
    fputs("                    Defaults to 0.\n", f);
    fputs("  -N                Create a C-style index-header for defined templates.\n", f);
    fputs("  -M DEPFILE        Specify the full path to an output dependency file.\n", f);
    fputs("                    Defaults to 'resdat.d'.\n", f);
#undef fputf

    exit(f == stdout ? EXIT_SUCCESS : EXIT_FAILURE);
}
