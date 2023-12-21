#include <nitro/rtc/ARM9/convert.h>
#include "global.h"
#include "berry_pots_app.h"
#include "bag.h"
#include "font.h"
#include "game_stats.h"
#include "gf_gfx_loader.h"
#include "gf_gfx_planes.h"
#include "gf_rtc.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0248.h"
#include "overlay_16.h"
#include "render_window.h"
#include "save_misc_data.h"
#include "sound_02004A44.h"
#include "system.h"
#include "text.h"
#include "unk_02005D10.h"
#include "unk_0200CF18.h"
#include "unk_0200FA24.h"
#include "unk_020183F0.h"
#include "unk_02025154.h"
#include "unk_02023694.h"
#include "unk_0203E348.h"
#include "vram_transfer_manager.h"

enum BerryPotsApp_022036FC_Action {
    BERRY_POTS_APP_022036FC_ACTION_0,
    BERRY_POTS_APP_022036FC_ACTION_1,
    BERRY_POTS_APP_022036FC_ACTION_2,
    BERRY_POTS_APP_022036FC_ACTION_3,
    BERRY_POTS_APP_022036FC_ACTION_4,
    BERRY_POTS_APP_022036FC_ACTION_5,
    BERRY_POTS_APP_022036FC_ACTION_6,
    BERRY_POTS_APP_022036FC_ACTION_7,
    BERRY_POTS_APP_022036FC_ACTION_8,
    BERRY_POTS_APP_022036FC_ACTION_9,
    BERRY_POTS_APP_022036FC_ACTION_10,
    BERRY_POTS_APP_022036FC_ACTION_11,
    BERRY_POTS_APP_022036FC_ACTION_12,
    BERRY_POTS_APP_022036FC_ACTION_13,
    BERRY_POTS_APP_022036FC_ACTION_14,
    BERRY_POTS_APP_022036FC_ACTION_15,
    BERRY_POTS_APP_022036FC_ACTION_16,
};

typedef struct BerryPotsAppData_UnkSub20 {
    u8 berryId;
    u8 growthStage;
    u8 unk2;
    u8 moisture;
    u8 mulch;
    u8 quantityOrYieldMaybe;
    u16 unk6;
    u16 unk8;
    u8 soilState;
    u8 unkB;
    u8 unkC;
    u8 unkD;
    Sprite *soilSpriteMaybe;
} BerryPotsAppData_UnkSub20;

typedef struct BerryPotsAppData {
    HeapID heapId;
    BerryPotsAppArgs *args;
    void *unk8;
    Bag *bag;
    GAME_STATS *stats;
    BerryPot *berryPots;
    struct GF_RTC_DateTime *berryDatetime;
    UnkStruct_ov16_022014A0 *berryGrowthProperties;
    BerryPotsAppData_UnkSub20 unk20[MAX_BERRY_POT];
    u16 state70;
    u16 state72;
    u32 unk74;
    u8 textFrameDelay;
    u8 frame;
    u8 unk7A;
    u8 unk7B;
    u8 unk7C;
    u8 runningTasks;
    u8 unk7E;
    u8 waitFrames;
    u8 unk80;
    u8 unk81;
    u16 totalBerryQuantity;
    u16 totalMulchQuantity;
    BgConfig *bgConfig;
    void *unk8C;
    u8 unk90[0x9C - 0x90];
    MsgData *msgData;
    MessageFormat *msgFmt;
    String *currentStatusString;
    String *cancelString;
    u8 unkAC[4];
    String *statusStrings[17];
    u8 unkF4[0xFC - 0xF4];
    Window windows[3];
    void *unk12C;
    SpriteRenderer *spriteRenderer;
    SpriteGfxHandler *spriteGfxHandler1;
    SpriteGfxHandler *spriteGfxHandler2;
    u8 unk13C[0x164 - 0x13C];
    Sprite *sprites[11];
    NARC *itemIconNarc;
    NARC *berryPotsAppNarc;
    LISTMENUITEM *listMenuItems[4];
    void *unk1A8;
} BerryPotsAppData;

struct UnkStruct_ov17_02203D60 {
    u8 unk0[12];
    Ov122_021E9282 unkC;
};

struct UnkStruct_ov17_02203E88 {
    u32 unk0;
    u8 *unk4;
};

extern const u8 ov17_02203D50[4];
extern const u8 ov17_02203D54[4];
extern const u8 ov17_02203D58[4];
extern const u8 ov17_02203D5C[4];
extern const struct UnkStruct_ov17_02203D60 ov17_02203D60;
extern const u16 ov17_02203D78[8];
extern const GraphicsModes ov17_02203D88;
extern const Unk122_021E92D0 ov17_02203D98;
extern const SpriteResourceCountsListUnion ov17_02203DAC;
extern WindowTemplate ov17_02203DC4[3];
extern BgTemplate ov17_02203DDC;
extern BgTemplate ov17_02203DF8;
extern BgTemplate ov17_02203E14;
extern BgTemplate ov17_02203E30;
extern BgTemplate ov17_02203E4C;
extern const Unk122_021E92FC ov17_02203E68;
extern struct UnkStruct_ov17_02203E88 ov17_02203E88[4];
extern const UnkStruct_0200D2B4 ov17_02203EA8;
extern GraphicsBanks ov17_02203ED0;
extern const UnkStruct_0200D2B4 ov17_02203EF8[2];
extern const UnkStruct_0200D2B4 ov17_02203F48;
extern const UnkStruct_0200D2B4 ov17_02203F70;
extern const UnkStruct_0200D2B4 ov17_02203F98;
extern const u8 ov17_02203FC0[4];

extern void sub_0200B2E0(HeapID);
extern void sub_0200B2E8(HeapID);
extern void *sub_0201660C(HeapID);
extern void sub_02016624(void*);
extern void sub_020210BC(void);
extern u32 sub_02021148(u32);
extern void sub_02021238(void);
extern int sub_02025320(void*);

