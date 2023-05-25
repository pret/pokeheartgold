#ifndef POKEHEARTGOLD_FIELD_MAP_OBJECT_H
#define POKEHEARTGOLD_FIELD_MAP_OBJECT_H

#include "script.h"

typedef struct SavedMapObject {
    u32 unk0;
    u32 unk4;
    u8 objId;
    u8 movement;
    s8 xRange;
    s8 yRange;
    s8 initialFacing;
    s8 currentFacing;
    s8 nextFacing;
    u16 unk10;
    u16 gfxId;
    u16 type;
    u16 flagId;
    u16 script;
    s16 unk1A;
    s16 unk1C;
    s16 unk1E;
    s16 initialX;
    s16 initialHeight;
    s16 initialY;
    s16 currentX;
    s16 currentHeight;
    s16 currentY;
    fx32 unk2C;
    u8 unk30[16];
    u8 unk40[16];
} SavedMapObject;

struct MapObjectMan { //declared field_system.h
    u32 flags;
    u32 object_count;
    u32 unk8;
    u32 unkC;
    u8 unk10[4];
    NARC* mmodel_narc;
    u8 unk18[4];
    u8 unk1C[0x124-0x1C];
    LocalMapObject* objects;
    FieldSystem* fsys;
}; // size: 0x12c

typedef void (*LocalMapObject_UnkCallback)(LocalMapObject* object);

struct LocalMapObject { //declared field_system.h
    /*0x000*/ u32 flags;
    /*0x004*/ u32 flags2;
    /*0x008*/ int id;
    /*0x00C*/ int unkC;
    /*0x010*/ int gfxId;
    /*0x014*/ int movement;
    /*0x018*/ int type;
    /*0x01C*/ int evFlagId;
    /*0x020*/ int scriptId;
    /*0x024*/ int initialFacing;
    /*0x028*/ int currentFacing;
    /*0x02C*/ int nextFacing;
    /*0x030*/ int currentFacingBak;
    /*0x034*/ int nextFacingBak;
    /*0x038*/ int param[3];
    /*0x044*/ int xrange;
    /*0x048*/ int yrange;
    /*0x04C*/ int initialX;
    /*0x050*/ int initialHeight;
    /*0x054*/ int initialY;
    /*0x058*/ int previousX;
    /*0x05C*/ int previousHeight;
    /*0x060*/ int previousY;
    /*0x064*/ int currentX;
    /*0x068*/ int currentHeight;
    /*0x06C*/ int currentY;
    /*0x070*/ VecFx32 positionVec;
    /*0x07C*/ VecFx32 facingVec;
    /*0x088*/ VecFx32 unk88;
    /*0x094*/ VecFx32 unk94;
    /*0x0A0*/ int unkA0;
    /*0x0A4*/ int movementCmd;
    /*0x0A8*/ int movementStep;
    /*0x0AC*/ u16 unkAC;
    /*0x0AE*/ u16 unkAE;
    /*0x0B0*/ SysTask* unkB0;
    /*0x0B4*/ MapObjectMan* manager;
    /*0x0B8*/ LocalMapObject_UnkCallback unkB8;
    /*0x0BC*/ LocalMapObject_UnkCallback unkBC;
    /*0x0C0*/ LocalMapObject_UnkCallback unkC0;
    /*0x0C4*/ LocalMapObject_UnkCallback unkC4;
    /*0x0C8*/ LocalMapObject_UnkCallback unkC8;
    /*0x0CC*/ LocalMapObject_UnkCallback unkCC;
    /*0x0D0*/ LocalMapObject_UnkCallback unkD0;
    /*0x0D4*/ LocalMapObject_UnkCallback unkD4;
    /*0x0D8*/ u8 unkD8[0x10];
    /*0x0E8*/ u8 unkE8[0x10];
    /*0x0F8*/ u8 unkF8[0x10];
    /*0x108*/ u8 unk108[0x20];
    /*0x128*/ u16 unk128;
};

