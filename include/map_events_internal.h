#ifndef POKEHEARTGOLD_MAP_EVENTS_INTERNAL_H
#define POKEHEARTGOLD_MAP_EVENTS_INTERNAL_H

#include "wild_encounter.h"

typedef struct BG_EVENT {
    u16 scr;
    u16 type;
    int x;
    int y;
    int z;
    u16 dir;
} BG_EVENT;

typedef struct ObjectEvent {
    u16 id;
    u16 ovid;
    u16 mvt;
    u16 type;
    u16 flag;
    u16 scr;
    s16 dirn;
    u16 eye;
    u16 unk10;
    u16 tsure_poke_color;
    s16 xrange;
    s16 yrange;
    u16 x;
    u16 y;
    s32 z;
} ObjectEvent;

typedef struct WARP_EVENT {
    u16 x;
    u16 y;
    u16 header;
    u16 anchor;
    u32 height;
} WARP_EVENT;

typedef struct COORD_EVENT {
    u16 scr;
    s16 x;
    s16 y;
    u16 w;
    u16 h;
    u16 z;
    u16 val;
    u16 var;
} COORD_EVENT;

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

#endif //POKEHEARTGOLD_MAP_EVENTS_INTERNAL_H
