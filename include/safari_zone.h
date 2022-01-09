#ifndef POKEHEARTGOLD_SAFARI_ZONE_H
#define POKEHEARTGOLD_SAFARI_ZONE_H

#include "igt.h"
#include "player_data.h"
#include "save.h"

#define SAFARI_ZONE_MAX_OBJECTS 30
#define SAFARI_ZONE_AREA_SET_COLS 3
#define SAFARI_ZONE_AREA_SET_ROWS 2
#define SAFARI_ZONE_MAX_AREAS_PER_SET (SAFARI_ZONE_AREA_SET_COLS * SAFARI_ZONE_AREA_SET_ROWS)
#define SAFARI_ZONE_MAX_AREA_SETS 2

#define SAFARI_ZONE_AREA_PLAINS    0
#define SAFARI_ZONE_AREA_MEADOW    1
#define SAFARI_ZONE_AREA_SAVANNAH  2
#define SAFARI_ZONE_AREA_PEAK      3
#define SAFARI_ZONE_AREA_UNUSED    4
#define SAFARI_ZONE_AREA_WETLAND   5
#define SAFARI_ZONE_AREA_FOREST    6
#define SAFARI_ZONE_AREA_SWAMP     7
#define SAFARI_ZONE_AREA_MARSHLAND 8
#define SAFARI_ZONE_AREA_WASTELAND 9
#define SAFARI_ZONE_AREA_MOUNTAIN  10

typedef struct SAFARIZONE_OBJECT {
    u8 unk[4];
} SAFARIZONE_OBJECT;

typedef struct SAFARIZONE_AREA {
    u8 area_no;
    u8 active_object_count;
    SAFARIZONE_OBJECT objects[SAFARI_ZONE_MAX_OBJECTS];
} SAFARIZONE_AREA;

typedef struct SAFARIZONE_AREASET {
    SAFARIZONE_AREA areas[SAFARI_ZONE_MAX_AREAS_PER_SET];
    u8 unk2DC[12];
} SAFARIZONE_AREASET;

typedef struct SAFARIZONE_UNKSUB {
    s64 seconds_since_epoch;
    s64 rtc_offset;
    u8 unk10;
    u8 gender;
    u8 language;
    u8 version;
    u32 id;
    u16 name[OT_NAME_LENGTH + 1];
} SAFARIZONE_UNKSUB;

typedef struct SAFARIZONE {
    SAFARIZONE_AREASET area_sets[2];
    SAFARIZONE_UNKSUB unk5D0;
    u8 unk5F8;
    u8 unk5F9_0:6;
    u8 unk5F9_6:2;
    u16 unk5FA;
} SAFARIZONE;

u32 sub_0202F574(void);
SAFARIZONE* sub_0202F57C(SAVEDATA* savedata);
void sub_0202F588(SAFARIZONE* safari_zone);
void sub_0202F5B8(SAFARIZONE_AREASET* area_set, u32 a1);
void sub_0202F5F8(SAFARIZONE* safari_zone, s32 a1);
u8 sub_0202F620(SAFARIZONE* safari_zone);
SAFARIZONE_AREASET* sub_0202F630(SAFARIZONE* safari_zone, s32 area_set_no);
void sub_0202F658(SAFARIZONE* safari_zone, s32 area_set_no, SAFARIZONE_AREASET* area_set);
void sub_0202F680(SAFARIZONE* safari_zone, s32 area_set_no, SAFARIZONE_AREASET* area_set);
void sub_0202F6A0(SAFARIZONE* safari_zone, u8 a1);
u8 sub_0202F6AC(SAFARIZONE* safari_zone);
void sub_0202F6B8(SAFARIZONE_AREASET* area_set, s32 a1);
u8 sub_0202F720(SAFARIZONE* safari_zone);
u8 sub_0202F730(SAFARIZONE* safari_zone, s32 a1);
void sub_0202F754(SAFARIZONE* safari_zone, u8 a1);
void sub_0202F784(SAFARIZONE* safari_zone, IGT* igt);
u32 sub_0202F798(SAFARIZONE* safari_zone, IGT* igt, s32 a2);
void sub_0202F7D8(SAFARIZONE* safari_zone, PLAYERPROFILE* profile, HeapID heap_id);
void sub_0202F844(SAFARIZONE* safari_zone, PLAYERPROFILE* profile);
u8 sub_0202F87C(SAFARIZONE* safari_zone);
u8 sub_0202F888(SAFARIZONE* safari_zone);
void sub_0202F890(SAFARIZONE* safari_zone);
void sub_0202F8D4(SAFARIZONE_AREASET* area_set, u32 first, u32 second);
void sub_0202F91C(SAFARIZONE_AREASET* area_set, s32 area_idx, u32 area_no);
void sub_0202F930(SAFARIZONE_AREASET* area_set, s32 area_idx, const SAFARIZONE_OBJECT* object);
void sub_0202F968(SAFARIZONE_AREASET* area_set, s32 area_idx, s32 object_idx);
void sub_0202F9CC(SAFARIZONE_AREASET* area_set);
void sub_0202F9E8(SAFARIZONE_AREA* area, u8 area_no);
void sub_0202F9FC(SAFARIZONE_OBJECT* object);
void sub_0202FA08(SAFARIZONE_UNKSUB* a0);
BOOL sub_0202FA3C(u8 a0, u8* a1, u8 a2);

#endif
