#ifndef POKEHEARTGOLD_OBJ_CHAR_TRANSFER_H
#define POKEHEARTGOLD_OBJ_CHAR_TRANSFER_H

#include "heap.h"
#include <nnsys.h>

typedef struct ObjCharTransferTemplate {
    int maxTasks;
    u32 sizeMain;
    u32 sizeSub;
    HeapID heapId;
} ObjCharTransferTemplate;

typedef struct UnkStruct_02021758 {
    NNSG2dCharacterData *charData;
    NNS_G2D_VRAM_TYPE vram;
    int id;
    BOOL unk_0C;
} ObjCharTransferTaskTemplate;

typedef struct UnkStruct_02021AC8 {
    u32 size;
    u32 offset;
    u16 vram;
    u16 unk_0A;
} UnkStruct_02021AC8;

typedef struct ObjCharTransferTasksManager ObjCharTransferTasksManager;

void ObjCharTransfer_Init(ObjCharTransferTemplate *template);
void ObjCharTransfer_InitEx(ObjCharTransferTemplate *template, GXOBJVRamModeChar modeMain, GXOBJVRamModeChar modeSub);
void ObjCharTransfer_Destroy(void);
void sub_020216C8(void);
void sub_020216F4(u32 a0, u32 a1, NNS_G2D_VRAM_TYPE vram);
BOOL sub_02021758(const ObjCharTransferTaskTemplate *a0);
BOOL sub_020217B0(const ObjCharTransferTaskTemplate *a0);
void sub_0202183C(int id, NNSG2dCharacterData *charData);
void sub_02021884(int resId);
NNSG2dImageProxy *sub_02021910(int resId);
NNSG2dImageProxy *sub_02021934(int resId, u32 size);
NNSG2dImageProxy *sub_020219B8(NNSG2dImageProxy *proxyIn);
void sub_02021A50(const NNSG2dImageProxy *proxy);
BOOL sub_02021AC8(u32 size, BOOL a1, NNS_G2D_VRAM_TYPE vram, UnkStruct_02021AC8 *a3);
void sub_02021B5C(UnkStruct_02021AC8 *a0);
ObjCharTransferTasksManager *sub_02021BD0(void);
void sub_02021BEC(ObjCharTransferTasksManager *a0);
int ObjCharTransfer_GetBlockSizeFromMode(GXOBJVRamModeChar mode);

#endif //POKEHEARTGOLD_OBJ_CHAR_TRANSFER_H
