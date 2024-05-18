#include "global.h"
#include "application/view_photo.h"
#include "font.h"
#include "gf_gfx_loader.h"
#include "msgdata/msg.naix"
#include "system.h"
#include "text.h"
#include "touchscreen.h"
#include "unk_02005D10.h"
#include "unk_020183F0.h"
#include "field_take_photo.h"
#include "message_format.h"
#include "field/ov01_021E7FDC.h"
#include "unk_02068F84.h"

typedef enum ViewPhotoInputResponse {
    INPUT_NOTHING,
    INPUT_END,
    INPUT_PREV,
    INPUT_NEXT,
} ViewPhotoInputResponse;

typedef struct ViewPhotoSysTaskData {
    HeapID unk_000;
    int unk_004;
    int unk_008;
    ViewPhotoInputResponse unk_00C;
    SaveData *unk_010;
    FieldSystem *unk_014;
    BgConfig *unk_018;
    FieldTakePhoto2 *unk_01C;
    u8 filler_020[4];
    MsgData *unk_024;
    MessageFormat *unk_028;
    String *unk_02C;
    String *unk_030;
    String *unk_034[2];
    Window unk_03C[2];
    UnkStruct_ov01_021E7FDC unk_05C;
    Sprite *unk_1C0[3];
    u8 unk_1CC;
    UnkStruct_0206A8C0 unk_1D0;
} ViewPhotoSysTaskData;

void ov19_02259950(SysTask *task, void *taskData);
void ov19_022599AC(ViewPhotoSysTaskData *viewPhoto);
void ov19_022599D4(ViewPhotoSysTaskData *viewPhoto);
ViewPhotoInputResponse ov19_022599F8(ViewPhotoSysTaskData *viewPhoto);
ViewPhotoInputResponse ov19_02259A94(ViewPhotoSysTaskData *viewPhoto);
ViewPhotoInputResponse ov19_02259ABC(ViewPhotoSysTaskData *viewPhoto);
void ov19_02259AD8(ViewPhotoSysTaskData *viewPhoto);
void ov19_02259B90(ViewPhotoSysTaskData *viewPhoto);
void ov19_02259BC0(ViewPhotoSysTaskData *viewPhoto);
void ov19_02259C64(ViewPhotoSysTaskData *viewPhoto);
void ov19_02259C68(ViewPhotoSysTaskData *viewPhoto);
void ov19_02259CBC(ViewPhotoSysTaskData *viewPhoto);
void ov19_02259CF4(ViewPhotoSysTaskData *viewPhoto);
void ov19_02259D24(ViewPhotoSysTaskData *viewPhoto);
void ov19_02259D44(ViewPhotoSysTaskData *viewPhoto);
void ov19_02259DF4(ViewPhotoSysTaskData *viewPhoto);
void ov19_02259E20(ViewPhotoSysTaskData *viewPhoto, int spriteNo);
BOOL ov19_02259E44(ViewPhotoSysTaskData *viewPhoto);
void ov19_02259E64(FieldTakePhoto2_Sub0C *a0, MessageFormat *msgFormat, String *strBuf, HeapID heapId, SaveData *saveData);
void ov19_02259F0C(ViewPhotoSysTaskData *viewPhoto);
void ov19_02259F64(ViewPhotoSysTaskData *viewPhoto);
u8 ov19_0225A008(FieldTakePhoto2_Sub0C *a0);

extern const TouchscreenHitbox ov19_0225A05E[3];
extern const WindowTemplate ov19_0225A04E[2];
extern const u16 ov19_0225A040[];
extern const SpriteTemplate_ov01_021E81F0 ov19_0225A0C4[3];
extern const u8 _0225A03C[3];

