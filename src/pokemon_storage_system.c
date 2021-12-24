#include "pokemon_storage_system.h"
#include "msgdata.h"
#include "pokemon.h"
#include "msgdata/msg/msg_00000024.h"

void PCStorage_InitializeBoxes(PC_STORAGE *storage);
BOOL PCStorage_PlaceMonInBoxFirstEmptySlot(PC_STORAGE *storage, u32 boxno, BOXMON *boxmon);
void PCStorage_SetBoxModified(PC_STORAGE *storage, u8 boxno);

void PCStorage_init(PC_STORAGE *storage) {
    PCStorage_InitializeBoxes(storage);
}

int PCStorage_sizeof(void) {
    return sizeof(PC_STORAGE);
}

void PCStorage_InitializeBoxes(PC_STORAGE *storage) {
    u32 i, j;
    MSGDATA *msgData;

    for (i = 0; i < NUM_BOXES; i++) {
        for (j = 0; j < MONS_PER_BOX; j++) {
            ZeroBoxMonData(&storage->boxes[i].mons[j]);
        }
    }

    for (i = 0, j = 0; i < NUM_BOXES; i++) {
        storage->wallpapers[i] = j;
        j++;
        if (j >= DEFAULT_WALLPAPER_MAX) {
            j = 0;
        }
    }

    storage->unlockedWallpapers = 0;

    msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_00000024_bin, 0);
    if (msgData != NULL) {
        for (i = 0; i < NUM_BOXES; i++) {
            ReadMsgDataIntoU16Array(msgData, i + msg_00000024_00006, storage->box_names[i]);
        }
        DestroyMsgData(msgData);
    }

    storage->curBox = 0;
}

BOOL PCStorage_PlaceMonInFirstEmptySlotInAnyBox(PC_STORAGE *storage, BOXMON *boxmon) {
    u32 i = storage->curBox;
    do {
        RestoreBoxMonPP(boxmon);
        if (PCStorage_PlaceMonInBoxFirstEmptySlot(storage, i, boxmon)) {
            PCStorage_SetBoxModified(storage, i);
            return TRUE;
        }
        i++;
        if (i >= NUM_BOXES) {
            i = 0;
        }
    } while (i != storage->curBox);
    return FALSE;
}

BOOL PCStorage_PlaceMonInBoxFirstEmptySlot(PC_STORAGE* storage, u32 boxno, BOXMON* boxmon) {
    u32 i;
    RestoreBoxMonPP(boxmon);
    if (boxno == -1u) {
        boxno = storage->curBox;
    }
    for (i = 0; i < MONS_PER_BOX; i++) {
        if (GetBoxMonData(&storage->boxes[boxno].mons[i], MON_DATA_SPECIES, NULL) == SPECIES_NONE) {
            storage->boxes[boxno].mons[i] = *boxmon;
            PCStorage_SetBoxModified(storage, boxno);
            return TRUE;
        }
    }
    return FALSE;
}

BOOL PCStorage_PlaceMonInBoxByIndexPair(PC_STORAGE* storage, u32 boxno, u32 slotno, BOXMON* boxmon) {
    RestoreBoxMonPP(boxmon);
    if (boxno == -1u) {
        boxno = storage->curBox;
    }
    if (boxno < NUM_BOXES && slotno < MONS_PER_BOX) {
        storage->boxes[boxno].mons[slotno] = *boxmon;
        PCStorage_SetBoxModified(storage, boxno);
        return TRUE;
    }
    GF_ASSERT(0);
    return FALSE;
}

void PCStorage_SwapMonsInBoxByIndexPair(PC_STORAGE* storage, u32 boxno, u32 from, u32 to) {
    BOXMON temp;

    temp = storage->boxes[boxno].mons[from];
    storage->boxes[boxno].mons[from] = storage->boxes[boxno].mons[to];
    storage->boxes[boxno].mons[to] = temp;
    PCStorage_SetBoxModified(storage, boxno);
}

void PCStorage_DeleteBoxMonByIndexPair(PC_STORAGE* storage, u32 boxno, u32 slotno) {
    if (boxno == -1u) {
        boxno = storage->curBox;
    }
    if (slotno < MONS_PER_BOX && boxno < NUM_BOXES) {
        ZeroBoxMonData(&storage->boxes[boxno].mons[slotno]);
        PCStorage_SetBoxModified(storage, boxno);
        return;
    }

    GF_ASSERT(0);
}

