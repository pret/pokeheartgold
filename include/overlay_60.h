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

typedef struct TitleScreenAnimObject {
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
    Camera *camera;
    int unk_B8;
} TitleScreenAnimObject; // size: 0xBC

typedef struct TitleScreenAnimData {
    u32 unk_000;
    TitleScreenAnimObject unk_004;
    TitleScreenAnimObject unk_0C0;
    u16 unk_17C;
    u8 filler_17E[0x2];
    Window window;
    VecFx32 unk_190;
    VecFx32 unk_19C;
    u32 unk_1A8;
    VecFx32 unk_1AC;
    VecFx32 unk_1B8;
    VecFx32 unk_1C4;
    VecFx32 unk_1D0;
    VecFx16 unk_1DC;
    VecFx16 unk_1E2;
    int unk_1E8;
    fx32 unk_1EC;
    int unk_1F0;
    int unk_1F4;
    int unk_1F8;
    int unk_1FC;
    int gameVersion;
    PaletteData *plttData;
    int unk_208;
    int unk_20C;
    int unk_210;
} TitleScreenAnimData;

typedef struct TitleScreenOverlayData {
    HeapID heapID;
    BgConfig *bgConfig;
    GF3DVramMan *_3dVramMan;
    u8 filler_0C[0xC0];
    TitleScreenAnimData unk_0CC;
    u16 exitMode;
    u8 filler_2E2[0x2];
    u32 unk_2E4;
    u8 filler_2E8[0x8];
    int timer;
    BOOL needMasterBrightnessNeutral;
} TitleScreenOverlayData; // size: 0x2F8

#endif //POKEHEARTGOLD_OVERLAY_60_H
