#include "dataproc.h"

#include <assert.h>
#include <errno.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "json.h"
#include "private.h"

static int           (*read_func)(datafile_t *df) = NULL;
static void          (*free_func)(datafile_t *df) = NULL;
static void*         (*get_root_func)(void *ctx) = NULL;
static enum nodetype (*get_type_func)(void *node) = NULL;
static span_t        (*get_span_func)(void *node) = NULL;
static bool          (*get_bool_func)(void *node) = NULL;
static int           (*get_int_func)(void *node) = NULL;
static int64_t       (*get_i64_func)(void *node) = NULL;
static uint64_t      (*get_u64_func)(void *node) = NULL;
static double        (*get_float_func)(void *node) = NULL;
static const char*   (*get_string_func)(void *node) = NULL;
static size_t        (*get_length_func)(void *node) = NULL;
static void*         (*get_elem_func)(void *arr, size_t i) = NULL;
static void*         (*get_memb_func)(void *obj, const char *k) = NULL;

static int   (*new_func)(datafile_t *df) = NULL;
static char* (*dump_func)(datafile_t *df) = NULL;
static void* (*set_root_arr_func)(void *ctx) = NULL;
static bool  (*arr_app_bool_func)(void *ctx, void *node, bool v) = NULL;
static bool  (*arr_app_int_func)(void *ctx, void *node, int64_t v) = NULL;
static bool  (*arr_app_uint_func)(void *ctx, void *node, uint64_t v) = NULL;
static bool  (*arr_app_float_func)(void *ctx, void *node, double v) = NULL;
static bool  (*arr_app_string_func)(void *ctx, void *node, const char *v) = NULL;
static void* (*arr_app_array_func)(void *ctx, void *node) = NULL;
static void* (*arr_app_object_func)(void *ctx, void *node) = NULL;
static void* (*set_root_obj_func)(void *ctx) = NULL;
static bool  (*obj_put_bool_func)(void *ctx, void *node, const char *k, bool v) = NULL;
static bool  (*obj_put_int_func)(void *ctx, void *node, const char *k, int64_t v) = NULL;
static bool  (*obj_put_uint_func)(void *ctx, void *node, const char *k, uint64_t v) = NULL;
static bool  (*obj_put_float_func)(void *ctx, void *node, const char *k, double v) = NULL;
static bool  (*obj_put_string_func)(void *ctx, void *node, const char *k, const char *v) = NULL;
static void* (*obj_put_array_func)(void *ctx, void *node, const char *k) = NULL;
static void* (*obj_put_object_func)(void *ctx, void *node, const char *k) = NULL;

static const char *hl_note     = "\033[1;36m"; // bold + cyan
static const char *hl_warning  = "\033[1;33m"; // bold + yellow
static const char *hl_error    = "\033[1;31m"; // bold + red
static const char *hl_emphasis = "\033[1;39m"; // bold + default color
static const char *hl_reset    = "\033[0m";    // clear all formatting

#define REGISTRY_SIZE 64

typedef struct regentry regentry_t;
struct regentry {
    const char *type;
    lookup_t *table;
    size_t size;
};

static regentry_t registry[REGISTRY_SIZE] = { 0 };

static int slurp(datafile_t *df, const char *filename);

// ======================================= POOL ALLOCATOR ======================================= //

#define MEMPAGE_CAPACITY 4096

typedef struct mempool mempool_t;
typedef struct mempage mempage_t;

struct mempool {
    mempage_t *head;
    mempage_t *tail;
};

struct mempage {
    char *beg;
    char *end;

    mempage_t *next;
};

static mempage_t* page_new(void) {
    mempage_t *page = malloc(sizeof(*page));
    page->beg       = malloc(MEMPAGE_CAPACITY);
    page->end       = page->beg;
    page->next      = NULL;

    return page;
}

static mempool_t* pool_new(void) {
    mempage_t *page = page_new();
    mempool_t *pool = malloc(sizeof(*pool));
    pool->head      = page;
    pool->tail      = page;
    return pool;
}

#define palloc(pool, T, count) pool_alloc(pool, count, sizeof(T), _Alignof(T))

static void* pool_alloc(mempool_t *pool, size_t items, size_t size, size_t align) {
    assert(items * size <= MEMPAGE_CAPACITY && "total memory request exceeds maximum pagesize");

    ptrdiff_t padding   = -(uintptr_t)pool->tail->beg & (align - 1);
    ptrdiff_t used      = pool->tail->end - pool->tail->beg + padding;
    ptrdiff_t available = MEMPAGE_CAPACITY - used;
    if (available < 0 || items * size > (size_t)available){
        pool->tail->next = page_new();
        pool->tail       = pool->tail->next;
    }

    void *ptr        = pool->tail->end + padding;
    pool->tail->end += padding + (items * size);
    return memset(ptr, 0, items * size);
}

