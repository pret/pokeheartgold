#ifndef POKEHEARTGOLD_FIELD_SYSTEM_H
#define POKEHEARTGOLD_FIELD_SYSTEM_H

#include "bug_contest_internal.h"
#include "gear_phone.h"
#include "map_events_internal.h"
#include "map_matrix.h"
#include "overlay_manager.h"
#include "save_pokegear.h"
#include "unk_0200E320.h"
#include "camera.h"
#include "bg_window.h"

typedef struct FieldSystem FieldSystem;
typedef struct TaskManager TaskManager;
typedef struct FieldSystemUnkSub2C FieldSystemUnkSub2C;
typedef struct LocalMapObject LocalMapObject;
typedef struct FieldMapObject FieldMapObject;
typedef struct PlayerAvatar PlayerAvatar;
typedef struct MapObjectManager MapObjectManager;

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

typedef struct GearPhoneRingManager {
    u8 unk_var0_0:1;
    u8 unk_var0_1:1;
    u8 unk_var0_2:1;
    u8 unk_var0_3:1;
    u8 unk_var0_4:4;
    u8 unk_var1;
    u8 unk_var2;
    u8 unk_var3;
    u8 unk_var4;
    u8 unk_arr5[2];
    u8 unk_var7;
    s32 unk_var8;
    s32 unk_varC;
    u16 unk_var10;
    u16 unk_var12;
    s64 unk_var14; //Seconds? see sub_02092F30
    PhoneBookEntry entry; //0x1c
    SavePokegear *pokegearData; //0x30
    MomsSavings *savingsData;//0x34
    SaveData *saveData; //0x38
    FieldSystem *sys; //0x3c
    struct PokegearRingingTask {
        SysTask *task;
        u8 counter;
    } gearRing;
} GearPhoneRingManager; //size: 0x48

typedef struct Location {
    int mapId;
    int warpId;
    int x;
    int y;
    int direction;
} Location;

struct FieldSystemUnk108 {
    u32 personality;
    u16 species;
    u16 isRegistered;
    Pokemon *mon;
};

struct FieldSystemUnkSub0 {
    OVY_MANAGER *unk0;
    OVY_MANAGER *unk4;
    BOOL unk8;
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
    u8 unk13_0:7;
    u8 unk13_7:1;
};

typedef struct FieldSystemUnkSub4 {
    u32 unk0;
    u32 unk4;
    u32 unk8;
    void *unk_0C; // weather related?
    u8 unk10[0x4];
    u32 unk14;
    u32 unk18;
    u32 unk1c;
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
    MapObjectManager *mapObjectMan;
    PlayerAvatar *playerAvatar;
    void *unk_44;
    u8 filler48[0xC];
    void *unk54;
    u8 filler_58[0x8];
    u32 unk60;
    int unk64;
    struct FieldSystemUnkSub68 *unk68;
    u32 unk6C;
    int unk70;
    const struct UnkStruct_020FC5CC *unk74;
    u16 unk78;
    u16 unk7A;
    u16 unk7C;
    u16 unk7E;
    struct UnkStruct_02059E1C *unk80;
    struct UnkStruct_0205AC88 *unk84;
    u8 filler_88[0xC];
    void *unk94;
    u8 filler_98[0x4];
    void *unk9C;
    void *unkA0;
    void * unkA4;
    u32 *unkA8;
    u32 unkAC;
    void *unkB0;
    s64 unkB4;
    u8 unkBC[8];
    int unkC4;
    u8 filler_C8[0xA];
    u8 unkD2_0:6;
    u8 unkD2_6:1;
    u8 unkD2_7:1;
    u8 filler_D3[0x11];
    FollowMon followMon; // A4
    u8 unk104[4];
    struct FieldSystemUnk108 *unk108;
    u32 unk_10C;
    u8 unk_110;
    u8 unk_111[3];
    GearPhoneRingManager *unk114;
    BUGCONTEST *bugContest;
    u8 unk11C[0x8];
    u32 judgeStatPosition;
}; // size: 0x128

typedef struct Unk_0203E15C {
    u8 unk0[6];
    u16 unk6;
    u16 unk8;
    u16 unkA;
} Unk_0203E15C;

BOOL Field_Continue_AppInit(OVY_MANAGER *man, int *unused);
BOOL Field_NewGame_AppInit(OVY_MANAGER *man, int *unused);
BOOL Field_AppExec(OVY_MANAGER *man, int *unused);
BOOL Field_AppExit(OVY_MANAGER *man, int *unused);
void sub_0203DEF0(FieldSystem *fieldSystem);
void sub_0203DF34(FieldSystem *fieldSystem);
u8 sub_0203DF3C(FieldSystem *fieldSystem);
void sub_0203DF64(FieldSystem *fieldSystem, int a1);
BOOL sub_0203DF7C(FieldSystem *fieldSystem);
BOOL sub_0203DF8C(FieldSystem *fieldSystem);
BOOL sub_0203DFA4(FieldSystem *fieldSystem);
void FieldSystem_LaunchApplication(FieldSystem *fieldSystem, const OVY_MGR_TEMPLATE *template, void *parentWork);
FieldSystem *FieldSystem_New(OVY_MANAGER *man);
void FieldSystem_Delete(OVY_MANAGER *man);
BOOL sub_0203E13C(FieldSystem *fieldSystem);
void sub_0203E15C(FieldSystem *fieldSystem);
void sub_0203E2F4();
void sub_0203E30C();
int sub_0203E324();
void sub_0203E33C(FieldSystem *fieldSystem, int a1);
BgConfig *FieldSystem_GetBgConfigPtr(FieldSystem *fieldSystem);
SaveData *FieldSystem_GetSaveData(FieldSystem *fieldSystem);
void sub_0203E348();
void sub_0203E354();

extern const OVY_MGR_TEMPLATE gApplication_NewGameFieldsys;
extern const OVY_MGR_TEMPLATE gApplication_ContinueFieldsys;

static inline void InitLocation(Location *location, int mapId, int warpId, int x, int y, int direction) {
    location->mapId = mapId;
    location->warpId = warpId;
    location->x = x;
    location->y = y;
    location->direction = direction;
}

#endif //POKEHEARTGOLD_FIELD_SYSTEM_H
