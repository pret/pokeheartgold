#include "overlay_06.h"

#include "global.h"

#include "palette.h"
#include "unk_02026E30.h"

const u16 *ov06_0221BA00(int param_1) {
    if (param_1 != -1) {
        return ov06_0221BDD0[param_1];
    }
    return ov06_0221BB6C;
}

void ov06_0221BA1C(PaletteData *palData, int param_2, int unused, PaletteBufferId bufferId, u32 paletteSlot) {
    const u16 *srcData = ov06_0221BA00(param_2);

    PaletteData_LoadPalette(palData, srcData, bufferId, paletteSlot * 16, 32);
}

SPLEmitter *ov06_0221BA40(enum HeapID heapID) {
    void *particleHeap;
    SPLEmitter *pPVar1;
    Camera *pGVar2;

    particleHeap = Heap_Alloc(heapID, 0x4800);
    pPVar1 = sub_02014DB4(ov06_0221BB14, ov06_0221BB30, particleHeap, 0x4800, TRUE, heapID);
    pGVar2 = sub_02015524(pPVar1);
    if (pGVar2 != NULL) {
        Camera_SetPerspectiveClippingPlane(1 * FX32_ONE, 900 * FX32_ONE, pGVar2);
    }
    return pPVar1;
}

SPLEmitter *ov06_0221BA88(enum HeapID heapID) {
    void *particleHeap;
    SPLEmitter *pPVar1;
    Camera *pGVar2;

    particleHeap = Heap_Alloc(heapID, 0x4200);
    if (particleHeap == NULL) {
        return NULL;
    }
    pPVar1 = sub_02014DB4(ov06_0221BB14, ov06_0221BB30, particleHeap, 0x4200, TRUE, heapID);
    pGVar2 = sub_02015524(pPVar1);
    if (pGVar2 != NULL) {
        Camera_SetPerspectiveClippingPlane(1 * FX32_ONE, 900 * FX32_ONE, pGVar2);
    }
    return pPVar1;
}

void ov06_0221BAD8(SPLEmitter *param_1) {
    void *pvVar1;

    pvVar1 = sub_020154D0(param_1);
    sub_02014EBC(param_1);
    Heap_Free(pvVar1);
}

void ov06_0221BAF0(void) {
    int iVar1;

    Thunk_G3X_Reset();
    iVar1 = sub_02015420();
    if (iVar1) {
        iVar1 = sub_0201543C();
        if (iVar1 > 0) {
            Thunk_G3X_Reset();
            NNS_G2dSetupSoftwareSpriteCamera();
        }
        sub_02015460();
    }
}

u32 ov06_0221BB14(u32 szByte, BOOL is4x4comp) {
    NNSGfdTexKey texKey;

    texKey = NNS_GfdDefaultFuncAllocTexVram(szByte, is4x4comp, 0);
    sub_02015354(texKey);
    return (texKey << 16) >> 13;
}

u32 ov06_0221BB30(u32 szByte, BOOL is4pltt) {
    NNSGfdPlttKey plttKey;

    plttKey = NNS_GfdDefaultFuncAllocPlttVram(szByte, is4pltt, 0);
    sub_02015394(plttKey);
    return (plttKey << 16) >> 13;
}
