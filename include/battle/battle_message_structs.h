#ifndef POKEHEARTGOLD_BATTLE_BATTLE_MESSAGE_STRUCTS_H
#define POKEHEARTGOLD_BATTLE_BATTLE_MESSAGE_STRUCTS_H

#include "battle/battle.h"

typedef struct EncounterAnimationMessage {
    int command;
    u32 seed;
} EncounterAnimationMessage;

typedef struct MonEncounterMessage {
    u8 command;
    u8 gender : 2;
    u8 isShiny : 1;
    u8 formNum : 5;
    u16 species;
    u32 personality;
    u32 cryModulation;
    // These arrays are set but never used
    u16 moves[4];
    u16 curPP[4];
    u16 maxPP[4];
    u16 nickname[POKEMON_NAME_LENGTH + 1];
    u8 padding_3A[2];
} MonEncounterMessage;

typedef struct MonShowMessage {
    u8 command;
    u8 gender : 2;
    u8 isShiny : 1;
    u8 formNum : 5;
    u16 species;
    u32 personality;
    u32 cryModulation;
    int selectedPartySlot;
    int capturedBall;
    int isQuickSendOut;
    u16 moves[4];
    u16 curPP[4];
    u16 maxPP[4];
    u16 nickname[POKEMON_NAME_LENGTH + 1];
    u8 padding_46[2];
    int partnerPartySlot;
    int isSubstitute;
    u16 battleMonSpecies[6];
    u8 battleMonGenders[6];
    u8 battleMonIsShiny[6];
    u8 battleMonFormNums[6];
    u32 battleMonPersonalities[6];
} MonShowMessage;

#endif
