#include "overlay_01_021F3D38.h"

#include "global.h"

#include "text_0205B4EC.h"

struct FieldSystemUnkSub68 *ov01_021F3D38(enum HeapID heapId) {
    struct FieldSystemUnkSub68 *ret = Heap_Alloc(heapId, sizeof(struct FieldSystemUnkSub68));
    memset(ret, 0, sizeof(struct FieldSystemUnkSub68));
    return ret;
}

void ov01_021F3D50(struct FieldSystemUnkSub68 *a0) {
    if (a0->unk13_7) {
        RemoveWindow(&a0->unk0);
    }
    Heap_Free(a0);
}

void ov01_021F3D68(struct FieldSystemUnkSub68 *a0, u8 a1, u16 a2) {
    a0->unk12 = a1;
    a0->unk10 = a2;
}

void ov01_021F3D70(struct FieldSystemUnkSub68 *a0, u8 a1) {
    a0->unk13_0 = a1;
}

Window *ov01_021F3D80(struct FieldSystemUnkSub68 *a0) {
    return &a0->unk0;
}

u8 ov01_021F3D84(struct FieldSystemUnkSub68 *a0) {
    return a0->unk12;
}

BOOL ov01_021F3D88(struct FieldSystemUnkSub68 *a0) {
    return a0->unk13_0 == 0;
}

void ov01_021F3D98(FieldSystem *fieldSystem) {
    struct FieldSystemUnkSub68 *sub68 = fieldSystem->unk68;

    switch (sub68->unk13_0) {
    case 0:
        break;
    case 1:
        ov01_021F3E10(fieldSystem);
        sub68->unk13_0 = 0;
        break;
    case 2:
        if (ov01_021F3EE0(fieldSystem) == TRUE) {
            sub68->unk13_0 = 0;
        }
        break;
    case 3:
        if (ov01_021F3EA0(fieldSystem) == TRUE) {
            sub68->unk13_0 = 0;
        }
        break;
    case 4:
        ov01_021F3E4C(fieldSystem);
        sub68->unk13_0 = 0;
        break;
    }
}

void ov01_021F3DFC(FieldSystem *fieldSystem, u8 a1) {
    ov01_021F3D70(fieldSystem->unk68, a1);
    ov01_021F3D98(fieldSystem);
}

void ov01_021F3E10(FieldSystem *fieldSystem) {
    BgSetPosTextAndCommit(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, -48);

    if (!fieldSystem->unk68->unk13_7) {
        sub_0205B63C(fieldSystem->bgConfig, &fieldSystem->unk68->unk0, fieldSystem->unk68->unk12, 3);
        fieldSystem->unk68->unk13_7 = TRUE;
    }
    sub_0205B6A0(&fieldSystem->unk68->unk0, fieldSystem->unk68->unk12, fieldSystem->unk68->unk10);
}

void ov01_021F3E4C(FieldSystem *fieldSystem) {
    if (fieldSystem->unk68->unk13_7) {
        RemoveWindow(&fieldSystem->unk68->unk0);
        FillBgTilemapRect(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, 18, 32, 6, TILEMAP_FILL_KEEP_PAL);
        BgCommitTilemapBufferToVram(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3);
        BgSetPosTextAndCommit(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, 0);
        fieldSystem->unk68->unk13_7 = FALSE;
    }
}

BOOL ov01_021F3EA0(FieldSystem *fieldSystem) {
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

BOOL ov01_021F3EE0(FieldSystem *fieldSystem) {
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