SysTask *ov19_022598C0(FieldSystem *fieldSystem) {
    ViewPhotoSysTaskData *viewPhoto = AllocFromHeap(HEAP_ID_FIELD, sizeof(ViewPhotoSysTaskData));
    MI_CpuClear8(viewPhoto, sizeof(ViewPhotoSysTaskData));
    viewPhoto->unk_000 = HEAP_ID_FIELD;
    viewPhoto->unk_014 = fieldSystem;
    viewPhoto->unk_018 = fieldSystem->bgConfig;
    viewPhoto->unk_010 = fieldSystem->saveData;
    viewPhoto->unk_01C = fieldSystem->unk_DC;
    viewPhoto->unk_008 = sub_020183F0(&fieldSystem->unk_10C);
    sub_0206A8C0(viewPhoto->unk_01C, &viewPhoto->unk_1D0);
    return SysTask_CreateOnMainQueue(ov19_02259950, viewPhoto, 1);
}

void ov19_02259918(FieldSystem *fieldSystem) {
    ViewPhotoSysTaskData *viewPhoto = (ViewPhotoSysTaskData *)SysTask_GetData(fieldSystem->unk_D8);

    sub_02018410(&fieldSystem->unk_10C, viewPhoto->unk_008);
    ov19_022599D4(viewPhoto);
    FreeToHeap(viewPhoto);
    SysTask_Destroy(fieldSystem->unk_D8);
    fieldSystem->unk_D8 = NULL;
}

void ov19_02259950(SysTask *task, void *taskData) {
    ViewPhotoSysTaskData *viewPhoto = (ViewPhotoSysTaskData *)taskData;
    switch (viewPhoto->unk_004) {
    case 0:
        ov19_022599AC(viewPhoto);
        ++viewPhoto->unk_004;
        return;
    case 1:
        if (GX_GetMasterBrightness() == 0 && ov19_022599F8(viewPhoto) != INPUT_NOTHING) {
            ++viewPhoto->unk_004;
        }
        break;
    case 2:
        if (ov19_02259E44(viewPhoto)) {
            sub_0206A8DC(viewPhoto->unk_01C, viewPhoto->unk_00C);
        }
        break;
    }
    sub_0202457C(viewPhoto->unk_05C.spriteList);
}

void ov19_022599AC(ViewPhotoSysTaskData *viewPhoto) {
    ov19_02259AD8(viewPhoto);
    ov19_02259BC0(viewPhoto);
    ov19_02259C68(viewPhoto);
    ov19_02259CF4(viewPhoto);
    ov19_02259D44(viewPhoto);
    ov19_02259F64(viewPhoto);
}

void ov19_022599D4(ViewPhotoSysTaskData *viewPhoto) {
    ov19_02259DF4(viewPhoto);
    ov19_02259D24(viewPhoto);
    ov19_02259CBC(viewPhoto);
    ov19_02259C64(viewPhoto);
    ov19_02259B90(viewPhoto);
}

ViewPhotoInputResponse ov19_022599F8(ViewPhotoSysTaskData *viewPhoto) {
    ViewPhotoInputResponse response = ov19_02259ABC(viewPhoto);
    if (response == INPUT_NOTHING) {
        response = ov19_02259A94(viewPhoto);
        if (response == INPUT_NOTHING) {
            viewPhoto->unk_008 = FALSE;
        }
    } else {
        viewPhoto->unk_008 = TRUE;
    }
    switch (response) {
    case INPUT_END:
        ov19_02259E20(viewPhoto, 0);
        PlaySE(SEQ_SE_DP_DECIDE);
        viewPhoto->unk_00C = INPUT_END;
        break;
    case INPUT_PREV:
        if (viewPhoto->unk_1D0.unk_4 == 0) {
            return INPUT_NOTHING;
        }
        ov19_02259E20(viewPhoto, 1);
        PlaySE(SEQ_SE_DP_SELECT);
        viewPhoto->unk_00C = INPUT_PREV;
        break;
    case INPUT_NEXT:
        if (viewPhoto->unk_1D0.unk_4 >= viewPhoto->unk_1D0.unk_5 - 1) {
            return INPUT_NOTHING;
        }
        ov19_02259E20(viewPhoto, 2);
        PlaySE(SEQ_SE_DP_SELECT);
        viewPhoto->unk_00C = INPUT_NEXT;
        break;
    default:
        return INPUT_NOTHING;
    }

    return response;
}

