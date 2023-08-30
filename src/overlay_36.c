#include "global.h"
#include "apricorn_tree.h"
#include "constants/easy_chat.h"
#include "constants/mail.h"
#include "constants/species.h"
#include "friend_group.h"
#include "heap.h"
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
#include "unk_02018380.h"
#include "unk_0202C730.h"
#include "unk_02066EDC.h"
#include "unk_0203E348.h"
#include "field_system.h"
#include "msgdata/msg/msg_0445.h"
#include "msgdata/msg/msg_0292.h"
#include "msgdata/msg/msg_0293.h"

#define HEAPID_OV36   ((HeapID)75)

extern const OVY_MGR_TEMPLATE gApplication_OakSpeech;

static BOOL ov36_App_MainMenu_SelectOption_Continue_AppInit(OVY_MANAGER* man, int* state);
static BOOL ov36_App_MainMenu_SelectOption_Continue_AppExec(OVY_MANAGER* man, int* state);
static BOOL ov36_App_MainMenu_SelectOption_Continue_AppExit(OVY_MANAGER* man, int* state);
static BOOL ov36_App_InitGameState_AfterOakSpeech_AppInit(OVY_MANAGER* man, int* state);
static BOOL ov36_App_InitGameState_AfterOakSpeech_AppExec(OVY_MANAGER* man, int* state);
static BOOL ov36_App_InitGameState_AfterOakSpeech_AppExit(OVY_MANAGER* man, int* state);
static BOOL ov36_TitleScreen_NewGame_AppInit(OVY_MANAGER* man, int* state);
static BOOL ov36_TitleScreen_NewGame_AppExec(OVY_MANAGER* man, int* state);
static BOOL ov36_TitleScreen_NewGame_AppExit(OVY_MANAGER* man, int* state);
static void InitGameStateAfterOakSpeech_Internal(HeapID heapId, SaveData* saveData, BOOL set_trainer_id);
static void Continue_LoadSaveData_HandleError(HeapID heapId, SaveData* saveData);
static void NewGame_InitSaveData(HeapID heapId, SaveData* saveData);

const OVY_MGR_TEMPLATE ov36_App_MainMenu_SelectOption_NewGame = {
    .init = ov36_TitleScreen_NewGame_AppInit,
    .exec = ov36_TitleScreen_NewGame_AppExec,
    .exit = ov36_TitleScreen_NewGame_AppExit,
    .ovy_id = FS_OVERLAY_ID_NONE,
};

const OVY_MGR_TEMPLATE ov36_App_InitGameState_AfterOakSpeech = {
    .init = ov36_App_InitGameState_AfterOakSpeech_AppInit,
    .exec = ov36_App_InitGameState_AfterOakSpeech_AppExec,
    .exit = ov36_App_InitGameState_AfterOakSpeech_AppExit,
    .ovy_id = FS_OVERLAY_ID_NONE,
};

const OVY_MGR_TEMPLATE ov36_App_MainMenu_SelectOption_Continue = {
    .init = ov36_App_MainMenu_SelectOption_Continue_AppInit,
    .exec = ov36_App_MainMenu_SelectOption_Continue_AppExec,
    .exit = ov36_App_MainMenu_SelectOption_Continue_AppExit,
    .ovy_id = FS_OVERLAY_ID_NONE,
};

static const MAIL_MSG_TEMPLATE sMailMsgTemplates[2] = {
    {
        // ADVENTURE! EXCITED!
        .msg_bank = MAILMSG_BANK_0292_GMM,
        .msg_no = msg_0292_00004,
        .ec_groups = { EC_GROUP_LIFESTYLE, EC_GROUP_FEELINGS },
        .ec_words = { EC_WORD_LIFESTYLE_ADVENTURE - EC_WORDS_LIFESTYLE_MIN, EC_WORD_FEELINGS_EXCITED - EC_WORDS_FEELINGS_MIN },
    },
    {
        // I love POKEMON!
        .msg_bank = MAILMSG_BANK_0293_GMM,
        .msg_no = msg_0293_00001,
        .ec_groups = { EC_GROUP_UNION, 0xFF },
        .ec_words = { EC_WORD_UNION_POKEMON - EC_WORDS_UNION_MIN, 0 },
    },
};

