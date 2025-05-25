#ifndef GUARD_POKEHEARGOLD_APPLICATION_POKEGEAR_RADIO_RADIO_INTERNAL_H
#define GUARD_POKEHEARGOLD_APPLICATION_POKEGEAR_RADIO_RADIO_INTERNAL_H

#include "application/pokegear/pokegear_internal.h"

typedef struct RadioShow {
    HeapID unk_00;         // 0x00
    SaveData *unk_04;      // 0x04
    u16 unk_08;            // 0x08
    u16 unk_0A;            // 0x0A
    Window *unk_0C;        // 0x0C
    Window *unk_10;        // 0x10
    Window *unk_14;        // 0x14
    u32 unk_18;            // 0x18
    u32 unk_1C;            // 0x1C
    MsgData *unk_20;       // 0x20
    u8 filler_24[4];       // 0x24
    RTCDate unk_28;        // 0x28
    RTCTime unk_38;        // 0x38
    MessageFormat *unk_44; // 0x44
    String *unk_48;        // 0x48
    String *unk_4C;        // 0x4C
    String *unk_50;        // 0x50
    u32 unk_54;            // 0x54
    u8 unk_58;             // 0x58
    u8 unk_59;             // 0x59
    u8 unk_5A;             // 0x5A
    u8 unk_5B;             // 0x5B
    u8 unk_5C;             // 0x5C
    u8 unk_5D;             // 0x5D
    u8 unk_5E;             // 0x5E
    u8 unk_5F;             // 0x5F
    u8 unk_60;             // 0x60
    u8 unk_61;             // 0x61
    u8 unk_62;             // 0x62
    u8 unk_63;             // 0x63
    u8 unk_64;             // 0x64
    u8 unk_65;             // 0x65
    u8 unk_66_0 : 1;       // 0x66
    u8 unk_66_1 : 1;       // 0x66
    u8 unk_66_2 : 1;       // 0x66
    u8 unk_66_3 : 1;       // 0x66
    u8 unk_66_4 : 1;       // 0x66
    u8 unk_67;             // 0x67
    u8 unk_68;             // 0x68
    u8 unk_69;             // 0x69
    u8 unk_6A;             // 0x6A
    String *unk_6C;        // 0x6C
    String *unk_70;        // 0x70
} RadioShow;               // size: 0x74

typedef struct PokegearRadioAppData {
    HeapID heapId;             // 0x00
    int unk_04;                // 0x04
    int unk_08;                // 0x08
    PokegearAppData *pokegear; // 0x0C
    Sprite *unk_10[5];         // 0x10
    u8 unk_24_0 : 1;           // 0x24
    u8 unk_24_1 : 4;           // 0x24
    u8 unk_24_5 : 3;           // 0x24
    u8 unk_25;                 // 0x25
    u8 unk_26_0 : 4;           // 0x26
    u8 unk_26_4 : 2;           // 0x26
    u8 unk_26_6 : 2;           // 0x26
    u8 unk_27;                 // 0x27
    s16 unk_28;                // 0x28
    s16 unk_2A;                // 0x2A
    u16 unk_2C;                // 0x2C
    u16 unk_2E_0 : 15;         // 0x2E
    u16 unk_2E_15 : 1;         // 0x2E
    Window unk_30[3];          // 0x30
    RadioShow *unk_60;         // 0x60
    void *unk_64;              // 0x64
    NNSG2dScreenData *unk_68;  // 0x68
} PokegearRadioAppData;        // size: 0x6C

BOOL ov101_021F49F8(PokegearRadioAppData *radioApp);
BOOL ov101_021F4A4C(PokegearRadioAppData *radioApp);

