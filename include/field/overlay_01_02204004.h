#ifndef POKEHEARTGOLD_FIELD_OVERLAY_01_02204004_H
#define POKEHEARTGOLD_FIELD_OVERLAY_01_02204004_H

#include <nnsys.h>

#include "gf_rtc.h"
#include "heap.h"

// Todo: move back probably
typedef struct MapPropAnimation {
    NNSG3dAnmObj *animObj;
    void *res;
    int loopCount;
    BOOL paused;
    BOOL reversed;
    u32 unk14;
    int unk18;
    BOOL looping;
} MapPropAnimation;

typedef struct FieldSystemUnkSubCC_Sub0 FieldSystemUnkSubCC_Sub0;

typedef struct FieldSystemUnkSubCC {
    FieldSystemUnkSubCC_Sub0 *unk0;
    MapPropAnimation *mapPropAnimation;
} FieldSystemUnkSubCC;

struct FieldSystemUnkSubCC_Sub0 {
    NNSFndAllocator unk0;
    MapPropAnimation *unk10;
    MapPropAnimation **unk14;
    FieldSystemUnkSubCC_Sub0 *next;
    void *unk1C;
    u16 unk20;
    u16 unk22;
};

typedef struct FieldSystemUnkSubC8 {
    FieldSystemUnkSubCC_Sub0 *unk0;
    FieldSystemUnkSubCC_Sub0 *unk4;
    FieldSystemUnkSubCC_Sub0 *unk8;
    int unkC;
} FieldSystemUnkSubC8;

typedef struct UnkStruct_FieldSysC0_SubC {
    NNSG3dRenderObj renderObj;
    NNSG3dResMdl *model;
    int index;
} UnkStruct_FieldSysC0_SubC;

typedef struct UnkStruct_FieldSysC0 {
    u8 *modelNumToLoadedSlot;
    NNSG3dResFileHeader **resFileHeaders;
    UnkStruct_FieldSysC0_SubC *objectHeap;
    UnkStruct_FieldSysC0_SubC **objects;
    int numObjects;
    int indexMax;
    int objectMax;
} UnkStruct_FieldSysC0;

// TimeOfDayVisual?
typedef struct FieldSystemUnkSub104_Sub8 {
    u32 unk0;
    int unk4;
    MapPropAnimation *animations[4];
    NNSG3dRenderObj *renderObj;
} FieldSystemUnkSub104_Sub8; // Size: 0x1C

// TimeOfDayVisualManager?
typedef struct FieldSystemUnkSub104 {
    TIMEOFDAY timeOfDay;
    int unk4;
    FieldSystemUnkSub104_Sub8 unkSub[4];
} FieldSystemUnkSub104; // Size: 0x78

typedef struct ResAnim_4004 {
    u32 unk0;
    u32 unk4;
    u8 unk8;
    u8 numMapData;
} ResAnim_4004;

