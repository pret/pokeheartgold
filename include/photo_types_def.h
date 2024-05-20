#ifndef GUARD_POKEHEARTGOLD_PHOTO_TYPES_DEF_H
#define GUARD_POKEHEARTGOLD_PHOTO_TYPES_DEF_H

#include "global.h"
#include "overlay_109.h"
#include "photo_album.h"
#include "field_types_def.h"

typedef struct FieldTakePhoto {
    Location locationBuf;
    u8 unk_14;
    u8 unk_15;
    u8 unk_16;
    u8 unk_17;
    LocalMapObject *mapObjects[6];
    u16 savedX;
    u16 savedZ;
    u16 savedDirection;
    u16 savedMapId;
    u8 filler_38[0x8];
    PHOTO *pPhoto;
    PHOTO photoBuf;
    u16 unk_C8;
    u8 unk_CA;
    u8 numObjects;
    VecFx32 unk_CC;
    u8 unk_D8;
} FieldTakePhoto;

typedef struct FieldViewPhoto {
    int unk_00;
    int unk_04;
    u8 unk_08;
    u8 unk_09;
    u8 unk_0A;
    u8 unk_0B;
    PHOTO pPhoto;
    int unk_90;
    u16 x;
    u16 y;
    u16 unk_98;
    u16 unk_9A;
    LocalMapObject *mapObjects[6];
    PhotoAlbumArgs *unk_B4;
    PHOTO_ALBUM *unk_B8;
} FieldViewPhoto;

typedef struct PhotoAlbumScroll {
    PHOTO *photo;
    u8 curPhoto;
    u8 numPhotos;
} PhotoAlbumScroll;

#endif //GUARD_POKEHEARTGOLD_PHOTO_TYPES_DEF_H
