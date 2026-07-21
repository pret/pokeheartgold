#ifndef POKEHEARTGOLD_OVERLAY_03_H
#define POKEHEARTGOLD_OVERLAY_03_H

#include "bag_types_def.h"
#include "dex_mon_measures.h"
#include "game_stats.h"
#include "list_menu.h"
#include "mart.h"
#include "safari_zone.h"
#include "save_vars_flags.h"
#include "script.h"
#include "unk_02031B0C.h"

#include "field/ov01_021E7FDC.h"
#include "pokeathlon/pokeathlon_save.h"

enum PokeathlonData {
    OVERALL_DATA,
    EVENT_DATA,
    ACTION_DATA
};

enum MartTypes {
    MART_TYPE_NORMAL = 0,
    MART_TYPE_1, // MART_TYPE_DECOR?
    MART_TYPE_SEAL,
    MART_TYPE_3, // MART_TYPE_FRONTIER?
    MART_TYPE_4, // MART_TYPE_POKEATHLON?
};

enum BattleRegulationValidationResult {
    BATTLE_REGULATION_VALIDATION_RESULT_SUCCESS = 0,
    BATTLE_REGULATION_VALIDATION_RESULT_TOTAL_LEVEL_EXCEEDED,
    BATTLE_REGULATION_VALIDATION_RESULT_DUPLICATE_SPECIES,
    BATTLE_REGULATION_VALIDATION_RESULT_DUPLICATE_ITEMS,
    BATTLE_REGULATION_VALIDATION_RESULT_INVALID_TEAM_SIZE,
    BATTLE_REGULATION_VALIDATION_RESULT_INVALID_POKEMON,
};

typedef struct UnkMiniStruct {
    u8 unk0[4];
} UnkMiniStruct;

typedef struct MartData {
    BgConfig *bgConfig;
    BagView *bagView;
    Window windows[6];
    u8 unk68[0x20];
    MsgData *messageData;
    MessageFormat *messageFormat;
    Camera *camera;
    UnkStruct_ov01_021E7FDC unk_ov01_021E7FDC;
    Sprite *sprites[19];
    u16 spriteDrawn[2]; // Draw flags for sprites 0 and 1.
    PlayerProfile *playerProfile;
    void *inventory;
    Options *options;
    PokeathlonSave *pokeathlonSave;
    SaveApricornBox *apricornBox;
    GameStats *gameStats;
    SaveVarsFlags *varsFlags;
    u32 unk264;
    u16 *unk268;
    const struct MartItem *priceOverrides;
    u8 unk270;
    u8 unk271;
    u8 state;
    u8 unk273;
    String *string;
    u8 bgPriority[4];
    u32 engineAPlanes;
    u8 printerID;
    u8 unk281;
    u8 unk282;
    u8 martType;
    u16 item;
    s16 quantity;
    u16 unk288;
    u16 unk28A;
    int cost;
    int unk290;
    u32 unk294;
    u32 unk298;
    UnkMiniStruct unk29C;
    u32 unk2A0;
} MartData;

void ov03_02255BB0(FieldSystem *fieldSystem, u32 commType, u16 arg2, u16 arg3);
void ov03_02255BEC();
u32 ov03_02255BFC();
void ov03_02255C18(FieldSystem *fieldSystem, u32 commType, u16 arg2, u16 arg3);
void ov03_02255C54();
u32 ov03_02255C64();

void StartTask_BattleRegulationMenu(TaskManager *taskManager, u16 *result);
void ov03_022566D0(FieldSystem *fieldSystem, MessageFormat *messageFormat, u32 ruleset);
void ov03_02256710(FieldSystem *fieldSystem, u16 a1);
void ov03_02256730(FieldSystem *fieldSystem, Window *window, u32 ruleset);
u16 ov03_02256A2C(FieldSystem *fieldSystem, MessageFormat *msgFmt, u32 a2);
u32 ov03_02256B40(int);

BOOL Task_Mart(TaskManager *taskManager);
int ov03_02257814(MartData *data, u32 unkAmount);
int ov03_02257978(MartData *data, int itemID);
u32 ov03_02258120(MartData *data, u16 itemID);
void ov03_022581BC(MartData *data);
void ov03_02258910(FieldSystem *fieldSystem);
void ov03_02258CFC(TaskManager *taskManager, enum PokeathlonData data);

#endif // POKEHEARTGOLD_OVERLAY_03_H
