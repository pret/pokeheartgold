#ifndef POKEHEARTGOLD_PHOTO_ALBUM_H
#define POKEHEARTGOLD_PHOTO_ALBUM_H

#include "camera.h"
#include "save.h"

#define PHOTO_ALBUM_MAX 36

typedef struct PHOTO_MON {
  u16 species;
  u8 form;
  u8 shiny : 1;
  u8 gender : 1;
} PHOTO_MON;

typedef struct PhotoCameraParam {
  fx32 distance;
  CameraAngle angle;
  u16 perspectiveType;
  u16 perspective;
  int unk_10[2];
  VecFx32 lookAt;
} PhotoCameraParam;

typedef struct PHOTO {
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
  PHOTO_MON party[PARTY_SIZE];
} PHOTO; // size: 0x84

// file: a/2/5/4
typedef struct PHOTO_DAT {
  u16 mapId;
  u16 iconId;
  u16 x;
  u16 y;
  u8 unk8;
  u8 unk9;
  u16 subjectObjId;
  u16 param[2];
} PHOTO_DAT;

typedef struct PHOTO_ALBUM {
  int unk_00;
  PHOTO photos[PHOTO_ALBUM_MAX];
} PHOTO_ALBUM;

u32 Save_PhotoAlbum_sizeof(void);
PHOTO_ALBUM *Save_PhotoAlbum_Get(SaveData *saveData);
void Save_PhotoAlbum_Init(PHOTO_ALBUM *photoAlbum);
u8 PhotoAlbum_GetIndexOfFirstEmptySlot(const PHOTO_ALBUM *photoAlbum);
u8 PhotoAlbum_GetNumSaved(const PHOTO_ALBUM *photoAlbum);
void PhotoAlbum_DeletePhotoByIndex(PHOTO_ALBUM *photoAlbum, u8 idx);
BOOL PhotoAlbum_SetPhotoAtIndex(PHOTO_ALBUM *photoAlbum, const PHOTO *photo,
                                u8 idx);
BOOL PhotoAlbum_GetPhotoByIndex(const PHOTO_ALBUM *photoAlbum, PHOTO *photo,
                                u8 idx);
PHOTO *PhotoAlbum_LoadAllInUsePhotos(const PHOTO_ALBUM *photoAlbum,
                                     HeapID heapId);
void Photo_Init(PHOTO *photo);

#endif // POKEHEARTGOLD_PHOTO_ALBUM_H
