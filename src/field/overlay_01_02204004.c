#include "field/overlay_01_02204004.h"

#include "global.h"

#include "filesystem.h"
#include "filesystem_files_def.h"

static BOOL ov01_02204144(UnkStruct_FieldSysC0 *unkC0, int index);
static UnkStruct_FieldSysC0_SubC *ov01_02204168(UnkStruct_FieldSysC0 *unkC0, NNSG3dResFileHeader **resFileHeader, int index);
static void MapPropAnimation_AdvanceFrame(MapPropAnimation *animation);
static BOOL MapPropAnimation_IsOnLastFrame(MapPropAnimation *animation);
static void ov01_022046A4(NNSFndAllocator *pAllocator, NNSG3dAnmObj **pAlloc, void *res);
static void *ov01_022046D4(NNSFndAllocator *pAllocator, ResAnim_4004 *anim);
static void ov01_02204728(NNSG3dAnmObj *alloc, ResAnim_4004 *anim);

UnkStruct_FieldSysC0 *ov01_02204004(enum HeapID heapID, int indexMax, int objectMax, NNSG3dResFileHeader **resFileHeaders) { // FieldSysC0_New
    UnkStruct_FieldSysC0 *unkC0 = Heap_Alloc(heapID, sizeof(UnkStruct_FieldSysC0));
    unkC0->numObjects = 0;
    unkC0->indexMax = indexMax;
    unkC0->objectMax = objectMax;
    unkC0->resFileHeaders = resFileHeaders;
    unkC0->modelNumToLoadedSlot = Heap_Alloc(heapID, indexMax);
    int i;
    for (i = 0; i < indexMax; i++) {
        unkC0->modelNumToLoadedSlot[i] = 0xFF;
    }
    int size = objectMax * 0x5C;
    unkC0->objectHeap = Heap_Alloc(heapID, size);
    MIi_CpuClearFast(0, (u32 *)unkC0->objectHeap, size);
    unkC0->objects = Heap_Alloc(heapID, objectMax * 4);
    for (i = 0; i < objectMax; i++) {
        unkC0->objects[i] = &unkC0->objectHeap[i];
    }
    return unkC0;
}

void ov01_02204084(UnkStruct_FieldSysC0 *unkC0) { // FieldSysC0_Free
    Heap_Free(unkC0->modelNumToLoadedSlot);
    Heap_Free(unkC0->objectHeap);
    Heap_Free(unkC0->objects);
    Heap_Free(unkC0);
}

UnkStruct_FieldSysC0_SubC *ov01_022040A4(UnkStruct_FieldSysC0 *unkC0, int index) {
    unkC0->modelNumToLoadedSlot[index] = unkC0->numObjects;
    NNSG3dResFileHeader *resFileHeader = unkC0->resFileHeaders[index];
    return ov01_02204168(unkC0, &resFileHeader, index);
}

static void ov01_022040C0(UnkStruct_FieldSysC0 *unkC0, UnkStruct_FieldSysC0_SubC *object) {
    unkC0->numObjects--;
    unkC0->objects[unkC0->numObjects] = object;
}

UnkStruct_FieldSysC0_SubC *Field3dObjectList_GetRenderObjectByID(UnkStruct_FieldSysC0 *unkC0, int id) {
    u8 index = unkC0->modelNumToLoadedSlot[id];
    if (index != 0xFF) {
        return unkC0->objects[index];
    }
    return NULL;
}

static UnkStruct_FieldSysC0_SubC *ov01_022040E4(UnkStruct_FieldSysC0 *unkC0, int index) {
    NNSG3dResFileHeader *resFileHeader = unkC0->resFileHeaders[index];
    return ov01_02204168(unkC0, &resFileHeader, index);
}

UnkStruct_FieldSysC0_SubC *ov01_022040F8(UnkStruct_FieldSysC0 *unkC0, int index) {
    if (ov01_02204144(unkC0, index)) {
        return Field3dObjectList_GetRenderObjectByID(unkC0, index);
    }
    return ov01_022040E4(unkC0, index);
}

BOOL ov01_0220411C(UnkStruct_FieldSysC0 *unkC0, UnkStruct_FieldSysC0_SubC *object) {
    if (object == NULL) {
        return FALSE;
    }

    if (ov01_02204144(unkC0, object->index) == FALSE) {
        ov01_022040C0(unkC0, object);
        return TRUE;
    }
    return FALSE;
}

static BOOL ov01_02204144(UnkStruct_FieldSysC0 *unkC0, int index) {
    return unkC0->modelNumToLoadedSlot[index] != 0xFF;
}

