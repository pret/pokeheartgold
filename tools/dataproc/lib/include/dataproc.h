#ifndef DATAPROC_H
#define DATAPROC_H

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

enum format {
    DATAPROC_F_NONE = 0,
    DATAPROC_F_JSON,
};

enum nodetype {
    DATAPROC_T_NONE = 0,
    DATAPROC_T_NULL,
    DATAPROC_T_BOOLEAN,
    DATAPROC_T_INT,
    DATAPROC_T_FLOAT,
    DATAPROC_T_STRING,
    DATAPROC_T_ARRAY,
    DATAPROC_T_OBJECT,

    DATAPROC_T_MAPPED,
    DATAPROC_T_ERR,
};

enum {
    DATAPROC_E_NONE = 0,

    DATAPROC_E_UNKFORMAT,
    DATAPROC_E_FOPEN,
    DATAPROC_E_FSIZE,
    DATAPROC_E_ALLOC,
    DATAPROC_E_BACKEND,
    DATAPROC_E_QUERY,
    DATAPROC_E_BADTYPE,
    DATAPROC_E_REGFULL,
    DATAPROC_E_REGNOTFOUND,
};

enum diaglevel {
    DIAG_EMPTY,
    DIAG_NOTE,
    DIAG_WARNING,
    DIAG_ERROR,
};

typedef struct diagnostic diagnostic_t;
typedef struct datafile   datafile_t;
typedef struct datanode   datanode_t;
typedef struct lookup     lookup_t;
typedef struct span       span_t;

struct datafile {
    const char *filename;
    const char *source;
    size_t      size;

    diagnostic_t *diag_head;
    diagnostic_t *diag_tail;

    void *ctx;
    void *pool;
};

struct datanode {
    datafile_t   *file;
    char         *path;
    enum nodetype type;
    union {
        void *node;
        long  mapped;
    };
};

struct lookup {
    long        val;
    const char *def;
};

int  dp_init(enum format format);
int  dp_register(lookup_t *table, size_t size, const char *type);
int  dp_load(datafile_t *df, const char *filename);
void dp_free(datafile_t *df);

enum diaglevel dp_report(datafile_t *df);

void dp_error(datanode_t *dn, const char *fmt, ...) __attribute__((format(printf, 2, 3)));
void dp_warn(datanode_t *dn, const char *fmt, ...) __attribute__((format(printf, 2, 3)));
void dp_note(datanode_t *dn, const char *fmt, ...) __attribute__((format(printf, 2, 3)));
void dp_gerror(datafile_t *df, size_t beg, size_t end, const char *errfmt, ...) __attribute__((format(printf, 4, 5)));

datanode_t  dp_try(datafile_t *df, const char *path);
datanode_t  dp_get(datafile_t *df, const char *path);
bool        dp_bool(datanode_t dn);
long        dp_int(datanode_t dn);
int8_t      dp_s8(datanode_t dn);
int16_t     dp_s16(datanode_t dn);
int32_t     dp_s32(datanode_t dn);
int64_t     dp_s64(datanode_t dn);
uint8_t     dp_u8(datanode_t dn);
uint8_t     dp_u8range(datanode_t dn, uint8_t min, uint8_t max);
uint16_t    dp_u16(datanode_t dn);
uint16_t    dp_u16range(datanode_t dn, uint16_t min, uint16_t max);
uint32_t    dp_u32(datanode_t dn);
uint32_t    dp_u32range(datanode_t dn, uint32_t min, uint32_t max);
uint64_t    dp_u64(datanode_t dn);
double      dp_float(datanode_t dn);
const char* dp_string(datanode_t dn);
size_t      dp_arrlen(datanode_t dn);
datanode_t  dp_arrelem(datanode_t dn, size_t i);
bool        dp_hasmemb(datanode_t dn, const char *k);
datanode_t  dp_objmemb(datanode_t dn, const char *k);
datanode_t  dp_lookup(datanode_t dn, const char *type);
datanode_t  dp_lookup_s(datanode_t dn, const char *type);

datafile_t dp_new(void);
char*      dp_dump(datafile_t *df);

datanode_t dp_set_arr(datafile_t *df);
void       dp_arr_appbool(datanode_t *dn, bool v);
void       dp_arr_appint(datanode_t *dn, int64_t v);
void       dp_arr_appuint(datanode_t *dn, uint64_t v);
void       dp_arr_appfloat(datanode_t *dn, double v);
void       dp_arr_appstring(datanode_t *dn, const char *v);
datanode_t dp_arr_apparray(datanode_t *dn);
datanode_t dp_arr_appobject(datanode_t *dn);

datanode_t dp_set_obj(datafile_t *df);
void       dp_obj_putbool(datanode_t *dn, const char *k, bool v);
void       dp_obj_putint(datanode_t *dn, const char *k, int64_t v);
void       dp_obj_putuint(datanode_t *dn, const char *k, uint64_t v);
void       dp_obj_putfloat(datanode_t *dn, const char *k, double v);
void       dp_obj_putstring(datanode_t *dn, const char *k, const char *v);
datanode_t dp_obj_putarray(datanode_t *dn, const char *k);
datanode_t dp_obj_putobject(datanode_t *dn, const char *k);

#ifdef __cplusplus
}
#endif

#endif // DATAPROC_H
