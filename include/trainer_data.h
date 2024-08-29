#ifndef POKEHEARTGOLD_TRAINER_DATA_H
#define POKEHEARTGOLD_TRAINER_DATA_H

#include "constants/pokemon.h"
#include "constants/trainer_class.h"
#include "constants/trainers.h"

#ifndef PM_ASM
#include "global.h"

#include "mail_message.h"
#include "pm_string.h"
#include "pokemon_types_def.h"

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
    // Bits 10-15: form
    u16 species;
    u16 capsule;
} TRPOKE_NOITEM_DFLTMOVES;

typedef struct TrainerMonSpeciesMoves {
    u8 difficulty;
    u8 genderAbilityOverride;
    u16 level;
    u16 species;
    u16 moves[MAX_MON_MOVES];
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
    u16 moves[MAX_MON_MOVES];
    u16 capsule;
} TRPOKE_ITEM_CUSTMOVES;

typedef union TrainerMon {
    TRPOKE_NOITEM_DFLTMOVES species;
    TRPOKE_NOITEM_CUSTMOVES species_moves;
    TRPOKE_ITEM_DFLTMOVES species_item;
    TRPOKE_ITEM_CUSTMOVES species_item_moves;
} TRPOKE;

typedef struct TrainerData {
    /*000*/ u8 trainerType;
    /*001*/ u8 trainerClass;
    /*002*/ u8 unk_2;
    /*003*/ u8 npoke;
    /*004*/ u16 items[4];
    /*00C*/ u32 aiFlags;
    /*010*/ u32 doubleBattle;
} TrainerData;

typedef struct Trainer {
    struct TrainerData data;
    /*014*/ u16 name[PLAYER_NAME_LENGTH + 1];
    // Used in the Frontier
    /*024*/ MailMessage winMessage;
    /*02C*/ MailMessage loseMessage;
} Trainer; // size=0x34

typedef struct BattleSetup BattleSetup;

void TrainerData_ReadTrData(u32 trno, Trainer *dest);
TrainerGender TrainerClass_GetGenderOrTrainerCount(int trainerClass);
int TrainerData_GetAttr(u32 tr_idx, TrainerAttr attr_no);
void EnemyTrainerSet_Init(BattleSetup *battleSetup, SaveData *saveData, HeapID heapId);
BOOL TrainerMessageWithIdPairExists(u32 trainer_idx, u32 msg_id, HeapID heapId);
void GetTrainerMessageByIdPair(u32 trainer_idx, u32 msg_id, String *str, HeapID heapId);
void TrainerData_ReadTrPoke(u32 idx, TRPOKE *dest);
void CreateNPCTrainerParty(BattleSetup *enemies, int party_id, HeapID heapId);
void TrMon_OverridePidGender(int species, int form, int overrideParam, u32 *pid);
void TrMon_FrustrationCheckAndSetFriendship(Pokemon *mon);
#endif // PM_ASM

#endif // POKEHEARTGOLD_TRAINER_DATA_H
