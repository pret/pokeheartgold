#ifndef POKEHEARTGOLD_MAIN_H
#define POKEHEARTGOLD_MAIN_H

#include "overlay_manager.h"
#include "save.h"

typedef struct UnkStruct_02111868_sub {
    int unk_00;
    u32 unk_04;
    SaveData *saveData;
} UnkStruct_02111868_sub;

void NitroMain(void);
void Main_ResetOverlayManager(void);
void RegisterMainOverlay(FSOverlayID overlayId, const OverlayManagerTemplate *template);
void InitializeMainRNG(void);
void HandleDSLidAction(void);

#endif // POKEHEARTGOLD_MAIN_H
