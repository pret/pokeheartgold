/*
 * nitroarc - an archiving utility for Nintendo's Nitro Archive format
 * Copyright (C) 2026 Rachel <rachel@lhea.me>
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any
 * any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

#include <assert.h>
#include <dirent.h>
#include <errno.h>
#include <fnmatch.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/stat.h>

#include "common.h"
#include "nitroarc.h"

typedef struct dirent dirent_t;
typedef struct stat   stat_t;
typedef struct strvec strvec_t;
typedef struct packcfg packcfg_t;

struct strvec {
    char **data;
    size_t size;
    size_t cap;
};

struct packcfg {
    strvec_t files;
    bool     named;
    bool     stripped;
};

static int peek_dotfiles(options_t *opts);
static int prepare_exclusions(const char *fdata, const char *pat, strvec_t *out_excls);
static int collect_explicit_files(const char *fdata, packcfg_t *out_cfg);
static int collect_implicit_files(strvec_t *files, const strvec_t *excls, size_t *out_nexpls);
static int pack_archive(packcfg_t *cfg, void **out_data, size_t *out_size);
static int write_index(const char *fname, bool index, bool namespace, const strvec_t *files);

#define HIT_DOTORDER  (1 << 0)
#define HIT_DOTIGNORE (1 << 1)

extern int tool_create(const options_t *opts) {
    if (opts->file == NULL) {
        progerr(PROGRAM_NOFILE);
        progerr(PROGRAM_HELP, opts->name);
        return EXIT_FAILURE;
    }

    if (opts->argc == 0) {
        progerr("no input directory specified (missing argument?)");
        progerr(PROGRAM_HELP, opts->name);
        return EXIT_FAILURE;
    }

    stat_t stb = { 0 };
    if (stat(opts->argv[0], &stb) == -1) {
        progerr("could not stat input directory: %s", strerror(errno));
        progerr(PROGRAM_HELP, opts->name);
        return EXIT_FAILURE;
    }

    if (!S_ISDIR(stb.st_mode)) {
        progerr("input argument is not a directory");
        progerr(PROGRAM_HELP, opts->name);
        return EXIT_FAILURE;
    }

    packcfg_t cfg = {
        .files    = (strvec_t){ 0 },
        .named    = opts->named,
        .stripped = opts->stripped,
    };

    int       dots   = peek_dotfiles((options_t *)opts);
    strvec_t  excls  = { 0 };
    char     *ogcwd  = getcwd(NULL, 0);
    char     *f_incl = NULL;
    char     *f_excl = NULL;
    char     *data   = NULL;
    size_t    size   = 0;
    size_t    nexpls = 0;
    assert(ogcwd);

    int errc = load_file(opts->files_from, &f_incl, &size)
            || load_file(opts->exclude_from, &f_excl, &size)
            || set_workdir(opts->argv[0])
            || prepare_exclusions(f_excl, opts->exclude_pat, &excls)
            || collect_explicit_files(f_incl, &cfg)
            || collect_implicit_files(&cfg.files, &excls, &nexpls)
            || pack_archive(&cfg, (void **)&data, &size)
            || set_workdir(ogcwd)
            || write_file(opts->file, data, size)
            || write_index(opts->file, opts->index, opts->index_ns, &cfg.files)
            || EXIT_SUCCESS;

    for (size_t i = nexpls; i < cfg.files.size; i++) free(cfg.files.data[i]);
    free(cfg.files.data);
    free(excls.data); // none are internally-owned
    free(ogcwd);
    free(f_incl);
    free(f_excl);
    free(data);

    if (dots & HIT_DOTORDER)  free((char *)opts->files_from);
    if (dots & HIT_DOTIGNORE) free((char *)opts->exclude_from);

    return errc;
}

static char* join_paths(const char *parent, const char *entry) {
    size_t size_p = parent ? strlen(parent) + 1 : 0;
    size_t size_e = strlen(entry);

    char *path = malloc(size_p + size_e + 1);
    if (path != NULL) {
        if (size_p) {
            memcpy(path, parent, size_p - 1);
            path[size_p - 1] = '/';
        }

        memcpy(path + size_p, entry, size_e);
        path[size_p + size_e] = 0;
    }

    return path;
}

static int peek_dotfiles(options_t *opts) {
    char  *order  = join_paths(opts->argv[0], ".narcorder");
    char  *ignore = join_paths(opts->argv[0], ".narcignore");
    int    hits   = 0;
    stat_t stbuf  = { 0 };

    if (stat(order, &stbuf) == 0) {
        if (opts->files_from != NULL) {
            progerr("'--files-from' given as %s; skipping .narcorder", opts->files_from);
            free(order);
        }
        else {
            proglog("reading implicit inclusions from %s", order);
            opts->files_from = order;

            hits |= HIT_DOTORDER;
        }
    }

    if (stat(ignore, &stbuf) == 0) {
        if (opts->exclude_from != NULL) {
            progerr("'--exclude-from' given as %s; skipping .narcignore", opts->exclude_from);
            free(ignore);
        }
        else {
            proglog("reading implicit exclusions from %s", ignore);
            opts->exclude_from = ignore;

            hits |= HIT_DOTIGNORE;
        }
    }

    errno = 0;
    return hits;
}

static size_t strvec_nhits(const strvec_t *vec, char *s, size_t max_i);
static bool   strvec_has(const strvec_t *vec, char *s);
static int    strvec_grow(strvec_t *vec);
static int    strvec_push(strvec_t *vec, char *s);
static int    lexicsort(const void *_lhs, const void *_rhs);

#define is_hspace(c) ((c) == ' ' || (c) == '\t' || (c) == '\r')

static inline char* strltrim(const void *_s) {
    assert(_s);

    const unsigned char *s = _s;
    while (s && *s && is_hspace(*s)) s++;

    return (char *)s;
}

static inline char* strrtrim(const void *_s, const void *_p) {
    assert(_s);
    assert(_p);

    const unsigned char *s = _s;
    const unsigned char *p = _p;
    while (p && p != s && *p && is_hspace(*p)) p--;

    return (char *)p;
}

static inline char* streol(const void *_s) {
    assert(_s);

    const unsigned char *s = _s;
    while (s && *s && *s != '\n') s++;

    return (char *)s;
}

static int prepare_exclusions(
    const char *fdata,
    const char *pat,
    strvec_t *out_excls
) {
    assert(out_excls);
    assert(out_excls->data == NULL);

    out_excls->cap  = 64;
    out_excls->data = malloc(out_excls->cap * sizeof(*out_excls->data));
    if (out_excls->data == NULL) goto erralloc;

    strvec_push(out_excls, ".*ignore");
    strvec_push(out_excls, ".*keep");
    strvec_push(out_excls, ".*order");
    if (pat != NULL) strvec_push(out_excls, (char *)pat);
    if (fdata == NULL) goto done;

    char   *s   = (char *)fdata;
    for (char *p = NULL, *n = NULL; *s; s = n) {
        s    = strltrim(s);
        p    = streol(s);
        n    = *p ? p + 1 : p;
        p    = strrtrim(s, p - 1);
        p[1] = 0;

        if (p == s)           continue;

        proglog("f %s", s);
        if (strvec_push(out_excls, s)) goto erralloc;
    }

done:
    return PROGRAM_ENONE;

erralloc:
    progerr("alloc failure reading ordered inclusions: %s", strerror(errno));
    return PROGRAM_EALLOC;
}

static int collect_explicit_files(const char *fdata, packcfg_t *cfg) { // bool allow_dupes, strvec_t *out_files) {
    assert(cfg);
    assert(cfg->files.data == NULL);

    strvec_t *out_files   = &cfg->files;
    bool      allow_dupes = !cfg->named;
    int       errc        = PROGRAM_ENONE;

    out_files->cap  = 64;
    out_files->data = malloc(out_files->cap * sizeof(*out_files->data));
    if (out_files->data == NULL) goto erralloc;

    if (fdata == NULL) return PROGRAM_ENONE;

    stat_t  stb = { 0 };
    char   *s   = (char *)fdata;
    for (char *p = NULL, *n = NULL; *s; s = n) {
        s    = strltrim(s);
        p    = streol(s);
        n    = *p ? p + 1 : p;
        p    = strrtrim(s, p - 1);
        p[1] = 0;

        if (p == s)               continue;
        if (stat(s, &stb) == -1)  goto errstat;
        if (S_ISDIR(stb.st_mode)) continue;

        if (!allow_dupes && strvec_has(out_files, s)) continue;

        proglog("f %s", s);
        if (strvec_push(out_files, s)) goto erralloc;
    }

    return PROGRAM_ENONE;

erralloc:
    progerr("alloc failure reading ordered inclusions: %s", strerror(errno));
    errc = PROGRAM_EALLOC;
    goto errcleanup;

errstat:
    progerr("I/O failure statting file '%s': %s", s, strerror(errno));
    errc = PROGRAM_EFILEIO;
    goto errcleanup;

errcleanup:
    free(out_files->data);

    *out_files = (strvec_t){ 0 };
    return errc;
}

static bool should_exclude(const char *name, const strvec_t *excls) {
    for (size_t i = 0; i < excls->size; i++) {
        if (fnmatch(excls->data[i], name, 0) == 0) return true;
    }

    return false;
}

static int collect_implicit_files(strvec_t *files, const strvec_t *excls, size_t *out_nexpls) {
    assert(files);
    assert(files->data);
    assert(excls);
    assert(out_nexpls);

    *out_nexpls = files->size;
    DIR  *dir   = NULL;
    int   errc  = PROGRAM_ENONE;
    char *errp  = NULL;

    strvec_t queue = {
        .data = malloc(64 * sizeof(char *)),
        .size = 0,
        .cap  = 64,
    };

    if (queue.data == NULL) goto erralloc;
    strvec_push(&queue, ".");

    for (size_t i = 0; i < queue.size; i++) {
        char *path = queue.data[i];
        if ((dir = opendir(path)) == NULL) goto errio;

        // Simplify the check for the root directory
        path = path[0] == '.' && path[1] == 0
             ? NULL
             : path;

        dirent_t *ent = NULL;
        stat_t    stb = { 0 };
        while (errno = 0, (ent = readdir(dir)) != NULL) {
            if (strcmp(ent->d_name, ".")  == 0) continue;
            if (strcmp(ent->d_name, "..") == 0) continue;

            char *name = join_paths(path, ent->d_name);
            if (name == NULL) goto erralloc;

            if (stat(name, &stb) == -1) { errp = name; goto errstat; }

            if (S_ISDIR(stb.st_mode)) {
                if (strvec_push(&queue, name)) goto erralloc;
            }
            else if (strvec_has(files, name))     { free(name); }
            else if (should_exclude(name, excls)) { free(name); }
            else {
                proglog("f %s", name);
                if (strvec_push(files, name)) goto erralloc;
            }
        }

        free(path);
        closedir(dir);
    }

    // Only sort implicit includes
    qsort(
        &files->data[*out_nexpls],
        files->size - *out_nexpls,
        sizeof(*files->data),
        lexicsort
    );

    free(queue.data);
    return PROGRAM_ENONE;

erralloc:
    progerr("alloc failure walking directory: %s", strerror(errno));
    errc = PROGRAM_EALLOC;
    goto errcleanup;

errio:
    progerr("I/O failure walking directory: %s", strerror(errno));
    errc = PROGRAM_EFILEIO;
    goto errcleanup;

errstat:
    progerr("I/O failure statting file '%s': %s", errp, strerror(errno));
    errc = PROGRAM_EFILEIO;
    free(errp); // NOTE: points to the last-pulled filename
    goto errcleanup;

errcleanup:
    if (dir) closedir(dir);
    free(queue.data);
    return errc;
}

static void* libc_malloc(void *ctx, unsigned items, unsigned size) {
    (void)ctx;

    return malloc(items * size);
}

static void libc_free(void *ctx, void *ptr, unsigned items, unsigned size) {
    (void)ctx;
    (void)items;
    (void)size;

    free(ptr);
}

static void* libc_realloc(void *ctx, void *ptr, unsigned items, unsigned size) {
    (void)ctx;

    return realloc(ptr, items * size);
}

static int pack_archive(packcfg_t *cfg, void **out_data, size_t *out_size) {
    nitroarc_packer_t packer = { 0 };
    packer.malloc  = libc_malloc;
    packer.free    = libc_free;
    packer.realloc = libc_realloc;

    char    *data = NULL;
    size_t   size = 0;
    uint32_t usize = 0;

    if (cfg->files.size > UINT16_MAX) {
        progerr("too many files to be packed");
        return PROGRAM_EGENERAL;
    }

    int errc = nitroarc_pinit(
        &packer,
        (uint16_t)cfg->files.size,
        cfg->named,
        cfg->stripped
    );
    if (errc) goto errlib;

    for (size_t i = 0; i < cfg->files.size; i++) {
        errc = load_file(cfg->files.data[i], &data, &size);
        if (errc) goto errcleanup;
        if (size > UINT32_MAX) {
            progerr("input file '%s' is too large", cfg->files.data[i]);
            errc = PROGRAM_EGENERAL;
            goto errcleanup;
        }

        proglog("p %s", cfg->files.data[i]);
        errc = nitroarc_ppack(&packer, data, (uint32_t)size, cfg->files.data[i]);
        if (errc) goto errlib;

        free(data);
        data = NULL;
    };

    errc = nitroarc_pseal(&packer, (void **)&data, &usize);
    if (errc) goto errlib;

    *out_data = data;
    *out_size = usize;
    return PROGRAM_ENONE;

errlib:
    progerr("%s", nitroarc_errs(errc));
    goto errcleanup;

errcleanup:
    free(data);
    free(packer.fimg_data);
    free(packer.f_records);
    return errc;
}

static char* strrstem(const void *_s, int c) {
    assert(_s);

    const unsigned char *s = _s;
    const unsigned char *p = NULL;

    while (*s) {
        if (*s == c) p = s;
        s++;
    }

    if (p == NULL) p = s;

    return (char *)p;
}

static inline bool is_wordchar(int c) {
    return (c >= '0' && c <= '9')
        || (c >= 'A' && c <= 'Z')
        || (c >= 'a' && c <= 'z')
        || c == '_';
}

static char* guardify(const char *name, size_t size) {
    assert(name);

    char *guard = malloc(size + 1);
    if (guard != NULL) {
        for (size_t i = 0; i < size; i++) {
            guard[i] = is_wordchar(name[i]) ? name[i] : '_';
        }

        guard[size] = 0;
    }

    return guard;
}

static char* guardify_nhits(const char *name, size_t size, size_t nhits) {
    assert(name);
    char *base = guardify(name, size);
    if (base == NULL || nhits == 0) return base;

    size = snprintf(NULL, 0, "%s_%zu", base, nhits);
    char *suffixed = malloc(size + 1);

    if (suffixed != NULL) {
        snprintf(suffixed, size + 1, "%s_%zu", base, nhits);
    }

    free(base);
    return suffixed;
}

static int write_index(const char *fname, bool index, bool namespace, const strvec_t *files) {
    assert(fname);
    assert(files);
    assert(files->data);

    if (!index) return PROGRAM_ENONE;

    char  *guard = NULL;
    FILE  *fnaix = NULL;
    char  *pdot  = strrstem(fname, '.');
    char  *psep  = strrstem(fname, '/');
    psep        += *psep == '/';

    size_t size  = pdot - fname;
    char  *bname = malloc(pdot - psep + 2);
    char  *iname = malloc(size + 6);
    if (bname == NULL) goto erralloc;
    if (iname == NULL) goto erralloc;

    memcpy(bname, psep, pdot - psep);
    bname[pdot - psep]     = '_';
    bname[pdot - psep + 1] = 0;

    memcpy(iname, fname, size);
    memcpy(iname + size, ".naix", 6);
    guard = guardify(iname, size + 5);
    if (guard == NULL) goto erralloc;

    int errc = open_file(iname, "wb", &fnaix);
    if (errc) goto cleanup;

    fprintf(fnaix, "/*\n");
    fprintf(fnaix, " * This file was generated by nitroarc for '%s'\n", fname);
    fprintf(fnaix, " * DO NOT MODIFY IT; MANUAL EDITS WILL BE LOST\n");
    fprintf(fnaix, " */\n");
    fprintf(fnaix, "\n");
    fprintf(fnaix, "#ifndef %s\n", guard);
    fprintf(fnaix, "#define %s\n", guard);
    fprintf(fnaix, "\n");

    for (size_t i = 0; i < files->size; i++) {
        size_t nhits = strvec_nhits(files, files->data[i], i);
        char  *defn  = guardify_nhits(files->data[i], strlen(files->data[i]), nhits);
        if (defn == NULL) { free(defn); goto erralloc; }

        fprintf(fnaix, "#define %s%s%s %zu\n",
                namespace ? "NARC_" : "",
                namespace ? bname : "", // TODO: add the name of the NARC, minus the extension
                defn,
                i);
        free(defn);
    }

    fprintf(fnaix, "\n");
    fprintf(fnaix, "#define %.*s_COUNT %zu\n", (int)strlen(guard) - 5, guard, files->size);

    fprintf(fnaix, "\n");
    fprintf(fnaix, "#endif /* %s */\n", guard);
    errc = PROGRAM_ENONE;
    goto cleanup;

