#ifndef POKEHEARTGOLD_MAP_EVENTS_H
#define POKEHEARTGOLD_MAP_EVENTS_H

typedef struct BG_EVENT {
    u16 scr;
    u16 type;
    s32 x;
    s32 y;
    s32 z;
    s32 dir;
} BG_EVENT;

typedef struct OBJECT_EVENT {
    u16 id;
    u16 ovid;
    u16 mvt;
    u16 type;
    u16 flag;
    u16 scr;
    u16 dirn;
    u16 eye;
    u16 unk10;
    u16 unk12;
    u16 xrange;
    u16 yrange;
    s16 x;
    s16 y;
    s16 z;
    u16 unk1E;
} OBJECT_EVENT;

typedef struct WARP_EVENT {
    s16 x;
    s16 y;
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

typedef struct MAP_EVENTS {
    u32 num_bg_events;
    u32 num_object_events;
    u32 num_warp_events;
    u32 num_coord_events;
    BG_EVENT *bg_events;
    OBJECT_EVENT *object_events;
    WARP_EVENT *warp_events;
    COORD_EVENT *coord_events;
    u8 event_data[0x800];
    u8 lvscrseq[0x100];
    ENC_DATA wildEncounters;
} MAP_EVENTS;

#endif //POKEHEARTGOLD_MAP_EVENTS_H
