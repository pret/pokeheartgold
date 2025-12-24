#ifndef POKEHEARTGOLD_OVERLAY_16_H
#define POKEHEARTGOLD_OVERLAY_16_H

#include "bag.h"
#include "overlay_manager.h"
#include "save_misc_data.h"

typedef struct BerryPotsArgs {
    void *unk0;
    MenuInputStateMgr *menuInputStatePtr;
    BagCursor *cursor;
    SaveData *saveData;
} BerryPotsArgs;

typedef struct BerryGrowthProperties {
    u8 defaultGrowthTimeInHours;
    u8 defaultDrainRate;
    u8 yieldMultiplier;
} BerryGrowthProperties; // size: 0x3

BerryGrowthProperties *ov16_022014A0(enum HeapID heapID);
u8 BerryPots_GetPotGrowthStage(BerryPot *berryPots, u32 idx);
u8 BerryPots_GetPotBerryId(BerryPot *berryPots, u32 idx);
u32 BerryPots_GetSoilState(BerryPot *berryPots, u32 idx);
u8 BerryPots_GetPotMoisture(BerryPot *berryPots, u32 idx);
u8 BerryPots_GetUnk_AIndex(BerryPot *berryPots, u32 idx);
u16 BerryPots_GetUnk_2Index(BerryPot *berryPots, u32 idx);
u16 BerryPots_GetUnk_4Index(BerryPot *berryPots, u32 idx);
void BerryPots_PlantNewBerry(BerryPot *berryPots, u32 idx, BerryGrowthProperties *growthProperties, u32 berryId);
void BerryPots_ResetPotMoisture(BerryPot *berryPots, u32 idx);
u8 BerryPots_GetPotMulch(BerryPot *berryPots, u32 idx);
void BerryPots_SetPotMulch(BerryPot *berryPots, u32 idx, u32 mulch);
u16 BerryPots_GetYieldIndex(BerryPot *berryPots, u32 idx);
u16 BerryPots_GetYieldIndexAndClearPot(BerryPot *berryPots, u32 idx);
void BerryPots_DoTimedTasks(BerryPot *berryPots, BerryGrowthProperties *growthProperties, s32 a2);
void BerryPots_SetBerryDatetime(struct GF_RTC_DateTime *dest, RTCDate srcDate, RTCTime srcTime);
void BerryPots_CopyBerryDatetime(struct GF_RTC_DateTime *datetime, RTCDate *date, RTCTime *time);
u16 BerryIdToItemId(u16 berryId);
u16 ItemIdToBerryId(u16 itemId);
u16 MulchIdToItemId(u16 mulchId);
u32 ItemIdToMulchId(u16 itemId);
u16 GetTotalBerryQuantity(Bag *bag, enum HeapID heapID);
u16 GetTotalMulchQuantity(Bag *bag, enum HeapID heapID);

BOOL BerryPots_Init(OverlayManager *manager, int *state);
BOOL BerryPots_Main(OverlayManager *manager, int *state);
BOOL BerryPots_Exit(OverlayManager *manager, int *state);

#endif
