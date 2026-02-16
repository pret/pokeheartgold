#ifndef POKEHEARTGOLD_FRONTIER_H
#define POKEHEARTGOLD_FRONTIER_H

#include "bag_cursor.h"
#include "overlay_manager.h"
#include "field_system.h"

typedef struct FrontierLaunchArgs {
    void *unk0;
    Options *options;
    SaveData *saveData;
    BagCursor *bagCursor;
    u32 unk10;
    u32 unk14;
    u32 mapId;
    void *unk1C;
    u8 unk20;
    FieldSystem *fieldSystem;
} FrontierLaunchArgs;

extern const OverlayManagerTemplate gOverlayTemplate_Frontier;

typedef void(UnkFuncPtr_020965A4)(void *);

FrontierLaunchArgs *Frontier_GetLaunchArgs(void *a0);
void Frontier_SetData(void *a0, u32 a1);
void *Frontier_GetData(void *a0);
void Frontier_LaunchApplication(void *a0, const OverlayManagerTemplate *ovyTemp, void *args, u32 a3, UnkFuncPtr_020965A4 func);

#endif // POKEHEARTGOLD_FRONTIER_H
