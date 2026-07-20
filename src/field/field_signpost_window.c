#include "field_signpost_window.h"

#include "global.h"

#include "dialog_box.h"

static void FieldSystem_SignpostWindowCommand_Show(FieldSystem *fieldSystem);
static void FieldSystem_SignpostWindowCommand_Hide(FieldSystem *fieldSystem);
static BOOL FieldSystem_SignpostWindowCommand_WipeIn(FieldSystem *fieldSystem);
static BOOL FieldSystem_SignpostWindowCommand_WipeOut(FieldSystem *fieldSystem);

struct FieldSignpostWindow *FieldSignpostWindow_New(enum HeapID heapId) {
    struct FieldSignpostWindow *ret = Heap_Alloc(heapId, sizeof(struct FieldSignpostWindow));
    memset(ret, 0, sizeof(struct FieldSignpostWindow));
    return ret;
}

void FieldSignpostWindow_Delete(struct FieldSignpostWindow *signpostWindow) {
    if (signpostWindow->active) {
        RemoveWindow(&signpostWindow->window);
    }
    Heap_Free(signpostWindow);
}

void FieldSignpostWindow_SetParam(struct FieldSignpostWindow *signpostWindow, u8 type, u16 map) {
    signpostWindow->type = type;
    signpostWindow->map = map;
}

void FieldSignpostWindow_SetCommand(struct FieldSignpostWindow *signpostWindow, u8 cmd) {
    signpostWindow->cmd = cmd;
}

Window *FieldSignpostWindow_GetWindow(struct FieldSignpostWindow *signpostWindow) {
    return &signpostWindow->window;
}

u8 FieldSignpostWindow_GetType(struct FieldSignpostWindow *signpostWindow) {
    return signpostWindow->type;
}

BOOL FieldSignpostWindow_CommandIsFinished(struct FieldSignpostWindow *signpostWindow) {
    return signpostWindow->cmd == MAPSIGNCOMMAND_NOP;
}

void FieldSystem_ExecuteSignpostWindowCommand(FieldSystem *fieldSystem) {
    struct FieldSignpostWindow *signpostWindow = fieldSystem->signpostWindow;

    switch (signpostWindow->cmd) {
    case MAPSIGNCOMMAND_NOP:
        break;
    case MAPSIGNCOMMAND_SHOW:
        FieldSystem_SignpostWindowCommand_Show(fieldSystem);
        signpostWindow->cmd = MAPSIGNCOMMAND_NOP;
        break;
    case MAPSIGNCOMMAND_WIPE_OUT:
        if (FieldSystem_SignpostWindowCommand_WipeOut(fieldSystem) == TRUE) {
            signpostWindow->cmd = MAPSIGNCOMMAND_NOP;
        }
        break;
    case MAPSIGNCOMMAND_WIPE_IN:
        if (FieldSystem_SignpostWindowCommand_WipeIn(fieldSystem) == TRUE) {
            signpostWindow->cmd = MAPSIGNCOMMAND_NOP;
        }
        break;
    case MAPSIGNCOMMAND_HIDE:
        FieldSystem_SignpostWindowCommand_Hide(fieldSystem);
        signpostWindow->cmd = MAPSIGNCOMMAND_NOP;
        break;
    }
}

void FieldSystem_SetAndExecuteSignpostWindowCommand(FieldSystem *fieldSystem, u8 cmd) {
    FieldSignpostWindow_SetCommand(fieldSystem->signpostWindow, cmd);
    FieldSystem_ExecuteSignpostWindowCommand(fieldSystem);
}

static void FieldSystem_SignpostWindowCommand_Show(FieldSystem *fieldSystem) {
    BgSetPosTextAndCommit(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, -48);

    if (!fieldSystem->signpostWindow->active) {
        DialogBox_AddWindowToLayer3WithXOffset(fieldSystem->bgConfig, &fieldSystem->signpostWindow->window, fieldSystem->signpostWindow->type, GF_BG_LYR_MAIN_3);
        fieldSystem->signpostWindow->active = TRUE;
    }
    DialogBox_DrawFrameWithWayfindingGraphic(&fieldSystem->signpostWindow->window, fieldSystem->signpostWindow->type, fieldSystem->signpostWindow->map);
}

static void FieldSystem_SignpostWindowCommand_Hide(FieldSystem *fieldSystem) {
    if (fieldSystem->signpostWindow->active) {
        RemoveWindow(&fieldSystem->signpostWindow->window);
        FillBgTilemapRect(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, 18, 32, 6, TILEMAP_FILL_KEEP_PAL);
        BgCommitTilemapBufferToVram(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3);
        BgSetPosTextAndCommit(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, 0);
        fieldSystem->signpostWindow->active = FALSE;
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
