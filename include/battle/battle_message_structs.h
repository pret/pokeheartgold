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
    u16 battleMonSpecies[4];
    u8 battleMonGenders[4];
    u8 battleMonIsShiny[4];
    u8 battleMonFormNums[4];
    u32 battleMonPersonalities[4];
} MonShowMessage;

typedef struct MonReturnMessage {
    u8 command;
    u8 yOffset;
    u16 capturedBall;
    int isSubstitute;
    u16 battleMonSpecies[4];
    u8 battleMonGenders[4];
    u8 battleMonIsShiny[4];
    u8 battleMonFormNums[4];
    u32 battleMonPersonalities[4];
    u32 unk2C;
} MonReturnMessage;

typedef struct OpenCaptureBallMessage {
    u8 command;
    u8 yOffset;
    u16 ball;
} OpenCaptureBallMessage;

typedef struct TrainerEncounterMessage {
    u8 command;
    u8 trainerGender;
    u16 trainerType;
} TrainerEncounterMessage;

typedef struct TrainerThrowBallMessage {
    u8 command;
    u8 ballTypeIn;
    u16 selectedPartySlot;
} TrainerThrowBallMessage;

typedef struct TrainerSlideInMessage {
    u8 command;
    u8 trainerGender;
    u16 trainerType;
    int posIn;
} TrainerSlideInMessage;

typedef struct HealthBoxData {
    u8 command;
    u8 level;
    s16 curHP;
    u16 maxHP;
    u8 selectedPartySlot;
    u8 status : 5;
    u8 gender : 2;
    u8 speciesCaught : 1;
    u32 expFromLastLevel;
    u32 expToNextLevel;
    int numSafariBalls;
    u8 delay;
} HealthBoxData;

typedef struct CommandSetMessage {
    u8 command;
    u8 partySlot;
    u8 expPercents[6];
    u8 ballStatus[2][6];
    u16 moves[4];
    u8 curPP[4];
    u8 maxPP[4];
    s16 curHP;
    u16 maxHP;
    u8 ballStatusBattler;
    u8 switchingOrCanPickCommandMask;
    u16 padding_2A;
} CommandSetMessage;

#endif