typedef struct UnkLMOCallbackStruct {
    u32 unk0;
    LocalMapObject_UnkCallback unk4;
    LocalMapObject_UnkCallback unk8;
    LocalMapObject_UnkCallback unkC;
    LocalMapObject_UnkCallback unk10;
} UnkLMOCallbackStruct;

typedef struct UnkLMOCallbackStruct2 {
    LocalMapObject_UnkCallback unk0;
    LocalMapObject_UnkCallback unk4;
    LocalMapObject_UnkCallback unk8;
    LocalMapObject_UnkCallback unkC;
    LocalMapObject_UnkCallback unk10;
} UnkLMOCallbackStruct2;

typedef enum MapObjectFlagBits {
    MAPOBJECTFLAG_ACTIVE = (1 << 0),
    MAPOBJECTFLAG_SINGLE_MOVEMENT = (1 << 1),
    MAPOBJECTFLAG_UNK2 = (1 << 2),
    MAPOBJECTFLAG_UNK3 = (1 << 3),
    MAPOBJECTFLAG_UNK4 = (1 << 4),
    MAPOBJECTFLAG_UNK5 = (1 << 5),
    MAPOBJECTFLAG_MOVEMENT_PAUSED = (1 << 6),
    MAPOBJECTFLAG_UNK7 = (1 << 7),
    MAPOBJECTFLAG_UNK8 = (1 << 8),
    MAPOBJECTFLAG_UNK9 = (1 << 9),
    MAPOBJECTFLAG_UNK10 = (1 << 10),
    MAPOBJECTFLAG_UNK11 = (1 << 11),
    MAPOBJECTFLAG_UNK12 = (1 << 12),
    MAPOBJECTFLAG_UNK13 = (1 << 13),
    MAPOBJECTFLAG_UNK14 = (1 << 14),
    MAPOBJECTFLAG_UNK15 = (1 << 15),
    MAPOBJECTFLAG_UNK16 = (1 << 16),
    MAPOBJECTFLAG_UNK17 = (1 << 17),
    MAPOBJECTFLAG_UNK18 = (1 << 18),
    MAPOBJECTFLAG_UNK19 = (1 << 19),
    MAPOBJECTFLAG_UNK20 = (1 << 20),
    MAPOBJECTFLAG_UNK21 = (1 << 21),
    MAPOBJECTFLAG_UNK22 = (1 << 22),
    MAPOBJECTFLAG_UNK23 = (1 << 23),
    MAPOBJECTFLAG_UNK24 = (1 << 24),
    MAPOBJECTFLAG_UNK25 = (1 << 25),
    MAPOBJECTFLAG_UNK26 = (1 << 26),
    MAPOBJECTFLAG_UNK27 = (1 << 27),
    MAPOBJECTFLAG_UNK28 = (1 << 28),
    MAPOBJECTFLAG_UNK29 = (1 << 29),
    MAPOBJECTFLAG_UNK30 = (1 << 30),
    MAPOBJECTFLAG_UNK31 = (1 << 31),
} MapObjectFlagBits;

struct MapObjectInitArgs;