static void BerryPotsApp_InitData(BerryPotsAppData *data);
static void ov17_02201DD8(BerryPotsAppData *data);
static BOOL ov17_02201DF0(BerryPotsAppData *data);
static u32 ov17_02201E50(BerryPotsAppData *data);
static BOOL ov17_02201E3C(BerryPotsAppData *data);
static u32 ov17_02201EA8(BerryPotsAppData *data);
static u32 ov17_02201EFC(BerryPotsAppData *data);
static u32 ov17_02201F18(BerryPotsAppData *data);
static u32 ov17_02201FE8(BerryPotsAppData *data);
static u32 ov17_02202094(BerryPotsAppData *data);
static u32 ov17_02202184(BerryPotsAppData *data);
static u32 ov17_02202320(BerryPotsAppData *data);
static u32 ov17_02202378(BerryPotsAppData *data);
static u32 ov17_02202440(BerryPotsAppData *data);
static void ov17_022023B0(BerryPotsAppData *data);
static BOOL ov17_02202460(BerryPotsAppData *data);
static void BerryPotsApp_SetupResources(BerryPotsAppData *data);
static void BerryPotsApp_FreeResources(BerryPotsAppData *data);
static void ov17_02202528(BerryPotsAppData *data);
static BOOL ov17_022025B8(BerryPotsAppData *data);
static BOOL ov17_0220279C(BerryPotsAppData *data);
static void ov17_02202850(BerryPotsAppData *data, u32 seqNo);
static void ov17_022028B8(BerryPotsAppData *data);
static void ov17_02202900(BerryPotsAppData *data, BOOL visible);
static void ov17_02202910(BerryPotsAppData *data, BOOL active);
static void ov17_02202944(BerryPotsAppData *data, enum BerryPotsApp_022036FC_Action action, u8 a2, BOOL a3);
static void ov17_022029C8(BerryPotsAppData *data, u32 a1);
static int ov17_02202A50(BerryPotsAppData *data);
static void ov17_02202A84(BerryPotsAppData *data, int index);
static void ov17_02202B58(BerryPotsAppData *data, u8 index);
static void ov17_02202B98(BerryPotsAppData *data);
static void ov17_02202BF8(BerryPotsAppData *data);
static void ov17_02202C2C(void);
static void BerryPotsApp_SetupBgConfig(BerryPotsAppData *data);
static void BerryPotsApp_FreeBgConfig(BerryPotsAppData *data);
static void BerryPotsApp_SetupNarc(BerryPotsAppData *data);
static void BerryPotsApp_FreeNarc(BerryPotsAppData *data);
static void BerryPotsApp_SetupText(BerryPotsAppData *data);
static void BerryPotsApp_FreeText(BerryPotsAppData *data);
static void BerryPotsApp_SetupWindows(BerryPotsAppData *data);
static void BerryPotsApp_FreeWindows(BerryPotsAppData *data);
static void BerryPotsApp_SetupListMenuItems(BerryPotsAppData *data);
static void BerryPotsApp_FreeListMenuItems(BerryPotsAppData *data);
static void BerryPotsApp_SetupSpriteRendererAndGfxHandler(BerryPotsAppData *data);
static void BerryPotsApp_FreeSpriteRendererAndGfxHandler(BerryPotsAppData *data);
static void BerryPotsApp_SetupSpriteSystem(BerryPotsAppData *data);
static void BerryPotsApp_FreeSpriteSystem(BerryPotsAppData *data);
static void BerryPotsApp_SetupSprites(BerryPotsAppData *data);
static void BerryPotsApp_FreeSprites(BerryPotsAppData *data);
static void ov17_02203404(BerryPotsAppData *data, int index);
static void ov17_02203460(BerryPotsAppData *data, u8 index);
static UnkImageStruct *ov17_022034C8(BerryPotsAppData *data, s16 x, s16 y, u8);
static void ov17_0220351C(BerryPotsAppData *data);
static void ov17_02203638(BerryPotsAppData *data);
static void ov17_022036FC(BerryPotsAppData *data, enum BerryPotsApp_022036FC_Action action, u8 potIndex);
static void ov17_022037C8(BerryPotsAppData *data, BOOL a1);
static void ov17_0220387C(BerryPotsAppData *data);
static void ov17_02203928(BerryPotsAppData *data);
static u32 ov17_02203A34(BerryPotsAppData *data);
static BOOL ov17_02203A54(BerryPotsAppData *data);
static u32 ov17_02203A74(BerryPotsAppData *data, u32 a1);
static u32 ov17_02203AD4(BerryPotsAppData *data);
static u32 ov17_02203B68(BerryPotsAppData *data, BOOL *a1);
static BOOL ov17_02203B88(BerryPotsAppData *data);
static BOOL ov17_02203C20(BerryPotsAppData *data, BOOL *a1);
static int ov17_02203C78(BerryPotsAppData *data);
static int ov17_02203CC8(BerryPotsAppData *data);
static u32 ov17_02203D00(BerryPotsAppData *data);

void ov17_02201BC0(void) {
    Main_SetVBlankIntrCB(NULL, NULL);
    HBlankInterruptDisable();

    GfGfx_DisableEngineAPlanes();
    GfGfx_DisableEngineBPlanes();

    GX_SetVisiblePlane(0);
    GXS_SetVisiblePlane(0);

    sub_0200FBF4(0, 0);
    sub_0200FBF4(1, 0);
    sub_0200FBDC(0);
    sub_0200FBDC(1);
}

BOOL BerryPotsApp_Initialize(OVY_MANAGER *manager, int *state) {
    BerryPotsAppData *data;

    switch (*state) {
        case 0:
            ov17_02201BC0();
            CreateHeap(HEAP_ID_3, HEAP_ID_BERRY_POTS_APP, 0x20000);

            data = OverlayManager_CreateAndGetData(manager, sizeof(BerryPotsAppData), HEAP_ID_BERRY_POTS_APP);
            MI_CpuFill8(data, 0, sizeof(BerryPotsAppData));
            data->heapId = HEAP_ID_BERRY_POTS_APP;
            data->args = OverlayManager_GetArgs(manager);
            BerryPotsApp_InitData(data);

            (*state)++;
            break;

        case 1:
            data = OverlayManager_GetData(manager);
            if (ov17_02201DF0(data)) {
                return TRUE;
            }

            break;
    }

    return FALSE;
}

BOOL BerryPotsApp_Run(OVY_MANAGER *manager, int *state) {
    BerryPotsAppData *data = OverlayManager_GetData(manager);

    switch (*state) {
        case 0:
            *state = ov17_02201E50(data);
            break;
        case 1:
            *state = ov17_02201EA8(data);
            break;
        case 2:
            *state = ov17_02201EFC(data);
            break;
        case 3:
            *state = ov17_02201F18(data);
            break;
        case 4:
            *state = ov17_02201FE8(data);
            break;
        case 5:
            *state = ov17_02202094(data);
            break;
        case 6:
            *state = ov17_02202184(data);
            break;
        case 7:
            *state = ov17_02202320(data);
            break;
        case 8:
            *state = ov17_02202378(data);
            break;
        case 9:
            return TRUE;
    }

    sub_0200D020(data->spriteGfxHandler1);
    return FALSE;
}

BOOL BerryPotsApp_Exit(OVY_MANAGER *manager, int *state) {
    BerryPotsAppData *data = OverlayManager_GetData(manager);
    if (!ov17_02201E3C(data)) {
        return FALSE;
    }

    ov17_02201DD8(data);

    OverlayManager_FreeData(manager);
    DestroyHeap(HEAP_ID_BERRY_POTS_APP);

    return TRUE;
}

static void BerryPotsApp_InitData(BerryPotsAppData *data) {
    data->unk74 = sub_020183F0(data->args->unk4->unk4);
    Options *options = Save_PlayerData_GetOptionsAddr(data->args->unk4->savedata);
    data->textFrameDelay = Options_GetTextFrameDelay(options);
    data->frame = Options_GetFrame(options);
    data->bag = Save_Bag_Get(data->args->unk4->savedata);
    data->stats = Save_GameStats_Get(data->args->unk4->savedata);
    data->berryGrowthProperties = ov16_022014A0(data->heapId);
    data->berryPots = Save_BerryPots_Get(data->args->unk4->savedata);
    data->berryDatetime = Save_BerryPotRTC_Get(data->args->unk4->savedata);
    data->unk7C = (data->args->unk14 != 0) ? data->args->unk15 : 0;
    ov17_022023B0(data);
    data->totalBerryQuantity = GetTotalBerryQuantity(data->bag, data->heapId);
    data->totalMulchQuantity = GetTotalMulchQuantity(data->bag, data->heapId);
    ov17_0220387C(data);
}

static void ov17_02201DD8(BerryPotsAppData *data) {
    FreeToHeap(data->berryGrowthProperties);
    sub_02018410(data->args->unk4->unk4, data->unk74);
}

