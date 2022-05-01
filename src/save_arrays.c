#include "save_arrays.h"
#include "save.h"
#include "unk_0202E41C.h"
#include "pokemon_storage_system.h"
#include "mystery_gift.h"
#include "unk_0202EB30.h"
#include "unk_02030A98.h"
#include "hall_of_fame.h"
#include "save_palpad.h"
#include "daycare.h"
#include "sav_system_info.h"
#include "bag.h"
#include "event_data.h"
#include "save_misc_data.h"
#include "pokedex.h"
#include "sav_chatot.h"
#include "roamer.h"
#include "friend_group.h"
#include "easy_chat.h"
#include "safari_zone.h"
#include "pokewalker.h"
#include "photo_album.h"
#include "save_follow_poke.h"
#include "save_trainer_card.h"
#include "save_pokegear.h"
#include "save_flypoints.h"
#include "save_trainer_house.h"
#include "save_special_ribbons.h"

#define DECL_CHUNK(prefix) extern u32 prefix##_sizeof(void); extern void prefix##_init(void *);
#define DECL_CHUNK_EX(sizefn, initfn) extern u32 sizefn(void); extern void initfn(void *);

DECL_CHUNK_EX(sub_020290B8, sub_020290C8)
DECL_CHUNK(Sav2_DressupData)
DECL_CHUNK(GameStats)
DECL_CHUNK_EX(sub_02031000, sub_02031008)
DECL_CHUNK_EX(sub_0202DB40, sub_0202DB44)
DECL_CHUNK_EX(sub_0202E41C, sub_0202E424)
DECL_CHUNK_EX(sub_0202E4F4, sub_0202E4FC)
DECL_CHUNK_EX(sub_0202C034, sub_0202C03C)
DECL_CHUNK_EX(sub_0202CA24, sub_0202CA2C)
DECL_CHUNK_EX(sub_0202EB30, sub_0202EB38)
DECL_CHUNK_EX(sub_02031AF0, sub_02031AF4)
DECL_CHUNK_EX(sub_0203170C, sub_02031710)
DECL_CHUNK_EX(sub_020318C8, sub_020318CC)
DECL_CHUNK(Save_Pokeathlon)
DECL_CHUNK(Save_ApricornBox)

