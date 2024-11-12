#ifndef POKEHEARTGOLD_TRAINER_HOUSE_H
#define POKEHEARTGOLD_TRAINER_HOUSE_H

#include "pokemon_types_def.h"

typedef struct THOUSE_MON {
    u16 species : 11; // 0
    u16 form : 5;
    u16 item;                          // 2
    u16 moves[4];                      // 4
    u32 otId;                          // C
    u32 personality;                   // 10
    u32 IVs;                           // 14
    u8 EVs[6];                         // 18
    u8 ppUpFlags;                      // 1E
    u8 language;                       // 1F
    u8 ability;                        // 20
    u8 friendship;                     // 21
    u8 filler_22[2];                   // 22
    u16 nickname[POKEMON_NAME_LENGTH]; // 24
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
    u16 otName[PLAYER_NAME_LENGTH + 1];
    u16 unk14[8];
    MailMessage win;
    MailMessage lose;
    THOUSE_MON party[PARTY_SIZE];
} THOUSE_TEAM;

#endif // POKEHEARTGOLD_TRAINER_HOUSE_H