static BOOL ov17_02201DF0(BerryPotsAppData *data) {
    switch (data->state70) {
        case 0:
            BerryPotsApp_SetupResources(data);
            data->state70++;
            break;
        case 1:
            ov17_02202528(data);
            sub_020210BC();
            sub_02021148(1);
            sub_02004EC4(0x45, 0, 0);

            data->state70 = 0;
            return TRUE;
    }

    return FALSE;
}


static BOOL ov17_02201E3C(BerryPotsAppData *data) {
    sub_02021238();
    BerryPotsApp_FreeResources(data);
    return TRUE;
}

static u32 ov17_02201E50(BerryPotsAppData *data) {
    switch (data->state70) {
        case 0:
            BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, data->heapId);
            data->state70++;
            break;
        case 1:
            if (!IsPaletteFadeFinished()) {
                break;
            }

            data->state70 = 0;
            return ov17_02202440(data);
    }

    return 0;
}

static u32 ov17_02201EA8(BerryPotsAppData *data) {
    switch (data->state70) {
        case 0:
            BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, data->heapId);
            data->state70++;
            break;
        case 1:
            if (!IsPaletteFadeFinished()) {
                break;
            }

            data->state70 = 0;
            return 9;
    }

    return 1;
}

static u32 ov17_02201EFC(BerryPotsAppData *data) {
    u32 unk = ov17_02203A34(data);
    if (unk == 2) {
        ov17_022037C8(data, 1);
    }
    return unk;
}

static u32 ov17_02201F18(BerryPotsAppData *data) {
    switch (data->state70) {
        case 0:
            ov17_022029C8(data, 0);
            ov17_02202944(data, BERRY_POTS_APP_022036FC_ACTION_4, data->unk7C, TRUE);
            ov17_02202910(data, FALSE);
            data->state70++;
            break;
        case 1:
            int unk = ov17_02202A50(data);
            if (unk == -1) {
                break;
            }

            data->state70 = 0;

            if (unk == 2 || unk == -2) {
                ov17_02202944(data, BERRY_POTS_APP_022036FC_ACTION_0, 4, TRUE);
                ov17_02202910(data, TRUE);
                return 2;
            }

            data->args->unk15 = data->unk7C;
            data->args->itemId = 0xFFFF;

            if (unk == 0) {
                if (data->totalMulchQuantity == 0) {
                    ov17_02202944(data, BERRY_POTS_APP_022036FC_ACTION_2, 4, FALSE);
                    return 8;
                } else {
                    data->args->unk14 = 1;
                }
            } else if (data->totalBerryQuantity == 0) {
                ov17_02202944(data, BERRY_POTS_APP_022036FC_ACTION_1, 4, FALSE);
                return 8;
            } else {
                data->args->unk14 = 2;
            }

            return 1;
    }

    return 3;
}

static u32 ov17_02201FE8(BerryPotsAppData *data) {
    switch (data->state70) {
        case 0:
            ov17_022029C8(data, 1);
            ov17_02202944(data, BERRY_POTS_APP_022036FC_ACTION_5, data->unk7C, 1);
            ov17_02202910(data, 0);
            data->state70++;
            break;
        case 1:
            int unk = ov17_02202A50(data);
            if (unk == -1) {
                break;
            }

            data->state70 = 0;

            if (unk == 1 || unk == -2) {
                ov17_02202944(data, BERRY_POTS_APP_022036FC_ACTION_0, 4, 1);
                ov17_02202910(data, 1);
                return 2;
            }

            if (data->totalBerryQuantity == 0) {
                ov17_02202944(data, BERRY_POTS_APP_022036FC_ACTION_1, 4, 0);
                return 8;
            } else {
                data->args->unk15 = data->unk7C;
                data->args->itemId = 0xFFFF;
                data->args->unk14 = 2;
                return 1;
            }
    }

    return 4;
}

static u32 ov17_02202094(BerryPotsAppData *data) {
    switch (data->state70) {
        case 0:
            ov17_022029C8(data, 2);
            ov17_02202910(data, FALSE);
            ov17_02202944(data, (enum BerryPotsApp_022036FC_Action)(BERRY_POTS_APP_022036FC_ACTION_5 + data->unk20[data->unk7C].growthStage), data->unk7C, TRUE);
            data->state70++;
            break;
        case 1:
            int unk = ov17_02202A50(data);
            if (unk == -1) {
                break;
            }

            if (unk == 1 || unk == -2) {
                data->state70 = 0;
                ov17_02202944(data, BERRY_POTS_APP_022036FC_ACTION_0, 4, TRUE);
                ov17_02202910(data, TRUE);
                return 2;
            }

            ov17_02202944(data, BERRY_POTS_APP_022036FC_ACTION_3, 4, FALSE);
            data->state70++;
            break;
        case 2:
            if (!ov17_022025B8(data)) {
                break;
            }

            ov17_02202944(data, BERRY_POTS_APP_022036FC_ACTION_13, 4, FALSE);
            data->state70++;

            // fallthrough

        default:
            if (!ov17_02202460(data)) {
                break;
            }

            ov17_022028B8(data);
            ov17_02202910(data, TRUE);
            ov17_02202944(data, BERRY_POTS_APP_022036FC_ACTION_0, 4, TRUE);

            data->state70 = 0;
            return 2;
    }

    return 5;
}

static u32 ov17_02202184(BerryPotsAppData* data) {
    switch (data->state70) {
        case 0:
            ov17_022029C8(data, 3);
            ov17_02202944(data, BERRY_POTS_APP_022036FC_ACTION_10, data->unk7C, TRUE);
            ov17_02202910(data, FALSE);
            data->state70++;
            break;

        case 1:
            int unk = ov17_02202A50(data);
            if (unk == -1) {
                break;
            }

            if (unk == 1 || unk == -2) {
                data->state70 = 0;
                ov17_02202944(data, BERRY_POTS_APP_022036FC_ACTION_0, 4, TRUE);
                ov17_02202910(data, TRUE);
                return 2;
            }

            BerryPotsAppData_UnkSub20 *unkStruct = &data->unk20[data->unk7C];
            if (Bag_HasSpaceForItem(data->bag, BerryIdToItemId(unkStruct->berryId), unkStruct->quantityOrYieldMaybe, data->heapId)) {
                data->state70 = 3;
                ov17_02202900(data, FALSE);
            } else {
                ov17_02202944(data, BERRY_POTS_APP_022036FC_ACTION_16, data->unk7C, FALSE);
                data->state70++;
            }

            break;

        case 2:
            if (ov17_02202460(data)) {
                data->state70 = 0;
                ov17_02202944(data, BERRY_POTS_APP_022036FC_ACTION_0, 4, TRUE);
                ov17_02202910(data, TRUE);
                return 2;
            }
            break;

        case 3:
            if (ov17_0220279C(data)) {
                ov17_02202944(data, BERRY_POTS_APP_022036FC_ACTION_14, data->unk7C, FALSE);
                PlayFanfare(SEQ_ME_KINOMI);
                data->state70++;
            }
            break;

        case 4:
            if (IsFanfarePlaying()) {
                break;
            }

            ov17_02202944(data, BERRY_POTS_APP_022036FC_ACTION_15, data->unk7C, FALSE);
            data->state70++;

            // fallthrough
        case 5:
            if (ov17_02202460(data)) {
                ov17_02202B98(data);
                ov17_022028B8(data);
                ov17_02202910(data, TRUE);
                ov17_02202900(data, TRUE);
                ov17_02202944(data, BERRY_POTS_APP_022036FC_ACTION_0, 4, TRUE);
                data->state70 = 0;
                return 2;
            }
            break;
    }

    return 6;
}

