#ifndef POKEHEARTGOLD_FIELD_SYSTEM_H
#define POKEHEARTGOLD_FIELD_SYSTEM_H

#include "field/area_data.h"
#include "field/area_light.h"
#include "field/draw_map_name.h"
#include "field/dynamic_terrain_height.h"
#include "field/hblank_system.h"
#include "field/map_prop.h"
#include "field/map_prop_animation.h"
#include "field/model_attributes.h"
#include "field/overlay_01_021E66E4.h"
#include "field/overlay_01_021EAFD4.h"
#include "field/overlay_01_02204004.h"
#include "field/signpost.h"

#include "bag_cursor.h"
#include "battle_regulation.h"
#include "bg_window.h"
#include "bug_contest_internal.h"
#include "camera.h"
#include "camera_translation.h"
#include "field_types_def.h"
#include "gear_phone.h"
#include "map_events_internal.h"
#include "map_matrix.h"
#include "menu_input_state.h"
#include "overlay_01_021EA824.h" // replace with field/fog.h
#include "overlay_01_021EB1E8.h"
#include "overlay_01_021F1348.h"
#include "overlay_manager.h"
#include "photo_types_def.h"
#include "save_pokegear.h"
#include "scrcmd_9.h"
#include "sys_task.h"
#include "sys_task_api.h"
#include "terrain_attributes.h"
#include "unk_02055418.h"
#include "unk_02092BB8.h"

typedef struct FollowMon {
    LocalMapObject *mapObject;
    u32 unk4;
    u32 unk8;
    u32 unkC;
    u32 species;
    u8 gender;
    u8 unk15;
    u8 active;
    u8 shiny;
    u16 form;
    u16 dummy;
    u32 unk1C;
} FollowMon;

struct GearPhoneRingManager {
    u8 active : 1;
    u8 unk_var0_1 : 1;
    u8 unk_var0_2 : 1;
    u8 ringing : 1;
    u8 unk_var0_4 : 4;
    u8 unk_var1;
    u8 callerId;
    u8 isScriptedCall;
    u8 callScriptID;
    u8 unk_arr5[2];
    u8 callTriggerID;
    s32 unk_var8;
    s32 unk_varC;
    u16 maxActiveDuration;
    u16 unk_var12;
    s64 activeTimer;                       // Seconds? see GearPhoneRingManager_HandleTimeAdvance
    PhoneBookEntry entry;                  // 0x1c
    SavePokegear *pokegearData;            // 0x30
    PhoneCallPersistentState *savingsData; // 0x34
    SaveData *saveData;                    // 0x38
    FieldSystem *sys;                      // 0x3c
    struct PokegearRingingTask {
        SysTask *task;
        u8 counter;
    } gearRing;
}; // size: 0x48

typedef struct FieldProcessManager {
    OverlayManager *parent;
    OverlayManager *child;
    BOOL isPaused;
    BOOL isDone;
} FieldProcessManager;

typedef struct FieldEnvSubUnk18 {
    int state;
    u32 direction;
} FieldEnvSubUnk18;

typedef struct FieldSystemUnkSub4 {
    u32 unk0;
    Field3dObjectTaskManager *field3dObjectTaskManager;
    FieldDrawMapNameInfo *drawMapNameInfo;
    void *weatherManager;
    FieldTextureManager *textureManager;
    u32 unk14;
    UnkStruct_020556FC *unk18;
    HBlankSystem *hBlankSystem;
    void *unk20;
    void *legendCutsceneCamera;
} FieldSystemUnkSub4;

#define MAP_OBJECT_PRELOAD_SENTINEL 0xFFFF
#define MAX_MAP_OBJECTS_TO_PRELOAD  24

typedef struct MapObjectsToPreload {
    u16 count;
    int ids[MAX_MAP_OBJECTS_TO_PRELOAD];
} MapObjectsToPreload;

typedef struct FieldSystemUnkSub108 {
    u32 personality;
    u16 species;
    u16 isRegistered;
    Pokemon *mon;
} FieldSystemUnkSub108;

typedef struct FieldSystemUnkSub120_Sub7E4 {
    u16 unk0;
    u16 unk2;
    u16 unk4;
    u8 unk6;
    u8 unk7;
} FieldSystemUnkSub120_Sub7E4;

typedef struct FieldSystemUnkSub120_Sub818 {
    u8 unk0;
    u8 unk1;
    s8 unk2;
    s8 unk3;
    s8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
} FieldSystemUnkSub120_Sub818;

typedef struct FieldSystemUnkSub120 {
    Window window;
    String *string;
    NarcId narcId;
    u8 unk18[596];
    NarcId unk26C;
    u8 unk270[1396];
    FieldSystemUnkSub120_Sub7E4 unk7E4[5];
    u32 unk80C;
    u16 unk810;
    u16 unk812;
    s8 unk814;
    s8 unk815;
    u8 unk816;
    u8 unk817;
    FieldSystemUnkSub120_Sub818 unk818[10];
    u8 unk868;
    u8 unk869;
    u8 unk86A;
    u8 unk86B;
    u8 unk86C_3 : 4;
    u8 unk86C_4 : 4;
    u8 unk86D;
    u16 unk86E;
    VecFx32 unk870;
    u8 unk87C;
    u8 unk87D;
    u16 unk87E;
    u16 unk880;
    u16 unk882;
} FieldSystemUnkSub120;

