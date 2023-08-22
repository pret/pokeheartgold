#include "global.h"
#include "filesystem.h"
#include "gf_rtc.h"
#include "overlay_16.h"

typedef struct BerryFile {
    u16 sizeInMillimeters;
    u8 firmness;
    u8 unk3; // yield multiplier?
    u8 defaultGrowthInterval;
    u8 defaultDrainRate;
    u8 spiciness;
    u8 dryness;
    u8 sweetness;
    u8 bitterness;
    u8 sourness;
    u8 smoothness;
} BerryFile; // size: 0xc

enum BerryAttr {
    BERRY_ATTR_SIZE,
    BERRY_ATTR_FIRMNESS,
    BERRY_ATTR_UNK2,
    BERRY_ATTR_GROWTH_INTERVAL,
    BERRY_ATTR_DRAIN_RATE,
    BERRY_ATTR_SPICINESS,
    BERRY_ATTR_DRYNESS,
    BERRY_ATTR_SWEETNESS,
    BERRY_ATTR_BITTERNESS,
    BERRY_ATTR_SOURNESS,
    BERRY_ATTR_SMOOTHNESS,
};

static void BerryPot_Clear(BerryPot *berryPot);
static u32 ov16_02201514(BerryPot *berryPot, UnkStruct_ov16_022014A0 *a1);
static u32 CalculateBerryPotGrowthInterval(UnkStruct_ov16_022014A0 *a0, int berryId, int a2);
static u32 CalculateBerryPotDrainRate(UnkStruct_ov16_022014A0 *a0, int berryId, int a2);
static u32 ov16_02201578(BerryPot *berryPot);
static u32 ov16_02201588(BerryPot *berryPot);
static u32 ov16_02201598(BerryPot *berryPot);
static void ov16_02201688(BerryPot *berryPot, UnkStruct_ov16_022014A0 *a1);
static void ov16_022016F4(BerryPot *berryPot, UnkStruct_ov16_022014A0 *a1, int a2);
static NARC *GetBerryInfoNarc(HeapID heapId);
static BerryFile *GetBerryFileFromNarc(NARC *narc, s32 fileId, HeapID heapId);
static void FreeBerryInfoNarc(NARC *narc);
static u16 GetBerryAttr(BerryFile *unk, enum BerryAttr attr);

UnkStruct_ov16_022014A0 *ov16_022014A0(HeapID heapId) {
    UnkStruct_ov16_022014A0 *unk;
    NARC *narc;

    narc = GetBerryInfoNarc(heapId);
    unk = AllocFromHeap(heapId, NUM_BERRIES * sizeof(UnkStruct_ov16_022014A0));

    for (int fileId = 0; fileId < NUM_BERRIES; fileId++) {
        BerryFile *berryFile = GetBerryFileFromNarc(narc, fileId, heapId);
        unk[fileId].defaultGrowthTimeInHours = GetBerryAttr(berryFile, BERRY_ATTR_GROWTH_INTERVAL);
        unk[fileId].defaultDrainRate = GetBerryAttr(berryFile, BERRY_ATTR_DRAIN_RATE);
        unk[fileId].unk2 = GetBerryAttr(berryFile, BERRY_ATTR_UNK2);

        FreeToHeap(berryFile);
    }

    FreeBerryInfoNarc(narc);

    return unk;
}

static void BerryPot_Clear(BerryPot *berryPot) {
    berryPot->berryId = BERRY_NONE;
    berryPot->growthStage = BERRY_POT_GROWTH_STAGE_INVALID;
    berryPot->unk_2 = 0;
    berryPot->unk_4 = 0;
    berryPot->unk_8 = 0;
    berryPot->unk_6 = 0;
    berryPot->moisture = 0;
    berryPot->unk_A = 0;
    berryPot->mulch = MULCH_NONE;
}

static u32 ov16_02201514(BerryPot *berryPot, UnkStruct_ov16_022014A0 *a1) {
    return berryPot->unk_A * a1[berryPot->berryId - 1].unk2;
}

static u32 CalculateBerryPotGrowthInterval(UnkStruct_ov16_022014A0 *a0, int berryId, int mulch) {
    s32 growthTimeInMinutes = a0[berryId - 1].defaultGrowthTimeInHours * 60;
    if (mulch == MULCH_IDX(ITEM_GROWTH_MULCH)) {
        return (growthTimeInMinutes * 3) / 4;
    } else if (mulch == MULCH_IDX(ITEM_DAMP_MULCH)) {
        growthTimeInMinutes += (growthTimeInMinutes / 2);
    }
    return growthTimeInMinutes;
}

static u32 CalculateBerryPotDrainRate(UnkStruct_ov16_022014A0 *a0, int berryId, int mulch) {
    s32 drainRate = a0[berryId - 1].defaultDrainRate;
    if (mulch == MULCH_IDX(ITEM_DAMP_MULCH)) {
        return drainRate / 2;
    } else if (mulch == MULCH_IDX(ITEM_GROWTH_MULCH)) {
        drainRate += (drainRate / 2);
    }
    return drainRate;
}

