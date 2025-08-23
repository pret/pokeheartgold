#ifndef POKEHEARTGOLD_PHOTO_ALBUM_H
#define POKEHEARTGOLD_PHOTO_ALBUM_H

#include "camera.h"
#include "save.h"

#define PHOTO_ALBUM_MAX 36

typedef struct PhotoMon {
    u16 species;
    u8 form;
    u8 shiny : 1;
    u8 gender : 1;
} PhotoMon;

typedef struct PhotoCameraParam {
    fx32 distance;
    CameraAngle angle;
    u16 perspectiveType;
    u16 perspective;
    int unk_10[2];
    VecFx32 lookAt;
} PhotoCameraParam;

typedef struct Photo {
    u8 filler_0[4];
    u8 gender : 1;
    u8 iconId : 7;
    u8 filler_5[2];
    u8 numMons;
    u16 playerName[8];
    u16 leadMonNick[12];
    u8 avatarStateBak;
    u16 mapId;
    u16 x;
    u16 y;
    u32 date;
    u16 hour;
    u16 min;
    u16 unk_40[2];
    u16 subjectSpriteId;
    u16 unk_46;
    PhotoCameraParam unk_48;
    PhotoMon party[PARTY_SIZE];
} Photo; // size: 0x84

// file: a/2/5/4
typedef struct PhotoData {
    u16 mapId;
    u16 iconId;
    u16 x;
    u16 y;
    u8 unk8;
    u8 unk9;
    u16 subjectObjId;
    u16 param[2];
} PhotoData;

typedef struct PhotoAlbum {
    int unk_00;
    Photo photos[PHOTO_ALBUM_MAX];
} PhotoAlbum;

u32 Save_PhotoAlbum_sizeof(void);
PhotoAlbum *Save_PhotoAlbum_Get(SaveData *saveData);
void Save_PhotoAlbum_Init(PhotoAlbum *photoAlbum);
u8 PhotoAlbum_GetIndexOfFirstEmptySlot(const PhotoAlbum *photoAlbum);
u8 PhotoAlbum_GetNumSaved(const PhotoAlbum *photoAlbum);
void PhotoAlbum_DeletePhotoByIndex(PhotoAlbum *photoAlbum, u8 idx);
BOOL PhotoAlbum_SetPhotoAtIndex(PhotoAlbum *photoAlbum, const Photo *photo, u8 idx);
BOOL PhotoAlbum_GetPhotoByIndex(const PhotoAlbum *photoAlbum, Photo *photo, u8 idx);
Photo *PhotoAlbum_LoadAllInUsePhotos(const PhotoAlbum *photoAlbum, HeapID heapId);
void Photo_Init(Photo *photo);

#endif // POKEHEARTGOLD_PHOTO_ALBUM_H
