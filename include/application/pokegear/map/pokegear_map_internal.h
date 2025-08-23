#ifndef POKEHEARTGOLD_APPLICATION_POKEGEAR_MAP_POKEGEAR_MAP_INTERNAL_H
#define POKEHEARTGOLD_APPLICATION_POKEGEAR_MAP_POKEGEAR_MAP_INTERNAL_H

#include "constants/roamer.h"

#include "application/pokegear/pokegear_internal.h"

#include "obj_char_transfer.h"
#include "safari_zone.h"
#include "touchscreen_list_menu.h"
#include "unk_02013534.h"

#define PGMAP_NUM_FLYPOINTS 27
#define PGMAP_NUM_LOCATIONS 100

#ifndef max
#define max(a, b) ((a) < (b) ? (b) : (a))
#endif

typedef enum PokegearMapMainState {
    PGMAP_MAIN_STATE_LOAD,
    PGMAP_MAIN_STATE_HANDLE_INPUT,
    PGMAP_MAIN_STATE_UNLOAD,
    PGMAP_MAIN_STATE_3, // unused
    PGMAP_MAIN_STATE_FADE_IN,
    PGMAP_MAIN_STATE_FADE_OUT,
    PGMAP_MAIN_STATE_FADE_IN_APP,
    PGMAP_MAIN_STATE_FADE_OUT_APP,
    PGMAP_MAIN_STATE_ENTER_MARKING_MODE,
    PGMAP_MAIN_STATE_HANDLE_INPUT_MARKING_MODE,
    PGMAP_MAIN_STATE_EXIT_MARKING_MODE,
    PGMAP_MAIN_STATE_FADE_OUT_FOR_WORD_SELECT,
    PGMAP_MAIN_STATE_FLY_CONTEXT_MENU,
    PGMAP_MAIN_STATE_QUIT,
} PokegearMapMainState;

typedef enum PokegearMapSpriteID {
    PGMAP_SPRITE_MARKER0,
    PGMAP_SPRITE_MARKER1,
    PGMAP_SPRITE_MARKER2,
    PGMAP_SPRITE_MARKER3,
    PGMAP_SPRITE_GEAR_BATTLE,
    PGMAP_SPRITE_CURSOR,
    PGMAP_SPRITE_PLAYER,
    PGMAP_SPRITE_ROAMER_RAIKOU,
    PGMAP_SPRITE_ROAMER_ENTEI,
    PGMAP_SPRITE_ROAMER_LATIOS,
    PGMAP_SPRITE_ROAMER_LATIAS,
    PGMAP_SPRITE_ALWAYS_END,

    PGMAP_SPRITE_HAS_MARKINGS_BEGIN = PGMAP_SPRITE_ALWAYS_END,
    PGMAP_SPRITE_HAS_MARKINGS_END = PGMAP_SPRITE_HAS_MARKINGS_BEGIN + PGMAP_NUM_LOCATIONS,

    PGMAP_SPRITE_MARKINGS_BLINKING_ARROW = PGMAP_SPRITE_ALWAYS_END,
    PGMAP_SPRITE_MARKINGS_CURSOR_MAIN_0,
    PGMAP_SPRITE_MARKINGS_CURSOR_MAIN_1,
    PGMAP_SPRITE_MARKINGS_CURSOR_MAIN_2,
    PGMAP_SPRITE_MARKINGS_CURSOR_MAIN_3,
    PGMAP_SPRITE_MARKINGS_CURSOR_SUB_0,
    PGMAP_SPRITE_MARKINGS_CURSOR_SUB_1,
    PGMAP_SPRITE_MARKINGS_CURSOR_SUB_2,
    PGMAP_SPRITE_MARKINGS_CURSOR_SUB_3,
    PGMAP_SPRITE_MARKINGS_MENU_SLOT_MARK_0,
    PGMAP_SPRITE_MARKINGS_MENU_SLOT_MARK_1,
    PGMAP_SPRITE_MARKINGS_MENU_SLOT_MARK_2,
    PGMAP_SPRITE_MARKINGS_MENU_SLOT_MARK_3,
    PGMAP_SPRITE_MARKINGS_MENU_SLOT_WORD_0,
    PGMAP_SPRITE_MARKINGS_MENU_SLOT_WORD_1,
    PGMAP_SPRITE_MARKINGS_MENU_SLOT_WORD_2,
    PGMAP_SPRITE_MARKINGS_MENU_SLOT_WORD_3,
    PGMAP_SPRITE_MARKINGS_MENU_ICON_POKEBALL,
    PGMAP_SPRITE_MARKINGS_MENU_ICON_PIKACHU,
    PGMAP_SPRITE_MARKINGS_MENU_ICON_EXCLMARK,
    PGMAP_SPRITE_MARKINGS_MENU_ICON_QMARK,
    PGMAP_SPRITE_MARKINGS_MENU_ICON_APRICORN,
    PGMAP_SPRITE_MARKINGS_MENU_ICON_EGG,
    PGMAP_SPRITE_MARKINGS_MENU_ICON_HOME,
    PGMAP_SPRITE_MARKINGS_MENU_ICON_TMHM,

    PGMAP_SPRITE_FLY_MENU_11 = PGMAP_SPRITE_ALWAYS_END,
    PGMAP_SPRITE_FLY_MENU_12,
    PGMAP_SPRITE_FLY_MENU_13,
    PGMAP_SPRITE_FLY_MENU_14,
    PGMAP_SPRITE_FLY_MENU_WARPS_BEGIN,
    PGMAP_SPRITE_FLY_MENU_WARPS_END = PGMAP_SPRITE_FLY_MENU_WARPS_BEGIN + PGMAP_NUM_FLYPOINTS,

    PGMAP_SPRITE_MAX = max(PGMAP_SPRITE_FLY_MENU_WARPS_END, PGMAP_SPRITE_HAS_MARKINGS_END),
} PokegearMapSpriteID;