static u32 ov16_02201578(BerryPot *berryPot) {
    return (berryPot->mulch == MULCH_IDX(ITEM_STABLE_MULCH)) ? 6 : 4;
}

static u32 ov16_02201588(BerryPot *berryPot) {
    return (berryPot->mulch == MULCH_IDX(ITEM_GOOEY_MULCH)) ? 15 : 10;
}

static u32 ov16_02201598(BerryPot *berryPot) {
    u32 unk1 = ov16_02201578(berryPot);
    u32 unk2 = ov16_02201588(berryPot);
    return (unk1 + 3) * unk2 + 1;
}

u8 BerryPots_GetPotGrowthStage(BerryPot *berryPots, u32 idx) {
    return berryPots[idx].growthStage;
}

u8 BerryPots_GetPotBerryId(BerryPot *berryPots, u32 idx) {
    return berryPots[idx].berryId;
}

u32 ov16_022015C4(BerryPot *berryPots, u32 idx) {
    s32 moisture = berryPots[idx].moisture;
    if (moisture == 0) {
        return 0;
    } else if (moisture <= 50) {
        return 1;
    } else {
        return 2;
    }
}

u8 BerryPots_GetPotMoisture(BerryPot *berryPots, u32 idx) {
    return berryPots[idx].moisture;
}

u8 ov16_022015EC(BerryPot *berryPots, u32 idx) {
    return berryPots[idx].unk_A;
}

u16 ov16_022015F8(BerryPot *berryPots, u32 idx) {
    return berryPots[idx].unk_2;
}

u16 ov16_02201604(BerryPot *berryPots, u32 idx) {
    return berryPots[idx].unk_4;
}

void ov16_02201610(BerryPot *berryPots, u32 idx, UnkStruct_ov16_022014A0 *a2, u8 berryId) {
    berryPots[idx].berryId = berryId;
    berryPots[idx].growthStage = BERRY_POT_GROWTH_STAGE_PLANTED;
    berryPots[idx].unk_2 = CalculateBerryPotGrowthInterval(a2, berryId, berryPots[idx].mulch);
    berryPots[idx].unk_4 = 0;
    berryPots[idx].unk_8 = 0;
    berryPots[idx].unk_6 = 0;
    berryPots[idx].moisture = 100;
    berryPots[idx].unk_A = 5;
}

void BerryPots_ResetPotMoisture(BerryPot *berryPots, u32 idx) {
    berryPots[idx].moisture = 100;
}

u8 BerryPots_GetPotMulch(BerryPot *berryPots, u32 idx) {
    return berryPots[idx].mulch;
}

void BerryPots_SetPotMulch(BerryPot *berryPots, u32 idx, u8 mulch) {
    berryPots[idx].mulch = mulch;
}

u16 ov16_02201668(BerryPot *berryPots, u32 idx) {
    return berryPots[idx].unk_6;
}

u16 ov16_02201674(BerryPot *berryPots, u32 idx) {
    u16 unk = berryPots[idx].unk_6;
    BerryPot_Clear(&berryPots[idx]);
    return unk;
}

static void ov16_02201688(BerryPot *berryPot, UnkStruct_ov16_022014A0 *a1) {
    switch (berryPot->growthStage) {
        case BERRY_POT_GROWTH_STAGE_INVALID:
            GF_ASSERT(FALSE);
            return;
        case BERRY_POT_GROWTH_STAGE_PLANTED:
        case BERRY_POT_GROWTH_STAGE_SPROUTED:
        case BERRY_POT_GROWTH_STAGE_GROWING:
            berryPot->growthStage++;
            return;
        case BERRY_POT_GROWTH_STAGE_BLOOM:
            berryPot->unk_6 = ov16_02201514(berryPot, a1);
            if (berryPot->unk_6 < 2) {
                berryPot->unk_6 = 2;
            }
            berryPot->growthStage++;
            return;
        case BERRY_POT_GROWTH_STAGE_BERRIES:
            berryPot->unk_6 = 0;
            berryPot->growthStage = BERRY_POT_GROWTH_STAGE_SPROUTED;
            berryPot->unk_A = 5;
            berryPot->unk_8++;
            if (berryPot->unk_8 == ov16_02201588(berryPot)) {
                BerryPot_Clear(berryPot);
            }
            return;
    }
}

static void ov16_022016F4(BerryPot *berryPot, UnkStruct_ov16_022014A0 *a1, int a2) {
    if (berryPot->growthStage == BERRY_POT_GROWTH_STAGE_BERRIES) {
        return;
    }

    int drainRate = CalculateBerryPotDrainRate(a1, berryPot->berryId, berryPot->mulch);
    int r4 = (a2 + berryPot->unk_4) / 60;
    berryPot->unk_4 = (a2 + berryPot->unk_4) % 60;
    if (r4 == 0) {
        return;
    }

    if (berryPot->moisture >= (drainRate * r4)) {
        berryPot->moisture -= (r4 * drainRate);
        return;
    }

    if (berryPot->moisture != 0) {
        r4 -= (berryPot->moisture + (drainRate - 1)) / drainRate;
        berryPot->moisture = 0;
    }

    if (berryPot->unk_A > r4) {
        berryPot->unk_A -= r4;
        return;
    }

    berryPot->unk_A = 0;
}

