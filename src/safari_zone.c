#include "gf_rtc.h"
#include "safari_zone.h"
#include "string_util.h"
#include <nitro/mi/memory.h>
#include <nitro/os/ownerInfo.h>

static const u8 sSafariZoneDefaultAreaSets[10][6] = {
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
        MI_CpuFill8(&safari_zone->area_sets[i], 0, sizeof(SAFARIZONE_AREASET));
    }

    sub_0202FA08(&safari_zone->unk5D0);
}

void sub_0202F5B8(SAFARIZONE_AREASET* area_set, u32 a1) {
    u32 default_set_no = a1 % 10;
    for (s32 i = 0; i < SAFARI_ZONE_MAX_AREAS_PER_SET; i++) {
        sub_0202F9E8(&area_set->areas[i], sSafariZoneDefaultAreaSets[default_set_no][i]);
    }

    MI_CpuFill8(area_set->unk2DC, 0, sizeof(area_set->unk2DC));
}

void sub_0202F5F8(SAFARIZONE* safari_zone, s32 a1) {
    if (a1 >= 2) {
        GF_ASSERT(FALSE);
        a1 = 0;
    }

    safari_zone->unk5F9_6 = a1;
}

u8 sub_0202F620(SAFARIZONE* safari_zone) {
    return safari_zone->unk5F9_6;
}

SAFARIZONE_AREASET* sub_0202F630(SAFARIZONE* safari_zone, s32 area_set_no) {
    if (area_set_no == 3) {
        area_set_no = safari_zone->unk5F9_6;
    }

    if (area_set_no >= SAFARI_ZONE_MAX_AREA_SETS) {
        GF_ASSERT(FALSE);
        area_set_no = 0;
    }

    return &safari_zone->area_sets[area_set_no];
}

void sub_0202F658(SAFARIZONE* safari_zone, s32 area_set_no, SAFARIZONE_AREASET* area_set) {
    if (area_set_no >= SAFARI_ZONE_MAX_AREA_SETS) {
        GF_ASSERT(FALSE);
        sub_0202F9CC(area_set);
        return;
    }

    MI_CpuCopy8(&safari_zone->area_sets[area_set_no], area_set, sizeof(SAFARIZONE_AREASET));
}

void sub_0202F680(SAFARIZONE* safari_zone, s32 area_set_no, SAFARIZONE_AREASET* area_set) {
    if (area_set_no >= SAFARI_ZONE_MAX_AREA_SETS) {
        GF_ASSERT(FALSE);
        return;
    }

    MI_CpuCopy8(area_set, &safari_zone->area_sets[area_set_no], sizeof(SAFARIZONE_AREASET));
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
    MI_CpuFill8(sp8, 0, NELEMS(sp8));
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

void sub_0202F7D8(SAFARIZONE* safari_zone, PLAYERPROFILE* profile, HeapID heap_id) {
    SAFARIZONE_UNKSUB *unksub = &safari_zone->unk5D0;
    unksub->id = PlayerProfile_GetTrainerID(profile);
    unksub->gender = PlayerProfile_GetTrainerGender(profile);
    unksub->language = PlayerProfile_GetLanguage(profile);
    unksub->version = PlayerProfile_GetVersion(profile);

    STRING* name = String_ctor((OT_NAME_LENGTH + 1) * sizeof(u16), heap_id);
    PlayerName_FlatToString(profile, name);
    CopyStringToU16Array(name, unksub->name, (OT_NAME_LENGTH + 1) * sizeof(u16));
    String_dtor(name);

    unksub->unk10 = 1;

    unksub->seconds_since_epoch = GF_RTC_DateTimeToSec();
    unksub->rtc_offset = OS_GetOwnerRtcOffset();
}

void sub_0202F844(SAFARIZONE* safari_zone, PLAYERPROFILE* profile) {
    SAFARIZONE_UNKSUB *unksub = &safari_zone->unk5D0;
    PlayerProfile_SetTrainerID(profile, unksub->id);
    PlayerProfile_SetTrainerGender(profile, unksub->gender);
    PlayerProfile_SetLanguage(profile, unksub->language);
    PlayerProfile_SetVersion(profile, unksub->version);
    Sav2_Profile_PlayerName_set(profile, unksub->name);
}

u8 sub_0202F87C(SAFARIZONE* safari_zone) {
    return safari_zone->unk5D0.gender;
}

u8 sub_0202F888(SAFARIZONE* safari_zone) {
    return safari_zone->unk5D0.unk10;
}

void sub_0202F890(SAFARIZONE* safari_zone) {
    SAFARIZONE_UNKSUB *unksub = &safari_zone->unk5D0;
    if (unksub->unk10 == 0) {
        return;
    }

    if ((24 * 60 * 60) < GF_RTC_DateTimeToSec() - unksub->seconds_since_epoch) {
        unksub->unk10 = 0;
        return;
    }

    if (unksub->rtc_offset != OS_GetOwnerRtcOffset()) {
        unksub->unk10 = 0;
    }
}

void sub_0202F8D4(SAFARIZONE_AREASET* area_set, u32 first, u32 second) {
    SAFARIZONE_AREA tmp = area_set->areas[first];
    area_set->areas[first] = area_set->areas[second];
    area_set->areas[second] = tmp;
}

void sub_0202F91C(SAFARIZONE_AREASET* area_set, s32 area_idx, u32 area_no) {
    sub_0202F9E8(&area_set->areas[area_idx], area_no);
}

void sub_0202F930(SAFARIZONE_AREASET* area_set, s32 area_idx, const SAFARIZONE_OBJECT* object) {
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

void sub_0202F968(SAFARIZONE_AREASET* area_set, s32 area_idx, s32 object_idx) {
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
        sub_0202F9FC(&area->objects[object_idx]);
    } else {
        for (; object_idx < area->active_object_count; object_idx++) {
            area->objects[object_idx] = area->objects[object_idx + 1];
        }

        sub_0202F9FC(&area->objects[area->active_object_count]);
    }
}

void sub_0202F9CC(SAFARIZONE_AREASET* area_set) {
    for (s32 i = 0; i < SAFARI_ZONE_MAX_AREAS_PER_SET; i++) {
        sub_0202F9E8(&area_set->areas[i], i);
    }
}

void sub_0202F9E8(SAFARIZONE_AREA* area, u8 area_no) {
    MI_CpuFill8(area, 0, sizeof(SAFARIZONE_AREA));
    area->area_no = area_no;
}

void sub_0202F9FC(SAFARIZONE_OBJECT* object) {
    MI_CpuFill8(object, 0, sizeof(SAFARIZONE_OBJECT));
}

void sub_0202FA08(SAFARIZONE_UNKSUB* a0) {
    MI_CpuFill8(a0, 0, sizeof(SAFARIZONE_UNKSUB));

    a0->id = 0;
    a0->gender = 0;
    a0->language = gGameLanguage;
    a0->version = gGameVersion;
    StringFillEOS(a0->name, OT_NAME_LENGTH + 1);
}

BOOL sub_0202FA3C(u8 a0, u8* a1, u8 a2) {
    for (s32 i = 0; i < a2; i++) {
        if (a0 == a1[i]) {
            return TRUE;
        }
    }

    return FALSE;
}