const struct SaveChunkHeader gSaveChunkHeaders[] = {
    {
        SAVE_SYSINFO,
        0,
        (SAVESIZEFN)Sav2_SysInfo_sizeof,
        (SAVEINITFN)Sav2_SysInfo_init
    }, {
        SAVE_PLAYERDATA,
        0,
        (SAVESIZEFN)Sav2_PlayerData_sizeof,
        (SAVEINITFN)Sav2_PlayerData_init
    }, {
        SAVE_PARTY,
        0,
        (SAVESIZEFN)SavArray_Party_sizeof,
        (SAVEINITFN)SavArray_Party_init
    }, {
        SAVE_BAG,
        0,
        (SAVESIZEFN)Sav2_Bag_sizeof,
        (SAVEINITFN)Sav2_Bag_init
    }, {
        SAVE_FLAGS,
        0,
        (SAVESIZEFN)SavArray_Flags_sizeof,
        (SAVEINITFN)SavArray_Flags_init
    }, {
        SAVE_FLYPOINTS,
        0,
        (SAVESIZEFN)Save_FlyPoints_sizeof,
        (SAVEINITFN)Save_FlyPoints_init
    }, {
        SAVE_POKEDEX,
        0,
        (SAVESIZEFN)Save_Pokedex_sizeof,
        (SAVEINITFN)Save_Pokedex_init
    }, {
        SAVE_DAYCARE,
        0,
        (SAVESIZEFN)Sav2_Daycare_sizeof,
        (SAVEINITFN)Sav2_Daycare_init
    }, {
        SAVE_PALPAD,
        0,
        (SAVESIZEFN)Save_PalPad_sizeof,
        (SAVEINITFN)Save_PalPad_init
    }, {
        SAVE_MISC,
        0,
        (SAVESIZEFN)Sav2_Misc_sizeof,
        (SAVEINITFN)Sav2_Misc_init
    }, {
        SAVE_MAP_OBJECTS,
        0,
        (SAVESIZEFN)Save_MapObjects_sizeof,
        (SAVEINITFN)Save_MapObjects_init
    }, {
        SAVE_UNK_11,
        0,
        (SAVESIZEFN)sub_020290B8,
        (SAVEINITFN)sub_020290C8
    }, {
        SAVE_DRESSUP_DATA,
        0,
        (SAVESIZEFN)Sav2_DressupData_sizeof,
        (SAVEINITFN)Sav2_DressupData_init
    }, {
        SAVE_MAILBOX,
        0,
        (SAVESIZEFN)Sav2_Mailbox_sizeof,
        (SAVEINITFN)Sav2_Mailbox_init
    }, {
        SAVE_FRIEND_GROUP,
        0,
        (SAVESIZEFN)Sav2_FriendGroup_sizeof,
        (SAVEINITFN)Sav2_FriendGroup_init
    }, {
        SAVE_TRAINER_CARD,
        0,
        (SAVESIZEFN)Save_TrainerCard_sizeof,
        (SAVEINITFN)Save_TrainerCard_init
    }, {
        SAVE_GAMESTATS,
        0,
        (SAVESIZEFN)GameStats_sizeof,
        (SAVEINITFN)GameStats_init
    }, {
        SAVE_SEAL_CASE,
        0,
        (SAVESIZEFN)Sav2_SealCase_sizeof,
        (SAVEINITFN)Sav2_SealCase_init
    }, {
        SAVE_CHATOT,
        0,
        (SAVESIZEFN)Sav2_Chatot_sizeof,
        (SAVEINITFN)Sav2_Chatot_init
    }, {
        SAVE_UNK_19,
        0,
        (SAVESIZEFN)sub_02031000,
        (SAVEINITFN)sub_02031008
    }, {
        SAVE_SPECIAL_RIBBONS,
        0,
        (SAVESIZEFN)Save_SpecialRibbons_sizeof,
        (SAVEINITFN)Save_SpecialRibbons_init
    }, {
        SAVE_ROAMER,
        0,
        (SAVESIZEFN)Save_Roamers_sizeof,
        (SAVEINITFN)Save_Roamers_init
    }, {
        SAVE_UNK_22,
        0,
        (SAVESIZEFN)sub_0202DB40,
        (SAVEINITFN)sub_0202DB44
    }, {
        SAVE_UNK_23,
        0,
        (SAVESIZEFN)sub_0202E41C,
        (SAVEINITFN)sub_0202E424
    }, {
        SAVE_UNK_24,
        0,
        (SAVESIZEFN)sub_0202E4F4,
        (SAVEINITFN)sub_0202E4FC
    }, {
        SAVE_UNK_25,
        0,
        (SAVESIZEFN)sub_0202C034,
        (SAVEINITFN)sub_0202C03C
    }, {
        SAVE_UNK_26,
        0,
        (SAVESIZEFN)sub_0202CA24,
        (SAVEINITFN)sub_0202CA2C
    }, {
        SAVE_MYSTERY_GIFT,
        0,
        (SAVESIZEFN)Save_MysteryGift_sizeof,
        (SAVEINITFN)Save_MysteryGift_init
    }, {
        SAVE_UNK_28,
        0,
        (SAVESIZEFN)sub_0202EB30,
        (SAVEINITFN)sub_0202EB38
    }, {
        SAVE_UNK_29,
        0,
        (SAVESIZEFN)sub_02031AF0,
        (SAVEINITFN)sub_02031AF4
    }, {
        SAVE_EASY_CHAT,
        0,
        (SAVESIZEFN)Sav2_EasyChat_sizeof,
        (SAVEINITFN)Sav2_EasyChat_init
    }, {
        SAVE_UNK_31,
        0,
        (SAVESIZEFN)sub_0203170C,
        (SAVEINITFN)sub_02031710
    }, {
        SAVE_UNK_32,
        0,
        (SAVESIZEFN)sub_020318C8,
        (SAVEINITFN)sub_020318CC
    }, {
        SAVE_FOLLOW_POKE,
        0,
        (SAVESIZEFN)Sav2_FollowPoke_sizeof,
        (SAVEINITFN)Sav2_FollowPoke_init
    }, {
        SAVE_POKEGEAR,
        0,
        (SAVESIZEFN)SaveData_GSPlayerMisc_sizeof,
        (SAVEINITFN)SaveData_GSPlayerMisc_init
    }, {
        SAVE_SAFARI_ZONE,
        0,
        (SAVESIZEFN)Save_SafariZone_sizeof,
        (SAVEINITFN)Save_SafariZone_init
    }, {
        SAVE_PHOTO_ALBUM,
        0,
        (SAVESIZEFN)Save_PhotoAlbum_sizeof,
        (SAVEINITFN)Save_PhotoAlbum_init
    }, {
        SAVE_POKEATHLON,
        0,
        (SAVESIZEFN)Save_Pokeathlon_sizeof,
        (SAVEINITFN)Save_Pokeathlon_init
    }, {
        SAVE_APRICORN_BOX,
        0,
        (SAVESIZEFN)Save_ApricornBox_sizeof,
        (SAVEINITFN)Save_ApricornBox_init
    }, {
        SAVE_POKEWALKER,
        0,
        (SAVESIZEFN)Pokewalker_sizeof,
        (SAVEINITFN)Pokewalker_init
    }, {
        SAVE_TRAINER_HOUSE,
        0,
        (SAVESIZEFN)Save_TrainerHouse_sizeof,
        (SAVEINITFN)Save_TrainerHouse_init
    }, {
        SAVE_PCSTORAGE,
        1,
        (SAVESIZEFN)PCStorage_sizeof,
        (SAVEINITFN)PCStorage_init
    },
};
const int gNumSaveChunkHeaders = NELEMS(gSaveChunkHeaders);

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

