#ifndef POKEHEARTGOLD_FIELD_FIELDMAP_H
#define POKEHEARTGOLD_FIELD_FIELDMAP_H

#include "bg_window.h"
#include "field_system.h"

void Thunk_BgConfig_Init(BgConfig *bgConfig);
void Thunk_ov01_021E6138(BgConfig *bgConfig);
void ov01_021E631C(FieldSystem *fieldSystem, BOOL setFlag);
void ov01_021E6340(FieldSystem *fieldSystem, BOOL setFlag);
void FieldMap_FadeScreen(const u8 fadeType);

#endif // POKEHEARTGOLD_FIELD_FIELDMAP_H