struct FieldSystem {
    FieldProcessManager *processManager;
    FieldSystemUnkSub4 *unk4;
    BgConfig *bgConfig;
    SaveData *saveData;
    TaskManager *taskman;
    MapEvents *mapEvents;
    int bottomScreenType;
    int unk1C;
    Location *location;
    Camera *camera;
    void *unk28;
    MapLoadManager *mapLoadManager;
    MapMatrix *mapMatrix;
    AreaDataManager *areaDataManager;
    MapObjectsToPreload *mapObjectsToPreload;
    MapObjectManager *mapObjectManager;
    PlayerAvatar *playerAvatar;
    FieldEffectManager *fieldEffectManager;
    ModelAttributes *modelAttributes;
    FogData *fog;
    AreaLightManager *areaLightManager;
    MapPropAnimationManager *mapPropAnimationManager;
    MapPropOneShotAnimationManager *mapPropOneShotAnimationManager;
    TerrainAttributes *terrainAttributes;
    void *unk60;
    BOOL skipMapAttributes;
    Signpost *signpost;
    BOOL runningFieldMap;
    int mapLoadType;
    const struct MapLoadMode *mapLoadMode;
    u16 unk78;
    u16 lastFacingDirection;   // 0x7A, used to determine whether the following field should be incremented
    u16 reverseTurnFrameSteps; // 0x7C, turning back and forth in place will increase the effective encounter rate
    u16 encounterInhibitSteps; // 0x7E, don't generate an encounter in the first 4 steps on a new map
    struct UnkStruct_02059E1C *unk80;
    struct UnkStruct_0205AC88 *unk84;
    u8 filler_88[0x8];
    int unk90;
    BagCursor *bagCursor;
    DynamicTerrainHeightManager *dynamicTerrainHeightManager;
    MapPropManager *mapPropManager;
    FrontierFieldSystem *frontierFsys;
    LinkBattleRuleset *linkBattleRuleset;
    UnkStruct_02092BB8 *unkA8;
    u32 unkAC;
    void *unkB0;
    s64 unkB4;
    int unkBC;                 // flags?
    void *unkC0;               // UnkStruct_FieldSysC0
    int environmentSoundState; // Used to keep track of the active weather/soundplate sound and their associated loading status.
    FieldSystemUnkSubC8 *unkC8;
    void *unkCC;
    u16 lastTouchMenuInput;
    u8 unkD2_0 : 6;
    u8 textbox_open : 1;
    u8 unkD2_7 : 1;
    u8 unkD3;
    u8 filler_D4[0x4];
    SysTask *unk_D8;
    FieldViewPhoto *viewPhotoTask;
    int lastStartMenuAction;
    FollowMon followMon; // E4
    FieldSystemUnkSub104 *unk104;
    FieldSystemUnkSub108 *unk108;
    MenuInputStateMgr menuInputState; // Tracks whether the last menu input was touch or keypad
    u8 unk_110;
    u8 unk_111[3];
    GearPhoneRingManager *phoneRingManager;
    BugContest *bugContest;
    fx32 unk11C;
    FieldSystemUnkSub120 *unk120;
    u32 judgeStatPosition;
}; // size: 0x128

typedef struct FieldInput {
    u16 interact : 1;
    u16 endMovement : 1;
    u16 menu : 1;
    u16 registeredItem : 2;
    u16 sign : 1;
    u16 mapTransition : 1;
    u16 movement : 1;
    u16 unk0_8 : 1;
    u16 unk0_9 : 1;
    u16 unk0_A : 1;
    u16 unk0_B : 1;
    u16 unk0_C : 1;
    u16 unk0_D : 1;
    u16 unk2;
    u8 playerDir;
    s8 transitionDir;
    u16 newKeys;
    u16 heldKeys;
    u16 unkA;
} FieldInput;

BOOL FieldMap_Init(OverlayManager *man, int *state);
BOOL FieldMap_Main(OverlayManager *man, int *state);
BOOL FieldMap_Exit(OverlayManager *man, int *state);
BOOL Field_Continue_AppInit(OverlayManager *man, int *unused);
BOOL Field_NewGame_AppInit(OverlayManager *man, int *unused);
BOOL Field_AppExec(OverlayManager *man, int *unused);
BOOL Field_AppExit(OverlayManager *man, int *unused);
void FieldSystem_LoadFieldOverlayInternal(FieldSystem *fieldSystem);
void sub_0203DF34(FieldSystem *fieldSystem);
u8 sub_0203DF3C(FieldSystem *fieldSystem);
void sub_0203DF64(FieldSystem *fieldSystem, int a1);
BOOL sub_0203DF7C(FieldSystem *fieldSystem);
BOOL sub_0203DF8C(FieldSystem *fieldSystem);
BOOL sub_0203DFA4(FieldSystem *fieldSystem);
void FieldSystem_LaunchApplication(FieldSystem *fieldSystem, const OverlayManagerTemplate *template, void *parentWork);
FieldSystem *FieldSystem_New(OverlayManager *man);
void FieldSystem_Delete(OverlayManager *man);
BOOL FieldSystem_IsPlayerMovementAllowed(FieldSystem *fieldSystem);
void FieldSystem_Control(FieldSystem *fieldSystem);
void sub_0203E2F4();
void sub_0203E30C();
int sub_0203E324();
void sub_0203E33C(FieldSystem *fieldSystem, int a1);
BgConfig *FieldSystem_GetBgConfigPtr(FieldSystem *fieldSystem);
SaveData *FieldSystem_GetSaveData(FieldSystem *fieldSystem);
void Task_AntipiracyRandom();
void Field_SetEnvironmentSoundState_None_Unk2();

extern const OverlayManagerTemplate gApplication_NewGameFieldsys;
extern const OverlayManagerTemplate gApplication_ContinueFieldsys;

static inline void InitLocation(Location *location, int mapId, int warpId, int x, int y, int direction) {
    location->mapId = mapId;
    location->warpId = warpId;
    location->x = x;
    location->y = y;
    location->direction = direction;
}

#endif // POKEHEARTGOLD_FIELD_SYSTEM_H
