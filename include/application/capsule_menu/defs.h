#ifndef GUARD_APPLICATION_CAPSULE_MENU_DEFS_H
#define GUARD_APPLICATION_CAPSULE_MENU_DEFS_H

#include "application/capsule_menu/capsule_menu.h"
#include "battle/battle.h"

#include "bg_window.h"
#include "gf_3d_vramman.h"
#include "menu_input_state.h"
#include "obj_char_transfer.h"
#include "overlay_07.h"
#include "pokepic.h"
#include "seal_case.h"
#include "sprite_system.h"
#include "touch_hitbox_controller.h"
#include "touchscreen_list_menu.h"
#include "unk_02013534.h"
#include "unk_02016EDC.h"
#include "yes_no_prompt.h"

#define SEALS_PER_PAGE                8
#define CAPSULE_TOUCH_RECTS           21
#define CAPSULE_SELECTION_ARROWS      4
#define CAPSULE_MENU_WINDOW_NUM       13
#define CAPSULE_MENU_EMPTY_CAPSULE    0
#define CAPSULE_MENU_HAS_SEALS        1
#define CAPSULE_MENU_HAS_POKEMON      2
#define CAPSULE_MENU_UNREACHABLE_CASE 3

typedef struct IndexedCapsule {
    int partyIdx;
    BallCapsule *capsule;
} IndexedCapsule;

typedef struct CapsuleSprites {
    int pokemonIndex;
    int animIdx;
    ManagedSprite *sprite;
} CapsuleSprites;

typedef struct SealPages {
    int page;
    int maxPage;
    u8 sealIDs[SEALS_PER_PAGE];
} SealPages;

typedef struct CapsuleGraphicsManager {
    int index;
    int selectedCapsule;
    SpriteSystem *spriteSystem;
    SpriteManager *spriteManager;
    BgConfig *bgConfig;
    PaletteData *paletteData;
    Window windows[CAPSULE_MENU_WINDOW_NUM];
    ListMenuItem *listMenuItems;
    u8 filler_0EC[4];
    PokepicManager *pokepicManager;
    Pokepic *pokepic;
    int pokepicYOffset;
    u8 filler_0FC[28];
    TouchHitboxController *touchHitboxController;
    TouchscreenHitbox touchscreenHitboxes[21];
    YesNoPrompt *yesNoPrompt;
    TouchscreenListMenuSpawner *touchscreenListMenuSpawner;
    TouchscreenListMenu *touchScreenListMenu;
    BallCapsuleSealEffect *sealEffect;
    UnkBallData *ballRotation;
    GF3DVramMan *gf3dVramMan;
    UnkStruct_02013534 *fontOAMManager;
    TextOBJ *fontOAM[2];
    UnkStruct_02021AC8 charTransfer[2];
    BOOL graphicsTaskResult;
    UnkStruct_02016EDC *pokepicAnimManager;
    BOOL sealsChanged;
} CapsuleGraphicsManager;

typedef struct SealRenderInfo {
    BOOL shouldRender;
    u8 type;
    u8 x;
    u8 y;
    u8 unk_7;
    ManagedSprite *sprite;
    TouchscreenHitbox *touchscreenHitbox;
} SealRenderInfo;

typedef struct CapsuleAppManager {
    CapsuleAppData *appData;
    IndexedCapsule capsules[MAX_CAPSULES];
    SealCounts *sealCount;
    BallCapsule activeCapsule;
    u8 sealCounts[SEAL_MAX + 1];
    CapsuleGraphicsManager graphicsMan;
    CapsuleSprites capsuleSprites[MAX_CAPSULES];
    ManagedSprite *cursor[2];
    ManagedSprite *pokemonSprites[PARTY_SIZE];
    ManagedSprite *selectionIndicator[CAPSULE_SELECTION_ARROWS];
    SealRenderInfo sealRenderInfo[MAX_SEALS_ON_CAPSULE];
    u8 filler_3CC[0x20];
    int capsuleIndex[2];
    int funcIndex;
    int unk_3F8;
    int stateID;
    int alternateState;
    int throwStateID;
    YesNoResponse yesNoResult;
    MenuInputState menuInputState;
    int frameCounter;
    ManagedSprite *pageSprites[13];
    SealPages sealPages;
    Pokemon *pokemon;
    NARC *narc;
} CapsuleAppManager; // size: 0x460

