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
    u16 unk_0E_2 : 1;
    u16 unk_0E_3 : 1;
    u16 : 12;
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

typedef struct HPGaugeUpdateMessage {
    u8 command;
    u8 level;
    s16 curHP;
    u16 maxHP;
    u8 padding_06;
    u8 gender;
    int hpCalcTemp;
    u32 exp;            // set but unused
    u32 expToNextLevel; // set but unused
} HPGaugeUpdateMessage;

typedef struct ExpGaugeUpdateMessage {
    u8 command;
    u8 padding_01[3];
    u32 curExp;
    u32 gainedExp;
    u32 expToNextLevel;
} ExpGaugeUpdateMessage;

typedef struct FaintingSequenceMessage {
    u8 command;
    u8 gender;
    u16 species;
    u32 personality;
    u8 form;
    u8 isSubstitute;
    u8 isTransformed;
    u8 unk_0B;
    u16 monSpecies[4];
    u8 monGenders[4];
    u8 monShiny[4];
    u8 monFormNums[4];
    u32 monPersonalities[4];
} FaintingSequenceMessage;

typedef struct PlaySoundMessage {
    u8 command;
    u8 unk_01;
    u16 sdatID;
} PlaySoundMessage;

typedef struct ToggleVanishMessage {
    u8 command;
    u8 toggle;
    u8 isSubstitute;
    u8 padding_03;
    u16 species[4];
    u8 gender[4];
    u8 isShiny[4];
    u8 formNum[4];
    u32 personality[4];
} ToggleVanishMessage;

typedef struct SetStatusIconMessage {
    u8 command;
    u8 status;
    u16 padding_02;
} SetStatusIconMessage;

typedef struct TrainerMsgMessage {
    u8 command;
    u8 msg;
    u16 padding_02;
} TrainerMsgMessage;

typedef struct ReturnMsgMessage {
    u8 command;
    u8 partySlot;
    u16 hpPercent;
} ReturnMsgMessage;

typedef struct SendOutMsgMessage {
    u8 command;
    u8 partySlot;
    u16 hpPercent; // out of 1000
} SendOutMsgMessage;

typedef struct LeadMonMsgMessage {
    u8 command;
    u8 padding_01[3];
    u8 partySlot[4];
} LeadMonMsgMessage;

typedef struct AlertMsgMessage {
    u8 command;
    u8 padding_01[3];
    BattleMessage msg;
} AlertMsgMessage;

typedef struct RefreshHPGaugeMessage {
    u8 command;
    u8 level;
    s16 curHP;
    u16 maxHP;
    u8 partySlot;
    u8 status : 5;
    u8 gender : 2;
    u8 caughtSpecies : 1;
    u32 curExp;
    u32 maxExp;
    int numSafariBalls;
} RefreshHPGaugeMessage;

typedef struct UpdatePartyMonMessage {
    u8 command;
    u8 partySlot : 4;
    u8 mimickedMoveSlot : 4;
    s16 curHP;
    u32 status;
    u32 knockedOffItemsMask;
    u16 heldItem;
    u16 moves[4];
    u8 ppCur[4];
    u8 padding_16[2];
    u32 status2;
    u16 formNum;
    u8 padding_1E[2];
    int ability;
    u16 updateStats;
    u16 updateForm;
} UpdatePartyMonMessage;

typedef struct RefreshPartyStatusMessage {
    u8 command;
    u8 ability;
    u16 move;
} RefreshPartyStatusMessage;

typedef struct ForgetMoveMessage {
    u8 command;
    u8 slot;
    u16 move;
} ForgetMoveMessage;

typedef struct MosaicSetMessage {
    u8 command;
    u8 intensity;
    u8 wait;
    u8 padding_03;
} MosaicSetMessage;

typedef struct MonChangeFormMessage {
    u8 command;
    u8 formNum;
    u16 species;
    u8 gender;
    u8 isShiny;
    u8 padding_06[2];
    u32 personality;
} MonChangeFormMessage;

typedef struct PartyGaugeData {
    u8 command;
    u8 padding_01;
    u8 status[6];
} PartyGaugeData;

typedef struct RecordIncrementMessage {
    u8 command;
    u8 battlerType;
    u16 record;
} RecordIncrementMessage;

typedef struct LinkWaitMsgMessage {
    u8 command;
    u8 padding_01;
    u16 recordedInputCount;
    u8 recordedInputs[28];
} LinkWaitMsgMessage;

typedef struct EscapeMsgMessage {
    u8 command;
    u8 escaperBitmask;
    u16 recordedInputCount;
    u8 recordedInputs[28];
} EscapeMsgMessage;

typedef struct ForfeitMsgMessage {
    u8 command;
    u8 padding_01;
    u16 recordedInputCount;
    u8 recordedInputs[28];
} ForfeitMsgMessage;

typedef struct MoveHitSoundMessage {
    u8 command;
    u8 effectiveness;
    u8 padding_02[2];
} MoveHitSoundMessage;

typedef struct MusicPlayMessage {
    u8 command;
    u8 padding_01;
    u16 bgmID;
} MusicPlayMessage;

typedef struct ResultSubmitMessage {
    u8 command;
    u8 padding_01;
    u16 recordedInputCount;
    u32 resultMask;
    u8 recordedInputs[28];
} ResultSubmitMessage;

typedef struct CommandClearMsg {
    u8 command;
    u8 netID;
    u16 padding_02;
} CommandClearMsg;

typedef struct Message_022645C8 {
    u8 command;
    u8 unk1;
    u8 filler[2];
} Message_022645C8;

#endif
