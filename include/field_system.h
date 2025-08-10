#ifndef POKEHEARTGOLD_FIELD_SYSTEM_H
#define POKEHEARTGOLD_FIELD_SYSTEM_H

#include "field/draw_map_name.h"
#include "field/overlay_01_021E66E4.h"

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
#include "overlay_01_021EB1E8.h"
#include "overlay_01_02204004.h"
#include "overlay_manager.h"
#include "photo_types_def.h"
#include "save_pokegear.h"
#include "scrcmd_9.h"
#include "sys_task.h"
#include "sys_task_api.h"

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
    u8 unk_var3;
    u8 unk_var4;
    u8 unk_arr5[2];
    u8 unk_var7;
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

typedef struct FieldSystemUnk108 {
    u32 personality;
    u16 species;
    u16 isRegistered;
    Pokemon *mon;
} FieldSystemUnk108;

struct FieldSystemUnkSub0 {
    OverlayManager *unk0;
    OverlayManager *unk4;
    BOOL isPaused;
    BOOL unkC;
};

typedef struct FieldEnvSubUnk18 {
    int state;
    u32 direction;
} FieldEnvSubUnk18;

struct FieldSystemUnkSub68 {
    Window unk0;
    u16 unk10;
    u8 unk12;
    u8 unk13_0 : 7;
    u8 unk13_7 : 1;
};

typedef struct FieldSystemUnkSub4 {
    u32 unk0;
    Field3dObjectTaskManager *field3dObjectTaskManager;
    FieldDrawMapNameInfo *drawMapNameInfo;
    void *unk_0C; // weather related?
    UnkStruct_ov01_021EB1E8 *unk10;
    u32 unk14;
    u32 unk18;
    u32 unk1c;
    u32 unk20;
    void *legendCutsceneCamera;
} FieldSystemUnkSub4;

struct FieldSystem {
    struct FieldSystemUnkSub0 *unk0;
    FieldSystemUnkSub4 *unk4;
    BgConfig *bgConfig;
    SaveData *saveData;
    TaskManager *taskman;
    MapEvents *mapEvents;
    u32 unk18;
    int unk1C;
    Location *location;
    Camera *camera;
    void *unk28;
    FieldSystemUnkSub2C *unk2C;
    MAPMATRIX *mapMatrix;
    u8 filler34[0x8];
    MapObjectManager *mapObjectManager;
    PlayerAvatar *playerAvatar;
    void *unk_44;
    u8 filler48[0xC];
    void *unk54;
    u8 filler_58[0x8];
    u32 unk60;
    int unk64;
    struct FieldSystemUnkSub68 *unk68;
    BOOL unk6C;
    int unk70;
    const struct UnkStruct_020FC5CC *unk74;
    u16 unk78;
    u16 unk7A;
    u16 unk7C;
    u16 unk7E;
    struct UnkStruct_02059E1C *unk80;
    struct UnkStruct_0205AC88 *unk84;
    u8 filler_88[0x8];
    int unk90;
    BagCursor *bagCursor;
    u8 filler_98[0x4];
    void *unk9C;
    UnkStruct_Fsys_A0 *unkA0;
    Save_LinkBattleRuleset *linkBattleRuleset;
    u32 *unkA8;
    u32 unkAC;
    void *unkB0;
    s64 unkB4;
    u8 unkBC[4];
    void *unkC0;
    int unkC4;
    FieldSystemUnkC8 *unk_C8;
    u8 filler_CC[0x4];
    u16 lastTouchMenuInput;
    u8 unkD2_0 : 6;
    u8 unkD2_6 : 1;
    u8 unkD2_7 : 1;
    u8 unkD3;
    u8 filler_D4[0x4];
    SysTask *unk_D8;
    FieldViewPhoto *viewPhotoTask;
    int lastStartMenuAction;
    FollowMon followMon; // E4
    u8 unk104[4];
    FieldSystemUnk108 *unk108;
    MenuInputStateMgr menuInputState; // Tracks whether the last menu input was touch or keypad
    u8 unk_110;
    u8 unk_111[3];
    GearPhoneRingManager *phoneRingManager;
    BugContest *bugContest;
    u8 unk11C[0x8];
    u32 judgeStatPosition;
}; // size: 0x128

typedef struct FieldInput {
    u8 unk0[6];
    u16 unk6;
    u16 unk8;
    u16 unkA;
} FieldInput;

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
void sub_0203E348();
void sub_0203E354();

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
