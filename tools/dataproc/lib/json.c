#include "json.h"

#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>

#include "dataproc.h"
#include "private.h"
#include "yyjson.h"

typedef struct yyjson_ctx yyjson_ctx_t;
struct yyjson_ctx {
    yyjson_doc *doc;
    yyjson_val *root;
};

typedef struct yyjson_mutctx yyjson_mutctx_t;
struct yyjson_mutctx {
    yyjson_mut_doc *doc;
    yyjson_mut_val *root;
};

int json_read(datafile_t *df) {
    assert(df && "df pointer must not be NULL");
    assert(df->source && "df must have loaded a source-file");

    yyjson_read_err yyjerr = { 0 };
    yyjson_ctx_t   *yyjctx = malloc(sizeof(*yyjctx));
    if (yyjctx == NULL) return DATAPROC_E_ALLOC;

    yyjctx->doc = yyjson_read_opts((char *)df->source, df->size, 0, NULL, &yyjerr);
    if (yyjctx->doc == NULL) {
        dp_gerror(df, yyjerr.pos, yyjerr.pos + 1, "JSON parse error: %s", yyjerr.msg);
        free(yyjctx);
        return DATAPROC_E_BACKEND;
    }

    yyjctx->root = yyjson_doc_get_root(yyjctx->doc);
    df->ctx      = yyjctx;
    return DATAPROC_E_NONE;
}

void json_free(datafile_t *df) {
    assert(df && "df pointer must not be NULL");

    yyjson_ctx_t *yyjctx = df->ctx;
    if (yyjctx != NULL) {
        yyjson_doc_free(yyjctx->doc);
        free(yyjctx);
    }

    df->ctx = NULL;
}

void* json_get_root(void *ctx) {
    assert(ctx && "ctx pointer must not be NULL");

    yyjson_ctx_t *yyjctx = ctx;
    return yyjctx->root;
}

enum nodetype json_get_type(void *_node) {
    yyjson_val *node = _node;
    switch (yyjson_get_type(node)) {
    default: return DATAPROC_T_NONE;

    case YYJSON_TYPE_RAW:  return DATAPROC_T_STRING;
    case YYJSON_TYPE_NULL: return DATAPROC_T_NULL;
    case YYJSON_TYPE_BOOL: return DATAPROC_T_BOOLEAN;
    case YYJSON_TYPE_STR:  return DATAPROC_T_STRING;
    case YYJSON_TYPE_ARR:  return DATAPROC_T_ARRAY;
    case YYJSON_TYPE_OBJ:  return DATAPROC_T_OBJECT;

    case YYJSON_TYPE_NUM:
        return yyjson_get_subtype(node) == YYJSON_SUBTYPE_REAL
            ? DATAPROC_T_FLOAT
            : DATAPROC_T_INT;
    }
}

span_t json_get_span(void *_node) {
    yyjson_val *node = _node;
    return (span_t){ .beg = node->beg, .end = node->end };
}

bool json_get_bool(void *node) {
    return yyjson_get_bool(node);
}

int json_get_int(void *node) {
    return yyjson_get_int(node);
}

int64_t json_get_i64(void *node) {
    return yyjson_get_sint(node);
}

uint64_t json_get_u64(void *node) {
    return yyjson_get_uint(node);
}

double json_get_float(void *node) {
    return yyjson_get_real(node);
}

const char* json_get_string(void *node) {
    return yyjson_get_str(node);
}

size_t json_get_length(void *node) {
    return yyjson_get_len(node);
}

void* json_get_element(void *array, size_t i) {
    return yyjson_arr_get(array, i);
}

void* json_get_member(void *object, const char *k) {
    return yyjson_obj_get(object, k);
}

int json_new(datafile_t *df) {
    yyjson_mutctx_t *yyjctx = malloc(sizeof(*yyjctx));
    if (yyjctx == NULL) return DATAPROC_E_ALLOC;

    yyjctx->doc  = yyjson_mut_doc_new(NULL);
    yyjctx->root = NULL;
    if (yyjctx->doc == NULL) return DATAPROC_E_BACKEND;

    df->ctx = yyjctx;
    return DATAPROC_E_NONE;
}

