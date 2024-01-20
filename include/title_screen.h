#ifndef POKEHEARTGOLD_TITLE_SCREEN_H
#define POKEHEARTGOLD_TITLE_SCREEN_H

#include "heap.h"
#include "palette.h"
#include "bg_window.h"
#include "camera.h"
#include "gf_3d_vramman.h"
#include "overlay_manager.h"

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
    void *_3dResObjsArc[4];
    NNSG3dAnmObj *_3dAnmObjs[4];
    NNSFndAllocator allocator;
    VecFx32 translation;
    VecFx32 scale;
    VecFx32 rotationVec;
    Camera *camera;
    int unk_B8;
} TitleScreenAnimObject; // size: 0xBC

typedef struct TitleScreenAnimData {
    u32 unk_000;
    TitleScreenAnimObject hooh_lugia;
    TitleScreenAnimObject unk_0C0;
    u16 unk_17C;
    u8 filler_17E[0x2];
    Window window;
    VecFx32 cameraTarget;
    VecFx32 cameraPos;
    u32 unk_1A8;
    VecFx32 cameraPosStart;
    VecFx32 cameraPosEnd;
    VecFx32 cameraTargetStart;
    VecFx32 cameraTargetEnd;
    VecFx16 light0vec;
    VecFx16 light1vec;
    int unk_1E8;
    fx32 unused_1EC;
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
    TitleScreenAnimData animData;
    u16 exitMode;
    u8 filler_2E2[0x2];
    u32 initialDelay;
    u8 filler_2E8[0x8];
    int timer;
    BOOL needMasterBrightnessNeutral;
} TitleScreenOverlayData; // size: 0x2F8

extern const OVY_MGR_TEMPLATE gApplication_TitleScreen;

#endif //POKEHEARTGOLD_TITLE_SCREEN_H