static u32 ov17_02202320(BerryPotsAppData *data) {
    switch (data->state70) {
        case 0:
            PlaySE(SEQ_SE_GS_KP01);
            data->state70++;
            break;
        case 1:
            if (ov17_02202460(data)) {
                ov17_02202944(data, BERRY_POTS_APP_022036FC_ACTION_0, 4, TRUE);
                ov17_02202910(data, TRUE);
                data->state70 = 0;
                return 2;
            }
            break;
    }

    return 7;
}

static u32 ov17_02202378(BerryPotsAppData *data) {
    if (ov17_02202460(data)) {
        ov17_02202944(data, BERRY_POTS_APP_022036FC_ACTION_0, 4, TRUE);
        ov17_02202910(data, TRUE);
        return 2;
    } else {
        return 8;
    }
}

static BOOL ItemIdIsMulch(u16 itemId) {
    // BUG: Root Fossils count as a mulch.
    if (itemId < ITEM_GROWTH_MULCH || itemId > ITEM_ROOT_FOSSIL) {
        return FALSE;
    } else {
        return TRUE;
    }
}

static void ov17_022023B0(BerryPotsAppData *data) {
    data->unk7B = 0;

    u8 unk = data->args->unk14;
    if (unk == 0) {
        return;
    }

    u16 itemId = data->args->itemId;
    if (itemId == 0xFFFF) {
        return;
    }

    if (unk == 1) {
        if (!ItemIdIsMulch(itemId)) {
            return;
        }

        BerryPots_SetPotMulch(data->berryPots, data->unk7C, ItemIdToMulchId(data->args->itemId));
        data->unk7B = 1;
    } else if (unk == 2) {
        if (!ItemIdIsBerry(itemId)) {
            return;
        }

        ov16_02201610(data->berryPots, data->unk7C, data->berryGrowthProperties, ItemIdToBerryId(data->args->itemId));
        GameStats_Inc(data->stats, GAME_STAT_UNK5);
        data->unk7B = 2;
    }

    Bag_TakeItem(data->bag, data->args->itemId, 1, data->heapId);
}

static u32 ov17_02202440(BerryPotsAppData *data) {
    u8 unk14 = data->args->unk14;
    data->args->unk14 = 0;

    if (unk14 == 0) {
        return 2;
    }

    if (data->unk7B != 0) {
        return 7;
    }

    return 2;
}

static BOOL ov17_02202460(BerryPotsAppData *data) {
    if (System_GetTouchNew() != 0) {
        PlaySE(SEQ_SE_DP_SELECT);
        data->unk74 = 1;
        return TRUE;
    }

    if (gSystem.newKeys & (PAD_BUTTON_Y | PAD_BUTTON_X | PAD_KEY_DOWN | PAD_KEY_UP | PAD_KEY_LEFT | PAD_KEY_RIGHT | PAD_BUTTON_B | PAD_BUTTON_A)) {
        data->unk74 = 0;
    }

    if (gSystem.newKeys & (PAD_BUTTON_B | PAD_BUTTON_A)) {
        PlaySE(SEQ_SE_DP_SELECT);
        return TRUE;
    }

    u8 unk = data->unk7A--;
    if (unk == 0) {
        PlaySE(SEQ_SE_DP_SELECT);
        return TRUE;
    }

    return FALSE;
}

static void BerryPotsApp_SetupResources(BerryPotsAppData *data) {
    BerryPotsApp_SetupBgConfig(data);
    BerryPotsApp_SetupNarc(data);
    BerryPotsApp_SetupText(data);
    BerryPotsApp_SetupWindows(data);
    BerryPotsApp_SetupListMenuItems(data);
    BerryPotsApp_SetupSpriteSystem(data);
    Main_SetVBlankIntrCB((GFIntrCB)ov17_02202BF8, data);
}

static void BerryPotsApp_FreeResources(BerryPotsAppData *data) {
    BerryPotsApp_FreeSpriteSystem(data);
    BerryPotsApp_FreeListMenuItems(data);
    BerryPotsApp_FreeWindows(data);
    BerryPotsApp_FreeText(data);
    BerryPotsApp_FreeNarc(data);
    BerryPotsApp_FreeBgConfig(data);
}

static void ov17_02202528(BerryPotsAppData *data) {
    ov17_02202850(data, 0);
    ov17_022028B8(data);

    switch (data->unk7B) {
        case 1:
            ov17_02202944(data, BERRY_POTS_APP_022036FC_ACTION_11, data->unk7C, TRUE);
            ov17_02202910(data, FALSE);
            break;
        case 2:
            ov17_02202944(data, BERRY_POTS_APP_022036FC_ACTION_12, data->unk7C, TRUE);
            ov17_02202910(data, FALSE);
            break;
        case 0:
        default:
            ov17_02202944(data, BERRY_POTS_APP_022036FC_ACTION_0, 4, TRUE);
            ov17_02202910(data, TRUE);
            break;
    }

    ov17_022037C8(data, FALSE);

    for (int i = 0; i < MAX_BERRY_POT; i++) {
        ov17_02203404(data, i);
        ov17_02202A84(data, i);
    }
}

static BOOL ov17_022025B8(BerryPotsAppData *data) {
    switch (data->state72) {
        case 0:
            data->unk80 = data->unk7C;
            data->unk81 = 0xFF;
            Sprite_SetPositionXY(data->sprites[2], (s16)(data->unk80 * 27 + 31), 56);
            Set2dSpriteAnimSeqNo(data->sprites[2], 8);
            Sprite_ResetAnimCtrlState(data->sprites[2]);
            Set2dSpriteAnimActiveFlag(data->sprites[2], TRUE);
            Set2dSpriteVisibleFlag(data->sprites[2], TRUE);
            data->waitFrames = 0;
            data->state72++;
            break;
        case 1:
            if (data->waitFrames++ >= 15) {
                PlaySE(SEQ_SE_GS_MIZU);
                Sprite_ResetAnimCtrlState(data->sprites[2]);
                Set2dSpriteAnimSeqNo(data->sprites[2], 9);
                Set2dSpriteAnimActiveFlag(data->sprites[1], TRUE);
                data->waitFrames = 0;
                data->state72++;
            }
            break;
        case 2:
            if (data->waitFrames++ == 0) {
                ov17_02202B58(data, data->unk80);
            }

            if (data->waitFrames < 30) {
                ov17_02203A54(data);
                break;
            }

            data->waitFrames = 0;
            if (data->unk81 == 0xFF) {
                StopSE(SEQ_SE_GS_MIZU, 2);
                Set2dSpriteAnimSeqNo(data->sprites[2], 8);
                data->state72 = 4;
            } else {
                ov17_0220351C(data);
                data->state72++;
            }

            break;
        case 3:
            if (data->runningTasks == 0) {
                data->waitFrames = 0;
                data->unk80 = data->unk81;
                data->unk81 = 0xFF;
                Set2dSpriteAnimActiveFlag(data->sprites[1], TRUE);
                data->state72 = 2;
            }
            break;
        case 4:
            if (data->waitFrames++ >= 15) {
                ov17_0220387C(data);
                Set2dSpriteVisibleFlag(data->sprites[2], FALSE);
                Set2dSpriteAnimActiveFlag(data->sprites[1], FALSE);
                data->waitFrames = 0;
                data->state72 = 0;
                return TRUE;
            }
            break;
    }

    return FALSE;
}

