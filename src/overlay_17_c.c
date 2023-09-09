#include "global.h"
#include "bag.h"
#include "font.h"
#include "game_stats.h"
#include "gf_gfx_loader.h"
#include "gx_layers.h"
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
#include "vram_transfer_manager.h"

typedef struct UnkArgs_ov17_sub {
    u8 unk0[4];
    u32 *unk4;
    u8 unk8[4];
    SaveData *savedata;
} UnkArgs_ov17_sub;

typedef struct UnkArgs_ov17 {
    u8 unk0[4];
    UnkArgs_ov17_sub *unk4;
    u8 unk8[0x14 - 0x8];
    u8 unk14;
    u8 unk15;
    u16 itemId;
} UnkArgs_ov17;

typedef struct UnkData_ov17_sub {
    u8 berryId;
    u8 growthStage;
    u8 unk2;
    u8 moisture;
    u8 mulch;
    u8 quantityOrYieldMaybe;
    u16 unk6;
    u16 unk8;
    u8 soilStateMaybe;
    u8 unkB;
    u8 unkC;
    u8 unkD;
    Sprite *soilSpriteMaybe;
} UnkData_ov17_sub;

typedef struct UnkData_ov17 {
    HeapID heapId;
    UnkArgs_ov17 *args;
    void *unk8;
    Bag *bag;
    GAME_STATS *stats;
    BerryPot *berryPots;
    struct GF_RTC_DateTime *berryDatetime;
    UnkStruct_ov16_022014A0 *berryGrowthProperties;
    UnkData_ov17_sub unk20[4];
    u16 unk70;
    u16 unk72;
    u32 unk74;
    u8 textFrameDelay;
    u8 frame;
    u8 unk7A;
    u8 unk7B;
    u8 unk7C;
    u8 unk7D;
    u8 unk7E;
    u8 unk7F;
    u8 unk80;
    u8 unk81;
    u16 totalBerryQuantity;
    u16 totalMulchQuantity;
    BgConfig *bgConfig;
    void *unk8C;
    u8 unk90[0x9C - 0x90];
    MsgData *msgData;
    MessageFormat *msgFmt;
    String *unkA4;
    String *unkA8;
    u8 unkAC[4];
    String *unkB0[17];
    u8 unkF4[0xFC - 0xF4];
    Window unkFC[3];
    void *unk12C;
    void *unk130;
    void *unk134;
    void *unk138;
    u8 unk13C[0x164 - 0x13C];
    Sprite *unk164[11];
    NARC *itemIconNarc;
    NARC *berryPotsAppNarc;
    LISTMENUITEM *unk198[4];
    void *unk1A8;
} UnkData_ov17;

extern sub_0200B2E0();
extern sub_0200B2E8();
extern sub_0200D0E4();
extern sub_0200D2A4();
extern sub_0200DEA0();
extern sub_0200DE00();
extern sub_0200DED0();
extern sub_0200E2B0();
extern sub_0200E2B4();
extern sub_0200E2B8();
extern sub_0200E2EC();
extern void* sub_0201660C(HeapID);
extern void sub_02016624(void*);
extern void ov17_022032AC(UnkData_ov17*);
extern void ov17_022033E4(UnkData_ov17*);

void ov17_02201BC0(void);
void ov17_02201BC0(void) {
    Main_SetVBlankIntrCB(NULL, NULL);
    HBlankInterruptDisable();

    GX_DisableEngineALayers();
    GX_DisableEngineBLayers();

    GX_SetVisiblePlane(0);
    GXS_SetVisiblePlane(0);

    sub_0200FBF4(0, 0);
    sub_0200FBF4(1, 0);
    sub_0200FBDC(0);
    sub_0200FBDC(1);
}

extern void ov17_02201D30(UnkData_ov17*);
extern BOOL ov17_02201DF0(UnkData_ov17*);

BOOL ov17_02201C10(OVY_MANAGER *manager, int *state);
BOOL ov17_02201C10(OVY_MANAGER *manager, int *state) {
    switch (*state) {
        case 0: {
            ov17_02201BC0();
            CreateHeap(HEAP_ID_3, HEAP_ID_OV17, 0x20000);

            UnkData_ov17 *unk = OverlayManager_CreateAndGetData(manager, sizeof(UnkData_ov17), HEAP_ID_OV17);
            MI_CpuFill8(unk, 0, sizeof(UnkData_ov17));
            unk->heapId = HEAP_ID_OV17;
            unk->args = OverlayManager_GetArgs(manager);
            ov17_02201D30(unk);

            (*state)++;
            break;
        }

        case 1: {
            UnkData_ov17 *unk = OverlayManager_GetData(manager);
            if (ov17_02201DF0(unk)) {
                return TRUE;
            }

            break;
        }
    }

    return FALSE;
}

extern u32 ov17_02201E50(UnkData_ov17*);
extern u32 ov17_02201EA8(UnkData_ov17*);
extern u32 ov17_02201EFC(UnkData_ov17*);
extern u32 ov17_02201F18(UnkData_ov17*);
extern u32 ov17_02201FE8(UnkData_ov17*);
extern u32 ov17_02202094(UnkData_ov17*);
extern u32 ov17_02202184(UnkData_ov17*);
extern u32 ov17_02202320(UnkData_ov17*);
extern u32 ov17_02202378(UnkData_ov17*);

BOOL ov17_02201C78(OVY_MANAGER *manager, int *state);
BOOL ov17_02201C78(OVY_MANAGER *manager, int *state) {
    UnkData_ov17 *unk = OverlayManager_GetData(manager);

    switch (*state) {
        case 0:
            *state = ov17_02201E50(unk);
            break;
        case 1:
            *state = ov17_02201EA8(unk);
            break;
        case 2:
            *state = ov17_02201EFC(unk);
            break;
        case 3:
            *state = ov17_02201F18(unk);
            break;
        case 4:
            *state = ov17_02201FE8(unk);
            break;
        case 5:
            *state = ov17_02202094(unk);
            break;
        case 6:
            *state = ov17_02202184(unk);
            break;
        case 7:
            *state = ov17_02202320(unk);
            break;
        case 8:
            *state = ov17_02202378(unk);
            break;
        case 9:
            return TRUE;
    }

    sub_0200D020(unk->unk134);
    return FALSE;
}

extern void ov17_02201DD8(UnkData_ov17*);
extern BOOL ov17_02201E3C(UnkData_ov17*);

BOOL ov17_02201D04(OVY_MANAGER *manager, int *state);
BOOL ov17_02201D04(OVY_MANAGER *manager, int *state) {
    UnkData_ov17 *unk = OverlayManager_GetData(manager);
    if (!ov17_02201E3C(unk)) {
        return FALSE;
    }

    ov17_02201DD8(unk);

    OverlayManager_FreeData(manager);
    DestroyHeap(HEAP_ID_OV17);

    return TRUE;
}

extern void ov17_022023B0(UnkData_ov17*);
extern void ov17_0220387C(UnkData_ov17*);

void ov17_02201D30(UnkData_ov17 *a0) {
    a0->unk74 = sub_020183F0(a0->args->unk4->unk4);
    OPTIONS *options = Save_PlayerData_GetOptionsAddr(a0->args->unk4->savedata);
    a0->textFrameDelay = Options_GetTextFrameDelay(options);
    a0->frame = Options_GetFrame(options);
    a0->bag = Save_Bag_Get(a0->args->unk4->savedata);
    a0->stats = Save_GameStats_Get(a0->args->unk4->savedata);
    a0->berryGrowthProperties = ov16_022014A0(a0->heapId);
    a0->berryPots = Save_BerryPots_Get(a0->args->unk4->savedata);
    a0->berryDatetime = Save_BerryPotRTC_Get(a0->args->unk4->savedata);
    a0->unk7C = (a0->args->unk14 != 0) ? a0->args->unk15 : 0;
    ov17_022023B0(a0);
    a0->totalBerryQuantity = GetTotalBerryQuantity(a0->bag, a0->heapId);
    a0->totalMulchQuantity = GetTotalMulchQuantity(a0->bag, a0->heapId);
    ov17_0220387C(a0);
}

void ov17_02201DD8(UnkData_ov17 *a0);
void ov17_02201DD8(UnkData_ov17 *a0) {
    FreeToHeap(a0->berryGrowthProperties);
    sub_02018410(a0->args->unk4->unk4, a0->unk74);
}

extern void sub_020210BC(void);
extern u32 sub_02021148(u32);
extern void ov17_022024CC(UnkData_ov17*);
extern void ov17_02202528(UnkData_ov17*);

BOOL ov17_02201DF0(UnkData_ov17 *a0) {
    switch (a0->unk70) {
        case 0:
            ov17_022024CC(a0);
            a0->unk70++;
            break;
        case 1:
            ov17_02202528(a0);
            sub_020210BC();
            sub_02021148(1);
            sub_02004EC4(0x45, 0, 0);

            a0->unk70 = 0;
            return TRUE;
    }

    return FALSE;
}

extern void sub_02021238(void);
extern void ov17_02202500(UnkData_ov17*);

BOOL ov17_02201E3C(UnkData_ov17 *a0) {
    sub_02021238();
    ov17_02202500(a0);
    return TRUE;
}

extern u32 ov17_02202440(UnkData_ov17*);

u32 ov17_02201E50(UnkData_ov17 *a0) {
    switch (a0->unk70) {
        case 0:
            BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, a0->heapId);
            a0->unk70++;
            break;
        case 1:
            if (!IsPaletteFadeFinished()) {
                break;
            }

            a0->unk70 = 0;
            return ov17_02202440(a0);
    }

    return 0;
}

u32 ov17_02201EA8(UnkData_ov17 *a0) {
    switch (a0->unk70) {
        case 0:
            BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, a0->heapId);
            a0->unk70++;
            break;
        case 1:
            if (!IsPaletteFadeFinished()) {
                break;
            }

            a0->unk70 = 0;
            return 9;
    }

    return 1;
}

extern void ov17_022037C8(UnkData_ov17*, BOOL);
extern u32 ov17_02203A34(UnkData_ov17*);

u32 ov17_02201EFC(UnkData_ov17 *a0) {
    u32 unk = ov17_02203A34(a0);
    if (unk == 2) {
        ov17_022037C8(a0, 1);
    }
    return unk;
}

extern int ov17_02202A50(UnkData_ov17*);
extern void ov17_02202910(UnkData_ov17*, BOOL);
extern void ov17_02202944(UnkData_ov17*, u32, u8, BOOL);
extern void ov17_022029C8(UnkData_ov17*, u32);

