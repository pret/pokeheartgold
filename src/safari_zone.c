#include "gf_rtc.h"
#include "safari_zone.h"
#include "string_util.h"
#include <nitro/mi/memory.h>
#include <nitro/os/ownerInfo.h>

static const u8 sSafariZoneDefaultAreaSets[10][SAFARI_ZONE_MAX_AREAS_PER_SET] = {
    { SAFARI_ZONE_AREA_PLAINS, SAFARI_ZONE_AREA_SWAMP, SAFARI_ZONE_AREA_MEADOW,
      SAFARI_ZONE_AREA_WETLAND, SAFARI_ZONE_AREA_PEAK, SAFARI_ZONE_AREA_FOREST },
    { SAFARI_ZONE_AREA_MEADOW, SAFARI_ZONE_AREA_MARSHLAND, SAFARI_ZONE_AREA_WETLAND,
      SAFARI_ZONE_AREA_FOREST, SAFARI_ZONE_AREA_PEAK, SAFARI_ZONE_AREA_SWAMP },
    { SAFARI_ZONE_AREA_WETLAND, SAFARI_ZONE_AREA_WASTELAND, SAFARI_ZONE_AREA_FOREST,
      SAFARI_ZONE_AREA_SWAMP, SAFARI_ZONE_AREA_PEAK, SAFARI_ZONE_AREA_MARSHLAND },
    { SAFARI_ZONE_AREA_FOREST, SAFARI_ZONE_AREA_MOUNTAIN, SAFARI_ZONE_AREA_SWAMP,
      SAFARI_ZONE_AREA_MARSHLAND, SAFARI_ZONE_AREA_PEAK, SAFARI_ZONE_AREA_WASTELAND },
    { SAFARI_ZONE_AREA_SWAMP, SAFARI_ZONE_AREA_SAVANNAH, SAFARI_ZONE_AREA_MARSHLAND,
      SAFARI_ZONE_AREA_WASTELAND, SAFARI_ZONE_AREA_PEAK, SAFARI_ZONE_AREA_MOUNTAIN },
    { SAFARI_ZONE_AREA_MARSHLAND, SAFARI_ZONE_AREA_PLAINS, SAFARI_ZONE_AREA_WASTELAND,
      SAFARI_ZONE_AREA_MOUNTAIN, SAFARI_ZONE_AREA_PEAK, SAFARI_ZONE_AREA_SAVANNAH },
    { SAFARI_ZONE_AREA_WASTELAND, SAFARI_ZONE_AREA_MEADOW, SAFARI_ZONE_AREA_MOUNTAIN,
      SAFARI_ZONE_AREA_SAVANNAH, SAFARI_ZONE_AREA_PEAK, SAFARI_ZONE_AREA_PLAINS },
    { SAFARI_ZONE_AREA_MOUNTAIN, SAFARI_ZONE_AREA_WETLAND, SAFARI_ZONE_AREA_SAVANNAH,
      SAFARI_ZONE_AREA_PLAINS, SAFARI_ZONE_AREA_PEAK, SAFARI_ZONE_AREA_MEADOW },
    { SAFARI_ZONE_AREA_SAVANNAH, SAFARI_ZONE_AREA_FOREST, SAFARI_ZONE_AREA_PLAINS,
      SAFARI_ZONE_AREA_MEADOW, SAFARI_ZONE_AREA_PEAK, SAFARI_ZONE_AREA_WETLAND },
    { SAFARI_ZONE_AREA_PLAINS, SAFARI_ZONE_AREA_SAVANNAH, SAFARI_ZONE_AREA_WETLAND,
      SAFARI_ZONE_AREA_SWAMP, SAFARI_ZONE_AREA_PEAK, SAFARI_ZONE_AREA_WASTELAND },
};

u32 Save_SafariZone_sizeof(void) {
    return sizeof(SAFARIZONE);
}

SAFARIZONE* Save_SafariZone_get(SAVEDATA* savedata) {
    return SavArray_get(savedata, SAVE_SAFARI_ZONE);
}

void Save_SafariZone_init(SAFARIZONE* safari_zone) {
    for (s32 i = 0; i < SAFARI_ZONE_MAX_AREA_SETS; i++) {
        MI_CpuClear8(&safari_zone->area_sets[i], sizeof(SAFARIZONE_AREASET));
    }

    SafariZone_ClearLeader(&safari_zone->link_leader);
}

void SafariZone_ResetAreaSetToDefaultSet(SAFARIZONE_AREASET* area_set, u32 default_set_no) {
    u32 default_set_no_mod = default_set_no % NELEMS(sSafariZoneDefaultAreaSets);
    for (s32 i = 0; i < SAFARI_ZONE_MAX_AREAS_PER_SET; i++) {
        SafariZone_InitArea(&area_set->areas[i], sSafariZoneDefaultAreaSets[default_set_no_mod][i]);
    }

    MI_CpuClear8(area_set->unk2DC, sizeof(area_set->unk2DC));
}

