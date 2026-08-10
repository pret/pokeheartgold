#include "field/signpost.h"

#include "global.h"

#include "constants/scrcmd.h"

#include "dialog_box.h"
#include "field_system.h"

static void FieldSystem_SignpostWindowCommand_Show(FieldSystem *fieldSystem);
static void FieldSystem_SignpostWindowCommand_Hide(FieldSystem *fieldSystem);
static BOOL FieldSystem_SignpostWindowCommand_WipeIn(FieldSystem *fieldSystem);
static BOOL FieldSystem_SignpostWindowCommand_WipeOut(FieldSystem *fieldSystem);

Signpost *Signpost_Init(enum HeapID heapId) {
    Signpost *ret = Heap_Alloc(heapId, sizeof(Signpost));
    memset(ret, 0, sizeof(Signpost));
    return ret;
}

void Signpost_Free(Signpost *signpost) {
    if (signpost->isActive) {
        RemoveWindow(&signpost->window);
    }
    Heap_Free(signpost);
}

void Signpost_SetParam(Signpost *signpost, u8 type, u16 map) {
    signpost->type = type;
    signpost->map = map;
}

void Signpost_SetCommand(Signpost *signpost, u8 command) {
    signpost->command = command;
}

Window *Signpost_GetWindow(Signpost *signpost) {
    return &signpost->window;
}

u8 Signpost_GetType(Signpost *signpost) {
    return signpost->type;
}

BOOL Signpost_CommandIsFinished(Signpost *signpost) {
    return signpost->command == MAPSIGNCOMMAND_NOP;
}

void Signpost_DoCurrentCommand(FieldSystem *fieldSystem) {
    Signpost *signpost = fieldSystem->signpost;

    switch (signpost->command) {
    case MAPSIGNCOMMAND_NOP:
        break;
    case MAPSIGNCOMMAND_SHOW:
        FieldSystem_SignpostWindowCommand_Show(fieldSystem);
        signpost->command = MAPSIGNCOMMAND_NOP;
        break;
    case MAPSIGNCOMMAND_WIPE_OUT:
        if (FieldSystem_SignpostWindowCommand_WipeOut(fieldSystem) == TRUE) {
            signpost->command = MAPSIGNCOMMAND_NOP;
        }
        break;
    case MAPSIGNCOMMAND_WIPE_IN:
        if (FieldSystem_SignpostWindowCommand_WipeIn(fieldSystem) == TRUE) {
            signpost->command = MAPSIGNCOMMAND_NOP;
        }
        break;
    case MAPSIGNCOMMAND_HIDE:
        FieldSystem_SignpostWindowCommand_Hide(fieldSystem);
        signpost->command = MAPSIGNCOMMAND_NOP;
        break;
    }
}

void FieldSystem_SetAndExecuteSignpostWindowCommand(FieldSystem *fieldSystem, u8 cmd) {
    Signpost_SetCommand(fieldSystem->signpost, cmd);
    Signpost_DoCurrentCommand(fieldSystem);
}

static void FieldSystem_SignpostWindowCommand_Show(FieldSystem *fieldSystem) {
    BgSetPosTextAndCommit(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, -48);

    if (!fieldSystem->signpost->isActive) {
        DialogBox_AddWindowToLayer3WithXOffset(fieldSystem->bgConfig, &fieldSystem->signpost->window, fieldSystem->signpost->type, GF_BG_LYR_MAIN_3);
        fieldSystem->signpost->isActive = TRUE;
    }
    DialogBox_DrawFrameWithWayfindingGraphic(&fieldSystem->signpost->window, fieldSystem->signpost->type, fieldSystem->signpost->map);
}

static void FieldSystem_SignpostWindowCommand_Hide(FieldSystem *fieldSystem) {
    if (fieldSystem->signpost->isActive) {
        RemoveWindow(&fieldSystem->signpost->window);
        FillBgTilemapRect(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, 18, 32, 6, TILEMAP_FILL_KEEP_PAL);
        BgCommitTilemapBufferToVram(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3);
        BgSetPosTextAndCommit(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, 0);
        fieldSystem->signpost->isActive = FALSE;
    }
}

static BOOL FieldSystem_SignpostWindowCommand_WipeIn(FieldSystem *fieldSystem) {
    int bgYpos = Bg_GetYpos(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3);
    if (bgYpos == 0) {
        return TRUE;
    }
    if (bgYpos <= -48 || bgYpos >= 0) {
        BgSetPosTextAndCommit(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, -48);
    }
    BgSetPosTextAndCommit(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_ADD_Y, 16);
    return FALSE;
}

static BOOL FieldSystem_SignpostWindowCommand_WipeOut(FieldSystem *fieldSystem) {
    int bgYpos = Bg_GetYpos(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3);
    if (bgYpos == -48) {
        FillBgTilemapRect(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, 18, 32, 6, TILEMAP_FILL_KEEP_PAL);
        BgCommitTilemapBufferToVram(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3);
        BgSetPosTextAndCommit(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, 0);
        return TRUE;
    }
    if (bgYpos <= -48 || bgYpos >= 0) {
        BgSetPosTextAndCommit(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, 0);
    }
    BgSetPosTextAndCommit(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SUB_Y, 16);
    return FALSE;
}
