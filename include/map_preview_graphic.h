#ifndef POKEHEARTGOLD_MAP_PREVIEW_GRAPHIC_H
#define POKEHEARTGOLD_MAP_PREVIEW_GRAPHIC_H

#include "task.h"

u8 MapPreviewGraphic_GetIndex(u32 mapId);
void MapPreviewGraphic_BeginShowImage(TaskManager *man, int index, u8 time, int a3);

#endif // POKEHEARTGOLD_MAP_PREVIEW_GRAPHIC_H
