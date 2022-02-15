#include "save_arrays.h"
#include "save.h"

#define DECL_CHUNK(prefix) extern u32 prefix##_sizeof(void); extern void prefix##_init(void *);
#define DECL_CHUNK_EX(sizefn, initfn) extern u32 sizefn(void); extern void initfn(void *);

DECL_CHUNK(Sav2_SysInfo)
DECL_CHUNK(Sav2_PlayerData)
DECL_CHUNK(SavArray_Party)
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
DECL_CHUNK(Sav2_SealCase)
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
DECL_CHUNK(PCStorage)

const struct SaveChunkHeader _020F64C4[] = {
    { SAVE_SYSINFO,      0, Sav2_SysInfo_sizeof, Sav2_SysInfo_init},
    { SAVE_PLAYERDATA,   0, Sav2_PlayerData_sizeof, Sav2_PlayerData_init},
    { SAVE_PARTY,        0, SavArray_Party_sizeof, SavArray_Party_init},
    { SAVE_BAG,          0, Sav2_Bag_sizeof, Sav2_Bag_init},
    { SAVE_FLAGS,        0, SavArray_Flags_sizeof, SavArray_Flags_init},
    { SAVE_FLYPOINTS,    0, Save_FlyPoints_sizeof, Save_FlyPoints_init},
    { SAVE_POKEDEX,      0, Save_Pokedex_sizeof, Save_Pokedex_init},
    { SAVE_DAYCARE,      0, Sav2_Daycare_sizeof, Sav2_Daycare_init},
    { SAVE_UNK_8,        0, sub_0202AEC0, sub_0202AED4},
    { SAVE_MISC,         0, Sav2_Misc_sizeof, Sav2_Misc_init},
    { SAVE_UNK_10,       0, sub_0203B920, sub_0203B928},
    { SAVE_UNK_11,       0, sub_020290B8, sub_020290C8},
    { SAVE_DRESSUP_DATA, 0, Sav2_DressupData_sizeof, Sav2_DressupData_init},
    { SAVE_MAILBOX,      0, Sav2_Mailbox_sizeof, Sav2_Mailbox_init},
    { SAVE_FRIEND_GROUP, 0, Sav2_FriendGroup_sizeof, Sav2_FriendGroup_init},
    { SAVE_UNK_15,       0, sub_0202C9A0, sub_0202C9A8},
    { SAVE_GAMESTATS,    0, GameStats_sizeof, GameStats_init},
    { SAVE_SEAL_CASE,    0, Sav2_SealCase_sizeof, Sav2_SealCase_init},
    { SAVE_CHATOT,       0, Sav2_Chatot_sizeof, Sav2_Chatot_init},
    { SAVE_UNK_19,       0, sub_02031000, sub_02031008},
    { SAVE_UNK_20,       0, sub_0202D938, sub_0202D93C},
    { SAVE_ROAMER,       0, Save_Roamers_sizeof, Save_Roamers_init},
    { SAVE_UNK_22,       0, sub_0202DB40, sub_0202DB44},
    { SAVE_UNK_23,       0, sub_0202E41C, sub_0202E424},
    { SAVE_UNK_24,       0, sub_0202E4F4, sub_0202E4FC},
    { SAVE_UNK_25,       0, sub_0202C034, sub_0202C03C},
    { SAVE_UNK_26,       0, sub_0202CA24, sub_0202CA2C},
    { SAVE_MYSTERY_GIFT, 0, Save_MysteryGift_sizeof, Save_MysteryGift_init},
    { SAVE_UNK_28,       0, sub_0202EB30, sub_0202EB38},
    { SAVE_UNK_29,       0, sub_02031AF0, sub_02031AF4},
    { SAVE_EASY_CHAT,    0, Sav2_EasyChat_sizeof, Sav2_EasyChat_init},
    { SAVE_UNK_31,       0, sub_0203170C, sub_02031710},
    { SAVE_UNK_32,        0, sub_020318C8, sub_020318CC},
    { SAVE_FOLLOW_POKE,   0, Sav2_FollowPoke_sizeof, Sav2_FollowPoke_init},
    { SAVE_GSPLAYERMISC, 0, SaveData_GSPlayerMisc_sizeof, SaveData_GSPlayerMisc_init},
    { SAVE_SAFARI_ZONE,  0, Save_SafariZone_sizeof, Save_SafariZone_init},
    { SAVE_PHOTO_ALBUM,  0, Save_PhotoAlbum_sizeof, Save_PhotoAlbum_init},
    { SAVE_UNK_37,       0, sub_02031904, sub_0203190C},
    { SAVE_APRICORN_BOX, 0, Save_ApricornBox_sizeof, Save_ApricornBox_init},
    { SAVE_POKEWALKER,   0, Pokewalker_sizeof, Pokewalker_init},
    { SAVE_UNK_40,       0, sub_02032774, sub_02032788},
    { SAVE_PCSTORAGE,    1, PCStorage_sizeof, PCStorage_init},
};
const int _020F6460 = NELEMS(_020F64C4);

DECL_CHUNK(Sav2_HOF)
DECL_CHUNK_EX(sub_020312A4, sub_020312AC)
DECL_CHUNK_EX(sub_0202FBCC, sub_0202FBD4)
DECL_CHUNK_EX(sub_0202FBCC, sub_0202FBD4)
DECL_CHUNK_EX(sub_0202FBCC, sub_0202FBD4)
DECL_CHUNK_EX(sub_0202FBCC, sub_0202FBD4)

const struct ExtraSaveChunkHeader _020F6464[] = {
    { 0, SAVE_PAGE_MAX, Sav2_HOF_sizeof, Sav2_HOF_init },
    { 1, SAVE_PAGE_MAX + 3, sub_020312A4, sub_020312AC },
    { 2, SAVE_PAGE_MAX + 4, sub_0202FBCC, sub_0202FBD4 },
    { 3, SAVE_PAGE_MAX + 6, sub_0202FBCC, sub_0202FBD4 },
    { 4, SAVE_PAGE_MAX + 8, sub_0202FBCC, sub_0202FBD4 },
    { 5, SAVE_PAGE_MAX + 10, sub_0202FBCC, sub_0202FBD4 },
};

const int _020F645C = NELEMS(_020F6464);
