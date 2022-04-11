#include "pokewalker.h"

static BOOL pokewalkerHasBoxmon(POKEWALKER *pokeWalker);

POKEWALKER *Sav2_Pokewalker_get(SAVEDATA *saveData) {
    return SavArray_get(saveData, SAVE_POKEWALKER);
}

u32 Pokewalker_sizeof(void) {
    return sizeof(POKEWALKER);
}

void Pokewalker_init(POKEWALKER *pokeWalker) {
    MI_CpuClearFast(pokeWalker, sizeof(POKEWALKER));
    Pokewalker_UnlockCourse(pokeWalker, WALKER_COURSE_REFRESHING_FIELD);
    Pokewalker_UnlockCourse(pokeWalker, WALKER_COURSE_NOISY_FOREST);
}

void sub_02032624(POKEWALKER *pokeWalker) {
    u32 bak = pokeWalker->unlockedCourses;
    Pokewalker_init(pokeWalker);
    pokeWalker->unlockedCourses = bak;
}

u16 sub_0203263C(const POKEWALKER *pokeWalker) {
    return pokeWalker->unk_124;
}

void sub_02032644(POKEWALKER *pokeWalker) {
    pokeWalker->unk_124++;
}

void sub_02032650(POKEWALKER *pokeWalker, u32 a1, u32 a2) {
    pokeWalker->unk_128 = a1;
    pokeWalker->unk_12C += a2;
    if (pokeWalker->unk_12C >= 9999999) {
        pokeWalker->unk_12C = 9999999;
    }
}

void sub_02032674(POKEWALKER *pokeWalker, u32 *a1, u32 *a2) {
    *a1 = pokeWalker->unk_128;
    *a2 = pokeWalker->unk_12C;
}

void sub_02032688(POKEWALKER *pokeWalker, u16 *a1, u16 *a2) {
    GF_ASSERT(pokeWalker != NULL);
    *a1 = pokeWalker->unk_000;
    *a2 = pokeWalker->unk_002;
}

void sub_020326A4(POKEWALKER *pokeWalker, u16 a1, u16 a2) {
    GF_ASSERT(pokeWalker != NULL);
    pokeWalker->unk_000 = a1;
    pokeWalker->unk_002 = a2;
}

void Pokewalker_SetBoxMon(POKEWALKER *pokeWalker, BOXMON *boxmon) {
    MI_CpuCopyFast(boxmon, &pokeWalker->pokemon, sizeof(BOXMON));
}

void Pokewalker_ClearBoxMon(POKEWALKER *pokeWalker) {
    MI_CpuClearFast(&pokeWalker->pokemon, sizeof(BOXMON));
}

BOOL Pokewalker_TryGetBoxMon(POKEWALKER *pokeWalker, BOXMON *boxmon) {
    if (pokewalkerHasBoxmon(pokeWalker)) {
        MI_CpuCopyFast(&pokeWalker->pokemon, boxmon, sizeof(BOXMON));
        return TRUE;
    }
    return FALSE;
}

static BOOL pokewalkerHasBoxmon(POKEWALKER *pokeWalker) {
    // This is an annoying hack to get it matching.
    // Should just memcmp with (BOXMON){}
    u8 * ptr = (u8 *)pokeWalker;
    int i;

    for (i = 0; i < (int)sizeof(BOXMON); i++) {
        if (ptr[i + offsetof(POKEWALKER, pokemon)] != 0) {
            break;
        }
    }
    if (i == sizeof(BOXMON)) {
        return FALSE;
    }
    return TRUE;
}

u16 sub_02032718(POKEWALKER *pokeWalker) {
    return pokeWalker->unk_0F8;
}

void sub_02032720(POKEWALKER *pokeWalker, u16 a1) {
    pokeWalker->unk_0F8 = a1;
}

void *sub_02032728(POKEWALKER *pokeWalker) {
    return &pokeWalker->unk_0FC;
}

BOOL Pokewalker_CourseIsUnlocked(POKEWALKER *pokeWalker, int courseNo) {
    if (courseNo >= 32) {
        return FALSE;
    }
    return ((pokeWalker->unlockedCourses >> courseNo) & 1);
}

void Pokewalker_UnlockCourse(POKEWALKER *pokeWalker, int courseNo) {
    GF_ASSERT(courseNo < 32);
    pokeWalker->unlockedCourses |= (1 << courseNo);
}

u16 sub_02032764(POKEWALKER *pokeWalker) {
    return pokeWalker->unk_0FA;
}

void sub_0203276C(POKEWALKER *pokeWalker) {
    pokeWalker->unk_0FA = TRUE;
}
