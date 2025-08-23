#include "global.h"

#include "constants/sndseq.h"

#include "berry_pots_app.h"
#include "berry_pots_app_internal.h"
#include "system.h"
#include "touchscreen.h"
#include "unk_02005D10.h"

typedef struct SysTaskArgs_ov17_0220351C {
    BerryPotsAppData *data;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    u8 unk8;
    s8 sign;
    u8 unkA;
} SysTaskArgs_ov17_0220351C;

static const TouchscreenHitbox ov17_02203FC0 = {
    .rect = { 160, 192, 192, 0 }
};

static void ov17_022035A4(SysTask *task, SysTaskArgs_ov17_0220351C *args);

void ov17_0220351C(BerryPotsAppData *data) {
    SysTaskArgs_ov17_0220351C *args = Heap_Alloc(data->heapID, sizeof(SysTaskArgs_ov17_0220351C));
    MI_CpuFill8(args, 0, sizeof(SysTaskArgs_ov17_0220351C));
    args->data = data;
    args->unk6 = data->unk80;
    args->unk7 = data->unk81;
    s8 diff = data->unk81 - data->unk80;
    if (diff > 0) {
        args->sign = 1;
    } else {
        args->sign = -1;
        diff = -diff;
    }

    args->unk8 = (diff *= 27) / 4;
    args->unkA = data->unk80;
    SysTask_CreateOnMainQueue((SysTaskFunc)ov17_022035A4, args, 0);
    data->runningTasks++;
}

static void ov17_022035A4(SysTask *task, SysTaskArgs_ov17_0220351C *args) {
    BerryPotsAppData *data = args->data;

    Sprite_OffsetPositionXY(data->sprites[2], args->sign * 4, 0);
    s16 x, y;
    Sprite_GetPositionXY(data->sprites[2], &x, &y);

    u8 potIndex = (x - 31) / 27;
    if (potIndex != args->unkA && potIndex != args->unk7) {
        ov17_02202B58(data, potIndex);
        args->unkA = potIndex;
    }

    if (--args->unk8 != 0) {
        return;
    }

    Sprite_SetPositionXY(data->sprites[2], args->unk7 * 27 + 31, 56);

    data->runningTasks--;
    Heap_Free(args);
    SysTask_Destroy(task);
}

typedef struct SysTaskArgs_ov17_02203674 {
    BerryPotsAppData *data;
    u8 state;
    u8 framesOnScreen;
    u8 potIndex;
    ManagedSprite *berrySprite;
} SysTaskArgs_ov17_02203674;

static void ov17_02203674(SysTask *, SysTaskArgs_ov17_02203674 *);

void ov17_02203638(BerryPotsAppData *data) {
    SysTaskArgs_ov17_02203674 *args = Heap_Alloc(data->heapID, sizeof(SysTaskArgs_ov17_02203674));
    MI_CpuFill8(args, 0, sizeof(SysTaskArgs_ov17_02203674));

    args->data = data;
    args->potIndex = data->unk7C;

    SysTask_CreateOnMainQueue((SysTaskFunc)ov17_02203674, args, 0);
    data->runningTasks++;
}

static void ov17_02203674(SysTask *task, SysTaskArgs_ov17_02203674 *args) {
    BerryPotsAppData *data = args->data;
    switch (args->state) {
    case 0:
        args->berrySprite = ov17_022034C8(data, args->potIndex * 27 + 35, 80, data->unk7E + 2);
        PlaySE(SEQ_SE_DP_DECIDE);
        args->state++;
        break;
    case 1:
        ManagedSprite_OffsetPositionXY(args->berrySprite, 2, -2);
        if (args->framesOnScreen++ >= 8) {
            args->state++;
        }
        break;
    case 2:
        Sprite_DeleteAndFreeResources(args->berrySprite);

        data->runningTasks--;
        Heap_Free(args);
        SysTask_Destroy(task);
        break;
    }
}