BOOL ov01_02204154(UnkStruct_FieldSysC0 *unkC0, int index) {
    return unkC0->resFileHeaders[index] != NULL;
}

static UnkStruct_FieldSysC0_SubC *ov01_02204168(UnkStruct_FieldSysC0 *unkC0, NNSG3dResFileHeader **resFileHeader, int index) {
    unkC0->objects[unkC0->numObjects]->model = NNS_G3dGetMdlByIdx(NNS_G3dGetMdlSet(*resFileHeader), 0);

    NNS_G3dRenderObjInit(&unkC0->objects[unkC0->numObjects]->renderObj, unkC0->objects[unkC0->numObjects]->model);
    UnkStruct_FieldSysC0_SubC *object = unkC0->objects[unkC0->numObjects];
    unkC0->numObjects++;
    object->index = index;
    return object;
}

FieldSystemUnkSubC8 *ov01_022041C4(enum HeapID heapID) { // FieldSystemUnkSubC8_New
    FieldSystemUnkSubC8 *unkC8 = Heap_Alloc(heapID, sizeof(FieldSystemUnkSubC8));
    unkC8->unkC = 0;
    unkC8->unk0 = 0;
    unkC8->unk4 = 0;
    unkC8->unk8 = 0;
}

FieldSystemUnkSubCC_Sub0 *ov01_022041D8(FieldSystemUnkSubC8 *unkC8, enum HeapID heapID, u16 count) {
    FieldSystemUnkSubCC_Sub0 *ret = Heap_Alloc(heapID, sizeof(FieldSystemUnkSubCC_Sub0));
    ret->unk22 = 0;
    ret->unk20 = count;
    ret->unk1C = NULL;
    HeapExp_FndInitAllocator(&ret->unk0, heapID, 4);
    ret->unk10 = Heap_Alloc(heapID, count << 5);
    MIi_CpuClearFast(0, (u32 *)(ret->unk10), count << 5);
    ret->unk14 = Heap_Alloc(heapID, count << 2);

    for (int i = 0; i < count; i++) {
        ret->unk10[i].unk14 = 0;
        ret->unk10[i].res = NULL;
        ret->unk10[i].animObj = NULL;
        ret->unk14[i] = &ret->unk10[i];
    }
    ret->next = NULL;
    if (unkC8->unk4 == NULL) {
        unkC8->unk4 = ret;
        unkC8->unk8 = ret;
        unkC8->unk0 = ret;
    } else {
        unkC8->unk8->next = ret;
        unkC8->unk8 = ret;
    }
    unkC8->unkC++;
    return ret;
}

void ov01_02204278(FieldSystemUnkSubC8 *unkSubC8) { // UnkSubC8_Free
    if (unkSubC8 != NULL) {
        FieldSystemUnkSubCC_Sub0 *unk4 = unkSubC8->unk4;
        if (unk4 == NULL) {
            Heap_Free(unkSubC8);
        } else {
            for (int i = 0; i < unkSubC8->unkC; i++) {
                for (int j = 0; j < unk4->unk20; j++) {
                    MapPropAnimation *animation = &unk4->unk10[j];
                    if (animation->unk14 == 1) {
                        ov01_02204500(unk4, animation);
                        ov01_0220431C(unk4, animation);
                    }
                }
                Heap_Free(unk4->unk10);
                Heap_Free(unk4->unk14);
                FieldSystemUnkSubCC_Sub0 *prev = unk4;
                unk4 = unk4->next;
                Heap_Free(prev);
            }
            Heap_Free(unkSubC8);
        }
    }
}

MapPropAnimation *ov01_022042FC(FieldSystemUnkSubCC_Sub0 *unkCC_Sub0) {
    u16 index = unkCC_Sub0->unk22;
    if (unkCC_Sub0->unk22 >= unkCC_Sub0->unk20) {
        GF_ASSERT(FALSE);
        return NULL;
    }
    unkCC_Sub0->unk22++;
    return unkCC_Sub0->unk14[index];
}

void ov01_0220431C(FieldSystemUnkSubCC_Sub0 *unkCC_Sub0, MapPropAnimation *animation) {
    if (unkCC_Sub0->unk22 == 0) {
        GF_AssertFail();
    } else {
        unkCC_Sub0->unk22--;
        if (animation->res != NULL) {
            Heap_Free(animation->res);
        }
        animation->animObj = NULL;
        animation->unk14 = 0;
        unkCC_Sub0->unk14[unkCC_Sub0->unk22] = animation;
    }
}

static u16 ov01_0220434C(FieldSystemUnkSubCC_Sub0 *unkCC_Sub0) { // FieldSystemUnkSubCC_Sub0_GetCount?
    return unkCC_Sub0->unk22;
}

