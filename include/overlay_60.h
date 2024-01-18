#ifndef POKEHEARTGOLD_OVERLAY_60_H
#define POKEHEARTGOLD_OVERLAY_60_H

#include "heap.h"
#include "palette.h"
#include "bg_window.h"
#include "camera.h"
#include "gf_3d_vramman.h"

FS_EXTERN_OVERLAY(OVY_60);

typedef enum TitleScreenExitMode {
    TITLESCREEN_EXIT_UNSET,
    TITLESCREEN_EXIT_MENU,
    TITLESCREEN_EXIT_CLEARSAVE,
    TITLESCREEN_EXIT_TIMEOUT,
    TITLESCREEN_EXIT_UNUSED,
    TITLESCREEN_EXIT_MIC_TEST,
} TitleScreenExitMode;

typedef struct TitleScreenAnimDataSub {
    int unk_00;
    NNSG3dRenderObj renderObj;
    NNSG3dResMdl *resModel;
    NNSG3dResFileHeader *resFileHeader;
    void *unk_60[4];
    NNSG3dAnmObj *unk_70[4];
    NNSFndAllocator allocator;
    VecFx32 translation;
    VecFx32 scale;
    VecFx32 unk_A8;
    Camera *unk_B4;
    int unk_B8;
} TitleScreenAnimDataSub; // size: 0xBC

typedef struct TitleScreenAnimData {
    u32 unk_000;
    TitleScreenAnimDataSub unk_004;
    TitleScreenAnimDataSub unk_0C0;
    u8 filler_17C[0x14];
    VecFx32 unk_190;
    VecFx32 unk_19C;
    u32 unk_1A8;
    VecFx32 unk_1AC;
    VecFx32 unk_1B8;
    VecFx32 unk_1C4;
    u8 filler_1D0[0xC];
    VecFx16 unk_1DC;
    VecFx16 unk_1E2;
    u8 filler_1E8[0x10];
    u32 unk_1F8;
    u32 unk_1FC;
    u32 gameVersion;
    PaletteData *plttData;
    u32 unk_208;
} TitleScreenAnimData;

typedef struct TitleScreenOverlayData {
    HeapID heapID;
    BgConfig *bgConfig;
    GF3DVramMan *_3dVramMan;
    u8 filler_0C[0xC0];
    TitleScreenAnimData unk_0CC;
    u8 filler_2D8[0x8];
    u16 exitMode;
    u8 filler_2E2[0x2];
    u32 unk_2E4;
    u8 filler_2E8[0x8];
    int timer;
    BOOL needMasterBrightnessNeutral;
} TitleScreenOverlayData; // size: 0x2F8

#endif //POKEHEARTGOLD_OVERLAY_60_H