void ov17_022036FC(BerryPotsAppData *data, enum BerryPotsApp_022036FC_Action action, u8 potIndex) {
    BerryPotsAppData_UnkSub20 *unk = &data->unk20[potIndex];

    switch (action) {
    case BERRY_POTS_APP_022036FC_ACTION_5:
    case BERRY_POTS_APP_022036FC_ACTION_11:
        BufferItemName(data->msgFmt, 2, MulchIdToItemId(unk->mulch));
        break;
    case BERRY_POTS_APP_022036FC_ACTION_10:
    case BERRY_POTS_APP_022036FC_ACTION_14:
        BufferIntegerAsString(data->msgFmt, 1, unk->quantityOrYieldMaybe, 2, PRINTING_MODE_LEFT_ALIGN, 0);
        // fallthrough
    case BERRY_POTS_APP_022036FC_ACTION_6:
    case BERRY_POTS_APP_022036FC_ACTION_7:
    case BERRY_POTS_APP_022036FC_ACTION_8:
    case BERRY_POTS_APP_022036FC_ACTION_9:
    case BERRY_POTS_APP_022036FC_ACTION_12:
    case BERRY_POTS_APP_022036FC_ACTION_15:
    case BERRY_POTS_APP_022036FC_ACTION_16: {
        String *berryName = GetNutName(unk->berryId, data->heapID);
        BufferString(data->msgFmt, 0, berryName, 0, 0, 2);
        String_Delete(berryName);
        break;
    }
    default:
        String_Copy(data->currentStatusString, data->statusStrings[action]);
        return;
    }

    StringExpandPlaceholders(data->msgFmt, data->currentStatusString, data->statusStrings[action]);
}

void ov17_022037C8(BerryPotsAppData *data, BOOL a1) {
    RTCDate date1;
    RTCDate date2;
    RTCTime time1;
    RTCTime time2;

    GF_RTC_CopyDateTime(&date1, &time1);
    s64 timestamp1 = RTC_ConvertDateTimeToSecond(&date1, &time1);
    BerryPots_CopyBerryDatetime(data->berryDatetime, &date2, &time2);
    s64 timestamp2 = RTC_ConvertDateTimeToSecond(&date2, &time2);
    if (timestamp1 < timestamp2) {
        BerryPots_SetBerryDatetime(data->berryDatetime, date1, time1);
        return;
    }

    u32 minutesDelta = (timestamp1 - timestamp2) / 60;
    if (minutesDelta > 0) {
        ov16_02201760(data->berryPots, data->berryGrowthProperties, minutesDelta);
        ov17_0220387C(data);
        BerryPots_SetBerryDatetime(data->berryDatetime, date1, time1);
        if (a1) {
            ov17_02203928(data);
        }
    }
}

void ov17_0220387C(BerryPotsAppData *data) {
    for (int i = 0; i < MAX_BERRY_POT; i++) {
        data->unk20[i].unkB = data->unk20[i].berryId;
        data->unk20[i].unkC = data->unk20[i].growthStage;
        data->unk20[i].unkD = data->unk20[i].soilState;

        data->unk20[i].berryId = BerryPots_GetPotBerryId(data->berryPots, i);
        data->unk20[i].growthStage = BerryPots_GetPotGrowthStage(data->berryPots, i);
        data->unk20[i].unk2 = ov16_022015EC(data->berryPots, i);
        data->unk20[i].moisture = BerryPots_GetPotMoisture(data->berryPots, i);
        data->unk20[i].mulch = BerryPots_GetPotMulch(data->berryPots, i);
        data->unk20[i].quantityOrYieldMaybe = ov16_02201668(data->berryPots, i);
        data->unk20[i].unk6 = ov16_022015F8(data->berryPots, i);
        data->unk20[i].unk8 = ov16_02201604(data->berryPots, i);
        data->unk20[i].soilState = BerryPots_GetSoilState(data->berryPots, i);
    }
}

typedef struct SysTaskArgs_ov17_022039A0 {
    BerryPotsAppData *data;
    u8 potIndex;
    u8 unk5;
    u8 state;
} SysTaskArgs_ov17_022039A0;

static void ov17_022039A0(SysTask *task, SysTaskArgs_ov17_022039A0 *args);

