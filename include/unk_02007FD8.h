#ifndef POKEHEARTGOLD_UNK_02007FD8_H
#define POKEHEARTGOLD_UNK_02007FD8_H

#include "filesystem_files_def.h"
#include "pokemon_types_def.h"
#include "heap.h"

typedef struct UnkStruct_02007FD4_sub84 {
    s8 unk_0;
    u8 unk_1;
    s8 unk_2;
    s8 unk_3;
} UnkStruct_02007FD4_sub84;

typedef struct UnkStruct_02009264 {
    u8 unk_0;
    u8 unk_1;
    u8 unk_2;
    u8 unk_3;
    u8 unk_4[10];
    struct UnkStruct_02007FD4_sub84 *unk_10;
} UnkStruct_02009264;

typedef struct UnkStruct_02007FD4_sub_sub {
    s16 xCenter;
    s16 yCenter;
    int zCenter;
    s16 xOffset;
    s16 yOffset;
    int zOffset;
    s16 unk_10;
    s16 unk_12;
    u16 rotX;
    u16 rotY;
    u16 rotZ;
    u16 unk_1A;
    s16 xPivot;
    s16 yPivot;
    u8 unk_20;
    u8 unk_21;
    u8 unk_22;
    u8 unk_23;
    u8 fadeCur;
    u8 fadeEnd;
    u8 fadeDelayCounter;
    u8 fadeDelayLength;
    u32 fadeTargetColor;
    u32 diffuseR:5;
    u32 diffuseG:5;
    u32 diffuseB:5;
    u32 ambientR:5;
    u32 ambientG:5;
    u32 ambientB:5;
    u32 unk_2C_30:2;
    u32 hasVanished:1;
    u32 visible:1;
    u32 alpha:5;
    u32 unk_30_07:1;
    u32 unk_30_08:1;
    u32 hflip:1;
    u32 vflip:1;
    u32 dontDraw:1;
    u32 fadeActive:1;
    u32 mosaic:4;
    u32 unk_30_11:15;
} UnkStruct_02007FD4_sub_sub;

typedef struct UnkStruct_02007FD4_sub6C {
    u16 palSlot:2;
    u16 unk_0_2:1;
    u16 unk_0_3:1;
    u16 unk_0_4:1;
    u16 unk_0_5:2;
    u16 unk_0_7:9;
    s8 unk_2;
    u8 unk_3;
    s16 x;
    s16 y;
    s16 unk_8;
    s16 unk_A;
} UnkStruct_02007FD4_sub6C;

struct Pokepic;

typedef void (*PokepicCallback)(struct Pokepic *, UnkStruct_02007FD4_sub_sub *);

typedef struct Pokepic {
    u32 active:1;
    u32 polygonId:6;
    u32 needReloadChar:1;
    u32 needReloadPltt:1;
    u32 unk_00_09:23;
    PokepicTemplate template;
    PokepicTemplate templateBak;
    UnkStruct_02007FD4_sub_sub drawParam;
    u8 unk_58;
    u8 unk_59;
    u8 unk_5A;
    u8 unk_5B;
    u8 unk_5C[10];
    u8 filler_66[2];
    PokepicCallback callback;
    UnkStruct_02007FD4_sub6C shadow;
    UnkStruct_02007FD4_sub6C shadowBak;
    UnkStruct_02007FD4_sub84 unk_84[10];
} Pokepic; // size: 0xAC

typedef struct PokepicManager {
    Pokepic pics[4];
    NNSG2dImageProxy imageProxy;
    NNSG2dImagePaletteProxy paletteProxy;
    HeapID heapId;
    u32 charBaseAddr;
    u32 charSize;
    u32 plttBaseAddr;
    u32 plttSize;
    u8 *charRawData;
    u16 *plttRawData;
    u16 *plttRawDataUnfaded;
    NNSG2dCharacterData charData;
    NNSG2dPaletteData plttData;
    u8 unk_330;
    u8 needLoadImage;
    u8 needLoadPltt;
    u8 unk_333;
    u32 unk_334;
} PokepicManager;  // size: 0x338

PokepicManager *PokepicManager_Create(HeapID heapId);
void sub_02008120(PokepicManager *r5);
void PokepicManager_Delete(PokepicManager *r5);
void sub_02008550(Pokepic *pokepic);
void sub_020085C8(Pokepic *pokepic, UnkStruct_02007FD4_sub84 *a1);
BOOL sub_020085DC(Pokepic *pokepic);
Pokepic *PokepicManager_CreatePokepic(PokepicManager *pokepicManager, PokepicTemplate *template, int x, int y, int z, int polygonId, UnkStruct_02007FD4_sub84 *a6, PokepicCallback callback);
Pokepic *PokepicManager_CreatePokepicAt(PokepicManager *pokepicManager, PokepicTemplate *template, int x, int y, int z, int polygonId, int picIndex, UnkStruct_02007FD4_sub84 *a7, PokepicCallback callback);
void Pokepic_Delete(Pokepic *pokepic);
void PokepicManager_DeleteAllPics(PokepicManager *pokepicManager);
void Pokepic_SetAttr(Pokepic *pokepic, int attr, int value);
int Pokepic_GetAttr(Pokepic *pokepic, int attr);
void Pokepic_AddAttr(Pokepic *pokepic, int attr, int addend);
void sub_0200908C(Pokepic *pokepic, int a1, int a2, int a3, int a4);
void Pokepic_StartPaletteFade(Pokepic *pokepic, int start, int end, int framesPer, int targetColor);
void Pokepic_StartPaletteFadeAll(PokepicManager *pokepicManager, int start, int end, int framesPer, int targetColor);
BOOL sub_02009138(Pokepic *pokepic);
void sub_0200914C(Pokepic *pokepic, int a1);
void sub_02009264(UnkStruct_02009264 *a0, struct UnkStruct_02007FD4_sub84 *a1);
int sub_02009284(UnkStruct_02009264 *a0);
void Pokepic_ScheduleReloadFromNarc(Pokepic *pokepic);
void Pokepic_Push(Pokepic *pokepic);
void Pokepic_Pop(Pokepic *pokepic);
void PokepicManager_SetCharBaseAddrAndSize(PokepicManager *pokepicManager, int addr, int size);
void PokepicManager_SetPlttBaseAddrAndSize(PokepicManager *pokepicManager, int addr, int size);
PokepicTemplate *Pokepic_GetTemplate(Pokepic *pokepic);
void PokepicManager_HandleLoadImgAndOrPltt(PokepicManager *pokepicManager);
void sub_020094B0(PokepicManager *pokepicManager, int a1);
BOOL Pokepic_IsActive(Pokepic *pokepic);
void sub_020094D8(PokepicManager *pokepicManager, u32 a1);
void sub_020094E4(PokepicManager *pokepicManager, u32 a1);
void sub_020094FC(PokepicManager *pokepicManager);
void RawChardata_PlaceSpindaSpots(u8 *pRawData, u32 pid, BOOL isAnimated);
void UnscanPokepic(u8 *pRawData, NarcId narcId);

#endif //POKEHEARTGOLD_UNK_02007FD8_H
