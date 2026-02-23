#include "unk_0204B538.h"

#include "global.h"

#include "constants/abilities.h"
#include "constants/items.h"
#include "constants/moves.h"

#include "msgdata/msg.naix"

#include "assert.h"
#include "heap.h"
#include "message_format.h"
#include "msgdata.h"
#include "party.h"
#include "player_data.h"
#include "pm_string.h"
#include "pokedex.h"
#include "pokemon.h"
#include "scrcmd_9.h"
#include "unk_0202D230.h"
#include "unk_02035900.h"
#include "unk_0204A3F4.h"

typedef struct FrontierMonNarcData {
    u16 species;
    u16 moves[4];
    u8 evs;
    u8 nature;
    u16 item;
    u16 form;
} FrontierMonNarcData;

static u32 FrontierFieldSystem_0204BABC(FrontierFieldSystem *frontierFsys, u16 *frontierTrainerData, u16 frontierTrainerIndex, FrontierMon *frontierMon, u8 numPokemon, u16 *partySpecies, u16 *partyItems, FrontierMultiBattleAllyData *multiBattleAllyData, enum HeapID heapID);
static u16 *GetFrontierTrainerData(u32 frontierTrainerIndex, enum HeapID heapID);
static void GetFrontierMonNarcData(FrontierMonNarcData *mon, u32 frontierMonIndex);

static const u16 ItemReplacementList[] = { ITEM_BRIGHT_POWDER, ITEM_LUM_BERRY, ITEM_LEFTOVERS, ITEM_QUICK_CLAW };

