#ifndef POKEHEARTGOLD_TRAINER_DATA_H
#define POKEHEARTGOLD_TRAINER_DATA_H

#ifndef PM_ASM
#include "pm_string.h"
#include "mail_message.h"
#include "pokemon_types_def.h"
#include "constants/pokemon.h"

typedef enum TrainerAttr {
    TRATTR_TYPE,
    TRATTR_CLASS,
    TRATTR_UNK2,
    TRATTR_NPOKE,
    TRATTR_ITEM1,
    TRATTR_ITEM2,
    TRATTR_ITEM3,
    TRATTR_ITEM4,
    TRATTR_AIFLAGS,
    TRATTR_DOUBLEBTL,
} TrainerAttr;

typedef enum TrainerGender {
    TRAINER_MALE,
    TRAINER_FEMALE,
    TRAINER_DOUBLE,
} TrainerGender;
#endif //PM_ASM

#define TRPOKE_GENDER_OVERRIDE_OFF          0
#define TRPOKE_GENDER_OVERRIDE_MALE         1
#define TRPOKE_GENDER_OVERRIDE_FEMALE       2

#define TRPOKE_ABILITY_OVERRIDE_OFF         0
#define TRPOKE_ABILITY_OVERRIDE_FIRST       1
#define TRPOKE_ABILITY_OVERRIDE_SECOND      2

// Indices identifying messages in trtbl.narc.
// For use with GetTrainerMessageByIdPair and
// TrainerMessageWithIdPairExists.

// Before the battle starts (interact, trainer eye)
#define TRMSG_INTRO                         0
// When the NPC loses
#define TRMSG_LOSE                          1
// After the trainer is defeated (interact)
#define TRMSG_AFTER                         2
// These are for double-battle trainer classes.
// One member gets the _1 IDs, the other gets
// the _2 IDs.
#define TRMSG_DBL_INTRO_1                   3
#define TRMSG_DBL_LOSE_1                    4
#define TRMSG_DBL_AFTER_1                   5
// If the player tries to start the double
// battle with only one usable party member,
// a double trainer will refuse to engage.
// This message, along with TRMSG_DBL_1POKE_2,
// accompanies this refusal.
#define TRMSG_DBL_1POKE_1                   6
#define TRMSG_DBL_INTRO_2                   7
#define TRMSG_DBL_LOSE_2                    8
#define TRMSG_DBL_AFTER_2                   9
#define TRMSG_DBL_1POKE_2                  10
// 11-14 are unused.
#define TRMSG_LAST_POKE                    15
#define TRMSG_LAST_POKE_HALF               16
// The texts change when it's a phone trainer.
#define TRMSG_PHONE_REMATCH_INTRO          17
#define TRMSG_PHONE_REMATCH_DBL_INTRO_1    18
#define TRMSG_PHONE_REMATCH_DBL_INTRO_2    19
#define TRMSG_WIN                          20

#define TRTYPE_MOVES_F                      (0)
#define TRTYPE_ITEM_F                       (1)

#define TRTYPE_MON            ((0<<TRTYPE_MOVES_F)|(0<<TRTYPE_ITEM_F))
#define TRTYPE_MON_MOVES      ((1<<TRTYPE_MOVES_F)|(0<<TRTYPE_ITEM_F))
#define TRTYPE_MON_ITEM       ((0<<TRTYPE_MOVES_F)|(1<<TRTYPE_ITEM_F))
#define TRTYPE_MON_ITEM_MOVES ((1<<TRTYPE_MOVES_F)|(1<<TRTYPE_ITEM_F))

#ifndef PM_ASM
typedef struct TrainerMonSpecies {
    // IV scale parameter
    u8 difficulty;

    // Bits 0-3: 0: No override
    //           1: Force male
    //           2: Force female
    // Bits 4-7: 0: No override
    //           1: Force ability 1
    //           2: Force ability 2
    u8 genderAbilityOverride;
    u16 level;

    // Bits 0-9: species
    // Bits 10-15: forme
    u16 species;
    u16 capsule;
} TRPOKE_NOITEM_DFLTMOVES;

typedef struct TrainerMonSpeciesMoves {
    u8 difficulty;
    u8 genderAbilityOverride;
    u16 level;
    u16 species;
    u16 moves[MON_MOVES];
    u16 capsule;
} TRPOKE_NOITEM_CUSTMOVES;

typedef struct TrainerMonSpeciesItem {
    u8 difficulty;
    u8 genderAbilityOverride;
    u16 level;
    u16 species;
    u16 item;
    u16 capsule;
} TRPOKE_ITEM_DFLTMOVES;

typedef struct TrainerMonSpeciesItemMoves {
    u8 difficulty;
    u8 genderAbilityOverride;
    u16 level;
    u16 species;
    u16 item;
    u16 moves[MON_MOVES];
    u16 capsule;
} TRPOKE_ITEM_CUSTMOVES;

typedef union TrainerMon {
    TRPOKE_NOITEM_DFLTMOVES species;
    TRPOKE_NOITEM_CUSTMOVES species_moves;
    TRPOKE_ITEM_DFLTMOVES species_item;
    TRPOKE_ITEM_CUSTMOVES species_item_moves;
} TRPOKE;

typedef struct TrainerData {
    u8 trainerType;
    u8 trainerClass;
    u8 unk_2; // unused
    u8 npoke;
    u16 items[4];
    u32 ai_flags;
    u32 doubleBattle;
    u16 name[OT_NAME_LENGTH + 1];
    // Used in the Frontier
    MAIL_MESSAGE winMessage;
    MAIL_MESSAGE loseMessage;
} TRAINER;

typedef struct BattleSetupStruct {
    u32 flags;
    PARTY *parties[4];
    u16 field_14[2];
    u32 trainer_idxs[4];
    TRAINER trainers[4];
} BATTLE_SETUP;

void TrainerData_ReadTrData(u32 trno, TRAINER *dest);
TrainerGender TrainerClass_GetGenderOrTrainerCount(int trainerClass);
int TrainerData_GetAttr(u32 tr_idx, TrainerAttr attr_no);
#endif //PM_ASM

#endif //POKEHEARTGOLD_TRAINER_DATA_H