UnkStruct_FieldSysC0 *ov01_02204004(enum HeapID heapID, int indexMax, int objectMax, NNSG3dResFileHeader **fileResHeader); // FieldSysC0_New
void ov01_02204084(UnkStruct_FieldSysC0 *unkC0);                                                                           // FieldSysC0_Free
UnkStruct_FieldSysC0_SubC *ov01_022040A4(UnkStruct_FieldSysC0 *unkC0, int index);
UnkStruct_FieldSysC0_SubC *Field3dObjectList_GetRenderObjectByID(UnkStruct_FieldSysC0 *unkC0, int index);
UnkStruct_FieldSysC0_SubC *ov01_022040F8(UnkStruct_FieldSysC0 *unkC0, int index);
BOOL ov01_0220411C(UnkStruct_FieldSysC0 *unkC0, UnkStruct_FieldSysC0_SubC *object);
BOOL ov01_02204154(UnkStruct_FieldSysC0 *unkC0, int index);
FieldSystemUnkSubC8 *ov01_022041C4(enum HeapID heapID);
FieldSystemUnkSubCC_Sub0 *ov01_022041D8(FieldSystemUnkSubC8 *unkC8, enum HeapID heapID, u16 count);
void ov01_02204278(FieldSystemUnkSubC8 *unkSubC8); // UnkSubC8_Free
MapPropAnimation *ov01_022042FC(FieldSystemUnkSubCC_Sub0 *unkCC_Sub0);
void ov01_0220431C(FieldSystemUnkSubCC_Sub0 *unkCC_Sub0, MapPropAnimation *animation);
void ov01_02204350(FieldSystemUnkSubC8 *unkSubC8);
void ov01_022043D8(FieldSystemUnkSubC8 *unkSubC8);
void ov01_02204424(FieldSystemUnkSubC8 *unkSubC8);
void ov01_02204470(FieldSystemUnkSubCC_Sub0 *unkCC_Sub0, MapPropAnimation *animation, void *res, NNSG3dResMdl *model, NNSG3dResTex *texture);
void MapPropAnimation_Init(MapPropAnimation *animation, int loopCount, BOOL paused, BOOL reversed);
void MapPropAnimation_GoToFirstFrame(MapPropAnimation *animation);
void ov01_02204500(FieldSystemUnkSubCC_Sub0 *unkCC_Sub0, MapPropAnimation *animation);
void MapPropAnimation_AddToRenderObj(NNSG3dRenderObj *renderObj, MapPropAnimation *animation);
BOOL MapPropAnimation_RemoveFromRenderObj(NNSG3dRenderObj *renderObj, MapPropAnimation *animation);
u16 MapPropAnimation_GetLoopCount(MapPropAnimation *animation);
void MapPropAnimation_SetPaused(MapPropAnimation *animation, BOOL paused);
BOOL MapPropAnimation_IsLoopFinished(MapPropAnimation *animation);
void MapPropAnimation_GoToLastFrame(MapPropAnimation *animation);
void MapPropAnimation_SetLoopCount(MapPropAnimation *animation, const int loopCount);
FieldSystemUnkSubCC *ov01_0220460C(FieldSystemUnkSubC8 *unkSubC8); // UnkCC_Init
void ov01_02204634(FieldSystemUnkSubCC *unkCC);                    // UnkCC_Free
void ov01_0220463C(FieldSystemUnkSubCC *unkCC, int fileID);        // UnkCC_Load
void ov01_02204678(FieldSystemUnkSubCC *unkCC, NNSG3dRenderObj *renderObj);
void ov01_02204688(FieldSystemUnkSubCC *unkCC, NNSG3dRenderObj *renderObj);
void ov01_02204698(FieldSystemUnkSubCC *unkCC);
FieldSystemUnkSub104 *ov01_02204744(enum HeapID heapID);
void ov01_02204764(FieldSystemUnkSub104 *unk104);
void ov01_0220476C(FieldSystemUnkSub104 *unk104, NNSG3dRenderObj *renderObj, MapPropAnimation **animation, int count);
void ov01_022047DC(FieldSystemUnkSub104 *unk104);
u8 ov01_02204834(FieldSystemUnkSub104 *unk104);

// These are nnsys things that do not seem to be in the project right now or are not decompiled in this project.
void *NNS_FndAllocFromAllocator(NNSFndAllocator *pAllocator, u32 size);

typedef struct NNSG3dMatAnmResult NNSG3dMatAnmResult;
typedef void (*NNSG3dFuncAnmMat)(NNSG3dMatAnmResult *, const NNSG3dAnmObj *, u32);
// void NNSi_G3dAnmCalcNsBta(NNSG3dMatAnmResult *pResult, const NNSG3dAnmObj *pAnmObj, u32 dataIdx);
extern NNSG3dFuncAnmMat _02110A0C; // NNS_G3dFuncAnmMatNsBtaDefault = &NNSi_G3dAnmCalcNsBta

#endif // POKEHEARTGOLD_FIELD_OVERLAY_01_02204004_H