BOOL ov36_TitleScreen_NewGame_AppInit(OVY_MANAGER* man, int* state) {
#pragma unused(man, state)
    CreateHeap(3, HEAPID_OV36, 0x20000);
    InitializeMainRNG();

    return TRUE;
}

BOOL ov36_TitleScreen_NewGame_AppExec(OVY_MANAGER* man, int* state) {
#pragma unused(state)
    SaveData* saveData = ((struct UnkStruct_02111868_sub*)OverlayManager_GetArgs(man))->saveData;
    NewGame_InitSaveData(HEAPID_OV36, saveData);

    return TRUE;
}

BOOL ov36_TitleScreen_NewGame_AppExit(OVY_MANAGER* man, int* state) {
#pragma unused(man, state)
    DestroyHeap(HEAPID_OV36);
    RegisterMainOverlay(FS_OVERLAY_ID_NONE, &gApplication_OakSpeech);

    return TRUE;
}

BOOL ov36_App_InitGameState_AfterOakSpeech_AppInit(OVY_MANAGER* man, int* state) {
#pragma unused(man, state)
    CreateHeap(3, HEAPID_OV36, 0x20000);
    InitializeMainRNG();

    return TRUE;
}

BOOL ov36_App_InitGameState_AfterOakSpeech_AppExec(OVY_MANAGER* man, int* state) {
#pragma unused(state)
    struct UnkStruct_02111868_sub* unk_work = OverlayManager_GetArgs(man);
    SaveData* saveData = unk_work->saveData;
    InitGameStateAfterOakSpeech_Internal(HEAPID_OV36, saveData, TRUE);
    sub_0201838C(Save_PlayerData_GetIGTAddr(saveData));

    return TRUE;
}

BOOL ov36_App_InitGameState_AfterOakSpeech_AppExit(OVY_MANAGER* man, int* state) {
#pragma unused(man, state)
    DestroyHeap(HEAPID_OV36);
    RegisterMainOverlay(FS_OVERLAY_ID_NONE, &gApplication_NewGameFieldsys);

    return TRUE;
}

BOOL ov36_App_MainMenu_SelectOption_Continue_AppInit(OVY_MANAGER* man, int* state) {
#pragma unused(man, state)
    CreateHeap(3, HEAPID_OV36, 0x20000);
    InitializeMainRNG();

    return TRUE;
}

BOOL ov36_App_MainMenu_SelectOption_Continue_AppExec(OVY_MANAGER* man, int* state) {
#pragma unused(state)
    struct UnkStruct_02111868_sub* unk_work = OverlayManager_GetArgs(man);
    SaveData* saveData = unk_work->saveData;
    SysInfo* sys_info = Save_SysInfo_Get(saveData);

    Continue_LoadSaveData_HandleError(HEAPID_OV36, saveData);

    Options_SetButtonModeOnMain(saveData, 0);

    if (!Save_SysInfo_MacAddressIsMine(sys_info) || !Save_SysInfo_RTCOffsetIsMine(sys_info)) {
        SysInfoRTC_HandleContinueOnNewConsole(Save_SysInfo_RTC_Get(saveData));
        Save_BerryPotRTC_Init(Save_BerryPotRTC_Get(saveData));
        Save_SysInfo_InitFromSystem(sys_info);
        Party_ResetAllShayminToLandForm(SaveArray_Party_Get(saveData));
    }

    sub_0201838C(Save_PlayerData_GetIGTAddr(saveData));

    return TRUE;
}

BOOL ov36_App_MainMenu_SelectOption_Continue_AppExit(OVY_MANAGER* man, int* state) {
#pragma unused(man, state)
    DestroyHeap(HEAPID_OV36);
    RegisterMainOverlay(FS_OVERLAY_ID_NONE, &gApplication_ContinueFieldsys);

    return TRUE;
}