static BOOL ov17_0220279C(BerryPotsAppData *data) {
    switch (data->state72) {
        case 0:
            ov17_02203460(data, data->unk7C);
            data->unk7E = data->unk20[data->unk7C].quantityOrYieldMaybe;
            data->waitFrames = 0;
            data->state72++;
            break;
        case 1:
            if (data->waitFrames == 0) {
                ov17_02203638(data);
                data->unk7E--;
                data->waitFrames = 8;
            }
            data->waitFrames--;
            if (data->unk7E == 0) {
                data->state72++;
            }
            break;
        case 2:
            if (data->runningTasks != 0) {
                break;
            }

            data->waitFrames = 0;
            data->state72 = 0;
            return TRUE;
    }

    return FALSE;
}

static void ov17_02202850(BerryPotsAppData *data, u32 seqNo) {
    Set2dSpriteAnimSeqNo(data->sprites[0], seqNo);
    Sprite_ResetAnimCtrlState(data->sprites[0]);
    FillWindowPixelBuffer(&data->windows[0], 0);

    u32 stringWidth = FontID_String_GetWidth(4, data->cancelString, 0);
    AddTextPrinterParameterized2(&data->windows[0], 4, data->cancelString, (48 - stringWidth) / 2, 0, 0xFF, MAKE_TEXT_COLOR(1, 2, 0), NULL);

    ScheduleWindowCopyToVram(&data->windows[0]);
}

static void ov17_022028B8(BerryPotsAppData *data) {
    u8 unk7C = data->unk7C;
    Sprite_SetPositionXY(data->sprites[1], (unk7C + 1) * 27, 96);
    if (data->unk20[unk7C].growthStage > BERRY_POT_GROWTH_STAGE_GROWING) {
        Set2dSpriteAnimSeqNo(data->sprites[1], 3);
    } else {
        Set2dSpriteAnimSeqNo(data->sprites[1], 2);
    }
}

static void ov17_02202900(BerryPotsAppData *data, BOOL visible) {
    Set2dSpriteVisibleFlag(data->sprites[1], visible);
}

static void ov17_02202910(BerryPotsAppData *data, BOOL active) {
    Set2dSpriteAnimActiveFlag(data->sprites[1], active);

    for (int i = 0; i < MAX_BERRY_POT; i++) {
        if (data->unk20[i].soilSpriteMaybe != NULL && data->unk20[i].growthStage >= BERRY_POT_GROWTH_STAGE_SPROUTED) {
            Set2dSpriteAnimActiveFlag(data->unk20[i].soilSpriteMaybe, active);
        }
    }
}

static void ov17_02202944(BerryPotsAppData *data, enum BerryPotsApp_022036FC_Action action, u8 a2, BOOL a3) {
    Window *window = (action == BERRY_POTS_APP_022036FC_ACTION_0) ? &data->windows[1] : &data->windows[2];
    FillWindowPixelBuffer(window, 0xF);
    if (a3) {
        FillBgTilemapRect(data->bgConfig, 0, RGB_BLACK, 0, 18, 32, 6, 0);
        DrawFrameAndWindow2(window, TRUE, 1, 13);
    }
    ov17_022036FC(data, action, a2);
    AddTextPrinterParameterized(window, 1, data->currentStatusString, 0, 0, 0xFF, NULL);
    ScheduleWindowCopyToVram(window);
    data->unk7A = 60;
}

static void ov17_022029C8(BerryPotsAppData *data, u32 a1) {
    Ov122_021E7488 unk;
    MI_CpuFill8(&unk, 0, sizeof(Ov122_021E7488));

    unk.unk0 = ov17_02203D60.unkC;
    unk.unkC = data->listMenuItems[a1];
    unk.unk10 = data->bgConfig;
    unk.unk14 = ov17_02203E88[a1].unk0;

    data->unk1A8 = sub_020185FC(data->unk8C, &unk, (u8)data->unk74, 0xf, 16 - (unk.unk14 * 3), 0xe, 0);
}

static int ov17_02202A50(BerryPotsAppData *data) {
    int r4 = sub_020186A4(data->unk1A8);
    int r0 = -1;
    if (r4 != -1) {
        data->unk74 = sub_02018674(data->unk1A8);
        sub_02018680(data->unk1A8);
        r0 = r4;
    }
    return r0;
}

static void ov17_02202A84(BerryPotsAppData *data, int index) {
    BerryPotsAppData_UnkSub20 *sub = &data->unk20[index];
    if (sub->unkC != 0 && sub->soilSpriteMaybe != NULL) {
        Sprite_Delete(sub->soilSpriteMaybe);
    }

    if (sub->growthStage == BERRY_POT_GROWTH_STAGE_NONE) {
        sub->soilSpriteMaybe = NULL;
        Sprite_SetAnimCtrlCurrentFrame(data->sprites[index + 3], 2);
        return;
    }

    UnkStruct_0200D2B4 unkStruct;
    MI_CpuCopy8(&ov17_02203EA8, &unkStruct, sizeof(UnkStruct_0200D2B4));
    unkStruct.x = (index + 1) * 27;
    switch (sub->growthStage) {
        case BERRY_POT_GROWTH_STAGE_PLANTED:
            unkStruct.animSeqNo = 5;
            break;
        case BERRY_POT_GROWTH_STAGE_SPROUTED:
            unkStruct.animSeqNo = 6;
            break;
        default:
            unkStruct.unk_00 = index + 1;
            unkStruct.animSeqNo = sub->growthStage - 3;
            break;
    }

    sub->soilSpriteMaybe = SpriteRenderer_CreateSprite(data->spriteRenderer, data->spriteGfxHandler1, &unkStruct);
    Set2dSpriteVisibleFlag(sub->soilSpriteMaybe, TRUE);
    if (sub->growthStage == BERRY_POT_GROWTH_STAGE_PLANTED) {
        Set2dSpriteAnimActiveFlag(sub->soilSpriteMaybe, FALSE);
        Sprite_SetAnimCtrlCurrentFrame(sub->soilSpriteMaybe, data->unk20[index].soilState);
    } else {
        Set2dSpriteAnimActiveFlag(sub->soilSpriteMaybe, TRUE);
    }

    Sprite_SetAnimCtrlCurrentFrame(data->sprites[index + 3], data->unk20[index].soilState);
}

static void ov17_02202B58(BerryPotsAppData *data, u8 index) {
    BerryPotsAppData_UnkSub20 *unk = &data->unk20[index];
    BerryPots_ResetPotMoisture(data->berryPots, index);
    ov17_0220387C(data);
    Sprite_SetAnimCtrlCurrentFrame(data->sprites[index + 3], 2);
    if (unk->growthStage == BERRY_POT_GROWTH_STAGE_PLANTED) {
        Sprite_SetAnimCtrlCurrentFrame(unk->soilSpriteMaybe, unk->soilState);
    }
}

static void ov17_02202B98(BerryPotsAppData *data) {
    BerryPotsAppData_UnkSub20 *unk = &data->unk20[data->unk7C];
    ov16_02201674(data->berryPots, data->unk7C);
    Bag_AddItem(data->bag, BerryIdToItemId(unk->berryId), unk->quantityOrYieldMaybe, data->heapId);
    ov17_0220387C(data);
    Sprite_Delete(unk->soilSpriteMaybe);
    unk->soilSpriteMaybe = NULL;
    Sprite_SetAnimCtrlCurrentFrame(data->sprites[data->unk7C + 3], 2);
    GameStats_AddSpecial(data->stats, GAME_STAT_UNK0);
}

