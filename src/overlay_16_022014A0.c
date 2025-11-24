#include "global.h"

#include "filesystem.h"
#include "gf_rtc.h"
#include "overlay_16.h"

typedef struct BerryFile {
    u16 sizeInMillimeters;
    u8 firmness;
    u8 yieldMultiplier;
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
    BERRY_ATTR_YIELD_MULTIPLIER,
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
static u32 BerryPots_CalculateYield(BerryPot *berryPot, BerryGrowthProperties *growthProperties);
static u32 CalculateBerryPotGrowthInterval(BerryGrowthProperties *growthProperties, int berryId, int a2);
static u32 CalculateBerryPotDrainRate(BerryGrowthProperties *growthProperties, int berryId, int a2);
static u32 BerryPots_GetMulchPower_Stable(BerryPot *berryPot);
static u32 BerryPots_GetMulchPower_Gooey(BerryPot *berryPot);
static u32 BerryPots_CalculateMulchPower(BerryPot *berryPot);
static void BerryPots_GrowBerryTree(BerryPot *berryPot, BerryGrowthProperties *growthProperties);
static void BerryPots_CalculateMoisture(BerryPot *berryPot, BerryGrowthProperties *growthProperties, int a2);
static NARC *GetBerryInfoNarc(enum HeapID heapID);
static BerryFile *GetBerryFileFromNarc(NARC *narc, s32 fileId, enum HeapID heapID);
static void FreeBerryInfoNarc(NARC *narc);
static u16 GetBerryAttr(BerryFile *unk, enum BerryAttr attr);

BerryGrowthProperties *ov16_022014A0(enum HeapID heapID) {
    BerryGrowthProperties *unk;
    NARC *narc;

    narc = GetBerryInfoNarc(heapID);
    unk = Heap_Alloc(heapID, NUM_BERRIES * sizeof(BerryGrowthProperties));

    for (int fileId = 0; fileId < NUM_BERRIES; fileId++) {
        BerryFile *berryFile = GetBerryFileFromNarc(narc, fileId, heapID);
        unk[fileId].defaultGrowthTimeInHours = GetBerryAttr(berryFile, BERRY_ATTR_GROWTH_INTERVAL);
        unk[fileId].defaultDrainRate = GetBerryAttr(berryFile, BERRY_ATTR_DRAIN_RATE);
        unk[fileId].yieldMultiplier = GetBerryAttr(berryFile, BERRY_ATTR_YIELD_MULTIPLIER);

        Heap_Free(berryFile);
    }

    FreeBerryInfoNarc(narc);

    return unk;
}

static void BerryPot_Clear(BerryPot *berryPot) {
    berryPot->berryId = BERRY_NONE;
    berryPot->growthStage = BERRY_POT_GROWTH_STAGE_NONE;
    berryPot->unk_2 = 0;
    berryPot->unk_4 = 0;
    berryPot->unk_8 = 0;
    berryPot->yield = 0;
    berryPot->moisture = 0;
    berryPot->baseYield = 0;
    berryPot->mulch = MULCH_NONE;
}

static u32 BerryPots_CalculateYield(BerryPot *berryPot, BerryGrowthProperties *growthProperties) {
    return berryPot->baseYield * growthProperties[berryPot->berryId - 1].yieldMultiplier;
}

static u32 CalculateBerryPotGrowthInterval(BerryGrowthProperties *a0, int berryId, int mulch) {
    s32 growthTimeInMinutes = a0[berryId - 1].defaultGrowthTimeInHours * 60;
    if (mulch == MULCH_IDX(ITEM_GROWTH_MULCH)) {
        return (growthTimeInMinutes * 3) / 4;
    } else if (mulch == MULCH_IDX(ITEM_DAMP_MULCH)) {
        growthTimeInMinutes += (growthTimeInMinutes / 2);
    }
    return growthTimeInMinutes;
}

static u32 CalculateBerryPotDrainRate(BerryGrowthProperties *a0, int berryId, int mulch) {
    s32 drainRate = a0[berryId - 1].defaultDrainRate;
    if (mulch == MULCH_IDX(ITEM_DAMP_MULCH)) {
        return drainRate / 2;
    } else if (mulch == MULCH_IDX(ITEM_GROWTH_MULCH)) {
        drainRate += (drainRate / 2);
    }
    return drainRate;
}

static u32 BerryPots_GetMulchPower_Stable(BerryPot *berryPot) {
    return (berryPot->mulch == MULCH_IDX(ITEM_STABLE_MULCH)) ? 6 : 4;
}

static u32 BerryPots_GetMulchPower_Gooey(BerryPot *berryPot) {
    return (berryPot->mulch == MULCH_IDX(ITEM_GOOEY_MULCH)) ? 15 : 10;
}

static u32 BerryPots_CalculateMulchPower(BerryPot *berryPot) {
    u32 unk1 = BerryPots_GetMulchPower_Stable(berryPot);
    u32 unk2 = BerryPots_GetMulchPower_Gooey(berryPot);
    return (unk1 + 3) * unk2 + 1;
}

u8 BerryPots_GetPotGrowthStage(BerryPot *berryPots, u32 idx) {
    return berryPots[idx].growthStage;
}

u8 BerryPots_GetPotBerryId(BerryPot *berryPots, u32 idx) {
    return berryPots[idx].berryId;
}

u32 BerryPots_GetSoilState(BerryPot *berryPots, u32 idx) {
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

u8 BerryPots_GetUnk_AIndex(BerryPot *berryPots, u32 idx) {
    return berryPots[idx].baseYield;
}

u16 BerryPots_GetUnk_2Index(BerryPot *berryPots, u32 idx) {
    return berryPots[idx].unk_2;
}

u16 BerryPots_GetUnk_4Index(BerryPot *berryPots, u32 idx) {
    return berryPots[idx].unk_4;
}

void BerryPots_PlantNewBerry(BerryPot *berryPots, u32 idx, BerryGrowthProperties *growthProperties, u32 berryId) {
    berryPots[idx].berryId = berryId;
    berryPots[idx].growthStage = BERRY_POT_GROWTH_STAGE_PLANTED;
    berryPots[idx].unk_2 = CalculateBerryPotGrowthInterval(growthProperties, berryId, berryPots[idx].mulch);
    berryPots[idx].unk_4 = 0;
    berryPots[idx].unk_8 = 0;
    berryPots[idx].yield = 0;
    berryPots[idx].moisture = 100;
    berryPots[idx].baseYield = 5;
}

void BerryPots_ResetPotMoisture(BerryPot *berryPots, u32 idx) {
    berryPots[idx].moisture = 100;
}

u8 BerryPots_GetPotMulch(BerryPot *berryPots, u32 idx) {
    return berryPots[idx].mulch;
}

void BerryPots_SetPotMulch(BerryPot *berryPots, u32 idx, u32 mulch) {
    berryPots[idx].mulch = mulch;
}

u16 BerryPots_GetYieldIndex(BerryPot *berryPots, u32 idx) {
    return berryPots[idx].yield;
}

u16 BerryPots_GetYieldIndexAndClearPot(BerryPot *berryPots, u32 idx) {
    u16 unk = berryPots[idx].yield;
    BerryPot_Clear(&berryPots[idx]);
    return unk;
}

static void BerryPots_GrowBerryTree(BerryPot *berryPot, BerryGrowthProperties *growthProperties) {
    switch (berryPot->growthStage) {
    case BERRY_POT_GROWTH_STAGE_NONE:
        GF_ASSERT(FALSE);
        return;
    case BERRY_POT_GROWTH_STAGE_PLANTED:
    case BERRY_POT_GROWTH_STAGE_SPROUTED:
    case BERRY_POT_GROWTH_STAGE_GROWING:
        berryPot->growthStage++;
        return;
    case BERRY_POT_GROWTH_STAGE_BLOOM:
        berryPot->yield = BerryPots_CalculateYield(berryPot, growthProperties);
        if (berryPot->yield < 2) {
            berryPot->yield = 2;
        }
        berryPot->growthStage++;
        return;
    case BERRY_POT_GROWTH_STAGE_BERRIES:
        berryPot->yield = 0;
        berryPot->growthStage = BERRY_POT_GROWTH_STAGE_SPROUTED;
        berryPot->baseYield = 5;
        berryPot->unk_8++;
        if (berryPot->unk_8 == BerryPots_GetMulchPower_Gooey(berryPot)) {
            BerryPot_Clear(berryPot);
        }
        return;
    }
}

static void BerryPots_CalculateMoisture(BerryPot *berryPot, BerryGrowthProperties *growthProperties, int a2) {
    if (berryPot->growthStage == BERRY_POT_GROWTH_STAGE_BERRIES) {
        return;
    }

    int drainRate = CalculateBerryPotDrainRate(growthProperties, berryPot->berryId, berryPot->mulch);
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

    if (berryPot->baseYield > r4) {
        berryPot->baseYield -= r4;
        return;
    }

    berryPot->baseYield = 0;
}

void BerryPots_DoTimedTasks(BerryPot *berryPots, BerryGrowthProperties *growthProperties, s32 a2) {
    for (s32 i = 0; i < MAX_BERRY_POT; i++) {
        if (berryPots[i].berryId == BERRY_NONE || berryPots[i].growthStage == BERRY_POT_GROWTH_STAGE_NONE) {
            continue;
        }

        s32 growthInterval = CalculateBerryPotGrowthInterval(growthProperties, berryPots[i].berryId, berryPots[i].mulch);
        s32 unk = BerryPots_CalculateMulchPower(&berryPots[i]);

        if (a2 >= growthInterval * unk) {
            BerryPot_Clear(&berryPots[i]);
            continue;
        }

        s32 a2Tmp = a2;

        while (berryPots[i].growthStage != BERRY_POT_GROWTH_STAGE_NONE && a2Tmp != 0) {
            if (berryPots[i].unk_2 > a2Tmp) {
                BerryPots_CalculateMoisture(&berryPots[i], growthProperties, a2Tmp);
                berryPots[i].unk_2 -= a2Tmp;
                break;
            }

            BerryPots_CalculateMoisture(&berryPots[i], growthProperties, berryPots[i].unk_2);
            BerryPots_GrowBerryTree(&berryPots[i], growthProperties);
            a2Tmp -= berryPots[i].unk_2;
            berryPots[i].unk_2 = CalculateBerryPotGrowthInterval(growthProperties, berryPots[i].berryId, berryPots[i].mulch);
            if (berryPots[i].growthStage == BERRY_POT_GROWTH_STAGE_BERRIES) {
                berryPots[i].unk_2 *= BerryPots_GetMulchPower_Stable(&berryPots[i]);
            }
        }
    }
}

void BerryPots_SetBerryDatetime(struct GF_RTC_DateTime *dest, RTCDate srcDate, RTCTime srcTime) {
    dest->date = srcDate;
    dest->time = srcTime;
}

void BerryPots_CopyBerryDatetime(struct GF_RTC_DateTime *datetime, RTCDate *date, RTCTime *time) {
    *date = datetime->date;
    *time = datetime->time;
}

static NARC *GetBerryInfoNarc(enum HeapID heapID) {
    return NARC_New(NARC_a_0_6_6, heapID);
}

static BerryFile *GetBerryFileFromNarc(NARC *narc, s32 fileId, enum HeapID heapID) {
    return NARC_AllocAndReadWholeMember(narc, fileId, heapID);
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
    case BERRY_ATTR_YIELD_MULTIPLIER:
        return unk->yieldMultiplier;
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

u16 GetTotalBerryQuantity(Bag *bag, enum HeapID heapID) {
    s32 i;
    u16 total;
    for (total = 0, i = 0; i < NUM_BAG_BERRIES; i++) {
        total += Bag_GetQuantity(bag, FIRST_BERRY_IDX + i, heapID);
    }
    return total;
}

u16 GetTotalMulchQuantity(Bag *bag, enum HeapID heapID) {
    s32 i;
    u16 total;
    for (total = 0, i = 0; i < NUM_MULCHES; i++) {
        total += Bag_GetQuantity(bag, ITEM_GROWTH_MULCH + i, heapID);
    }
    return total;
}