static void InitGameStateAfterOakSpeech_Internal(HeapID heapId, SaveData* saveData, BOOL set_trainer_id) {
#pragma unused(heapId)
    s32 i;
    MsgData* friend_names_msgdata;
    String* author_name;

    Save_SysInfo_InitFromSystem(Save_SysInfo_Get(saveData));
    Save_SysInfo_RTC_Init(Save_SysInfo_RTC_Get(saveData));
    Save_BerryPotRTC_Init(Save_BerryPotRTC_Get(saveData));
    sub_0202C7C0(Save_FriendGroup_Get(saveData), 1, MTRandom());
    sub_020674BC(saveData);

    PlayerProfile* profile = Save_PlayerData_GetProfileAddr(saveData);
    u32 rand = MTRandom();

    if (set_trainer_id) {
        PlayerProfile_SetTrainerID(profile, rand);
    }

    SafariZone* safari_zone = Save_SafariZone_Get(saveData);
    SafariZone_ResetAreaSetToDefaultSet(safari_zone->area_sets, rand);

    PlayerProfile_SetAvatar(profile, UnionRoomAvatarIdxToSprite(rand, PlayerProfile_GetTrainerGender(profile), 0));

    sub_0202AE0C(Save_FieldApricornTrees_Get(saveData));

    u32* pokewalker_unk = sub_02032728(Save_Pokewalker_Get(saveData));
    for (i = 0; i < 10; i++) {
        pokewalker_unk[i] = MTRandom();
    }

    // Put an email from your friend into your PC.
    friend_names_msgdata = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0445_bin, HEAP_ID_3);
    MAILBOX* mailbox = Save_Mailbox_Get(saveData);
    Pokemon *mon = AllocMonZeroed(HEAP_ID_3);

    CreateMon(mon, SPECIES_MARILL, 1, 0, FALSE, 0, OT_ID_PLAYER_ID, 0);

    Mail* mail;
    if (PlayerProfile_GetTrainerGender(profile) == PLAYER_GENDER_MALE) {
        author_name = NewString_ReadMsgData(friend_names_msgdata, msg_0445_00001);
        mail = CreateKenyaMail(mon, MAIL_AIR, MON_FEMALE, author_name, 0);
    } else {
        author_name = NewString_ReadMsgData(friend_names_msgdata, msg_0445_00000);
        mail = CreateKenyaMail(mon, MAIL_AIR, MON_MALE, author_name, 0);
    }

    MAIL_MESSAGE mail_message;

    for (i = 0; i < (s32)NELEMS(sMailMsgTemplates); i++) {
        MailMsg_Init_FromTemplate(&mail_message, &sMailMsgTemplates[i]);
        Mail_SetMessage(mail, &mail_message, (u8)i);
    }

    MailMsg_Init(&mail_message);
    Mail_SetMessage(mail, &mail_message, 2);
    Mailbox_CopyMailToSlotI(mailbox->msgs, FALSE, 0, mail);

    FreeToHeap(mon);
    String_Delete(author_name);
    FreeToHeap(mail);
    DestroyMsgData(friend_names_msgdata);
}

static void Continue_LoadSaveData_HandleError(HeapID heapId, SaveData* saveData) {
#pragma unused(heapId)
    if (!SaveData_TryLoadOnContinue(saveData)) {
        OS_ResetSystem(0);
    }
}

static void NewGame_InitSaveData(HeapID heapId, SaveData* saveData) {
#pragma unused(heapId)
    Save_InitDynamicRegion(saveData);
    Save_CurrentLocation_BackUp(saveData);

    PlayerProfile_SetMoney(Save_PlayerData_GetProfileAddr(saveData), 3000);

    Save_VarsFlags_SetFishingCompetitionLengthRecord(Save_VarsFlags_Get(saveData), 56150); // 3'6"

    SetFlag960(Save_VarsFlags_Get(saveData));
}
