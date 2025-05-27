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

typedef struct UnkStruct_ov16_022014A0 {
    u8 defaultGrowthTimeInHours;
    u8 defaultDrainRate;
    u8 unk2;               // yield multiplier?
} UnkStruct_ov16_022014A0; // size: 0x3

UnkStruct_ov16_022014A0 *ov16_022014A0(HeapID heapId);
u8 BerryPots_GetPotGrowthStage(BerryPot *berryPots, u32 idx);
u8 BerryPots_GetPotBerryId(BerryPot *berryPots, u32 idx);
u32 BerryPots_GetSoilState(BerryPot *berryPots, u32 idx);
u8 BerryPots_GetPotMoisture(BerryPot *berryPots, u32 idx);
u8 ov16_022015EC(BerryPot *berryPots, u32 idx);
u16 ov16_022015F8(BerryPot *berryPots, u32 idx);
u16 ov16_02201604(BerryPot *berryPots, u32 idx);
void ov16_02201610(BerryPot *berryPots, u32 idx, UnkStruct_ov16_022014A0 *a2, u32 a3);
void BerryPots_ResetPotMoisture(BerryPot *berryPots, u32 idx);
u8 BerryPots_GetPotMulch(BerryPot *berryPots, u32 idx);
void BerryPots_SetPotMulch(BerryPot *berryPots, u32 idx, u32 mulch);
u16 ov16_02201668(BerryPot *berryPots, u32 idx);
u16 ov16_02201674(BerryPot *berryPots, u32 idx);
void ov16_02201760(BerryPot *berryPots, UnkStruct_ov16_022014A0 *a1, s32 a2);
void BerryPots_SetBerryDatetime(struct GF_RTC_DateTime *dest, RTCDate srcDate, RTCTime srcTime);
void BerryPots_CopyBerryDatetime(struct GF_RTC_DateTime *datetime, RTCDate *date, RTCTime *time);
u16 BerryIdToItemId(u16 berryId);
u16 ItemIdToBerryId(u16 itemId);
u16 MulchIdToItemId(u16 mulchId);
u32 ItemIdToMulchId(u16 itemId);
u16 GetTotalBerryQuantity(Bag *bag, HeapID heapId);
u16 GetTotalMulchQuantity(Bag *bag, HeapID heapId);

BOOL BerryPots_Init(OverlayManager *manager, int *state);
BOOL BerryPots_Main(OverlayManager *manager, int *state);
BOOL BerryPots_Exit(OverlayManager *manager, int *state);

#endif
