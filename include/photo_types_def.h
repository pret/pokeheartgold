#ifndef GUARD_POKEHEARTGOLD_PHOTO_TYPES_DEF_H
#define GUARD_POKEHEARTGOLD_PHOTO_TYPES_DEF_H

#include "global.h"
#include "photo_album.h"

typedef struct PhotoArcData {
    u16 unk_0;
    u16 unk_2;
    u16 unk_4;
    u16 unk_6;
    u8 unk_8;
    u8 unk_9;
    u16 unk_A;
    u16 unk_C;
    u16 unk_E;
} PhotoArcData;

typedef struct FieldTakePhoto_Sub44 {
    u8 filler_00[0x88];
} FieldTakePhoto_Sub44;

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
    FieldTakePhoto_Sub44 *unk_40;
    FieldTakePhoto_Sub44 unk_44;
    VecFx32 unk_CC;
    u8 unk_D8;
} FieldTakePhoto;

typedef struct FieldTakePhoto2_Sub0C {
    u8 filler_00[4];
    u8 unk_04_0:1;
    u8 unk_04_1:7;
    u8 filler_05[0x13];
    u16 unk_18[13];
    u16 unk_32;
    u8 filler_34;
    u32 unk_38;
    u8 filler_3C[0x30];
    struct {
        u16 species;
        u8 filler_2[2];
    } unk_6C[PARTY_SIZE];
} FieldTakePhoto2_Sub0C;

typedef struct FieldTakePhoto2 {
    u8 filler_00[0x90];
    int unk_90;
    u16 unk_94;
    u16 unk_96;
    u16 unk_98;
    u16 unk_9A;
    u8 filler_9C[0x1C];
    PHOTO_ALBUM *unk_B8;
} FieldTakePhoto2;

typedef struct UnkStruct_0206A8C0 {
    FieldTakePhoto2_Sub0C *unk_0;
    u8 unk_4;
    u8 unk_5;
} UnkStruct_0206A8C0;

#endif //GUARD_POKEHEARTGOLD_PHOTO_TYPES_DEF_H