ViewPhotoInputResponse ov19_02259A94(ViewPhotoSysTaskData *viewPhoto) {
    if (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B)) {
        return INPUT_END;
    } else if (gSystem.newKeys & PAD_KEY_LEFT) {
        return INPUT_PREV;
    } else if (gSystem.newKeys & PAD_KEY_RIGHT) {
        return INPUT_NEXT;
    } else {
        return INPUT_NOTHING;
    }
}

ViewPhotoInputResponse ov19_02259ABC(ViewPhotoSysTaskData *viewPhoto) {
    int hitbox = TouchscreenHitbox_FindRectAtTouchNew(ov19_0225A05E);
    if (hitbox == -1) {
        return INPUT_NOTHING;
    }

    return (ViewPhotoInputResponse)(hitbox + 1);
}

void ov19_02259AD8(ViewPhotoSysTaskData *viewPhoto) {
    GXS_SetGraphicsMode(GX_BGMODE_3);

    {
        extern const BgTemplate ov19_0225A070;
        BgTemplate bgTemplate = ov19_0225A070;
        InitBgFromTemplate(viewPhoto->unk_018, GF_BG_LYR_SUB_1, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(viewPhoto->unk_018, GF_BG_LYR_SUB_1);
    }

    {
        extern const BgTemplate ov19_0225A08C;
        BgTemplate bgTemplate = ov19_0225A08C;
        InitBgFromTemplate(viewPhoto->unk_018, GF_BG_LYR_SUB_2, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(viewPhoto->unk_018, GF_BG_LYR_SUB_2);
    }

    {
        extern const BgTemplate ov19_0225A0A8;
        BgTemplate bgTemplate = ov19_0225A0A8;
        InitBgFromTemplate(viewPhoto->unk_018, GF_BG_LYR_SUB_3, &bgTemplate, GF_BG_TYPE_256x16PLTT);
        BgClearTilemapBufferAndCommit(viewPhoto->unk_018, GF_BG_LYR_SUB_3);
    }

    BG_ClearCharDataRange(GF_BG_LYR_SUB_1, 0x20, 0, viewPhoto->unk_000);
    BG_ClearCharDataRange(GF_BG_LYR_SUB_3, 0x40, 0, viewPhoto->unk_000);
    BgSetPosTextAndCommit(viewPhoto->unk_018, GF_BG_LYR_SUB_3, BG_POS_OP_SET_X, -4);
}

void ov19_02259B90(ViewPhotoSysTaskData *viewPhoto) {
    BgSetPosTextAndCommit(viewPhoto->unk_018, GF_BG_LYR_SUB_3, BG_POS_OP_SET_X, 0);
    FreeBgTilemapBuffer(viewPhoto->unk_018, GF_BG_LYR_SUB_3);
    FreeBgTilemapBuffer(viewPhoto->unk_018, GF_BG_LYR_SUB_2);
    FreeBgTilemapBuffer(viewPhoto->unk_018, GF_BG_LYR_SUB_1);
    GXS_SetGraphicsMode(GX_BGMODE_0);
}

void ov19_02259BC0(ViewPhotoSysTaskData *viewPhoto) {
    NARC *narc = NARC_New(NARC_a_1_7_1, viewPhoto->unk_000);
    GfGfxLoader_GXLoadPalFromOpenNarc(narc, 4, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0, 0, viewPhoto->unk_000);
    GfGfxLoader_LoadCharDataFromOpenNarc(narc, 11, viewPhoto->unk_018, GF_BG_LYR_SUB_2, 0, 0, FALSE, viewPhoto->unk_000);
    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, 12, viewPhoto->unk_018, GF_BG_LYR_SUB_2, 0, 0, FALSE, viewPhoto->unk_000);

    void *ncgrFile;
    NNSG2dCharacterData *pCharData;
    u8 r3;
    ncgrFile = GfGfxLoader_GetCharDataFromOpenNarc(narc, 5, FALSE, &pCharData, viewPhoto->unk_000);
    r3 = viewPhoto->unk_1D0.unk_0->unk_04_1 + 1;
    BG_LoadCharTilesData(viewPhoto->unk_018, GF_BG_LYR_SUB_3, pCharData->pRawData + ((25 * r3 + 64) * 64), 0x640, 1);
    FreeToHeap(ncgrFile);
    NARC_Delete(narc);
}

void ov19_02259C64(ViewPhotoSysTaskData *viewPhoto) {
}

void ov19_02259C68(ViewPhotoSysTaskData *viewPhoto) {
    FontID_Alloc(4, viewPhoto->unk_000);
    viewPhoto->unk_024 = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0000_bin, viewPhoto->unk_000);
    viewPhoto->unk_028 = MessageFormat_New_Custom(6, 22, viewPhoto->unk_000);
    viewPhoto->unk_02C = String_New(128, viewPhoto->unk_000);
    viewPhoto->unk_030 = NewString_ReadMsgData(viewPhoto->unk_024, 0);
    for (int i = 0; i < 2; ++i) {
        viewPhoto->unk_034[i] = NewString_ReadMsgData(viewPhoto->unk_024, 10 + i);
    }
}