// Frontier Trainer IDs grouped by when they show up normally. IDs 0-99 show up normally in battles 1-7, IDs 80-119 show up normally in battles 8-14, etc.
static const u16 FrontierTrainerDifficultyBracket[][2] = {
    { 0,   99  }, // Bracket 0: 1-7.
    { 80,  119 }, // Bracket 1: 8-14.
    { 100, 139 }, // Bracket 2: 15-21.
    { 120, 159 }, // Bracket 3: 22-28.
    { 140, 179 }, // Bracket 4: 29-35.
    { 160, 199 }, // Bracket 5: 36-42.
    { 180, 219 }, // Bracket 6: 43-49.
    { 200, 299 }, // Bracket 7: 50+. Unused.
};
// Unused.
static const u16 FrontierTrainerOverworlds[][2] = {
    { TRAINERCLASS_PKMN_TRAINER_CHERYL, SPRITE_SEVEN1       },
    { TRAINERCLASS_PKMN_TRAINER_RILEY,  SPRITE_SEVEN2       },
    { TRAINERCLASS_PKMN_TRAINER_MARLEY, SPRITE_SEVEN3       },
    { TRAINERCLASS_PKMN_TRAINER_BUCK,   SPRITE_SEVEN4       },
    { TRAINERCLASS_PKMN_TRAINER_MIRA,   SPRITE_SEVEN5       },
    { TRAINERCLASS_YOUNGSTER,           SPRITE_BOY2         },
    { TRAINERCLASS_LASS,                SPRITE_GIRL1        },
    { TRAINERCLASS_SCHOOL_KID_M,        SPRITE_BOY1         },
    { TRAINERCLASS_SCHOOL_KID_F,        SPRITE_GIRL3        },
    { TRAINERCLASS_RICH_BOY,            SPRITE_GORGGEOUSM   },
    { TRAINERCLASS_LADY,                SPRITE_GORGGEOUSW   },
    { TRAINERCLASS_CAMPER,              SPRITE_CAMPBOY      },
    { TRAINERCLASS_PICNICKER,           SPRITE_PICNICGIRL   },
    { TRAINERCLASS_TUBER_M,             SPRITE_BABYBOY1     }, // Seems to be mislabelled.
    { TRAINERCLASS_TUBER_F,             SPRITE_BABYGIRL1    }, // Same here.
    { TRAINERCLASS_POKEFAN_M,           SPRITE_MIDDLEMAN1   },
    { TRAINERCLASS_POKEFAN,             SPRITE_MIDDLEWOMAN1 },
    { TRAINERCLASS_WAITER,              SPRITE_WAITER       },
    { TRAINERCLASS_WAITRESS,            SPRITE_WAITRESS     },
    { TRAINERCLASS_PKMN_BREEDER_M,      SPRITE_MAN1         },
    { TRAINERCLASS_PKMN_BREEDER_F,      SPRITE_WOMAN1       },
    { TRAINERCLASS_CAMERAMAN,           SPRITE_CAMERAMAN    },
    { TRAINERCLASS_REPORTER,            SPRITE_REPORTER     },
    { TRAINERCLASS_RANCHER,             SPRITE_FARMER       },
    { TRAINERCLASS_COWGIRL,             SPRITE_COWGIRL      },
    { TRAINERCLASS_CYCLIST_M,           SPRITE_CYCLEM       },
    { TRAINERCLASS_CYCLIST_F,           SPRITE_CYCLEW       },
    { TRAINERCLASS_BLACK_BELT,          SPRITE_FIGHTER      },
    { TRAINERCLASS_BATTLE_GIRL,         SPRITE_GIRL2        },
    { TRAINERCLASS_VETERAN,             SPRITE_OLDMAN1      },
    { TRAINERCLASS_SOCIALITE,           SPRITE_LADY         },
    { TRAINERCLASS_PSYCHIC_M,           SPRITE_MYSTERY      },
    { TRAINERCLASS_PSYCHIC_F,           SPRITE_MYSTERY      },
    { TRAINERCLASS_PKMN_RANGER_M,       SPRITE_MAN3         },
    { TRAINERCLASS_PKMN_RANGER_F,       SPRITE_WOMAN3       },
    { TRAINERCLASS_ACE_TRAINER_M,       SPRITE_MAN3         },
    { TRAINERCLASS_ACE_TRAINER_F,       SPRITE_WOMAN3       },
    { TRAINERCLASS_ACE_TRAINER_M_GS,    SPRITE_MAN5         },
    { TRAINERCLASS_ACE_TRAINER_F_GS,    SPRITE_WOMAN5       },
    { TRAINERCLASS_DRAGON_TAMER,        SPRITE_MAN3         },
    { TRAINERCLASS_BUG_CATCHER,         SPRITE_BOY3         },
    { TRAINERCLASS_NINJA_BOY,           SPRITE_BABYBOY1     },
    { TRAINERCLASS_JOGGER,              SPRITE_SPORTSMAN    },
    { TRAINERCLASS_FISHERMAN,           SPRITE_FISHING      },
    { TRAINERCLASS_SAILOR,              SPRITE_SEAMAN       },
    { TRAINERCLASS_HIKER,               SPRITE_MOUNT        },
    { TRAINERCLASS_RUIN_MANIAC,         SPRITE_EXPLORE      },
    { TRAINERCLASS_GUITARIST,           SPRITE_MAN2         },
    { TRAINERCLASS_COLLECTOR,           SPRITE_BIGMAN       },
    { TRAINERCLASS_ROUGHNECK,           SPRITE_BADMAN       },
    { TRAINERCLASS_SUPER_NERD,          SPRITE_ASSISTANTM   },
    { TRAINERCLASS_GENTLEMAN,           SPRITE_GENTLEMAN    },
    { TRAINERCLASS_WORKER,              SPRITE_WORKMAN      },
    { TRAINERCLASS_CLOWN,               SPRITE_CLOWN        },
    { TRAINERCLASS_POLICEMAN,           SPRITE_POLICEMAN    },
    { TRAINERCLASS_PI,                  SPRITE_GORGGEOUSM   },
    { TRAINERCLASS_BIRD_KEEPER_GS,      SPRITE_WOMAN3       },
    { TRAINERCLASS_PARASOL_LADY,        SPRITE_AMBRELLA     },
    { TRAINERCLASS_BEAUTY,              SPRITE_WOMAN2       },
    { TRAINERCLASS_AROMA_LADY,          SPRITE_WOMAN1       },
    { TRAINERCLASS_IDOL,                SPRITE_IDOL         },
    { TRAINERCLASS_ARTIST,              SPRITE_ARTIST       },
    { TRAINERCLASS_POKE_KID,            SPRITE_PIKACHU      },
};
// Trainer IDs grouped by when they show up as bracket bosses.
static const u16 FrontierTrainerBracketBosses[][2] = {
    { 100, 119 }, // Bracket 0: Battle 7
    { 120, 139 }, // Bracket 1: Battle 14
    { 140, 159 }, // Bracket 2: Battle 21
    { 160, 179 }, // Bracket 3: Battle 28
    { 180, 199 }, // Bracket 4: Battle 35
    { 200, 219 }, // Bracket 5: Battle 42
    { 220, 239 }, // Bracket 6: Battle 49
    { 200, 299 }, // Bracket 7: All trainers are no longer special. This appears to be unused.
};