static void ov17_02202BF8(BerryPotsAppData *data) {
    if (data->spriteRenderer != NULL) {
        thunk_OamManager_ApplyAndResetBuffers();
    }
    NNS_GfdDoVramTransfer();
    DoScheduledBgGpuUpdates(data->bgConfig);
    OS_SetIrqCheckFlag(OS_IE_VBLANK);
}

static void ov17_02202C2C(void) {
    GraphicsBanks banks = ov17_02203ED0;
    GfGfx_SetBanks(&banks);
}

static void BerryPotsApp_SetupBgConfig(BerryPotsAppData *data) {
    ov17_02202C2C();
    data->bgConfig = BgConfig_Alloc(data->heapId);

    GraphicsModes modes = ov17_02203D88;
    SetBothScreensModesAndDisable(&modes);

    GX_SetDispSelect(GX_DISP_SELECT_SUB_MAIN);

    BgTemplate bgTemplate4 = ov17_02203E30;
    InitBgFromTemplate(data->bgConfig, 4, &bgTemplate4, 0);
    BgClearTilemapBufferAndCommit(data->bgConfig, 4);

    BgTemplate bgTemplate7 = ov17_02203DDC;
    InitBgFromTemplate(data->bgConfig, 7, &bgTemplate7, 0);
    BgClearTilemapBufferAndCommit(data->bgConfig, 7);

    BgTemplate bgTemplate0 = ov17_02203DF8;
    InitBgFromTemplate(data->bgConfig, 0, &bgTemplate0, 0);
    BgClearTilemapBufferAndCommit(data->bgConfig, 0);

    BgTemplate bgTemplate2 = ov17_02203E14;
    InitBgFromTemplate(data->bgConfig, 2, &bgTemplate2, 0);
    BgClearTilemapBufferAndCommit(data->bgConfig, 2);

    BgTemplate bgTemplate3 = ov17_02203E4C;
    InitBgFromTemplate(data->bgConfig, 3, &bgTemplate3, 0);
    BgClearTilemapBufferAndCommit(data->bgConfig, 3);

    BG_ClearCharDataRange(4, 0x20, 0, data->heapId);
    BG_ClearCharDataRange(7, 0x20, 0, data->heapId);
    BG_ClearCharDataRange(0, 0x20, 0, data->heapId);
    BG_ClearCharDataRange(2, 0x20, 0, data->heapId);
    BG_ClearCharDataRange(3, 0x40, 0, data->heapId);
}

static void BerryPotsApp_FreeBgConfig(BerryPotsAppData *data) {
    FreeBgTilemapBuffer(data->bgConfig, 3);
    FreeBgTilemapBuffer(data->bgConfig, 2);
    FreeBgTilemapBuffer(data->bgConfig, 0);
    FreeBgTilemapBuffer(data->bgConfig, 7);
    FreeBgTilemapBuffer(data->bgConfig, 4);
    FreeToHeap(data->bgConfig);

    GX_SetDispSelect(GX_DISP_SELECT_MAIN_SUB);
}

static void BerryPotsApp_SetupNarc(BerryPotsAppData *data) {
    NARC *narc = NARC_New(NARC_a_2_1_6, data->heapId);

    GfGfxLoader_GXLoadPalFromOpenNarc(narc, 3, GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_0_OFFSET, 0, data->heapId);
    GfGfxLoader_LoadCharDataFromOpenNarc(narc, 4, data->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, FALSE, data->heapId);
    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, 5, data->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, FALSE, data->heapId);
    GfGfxLoader_GXLoadPalFromOpenNarc(narc, 0, GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_0_OFFSET, 0, data->heapId);
    GfGfxLoader_LoadCharDataFromOpenNarc(narc, 1, data->bgConfig, GF_BG_LYR_SUB_3, 0, 0, FALSE, data->heapId);
    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, 2, data->bgConfig, GF_BG_LYR_SUB_3, 0, 0, FALSE, data->heapId);

    data->berryPotsAppNarc = narc;

    LoadUserFrameGfx2(data->bgConfig, GF_BG_LYR_MAIN_0, 1, 13, data->frame, data->heapId);
    LoadFontPal1(GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_12_OFFSET, data->heapId);
}

void BerryPotsApp_FreeNarc(BerryPotsAppData *data) {
    NARC_Delete(data->berryPotsAppNarc);
}

static void BerryPotsApp_SetupText(BerryPotsAppData *data) {
    FontID_Alloc(4, data->heapId);

    data->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0248_bin, data->heapId);
    data->msgFmt = MessageFormat_New_Custom(16, 16, data->heapId);
    data->currentStatusString = String_New(128, data->heapId);
    data->cancelString = NewString_ReadMsgData(data->msgData, msg_0248_00000);

    for (int i = 0; i < (int)NELEMS(data->statusStrings); i++) {
        data->statusStrings[i] = NewString_ReadMsgData(data->msgData, msg_0248_00006 + i);
    }
}

static void BerryPotsApp_FreeText(BerryPotsAppData *data) {
    for (int i = 0; i < (int)NELEMS(data->statusStrings); i++) {
        String_Delete(data->statusStrings[i]);
    }
    String_Delete(data->cancelString);
    String_Delete(data->currentStatusString);

    MessageFormat_Delete(data->msgFmt);
    DestroyMsgData(data->msgData);

    FontID_Release(4);
}

static void BerryPotsApp_SetupWindows(BerryPotsAppData *data) {
    for (int i = 0; i < (int)NELEMS(data->windows); i++) {
        AddWindow(data->bgConfig, &data->windows[i], &ov17_02203DC4[i]);
        FillWindowPixelBuffer(&data->windows[i], 0x0);
    }

    data->unk12C = sub_0201660C(data->heapId);
}

static void BerryPotsApp_FreeWindows(BerryPotsAppData *data) {
    for (int i = 0; i < (int)NELEMS(data->windows); i++) {
        ClearWindowTilemapAndCopyToVram(&data->windows[i]);
        RemoveWindow(&data->windows[i]);
    }

    sub_02016624(data->unk12C);
}

static void BerryPotsApp_SetupListMenuItems(BerryPotsAppData *data) {
    for (int i = 0; i < (int)NELEMS(data->listMenuItems ); i++) {
        struct UnkStruct_ov17_02203E88* unk = &ov17_02203E88[i];
        data->listMenuItems[i] = ListMenuItems_New(unk->unk0, data->heapId);
        for (int j = 0; j < (int)unk->unk0; j++) {
            ListMenuItems_AppendFromMsgData(data->listMenuItems[i], data->msgData, unk->unk4[j], j);
        }
    }
}

static void BerryPotsApp_FreeListMenuItems(BerryPotsAppData *data) {
    for (int i = 0; i < (int)NELEMS(data->listMenuItems); i++) {
        ListMenuItems_Delete(data->listMenuItems[i]);
        data->listMenuItems[i] = NULL;
    }
}