static void pool_free(mempool_t *pool) {
    if (!pool) return;

    mempage_t *curr = pool->head;
    while (curr) {
        mempage_t *next = curr->next;
        free(curr->beg);
        free(curr);
        curr = next;
    }

    free(pool);
}

// ========================================= DIAGNOSTICS ======================================== //

#define DIAGSIZE 255

static char* make_node_diagnostic(datanode_t *dn, const char *fmt, va_list args) {
    size_t pathlen = strlen(dn->path); // prepend the node's path and a colon
    char  *message = malloc(DIAGSIZE + pathlen + 3);
    memcpy(message, dn->path, pathlen);
    message[pathlen + 0] = ':';
    message[pathlen + 1] = ' ';
    vsnprintf(message + pathlen + 2, DIAGSIZE + 1, fmt, args);

    return message;
}

static void push_diagnostic(datafile_t *df, span_t span, enum diaglevel level, const char *message) {
    diagnostic_t *next = malloc(sizeof(*next));
    next->span         = span;
    next->message      = message;
    next->level        = level;
    next->next         = NULL;
    next->prev         = df->diag_tail;

    if (df->diag_tail == NULL) {
        df->diag_head = next;
        df->diag_tail = next;
    } else {
        df->diag_tail->next = next;
        df->diag_tail       = next;
    }
}

void dp_error(datanode_t *dn, const char *fmt, ...) {
    va_list args;
    va_start(args, fmt);
    push_diagnostic(dn->file, get_span_func(dn->node), DIAG_ERROR, make_node_diagnostic(dn, fmt, args));
    va_end(args);
}

void dp_warn(datanode_t *dn, const char *fmt, ...) {
    va_list args;
    va_start(args, fmt);
    push_diagnostic(dn->file, get_span_func(dn->node), DIAG_WARNING, make_node_diagnostic(dn, fmt, args));
    va_end(args);
}

void dp_note(datanode_t *dn, const char *fmt, ...) {
    va_list args;
    va_start(args, fmt);
    push_diagnostic(dn->file, get_span_func(dn->node), DIAG_NOTE, make_node_diagnostic(dn, fmt, args));
    va_end(args);
}

void dp_gerror(datafile_t *df, size_t beg, size_t end, const char *errfmt, ...) {
    va_list args;
    va_start(args, errfmt);

    char *message = malloc(DIAGSIZE + 1);
    vsnprintf(message, DIAGSIZE + 1, errfmt, args);
    push_diagnostic(df, (span_t){ beg, end }, DIAG_ERROR, message);

    va_end(args);
}

// ======================================= IMPLEMENTATION ======================================= //

