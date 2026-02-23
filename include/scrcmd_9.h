#ifndef POKEHEARTGOLD_SCRCMD_9_H
#define POKEHEARTGOLD_SCRCMD_9_H

#include "frontier_data.h"
#include "save.h"

#define TOWER_MODE_SINGLE               0
#define TOWER_MODE_DOUBLE               1
#define TOWER_MODE_MULTI                2
#define TOWER_MODE_LINK                 3
#define TOWER_MODE_WIFI                 4
#define TOWER_MODE_WIFI_PRACTICE        5
#define TOWER_MODE_6                    6

typedef struct FrontierMon {
    u16 species : 11;
    u16 form : 5;
    u16 item;
    u16 moves[4];
    u32 otID;
    u32 pid;
    union {
        struct {
            u32 hpIv : 5;
            u32 atkIv : 5;
            u32 defIv : 5;
            u32 spdIv : 5;
            u32 spAtkIv : 5;
            u32 spDefIv : 5;
            u32 dummy : 2;
        };
        u32 ivsWord;
    };
    u8 evs[6];
    u8 ppUp;
    u8 language;
    u8 ability;
    u8 friendship;
    u16 nickname[11];
} FrontierMon;

typedef struct FrontierTrainer {
    u32 index;
    u16 trainerClass;
    u8 filler06[2];
    u16 name[8];
    u16 unk18;
    u16 unk1a;
    u8 filler1c[0x14];
    FrontierMon frontierMons[2];
    u8 fillera0[0x70];
} FrontierTrainer;

typedef struct FrontierMultiBattleAllyData {
    u32 otID;
    u16 frontierMonIDs[2];
    u32 frontierMonPIDs[2];
} FrontierMultiBattleAllyData;

typedef struct FrontierFieldSystem {
    u32 unk00;
    enum HeapID heapID;
    u32 unk08;
    u8 currentBattleNumber; // Total battles won on current streak.
    u8 curWinStreak;
    u8 numMons;
    u8 towerMode;
    u8 unk10_0 : 1;
    u8 palmerDefeated : 2;
    u8 unk10_3 : 1;
    u8 unk10_4 : 1;
    u8 multiBattleAllyID : 3;
    u8 trainerGender;
    u8 linkAllyGender;
    u8 filler13;
    u16 linkAllyRound; // Takes precedence over currentRound in Link Mode if it is higher.
    u16 linkAllyMonSpecies[2];
    u16 currentBattleInSession; // Battles won in this session.
    u16 currentRound; // Rounds (sets of 7 battles) won in the current streak.
    u8 filler1e[2];
    u32 totalTowerWins;
    u16 unk24;
    u16 unk26;
    u16 unk28;
    u8 partyMonIndexes[4];
    u16 partyMonSpecies[4];
    u16 partyMonItems[4];
    u16 trainersInCurrentRound[14];
    u8 filler5a[20];
    u32 unk70; // Seems to be some sort of frontier save data.
    FrontierData *frontierData;
    FrontierTrainer unk78[2];
    FrontierTrainer frontierStatTrainers[5];
    FrontierMultiBattleAllyData multiBattleAllyData[5];
    u8 unk838[5]; // Related to multi battle allies' replaced items.
    u8 filler83d;
    u16 unk83e[35]; // Related to unk10_3 somehow. Also player gender? Also species??? these seem to be some sort of struct?
    u16 unk884[35]; // Seemingly never set. Probably relates to tag partner somehow.
    u8 filler8CA[10];
    u8 unk8D4;
    u8 unk8D5;
    u8 filler8D6[2];
    u16 unk8D8;
    u16 unk8DA;
} FrontierFieldSystem;

#endif // POKEHEARTGOLD_SCRCMD_9_H
