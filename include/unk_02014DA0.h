#ifndef POKEHEARTGOLD_UNK_02014DA0_H
#define POKEHEARTGOLD_UNK_02014DA0_H

#include "unk_02022D74.h"
#include "spl.h"

typedef struct UnkStruct_02014DA0 UnkStruct_02014DA0;

typedef u32 (*texAllocFun)(u32 szByte, BOOL is4x4comp);
typedef u32 (*plttAllocFun)(u32 szByte, BOOL is4pltt);

void sub_02014DA0(void);
UnkStruct_02014DA0 *sub_02014DB4(texAllocFun texAlloc, plttAllocFun plttAlloc, void *a2, u32 workSize, BOOL a4, HeapID heapId);
void sub_02014EBC(UnkStruct_02014DA0 *mgr);
UnkStruct_02022D74 *sub_02015524(void);
void *sub_02015264(int, u32, HeapID);
void sub_0201526C(UnkStruct_02014DA0 *mgr, void *, int, int);
void sub_02015354(NNSGfdTexKey texKey);
void sub_02015394(NNSGfdPlttKey plttKey);
void sub_02015494(UnkStruct_02014DA0 *mgr, int res_no, void (*fp_callback)(struct SPLEmitter *), void *arg);
BOOL sub_020154B0(void *);
void* sub_02015504(void);
int sub_0201543C(void);
void sub_02015460(void);
void *sub_020154D0(UnkStruct_02014DA0 *mgr);

#endif //POKEHEARTGOLD_UNK_02014DA0_H