int dp_init(enum format format) {
    const char *nocolor = getenv("NO_COLOR");
    if (nocolor != NULL && nocolor[0] != 0) {
        hl_error    = "";
        hl_emphasis = "";
        hl_reset    = "";
    }

    switch (format) {
    case DATAPROC_F_JSON:
        read_func       = json_read;
        free_func       = json_free;
        get_root_func   = json_get_root;
        get_type_func   = json_get_type;
        get_span_func   = json_get_span;
        get_bool_func   = json_get_bool;
        get_int_func    = json_get_int;
        get_i64_func    = json_get_i64;
        get_u64_func    = json_get_u64;
        get_float_func  = json_get_float;
        get_string_func = json_get_string;
        get_length_func = json_get_length;
        get_elem_func   = json_get_element;
        get_memb_func   = json_get_member;

        new_func            = json_new;
        dump_func           = json_dump;
        set_root_arr_func   = json_arr_new;
        arr_app_bool_func   = json_arr_appbool;
        arr_app_int_func    = json_arr_appint;
        arr_app_uint_func   = json_arr_appuint;
        arr_app_float_func  = json_arr_appfloat;
        arr_app_string_func = json_arr_appstring;
        arr_app_array_func  = json_arr_apparray;
        arr_app_object_func = json_arr_appobject;
        set_root_obj_func   = json_obj_new;
        obj_put_bool_func   = json_obj_putbool;
        obj_put_int_func    = json_obj_putint;
        obj_put_uint_func   = json_obj_putuint;
        obj_put_float_func  = json_obj_putfloat;
        obj_put_string_func = json_obj_putstring;
        obj_put_array_func  = json_obj_putarray;
        obj_put_object_func = json_obj_putobject;

        break;

    default: return DATAPROC_E_UNKFORMAT;
    }

    assert(read_func && "read_func must be loaded");
    assert(free_func && "free_func must be loaded");
    assert(get_root_func && "get_root_func must be loaded");
    assert(get_type_func && "get_type_func must be loaded");
    assert(get_span_func && "get_span_func must be loaded");
    assert(get_bool_func && "get_bool_func must be loaded");
    assert(get_int_func && "get_int_func must be loaded");
    assert(get_i64_func && "get_i64_func must be loaded");
    assert(get_u64_func && "get_u64_func must be loaded");
    assert(get_float_func && "get_float_func must be loaded");
    assert(get_string_func && "get_string_func must be loaded");
    assert(get_length_func && "get_length_func must be loaded");
    assert(get_elem_func && "get_elem_func must be loaded");
    assert(get_memb_func && "get_memb_func must be loaded");
    assert(new_func && "new_func must be loaded");
    assert(dump_func && "dump_func must be loaded");
    assert(set_root_arr_func && "set_root_arr_func must be loaded");
    assert(arr_app_bool_func && "arr_app_bool_func must be loaded");
    assert(arr_app_int_func && "arr_app_int_func must be loaded");
    assert(arr_app_uint_func && "arr_app_uint_func must be loaded");
    assert(arr_app_float_func && "arr_app_float_func must be loaded");
    assert(arr_app_string_func && "arr_app_string_func must be loaded");
    assert(arr_app_array_func && "arr_app_array_func must be loaded");
    assert(arr_app_object_func && "arr_app_object_func must be loaded");
    assert(set_root_obj_func && "set_root_obj_func must be loaded");
    assert(obj_put_bool_func && "obj_put_bool_func must be loaded");
    assert(obj_put_int_func && "obj_put_int_func must be loaded");
    assert(obj_put_uint_func && "obj_put_uint_func must be loaded");
    assert(obj_put_float_func && "obj_put_float_func must be loaded");
    assert(obj_put_string_func && "obj_put_string_func must be loaded");
    assert(obj_put_array_func && "obj_put_array_func must be loaded");
    assert(obj_put_object_func && "obj_put_object_func must be loaded");
    return DATAPROC_E_NONE;
}

int dp_register(lookup_t *table, size_t size, const char *type) {
    for (int i = 0; i < REGISTRY_SIZE; i++) {
        regentry_t *entry = &registry[i];
        if (entry->type == NULL) {
            entry->type  = type;
            entry->table = table;
            entry->size  = size;
            return DATAPROC_E_NONE;
        }
    }

    return DATAPROC_E_REGFULL;
}

static int slurp(datafile_t *df, const char *filename) {
    assert(df && "df pointer must not be NULL");
    assert(filename && "filename must not be NULL");

    df->filename = filename;
    df->source   = NULL;

    FILE *f = fopen(filename, "rb");
    if (f == NULL) {
        dp_gerror(df, 0, 0, "could not open file '%s': %s", filename, strerror(errno));
        return DATAPROC_E_FOPEN;
    }

    fseek(f, 0, SEEK_END);
    long fsize = ftell(f);
    fseek(f, 0, SEEK_SET);

    if (fsize == 0) { fclose(f); return DATAPROC_E_NONE;  }
    if (fsize < 0)  {
        dp_gerror(df, 0, 0, "invalid size for file '%s': %s", filename, strerror(errno));
        fclose(f);
        return DATAPROC_E_FSIZE;
    }

    char *buf = malloc(fsize + 1);
    if (buf == NULL) {
        dp_gerror(df, 0, 0, "allocation failure for file '%s': %s", filename, strerror(errno));
        fclose(f);
        return DATAPROC_E_ALLOC;
    }

    fread(buf, 1, fsize, f);
    fclose(f);
    buf[fsize] = 0;

    df->source = buf;
    df->size   = fsize;

    assert(df->filename && "df should know its filename");
    assert(df->source && "df should point to file contents");
    return DATAPROC_E_NONE;
}

int dp_load(datafile_t *df, const char *filename) {
    df->pool = pool_new();
    return slurp(df, filename) || read_func(df);
}

void dp_free(datafile_t *df) {
    assert(df && "df pointer must not be NULL");

    free_func(df);
    free((char *)df->source);

    diagnostic_t *curr = df->diag_head, *next = NULL;
    while (curr != NULL) {
        next = curr->next;
        free((char *)curr->message);
        free(curr);
        curr = next;
    }

    pool_free(df->pool);

    df->source    = NULL;
    df->diag_head = NULL;
    df->diag_tail = NULL;
    df->pool      = NULL;
}

