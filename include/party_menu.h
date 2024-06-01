#ifndef POKEHEARTGOLD_PARTY_MENU_H
#define POKEHEARTGOLD_PARTY_MENU_H

#include "bag_types_def.h"
#include "constants/party_menu.h"
#include "mail.h"
#include "task.h"
#include "unk_02014DA0.h"
#include "unk_0202E41C.h"

#define FIELD_MOVE_CHECK_TREE_F                   0
#define FIELD_MOVE_CHECK_WATER_F                  2
#define FIELD_MOVE_CHECK_ROCK_F                   3
#define FIELD_MOVE_CHECK_BREAKROCK_F              4
#define FIELD_MOVE_CHECK_WATERFALL_F              5
#define FIELD_MOVE_CHECK_ROCKCLIMB_F              6
#define FIELD_MOVE_CHECK_FLASH_F                  7
#define FIELD_MOVE_CHECK_WHIRLPOOL_F             12
#define FIELD_MOVE_CHECK_HEADBUTT_F              13

typedef struct FieldMoveUseData {
    TaskManager *taskManager;
    u16 partySlot;
    u16 fieldMoveIdx;
} FieldMoveUseData;

typedef struct FieldMoveCheckData {
    u32 mapId;
    FieldSystem *fieldSystem;
    LocalMapObject *facingObject;
    u16 flag;
} FieldMoveCheckData;

typedef struct PartyMenuArgs {
    Party *party;
    Bag *bag;
    MAILBOX *mailbox;
    Options *options;
    UnkStruct_0202E474 *unk10;
    int unk_14;
    FieldMoveCheckData *fieldMoveCheckData;
    FieldSystem *fieldSystem;
    BOOL *unk20;
    u8 unk_24;
    u8 unk_25;
    u8 partySlot;
    u8 selectedAction;
    u16 itemId;
    u16 unk2A;
    u8 unk2C;
    u8 filler_2D[3];
    u8 unk_30[3];
    u8 filler_33[3];
    u8 unk_36_0:4;
    u8 unk_36_4:4;
    u8 unk_37;
    int unk_38;
    u16 species;
    int unk_40;
} PartyMenuArgs;

typedef struct IconFormChangeData  {
    int state;
    int effectTimer;
    int duration;
    int species;
    int fileId;
    int partyMonIndex; //same information as B's unkc65
    ParticleSystem* particleSystem;
} IconFormChangeData;

typedef struct PartyMenuStruct PartyMenuStruct;

struct PartyMenuStruct {
    BgConfig *unk_000;
    u8 filler_004[0x650];
    PartyMenuArgs* unk_654; //0x654
    u8 filler_658[0x4];
    SpriteGfxHandler *unk_65C;
    u8 filler_660[0x18];
    Sprite *unk_678;
    u8 filler_67C[0x144];
    MsgData* msgData; //0x7c0
    MessageFormat* msgFormat;
    String* strbuf;
    u8 unk7cc[0x488];
    int (*unk_C54)(PartyMenuStruct *);
    u8 filler_C58[0xC];
    u8 unk_C64;
    u8 partyMonIndex; //selected index..?
    u8 filler_C66[0x1a];
    IconFormChangeData* iconFormChange;
    u8 filler_C84[0x24];
};

#define FIELD_MOVE_FUNC_USE      0
#define FIELD_MOVE_FUNC_CHECK    1

typedef void (*FieldMoveUseFunc)(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *sub);
typedef u32 (*FieldMoveCheckFunc)(const struct FieldMoveCheckData *checkData);

struct FieldUseMoveEnv {
    u32 magic;
    LocalMapObject *facingObject;
    struct FieldMoveUseData useData;
};

struct TeleportFieldEnv {
    Pokemon *mon;
    struct FlyTaskStruct *flySub; // waste of space
};

void sub_0207CB6C(PartyMenuStruct *partyMenu);

#endif //POKEHEARTGOLD_PARTY_MENU_H
