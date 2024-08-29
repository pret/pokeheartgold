#ifndef POKEHEARTGOLD_RADIO_SHOW_H
#define POKEHEARTGOLD_RADIO_SHOW_H

#include "msgdata.h"

struct RadioShowPokemonMusic {
    int unk0;
    u8 nationalDex : 1;
    u8 msgno;
    u8 weekday;
    u8 songIdx; // 4 = random
    u8 state;
    RTCDate dateAtSetup;
    RTCDate dateAtLoopStart;
    u8 filler_2C[12];
}; // size: 0x38

struct RadioShowPokemonTalk {
    u8 filler_00[6];
    u16 unk_06;
    u16 unk_08;
    u16 unk_0A;
    u16 unk_0C;
    u16 unk_0E;
    u16 unk_10[10][2];
    u16 unk_38[150];
    u8 filler_164[118];
    u8 filler_1DA[118];
    u8 filler_250[4];
}; // size: 0x254

struct RadioShowPokemonSearchParty {
    u8 filler_00[6];
    u16 unk_06;
    u8 gameProgress[8];
    u8 availableSegments[13];
};

struct RadioShowSerialRadioDrama {
    u8 filler_00[6];
    u16 unk_06;
};

struct RadioShowBuenasPassword {
    u8 filler_00[6];
    u16 unk_06;
};

struct RadioShowTrainerProfiles {
    u8 filler_00[6];
    u8 unk_06[3];
};

struct RadioShowThatTownThesePeople {
    u8 filler_00[10];
    u8 gameProgress[5];
    u8 availableSegments[20];
};

struct RadioShowUnown {
    u8 unk_00[4];
};

struct RadioShowTeamRocket {
    u8 unk_00[8];
};

struct RadioShowMahoganySignal {
    u8 unk_00[4];
};

struct RadioShowCommercials {
    u8 unk_00[8];
    u8 gameProgress[8];
    u8 availableCommercials[36];
};

union RadioShow {
    struct RadioShowPokemonMusic pokemonMusic;
    struct RadioShowPokemonTalk pokemonTalk;
    struct RadioShowPokemonSearchParty pokemonSearchParty;
    struct RadioShowSerialRadioDrama serialRadioDrama;
    struct RadioShowBuenasPassword buenasPassword;
    struct RadioShowTrainerProfiles trainerProfiles;
    struct RadioShowThatTownThesePeople thatTownThesePeople;
    struct RadioShowUnown unown;
    struct RadioShowTeamRocket teamRocket;
    struct RadioShowMahoganySignal mahoganySignal;
    struct RadioShowCommercials commercials;
};

struct RadioSys {
    u8 filler_00[0x4];
    SaveData *saveData;
    u8 filler_08[0x14];
    union RadioShow *show;
    u8 filler_20[0x4];
    MsgData *msgData;
    u8 filler_28[0x24];
    String *line1;
    String *line2;
    u8 filler_54[0xD];
    u8 unk_61;
    u8 filler_62[0x4];
    u8 unk_66_0 : 1;
};

#endif // POKEHEARTGOLD_RADIO_SHOW_H
