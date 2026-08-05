#ifndef POKEHEARTGOLD_FIELD_MAP_PROP_ANIMATION_H
#define POKEHEARTGOLD_FIELD_MAP_PROP_ANIMATION_H

#include "field/overlay_01_02204004.h"

#include "filesystem.h"

typedef struct MapPropAnimationManager {
    u8 unk0[0x13C];
} MapPropAnimationManager;

typedef struct MapPropOneShotAnimationManager {
    u8 unk0[0x380];
} MapPropOneShotAnimationManager;

MapPropAnimationManager *MapPropAnimationManager_Init(NARC *narc, FieldSystemUnkSubC8 *unkSubC8);
void ov01_021E8970(int modelNum, int animNum, int a2, UnkStruct_FieldSysC0_SubC *renderObj, MapPropAnimationManager *mapPropAnimationManager);
void MapPropAnimationManager_UnloadAllAnimations(MapPropAnimationManager *mapPropAnimationManager);
void ov01_021E8A8C(MapPropAnimationManager *mapPropAnimationManager, UnkStruct_FieldSysC0_SubC *renderObj, int modelNum, int animNum);
void MapPropAnimationManager_Free(MapPropAnimationManager *mapPropAnimationManager);
MapPropAnimationManager *ov01_021E8B04(int modelNum, int animNum, MapPropAnimationManager *mapPropAnimationManager);
void ov01_021E8B6C(MapPropAnimationManager *mapPropAnimationManager);
void ov01_021E8B84(MapPropAnimationManager *mapPropAnimationManager, int a1);
BOOL ov01_021E8B90(MapPropAnimationManager *mapPropAnimationManager);
MapPropOneShotAnimationManager *ov01_021E8DB4();
void ov01_021E8DD4(MapPropOneShotAnimationManager **mapPropOneShotAnimationManager);

#endif // POKEHEARTGOLD_FIELD_MAP_PROP_ANIMATION_H