// FIXME: Some of these declarations are static and don't belong in here.
LocalMapObject *CreateSpecialFieldObject(MapObjectMan *objectMan, u32 x, u32 z, u32 direction, u32 sprite, u32 movement, u32 mapNo);
LocalMapObject *CreateSpecialFieldObjectEx(MapObjectMan *mapObjectMan, u32 x, u32 y, u32 direction, u32 a4, u32 a5, u32 mapNo, u32 a7, u32 a8, u32 spriteId);
void DeleteMapObject(LocalMapObject *mapObject);
LocalMapObject *sub_0205EEB4(MapObjectMan *manager, u32 movement);
LocalMapObject *GetMapObjectByID(MapObjectMan *manager, u32 id);
void sub_0205FC94(LocalMapObject *mapObject, u32 movement);
u32 MapObject_GetMovement(LocalMapObject *mapObject);
u32 MapObject_GetGfxID(LocalMapObject *mapObject);
void MapObject_SetGfxID(LocalMapObject *mapObject, u32 spriteId);
void MapObject_ClearFlag18(LocalMapObject *mapObject, BOOL clear);
void MapObject_SetFlagsBits(LocalMapObject *mapObject, u32 bits);
void MapObject_ClearFlagsBits(LocalMapObject *mapObject, u32 bits);
void MapObject_SetID(LocalMapObject *mapObject, u32 id);
void MapObject_SetType(LocalMapObject *mapObject, u32 type);
u32 MapObject_GetType(LocalMapObject *mapObject);
void MapObject_SetFlagID(LocalMapObject *mapObject, u32 flagId);
void MapObject_SetScript(LocalMapObject *mapObject, u32 script);
u32 MapObject_GetScript(LocalMapObject *mapObject);
void MapObject_SetParam(LocalMapObject *mapObject, u32 value, int which);
int MapObject_GetParam(LocalMapObject *mapObject, int which);
void MapObject_SetXRange(LocalMapObject *mapObject, u32 xRange);
void MapObject_SetYRange(LocalMapObject *mapObject, u32 yRange);
void MapObject_SetFlag29(LocalMapObject *mapObject, BOOL enable_bit);
BOOL MapObject_CheckFlag9(LocalMapObject *mapObject);
BOOL MapObject_CheckFlag28(LocalMapObject *mapObject);
void MapObject_SetFlag9(LocalMapObject *mapObject, BOOL enable_bit);
void MapObject_SetFlag19(LocalMapObject *mapObject, BOOL enable_bit);
void Fsys_SyncMapObjectsToSaveEx(FieldSystem *fsys, MapObjectMan *mapObjectMan, struct SavedMapObject *saveObj, int objNum);
void MapObjectMan_RestoreFromSave(MapObjectMan *mapObjectMan, SavedMapObject *list, u32 numObj);
SavedMapObject* SaveMapObjects_SearchSpriteId(SavedMapObject* list, u32 num_objects, u16 sprite_id);
MapObjectMan *sub_0205E0BC(FieldSystem *fsys, int num, HeapID heapId);
void sub_0205F55C(MapObjectMan *man);
void MapObjectMan_RemoveAllActiveObjects(MapObjectMan *man);
void MapObjectMan_delete(MapObjectMan *man);
BOOL MapObject_IsMovementPaused(LocalMapObject *obj);
BOOL MapObject_IsSingleMovementActive(LocalMapObject *obj);
void MapObject_PauseMovement(LocalMapObject *obj);
void MapObject_UnpauseMovement(LocalMapObject *obj);
void MapObjectMan_PauseAllMovement(MapObjectMan *man);
void MapObjectMan_UnpauseAllMovement(MapObjectMan *man);
void InitMapObjectsFromEventTemplates(MapObjectMan* man, u32 mapId, u32 nObjs, OBJECT_EVENT* dest);
u32 MapObject_GetCurrentX(LocalMapObject *object);
u32 MapObject_GetCurrentY(LocalMapObject *object);
int MapObject_GetCurrentHeight(LocalMapObject *object);
LocalMapObject* CreateMapObjectFromTemplate(MapObjectMan *mapObjectMan, u16 objectId, u32 numObjects, u32 mapId, const OBJECT_EVENT *templates);
VecFx32 *MapObject_GetPositionVecPtr(LocalMapObject *object);
void MapObject_Remove(LocalMapObject *object);
u32 MapObject_GetFacingDirection(LocalMapObject *object);
void sub_0205F9A0(LocalMapObject *object, const VecFx32 *vec);
void MapObject_SetFlag10(LocalMapObject *object, BOOL set);
u32 MapObject_GetID(LocalMapObject *obj);
void sub_0205FC2C(LocalMapObject *obj, u32 x, u32 height, u32 y, u32 direction);
void MapObject_GetPositionVec(LocalMapObject *object, VecFx32 *dest);
void MapObject_SetPositionVec(LocalMapObject *object, VecFx32 *src);
void sub_0205F328(LocalMapObject* obj, u32 a1);
u32 sub_0205F09C(LocalMapObject *obj, u32 a1);
u32 sub_0205F254(LocalMapObject *obj);
BOOL sub_0205F0A8(LocalMapObject* object, u32 id, u32 a2);
MapObjectMan* MapObjectMan_new(u32 count);
void MapObjectMan_SetFieldSysPtr(MapObjectMan*, FieldSystem*);
void MapObjectMan_SetCount(MapObjectMan*, u32);
void sub_0205F198(MapObjectMan*, u32);
LocalMapObject* MapObjectMan_GetObjects(MapObjectMan*);
void sub_0205E420(LocalMapObject* object);
u32 MapObject_GetFlagsWord(LocalMapObject* object);
u32 MapObject_GetFlagsMask(LocalMapObject* object, u32 mask);
BOOL MapObject_TestFlagsBits(LocalMapObject* object, u32 bits);
void MapObject_SetMovement(LocalMapObject* object, u32 movement);
u16 ObjectEventTemplate_GetID(OBJECT_EVENT*);
void sub_0205F16C(MapObjectMan* manager);
MapObjectMan* sub_0205F160(MapObjectMan* manager);
void sub_0205EAF0(MapObjectMan* manager, LocalMapObject* object);
void sub_0205EFB4(LocalMapObject* object);
void sub_0205EFA4(LocalMapObject* object);
void sub_0205F250(LocalMapObject* object, u32 a1);
void sub_0205EC90(LocalMapObject* object, MapObjectMan* manager);
void MapObject_InitFromObjectEventTemplate(LocalMapObject* object, OBJECT_EVENT* template, FieldSystem* fsys);
FieldSystem* MapObjectMan_GetFieldSysPtr(MapObjectMan*);
LocalMapObject* MapObjectMan_GetFirstInactiveObject(MapObjectMan*);
void sub_0205F058(LocalMapObject* object, u32 map_no, OBJECT_EVENT* template);
LocalMapObject* sub_0205EE10(MapObjectMan*, u32, u32);
u16 ObjectEventTemplate_GetFlagID_AssertScriptIdIsFFFF(OBJECT_EVENT* template);
void sub_0205F014(LocalMapObject* object, OBJECT_EVENT* template, u32 map_no);
LocalMapObject* sub_0205EA98(MapObjectMan*, u32, u32);
BOOL ObjectEventTemplate_ScriptIdIsFFFF(OBJECT_EVENT* template);
u32 MapObjectMan_GetCount(MapObjectMan*);
BOOL MapObject_IsInUse(LocalMapObject* object);
void* sub_0205F1A0(MapObjectMan*);
u32 sub_0205ED90(LocalMapObject*, u32, u32, OBJECT_EVENT*);
void MapObjectMan_SetObjects(MapObjectMan* manager, LocalMapObject* objects);
void ObjectEventTemplate_SetID(OBJECT_EVENT* template, u16);
void ObjectEventTemplate_SetSprite(OBJECT_EVENT*, u32);
void ObjectEventTemplate_SetMovement(OBJECT_EVENT*, u32);
void ObjectEventTemplate_SetType(OBJECT_EVENT*, u16);
void ObjectEventTemplate_SetFlagID(OBJECT_EVENT*, u16);
void ObjectEventTemplate_SetScript(OBJECT_EVENT*, u16);
void ObjectEventTemplate_SetFacing(OBJECT_EVENT*, u32);
void ObjectEventTemplate_SetParam(OBJECT_EVENT*, u32 value, int param);
void ObjectEventTemplate_SetXRange(OBJECT_EVENT*, s16);
void ObjectEventTemplate_SetYRange(OBJECT_EVENT*, s16);
void ObjectEventTemplate_SetXCoord(OBJECT_EVENT*, u32);
void ObjectEventTemplate_SetYCoord(OBJECT_EVENT*, u32);
void ObjectEventTemplate_SetHeight(OBJECT_EVENT*, u32);
u8* sub_0205F3BC(LocalMapObject* object);
u8* sub_0205F394(LocalMapObject* object);
BOOL MapObject_CheckFlag23(LocalMapObject* object);
BOOL MapObject_CheckFlag29(LocalMapObject* object);
fx32 MapObject_GetPosVecYCoord(LocalMapObject* object);
u32 MapObject_GetInitialY(LocalMapObject* object);
u32 MapObject_GetInitialHeight(LocalMapObject* object);
u32 MapObject_GetInitialX(LocalMapObject* object);
u32 MapObject_GetYRange(LocalMapObject* object);
u32 MapObject_GetXRange(LocalMapObject* object);
u32 MapObject_GetNextFacing(LocalMapObject* object);
u32 MapObject_GetInitialFacing(LocalMapObject* object);
u32 MapObject_GetFlags2Word(LocalMapObject* object);
void sub_0205EF6C(LocalMapObject* object);
void sub_0205F4AC(LocalMapObject* object);
void sub_0205F4C0(LocalMapObject* object);
void sub_0205E680(FieldSystem* fsys, LocalMapObject* local_object, SavedMapObject* saved_object);
void sub_0205E8EC(MapObjectMan* manager, LocalMapObject* object);
BOOL sub_0205EEF4(MapObjectMan*, LocalMapObject**, int*, u32);
BOOL MapObject_CheckFlag14(LocalMapObject* object);
void sub_0205E7C4(LocalMapObject* local_object, SavedMapObject* saved_object);
void sub_0205E934(LocalMapObject* object);
void MapObject_SetCurrentY(LocalMapObject* object, u32 y);
void MapObject_SetCurrentHeight(LocalMapObject* object, u32 height);
void MapObject_SetCurrentX(LocalMapObject* object, u32 x);
void MapObject_SetInitialY(LocalMapObject* object, u32 initial_y);
void MapObject_SetInitialHeight(LocalMapObject* object, u32 initial_height);
void MapObject_SetInitialX(LocalMapObject* object, u32 initial_x);
void MapObject_SetNextFacing(LocalMapObject* object, u32 direction);
void MapObject_ForceSetFacingDirection(LocalMapObject* object, u32 direction);
void MapObject_SetInitialFacing(LocalMapObject* object, u32 initial_facing);
void MapObject_SetFlags2Word(LocalMapObject* object, u32 bits);
void MapObject_SetFlagsWord(LocalMapObject* object, u32 bits);
u16 ObjectEventTemplate_GetSprite(OBJECT_EVENT*);
u16 ObjectEventTemplate_GetMovement(OBJECT_EVENT*);
u16 ObjectEventTemplate_GetType(OBJECT_EVENT*);
s16 ObjectEventTemplate_GetFacing(OBJECT_EVENT*);
u16 ObjectEventTemplate_GetScript(OBJECT_EVENT*);
u16 ObjectEventTemplate_GetParam(OBJECT_EVENT*, int param);
s16 ObjectEventTemplate_GetXRange(OBJECT_EVENT*);
s16 ObjectEventTemplate_GetYRange(OBJECT_EVENT*);
u32 ResolveObjectGfxId(FieldSystem* fsys, int a1);
void sub_0205E954(LocalMapObject* object);
void MapObject_SetPrevY(LocalMapObject* object, u32 previous_y);
void sub_0205EA08(struct MapObjectInitArgs* args);
void MapObject_SetPrevHeight(LocalMapObject* object, u32 previous_height);
void MapObject_SetPrevX(LocalMapObject* object, u32 previous_x);
u32 sub_0205F544(LocalMapObject* object);
int MapObject_CheckFlag25(LocalMapObject* object);
void MapObject_SetFlag25(LocalMapObject* object, BOOL set);
void sub_0205ED80(LocalMapObject* object);
const LocalMapObject* MapObjectMan_GetConstObjects(MapObjectMan*);
void sub_0205EF48(LocalMapObject* object);
void sub_0205FD20(LocalMapObject* object);
u8* sub_0205F3E4(LocalMapObject* object);
u8* sub_0205F40C(LocalMapObject* object);
void sub_0205F444(LocalMapObject* object);
void sub_0205F450(LocalMapObject* object);
void sub_0205F468(LocalMapObject* object, LocalMapObject_UnkCallback callback);
void sub_0205F47C(LocalMapObject* object, LocalMapObject_UnkCallback callback);
void sub_0205F490(LocalMapObject* object, LocalMapObject_UnkCallback callback);
void sub_0205F498(LocalMapObject* object);
void sub_0205F4A4(LocalMapObject* object, LocalMapObject_UnkCallback callback);
void sub_0205F4B8(LocalMapObject* object, LocalMapObject_UnkCallback callback);
void sub_0205F354(LocalMapObject* object, MapObjectMan* manager);
MapObjectMan* MapObject_GetManager(LocalMapObject* object);
MapObjectMan* sub_0205F364(LocalMapObject* object);
OBJECT_EVENT* sub_0205FA98(u16 id, int num_templates, OBJECT_EVENT* templates);
void sub_0205F338(LocalMapObject* object, SysTask* a1);
BOOL FlagGet(FieldSystem*, u16);
void MapObject_SetPositionVecFromTemplate(LocalMapObject* object, OBJECT_EVENT* template);
u16 ObjectEventTemplate_GetXCoord(OBJECT_EVENT* template);
u32 ObjectEventTemplate_GetHeight(OBJECT_EVENT* template);
u16 ObjectEventTemplate_GetYCoord(OBJECT_EVENT* template);
void sub_0205ECE0(LocalMapObject* object);
UnkLMOCallbackStruct* sub_0205FB00(u32 movement);
void* sub_0205F538(LocalMapObject* object);
void sub_0205F148(LocalMapObject* object);
void sub_0205F174(MapObjectMan* manager);
u32 sub_0205F19C(MapObjectMan* manager);
u32 MapObject_GetFlagID(LocalMapObject* object);
void sub_0205F414(LocalMapObject* object, LocalMapObject_UnkCallback callback);
void sub_0205F428(LocalMapObject* object, LocalMapObject_UnkCallback callback);
void sub_0205F43C(LocalMapObject* object, LocalMapObject_UnkCallback callback);
void sub_0205F470(LocalMapObject* object);
void MapObject_SetFlag14(LocalMapObject* object);
LocalMapObject_UnkCallback sub_0205FB18(UnkLMOCallbackStruct* unk);
LocalMapObject_UnkCallback sub_0205FB1C(UnkLMOCallbackStruct* unk);
LocalMapObject_UnkCallback sub_0205FB20(UnkLMOCallbackStruct* unk);
LocalMapObject_UnkCallback sub_0205FB24(UnkLMOCallbackStruct2* unk);
LocalMapObject_UnkCallback sub_0205FB28(UnkLMOCallbackStruct2* unk);
LocalMapObject_UnkCallback sub_0205FB2C(UnkLMOCallbackStruct2* unk);
LocalMapObject_UnkCallback sub_0205FB30(UnkLMOCallbackStruct2* unk);
LocalMapObject_UnkCallback sub_0205FB34(UnkLMOCallbackStruct2* unk);
UnkLMOCallbackStruct2* sub_0205FB38(u32 gfx_id);
void sub_0205F348(LocalMapObject* object);
u16 ObjectEventTemplate_GetFlagID(OBJECT_EVENT*);
FieldSystem* MapObject_GetFieldSysPtr(LocalMapObject* object);
void sub_0205FCC4(LocalMapObject* object);
void sub_0205FCC8(LocalMapObject* object);
void sub_0205FCCC(LocalMapObject* object);
void sub_0205FCD0(LocalMapObject* object);
void MapObject_SetFacingDirection(LocalMapObject* object, u32 direction);
void sub_0205F12C(SysTask* task, LocalMapObject* object);
BOOL sub_0205F73C(LocalMapObject* object);
BOOL sub_0205F5D4(MapObjectMan* manager);
BOOL MapObject_ScriptIdIsFFFF(LocalMapObject* object);
void sub_0205E3AC(LocalMapObject* object, u32 sprite_id);
void sub_0205EF5C(LocalMapObject* object);

#endif //POKEHEARTGOLD_FIELD_MAP_OBJECT_H
