#ifndef POKEHEARTGOLD_UNK_02025534_H
#define POKEHEARTGOLD_UNK_02025534_H

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

GF_2DGfxRawResMan *Create2DGfxResMan(int num, HeapID heapId);
void Destroy2DGfxResMan(GF_2DGfxRawResMan *man);
BOOL _2DGfxResMan_DoesNotHaveObjWithId(GF_2DGfxRawResMan *resourceMgr, int id);
GF_2DGfxRawResObj *_2DGfxResMan_AllocObj(GF_2DGfxRawResMan *resourceMgr, void *resource, int id);
GF_2DGfxRawResObj *_2DGfxResMan_ReadAndAllocObj(GF_2DGfxRawResMan *resourceMgr, const char *name, int id, HeapID heapId);
void _2DGfxResMan_FreeObj(GF_2DGfxRawResMan *resourceMgr, GF_2DGfxRawResObj *obj);
void _2DGfxResMan_FreeAllObjs(GF_2DGfxRawResMan *resourceMgr);
GF_2DGfxRawResObj *_2DGfxResMan_GetObjById(GF_2DGfxRawResMan *resourceMgr, int id);
int Get2DGfxRawResObjId(GF_2DGfxRawResObj *resource);
void *_2DGfxResObj_GetData(GF_2DGfxRawResObj *resource);
void _2DGfxResObj_ReplaceData(GF_2DGfxRawResObj *resource, void *newPtr);

GF_3DGfxRawResMan *Create3DGfxResMan(int num, HeapID heapId);
void Destroy3DGfxResMan(GF_3DGfxRawResMan *man);
BOOL _3DGfxResMan_DoesNotHaveObjWithId(GF_3DGfxRawResMan *man, int id);
GF_3DGfxRawResObj *_3DGfxResMan_AllocObj(GF_3DGfxRawResMan *man, void *resource, int id, BOOL shouldCopyWithoutTex, HeapID heapId);
GF_3DGfxRawResObj *_3DGfxResMan_AllocObjAndKeys(GF_3DGfxRawResMan *man, void *resource, int id, BOOL shouldCopyWithoutTex, HeapID heapId);
void _3DGfxResMan_FreeObjById(GF_3DGfxRawResMan *man, int id);
void _3DGfxResMan_FreeAllObjs(GF_3DGfxRawResMan *man);
GF_3DGfxRawResObj *_3DGfxResMan_GetObjById(GF_3DGfxRawResMan *man, int id);
NNSG3dResTex *_3DGfxResObj_GetTex(GF_3DGfxRawResObj *obj);
void _3DGfxResObj_LoadTex(GF_3DGfxRawResObj *obj);
void _3DGfxResMan_LoadObjTexById(GF_3DGfxRawResMan *man, int id);
void _3DGfxResObj_FreeVramAndSecondaryHeader(GF_3DGfxRawResObj *obj);
void _3DGfxResMan_FreeObjVramAndSecondaryHeaderById(GF_3DGfxRawResMan *man, int id);
void _3DGfxResObj_AllocVramAndGetKeys(GF_3DGfxRawResObj *obj);
NNSG3dTexKey _3DGfxResObj_GetTexKey(GF_3DGfxRawResObj *obj);
NNSG3dTexKey _3DGfxResObj_GetTex4x4Key(GF_3DGfxRawResObj *obj);
NNSG3dPlttKey _3DGfxResObj_GetPlttKey(GF_3DGfxRawResObj *obj);
u32 G3dResFileHeader_GetSizeWithoutTex(const NNSG3dResFileHeader *header);

#endif // POKEHEARTGOLD_UNK_02025534_H
