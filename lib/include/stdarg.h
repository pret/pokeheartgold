#ifndef MSL_STDARG_H
#define MSL_STDARG_H

#ifdef __cplusplus
namespace std {
extern "C" {
#endif

#ifndef _MSL_VA_LIST_TYPE
#define _MSL_VA_LIST_TYPE char*
#endif //_MSL_VA_LIST_TYPE
#ifndef _MSL_VA_LIST_DEFINED
typedef _MSL_VA_LIST_TYPE va_list;
#define _MSL_VA_LIST_DEFINED
#endif

#define va_start(list, arg) ({ list = (va_list)(((u32)&(arg) & ~3) + 4); })
#define va_end(list)        ((void)0)

#ifdef __cplusplus
}
}
#endif

#endif //MSL_STDARG_H
