#ifndef POKEHEARTGOLD_TRAINER_DATA_H
#define POKEHEARTGOLD_TRAINER_DATA_H

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
    TRATTR_UNKC,
    TRATTR_DOUBLEBTL,
} TrainerAttr;

typedef enum TrainerGender {
    TRAINER_MALE,
    TRAINER_FEMALE,
    TRAINER_DOUBLE,
} TrainerGender;

#define TRTYPE_MOVES_F                      (0)
#define TRTYPE_ITEM_F                       (1)

#define TRTYPE_MON            ((0<<TRTYPE_MOVES_F)|(0<<TRTYPE_ITEM_F))
#define TRTYPE_MON_MOVES      ((1<<TRTYPE_MOVES_F)|(0<<TRTYPE_ITEM_F))
#define TRTYPE_MON_ITEM       ((0<<TRTYPE_MOVES_F)|(1<<TRTYPE_ITEM_F))
#define TRTYPE_MON_ITEM_MOVES ((1<<TRTYPE_MOVES_F)|(1<<TRTYPE_ITEM_F))

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
    u8 unk_2;
    u8 npoke;
    u16 items[4];
    u32 unk_C;
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

#endif //POKEHEARTGOLD_TRAINER_DATA_H