typedef struct errpos errpos_t;
struct errpos {
    size_t line;
    size_t col;
    size_t line_head;
};

static errpos_t locate(datafile_t *df, diagnostic_t *perr) {
    errpos_t    pos  = { .line = 1, .col = 1, .line_head = 0, };
    const char *p    = df->source;

    while (p && *p && (size_t)(p - df->source) < perr->span.beg) {
        if (*p == '\n') {
            pos.line     += 1;
            pos.col       = 1;
            pos.line_head = p - df->source + 1;
        }
        else pos.col++;

        p++;
    }

    return pos;
}

#define HL_DIAG(...)     hl_diag, __VA_ARGS__, hl_reset
#define HL_EMPHASIS(...) hl_emphasis, __VA_ARGS__, hl_reset
#define max(cur, try)    cur < try ? try : cur

enum diaglevel dp_report(datafile_t *df) {
    assert(df && "df pointer must not be NULL");

    if (!df->diag_head) return DIAG_EMPTY;

    enum diaglevel max_sev = DIAG_NOTE;
    for (diagnostic_t *perr = df->diag_head; perr; perr = perr->next) {
        max_sev = max(max_sev, perr->level);

        const char *prefix = NULL, *hl_diag = NULL;
        switch (perr->level) {
        case DIAG_NOTE:    prefix = "note:";    hl_diag = hl_note;    break;
        case DIAG_WARNING: prefix = "warning:"; hl_diag = hl_warning; break;
        case DIAG_ERROR:   prefix = "error:";   hl_diag = hl_error;   break;

        case DIAG_EMPTY:   assert(false && "DIAG_EMPTY is an invalid level"); abort(); break;
        }

        if (perr->span.beg == 0 && perr->span.end == 0) {
            fprintf(stderr, "%s%s:%s %s%s%s %s\n",
                    HL_EMPHASIS(df->filename),
                    HL_DIAG(prefix),
                    perr->message);
        }
        else {
            errpos_t pos = locate(df, perr);
            fprintf(stderr, "%s%s:%zu:%zu:%s %s%s%s %s\n",
                    HL_EMPHASIS(df->filename, pos.line, pos.col),
                    HL_DIAG(prefix),
                    perr->message);

            const char *p = df->source + pos.line_head;
            const char *e = p;
            while (e && *e && *e != '\n') e++;

            // TODO: multi-line support for previews
            size_t line_tail = e - df->source;
            int len_prefix   = (int)(perr->span.beg - pos.line_head);
            int len_error    = perr->span.end < line_tail
                ? (int)(perr->span.end - perr->span.beg)
                : (int)(line_tail - perr->span.beg);
            int len_suffix   = (int)(line_tail - pos.line_head - len_prefix - len_error);
            fprintf(stderr, " %4zu | %.*s%s%.*s%s%.*s\n",
                    pos.line,
                    len_prefix, p,
                    HL_DIAG(len_error, p + len_prefix),
                    len_suffix, p + len_prefix + len_error);
            fprintf(stderr, "      | ");
            for (int i = 0; i < len_prefix; i++) fputc(' ', stderr);
            fputs(hl_diag, stderr);
            for (int i = 0; i < len_error; i++)  fputc('^', stderr);
            fputs(hl_reset, stderr);
            for (int i = 0; i < len_suffix; i++) fputc(' ', stderr);
            fputc('\n', stderr);
        }
    }

    return max_sev;
}

static inline bool is_word(char c) {
    return c == '_'
        || (c >= 'a' && c <= 'z')
        || (c >= 'A' && c <= 'Z')
        || (c >= '0' && c <= '9');
}

static char* keytok2(const char *s) {
    assert(s && "input string must not be NULL");
    while (s && *s && is_word(*s)) s++;
    return (char *)s;
}

#define MAX_TOKLEN (1 << 8)

static bool queriable(enum nodetype type) {
    return type == DATAPROC_T_ARRAY || type == DATAPROC_T_OBJECT;
}

static datanode_t dp_arrelem_internal(datanode_t dn, size_t i, bool error);
static datanode_t dp_objmemb_internal(datanode_t dn, const char *k, bool error);

