#ifndef TYPES_H
#define TYPES_H

// Nitro types
// <nitro/types.h>
typedef unsigned char u8;
typedef unsigned short int u16;
typedef unsigned long u32;
typedef signed char s8;
typedef signed short int s16;
typedef signed long s32;
typedef unsigned long long int u64;
typedef signed long long int s64;
typedef volatile u8 vu8;
typedef volatile u16 vu16;
typedef volatile u32 vu32;
typedef volatile u64 vu64;
typedef volatile s8 vs8;
typedef volatile s16 vs16;
typedef volatile s32 vs32;
typedef volatile s64 vs64;
typedef float f32;
typedef volatile f32 vf32;
typedef u8 REGType8;
typedef u16 REGType16;
typedef u32 REGType32;
typedef u64 REGType64;
typedef vu8 REGType8v;
typedef vu16 REGType16v;
typedef vu32 REGType32v;
typedef vu64 REGType64v;
typedef int BOOL;
#define TRUE   (1)
#define FALSE  (0)
#define NULL  ((void*)0)

#endif