void ov01_02204350(FieldSystemUnkSubC8 *unkC8) {
    if (unkC8 != NULL) {
        FieldSystemUnkSubCC_Sub0 *unkCC_Sub0 = unkC8->unk4;
        if (unkCC_Sub0 != NULL) {
            for (int i = 0; i < unkC8->unkC; i++) {
                for (int j = 0; j < unkCC_Sub0->unk20; j++) {
                    MapPropAnimation *animation = &unkCC_Sub0->unk10[j];
                    if (animation->unk14 == 1 && animation->paused != TRUE && animation->looping) {
                        MapPropAnimation_AdvanceFrame(animation);
                        if (animation->loopCount != -1 && MapPropAnimation_IsOnLastFrame(animation)) {
                            if (animation->unk18 + 1 >= animation->loopCount) {
                                animation->looping = FALSE;
                            } else {
                                animation->unk18++;
                            }
                        }
                    }
                }
                unkCC_Sub0 = unkCC_Sub0->next;
            }
        }
    }
}

void ov01_022043D8(FieldSystemUnkSubC8 *unkSubC8) {
    int i, j;
    if (unkSubC8 != NULL) {
        FieldSystemUnkSubCC_Sub0 *unk4 = unkSubC8->unk4;
        if (unk4 != NULL) {
            for (i = 0; i < unkSubC8->unkC; i++) {
                for (j = 0; j < unk4->unk20; j++) {
                    MapPropAnimation *animation = &unk4->unk10[j];
                    if (animation->unk14 == 1 && animation->looping) {
                        animation->paused = TRUE;
                    }
                }
                unk4 = unk4->next;
            }
        }
    }
}

void ov01_02204424(FieldSystemUnkSubC8 *unkSubC8) {
    if (unkSubC8 != NULL) {
        FieldSystemUnkSubCC_Sub0 *unkCC_Sub0 = unkSubC8->unk4;
        if (unkCC_Sub0 != NULL) {
            for (int i = 0; i < unkSubC8->unkC; i++) {
                for (int j = 0; j < unkCC_Sub0->unk20; j++) {
                    MapPropAnimation *animation = &unkCC_Sub0->unk10[j];
                    if (animation->unk14 == 1 && animation->looping) {
                        MapPropAnimation_GoToFirstFrame(animation);
                    }
                }
                unkCC_Sub0 = unkCC_Sub0->next;
            }
        }
    }
}

void ov01_02204470(FieldSystemUnkSubCC_Sub0 *unkCC_Sub0, MapPropAnimation *animation, void *res, NNSG3dResMdl *model, NNSG3dResTex *texture) {
    void *anim = NNS_G3dGetAnmByIdx(res, 0);
    if (anim == NULL) {
        GF_AssertFail();
    }
    NNSG3dAnmObj *animObj = NNS_G3dAllocAnmObj(&unkCC_Sub0->unk0, anim, model);
    animation->animObj = animObj;
    if (animObj == NULL) {
        GF_AssertFail();
    }
    NNS_G3dAnmObjInit(animation->animObj, anim, model, texture);
    animation->res = res;
}

static void ov01_022044B0(FieldSystemUnkSubCC_Sub0 *unkCC_Sub0, MapPropAnimation *animation, void *res, int arg3) {
    void (*unkFunc)() = unkCC_Sub0->unk1C;
    if (unkFunc != NULL) {
        unkFunc(unkCC_Sub0, animation, res, arg3);
        animation->res = res;
    }
}

static void ov01_022044C4(FieldSystemUnkSubCC_Sub0 *unkCC_Sub0, void *arg1) {
    unkCC_Sub0->unk1C = arg1;
}

void MapPropAnimation_Init(MapPropAnimation *animation, int loopCount, BOOL paused, BOOL reversed) {
    animation->unk18 = 0;
    animation->looping = TRUE;
    animation->unk14 = 1;
    animation->loopCount = loopCount;
    animation->paused = paused;
    animation->reversed = reversed;
}

void MapPropAnimation_GoToFirstFrame(MapPropAnimation *animation) {
    if (!animation->reversed) {
        animation->animObj->frame = 0;
    } else {
        animation->animObj->frame = NNS_G3dAnmObjGetNumFrame(animation->animObj) - FX32_ONE;
    }
}

void ov01_02204500(FieldSystemUnkSubCC_Sub0 *unkCC_Sub0, MapPropAnimation *animation) { // FieldSystemUnkSubCC_Sub0_FreeMapPropAnimObj
    NNS_G3dFreeAnmObj(&unkCC_Sub0->unk0, animation->animObj);
}

