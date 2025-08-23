#ifndef POKEHEARTGOLD_TITLE_SCREEN_H
#define POKEHEARTGOLD_TITLE_SCREEN_H

#include "bg_window.h"
#include "camera.h"
#include "gf_3d_vramman.h"
#include "heap.h"
#include "overlay_manager.h"
#include "palette.h"

FS_EXTERN_OVERLAY(intro_title);

typedef enum TitleScreenExitMode {
    TITLESCREEN_EXIT_UNSET,
    TITLESCREEN_EXIT_MENU,
    TITLESCREEN_EXIT_CLEARSAVE,
    TITLESCREEN_EXIT_TIMEOUT,
    TITLESCREEN_EXIT_UNUSED,
    TITLESCREEN_EXIT_MIC_TEST,
} TitleScreenExitMode;

typedef struct TitleScreenAnimObject {
    int state;
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
    int subState;
} TitleScreenAnimObject; // size: 0xBC

typedef struct TitleScreenAnimData {
    u32 state;
    TitleScreenAnimObject hooh_lugia;
    TitleScreenAnimObject sparkles;
    u16 startInstructionFlashTimer;
    u8 filler_17E[0x2];
    Window window;
    VecFx32 cameraTarget;
    VecFx32 cameraPos;
    u32 enableStartInstructionFlash;
    VecFx32 cameraPosStart;
    VecFx32 cameraPosEnd;
    VecFx32 cameraTargetStart;
    VecFx32 cameraTargetEnd;
    VecFx16 light0Vec;
    VecFx16 light1Vec;
    int unk_1E8;
    fx32 cameraSpeed;
    int cameraScene;
    int cameraSceneTimer;
    int gameTitleFadeInTimer;
    int gameTitleDelayTimer;
    int gameVersion;
    PaletteData *plttData;
    int glowState;
    int glowTimer;
    int glowFadeStep;
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

extern const OverlayManagerTemplate gApplication_TitleScreen;

#endif // POKEHEARTGOLD_TITLE_SCREEN_H
