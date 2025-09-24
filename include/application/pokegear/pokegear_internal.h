#ifndef GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_POKEGEAR_INTERNAL_H
#define GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_POKEGEAR_INTERNAL_H

#include "global.h"

#include "mail_misc.h"
#include "unk_02092BE8.h"

typedef enum PokegearAppId {
    GEAR_APP_CONFIGURE,
    GEAR_APP_RADIO,
    GEAR_APP_MAP,
    GEAR_APP_PHONE,
    GEAR_APP_CANCEL,

    GEAR_APP_NO_INPUT = -1,
} PokegearAppId;

typedef enum PokegearReturnCode {
    GEAR_RETURN_CONFIGURE,
    GEAR_RETURN_RADIO,
    GEAR_RETURN_MAP,
    GEAR_RETURN_PHONE,
    GEAR_RETURN_4,
    GEAR_RETURN_5,
    GEAR_RETURN_CANCEL,
    GEAR_RETURN_7,
    GEAR_RETURN_8,
} PokegearReturnCode;

typedef struct Coord2S16 {
    s16 x;
    s16 y;
} Coord2S16;

// Used to save state when switching to the Easy Chat entry screen
typedef struct PokegearMapSessionState {
    u8 active;
    u8 zoomed;
    u16 index;
    u8 cursorTop;
    u8 cursorBottom;
    u8 cursorLeft;
    u8 cursorRight;
    u16 playerX;
    u16 playerY;
    s16 cursorSpriteX;
    s16 cursorSpriteY;
    s16 cursorAffineX;
    s16 cursorAffineY;
    s16 cursorX;
    s16 cursorY;
    u16 mapID;
    u16 word;
} PokegearMapSessionState; // size: 0x1C

typedef struct PokegearCursorGrid {
    u16 appId;
    u8 buttonLeft;
    u8 buttonRight;
    u8 buttonUp;
    u8 buttonDown;
    u8 x;
    u8 y;
    s8 leftOffset;
    s8 rightOffset;
    s8 topOffset;
    s8 bottomOffset;
} PokegearCursorGrid;

typedef union PokegearSpriteUnion {
    ManagedSprite *managed;
    Sprite *unmanaged;
    void *raw;
} PokegearSpriteUnion;

typedef struct PokegearCursor {
    u8 active : 1;
    u8 buttonsAreManagedSprite : 1;
    u8 buttonsAre4Tiles : 1;
    u8 cursorPos;
    u8 count;
    u8 lastIndex;
    PokegearCursorGrid *grid;
    u8 filler_08[0x8];
    PokegearSpriteUnion cursorSprites[4];
} PokegearCursor;

typedef struct PokegearCursorManager {
    u16 count;
    u16 activeCursorIndex;
    PokegearCursor *cursors;
    PokegearCursor *lastCursor;
} PokegearCursorManager;

typedef struct PokegearManagedObject {
    u8 active;              // 0x00
    u8 autoCull;            // 0x01
    u16 autoUpdateDisabled; // 0x02
    Coord2S16 pos;          // 0x04
    s16 destX;              // 0x08
    s16 destY;              // 0x0A
    u16 unk_0C;             // 0x0C
    u16 unk_0E;             // 0x0E
    fx32 unk_10;            // 0x10
    fx32 unk_14;            // 0x14
    fx32 unk_18;            // 0x18
    fx32 unk_1C;            // 0x1C
    Sprite *sprite;         // 0x20
    u8 filler_24[0x4];      // 0x24
} PokegearManagedObject;

typedef struct PokegearObjectsManager {
    u16 max;
    u16 num;
    u8 filler_4[4];
    PokegearManagedObject *objects;
} PokegearObjectsManager;

typedef struct PokegearUIManager {
    enum HeapID heapID;
    int mode;
    u16 unk_008; // unused
    u16 plttCount;
    u16 spriteCount;
    u16 vramType;
    SpriteList *spriteList;
    G2dRenderer renderer;
    u8 filler_13C[4];
    GF_2DGfxResMan *resourceManagers[4];
    GF_2DGfxResObjList *spriteResources[4];
} PokegearUIManager; // size: 0x160

