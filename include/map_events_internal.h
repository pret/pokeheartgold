#ifndef POKEHEARTGOLD_MAP_EVENTS_INTERNAL_H
#define POKEHEARTGOLD_MAP_EVENTS_INTERNAL_H

#include "field_types_def.h"
#include "wild_encounter.h"

struct BG_EVENT {
    u16 scriptId;
    u16 type;
    int x;
    int z;
    int y;
    u16 dir;
};

struct ObjectEvent {
    u16 id;
    u16 spriteId;
    u16 movement;
    u16 type;
    u16 eventFlag;
    u16 scriptId;
    s16 facingDirection;
    u16 param[3];
    s16 xRange;
    s16 yRange;
    u16 x;
    u16 z;
    s32 y;
};

struct WARP_EVENT {
    u16 x;
    u16 z;
    u16 header;
    u16 anchor;
    u32 y;
};

struct COORD_EVENT {
    u16 scriptId;
    s16 x;
    s16 z;
    u16 w;
    u16 h;
    u16 y;
    u16 val;
    u16 var;
};

typedef struct MapEvents {
    u32 num_bg_events;
    u32 num_object_events;
    u32 num_warp_events;
    u32 num_coord_events;
    BG_EVENT *bg_events;
    ObjectEvent *object_events;
    WARP_EVENT *warp_events;
    COORD_EVENT *coord_events;
    u8 event_data[0x800];
    u8 script_header[0x100];
    ENC_DATA wildEncounters;
} MapEvents;

#endif // POKEHEARTGOLD_MAP_EVENTS_INTERNAL_H