static void BerryPotsApp_SetupSpriteRendererAndGfxHandler(BerryPotsAppData *data) {
    GF_CreateVramTransferManager(32, data->heapId);

    data->spriteRenderer = SpriteRenderer_Create(data->heapId);
    sub_0200CF70(data->spriteRenderer, &ov17_02203E68, &ov17_02203D98, 8);

    sub_0200B2E0(data->heapId);
    sub_0200B2E8(data->heapId);

    data->spriteGfxHandler1 = SpriteRenderer_CreateGfxHandler(data->spriteRenderer);
    sub_0200CFF4(data->spriteRenderer, data->spriteGfxHandler1, 25);
    sub_0200D2A4(data->spriteRenderer, data->spriteGfxHandler1, ov17_02203D78, 0, 0);

    data->itemIconNarc = NARC_New(NARC_itemtool_itemdata_item_icon, data->heapId);

    SpriteResourceCountsListUnion counts = ov17_02203DAC;
    data->spriteGfxHandler2 = SpriteRenderer_CreateGfxHandler(data->spriteRenderer);
    SpriteRenderer_Init2DGfxResManagersFromCountsArray(data->spriteRenderer, data->spriteGfxHandler2, &counts);
    sub_0200E2B4(data->spriteGfxHandler2, sub_0200E2B0(data->spriteGfxHandler1));

    SpriteRenderer_LoadCharResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler2, data->itemIconNarc, GetItemIndexMapping(ITEM_CHERI_BERRY, ITEMNARC_NCGR), FALSE, NNS_G2D_VRAM_TYPE_2DMAIN, 4000);
    SpriteRenderer_LoadPlttResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler2, data->itemIconNarc, GetItemIndexMapping(ITEM_CHERI_BERRY, ITEMNARC_NCLR), FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 4000);
    SpriteRenderer_LoadCellResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler2, data->itemIconNarc, GetItemIconCell(), FALSE, 4000);
    SpriteRenderer_LoadAnimResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler2, data->itemIconNarc, GetItemIconAnim(), FALSE, 4000);

    data->unk8C = sub_02018424(data->heapId, 0);
}

static void BerryPotsApp_FreeSpriteRendererAndGfxHandler(BerryPotsAppData *data) {
    sub_02018474(data->unk8C);

    NARC_Delete(data->itemIconNarc);

    SpriteRenderer_UnloadResourcesAndRemoveGfxHandler(data->spriteRenderer, data->spriteGfxHandler2);
    SpriteRenderer_RemoveGfxHandler(data->spriteRenderer, data->spriteGfxHandler1);
    data->spriteGfxHandler2 = NULL;
    data->spriteGfxHandler1 = NULL;
    SpriteRenderer_Delete(data->spriteRenderer);
    data->spriteRenderer = NULL;

    GF_DestroyVramTransferManager();

    sub_0200B2E0(data->heapId);
}

static void BerryPotsApp_SetupSpriteSystem(BerryPotsAppData *data) {
    BerryPotsApp_SetupSpriteRendererAndGfxHandler(data);
    BerryPotsApp_SetupSprites(data);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
}

static void BerryPotsApp_FreeSpriteSystem(BerryPotsAppData *data) {
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_OFF);
    BerryPotsApp_FreeSprites(data);
    BerryPotsApp_FreeSpriteRendererAndGfxHandler(data);
}

static void BerryPotsApp_SetupSprites(BerryPotsAppData *data) {
    for (int i = 0; i <= 1; i++) {
        data->sprites[i] = SpriteRenderer_CreateSprite(data->spriteRenderer, data->spriteGfxHandler1, &ov17_02203EF8[i]);
        Set2dSpriteVisibleFlag(data->sprites[i], TRUE);
        Set2dSpriteAnimActiveFlag(data->sprites[i], TRUE);
    }

    data->sprites[2] = SpriteRenderer_CreateSprite(data->spriteRenderer, data->spriteGfxHandler1, &ov17_02203F48);
    Set2dSpriteVisibleFlag(data->sprites[2], FALSE);
    Set2dSpriteAnimActiveFlag(data->sprites[2], FALSE);

    for (int i = 0; i < (int)NELEMS(data->unk20); i++) {
        u8 spriteIndex = i + 3;
        data->sprites[spriteIndex] = SpriteRenderer_CreateSprite(data->spriteRenderer, data->spriteGfxHandler1, &ov17_02203F70);
        Sprite_SetPositionXY(data->sprites[spriteIndex], i * 27 + 27, 99);
        Sprite_SetAnimCtrlCurrentFrame(data->sprites[spriteIndex], data->unk20[i].soilState);
        Set2dSpriteVisibleFlag(data->sprites[spriteIndex], TRUE);
        Set2dSpriteAnimActiveFlag(data->sprites[spriteIndex], FALSE);

        spriteIndex = i + 7;
        data->sprites[spriteIndex] = SpriteRenderer_CreateSprite(data->spriteRenderer, data->spriteGfxHandler1, &ov17_02203F98);
        Sprite_SetPositionXY(data->sprites[spriteIndex], i * 27 + 27, 88);
        Set2dSpriteVisibleFlag(data->sprites[spriteIndex], FALSE);
        Set2dSpriteAnimActiveFlag(data->sprites[spriteIndex], TRUE);
    }
}

static void BerryPotsApp_FreeSprites(BerryPotsAppData *data) {
    for (int i = 0; i < (int)NELEMS(data->sprites); i++) {
        if (data->sprites[i] != NULL) {
            Sprite_Delete(data->sprites[i]);
        }
    }
}

static void ov17_02203404(BerryPotsAppData *data, int index) {
    u8 berryId = data->unk20[index].berryId;
    if (berryId != BERRY_NONE) {
        berryId--;
    }

    sub_0200E2B8(data->spriteRenderer, data->spriteGfxHandler1, data->berryPotsAppNarc, berryId + 76, FALSE, index + 1);
    sub_0200E2EC(data->spriteRenderer, data->spriteGfxHandler1, data->berryPotsAppNarc, berryId + 12, FALSE, index + 1);
}

static void ov17_02203460(BerryPotsAppData *data, u8 index) {
    u16 itemId = BerryIdToItemId(data->unk20[index].berryId);

    sub_0200E2B8(data->spriteRenderer, data->spriteGfxHandler2, data->itemIconNarc, GetItemIndexMapping(itemId, ITEMNARC_NCGR), FALSE, 4000);
    sub_0200E2EC(data->spriteRenderer, data->spriteGfxHandler2, data->itemIconNarc, GetItemIndexMapping(itemId, ITEMNARC_NCLR), FALSE, 4000);
}

static UnkImageStruct *ov17_022034C8(BerryPotsAppData *data, s16 x, s16 y, u8 unused) {
    UnkTemplate_0200D748 template;
    MI_CpuFill8(&template, 0, sizeof(UnkTemplate_0200D748));

    template.x = x;
    template.y = y;
    template.z = 0;
    template.animation = 0;
    template.bgPriority = 2;
    template.pal = 0;
    template.vramTransfer = 0;
    template.vram = NNS_G2D_VRAM_TYPE_2DMAIN;
    template.resIdList[GF_GFX_RES_TYPE_CHAR] = 4000;
    template.resIdList[GF_GFX_RES_TYPE_PLTT] = 4000;
    template.resIdList[GF_GFX_RES_TYPE_CELL] = 4000;
    template.resIdList[GF_GFX_RES_TYPE_ANIM] = 4000;
    template.resIdList[GF_GFX_RES_TYPE_MCEL] = -1;
    template.resIdList[GF_GFX_RES_TYPE_MANM] = -1;

    return SpriteRenderer_LoadResourcesAndCreateSprite(data->spriteRenderer, data->spriteGfxHandler2, &template);
}

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