typedef struct UnkStruct_ov57_0223BECC {
    s32 index;
    BOOL (*func)(CapsuleAppManager *appMan);
} UnkStruct_ov57_0223BECC;

extern const UnkStruct_ov57_0223BECC ov57_0223BECC[];

void ov57_02237CA8(enum HeapID heapId);
void ov57_02237CDC(enum HeapID heapId);
void ov57_02237CEC(BgConfig *bgConfig);
void ov57_02237E38(void *cbArg);
u8 ov57_02237E78(CapsuleAppData *appData);
void ov57_02237E80(CapsuleAppData *appData, u8 a1);
void ov57_02237E88(CapsuleAppData *appData, u8 a1);

void SealPlacement_UpdateSealTouchRect(TouchscreenHitbox *rect, ManagedSprite *sprite, BOOL touchingSprite);
void SealPlacement_OffsetSeals(CapsuleAppManager *appManager);
void SealPlacement_UpdateSealsFromCapsule(CapsuleAppManager *appManager);
int SealPlacement_GetTouchedSeal(CapsuleAppManager *appMan, u8 sealIndex);
BOOL SealPlacement_NotMaxSeals(CapsuleAppManager *appMan);
void SealPlacement_UpdateSeals(CapsuleAppManager *appMan);
BOOL SealPlacement_HandleTouchscreen(CapsuleAppManager *appMan, u32 touchscreenState, u8 index);
void SealPlacement_FreeInactiveSeals(CapsuleAppManager *appMan);
void SealPlacement_DrawActiveSeals(CapsuleAppManager *appMan, int flag);
BOOL SealPlacement_SealIsValid(CapsuleAppManager *appMan, int index);
void SealPlacement_FreeSeal(CapsuleAppManager *appMan, int sealIndex);
void SealPlacement_UpdateSealOamMode(CapsuleAppManager *appMan, int index);
BOOL SealPlacement_AnySealsChanged(CapsuleAppManager *appMan);
void SealPlacement_UpdateSealXY(CapsuleAppManager *appMan, int sealIndex);
void SealPlacement_LoadCapsuleSeals(CapsuleAppManager *appMan);
void SealPlacement_GetCapsuleSeals(BallCapsule *capsule, CapsuleAppManager *appMan);

