#include "unk_0208805C.h"

#include "global.h"

#include "gf_gfx_loader.h"
#include "screen_fade.h"
#include "system.h"

static const u16 _02103894[] = {
    0x20,
    0x80,
    0x200,
    0x800,
    0x40,
    0x80,
    0x100, // this is the only one that ever gets used
    0x400,
    0x40,
    0x80,
    0x100,
    0x400,
};

u16 sub_0208805C(int a0) {
    return _02103894[a0];
}

u8 CalculateHpBarPixelsLength(u32 hp, u32 maxHp, u8 pixelsWide) {
    u8 ret = hp * pixelsWide / maxHp;
    if (ret == 0 && hp != 0) {
        ret = 1;
    }
    return ret;
}

u8 HpBar_GetColorIdx(u32 pixelsCur, u32 pixelsWide) {
    pixelsCur <<= 8;
    pixelsWide <<= 8;

    if (pixelsCur > pixelsWide / 2) {
        return 3; // green
    } else if (pixelsCur > pixelsWide / 5) {
        return 2; // yellow
    } else if (pixelsCur > 0) {
        return 1; // red
    }

    return 0; // fainted
}

u8 CalculateHpBarColor(u16 hp, u16 maxHp, u32 pixelsWide) {
    if (hp == maxHp) {
        return 4;
    }
    return HpBar_GetColorIdx(CalculateHpBarPixelsLength(hp, maxHp, pixelsWide), pixelsWide);
}

void App_StartScreenFade(u8 fadeOut, enum HeapID heapID) {
    if (fadeOut == FALSE) {
        BeginNormalPaletteFade(FADE_BOTH_SCREENS, FADE_TYPE_BRIGHTNESS_IN, FADE_TYPE_BRIGHTNESS_IN, RGB_BLACK, 6, 1, heapID);
    } else {
        BeginNormalPaletteFade(FADE_BOTH_SCREENS, FADE_TYPE_CAMERA_SHUTTER_CLOSE, FADE_TYPE_BRIGHTNESS_OUT, RGB_BLACK, 6, 1, heapID);
    }
}

static u8 handleAdjustQuantity(s16 *pAmount, u16 limit, s16 addend) {
    s16 prev = *pAmount;
    switch (addend) {
    case -1:
        --(*pAmount);
        if (*pAmount <= 0) {
            *pAmount = limit;
        }
        if (*pAmount == prev) {
            return 0;
        }
        return 2;
    case -10:
        *pAmount -= 10;
        if (*pAmount <= 0) {
            *pAmount = 1;
        }
        if (*pAmount == prev) {
            return 0;
        }
        return 2;
    case 1:
        ++(*pAmount);
        if (*pAmount > limit) {
            *pAmount = 1;
        }
        if (*pAmount == prev) {
            return 0;
        }
        return 1;
    case 10:
        *pAmount += 10;
        if (*pAmount > limit) {
            *pAmount = limit;
        }
        if (*pAmount == prev) {
            return 0;
        }
        return 1;
    }

    return 0;
}

int AdjustQuantityUsingDPad(s16 *pAmount, u16 limit) {
    if (gSystem.newAndRepeatedKeys & PAD_KEY_UP) {
        return handleAdjustQuantity(pAmount, limit, 1);
    }
    if (gSystem.newAndRepeatedKeys & PAD_KEY_DOWN) {
        return handleAdjustQuantity(pAmount, limit, -1);
    }
    if (gSystem.newAndRepeatedKeys & PAD_KEY_LEFT) {
        return handleAdjustQuantity(pAmount, limit, -10);
    }
    if (gSystem.newAndRepeatedKeys & PAD_KEY_RIGHT) {
        return handleAdjustQuantity(pAmount, limit, 10);
    }
    return 0;
}

void BgConfig_LoadAssetFromOpenNarc(BgConfig *bgConfig, enum HeapID heapID, NARC *narc, NarcId unused, int fileId, GFBgLayer layer, BgGfxAssetType kind, u32 szByte, u32 offset) {
    switch (kind) {
    case GF_BG_GFX_TYPE_CHAR:
        GfGfxLoader_LoadCharDataFromOpenNarc(narc, fileId, bgConfig, layer, offset, szByte, FALSE, heapID);
        break;
    case GF_BG_GFX_TYPE_SCRN:
        GfGfxLoader_LoadScrnDataFromOpenNarc(narc, fileId, bgConfig, layer, offset, szByte, FALSE, heapID);
        break;
    case GF_BG_GFX_TYPE_PLTT:
        if (layer <= GF_BG_LYR_MAIN_3) {
            GfGfxLoader_GXLoadPalFromOpenNarc(narc, fileId, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)offset, szByte, heapID);
        } else {
            GfGfxLoader_GXLoadPalFromOpenNarc(narc, fileId, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)offset, szByte, heapID);
        }
        break;
    }
}