const struct ExtraSaveChunkHeader gExtraSaveChunkHeaders[] = {
    { 0, SAVE_PAGE_MAX, (SAVESIZEFN)Sav2_HOF_sizeof, (SAVEINITFN)Sav2_HOF_init },
    { 1, SAVE_PAGE_MAX + 3, (SAVESIZEFN)sub_020312A4, (SAVEINITFN)sub_020312AC },
    { 2, SAVE_PAGE_MAX + 4, (SAVESIZEFN)sub_0202FBCC, (SAVEINITFN)sub_0202FBD4 },
    { 3, SAVE_PAGE_MAX + 6, (SAVESIZEFN)sub_0202FBCC, (SAVEINITFN)sub_0202FBD4 },
    { 4, SAVE_PAGE_MAX + 8, (SAVESIZEFN)sub_0202FBCC, (SAVEINITFN)sub_0202FBD4 },
    { 5, SAVE_PAGE_MAX + 10, (SAVESIZEFN)sub_0202FBCC, (SAVEINITFN)sub_0202FBD4 },
};

const int gNumExtraSaveChunkHeaders = NELEMS(gExtraSaveChunkHeaders);

HALL_OF_FAME *LoadHallOfFame(SAVEDATA *saveData, HeapID heapId, int *ret_p) {
    return ReadExtraSaveChunk(saveData, heapId, 0, ret_p);
}

int SaveHallOfFame(SAVEDATA *saveData, HALL_OF_FAME *hallOfFame) {
    return WriteExtraSaveChunk(saveData, 0, hallOfFame);
}

struct UnkStruct_0202FBCC *sub_0202711C(SAVEDATA *saveData, HeapID heapId, int *ret_p, int idx) {
    int sp4;
    return sub_020284A4(saveData, heapId, idx + 2, ret_p, &sp4);
}

int sub_02027134(SAVEDATA *saveData, struct UnkStruct_0202FBCC *data, int idx) {
    return sub_02028230(saveData, idx + 2, data);
}

struct UnkStruct_02030A98 *sub_02027144(SAVEDATA *saveData, HeapID heapId, int *ret_p) {
    int sp4;
    return sub_020284A4(saveData, heapId, 1, ret_p, &sp4);
}

int sub_02027158(SAVEDATA *saveData, struct UnkStruct_02030A98 *data) {
    return sub_02028230(saveData, 1, data);
}

u32 PCStorage_GetSizeOfBox(void) {
    return sub_02074120();
}

u32 PCStorage_GetNumBoxes(void) {
    return NUM_BOXES;
}

u32 Save_GetPCBoxModifiedFlags(SAVEDATA *saveData) {
    PC_STORAGE *pcStorage = SavArray_get(saveData, SAVE_PCSTORAGE);
    return PCStorage_GetBoxModifiedFlags(pcStorage);
}

void Save_ResetPCBoxModifiedFlags(SAVEDATA *saveData) {
    PC_STORAGE *pcStorage = SavArray_get(saveData, SAVE_PCSTORAGE);
    PCStorage_ResetBoxModifiedFlags(pcStorage);
}

void Save_SetAllPCBoxesModified(SAVEDATA *saveData) {
    PC_STORAGE *pcStorage = SavArray_get(saveData, SAVE_PCSTORAGE);
    PCStorage_SetAllBoxesModified(pcStorage);
}

void sub_020271A0(SAVEDATA *saveData) {
    PC_STORAGE *pcStorage = SavArray_get(saveData, SAVE_PCSTORAGE);
    sub_02074128(pcStorage);
}