typedef enum PokegearMapMarkingDragMode {
    PGMAP_DRAG_NONE,
    PGMAP_DRAG_FROM_POOL,
    PGMAP_DRAG_FROM_SET,
} PokegearMapMarkingDragMode;

typedef enum PokegearMapType {
    PGMAP_TYPE_GEAR,
    PGMAP_TYPE_FLY,
    PGMAP_TYPE_TOWN_MAP,
} PokegearMapType;

typedef struct MapFlypointParam {
    u16 mapIDforName;
    u16 mapIDforWarp;
    u8 flypoint;
    u8 unk_05;
    u8 x;
    u8 y;
    u8 unk170SrcX;
    u8 unk170SrcY;
    u8 width : 4;
    u8 height : 4;
    u8 unk170DestWidth : 4;
    u8 unk170DestHeight : 4;
    u8 unk170DestX : 4;
    u8 unk170DestY : 4;
} MapFlypointParam;

typedef struct PokegearMapAppData_Sub044 {
    TextOBJ *textOBJ;
    UnkStruct_02021AC8 unk_4;
} PokegearMapAppData_Sub044;

typedef struct PokegearMapCursorState {
    fx32 x;
    fx32 y;
    fx32 xRatio;
    fx32 yRatio;
    int affineX;
    int affineY;
    fx32 dxStep;
    fx32 dyStep;
    fx32 unk_20;
    fx32 unk_24;
    u16 top;
    u16 bottom;
    u16 left;
    u16 right;
    s16 dx;
    s16 dy;
    s16 destX;
    s16 destY;
} PokegearMapCursorState;

typedef struct PokegearMapLocationSpec {
    u16 mapId;
    u8 x;
    u8 y;
    u16 width : 4;
    u16 height : 4;
    u16 objXoffset : 4;
    u16 objYoffset : 4;
    u8 flavorText;
    u8 tilemapUnk174BlockID;
    u8 unk_8; // unused
    u8 unk_9; // unused
    u8 unk_A; // unused
    u8 unk_B; // unused
    u8 tilemapUnk170SrcX;
    u8 tilemapUnk170SrcY;
    u8 tilemapUnk170DestWidth;
    u8 tilemapUnk170DestHeight;
} PokegearMapLocationSpec;

typedef struct MapMarkingsHeapNode {
    MapMarkingsRAM mapMarkings;
    u8 index;
    u8 prev;
    u8 next;
    u8 active;
} MapMarkingsHeapNode;

typedef struct PokegearMapAppData_Sub118 {
    const PokegearMapLocationSpec *locationSpec;
    MapMarkingsHeapNode *markingsNode;
    u16 x; // written but never read
    u16 y; // written but never read
} PokegearMapAppData_Sub118;