void ov101_021F4FCC(void *cbArg);
void ov101_021F4FDC(void *cbArg);
void ov101_021F5048(PokegearRadioAppData *radioApp);
void ov101_021F5090(PokegearRadioAppData *radioApp);
void ov101_021F50D8(PokegearAppData *pokegear, void *cbArg);
void ov101_021F50F0(PokegearRadioAppData *radioApp, int a1);
BOOL ov101_021F51C0(PokegearRadioAppData *radioApp, int a1);
int ov101_021F5304(PokegearRadioAppData *radioApp);
int ov101_021F5468(PokegearRadioAppData *radioApp, BOOL *inputWasTouch);
u8 ov101_021F54AC(PokegearRadioAppData *radioApp, s16 x, s16 y, u8 *a3);
int ov101_021F5524(PokegearRadioAppData *radioApp, BOOL *inputWasTouch);
int ov101_021F5650(PokegearRadioAppData *radioApp);
BOOL ov101_021F56B4(PokegearRadioAppData *radioApp, s16 x, s16 y);
void ov101_021F5780(PokegearRadioAppData *radioApp, u8 a1);

RadioShow *ov101_021F57B8(SaveData *saveData, u16 mapID, u16 mapHeader, BOOL inKanto, Window *win1, Window *win2, Window *win3, u32 textColor, HeapID heapId);
void ov101_021F58A0(RadioShow *radioShow);
void ov101_021F5970(RadioShow *radioShow, int a1, int a2);
void ov101_021F5A50(RadioShow *radioShow);
void ov101_021F5A9C(RadioShow *radioShow, int a1);
void ov101_021F5B94(RadioShow *radioShow);

void RadioShow_PokemonMusic_Setup(RadioShow *radioShow);
int RadioShow_PokemonMusic_Print(RadioShow *radioShow);
void RadioShow_PokemonMusic_Teardown(RadioShow *radioShow);

void RadioShow_PokemonTalk_Setup(RadioShow *radioShow);
int RadioShow_PokemonTalk_Print(RadioShow *radioShow);
void RadioShow_PokemonTalk_Teardown(RadioShow *radioShow);

void RadioShow_PokemonSearchParty_Setup(RadioShow *radioShow);
int RadioShow_PokemonSearchParty_Print(RadioShow *radioShow);
void RadioShow_PokemonSearchParty_Teardown(RadioShow *radioShow);

void RadioShow_SerialRadioDrama_Setup(RadioShow *radioShow);
int RadioShow_SerialRadioDrama_Print(RadioShow *radioShow);
void RadioShow_SerialRadioDrama_Teardown(RadioShow *radioShow);

void RadioShow_BuenasPassword_Setup(RadioShow *radioShow);
int RadioShow_BuenasPassword_Print(RadioShow *radioShow);
void RadioShow_BuenasPassword_Teardown(RadioShow *radioShow);

void RadioShow_TrainerProfiles_Setup(RadioShow *radioShow);
int RadioShow_TrainerProfiles_Print(RadioShow *radioShow);
void RadioShow_TrainerProfiles_Teardown(RadioShow *radioShow);

void RadioShow_ThatTownThesePeople_Setup(RadioShow *radioShow);
int RadioShow_ThatTownThesePeople_Print(RadioShow *radioShow);
void RadioShow_ThatTownThesePeople_Teardown(RadioShow *radioShow);

void RadioShow_PokeFlute_Setup(RadioShow *radioShow);
int RadioShow_PokeFlute_Print(RadioShow *radioShow);
void RadioShow_PokeFlute_Teardown(RadioShow *radioShow);

void RadioShow_Unown_Setup(RadioShow *radioShow);
int RadioShow_Unown_Print(RadioShow *radioShow);
void RadioShow_Unown_Teardown(RadioShow *radioShow);

void RadioShow_TeamRocket_Setup(RadioShow *radioShow);
int RadioShow_TeamRocket_Print(RadioShow *radioShow);
void RadioShow_TeamRocket_Teardown(RadioShow *radioShow);

void RadioShow_MahoganySignal_Setup(RadioShow *radioShow);
int RadioShow_MahoganySignal_Print(RadioShow *radioShow);
void RadioShow_MahoganySignal_Teardown(RadioShow *radioShow);

void RadioShow_Commercials_Setup(RadioShow *radioShow);
int RadioShow_Commercials_Print(RadioShow *radioShow);
void RadioShow_Commercials_Teardown(RadioShow *radioShow);

#endif // GUARD_POKEHEARGOLD_APPLICATION_POKEGEAR_RADIO_RADIO_INTERNAL_H