static void ov17_02203928(BerryPotsAppData *data) {
    for (int i = 0; i < MAX_BERRY_POT; i++) {
        BerryPotsAppData_UnkSub20 *sub = &data->unk20[i];

        if (sub->soilState != sub->unkD) {
            Sprite_SetAnimationFrame(data->sprites[3 + i], sub->soilState);
            if (sub->growthStage == BERRY_POT_GROWTH_STAGE_PLANTED) {
                Sprite_SetAnimationFrame(sub->soilSpriteMaybe, sub->soilState);
            }
        }

        if (sub->growthStage == sub->unkC) {
            continue;
        }

        SysTaskArgs_ov17_022039A0 *args = Heap_Alloc(data->heapID, sizeof(SysTaskArgs_ov17_022039A0));
        MI_CpuFill8(args, 0, sizeof(SysTaskArgs_ov17_022039A0));
        args->data = data;
        args->potIndex = i;
        SysTask_CreateOnMainQueue((SysTaskFunc)ov17_022039A0, args, 0);
        data->runningTasks++;
    }
}

static void ov17_022039A0(SysTask *task, SysTaskArgs_ov17_022039A0 *args) {
    BerryPotsAppData *data = args->data;

    switch (args->state) {
    case 0:
        Sprite_SetDrawFlag(data->sprites[7 + args->potIndex], TRUE);
        PlaySE(SEQ_SE_PL_EFF05);
        args->state++;
        break;
    case 1:
        if (args->unk5++ == 15) {
            ov17_02202A84(data, args->potIndex);
            if (data->unk7C == args->potIndex) {
                ov17_022028B8(data);
            }
        }

        if (args->unk5 >= 30) {
            Sprite_SetDrawFlag(data->sprites[7 + args->potIndex], FALSE);

            data->runningTasks--;
            Heap_Free(args);
            SysTask_Destroy(task);
        }

        break;
    }
}

u32 ov17_02203A34(BerryPotsAppData *data) {
    BOOL flag = FALSE;
    u32 r0 = ov17_02203B68(data, &flag);
    if (!flag) {
        r0 = ov17_02203AD4(data);
    }
    return r0;
}

BOOL ov17_02203A54(BerryPotsAppData *data) {
    BOOL flag = FALSE;
    BOOL ret = ov17_02203C20(data, &flag);
    if (!flag) {
        ret = ov17_02203B88(data);
    }
    return ret;
}

static u32 ov17_02203A74(BerryPotsAppData *data, u32 a1) {
    switch (a1) {
    case 0:
    case 1:
    case 2:
    case 3:
        PlaySE(SEQ_SE_DP_SELECT);
        ov17_022028B8(data);
        break;
    case 4:
        if (data->runningTasks == 0) {
            return ov17_02203D00(data);
        }
        break;
    case 5:
    default:
        if (data->runningTasks == 0) {
            PlaySE(SEQ_SE_DP_SELECT);
            ov17_02202850(data, 1);
            return 1;
        }
        break;
    }

    return 2;
}

static u32 ov17_02203AD4(BerryPotsAppData *data) {
    BOOL flag = FALSE;

    if (gSystem.newKeys & (PAD_BUTTON_Y | PAD_BUTTON_X | PAD_KEY_DOWN | PAD_KEY_UP | PAD_KEY_LEFT | PAD_KEY_RIGHT | PAD_BUTTON_B | PAD_BUTTON_A)) {
        data->fieldMenuState = MENU_INPUT_STATE_BUTTONS;
    }

    u32 newKeys = gSystem.newKeys;

    if (newKeys & PAD_BUTTON_B) {
        return ov17_02203A74(data, 5);
    }

    if (newKeys & PAD_BUTTON_A) {
        return ov17_02203A74(data, 4);
    }

    if (newKeys & PAD_KEY_LEFT) {
        data->unk7C = (data->unk7C + (MAX_BERRY_POT - 1)) % MAX_BERRY_POT;
        flag = TRUE;
    } else if (newKeys & PAD_KEY_RIGHT) {
        data->unk7C = (data->unk7C + 1) % MAX_BERRY_POT;
        flag = TRUE;
    }

    if (flag) {
        return ov17_02203A74(data, data->unk7C);
    } else {
        return 2;
    }
}

