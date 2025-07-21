#include "pokemon_storage_system.h"

#include "global.h"

#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0024.h"

#include "msgdata.h"
#include "pokemon.h"

void PCStorage_InitializeBoxes(PCStorage *storage);
BOOL PCStorage_PlaceMonInBoxFirstEmptySlot(PCStorage *storage, u32 boxno, BoxPokemon *boxMon);
void PCStorage_SetBoxModified(PCStorage *storage, u8 boxno);

void PCStorage_Init(PCStorage *storage) {
    PCStorage_InitializeBoxes(storage);
}

u32 PCStorage_sizeof(void) {
    return sizeof(PCStorage);
}

void PCStorage_InitializeBoxes(PCStorage *storage) {
    u32 i, j;
    MsgData *msgData;

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

    msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0024_bin, HEAP_ID_DEFAULT);
    if (msgData != NULL) {
        for (i = 0; i < NUM_BOXES; i++) {
            ReadMsgDataIntoU16Array(msgData, i + msg_0024_00006, storage->box_names[i]);
        }
        DestroyMsgData(msgData);
    }

    storage->curBox = 0;
}

BOOL PCStorage_PlaceMonInFirstEmptySlotInAnyBox(PCStorage *storage, BoxPokemon *boxMon) {
    u32 i = storage->curBox;
    do {
        RestoreBoxMonPP(boxMon);
        if (PCStorage_PlaceMonInBoxFirstEmptySlot(storage, i, boxMon)) {
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

BOOL PCStorage_PlaceMonInBoxFirstEmptySlot(PCStorage *storage, u32 boxno, BoxPokemon *boxMon) {
    u32 i;
    RestoreBoxMonPP(boxMon);
    if (boxno == -1u) {
        boxno = storage->curBox;
    }
    for (i = 0; i < MONS_PER_BOX; i++) {
        if (GetBoxMonData(&storage->boxes[boxno].mons[i], MON_DATA_SPECIES, NULL) == SPECIES_NONE) {
            storage->boxes[boxno].mons[i] = *boxMon;
            PCStorage_SetBoxModified(storage, boxno);
            return TRUE;
        }
    }
    return FALSE;
}

BOOL PCStorage_PlaceMonInBoxByIndexPair(PCStorage *storage, u32 boxno, u32 slotno, BoxPokemon *boxMon) {
    RestoreBoxMonPP(boxMon);
    if (boxno == -1u) {
        boxno = storage->curBox;
    }
    if (boxno < NUM_BOXES && slotno < MONS_PER_BOX) {
        storage->boxes[boxno].mons[slotno] = *boxMon;
        PCStorage_SetBoxModified(storage, boxno);
        return TRUE;
    }
    GF_ASSERT(FALSE);
    return FALSE;
}

void PCStorage_SwapMonsInBoxByIndexPair(PCStorage *storage, u32 boxno, u32 from, u32 to) {
    BoxPokemon temp;

    temp = storage->boxes[boxno].mons[from];
    storage->boxes[boxno].mons[from] = storage->boxes[boxno].mons[to];
    storage->boxes[boxno].mons[to] = temp;
    PCStorage_SetBoxModified(storage, boxno);
}

void PCStorage_DeleteBoxMonByIndexPair(PCStorage *storage, u32 boxno, u32 slotno) {
    if (boxno == -1u) {
        boxno = storage->curBox;
    }
    if (slotno < MONS_PER_BOX && boxno < NUM_BOXES) {
        ZeroBoxMonData(&storage->boxes[boxno].mons[slotno]);
        PCStorage_SetBoxModified(storage, boxno);
        return;
    }

    GF_ASSERT(FALSE);
}

int PCStorage_GetActiveBox(PCStorage *storage) {
    return storage->curBox;
}

int PCStorage_FindFirstBoxWithEmptySlot(PCStorage *storage) {
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

BOOL PCStorage_FindFirstEmptySlot(PCStorage *storage, int *boxno_p, int *slotno_p) {
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

int PCStorage_CountEmptySpotsInAllBoxes(PCStorage *storage) {
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

int PCStorage_CountEmptySpotsInBox(PCStorage *storage, u32 boxno) {
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

void PCStorage_SetActiveBox(PCStorage *storage, u32 boxno) {
    if (boxno < NUM_BOXES) {
        storage->curBox = boxno;
        return;
    }
    GF_ASSERT(FALSE);
}

u8 PCStorage_GetBoxWallpaper(PCStorage *storage, u32 boxno) {
    if (boxno < NUM_BOXES) {
        return storage->wallpapers[boxno];
    }
    GF_ASSERT(FALSE);
    return 0;
}

BOOL PCStorage_IsValidWallpaperId(u8 wallpaperno) {
    return (wallpaperno >= DEFAULT_WALLPAPER_MIN && wallpaperno < DEFAULT_WALLPAPER_MAX)
        || (wallpaperno >= BONUS_WALLPAPER_MIN && wallpaperno < BONUS_WALLPAPER_MAX);
}

void PCStorage_SetBoxWallpaper(PCStorage *storage, u32 boxno, u8 wallpaperno) {
    if (boxno == -1u) {
        boxno = storage->curBox;
    }
    if (boxno < NUM_BOXES && PCStorage_IsValidWallpaperId(wallpaperno) == TRUE) {
        storage->wallpapers[boxno] = wallpaperno;
        return;
    }
    GF_ASSERT(FALSE);
}

void PCStorage_GetBoxName(PCStorage *storage, u32 boxno, String *dest) {
    if (boxno == -1u) {
        boxno = storage->curBox;
    }
    if (boxno < NUM_BOXES) {
        CopyU16ArrayToString(dest, storage->box_names[boxno]);
        return;
    }
    GF_ASSERT(FALSE);
}

void PCStorage_SetBoxName(PCStorage *storage, u32 boxno, const String *src) {
    if (boxno == -1u) {
        boxno = storage->curBox;
    }
    if (boxno < NUM_BOXES) {
        CopyStringToU16Array(src, storage->box_names[boxno], BOX_NAME_LENGTH);
    }
}

int PCStorage_CountMonsAndEggsInBox(PCStorage *storage, u32 boxno) {
    int i, count;
    if (boxno == -1u) {
        boxno = storage->curBox;
    }
    if (boxno < NUM_BOXES) {
        count = 0;
        for (i = 0; i < MONS_PER_BOX; i++) {
            if (GetBoxMonData(&storage->boxes[boxno].mons[i], MON_DATA_SPECIES_EXISTS, NULL)) {
                count++;
            }
        }
        return count;
    }

    GF_ASSERT(FALSE);
    return 0;
}

int PCStorage_CountMonsInBox(PCStorage *storage, u32 boxno) {
    int i, count;
    if (boxno == -1u) {
        boxno = storage->curBox;
    }
    if (boxno < NUM_BOXES) {
        count = 0;
        for (i = 0; i < MONS_PER_BOX; i++) {
            if (GetBoxMonData(&storage->boxes[boxno].mons[i], MON_DATA_SPECIES_EXISTS, NULL)
                && !GetBoxMonData(&storage->boxes[boxno].mons[i], MON_DATA_IS_EGG, NULL)) {
                count++;
            }
        }
        return count;
    }

    GF_ASSERT(FALSE);
    return 0;
}

int PCStorage_CountMonsInAllBoxes(PCStorage *storage) {
    int count;
    u32 i;

    for (i = 0, count = 0; i < NUM_BOXES; i++) {
        count += PCStorage_CountMonsInBox(storage, i);
    }
    return count;
}

u32 PCStorage_GetMonDataByIndexPair(PCStorage *storage, u32 boxno, u32 slotno, int attr, void *ptr) {
    GF_ASSERT(boxno < NUM_BOXES || boxno == -1u);
    GF_ASSERT(slotno < MONS_PER_BOX);
    if (boxno == -1u) {
        boxno = storage->curBox;
    }
    return GetBoxMonData(&storage->boxes[boxno].mons[slotno], attr, ptr);
}

BoxPokemon *PCStorage_GetMonByIndexPair(PCStorage *storage, u32 boxno, u32 slotno) {
    GF_ASSERT(boxno < NUM_BOXES || boxno == -1u);
    GF_ASSERT(slotno < MONS_PER_BOX);
    if (boxno == -1u) {
        boxno = storage->curBox;
    }
    return &storage->boxes[boxno].mons[slotno];
}

void PCStorage_UnlockBonusWallpaper(PCStorage *storage, u32 wallpaper) {
    GF_ASSERT(wallpaper < NUM_BONUS_WALLPAPER);
    storage->unlockedWallpapers |= (1 << wallpaper);
}

BOOL PCStorage_IsBonusWallpaperUnlocked(PCStorage *storage, u32 wallpaper) {
    GF_ASSERT(wallpaper < NUM_BONUS_WALLPAPER);
    return (storage->unlockedWallpapers & (1 << wallpaper)) != 0;
}

void PCStorage_SetBoxModified(PCStorage *storage, u8 boxno) {
    if (boxno >= NUM_BOXES) {
        GF_ASSERT(FALSE);
        return;
    }
    storage->boxModifiedFlag |= 1 << boxno;
}

void PCStorage_SetAllBoxesModified(PCStorage *storage) {
    storage->boxModifiedFlag = BOX_ALL_MODIFIED_FLAG;
}

void PCStorage_ResetBoxModifiedFlags(PCStorage *storage) {
    storage->boxModifiedFlag = 0;
}

u32 PCStorage_GetBoxModifiedFlags(PCStorage *storage) {
    return storage->boxModifiedFlag;
}

u32 sub_02074120(void) {
    return sizeof(PC_BOX);
}

void sub_02074128(PCStorage *storage) {
    u8 i, j;

    for (i = 0; i < NUM_BOXES; i++) {
        for (j = 0; j < 16; j++) {
            GF_ASSERT(storage->boxes[i].unk_FF0[j] == 0);
            storage->boxes[i].unk_FF0[j] = 0;
        }
    }
}
