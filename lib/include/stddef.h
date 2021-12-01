#ifndef MSL_STDDEF_H_
#define MSL_STDDEF_H_

#include <size_t.h>

_MSL_BEGIN_NAMESPACE_STD
_MSL_BEGIN_EXTERN_C

#define offsetof(type, field) ((size_t)&((type *)0)->field)

_MSL_END_EXTERN_C
_MSL_END_NAMESPACE_STD

#endif //MSL_STDDEF_H_
