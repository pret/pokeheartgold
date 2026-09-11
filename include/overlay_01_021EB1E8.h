#ifndef POKEHEARTGOLD_OVERLAY_01_021EB1E8_H
#define POKEHEARTGOLD_OVERLAY_01_021EB1E8_H

#include "field_types_def.h"

void ov01_021EB1E8(FieldTextureManager *textureManager);
void *WeatherManager_New(FieldSystem *fieldSystem);
void WeatherManager_Delete(void *weatherManager);
void WeatherManager_SetWeather(void *weatherManager, int a1);

#endif // POKEHEARTGOLD_OVERLAY_01_021EB1E8_H
