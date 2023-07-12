#include "global.h"
#include "photo_album.h"
#include "pm_string.h"

static BOOL Photo_IsUse(const PHOTO *photo);

u32 Save_PhotoAlbum_sizeof(void) {
    return sizeof(PHOTO_ALBUM);
}

PHOTO_ALBUM *Save_PhotoAlbum_Get(SaveData *saveData) {
    return SaveArray_Get(saveData, SAVE_PHOTO_ALBUM);
}

void Save_PhotoAlbum_Init(PHOTO_ALBUM *photoAlbum) {
    int i;

    photoAlbum->unk_00 = 0;
    for (i = 0; i < PHOTO_ALBUM_MAX; i++) {
        Photo_Init(&photoAlbum->photos[i]);
    }
}

u8 PhotoAlbum_GetIndexOfFirstEmptySlot(const PHOTO_ALBUM *photoAlbum) {
    u8 i;

    for (i = 0; i < PHOTO_ALBUM_MAX; i++) {
        if (!Photo_IsUse(&photoAlbum->photos[i])) {
            return i;
        }
    }

    return 0xFF;
}

u8 PhotoAlbum_GetNumSaved(const PHOTO_ALBUM *photoAlbum) {
    u8 i, n;

    for (i = 0, n = 0; i < PHOTO_ALBUM_MAX; i++) {
        if (Photo_IsUse(&photoAlbum->photos[i])) {
            n++;
        }
    }

    return n;
}

void PhotoAlbum_DeletePhotoByIndex(PHOTO_ALBUM *photoAlbum, u8 idx) {
    if (idx < PHOTO_ALBUM_MAX) {
        Photo_Init(&photoAlbum->photos[idx]);
    }
}

BOOL PhotoAlbum_SetPhotoAtIndex(PHOTO_ALBUM *photoAlbum, const PHOTO *photo, u8 idx) {
    if (idx >= PHOTO_ALBUM_MAX) {
        return FALSE;
    } else {
        MI_CpuCopy8(photo, &photoAlbum->photos[idx], sizeof(PHOTO));
        return TRUE;
    }
}

BOOL PhotoAlbum_GetPhotoByIndex(const PHOTO_ALBUM *photoAlbum, PHOTO *photo, u8 idx) {
    if (idx >= PHOTO_ALBUM_MAX) {
        Photo_Init(photo);
        return FALSE;
    } else {
        MI_CpuCopy8(&photoAlbum->photos[idx], photo, sizeof(PHOTO));
        return TRUE;
    }
}

PHOTO *PhotoAlbum_LoadAllInUsePhotos(const PHOTO_ALBUM *photoAlbum, HeapID heapId) {
    u8 i, j, n;
    PHOTO *ret;

    n = PhotoAlbum_GetNumSaved(photoAlbum);
    ret = AllocFromHeap(heapId, n * sizeof(PHOTO));
    MI_CpuClear8(ret, n * sizeof(PHOTO));
    j = 0;
    for (i = 0; i < PHOTO_ALBUM_MAX; i++) {
        if (Photo_IsUse(&photoAlbum->photos[i])) {
            MI_CpuCopy8(&photoAlbum->photos[i], &ret[j++], sizeof(PHOTO));
        }
    }
    return ret;
}

void Photo_Init(PHOTO *photo) {
    MI_CpuClear8(photo, sizeof(PHOTO));
    StringFillEOS(photo->playerName, PLAYER_NAME_LENGTH + 1);
    StringFillEOS(photo->leadMonNick, POKEMON_NAME_LENGTH + 2);
}

static BOOL Photo_IsUse(const PHOTO *photo) {
    return photo->is_init ? TRUE : FALSE;
}
