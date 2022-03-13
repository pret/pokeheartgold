#include "apricorn_tree.h"
#include "constants/easy_chat.h"
#include "constants/mail.h"
#include "constants/species.h"
#include "friend_group.h"
#include "heap.h"
#include "igt.h"
#include "mail.h"
#include "main.h"
#include "math_util.h"
#include "msgdata.h"
#include "msgdata/msg.naix"
#include "options.h"
#include "overlay_manager.h"
#include "party.h"
#include "pokemon.h"
#include "pokewalker.h"
#include "safari_zone.h"
#include "sav_system_info.h"
#include "sys_flags.h"
#include "sys_vars.h"
#include "unk_0205B3DC.h"

extern const OVY_MGR_TEMPLATE _020FA15C;
extern const OVY_MGR_TEMPLATE _020FA16C;
extern const OVY_MGR_TEMPLATE _02106068;

extern void sub_0201838C(IGT* igt);
extern u32 sub_020674BC(SAVEDATA* savedata);
extern void Save_CurrentLocation_BackUp(SAVEDATA* savedata);
extern void sub_0202C7C0(SAV_FRIEND_GRP* friend_groups, u32 group_idx, u32 a2);

static BOOL ov36_021E599C(OVY_MANAGER* man, int* state);
static BOOL ov36_021E59B4(OVY_MANAGER* man, int* state);
static BOOL ov36_021E5A1C(OVY_MANAGER* man, int* state);
static BOOL ov36_021E5948(OVY_MANAGER* man, int* state);
static BOOL ov36_021E5960(OVY_MANAGER* man, int* state);
static BOOL ov36_021E5980(OVY_MANAGER* man, int* state);
static BOOL ov36_021E5900(OVY_MANAGER* man, int* state);
static BOOL ov36_021E5918(OVY_MANAGER* man, int* state);
static BOOL ov36_TitleScreen_SwitchToNewGame(OVY_MANAGER* man, int* state);
static void ov36_021E5A38(HeapID heap_id, SAVEDATA* savedata, BOOL set_trainer_id);
static void ov36_021E5BB4(HeapID heap_id, SAVEDATA* savedata);
static void ov36_021E5BC8(HeapID heap_id, SAVEDATA* savedata);

const OVY_MGR_TEMPLATE ov36_App_MainMenu_SelectOption_NewGame = {
    .init = ov36_021E5900,
    .exec = ov36_021E5918,
    .exit = ov36_TitleScreen_SwitchToNewGame,
    .ovy_id = FS_OVERLAY_ID_NONE,
};

const OVY_MGR_TEMPLATE ov36_021E5C14 = {
    .init = ov36_021E5948,
    .exec = ov36_021E5960,
    .exit = ov36_021E5980,
    .ovy_id = FS_OVERLAY_ID_NONE,
};

const OVY_MGR_TEMPLATE ov36_App_MainMenu_SelectOption_Continue = {
    .init = ov36_021E599C,
    .exec = ov36_021E59B4,
    .exit = ov36_021E5A1C,
    .ovy_id = FS_OVERLAY_ID_NONE,
};

static const MAIL_MSG_TEMPLATE sMailMsgTemplates[2] = {
    {
        .msg_bank = 2,
        .msg_no = 4,
        .ec_groups = { EC_GROUP_FEELINGS, EC_GROUP_TOUGH_WORDS },
        .ec_words = { EC_WORD_FEELINGS_ADVENTURE - EC_WORDS_FEELINGS_MIN, EC_WORD_TOUGH_WORDS_EXCITED - EC_WORDS_TOUGH_WORDS_MIN },
    },
    {
        .msg_bank = 3,
        .msg_no = 1,
        .ec_groups = { EC_GROUP_QUESTION_MARKS, 0xFF },
        .ec_words = { EC_WORD_QUESTION_MARKS_POKEMON - EC_WORDS_QUESTION_MARKS_MIN, 0 },
    },
};

BOOL ov36_021E5900(OVY_MANAGER* man, int* state) {
#pragma unused(man, state)
    CreateHeap(3, 75, 0x20000);
    InitializeMainRNG();

    return TRUE;
}

BOOL ov36_021E5918(OVY_MANAGER* man, int* state) {
#pragma unused(state)
    SAVEDATA* savedata = ((struct UnkStruct_02111868_sub*)OverlayManager_GetParentWork(man))->savedata;
    ov36_021E5BC8(75, savedata);

    return TRUE;
}

BOOL ov36_TitleScreen_SwitchToNewGame(OVY_MANAGER* man, int* state) {
#pragma unused(man, state)
    DestroyHeap(75);
    RegisterMainOverlay(FS_OVERLAY_ID_NONE, &_02106068);

    return TRUE;
}

BOOL ov36_021E5948(OVY_MANAGER* man, int* state) {
#pragma unused(man, state)
    CreateHeap(3, 75, 0x20000);
    InitializeMainRNG();

    return TRUE;
}

BOOL ov36_021E5960(OVY_MANAGER* man, int* state) {
#pragma unused(state)
    struct UnkStruct_02111868_sub* unk_work = OverlayManager_GetParentWork(man);
    SAVEDATA* savedata = unk_work->savedata;
    ov36_021E5A38(75, savedata, 1);
    sub_0201838C(Sav2_PlayerData_GetIGTAddr(savedata));

    return TRUE;
}