MessageFormat *sub_0204B538(SaveData *saveData, u16 numEligiblePokemon, u16 a2, u8 a3, u8 *numLegendaryPokemonSeen) {
    String *speciesName, *unused;
    Pokedex *pokedex;
    MessageFormat *messageFormat;
    MsgData *messageData;
    speciesName = String_New(14, HEAP_ID_FIELD1);
    unused = String_New(2, HEAP_ID_FIELD1);
    pokedex = Save_Pokedex_Get(saveData);
    messageData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0237_bin, HEAP_ID_FIELD1);
    messageFormat = MessageFormat_New_Custom(19, 14, HEAP_ID_FIELD1);
    BufferIntegerAsString(messageFormat, 0, numEligiblePokemon, 1, PRINTING_MODE_LEFT_ALIGN, TRUE);
    for (u8 i = 0; i < NUM_BANNED_BATTLE_FRONTIER; i++) {
        u16 species = GetBannedBattleFrontierPokemon(i);
        if (!Pokedex_CheckMonSeenFlag(pokedex, species)) {
            continue;
        }
        ReadMsgDataIntoString(messageData, species, speciesName);
        BufferString(messageFormat, *numLegendaryPokemonSeen + 1, speciesName, a2, a3, 2);
        (*numLegendaryPokemonSeen)++;
    }
    DestroyMsgData(messageData);
    String_Delete(unused);
    String_Delete(speciesName);
    return messageFormat;
}

// Unused.
u32 GetFrontierTrainerOverworld(u8 trainerClass)
{
    for (u32 i = 0; i < NELEMS(FrontierTrainerOverworlds); i++)
    {
        if (trainerClass == FrontierTrainerOverworlds[i][0])
        {
            return FrontierTrainerOverworlds[i][1];
        }
    }
    return SPRITE_BOY1;
}

u16 sub_0204B610(FieldSystem *fieldSystem, u16 *linkAllyData) { // SetLinkAllyData?
    u16 unk = 0;
    FrontierFieldSystem *frontierFsys = fieldSystem->frontier;
    frontierFsys->linkAllyGender = linkAllyData[0];
    frontierFsys->linkAllyMonSpecies[0] = linkAllyData[1];
    frontierFsys->linkAllyMonSpecies[1] = linkAllyData[2];
    frontierFsys->linkAllyRound = linkAllyData[3];
    frontierFsys->multiBattleAllyID = frontierFsys->linkAllyGender + 5; // Either 5 or 6.
    if (frontierFsys->partyMonSpecies[0] == frontierFsys->linkAllyMonSpecies[0] || frontierFsys->partyMonSpecies[0] == frontierFsys->linkAllyMonSpecies[1]) {
        unk++;
    }
    if (frontierFsys->partyMonSpecies[1] == frontierFsys->linkAllyMonSpecies[0] || frontierFsys->partyMonSpecies[1] == frontierFsys->linkAllyMonSpecies[1]) {
        unk += 2;
    }
    return unk; // return 1 if partyMonSpecies[0] matches, 2 if partyMonSpecies[1] matches, 3 if both match.
}

BOOL sub_0204B66C(FieldSystem *fieldSystem, u16 *a1) {
    FrontierFieldSystem *frontierFsys = fieldSystem->frontier;
    if (sub_0203769C() == 0) {
        return FALSE;
    }
    MI_CpuCopy8(a1, frontierFsys->trainersInCurrentRound, sizeof(frontierFsys->trainersInCurrentRound));
    return TRUE;
}

BOOL sub_0204B690(FieldSystem *fieldSystem, u16 *a1) {
    return fieldSystem->frontier->unk10_3 || a1[0] != 0;
}