typedef struct PokegearMapAppData {
    enum HeapID heapID;                           // 0x000
    int state;                                    // 0x004
    int substate;                                 // 0x008
    u8 inMarkingsMode;                            // 0x00C
    u8 type;                                      // 0x00D PokegearMapType
    u8 curRegion;                                 // 0x00E
    s8 flyDestination;                            // 0x00F
    PokegearAppData *pokegear;                    // 0x010
    PokegearMapSessionState sessionState;         // 0x014
    int markingsPanelScrollActive;                // 0x030
    int markingsPanelScrollStep;                  // 0x034
    MAPDATA *mapData;                             // 0x038
    UnkStruct_02013534 *unk_03C;                  // 0x03C
    UnkStruct_02013910 *unk_040;                  // 0x040
    PokegearMapAppData_Sub044 unk_044[4];         // 0x044
    PokegearObjectsManager *objManager;           // 0x084
    MsgData *msgData;                             // 0x088
    MessageFormat *msgFormat;                     // 0x08C
    String *flavorTextString;                     // 0x090
    u8 filler_094[8];                             // 0x094
    String *regionNameStrings[2];                 // 0x09C
    String *mapNameString;                        // 0x0A4
    String *chooseDestinationString;              // 0x0A8
    String *flyToLocationString;                  // 0x0AC
    String *closeString;                          // 0x0B0
    String *formatFlavorTextString;               // 0x0B4
    u8 unk_0B8;                                   // 0x0B8, set 2 but never used
    TouchscreenListMenuSpawner *listMenuSpawner;  // 0x0BC
    LISTMENUITEM *listMenuItems;                  // 0x0C0
    TouchscreenListMenu *listMenu;                // 0x0C4
    PokegearMapCursorState cursorSpriteState;     // 0x0C8
    u16 minXscroll;                               // 0x100
    u16 maxXscroll;                               // 0x102
    u16 minYscroll;                               // 0x104
    u16 maxYscroll;                               // 0x106
    s16 matrixX;                                  // 0x108
    s16 matrixY;                                  // 0x10A
    u16 mapID;                                    // 0x10C
    u16 playerGender;                             // 0x10E
    s16 playerX;                                  // 0x110
    s16 playerY;                                  // 0x112
    Coord2S16 cursorPos;                          // 0x114
    PokegearMapAppData_Sub118 selectedLoc;        // 0x118
    PhoneCallPersistentState *phoneCallSave;      // 0x124
    PhoneBook *phoneBook;                         // 0x128
    PhoneContact *phoneContact;                   // 0x12C
    u8 numPhonebookSlots;                         // 0x130
    u8 centerY;                                   // 0x131
    u8 centerX;                                   // 0x132
    s8 yOffset;                                   // 0x133
    s8 xOffset;                                   // 0x134
    u8 fadeStep;                                  // 0x135
    u8 numLocationSpecs;                          // 0x136
    u8 unk_137;                                   // 0x137
    u8 zoomed : 1;                                // 0x138
    u8 unk_138_1 : 3;                             // 0x138 set to 0, never read
    u8 unk_138_4 : 1;                             // 0x138
    u8 mapUnlockLevel : 2;                        // 0x138
    u8 requestAffineUpdate : 1;                   // 0x138
    u8 draggingMarking : 1;                       // 0x139
    u8 unk_139_1 : 1;                             // 0x139
    u8 unk_139_2 : 1;                             // 0x139
    u8 unk_139_3 : 1;                             // 0x139
    u8 draggingIcon : 4;                          // 0x139
    u8 cursorSpeed;                               // 0x13A
    u8 moveCursorDirection;                       // 0x13B
    u8 draggingType : 7;                          // 0x13C
    u8 trashcanIconState : 1;                     // 0x13C
    u8 canFlyToGoldenrod : 1;                     // 0x13D
    u8 canSeeSafariZone : 1;                      // 0x13D
    u8 isMapSinjoh : 1;                           // 0x13D
    u8 isMapSSAqua : 1;                           // 0x13D
    s16 draggingWordX;                            // 0x13E
    s16 draggingWordY;                            // 0x140
    s16 unk_142;                                  // 0x142
    s16 unk_144;                                  // 0x144
    s16 unk_146;                                  // 0x146
    s16 unk_148;                                  // 0x148
    s16 pixelTop;                                 // 0x14A
    s16 pixelBottom;                              // 0x14C
    s16 pixelLeft;                                // 0x14E
    s16 pixelRight;                               // 0x150
    u16 lastSelectedMapID;                        // 0x152
    void *unk_154[6];                             // 0x154
    NNSG2dScreenData *unk_16C;                    // 0x16C
    NNSG2dScreenData *unk_170;                    // 0x170
    NNSG2dScreenData *unk_174;                    // 0x174
    NNSG2dScreenData *unk_178;                    // 0x178
    NNSG2dScreenData *unk_17C;                    // 0x17C
    NNSG2dScreenData *unk_180;                    // 0x180
    Window windows[9];                            // 0x184
    const PokegearMapLocationSpec *locationSpecs; // 0x214
    MapMarkingsHeapNode mapMarkingsHeap[100];     // 0x218
    u16 roamerLocations[ROAMER_MAX];              // 0x9E8
    u8 mapMarkingsListHead;                       // 0x9F0
    u8 mapMarkingsListTail;                       // 0x9F1
    u8 mapMarkingsListCount;                      // 0x9F2
} PokegearMapAppData;                             // size: 0x9F4

