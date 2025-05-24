#include "unk_0208805C.h"

#include "global.h"

#include "gf_gfx_loader.h"
#include "system.h"
#include "unk_0200FA24.h"

u8 sub_02088108(s16 *a0, u16 a1, s16 a2);

static const u16 _02103894[] = {
    0x20,
    0x80,
    0x200,
    0x800,
    0x40,
    0x80,
    0x100,
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

void sub_020880CC(u8 a0, HeapID heapId) {
    if (a0 == 0) {
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, heapId);
    } else {
        BeginNormalPaletteFade(0, 8, 0, RGB_BLACK, 6, 1, heapId);
    }
}

u8 sub_02088108(s16 *a0, u16 a1, s16 a2) {
    s16 prev = *a0;
    switch (a2) {
    case -1:
        --(*a0);
        if (*a0 <= 0) {
            *a0 = a1;
        }
        if (*a0 == prev) {
            return 0;
        }
        return 2;
    case -10:
        *a0 -= 10;
        if (*a0 <= 0) {
            *a0 = 1;
        }
        if (*a0 == prev) {
            return 0;
        }
        return 2;
    case 1:
        ++(*a0);
        if (*a0 > a1) {
            *a0 = 1;
        }
        if (*a0 == prev) {
            return 0;
        }
        return 1;
    case 10:
        *a0 += 10;
        if (*a0 > a1) {
            *a0 = a1;
        }
        if (*a0 == prev) {
            return 0;
        }
        return 1;
    }

    return 0;
}

int sub_020881C0(s16 *a0, u16 a1) {
    if (gSystem.newAndRepeatedKeys & PAD_KEY_UP) {
        return sub_02088108(a0, a1, 1);
    }
    if (gSystem.newAndRepeatedKeys & PAD_KEY_DOWN) {
        return sub_02088108(a0, a1, -1);
    }
    if (gSystem.newAndRepeatedKeys & PAD_KEY_LEFT) {
        return sub_02088108(a0, a1, -10);
    }
    if (gSystem.newAndRepeatedKeys & PAD_KEY_RIGHT) {
        return sub_02088108(a0, a1, 10);
    }
    return 0;
}

void sub_0208820C(BgConfig *bgConfig, HeapID heapId, NARC *narc, NarcId unused, int fileId, GFBgLayer layer, int kind, u32 szByte, u32 offset) {
    switch (kind) {
    case 0:
        GfGfxLoader_LoadCharDataFromOpenNarc(narc, fileId, bgConfig, layer, offset, szByte, FALSE, heapId);
        break;
    case 1:
        GfGfxLoader_LoadScrnDataFromOpenNarc(narc, fileId, bgConfig, layer, offset, szByte, FALSE, heapId);
        break;
    case 2:
        if (layer <= GF_BG_LYR_MAIN_3) {
            GfGfxLoader_GXLoadPalFromOpenNarc(narc, fileId, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)offset, szByte, heapId);
        } else {
            GfGfxLoader_GXLoadPalFromOpenNarc(narc, fileId, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)offset, szByte, heapId);
        }
        break;
    }
}
