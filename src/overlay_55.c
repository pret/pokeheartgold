#include <nitro/mi/memory.h>
#include "global.h"
#include "constants/game_stat.h"
#include "constants/mail.h"
#include "game_stats.h"
#include "overlay_55.h"
#include "player_data.h"

FS_EXTERN_OVERLAY(OVY_56);
FS_EXTERN_OVERLAY(OVY_102);

extern BOOL ov56_021E5C20(OVY_MANAGER*, int*);
extern BOOL ov56_021E5C9C(OVY_MANAGER*, int*);
extern BOOL ov56_021E5CB4(OVY_MANAGER*, int*);

extern BOOL ov102_021E7740(OVY_MANAGER*, int*);
extern BOOL ov102_021E77B8(OVY_MANAGER*, int*);
extern BOOL ov102_021E7868(OVY_MANAGER*, int*);

static const OVY_MGR_TEMPLATE ov55_021E5BF4 = {
    .init = ov56_021E5C20,
    .exec = ov56_021E5C9C,
    .exit = ov56_021E5CB4,
    .ovy_id = FS_OVERLAY_ID(OVY_56),
};

static const OVY_MGR_TEMPLATE ov55_021E5C04 = {
    .init = ov102_021E7740,
    .exec = ov102_021E77B8,
    .exit = ov102_021E7868,
    .ovy_id = FS_OVERLAY_ID(OVY_102),
};

static UnkStruct_ov55_021E5B08* ov55_021E5B08(Mail*, HeapID);
static void ov55_021E5BAC(UnkStruct_ov55_021E5B08*);
static void ov55_021E5BC4(Mail*, UnkStruct_ov55_021E5B08*);

static BOOL ov55_021E5900(OVY_MANAGER **manager) {
    if (*manager != NULL && OverlayManager_Run(*manager)) {
        OverlayManager_Delete(*manager);
        *manager = NULL;
        return TRUE;
    }

    return FALSE;
}

BOOL ov55_UnkApp_Init(OVY_MANAGER *manager, int *state) {
    UnkStruct_ov55_021E5924 *overlayData;
    UnkArgs_ov55 *args;

    args = OverlayManager_GetArgs(manager);
    CreateHeap(3, HEAP_ID_OV55, 0x1000);
    overlayData = OverlayManager_CreateAndGetData(manager, sizeof(UnkStruct_ov55_021E5924), HEAP_ID_OV55);
    MI_CpuFill8(overlayData, 0, sizeof(UnkStruct_ov55_021E5924));

    overlayData->heapId = HEAP_ID_OV55;
    overlayData->unk10 = ov55_021E5B08(args->mail, HEAP_ID_OV55);
    overlayData->unk10->options = Save_PlayerData_GetOptionsAddr(args->saveData);
    if (args->unk0 == 1) {
        overlayData->unk10->mailType = args->mailType;
    }
    if (overlayData->unk10->mailType >= NUM_MAIL) {
        overlayData->unk10->mailType = MAIL_GRASS;
    }
    overlayData->unk10->unk0 = args->unk0;
    overlayData->unk10->unk8 = args->unk1C;
    return TRUE;
}

