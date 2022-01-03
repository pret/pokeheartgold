#ifndef POKEHEARTGOLD_TRAINER_HOUSE_H
#define POKEHEARTGOLD_TRAINER_HOUSE_H

#include "pokemon_types_def.h"

typedef struct THOUSE_MON {
    u16 species:11;
    u16 forme:5;
    u16 item;
    u16 moves[4];
    u32 otId;
    u32 personality;
    u32 IVs;
    u8 EVs;
    u8 ppUpFlags;
    u8 language;
    u8 ability;
    u8 friendship;
    u8 unk_22;
    u8 unk_23;
    u16 nickname[POKEMON_NAME_LENGTH];
} THOUSE_MON;

typedef struct THOUSE_TEAM {
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u8 unk4;
    u8 language;
    u8 version;
    u8 unk7;
    u16 otName[OT_NAME_LENGTH + 1];
    u16 unk14[8];
    MAIL_MESSAGE win;
    MAIL_MESSAGE lose;
    THOUSE_MON party[PARTY_SIZE];
} THOUSE_TEAM;

#endif //POKEHEARTGOLD_TRAINER_HOUSE_H