BOOL PokegearMap_LoadGFX(PokegearMapAppData *mapApp);
BOOL PokegearMap_UnloadGFX(PokegearMapAppData *mapApp);
BOOL PokegearMap_AnimateSwitchToMarkingMode(PokegearMapAppData *mapApp);
BOOL PokegearMap_AnimateSwitchFromMarkingMode(PokegearMapAppData *mapApp);

void PokegearMap_VBlankCB(PokegearAppData *pokegear, void *appData);
void PokegearMap_UpdateCursorBounds(PokegearMapAppData *mapApp);
void PokegearMap_SaveState(PokegearMapAppData *mapApp);
void ov101_021E9464(PokegearMapAppData *mapApp, s16 xIn, s16 yIn, u16 *xOut, u16 *yOut);
void ov101_021E94C0(PokegearMapAppData *mapApp);
void ov101_021E9530(PokegearMapAppData *mapApp, u8 zoomed, u16 x0, u16 y0, s16 xIn, s16 yIn);
void ov101_021E990C(PokegearMapAppData *mapApp);
void PokegearMap_OnVBlank_UpdateCursorAffine(PokegearMapAppData *mapApp, PokegearMapCursorState *cursorState);
void ov101_021E9BF4(PokegearMapAppData *mapApp, s16 dx, s16 dy);
BOOL PokegearMap_FadeMapScreen(PokegearMapAppData *mapApp, u8 direction);
void PokegearMap_BeginScrollMarkingsPanelTopScreen(PokegearMapAppData *mapApp, u8 direction);
BOOL PokegearMap_RunScrollMarkingsPanelTopScreen(PokegearMapAppData *mapApp, u8 direction);
void PokegearMap_BeginScrollMarkingsPanelBottomScreen(PokegearMapAppData *mapApp, u8 direction);
BOOL PokegearMap_RunScrollMarkingsPanelBottomScreen(PokegearMapAppData *mapApp, u8 direction);
void ov101_021EA238(PokegearMapAppData *mapApp, u8 mode);
void ov101_021EA4D0(PokegearMapAppData *mapApp, u8 mode);
void ov101_021EA608(PokegearMapAppData *mapApp, u8 enable);
BOOL ov101_021EA6C4(PokegearMapAppData *mapApp, PokegearMapAppData_Sub118 *a1);
const PokegearMapLocationSpec *PokegearMap_GetLocationSpecByCoord(PokegearMapAppData *mapApp, u8 x, u8 y);
const PokegearMapLocationSpec *PokegearMap_GetLocationSpecByMapID(PokegearMapAppData *mapApp, u16 mapID);
void ov101_021EA794(PokegearMapAppData *mapApp, PokegearMapAppData_Sub118 *a1, u8 x, u8 y);
BOOL ov101_021EA7E4(PokegearMapAppData *mapApp, u16 x, u16 y);
BOOL ov101_021EA804(PokegearMapAppData *mapApp, u16 mapID, u16 x, u16 y);
int PokegearMap_GetFlyDestinationAtCoord(PokegearMapAppData *mapApp, u16 x, u16 y);
int ov101_021EA8A8(PokegearMapAppData *mapApp, PokegearMapAppData_Sub118 *a1, u8 x, u8 y);
void ov101_021EAD90(PokegearMapAppData *mapApp, BOOL a1);
void PokegearMap_PrintSelectedMapDetail(PokegearMapAppData *mapApp, BOOL forceUpdateMapName);
void ov101_021EAF40(PokegearMapAppData *mapApp);
void ov101_021EB1E0(PokegearMapAppData *mapApp, u8 a1);
void PokegearMap_HideMapCursor(PokegearMapAppData *mapApp);
void PokegearMap_DeselectApp(void *appData);
void PokegearMap_ShowMapCursor(void *appData);
void PokegearMap_InMarkingsMode_HideCursor(void *appData);
void PokegearMap_InMarkingsMode_ShowCursor(void *appData);
void ov101_021EB38C(PokegearMapAppData *mapApp, int button, int state);
void PokegearMap_SpawnFlyContextMenu(PokegearMapAppData *mapApp, u32 x);
void PokegearMap_PrintLandmarkNameAndFlavorText(PokegearMapAppData *mapApp, int mapID);

