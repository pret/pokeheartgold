#ifndef POKEHEARTGOLD_FIELD_TYPES_DEF_H
#define POKEHEARTGOLD_FIELD_TYPES_DEF_H

#include "global.h"

#include "filesystem.h"
#include "heap.h"
#include "sys_task.h"

typedef struct Location {
    int mapId;
    int warpId;
    int x;
    int y;
    int direction;
} Location;

typedef struct FieldSystem FieldSystem;
typedef struct TaskManager TaskManager;
typedef struct FieldSystemUnkSub2C FieldSystemUnkSub2C;
typedef struct LocalMapObject LocalMapObject;
typedef struct FieldMapObject FieldMapObject;
typedef struct PlayerAvatar PlayerAvatar;
typedef struct MapObjectManager MapObjectManager;
typedef struct BG_EVENT BG_EVENT;
typedef struct ObjectEvent ObjectEvent;
typedef struct WARP_EVENT WARP_EVENT;
typedef struct COORD_EVENT COORD_EVENT;
typedef struct GearPhoneRingManager GearPhoneRingManager;

#endif // POKEHEARTGOLD_FIELD_TYPES_DEF_H
