#ifndef POKEHEARTGOLD_UNK_02022588_H
#define POKEHEARTGOLD_UNK_02022588_H

#include "heap.h"

typedef struct ObjPlttTransferTaskTemplate {
    NNSG2dPaletteData *plttData;
    NNS_G2D_VRAM_TYPE vram;
    int plttNum;
    int id;
} ObjPlttTransferTaskTemplate;

void ObjPlttTransfer_Init(int num, HeapID heapId);
void ObjPlttTransfer_SetReservedRegion(u32 flag, NNS_G2D_VRAM_TYPE type);
void ObjPlttTransfer_Destroy(void);
void ObjPlttTransfer_Reset(void);
BOOL ObjPlttTransfer_CreateTaskAndDoTransferFromTemplate_HandleExtPltt(const ObjPlttTransferTaskTemplate *template);
BOOL ObjPlttTransfer_CreateTaskAndDoTransferFromTemplate_ExtPlttBanned(const ObjPlttTransferTaskTemplate *template);
void ObjPlttTransfer_CreateTransferTask(int resID, NNSG2dPaletteData *plttData);
void ObjPlttTransfer_FreeTaskByID(int resId);
NNSG2dImagePaletteProxy *ObjPlttTransfer_GetPlttProxyByID(int resID);
NNSG2dImagePaletteProxy *ObjPlttTransfer_GetPlttProxyByID_UpdateRefProxyExtFlag(int resID, NNSG2dImageProxy *imageProxy);
u32 ObjPlttTransfer_GetPaletteVramOffset(NNSG2dImagePaletteProxy *proxy, NNS_G2D_VRAM_TYPE vramType);

#endif // POKEHEARTGOLD_UNK_02022588_H
