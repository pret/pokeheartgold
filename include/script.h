#ifndef POKEHEARTGOLD_SCRIPT_H
#define POKEHEARTGOLD_SCRIPT_H

#include "save.h"
#include "map_events_internal.h"
#include "map_matrix.h"
#include "msgdata.h"
#include "window.h"
#include "field_player_avatar.h"
#include "gear_phone.h"
#include "save_pokegear.h"
#include "bug_contest_internal.h"
#include "constants/vars.h"
#include "overlay_manager.h"
#include "unk_0200E320.h"
#include "list_menu_2.h"
#include "unk_0200E398.h"
#include "unk_02022D74.h"

#define SCRIPT_MODE_STOPPED  0
#define SCRIPT_MODE_BYTECODE 1
#define SCRIPT_MODE_NATIVE   2

#define SCRIPT_COMPARISON_RESULT_LESS    0
#define SCRIPT_COMPARISON_RESULT_EQUAL   1
#define SCRIPT_COMPARISON_RESULT_GREATER 2

#define ScriptReadByte(ctx) *(ctx->script_ptr++)

typedef struct FieldSystem FieldSystem;
typedef struct SCRIPTCONTEXT SCRIPTCONTEXT;

#define Unk80_10_C_MAGIC         (222271)

typedef struct EngagedTrainer {
    int unk0;
    int unk4;
    int unk8;
    int trainerNum;
    int encounterType; // 0: single trainer; 1: double-battle trainer; 2: two trainers
    LocalMapObject *objectEvent;
    int unk18;
} EngagedTrainer;

typedef struct _NPC_TRADE_WORK NPC_TRADE_WORK;
typedef struct FsysUnkSub2C FsysUnkSub2C;

typedef struct ScriptEnvironment {
    u32 check;
    u8 state;
    u8 textPrinterNum;
    u8 numActiveMovement;
    u8 unk_7;
    u8 unk_8;
    u8 numActiveScrCtx;
    u16 script;
    u32 unk_C;
    u32 unk_10;
    WINDOW unk_14;
    struct ListMenu2 *listMenu;
    int facingDirection;
    LocalMapObject* lastTalked;
    u32 cameraFocusObj;
    LocalMapObject* unk_34;
    SCRIPTCONTEXT* scriptContexts[3];
    MSGFMT* msgfmt;
    STRING* strbuf1;
    STRING* strbuf2;
    struct WaitingIconManager *unk_50;
    EngagedTrainer engagedTrainers[2];
    u16 specialVars[NUM_SPECIAL_VARS];
    void (*scrctx_end_cb)(FieldSystem* fsys);
    void *unk_AC;
    void *genericWorkPtr;
    void *unk_B4;
    void *unk_B8;
    WINDOW unk_BC;
    WINDOW moneyBox;
    struct SaveStatsPrinter *unk_DC;
} ScriptEnvironment;

enum ScriptEnvField {
    SCRIPTENV_MENU_WINDOW                     =  0,
    SCRIPTENV_WINDOW                          =  1,
    SCRIPTENV_MENU                            =  2,
    SCRIPTENV_PRINTER_NUM                     =  3,
    SCRIPTENV_NUM_ACTIVE_MOVEMENT             =  4,
    SCRIPTENV_07                              =  5,
    SCRIPTENV_08                              =  6,
    SCRIPTENV_NUM_ACTIVE_SCRCTX               =  7,
    SCRIPTENV_SCRIPT                          =  8,
    SCRIPTENV_FACING_DIRECTION                =  9,
    SCRIPTENV_LAST_TALKED                     = 10,
    SCRIPTENV_CAMERA_FOCUS_OBJ                = 11,
    SCRIPTENV_34                              = 12,
    SCRIPTENV_SCRCTX_0                        = 13,
    SCRIPTENV_SCRCTX_1                        = 14,
    SCRIPTENV_SCRCTX_2                        = 15,
    SCRIPTENV_MSGFMT                          = 16,
    SCRIPTENV_STRBUF1                         = 17,
    SCRIPTENV_STRBUF2                         = 18,
    SCRIPTENV_WAITING_ICON                    = 19,
    SCRIPTENV_AC                              = 20,
    SCRIPTENV_GENERIC_WORK_PTR                = 21,
    SCRIPTENV_B4                              = 22,
    SCRIPTENV_B8                              = 23,
    SCRIPTENV_0C                              = 24,
    SCRIPTENV_54_0_00                         = 25,
    SCRIPTENV_54_0_04                         = 26,
    SCRIPTENV_54_0_08                         = 27,
    SCRIPTENV_EYE_TRAINER_1_NUM               = 28,
    SCRIPTENV_EYE_TRAINER_1_ENCTYPE           = 29,
    SCRIPTENV_EYE_TRAINER_1_OBJPTR            = 30,
    SCRIPTENV_54_0_18                         = 31,
    SCRIPTENV_54_1_00                         = 32,
    SCRIPTENV_54_1_04                         = 33,
    SCRIPTENV_54_1_08                         = 34,
    SCRIPTENV_EYE_TRAINER_2_NUM               = 35,
    SCRIPTENV_EYE_TRAINER_2_ENCTYPE           = 36,
    SCRIPTENV_EYE_TRAINER_2_OBJPTR            = 37,
    SCRIPTENV_54_1_18                         = 38,
    SCRIPTENV_BC                              = 39,
    SCRIPTENV_MONEY_BOX                       = 40,
    SCRIPTENV_DC                              = 41,
    SCRIPTENV_SPECIAL_VAR_8000                = 42,
    SCRIPTENV_SPECIAL_VAR_8001                = 43,
    SCRIPTENV_SPECIAL_VAR_8002                = 44,
    SCRIPTENV_SPECIAL_VAR_8003                = 45,
    SCRIPTENV_SPECIAL_VAR_8004                = 46,
    SCRIPTENV_SPECIAL_VAR_8005                = 47,
    SCRIPTENV_SPECIAL_VAR_8006                = 48,
    SCRIPTENV_SPECIAL_VAR_8007                = 49,
    SCRIPTENV_SPECIAL_VAR_8008                = 50,
    SCRIPTENV_SPECIAL_VAR_8009                = 51,
    SCRIPTENV_SPECIAL_VAR_800A                = 52,
    SCRIPTENV_SPECIAL_VAR_800B                = 53,
    SCRIPTENV_SPECIAL_VAR_RESULT              = 54,
    SCRIPTENV_SPECIAL_VAR_LAST_TALKED         = 55,
};

