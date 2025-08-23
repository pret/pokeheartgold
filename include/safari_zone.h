#ifndef POKEHEARTGOLD_SAFARI_ZONE_H
#define POKEHEARTGOLD_SAFARI_ZONE_H

#include "igt.h"
#include "player_data.h"
#include "save.h"

#define SAFARI_ZONE_MAX_OBJECTS       30
#define SAFARI_ZONE_AREA_SET_COLS     3
#define SAFARI_ZONE_AREA_SET_ROWS     2
#define SAFARI_ZONE_MAX_AREAS_PER_SET (SAFARI_ZONE_AREA_SET_COLS * SAFARI_ZONE_AREA_SET_ROWS)
#define SAFARI_ZONE_MAX_AREA_SETS     2

#define SAFARI_ZONE_AREA_PLAINS      0
#define SAFARI_ZONE_AREA_MEADOW      1
#define SAFARI_ZONE_AREA_SAVANNAH    2
#define SAFARI_ZONE_AREA_PEAK        3
#define SAFARI_ZONE_AREA_ROCKY_BEACH 4
#define SAFARI_ZONE_AREA_WETLAND     5
#define SAFARI_ZONE_AREA_FOREST      6
#define SAFARI_ZONE_AREA_SWAMP       7
#define SAFARI_ZONE_AREA_MARSHLAND   8
#define SAFARI_ZONE_AREA_WASTELAND   9
#define SAFARI_ZONE_AREA_MOUNTAIN    10
#define SAFARI_ZONE_AREA_DESERT      11

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

typedef struct SAFARIZONE_LINKLEADER {
    s64 received_timestamp;
    s64 rtc_offset;
    u8 linked; // TODO: bool8
    u8 gender;
    u8 language;
    u8 version;
    u32 id;
    u16 name[PLAYER_NAME_LENGTH + 1];
} SAFARIZONE_LINKLEADER;

typedef struct SafariZone {
    SAFARIZONE_AREASET area_sets[SAFARI_ZONE_MAX_AREA_SETS];
    SAFARIZONE_LINKLEADER link_leader;
    u8 unk5F8;
    u8 objectUnlockLevel : 6;
    u8 unk5F9_6 : 2;
    u16 unk5FA;
} SafariZone;

u32 Save_SafariZone_sizeof(void);
SafariZone *Save_SafariZone_Get(SaveData *saveData);
void Save_SafariZone_Init(SafariZone *safari_zone);
void SafariZone_ResetAreaSetToDefaultSet(SAFARIZONE_AREASET *area_set, u32 default_set_no);
void sub_0202F5F8(SafariZone *safari_zone, s32 areaSetNo);
u8 sub_0202F620(SafariZone *safari_zone);
SAFARIZONE_AREASET *SafariZone_GetAreaSet(SafariZone *safari_zone, s32 area_set_no);
void SafariZone_CopyAreaSet(SafariZone *safari_zone, s32 area_set_no, SAFARIZONE_AREASET *area_set_dest);
void SafariZone_SetAreaSet(SafariZone *safari_zone, s32 area_set_no, SAFARIZONE_AREASET *area_set_src);
void sub_0202F6A0(SafariZone *safari_zone, u8 a1);
u8 sub_0202F6AC(SafariZone *safari_zone);
void sub_0202F6B8(SAFARIZONE_AREASET *area_set, s32 a1);
u8 SafariZone_GetObjectUnlockLevel(SafariZone *safari_zone);
u8 SafariZone_IncObjectUnlockLevel(SafariZone *safari_zone, s32 a1);
void SafariZone_SetObjectUnlockLevel(SafariZone *safari_zone, u8 a1);
void sub_0202F784(SafariZone *safari_zone, IGT *igt);
u32 sub_0202F798(SafariZone *safari_zone, IGT *igt, s32 a2);
void SafariZone_SetLinkLeaderFromProfile(SafariZone *safari_zone, PlayerProfile *profile, HeapID heapId);
void SafariZone_GetLinkLeaderToProfile(SafariZone *safari_zone, PlayerProfile *profile);
u8 SafariZone_GetLinkLeaderGender(SafariZone *safari_zone);
u8 SafariZone_IsCurrentlyLinked(SafariZone *safari_zone);
void SafariZone_DeactivateLinkIfExpired(SafariZone *safari_zone);
void SafariZone_SwapAreasInSet(SAFARIZONE_AREASET *area_set, u32 first, u32 second);
void SafariZone_InitAreaInSet(SAFARIZONE_AREASET *area_set, s32 area_idx, u32 area_no);
void SafariZone_AddObjectToArea(SAFARIZONE_AREASET *area_set, s32 area_idx, const SAFARIZONE_OBJECT *object);
void SafariZone_RemoveObjectFromArea(SAFARIZONE_AREASET *area_set, s32 area_idx, s32 object_idx);
void SafariZone_InitAreaSet(SAFARIZONE_AREASET *area_set);
void SafariZone_InitArea(SAFARIZONE_AREA *area, u8 area_no);
void SafariZone_ClearObject(SAFARIZONE_OBJECT *object);
void SafariZone_ClearLeader(SAFARIZONE_LINKLEADER *link_leader);
BOOL sub_0202FA3C(u8 a0, u8 *a1, u8 a2);

#endif
