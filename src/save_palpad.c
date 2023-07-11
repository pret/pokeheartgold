#include "global.h"
#include "save_palpad.h"
#include "pm_string.h"

u32 Save_PalPad_sizeof(void) {
    return sizeof(SavePalPad) * NUM_PALPAD_ENTRIES;
}

SavePalPad *Save_PalPad_Get(SaveData *saveData) {
    return SaveArray_Get(saveData, SAVE_PALPAD);
}

void Save_PalPad_Init(SavePalPad *palPad) {
    int i;

    for (i = 0; i < NUM_PALPAD_ENTRIES; i++) {
        memset(&palPad[i], 0, sizeof(SavePalPad));
        palPad[i].name[0] = EOS;
    }
}

SavePalPad *PalPad_GetNthEntry(SavePalPad *arr, int n) {
    return &arr[n];
}

u8 PalPadEntry_GetFromUnk68Array(SavePalPad *palPad, int n) {
    return palPad->unk_68[n];
}

static BOOL PalPadEntry_IsEqual(SavePalPad *a, SavePalPad *b) {
    return !StringNotEqual(a->name, b->name) && a->otid == b->otid;
}

void SavePalPad_Merge(SavePalPad *a, SavePalPad *b, int n, HeapID heapId) {
    int i, j, k;
    int sp18[5];
    SavePalPad *c;

    c = AllocFromHeap(heapId, sizeof(SavePalPad) * NUM_PALPAD_ENTRIES);
    Save_PalPad_Init(c);

    for (i = 0; i < n; i++) {
        sp18[i] = -1;
        for (j = 0; j < NUM_PALPAD_ENTRIES; j++) {
            if (PalPadEntry_IsEqual(&a[j], &b[i])) {
                sp18[i] = j;
            }
        }
    }
    k = 0;
    for (i = 0; i < n; i++) {
        c[k] = b[i];
        if (sp18[i] >= 0) {
            a[sp18[i]].name[0] = EOS;
        }
        k++;
    }
    for (i = 0; i < NUM_PALPAD_ENTRIES; i++) {
        if (a[i].name[0] != EOS) {
            c[k] = a[i];
            k++;
            if (k >= NUM_PALPAD_ENTRIES) {
                break;
            }
        }
    }
    memcpy(a, c, sizeof(SavePalPad) * NUM_PALPAD_ENTRIES);
    FreeToHeap(c);
}

int PalPad_PlayerIdIsFriendOrMutual(SavePalPad *palPad, u32 otId) {
    int i, j;

    for (i = 0; i < NUM_PALPAD_ENTRIES; i++) {
        if (otId == palPad[i].otid) {
            return 1;
        }
    }

    for (i = 0; i < NUM_PALPAD_ENTRIES; i++) {
        for (j = 0; j < NUM_FRIENDS_PER_ENTRY; j++) {
            if (otId == palPad[i].unk_18[j]) {
                return i + 2;
            }
        }
    }

    return 0;
}
