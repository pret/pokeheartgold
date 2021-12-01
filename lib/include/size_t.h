#ifndef _MSL_SIZE_T_H
#define _MSL_SIZE_T_H

#include <ansi_params.h>

_MSL_BEGIN_NAMESPACE_STD
_MSL_BEGIN_EXTERN_C

typedef __typeof__(sizeof(0)) size_t;

_MSL_END_EXTERN_C
_MSL_END_NAMESPACE_STD

#endif //_MSL_SIZE_T_H