u32 ov17_02201F18(UnkData_ov17 *a0);
u32 ov17_02201F18(UnkData_ov17 *a0) {
    switch (a0->unk70) {
        case 0:
            ov17_022029C8(a0, 0);
            ov17_02202944(a0, 4, a0->unk7C, 1);
            ov17_02202910(a0, 0);
            a0->unk70++;
            break;
        case 1: {
            int unk = ov17_02202A50(a0);
            if (unk == -1) {
                break;
            }

            a0->unk70 = 0;

            if (unk == 2 || unk == -2) {
                ov17_02202944(a0, 0, 4, 1);
                ov17_02202910(a0, 1);
                return 2;
            }

            a0->args->unk15 = a0->unk7C;
            a0->args->itemId = 0xFFFF;

            if (unk == 0) {
                if (a0->totalMulchQuantity == 0) {
                    ov17_02202944(a0, 2, 4, 0);
                    return 8;
                } else {
                    a0->args->unk14 = 1;
                }
            } else {
                if (a0->totalBerryQuantity == 0) {
                    ov17_02202944(a0, 1, 4, 0);
                    return 8;
                } else {
                    a0->args->unk14 = 2;
                }
            }

            return 1;
        }
    }

    return 3;
}

u32 ov17_02201FE8(UnkData_ov17 *a0);
u32 ov17_02201FE8(UnkData_ov17 *a0) {
    switch (a0->unk70) {
        case 0:
            ov17_022029C8(a0, 1);
            ov17_02202944(a0, 5, a0->unk7C, 1);
            ov17_02202910(a0, 0);
            a0->unk70++;
            break;
        case 1: {
            int unk = ov17_02202A50(a0);
            if (unk == -1) {
                break;
            }

            a0->unk70 = 0;

            if (unk == 1 || unk == -2) {
                ov17_02202944(a0, 0, 4, 1);
                ov17_02202910(a0, 1);
                return 2;
            }

            if (a0->totalBerryQuantity == 0) {
                ov17_02202944(a0, 1, 4, 0);
                return 8;
            } else {
                a0->args->unk15 = a0->unk7C;
                a0->args->itemId = 0xFFFF;
                a0->args->unk14 = 2;
                return 1;
            }
        }
    }

    return 4;
}

extern void ov17_022028B8(UnkData_ov17*);
extern BOOL ov17_02202460(UnkData_ov17*);
extern BOOL ov17_022025B8(UnkData_ov17*);

u32 ov17_02202094(UnkData_ov17 *a0);
u32 ov17_02202094(UnkData_ov17 *a0) {
    switch (a0->unk70) {
        case 0:
            ov17_022029C8(a0, 2);
            ov17_02202910(a0, 0);
            ov17_02202944(a0, a0->unk20[a0->unk7C].growthStage + 5, a0->unk7C, 1);
            a0->unk70++;
            break;
        case 1: {
            int unk = ov17_02202A50(a0);
            if (unk == -1) {
                break;
            }

            if (unk == 1 || unk == -2) {
                a0->unk70 = 0;
                ov17_02202944(a0, 0, 4, 1);
                ov17_02202910(a0, 1);
                return 2;
            }

            ov17_02202944(a0, 3, 4, 0);
            a0->unk70++;
            break;
        }
        case 2:
            if (!ov17_022025B8(a0)) {
                break;
            }

            ov17_02202944(a0, 13, 4, 0);
            a0->unk70++;

            // fallthrough

        default:
            if (!ov17_02202460(a0)) {
                break;
            }

            ov17_022028B8(a0);
            ov17_02202910(a0, 1);
            ov17_02202944(a0, 0, 4, 1);

            a0->unk70 = 0;
            return 2;
    }

    return 5;
}

extern BOOL ov17_0220279C(UnkData_ov17*);
extern void ov17_02202900(UnkData_ov17*, BOOL);
extern void ov17_02202B98(UnkData_ov17*);

u32 ov17_02202184(UnkData_ov17* a0) {
    switch (a0->unk70) {
        case 0:
            ov17_022029C8(a0, 3);
            ov17_02202944(a0, 10, a0->unk7C, TRUE);
            ov17_02202910(a0, FALSE);
            a0->unk70++;
            break;

        case 1: {
            int unk = ov17_02202A50(a0);
            if (unk == -1) {
                break;
            }

            if (unk == 1 || unk == -2) {
                a0->unk70 = 0;
                ov17_02202944(a0, 0, 4, TRUE);
                ov17_02202910(a0, TRUE);
                return 2;
            }

            UnkData_ov17_sub *unkStruct = &a0->unk20[a0->unk7C];
            if (Bag_HasSpaceForItem(a0->bag, BerryIdToItemId(unkStruct->berryId), unkStruct->quantityOrYieldMaybe, a0->heapId)) {
                a0->unk70 = 3;
                ov17_02202900(a0, FALSE);
            } else {
                ov17_02202944(a0, 16, a0->unk7C, FALSE);
                a0->unk70++;
            }

            break;
        }

        case 2:
            if (ov17_02202460(a0)) {
                a0->unk70 = 0;
                ov17_02202944(a0, 0, 4, TRUE);
                ov17_02202910(a0, TRUE);
                return 2;
            }
            break;

        case 3:
            if (ov17_0220279C(a0)) {
                ov17_02202944(a0, 14, a0->unk7C, FALSE);
                PlayFanfare(0x4a9); // FIXME: constant
                a0->unk70++;
            }
            break;

        case 4:
            if (IsFanfarePlaying()) {
                break;
            }

            ov17_02202944(a0, 15, a0->unk7C, FALSE);
            a0->unk70++;

            // fallthrough
        case 5:
            if (ov17_02202460(a0)) {
                ov17_02202B98(a0);
                ov17_022028B8(a0);
                ov17_02202910(a0, TRUE);
                ov17_02202900(a0, TRUE);
                ov17_02202944(a0, 0, 4, TRUE);
                a0->unk70 = 0;
                return 2;
            }
            break;
    }

    return 6;
}

u32 ov17_02202320(UnkData_ov17 *a0) {
    switch (a0->unk70) {
        case 0:
            PlaySE(0x888); // FIXME: Constant
            a0->unk70++;
            break;
        case 1:
            if (ov17_02202460(a0)) {
                ov17_02202944(a0, 0, 4, TRUE);
                ov17_02202910(a0, TRUE);
                a0->unk70 = 0;
                return 2;
            }
            break;
    }

    return 7;
}

u32 ov17_02202378(UnkData_ov17 *a0) {
    if (ov17_02202460(a0)) {
        ov17_02202944(a0, 0, 4, TRUE);
        ov17_02202910(a0, TRUE);
        return 2;
    } else {
        return 8;
    }
}

static BOOL ItemIdIsMulch(u16 itemId);

static BOOL ItemIdIsMulch(u16 itemId) {
    // BUG: Root Fossils count as a mulch.
    if (itemId < ITEM_GROWTH_MULCH || itemId > ITEM_ROOT_FOSSIL) {
        return FALSE;
    } else {
        return TRUE;
    }
}

void ov17_022023B0(UnkData_ov17 *a0) {
    a0->unk7B = 0;

    u8 unk = a0->args->unk14;
    if (unk == 0) {
        return;
    }

    u16 itemId = a0->args->itemId;
    if (itemId == 0xFFFF) {
        return;
    }

    if (unk == 1) {
        if (!ItemIdIsMulch(itemId)) {
            return;
        }

        BerryPots_SetPotMulch(a0->berryPots, a0->unk7C, ItemIdToMulchId(a0->args->itemId));
        a0->unk7B = 1;
    } else if (unk == 2) {
        if (!ItemIdIsBerry(itemId)) {
            return;
        }

        ov16_02201610(a0->berryPots, a0->unk7C, a0->berryGrowthProperties, ItemIdToBerryId(a0->args->itemId));
        GameStats_Inc(a0->stats, 5);
        a0->unk7B = 2;
    }

    Bag_TakeItem(a0->bag, a0->args->itemId, 1, a0->heapId);
}

u32 ov17_02202440(UnkData_ov17 *a0) {
    u8 unk14 = a0->args->unk14;
    a0->args->unk14 = 0;

    if (unk14 == 0) {
        return 2;
    }

    if (a0->unk7B != 0) {
        return 7;
    }

    return 2;
}

BOOL ov17_02202460(UnkData_ov17 *a0) {
    if (System_GetTouchNew() != 0) {
        PlaySE(SEQ_SE_DP_SELECT);
        a0->unk74 = 1;
        return TRUE;
    }

    if (gSystem.newKeys & (PAD_BUTTON_Y | PAD_BUTTON_X | PAD_KEY_DOWN | PAD_KEY_UP | PAD_KEY_LEFT | PAD_KEY_RIGHT | PAD_BUTTON_B | PAD_BUTTON_A)) {
        a0->unk74 = 0;
    }

    if (gSystem.newKeys & (PAD_BUTTON_B | PAD_BUTTON_A)) {
        PlaySE(SEQ_SE_DP_SELECT);
        return TRUE;
    }

    u8 unk = a0->unk7A--;
    if (unk == 0) {
        PlaySE(SEQ_SE_DP_SELECT);
        return TRUE;
    }

    return FALSE;
}

extern void ov17_02202BF8(UnkData_ov17*);
extern void ov17_02202C4C(UnkData_ov17*);
extern void ov17_02202E28(UnkData_ov17*);
extern void ov17_02202F0C(UnkData_ov17*);
extern void ov17_02202FC4(UnkData_ov17*);
extern void ov17_02203030(UnkData_ov17*);
extern void ov17_02203278(UnkData_ov17*);

void ov17_022024CC(UnkData_ov17 *a0) {
    ov17_02202C4C(a0);
    ov17_02202E28(a0);
    ov17_02202F0C(a0);
    ov17_02202FC4(a0);
    ov17_02203030(a0);
    ov17_02203278(a0);
    Main_SetVBlankIntrCB((GFIntrCB)ov17_02202BF8, a0);
}

extern void ov17_02203290(UnkData_ov17*);
extern void ov17_02203084(UnkData_ov17*);
extern void ov17_02203004(UnkData_ov17*);
extern void ov17_02202F7C(UnkData_ov17*);
extern void ov17_02202EFC(UnkData_ov17*);
extern void ov17_02202DD0(UnkData_ov17*);

void ov17_02202500(UnkData_ov17 *a0) {
    ov17_02203290(a0);
    ov17_02203084(a0);
    ov17_02203004(a0);
    ov17_02202F7C(a0);
    ov17_02202EFC(a0);
    ov17_02202DD0(a0);
}

extern void ov17_02203404(UnkData_ov17*, u32);
extern void ov17_02202A84(UnkData_ov17*, u32);
void ov17_02202850(UnkData_ov17*, u32);

