#include "overlay_manager.h"
#include "overlay_trainer_card.h"
#include "overlay_trainer_card_main.h"
#include "overlay_trainer_card_signature.h"
#include "unk_02004A44.h"
#include "save_trainer_card.h"

FS_EXTERN_OVERLAY(OVY_51);
FS_EXTERN_OVERLAY(OVY_52);

enum {
    TRAINERCARD_RUN_INIT,
    TRAINERCARD_RUN_EXEC,
    TRAINERCARD_RUN_SIGNATURE_INIT,
    TRAINERCARD_RUN_SIGNATURE_EXEC,
    TRAINERCARD_RUN_EXIT,
};

static BOOL isSubprocFinished(OVY_MANAGER **man);
static int TCardAppRunStep_Init(TrainerCardAppState *a0);
static int TCardAppRunStep_Exec(TrainerCardAppState *a0);
static int TCardAppRunStep_SignatureInit(TrainerCardAppState *a0);
static int TCardAppRunStep_SignatureExec(TrainerCardAppState *a0);

static BOOL isSubprocFinished(OVY_MANAGER **man) {
    if (*man && OverlayManager_run(*man)) {
        OverlayManager_delete(*man);
        *man = NULL;
        return TRUE;
    }
    return FALSE;
}

BOOL TrainerCardApp_OvyInit(OVY_MANAGER *man, int *state) {
    void *ptr = OverlayManager_GetField18(man);
    CreateHeap(3, HEAP_ID_TRAINER_CARD, 0x1000);

    TrainerCardAppState *data = OverlayManager_CreateAndGetData(man, sizeof(TrainerCardAppState), HEAP_ID_TRAINER_CARD);
    MI_CpuFill8(data, 0, sizeof(TrainerCardAppState));

    data->heap_id = HEAP_ID_TRAINER_CARD;
    data->unkC = ptr;
    data->unk10 = ptr;
    return TRUE;
}

BOOL TrainerCardApp_OvyExec(OVY_MANAGER *man, int *state) {
    TrainerCardAppState *data = OverlayManager_GetData(man);
    switch (*state) {
    case TRAINERCARD_RUN_INIT:
        *state = TCardAppRunStep_Init(data);
        break;
    case TRAINERCARD_RUN_EXEC:
        *state = TCardAppRunStep_Exec(data);
        break;
    case TRAINERCARD_RUN_SIGNATURE_INIT:
        *state = TCardAppRunStep_SignatureInit(data);
        break;
    case TRAINERCARD_RUN_SIGNATURE_EXEC:
        *state = TCardAppRunStep_SignatureExec(data);
        break;
    case TRAINERCARD_RUN_EXIT:
    default:
        return TRUE;
    }
    return FALSE;
}

BOOL TrainerCardApp_OvyExit(OVY_MANAGER *man, int *state) {
    TrainerCardAppState *data = OverlayManager_GetData(man);
    MI_CpuFill8(data, 0, sizeof(TrainerCardAppState));
    OverlayManager_FreeData(man);
    sub_02004B10();
    DestroyHeap(HEAP_ID_TRAINER_CARD);
    return TRUE;
}

static int TCardAppRunStep_Init(TrainerCardAppState *a0) {
    static const OVY_MGR_TEMPLATE template = {
        TrainerCardMainApp_OvyInit,
        TrainerCardMainApp_OvyExec,
        TrainerCardMainApp_OvyExit,
        FS_OVERLAY_ID(OVY_51) 
    };

    a0->ov_mgr = OverlayManager_new(&template, a0->unkC, a0->heap_id);
    return TRAINERCARD_RUN_EXEC;
}

static int TCardAppRunStep_Exec(TrainerCardAppState *a0) {
    if (!isSubprocFinished(&a0->ov_mgr)) {
        return TRAINERCARD_RUN_EXEC;
    } else if (a0->unkC->reqUpdateSignature != 0) {
        return TRAINERCARD_RUN_SIGNATURE_INIT;
    } else {
        return TRAINERCARD_RUN_EXIT;
    }
}

static int TCardAppRunStep_SignatureInit(TrainerCardAppState *a0) {
    const OVY_MGR_TEMPLATE template = {
        SignBackOfTrainerCardApp_OvyInit, 
        SignBackOfTrainerCardApp_OvyExec, 
        SignBackOfTrainerCardApp_OvyExit,
        FS_OVERLAY_ID(OVY_52) 
    };
    a0->ov_mgr = OverlayManager_new(&template, a0->unkC->saveData, a0->heap_id);
    return TRAINERCARD_RUN_SIGNATURE_EXEC;
}

static int TCardAppRunStep_SignatureExec(TrainerCardAppState *a0) {
    void *ptr;
    if (!isSubprocFinished(&a0->ov_mgr)) {
        return TRAINERCARD_RUN_SIGNATURE_EXEC;
    }

    ptr = Save_TranerCard_get(a0->unkC->saveData);
    a0->unkC->unk4b = TrainerCard_SignatureExists(ptr);
    MI_CpuCopy8(TrainerCard_GetSignature(ptr), a0->unkC->unk68, sizeof(a0->unkC->unk68));
    return TRAINERCARD_RUN_INIT;
}