void ov16_02201760(BerryPot *berryPots, UnkStruct_ov16_022014A0 *a1, s32 a2) {
    for (s32 i = 0; i < MAX_BERRY_POT; i++) {
        if (berryPots[i].berryId == BERRY_NONE || berryPots[i].growthStage == BERRY_POT_GROWTH_STAGE_INVALID) {
            continue;
        }

        s32 growthInterval = CalculateBerryPotGrowthInterval(a1, berryPots[i].berryId, berryPots[i].mulch);
        s32 unk = ov16_02201598(&berryPots[i]);

        if (a2 >= growthInterval * unk) {
            BerryPot_Clear(&berryPots[i]);
            continue;
        }

        s32 a2Tmp = a2;

        while (berryPots[i].growthStage != BERRY_POT_GROWTH_STAGE_INVALID && a2Tmp != 0) {
            if (berryPots[i].unk_2 > a2Tmp) {
                ov16_022016F4(&berryPots[i], a1, a2Tmp);
                berryPots[i].unk_2 -= a2Tmp;
                break;
            }
            
            ov16_022016F4(&berryPots[i], a1, berryPots[i].unk_2);
            ov16_02201688(&berryPots[i], a1);
            a2Tmp -= berryPots[i].unk_2;
            berryPots[i].unk_2 = CalculateBerryPotGrowthInterval(a1, berryPots[i].berryId, berryPots[i].mulch);
            if (berryPots[i].growthStage == BERRY_POT_GROWTH_STAGE_BERRIES) {
                berryPots[i].unk_2 *= ov16_02201578(&berryPots[i]);
            }
        }
    }
}

void ov16_022017FC(struct GF_RTC_DateTime *dest, struct GF_RTC_DateTime src) {
    dest->date = src.date;
    dest->time = src.time;
}

void ov16_02201820(struct GF_RTC_DateTime *datetime, RTCDate *date, RTCTime *time) {
    *date = datetime->date;
    *time = datetime->time;
}

static NARC *GetBerryInfoNarc(HeapID heapId) {
    return NARC_New(NARC_a_0_6_6, heapId);
}

static BerryFile *GetBerryFileFromNarc(NARC *narc, s32 fileId, HeapID heapId) {
    return NARC_AllocAndReadWholeMember(narc, fileId, heapId);
}

static void FreeBerryInfoNarc(NARC *narc) {
    NARC_Delete(narc);
}

static u16 GetBerryAttr(BerryFile *unk, enum BerryAttr attr) {
    switch (attr) {
        case BERRY_ATTR_SIZE:
            return unk->sizeInMillimeters;
        case BERRY_ATTR_FIRMNESS:
            return unk->firmness;
        case BERRY_ATTR_UNK2:
            return unk->unk3;
        case BERRY_ATTR_GROWTH_INTERVAL:
            return unk->defaultGrowthInterval;
        case BERRY_ATTR_DRAIN_RATE:
            return unk->defaultDrainRate;
        case BERRY_ATTR_SPICINESS:
            return unk->spiciness;
        case BERRY_ATTR_DRYNESS:
            return unk->dryness;
        case BERRY_ATTR_SWEETNESS:
            return unk->sweetness;
        case BERRY_ATTR_BITTERNESS:
            return unk->bitterness;
        case BERRY_ATTR_SOURNESS:
            return unk->sourness;
        case BERRY_ATTR_SMOOTHNESS:
            return unk->smoothness;
        default:
            return 0;
    }
}

u16 BerryIdToItemId(u16 berryId) {
    if (berryId == BERRY_NONE) {
        return ITEM_NONE;
    }

    return berryId + FIRST_BERRY_IDX - 1;
}

u16 ItemIdToBerryId(u16 itemId) {
    if (itemId == ITEM_NONE) {
        return BERRY_NONE;
    }

    return itemId - FIRST_BERRY_IDX + 1;
}

u16 MulchIdToItemId(u16 mulchId) {
    if (mulchId == MULCH_NONE) {
        return ITEM_NONE;
    }

    return mulchId + ITEM_GROWTH_MULCH - 1;
}

u32 ItemIdToMulchId(u16 itemId) {
    if (itemId == ITEM_NONE) {
        return MULCH_NONE;
    }

    return itemId - ITEM_GROWTH_MULCH + 1;
}

u16 GetTotalBerryQuantity(Bag *bag, HeapID heapId) {
    s32 i;
    u16 total;
    for (total = 0, i = 0; i < NUM_BAG_BERRIES; i++) {
        total += Bag_GetQuantity(bag, FIRST_BERRY_IDX + i, heapId);
    }
    return total;
}

u16 GetTotalMulchQuantity(Bag *bag, HeapID heapId) {
    s32 i;
    u16 total;
    for (total = 0, i = 0; i < NUM_MULCHES; i++) {
        total += Bag_GetQuantity(bag, ITEM_GROWTH_MULCH + i, heapId);
    }
    return total;
}
