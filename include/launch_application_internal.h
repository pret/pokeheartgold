#ifndef POKEHEARTGOLD_FIELD_LAUNCH_APPLICATION_INTERNAL_H
#define POKEHEARTGOLD_FIELD_LAUNCH_APPLICATION_INTERNAL_H

#include "launch_application.h"
#include "naming_screen.h"
#include "unk_0202C034.h"

typedef enum PartyMenuMoveSelectState {
    PMMS_OPEN_PARTY_MENU,
    PMMS_WAIT_PARTY_MENU,
    PMMS_OPEN_SUMMARY,
    PMMS_WAIT_SUMMARY,
    PMMS_FREE,
} PartyMenuMoveSelectState;

typedef enum Unk0203E878State {
    UNK_0203E878_STATE_0,
    UNK_0203E878_STATE_1,
    UNK_0203E878_STATE_2,
} Unk0203E878State;

typedef enum Unk0203F134State {
    UNK_0203F134_STATE_0,
    UNK_0203F134_STATE_1,
} Unk0203F134State;

typedef enum WirelessTradeState {
    WIRELESS_TRADE_STATE_0,
    WIRELESS_TRADE_STATE_1,
    WIRELESS_TRADE_STATE_2,
    WIRELESS_TRADE_STATE_3,
    WIRELESS_TRADE_STATE_4,
    WIRELESS_TRADE_STATE_5,
    WIRELESS_TRADE_STATE_6,
    WIRELESS_TRADE_STATE_7,
} WirelessTradeState;

typedef struct UnkStruct_0203E6D4 {
    HeapID heapId;
    PartyMenuArgs *partyMenu;
    u8 unk8[0x4];
} UnkStruct_0203E6D4;

typedef struct UnkStruct_0203E878 {
    UnkStruct_0203E8C8 *unk0;
    u16 *unk4;
    u16 *unk8;
    EasyChatArgs *easyChat;
    int unk10;
} UnkStruct_0203E878;

typedef struct UnkStruct_0203F0D0 {
    Pokemon *mon;
    SaveFashionDataSub *unk4;
    FashionCase *fashionCase;
    Options *options;
    GameStats *gameStats;
    PlayerProfile *profile;
    int *unk18;
    int unk1C;
    MenuInputStateMgr *menuInputStatePtr;
} UnkStruct_0203F0D0;

typedef struct UnkStruct_0203F134 {
    int state;
    u16 *unk4;
    int unk8;
    UnkStruct_0203F0D0 *unkC;
} UnkStruct_0203F134;

typedef struct WirelessTradeSelectMonArgs {
    FieldSystem *fieldSystem;
    PlayerProfile *profile;
    Party *party;
    SavePalPad *palPad;
    SaveData *saveData;
    SaveWiFiHistory *wifiHistory;
    Options *options;
    GameStats *gameStats;
    Pokedex *pokedex;
    int unk24;
    int unk28;
    BOOL natDexEnabled;
    int unk30;
    PlayerProfile *partnerProfile;
    Pokemon *unk38;
    Pokemon *unk3C;
} WirelessTradeSelectMonArgs;

typedef enum TradeSequenceBackground {
    TS_BG_DAY,
    TS_BG_EVENING,
    TS_BG_NIGHT,
    TS_BG_UNK_3,
} TradeSequenceBackground;

typedef struct TradeSequenceArgs {
    BoxPokemon *unk0;
    BoxPokemon *unk4;
    PlayerProfile *partnerProfile;
    TradeSequenceBackground bgType;
    int unk10;
    Options *options;
    EvolutionTaskData *evolutionTaskData;
    u8 unk1C[0x4];
} TradeSequenceArgs;

typedef struct WirelessTradeData {
    int state;
    WirelessTradeSelectMonArgs wirelessTradeSelectMon;
    TradeSequenceArgs tradeSequence;
} WirelessTradeData;

typedef struct UnkStruct_0203F4C8 {
    struct UnkStruct_0205AC88 *unk0;
    Options *options;
} UnkStruct_0203F4C8;

typedef struct NamingScreenData {
    int state;
    int partyIdx;
    u16 *retVar;
    NamingScreenArgs *args;
    String *unk10;
} NamingScreenData;

typedef struct UnkStruct_0203F844 {
    int unk0;
    SysInfo *sysInfo;
    Party *party;
    PCStorage *pcStorage;
    Pokedex *pokedex;
    UnkStruct_021D2230 *unk14;
    SaveWiFiHistory *wifiHistory;
    PlayerProfile *profile;
    SaveData *saveData;
    Options *options;
    GameStats *gameStats;
    Bag *bag;
    BOOL natDexEnabled;
    void *unk34;
    u32 unk38;
    int unk3C;
} UnkStruct_0203F844;

typedef struct UnkStruct_0203E644 {
    u8 unk0[0x26];
    u8 partySlot;
} UnkStruct_0203E644;

typedef struct PartyMenuMoveSelectData {
    HeapID heapId;
    UnkStruct_0203E644 *unk4;
    PokemonSummaryArgs *pokemonSummary;
} PartyMenuMoveSelectData;

#endif // POKEHEARTGOLD_FIELD_LAUNCH_APPLICATION_INTERNAL_H