void MapPropAnimation_AddToRenderObj(NNSG3dRenderObj *renderObj, MapPropAnimation *animation) {
    NNS_G3dRenderObjAddAnmObj(renderObj, animation->animObj);
}

BOOL MapPropAnimation_RemoveFromRenderObj(NNSG3dRenderObj *renderObj, MapPropAnimation *animation) {
    if (animation == NULL) {
        return FALSE;
    }
    if (animation->animObj == NULL) {
        return FALSE;
    }
    if (renderObj == NULL) {
        return FALSE;
    }
    if (renderObj->anmMat == NULL && renderObj->anmJnt == NULL && renderObj->anmVis == NULL) {
        return FALSE;
    }

    NNS_G3dRenderObjRemoveAnmObj(renderObj, animation->animObj);
    return TRUE;
}

u16 MapPropAnimation_GetLoopCount(MapPropAnimation *animation) {
    return animation->loopCount;
}

void MapPropAnimation_SetPaused(MapPropAnimation *animation, BOOL paused) {
    animation->paused = paused;
}

BOOL MapPropAnimation_IsLoopFinished(MapPropAnimation *animation) {
    return animation->looping == FALSE;
}

void MapPropAnimation_GoToLastFrame(MapPropAnimation *animation) {
    if (!animation->reversed) {
        animation->animObj->frame = NNS_G3dAnmObjGetNumFrame(animation->animObj) - FX32_ONE;
    } else {
        animation->animObj->frame = 0;
    }
}

void MapPropAnimation_SetLoopCount(MapPropAnimation *animation, const int loopCount) {
    animation->loopCount = loopCount;
}

static void MapPropAnimation_AdvanceFrame(MapPropAnimation *animation) {
    if (!animation->reversed) {
        animation->animObj->frame += FX32_ONE;
        if (animation->animObj->frame == NNS_G3dAnmObjGetNumFrame(animation->animObj)) {
            animation->animObj->frame = 0;
        }
    } else {
        if (animation->animObj->frame <= 0) {
            animation->animObj->frame = NNS_G3dAnmObjGetNumFrame(animation->animObj) - FX32_ONE;
        } else {
            animation->animObj->frame -= FX32_ONE;
        }
    }
}

static BOOL MapPropAnimation_IsOnLastFrame(MapPropAnimation *animation) {
    if (!animation->reversed) {
        return animation->animObj->frame >= NNS_G3dAnmObjGetNumFrame(animation->animObj) - FX32_ONE;
    }
    return animation->animObj->frame == 0;
}

FieldSystemUnkSubCC *ov01_0220460C(FieldSystemUnkSubC8 *unkSubC8) { // UnkCC_Init
    FieldSystemUnkSubCC *unkCC = Heap_Alloc(HEAP_ID_FIELD1, sizeof(FieldSystemUnkSubCC));
    FieldSystemUnkSubCC_Sub0 *unkCC_Sub0 = ov01_022041D8(unkSubC8, HEAP_ID_FIELD1, 1);
    unkCC->unk0 = unkCC_Sub0;
    ov01_022044C4(unkCC_Sub0, &ov01_022046A4);
    return unkCC;
}

void ov01_02204634(FieldSystemUnkSubCC *unkCC) { // UnkCC_Free
    Heap_Free(unkCC);
}

void ov01_0220463C(FieldSystemUnkSubCC *unkCC, int fileID) { // UnkCC_Load
    MapPropAnimation *animation = ov01_022042FC(unkCC->unk0);
    if (animation == NULL) {
        GF_AssertFail();
    }
    MapPropAnimation_Init(animation, -1, FALSE, FALSE);
    ov01_022044B0(unkCC->unk0, animation, AllocAndReadWholeNarcMemberByIdPair(NARC_a_1_4_0, fileID, HEAP_ID_FIELD1), 0);
    unkCC->mapPropAnimation = animation;
}

void ov01_02204678(FieldSystemUnkSubCC *unkCC, NNSG3dRenderObj *renderObj) { // UnkCC_AddMapPropAnimationToRenderObj
    MapPropAnimation_AddToRenderObj(renderObj, unkCC->mapPropAnimation);
}

void ov01_02204688(FieldSystemUnkSubCC *unkCC, NNSG3dRenderObj *renderObj) { // UnkCC_RemoveMapPropAnimationFromRenderObj
    MapPropAnimation_RemoveFromRenderObj(renderObj, unkCC->mapPropAnimation);
}

void ov01_02204698(FieldSystemUnkSubCC *unkCC) {
    ov01_0220434C(unkCC->unk0);
}