erralloc:
    progerr("alloc failure writing index file: %s", strerror(errno));
    errc = PROGRAM_EALLOC;

cleanup:
    free(bname);
    free(iname);
    free(guard);
    return errc;
}

static size_t strvec_nhits(const strvec_t *vec, char *s, size_t max_i) {
    size_t count = 0;
    for (size_t i = 0; i < max_i; i++) {
        if (strcmp(vec->data[i], s) == 0) count++;
    }

    return count;
}

static bool strvec_has(const strvec_t *vec, char *s) {
    for (size_t i = 0; i < vec->size; i++) {
        if (strcmp(vec->data[i], s) == 0) return true;
    }

    return false;
}

static int strvec_grow(strvec_t *vec) {
    if (vec->size + 1 >= vec->cap) {
        size_t cap = vec->cap * 2;
        char **tmp = realloc(vec->data, cap * sizeof(char*));
        if (tmp == NULL) return -1;

        vec->data = tmp;
        vec->cap  = cap;
    }

    return 0;
}

static int strvec_push(strvec_t *vec, char *s) {
    if (strvec_grow(vec)) return -1;

    vec->data[vec->size] = s;
    vec->size++;
    return 0;
}

static int lexicsort(const void *_lhs, const void *_rhs) {
    char *const *lhs = _lhs;
    char *const *rhs = _rhs;

    return strcmp(*lhs, *rhs);
}