static const char* typename(enum nodetype type) {
    switch (type) {
    case DATAPROC_T_NONE:    return "(none)";
    case DATAPROC_T_NULL:    return "a null-literal";
    case DATAPROC_T_BOOLEAN: return "a boolean";
    case DATAPROC_T_INT:     return "an integer";
    case DATAPROC_T_FLOAT:   return "a float";
    case DATAPROC_T_STRING:  return "a string";
    case DATAPROC_T_ARRAY:   return "an array";
    case DATAPROC_T_OBJECT:  return "an object";
    case DATAPROC_T_MAPPED:  return "a mapped constant";
    case DATAPROC_T_ERR:     return "(error)";
    default:                 abort();
    }
}

enum queryerr {
    DATAPROC_Q_OK = 0,
    DATAPROC_Q_BADTOKEN,  // hit an unexpected token
    DATAPROC_Q_RBRACE,    // missing a closing r-brace for array-accessor
    DATAPROC_Q_ARRINDEX,  // array index is not a non-negative integer
};

static const char* query_errmsg(enum queryerr code) {
    switch (code) {
    case DATAPROC_Q_OK:       return "(query ok)";
    case DATAPROC_Q_BADTOKEN: return "unexpected access-delimiting token";
    case DATAPROC_Q_RBRACE:   return "missing closing-brace ']'";
    case DATAPROC_Q_ARRINDEX: return "array index must be a non-negative integer";
    default: abort();
    }
}

typedef struct querynode querynode_t;
struct querynode {
    bool is_object;
    union {
        const char *key;
        size_t      idx;
    };

    querynode_t *next;
};

static void free_query(querynode_t *q) {
    querynode_t *curr = q, *next = NULL;
    while (curr != NULL) {
        next = curr->next;
        free(curr);
        curr = next;
    }
}

static enum queryerr parse_query(char *path, querynode_t **out) {
#define errout(ec) do { errc = ec; goto errcleanup; } while (0)

    assert(path && "path query must not be NULL");
    assert(out && "out pointer must not be NULL");

    if (*path == '$') path++;

    int errc = DATAPROC_Q_OK;
    if (*path == '.' && *(path + 1) == 0) { // special case: "." returns the root
        *out = NULL;
        return errc;
    }

    querynode_t *head = calloc(1, sizeof(*head));
    querynode_t *tail = head;

    while (*path) {
        char *start = path; // '.' or '['
        char *token = path + 1;
        char *delim = keytok2(token);

        switch (*start) {
        case '.':
            tail->is_object = true;
            tail->key       = token;
            break;

        case '[':
            if (*delim != ']') errout(DATAPROC_Q_RBRACE);
            tail->is_object = false;

            char *end = NULL;
            long  idx = strtol(token, &end, 10);
            tail->idx = idx;

            if (end != delim || idx < 0) errout(DATAPROC_Q_ARRINDEX);
            break;

        default: errout(DATAPROC_Q_BADTOKEN);
        }

        switch (*delim) {
        case '\0': // fall-through
        case '.':  // fall-through
        case '[':  path = delim;     break;
        case ']':  path = delim + 1; break;
        default:   errout(DATAPROC_Q_BADTOKEN);
        }

        *start = 0;  // terminate the previous token (in case it's a key-string)
        if (*path) { // setup for the next token, if needed
            tail->next = calloc(1, sizeof(*tail->next));
            tail       = tail->next;
        }
    }

    *out = head;
    return DATAPROC_Q_OK;

#undef errout

errcleanup:
    free_query(head);
    return errc;
}

static datanode_t dp_query(datafile_t *df, const char *path, bool error) {
    assert(df && "df pointer must not be NULL");
    assert(path && "path query must not be NULL");

    datanode_t   dn      = { .file = df, .path = (char *)path, .node = NULL };
    querynode_t *query   = NULL;
    char        *pathcpy = calloc(strlen(path) + 1, 1);
    memcpy(pathcpy, path, strlen(path));

    int errc = parse_query(pathcpy, &query);
    if (errc) {
        // NOTE: query syntax errors cannot be ignored
        dp_gerror(df, 0, 0, "%s: query syntax error: %s", path, query_errmsg(errc));
        goto cleanup;
    }

    dn.node = get_root_func(df->ctx);
    dn.type = get_type_func(dn.node);
    for (querynode_t *curr = query; curr; curr = curr->next) {
        if (!queriable(dn.type)) {
            if (error) dp_error(&dn, "expected an array or object, but got %s", typename(dn.type));
            dn.type = DATAPROC_T_ERR;
            goto cleanup;
        }

        dn = curr->is_object
           ? dp_objmemb_internal(dn, curr->key, error)
           : dp_arrelem_internal(dn, curr->idx, error);
        if (dn.type == DATAPROC_T_ERR) goto cleanup;
    }

cleanup:
    free(pathcpy);
    free_query(query);
    return dn;
}