typedef struct PokegearAppData PokegearAppData;
struct PokegearAppData {
    enum HeapID heapID;                          // 0x000
    u8 app;                                      // 0x004
    u8 registeredCards : 7;                      // 0x005
    u8 isSwitchApp : 1;                          // 0x005
    u8 cursorInAppSwitchZone;                    // 0x006
    u8 needClockUpdate;                          // 0x007
    u8 skin;                                     // 0x008
    u8 fadeCounter;                              // 0x009
    MenuInputState menuInputState;               // 0x00C
    MenuInputState menuInputStateBak;            // 0x010
    u8 filler_014[4];                            // 0x014
    int substate;                                // 0x018
    int appReturnCode;                           // 0x01C
    PokegearArgs *args;                          // 0x020
    SaveData *saveData;                          // 0x024
    SavePokegear *savePokegear;                  // 0x028
    SaveVarsFlags *saveVarsFlags;                // 0x02C
    Options *options;                            // 0x030
    PlayerProfile *profile;                      // 0x034
    u8 unk_038;                                  // 0x038
    u8 filler_039[3];                            // 0x039 needed to align mapSessionState to word
    PokegearMapSessionState mapSessionState;     // 0x03C
    void (*vblankCB)(PokegearAppData *, void *); // 0x058
    void (*reselectAppCB)(void *);               // 0x05C
    void (*deselectAppCB)(void *);               // 0x060
    void *childAppdata;                          // 0x064
    u8 filler_068[4];                            // 0x068
    EasyChatArgs *easyChatArgs;                  // 0x06C
    OverlayManager *childApplication;            // 0x070
    BgConfig *bgConfig;                          // 0x074
    PaletteData *plttData;                       // 0x078
    PokegearCursorManager *cursorManager;        // 0x07C
    RTCTime time;                                // 0x080
    SpriteSystem *spriteSystem;                  // 0x08C
    SpriteManager *spriteManager;                // 0x090
    PokegearUIManager *uiManager;                // 0x094
    ManagedSprite *uiSprites[11];                // 0x098
    u16 *appIconNSCR;                            // 0x0C4
    NNSG2dScreenData *appIconScreenData;         // 0x0C8
}; // size: 0xCC

typedef enum PokegearRegion {
    POKEGEAR_REGION_KANTO,
    POKEGEAR_REGION_INDIGO,
    POKEGEAR_REGION_JOHTO,
} PokegearRegion;

PokegearRegion Pokegear_RegionFromCoords(u16 x, u16 y);
int Pokegear_GetCurrentRegion(PokegearAppData *pokegearApp);
BOOL PokegearApp_HandleInputModeChangeToButtons(PokegearAppData *pokegearApp);
int PokegearApp_HandleTouchInput_SwitchApps(PokegearAppData *pokegearApp);
int PokegearApp_HandleKeyInput_SwitchApps(PokegearAppData *pokegearApp);
BOOL PokegearApp_UpdateClockSprites(PokegearAppData *pokegearApp, BOOL force);
void Pokegear_ClearAppBgLayers(PokegearAppData *pokegearApp);
BOOL Pokegear_RunFadeLayers123(PokegearAppData *pokegearApp, int direction);
u8 PokegearApp_AppIdToButtonIndex(PokegearAppData *pokegearApp);
BOOL PokegearApp_LoadGFX(PokegearAppData *pokegearApp);
BOOL PokegearApp_UnloadGFX(PokegearAppData *pokegearApp);
void PokegearApp_LoadSkinGraphics(PokegearAppData *pokegearApp, u8 skin);
void PokegearApp_SetGraphicsBanks(void);

void PokegearApp_VBlankCB(void *cb_args);

void PokegearApp_CreateSpriteSystem(PokegearAppData *pokegearApp);
void PokegearApp_DestroySpriteSystem(PokegearAppData *pokegearApp);
void PokegearApp_CreateSpriteManager(PokegearAppData *pokegearApp, int spriteSet);
void PokegearApp_DestroySpriteManager(PokegearAppData *pokegearApp);
void PokegearApp_DrawSprites(PokegearAppData *pokegearApp);