typedef struct TaskManager TaskManager;

typedef struct Location {
    int mapId;
    int warpId;
    int x;
    int y;
    int direction;
} Location;

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
    u16 forme;
    u16 dummy;
    u32 unk1C;
} FollowMon;

struct FieldSystemUnk108 {
    u32 personality;
    u16 species;
    u16 isRegistered;
    POKEMON *pokemon;
};

struct FieldSystemUnkSub0 {
    OVY_MANAGER *unk0;
    OVY_MANAGER *unk4;
    BOOL unk8;
    BOOL unkC;
};

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
    SavePokegear* pokegear_data; //0x30
    MomsSavings* savings_data;//0x34
    SAVEDATA* saveData; //0x38
    FieldSystem* sys; //0x3c
    struct PokegearRingingTask {
        SysTask *task;
        u8 counter;
    } gearRing;
} GearPhoneRingManager; //size: 0x48

struct UnkStruct_020FC5CC {
    u32 unk0_00:4;
    u32 unk0_04:4;
    u32 unk0_08:4;
    u32 unk0_0C:4;
    u32 unk0_10:4;
    u32 unk0_14:4;
    u32 unk0_18:8;
    u8 unk_4;
    u8 unk_5;
    u8 unk_6;
};

struct UnkStruct_02059E1C;
struct UnkStruct_0205AC88;

struct FieldSystemUnkSub68 {
    WINDOW unk0;
    u16 unk10;
    u8 unk12;
    u8 unk13_0:7;
    u8 unk13_7:1;
};

typedef struct FsysUnkSub4 {
    u8 filler_00[0xC];
    void *unk_0C; // weather related?
} FsysUnkSub4;

struct FieldSystem {
    struct FieldSystemUnkSub0 *unk0;
    FsysUnkSub4 *unk4;
    BGCONFIG* bg_config;
    SAVEDATA* savedata;
    TaskManager* taskman;
    MAP_EVENTS* map_events;
    int unk18;
    int unk1C;
    Location* location;
    GF_Camera *camera;
    void *unk28;
    FsysUnkSub2C *unk2C;
    MAPMATRIX* map_matrix;
    u8 filler34[0x8];
    MapObjectMan* mapObjectMan;
    FIELD_PLAYER_AVATAR *playerAvatar;
    void *unk_44;
    u8 filler48[0xC];
    void *unk54;
    u8 filler_58[0x8];
    u32 unk60;
    int unk64;
    struct FieldSystemUnkSub68* unk68;
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
    u8 filler_A4[0x8];
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
    u32 unk_10C[2];
    GearPhoneRingManager* unk114;
    BUGCONTEST* bugContest;
    u8 unk11C[0xC];
}; // size: 0x128

typedef BOOL (*ScrCmdFunc)(SCRIPTCONTEXT* ctx);

struct SCRIPTCONTEXT {
    u8 stack_depth;
    u8 mode;
    u8 comparison_result;
    u8 id;
    ScrCmdFunc native_ptr;
    const u8* script_ptr;
    const u8* stack[20];
    const ScrCmdFunc* cmd_table;
    u32 cmd_count;
    u32 data[4];
    TaskManager* taskman;
    MSGDATA* msg_data;
    u8* mapScripts;
    FieldSystem* fsys;
};

void InitScriptContext(SCRIPTCONTEXT* ctx, const ScrCmdFunc* cmd_table, u32 cmd_count);
BOOL SetupBytecodeScript(SCRIPTCONTEXT* ctx, const u8* ptr);
void SetupNativeScript(SCRIPTCONTEXT* ctx, ScrCmdFunc ptr);
void StopScript(SCRIPTCONTEXT* ctx);
void sub_0203FD68(SCRIPTCONTEXT* ctx, TaskManager *unk);
BOOL RunScriptCommand(SCRIPTCONTEXT* ctx);
BOOL ScriptPush(SCRIPTCONTEXT* ctx, const u8* ptr);
const u8* ScriptPop(SCRIPTCONTEXT* ctx);
void ScriptJump(SCRIPTCONTEXT* ctx, const u8* ptr);
void ScriptCall(SCRIPTCONTEXT* ctx, const u8* ptr);
void ScriptReturn(SCRIPTCONTEXT* ctx);
u16 ScriptReadHalfword(SCRIPTCONTEXT* ctx);
u32 ScriptReadWord(SCRIPTCONTEXT* ctx);

static inline void InitLocation(Location *location, int mapId, int warpId, int x, int y, int direction) {
    location->mapId = mapId;
    location->warpId = warpId;
    location->x = x;
    location->y = y;
    location->direction = direction;
}

#endif