datanode_t dp_try(datafile_t *df, const char *path) {
    return dp_query(df, path, false);
}

datanode_t dp_get(datafile_t *df, const char *path) {
    return dp_query(df, path, true);
}

#define err_return(e, r) do { dn.file->errc = e; return r; } while (0)
#define asserttype(expected, retval)                  \
    do {                                              \
        if (dn.type == DATAPROC_T_ERR) return retval; \
        if (dn.type != expected) {                    \
            dp_error(                                 \
                &dn,                                  \
                "expected %s, but got %s",            \
                typename(expected), typename(dn.type) \
            );                                        \
            return retval;                            \
        }                                             \
    } while (0)

bool dp_bool(datanode_t dn) {
    if (dn.type == DATAPROC_T_MAPPED) return dn.mapped != 0;

    asserttype(DATAPROC_T_BOOLEAN, false);
    return get_bool_func(dn.node);
}

long dp_int(datanode_t dn) {
    if (dn.type == DATAPROC_T_MAPPED) return dn.mapped;

    asserttype(DATAPROC_T_INT, 0);
    return get_int_func(dn.node);
}

#pragma GCC diagnostic push // Disable warnings that `i < 0` is impossible for unsigned types
#pragma GCC diagnostic ignored "-Wtype-limits"

#define assert_intrange(min, max)                        \
    do {                                                 \
        if (i < min || i > max) {                        \
            dp_error(                                    \
                &dn,                                     \
                "expected a value in the range [%d,%u]", \
                min, max                                 \
            );                                           \
            return 0;                                    \
        }                                                \
    } while (0)

int8_t dp_s8(datanode_t dn) {
    long i = dp_int(dn);
    assert_intrange(INT8_MIN, INT8_MAX);
    return (int8_t)(i & 0xFF);
}

int16_t dp_s16(datanode_t dn) {
    long i = dp_int(dn);
    assert_intrange(INT16_MIN, INT16_MAX);
    return (int16_t)(i & 0xFFFF);
}

int32_t dp_s32(datanode_t dn) {
    long i = dp_int(dn);
    assert_intrange(INT32_MIN, INT32_MAX);
    return (int32_t)(i & 0xFFFFFFFF);
}

int64_t dp_s64(datanode_t dn) {
    if (dn.type == DATAPROC_T_MAPPED) return dn.mapped;

    asserttype(DATAPROC_T_INT, 0);
    return get_i64_func(dn.node);
}

uint8_t dp_u8(datanode_t dn) {
    uint64_t i = dp_u64(dn);
    assert_intrange(0, UINT8_MAX);
    return (uint8_t)(i & 0xFF);
}

uint8_t dp_u8range(datanode_t dn, uint8_t min, uint8_t max) {
    uint64_t i = dp_u64(dn);
    assert_intrange(min, max);
    return (uint8_t)(i & 0xFF);
}

uint16_t dp_u16(datanode_t dn) {
    uint64_t i = dp_u64(dn);
    assert_intrange(0, UINT16_MAX);
    return (uint16_t)(i & 0xFFFF);
}

uint16_t dp_u16range(datanode_t dn, uint16_t min, uint16_t max) {
    uint64_t i = dp_u64(dn);
    assert_intrange(min, max);
    return (uint16_t)(i & 0xFFFF);
}

uint32_t dp_u32(datanode_t dn) {
    uint64_t i = dp_u64(dn);
    assert_intrange(0, UINT32_MAX);
    return (uint32_t)(i & 0xFFFFFFFF);
}

uint32_t dp_u32range(datanode_t dn, uint32_t min, uint32_t max) {
    uint64_t i = dp_u64(dn);
    assert_intrange(min, max);
    return (uint32_t)(i & 0xFFFFFFFF);
}

uint64_t dp_u64(datanode_t dn) {
    if (dn.type == DATAPROC_T_MAPPED) return dn.mapped;

    asserttype(DATAPROC_T_INT, 0);
    return get_u64_func(dn.node);
}

#pragma GCC diagnostic pop

double dp_float(datanode_t dn) {
    asserttype(DATAPROC_T_FLOAT, 0.0);
    return get_float_func(dn.node);
}

const char* dp_string(datanode_t dn) {
    asserttype(DATAPROC_T_STRING, NULL);
    return get_string_func(dn.node);
}

size_t dp_arrlen(datanode_t dn) {
    asserttype(DATAPROC_T_ARRAY, 0);
    return get_length_func(dn.node);
}