BOOL ov36_021E5980(OVY_MANAGER* man, int* state) {
#pragma unused(man, state)
    DestroyHeap(75);
    RegisterMainOverlay(FS_OVERLAY_ID_NONE, &_020FA15C);

    return TRUE;
}

BOOL ov36_021E599C(OVY_MANAGER* man, int* state) {
#pragma unused(man, state)
    CreateHeap(3, 75, 0x20000);
    InitializeMainRNG();

    return TRUE;
}

BOOL ov36_021E59B4(OVY_MANAGER* man, int* state) {
#pragma unused(state)
    struct UnkStruct_02111868_sub* unk_work = OverlayManager_GetParentWork(man);
    SAVEDATA* savedata = unk_work->savedata;
    SYSINFO* sys_info = Sav2_SysInfo_get(savedata);

    ov36_021E5BB4(75, savedata);

    Options_SetButtonModeOnMain(savedata, 0);

    if (!Sav2_SysInfo_MacAddressIsMine(sys_info) || !Sav2_SysInfo_RTCOffsetIsMine(sys_info)) {
        sub_02028E4C(Sav2_SysInfo_RTC_get(savedata));
        Sav2_BerryPotRTC_init(Sav2_BerryPotRTC_get(savedata));
        Sav2_SysInfo_InitFromSystem(sys_info);
        Party_ResetAllShayminToLandForme(SavArray_PlayerParty_get(savedata));
    }

    sub_0201838C(Sav2_PlayerData_GetIGTAddr(savedata));

    return TRUE;
}

BOOL ov36_021E5A1C(OVY_MANAGER* man, int* state) {
#pragma unused(man, state)
    DestroyHeap(75);
    RegisterMainOverlay(FS_OVERLAY_ID_NONE, &_020FA16C);

    return TRUE;
}

static void ov36_021E5A38(HeapID heap_id, SAVEDATA* savedata, BOOL set_trainer_id) {
#pragma unused(heap_id)
    s32 i;
    MSGDATA* friend_names_msgdata;
    STRING* author_name;

    Sav2_SysInfo_InitFromSystem(Sav2_SysInfo_get(savedata));
    Sav2_SysInfo_RTC_init(Sav2_SysInfo_RTC_get(savedata));
    Sav2_BerryPotRTC_init(Sav2_BerryPotRTC_get(savedata));
    sub_0202C7C0(sub_0202C854(savedata), 1, MTRandom());
    sub_020674BC(savedata);

    PLAYERPROFILE* profile = Sav2_PlayerData_GetProfileAddr(savedata);
    u32 rand = MTRandom();

    if (set_trainer_id) {
        PlayerProfile_SetTrainerID(profile, rand);
    }

    SAFARIZONE* safari_zone = Save_SafariZone_get(savedata);
    SafariZone_ResetAreaSetToDefaultSet(safari_zone->area_sets, rand);

    PlayerProfile_SetAvatar(profile, sub_0205B418(rand, PlayerProfile_GetTrainerGender(profile), 0));

    sub_0202AE0C(Sav2_FieldApricornTrees_get(savedata));

    u32* pokewalker_unk = sub_02032728(Sav2_Pokewalker_get(savedata));
    for (i = 0; i < 10; i++) {
        pokewalker_unk[i] = MTRandom();
    }

    friend_names_msgdata = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0445_bin, 3);
    MAILBOX* mailbox = Sav2_Mailbox_get(savedata);
    POKEMON* friend_pokemon = AllocMonZeroed(3);

    CreateMon(friend_pokemon, SPECIES_MARILL, 1, 0, FALSE, 0, 0, 0);

    MAIL* mail;
    if (PlayerProfile_GetTrainerGender(profile) == PLAYER_GENDER_MALE) {
        author_name = NewString_ReadMsgData(friend_names_msgdata, 1);
        mail = CreateKenyaMail(friend_pokemon, MAIL_AIR, MON_FEMALE, author_name, 0);
    } else {
        author_name = NewString_ReadMsgData(friend_names_msgdata, 0);
        mail = CreateKenyaMail(friend_pokemon, MAIL_AIR, MON_MALE, author_name, 0);
    }

    MAIL_MESSAGE mail_message;

    for (i = 0; i < (s32)NELEMS(sMailMsgTemplates); i++) {
        MailMsg_init_fromTemplate(&mail_message, &sMailMsgTemplates[i]);
        Mail_CopyToUnk20Array(mail, &mail_message, (u8)i);
    }

    MailMsg_init(&mail_message);
    Mail_CopyToUnk20Array(mail, &mail_message, 2);
    Mailbox_CopyMailToSlotI(mailbox->msgs, FALSE, 0, mail);

    FreeToHeap(friend_pokemon);
    String_dtor(author_name);
    FreeToHeap(mail);
    DestroyMsgData(friend_names_msgdata);
}

static void ov36_021E5BB4(HeapID heap_id, SAVEDATA* savedata) {
#pragma unused(heap_id)
    if (!sub_020273B0(savedata)) {
        OS_ResetSystem(0);
    }
}

static void ov36_021E5BC8(HeapID heap_id, SAVEDATA* savedata) {
#pragma unused(heap_id)
    Sav2_InitDynamicRegion(savedata);
    Save_CurrentLocation_BackUp(savedata);

    PlayerProfile_SetMoney(Sav2_PlayerData_GetProfileAddr(savedata), 3000);

    ScriptState_SetFishingCompetitionLengthRecord(SavArray_Flags_get(savedata), 56150); // 3'6"

    SetFlag960(SavArray_Flags_get(savedata));
}
