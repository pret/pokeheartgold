#ifndef POKEHEARTGOLD_UNK_0200CF18_H
#define POKEHEARTGOLD_UNK_0200CF18_H

#include "filesystem.h"
#include "unk_02009D48.h"
#include "unk_02023694.h"
#include "palette.h"

typedef struct UnkStruct_0200D2B4 {
    int unk_00;
    s16 x;
    s16 y;
    s16 z;
    u16 unk_0A;
    int unk_0C;
    int unk_10;
    int unk_14;
    int unk_18;
    int unk_1C;
    int unk_20;
    int unk_24;
} UnkStruct_0200D2B4;

typedef struct UnkTemplate_0200D748 {
    s16 x;
    s16 y;
    s16 z;
    u16 animation;
    u32 unk_08;
    u32 pal;
    NNS_G2D_VRAM_TYPE vram;
    u32 unk_14[GF_GFX_RES_TYPE_MAX];
    u32 unk_2C;
    u32 unk_30;
} UnkTemplate_0200D748; // size=0x34

typedef struct UnkStruct_0200CF18 {
    HeapID heapId;
    u32 unk_004;
    BOOL unk_008;
    NNSG2dCellTransferState* cellTransferState; // 00C
    GF_G2dRenderer renderer; // 010
} UnkStruct_0200CF18; // size: 0x138

typedef struct UnkStruct_0200CF38_sub {
    struct _2DGfxResObjList* obj_list;
    struct _2DGfxResMan* manager;
} UnkStruct_0200CF38_sub;

typedef struct UnkStruct_0200CF38 {
    SpriteList* spriteList;
    ListOfUnkStruct_02009D48* listOfUnkStruct_9D48; // 4
    struct _2DGfxResHeader* _2dGfxResHeader; // 8
    struct _2DGfxResMan* _2dGfxResMan[GF_GFX_RES_TYPE_MAX]; // C
    struct _2DGfxResObjList* _2dGfxResObjList[GF_GFX_RES_TYPE_MAX]; // 24
    int unk_3C[GF_GFX_RES_TYPE_MAX];
    int unk_54;
} UnkStruct_0200CF38; // size: 0x58

typedef struct Unk122_021E92FC {
    int unk0;
    int unk4;
    int unk8;
    int unkC;
    int unk10;
    int unk14;
    int unk18;
    int unk1C;
} Unk122_021E92FC;

typedef struct Unk122_021E92D0 {
    int unk0;
    int unk4;
    int unk8;
    int unkC;
    int unk10;
} Unk122_021E92D0;

typedef struct Unk122_021E92E4 {
    int unk0[GF_GFX_RES_TYPE_MAX];
} Unk122_021E92E4;

