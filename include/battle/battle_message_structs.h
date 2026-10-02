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

typedef struct MoveSelectMenuMessage {
    u8 command;
    u8 partySlot;
    u16 invalidMoves;
    u16 moves[4];
    u8 ppCur[4];
    u8 ppMax[4];
} MoveSelectMenuMessage;

typedef struct TargetSelectMenuMessage {
    u8 command;
    u8 shouldHidePanel;
    u16 range;
    TargetPokemon targetMon[4];
} TargetSelectMenuMessage;

typedef struct BagMenuMessage {
    u8 command;
    u8 hasTwoOpponents;
    u8 semiInvulnerable;
    u8 substitute;
    u8 partySlots[4];
    u8 partyOrder[4][6];
    u8 embargoTurns[4];
} BagMenuMessage;

typedef struct BattleItemUse {
    u16 item;
    u8 category;
    u8 target;
} BattleItemUse;

typedef struct PartyMenuMessage {
    u8 command;
    u8 battler;
    u8 listMode;
    u8 doublesSelection;
    u8 selectedPartySlot[4];
    u8 partyOrder[4][6];
    int canSwitch;
    u8 battlersSwitchingMask;
    u8 padding_25[3];
} PartyMenuMessage;

typedef struct YesNoMenuMessage {
    u8 command;
    u8 yesNoType;
    u16 promptMsg;
    int move;
    int nickname;
} YesNoMenuMessage;

typedef struct AttackMsgMessage {
    u8 command;
    u8 partySlot;
    u16 move;
} AttackMsgMessage;

typedef struct MoveAnimation {
    u8 command;
    u8 unk_01;
    u16 move;
    s32 damage;
    u16 power;
    u16 effectChance;
    u16 friendship;
    u16 isSubstitute : 1;
    u16 isTransformed : 1;
    u16 : 14;
    u32 fieldConditions;
    u16 attacker;
    u16 defender;
    u16 species[4];
    u8 genders[4];
    u8 isShiny[4];
    u8 formNums[4];
    u32 personalities[4];
    u32 moveEffectMasks[4];
    int animMode;
    int secondaryAnimID;
    int terrain;
} MoveAnimation;


#endif
