#include <nitro/rtc/ARM9/convert.h>
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
    SpriteRenderer *spriteRenderer;
    SpriteGfxHandler *spriteGfxHandler1;
    SpriteGfxHandler *spriteGfxHandler2;
    u8 unk13C[0x164 - 0x13C];
    Sprite *unk164[11];
    NARC *itemIconNarc;
    NARC *berryPotsAppNarc;
    LISTMENUITEM *unk198[4];
    void *unk1A8;
} UnkData_ov17;

struct UnkStruct_ov17_02203E88 {
    u32 unk0;
    u8 *unk4;
};

extern struct UnkStruct_ov17_02203E88 ov17_02203E88[4];

extern sub_0200B2E0();
extern sub_0200B2E8();
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

    sub_0200D020(unk->spriteGfxHandler1);
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
                PlayFanfare(SEQ_ME_KINOMI);
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
            PlaySE(SEQ_SE_GS_KP01);
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

extern void ov17_02203404(UnkData_ov17*, int);
extern void ov17_02202A84(UnkData_ov17*, int);
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

extern BOOL ov17_02203A54(UnkData_ov17*);
extern void ov17_02202B58(UnkData_ov17*, u8);
extern void ov17_0220351C(UnkData_ov17*);

BOOL ov17_022025B8(UnkData_ov17 *a0) {
    switch (a0->unk72) {
        case 0:
            a0->unk80 = a0->unk7C;
            a0->unk81 = 0xFF;
            Sprite_SetPositionXY(a0->unk164[2], (s16)(a0->unk80 * 27 + 31), 56);
            Set2dSpriteAnimSeqNo(a0->unk164[2], 8);
            Sprite_ResetAnimCtrlState(a0->unk164[2]);
            Set2dSpriteAnimActiveFlag(a0->unk164[2], TRUE);
            Set2dSpriteVisibleFlag(a0->unk164[2], TRUE);
            a0->unk7F = 0;
            a0->unk72++;
            break;
        case 1: {
            u8 unk7F = a0->unk7F++;
            if (unk7F >= 15) {
                PlaySE(SEQ_SE_GS_MIZU);
                Sprite_ResetAnimCtrlState(a0->unk164[2]);
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
                StopSE(SEQ_SE_GS_MIZU, 2);
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

void ov17_02202850(UnkData_ov17 *a0, u32 seqNo) {
    Set2dSpriteAnimSeqNo(a0->unk164[0], seqNo);
    Sprite_ResetAnimCtrlState(a0->unk164[0]);
    FillWindowPixelBuffer(&a0->unkFC[0], 0);

    u32 stringWidth = FontID_String_GetWidth(4, a0->unkA8, 0);
    AddTextPrinterParameterized2(&a0->unkFC[0], 4, a0->unkA8, (48 - stringWidth) / 2, 0, 0xFF, MakeTextColor(1, 2, 0), NULL);

    ScheduleWindowCopyToVram(&a0->unkFC[0]);
}

void ov17_022028B8(UnkData_ov17 *a0) {
    u8 unk7C = a0->unk7C;
    Sprite_SetPositionXY(a0->unk164[1], (unk7C + 1) * 27, 96);
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

struct UnkStruct_ov17_02203D60 {
    u8 unk0[12];
    Ov122_021E9282 unkC;
};

extern struct UnkStruct_ov17_02203D60 ov17_02203D60;

// FIXME(tgsm): https://decomp.me/scratch/UpOrW
#ifdef NONMATCHING
void ov17_022029C8(UnkData_ov17 *a0, u32 a1) {
    Ov122_021E7488 sp24;
    MI_CpuFill8(&sp24, 0, sizeof(Ov122_021E7488));

    sp24.unk0 = ov17_02203D60.unkC;
    sp24.unkC = a0->unk198[a1];
    sp24.unk10 = a0->bgConfig;
    sp24.unk14 = ov17_02203E88[a1].unk0;

    a0->unk1A8 = sub_020185FC(a0->unk8C, &sp24, (u8)a0->unk74, 0xf, 16 - (sp24.unk14 * 3), 0xe, 0);
}
#else
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
#endif

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
    Sprite_SetAnimCtrlCurrentFrame(a0->unk164[index + 3], 2);
    if (unk->growthStage == 1) {
        Sprite_SetAnimCtrlCurrentFrame(unk->soilSpriteMaybe, unk->soilStateMaybe);
    }
}

void ov17_02202B98(UnkData_ov17 *a0) {
    UnkData_ov17_sub *unk = &a0->unk20[a0->unk7C];
    ov16_02201674(a0->berryPots, a0->unk7C);
    Bag_AddItem(a0->bag, BerryIdToItemId(unk->berryId), unk->quantityOrYieldMaybe, a0->heapId);
    ov17_0220387C(a0);
    Sprite_Delete(unk->soilSpriteMaybe);
    unk->soilSpriteMaybe = NULL;
    Sprite_SetAnimCtrlCurrentFrame(a0->unk164[a0->unk7C + 3], 2);
    GameStats_AddSpecial(a0->stats, 0);
}

void ov17_02202BF8(UnkData_ov17 *a0) {
    if (a0->spriteRenderer != NULL) {
        thunk_OamManager_ApplyAndResetBuffers();
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

void ov17_02203030(UnkData_ov17 *a0) {
    for (int i = 0; i < 4; i++) {
        struct UnkStruct_ov17_02203E88* unk = &ov17_02203E88[i];
        a0->unk198[i] = ListMenuItems_New(unk->unk0, a0->heapId);
        for (int j = 0; j < (int)unk->unk0; j++) {
            ListMenuItems_AppendFromMsgData(a0->unk198[i], a0->msgData, unk->unk4[j], j);
        }
    }
}

void ov17_02203084(UnkData_ov17 *a0) {
    for (int i = 0; i < 4; i++) {
        ListMenuItems_Delete(a0->unk198[i]);
        a0->unk198[i] = NULL;
    }
}

extern const Unk122_021E92FC ov17_02203E68;
extern const Unk122_021E92D0 ov17_02203D98;
extern const u16 ov17_02203D78[7];
extern const SpriteResourceCountsListUnion ov17_02203DAC;

void ov17_022030A8(UnkData_ov17 *a0);
void ov17_022030A8(UnkData_ov17 *a0) {
    GF_CreateVramTransferManager(32, a0->heapId);

    a0->spriteRenderer = SpriteRenderer_Create(a0->heapId);
    sub_0200CF70(a0->spriteRenderer, (Unk122_021E92FC*)&ov17_02203E68, (Unk122_021E92D0*)&ov17_02203D98, 8);

    sub_0200B2E0(a0->heapId);
    sub_0200B2E8(a0->heapId);

    a0->spriteGfxHandler1 = SpriteRenderer_CreateGfxHandler(a0->spriteRenderer);
    sub_0200CFF4(a0->spriteRenderer, a0->spriteGfxHandler1, 25);
    sub_0200D2A4(a0->spriteRenderer, a0->spriteGfxHandler1, ov17_02203D78, 0, 0);

    a0->itemIconNarc = NARC_New(NARC_itemtool_itemdata_item_icon, a0->heapId);

    SpriteResourceCountsListUnion counts = ov17_02203DAC;
    a0->spriteGfxHandler2 = SpriteRenderer_CreateGfxHandler(a0->spriteRenderer);
    SpriteRenderer_Init2DGfxResManagersFromCountsArray(a0->spriteRenderer, a0->spriteGfxHandler2, &counts);
    sub_0200E2B4(a0->spriteGfxHandler2, sub_0200E2B0(a0->spriteGfxHandler1));

    SpriteRenderer_LoadCharResObjFromOpenNarc(a0->spriteRenderer, a0->spriteGfxHandler2, a0->itemIconNarc, GetItemIndexMapping(ITEM_CHERI_BERRY, ITEMNARC_NCGR), FALSE, NNS_G2D_VRAM_TYPE_2DMAIN, 4000);
    SpriteRenderer_LoadPlttResObjFromOpenNarc(a0->spriteRenderer, a0->spriteGfxHandler2, a0->itemIconNarc, GetItemIndexMapping(ITEM_CHERI_BERRY, ITEMNARC_NCLR), FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 4000);
    SpriteRenderer_LoadCellResObjFromOpenNarc(a0->spriteRenderer, a0->spriteGfxHandler2, a0->itemIconNarc, GetItemIconCell(), FALSE, 4000);
    SpriteRenderer_LoadAnimResObjFromOpenNarc(a0->spriteRenderer, a0->spriteGfxHandler2, a0->itemIconNarc, GetItemIconAnim(), FALSE, 4000);

    a0->unk8C = sub_02018424(a0->heapId, 0);
}

void ov17_0220321C(UnkData_ov17 *a0);
void ov17_0220321C(UnkData_ov17 *a0) {
    sub_02018474(a0->unk8C);

    NARC_Delete(a0->itemIconNarc);

    SpriteRenderer_UnloadResourcesAndRemoveGfxHandler(a0->spriteRenderer, a0->spriteGfxHandler2);
    SpriteRenderer_RemoveGfxHandler(a0->spriteRenderer, a0->spriteGfxHandler1);
    a0->spriteGfxHandler2 = NULL;
    a0->spriteGfxHandler1 = NULL;
    SpriteRenderer_Delete(a0->spriteRenderer);
    a0->spriteRenderer = NULL;

    GF_DestroyVramTransferManager();

    sub_0200B2E0(a0->heapId);
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

extern const UnkStruct_0200D2B4 ov17_02203EF8[2];
extern const UnkStruct_0200D2B4 ov17_02203F48;
extern const UnkStruct_0200D2B4 ov17_02203F70;
extern const UnkStruct_0200D2B4 ov17_02203F98;

void ov17_022032AC(UnkData_ov17 *a0) {
    for (int i = 0; i <= 1; i++) {
        a0->unk164[i] = SpriteRenderer_CreateSprite(a0->spriteRenderer, a0->spriteGfxHandler1, &ov17_02203EF8[i]);
        Set2dSpriteVisibleFlag(a0->unk164[i], TRUE);
        Set2dSpriteAnimActiveFlag(a0->unk164[i], TRUE);
    }

    a0->unk164[2] = SpriteRenderer_CreateSprite(a0->spriteRenderer, a0->spriteGfxHandler1, &ov17_02203F48);
    Set2dSpriteVisibleFlag(a0->unk164[2], FALSE);
    Set2dSpriteAnimActiveFlag(a0->unk164[2], FALSE);

    for (int i = 0; i < 4; i++) {
        u8 spriteIndex = i + 3;
        a0->unk164[spriteIndex] = SpriteRenderer_CreateSprite(a0->spriteRenderer, a0->spriteGfxHandler1, &ov17_02203F70);
        Sprite_SetPositionXY(a0->unk164[spriteIndex], i * 27 + 27, 99);
        Sprite_SetAnimCtrlCurrentFrame(a0->unk164[spriteIndex], a0->unk20[i].soilStateMaybe);
        Set2dSpriteVisibleFlag(a0->unk164[spriteIndex], TRUE);
        Set2dSpriteAnimActiveFlag(a0->unk164[spriteIndex], FALSE);

        spriteIndex = i + 7;
        a0->unk164[spriteIndex] = SpriteRenderer_CreateSprite(a0->spriteRenderer, a0->spriteGfxHandler1, &ov17_02203F98);
        Sprite_SetPositionXY(a0->unk164[spriteIndex], i * 27 + 27, 88);
        Set2dSpriteVisibleFlag(a0->unk164[spriteIndex], FALSE);
        Set2dSpriteAnimActiveFlag(a0->unk164[spriteIndex], TRUE);
    }
}

void ov17_022033E4(UnkData_ov17 *a0) {
    for (int i = 0; i < 11; i++) {
        if (a0->unk164[i] != NULL) {
            Sprite_Delete(a0->unk164[i]);
        }
    }
}

void ov17_02203404(UnkData_ov17 *a0, int a1) {
    u8 berryId = a0->unk20[a1].berryId;
    if (berryId != BERRY_NONE) {
        berryId--;
    }

    sub_0200E2B8(a0->spriteRenderer, a0->spriteGfxHandler1, a0->berryPotsAppNarc, berryId + 76, FALSE, a1 + 1);
    sub_0200E2EC(a0->spriteRenderer, a0->spriteGfxHandler1, a0->berryPotsAppNarc, berryId + 12, FALSE, a1 + 1);
}

void ov17_02203460(UnkData_ov17 *a0, u8 a1) {
    u16 itemId = BerryIdToItemId(a0->unk20[a1].berryId);

    sub_0200E2B8(a0->spriteRenderer, a0->spriteGfxHandler2, a0->itemIconNarc, GetItemIndexMapping(itemId, ITEMNARC_NCGR), FALSE, 4000);
    sub_0200E2EC(a0->spriteRenderer, a0->spriteGfxHandler2, a0->itemIconNarc, GetItemIndexMapping(itemId, ITEMNARC_NCLR), FALSE, 4000);
}

UnkImageStruct *ov17_022034C8(UnkData_ov17 *a0, s16 x, s16 y, u8);
UnkImageStruct *ov17_022034C8(UnkData_ov17 *a0, s16 x, s16 y, u8) {
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

    return SpriteRenderer_LoadResourcesAndCreateSprite(a0->spriteRenderer, a0->spriteGfxHandler2, &template);
}

typedef struct SysTaskArgs_ov17_0220351C {
    UnkData_ov17 *unk0;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    u8 unk8;
    s8 unk9;
    u8 unkA;
} SysTaskArgs_ov17_0220351C;

extern void ov17_022035A4(SysTask *task, SysTaskArgs_ov17_0220351C *args);

void ov17_0220351C(UnkData_ov17 *a0) {
    SysTaskArgs_ov17_0220351C *args = AllocFromHeap(a0->heapId, sizeof(SysTaskArgs_ov17_0220351C));
    MI_CpuFill8(args, 0, sizeof(SysTaskArgs_ov17_0220351C));
    args->unk0 = a0;
    args->unk6 = a0->unk80;
    args->unk7 = a0->unk81;
    s8 diff = a0->unk81 - a0->unk80;
    if (diff > 0) {
        args->unk9 = 1;
    } else {
        args->unk9 = -1;
        diff = -diff;
    }

    args->unk8 = (s8)(diff * 27) / 4;
    args->unkA = a0->unk80;
    CreateSysTask((SysTaskFunc)ov17_022035A4, args, 0);
    a0->unk7D++;
}

void ov17_022035A4(SysTask *task, SysTaskArgs_ov17_0220351C *args) {
    UnkData_ov17 *unk0 = args->unk0;

    Sprite_AddPositionXY(unk0->unk164[2], args->unk9 * 4, 0);
    s16 x, y;
    Sprite_GetPositionXY(unk0->unk164[2], &x, &y);

    u8 potIndex = (x - 31) / 27;
    if (potIndex != args->unkA && potIndex != args->unk7) {
        ov17_02202B58(unk0, potIndex);
        args->unkA = potIndex;
    }

    if (--args->unk8 != 0) {
        return;
    }

    Sprite_SetPositionXY(unk0->unk164[2], args->unk7 * 27 + 31, 56);

    unk0->unk7D--;
    FreeToHeap(args);
    DestroySysTask(task);
}

typedef struct SysTaskArgs_ov17_02203638 {
    UnkData_ov17 *unk0;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    UnkImageStruct *unk8;
} SysTaskArgs_ov17_02203638;

extern void ov17_02203674(SysTask*, SysTaskArgs_ov17_02203638*);

void ov17_02203638(UnkData_ov17 *a0) {
    SysTaskArgs_ov17_02203638 *args = AllocFromHeap(a0->heapId, sizeof(SysTaskArgs_ov17_02203638));
    MI_CpuFill8(args, 0, sizeof(SysTaskArgs_ov17_02203638));

    args->unk0 = a0;
    args->unk6 = a0->unk7C;

    CreateSysTask((SysTaskFunc)ov17_02203674, args, 0);
    a0->unk7D++;
}

void ov17_02203674(SysTask *task, SysTaskArgs_ov17_02203638 *args) {
    UnkData_ov17 *unk0 = args->unk0;
    switch (args->unk4) {
        case 0:
            args->unk8 = ov17_022034C8(unk0, args->unk6 * 27 + 35, 80, unk0->unk7E + 2);
            PlaySE(SEQ_SE_DP_DECIDE);
            args->unk4++;
            break;
        case 1:
            UnkImageStruct_AddSpritePositionXY(args->unk8, 2, -2);
            if (args->unk5++ >= 8) {
                args->unk4++;
            }
            break;
        case 2:
            sub_0200D9DC(args->unk8);
            unk0->unk7D--;
            FreeToHeap(args);
            DestroySysTask(task);
            break;
    }
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

void ov17_022037C8(UnkData_ov17 *a0, BOOL a1) {
    RTCDate sp28;
    RTCDate sp38;
    RTCTime sp44;
    RTCTime sp50;

    GF_RTC_CopyDateTime(&sp28, &sp44);
    s64 sVar4 = RTC_ConvertDateTimeToSecond(&sp28, &sp44);
    ov16_02201820(a0->berryDatetime, &sp38, &sp50);
    s64 sVar5 = RTC_ConvertDateTimeToSecond(&sp38, &sp50);
    if (sVar4 < sVar5) {
        ov16_022017FC(a0->berryDatetime, sp28, sp44);
        return;
    }

    u32 minutesDelta = (sVar4 - sVar5) / 60;
    if (minutesDelta > 0) {
        ov16_02201760(a0->berryPots, a0->berryGrowthProperties, minutesDelta);
        ov17_0220387C(a0);
        ov16_022017FC(a0->berryDatetime, sp28, sp44);
        if (a1) {
            ov17_02203928(a0);
        }
    }
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

typedef struct SysTaskArgs_ov17_022039A0 {
    UnkData_ov17 *unk0;
    u8 unk4;
    u8 unk5;
    u8 unk6;
} SysTaskArgs_ov17_022039A0;

extern void ov17_022039A0(SysTask *task, SysTaskArgs_ov17_022039A0 *args);

void ov17_02203928(UnkData_ov17 *a0) {
    for (int i = 0; i < 4; i++) {
        UnkData_ov17_sub *sub = &a0->unk20[i];

        if (sub->soilStateMaybe != sub->unkD) {
            Sprite_SetAnimCtrlCurrentFrame(a0->unk164[3 + i], sub->soilStateMaybe);
            if (sub->growthStage == 1) {
                Sprite_SetAnimCtrlCurrentFrame(sub->soilSpriteMaybe, sub->soilStateMaybe);
            }
        }

        if (sub->growthStage == sub->unkC) {
            continue;
        }

        SysTaskArgs_ov17_022039A0 *args = AllocFromHeap(a0->heapId, sizeof(SysTaskArgs_ov17_022039A0));
        MI_CpuFill8(args, 0, sizeof(SysTaskArgs_ov17_022039A0));
        args->unk0 = a0;
        args->unk4 = i;
        CreateSysTask((SysTaskFunc)ov17_022039A0, args, 0);
        a0->unk7D++;
    }
}

void ov17_022039A0(SysTask *task, SysTaskArgs_ov17_022039A0 *args) {
    UnkData_ov17 *unk0 = args->unk0;

    switch (args->unk6) {
        case 0:
            Set2dSpriteVisibleFlag(unk0->unk164[7 + args->unk4], TRUE);
            PlaySE(SEQ_SE_PL_EFF05);
            args->unk6++;
            break;
        case 1:
            if (args->unk5++ == 15) {
                ov17_02202A84(unk0, args->unk4);
                if (unk0->unk7C == args->unk4) {
                    ov17_022028B8(unk0);
                }
            }

            if (args->unk5 >= 30) {
                Set2dSpriteVisibleFlag(unk0->unk164[7 + args->unk4], FALSE);

                unk0->unk7D--;
                FreeToHeap(args);
                DestroySysTask(task);
            }

            break;
    }
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

int ov17_02203C78(UnkData_ov17 *a0) {
    // touch screen coordinates?
    u8 sp18[4];

    int i = 0;
    u32 xOffsetMaybe = 16;
    for (; i < 4; xOffsetMaybe += 28, i++) {
        sp18[2] = xOffsetMaybe;
        sp18[3] = sp18[2] + 22;
        if (a0->unk20[i].growthStage < 3) {
            sp18[0] = 88;
            sp18[1] = sp18[0] + 24;
        } else {
            sp18[0] = 72;
            sp18[1] = sp18[0] + 32;
        }

        if (sub_02025320(&sp18)) {
            return i;
        }
    }
    return -1;
}

extern const u8 ov17_02203FC0[4];
int ov17_02203CC8(UnkData_ov17 *a0) {
    if (sub_02025320(&ov17_02203FC0)) {
        return 5;
    }

    int unk = ov17_02203C78(a0);
    if (unk >= 0) {
        a0->unk7C = unk;
        ov17_022028B8(a0);
        return 4;
    }

    return -1;
}

u32 ov17_02203D00(UnkData_ov17 *a0) {
    UnkData_ov17_sub *unk = &a0->unk20[a0->unk7C];
    switch (unk->growthStage) {
        case 0:
            return (unk->mulch != MULCH_NONE) ? 4 : 3;
        case 1:
        case 2:
        case 3:
        case 4:
            return 5;
        case 5:
            return 6;

        case 0xFF:
        default:
            return 2;
    }
}