PokegearUIManager *PokegearUIManager_Create(enum HeapID heapID, u16 spriteCount, u16 resCount, u16 skin, u16 vramType, int mode);
void PokegearUIManager_Delete(PokegearUIManager *uiManager);
void PokegearUIManager_LoadSkinGfx(PokegearUIManager *uiManager, u8 skin);
void PokegearUIManager_AnimateSprites(PokegearUIManager *uiManager);
ManagedSprite *PokegearUIManager_CreateSprite(PokegearUIManager *uiManager, u8 x, u8 y, u8 z, u8 priority, u8 drawPriority, u8 index, u8 seq, int isBottomScreen);
void PokegearUIManager_DeleteSprite(ManagedSprite *managedSprite);

PokegearObjectsManager *PokegearObjectsManager_Create(int count, enum HeapID heapID);
void PokegearObjectsManager_Release(PokegearObjectsManager *mgr);
void PokegearObjectsManager_UpdateAllSpritesPos(PokegearObjectsManager *mgr);
u16 PokegearObjectsManager_AppendSprite(PokegearObjectsManager *mgr, Sprite *sprite);
void PokegearObjectsManager_Reset(PokegearObjectsManager *mgr);
void PokegearObjectsManager_DeleteSpritesFromIndexToEnd(PokegearObjectsManager *mgr, u8 firstIndex);

PokegearCursorManager *PokegearCursorManager_Alloc(int count, enum HeapID heapID);
void PokegearCursorManager_Free(PokegearCursorManager *cursorManager);
u16 PokegearCursorManager_AddButtons(PokegearCursorManager *cursorManager, const PokegearCursorGrid *buttonSpec, u8 numSpecs, u8 cursorPos, BOOL managedSprites, enum HeapID heapID, void *cursorSprite1, void *cursorSprite2, void *cursorSprite3, void *cursorSprite4);
BOOL PokegearCursorManager_RemoveCursor(PokegearCursorManager *cursorManager, u16 cursorIndex);
u16 PokegearCursorManager_SetCursorSpritesDrawState(PokegearCursorManager *cursorManager, u16 index, BOOL draw);
u16 PokegearCursorManager_SetSpecIndexAndCursorPos(PokegearCursorManager *cursorManager, u16 index, u8 cursorPos);
u8 PokegearCursorManager_GetCursorPos(PokegearCursorManager *cursorManager);
u8 PokegearCursorManager_GetSpecCursorPos(PokegearCursorManager *cursorManager, u16 index);
u8 PokegearCursorManager_MoveActiveCursor(PokegearCursorManager *cursorManager, u8 move);
u8 PokegearCursorManager_SetActiveCursorPosition(PokegearCursorManager *cursorManager, u8 newIndex);
void PokegearCursorManager_SetCursorSpritesAnimateFlag(PokegearCursorManager *cursorManager, u16 index, BOOL active);

static inline void PokegearManagedObject_SetCoordUpdateSprite(PokegearManagedObject *obj, s16 x, s16 y) {
    obj->pos.x = x;
    obj->pos.y = y;
    Sprite_SetPositionXY(obj->sprite, obj->pos.x, obj->pos.y);
}

static inline void PokegearManagedObject_SetCoord(PokegearManagedObject *obj, s16 x, s16 y) {
    obj->pos.x = x;
    obj->pos.y = y;
}

static inline void PokegearManagedObject_SetCoord2(PokegearManagedObject *obj, s16 x, s16 y) {
    obj->unk_0C = x;
    obj->unk_0E = y;
}

static inline void PokegearManagedObject_AddCoord(PokegearManagedObject *obj, s16 x, s16 y) {
    obj->pos.x += x;
    obj->pos.y += y;
}

static inline void PokegearManagedObject_SetAutoCullingFlag(PokegearManagedObject *obj, BOOL autoCull) {
    obj->autoCull = autoCull;
}

static inline void PokegearManagedObject_SetFixCoords(PokegearManagedObject *obj, s16 x, s16 y) {
    obj->unk_10 = FX32_CONST(x);
    obj->unk_14 = FX32_CONST(y);
}

static inline void PokegearManagedObject_SetPriority(PokegearManagedObject *obj, int priority) {
    thunk_Sprite_SetDrawPriority(obj->sprite, priority);
}

#endif // GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_POKEGEAR_INTERNAL_H