void FrontierFieldSystem_0204B6AC(FrontierFieldSystem *frontierFsys, SaveData *saveData) {
    frontierFsys->unk83e[0] = PlayerProfile_GetTrainerGender(Save_PlayerData_GetProfile(saveData));
    Party *party = SaveArray_Party_Get(saveData);
    for (s32 i = 0; i < 2; i++) {
        Pokemon *mon = Party_GetMonByIndex(party, frontierFsys->partyMonIndexes[i]);
        frontierFsys->unk83e[1 + i] = GetMonData(mon, MON_DATA_SPECIES, NULL);
    }
    frontierFsys->unk83e[3] = sub_0202D57C(frontierFsys->frontierData, 3, 0);
}

void FrontierFieldSystem_0204B708(FrontierFieldSystem *frontierFsys) {
    MI_CpuCopy8(frontierFsys->trainersInCurrentRound, frontierFsys->unk83e, sizeof(frontierFsys->trainersInCurrentRound));
}

void FrontierFieldSystem_0204B720(FrontierFieldSystem *frontierFsys, u32 a1) {
    frontierFsys->unk10_3 = a1;
    frontierFsys->unk83e[0] = a1;
}

u16 FrontierFieldSystem_GetRandomBattleTowerTrainer(FrontierFieldSystem *frontierFsys, u8 difficultyBracket, u8 winsThisRound, u32 towerMode) {
    if (towerMode == TOWER_MODE_SINGLE) {
        // If we are between battles 15-21 and have completed 6 battles in our current round, meaning this is battle 21:
        if (difficultyBracket == 2 && winsThisRound == 6) {
            return 305; // Palmer (Silver Print)
        }
        // If we are between battles 43-49 and have completed 6 battles in our current round, meaning this is battle 49:
        if (difficultyBracket == 6 && winsThisRound == 6) {
            return 306; // Palmer (Gold Print)
        }
    }
    if (difficultyBracket < 7) {
        if (winsThisRound == 6) {
            u16 mod = FrontierTrainerBracketBosses[difficultyBracket][1] - FrontierTrainerBracketBosses[difficultyBracket][0] + 1;
            return FrontierFieldSystem_0204B510(frontierFsys) % mod + FrontierTrainerBracketBosses[difficultyBracket][0];
        } else {
            u16 mod = FrontierTrainerDifficultyBracket[difficultyBracket][1] - FrontierTrainerDifficultyBracket[difficultyBracket][0] + 1;
            return FrontierFieldSystem_0204B510(frontierFsys) % mod + FrontierTrainerDifficultyBracket[difficultyBracket][0];
        }
    } else {
        return FrontierFieldSystem_0204B510(frontierFsys) % 100 + 200;
    }
}

static u16 *sub_0204B7D0(FrontierTrainer *frontierTrainer, u32 frontierTrainerIndex, enum HeapID heapID) {
    MsgData *messageData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0027_bin, heapID);
    MI_CpuClear8(frontierTrainer, sizeof(FrontierTrainer));
    u16 *frontierTrainerData = GetFrontierTrainerData(frontierTrainerIndex, heapID);
    frontierTrainer->index = frontierTrainerIndex;
    frontierTrainer->unk18 = 0xffff;
    frontierTrainer->unk1a = frontierTrainerIndex * 3;
    frontierTrainer->trainerClass = frontierTrainerData[0];
    String *trainerName = NewString_ReadMsgData(messageData, frontierTrainerIndex);
    CopyStringToU16Array(trainerName, frontierTrainer->name, NELEMS(frontierTrainer->name));
    String_Delete(trainerName);
    DestroyMsgData(messageData);
    return frontierTrainerData;
}

