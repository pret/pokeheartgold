#ifndef POKEHEARTGOLD_OBJ_CHAR_TRANSFER_H
#define POKEHEARTGOLD_OBJ_CHAR_TRANSFER_H

#include <nnsys.h>

#include "heap.h"

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
    BOOL atEnd;
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
void ObjCharTransfer_ClearBuffers(void);
void ObjCharTransfer_SetReservedRegion(u32 offset, u32 size, NNS_G2D_VRAM_TYPE vram);
BOOL ObjCharTransfer_CreateTaskAndDoTransferFromTemplate(const ObjCharTransferTaskTemplate *template);
BOOL ObjCharTransfer_CreateTaskAndDoTransferFromTemplate_UpdateMappingTypeFromHW(const ObjCharTransferTaskTemplate *template);
void ObjCharTransfer_ReplaceGraphicsFromChardataByResID(int id, NNSG2dCharacterData *charData);
void ObjCharTransfer_ResetTransferTasksByResID(int resId);
NNSG2dImageProxy *ObjCharTransfer_GetProxyPtrByResID(int resId);
NNSG2dImageProxy *ObjCharTransfer_ResizeTaskByResID_GetProxyPtr(int resId, u32 size);
NNSG2dImageProxy *ObjCharTransfer_CopyTransferTaskByProxyPtr(NNSG2dImageProxy *proxyIn);
void ObjCharTransfer_DeleteTaskCopyByProxyPtr(const NNSG2dImageProxy *proxy);
BOOL sub_02021AC8(u32 size, BOOL a1, NNS_G2D_VRAM_TYPE vram, UnkStruct_02021AC8 *a3);
void sub_02021B5C(UnkStruct_02021AC8 *a0);
ObjCharTransferTasksManager *ObjCharTransfer_PopTaskManager(void);
void ObjCharTransfer_PushTaskManager(ObjCharTransferTasksManager *taskManager);
int ObjCharTransfer_GetBlockSizeFromMode(GXOBJVRamModeChar mode);

#endif // POKEHEARTGOLD_OBJ_CHAR_TRANSFER_H
