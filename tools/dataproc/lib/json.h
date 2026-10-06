#ifndef DATAPROC_JSON_H
#define DATAPROC_JSON_H

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#include "dataproc.h"
#include "private.h"

int  json_read(datafile_t *df);
void json_free(datafile_t *df);

void*         json_get_root(void *ctx);
enum nodetype json_get_type(void *node);
span_t        json_get_span(void *node);

bool        json_get_bool(void *node);
int         json_get_int(void *node);
int64_t     json_get_i64(void *node);
uint64_t    json_get_u64(void *node);
double      json_get_float(void *node);
const char* json_get_string(void *node);
size_t      json_get_length(void *node);
void*       json_get_element(void *array, size_t i);
void*       json_get_member(void *object, const char *k);

int   json_new(datafile_t *df);
char* json_dump(datafile_t *df);

void* json_arr_new(void *ctx);
bool  json_arr_appbool(void *ctx, void *node, bool v);
bool  json_arr_appint(void *ctx, void *node, int64_t v);
bool  json_arr_appuint(void *ctx, void *node, uint64_t v);
bool  json_arr_appfloat(void *ctx, void *node, double v);
bool  json_arr_appstring(void *ctx, void *node, const char *v);
void* json_arr_apparray(void *ctx, void *node);
void* json_arr_appobject(void *ctx, void *node);

void* json_obj_new(void *ctx);
bool  json_obj_putbool(void *ctx, void *node, const char *k, bool v);
bool  json_obj_putint(void *ctx, void *node, const char *k, int64_t v);
bool  json_obj_putuint(void *ctx, void *node, const char *k, uint64_t v);
bool  json_obj_putfloat(void *ctx, void *node, const char *k, double v);
bool  json_obj_putstring(void *ctx, void *node, const char *k, const char *v);
void* json_obj_putarray(void *ctx, void *node, const char *k);
void* json_obj_putobject(void *ctx, void *node, const char *k);

#endif // DATAPROC_JSON_H
