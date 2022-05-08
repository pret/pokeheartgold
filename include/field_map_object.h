#ifndef POKEHEARTGOLD_FIELD_MAP_OBJECT_H
#define POKEHEARTGOLD_FIELD_MAP_OBJECT_H

#include "script.h"

typedef struct LocalMapObject LocalMapObject;

struct SavedMapObject {
    u8 filler_00[8];
    u8 objId;
    u8 filler_9[9];
    u16 unk_12;
    u8 filler_14[0x3C];
};

struct LocalMapObject {
    /*0x000*/ u32 flags;
    /*0x004*/ u32 flags2;
    /*0x008*/ int id;
    /*0x00C*/ int unkC;
    /*0x010*/ int gfxId;
    /*0x014*/ int movement;
    /*0x018*/ int type;
    /*0x01C*/ int evFlagId;
    /*0x020*/ int scriptId;
    /*0x024*/ int facingInit;
    /*0x028*/ int curFacing;
    /*0x02C*/ int nextFacing;
    /*0x030*/ int curFacingBak;
    /*0x034*/ int nextFacingBak;
    /*0x038*/ int param[3];
    /*0x044*/ int xrange;
    /*0x048*/ int yrange;
    /*0x04C*/ int xInit;
    /*0x050*/ int hInit;
    /*0x054*/ int yInit;
    /*0x058*/ int xPrev;
    /*0x05C*/ int hPrev;
    /*0x060*/ int yPrev;
    /*0x064*/ int xCurr;
    /*0x068*/ int hCurr;
    /*0x06C*/ int yCurr;
    /*0x070*/ VecFx32 posVec;
    /*0x07C*/ VecFx32 faceVec;
    /*0x088*/ VecFx32 unk88;
    /*0x094*/ VecFx32 unk94;
    /*0x0A0*/ int unkA0;
    /*0x0A4*/ int movementCmd;
    /*0x0A8*/ int movementStep;
    /*0x0AC*/ u16 unkAC;
    /*0x0AE*/ u16 unkAE;
    /*0x0B0*/ int unkB0;
    /*0x0B4*/ int unkB4;
    /*0x0B8*/ void (*unkB8)(LocalMapObject *localMapObject);
    /*0x0BC*/ void (*unkBC)(LocalMapObject *localMapObject);
    /*0x0C0*/ void (*unkC0)(LocalMapObject *localMapObject);
    /*0x0C4*/ void (*unkC4)(LocalMapObject *localMapObject);
    /*0x0C8*/ void (*unkC8)(LocalMapObject *localMapObject);
    /*0x0CC*/ void (*unkCC)(LocalMapObject *localMapObject);
    /*0x0D0*/ void (*unkD0)(LocalMapObject *localMapObject);
    /*0x0D4*/ void (*unkD4)(LocalMapObject *localMapObject);
    /*0x0D8*/ u8 unkD8[0x10];
    /*0x0E8*/ u8 unkE8[0x10];
    /*0x0F8*/ u8 unkF8[0x10];
    /*0x108*/ u8 unk108[0x20];
    /*0x128*/ FieldSystem *fsys;
};

LocalMapObject *CreateSpecialFieldObject(MapObjectMan *objectMan, u32 x, u32 z, u32 direction, u32 sprite, u32 movement, u32 mapNo);
void DeleteMapObject(LocalMapObject *mapObject);
LocalMapObject *sub_0205EEB4(MapObjectMan *arr, int a1);
LocalMapObject *GetMapObjectByID(MapObjectMan *arr, int id);
void sub_0205FC94(LocalMapObject *mapObject, int movement);
int MapObject_GetMovement(LocalMapObject *mapObject);
u32 MapObject_GetGfxID(LocalMapObject *mapObject);
void MapObject_SetGfxID(LocalMapObject *mapObject, u32 spriteId);
void sub_0205F6AC(LocalMapObject *mapObject, int a1);
void MapObject_SetBits(LocalMapObject *mapObject, u32 bits);
void MapObject_ClearBits(LocalMapObject *mapObject, u32 bits);
void MapObject_SetID(LocalMapObject *mapObject, u32 id);
void MapObject_SetType(LocalMapObject *mapObject, u32 type);
void MapObject_SetFlagID(LocalMapObject *mapObject, u32 flagId);
void MapObject_SetScript(LocalMapObject *mapObject, u32 script);
void MapObject_SetParam(LocalMapObject *mapObject, int value, int which);
int MapObject_GetParam(LocalMapObject *mapObject, int which);
void MapObject_SetXRange(LocalMapObject *mapObject, u32 xRange);
void MapObject_SetYRange(LocalMapObject *mapObject, u32 yRange);
void sub_0205F89C(LocalMapObject *mapObject, BOOL enable_bit);
BOOL sub_0205F684(LocalMapObject *mapObject);
BOOL sub_0205F83C(LocalMapObject *mapObject);
void sub_0205F690(LocalMapObject *mapObject, BOOL enable_bit);
void sub_0205F6E0(LocalMapObject *mapObject, BOOL enable_bit);
void Fsys_SyncMapObjectsToSaveEx(FieldSystem *fsys, MapObjectMan *mapObjectMan, struct SavedMapObject *saveObj, int objNum);
void MapObjectMan_RestoreFromSave(MapObjectMan *mapObjectMan, struct SavedMapObject *saveObj, int objNum);
struct SavedMapObject *SaveMapObjects_SearchSpriteId(struct SavedMapObject *saveObj, int objNum, u16 spriteId);
MapObjectMan *sub_0205E0BC(FieldSystem *fsys, int num, HeapID heapId);
void sub_0205F55C(MapObjectMan *man);
void sub_0205E494(MapObjectMan *man);
void sub_0205E0E8(MapObjectMan *man);
BOOL MapObject_IsMovementPaused(LocalMapObject *obj);
BOOL MapObject_IsSingleMovementActive(LocalMapObject *obj);
void MapObject_PauseMovement(LocalMapObject *obj);
void MapObject_UnpauseMovement(LocalMapObject *obj);
void MapObjectMan_PauseAllMovement(MapObjectMan *man);
void MapObjectMan_UnpauseAllMovement(MapObjectMan *man);
void InitMapObjectsFromEventTemplates(MapObjectMan* man, int mapId, u32 nObjs, OBJECT_EVENT* dest);
int MapObject_GetCurrentX(LocalMapObject *object);
int MapObject_GetCurrentY(LocalMapObject *object);
int MapObject_GetCurrentHeight(LocalMapObject *object);
BOOL CreateMapObjectFromTemplate(MapObjectMan *mapObjectMan, u16 objectId, u32 numObjects, u32 mapId, const OBJECT_EVENT *templates);
VecFx32 *MapObject_GetPositionVecPtr(LocalMapObject *object);
void MapObject_Remove(LocalMapObject *object);
u32 MapObject_GetFacingDirection(LocalMapObject *object);
void sub_0205F9A0(LocalMapObject *object, const VecFx32 *vec);
void sub_0205F79C(LocalMapObject *object, u8 a1);
int MapObject_GetID(LocalMapObject *obj);
void sub_0205FC2C(LocalMapObject *obj, int x, int height, int y, int direction);
void MapObject_GetPositionVec(LocalMapObject *object, VecFx32 *dest);
void MapObject_SetPositionVec(LocalMapObject *object, VecFx32 *src);
void sub_0205F328(LocalMapObject* obj, int a1);

#endif //POKEHEARTGOLD_FIELD_MAP_OBJECT_H