static void ov01_022046A4(NNSFndAllocator *pAllocator, NNSG3dAnmObj **pAlloc, void *res) {
    void *anim = NNS_G3dGetAnmByIdx(res, 0);
    NNSG3dAnmObj *alloc = ov01_022046D4(pAllocator, anim);
    *pAlloc = alloc;
    ov01_02204728(alloc, anim);
}

static int ov01_022046C8(ResAnim_4004 *anim) { // Returns some sort of size
    return ((anim->numMapData * 2) + 0x1C) & ~3;
}

static void *ov01_022046D4(NNSFndAllocator *pAllocator, ResAnim_4004 *anim) {
    return NNS_FndAllocFromAllocator(pAllocator, ov01_022046C8(anim));
}

static void ov01_022046E8(NNSG3dAnmObj *alloc, ResAnim_4004 *anim) {
    alloc->funcAnm = _02110A0C; // NNS_G3dFuncAnmMatNsBtaDefault
    u8 numMapData = anim->numMapData;
    alloc->numMapData = numMapData;
    MIi_CpuClear16(0, alloc->mapData, numMapData * 2);
    for (u32 i = 0; i < anim->numMapData; i++) {
        alloc->mapData[i] = i | 0x100;
    }
}

static void ov01_02204728(NNSG3dAnmObj *alloc, ResAnim_4004 *anim) {
    alloc->frame = 0;
    alloc->resAnm = anim;
    alloc->next = NULL;
    alloc->priority = 0x7F;
    alloc->ratio = 0x1000;
    alloc->resTex = NULL;
    ov01_022046E8(alloc, anim);
}

FieldSystemUnkSub104 *ov01_02204744(enum HeapID heapID) { // FieldSystemUnkSub104_Init
    FieldSystemUnkSub104 *unk104 = Heap_Alloc(heapID, sizeof(FieldSystemUnkSub104));
    MIi_CpuClearFast(0, (u32 *)unk104, sizeof(FieldSystemUnkSub104));
    unk104->timeOfDay = GF_RTC_GetTimeOfDay();
    return unk104;
}

void ov01_02204764(FieldSystemUnkSub104 *unk104) { // FieldSystemUnkSub104_Free
    Heap_Free(unk104);
}

void ov01_0220476C(FieldSystemUnkSub104 *unk104, NNSG3dRenderObj *renderObj, MapPropAnimation **animation, int count) {
    if (unk104->unk4 < 4) {
        if (unk104->unkSub[unk104->unk4].unk0) {
            GF_AssertFail();
        }
        if (count > 4) {
            GF_AssertFail();
        }
        FieldSystemUnkSub104_Sub8 *unkSub = &unk104->unkSub[unk104->unk4];
        unkSub->unk0 = 1;
        unkSub->unk4 = count;
        if (count > 4) {
            unkSub->unk4 = 4;
        }
        for (u8 i = 0;  i < unkSub->unk4; i++) {
            unkSub->animations[i] = animation[i];
        }
        unkSub->renderObj = renderObj;
        unk104->unk4++;
    } else {
        GF_AssertFail();
    }
}

static const u8 sTimeOfDayVisualState[RTC_TIMEOFDAY_COUNT] = {
    [RTC_TIMEOFDAY_MORN] = 0,
    [RTC_TIMEOFDAY_DAY] = 1,
    [RTC_TIMEOFDAY_EVE] = 2,
    [RTC_TIMEOFDAY_NITE] = 3,
    [RTC_TIMEOFDAY_LATE] = 3
};

void ov01_022047DC(FieldSystemUnkSub104 *unk104) { // FieldSystemUnkSub104_SwitchTimeOfDay
    u8 currentTimeOfDay = (u8)GF_RTC_GetTimeOfDay();
    if (unk104->timeOfDay != currentTimeOfDay) {
        u8 previousTimeOfDay = unk104->timeOfDay;
        unk104->timeOfDay = (TIMEOFDAY)currentTimeOfDay;
        for (int i = 0; i < 4; i++) {
            if (unk104->unkSub[i].unk0 != 0) {
                FieldSystemUnkSub104_Sub8 *sub = &unk104->unkSub[i];
                MapPropAnimation_RemoveFromRenderObj(sub->renderObj, sub->animations[sTimeOfDayVisualState[previousTimeOfDay]]);
                MapPropAnimation_AddToRenderObj(sub->renderObj, sub->animations[sTimeOfDayVisualState[currentTimeOfDay]]);
            }
        }
    }
}

u8 ov01_02204834(FieldSystemUnkSub104 *unk104) { // FieldSystemUnkSub104_GetTimeOfDayVisualState
    return sTimeOfDayVisualState[unk104->timeOfDay];
}
