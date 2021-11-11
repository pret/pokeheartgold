#ifndef MSL_STDDEF_H_
#define MSL_STDDEF_H_

#ifdef __cplusplus
extern "C" {
#endif

typedef unsigned long size_t;

#define offsetof(type, field) ((size_t)&((type *)0)->field)

#ifdef __cplusplus
};
#endif

#endif //MSL_STDDEF_H_