GF3DVramMan *CapsuleGraphics_PipelineInit(void);
void ov57_022385DC(CapsuleAppManager *appManager);
void ov57_0223864C(CapsuleAppManager *appManager);
void ov57_0223866C(CapsuleAppManager *appManager, BOOL show);
void CapsuleGraphics_InitFontOAMManager(CapsuleAppManager *appMan);
void CapsuleGraphics_FreeFonts(CapsuleAppManager *appMan);
void ov57_02238794(CapsuleAppManager *appMan);
void ov57CapsuleGraphics_SetFontOAMDrawFlag022387C0(CapsuleAppManager *appMan, BOOL flag);
void CapsuleGraphics_PopulateSealPage(CapsuleAppManager *appMan, int pageCutoff);
void CapsuleGraphics_LoadPageSprites(CapsuleAppManager *appMan);
void CapsuleGraphics_InitPageSprites(CapsuleAppManager *appMan);
void CapsuleGraphics_FreePageSprites(CapsuleAppManager *appMan);
void ov57_02238AF0(CapsuleAppManager *appMan, s16 a1);
void CapsuleGraphics_AllocTexPlttVram(void);
void CapsuleGraphics_SwapBuffers(void);
void CapsuleGraphics_OpenCapsuleSelectionMenu(BgConfig *bgConfig, Window *window, int bgLayer, CapsuleAppManager *appMan, int capsuleIndex);
void ov57_02238D80(CapsuleAppManager *appMan);
void CapsuleGraphics_GetCapsuleGridLocation(int index, s16 *x, s16 *y);
void CapsuleGraphics_LoadPokemonIcons(CapsuleAppManager *appMan);
void CapsuleGraphics_InitPokemonIcons(CapsuleAppManager *appMan);
void CapsuleGraphics_SetPokemonSpritesPosition(CapsuleAppManager *appMan);
void CapsuleGraphics_TickPokemonSprites(CapsuleAppManager *appMan);
void CapsuleGraphics_FreePokemonSprites(CapsuleAppManager *appMan);
void CapsuleGraphics_AssignCapsules(CapsuleAppManager *appMan);
void CapsuleGraphics_InitSpriteManager(CapsuleGraphicsManager *unk_0D4);
void CapsuleGraphics_FreeSpriteSystem(CapsuleGraphicsManager *unk_0D4);
void CapsuleGraphics_LoadSelectionResources(CapsuleAppManager *appMan, NARC *narc);
void CapsuleGraphics_InitSelectionIndicator(CapsuleAppManager *appMan);
void CapsuleGraphics_TickSelectionIndicator(CapsuleAppManager *appMan);
void CapsuleGraphics_SetSelectionIndicatorDrawFlags(CapsuleAppManager *appMan, int flag);
void CapsuleGraphics_FreeSelectionIndicator(CapsuleAppManager *appMan);
void CapsuleGraphics_InitCapsuleSprites(CapsuleAppManager *appMan, NARC *narc);
void CapsuleGraphics_SetCapsuleSpriteAnim(CapsuleAppManager *appMan);
void CapsuleGraphics_SwapCapsules(CapsuleAppManager *appMan, int capsuleIdx1, int capsuleIdx2);
void CapsuleGraphics_TickCursor(CapsuleAppManager *appMan);
void CapsuleGraphics_FreeCapsuleSprites(CapsuleAppManager *appMan);
void CapsuleGraphics_LoadMainWindow(BgConfig *bgConfig, PaletteData *paletteData, int messageBoxFrame);
void CapsuleGraphics_LoadSubWindow(BgConfig *bgConfig, PaletteData *paletteData, int messageBoxFrame);
void CapsuleGraphics_PrintMessage(Window *window, int frame, int entryID, BOOL drawFrame);
void CapsuleGraphics_InitMessageWindow(BgConfig *bgConfig, Window *window, int bgLayer, int tilemapLeft, int tilemapTop, int width, int height, int baseTile);
void CapsuleGraphics_InitWindows(CapsuleAppManager *appMan);
void CapsuleGraphics_UpdateAllSealCountText(CapsuleAppManager *appMan);
void CapsuleGraphics_UpdateSealCountText(CapsuleAppManager *appMan, int index);
void CapsuleGraphics_FreeSealCountWindows(CapsuleAppManager *appMan);
void CapsuleGraphics_UpdateSealNameText(Window *window, int entryID);
void CapsuleGraphics_StartDisplay(void);
void CapsuleGraphics_FadeIn(void);
void CapsuleGraphics_FadeOut(void);
void CapsuleGraphics_LoadBgLayer2Tilemap(CapsuleAppManager *appMan, NARC *narc);
void CapsuleGraphics_LoadBgLayer5Tilemap(CapsuleAppManager *appMan, NARC *narc);
void CapsuleGraphics_LoadBgLayer7Tilemap(CapsuleAppManager *appMan, NARC *narc);
void CapsuleGraphics_LoadCapsuleUI(CapsuleAppManager *appMan, NARC *narc);
void CapsuleGraphics_InitCapsuleUI(CapsuleAppManager *appMan);
void CapsuleGraphics_SetPageSpritesDrawFlag(CapsuleAppManager *appMan, int flag);
void CapsuleGraphics_Dummy(CapsuleAppManager *appMan);
void CapsuleGraphics_FreeUISprites(CapsuleAppManager *appMan);

int ov57_0223A07C(BallCapsule *capsule);
int ov57_0223A0A8(CapsuleAppManager *appMan, int capsuleIndex);
BOOL ov57_0223A0E0(CapsuleAppManager *appMan);
void ov57_0223AEA8(u32 index, u32 event, void *arg);
void ov57_0223BB84(CapsuleAppManager *appMan);
void ov57_0223BB5C(void);
void ov57_0223BC4C(CapsuleAppManager *appMan, int capsuleIndex);

#endif // GUARD_APPLICATION_CAPSULE_MENU_DEFS_H
