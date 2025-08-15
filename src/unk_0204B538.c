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

typedef struct FrontierMon {
    u16 species;
    u16 moves[4];
    u8 evs;
    u8 nature;
    u16 item;
    u16 form;
} FrontierMon;

static u32 sub_0204BABC(UnkStruct_Fsys_A0 *a0, u16 *a1, u16 frontierTrainerIndex, UnkStruct_0204B470 *a3, u8 a4, u16 *a5, u16 *a6, UnkStruct_0204A824_7E8 *a7, enum HeapID heapID);
static u16 *sub_0204BC7C(u32 frontierTrainerIndex, enum HeapID heapID);
static void GetFrontierMon(FrontierMon *mon, u32 frontierMonIndex);

static const u16 _020FBFA4[] = { ITEM_BRIGHTPOWDER, ITEM_LUM_BERRY, ITEM_LEFTOVERS, ITEM_QUICK_CLAW };
static const u16 _020FBFAC[][2] = {
    { 0,   99  },
    { 80,  119 },
    { 100, 139 },
    { 120, 159 },
    { 140, 179 },
    { 160, 199 },
    { 180, 219 },
    { 200, 299 },
};
static const u16 _020FBFEC[][2] = {
    { 90, 141 },
    { 91, 142 },
    { 92, 143 },
    { 93, 144 },
    { 94, 145 },
    { 2,  4   },
    { 3,  6   },
    { 60, 3   },
    { 61, 8   },
    { 32, 62  },
    { 33, 63  },
    { 4,  52  },
    { 5,  53  },
    { 44, 1   },
    { 45, 2   },
    { 20, 15  },
    { 21, 16  },
    { 81, 59  },
    { 26, 60  },
    { 16, 9   },
    { 17, 12  },
    { 83, 23  },
    { 84, 22  },
    { 71, 41  },
    { 18, 42  },
    { 12, 38  },
    { 13, 39  },
    { 14, 51  },
    { 10, 7   },
    { 27, 17  },
    { 35, 37  },
    { 49, 70  },
    { 50, 70  },
    { 39, 11  },
    { 40, 14  },
    { 24, 11  },
    { 25, 14  },
    { 53, 68  },
    { 54, 69  },
    { 29, 11  },
    { 6,  5   },
    { 28, 1   },
    { 19, 45  },
    { 11, 54  },
    { 46, 56  },
    { 9,  20  },
    { 48, 50  },
    { 52, 10  },
    { 37, 19  },
    { 57, 31  },
    { 78, 29  },
    { 34, 36  },
    { 59, 40  },
    { 58, 43  },
    { 38, 34  },
    { 51, 62  },
    { 69, 14  },
    { 80, 55  },
    { 36, 13  },
    { 7,  12  },
    { 85, 35  },
    { 15, 44  },
    { 22, 71  },
};
static const u16 _020FBFCC[][2] = {
    { 100, 119 },
    { 120, 139 },
    { 140, 159 },
    { 160, 179 },
    { 180, 199 },
    { 200, 219 },
    { 220, 239 },
    { 200, 299 },
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

u32 sub_0204B5E8(u8 a0) {
    for (u32 i = 0; i < NELEMS(_020FBFEC); i++) {
        if (a0 == _020FBFEC[i][0]) {
            return _020FBFEC[i][1];
        }
    }
    return 3;
}

u16 sub_0204B610(FieldSystem *fieldSystem, u16 *a1) {
    u16 unk = 0;
    UnkStruct_Fsys_A0 *unkStruct = fieldSystem->unkA0;
    unkStruct->unk12 = a1[0];
    unkStruct->unk16 = a1[1];
    unkStruct->unk18 = a1[2];
    unkStruct->unk14 = a1[3];
    unkStruct->unk10_5 = unkStruct->unk12 + 5;
    if (unkStruct->unk2e[0] == unkStruct->unk16 || unkStruct->unk2e[0] == unkStruct->unk18) {
        unk++;
    }
    if (unkStruct->unk2e[1] == unkStruct->unk16 || unkStruct->unk2e[1] == unkStruct->unk18) {
        unk += 2;
    }
    return unk;
}

BOOL sub_0204B66C(FieldSystem *fieldSystem, u16 *a1) {
    UnkStruct_Fsys_A0 *unkStruct = fieldSystem->unkA0;
    if (sub_0203769C() == 0) {
        return FALSE;
    }
    MI_CpuCopy8(a1, unkStruct->unk3e, sizeof(unkStruct->unk3e));
    return TRUE;
}

BOOL sub_0204B690(FieldSystem *fieldSystem, u16 *a1) {
    return fieldSystem->unkA0->unk10_3 || a1[0] != 0;
}

void sub_0204B6AC(UnkStruct_Fsys_A0 *a0, SaveData *saveData) {
    a0->unk83e[0] = PlayerProfile_GetTrainerGender(Save_PlayerData_GetProfile(saveData));
    Party *party = SaveArray_Party_Get(saveData);
    for (s32 i = 0; i < 2; i++) {
        Pokemon *mon = Party_GetMonByIndex(party, a0->unk2a[i]);
        a0->unk83e[1 + i] = GetMonData(mon, MON_DATA_SPECIES, NULL);
    }
    a0->unk83e[3] = sub_0202D57C(a0->unk74, 3, 0);
}

void sub_0204B708(UnkStruct_Fsys_A0 *a0) {
    MI_CpuCopy8(a0->unk3e, a0->unk83e, sizeof(a0->unk3e));
}

void sub_0204B720(UnkStruct_Fsys_A0 *a0, u32 a1) {
    a0->unk10_3 = a1;
    a0->unk83e[0] = a1;
}

u16 sub_0204B73C(UnkStruct_Fsys_A0 *a0, u8 a1, u8 a2, u32 a3) {
    if (a3 == 0) {
        if (a1 == 2 && a2 == 6) {
            return 305;
        }
        if (a1 == 6 && a2 == 6) {
            return 306;
        }
    }
    if (a1 < 7) {
        if (a2 == 6) {
            u16 mod = _020FBFCC[a1][1] - _020FBFCC[a1][0] + 1;
            return sub_0204B510(a0) % mod + _020FBFCC[a1][0];
        } else {
            u16 mod = _020FBFAC[a1][1] - _020FBFAC[a1][0] + 1;
            return sub_0204B510(a0) % mod + _020FBFAC[a1][0];
        }
    } else {
        return sub_0204B510(a0) % 100 + 200;
    }
}

static u16 *sub_0204B7D0(UnkStruct_0204B7D0 *a0, u32 frontierTrainerIndex, enum HeapID heapID) {
    MsgData *messageData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0027_bin, heapID);
    MI_CpuClear8(a0, sizeof(UnkStruct_0204B7D0));
    u16 *unk = sub_0204BC7C(frontierTrainerIndex, heapID);
    a0->unk00 = frontierTrainerIndex;
    a0->unk18 = 0xffff;
    a0->unk1a = frontierTrainerIndex * 3;
    a0->unk04 = unk[0];
    String *trainerName = NewString_ReadMsgData(messageData, frontierTrainerIndex);
    CopyStringToU16Array(trainerName, a0->unk08, NELEMS(a0->unk08));
    String_Delete(trainerName);
    DestroyMsgData(messageData);
    return unk;
}