char* json_dump(datafile_t *df) {
    size_t           size   = 0;
    yyjson_mutctx_t *yyjctx = df->ctx;
    yyjson_write_err yyjerr;

    char *result = yyjson_mut_write_opts(yyjctx->doc, YYJSON_WRITE_PRETTY_TWO_SPACES, NULL, &size, &yyjerr);
    if (yyjerr.code) {
        dp_gerror(df, 0, 0, "JSON dump error: %s", yyjerr.msg);
        return NULL;
    }

    return result;
}

void* json_arr_new(void *ctx) {
    assert(ctx && "ctx pointer must not be NULL");

    yyjson_mutctx_t *yyjctx = ctx;
    yyjctx->root = yyjson_mut_arr(yyjctx->doc);
    yyjson_mut_doc_set_root(yyjctx->doc, yyjctx->root);
    return yyjctx->root;
}

bool json_arr_appbool(void *ctx, void *node, bool v) {
    yyjson_mutctx_t *yyjctx = ctx;
    return yyjson_mut_arr_add_bool(yyjctx->doc, node, v);
}

bool json_arr_appint(void *ctx, void *node, int64_t v) {
    yyjson_mutctx_t *yyjctx = ctx;
    return yyjson_mut_arr_add_int(yyjctx->doc, node, v);
}

bool json_arr_appuint(void *ctx, void *node, uint64_t v) {
    yyjson_mutctx_t *yyjctx = ctx;
    return yyjson_mut_arr_add_uint(yyjctx->doc, node, v);
}

bool json_arr_appfloat(void *ctx, void *node, double v) {
    yyjson_mutctx_t *yyjctx = ctx;
    return yyjson_mut_arr_add_real(yyjctx->doc, node, v);
}

bool json_arr_appstring(void *ctx, void *node, const char *v) {
    yyjson_mutctx_t *yyjctx = ctx;
    return yyjson_mut_arr_add_strcpy(yyjctx->doc, node, v);
}

void* json_arr_apparray(void *ctx, void *node) {
    yyjson_mutctx_t *yyjctx = ctx;
    return yyjson_mut_arr_add_arr(yyjctx->doc, node);
}

void* json_arr_appobject(void *ctx, void *node) {
    yyjson_mutctx_t *yyjctx = ctx;
    return yyjson_mut_arr_add_obj(yyjctx->doc, node);
}

void* json_obj_new(void *ctx) {
    assert(ctx && "ctx pointer must not be NULL");

    yyjson_mutctx_t *yyjctx = ctx;
    yyjctx->root = yyjson_mut_obj(yyjctx->doc);
    yyjson_mut_doc_set_root(yyjctx->doc, yyjctx->root);
    return yyjctx->root;
}

bool json_obj_putbool(void *ctx, void *node, const char *k, bool v) {
    yyjson_mutctx_t *yyjctx = ctx;
    return yyjson_mut_obj_add_bool(yyjctx->doc, node, k, v);
}

bool json_obj_putint(void *ctx, void *node, const char *k, int64_t v) {
    yyjson_mutctx_t *yyjctx = ctx;
    return yyjson_mut_obj_add_int(yyjctx->doc, node, k, v);
}

bool json_obj_putuint(void *ctx, void *node, const char *k, uint64_t v) {
    yyjson_mutctx_t *yyjctx = ctx;
    return yyjson_mut_obj_add_uint(yyjctx->doc, node, k, v);
}

bool json_obj_putfloat(void *ctx, void *node, const char *k, double v) {
    yyjson_mutctx_t *yyjctx = ctx;
    return yyjson_mut_obj_add_real(yyjctx->doc, node, k, v);
}

bool json_obj_putstring(void *ctx, void *node, const char *k, const char *v) {
    yyjson_mutctx_t *yyjctx = ctx;
    return yyjson_mut_obj_add_strcpy(yyjctx->doc, node, k, v);
}

void* json_obj_putarray(void *ctx, void *node, const char *k) {
    yyjson_mutctx_t *yyjctx = ctx;
    return yyjson_mut_obj_add_arr(yyjctx->doc, node, k);
}

void* json_obj_putobject(void *ctx, void *node, const char *k) {
    yyjson_mutctx_t *yyjctx = ctx;
    return yyjson_mut_obj_add_obj(yyjctx->doc, node, k);
}