void ov17_02202528(UnkData_ov17 *a0) {
    ov17_02202850(a0, 0);
    ov17_022028B8(a0);

    switch (a0->unk7B) {
        case 1:
            ov17_02202944(a0, 11, a0->unk7C, TRUE);
            ov17_02202910(a0, FALSE);
            break;
        case 2:
            ov17_02202944(a0, 12, a0->unk7C, TRUE);
            ov17_02202910(a0, FALSE);
            break;
        case 0:
        default:
            ov17_02202944(a0, 0, 4, TRUE);
            ov17_02202910(a0, TRUE);
            break;
    }

    ov17_022037C8(a0, FALSE);

    for (int i = 0; i < 4; i++) {
        ov17_02203404(a0, i);
        ov17_02202A84(a0, i);
    }
}

extern void sub_0200DD88(Sprite*, s16, s16);
extern void sub_02024964(Sprite*);
extern BOOL ov17_02203A54(UnkData_ov17*);
extern void ov17_02202B58(UnkData_ov17*, u8);
extern void ov17_0220351C(UnkData_ov17*);

BOOL ov17_022025B8(UnkData_ov17 *a0) {
    switch (a0->unk72) {
        case 0:
            a0->unk80 = a0->unk7C;
            a0->unk81 = 0xFF;
            sub_0200DD88(a0->unk164[2], (s16)(a0->unk80 * 27 + 31), 0x38);
            Set2dSpriteAnimSeqNo(a0->unk164[2], 8);
            sub_02024964(a0->unk164[2]);
            Set2dSpriteAnimActiveFlag(a0->unk164[2], TRUE);
            Set2dSpriteVisibleFlag(a0->unk164[2], TRUE);
            a0->unk7F = 0;
            a0->unk72++;
            break;
        case 1: {
            u8 unk7F = a0->unk7F++;
            if (unk7F >= 15) {
                PlaySE(0x889);
                sub_02024964(a0->unk164[2]);
                Set2dSpriteAnimSeqNo(a0->unk164[2], 9);
                Set2dSpriteAnimActiveFlag(a0->unk164[1], TRUE);
                a0->unk7F = 0;
                a0->unk72++;
            }
            break;
        }
        case 2: {
            u8 unk7F = a0->unk7F++;
            if (unk7F == 0) {
                ov17_02202B58(a0, a0->unk80);
            }

            if (a0->unk7F < 30) {
                ov17_02203A54(a0);
                break;
            }

            a0->unk7F = 0;
            if (a0->unk81 == 0xFF) {
                StopSE(0x889, 2);
                Set2dSpriteAnimSeqNo(a0->unk164[2], 8);
                a0->unk72 = 4;
            } else {
                ov17_0220351C(a0);
                a0->unk72++;
            }

            break;
        }
        case 3:
            if (a0->unk7D == 0) {
                a0->unk7F = 0;
                a0->unk80 = a0->unk81;
                a0->unk81 = 0xFF;
                Set2dSpriteAnimActiveFlag(a0->unk164[1], TRUE);
                a0->unk72 = 2;
            }
            break;
        case 4: {
            u8 unk7F = a0->unk7F++;
            if (unk7F >= 15) {
                ov17_0220387C(a0);
                Set2dSpriteVisibleFlag(a0->unk164[2], FALSE);
                Set2dSpriteAnimActiveFlag(a0->unk164[1], FALSE);
                a0->unk7F = 0;
                a0->unk72 = 0;
                return TRUE;
            }
            break;
        }
    }

    return FALSE;
}

extern void ov17_02203460(UnkData_ov17*, u8);
extern void ov17_02203638(UnkData_ov17*);

BOOL ov17_0220279C(UnkData_ov17 *a0) {
    switch (a0->unk72) {
        case 0:
            ov17_02203460(a0, a0->unk7C);
            a0->unk7E = a0->unk20[a0->unk7C].quantityOrYieldMaybe;
            a0->unk7F = 0;
            a0->unk72++;
            break;
        case 1:
            if (a0->unk7F == 0) {
                ov17_02203638(a0);
                a0->unk7E--;
                a0->unk7F = 8;
            }
            a0->unk7F--;
            if (a0->unk7E == 0) {
                a0->unk72++;
            }
            break;
        case 2:
            if (a0->unk7D != 0) {
                break;
            }

            a0->unk7F = 0;
            a0->unk72 = 0;
            return TRUE;
    }

    return FALSE;
}