static u32 sub_0204B834(UnkStruct_Fsys_A0 *a0, UnkStruct_0204B470 *a1, u16 frontierMonIndex, u32 otId, u32 a4, u8 iv, u8 a6, BOOL a7, enum HeapID heapID) {
    s32 i;
    FrontierMon frontierMon;
    MI_CpuClear8(a1, sizeof(UnkStruct_0204B470));
    GetFrontierMon(&frontierMon, frontierMonIndex);
    a1->species = frontierMon.species;
    a1->form = frontierMon.form;
    a1->item = a7 ? _020FBFA4[a6] : frontierMon.item;
    u32 friendship = FRIENDSHIP_MAX;
    for (i = 0; i < MAX_MON_MOVES; i++) {
        a1->moves[i] = frontierMon.moves[i];
        if (frontierMon.moves[i] == MOVE_FRUSTRATION) {
            friendship = 0;
        }
    }
    a1->otId = otId;
    u32 pid;
    if (a4 == 0) {
        do {
            pid = sub_0204B510(a0) | sub_0204B510(a0) << 16;
        } while (frontierMon.nature != GetNatureFromPersonality(pid)
            || CalcShininessByOtIdAndPersonality(otId, pid) == TRUE);
        a1->pid = pid;
    } else {
        a1->pid = a4;
        pid = a4;
    }
    a1->hpIv = iv;
    a1->atkIv = iv;
    a1->defIv = iv;
    a1->spdIv = iv;
    a1->spAtkIv = iv;
    a1->spDefIv = iv;
    s32 ev = 0;
    for (i = 0; i < NUM_STATS; i++) {
        if (frontierMon.evs & MaskOfFlagNo(i)) {
            ev++;
        }
    }
    ev = MAX_EV_SUM / ev;
    if (ev > 255) {
        ev = 255;
    }
    for (i = 0; i < NUM_STATS; i++) {
        if (frontierMon.evs & MaskOfFlagNo(i)) {
            a1->evs[i] = ev;
        }
    }
    a1->ppUp = 0;
    a1->language = gGameLanguage;
    u32 ability = GetMonBaseStat(a1->species, BASE_ABILITY_2);
    if (ability != ABILITY_NONE) {
        if (a1->pid % 2) {
            a1->ability = ability;
        } else {
            a1->ability = GetMonBaseStat(a1->species, BASE_ABILITY_1);
        }
    } else {
        a1->ability = GetMonBaseStat(a1->species, BASE_ABILITY_1);
    }
    a1->friendship = friendship;
    GetSpeciesNameIntoArray(a1->species, heapID, a1->nickname);
    return pid;
}