void ov19_02259CBC(ViewPhotoSysTaskData *viewPhoto) {
    for (int i = 0; i < 2; ++i) {
        String_Delete(viewPhoto->unk_034[i]);
    }
    String_Delete(viewPhoto->unk_030);
    String_Delete(viewPhoto->unk_02C);
    MessageFormat_Delete(viewPhoto->unk_028);
    DestroyMsgData(viewPhoto->unk_024);
    FontID_Release(4);
}

void ov19_02259CF4(ViewPhotoSysTaskData *viewPhoto) {
    for (int i = 0; i < 2; ++i) {
        AddWindow(viewPhoto->unk_018, &viewPhoto->unk_03C[i], &ov19_0225A04E[i]);
        FillWindowPixelBuffer(&viewPhoto->unk_03C[i], 0);
    }
}

void ov19_02259D24(ViewPhotoSysTaskData *viewPhoto) {
    for (int i = 0; i < 2; ++i) {
        ClearWindowTilemapAndCopyToVram(&viewPhoto->unk_03C[i]);
        RemoveWindow(&viewPhoto->unk_03C[i]);
    }
}

void ov19_02259D44(ViewPhotoSysTaskData *viewPhoto) {
    ov01_021E7FDC(&viewPhoto->unk_05C, ov19_0225A040, 3, viewPhoto->unk_000);
    for (int i = 0; i < 3; ++i) {
        viewPhoto->unk_1C0[i] = ov01_021E81F0(&viewPhoto->unk_05C, &ov19_0225A0C4[i]);
        Set2dSpriteVisibleFlag(viewPhoto->unk_1C0[i], TRUE);
        Set2dSpriteAnimActiveFlag(viewPhoto->unk_1C0[i], TRUE);
    }
    if (viewPhoto->unk_1D0.unk_4 == 0) {
        Set2dSpriteAnimSeqNo(viewPhoto->unk_1C0[1], 2);
    } else {
        Set2dSpriteAnimSeqNo(viewPhoto->unk_1C0[1], 0);
    }
    if (viewPhoto->unk_1D0.unk_4 >= viewPhoto->unk_1D0.unk_5 - 1) {
        Set2dSpriteAnimSeqNo(viewPhoto->unk_1C0[2], 5);
    } else {
        Set2dSpriteAnimSeqNo(viewPhoto->unk_1C0[2], 3);
    }
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
}

void ov19_02259DF4(ViewPhotoSysTaskData *viewPhoto) {
    for (int i = 0; i < 3; ++i) {
        Sprite_Delete(viewPhoto->unk_1C0[i]);
    }
    ov01_021E8194(&viewPhoto->unk_05C);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_OFF);
}