int PCStorage_GetActiveBox(PC_STORAGE *storage) {
    return storage->curBox;
}

int PCStorage_FindFirstBoxWithEmptySlot(PC_STORAGE *storage) {
    int boxno = storage->curBox;
    int i;

    do {
        for (i = 0; i < MONS_PER_BOX; i++) {
            if (!GetBoxMonData(&storage->boxes[boxno].mons[i], MON_DATA_SPECIES_EXISTS, NULL)) {
                return boxno;
            }
        }
        boxno++;
        if (boxno >= NUM_BOXES) {
            boxno = 0;
        }
    } while (boxno != storage->curBox);
    return NUM_BOXES;
}

BOOL PCStorage_FindFirstEmptySlot(PC_STORAGE* storage, int* boxno_p, int* slotno_p) {
    int i, j;

    if (*boxno_p == -1) {
        *boxno_p = storage->curBox;
    }

    i = *boxno_p;
    j = *slotno_p;

    do {
        while (j < MONS_PER_BOX) {
            if (!GetBoxMonData(&storage->boxes[i].mons[j], MON_DATA_SPECIES_EXISTS, NULL)) {
                *boxno_p = i;
                *slotno_p = j;
                return TRUE;
            }
            j++;
        }
        i++;
        if (i >= NUM_BOXES) {
            i = 0;
        }
        if (i == *boxno_p) {
            break;
        }
        j = 0;
    } while (1);

    // Long-standing bug: should return FALSE.
    // Has no effect on game because
    // the return value is never used.
    return NUM_BOXES;
}

int PCStorage_CountEmptySpotsInAllBoxes(PC_STORAGE* storage) {
    int i, j, count = 0;
    for (i = 0; i < NUM_BOXES; i++) {
        for (j = 0; j < MONS_PER_BOX; j++) {
            if (!GetBoxMonData(&storage->boxes[i].mons[j], MON_DATA_SPECIES_EXISTS, NULL)) {
                count++;
            }
        }
    }
    return count;
}

int PCStorage_CountEmptySpotsInBox(PC_STORAGE* storage, u32 boxno) {
    int i, count;

    if (boxno == -1u) {
        boxno = storage->curBox;
    }
    GF_ASSERT(boxno < NUM_BOXES);
    count = 0;
    for (i = 0; i < MONS_PER_BOX; i++) {
        if (!GetBoxMonData(&storage->boxes[boxno].mons[i], MON_DATA_SPECIES_EXISTS, NULL)) {
            count++;
        }
    }
    return count;
}

void PCStorage_SetActiveBox(PC_STORAGE* storage, u32 boxno) {
    if (boxno < NUM_BOXES) {
        storage->curBox = boxno;
        return;
    }
    GF_ASSERT(0);
}

u8 PCStorage_GetBoxWallpaper(PC_STORAGE* storage, u32 boxno) {
    if (boxno < NUM_BOXES) {
        return storage->wallpapers[boxno];
    }
    GF_ASSERT(0);
    return 0;
}

BOOL PCStorage_IsValidWallpaperId(u8 wallpaperno) {
    return (wallpaperno >= DEFAULT_WALLPAPER_MIN && wallpaperno < DEFAULT_WALLPAPER_MAX)
    || (wallpaperno >= BONUS_WALLPAPER_MIN && wallpaperno < BONUS_WALLPAPER_MAX);
}

void PCStorage_SetBoxWallpaper(PC_STORAGE* storage, u32 boxno, u8 wallpaperno) {
    if (boxno == -1u) {
        boxno = storage->curBox;
    }
    if (boxno < NUM_BOXES && PCStorage_IsValidWallpaperId(wallpaperno) == TRUE) {
        storage->wallpapers[boxno] = wallpaperno;
        return;
    }
    GF_ASSERT(0);
}

void PCStorage_GetBoxName(PC_STORAGE* storage, u32 boxno, STRING* dest) {
    if (boxno == -1u) {
        boxno = storage->curBox;
    }
    if (boxno < NUM_BOXES) {
        CopyU16ArrayToString(dest, storage->box_names[boxno]);
        return;
    }
    GF_ASSERT(0);
}

void PCStorage_SetBoxName(PC_STORAGE* storage, u32 boxno, const STRING* src) {
    if (boxno == -1u) {
        boxno = storage->curBox;
    }
    if (boxno < NUM_BOXES) {
        CopyStringToU16Array(src, storage->box_names[boxno], BOX_NAME_LENGTH);
    }
}