// FIXME: Matches on decomp.me, but not here. https://decomp.me/scratch/YxMNT
#ifdef NONMATCHING
void ov17_02202850(UnkData_ov17 *a0, u32 seqNo) {
    Set2dSpriteAnimSeqNo(a0->unk164[0], seqNo);
    sub_02024964(a0->unk164[0]);
    FillWindowPixelBuffer(&a0->unkFC[0], 0);

    u32 stringWidth = FontID_String_GetWidth(4, a0->unkA8, 0);
    AddTextPrinterParameterized2(&a0->unkFC[0], 4, a0->unkA8, (48 - stringWidth) / 2, 0, 0xFF, MakeTextColor(1, 2, 0), NULL);

    ScheduleWindowCopyToVram(&a0->unkFC[0]);
}
#else
asm void ov17_02202850(UnkData_ov17 *a0, u32 seqNo) {
    push {r3, r4, r5, lr}
    sub sp, #0x10
    add r4, r0, #0
    mov r0, #0x59
    lsl r0, r0, #2
    ldr r0, [r4, r0]
    bl Set2dSpriteAnimSeqNo
    mov r0, #0x59
    lsl r0, r0, #2
    ldr r0, [r4, r0]
    bl sub_02024964
    add r0, r4, #0
    add r0, #0xfc
    mov r1, #0
    bl FillWindowPixelBuffer
    add r1, r4, #0
    add r1, #0xa8
    ldr r1, [r1, #0]
    mov r0, #4
    mov r2, #0
    bl FontID_String_GetWidth
    mov r1, #0
    add r3, r0, #0
    add r2, r4, #0
    mov r5, #0x30
    sub r3, r5, r3
    str r1, [sp]
    mov r0, #0xff
    str r0, [sp, #4]
    ldr r0, [pc, #0x20] // _022028B4
    add r2, #0xa8
    str r0, [sp, #8]
    str r1, [sp, #0xc]
    add r0, r4, #0
    ldr r2, [r2, #0]
    add r0, #0xfc
    mov r1, #4
    lsr r3, r3, #1
    bl AddTextPrinterParameterized2
    add r4, #0xfc
    add r0, r4, #0
    bl ScheduleWindowCopyToVram
    add sp, #0x10
    pop {r3, r4, r5, pc}
_022028B4: DCD 0x00010200
}
#endif

void ov17_022028B8(UnkData_ov17 *a0) {
    u8 unk7C = a0->unk7C;
    sub_0200DD88(a0->unk164[1], (unk7C + 1) * 27, 96);
    if (a0->unk20[unk7C].growthStage > 3) {
        Set2dSpriteAnimSeqNo(a0->unk164[1], 3);
    } else {
        Set2dSpriteAnimSeqNo(a0->unk164[1], 2);
    }
}

void ov17_02202900(UnkData_ov17 *a0, BOOL visible) {
    Set2dSpriteVisibleFlag(a0->unk164[1], visible);
}

void ov17_02202910(UnkData_ov17 *a0, BOOL active) {
    Set2dSpriteAnimActiveFlag(a0->unk164[1], active);

    for (int i = 0; i < 4; i++) {
        if (a0->unk20[i].soilSpriteMaybe != NULL && a0->unk20[i].growthStage >= 2) {
            Set2dSpriteAnimActiveFlag(a0->unk20[i].soilSpriteMaybe, active);
        }
    }
}

extern void ov17_022036FC(UnkData_ov17*, u32, u8);

void ov17_02202944(UnkData_ov17 *a0, u32 a1, u8 a2, BOOL a3) {
    Window *window = (a1 == 0) ? &a0->unkFC[1] : &a0->unkFC[2];
    FillWindowPixelBuffer(window, 0xF);
    if (a3) {
        FillBgTilemapRect(a0->bgConfig, 0, RGB_BLACK, 0, 18, 32, 6, 0);
        DrawFrameAndWindow2(window, TRUE, 1, 13);
    }
    ov17_022036FC(a0, a1, a2);
    AddTextPrinterParameterized(window, 1, a0->unkA4, 0, 0, 0xFF, NULL);
    ScheduleWindowCopyToVram(window);
    a0->unk7A = 60;
}

extern const u8 ov17_02203D60;
extern const u8 ov17_02203E88;

asm void ov17_022029C8(UnkData_ov17 *a0, u32 a1) {
    push {r4, r5, lr}
    sub sp, #0x24
    add r5, r0, #0
    add r4, r1, #0
    add r0, sp, #0xc
    mov r1, #0
    mov r2, #0x18
    bl MI_CpuFill8
    ldr r0, [pc, #0x6c] // =ov17_02203D60
    add r2, sp, #0xc
    ldrh r3, [r0, #0xc]
    add r1, sp, #0xc
    strh r3, [r2]
    ldrh r3, [r0, #0xe]
    strh r3, [r2, #2]
    ldrh r3, [r0, #0x10]
    strh r3, [r2, #4]
    ldrh r3, [r0, #0x12]
    strh r3, [r2, #6]
    ldrh r3, [r0, #0x14]
    ldrh r0, [r0, #0x16]
    strh r3, [r2, #8]
    strh r0, [r2, #0xa]
    lsl r0, r4, #2
    add r3, r5, r0
    mov r0, #0x66
    lsl r0, r0, #2
    ldr r0, [r3, r0]
    lsl r3, r4, #3
    str r0, [sp, #0x18]
    add r0, r5, #0
    add r0, #0x88
    ldr r0, [r0, #0]
    str r0, [sp, #0x1c]
    ldr r0, [pc, #0x3c] // =ov17_02203E88
    ldr r0, [r0, r3]
    mov r3, #0xf
    strb r0, [r2, #0x14]
    ldrb r2, [r2, #0x14]
    lsl r0, r2, #1
    add r2, r2, r0
    mov r0, #0x10
    sub r0, r0, r2
    lsl r0, r0, #0x18
    lsr r0, r0, #0x18
    str r0, [sp]
    mov r0, #0xe
    str r0, [sp, #4]
    mov r0, #0
    str r0, [sp, #8]
    add r0, r5, #0
    ldr r2, [r5, #0x74]
    add r0, #0x8c
    lsl r2, r2, #0x18
    ldr r0, [r0, #0]
    lsr r2, r2, #0x18
    bl sub_020185FC
    mov r1, #0x6a
    lsl r1, r1, #2
    str r0, [r5, r1]
    add sp, #0x24
    pop {r4, r5, pc}
_02202A48: DCD ov17_02203D60
_02202A4C: DCD ov17_02203E88
}

int ov17_02202A50(UnkData_ov17 *a0) {
    int r4 = sub_020186A4(a0->unk1A8);
    int r0 = -1;
    if (r4 != -1) {
        a0->unk74 = sub_02018674(a0->unk1A8);
        sub_02018680(a0->unk1A8);
        r0 = r4;
    }
    return r0;
}

extern const u8 ov17_02203EA8;
extern sub_0200D2B4();
extern void sub_020249D4(Sprite*, u32);

asm void ov17_02202A84(UnkData_ov17 *a0, u32 index) {
    push {r3, r4, r5, r6, r7, lr}
    sub sp, #0x28
    add r6, r1, #0
    add r5, r0, #0
    mov r0, #0x14
    add r7, r6, #0
    mul r7, r0
    add r0, r5, #0
    add r0, #0x20
    add r4, r0, r7
    ldrb r0, [r4, #0xc]
    cmp r0, #0
    beq _02202AA8
    ldr r0, [r4, #0x10]
    cmp r0, #0
    beq _02202AA8
    bl Sprite_Delete
_02202AA8:
    ldrb r0, [r4, #1]
    cmp r0, #0
    bne _02202AC8
    mov r0, #0
    str r0, [r4, #0x10]
    add r0, r6, #3
    lsl r0, r0, #2
    add r1, r5, r0
    mov r0, #0x59
    lsl r0, r0, #2
    ldr r0, [r1, r0]
    mov r1, #2
    bl sub_020249D4
    add sp, #0x28
    pop {r3, r4, r5, r6, r7, pc}
_02202AC8:
    ldr r0, [pc, #0x88] // _02202B54 ; =ov17_02203EA8
    add r1, sp, #0
    mov r2, #0x28
    bl MI_CpuCopy8
    add r0, r6, #1
    mov r1, #0x1b
    add r2, r0, #0
    mul r2, r1
    add r1, sp, #0
    strh r2, [r1, #4]
    ldrb r2, [r4, #1]
    cmp r2, #1
    beq _02202AEA
    cmp r2, #2
    beq _02202AF0
    b _02202AF6
_02202AEA:
    mov r0, #5
    strh r0, [r1, #0xa]
    b _02202AFE
_02202AF0:
    mov r0, #6
    strh r0, [r1, #0xa]
    b _02202AFE
_02202AF6:
    str r0, [sp]
    ldrb r0, [r4, #1]
    sub r0, r0, #3
    strh r0, [r1, #0xa]
_02202AFE:
    mov r1, #0x13
    lsl r1, r1, #4
    ldr r0, [r5, r1]
    add r1, r1, #4
    ldr r1, [r5, r1]
    add r2, sp, #0
    bl sub_0200D2B4
    str r0, [r4, #0x10]
    mov r1, #1
    bl Set2dSpriteVisibleFlag
    ldrb r0, [r4, #1]
    cmp r0, #1
    ldr r0, [r4, #0x10]
    bne _02202B32
    mov r1, #0
    bl Set2dSpriteAnimActiveFlag
    add r1, r5, r7
    add r1, #0x2a
    ldrb r1, [r1]
    ldr r0, [r4, #0x10]
    bl sub_020249D4
    b _02202B38
_02202B32:
    mov r1, #1
    bl Set2dSpriteAnimActiveFlag
_02202B38:
    add r0, r6, #3
    lsl r0, r0, #2
    add r1, r5, r0
    mov r0, #0x59
    lsl r0, r0, #2
    ldr r0, [r1, r0]
    add r1, r5, r7
    add r1, #0x2a
    ldrb r1, [r1]
    bl sub_020249D4
    add sp, #0x28
    pop {r3, r4, r5, r6, r7, pc}
    nop
_02202B54: DCD ov17_02203EA8
}

void ov17_02202B58(UnkData_ov17 *a0, u8 index) {
    UnkData_ov17_sub *unk = &a0->unk20[index];
    BerryPots_ResetPotMoisture(a0->berryPots, index);
    ov17_0220387C(a0);
    sub_020249D4(a0->unk164[index + 3], 2);
    if (unk->growthStage == 1) {
        sub_020249D4(unk->soilSpriteMaybe, unk->soilStateMaybe);
    }
}

void ov17_02202B98(UnkData_ov17 *a0) {
    UnkData_ov17_sub *unk = &a0->unk20[a0->unk7C];
    ov16_02201674(a0->berryPots, a0->unk7C);
    Bag_AddItem(a0->bag, BerryIdToItemId(unk->berryId), unk->quantityOrYieldMaybe, a0->heapId);
    ov17_0220387C(a0);
    Sprite_Delete(unk->soilSpriteMaybe);
    unk->soilSpriteMaybe = NULL;
    sub_020249D4(a0->unk164[a0->unk7C + 3], 2);
    GameStats_AddSpecial(a0->stats, 0);
}

void ov17_02202BF8(UnkData_ov17 *a0) {
    if (a0->unk130 != NULL) {
        sub_0200D034();
    }
    NNS_GfdDoVramTransfer();
    DoScheduledBgGpuUpdates(a0->bgConfig);
    OS_SetIrqCheckFlag(OS_IE_VBLANK);
}

extern GraphicsBanks ov17_02203ED0;

void ov17_02202C2C(void);
void ov17_02202C2C(void) {
    GraphicsBanks banks = ov17_02203ED0;
    GX_SetBanks(&banks);
}

extern GraphicsModes ov17_02203D88;
extern BgTemplate ov17_02203DDC;
extern BgTemplate ov17_02203DF8;
extern BgTemplate ov17_02203E14;
extern BgTemplate ov17_02203E30;
extern BgTemplate ov17_02203E4C;

void ov17_02202C4C(UnkData_ov17 *a0) {
    ov17_02202C2C();
    a0->bgConfig = BgConfig_Alloc(a0->heapId);

    GraphicsModes sp1c = ov17_02203D88;
    SetBothScreensModesAndDisable(&sp1c);

    GX_SetDispSelect(GX_DISP_SELECT_SUB_MAIN);

    BgTemplate sp38 = ov17_02203E30;
    InitBgFromTemplate(a0->bgConfig, 4, &sp38, 0);
    BgClearTilemapBufferAndCommit(a0->bgConfig, 4);

    BgTemplate sp54 = ov17_02203DDC;
    InitBgFromTemplate(a0->bgConfig, 7, &sp54, 0);
    BgClearTilemapBufferAndCommit(a0->bgConfig, 7);

    BgTemplate sp70 = ov17_02203DF8;
    InitBgFromTemplate(a0->bgConfig, 0, &sp70, 0);
    BgClearTilemapBufferAndCommit(a0->bgConfig, 0);

    BgTemplate sp8C = ov17_02203E14;
    InitBgFromTemplate(a0->bgConfig, 2, &sp8C, 0);
    BgClearTilemapBufferAndCommit(a0->bgConfig, 2);

    BgTemplate spA8 = ov17_02203E4C;
    InitBgFromTemplate(a0->bgConfig, 3, &spA8, 0);
    BgClearTilemapBufferAndCommit(a0->bgConfig, 3);

    BG_ClearCharDataRange(4, 0x20, 0, a0->heapId);
    BG_ClearCharDataRange(7, 0x20, 0, a0->heapId);
    BG_ClearCharDataRange(0, 0x20, 0, a0->heapId);
    BG_ClearCharDataRange(2, 0x20, 0, a0->heapId);
    BG_ClearCharDataRange(3, 0x40, 0, a0->heapId);
}

void ov17_02202DD0(UnkData_ov17 *a0) {
    FreeBgTilemapBuffer(a0->bgConfig, 3);
    FreeBgTilemapBuffer(a0->bgConfig, 2);
    FreeBgTilemapBuffer(a0->bgConfig, 0);
    FreeBgTilemapBuffer(a0->bgConfig, 7);
    FreeBgTilemapBuffer(a0->bgConfig, 4);
    FreeToHeap(a0->bgConfig);

    GX_SetDispSelect(GX_DISP_SELECT_MAIN_SUB);
}

void ov17_02202E28(UnkData_ov17 *a0) {
    NARC *narc = NARC_New(NARC_a_2_1_6, a0->heapId);

    GfGfxLoader_GXLoadPalFromOpenNarc(narc, 3, GF_BG_LYR_MAIN_0, 0x0, 0, a0->heapId);
    GfGfxLoader_LoadCharDataFromOpenNarc(narc, 4, a0->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, FALSE, a0->heapId);
    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, 5, a0->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, FALSE, a0->heapId);
    GfGfxLoader_GXLoadPalFromOpenNarc(narc, 0, GF_BG_LYR_SUB_0, 0x0, 0, a0->heapId);
    GfGfxLoader_LoadCharDataFromOpenNarc(narc, 1, a0->bgConfig, GF_BG_LYR_SUB_3, 0, 0, FALSE, a0->heapId);
    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, 2, a0->bgConfig, GF_BG_LYR_SUB_3, 0, 0, FALSE, a0->heapId);

    a0->berryPotsAppNarc = narc;

    LoadUserFrameGfx2(a0->bgConfig, GF_BG_LYR_MAIN_0, 1, 13, a0->frame, a0->heapId);
    LoadFontPal1(GF_BG_LYR_MAIN_0, 0x180, a0->heapId);
}

void ov17_02202EFC(UnkData_ov17 *a0) {
    NARC_Delete(a0->berryPotsAppNarc);
}

void ov17_02202F0C(UnkData_ov17 *a0) {
    FontID_Alloc(4, a0->heapId);

    a0->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0248_bin, a0->heapId);
    a0->msgFmt = MessageFormat_New_Custom(16, 16, a0->heapId);
    a0->unkA4 = String_New(128, a0->heapId);
    a0->unkA8 = NewString_ReadMsgData(a0->msgData, msg_0248_00000);

    for (int i = 0; i < 17; i++) {
        a0->unkB0[i] = NewString_ReadMsgData(a0->msgData, msg_0248_00006 + i);
    }
}

void ov17_02202F7C(UnkData_ov17 *a0) {
    for (int i = 0; i < 17; i++) {
        String_Delete(a0->unkB0[i]);
    }
    String_Delete(a0->unkA8);
    String_Delete(a0->unkA4);

    MessageFormat_Delete(a0->msgFmt);
    DestroyMsgData(a0->msgData);

    FontID_Release(4);
}

extern WindowTemplate ov17_02203DC4[3];

void ov17_02202FC4(UnkData_ov17 *a0) {
    for (int i = 0; i < 3; i++) {
        AddWindow(a0->bgConfig, &a0->unkFC[i], &ov17_02203DC4[i]);
        FillWindowPixelBuffer(&a0->unkFC[i], 0x0);
    }

    a0->unk12C = sub_0201660C(a0->heapId);
}

void ov17_02203004(UnkData_ov17 *a0) {
    for (int i = 0; i < 3; i++) {
        ClearWindowTilemapAndCopyToVram(&a0->unkFC[i]);
        RemoveWindow(&a0->unkFC[i]);
    }

    sub_02016624(a0->unk12C);
}

asm void ov17_02203030(UnkData_ov17 *a0) {
    push {r3, r4, r5, r6, r7, lr}
    add r7, r0, #0
    mov r0, #0
    ldr r5, [pc, #0x48] // _02203080 ; =ov17_02203E88
    str r0, [sp]
    add r6, r7, #0
_0220303C:
    ldr r0, [r5, #0]
    ldr r1, [r7, #0]
    bl ListMenuItems_New
    mov r1, #0x66
    lsl r1, r1, #2
    str r0, [r6, r1]
    ldr r0, [r5, #0]
    mov r4, #0
    cmp r0, #0
    ble _02203070
_02203052:
    ldr r2, [r5, #4]
    mov r0, #0x66
    add r1, r7, #0
    lsl r0, r0, #2
    add r1, #0x9c
    ldrb r2, [r2, r4]
    ldr r0, [r6, r0]
    ldr r1, [r1, #0]
    add r3, r4, #0
    bl ListMenuItems_AppendFromMsgData
    ldr r0, [r5, #0]
    add r4, r4, #1
    cmp r4, r0
    blt _02203052
_02203070:
    ldr r0, [sp, #0]
    add r5, #8
    add r0, r0, #1
    add r6, r6, #4
    str r0, [sp]
    cmp r0, #4
    blt _0220303C
    pop {r3, r4, r5, r6, r7, pc}
_02203080: DCD ov17_02203E88
}

void ov17_02203084(UnkData_ov17 *a0) {
    for (int i = 0; i < 4; i++) {
        ListMenuItems_Delete(a0->unk198[i]);
        a0->unk198[i] = NULL;
    }
}

extern u8 ov17_02203E68;
extern u8 ov17_02203D98;
extern u8 ov17_02203D78;
extern u8 ov17_02203DAC;

void ov17_022030A8(UnkData_ov17 *a0);
asm void ov17_022030A8(UnkData_ov17 *a0) {
    push {r3, r4, r5, lr}
    sub sp, #0x28
    add r4, r0, #0
    ldr r1, [r4, #0]
    mov r0, #0x20
    bl GF_CreateVramTransferManager
    ldr r0, [r4, #0]
    bl sub_0200CF18
    mov r1, #0x13
    lsl r1, r1, #4
    str r0, [r4, r1]
    ldr r0, [r4, r1]
    ldr r1, [pc, #0x144] // _0220320C ; =ov17_02203E68
    ldr r2, [pc, #0x148] // _02203210 ; =ov17_02203D98
    mov r3, #8
    bl sub_0200CF70
    ldr r0, [r4, #0]
    bl sub_0200B2E0
    ldr r0, [r4, #0]
    bl sub_0200B2E8
    mov r0, #0x13
    lsl r0, r0, #4
    ldr r0, [r4, r0]
    bl sub_0200CF38
    mov r1, #0x4d
    lsl r1, r1, #2
    str r0, [r4, r1]
    sub r0, r1, #4
    ldr r0, [r4, r0]
    ldr r1, [r4, r1]
    mov r2, #0x19
    bl sub_0200CFF4
    mov r3, #0
    mov r1, #0x13
    str r3, [sp]
    lsl r1, r1, #4
    ldr r0, [r4, r1]
    add r1, r1, #4
    ldr r1, [r4, r1]
    ldr r2, [pc, #0x10c] // _02203214 ; =ov17_02203D78
    bl sub_0200D2A4
    ldr r1, [r4, #0]
    mov r0, #0x12
    bl NARC_New
    mov r2, #0x19
    lsl r2, r2, #4
    str r0, [r4, r2]
    ldr r5, [pc, #0xfc] // _02203218 ; =ov17_02203DAC
    add r3, sp, #0x10
    ldmia r5!, {r0, r1}
    stmia r3!, {r0, r1}
    ldmia r5!, {r0, r1}
    stmia r3!, {r0, r1}
    ldmia r5!, {r0, r1}
    sub r2, #0x60
    stmia r3!, {r0, r1}
    ldr r0, [r4, r2]
    bl sub_0200CF38
    mov r1, #0x4e
    lsl r1, r1, #2
    str r0, [r4, r1]
    add r0, r1, #0
    sub r0, #8
    ldr r0, [r4, r0]
    ldr r1, [r4, r1]
    add r2, sp, #0x10
    bl sub_0200D3F8
    mov r0, #0x4d
    lsl r0, r0, #2
    ldr r0, [r4, r0]
    bl sub_0200E2B0
    add r1, r0, #0
    mov r0, #0x4e
    lsl r0, r0, #2
    ldr r0, [r4, r0]
    bl sub_0200E2B4
    mov r0, #0x95
    mov r1, #1
    bl GetItemIndexMapping
    add r3, r0, #0
    mov r0, #0
    str r0, [sp]
    mov r0, #1
    mov r2, #0x13
    str r0, [sp, #4]
    mov r0, #0xfa
    lsl r2, r2, #4
    lsl r0, r0, #4
    add r1, r2, #0
    str r0, [sp, #8]
    ldr r0, [r4, r2]
    add r1, #8
    add r2, #0x60
    ldr r1, [r4, r1]
    ldr r2, [r4, r2]
    bl sub_0200D504
    mov r0, #0x95
    mov r1, #2
    bl GetItemIndexMapping
    add r3, r0, #0
    mov r0, #0
    str r0, [sp]
    mov r0, #1
    str r0, [sp, #4]
    mov r2, #0x13
    str r0, [sp, #8]
    mov r0, #0xfa
    lsl r2, r2, #4
    lsl r0, r0, #4
    add r1, r2, #0
    str r0, [sp, #0xc]
    ldr r0, [r4, r2]
    add r1, #8
    add r2, #0x60
    ldr r1, [r4, r1]
    ldr r2, [r4, r2]
    bl sub_0200D5D4
    bl GetItemIconCell
    add r3, r0, #0
    mov r0, #0
    mov r2, #0x13
    str r0, [sp]
    mov r0, #0xfa
    lsl r2, r2, #4
    lsl r0, r0, #4
    add r1, r2, #0
    str r0, [sp, #4]
    ldr r0, [r4, r2]
    add r1, #8
    add r2, #0x60
    ldr r1, [r4, r1]
    ldr r2, [r4, r2]
    bl sub_0200D6EC
    bl GetItemIconAnim
    add r3, r0, #0
    mov r0, #0
    mov r2, #0x13
    str r0, [sp]
    mov r0, #0xfa
    lsl r2, r2, #4
    lsl r0, r0, #4
    add r1, r2, #0
    str r0, [sp, #4]
    ldr r0, [r4, r2]
    add r1, #8
    add r2, #0x60
    ldr r1, [r4, r1]
    ldr r2, [r4, r2]
    bl sub_0200D71C
    ldr r0, [r4, #0]
    mov r1, #0
    bl sub_02018424
    add r4, #0x8c
    str r0, [r4]
    add sp, #0x28
    pop {r3, r4, r5, pc}
_0220320C: DCD ov17_02203E68
_02203210: DCD ov17_02203D98
_02203214: DCD ov17_02203D78
_02203218: DCD ov17_02203DAC
}

void ov17_0220321C(UnkData_ov17 *a0);
asm void ov17_0220321C(UnkData_ov17 *a0) {
    push {r4, lr}
    add r4, r0, #0
    add r0, #0x8c
    ldr r0, [r0, #0]
    bl sub_02018474
    mov r0, #0x19
    lsl r0, r0, #4
    ldr r0, [r4, r0]
    bl NARC_Delete
    mov r1, #0x13
    lsl r1, r1, #4
    ldr r0, [r4, r1]
    add r1, #8
    ldr r1, [r4, r1]
    bl sub_0200D998
    mov r1, #0x13
    lsl r1, r1, #4
    ldr r0, [r4, r1]
    add r1, r1, #4
    ldr r1, [r4, r1]
    bl sub_0200D0E4
    mov r1, #0x4e
    lsl r1, r1, #2
    mov r2, #0
    str r2, [r4, r1]
    sub r0, r1, #4
    sub r1, #8
    str r2, [r4, r0]
    ldr r0, [r4, r1]
    bl sub_0200D108
    mov r0, #0x13
    mov r1, #0
    lsl r0, r0, #4
    str r1, [r4, r0]
    bl GF_DestroyVramTransferManager
    ldr r0, [r4, #0]
    bl sub_0200B2E0
    pop {r4, pc}
}

void ov17_02203278(UnkData_ov17 *a0) {
    ov17_022030A8(a0);
    ov17_022032AC(a0);
    GX_EngineAToggleLayers(16, GX_LAYER_TOGGLE_ON);
}

void ov17_02203290(UnkData_ov17 *a0) {
    GX_EngineAToggleLayers(16, GX_LAYER_TOGGLE_OFF);
    ov17_022033E4(a0);
    ov17_0220321C(a0);
}

extern u8 ov17_02203EF8;
extern u8 ov17_02203F48;
extern u8 ov17_02203F70;
extern u8 ov17_02203F98;

asm void ov17_022032AC(UnkData_ov17 *a0) {
    push {r3, r4, r5, r6, r7, lr}
    add r4, r0, #0
    ldr r6, [pc, #0x120] // _022033D4 ; =ov17_02203EF8
    mov r7, #0
    add r5, r4, #0
_022032B6:
    mov r0, #0x13
    mov r1, #0x4d
    lsl r0, r0, #4
    lsl r1, r1, #2
    ldr r0, [r4, r0]
    ldr r1, [r4, r1]
    add r2, r6, #0
    bl sub_0200D2B4
    mov r1, #0x59
    lsl r1, r1, #2
    str r0, [r5, r1]
    add r0, r1, #0
    ldr r0, [r5, r0]
    mov r1, #1
    bl Set2dSpriteVisibleFlag
    mov r0, #0x59
    lsl r0, r0, #2
    ldr r0, [r5, r0]
    mov r1, #1
    bl Set2dSpriteAnimActiveFlag
    add r7, r7, #1
    add r6, #0x28
    add r5, r5, #4
    cmp r7, #1
    ble _022032B6
    mov r1, #0x13
    lsl r1, r1, #4
    ldr r0, [r4, r1]
    add r1, r1, #4
    ldr r1, [r4, r1]
    ldr r2, [pc, #0xdc] // _022033D8 ; =ov17_02203F48
    bl sub_0200D2B4
    mov r1, #0x5b
    lsl r1, r1, #2
    str r0, [r4, r1]
    ldr r0, [r4, r1]
    mov r1, #0
    bl Set2dSpriteVisibleFlag
    mov r0, #0x5b
    lsl r0, r0, #2
    ldr r0, [r4, r0]
    mov r1, #0
    bl Set2dSpriteAnimActiveFlag
    mov r6, #0
    add r7, r6, #0
    str r4, [sp]
_0220331E:
    add r0, r6, #3
    lsl r0, r0, #0x18
    lsr r0, r0, #0x16
    add r5, r4, r0
    mov r0, #0x13
    mov r1, #0x4d
    lsl r0, r0, #4
    lsl r1, r1, #2
    ldr r0, [r4, r0]
    ldr r1, [r4, r1]
    ldr r2, [pc, #0xa8] // _022033DC ; =ov17_02203F70
    bl sub_0200D2B4
    mov r1, #0x59
    lsl r1, r1, #2
    str r0, [r5, r1]
    add r0, r1, #0
    add r1, r7, #0
    add r1, #0x1b
    lsl r1, r1, #0x10
    ldr r0, [r5, r0]
    asr r1, r1, #0x10
    mov r2, #0x63
    bl sub_0200DD88
    ldr r1, [sp]
    mov r0, #0x59
    add r1, #0x2a
    lsl r0, r0, #2
    ldrb r1, [r1]
    ldr r0, [r5, r0]
    bl sub_020249D4
    mov r0, #0x59
    lsl r0, r0, #2
    ldr r0, [r5, r0]
    mov r1, #1
    bl Set2dSpriteVisibleFlag
    mov r0, #0x59
    lsl r0, r0, #2
    ldr r0, [r5, r0]
    mov r1, #0
    bl Set2dSpriteAnimActiveFlag
    add r0, r6, #7
    lsl r0, r0, #0x18
    lsr r0, r0, #0x16
    add r5, r4, r0
    mov r0, #0x13
    mov r1, #0x4d
    lsl r0, r0, #4
    lsl r1, r1, #2
    ldr r0, [r4, r0]
    ldr r1, [r4, r1]
    ldr r2, [pc, #0x50] // _022033E0 ; =ov17_02203F98
    bl sub_0200D2B4
    mov r1, #0x59
    lsl r1, r1, #2
    str r0, [r5, r1]
    add r0, r1, #0
    add r1, r7, #0
    add r1, #0x1b
    lsl r1, r1, #0x10
    ldr r0, [r5, r0]
    asr r1, r1, #0x10
    mov r2, #0x58
    bl sub_0200DD88
    mov r0, #0x59
    lsl r0, r0, #2
    ldr r0, [r5, r0]
    mov r1, #0
    bl Set2dSpriteVisibleFlag
    mov r0, #0x59
    lsl r0, r0, #2
    ldr r0, [r5, r0]
    mov r1, #1
    bl Set2dSpriteAnimActiveFlag
    ldr r0, [sp, #0]
    add r6, r6, #1
    add r0, #0x14
    add r7, #0x1b
    str r0, [sp]
    cmp r6, #4
    blt _0220331E
    pop {r3, r4, r5, r6, r7, pc}
    nop
_022033D4: DCD ov17_02203EF8
_022033D8: DCD ov17_02203F48
_022033DC: DCD ov17_02203F70
_022033E0: DCD ov17_02203F98
}

void ov17_022033E4(UnkData_ov17 *a0) {
    for (int i = 0; i < 11; i++) {
        if (a0->unk164[i] != NULL) {
            Sprite_Delete(a0->unk164[i]);
        }
    }
}

asm void ov17_02203404(UnkData_ov17 *a0, u32 a1) {
    push {r4, r5, r6, lr}
    sub sp, #8
    add r5, r0, #0
    add r6, r1, #0
    mov r0, #0x14
    mul r0, r6
    add r0, r5, r0
    add r0, #0x20
    ldrb r4, [r0]
    cmp r4, #0
    beq _02203420
    sub r0, r4, #1
    lsl r0, r0, #0x18
    lsr r4, r0, #0x18
_02203420:
    mov r0, #0
    mov r2, #0x13
    str r0, [sp]
    add r0, r6, #1
    lsl r2, r2, #4
    str r0, [sp, #4]
    add r1, r2, #4
    ldr r0, [r5, r2]
    add r2, #0x64
    add r3, r4, #0
    ldr r1, [r5, r1]
    ldr r2, [r5, r2]
    add r3, #0x4c
    bl sub_0200E2B8
    mov r0, #0
    mov r2, #0x13
    str r0, [sp]
    add r0, r6, #1
    lsl r2, r2, #4
    str r0, [sp, #4]
    add r1, r2, #4
    ldr r0, [r5, r2]
    add r2, #0x64
    add r4, #0xc
    ldr r1, [r5, r1]
    ldr r2, [r5, r2]
    add r3, r4, #0
    bl sub_0200E2EC
    add sp, #8
    pop {r4, r5, r6, pc}
}

asm void ov17_02203460(UnkData_ov17 *a0, u8 a1) {
    push {r3, r4, r5, lr}
    sub sp, #8
    add r5, r0, #0
    mov r0, #0x14
    mul r0, r1
    add r0, r5, r0
    add r0, #0x20
    ldrb r0, [r0]
    bl BerryIdToItemId
    mov r1, #1
    add r4, r0, #0
    bl GetItemIndexMapping
    add r3, r0, #0
    mov r0, #0
    mov r2, #0x13
    str r0, [sp]
    mov r0, #0xfa
    lsl r2, r2, #4
    lsl r0, r0, #4
    add r1, r2, #0
    str r0, [sp, #4]
    ldr r0, [r5, r2]
    add r1, #8
    add r2, #0x60
    ldr r1, [r5, r1]
    ldr r2, [r5, r2]
    bl sub_0200E2B8
    add r0, r4, #0
    mov r1, #2
    bl GetItemIndexMapping
    add r3, r0, #0
    mov r0, #0
    mov r2, #0x13
    str r0, [sp]
    mov r0, #0xfa
    lsl r2, r2, #4
    lsl r0, r0, #4
    add r1, r2, #0
    str r0, [sp, #4]
    ldr r0, [r5, r2]
    add r1, #8
    add r2, #0x60
    ldr r1, [r5, r1]
    ldr r2, [r5, r2]
    bl sub_0200E2EC
    add sp, #8
    pop {r3, r4, r5, pc}
}

void ov17_022034C8(void*, u16, u16, u8);
asm void ov17_022034C8(void*, u16, u16, u8) {
    push {r3, r4, r5, r6, lr}
    sub sp, #0x34
    add r5, r0, #0
    add r4, r1, #0
    add r6, r2, #0
    add r0, sp, #0
    mov r1, #0
    mov r2, #0x34
    bl MI_CpuFill8
    add r0, sp, #0
    strh r4, [r0]
    strh r6, [r0, #2]
    mov r1, #0
    strh r1, [r0, #4]
    strh r1, [r0, #6]
    mov r0, #2
    str r0, [sp, #0x2c]
    mov r0, #0xfa
    lsl r0, r0, #4
    str r1, [sp, #0xc]
    str r1, [sp, #0x30]
    mov r1, #1
    str r1, [sp, #0x10]
    str r0, [sp, #0x14]
    str r0, [sp, #0x18]
    str r0, [sp, #0x1c]
    str r0, [sp, #0x20]
    sub r0, r1, #2
    mov r1, #0x13
    lsl r1, r1, #4
    str r0, [sp, #0x24]
    str r0, [sp, #0x28]
    ldr r0, [r5, r1]
    add r1, #8
    ldr r1, [r5, r1]
    add r2, sp, #0
    bl sub_0200D734
    add sp, #0x34
    pop {r3, r4, r5, r6, pc}
}

extern void ov17_022035A4(SysTask*, void*);

asm void ov17_0220351C(UnkData_ov17 *a0) {
    push {r3, r4, r5, lr}
    add r5, r0, #0
    ldr r0, [r5, #0]
    mov r1, #0xc
    bl AllocFromHeap
    mov r1, #0
    mov r2, #0xc
    add r4, r0, #0
    bl MI_CpuFill8
    add r0, r5, #0
    str r5, [r4]
    add r0, #0x80
    ldrb r0, [r0]
    strb r0, [r4, #6]
    add r0, r5, #0
    add r0, #0x81
    ldrb r0, [r0]
    strb r0, [r4, #7]
    add r0, r5, #0
    add r0, #0x81
    ldrb r1, [r0]
    add r0, r5, #0
    add r0, #0x80
    ldrb r0, [r0]
    sub r0, r1, r0
    lsl r0, r0, #0x18
    asr r1, r0, #0x18
    cmp r1, #0
    ble _02203560
    mov r0, #1
    strb r0, [r4, #9]
    b _0220356C
_02203560:
    mov r0, #0
    mvn r0, r0
    strb r0, [r4, #9]
    neg r0, r1
    lsl r0, r0, #0x18
    asr r1, r0, #0x18
_0220356C:
    mov r0, #0x1b
    mul r0, r1
    lsl r0, r0, #0x18
    asr r1, r0, #0x18
    asr r0, r1, #1
    lsr r0, r0, #0x1e
    add r0, r1, r0
    asr r0, r0, #2
    strb r0, [r4, #8]
    add r0, r5, #0
    add r0, #0x80
    ldrb r0, [r0]
    add r1, r4, #0
    mov r2, #0
    strb r0, [r4, #0xa]
    ldr r0, [pc, #0x14] // _022035A0 ; =ov17_022035A4
    bl CreateSysTask
    add r0, r5, #0
    add r0, #0x7d
    ldrb r0, [r0]
    add r5, #0x7d
    add r0, r0, #1
    strb r0, [r5]
    pop {r3, r4, r5, pc}
    nop
_022035A0: DCD ov17_022035A4
}

extern _s32_div_f();

asm void ov17_022035A4(SysTask*, void*) {
    push {r3, r4, r5, r6, r7, lr}
    add r5, r1, #0
    mov r1, #9
    ldrsb r1, [r5, r1]
    add r7, r0, #0
    mov r0, #0x5b
    lsl r1, r1, #0x12
    ldr r4, [r5, #0]
    lsl r0, r0, #2
    ldr r0, [r4, r0]
    asr r1, r1, #0x10
    mov r2, #0
    bl sub_0200DEA0
    mov r0, #0x5b
    lsl r0, r0, #2
    add r1, sp, #0
    ldr r0, [r4, r0]
    add r1, #2
    add r2, sp, #0
    bl sub_0200DE00
    add r1, sp, #0
    mov r0, #2
    ldrsh r0, [r1, r0]
    mov r1, #0x1b
    sub r0, #0x1f
    bl _s32_div_f
    lsl r0, r0, #0x18
    lsr r6, r0, #0x18
    ldrb r0, [r5, #0xa]
    cmp r6, r0
    beq _022035F8
    ldrb r0, [r5, #7]
    cmp r6, r0
    beq _022035F8
    add r0, r4, #0
    add r1, r6, #0
    bl ov17_02202B58
    strb r6, [r5, #0xa]
_022035F8:
    ldrb r0, [r5, #8]
    sub r0, r0, #1
    strb r0, [r5, #8]
    ldrb r0, [r5, #8]
    cmp r0, #0
    bne _02203634
    ldrb r2, [r5, #7]
    mov r1, #0x1b
    mov r0, #0x5b
    mul r1, r2
    lsl r0, r0, #2
    add r1, #0x1f
    lsl r1, r1, #0x10
    ldr r0, [r4, r0]
    asr r1, r1, #0x10
    mov r2, #0x38
    bl sub_0200DD88
    add r0, r4, #0
    add r0, #0x7d
    ldrb r0, [r0]
    add r4, #0x7d
    sub r0, r0, #1
    strb r0, [r4]
    add r0, r5, #0
    bl FreeToHeap
    add r0, r7, #0
    bl DestroySysTask
_02203634:
    pop {r3, r4, r5, r6, r7, pc}
}

extern void ov17_02203674(SysTask*, void*);

asm void ov17_02203638(UnkData_ov17 *a0) {
    push {r3, r4, r5, lr}
    add r5, r0, #0
    ldr r0, [r5, #0]
    mov r1, #0xc
    bl AllocFromHeap
    mov r1, #0
    mov r2, #0xc
    add r4, r0, #0
    bl MI_CpuFill8
    add r0, r5, #0
    str r5, [r4]
    add r0, #0x7c
    ldrb r0, [r0]
    add r1, r4, #0
    mov r2, #0
    strb r0, [r4, #6]
    ldr r0, [pc, #0x10] // _02203670 ; =ov17_02203674
    bl CreateSysTask
    add r0, r5, #0
    add r0, #0x7d
    ldrb r0, [r0]
    add r5, #0x7d
    add r0, r0, #1
    strb r0, [r5]
    pop {r3, r4, r5, pc}
_02203670: DCD ov17_02203674
}

asm void ov17_02203674(SysTask*, void*) {
    push {r4, r5, r6, lr}
    add r5, r1, #0
    add r6, r0, #0
    ldrb r0, [r5, #4]
    ldr r4, [r5, #0]
    cmp r0, #0
    beq _0220368C
    cmp r0, #1
    beq _022036BA
    cmp r0, #2
    beq _022036D6
    pop {r4, r5, r6, pc}
_0220368C:
    add r0, r4, #0
    add r4, #0x7e
    ldrb r3, [r4]
    ldrb r2, [r5, #6]
    mov r1, #0x1b
    add r3, r3, #2
    mul r1, r2
    add r1, #0x23
    lsl r1, r1, #0x10
    lsl r3, r3, #0x18
    asr r1, r1, #0x10
    mov r2, #0x50
    lsr r3, r3, #0x18
    bl ov17_022034C8
    str r0, [r5, #8]
    ldr r0, [pc, #0x48] // _022036F8 ; =0x000005DD
    bl PlaySE
    ldrb r0, [r5, #4]
    add r0, r0, #1
    strb r0, [r5, #4]
    pop {r4, r5, r6, pc}
_022036BA:
    mov r1, #2
    ldr r0, [r5, #8]
    sub r2, r1, #4
    bl sub_0200DED0
    ldrb r1, [r5, #5]
    add r0, r1, #1
    strb r0, [r5, #5]
    cmp r1, #8
    blo _022036F4
    ldrb r0, [r5, #4]
    add r0, r0, #1
    strb r0, [r5, #4]
    pop {r4, r5, r6, pc}
_022036D6:
    ldr r0, [r5, #8]
    bl sub_0200D9DC
    add r0, r4, #0
    add r0, #0x7d
    ldrb r0, [r0]
    add r4, #0x7d
    sub r0, r0, #1
    strb r0, [r4]
    add r0, r5, #0
    bl FreeToHeap
    add r0, r6, #0
    bl DestroySysTask
_022036F4:
    pop {r4, r5, r6, pc}
    nop
_022036F8: DCD 0x000005DD
}

void ov17_022036FC(UnkData_ov17 *a0, u32 a1, u8 a2) {
    UnkData_ov17_sub *unk = &a0->unk20[a2];

    switch (a1) {
        case 5:
        case 11:
            BufferItemName(a0->msgFmt, 2, MulchIdToItemId(unk->mulch));
            break;
        case 10:
        case 14:
            BufferIntegerAsString(a0->msgFmt, 1, unk->quantityOrYieldMaybe, 2, PRINTING_MODE_LEFT_ALIGN, 0);
            // fallthrough
        case 6:
        case 7:
        case 8:
        case 9:
        case 12:
        case 15:
        case 16: {
            String* str = GetNutName(unk->berryId, a0->heapId);
            BufferString(a0->msgFmt, 0, str, 0, 0, 2);
            String_Delete(str);
            break;
        }
        default:
            String_Copy(a0->unkA4, a0->unkB0[a1]);
            return;
    }

    StringExpandPlaceholders(a0->msgFmt, a0->unkA4, a0->unkB0[a1]);
}

extern void ov17_02203928(UnkData_ov17*);
extern _ll_sdiv();

asm void ov17_022037C8(UnkData_ov17 *a0, BOOL a1) {
    push {r3, r4, r5, r6, r7, lr}
    sub sp, #0x48
    add r4, r0, #0
    add r7, r1, #0
    add r0, sp, #0x38
    add r1, sp, #0x1c
    bl GF_RTC_CopyDateTime
    add r0, sp, #0x38
    add r1, sp, #0x1c
    bl RTC_ConvertDateTimeToSecond
    add r5, r0, #0
    add r6, r1, #0
    ldr r0, [r4, #0x18]
    add r1, sp, #0x28
    add r2, sp, #0x10
    bl ov16_02201820
    add r0, sp, #0x28
    add r1, sp, #0x10
    bl RTC_ConvertDateTimeToSecond
    sub r2, r5, r0
    mov ip, r6
    mov r2, ip
    sbc r2, r1
    bge _02203828
    add r2, sp, #0x1c
    ldmia r2!, {r0, r1}
    add r3, sp, #4
    stmia r3!, {r0, r1}
    ldr r0, [r2, #0]
    mov r5, sp
    sub r5, #0xc
    str r0, [r3]
    add r3, sp, #0x38
    add r2, r5, #0
    ldmia r3!, {r0, r1}
    stmia r2!, {r0, r1}
    ldmia r3!, {r0, r1}
    stmia r2!, {r0, r1}
    ldr r0, [r4, #0x18]
    ldmia r5!, {r1, r2, r3}
    bl ov16_022017FC
    add sp, #0x48
    pop {r3, r4, r5, r6, r7, pc}
_02203828:
    sub r0, r5, r0
    sbc r6, r1
    add r1, r6, #0
    mov r2, #0x3c
    mov r3, #0
    bl _ll_sdiv
    add r2, r0, #0
    beq _02203876
    ldr r0, [r4, #0x14]
    ldr r1, [r4, #0x1c]
    bl ov16_02201760
    add r0, r4, #0
    bl ov17_0220387C
    add r2, sp, #0x1c
    mov r5, sp
    ldmia r2!, {r0, r1}
    add r3, sp, #4
    stmia r3!, {r0, r1}
    ldr r0, [r2, #0]
    sub r5, #0xc
    str r0, [r3]
    add r3, sp, #0x38
    add r2, r5, #0
    ldmia r3!, {r0, r1}
    stmia r2!, {r0, r1}
    ldmia r3!, {r0, r1}
    stmia r2!, {r0, r1}
    ldr r0, [r4, #0x18]
    ldmia r5!, {r1, r2, r3}
    bl ov16_022017FC
    cmp r7, #0
    beq _02203876
    add r0, r4, #0
    bl ov17_02203928
_02203876:
    add sp, #0x48
    pop {r3, r4, r5, r6, r7, pc}
}

void ov17_0220387C(UnkData_ov17 *a0) {
    for (int i = 0; i < 4; i++) {
        a0->unk20[i].unkB = a0->unk20[i].berryId;
        a0->unk20[i].unkC = a0->unk20[i].growthStage;
        a0->unk20[i].unkD = a0->unk20[i].soilStateMaybe;

        a0->unk20[i].berryId = BerryPots_GetPotBerryId(a0->berryPots, i);
        a0->unk20[i].growthStage = BerryPots_GetPotGrowthStage(a0->berryPots, i);
        a0->unk20[i].unk2 = ov16_022015EC(a0->berryPots, i);
        a0->unk20[i].moisture = BerryPots_GetPotMoisture(a0->berryPots, i);
        a0->unk20[i].mulch = BerryPots_GetPotMulch(a0->berryPots, i);
        a0->unk20[i].quantityOrYieldMaybe = ov16_02201668(a0->berryPots, i);
        a0->unk20[i].unk6 = ov16_022015F8(a0->berryPots, i);
        a0->unk20[i].unk8 = ov16_02201604(a0->berryPots, i);
        a0->unk20[i].soilStateMaybe = ov16_022015C4(a0->berryPots, i);
    }
}

extern void ov17_022039A0(SysTask*, void*);

asm void ov17_02203928(UnkData_ov17*) {
    push {r3, r4, r5, r6, r7, lr}
    sub sp, #8
    add r4, r0, #0
    add r7, r0, #0
    str r0, [sp]
    mov r6, #0
    add r4, #0x20
    add r5, r0, #0
    add r7, #0x7d
_0220393A:
    ldrb r1, [r4, #0xa]
    ldrb r0, [r4, #0xd]
    cmp r1, r0
    beq _0220395A
    mov r0, #0x17
    lsl r0, r0, #4
    ldr r0, [r5, r0]
    bl sub_020249D4
    ldrb r0, [r4, #1]
    cmp r0, #1
    bne _0220395A
    ldrb r1, [r4, #0xa]
    ldr r0, [r4, #0x10]
    bl sub_020249D4
_0220395A:
    ldrb r1, [r4, #1]
    ldrb r0, [r4, #0xc]
    cmp r1, r0
    beq _0220398E
    ldr r0, [sp, #0]
    mov r1, #8
    ldr r0, [r0, #0]
    bl AllocFromHeap
    str r0, [sp, #4]
    mov r1, #0
    mov r2, #8
    bl MI_CpuFill8
    ldr r1, [sp, #0]
    ldr r0, [sp, #4]
    mov r2, #0
    str r1, [r0]
    strb r6, [r0, #4]
    ldr r0, [pc, #0x18] // _0220399C ; =ov17_022039A0
    ldr r1, [sp, #4]
    bl CreateSysTask
    ldrb r0, [r7]
    add r0, r0, #1
    strb r0, [r7]
_0220398E:
    add r6, r6, #1
    add r4, #0x14
    add r5, r5, #4
    cmp r6, #4
    blt _0220393A
    add sp, #8
    pop {r3, r4, r5, r6, r7, pc}
_0220399C: DCD ov17_022039A0
}

asm void ov17_022039A0(SysTask *task, void* a1) {
    push {r4, r5, r6, lr}
    add r5, r1, #0
    add r6, r0, #0
    ldrb r0, [r5, #6]
    ldr r4, [r5, #0]
    cmp r0, #0
    beq _022039B4
    cmp r0, #1
    beq _022039D6
    pop {r4, r5, r6, pc}
_022039B4:
    ldrb r0, [r5, #4]
    add r0, r0, #7
    lsl r0, r0, #2
    add r1, r4, r0
    mov r0, #0x59
    lsl r0, r0, #2
    ldr r0, [r1, r0]
    mov r1, #1
    bl Set2dSpriteVisibleFlag
    ldr r0, [pc, #0x64] // _02203A30 ; =0x00000569
    bl PlaySE
    ldrb r0, [r5, #6]
    add r0, r0, #1
    strb r0, [r5, #6]
    pop {r4, r5, r6, pc}
_022039D6:
    ldrb r1, [r5, #5]
    add r0, r1, #1
    strb r0, [r5, #5]
    cmp r1, #0xf
    bne _022039FA
    ldrb r1, [r5, #4]
    add r0, r4, #0
    bl ov17_02202A84
    add r0, r4, #0
    add r0, #0x7c
    ldrb r1, [r0]
    ldrb r0, [r5, #4]
    cmp r1, r0
    bne _022039FA
    add r0, r4, #0
    bl ov17_022028B8
_022039FA:
    ldrb r0, [r5, #5]
    cmp r0, #0x1e
    blo _02203A2C
    ldrb r0, [r5, #4]
    add r0, r0, #7
    lsl r0, r0, #2
    add r1, r4, r0
    mov r0, #0x59
    lsl r0, r0, #2
    ldr r0, [r1, r0]
    mov r1, #0
    bl Set2dSpriteVisibleFlag
    add r0, r4, #0
    add r0, #0x7d
    ldrb r0, [r0]
    add r4, #0x7d
    sub r0, r0, #1
    strb r0, [r4]
    add r0, r5, #0
    bl FreeToHeap
    add r0, r6, #0
    bl DestroySysTask
_02203A2C:
    pop {r4, r5, r6, pc}
    nop
_02203A30: DCD 0x00000569
}

extern u32 ov17_02203AD4(UnkData_ov17*);
extern u32 ov17_02203B68(UnkData_ov17*, BOOL*);

u32 ov17_02203A34(UnkData_ov17 *a0) {
    BOOL sp10 = FALSE;
    u32 r0 = ov17_02203B68(a0, &sp10);
    if (!sp10) {
        r0 = ov17_02203AD4(a0);
    }
    return r0;
}

extern BOOL ov17_02203B88(UnkData_ov17*);
extern BOOL ov17_02203C20(UnkData_ov17*, BOOL*);

BOOL ov17_02203A54(UnkData_ov17 *a0) {
    BOOL sp10 = FALSE;
    BOOL r0 = ov17_02203C20(a0, &sp10);
    if (!sp10) {
        r0 = ov17_02203B88(a0);
    }
    return r0;
}

extern u32 ov17_02203D00(UnkData_ov17*);

u32 ov17_02203A74(UnkData_ov17 *a0, u32 a1);
u32 ov17_02203A74(UnkData_ov17 *a0, u32 a1) {
    switch (a1) {
        case 0:
        case 1:
        case 2:
        case 3:
            PlaySE(SEQ_SE_DP_SELECT);
            ov17_022028B8(a0);
            break;
        case 4:
            if (a0->unk7D == 0) {
                return ov17_02203D00(a0);
            }
            break;
        case 5:
        default:
            if (a0->unk7D == 0) {
                PlaySE(SEQ_SE_DP_SELECT);
                ov17_02202850(a0, 1);
                return 1;
            }
            break;
    }

    return 2;
}

u32 ov17_02203AD4(UnkData_ov17 *a0) {
    BOOL r3 = FALSE;

    if (gSystem.newKeys & (PAD_BUTTON_Y | PAD_BUTTON_X | PAD_KEY_DOWN | PAD_KEY_UP | PAD_KEY_LEFT | PAD_KEY_RIGHT | PAD_BUTTON_B | PAD_BUTTON_A)) {
        a0->unk74 = 0;
    }

    u32 newKeys = gSystem.newKeys;

    if (newKeys & PAD_BUTTON_B) {
        return ov17_02203A74(a0, 5);
    }

    if (newKeys & PAD_BUTTON_A) {
        return ov17_02203A74(a0, 4);
    }

    if (newKeys & PAD_KEY_LEFT) {
        a0->unk7C = (a0->unk7C + 3) % 4;
        r3 = TRUE;
    } else if (newKeys & PAD_KEY_RIGHT) {
        a0->unk7C = (a0->unk7C + 1) % 4;
        r3 = TRUE;
    }

    if (r3) {
        return ov17_02203A74(a0, a0->unk7C);
    } else {
        return 2;
    }
}

extern int ov17_02203CC8(UnkData_ov17 *a0);

u32 ov17_02203B68(UnkData_ov17 *a0, BOOL *a1) {
    int unk = ov17_02203CC8(a0);
    if (unk < 0) {
        return 2;
    }

    *a1 = TRUE;
    a0->unk74 = 1;
    return ov17_02203A74(a0, unk);
}

BOOL ov17_02203B88(UnkData_ov17 *a0) {
    BOOL unk = FALSE;

    if (a0->unk81 != 0xFF) {
        return FALSE;
    }

    if (gSystem.newKeys & (PAD_BUTTON_Y | PAD_BUTTON_X | PAD_KEY_DOWN | PAD_KEY_UP | PAD_KEY_LEFT | PAD_KEY_RIGHT | PAD_BUTTON_B | PAD_BUTTON_A)) {
        a0->unk74 = 0;
    }

    if (gSystem.newKeys & PAD_KEY_LEFT) {
        a0->unk7C = (a0->unk7C + 3) % 4;
        unk = TRUE;
    } else if (gSystem.newKeys & PAD_KEY_RIGHT) {
        a0->unk7C = (a0->unk7C + 1) % 4;
        unk = TRUE;
    }

    if (unk) {
        a0->unk81 = a0->unk7C;
        Set2dSpriteAnimActiveFlag(a0->unk164[1], FALSE);
        ov17_022028B8(a0);
        return TRUE;
    }

    return FALSE;
}

extern int ov17_02203C78(UnkData_ov17*);

BOOL ov17_02203C20(UnkData_ov17 *a0, BOOL *a1) {
    if (a0->unk81 != 0xFF) {
        return FALSE;
    }

    int unk = ov17_02203C78(a0);
    if (unk < 0 || a0->unk7C == unk) {
        return FALSE;
    }

    *a1 = TRUE;
    a0->unk74 = 1;
    a0->unk7C = unk;
    a0->unk81 = a0->unk7C;
    Set2dSpriteAnimActiveFlag(a0->unk164[1], FALSE);
    ov17_022028B8(a0);

    return TRUE;
}

extern int sub_02025320(void*);

asm int ov17_02203C78(UnkData_ov17 *a0) {
    push {r3, r4, r5, r6, r7, lr}
    add r5, r0, #0
    mov r7, #0
    mov r4, #0x10
    add r6, sp, #0
_02203C82:
    strb r4, [r6, #2]
    ldrb r0, [r6, #2]
    add r0, #0x16
    strb r0, [r6, #3]
    add r0, r5, #0
    add r0, #0x21
    ldrb r0, [r0]
    cmp r0, #3
    bhs _02203C9E
    mov r0, #0x58
    strb r0, [r6]
    ldrb r0, [r6]
    add r0, #0x18
    b _02203CA6
_02203C9E:
    mov r0, #0x48
    strb r0, [r6]
    ldrb r0, [r6]
    add r0, #0x20
_02203CA6:
    strb r0, [r6, #1]
    add r0, sp, #0
    bl sub_02025320
    cmp r0, #0
    beq _02203CB6
    add r0, r7, #0
    pop {r3, r4, r5, r6, r7, pc}
_02203CB6:
    add r7, r7, #1
    add r4, #0x1c
    add r5, #0x14
    cmp r7, #4
    blt _02203C82
    mov r0, #0
    mvn r0, r0
    pop {r3, r4, r5, r6, r7, pc}
}

extern u8 ov17_02203FC0;
asm int ov17_02203CC8(UnkData_ov17 *a0) {
    push {r4, lr}
    add r4, r0, #0
    ldr r0, [pc, #0x2C] // _02203CFC ; =ov17_02203FC0
    bl sub_02025320
    cmp r0, #0
    beq _02203CDA
    mov r0, #5
    pop {r4, pc}
_02203CDA:
    add r0, r4, #0
    bl ov17_02203C78
    cmp r0, #0
    blt _02203CF4
    add r1, r4, #0
    add r1, #0x7c
    strb r0, [r1]
    add r0, r4, #0
    bl ov17_022028B8
    mov r0, #4
    pop {r4, pc}
_02203CF4:
    mov r0, #0
    mvn r0, r0
    pop {r4, pc}
    nop
_02203CFC: DCD ov17_02203FC0
}

#ifdef NONMATCHING
u32 ov17_02203D00(UnkData_ov17 *a0) {
    UnkData_ov17_sub *unk = &a0->unk20[a0->unk7C];
    switch (unk->growthStage) {
        case 0:
            if (unk->mulch != 0) {
                return 4;
            } else {
                return 3;
            }
        case 1:
        case 2:
        case 3:
        case 4:
            return 5;
        case 5:
            return 6;
    }

    return 2;
}
#else
asm u32 ov17_02203D00(UnkData_ov17 *a0) {
    add r2, r0, #0
    add r0, #0x7c
    ldrb r1, [r0]
    mov r0, #0x14
    add r2, #0x20
    mul r0, r1
    add r2, r2, r0
    ldrb r1, [r2, #1]
    cmp r1, #5
    bgt _02203D30
    cmp r1, #0
    blt _02203D4A
    add r0, r1, r1
    add r0, pc
    ldrh r0, [r0, #6]
    lsl r0, r0, #0x10
    asr r0, r0, #0x10
    add pc, r0
_02203D24: // jump table
    DCD 0x001C000E // .short _02203D34 - _02203D24 - 2 ; case 0
                   // .short _02203D42 - _02203D24 - 2 ; case 1
    DCD 0x001C001C // .short _02203D42 - _02203D24 - 2 ; case 2
                   // .short _02203D42 - _02203D24 - 2 ; case 3
    DCD 0x0020001C // .short _02203D42 - _02203D24 - 2 ; case 4
                   // .short _02203D46 - _02203D24 - 2 ; case 5
_02203D30:
    cmp r1, #0xff
    b _02203D4A
_02203D34:
    ldrb r0, [r2, #4]
    cmp r0, #0
    beq _02203D3E
    mov r0, #4
    bx lr
_02203D3E:
    mov r0, #3
    bx lr
_02203D42:
    mov r0, #5
    bx lr
_02203D46:
    mov r0, #6
    bx lr
_02203D4A:
    mov r0, #2
    bx lr
}
#endif
