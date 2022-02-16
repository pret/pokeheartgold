#include "save_arrays.h"
#include "save.h"
#include "unk_0202E41C.h"
#include "pokemon_storage_system.h"
#include "mystery_gift.h"
#include "unk_0202EB30.h"
#include "unk_02030A98.h"
#include "hall_of_fame.h"

#define DECL_CHUNK(prefix) extern u32 prefix##_sizeof(void); extern void prefix##_init(void *);
#define DECL_CHUNK_EX(sizefn, initfn) extern u32 sizefn(void); extern void initfn(void *);

DECL_CHUNK(Sav2_SysInfo)
DECL_CHUNK(Sav2_PlayerData)
DECL_CHUNK(Sav2_Bag)
DECL_CHUNK(SavArray_Flags)
DECL_CHUNK(Save_FlyPoints)
DECL_CHUNK(Save_Pokedex)
DECL_CHUNK(Sav2_Daycare)
DECL_CHUNK_EX(sub_0202AEC0, sub_0202AED4)
DECL_CHUNK(Sav2_Misc)
DECL_CHUNK_EX(sub_0203B920, sub_0203B928)
DECL_CHUNK_EX(sub_020290B8, sub_020290C8)
DECL_CHUNK(Sav2_DressupData)
DECL_CHUNK(Sav2_Mailbox)
DECL_CHUNK(Sav2_FriendGroup)
DECL_CHUNK_EX(sub_0202C9A0, sub_0202C9A8)
DECL_CHUNK(GameStats)
DECL_CHUNK(Sav2_Chatot)
DECL_CHUNK_EX(sub_02031000, sub_02031008)
DECL_CHUNK_EX(sub_0202D938, sub_0202D93C)
DECL_CHUNK(Save_Roamers)
DECL_CHUNK_EX(sub_0202DB40, sub_0202DB44)
DECL_CHUNK_EX(sub_0202E41C, sub_0202E424)
DECL_CHUNK_EX(sub_0202E4F4, sub_0202E4FC)
DECL_CHUNK_EX(sub_0202C034, sub_0202C03C)
DECL_CHUNK_EX(sub_0202CA24, sub_0202CA2C)
DECL_CHUNK(Save_MysteryGift)
DECL_CHUNK_EX(sub_0202EB30, sub_0202EB38)
DECL_CHUNK_EX(sub_02031AF0, sub_02031AF4)
DECL_CHUNK(Sav2_EasyChat)
DECL_CHUNK_EX(sub_0203170C, sub_02031710)
DECL_CHUNK_EX(sub_020318C8, sub_020318CC)
DECL_CHUNK(Sav2_FollowPoke)
DECL_CHUNK(SaveData_GSPlayerMisc)
DECL_CHUNK(Save_SafariZone)
DECL_CHUNK(Save_PhotoAlbum)
DECL_CHUNK_EX(sub_02031904, sub_0203190C)
DECL_CHUNK(Save_ApricornBox)
DECL_CHUNK(Pokewalker)
DECL_CHUNK_EX(sub_02032774, sub_02032788)