int ov101_021EB568(PokegearMapAppData *mapApp);
int ov101_021EB5DC(PokegearMapAppData *mapApp, BOOL *pRetIsTouch);
int FlyMap_HandleKeyInput(PokegearMapAppData *mapApp);
int FlyMap_HandleTouchInput_NotDragging(PokegearMapAppData *mapApp, BOOL *pRetIsTouch);
int FlyMap_HandleTouchInput_DraggingMap(PokegearMapAppData *mapApp);
void ov101_021EC304(PokegearMapAppData *mapApp);
int PokegearMap_HandleKeyInput_SelectMarkingsSlot(PokegearMapAppData *mapApp);
int PokegearMap_HandleTouchInput_SelectMarkingsSlot(PokegearMapAppData *mapApp, BOOL *a1);
int PokegearMap_HandleKeyInput_SelectedIconFromPool(PokegearMapAppData *mapApp);
int PokegearMap_HandleTouchInput_DragItemFromPool(PokegearMapAppData *mapApp);
int PokegearMap_HandleKeyInput_SelectedMarkingSlot(PokegearMapAppData *mapApp);
int PokegearMap_HandleTouchInput_DragMarkingSlot(PokegearMapAppData *mapApp);

void MapApp_LoadMarkingsListFromSave(PokegearMapAppData *mapApp);
void PokegearMap_SaveMapMarkings(PokegearMapAppData *mapApp);
MapMarkingsHeapNode *MapApp_GetMarkingsHeapNodeByMapID(PokegearMapAppData *mapApp, int mapID);
MapMarkingsHeapNode *MapApp_GetOrCreateMarkingsHeapNodeByMapID(PokegearMapAppData *mapApp, u16 mapID);
BOOL MapApp_RemoveMarkingsHeapNodeFromList(PokegearMapAppData *mapApp, MapMarkingsHeapNode *node);
BOOL MapMarkingsHeapNode_SetIcon(MapMarkingsHeapNode *node, u8 index, u8 icon);
BOOL MapMarkingsHeapNode_RemoveIcon(MapMarkingsHeapNode *node, u8 index);
BOOL MapMarkingsHeapNode_SwapIcons(MapMarkingsHeapNode *node, u8 index1, u8 index2);
BOOL MapMarkingsHeapNode_SetWord(MapMarkingsHeapNode *node, u8 index, u16 word);
BOOL MapMarkingsHeapNode_RemoveWord(MapMarkingsHeapNode *node, u8 index);
BOOL MapMarkingsHeapNode_SwapWords(MapMarkingsHeapNode *node, u8 index1, u8 index2);

BOOL FlyMap_LoadGFX(PokegearMapAppData *mapApp);
BOOL FlyMap_UnloadGFX(PokegearMapAppData *mapApp);
int FlyMap_HandleContextMenu(PokegearMapAppData *mapApp);

extern const PokegearMapLocationSpec sLocationSpecs[PGMAP_NUM_LOCATIONS];
extern const MapFlypointParam gMapFlypointParams[PGMAP_NUM_FLYPOINTS];

#endif // POKEHEARTGOLD_APPLICATION_POKEGEAR_MAP_POKEGEAR_MAP_INTERNAL_H
