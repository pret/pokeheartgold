#include "global.h"

#include "gf_gfx_loader.h"
#include "oaks_speech_internal.h"
#include "text.h"
#include "unk_02005D10.h"
#include "yes_no_prompt.h"

static void ov53_021E82BC(OakSpeechData_Sub178 *a0);
static void ov53_021E8310(OakSpeechData_Sub178 *a0);
static void ov53_021E8330(OakSpeechData_Sub178 *a0, Window *window, int msgId, int msgBank);
static void ov53_021E8390(OakSpeechData_Sub178 *a0);
static BOOL ov53_021E83D4(OakSpeechData_Sub178 *a0);
static BOOL ov53_021E84D4(OakSpeechData_Sub178 *a0);

OakSpeechData_Sub178 *ov53_021E80F4(BgConfig *bgConfig, Sprite *sprite, int a2, int a3, int a4, HeapID heapId) {
    GF_ASSERT(bgConfig != NULL);
    volatile HeapID heapId_2  = heapId;
    OakSpeechData_Sub178 *ret = AllocFromHeap(heapId, sizeof(OakSpeechData_Sub178));
    MI_CpuClear8(ret, sizeof(OakSpeechData_Sub178));
    ret->heapId    = heapId;
    ret->bgConfig  = bgConfig;
    ret->sprite    = sprite;
    ret->unk_19    = a2;
    ret->unk_1A    = a3;
    ret->unk_18    = a4;
    ret->msgFormat = MessageFormat_New(heapId_2);
    Set2dSpriteAnimActiveFlag(sprite, 1);
    ov53_021E82BC(ret);
    return ret;
}

void ov53_021E814C(OakSpeechData_Sub178 *a0) {
    GF_ASSERT(a0 != NULL);
    ov53_021E8310(a0);
    MessageFormat_Delete(a0->msgFormat);
    FreeToHeap(a0);
}

void ov53_021E816C(OakSpeechData_Sub178 *a0, int a1) {
    NARC *narc;
    u8 bgId;
    HeapID heapId;

    heapId = a0->heapId;
    bgId   = a0->unk_19;
    narc   = NARC_New(NARC_a_2_3_7, heapId);
    GfGfxLoader_GXLoadPalFromOpenNarc(narc, 0, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)(32 * a1), 0x20, heapId);
    GfGfxLoader_LoadCharDataFromOpenNarc(narc, 1, a0->bgConfig, (GFBgLayer)bgId, 0, 0, FALSE, heapId);
    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, 10, a0->bgConfig, (GFBgLayer)bgId, 0, 0, FALSE, heapId);
    BgTilemapRectChangePalette(a0->bgConfig, bgId, 0, 0, 32, 24, a1);
    BgCommitTilemapBufferToVram(a0->bgConfig, bgId);
    ToggleBgLayer(bgId, GF_PLANE_TOGGLE_OFF);
    NARC_Delete(narc);
}

void ov53_021E81F4(OakSpeechData_Sub178 *a0, int msgBank, int msgId_Yes, int msgId_No) {
    ov53_021E8330(a0, &a0->unk_1C[0], msgId_Yes, msgBank);
    ov53_021E8330(a0, &a0->unk_1C[1], msgId_No, msgBank);
    a0->unk_1B_0 = 0;
    a0->unk_1B_4 = YESNORESPONSE_YES;
    ov53_021E8390(a0);
    ToggleBgLayer(a0->unk_19, GF_PLANE_TOGGLE_ON);
    ToggleBgLayer(a0->unk_1A, GF_PLANE_TOGGLE_ON);
    Set2dSpriteVisibleFlag(a0->sprite, TRUE);
}

int ov53_021E8248(OakSpeechData_Sub178 *a0) {
    switch (a0->unk_1B_0) {
    case 0:
        if (ov53_021E83D4(a0)) {
            ++a0->unk_1B_0;
        }
        break;
    case 1:
        if (ov53_021E84D4(a0)) {
            GF_ASSERT(a0->unk_1B_4 != 0);
            ToggleBgLayer(a0->unk_19, GF_PLANE_TOGGLE_OFF);
            ToggleBgLayer(a0->unk_1A, GF_PLANE_TOGGLE_OFF);
            Set2dSpriteVisibleFlag(a0->sprite, FALSE);
            return a0->unk_1B_4;
        }
        break;
    default:
        GF_ASSERT(FALSE);
        break;
    }

    return FALSE;
}

