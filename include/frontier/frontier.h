#ifndef POKEHEARTGOLD_FRONTIER_H
#define POKEHEARTGOLD_FRONTIER_H

#include "bag_cursor.h"
#include "overlay_manager.h"

typedef struct FrontierLaunchParam {
    void *unk0;
    Options *options;
    SaveData *saveData;
    BagCursor *bagCursor;
    u8 unk10[0x8];
    u32 mapId;
    void *unk1C;
    u8 unk20;
    u8 unk21[0x7];
} FrontierLaunchParam;

extern const OverlayManagerTemplate gOverlayTemplate_Frontier;

typedef void(UnkFuncPtr_020965A4)(void *);

FrontierLaunchParam *Frontier_GetLaunchParam(void *a0);
void Frontier_SetData(void *a0, u32 a1);
void *Frontier_GetData(void *a0);
void Frontier_LaunchApplication(void *a0, const OverlayManagerTemplate *ovyTemp, void *args, u32 a3, UnkFuncPtr_020965A4 func);

#endif // POKEHEARTGOLD_FRONTIER_H