u32 sub_0204BA04(UnkStruct_Fsys_A0 *a0, UnkStruct_0204B7D0 *a1, u16 frontierTrainerIndex, u32 a3, u16 *a4, u16 *a5, UnkStruct_0204A824_7E8 *a6, enum HeapID heapID) {
    u16 *unk7 = sub_0204B7D0(a1, frontierTrainerIndex, heapID);
    u32 unk4 = sub_0204BABC(a0, unk7, frontierTrainerIndex, a1->unk30, a3, a4, a5, a6, heapID);
    Heap_Free(unk7);
    return unk4;
}

void sub_0204BA50(UnkStruct_Fsys_A0 *a0, UnkStruct_0204B7D0 *a1, u16 frontierTrainerIndex, u32 a3, UnkStruct_0204A824_7E8 *a4, enum HeapID heapID) {
    u8 iv;
    u16 *unk = sub_0204B7D0(a1, frontierTrainerIndex, heapID);
    iv = sub_0204B4D4(frontierTrainerIndex);
    for (s32 i = 0; i < 2; i++) {
        sub_0204B834(a0, &a1->unk30[i], a4->unk04[i], a4->otId, a4->unk08[i], iv, i, a3, heapID);
    }
    Heap_Free(unk);
}

static u32 sub_0204BABC(UnkStruct_Fsys_A0 *a0, u16 *a1, u16 frontierTrainerIndex, UnkStruct_0204B470 *a3, u8 a4, u16 *a5, u16 *a6, UnkStruct_0204A824_7E8 *a7, enum HeapID heapID) {
    s32 i;
    u8 iv;
    u32 otId;
    u32 frontierMonIndex;
    u32 unk6c[4];
    u32 unk5c[4];
    s32 unk2c;
    BOOL unk28 = FALSE;
    FrontierMon unk3c;
    FrontierMon unk4c;
    GF_ASSERT(a4 <= 4);
    s32 unk = 0;
    unk2c = 0;
    while (unk != a4) {
        u8 index = sub_0204B510(a0) % a1[1];
        frontierMonIndex = a1[2 + index];
        GetFrontierMon(&unk4c, frontierMonIndex);
        for (i = 0; i < unk; i++) {
            GetFrontierMon(&unk3c, unk6c[i]);
            if (unk3c.species == unk4c.species) {
                break;
            }
        }
        if (i != unk) {
            continue;
        }
        if (a5) {
            for (i = 0; i < a4; i++) {
                if (a5[i] == unk4c.species) {
                    break;
                }
            }
            if (i != a4) {
                continue;
            }
        }
        if (unk2c < 50) {
            for (i = 0; i < unk; i++) {
                GetFrontierMon(&unk3c, unk6c[i]);
                if (unk3c.item && unk3c.item == unk4c.item) {
                    break;
                }
            }
            if (i != unk) {
                unk2c++;
                continue;
            }
            if (a6) {
                for (i = 0; i < a4; i++) {
                    if (a6[i] == unk4c.item && a6[i] != ITEM_NONE) {
                        break;
                    }
                }
                if (i != a4) {
                    unk2c++;
                    continue;
                }
            }
        }
        unk6c[unk] = frontierMonIndex;
        unk++;
    }
    iv = sub_0204B4D4(frontierTrainerIndex);
    otId = sub_0204B510(a0) | sub_0204B510(a0) << 16;
    if (unk2c >= 50) {
        unk28 = TRUE;
    }
    for (i = 0; i < unk; i++) {
        unk5c[i] = sub_0204B834(a0, &a3[i], unk6c[i], otId, 0, iv, i, unk28, heapID);
    }
    if (a7 == NULL) {
        return unk28;
    }
    a7->otId = otId;
    for (i = 0; i < 2; i++) {
        a7->unk04[i] = unk6c[i];
        a7->unk08[i] = unk5c[i];
    }
    return unk28;
}

static u16 *sub_0204BC7C(u32 frontierTrainerIndex, enum HeapID heapID) {
    return AllocAndReadWholeNarcMemberByIdPair(NARC_a_2_0_2, frontierTrainerIndex, heapID);
}

static void GetFrontierMon(FrontierMon *mon, u32 frontierMonIndex) {
    ReadWholeNarcMemberByIdPair(mon, NARC_a_2_0_3, frontierMonIndex);
}