static u32 FrontierFieldSystem_GenerateFrontierMon(FrontierFieldSystem *frontierFsys, FrontierMon *frontierMon, u16 frontierMonIndex, u32 otID, u32 pid, u8 iv, u8 replacementItemIndex, BOOL replaceItem, enum HeapID heapID) {
    s32 i;
    FrontierMonNarcData frontierMonNarcData;
    MI_CpuClear8(frontierMon, sizeof(FrontierMon));
    GetFrontierMonNarcData(&frontierMonNarcData, frontierMonIndex);
    frontierMon->species = frontierMonNarcData.species;
    frontierMon->form = frontierMonNarcData.form;
    frontierMon->item = replaceItem ? ItemReplacementList[replacementItemIndex] : frontierMonNarcData.item;
    
    // Use max friendship unless the mon knows Frustration.
    u32 friendship = FRIENDSHIP_MAX;
    for (i = 0; i < MAX_MON_MOVES; i++) {
        frontierMon->moves[i] = frontierMonNarcData.moves[i];
        if (frontierMonNarcData.moves[i] == MOVE_FRUSTRATION) {
            friendship = 0;
        }
    }

    frontierMon->otID = otID;
    u32 pidGen;
    if (pid == 0) {
        do {
            pidGen = FrontierFieldSystem_0204B510(frontierFsys) | FrontierFieldSystem_0204B510(frontierFsys) << 16;
        } while (frontierMonNarcData.nature != GetNatureFromPersonality(pidGen)
            || CalcShininessByOtIdAndPersonality(otID, pidGen) == TRUE);
        frontierMon->pid = pidGen;
    } else {
        frontierMon->pid = pid;
        pidGen = pid;
    }
    frontierMon->hpIv = iv;
    frontierMon->atkIv = iv;
    frontierMon->defIv = iv;
    frontierMon->spdIv = iv;
    frontierMon->spAtkIv = iv;
    frontierMon->spDefIv = iv;
    s32 ev = 0;
    for (i = 0; i < NUM_STATS; i++) {
        if (frontierMonNarcData.evs & MaskOfFlagNo(i)) {
            ev++;
        }
    }
    ev = MAX_EV_SUM / ev;
    if (ev > 255) {
        ev = 255;
    }
    for (i = 0; i < NUM_STATS; i++) {
        if (frontierMonNarcData.evs & MaskOfFlagNo(i)) {
            frontierMon->evs[i] = ev;
        }
    }
    frontierMon->ppUp = 0;
    frontierMon->language = gGameLanguage;
    u32 ability = GetMonBaseStat(frontierMon->species, BASE_ABILITY_2);

    // Check if there is only 1 ability, and if not, randomize between them.
    if (ability != ABILITY_NONE) {
        if (frontierMon->pidGen % 2) {
            frontierMon->ability = ability;
        } else {
            frontierMon->ability = GetMonBaseStat(frontierMon->species, BASE_ABILITY_1);
        }
    } else {
        frontierMon->ability = GetMonBaseStat(frontierMon->species, BASE_ABILITY_1);
    }
    frontierMon->friendship = friendship;
    GetSpeciesNameIntoArray(frontierMon->species, heapID, frontierMon->nickname);
    return pidGen;
}

u32 FrontierFieldSystem_0204BA04(FrontierFieldSystem *frontierFsys, FrontierTrainer *frontierTrainer, u16 frontierTrainerIndex, u32 numPokemon, u16 *partySpecies, u16 *partyItems, FrontierMultiBattleAllyData *multiBattleAllyData, enum HeapID heapID) {
    u16 *frontierTrainerData = sub_0204B7D0(frontierTrainer, frontierTrainerIndex, heapID);
    u32 replaceItem = FrontierFieldSystem_0204BABC(frontierFsys, frontierTrainerData, frontierTrainerIndex, frontierTrainer->frontierMons, numPokemon, partySpecies, partyItems, multiBattleAllyData, heapID);
    Heap_Free(frontierTrainerData);
    return replaceItem;
}

void FrontierFieldSystem_GenerateAllyFrontierMons(FrontierFieldSystem *frontierFsys, FrontierTrainer *frontierTrainer, u16 frontierTrainerIndex, u32 replaceItem, FrontierMultiBattleAllyData *multiBattleAllyData, enum HeapID heapID) {
    u8 iv;
    u16 *frontierTrainerData = sub_0204B7D0(frontierTrainer, frontierTrainerIndex, heapID);
    iv = GetFrontierTrainerIVs(frontierTrainerIndex);
    for (s32 i = 0; i < 2; i++) {
        FrontierFieldSystem_GenerateFrontierMon(frontierFsys, &frontierTrainer->frontierMons[i], multiBattleAllyData->frontierMonIDs[i], multiBattleAllyData->otID, multiBattleAllyData->frontierMonPIDs[i], iv, i, replaceItem, heapID);
    }
    Heap_Free(frontierTrainerData);
}