void sub_0202F5F8(SAFARIZONE* safari_zone, s32 areaSetNo) {
    if (areaSetNo >= SAFARI_ZONE_MAX_AREA_SETS) {
        GF_ASSERT(FALSE);
        areaSetNo = 0;
    }

    safari_zone->unk5F9_6 = areaSetNo;
}

u8 sub_0202F620(SAFARIZONE* safari_zone) {
    return safari_zone->unk5F9_6;
}

SAFARIZONE_AREASET* SafariZone_GetAreaSet(SAFARIZONE* safari_zone, s32 area_set_no) {
    if (area_set_no == 3) {
        area_set_no = safari_zone->unk5F9_6;
    }

    if (area_set_no >= SAFARI_ZONE_MAX_AREA_SETS) {
        GF_ASSERT(FALSE);
        area_set_no = 0;
    }

    return &safari_zone->area_sets[area_set_no];
}

void SafariZone_CopyAreaSet(SAFARIZONE* safari_zone, s32 area_set_no, SAFARIZONE_AREASET* area_set_dest) {
    if (area_set_no >= SAFARI_ZONE_MAX_AREA_SETS) {
        GF_ASSERT(FALSE);
        SafariZone_InitAreaSet(area_set_dest);
        return;
    }

    MI_CpuCopy8(&safari_zone->area_sets[area_set_no], area_set_dest, sizeof(SAFARIZONE_AREASET));
}

void SafariZone_SetAreaSet(SAFARIZONE* safari_zone, s32 area_set_no, SAFARIZONE_AREASET* area_set_src) {
    if (area_set_no >= SAFARI_ZONE_MAX_AREA_SETS) {
        GF_ASSERT(FALSE);
        return;
    }

    MI_CpuCopy8(area_set_src, &safari_zone->area_sets[area_set_no], sizeof(SAFARIZONE_AREASET));
}

void sub_0202F6A0(SAFARIZONE* safari_zone, u8 a1) {
    safari_zone->unk5F8 = a1;
}

u8 sub_0202F6AC(SAFARIZONE* safari_zone) {
    return safari_zone->unk5F8;
}

void sub_0202F6B8(SAFARIZONE_AREASET* area_set, s32 a1) {
    u8 sp8[6];
    u32 area_no;
    int j;
    int i;

    if (a1 <= 0) {
        return;
    }

    j = 0;
    MI_CpuClear8(sp8, NELEMS(sp8));
    for (i = 0; i < SAFARI_ZONE_MAX_AREAS_PER_SET; i++) {
        area_no = area_set->areas[i].area_no;
        if (sub_0202FA3C(area_no, sp8, j)) {
            continue;
        }

        if (area_set->unk2DC[area_no] + a1 < 0xFF) {
            area_set->unk2DC[area_no] += a1;
        } else {
            area_set->unk2DC[area_no] = 0xFF;
        }

        sp8[j++] = area_no;
    }
}

u8 sub_0202F720(SAFARIZONE* safari_zone) {
    return safari_zone->unk5F9_0;
}

u8 sub_0202F730(SAFARIZONE* safari_zone, s32 a1) {
    sub_0202F754(safari_zone, (u8)(safari_zone->unk5F9_0 + a1));
    return safari_zone->unk5F9_0;
}

void sub_0202F754(SAFARIZONE* safari_zone, u8 a1) {
    if (a1 > 4) {
        safari_zone->unk5F9_0 = 4;
    } else {
        safari_zone->unk5F9_0 = a1;
    }
}

void sub_0202F784(SAFARIZONE* safari_zone, IGT* igt) {
    safari_zone->unk5FA = (igt->hours * 60) + igt->minutes;
}

u32 sub_0202F798(SAFARIZONE* safari_zone, IGT* igt, s32 a2) {
    u16 minutes = (igt->hours * 60) + igt->minutes;
    s32 delta = minutes - safari_zone->unk5FA;

    if (delta >= a2 * 60) {
        return 1;
    }

    if (minutes >= 59999) {
        return 2;
    }

    return 0;
}

void SafariZone_SetLinkLeaderFromProfile(SAFARIZONE* safari_zone, PLAYERPROFILE* profile, HeapID heap_id) {
    SAFARIZONE_LINKLEADER *link_leader = &safari_zone->link_leader;
    link_leader->id = PlayerProfile_GetTrainerID(profile);
    link_leader->gender = PlayerProfile_GetTrainerGender(profile);
    link_leader->language = PlayerProfile_GetLanguage(profile);
    link_leader->version = PlayerProfile_GetVersion(profile);

    STRING* name = String_ctor((OT_NAME_LENGTH + 1) * sizeof(u16), heap_id);
    PlayerName_FlatToString(profile, name);
    CopyStringToU16Array(name, link_leader->name, (OT_NAME_LENGTH + 1) * sizeof(u16));
    String_dtor(name);

    link_leader->linked = TRUE;

    link_leader->received_timestamp = GF_RTC_DateTimeToSec();
    link_leader->rtc_offset = OS_GetOwnerRtcOffset();
}

