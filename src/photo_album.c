#include "photo_album.h"

#include "global.h"

#include "pm_string.h"

static BOOL Photo_IsUse(const Photo *photo);

u32 Save_PhotoAlbum_sizeof(void) {
    return sizeof(PhotoAlbum);
}

PhotoAlbum *Save_PhotoAlbum_Get(SaveData *saveData) {
    return SaveArray_Get(saveData, SAVE_PHOTO_ALBUM);
}

void Save_PhotoAlbum_Init(PhotoAlbum *photoAlbum) {
    int i;

    photoAlbum->unk_00 = 0;
    for (i = 0; i < PHOTO_ALBUM_MAX; i++) {
        Photo_Init(&photoAlbum->photos[i]);
    }
}

u8 PhotoAlbum_GetIndexOfFirstEmptySlot(const PhotoAlbum *photoAlbum) {
    u8 i;

    for (i = 0; i < PHOTO_ALBUM_MAX; i++) {
        if (!Photo_IsUse(&photoAlbum->photos[i])) {
            return i;
        }
    }

    return 0xFF;
}

u8 PhotoAlbum_GetNumSaved(const PhotoAlbum *photoAlbum) {
    u8 i, n;

    for (i = 0, n = 0; i < PHOTO_ALBUM_MAX; i++) {
        if (Photo_IsUse(&photoAlbum->photos[i])) {
            n++;
        }
    }

    return n;
}

void PhotoAlbum_DeletePhotoByIndex(PhotoAlbum *photoAlbum, u8 idx) {
    if (idx < PHOTO_ALBUM_MAX) {
        Photo_Init(&photoAlbum->photos[idx]);
    }
}

BOOL PhotoAlbum_SetPhotoAtIndex(PhotoAlbum *photoAlbum, const Photo *photo, u8 idx) {
    if (idx >= PHOTO_ALBUM_MAX) {
        return FALSE;
    } else {
        MI_CpuCopy8(photo, &photoAlbum->photos[idx], sizeof(Photo));
        return TRUE;
    }
}

BOOL PhotoAlbum_GetPhotoByIndex(const PhotoAlbum *photoAlbum, Photo *photo, u8 idx) {
    if (idx >= PHOTO_ALBUM_MAX) {
        Photo_Init(photo);
        return FALSE;
    } else {
        MI_CpuCopy8(&photoAlbum->photos[idx], photo, sizeof(Photo));
        return TRUE;
    }
}

Photo *PhotoAlbum_LoadAllInUsePhotos(const PhotoAlbum *photoAlbum, enum HeapID heapID) {
    u8 i, j, n;
    Photo *ret;

    n = PhotoAlbum_GetNumSaved(photoAlbum);
    ret = Heap_Alloc(heapID, n * sizeof(Photo));
    MI_CpuClear8(ret, n * sizeof(Photo));
    j = 0;
    for (i = 0; i < PHOTO_ALBUM_MAX; i++) {
        if (Photo_IsUse(&photoAlbum->photos[i])) {
            MI_CpuCopy8(&photoAlbum->photos[i], &ret[j++], sizeof(Photo));
        }
    }
    return ret;
}

void Photo_Init(Photo *photo) {
    MI_CpuClear8(photo, sizeof(Photo));
    StringFillEOS(photo->playerName, PLAYER_NAME_LENGTH + 1);
    StringFillEOS(photo->leadMonNick, POKEMON_NAME_LENGTH + 2);
}

static BOOL Photo_IsUse(const Photo *photo) {
    return photo->numMons ? TRUE : FALSE;
}