static u32 ov17_02203B68(BerryPotsAppData *data, BOOL *a1) {
    int unk = ov17_02203CC8(data);
    if (unk < 0) {
        return 2;
    }

    *a1 = TRUE;
    data->fieldMenuState = MENU_INPUT_STATE_TOUCH;
    return ov17_02203A74(data, unk);
}

static BOOL ov17_02203B88(BerryPotsAppData *data) {
    BOOL unk = FALSE;

    if (data->unk81 != 0xFF) {
        return FALSE;
    }

    if (gSystem.newKeys & (PAD_BUTTON_Y | PAD_BUTTON_X | PAD_KEY_DOWN | PAD_KEY_UP | PAD_KEY_LEFT | PAD_KEY_RIGHT | PAD_BUTTON_B | PAD_BUTTON_A)) {
        data->fieldMenuState = MENU_INPUT_STATE_BUTTONS;
    }

    if (gSystem.newKeys & PAD_KEY_LEFT) {
        data->unk7C = (data->unk7C + (MAX_BERRY_POT - 1)) % MAX_BERRY_POT;
        unk = TRUE;
    } else if (gSystem.newKeys & PAD_KEY_RIGHT) {
        data->unk7C = (data->unk7C + 1) % MAX_BERRY_POT;
        unk = TRUE;
    }

    if (unk) {
        data->unk81 = data->unk7C;
        Sprite_SetAnimActiveFlag(data->sprites[1], FALSE);
        ov17_022028B8(data);
        return TRUE;
    }

    return FALSE;
}

static BOOL ov17_02203C20(BerryPotsAppData *data, BOOL *a1) {
    if (data->unk81 != 0xFF) {
        return FALSE;
    }

    int unk = ov17_02203C78(data);
    if (unk < 0 || data->unk7C == unk) {
        return FALSE;
    }

    *a1 = TRUE;
    data->fieldMenuState = MENU_INPUT_STATE_TOUCH;
    data->unk7C = unk;
    data->unk81 = data->unk7C;
    Sprite_SetAnimActiveFlag(data->sprites[1], FALSE);
    ov17_022028B8(data);

    return TRUE;
}

static int ov17_02203C78(BerryPotsAppData *data) {
    TouchscreenHitbox touchHitbox;

    for (int i = 0, xOffsetMaybe = 16; i < MAX_BERRY_POT; xOffsetMaybe += 28, i++) {
        touchHitbox.rect.left = xOffsetMaybe;
        touchHitbox.rect.right = touchHitbox.rect.left + 22;
        if (data->unk20[i].growthStage < BERRY_POT_GROWTH_STAGE_GROWING) {
            touchHitbox.rect.top = 88;
            touchHitbox.rect.bottom = touchHitbox.rect.top + 24;
        } else {
            touchHitbox.rect.top = 72;
            touchHitbox.rect.bottom = touchHitbox.rect.top + 32;
        }

        if (TouchscreenHitbox_TouchNewIsIn(&touchHitbox)) {
            return i;
        }
    }
    return -1;
}

static int ov17_02203CC8(BerryPotsAppData *data) {
    if (TouchscreenHitbox_TouchNewIsIn(&ov17_02203FC0)) {
        return 5;
    }

    int unk = ov17_02203C78(data);
    if (unk >= 0) {
        data->unk7C = unk;
        ov17_022028B8(data);
        return 4;
    }

    return -1;
}

static u32 ov17_02203D00(BerryPotsAppData *data) {
    BerryPotsAppData_UnkSub20 *unk = &data->unk20[data->unk7C];
    switch (unk->growthStage) {
    case BERRY_POT_GROWTH_STAGE_NONE:
        return (unk->mulch != MULCH_NONE) ? 4 : 3;
    case BERRY_POT_GROWTH_STAGE_PLANTED:
    case BERRY_POT_GROWTH_STAGE_SPROUTED:
    case BERRY_POT_GROWTH_STAGE_GROWING:
    case BERRY_POT_GROWTH_STAGE_BLOOM:
        return 5;
    case BERRY_POT_GROWTH_STAGE_BERRIES:
        return 6;
    case 0xFF:
    default:
        return 2;
    }
}