UnkStruct_0200CF18* sub_0200CF18(HeapID);
UnkStruct_0200CF38* sub_0200CF38(UnkStruct_0200CF18*);
GF_G2dRenderer* sub_0200CF6C(UnkStruct_0200CF18*);
BOOL sub_0200CF70(UnkStruct_0200CF18*, Unk122_021E92FC*, Unk122_021E92D0*, int);
BOOL sub_0200CFF4(UnkStruct_0200CF18*, UnkStruct_0200CF38*, int);
void sub_0200D018(Sprite* sprite);
void sub_0200D020(UnkStruct_0200CF38*);
void sub_0200D034(void);
void sub_0200D03C(void);
void sub_0200D0E4(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1);
void sub_0200D108(UnkStruct_0200CF18*);
BOOL sub_0200D294(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, const u16* a2);
BOOL sub_0200D2A4(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, const u16* a2, int a3, int a4);
Sprite* sub_0200D2B4(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, const UnkStruct_0200D2B4* a2);
BOOL sub_0200D3F8(UnkStruct_0200CF18*, UnkStruct_0200CF38*, Unk122_021E92E4*);
BOOL sub_0200D4A4(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, NarcId narcId, int fileId, BOOL compressed, int vram, int resId);
BOOL sub_0200D504(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, NARC* narc, int fileId, BOOL compressed, int vram, int resId);
s8 sub_0200D564(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, NarcId sub_0200D564, int fileId, BOOL compressed, int pltt_num, int vram, int resId);
s8 sub_0200D5D4(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, NARC* sub_0200D564, int fileId, BOOL compressed, int pltt_num, int vram, int resId);
u8 sub_0200D644(PaletteData* a0, u32 bufferId, UnkStruct_0200CF18* a2, UnkStruct_0200CF38* a3, NarcId narcId, int fileId, BOOL compressed, int pltt_num, int vram, int resId);
u8 sub_0200D68C(PaletteData* a0, u32 bufferId, UnkStruct_0200CF18* a2, UnkStruct_0200CF38* a3, NARC* narc, int fileId, BOOL compressed, int pltt_num, int vram, int resId);
BOOL sub_0200D6D4(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, NarcId narcId, int fileId, BOOL compressed, int resId);
BOOL sub_0200D6EC(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, NARC* narc, int fileId, BOOL compressed, int resId);
BOOL sub_0200D704(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, NarcId narcId, int fileId, BOOL compressed, int resId);
BOOL sub_0200D71C(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, NARC* narc, int fileId, BOOL compressed, int resId);
UnkImageStruct* sub_0200D734(UnkStruct_0200CF18*, UnkStruct_0200CF38*, struct UnkTemplate_0200D748*);
UnkImageStruct* sub_0200D740(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, UnkTemplate_0200D748* a2, u32 a3);
NNSG2dImagePaletteProxy* sub_0200D934(UnkStruct_0200CF38* a0, int id);
int sub_0200D944(UnkStruct_0200CF38* a0, int id, int vram);
BOOL sub_0200D958(UnkStruct_0200CF38* a0, u32 character);
BOOL sub_0200D968(UnkStruct_0200CF38* a0, u32 pal);
BOOL sub_0200D978(UnkStruct_0200CF38* a0, u32 cell);
BOOL sub_0200D988(UnkStruct_0200CF38* a0, u32 animation);
void sub_0200D998(UnkStruct_0200CF18*, UnkStruct_0200CF38*);
void sub_0200D9DC(UnkImageStruct*);
void sub_0200DC0C(Sprite* sprite);
void sub_0200DC18(UnkImageStruct*);
void sub_0200DC24(UnkImageStruct* unk);
void sub_0200DC34(UnkImageStruct* unk, fx32 frames);
u32 sub_0200DC40(UnkImageStruct* unk);
void sub_0200DC4C(UnkImageStruct*, int);
void sub_0200DC58(UnkImageStruct*, int);
u16 sub_0200DC64(UnkImageStruct* unk);
void sub_0200DC70(Sprite*, int);
void sub_0200DC78(UnkImageStruct*, int);
void sub_0200DC84(Sprite*, fx32);
void sub_0200DC8C(UnkImageStruct*, fx32);
BOOL sub_0200DC98(Sprite* sprite);
BOOL sub_0200DCA0(UnkImageStruct*);
void sub_0200DCAC(UnkImageStruct* unk);
void sub_0200DCB8(Sprite*);
void sub_0200DCC0(UnkImageStruct*);
u16 sub_0200DCCC(Sprite* sprite);
u16 sub_0200DCD4(UnkImageStruct* unk);
void sub_0200DCE0(Sprite*, int);
void sub_0200DCE8(UnkImageStruct*, int);
BOOL sub_0200DCF4(Sprite*);
BOOL sub_0200DCFC(UnkImageStruct* a0);
void sub_0200DD08(Sprite*, int);
void sub_0200DD10(UnkImageStruct*, int);
void sub_0200DD1C(Sprite* sprite, u8 a1);
void sub_0200DD24(UnkImageStruct* unk, u8 a1);
u8 sub_0200DD30(UnkImageStruct* unk);
void sub_0200DD3C(Sprite* sprite, int a1);
int sub_0200DD48(UnkImageStruct* unk);
void sub_0200DD54(UnkImageStruct*, int);
void sub_0200DD60(Sprite* sprite, u16 a1);
void sub_0200DD68(UnkImageStruct* unk, u16 a1);
u16 sub_0200DD74(Sprite* sprite);
u16 sub_0200DD7C(UnkImageStruct* unk);
void sub_0200DD88(Sprite* sprite, s16 x, s16 y);
void sub_0200DDB8(UnkImageStruct*, s16, s16);
void sub_0200DDC4(Sprite* sprite, s16 x, s16 y, fx32 yOffset);
void sub_0200DDF4(UnkImageStruct* a0, s16 x, s16 y, fx32 yOffset);
void sub_0200DE00(Sprite* sprite, s16* x, s16* y);
void sub_0200DE44(UnkImageStruct* unk, s16* x, s16* y);
void sub_0200DE50(Sprite* sprite, s16* x, s16* y, fx32 yOffset);
void sub_0200DE94(UnkImageStruct* unk, s16* x, s16* y, fx32 yOffset);
void sub_0200DEA0(Sprite* sprite, s16 dx, s16 dy);
void sub_0200DED0(UnkImageStruct* unk, s16 dx, s16 dy);
void sub_0200DEDC(UnkImageStruct* unk, fx32 dx, fx32 dy);
void sub_0200DF08(UnkImageStruct* unk, fx32 x, fx32 y);
void sub_0200DF2C(UnkImageStruct* unk, fx32* x, fx32* y);
void sub_0200DF44(UnkImageStruct* unk, fx32 x, fx32 y, fx32 yOffset);
void sub_0200DF70(UnkImageStruct* unk, fx32* x, fx32* y, fx32 yOffset);
void sub_0200DF90(Sprite* sprite, u8 a1);
void sub_0200DF98(UnkImageStruct* unk, u8 a1);
void sub_0200DFA4(Sprite* sprite, f32 x, f32 y);
void sub_0200E024(UnkImageStruct* unk, f32 x, f32 y);
void sub_0200E030(Sprite* sprite, f32* x, f32* y);
void sub_0200E060(UnkImageStruct* unk, f32* x, f32* y);
void sub_0200E06C(Sprite* sprite, u16 a1);
void sub_0200E074(UnkImageStruct* unk, u16 a1);
void sub_0200E080(Sprite* sprite, u16 a1);
void sub_0200E098(UnkImageStruct* unk, u16 a1);
u16 sub_0200E0A4(Sprite* sprite);
u16 sub_0200E0AC(UnkImageStruct* unk);
void sub_0200E0B8(Sprite* sprite, u8 a1);
void sub_0200E0C0(UnkImageStruct* unk, u8 a1);
void sub_0200E0CC(UnkImageStruct* unk, s16 x, s16 y);
void sub_0200E0E8(UnkImageStruct* unk, BOOL mosaic);
void sub_0200E0F4(Sprite* sprite, GXOamMode mode);
void sub_0200E0FC(UnkImageStruct* unk, GXOamMode mode);
GXOamMode sub_0200E108(Sprite* sprite);
GXOamMode sub_0200E110(UnkImageStruct* unk);
u32 sub_0200E11C(UnkImageStruct* unk);

#endif //POKEHEARTGOLD_UNK_0200CF18_H
