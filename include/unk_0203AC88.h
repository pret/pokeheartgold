#ifndef POKEHEARTGOLD_UNK_0203AC88_H
#define POKEHEARTGOLD_UNK_0203AC88_H

#include "global.h"

typedef s32 (*UnkFuncPtr_0203AC88)(void);
typedef void (*UnkFuncPtr_0203AC88_void)(void*, void*, void*, void*);

typedef struct UnkStruct_0203AC88 {
    UnkFuncPtr_0203AC88_void func1;
    UnkFuncPtr_0203AC88 func2;
    UnkFuncPtr_0203AC88 func3;
} UnkStruct_0203AC88;

const UnkStruct_0203AC88 *sub_0203AC88(void);
int sub_0203AC90(void);

#endif // POKEHEARTGOLD_UNK_0203AC88_H
