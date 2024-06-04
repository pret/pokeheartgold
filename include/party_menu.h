#ifndef POKEHEARTGOLD_PARTY_MENU_H
#define POKEHEARTGOLD_PARTY_MENU_H

#include "bag_types_def.h"
#include "constants/party_menu.h"
#include "gf_3d_vramman.h"
#include "mail.h"
#include "message_printer.h"
#include "pokedex.h"
#include "task.h"
#include "unk_02014DA0.h"
#include "unk_02020654.h"
#include "unk_0202E41C.h"
#include "yes_no_prompt.h"

#define FIELD_MOVE_CHECK_TREE_F                   0
#define FIELD_MOVE_CHECK_WATER_F                  2
#define FIELD_MOVE_CHECK_ROCK_F                   3
#define FIELD_MOVE_CHECK_BREAKROCK_F              4
#define FIELD_MOVE_CHECK_WATERFALL_F              5
#define FIELD_MOVE_CHECK_ROCKCLIMB_F              6
#define FIELD_MOVE_CHECK_FLASH_F                  7
#define FIELD_MOVE_CHECK_WHIRLPOOL_F             12
#define FIELD_MOVE_CHECK_HEADBUTT_F              13

typedef struct UnkTemplate_0207E590 {
    int unk_00;
    LISTMENUITEM *unk_04;
    u8 unk_08;
    u8 unk_09;
    u8 unk_0A;
    u8 unk_0B;
} UnkTemplate_0207E590;

typedef struct UnkStruct_0207E590 {
    u8 unk_0;
    u8 unk_1;
    u8 unk_2;
    u8 unk_3;
    UnkTemplate_0207E590 unk_4;
} UnkStruct_0207E590;

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
    u8 filler_2D[1];
    u8 contestStat;
    u8 unk_2F;
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

typedef void (*PartyMenuStruct_SubC90_UnkFunc)(PartyMenuStruct *partyMenu, int *a1);
#define PARTYMENUSTRUCT_SUBC90_UNKFUNC_NONE ((PartyMenuStruct_SubC90_UnkFunc)-2)

typedef struct PartyMenuStruct_SubC90 {
    u8 unk_0[0x8];
    PartyMenuStruct_SubC90_UnkFunc unk_8;
    int unk_C;
} PartyMenuStruct_SubC90;

typedef struct PartyMenuStruct_Sub828 {
    String *nickname; // 828
    u16 species;      // 82C
    u16 hp;           // 82E
    u16 maxHp;        // 830
    u16 level;        // 832
    u16 heldItem;     // 834
    u16 unk_0E_00:12; // 836
    u16 unk_0E_0C:1;
    u16 gender:2;
    u16 unk_0E_0F:1;
    u8 isEgg;         // 838
    u8 form;          // 839
    u16 capsule;      // 83A
    u8 filler_14[0x19];
    u8 active;        // 855
} PartyMenuStruct_Sub828;

struct PartyMenuStruct {
    BgConfig *bgConfig;
    u8 filler_004[0x200];
    Window unk_204;
    Window unk_214;
    Window unk_224;
    Window unk_234;
    u8 filler_244[0xD0];
    u16 unk_314[6 * 0x10];
    u16 unk_3D4[6 * 0x10];
    u16 unk_494[6 * 0x10];
    u16 unk_554[0x80];
    PartyMenuArgs *args; //0x654
    u8 filler_658[0x4];
    SpriteGfxHandler *unk_65C;
    u8 filler_660[0x18];
    Sprite *unk_678;
    u8 filler_67C[0x4];
    Sprite *unk_680;
    Sprite *unk_684;
    u8 filler_688[0x134];
    MessagePrinter *msgPrinter; //0x7bc
    MsgData *msgData; //0x7c0
    MessageFormat* msgFormat; //0x7c4
    String *strbuf; //0x7c8
    String *unk_7CC;
    String *unk_7D0[20];
    LISTMENUITEM *filler_820;
    UnkStruct_0207E590 *unk_824;
    PartyMenuStruct_Sub828 unk_828[PARTY_SIZE];
    const UnkStruct_02020654 (*unk_948)[8];
    u8 filler_94C[0x308];
    int (*unk_C54)(PartyMenuStruct *);
    int (*unk_C58)(PartyMenuStruct *);
    int (*unk_C5C)(PartyMenuStruct *);
    u8 filler_C60[2];
    u8 unk_C62;
    u8 unk_C63;
    u8 unk_C64;
    u8 partyMonIndex; // 0xc65
    u8 unk_C66;
    u8 filler_C67[0xD];
    Pokedex *pokedex; // 0xc74
    int unk_C78;
    BOOL unk_C7C;
    IconFormChangeData *iconFormChange; // C80
    GF3DVramMan *unk_C84; // C84
    YesNoPrompt *yesNoPrompt;
    u8 filler_C8C[4];
    PartyMenuStruct_SubC90 unk_C90;
    u8 filler_CA0[0x8];
}; // CA8

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

extern const OVY_MGR_TEMPLATE gOverlayTemplate_PartyMenu;

void sub_02079224(PartyMenuStruct *partyMenu, int BOOL);
void sub_0207991C(PartyMenuStruct *partyMenu, int a1);
BOOL sub_02079E38(PartyMenuStruct *partyMenu, u8 partySlot);
u16 *sub_0207A16C(PartyMenuStruct *partyMenu);
u32 sub_0207CA9C(void);
u32 sub_0207CAA0(void);
u32 sub_0207CAA4(void);
u32 sub_0207CAA8(void);
void sub_0207CB6C(PartyMenuStruct *partyMenu);

#endif //POKEHEARTGOLD_PARTY_MENU_H