static void ov17_022035A4(SysTask *task, SysTaskArgs_ov17_0220351C *args);

static void ov17_0220351C(BerryPotsAppData *data) {
    SysTaskArgs_ov17_0220351C *args = AllocFromHeap(data->heapId, sizeof(SysTaskArgs_ov17_0220351C));
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

    args->unk8 = (s8)(diff * 27) / 4;
    args->unkA = data->unk80;
    CreateSysTask((SysTaskFunc)ov17_022035A4, args, 0);
    data->runningTasks++;
}

static void ov17_022035A4(SysTask *task, SysTaskArgs_ov17_0220351C *args) {
    BerryPotsAppData *unk0 = args->data;

    Sprite_AddPositionXY(unk0->sprites[2], args->sign * 4, 0);
    s16 x, y;
    Sprite_GetPositionXY(unk0->sprites[2], &x, &y);

    u8 potIndex = (x - 31) / 27;
    if (potIndex != args->unkA && potIndex != args->unk7) {
        ov17_02202B58(unk0, potIndex);
        args->unkA = potIndex;
    }

    if (--args->unk8 != 0) {
        return;
    }

    Sprite_SetPositionXY(unk0->sprites[2], args->unk7 * 27 + 31, 56);

    unk0->runningTasks--;
    FreeToHeap(args);
    DestroySysTask(task);
}

typedef struct SysTaskArgs_ov17_02203674 {
    BerryPotsAppData *data;
    u8 state;
    u8 framesOnScreen;
    u8 potIndex;
    UnkImageStruct *berrySprite;
} SysTaskArgs_ov17_02203674;

static void ov17_02203674(SysTask*, SysTaskArgs_ov17_02203674*);

static void ov17_02203638(BerryPotsAppData *data) {
    SysTaskArgs_ov17_02203674 *args = AllocFromHeap(data->heapId, sizeof(SysTaskArgs_ov17_02203674));
    MI_CpuFill8(args, 0, sizeof(SysTaskArgs_ov17_02203674));

    args->data = data;
    args->potIndex = data->unk7C;

    CreateSysTask((SysTaskFunc)ov17_02203674, args, 0);
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
            UnkImageStruct_AddSpritePositionXY(args->berrySprite, 2, -2);
            if (args->framesOnScreen++ >= 8) {
                args->state++;
            }
            break;
        case 2:
            sub_0200D9DC(args->berrySprite);

            data->runningTasks--;
            FreeToHeap(args);
            DestroySysTask(task);
            break;
    }
}

static void ov17_022036FC(BerryPotsAppData *data, enum BerryPotsApp_022036FC_Action action, u8 potIndex) {
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
        case BERRY_POTS_APP_022036FC_ACTION_16:
            String *berryName = GetNutName(unk->berryId, data->heapId);
            BufferString(data->msgFmt, 0, berryName, 0, 0, 2);
            String_Delete(berryName);
            break;
        default:
            String_Copy(data->currentStatusString, data->statusStrings[action]);
            return;
    }

    StringExpandPlaceholders(data->msgFmt, data->currentStatusString, data->statusStrings[action]);
}

static void ov17_022037C8(BerryPotsAppData *data, BOOL a1) {
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

static void ov17_0220387C(BerryPotsAppData *data) {
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
            Sprite_SetAnimCtrlCurrentFrame(data->sprites[3 + i], sub->soilState);
            if (sub->growthStage == BERRY_POT_GROWTH_STAGE_PLANTED) {
                Sprite_SetAnimCtrlCurrentFrame(sub->soilSpriteMaybe, sub->soilState);
            }
        }

        if (sub->growthStage == sub->unkC) {
            continue;
        }

        SysTaskArgs_ov17_022039A0 *args = AllocFromHeap(data->heapId, sizeof(SysTaskArgs_ov17_022039A0));
        MI_CpuFill8(args, 0, sizeof(SysTaskArgs_ov17_022039A0));
        args->data = data;
        args->potIndex = i;
        CreateSysTask((SysTaskFunc)ov17_022039A0, args, 0);
        data->runningTasks++;
    }
}

static void ov17_022039A0(SysTask *task, SysTaskArgs_ov17_022039A0 *args) {
    BerryPotsAppData *data = args->data;

    switch (args->state) {
        case 0:
            Set2dSpriteVisibleFlag(data->sprites[7 + args->potIndex], TRUE);
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
                Set2dSpriteVisibleFlag(data->sprites[7 + args->potIndex], FALSE);

                data->runningTasks--;
                FreeToHeap(args);
                DestroySysTask(task);
            }

            break;
    }
}

static u32 ov17_02203A34(BerryPotsAppData *data) {
    BOOL flag = FALSE;
    u32 r0 = ov17_02203B68(data, &flag);
    if (!flag) {
        r0 = ov17_02203AD4(data);
    }
    return r0;
}

static BOOL ov17_02203A54(BerryPotsAppData *data) {
    BOOL flag = FALSE;
    BOOL r0 = ov17_02203C20(data, &flag);
    if (!flag) {
        r0 = ov17_02203B88(data);
    }
    return r0;
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
    BOOL r3 = FALSE;

    if (gSystem.newKeys & (PAD_BUTTON_Y | PAD_BUTTON_X | PAD_KEY_DOWN | PAD_KEY_UP | PAD_KEY_LEFT | PAD_KEY_RIGHT | PAD_BUTTON_B | PAD_BUTTON_A)) {
        data->unk74 = 0;
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
        r3 = TRUE;
    } else if (newKeys & PAD_KEY_RIGHT) {
        data->unk7C = (data->unk7C + 1) % MAX_BERRY_POT;
        r3 = TRUE;
    }

    if (r3) {
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
    data->unk74 = 1;
    return ov17_02203A74(data, unk);
}

static BOOL ov17_02203B88(BerryPotsAppData *data) {
    BOOL unk = FALSE;

    if (data->unk81 != 0xFF) {
        return FALSE;
    }

    if (gSystem.newKeys & (PAD_BUTTON_Y | PAD_BUTTON_X | PAD_KEY_DOWN | PAD_KEY_UP | PAD_KEY_LEFT | PAD_KEY_RIGHT | PAD_BUTTON_B | PAD_BUTTON_A)) {
        data->unk74 = 0;
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
        Set2dSpriteAnimActiveFlag(data->sprites[1], FALSE);
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
    data->unk74 = 1;
    data->unk7C = unk;
    data->unk81 = data->unk7C;
    Set2dSpriteAnimActiveFlag(data->sprites[1], FALSE);
    ov17_022028B8(data);

    return TRUE;
}

static int ov17_02203C78(BerryPotsAppData *data) {
    // touch screen coordinates?
    u8 unkArray[4];

    for (int i = 0, xOffsetMaybe = 16; i < MAX_BERRY_POT; xOffsetMaybe += 28, i++) {
        unkArray[2] = xOffsetMaybe;
        unkArray[3] = unkArray[2] + 22;
        if (data->unk20[i].growthStage < BERRY_POT_GROWTH_STAGE_GROWING) {
            unkArray[0] = 88;
            unkArray[1] = unkArray[0] + 24;
        } else {
            unkArray[0] = 72;
            unkArray[1] = unkArray[0] + 32;
        }

        if (sub_02025320(&unkArray)) {
            return i;
        }
    }
    return -1;
}

static int ov17_02203CC8(BerryPotsAppData *data) {
    if (sub_02025320(&ov17_02203FC0)) {
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