const struct SaveChunkHeader _020F64C4[] = {
    { SAVE_SYSINFO,      0, (SAVESIZEFN)Sav2_SysInfo_sizeof, (SAVEINITFN)Sav2_SysInfo_init},
    { SAVE_PLAYERDATA,   0, (SAVESIZEFN)Sav2_PlayerData_sizeof, (SAVEINITFN)Sav2_PlayerData_init},
    { SAVE_PARTY,        0, (SAVESIZEFN)SavArray_Party_sizeof, (SAVEINITFN)SavArray_Party_init},
    { SAVE_BAG,          0, (SAVESIZEFN)Sav2_Bag_sizeof, (SAVEINITFN)Sav2_Bag_init},
    { SAVE_FLAGS,        0, (SAVESIZEFN)SavArray_Flags_sizeof, (SAVEINITFN)SavArray_Flags_init},
    { SAVE_FLYPOINTS,    0, (SAVESIZEFN)Save_FlyPoints_sizeof, (SAVEINITFN)Save_FlyPoints_init},
    { SAVE_POKEDEX,      0, (SAVESIZEFN)Save_Pokedex_sizeof, (SAVEINITFN)Save_Pokedex_init},
    { SAVE_DAYCARE,      0, (SAVESIZEFN)Sav2_Daycare_sizeof, (SAVEINITFN)Sav2_Daycare_init},
    { SAVE_UNK_8,        0, (SAVESIZEFN)sub_0202AEC0, (SAVEINITFN)sub_0202AED4},
    { SAVE_MISC,         0, (SAVESIZEFN)Sav2_Misc_sizeof, (SAVEINITFN)Sav2_Misc_init},
    { SAVE_UNK_10,       0, (SAVESIZEFN)sub_0203B920, (SAVEINITFN)sub_0203B928},
    { SAVE_UNK_11,       0, (SAVESIZEFN)sub_020290B8, (SAVEINITFN)sub_020290C8},
    { SAVE_DRESSUP_DATA, 0, (SAVESIZEFN)Sav2_DressupData_sizeof, (SAVEINITFN)Sav2_DressupData_init},
    { SAVE_MAILBOX,      0, (SAVESIZEFN)Sav2_Mailbox_sizeof, (SAVEINITFN)Sav2_Mailbox_init},
    { SAVE_FRIEND_GROUP, 0, (SAVESIZEFN)Sav2_FriendGroup_sizeof, (SAVEINITFN)Sav2_FriendGroup_init},
    { SAVE_UNK_15,       0, (SAVESIZEFN)sub_0202C9A0, (SAVEINITFN)sub_0202C9A8},
    { SAVE_GAMESTATS,    0, (SAVESIZEFN)GameStats_sizeof, (SAVEINITFN)GameStats_init},
    { SAVE_SEAL_CASE,    0, (SAVESIZEFN)Sav2_SealCase_sizeof, (SAVEINITFN)Sav2_SealCase_init},
    { SAVE_CHATOT,       0, (SAVESIZEFN)Sav2_Chatot_sizeof, (SAVEINITFN)Sav2_Chatot_init},
    { SAVE_UNK_19,       0, (SAVESIZEFN)sub_02031000, (SAVEINITFN)sub_02031008},
    { SAVE_UNK_20,       0, (SAVESIZEFN)sub_0202D938, (SAVEINITFN)sub_0202D93C},
    { SAVE_ROAMER,       0, (SAVESIZEFN)Save_Roamers_sizeof, (SAVEINITFN)Save_Roamers_init},
    { SAVE_UNK_22,       0, (SAVESIZEFN)sub_0202DB40, (SAVEINITFN)sub_0202DB44},
    { SAVE_UNK_23,       0, (SAVESIZEFN)sub_0202E41C, (SAVEINITFN)sub_0202E424},
    { SAVE_UNK_24,       0, (SAVESIZEFN)sub_0202E4F4, (SAVEINITFN)sub_0202E4FC},
    { SAVE_UNK_25,       0, (SAVESIZEFN)sub_0202C034, (SAVEINITFN)sub_0202C03C},
    { SAVE_UNK_26,       0, (SAVESIZEFN)sub_0202CA24, (SAVEINITFN)sub_0202CA2C},
    { SAVE_MYSTERY_GIFT, 0, (SAVESIZEFN)Save_MysteryGift_sizeof, (SAVEINITFN)Save_MysteryGift_init},
    { SAVE_UNK_28,       0, (SAVESIZEFN)sub_0202EB30, (SAVEINITFN)sub_0202EB38},
    { SAVE_UNK_29,       0, (SAVESIZEFN)sub_02031AF0, (SAVEINITFN)sub_02031AF4},
    { SAVE_EASY_CHAT,    0, (SAVESIZEFN)Sav2_EasyChat_sizeof, (SAVEINITFN)Sav2_EasyChat_init},
    { SAVE_UNK_31,       0, (SAVESIZEFN)sub_0203170C, (SAVEINITFN)sub_02031710},
    { SAVE_UNK_32,        0,(SAVESIZEFN) sub_020318C8, (SAVEINITFN)sub_020318CC},
    { SAVE_FOLLOW_POKE,   0,(SAVESIZEFN) Sav2_FollowPoke_sizeof, (SAVEINITFN)Sav2_FollowPoke_init},
    { SAVE_GSPLAYERMISC, 0, (SAVESIZEFN)SaveData_GSPlayerMisc_sizeof, (SAVEINITFN)SaveData_GSPlayerMisc_init},
    { SAVE_SAFARI_ZONE,  0, (SAVESIZEFN)Save_SafariZone_sizeof, (SAVEINITFN)Save_SafariZone_init},
    { SAVE_PHOTO_ALBUM,  0, (SAVESIZEFN)Save_PhotoAlbum_sizeof, (SAVEINITFN)Save_PhotoAlbum_init},
    { SAVE_UNK_37,       0, (SAVESIZEFN)sub_02031904, (SAVEINITFN)sub_0203190C},
    { SAVE_APRICORN_BOX, 0, (SAVESIZEFN)Save_ApricornBox_sizeof, (SAVEINITFN)Save_ApricornBox_init},
    { SAVE_POKEWALKER,   0, (SAVESIZEFN)Pokewalker_sizeof, (SAVEINITFN)Pokewalker_init},
    { SAVE_UNK_40,       0, (SAVESIZEFN)sub_02032774, (SAVEINITFN)sub_02032788},
    { SAVE_PCSTORAGE,    1, (SAVESIZEFN)PCStorage_sizeof, (SAVEINITFN)PCStorage_init},
};
const int _020F6460 = NELEMS(_020F64C4);