BOOL ov55_UnkApp_Main(OVY_MANAGER *manager, int *state) {
    UnkStruct_ov55_021E5924 *overlayData = OverlayManager_GetData(manager);
    UnkArgs_ov55 *args = OverlayManager_GetArgs(manager);

    switch (*state) {
        case 0:
            overlayData->unk10->unk0 = args->unk0;
            overlayData->unkC = OverlayManager_New(&ov55_021E5BF4, overlayData->unk10, overlayData->heapId);
            *state = 1;
            break;

        case 1:
            if (!ov55_021E5900(&overlayData->unkC)) {
                break;
            }

            switch (overlayData->unk10->unk0) {
                case 0xFFFF:
                    *state = 2;
                    break;
                case 3:
                    *state = 2;
                    break;
                default:
                    *state = 3;
                    break;
            }

            break;

        case 2:
            if (args->unk0 == 1) {
                if (overlayData->unk10->unk0 == 3) {
                    ov55_021E5BC4(args->mail, overlayData->unk10);
                    GameStats_AddSpecial(Save_GameStats_Get(args->saveData), GAME_STAT_UNK2);
                    GameStats_Inc(Save_GameStats_Get(args->saveData), GAME_STAT_UNK46);
                    args->unk4 = 1;
                } else {
                    args->unk4 = 0;
                }
            }

            return TRUE;

        case 3:
            overlayData->unk8 = sub_02090C94(2, 0, args->saveData, args->unk1C, overlayData->heapId);
            if (MailMsg_IsInit(&overlayData->unk10->mailMessages[overlayData->unk10->mailMessageIdx])) {
                MailMsg_Copy(&overlayData->unk14, &overlayData->unk10->mailMessages[overlayData->unk10->mailMessageIdx]);
            } else {
                MailMsg_Init_WithBank(&overlayData->unk14, MAILMSG_BANK_0293_GMM);
            }
            sub_02090D20(overlayData->unk8, &overlayData->unk14);
            overlayData->unkC = OverlayManager_New(&ov55_021E5C04, overlayData->unk8, overlayData->heapId);
            *state = 4;
            break;

        case 4:
            if (ov55_021E5900(&overlayData->unkC)) {
                if (sub_02090D48(overlayData->unk8) == 0) {
                    sub_02090D60(overlayData->unk8, &overlayData->unk10->mailMessages[overlayData->unk10->mailMessageIdx]);
                }
                sub_02090D0C(overlayData->unk8);
                *state = 0;
            }

            break;
    }

    return FALSE;
}

BOOL ov55_UnkApp_Exit(OVY_MANAGER *manager, int *state) {
    UnkStruct_ov55_021E5924 *overlayData = OverlayManager_GetData(manager);
    ov55_021E5BAC(overlayData->unk10);
    OverlayManager_FreeData(manager);
    DestroyHeap(overlayData->heapId);
    return TRUE;
}

static UnkStruct_ov55_021E5B08 *ov55_021E5B08(Mail *mail, HeapID heapId) {
    UnkStruct_ov55_021E5B08 *ret = AllocFromHeap(heapId, sizeof(UnkStruct_ov55_021E5B08));
    MI_CpuFill8(ret, 0, sizeof(UnkStruct_ov55_021E5B08));

    ret->unk0 = 0;
    ret->mailOTID = Mail_GetOTID(mail);
    ret->mailAuthorName = String_New(PLAYER_NAME_LENGTH + 1, heapId);
    CopyU16ArrayToString(ret->mailAuthorName, Mail_GetAuthorNamePtr(mail));
    ret->mailType = Mail_GetType(mail);
    ret->mailLanguage = Mail_GetLanguage(mail);
    ret->mailVersion = Mail_GetVersion(mail);

    for (u16 i = 0; i < 3; i++) {
        ret->unk18[i] = sub_0202B404(mail, (u8)i, 2, sub_0202B4E4(mail));
    }

    for (u16 i = 0; i < 3; i++) {
        MailMsg_Copy(&ret->mailMessages[i], Mail_GetUnk20Array(mail, (u8)i));
    }

    return ret;
}

static void ov55_021E5BAC(UnkStruct_ov55_021E5B08 *unk) {
    if (unk->mailAuthorName != NULL) {
        String_Delete(unk->mailAuthorName);
    }

    FreeToHeap(unk);
}

static void ov55_021E5BC4(Mail *mail, UnkStruct_ov55_021E5B08 *unk) {
    for (u16 i = 0; i < 3; i++) {
        Mail_SetMessage(mail, &unk->mailMessages[i], (u8)i);
    }
    Mail_SetType(mail, unk->mailType);
}