void SafariZone_GetLinkLeaderToProfile(SAFARIZONE* safari_zone, PLAYERPROFILE* profile) {
    SAFARIZONE_LINKLEADER *link_leader = &safari_zone->link_leader;
    PlayerProfile_SetTrainerID(profile, link_leader->id);
    PlayerProfile_SetTrainerGender(profile, link_leader->gender);
    PlayerProfile_SetLanguage(profile, link_leader->language);
    PlayerProfile_SetVersion(profile, link_leader->version);
    Sav2_Profile_PlayerName_set(profile, link_leader->name);
}

u8 SafariZone_GetLinkLeaderGender(SAFARIZONE* safari_zone) {
    return safari_zone->link_leader.gender;
}

u8 SafariZone_IsCurrentlyLinked(SAFARIZONE* safari_zone) {
    return safari_zone->link_leader.linked;
}

void SafariZone_DeactivateLinkIfExpired(SAFARIZONE* safari_zone) {
    SAFARIZONE_LINKLEADER *link_leader = &safari_zone->link_leader;
    if (!link_leader->linked) {
        return;
    }

    if ((24 * 60 * 60) < GF_RTC_DateTimeToSec() - link_leader->received_timestamp) {
        // It has been 24 hours since the player received the Safari Zone.
        link_leader->linked = FALSE;
        return;
    }

    if (link_leader->rtc_offset != OS_GetOwnerRtcOffset()) {
        // The player changed their system's time since receiving the Safari Zone.
        link_leader->linked = FALSE;
    }
}

void SafariZone_SwapAreasInSet(SAFARIZONE_AREASET* area_set, u32 first, u32 second) {
    SAFARIZONE_AREA tmp = area_set->areas[first];
    area_set->areas[first] = area_set->areas[second];
    area_set->areas[second] = tmp;
}

void SafariZone_InitAreaInSet(SAFARIZONE_AREASET* area_set, s32 area_idx, u32 area_no) {
    SafariZone_InitArea(&area_set->areas[area_idx], area_no);
}

void SafariZone_AddObjectToArea(SAFARIZONE_AREASET* area_set, s32 area_idx, const SAFARIZONE_OBJECT* object) {
    if (area_idx >= SAFARI_ZONE_MAX_AREAS_PER_SET) {
        GF_ASSERT(FALSE);
        return;
    }

    SAFARIZONE_AREA* area = &area_set->areas[area_idx];
    if (area->active_object_count >= SAFARI_ZONE_MAX_OBJECTS) {
        GF_ASSERT(FALSE);
        return;
    }

    area->objects[area->active_object_count++] = *object;
}

void SafariZone_RemoveObjectFromArea(SAFARIZONE_AREASET* area_set, s32 area_idx, s32 object_idx) {
    if (area_idx >= SAFARI_ZONE_MAX_AREAS_PER_SET) {
        GF_ASSERT(FALSE);
        return;
    }

    SAFARIZONE_AREA* area = &area_set->areas[area_idx];
    if ((u32)object_idx >= area->active_object_count) {
        GF_ASSERT(FALSE);
        return;
    }

    if (object_idx == --area->active_object_count) {
        SafariZone_ClearObject(&area->objects[object_idx]);
    } else {
        for (; object_idx < area->active_object_count; object_idx++) {
            area->objects[object_idx] = area->objects[object_idx + 1];
        }

        SafariZone_ClearObject(&area->objects[area->active_object_count]);
    }
}

void SafariZone_InitAreaSet(SAFARIZONE_AREASET* area_set) {
    for (s32 i = 0; i < SAFARI_ZONE_MAX_AREAS_PER_SET; i++) {
        SafariZone_InitArea(&area_set->areas[i], i);
    }
}

void SafariZone_InitArea(SAFARIZONE_AREA* area, u8 area_no) {
    MI_CpuClear8(area, sizeof(SAFARIZONE_AREA));
    area->area_no = area_no;
}

void SafariZone_ClearObject(SAFARIZONE_OBJECT* object) {
    MI_CpuClear8(object, sizeof(SAFARIZONE_OBJECT));
}

void SafariZone_ClearLeader(SAFARIZONE_LINKLEADER* link_leader) {
    MI_CpuClear8(link_leader, sizeof(SAFARIZONE_LINKLEADER));

    link_leader->id = 0;
    link_leader->gender = 0;
    link_leader->language = gGameLanguage;
    link_leader->version = gGameVersion;
    StringFillEOS(link_leader->name, OT_NAME_LENGTH + 1);
}

BOOL sub_0202FA3C(u8 a0, u8* a1, u8 a2) {
    for (s32 i = 0; i < a2; i++) {
        if (a0 == a1[i]) {
            return TRUE;
        }
    }

    return FALSE;
}