void ov19_02259E20(ViewPhotoSysTaskData *viewPhoto, int spriteNo) {
    viewPhoto->unk_1CC = spriteNo;
    Set2dSpriteAnimSeqNo(viewPhoto->unk_1C0[spriteNo], _0225A03C[spriteNo]);
    Sprite_ResetAnimCtrlState(viewPhoto->unk_1C0[spriteNo]);
}

BOOL ov19_02259E44(ViewPhotoSysTaskData *viewPhoto) {
    return !Sprite_IsCellAnimationRunning(viewPhoto->unk_1C0[viewPhoto->unk_1CC]);
}

void ov19_02259E64(FieldTakePhoto2_Sub0C *a0, MessageFormat *msgFormat, String *strBuf, HeapID heapId, SaveData *saveData) {
    BufferPlayersName(msgFormat, 0, Save_PlayerData_GetProfileAddr(saveData));
    sub_02068F98(a0->unk_32, heapId, strBuf);
    BufferString(msgFormat, 1, strBuf, 2, 0, 2);
    CopyU16ArrayToString(strBuf, a0->unk_18);
    BufferString(msgFormat, 2, strBuf, 2, 0, 2);
    u8 year = a0->unk_38 >> 24;
    BufferIntegerAsString(msgFormat, 3, year + 2000, 4, PRINTING_MODE_LEADING_ZEROS, TRUE);
    u8 month = a0->unk_38 >> 16;
    BufferIntegerAsString(msgFormat, 4, month, 2, PRINTING_MODE_LEADING_ZEROS, TRUE);
    u8 day = a0->unk_38 >> 8;
    BufferIntegerAsString(msgFormat, 5, day, 2, PRINTING_MODE_LEADING_ZEROS, TRUE);
}

void ov19_02259F0C(ViewPhotoSysTaskData *viewPhoto) {
    for (int i = 0; i < 5; ++i) {
        for (int j = 0; j < 5; ++j) {
            FillBgTilemapRect(viewPhoto->unk_018, GF_BG_LYR_SUB_3, 5 * i + j + 1, 13 + j, 2 + i, 1, 1, TILEMAP_COPY_SRC_FLAT);
        }
    }
    ScheduleBgTilemapBufferTransfer(viewPhoto->unk_018, GF_BG_LYR_SUB_3);
}

void ov19_02259F64(ViewPhotoSysTaskData *viewPhoto) {
    AddTextPrinterParameterizedWithColor(&viewPhoto->unk_03C[0], 4, viewPhoto->unk_030, (64 - FontID_String_GetWidth(4, viewPhoto->unk_030, 0)) / 2u, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 5, 0), NULL);
    ScheduleWindowCopyToVram(&viewPhoto->unk_03C[0]);
    ov19_02259E64(viewPhoto->unk_1D0.unk_0, viewPhoto->unk_028, viewPhoto->unk_02C, viewPhoto->unk_000, viewPhoto->unk_010);
    u8 x = ov19_0225A008(viewPhoto->unk_1D0.unk_0);
    if (x > 1) {
        StringExpandPlaceholders(viewPhoto->unk_028, viewPhoto->unk_02C, viewPhoto->unk_034[1]);
    } else {
        StringExpandPlaceholders(viewPhoto->unk_028, viewPhoto->unk_02C, viewPhoto->unk_034[0]);
    }
    AddTextPrinterParameterizedWithColor(&viewPhoto->unk_03C[1], 0, viewPhoto->unk_02C, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(3, 2, 0), NULL);
    ScheduleWindowCopyToVram(&viewPhoto->unk_03C[1]);
    ov19_02259F0C(viewPhoto);
}

u8 ov19_0225A008(FieldTakePhoto2_Sub0C *a0) {
    u8 answer = 0;
    for (u8 i = 0; i < PARTY_SIZE; ++i) {
        int species = a0->unk_6C[i].species;
        if (species > SPECIES_NONE && species <= SPECIES_ARCEUS) {
            ++answer;
        }
    }
    return answer;
}
