#include "field/overlay_01_02204004.h"

#include "filesystem.h"
#include "filesystem_files_def.h"
#include "global.h"

static BOOL ov01_02204144(UnkStruct_FieldSysC0 *unkC0, int index);
static UnkStruct_FieldSysC0_SubC *ov01_02204168(UnkStruct_FieldSysC0 *unkC0, NNSG3dResFileHeader **resFileHeader, int index);
static void ov01_02204594(FieldSystemUnkSubCC_Sub0_SubStruct *substruct);
static BOOL ov01_022045DC(FieldSystemUnkSubCC_Sub0_SubStruct *substruct);
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
    MIi_CpuClearFast(0, (u32*)unkC0->objectHeap, size);
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
    MIi_CpuClearFast(0, (u32*)(ret->unk10), count << 5);
    ret->unk14 = Heap_Alloc(heapID, count << 2); 

    for(int i = 0; i < count; i++) {
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
    } 
    else {
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
                    FieldSystemUnkSubCC_Sub0_SubStruct *substruct = &unk4->unk10[j];
                    if (substruct->unk14 == 1) {
                        ov01_02204500(unk4, substruct);
                        ov01_0220431C(unk4, substruct);
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

FieldSystemUnkSubCC_Sub0_SubStruct *ov01_022042FC(FieldSystemUnkSubCC_Sub0 *unkCC_Sub0) {
    u16 index = unkCC_Sub0->unk22;
    if (unkCC_Sub0->unk22 >= unkCC_Sub0->unk20) {
        GF_ASSERT(FALSE);
        return NULL;
    }
    unkCC_Sub0->unk22++;
    return unkCC_Sub0->unk14[index];
}

void ov01_0220431C(FieldSystemUnkSubCC_Sub0 *unkCC_Sub0, FieldSystemUnkSubCC_Sub0_SubStruct *substruct) {
    if (unkCC_Sub0->unk22 == 0) {
        GF_AssertFail();
    } else {
        unkCC_Sub0->unk22--;
        if (substruct->res != NULL) {
            Heap_Free(substruct->res);
        }
        substruct->animObj = NULL;
        substruct->unk14 = 0;
        unkCC_Sub0->unk14[unkCC_Sub0->unk22] = substruct;
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
                    FieldSystemUnkSubCC_Sub0_SubStruct *substruct = &unkCC_Sub0->unk10[j];
                    if (substruct->unk14 == 1 && substruct->unkC != 1 && substruct->unk1C) {
                        ov01_02204594(substruct);
                        if (substruct->unk8 != -1 && ov01_022045DC(substruct)) {
                            if (substruct->unk18 + 1 >= substruct->unk8) {
                                substruct->unk1C = 0;
                            } else {
                                substruct->unk18++;
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
                    FieldSystemUnkSubCC_Sub0_SubStruct *substruct = &unk4->unk10[j];
                    if (substruct->unk14 == 1 && substruct->unk1C) {
                        substruct->unkC = 1;
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
                    FieldSystemUnkSubCC_Sub0_SubStruct *substruct = &unkCC_Sub0->unk10[j];
                    if (substruct->unk14 == 1 && substruct->unk1C) {
                        ov01_022044E0(substruct);
                    }
                }
                unkCC_Sub0 = unkCC_Sub0->next;
            }
        }
    }
}

void ov01_02204470(FieldSystemUnkSubCC_Sub0 *unkCC_Sub0, FieldSystemUnkSubCC_Sub0_SubStruct *substruct, void *res, NNSG3dResMdl *model, NNSG3dResTex *texture) {
    void *anim = NNS_G3dGetAnmByIdx(res, 0);
    if (anim == NULL) {
        GF_AssertFail();
    }
    NNSG3dAnmObj *animObj = NNS_G3dAllocAnmObj(&unkCC_Sub0->unk0, anim, model);
    substruct->animObj = animObj;
    if (animObj == NULL) {
        GF_AssertFail();
    }
    NNS_G3dAnmObjInit(substruct->animObj, anim, model, texture);
    substruct->res = res;
}

static void ov01_022044B0(FieldSystemUnkSubCC_Sub0 *unkCC_Sub0, FieldSystemUnkSubCC_Sub0_SubStruct *substruct, void *res, int arg3) {
    void (*unkFunc)() = unkCC_Sub0->unk1C;
    if (unkFunc != NULL) {
        unkFunc(unkCC_Sub0, substruct, res, arg3);
        substruct->res = res;
    }
}

static void ov01_022044C4(FieldSystemUnkSubCC_Sub0 *unkCC_Sub0, void *arg1) {
    unkCC_Sub0->unk1C = arg1;
}

void ov01_022044C8(FieldSystemUnkSubCC_Sub0_SubStruct *substruct, int unk8, int unkC, int unk10) {
    substruct->unk18 = 0;
    substruct->unk1C = 1;
    substruct->unk14 = 1;
    substruct->unk8 = unk8;
    substruct->unkC = unkC;
    substruct->unk10 = unk10;
}

void ov01_022044E0(FieldSystemUnkSubCC_Sub0_SubStruct *substruct) {
    if (substruct->unk10 == 0) {
        substruct->animObj->frame = 0;
    } else {
        substruct->animObj->frame = NNS_G3dAnmObjGetNumFrame(substruct->animObj) - 0x1000;
    }
}

void ov01_02204500(FieldSystemUnkSubCC_Sub0 *unkCC_Sub0, FieldSystemUnkSubCC_Sub0_SubStruct *substruct) {
    NNS_G3dFreeAnmObj(&unkCC_Sub0->unk0, substruct->animObj);
}

void ov01_0220450C(UnkStruct_FieldSysC0_SubC *unkC0_SubC, FieldSystemUnkSubCC_Sub0_SubStruct *substruct) {
    NNS_G3dRenderObjAddAnmObj(&unkC0_SubC->renderObj, substruct->animObj);
}

BOOL ov01_02204518(UnkStruct_FieldSysC0_SubC *unkC0_SubC, FieldSystemUnkSubCC_Sub0_SubStruct *substruct) {
    if (substruct == NULL) return FALSE;
    if (substruct->animObj == NULL) return FALSE;
    if (unkC0_SubC == NULL) return FALSE;
    if (unkC0_SubC->renderObj.anmMat == NULL && unkC0_SubC->renderObj.anmJnt == NULL && unkC0_SubC->renderObj.anmVis == NULL) return FALSE;
    
    NNS_G3dRenderObjRemoveAnmObj(&unkC0_SubC->renderObj, substruct->animObj);
    return TRUE;
}

u16 ov01_02204554(FieldSystemUnkSubCC_Sub0_SubStruct *substruct) {
    return substruct->unk8;
}

void ov01_0220455C(FieldSystemUnkSubCC_Sub0_SubStruct *substruct, int unkC) {
    substruct->unkC = unkC;
}

BOOL ov01_02204560(FieldSystemUnkSubCC_Sub0_SubStruct *substruct) {
    return substruct->unk1C == 0;
}

void ov01_02204570(FieldSystemUnkSubCC_Sub0_SubStruct *substruct) {
    if (substruct->unk10 == 0) {
        substruct->animObj->frame = NNS_G3dAnmObjGetNumFrame(substruct->animObj) - 0x1000;
    } else {
        substruct->animObj->frame = 0;
    }
}

void ov01_02204590(FieldSystemUnkSubCC_Sub0_SubStruct *substruct, int unk8) {
    substruct->unk8 = unk8;
}

static void ov01_02204594(FieldSystemUnkSubCC_Sub0_SubStruct *substruct) {
    if (substruct->unk10 == 0) {
        substruct->animObj->frame += 0x1000;
        if (substruct->animObj->frame == NNS_G3dAnmObjGetNumFrame(substruct->animObj)) {
            substruct->animObj->frame = 0;
        }
    } else {
        if (substruct->animObj->frame <= 0) {
            substruct->animObj->frame = NNS_G3dAnmObjGetNumFrame(substruct->animObj) - 0x1000;
        } else {
            substruct->animObj->frame -= 0x1000;
        }
    }
}

static BOOL ov01_022045DC(FieldSystemUnkSubCC_Sub0_SubStruct *substruct) {
    if (substruct->unk10 == 0) {
        return substruct->animObj->frame >= NNS_G3dAnmObjGetNumFrame(substruct->animObj) - 0x1000;
    }
    return substruct->animObj->frame == 0;
}

FieldSystemUnkSubCC *ov01_0220460C(FieldSystemUnkSubC8 *unkSubC8) {
    FieldSystemUnkSubCC *unkCC = Heap_Alloc(HEAP_ID_FIELD1, sizeof(FieldSystemUnkSubCC));
    FieldSystemUnkSubCC_Sub0 *unkCC_Sub0 = ov01_022041D8(unkSubC8, HEAP_ID_FIELD1, 1);
    unkCC->unk0 = unkCC_Sub0;
    ov01_022044C4(unkCC_Sub0, &ov01_022046A4);
    return unkCC;
}

void ov01_02204634(FieldSystemUnkSubCC *unkCC) {
    Heap_Free(unkCC);
}

void ov01_0220463C(FieldSystemUnkSubCC *unkCC, int fileID) {
    FieldSystemUnkSubCC_Sub0_SubStruct *substruct = ov01_022042FC(unkCC->unk0);
    if (substruct == NULL) {
        GF_AssertFail();
    }
    ov01_022044C8(substruct, -1, 0, 0);
    ov01_022044B0(unkCC->unk0, substruct, AllocAndReadWholeNarcMemberByIdPair(NARC_a_1_4_0, fileID, HEAP_ID_FIELD1), 0);
    unkCC->unk4 = substruct;
}

void ov01_02204678(FieldSystemUnkSubCC *unkCC, UnkStruct_FieldSysC0_SubC *unkC0_SubC) {
    ov01_0220450C(unkC0_SubC, unkCC->unk4);
}

void ov01_02204688(FieldSystemUnkSubCC *unkCC, UnkStruct_FieldSysC0_SubC *unkC0_SubC) {
    ov01_02204518(unkC0_SubC, unkCC->unk4);
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
        alloc->mapData[i] =  i | 0x100;
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

FieldSystemUnkSub104 *ov01_02204744(enum HeapID heapID) {
    FieldSystemUnkSub104 *unk104 = Heap_Alloc(heapID, sizeof(FieldSystemUnkSub104));
    MIi_CpuClearFast(0, (u32*)unk104, sizeof(FieldSystemUnkSub104));
    unk104->timeOfDay = GF_RTC_GetTimeOfDay();
    return unk104;
}

void ov01_02204764(FieldSystemUnkSub104 *unk104) {
    Heap_Free(unk104);
}

void ov01_0220476C(FieldSystemUnkSub104 *unk104, UnkStruct_FieldSysC0_SubC *subC, FieldSystemUnkSubCC_Sub0_SubStruct **substruct, int arg3) {
    if (unk104->unk4 < 4) {
        if (unk104->unkSub[unk104->unk4].unk0) {
            GF_AssertFail();
        }
        if (arg3 > 4) {
            GF_AssertFail();
        }
        FieldSystemUnkSub104_Sub8 *unkSub = &unk104->unkSub[unk104->unk4];
        unkSub->unk0 = 1;
        unkSub->unk4 = arg3;
        if (arg3 > 4) {
            unkSub->unk4 = 4;
        }
        for (u8 i = 0;  i < unkSub->unk4; i++) {
            unkSub->unk8[i] = substruct[i];
        }
        unkSub->unk18 = subC;
        unk104->unk4++;
    } else {
        GF_AssertFail();
    }
}

static const u8 ov01_022095EC[5] = {
    [RTC_TIMEOFDAY_MORN]    = 0,
    [RTC_TIMEOFDAY_DAY]     = 1,
    [RTC_TIMEOFDAY_EVE]     = 2,
    [RTC_TIMEOFDAY_NITE]    = 3,
    [RTC_TIMEOFDAY_LATE]    = 3
};

void ov01_022047DC(FieldSystemUnkSub104 *unk104) { 
    u8 currentTimeOfDay = (u8)GF_RTC_GetTimeOfDay();
    if (unk104->timeOfDay != currentTimeOfDay) {
        u8 previousTimeOfDay = unk104->timeOfDay;
        unk104->timeOfDay = (TIMEOFDAY)currentTimeOfDay;
        for (int i = 0; i < 4; i++) {
            if (unk104->unkSub[i].unk0 != 0) {
                FieldSystemUnkSub104_Sub8* sub = &unk104->unkSub[i];
                ov01_02204518(sub->unk18, sub->unk8[ov01_022095EC[previousTimeOfDay]]);
                ov01_0220450C(sub->unk18, sub->unk8[ov01_022095EC[currentTimeOfDay]]);
            }
        }
    }
}

u8 ov01_02204834(FieldSystemUnkSub104 *unk104) {
    return ov01_022095EC[unk104->timeOfDay];
}
