#ifndef POKEHEARTGOLD_UNK_02007FD8_H
#define POKEHEARTGOLD_UNK_02007FD8_H

#include "filesystem_files_def.h"
#include "pokemon_types_def.h"
#include "heap.h"

typedef struct PokepicAnimScript {
    s8 next;
    u8 duration;
    s8 xOffset;
    s8 unk_3;
} PokepicAnimScript;

typedef struct PokepicAnim {
    u8 active;
    u8 whichAnimStep;
    u8 whichAnim;
    u8 stepDelay;
    u8 loopTimers[10];
    PokepicAnimScript *animScript;
} PokepicAnim;

typedef struct PokepicDrawParam {
    s16 xCenter;
    s16 yCenter;
    int zCenter;
    s16 xOffset;
    s16 yOffset;
    int zOffset;
    s16 affineWidth;
    s16 affineHeight;
    u16 rotX;
    u16 rotY;
    u16 rotZ;
    u16 unk_1A;
    s16 xPivot;
    s16 yPivot;
    u8 xOffset2;
    u8 yOffset2;
    u8 width;
    u8 height;
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
    u32 filler_2C_30:2;
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
    u32 filler_30_11:15;
} PokepicDrawParam;

typedef struct PokepicShadow {
    u16 palSlot:2;
    u16 shouldAdjustX:1;
    u16 shouldAdjustY:1;
    u16 isAffine:1;
    u16 size:2;
    u16 filler_0_7:9;
    s8 height;
    u8 filler_3[1];
    s16 x;
    s16 y;
    s16 xOffset;
    s16 yOffset;
} PokepicShadow;

struct Pokepic;

typedef void (*PokepicCallback)(struct Pokepic *, PokepicDrawParam *);

typedef struct Pokepic {
    u32 active:1;
    u32 polygonId:6;
    u32 needReloadChar:1;
    u32 needReloadPltt:1;
    u32 filler_00_09:23;
    PokepicTemplate template;
    PokepicTemplate templateBak;
    PokepicDrawParam drawParam;
    u8 animActive;
    u8 whichAnim;
    u8 animStepDelay;
    u8 whichAnimStep;
    u8 animLoopTimers[10];
    u8 filler_66[2];
    PokepicCallback callback;
    PokepicShadow shadow;
    PokepicShadow shadowBak;
    PokepicAnimScript animScript[10];
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
    u8 unread_330;
    u8 needLoadImage;
    u8 needLoadPltt;
    u8 needG3Identity;
    u32 flags;
} PokepicManager;  // size: 0x338

PokepicManager *PokepicManager_Create(HeapID heapId);
void PokepicManager_DrawAll(PokepicManager *pokepicManager);
void PokepicManager_Delete(PokepicManager *pokepicManager);
void Pokepic_StartAnim(Pokepic *pokepic);
void Pokepic_SetAnimScript(Pokepic *pokepic, PokepicAnimScript *animScript);
BOOL Pokepic_IsAnimFinished(Pokepic *pokepic);
Pokepic *PokepicManager_CreatePokepic(PokepicManager *pokepicManager, PokepicTemplate *template, int x, int y, int z, int polygonId, PokepicAnimScript *animScript, PokepicCallback callback);
Pokepic *PokepicManager_CreatePokepicAt(PokepicManager *pokepicManager, PokepicTemplate *template, int x, int y, int z, int polygonId, int picIndex, PokepicAnimScript *animScript, PokepicCallback callback);
void Pokepic_Delete(Pokepic *pokepic);
void PokepicManager_DeleteAllPics(PokepicManager *pokepicManager);
void Pokepic_SetAttr(Pokepic *pokepic, int attr, int value);
int Pokepic_GetAttr(Pokepic *pokepic, int attr);
void Pokepic_AddAttr(Pokepic *pokepic, int attr, int addend);
void Pokepic_SetVisible(Pokepic *pokepic, int x, int y, int width, int height);
void Pokepic_StartPaletteFade(Pokepic *pokepic, int start, int end, int framesPer, int targetColor);
void Pokepic_StartPaletteFadeAll(PokepicManager *pokepicManager, int start, int end, int framesPer, int targetColor);
BOOL sub_02009138(Pokepic *pokepic);
void sub_0200914C(Pokepic *pokepic, int y);
void PokepicAnim_Init(PokepicAnim *anim, PokepicAnimScript *animScript);
int PokepicAnim_Exec(PokepicAnim *anim);
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
void PokepicManager_BufferCharData(PokepicManager *pokepicManager);
void RawChardata_PlaceSpindaSpots(u8 *pRawData, u32 pid, BOOL isAnimated);
void UnscanPokepic(u8 *pRawData, NarcId narcId);

#endif //POKEHEARTGOLD_UNK_02007FD8_H