static u32 FrontierFieldSystem_0204BABC(FrontierFieldSystem *frontierFsys, u16 *frontierTrainerData, u16 frontierTrainerIndex, FrontierMon *frontierMon, u8 numPokemon, u16 *partySpecies, u16 *partyItems, FrontierMultiBattleAllyData *multiBattleAllyData, enum HeapID heapID) {
    s32 i;
    u8 iv;
    u32 otID;
    u32 frontierMonIndex;
    u32 frontierMonIDs[4];
    u32 frontierMonPIDs[4];
    s32 failedItemGenAttempts;
    BOOL replaceItem = FALSE;
    FrontierMonNarcData frontierMonNarcData[2];
    GF_ASSERT(numPokemon <= 4);

    s32 count = 0;
    failedItemGenAttempts = 0;
    while (count != numPokemon) {
        u8 index = FrontierFieldSystem_0204B510(frontierFsys) % frontierTrainerData[1];
        frontierMonIndex = frontierTrainerData[2 + index];
        GetFrontierMonNarcData(&frontierMonNarcData[1], frontierMonIndex);
        for (i = 0; i < count; i++) {
            GetFrontierMonNarcData(&frontierMonNarcData[0], frontierMonIDs[i]);
            if (frontierMonNarcData[0].species == frontierMonNarcData[1].species) {
                break;
            }
        }
        if (i != count) {
            continue;
        }
        if (partySpecies) {
            for (i = 0; i < numPokemon; i++) {
                if (partySpecies[i] == frontierMonNarcData[1].species) {
                    break;
                }
            }
            if (i != numPokemon) {
                continue;
            }
        }
        if (failedItemGenAttempts < 50) {
            for (i = 0; i < count; i++) {
                GetFrontierMonNarcData(&frontierMonNarcData[0], frontierMonIDs[i]);
                if (frontierMonNarcData[0].item && frontierMonNarcData[0].item == frontierMonNarcData[1].item) {
                    break;
                }
            }
            if (i != count) {
                failedItemGenAttempts++;
                continue;
            }
            if (partyItems) {
                for (i = 0; i < numPokemon; i++) {
                    if (partyItems[i] == frontierMonNarcData[1].item && partyItems[i] != ITEM_NONE) {
                        break;
                    }
                }
                if (i != numPokemon) {
                    failedItemGenAttempts++;
                    continue;
                }
            }
        }
        frontierMonIDs[count] = frontierMonIndex;
        count++;
    }
    iv = GetFrontierTrainerIVs(frontierTrainerIndex);
    otID = FrontierFieldSystem_0204B510(frontierFsys) | FrontierFieldSystem_0204B510(frontierFsys) << 16;
    if (failedItemGenAttempts >= 50) {
        replaceItem = TRUE;
    }
    for (i = 0; i < count; i++) {
        frontierMonPIDs[i] = FrontierFieldSystem_GenerateFrontierMon(frontierFsys, &frontierMon[i], frontierMonIDs[i], otID, 0, iv, i, replaceItem, heapID);
    }
    if (multiBattleAllyData == NULL) {
        return replaceItem;
    }
    multiBattleAllyData->otID = otID;
    for (i = 0; i < 2; i++) {
        multiBattleAllyData->frontierMonIDs[i] = frontierMonIDs[i];
        multiBattleAllyData->frontierMonPIDs[i] = frontierMonPIDs[i];
    }
    return replaceItem;
}

static u16 *GetFrontierTrainerData(u32 frontierTrainerIndex, enum HeapID heapID) {
    return AllocAndReadWholeNarcMemberByIdPair(NARC_a_2_0_2, frontierTrainerIndex, heapID);
}

static void GetFrontierMonNarcData(FrontierMonNarcData *mon, u32 frontierMonIndex) {
    ReadWholeNarcMemberByIdPair(mon, NARC_a_2_0_3, frontierMonIndex);
}
