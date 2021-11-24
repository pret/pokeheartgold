#ifndef POKEHEARTGOLD_SAFARI_ZONE_H
#define POKEHEARTGOLD_SAFARI_ZONE_H

#define SAFARI_ZONE_MAX_OBJECTS 30
#define SAFARI_ZONE_COLS 3
#define SAFARI_ZONE_ROWS 2

typedef struct SAFARIZONE_OBJECT {
    u8 unk[4];
} SAFARIZONE_OBJECT;

typedef struct SAFARIZONE_AREA {
    u8 area_no;
    u8 active_object_count;
    SAFARIZONE_OBJECT objects[SAFARI_ZONE_MAX_OBJECTS];
} SAFARIZONE_AREA;

typedef struct SAFARIZONE_UNKSUB1 {
    SAFARIZONE_AREA areas[SAFARI_ZONE_COLS * SAFARI_ZONE_ROWS];
    u8 unk2DC[12];
} SAFARIZONE_UNKSUB1;

typedef struct SAFARIZONE_UNKSUB2 {
    s64 seconds_since_epoch;
    s64 rtc_offset;
    u8 unk10;
    u8 gender;
    u8 language;
    u8 version;
    u32 id;
    u16 name[8];
} SAFARIZONE_UNKSUB2;

typedef struct SAFARIZONE {
    SAFARIZONE_UNKSUB1 unk0[2];
    SAFARIZONE_UNKSUB2 unk5D0;
    u8 unk5F8;
    u8 unk5F9:6;
    u8 unk5F9_6:2;
    u16 unk5FA;
} SAFARIZONE;

#endif
