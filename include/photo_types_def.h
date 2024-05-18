#ifndef GUARD_POKEHEARTGOLD_PHOTO_TYPES_DEF_H
#define GUARD_POKEHEARTGOLD_PHOTO_TYPES_DEF_H

#include "global.h"
#include "overlay_109.h"
#include "photo_album.h"
#include "field_types_def.h"

typedef struct FieldTakePhoto {
    u8 filler_00[0x14];
    u8 unk_14;
    u8 unk_15;
    u8 unk_16;
    u8 unk_17;
    u8 filler_18[0x18];
    u16 unk_30;
    u16 unk_32;
    u16 unk_34;
    u16 unk_36;
    u8 filler_38[0x8];
    PHOTO *unk_40;
    PHOTO unk_44;
    u16 unk_C8;
    u8 unk_CA;
    u8 unk_CB;
    VecFx32 unk_CC;
    u8 unk_D8;
} FieldTakePhoto;

typedef struct FieldTakePhoto2 {
    int unk_00;
    int unk_04;
    u8 unk_08;
    u8 unk_09;
    u8 unk_0A;
    u8 unk_0B;
    PHOTO unk_0C;
    int unk_90;
    u16 unk_94;
    u16 unk_96;
    u16 unk_98;
    u16 unk_9A;
    LocalMapObject *unk_9C[6];
    PhotoAlbumArgs *unk_B4;
    PHOTO_ALBUM *unk_B8;
} FieldTakePhoto2;

typedef struct UnkStruct_0206A8C0 {
    PHOTO *unk_0;
    u8 unk_4;
    u8 unk_5;
} UnkStruct_0206A8C0;

#endif //GUARD_POKEHEARTGOLD_PHOTO_TYPES_DEF_H