// Internal call here is only for use by dp_get, which has a direct path to the node
// and thus should not allocate an updated path-string
static datanode_t dp_arrelem_internal(datanode_t dn, size_t i, bool error) {
    asserttype(DATAPROC_T_ARRAY, (dn.node = NULL, dn.type = DATAPROC_T_ERR, dn));

    void *child = get_elem_func(dn.node, i);
    if (child == NULL && error) {
        dp_error(&dn, "array index %zu is out-of-bounds", i);
    }

    return (datanode_t){
        .file = dn.file,
        .path = dn.path,
        .node = child,
        .type = child != NULL ? get_type_func(child) : DATAPROC_T_ERR,
    };
}

datanode_t dp_arrelem(datanode_t dn, size_t i) {
    datanode_t elem = dp_arrelem_internal(dn, i, true);
    if (elem.type != DATAPROC_T_ERR) {
        size_t size = snprintf(NULL, 0, "%s[%zu]", dn.path, i);
        elem.path   = palloc(dn.file->pool, char, size + 1);
        snprintf(elem.path, size + 1, "%s[%zu]", dn.path, i);
    }

    return elem;
}

// Internal call here is only for use by dp_get, which has a direct path to the node
// and thus should not allocate an updated path-string
static datanode_t dp_objmemb_internal(datanode_t dn, const char *k, bool error) {
    asserttype(DATAPROC_T_OBJECT, (dn.node = NULL, dn.type = DATAPROC_T_ERR, dn));

    void *child = get_memb_func(dn.node, k);
    if (child == NULL && error) {
        dp_error(&dn, "object has no member named \"%s\"", k);
    }

    return (datanode_t){
        .file = dn.file,
        .path = dn.path,
        .node = child,
        .type = child != NULL ? get_type_func(child) : DATAPROC_T_ERR,
    };
}

bool dp_hasmemb(datanode_t dn, const char *k) {
    datanode_t elem = dp_objmemb_internal(dn, k, false);
    return elem.type != DATAPROC_T_ERR;
}

datanode_t dp_objmemb(datanode_t dn, const char *k) {
    datanode_t elem = dp_objmemb_internal(dn, k, true);
    if (elem.type != DATAPROC_T_ERR) {
        size_t size = snprintf(NULL, 0, "%s.%s", dn.path, k);
        elem.path   = palloc(dn.file->pool, char, size + 1);
        snprintf(elem.path, size + 1, "%s.%s", dn.path, k);
    }

    return elem;
}

static regentry_t* regfind(const char *type) {
    for (int i = 0; i < REGISTRY_SIZE; i++) {
        regentry_t *entry = &registry[i];
        if (entry->type == NULL)            return NULL;
        if (strcmp(entry->type, type) == 0) return entry;
    }

    return NULL;
}

static int lookup_cmp(const void *key, const void *member) {
    const char     *value = key;
    const lookup_t *entry = member;

    return strcmp(value, entry->def);
}

lookup_t* lookup_find(datanode_t *dnp, const char *type) {
    datanode_t dn = *dnp;

    asserttype(DATAPROC_T_STRING, (dnp->node = NULL, dnp->type = DATAPROC_T_ERR, NULL));

    regentry_t *entry = regfind(type);
    if (entry == NULL) {
        dp_error(dnp, "no lookup table registered for \"%s\"", type);
        dnp->node = NULL;
        dnp->type = DATAPROC_T_ERR;
        return NULL;
    }

    const char *value = get_string_func(dn.node);
    lookup_t   *found = bsearch(value, entry->table, entry->size, sizeof(lookup_t), lookup_cmp);
    if (!found) {
        dp_error(&dn, "expected an identifier for \"%s\"", type);
        dnp->node = NULL;
        dnp->type = DATAPROC_T_ERR;
        return NULL;
    }

    return found;
}

datanode_t dp_lookup(datanode_t dn, const char *type) {
    lookup_t *found = lookup_find(&dn, type);
    if (found) {
        dn.mapped = found->val;
        dn.type   = DATAPROC_T_MAPPED;
    }

    return dn;
}

datanode_t dp_lookup_s(datanode_t dn, const char *type) {
    lookup_find(&dn, type);
    return dn;
}

datafile_t dp_new(void) {
    datafile_t df = { 0 };
    new_func(&df);
    return df;
}

char* dp_dump(datafile_t *df) {
    return dump_func(df);
}

datanode_t dp_set_arr(datafile_t *df) {
    return (datanode_t){
        .file = df,
        .type = DATAPROC_T_ARRAY,
        .node = set_root_arr_func(df->ctx),
    };
}

