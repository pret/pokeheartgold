#ifndef POKEHEARTGOLD_GF_3D_LOADER_H
#define POKEHEARTGOLD_GF_3D_LOADER_H

#include "heap.h"

typedef struct GF_2DGfxRawResObj {
    int id;
    void *data;
} GF_2DGfxRawResObj;

typedef struct GF_2DGfxRawResMan {
    GF_2DGfxRawResObj *vals;
    int max;
    int num;
} GF_2DGfxRawResMan;

typedef struct GF_3DGfxRawResObj {
    GF_2DGfxRawResObj *obj;
    NNSG3dTexKey texKey;
    NNSG3dTexKey tex4x4Key;
    NNSG3dPlttKey plttKey;
    void *resFileHeader;
    u16 hasLoadedFromHeader;
    u16 headerNeedsLoad;
} GF_3DGfxRawResObj;

typedef struct GF_3DGfxRawResMan {
    GF_2DGfxRawResMan *man;
    GF_3DGfxRawResObj *objs;
} GF_3DGfxRawResMan;

GF_2DGfxRawResMan *GF2dGfxRawResMan_Create(int num, HeapID heapId);
void GF2dGfxRawResObj_Destroy(GF_2DGfxRawResMan *man);
BOOL GF2dGfxRawResMan_DoesNotHaveObjWithId(GF_2DGfxRawResMan *resourceMgr, int id);
GF_2DGfxRawResObj *GF2dGfxRawResMan_AllocObj(GF_2DGfxRawResMan *resourceMgr, void *resource, int id);
GF_2DGfxRawResObj *GF2dGfxRawResMan_ReadAndAllocObj(GF_2DGfxRawResMan *resourceMgr, const char *name, int id, HeapID heapId);
void GF2dGfxRawResMan_FreeObj(GF_2DGfxRawResMan *resourceMgr, GF_2DGfxRawResObj *obj);
void GF2dGfxRawResMan_FreeAllObjs(GF_2DGfxRawResMan *resourceMgr);
GF_2DGfxRawResObj *GF2dGfxRawResMan_GetObjById(GF_2DGfxRawResMan *resourceMgr, int id);
int Get2DGfxRawResObjId(GF_2DGfxRawResObj *resource);
void *GF2dGfxRawResObj_GetData(GF_2DGfxRawResObj *resource);
void GF2dGfxRawResObj_ReplaceData(GF_2DGfxRawResObj *resource, void *newPtr);

GF_3DGfxRawResMan *GF3dGfxRawResMan_Create(int num, HeapID heapId);
void GF3dGfxRawResMan_Destroy(GF_3DGfxRawResMan *man);
BOOL GF3dGfxRawResMan_DoesNotHaveObjWithId(GF_3DGfxRawResMan *man, int id);
GF_3DGfxRawResObj *GF3dGfxRawResMan_AllocObj(GF_3DGfxRawResMan *man, void *resource, int id, BOOL shouldCopyWithoutTex, HeapID heapId);
GF_3DGfxRawResObj *GF3dGfxRawResMan_AllocObjAndKeys(GF_3DGfxRawResMan *man, void *resource, int id, BOOL shouldCopyWithoutTex, HeapID heapId);
void GF3dGfxRawResMan_FreeObjById(GF_3DGfxRawResMan *man, int id);
void GF3dGfxRawResMan_FreeAllObjs(GF_3DGfxRawResMan *man);
GF_3DGfxRawResObj *GF3dGfxRawResMan_GetObjById(GF_3DGfxRawResMan *man, int id);
NNSG3dResTex *GF3dGfxRawResObj_GetTex(GF_3DGfxRawResObj *obj);
void GF3dGfxRawResObj_LoadTex(GF_3DGfxRawResObj *obj);
void GF3dGfxRawResMan_LoadObjTexById(GF_3DGfxRawResMan *man, int id);
void GF3dGfxRawResObj_FreeVramAndSecondaryHeader(GF_3DGfxRawResObj *obj);
void GF3dGfxRawResMan_FreeObjVramAndSecondaryHeaderById(GF_3DGfxRawResMan *man, int id);
void GF3dGfxRawResObj_AllocVramAndGetKeys(GF_3DGfxRawResObj *obj);
NNSG3dTexKey GF3dGfxRawResObj_GetTexKey(GF_3DGfxRawResObj *obj);
NNSG3dTexKey GF3dGfxRawResObj_GetTex4x4Key(GF_3DGfxRawResObj *obj);
NNSG3dPlttKey GF3dGfxRawResObj_GetPlttKey(GF_3DGfxRawResObj *obj);
u32 G3dResFileHeader_GetSizeWithoutTex(const NNSG3dResFileHeader *header);

#endif // POKEHEARTGOLD_GF_3D_LOADER_H