struct UnkStruct_0202E474 *sub_020270C4(SAVEDATA *saveData) {
    SaveSubstruct_AssertCRC(SAVE_UNK_23);
    return SavArray_get(saveData, SAVE_UNK_23);
}

PC_STORAGE *GetStoragePCPointer(SAVEDATA *saveData) {
    return SavArray_get(saveData, SAVE_PCSTORAGE);
}

MYSTERY_GIFT_SAVE *Save_MysteryGift_get(SAVEDATA *saveData) {
    SaveSubstruct_AssertCRC(SAVE_MYSTERY_GIFT);
    return SavArray_get(saveData, SAVE_MYSTERY_GIFT);
}

struct UnkStruct_0202EB30 *sub_020270F8(SAVEDATA *saveData) {
    return SavArray_get(saveData, SAVE_UNK_28);
}

DECL_CHUNK_EX(sub_020312A4, sub_020312AC)
DECL_CHUNK_EX(sub_0202FBCC, sub_0202FBD4)
DECL_CHUNK_EX(sub_0202FBCC, sub_0202FBD4)
DECL_CHUNK_EX(sub_0202FBCC, sub_0202FBD4)
DECL_CHUNK_EX(sub_0202FBCC, sub_0202FBD4)

const struct ExtraSaveChunkHeader _020F6464[] = {
    { 0, SAVE_PAGE_MAX, (SAVESIZEFN)Sav2_HOF_sizeof, (SAVEINITFN)Sav2_HOF_init },
    { 1, SAVE_PAGE_MAX + 3, (SAVESIZEFN)sub_020312A4, (SAVEINITFN)sub_020312AC },
    { 2, SAVE_PAGE_MAX + 4, (SAVESIZEFN)sub_0202FBCC, (SAVEINITFN)sub_0202FBD4 },
    { 3, SAVE_PAGE_MAX + 6, (SAVESIZEFN)sub_0202FBCC, (SAVEINITFN)sub_0202FBD4 },
    { 4, SAVE_PAGE_MAX + 8, (SAVESIZEFN)sub_0202FBCC, (SAVEINITFN)sub_0202FBD4 },
    { 5, SAVE_PAGE_MAX + 10, (SAVESIZEFN)sub_0202FBCC, (SAVEINITFN)sub_0202FBD4 },
};

const int _020F645C = NELEMS(_020F6464);

HALL_OF_FAME *LoadHallOfFame(SAVEDATA *saveData, HeapID heapId, int *ret_p) {
    return ReadExtraSaveChunk(saveData, heapId, 0, ret_p);
}

int SaveHallOfFame(SAVEDATA *saveData, const HALL_OF_FAME *hallOfFame) {
    return WriteExtraSaveChunk(saveData, 0, hallOfFame);
}

struct UnkStruct_0202FBCC *sub_0202711C(SAVEDATA *saveData, HeapID heapId, int *ret_p, int idx) {
    int sp4;
    return sub_020284A4(saveData, heapId, idx + 2, ret_p, &sp4);
}

int sub_02027134(SAVEDATA *saveData, const struct UnkStruct_0202FBCC *data, int idx) {
    return sub_02028230(saveData, idx + 2, data);
}

struct UnkStruct_02030A98 *sub_02027144(SAVEDATA *saveData, HeapID heapId, int *ret_p) {
    int sp4;
    return sub_020284A4(saveData, heapId, 1, ret_p, &sp4);
}

int sub_02027158(SAVEDATA *saveData, const struct UnkStruct_02030A98 *data) {
    return sub_02028230(saveData, 1, data);
}

u32 sub_02027164(void) {
    return sub_02074120();
}

u32 sub_0202716C(void) {
    return NUM_BOXES;
}

u32 sub_02027170(SAVEDATA *saveData) {
    PC_STORAGE *pcStorage = SavArray_get(saveData, SAVE_PCSTORAGE);
    return PCStorage_GetBoxModifiedFlags(pcStorage);
}

void sub_02027180(SAVEDATA *saveData) {
    PC_STORAGE *pcStorage = SavArray_get(saveData, SAVE_PCSTORAGE);
    PCStorage_ResetBoxModifiedFlags(pcStorage);
}

void sub_02027190(SAVEDATA *saveData) {
    PC_STORAGE *pcStorage = SavArray_get(saveData, SAVE_PCSTORAGE);
    PCStorage_SetAllBoxesModified(pcStorage);
}

void sub_020271A0(SAVEDATA *saveData) {
    PC_STORAGE *pcStorage = SavArray_get(saveData, SAVE_PCSTORAGE);
    sub_02074128(pcStorage);
}