void dp_arr_appbool(datanode_t *dn, bool v) {
    assert(dn->type == DATAPROC_T_ARRAY && "cannot append to a non-array");
    arr_app_bool_func(dn->file->ctx, dn->node, v);
}

void dp_arr_appint(datanode_t *dn, int64_t v) {
    assert(dn->type == DATAPROC_T_ARRAY && "cannot append to a non-array");
    arr_app_int_func(dn->file->ctx, dn->node, v);
}

void dp_arr_appuint(datanode_t *dn, uint64_t v) {
    assert(dn->type == DATAPROC_T_ARRAY && "cannot append to a non-array");
    arr_app_uint_func(dn->file->ctx, dn->node, v);
}

void dp_arr_appfloat(datanode_t *dn, double v) {
    assert(dn->type == DATAPROC_T_ARRAY && "cannot append to a non-array");
    arr_app_float_func(dn->file->ctx, dn->node, v);
}

void dp_arr_appstring(datanode_t *dn, const char *v) {
    assert(dn->type == DATAPROC_T_ARRAY && "cannot append to a non-array");
    arr_app_string_func(dn->file->ctx, dn->node, v);
}

datanode_t dp_arr_apparray(datanode_t *dn) {
    assert(dn->type == DATAPROC_T_ARRAY && "cannot append to a non-array");

    datanode_t result = {
        .file = dn->file,
        .type = DATAPROC_T_ARRAY,
        .node = arr_app_array_func(dn->file->ctx, dn->node),
    };

    if (result.node == NULL) {
        result.type = DATAPROC_T_ERR;
    }

    return result;
}

datanode_t dp_arr_appobject(datanode_t *dn) {
    assert(dn->type == DATAPROC_T_ARRAY && "cannot append to a non-array");

    datanode_t result = {
        .file = dn->file,
        .type = DATAPROC_T_OBJECT,
        .node = arr_app_object_func(dn->file->ctx, dn->node),
    };

    if (result.node == NULL) {
        result.type = DATAPROC_T_ERR;
    }

    return result;
}

datanode_t dp_set_obj(datafile_t *df) {
    return (datanode_t){
        .file = df,
        .path = ".",
        .type = DATAPROC_T_OBJECT,
        .node = set_root_obj_func(df->ctx),
    };
}

void dp_obj_putbool(datanode_t *dn, const char *k, bool v) {
    assert(dn->type == DATAPROC_T_OBJECT && "cannot put into a non-object");
    obj_put_bool_func(dn->file->ctx, dn->node, k, v);
}

void dp_obj_putint(datanode_t *dn, const char *k, int64_t v) {
    assert(dn->type == DATAPROC_T_OBJECT && "cannot put into a non-object");
    obj_put_int_func(dn->file->ctx, dn->node, k, v);
}

void dp_obj_putuint(datanode_t *dn, const char *k, uint64_t v) {
    assert(dn->type == DATAPROC_T_OBJECT && "cannot put into a non-object");
    obj_put_uint_func(dn->file->ctx, dn->node, k, v);
}

void dp_obj_putfloat(datanode_t *dn, const char *k, double v) {
    assert(dn->type == DATAPROC_T_OBJECT && "cannot put into a non-object");
    obj_put_float_func(dn->file->ctx, dn->node, k, v);
}

void dp_obj_putstring(datanode_t *dn, const char *k, const char *v) {
    assert(dn->type == DATAPROC_T_OBJECT && "cannot put into a non-object");
    obj_put_string_func(dn->file->ctx, dn->node, k, v);
}

datanode_t dp_obj_putarray(datanode_t *dn, const char *k) {
    assert(dn->type == DATAPROC_T_OBJECT && "cannot put into a non-object");

    datanode_t result = {
        .file = dn->file,
        .type = DATAPROC_T_ARRAY,
        .node = obj_put_array_func(dn->file->ctx, dn->node, k),
    };

    if (result.node == NULL) {
        result.type = DATAPROC_T_ERR;
    }

    return result;
}

datanode_t dp_obj_putobject(datanode_t *dn, const char *k) {
    assert(dn->type == DATAPROC_T_OBJECT && "cannot put into a non-object");

    datanode_t result = {
        .file = dn->file,
        .type = DATAPROC_T_OBJECT,
        .node = obj_put_object_func(dn->file->ctx, dn->node, k),
    };

    if (result.node == NULL) {
        result.type = DATAPROC_T_ERR;
    }

    return result;
}