static void ov53_021E82BC(OakSpeechData_Sub178 *a0) {
    GF_ASSERT(a0 != NULL);
    AddWindowParameterized(a0->bgConfig, &a0->unk_1C[0], a0->unk_1A, 4, 8, 24, 2, a0->unk_18, 0x50);
    AddWindowParameterized(a0->bgConfig, &a0->unk_1C[1], a0->unk_1A, 4, 14, 24, 2, a0->unk_18, 0x80);
}

static void ov53_021E8310(OakSpeechData_Sub178 *a0) {
    GF_ASSERT(a0 != NULL);
    for (int i = 0; i < 2; ++i) {
        RemoveWindow(&a0->unk_1C[i]);
    }
}

static void ov53_021E8330(OakSpeechData_Sub178 *a0, Window *window, int msgId, int msgBank) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, msgBank, a0->heapId);
    String *string   = ReadMsgData_ExpandPlaceholders(a0->msgFormat, msgData, msgId, a0->heapId);
    FillWindowPixelBuffer(window, 0);
    AddTextPrinterParameterizedWithColor(window, 4, string, 0, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(15, 1, 0), NULL);
    CopyWindowToVram(window);
    DestroyMsgData(msgData);
    String_Delete(string);
}

static const s16 ov53_021E8874[2][2] = {
    {
     128,
     72,
     },
    {
     128,
     120,
     },
};

static void ov53_021E8390(OakSpeechData_Sub178 *a0) {
    GF_ASSERT(a0->sprite != NULL);
    int r4;
    switch (a0->unk_1B_4) {
    case YESNORESPONSE_YES:
        r4 = 0;
        break;
    case YESNORESPONSE_NO:
        r4 = 1;
        break;
    default:
        GF_ASSERT(FALSE);
        break;
    }
    Sprite_SetPositionXY(a0->sprite, ov53_021E8874[r4][0], ov53_021E8874[r4][1]);
}

static const TouchscreenHitbox ov53_021E887C[] = {
    {
     .rect = {
            50,
            92,
            3,
            251,
        },
     },
    {
     .rect = {
            99,
            140,
            3,
            251,
        },
     },
    {
     .rect = {
            TOUCHSCREEN_RECTLIST_END,
        },
     },
};

static BOOL ov53_021E83D4(OakSpeechData_Sub178 *a0) {
    BOOL ret   = FALSE;
    int hitbox = TouchscreenHitbox_FindRectAtTouchNew(ov53_021E887C);
    if (hitbox != -1) {
        PlaySE(SEQ_SE_DP_SELECT);
        switch (hitbox) {
        case 0:
            ret          = TRUE;
            a0->unk_1B_4 = YESNORESPONSE_YES;
            break;
        case 1:
            ret          = TRUE;
            a0->unk_1B_4 = YESNORESPONSE_NO;
            break;
        default:
            GF_ASSERT(FALSE);
            break;
        }
    } else if (gSystem.newKeys & PAD_KEY_UP) {
        if (a0->unk_1B_4 != YESNORESPONSE_YES) {
            a0->unk_1B_4 = YESNORESPONSE_YES;
            ov53_021E8390(a0);
            PlaySE(SEQ_SE_DP_SELECT);
        }
    } else if (gSystem.newKeys & PAD_KEY_DOWN) {
        if (a0->unk_1B_4 != YESNORESPONSE_NO) {
            a0->unk_1B_4 = YESNORESPONSE_NO;
            ov53_021E8390(a0);
            PlaySE(SEQ_SE_DP_SELECT);
        }
    } else if (gSystem.newKeys & PAD_BUTTON_A) {
        if (a0->unk_1B_4 == YESNORESPONSE_WAIT) {
            GF_ASSERT(FALSE);
            a0->unk_1B_4 = YESNORESPONSE_NO;
        }
        ret = TRUE;
    } else if (gSystem.newKeys & PAD_BUTTON_B) {
        ret          = TRUE;
        a0->unk_1B_4 = YESNORESPONSE_NO;
    }
    if (ret) {
        ov53_021E8390(a0);
        Set2dSpriteAnimSeqNo(a0->sprite, 3);
        PlaySE(SEQ_SE_DP_SELECT);
    }
    return ret;
}

static BOOL ov53_021E84D4(OakSpeechData_Sub178 *a0) {
    GF_ASSERT(Get2dSpriteCurrentAnimSeqNo(a0->sprite) == 3);
    return !Sprite_IsCellAnimationRunning(a0->sprite);
}
