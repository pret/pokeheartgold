// #include "field_player_avatar.h"
// #include "field_map_object.h"
// #include "script.h"
#include "filesystem.h"
#include "heap.h"
#include "unk_0200E320.h"

typedef struct OBJECT_EVENT {
    u16 id;
    u16 ovid;
    u16 mvt;
    u16 type;
    u16 flag;
    u16 scr;
    s16 dirn;
    u16 eye;
    u16 unk10;
    u16 tsure_poke_color;
    s16 xrange;
    s16 yrange;
    u16 x;
    u16 y;
    s32 z;
} OBJECT_EVENT;

typedef struct FieldSystem FieldSystem;
typedef struct LocalMapObject LocalMapObject;

typedef struct MapObjectMan {
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
} MapObjectMan; // size: 0x12c

typedef void (*LocalMapObject_UnkCallback)(LocalMapObject*);

typedef struct LocalMapObject {
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
} LocalMapObject;

typedef struct Unkthing {
    u32 unk0;
    LocalMapObject_UnkCallback unk4;
    LocalMapObject_UnkCallback unk8;
    LocalMapObject_UnkCallback unkC;
    LocalMapObject_UnkCallback unk10;
} Unkthing;

typedef struct Unkthing2 {
    LocalMapObject_UnkCallback unk0;
    LocalMapObject_UnkCallback unk4;
    LocalMapObject_UnkCallback unk8;
    LocalMapObject_UnkCallback unkC;
    LocalMapObject_UnkCallback unk10;
} Unkthing2;

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

MapObjectMan* MapObjectMan_new(u32 count);
void MapObjectMan_SetFieldSysPtr(MapObjectMan*, FieldSystem*);
void MapObjectMan_SetCount(MapObjectMan*, u32);
void sub_0205F198(MapObjectMan*, u32);
LocalMapObject* MapObjectMan_GetArray(MapObjectMan*);
void MapObject_Remove(LocalMapObject* object);
void sub_0205E420(LocalMapObject* object);
u32 MapObject_GetBitsWord(LocalMapObject* object);
void MapObject_SetXRange(LocalMapObject* object, u32 x_range);
void MapObject_SetYRange(LocalMapObject* object, u32 y_range);
void MapObject_SetBits(LocalMapObject* object, u32 bits);
void MapObject_ClearBits(LocalMapObject* object, u32 bits);
u32 MapObject_GetBitsMask(LocalMapObject* object, u32 mask);
BOOL MapObject_TestBits(LocalMapObject* object, u32 bits);
void MapObject_SetID(LocalMapObject* object, u32 id);
u32 sub_0205F254(LocalMapObject* object);
void MapObject_SetGfxID(LocalMapObject* object, u32 id);
void MapObject_SetMovement(LocalMapObject* object, u32 movement);
void MapObject_SetType(LocalMapObject* object, u32 type);
u16 ObjectEventTemplate_GetID(OBJECT_EVENT*);
void sub_0205F16C(MapObjectMan* manager);
MapObjectMan* sub_0205F160(MapObjectMan* manager);
void sub_0205EAF0(MapObjectMan* manager, LocalMapObject* object);
void sub_0205EFB4(LocalMapObject* object);
void sub_0205EFA4(LocalMapObject* object);
void sub_0205F250(LocalMapObject* object, u32 a1);
void sub_0205EC90(LocalMapObject* object, MapObjectMan* manager);
void sub_0205EB2C(LocalMapObject* object, OBJECT_EVENT* template, FieldSystem* fsys);
FieldSystem* MapObjectMan_GetFieldSysPtr(MapObjectMan*);
LocalMapObject* sub_0205EA64(MapObjectMan*);
void sub_0205F058(LocalMapObject* object, u32 map_no, OBJECT_EVENT* template);
LocalMapObject* sub_0205EE10(MapObjectMan*, u32, u32);
u16 ObjectEventTemplate_GetFlagID_AssertScriptIdIsFFFF(OBJECT_EVENT* template);
void sub_0205F014(LocalMapObject* object, OBJECT_EVENT* template, u32 map_no);
LocalMapObject* sub_0205EA98(MapObjectMan*, u32, u32);
BOOL ObjectEventTemplate_ScriptIdIsFFFF();
u32 MapObjectMan_GetCount(MapObjectMan*);
BOOL MapObject_IsInUse(LocalMapObject*);
void ov01_021F9FB0();
void* sub_0205F1A0(MapObjectMan*);
u32 sub_0205ED90(LocalMapObject*, u32, u32, OBJECT_EVENT*);
void sub_0205F1A4(MapObjectMan* manager, LocalMapObject* objects);
LocalMapObject* CreateSpecialFieldObjectEx(MapObjectMan* manager, u32 x, u32 y, u32 direction, u32 sprite, u32 movement, u32 map_no, u32 a7, u32 a8, u32 a9);
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
u8* sub_0205F3BC(LocalMapObject*);
u8* sub_0205F394(LocalMapObject*);
int sub_0205F784();
int sub_02061248();
int sub_0205F8B8();
fx32 MapObject_GetPosVecYCoord();
int sub_020611C8();
u32 MapObject_GetCurrentY(LocalMapObject*);
u32 MapObject_GetCurrentHeight(LocalMapObject*);
u32 MapObject_GetCurrentX(LocalMapObject*);
u32 MapObject_GetInitialY(LocalMapObject*);
u32 MapObject_GetInitialHeight(LocalMapObject*);
u32 MapObject_GetInitialX(LocalMapObject*);
u32 MapObject_GetYRange(LocalMapObject*);
u32 MapObject_GetXRange(LocalMapObject*);
u32 MapObject_GetParam(LocalMapObject*, int param);
u32 MapObject_GetNextFacing(LocalMapObject*);
u32 MapObject_GetFacingDirection(LocalMapObject*);
u32 MapObject_GetInitialFacing(LocalMapObject*);
u32 MapObject_GetScript(LocalMapObject*);
u32 MapObject_GetType(LocalMapObject*);
u32 MapObject_GetMovement(LocalMapObject*);
u32 MapObject_GetGfxID(LocalMapObject*);
u32 MapObject_GetID(LocalMapObject*);
u32 sub_0205F23C(LocalMapObject*);
void sub_0205EF6C(LocalMapObject* object);
void sub_020611DC();
void sub_0205F4AC();
void sub_0205F4C0();
void sub_0205E680(FieldSystem* fsys, LocalMapObject* local_object, SavedMapObject* saved_object);
void sub_0205E8EC(MapObjectMan* manager, LocalMapObject* object);
BOOL sub_0205EEF4(MapObjectMan*, LocalMapObject**, int*, u32);
BOOL sub_0205F678(LocalMapObject* object);
void sub_0205E7C4();
void sub_0205E934(LocalMapObject*);
void MapObject_SetPositionVec();
void MapObject_SetCurrentY();
void MapObject_SetCurrentHeight();
void MapObject_SetCurrentX();
void MapObject_SetInitialY();
void MapObject_SetInitialHeight();
void MapObject_SetInitialX();
void MapObject_SetParam();
void MapObject_SetNextFacing();
void MapObject_ForceSetFacingDirection();
void MapObject_SetInitialFacing();
void MapObject_SetScript();
void MapObject_SetFlagID();
void sub_0205F238();
void sub_0205F204();
u16 ObjectEventTemplate_GetSprite(OBJECT_EVENT*);
u16 ObjectEventTemplate_GetMovement(OBJECT_EVENT*);
u16 ObjectEventTemplate_GetType(OBJECT_EVENT*);
s16 ObjectEventTemplate_GetFacing(OBJECT_EVENT*);
u16 ObjectEventTemplate_GetScript(OBJECT_EVENT*);
u16 ObjectEventTemplate_GetParam(OBJECT_EVENT*, int param);
s16 ObjectEventTemplate_GetXRange(OBJECT_EVENT*);
s16 ObjectEventTemplate_GetYRange(OBJECT_EVENT*);
void MapObject_SetParam(LocalMapObject* object, u32 value, int param);
u32 ResolveObjectGfxId(FieldSystem* fsys, int a1);
void sub_0205E954(LocalMapObject*);
void MapObject_SetPrevY();
void sub_0205EA08();
void MapObject_SetPrevHeight();
void MapObject_SetPrevX();
void MapObject_GetPositionVec();
u32 sub_0205F544(LocalMapObject*);
int sub_0205F7D4(LocalMapObject*);
void sub_0205F7B8(LocalMapObject* object, BOOL set);
void sub_0205ED80(LocalMapObject* object);
const LocalMapObject* MapObjectMan_GetConstArray(MapObjectMan*);
void sub_0205EF48(LocalMapObject* object);
void sub_0205FD20(LocalMapObject* object);
void MapObject_PauseMovement(LocalMapObject* object);
void MapObject_UnpauseMovement(LocalMapObject* object);
u8* sub_0205F3E4(LocalMapObject*);
u8* sub_0205F40C(LocalMapObject*);
void sub_0205F444(LocalMapObject* object);
void sub_0205F450(LocalMapObject*);
void sub_0205F468(LocalMapObject* object, LocalMapObject_UnkCallback callback);
void sub_0205F47C(LocalMapObject* object, LocalMapObject_UnkCallback callback);
void sub_0205F490(LocalMapObject* object, LocalMapObject_UnkCallback callback);
void sub_0205F498(LocalMapObject* object);
void sub_0205F4A4(LocalMapObject* object, LocalMapObject_UnkCallback callback);
void sub_0205F4B8(LocalMapObject* object, LocalMapObject_UnkCallback callback);
void sub_0205F354(LocalMapObject* object, MapObjectMan* manager);
MapObjectMan* sub_0205F35C(LocalMapObject* object);
MapObjectMan* sub_0205F364(LocalMapObject* object);
OBJECT_EVENT* sub_0205FA98(u32 id, int num_templates, OBJECT_EVENT* templates);
void sub_0205F338(LocalMapObject* object, SysTask* a1);
BOOL FlagGet(FieldSystem*, u16);
void sub_0205EBFC(LocalMapObject* object, OBJECT_EVENT* template);
u16 ObjectEventTemplate_GetXCoord(OBJECT_EVENT* template);
u32 ObjectEventTemplate_GetHeight(OBJECT_EVENT* template);
u16 ObjectEventTemplate_GetYCoord(OBJECT_EVENT* template);
void sub_0205ECE0(LocalMapObject* object);
Unkthing* sub_0205FB00(u32 movement);
void sub_0205F328(LocalMapObject* object, u32 a1);
void* sub_0205F538(LocalMapObject* object);
void sub_0205F148(LocalMapObject* object);
void sub_0205F174(MapObjectMan* manager);
u32 sub_0205F19C(MapObjectMan* manager);
u32 MapObject_GetFlagID(LocalMapObject* object);
void sub_0205F414(LocalMapObject* object, LocalMapObject_UnkCallback callback);
void sub_0205F428(LocalMapObject* object, LocalMapObject_UnkCallback callback);
void sub_0205F43C(LocalMapObject* object, LocalMapObject_UnkCallback callback);
void sub_0205F470(LocalMapObject* object);
void sub_0205F66C(LocalMapObject* object);
LocalMapObject_UnkCallback sub_0205FB18(Unkthing* unk);
LocalMapObject_UnkCallback sub_0205FB1C(Unkthing* unk);
LocalMapObject_UnkCallback sub_0205FB20(Unkthing* unk);
LocalMapObject_UnkCallback sub_0205FB24(Unkthing2* unk);
LocalMapObject_UnkCallback sub_0205FB28(Unkthing2* unk);
LocalMapObject_UnkCallback sub_0205FB2C(Unkthing2* unk);
LocalMapObject_UnkCallback sub_0205FB30(Unkthing2* unk);
LocalMapObject_UnkCallback sub_0205FB34(Unkthing2* unk);
Unkthing2* sub_0205FB38(u32 gfx_id);
void sub_0205F348(LocalMapObject*);
u16 ObjectEventTemplate_GetFlagID(OBJECT_EVENT*);
FieldSystem* MapObject_GetFieldSysPtr(LocalMapObject*);
void sub_0205FCC4(LocalMapObject* object);
void sub_0205FCC8(LocalMapObject* object);
void sub_0205FCCC(LocalMapObject* object);
void sub_0205FCD0(LocalMapObject* object);
void MapObject_SetFacingDirection(LocalMapObject* object, u32 direction);
void sub_0205F12C(SysTask* task, LocalMapObject* object);

MapObjectMan* sub_0205E0BC(FieldSystem* fsys, int object_count, u32 a2) {
    MapObjectMan* ret = MapObjectMan_new(object_count);
    MapObjectMan_SetFieldSysPtr(ret, fsys);
    MapObjectMan_SetCount(ret, object_count);
    sub_0205F198(ret, a2);

    return ret;
}

void sub_0205E0E8(MapObjectMan* manager) {
    FreeToHeapExplicit((HeapID)11, MapObjectMan_GetArray(manager));
    FreeToHeapExplicit((HeapID)11, manager);
}

void sub_0205E104(MapObjectMan* manager, u32 a1, u32 a2, u32 num_object_events, OBJECT_EVENT* object_events) {
    u32 count = MapObjectMan_GetCount(manager);
    LocalMapObject* objects = MapObjectMan_GetArray(manager);

    // FIXME(tgsm): Obviously this is a for-loop, and it will match on Compiler Explorer that way,
    //              but it *will not* match here for some reason.
    //              https://ce.athq.de/z/nzvnEP
    if (count != 0) {
        do {
            if (MapObject_IsInUse(objects) != TRUE) {
                goto next;
            }

            switch (sub_0205ED90(objects, a2, num_object_events, object_events)) {
                case 0:
                    if (a2 == sub_0205F254(objects)) {
                        goto next;
                    }

                    if (MapObject_TestBits(objects, (1 << 10)) != FALSE) {
                        goto next;
                    }

                    MapObject_Remove(objects);
                case 1:
                case 2:
                    goto next;
            }

        next:
            objects++;
            count--;
        } while (count != 0);
    }

    ov01_021F9FB0(manager, sub_0205F1A0(manager));
}

MapObjectMan* MapObjectMan_new(u32 object_count) {
    LocalMapObject* objects;
    MapObjectMan* manager;

    manager = AllocFromHeap((HeapID)11, sizeof(MapObjectMan));
    GF_ASSERT(manager != NULL);
    memset(manager, 0, sizeof(MapObjectMan));

    objects = AllocFromHeap((HeapID)11, object_count * sizeof(LocalMapObject));
    GF_ASSERT(objects != NULL);
    memset(objects, 0, object_count * sizeof(LocalMapObject));

    sub_0205F1A4(manager, objects);

    return manager;
}

#ifdef NONMATCHING
LocalMapObject* sub_0205E1D0(MapObjectMan* manager, OBJECT_EVENT* object_events, u32 map_no) {
    OBJECT_EVENT template = *object_events;
    LocalMapObject* ret;
    u16 flag_id;
    u32 object_id;

    object_id = ObjectEventTemplate_GetID(&template);
    if (!ObjectEventTemplate_ScriptIdIsFFFF(&template)) {
        ret = sub_0205EA98(manager, object_id, map_no);
        if (ret != NULL) {
            sub_0205F014(ret, &template, map_no);
            return ret;
        }
    } else {
        flag_id = ObjectEventTemplate_GetFlagID_AssertScriptIdIsFFFF(&template);
        ret = sub_0205EE10(manager, object_id, (u32)flag_id);
        if (ret != NULL) {
            sub_0205F058(ret, map_no, &template);
            return ret;
        }
    }

    ret = sub_0205EA64(manager);
    if (ret != NULL) {
        sub_0205EB2C(ret, &template, MapObjectMan_GetFieldSysPtr(manager));
        sub_0205EC90(ret, manager);
        sub_0205F250(ret, map_no);
        sub_0205EFA4(ret);
        sub_0205EFB4(ret);
        MapObject_SetBits(ret, (1 << 2));
        sub_0205EAF0(manager, ret);
        sub_0205F16C(sub_0205F160(manager));
    }

    return ret;
}
#else
asm LocalMapObject* sub_0205E1D0(MapObjectMan* manager, OBJECT_EVENT* object_events, u32 a2) {
    push {r3, r4, r5, r6, r7, lr}
    sub sp, #0x20
    add r7, r2, #0
    add r2, sp, #0
    add r3, r1, #0
    add r5, r0, #0
    add r6, r2, #0
    ldmia r3!, {r0, r1}
    stmia r2!, {r0, r1}
    ldmia r3!, {r0, r1}
    stmia r2!, {r0, r1}
    ldmia r3!, {r0, r1}
    stmia r2!, {r0, r1}
    ldmia r3!, {r0, r1}
    stmia r2!, {r0, r1}
    add r0, r6, #0
    bl ObjectEventTemplate_GetID
    add r4, r0, #0
    add r0, r6, #0
    bl ObjectEventTemplate_ScriptIdIsFFFF
    cmp r0, #0
    bne _0205E21C
    add r0, r5, #0
    add r1, r4, #0
    add r2, r7, #0
    bl sub_0205EA98
    add r4, r0, #0
    beq _0205E23E
    add r1, r6, #0
    add r2, r7, #0
    bl sub_0205F014
    add sp, #0x20
    add r0, r4, #0
    pop {r3, r4, r5, r6, r7, pc}
    _0205E21C:
    add r0, r6, #0
    bl ObjectEventTemplate_GetFlagID_AssertScriptIdIsFFFF
    add r2, r0, #0
    add r0, r5, #0
    add r1, r4, #0
    bl sub_0205EE10
    add r4, r0, #0
    beq _0205E23E
    add r1, r7, #0
    add r2, r6, #0
    bl sub_0205F058
    add sp, #0x20
    add r0, r4, #0
    pop {r3, r4, r5, r6, r7, pc}
    _0205E23E:
    add r0, r5, #0
    bl sub_0205EA64
    add r4, r0, #0
    beq _0205E290
    add r0, r5, #0
    bl MapObjectMan_GetFieldSysPtr
    add r2, r0, #0
    add r0, r4, #0
    add r1, r6, #0
    bl sub_0205EB2C
    add r0, r4, #0
    add r1, r5, #0
    bl sub_0205EC90
    add r0, r4, #0
    add r1, r7, #0
    bl sub_0205F250
    add r0, r4, #0
    bl sub_0205EFA4
    add r0, r4, #0
    bl sub_0205EFB4
    add r0, r4, #0
    mov r1, #4
    bl MapObject_SetBits
    add r0, r5, #0
    add r1, r4, #0
    bl sub_0205EAF0
    add r0, r5, #0
    bl sub_0205F160
    bl sub_0205F16C
    add r0, r4, #0
    _0205E290:
    add sp, #0x20
    pop {r3, r4, r5, r6, r7, pc}
}
#endif

LocalMapObject* CreateSpecialFieldObject(MapObjectMan* manager, u32 x, u32 y, u32 direction, u32 sprite, u32 movement, u32 map_no) {
    return CreateSpecialFieldObjectEx(manager, x, y, direction, sprite, movement, map_no, 0, 0, 0);
}

LocalMapObject* CreateSpecialFieldObjectEx(MapObjectMan* manager, u32 x, u32 y, u32 direction, u32 sprite, u32 movement, u32 map_no, u32 a7, u32 a8, u32 a9) {
    OBJECT_EVENT template;
    ObjectEventTemplate_SetID(&template, 0);
    ObjectEventTemplate_SetSprite(&template, sprite);
    ObjectEventTemplate_SetMovement(&template, movement);
    ObjectEventTemplate_SetType(&template, 0);
    ObjectEventTemplate_SetFlagID(&template, 0);
    ObjectEventTemplate_SetScript(&template, 0);
    ObjectEventTemplate_SetFacing(&template, direction);
    ObjectEventTemplate_SetParam(&template, a7, 0);
    ObjectEventTemplate_SetParam(&template, a8, 1);
    ObjectEventTemplate_SetParam(&template, a9, 2);
    ObjectEventTemplate_SetXRange(&template, 0);
    ObjectEventTemplate_SetYRange(&template, 0);
    ObjectEventTemplate_SetXCoord(&template, x);
    ObjectEventTemplate_SetYCoord(&template, y);
    ObjectEventTemplate_SetHeight(&template, 0);

    return sub_0205E1D0(manager, &template, map_no);
}

u16 ObjectEventTemplate_GetFlagID(OBJECT_EVENT*);

LocalMapObject* CreateMapObjectFromTemplate(MapObjectMan* manager, u32 a1, u32 num_object_events, u32 map_no, OBJECT_EVENT* template) {
    LocalMapObject* ret = NULL;
    OBJECT_EVENT* event = sub_0205FA98(a1, num_object_events, template);
    if (event != NULL) {
        u32 flag_id = ObjectEventTemplate_GetFlagID(event);
        FieldSystem* fsys = MapObjectMan_GetFieldSysPtr(manager);
        if (FlagGet(fsys, (u16)flag_id) == FALSE) {
            ret = sub_0205E1D0(manager, event, map_no);
        }
    }

    return ret;
}

void sub_0205E38C(LocalMapObject* object, u32 sprite_id) {
    MapObject_SetGfxID(object, sprite_id);
    sub_0205EF48(object);
    MapObject_ClearBits(object, (1 << 14));
    sub_0205EFB4(object);
}

void sub_0205E3AC(LocalMapObject* object, u32 sprite_id) {
    if (sub_0205F73C(object) == TRUE) {
        sub_0205E420(object);
    }
    sub_0205E38C(object, sprite_id);
}

void sub_0205F348(LocalMapObject*);

void MapObject_Remove(LocalMapObject* object) {
    if (sub_0205F5D4(sub_0205F35C(object)) == TRUE) {
        sub_0205F498(object);
    }
    sub_0205F444(object);
    sub_0205F348(object);
    sub_0205F174(sub_0205F364(object));
    sub_0205ED80(object);
}

FieldSystem* MapObject_GetFieldSysPtr(LocalMapObject*);

void DeleteMapObject(LocalMapObject* object) {
    u32 flag_id = MapObject_GetFlagID(object);
    FieldSystem* fsys = MapObject_GetFieldSysPtr(object);
    FlagSet(fsys, (u16)flag_id);
    MapObject_Remove(object);
}

void sub_0205FCC4(LocalMapObject* object);
void sub_0205FCC8(LocalMapObject* object);
void sub_0205FCCC(LocalMapObject* object);
void sub_0205FCD0(LocalMapObject* object);

void sub_0205E420(LocalMapObject* object) {
    if (sub_0205F5D4(sub_0205F35C(object)) == TRUE) {
        if (MapObject_GetBitsMask(object, (1 << 14)) != FALSE) {
            sub_0205F498(object);
        }
        MapObject_ClearBits(object, (1 << 14));
    }
    MapObject_SetGfxID(object, 0xFFFF);
    sub_0205F468(object, sub_0205FCC4);
    sub_0205F47C(object, sub_0205FCC8);
    sub_0205F490(object, sub_0205FCC8);
    sub_0205F4A4(object, sub_0205FCCC);
    sub_0205F4B8(object, sub_0205FCD0);
}

void sub_0205E494(MapObjectMan* manager) {
    int i = 0;
    int count = MapObjectMan_GetCount(manager);
    LocalMapObject* objects = MapObjectMan_GetArray(manager);

    do {
        if (MapObject_GetBitsMask(objects, (1 << 0)) != 0) {
            MapObject_Remove(objects);
        }

        i++;
        objects++;
    } while (i < count);
}

void sub_0205E4C8(MapObjectMan* manager) {
    GF_ASSERT(sub_0205F5D4(manager) == TRUE);

    int i = 0;
    int count = MapObjectMan_GetCount(manager);
    LocalMapObject* objects = MapObjectMan_GetArray(manager);

    do {
        if (MapObject_GetBitsMask(objects, (1 << 0)) != 0 && MapObject_GetBitsMask(objects, (1 << 14)) != 0) {
            sub_0205F4AC(objects);
            sub_0205EF6C(objects);
        }

        i++;
        objects++;
    } while (i < count);
}

void sub_0205E520(MapObjectMan* manager) {
    GF_ASSERT(sub_0205F5D4(manager) == TRUE);

    int i = 0;
    int count = MapObjectMan_GetCount(manager);
    LocalMapObject* objects = MapObjectMan_GetArray(manager);

    do {
        if (MapObject_IsInUse(objects) == TRUE) {
            if (sub_0205F678(objects) == TRUE) {
                sub_0205F4C0(objects);
            } else {
                sub_0205EFB4(objects);
            }

            sub_0205EF48(objects);
            sub_020611DC(objects);
        }

        i++;
        objects++;
    } while (i < count);
}

void sub_0205E580(MapObjectMan* manager) {
    GF_ASSERT(sub_0205F5D4(manager) == TRUE);

    int i = 0;
    int count = MapObjectMan_GetCount(manager);
    LocalMapObject* objects = MapObjectMan_GetArray(manager);

    do {
        if (MapObject_IsInUse(objects) == TRUE && MapObject_GetID(objects) == 0xFF) {
            if (sub_0205F678(objects) == TRUE) {
                sub_0205F4C0(objects);
            } else {
                sub_0205EFB4(objects);
            }

            sub_0205EF48(objects);
            sub_020611DC(objects);

            return;
        }

        i++;
        objects++;
    } while (i < count);
}

void Fsys_SyncMapObjectsToSaveEx(FieldSystem* fsys, MapObjectMan* manager, SavedMapObject* list, int count) {
    int index = 0;
    LocalMapObject* local_object;
    SavedMapObject* saved_object = list;
    while (sub_0205EEF4(manager, &local_object, &index, (1 << 0))) {
        sub_0205E680(fsys, local_object, saved_object);

        count--;
        saved_object++;

        GF_ASSERT(count > 0);
    }

    if (count != 0) {
        memset(saved_object, 0, count * sizeof(SavedMapObject));
    }
}

// FIXME(tgsm): This matches on Compiler Explorer, but not here.
//              https://ce.athq.de/z/GE1ohW
#ifdef NONMATCHING
void MapObjectMan_RestoreFromSave(MapObjectMan* manager, SavedMapObject* list, u32 num_objects) {
    SavedMapObject* saved_object = list;
    for (; num_objects > 0; saved_object++, num_objects--) {
        if ((saved_object->unk0 & (1 << 0)) == 0) {
            continue;
        }

        LocalMapObject* local_object = sub_0205EA64(manager);
        GF_ASSERT(local_object != NULL);

        sub_0205E7C4(local_object, saved_object);
        sub_0205E8EC(manager, local_object);
    }
}
#else
asm void MapObjectMan_RestoreFromSave(MapObjectMan*, void*, u32) {
    push {r3, r4, r5, r6, r7, lr}
    add r6, r0, #0
    add r5, r1, #0
    add r7, r2, #0
    beq _0205E67E
    _0205E652:
    ldr r1, [r5, #0]
    mov r0, #1
    tst r0, r1
    beq _0205E678
    add r0, r6, #0
    bl sub_0205EA64
    add r4, r0, #0
    bne _0205E668
    bl GF_AssertFail
    _0205E668:
    add r0, r4, #0
    add r1, r5, #0
    bl sub_0205E7C4
    add r0, r6, #0
    add r1, r4, #0
    bl sub_0205E8EC
    _0205E678:
    add r5, #0x50
    sub r7, r7, #1
    bne _0205E652
    _0205E67E:
    pop {r3, r4, r5, r6, r7, pc}
}
#endif

void sub_0205E680(FieldSystem* fsys, LocalMapObject* local_object, SavedMapObject* saved_object) {
    saved_object->unk0 = MapObject_GetBitsWord(local_object);
    saved_object->unk4 = sub_0205F23C(local_object);
    saved_object->objId = MapObject_GetID(local_object);
    saved_object->unk10 = sub_0205F254(local_object);
    saved_object->gfxId = MapObject_GetGfxID(local_object);
    saved_object->movement = MapObject_GetMovement(local_object);
    saved_object->type = MapObject_GetType(local_object);
    saved_object->flagId = MapObject_GetFlagID(local_object);
    saved_object->script = MapObject_GetScript(local_object);
    saved_object->initialFacing = MapObject_GetInitialFacing(local_object);
    saved_object->currentFacing = MapObject_GetFacingDirection(local_object);
    saved_object->nextFacing = MapObject_GetNextFacing(local_object);
    saved_object->unk1A = MapObject_GetParam(local_object, 0);
    saved_object->unk1C = MapObject_GetParam(local_object, 1);
    saved_object->unk1E = MapObject_GetParam(local_object, 2);
    saved_object->xRange = MapObject_GetXRange(local_object);
    saved_object->yRange = MapObject_GetYRange(local_object);
    saved_object->initialX = MapObject_GetInitialX(local_object);
    saved_object->initialHeight = MapObject_GetInitialHeight(local_object);
    saved_object->initialY = MapObject_GetInitialY(local_object);
    saved_object->currentX = MapObject_GetCurrentX(local_object);
    saved_object->currentHeight = MapObject_GetCurrentHeight(local_object);
    saved_object->currentY = MapObject_GetCurrentY(local_object);

    VecFx32 coords;
    sub_020611C8(saved_object->currentX, saved_object->currentY, &coords);
    coords.y = MapObject_GetPosVecYCoord(local_object);

    if (!sub_02061248(fsys, &coords, sub_0205F8B8(local_object))) {
        saved_object->unk2C = MapObject_GetPosVecYCoord(local_object);
    } else {
        if (sub_0205F784(local_object) == TRUE) {
            coords.y = MapObject_GetPosVecYCoord(local_object);
        }
        saved_object->unk2C = coords.y;
    }

    memcpy(saved_object->unk30, sub_0205F394(local_object), 16);
    memcpy(saved_object->unk40, sub_0205F3BC(local_object), 16);
}

void sub_0205E7C4(LocalMapObject* local_object, SavedMapObject* saved_object) {
    sub_0205F204(local_object, saved_object->unk0);
    sub_0205F238(local_object, saved_object->unk4);
    MapObject_SetID(local_object, saved_object->objId);
    sub_0205F250(local_object, saved_object->unk10);
    MapObject_SetGfxID(local_object, saved_object->gfxId);
    MapObject_SetMovement(local_object, saved_object->movement);
    MapObject_SetType(local_object, saved_object->type);
    MapObject_SetFlagID(local_object, saved_object->flagId);
    MapObject_SetScript(local_object, saved_object->script);
    MapObject_SetInitialFacing(local_object, saved_object->initialFacing);
    MapObject_ForceSetFacingDirection(local_object, saved_object->currentFacing);
    MapObject_SetNextFacing(local_object, saved_object->nextFacing);
    MapObject_SetParam(local_object, saved_object->unk1A, 0);
    MapObject_SetParam(local_object, saved_object->unk1C, 1);
    MapObject_SetParam(local_object, saved_object->unk1E, 2);
    MapObject_SetXRange(local_object, saved_object->xRange);
    MapObject_SetYRange(local_object, saved_object->yRange);
    MapObject_SetInitialX(local_object, saved_object->initialX);
    MapObject_SetInitialHeight(local_object, saved_object->initialHeight);
    MapObject_SetInitialY(local_object, saved_object->initialY);
    MapObject_SetCurrentX(local_object, saved_object->currentX);
    MapObject_SetCurrentHeight(local_object, saved_object->currentHeight);
    MapObject_SetCurrentY(local_object, saved_object->currentY);

    VecFx32 position_vec = {};
    position_vec.y = saved_object->unk2C;
    MapObject_SetPositionVec(local_object, &position_vec);

    memcpy(sub_0205F394(local_object), saved_object->unk30, 16);
    memcpy(sub_0205F3BC(local_object), saved_object->unk40, 16);
}

void sub_0205E8EC(MapObjectMan* manager, LocalMapObject* object) {
    sub_0205E934(object);
    sub_0205E954(object);
    sub_0205F354(object, manager);
    sub_0205ECE0(object);
    MapObject_ClearHeldMovement(object);
    sub_0205EFB4(object);
    sub_0205EAF0(manager, object);
    sub_0205F450(object);
    sub_0205F16C(sub_0205F160(manager));
}

void sub_0205EF5C(LocalMapObject* object);

void sub_0205E934(LocalMapObject* object) {
    MapObject_SetBits(object, (1 << 2) | (1 << 0));
    MapObject_ClearBits(object, (1 << 23) |
                                (1 << 22) |
                                (1 << 21) |
                                (1 << 19) |
                                (1 << 18) |
                                (1 << 17) |
                                (1 << 16) |
                                (1 << 14) |
                                (1 <<  9) |
                                (1 <<  6) |
                                (1 <<  3));
    sub_0205EF5C(object);
}

void sub_0205E954(LocalMapObject* object) {
    VecFx32 position_vec;
    MapObject_GetPositionVec(object, &position_vec);

    u32 x = MapObject_GetCurrentX(object);
    position_vec.x = x * (16 * FX32_ONE) + (8 * FX32_ONE);
    MapObject_SetPrevX(object, x);

    MapObject_SetPrevHeight(object, MapObject_GetCurrentHeight(object));

    u32 y = MapObject_GetCurrentY(object);
    position_vec.z = y * (16 * FX32_ONE) + (8 * FX32_ONE);
    MapObject_SetPrevY(object, y);

    MapObject_SetPositionVec(object, &position_vec);
}

struct MapObjectInitArgs {
    u32 map_no;
    int num_templates;
    int index;
    MapObjectMan* manager;
    OBJECT_EVENT* templates;
};

void InitMapObjectsFromEventTemplates(MapObjectMan* manager, u32 map_no, u32 num_templates, OBJECT_EVENT* templates_src) {
    GF_ASSERT(num_templates != 0);

    OBJECT_EVENT* templates = AllocFromHeapAtEnd((HeapID)11, num_templates * sizeof(OBJECT_EVENT));
    GF_ASSERT(templates != NULL);
    memcpy(templates, templates_src, num_templates * sizeof(OBJECT_EVENT));

    struct MapObjectInitArgs* args = AllocFromHeapAtEnd((HeapID)11, sizeof(struct MapObjectInitArgs));
    GF_ASSERT(args != NULL);
    args->map_no = map_no;
    args->num_templates = num_templates;
    args->index = 0;
    args->manager = manager;
    args->templates = templates;

    sub_0205EA08(args);
}

void sub_0205EA08(struct MapObjectInitArgs* args) {
    FieldSystem* fsys = MapObjectMan_GetFieldSysPtr(args->manager);
    OBJECT_EVENT* template = args->templates;

    do {
        GF_ASSERT((ObjectEventTemplate_ScriptIdIsFFFF(template) != TRUE && FlagGet(fsys, template->flag) != FALSE) ||
                  sub_0205E1D0(args->manager, template, args->map_no) != NULL);

        template++;
        args->index++;
    } while (args->index < args->num_templates);

    FreeToHeapExplicit((HeapID)11, args->templates);
    FreeToHeapExplicit((HeapID)11, args);
}

LocalMapObject* sub_0205EA64(MapObjectMan* manager) {
    int i = 0;
    int count = MapObjectMan_GetCount(manager);
    LocalMapObject* object = MapObjectMan_GetArray(manager);

    do {
        if (MapObject_GetBitsMask(object, (1 << 0)) == 0) {
            return object;
        }

        i++;
        object++;
    } while (i < count);

    return NULL;
}

LocalMapObject* sub_0205EA98(MapObjectMan* manager, u32 id, u32 flag_id) {
    int index = 0;
    LocalMapObject* object;

    while (sub_0205EEF4(manager, &object, &index, (1 << 0)) == TRUE) {
        if (sub_0205F7D4(object) == TRUE && id == MapObject_GetID(object) && flag_id == sub_0205F544(object)) {
            return object;
        }
    }

    return NULL;
}

void sub_0205F12C();

void sub_0205EAF0(MapObjectMan* manager, LocalMapObject* object) {
    u32 priority = sub_0205F19C(manager);
    u32 movement = MapObject_GetMovement(object);
    if (movement == 48 || movement == 50) {
        priority += 2;
    }

    SysTask* task = CreateSysTask((SysTaskFunc)sub_0205F12C, object, priority);
    GF_ASSERT(task != NULL);

    sub_0205F338(object, task);
}

void sub_0205EB2C(LocalMapObject* object, OBJECT_EVENT* template, FieldSystem* fsys) {
    MapObject_SetID(object, ObjectEventTemplate_GetID(template));
    MapObject_SetGfxID(object, ResolveObjectGfxId(fsys, ObjectEventTemplate_GetSprite(template)));
    MapObject_SetMovement(object, ObjectEventTemplate_GetMovement(template));
    MapObject_SetType(object, ObjectEventTemplate_GetType(template));
    MapObject_SetFlagID(object, ObjectEventTemplate_GetFlagID(template));
    MapObject_SetScript(object, ObjectEventTemplate_GetScript(template));
    MapObject_SetInitialFacing(object, ObjectEventTemplate_GetFacing(template));
    MapObject_SetParam(object, ObjectEventTemplate_GetParam(template, 0), 0);
    MapObject_SetParam(object, ObjectEventTemplate_GetParam(template, 1), 1);
    MapObject_SetParam(object, ObjectEventTemplate_GetParam(template, 2), 2);
    MapObject_SetXRange(object, ObjectEventTemplate_GetXRange(template));
    MapObject_SetYRange(object, ObjectEventTemplate_GetYRange(template));

    sub_0205EBFC(object, template);
}

void sub_0205EBFC(LocalMapObject* object, OBJECT_EVENT* template) {
    VecFx32 position_vec;

    u16 x = ObjectEventTemplate_GetXCoord(template);
    position_vec.x = x * (16 * FX32_ONE) + (8 * FX32_ONE);
    MapObject_SetInitialX(object, x);
    MapObject_SetPrevX(object, x);
    MapObject_SetCurrentX(object, x);

    position_vec.y = ObjectEventTemplate_GetHeight(template);
    u32 height = (position_vec.y >> 3) / 4096;
    MapObject_SetInitialHeight(object, height);
    MapObject_SetPrevHeight(object, height);
    MapObject_SetCurrentHeight(object, height);

    u16 y = ObjectEventTemplate_GetYCoord(template);
    position_vec.z = y * (16 * FX32_ONE) + (8 * FX32_ONE);
    MapObject_SetInitialY(object, y);
    MapObject_SetPrevY(object, y);
    MapObject_SetCurrentY(object, y);

    MapObject_SetPositionVec(object, &position_vec);
}

void sub_0205EC90(LocalMapObject* object, MapObjectMan* manager) {
    MapObject_SetBits(object, (1 << 12) | (1 << 11) | (1 << 0));
    if (sub_0205EFF8(object) == TRUE) {
        sub_0205F7B8(object, TRUE);
    }
    sub_0205F354(object, manager);
    MapObject_ForceSetFacingDirection(object, MapObject_GetInitialFacing(object));
    MapObject_SetNextFacing(object, MapObject_GetInitialFacing(object));
    MapObject_ClearHeldMovement(object);
}

void sub_0205ECE0(LocalMapObject* object) {
    u32 movement = MapObject_GetMovement(object);
    Unkthing* unk = sub_0205FB00(movement);
    sub_0205F414(object, sub_0205FB18(unk));
    sub_0205F428(object, sub_0205FB1C(unk));
    sub_0205F43C(object, sub_0205FB20(unk));
}

extern const Unkthing2 ov01_0220724C;

void sub_0205ED18(LocalMapObject* object) {
    u32 gfx_id = MapObject_GetGfxID(object);
    Unkthing2* unk = (gfx_id == 0x2000) ? (Unkthing2*)&ov01_0220724C : sub_0205FB38(gfx_id);

    sub_0205F468(object, sub_0205FB24(unk));
    sub_0205F47C(object, sub_0205FB28(unk));
    sub_0205F490(object, sub_0205FB2C(unk));
    sub_0205F4A4(object, sub_0205FB30(unk));
    sub_0205F4B8(object, sub_0205FB34(unk));
}

void sub_0205ED80(LocalMapObject* object) {
    memset(object, 0, sizeof(LocalMapObject));
}

u32 sub_0205ED90(LocalMapObject* object, u32 a1, u32 a2, OBJECT_EVENT* templates) {
    for (; a2 != 0; a2--, templates++) {
        if (ObjectEventTemplate_GetID(templates) != MapObject_GetID(object)) {
            continue;
        }

        if (ObjectEventTemplate_ScriptIdIsFFFF(templates) == TRUE) {
            u16 flag_id = ObjectEventTemplate_GetFlagID_AssertScriptIdIsFFFF(templates);
            if (sub_0205F7D4(object) == TRUE) {
                if (flag_id == sub_0205F544(object)) {
                    return 1;
                }
            } else if (flag_id == sub_0205F254(object)) {
                return 2;
            }
        } else if (sub_0205F7D4(object) == TRUE && a1 == sub_0205F544(object)) {
            return 2;
        }
    }

    return 0;
}

LocalMapObject* sub_0205EE10(MapObjectMan* manager, u32 object_id, u32 object_flag_id) {
    int index = 0;
    LocalMapObject* object;

    while (sub_0205EEF4(manager, &object, &index, (1 << 0)) == TRUE) {
        if (object_id == MapObject_GetID(object) && object_flag_id == sub_0205F254(object)) {
            return object;
        }
    }

    return NULL;
}

LocalMapObject* GetMapObjectByID(MapObjectMan* manager, u32 id) {
    GF_ASSERT(manager != NULL);

    int count = MapObjectMan_GetCount(manager);
    LocalMapObject* objects = (LocalMapObject*)MapObjectMan_GetConstArray(manager);

    do {
        if (MapObject_TestBits(objects, (1 << 0)) == TRUE &&
            sub_0205F7D4(objects) == FALSE &&
            id == MapObject_GetID(objects))
        {
            return objects;
        }

        count--;
        objects++;
    } while (count > 0);

    return NULL;
}

LocalMapObject* sub_0205EEB4(MapObjectMan* manager, u32 movement) {
    int count = MapObjectMan_GetCount(manager);
    LocalMapObject* objects = (LocalMapObject*)MapObjectMan_GetConstArray(manager);

    do {
        if (MapObject_TestBits(objects, (1 << 0)) == TRUE && movement == MapObject_GetMovement(objects)) {
            return objects;
        }

        count--;
        objects++;
    } while (count > 0);

    return NULL;
}

BOOL sub_0205EEF4(MapObjectMan* manager, LocalMapObject** object_dest, int* index, u32 bits) {
    int count = MapObjectMan_GetCount(manager);
    if (*index >= count) {
        return FALSE;
    }

    const LocalMapObject* objects = MapObjectMan_GetConstArray(manager);
    const LocalMapObject* object = objects + *index;
    do {
        (*index)++;

        if (bits == MapObject_GetBitsMask(object, bits)) {
            *object_dest = object;
            return TRUE;
        }

        object++;
    } while (*index < count);

    return FALSE;
}

void sub_0205EF48(LocalMapObject* object) {
    MapObject_SetBits(object, (1 << 2));
    sub_0205EF5C(object);
}

void sub_0205EF5C(LocalMapObject* object) {
    MapObject_ClearBits(object, (1 << 26) | (1 << 24) | (1 << 20) | (1 << 15));
}

void sub_0205EF6C(LocalMapObject* object) {
    // No-op
}

u32 ResolveObjectGfxId(FieldSystem* fsys, int a1) {
    if (a1 >= 101 && a1 <= 117) {
        a1 = VarGetObjectEventGraphicsId(fsys, (u16)(a1 - 101));
    }
    return a1;
}

void sub_0205EF8C(LocalMapObject* object) {
    if (MapObject_GetBitsMask(object, (1 << 12))) {
        sub_02061070(object);
    }
}

void sub_0205EFA4(LocalMapObject* object) {
    sub_0205ECE0(object);
    sub_0205FD20(object);
}

void sub_0205EFB4(LocalMapObject* object) {
    if (!sub_0205F5D4(sub_0205F35C(object))) {
        return;
    }

    sub_0205EF8C(object);
    sub_0205F328(object, 0);
    ov01_021FA2B8(object, FALSE);
    if (!sub_0205F678(object)) {
        sub_0205ED18(object);
        sub_0205F470(object);
        sub_0205F66C(object);
    }
}

BOOL sub_0205EFF8(LocalMapObject* object) {
    u16 script = MapObject_GetScript(object);
    return script == 0xFFFF;
}

void sub_0205F014(LocalMapObject* object, OBJECT_EVENT* template, u32 map_no) {
    GF_ASSERT(sub_0205F7D4(object) == TRUE);

    sub_0205F7B8(object, FALSE);
    sub_0205F250(object, map_no);
    MapObject_SetScript(object, ObjectEventTemplate_GetScript(template));
    MapObject_SetFlagID(object, ObjectEventTemplate_GetFlagID(template));
}

void sub_0205F058(LocalMapObject* object, u32 map_no, OBJECT_EVENT* template) {
    GF_ASSERT(ObjectEventTemplate_ScriptIdIsFFFF(template) == TRUE);

    sub_0205F7B8(object, TRUE);
    MapObject_SetScript(object, ObjectEventTemplate_GetScript(template));
    MapObject_SetFlagID(object, ObjectEventTemplate_GetFlagID_AssertScriptIdIsFFFF(template));
    sub_0205F250(object, map_no);
}

u32 sub_0205F09C(LocalMapObject* object, u32 a1) {
    return sub_0205F538(object) + a1;
}

BOOL sub_0205F0A8(LocalMapObject* object, u32 a1, u32 a2) {
    if (!MapObject_TestBits(object, (1 << 0))) {
        return FALSE;
    }

    if (a1 != MapObject_GetID(object)) {
        return FALSE;
    }

    if (a2 != sub_0205F254(object)) {
        if (!sub_0205F7D4(object)) {
            return FALSE;
        }

        if (a2 != sub_0205F544(object)) {
            return FALSE;
        }
    }

    return TRUE;
}

BOOL sub_0205F0F8(LocalMapObject* object, u32 a1, u32 a2, u32 a3) {
    if (!MapObject_TestBits(object, (1 << 0))) {
        return FALSE;
    }

    u32 gfx_id = MapObject_GetGfxID(object);
    if (gfx_id != a1) {
        return FALSE;
    }

    return sub_0205F0A8(object, a2, a3);
}

void sub_0205F12C(SysTask* task, LocalMapObject* object) {
    sub_0205FD30(object);
    if (MapObject_IsInUse(object)) {
        sub_0205F148(object);
    }
}

void sub_0205F148(LocalMapObject* object) {
    if (sub_0205F5D4(sub_0205F35C(object)) == TRUE) {
        ov01_021F92A0(object);
    }
}

// ?
MapObjectMan* sub_0205F160(MapObjectMan* manager) {
    return manager;
}

void MapObjectMan_SetCount(MapObjectMan* manager, u32 count) {
    manager->object_count = count;
}

u32 MapObjectMan_GetCount(MapObjectMan* manager) {
    return manager->object_count;
}

void sub_0205F16C(MapObjectMan* manager) {
    manager->unk8++;
}

void sub_0205F174(MapObjectMan* manager) {
    manager->unk8--;
}

void sub_0205F17C(MapObjectMan* manager, u32 bits) {
    manager->flags |= bits;
}

void sub_0205F184(MapObjectMan* manager, u32 bits) {
    manager->flags &= ~bits;
}

u32 sub_0205F190(MapObjectMan* manager, u32 bits) {
    return manager->flags & bits;
}

void sub_0205F198(MapObjectMan* manager, u32 a1) {
    manager->unkC = a1;
}

u32 sub_0205F19C(MapObjectMan* manager) {
    return manager->unkC;
}

void* sub_0205F1A0(MapObjectMan* manager) {
    return manager->unk18;
}

void sub_0205F1A4(MapObjectMan* manager, LocalMapObject* objects) {
    manager->objects = objects;
}

LocalMapObject* sub_0205F1AC(MapObjectMan* manager) {
    return manager->objects;
}

const LocalMapObject* MapObjectMan_GetConstArray(MapObjectMan* manager) {
    return manager->objects;
}

LocalMapObject* MapObjectMan_GetArray(MapObjectMan* manager) {
    return manager->objects;
}

void sub_0205F1C4(LocalMapObject** objects) {
    (*objects)++;
}

void sub_0205F1D0(LocalMapObject** objects) {
    (*objects)++;
}

void MapObjectMan_SetFieldSysPtr(MapObjectMan* manager, FieldSystem* fsys) {
    manager->fsys = fsys;
}

FieldSystem* MapObjectMan_GetFieldSysPtr(MapObjectMan* manager) {
    return manager->fsys;
}

void FldObjSys_SetMModelNarc(MapObjectMan* manager, NARC* mmodel_narc) {
    manager->mmodel_narc = mmodel_narc;
}

NARC* FldObjSys_GetMModelNarc(MapObjectMan* manager) {
    GF_ASSERT(manager->mmodel_narc != NULL);
    return manager->mmodel_narc;
}

void sub_0205F204(LocalMapObject* object, u32 bits) {
    object->flags = bits;
}

u32 MapObject_GetBitsWord(LocalMapObject* object) {
    return object->flags;
}

void MapObject_SetBits(LocalMapObject* object, u32 bits) {
    object->flags |= bits;
}

void MapObject_ClearBits(LocalMapObject* object, u32 bits) {
    object->flags &= ~bits;
}

u32 MapObject_GetBitsMask(LocalMapObject* object, u32 mask) {
    return object->flags & mask;
}

BOOL MapObject_TestBits(LocalMapObject* object, u32 bits) {
    return (object->flags & bits) != 0;
}

void sub_0205F238(LocalMapObject* object, u32 bits) {
    object->flags2 = bits;
}

u32 sub_0205F23C(LocalMapObject* object) {
    return object->flags2;
}

u32 sub_0205F240(LocalMapObject* object, u32 mask) {
    return object->flags2 & mask;
}

void MapObject_SetID(LocalMapObject* object, u32 id) {
    object->id = id;
}

u32 MapObject_GetID(LocalMapObject* object) {
    return object->id;
}

void sub_0205F250(LocalMapObject* object, u32 a1) {
    object->unkC = a1;
}

u32 sub_0205F254(LocalMapObject* object) {
    return object->unkC;
}

void MapObject_SetGfxID(LocalMapObject* object, u32 gfx_id) {
    object->gfxId = gfx_id;
}

u32 MapObject_GetGfxID(LocalMapObject* object) {
    return object->gfxId;
}

void MapObject_SetMovement(LocalMapObject* object, u32 movement) {
    object->movement = movement;
}

u32 MapObject_GetMovement(LocalMapObject* object) {
    return object->movement;
}

void MapObject_SetType(LocalMapObject* object, u32 type) {
    object->type = type;
}

u32 MapObject_GetType(LocalMapObject* object) {
    return object->type;
}

void MapObject_SetFlagID(LocalMapObject* object, u32 flag_id) {
    object->evFlagId = flag_id;
}

u32 MapObject_GetFlagID(LocalMapObject* object) {
    return object->evFlagId;
}

void MapObject_SetScript(LocalMapObject* object, u32 script) {
    object->scriptId = script;
}

u32 MapObject_GetScript(LocalMapObject* object) {
    return object->scriptId;
}

void MapObject_SetInitialFacing(LocalMapObject* object, u32 initial_facing) {
    object->facingInit = initial_facing;
}

u32 MapObject_GetInitialFacing(LocalMapObject* object) {
    return object->facingInit;
}

void MapObject_ForceSetFacingDirection(LocalMapObject* object, u32 direction) {
    object->curFacingBak = object->curFacing;
    object->curFacing = direction;
}

void MapObject_SetFacingDirection(LocalMapObject* object, u32 direction) {
    if (MapObject_GetBitsMask(object, (1 << 7)) == 0) {
        object->curFacingBak = object->curFacing;
        object->curFacing = direction;
    }
}

u32 MapObject_GetFacingDirection(LocalMapObject* object) {
    return object->curFacing;
}

u32 MapObject_GetPreviousFacing(LocalMapObject* object) {
    return object->curFacingBak;
}

void MapObject_SetNextFacing(LocalMapObject* object, u32 direction) {
    object->nextFacingBak = object->nextFacing;
    object->nextFacing = direction;
}

u32 MapObject_GetNextFacing(LocalMapObject* object) {
    return object->nextFacing;
}

void MapObject_SetOrQueueFacing(LocalMapObject* object, u32 direction) {
    MapObject_SetFacingDirection(object, direction);
    MapObject_SetNextFacing(object, direction);
}

void MapObject_SetParam(LocalMapObject* object, u32 value, int param) {
    switch (param) {
        case 0:
            object->param[0] = value;
            return;
        case 1:
            object->param[1] = value;
            return;
        case 2:
            object->param[2] = value;
            return;
        default:
            GF_ASSERT(FALSE);
            return;
    }
}

u32 MapObject_GetParam(LocalMapObject* object, int param) {
    switch (param) {
        case 0:
            return object->param[0];
        case 1:
            return object->param[1];
        case 2:
            return object->param[2];
        default:
            GF_ASSERT(FALSE);
            return 0;
    }
}

void MapObject_SetXRange(LocalMapObject* object, u32 x_range) {
    object->xrange = x_range;
}

u32 MapObject_GetXRange(LocalMapObject* object) {
    return object->xrange;
}

void MapObject_SetYRange(LocalMapObject* object, u32 y_range) {
    object->yrange = y_range;
}

u32 MapObject_GetYRange(LocalMapObject* object) {
    return object->yrange;
}

void sub_0205F328(LocalMapObject* object, u32 a1) {
    object->unkA0 = a1;
}

u32 sub_0205F330(LocalMapObject* object) {
    return object->unkA0;
}

void sub_0205F338(LocalMapObject* object, SysTask* a1) {
    object->unkB0 = a1;
}

SysTask* sub_0205F340(LocalMapObject* object) {
    return object->unkB0;
}

void sub_0205F348(LocalMapObject* object) {
    DestroySysTask(sub_0205F340(object));
}

void sub_0205F354(LocalMapObject* object, MapObjectMan* manager) {
    object->manager = manager;
}

MapObjectMan* sub_0205F35C(LocalMapObject* object) {
    return object->manager;
}

MapObjectMan* sub_0205F364(LocalMapObject* object) {
    return sub_0205F160(object->manager);
}

u8* sub_0205F370(LocalMapObject* object, s32 size) {
    GF_ASSERT(size <= 16);

    u8* ret = sub_0205F394(object);
    memset(ret, 0, size);
    return ret;
}

u8* sub_0205F394(LocalMapObject* object) {
    return object->unkD8;
}

u8* sub_0205F398(LocalMapObject* object, s32 size) {
    GF_ASSERT(size <= 16);

    u8* ret = sub_0205F3BC(object);
    memset(ret, 0, size);
    return ret;
}

u8* sub_0205F3BC(LocalMapObject* object) {
    return object->unkE8;
}

u8* sub_0205F3C0(LocalMapObject* object, s32 size) {
    GF_ASSERT(size <= 16);

    u8* ret = sub_0205F3E4(object);
    memset(ret, 0, size);
    return ret;
}

u8* sub_0205F3E4(LocalMapObject* object) {
    return object->unkF8;
}

u8* sub_0205F3E8(LocalMapObject* object, s32 size) {
    GF_ASSERT(size <= 32);

    u8* ret = sub_0205F40C(object);
    memset(ret, 0, size);
    return ret;
}

u8* sub_0205F40C(LocalMapObject* object) {
    return object->unk108;
}

void sub_0205F414(LocalMapObject* object, LocalMapObject_UnkCallback callback) {
    object->unkB8 = callback;
}

void sub_0205F41C(LocalMapObject* object) {
    object->unkB8(object);
}

void sub_0205F428(LocalMapObject* object, LocalMapObject_UnkCallback callback) {
    object->unkBC = callback;
}

void sub_0205F430(LocalMapObject* object) {
    object->unkBC(object);
}

void sub_0205F43C(LocalMapObject* object, LocalMapObject_UnkCallback callback) {
    object->unkC0 = callback;
}

void sub_0205F444(LocalMapObject* object) {
    object->unkC0(object);
}

void sub_0205F450(LocalMapObject* object) {
    Unkthing* unk = sub_0205FB00(MapObject_GetMovement(object));
    unk->unk10(object);
}

void sub_0205F468(LocalMapObject* object, LocalMapObject_UnkCallback callback) {
    object->unkC4 = callback;
}

void sub_0205F470(LocalMapObject* object) {
    object->unkC4(object);
}

void sub_0205F47C(LocalMapObject* object, LocalMapObject_UnkCallback callback) {
    object->unkC8 = callback;
}

void sub_0205F484(LocalMapObject* object) {
    object->unkC8(object);
}

void sub_0205F490(LocalMapObject* object, LocalMapObject_UnkCallback callback) {
    object->unkCC = callback;
}

void sub_0205F498(LocalMapObject* object) {
    object->unkCC(object);
}

void sub_0205F4A4(LocalMapObject* object, LocalMapObject_UnkCallback callback) {
    object->unkD0 = callback;
}

void sub_0205F4AC(LocalMapObject* object) {
    object->unkD0(object);
}

void sub_0205F4B8(LocalMapObject* object, LocalMapObject_UnkCallback callback) {
    object->unkD4 = callback;
}

void sub_0205F4C0(LocalMapObject* object) {
    object->unkD4(object);
}

void MapObject_SetMovementCommand(LocalMapObject* object, u32 command) {
    object->movementCmd = command;
}

u32 MapObject_GetMovementCommand(LocalMapObject* object) {
    return object->movementCmd;
}

void MapObject_SetMovementStep(LocalMapObject* object, u32 step) {
    object->movementStep = step;
}

void MapObject_IncMovementStep(LocalMapObject* object) {
    object->movementStep++;
}

u32 MapObject_GetMovementStep(LocalMapObject* object) {
    return object->movementStep;
}

void sub_0205F4FC(LocalMapObject* object, u16 a1) {
    object->unkAC = a1;
}

u16 sub_0205F504(LocalMapObject* object) {
    return object->unkAC;
}

void sub_0205F50C(LocalMapObject* object, u16 a1) {
    object->unkAE = a1;
}

u16 sub_0205F514(LocalMapObject* object) {
    return object->unkAE;
}

void sub_0205F51C(LocalMapObject* object, u16 a1) {
    object->unk128 = a1;
}

u16 sub_0205F524(LocalMapObject* object) {
    return object->unk128;
}

FieldSystem* MapObject_GetFieldSysPtr(LocalMapObject* object) {
    return MapObjectMan_GetFieldSysPtr(sub_0205F364(object));
}

void* sub_0205F538(LocalMapObject* object) {
    return sub_0205F19C(sub_0205F35C(object));
}

u32 sub_0205F544(LocalMapObject* object) {
    GF_ASSERT(sub_0205F7D4(object) == TRUE);
    return MapObject_GetFlagID(object);
}

void sub_0205F55C(MapObjectMan* map_obj_man) {
    sub_0205F17C(map_obj_man, (1 << 2) | (1 << 1));
}

void sub_0205F568(MapObjectMan* map_obj_man) {
    sub_0205F184(map_obj_man, (1 << 2) | (1 << 1));
}

void MapObjectMan_PauseAllMovement(MapObjectMan* manager) {
    u32 count = MapObjectMan_GetCount(manager);
    LocalMapObject* objects = MapObjectMan_GetArray(manager);

    do {
        if (MapObject_IsInUse(objects)) {
            MapObject_PauseMovement(objects);
        }

        objects++;
        count--;
    } while (count > 0);
}

void MapObjectMan_UnpauseAllMovement(MapObjectMan* manager) {
    u32 count = MapObjectMan_GetCount(manager);
    LocalMapObject* objects = MapObjectMan_GetArray(manager);

    do {
        if (MapObject_IsInUse(objects)) {
            MapObject_UnpauseMovement(objects);
        }

        objects++;
        count--;
    } while (count > 0);
}

BOOL sub_0205F5D4(MapObjectMan* manager) {
    return sub_0205F190(manager, (1 << 0)) != 0;
}

u32 sub_0205F5E8(LocalMapObject* object, u32 bits) {
    return sub_0205F190(sub_0205F35C(object), bits);
}

void sub_0205F5F8(MapObjectMan* manager, BOOL clear) {
    if (clear == FALSE) {
        sub_0205F17C(manager, (1 << 3));
    } else {
        sub_0205F184(manager, (1 << 3));
    }
}

BOOL sub_0205F610(MapObjectMan* manager) {
    return sub_0205F190(manager, (1 << 3)) == 0;
}

BOOL MapObject_IsInUse(LocalMapObject* object) {
    return MapObject_TestBits(object, (1 << 0));
}

void MapObject_SingleMovementSetActive(LocalMapObject* object) {
    MapObject_SetBits(object, (1 << 1));
}

void MapObject_SingleMovementSetInactive(LocalMapObject* object) {
    MapObject_ClearBits(object, (1 << 1));
}

BOOL MapObject_IsSingleMovementActive(LocalMapObject* object) {
    return MapObject_TestBits(object, (1 << 1));
}

void sub_0205F654(LocalMapObject* object) {
    MapObject_SetBits(object, (1 << 2));
}

void sub_0205F660(LocalMapObject* object) {
    MapObject_ClearBits(object, (1 << 3));
}

void sub_0205F66C(LocalMapObject* object) {
    MapObject_SetBits(object, (1 << 14));
}

BOOL sub_0205F678(LocalMapObject* object) {
    return MapObject_TestBits(object, (1 << 14));
}

BOOL sub_0205F684(LocalMapObject* object) {
    return MapObject_TestBits(object, (1 << 9));
}

void sub_0205F690(LocalMapObject* object, BOOL set) {
    if (set == TRUE) {
        MapObject_SetBits(object, (1 << 9));
    } else {
        MapObject_ClearBits(object, (1 << 9));
    }
}

void sub_0205F6AC(LocalMapObject* object, BOOL clear) {
    if (clear == TRUE) {
        MapObject_ClearBits(object, (1 << 18));
    } else {
        MapObject_SetBits(object, (1 << 18));
    }
}

BOOL sub_0205F6C8(LocalMapObject* object) {
    return MapObject_TestBits(object, (1 << 19)) != TRUE;
}

void sub_0205F6E0(LocalMapObject* object, BOOL set) {
    if (set == TRUE) {
        MapObject_SetBits(object, (1 << 19));
    } else {
        MapObject_ClearBits(object, (1 << 19));
    }
}

void MapObject_PauseMovement(LocalMapObject* object) {
    MapObject_SetBits(object, (1 << 6));
}

void MapObject_UnpauseMovement(LocalMapObject* object) {
    MapObject_ClearBits(object, (1 << 6));
}

BOOL sub_0205F714(LocalMapObject* object) {
    if (MapObject_TestBits(object, (1 << 30)) == TRUE) {
        return TRUE;
    }

    if (MapObject_TestBits(object, (1 << 6)) == TRUE) {
        return TRUE;
    }

    return FALSE;
}

BOOL sub_0205F73C(LocalMapObject* object) {
    if (!sub_0205F5D4(sub_0205F35C(object))) {
        return FALSE;
    }

    if (MapObject_GetBitsMask(object, (1 << 14)) != 0) {
        return TRUE;
    }

    return FALSE;
}

void sub_0205F768(LocalMapObject* object, BOOL set) {
    if (set == TRUE) {
        MapObject_SetBits(object, (1 << 23));
    } else {
        MapObject_ClearBits(object, (1 << 23));
    }
}

BOOL sub_0205F784(LocalMapObject* object) {
    return MapObject_GetBitsMask(object, (1 << 23)) != 0;
}

void sub_0205F79C(LocalMapObject* object, BOOL set) {
    if (set == TRUE) {
        MapObject_SetBits(object, (1 << 10));
    } else {
        MapObject_ClearBits(object, (1 << 10));
    }
}

void sub_0205F7B8(LocalMapObject* object, BOOL set) {
    if (set == TRUE) {
        MapObject_SetBits(object, (1 << 25));
    } else {
        MapObject_ClearBits(object, (1 << 25));
    }
}

BOOL sub_0205F7D4(LocalMapObject* object) {
    return MapObject_GetBitsMask(object, (1 << 25)) != 0;
}

void sub_0205F7EC(LocalMapObject* object, BOOL set) {
    if (set == TRUE) {
        MapObject_SetBits(object, (1 << 26));
    } else {
        MapObject_ClearBits(object, (1 << 26));
    }
}

BOOL sub_0205F808(LocalMapObject* object) {
    return MapObject_GetBitsMask(object, (1 << 26)) != 0;
}

void sub_0205F820(LocalMapObject* object, BOOL set) {
    if (set == TRUE) {
        MapObject_SetBits(object, (1 << 28));
    } else {
        MapObject_ClearBits(object, (1 << 28));
    }
}

BOOL sub_0205F83C(LocalMapObject* object) {
    return MapObject_GetBitsMask(object, (1 << 28)) != 0;
}

void sub_0205F854(LocalMapObject* object, BOOL set) {
    if (set == TRUE) {
        MapObject_SetBits(object, (1 << 24));
    } else {
        MapObject_ClearBits(object, (1 << 24));
    }
}

BOOL sub_0205F870(LocalMapObject* object) {
    return MapObject_GetBitsMask(object, (1 << 24)) != 0;
}

BOOL sub_0205F888(LocalMapObject* object) {
    return MapObject_GetBitsMask(object, (1 << 4)) != 0;
}

void sub_0205F89C(LocalMapObject* object, BOOL set) {
    if (set == TRUE) {
        MapObject_SetBits(object, (1 << 29));
    } else {
        MapObject_ClearBits(object, (1 << 29));
    }
}

BOOL sub_0205F8B8(LocalMapObject* object) {
    return MapObject_GetBitsMask(object, (1 << 29)) != 0;
}

BOOL sub_0205F8D0(LocalMapObject* object) {
    return sub_0205F240(object, (1 << 2)) != FALSE;
}

u32 MapObject_GetInitialX(LocalMapObject* object) {
    return object->xInit;
}

void MapObject_SetInitialX(LocalMapObject* object, u32 initial_x) {
    object->xInit = initial_x;
}

u32 MapObject_GetInitialHeight(LocalMapObject* object) {
    return object->hInit;
}

void MapObject_SetInitialHeight(LocalMapObject* object, u32 initial_height) {
    object->hInit = initial_height;
}

u32 MapObject_GetInitialY(LocalMapObject* object) {
    return object->yInit;
}

void MapObject_SetInitialY(LocalMapObject* object, u32 initial_y) {
    object->yInit = initial_y;
}

u32 MapObject_GetPrevX(LocalMapObject* object) {
    return object->xPrev;
}

void MapObject_SetPrevX(LocalMapObject* object, u32 previous_x) {
    object->xPrev = previous_x;
}

u32 MapObject_GetPrevHeight(LocalMapObject* object) {
    return object->hPrev;
}

void MapObject_SetPrevHeight(LocalMapObject* object, u32 previous_height) {
    object->hPrev = previous_height;
}

u32 MapObject_GetPrevY(LocalMapObject* object) {
    return object->yPrev;
}

void MapObject_SetPrevY(LocalMapObject* object, u32 previous_y) {
    object->yPrev = previous_y;
}

u32 MapObject_GetCurrentX(LocalMapObject* object) {
    return object->xCurr;
}

void MapObject_SetCurrentX(LocalMapObject* object, u32 x) {
    object->xCurr = x;
}

void MapObject_AddCurrentX(LocalMapObject* object, u32 x) {
    object->xCurr += x;
}

u32 MapObject_GetCurrentHeight(LocalMapObject* object) {
    return object->hCurr;
}

void MapObject_SetCurrentHeight(LocalMapObject* object, u32 height) {
    object->hCurr = height;
}

void MapObject_AddCurrentHeight(LocalMapObject* object, u32 height) {
    object->hCurr += height;
}

u32 MapObject_GetCurrentY(LocalMapObject* object) {
    return object->yCurr;
}

void MapObject_SetCurrentY(LocalMapObject* object, u32 y) {
    object->yCurr = y;
}

void MapObject_AddCurrentY(LocalMapObject* object, u32 y) {
    object->yCurr += y;
}

void MapObject_GetPositionVec(LocalMapObject* object, VecFx32* pos_vec_dest) {
    *pos_vec_dest = object->posVec;
}

void MapObject_SetPositionVec(LocalMapObject* object, VecFx32* pos_vec) {
    object->posVec = *pos_vec;
}

VecFx32* MapObject_GetPositionVecPtr(LocalMapObject* object) {
    return &object->posVec;
}

fx32 MapObject_GetPosVecYCoord(LocalMapObject* object) {
    return object->posVec.y;
}

void MapObject_GetFacingVec(LocalMapObject* object, VecFx32* face_vec_dest) {
    *face_vec_dest = object->faceVec;
}

void MapObject_SetFacingVec(LocalMapObject* object, VecFx32* face_vec) {
    object->faceVec = *face_vec;
}

VecFx32* MapObject_GetFacingVecPtr(LocalMapObject* object) {
    return &object->faceVec;
}

void sub_0205F990(LocalMapObject* object, VecFx32* a1_dest) {
    *a1_dest = object->unk88;
}

void sub_0205F9A0(LocalMapObject* object, VecFx32* a1) {
    object->unk88 = *a1;
}

void sub_0205F9B0(LocalMapObject* object, VecFx32* a1_dest) {
    *a1_dest = object->unk94;
}

void sub_0205F9C0(LocalMapObject* object, VecFx32* a1) {
    object->unk94 = *a1;
}

u32 sub_0205F9D0(LocalMapObject* object) {
    fx32 y = MapObject_GetPosVecYCoord(object);
    return (y >> 3) / 4096;
}

void ObjectEventTemplate_SetID(OBJECT_EVENT* template, u16 id) {
    template->id = id;
}

u16 ObjectEventTemplate_GetID(OBJECT_EVENT* template) {
    return template->id;
}

void ObjectEventTemplate_SetSprite(OBJECT_EVENT* template, u32 sprite) {
    template->ovid = sprite;
}

u16 ObjectEventTemplate_GetSprite(OBJECT_EVENT* template) {
    return template->ovid;
}

void ObjectEventTemplate_SetMovement(OBJECT_EVENT* template, u32 movement) {
    template->mvt = movement;
}

u16 ObjectEventTemplate_GetMovement(OBJECT_EVENT* template) {
    return template->mvt;
}

void ObjectEventTemplate_SetType(OBJECT_EVENT* template, u16 type) {
    template->type = type;
}

u16 ObjectEventTemplate_GetType(OBJECT_EVENT* template) {
    return template->type;
}

void ObjectEventTemplate_SetFlagID(OBJECT_EVENT* template, u16 flag) {
    template->flag = flag;
}

u16 ObjectEventTemplate_GetFlagID(OBJECT_EVENT* template) {
    return template->flag;
}

void ObjectEventTemplate_SetScript(OBJECT_EVENT* template, u16 script) {
    template->scr = script;
}

u16 ObjectEventTemplate_GetScript(OBJECT_EVENT* template) {
    return template->scr;
}

void ObjectEventTemplate_SetFacing(OBJECT_EVENT* template, u32 direction) {
    template->dirn = direction;
}

s16 ObjectEventTemplate_GetFacing(OBJECT_EVENT* template) {
    return template->dirn;
}

void ObjectEventTemplate_SetParam(OBJECT_EVENT* template, u32 value, int param) {
    switch (param) {
        case 0:
            template->eye = value;
            return;
        case 1:
            template->unk10 = value;
            return;
        case 2:
            template->tsure_poke_color = value;
            return;
        default:
            GF_ASSERT(FALSE);
            return;
    }
}

u16 ObjectEventTemplate_GetParam(OBJECT_EVENT* template, int param) {
    switch (param) {
        case 0:
            return template->eye;
        case 1:
            return template->unk10;
        case 2:
            return template->tsure_poke_color;
        default:
            GF_ASSERT(FALSE);
            return 0;
    }
}

void ObjectEventTemplate_SetXRange(OBJECT_EVENT* template, s16 x_range) {
    template->xrange = x_range;
}

s16 ObjectEventTemplate_GetXRange(OBJECT_EVENT* template) {
    return template->xrange;
}

void ObjectEventTemplate_SetYRange(OBJECT_EVENT* template, s16 y_range) {
    template->yrange = y_range;
}

s16 ObjectEventTemplate_GetYRange(OBJECT_EVENT* template) {
    return template->yrange;
}

void ObjectEventTemplate_SetXCoord(OBJECT_EVENT* template, u32 x) {
    template->x = x;
}

u16 ObjectEventTemplate_GetXCoord(OBJECT_EVENT* template) {
    return template->x;
}

void ObjectEventTemplate_SetHeight(OBJECT_EVENT* template, u32 height) {
    template->z = height;
}

u32 ObjectEventTemplate_GetHeight(OBJECT_EVENT* template) {
    return template->z;
}

void ObjectEventTemplate_SetYCoord(OBJECT_EVENT* template, u32 y) {
    template->y = y;
}

u16 ObjectEventTemplate_GetYCoord(OBJECT_EVENT* template) {
    return template->y;
}

OBJECT_EVENT* sub_0205FA98(u32 id, int num_templates, OBJECT_EVENT* templates) {
    int i = 0;
    OBJECT_EVENT* current_template = templates;

    do {
        if (!ObjectEventTemplate_ScriptIdIsFFFF(current_template) && id == ObjectEventTemplate_GetID(current_template)) {
            return templates + i;
        }

        i++;
        current_template++;
    } while (i < num_templates);

    return NULL;
}

BOOL ObjectEventTemplate_ScriptIdIsFFFF(OBJECT_EVENT* template) {
    // FIXME?
    u16 script = (u16)(u32)ObjectEventTemplate_GetScript(template);
    return script == 0xFFFF;
}

u16 ObjectEventTemplate_GetFlagID_AssertScriptIdIsFFFF(OBJECT_EVENT* template) {
    GF_ASSERT(ObjectEventTemplate_ScriptIdIsFFFF(template) == TRUE);
    return ObjectEventTemplate_GetFlagID(template);
}

extern Unkthing* _020FD1F4[57];

Unkthing* sub_0205FB00(u32 movement) {
    GF_ASSERT(movement < NELEMS(_020FD1F4));
    return _020FD1F4[movement];
}

LocalMapObject_UnkCallback sub_0205FB18(Unkthing* unk) {
    return unk->unk4;
}

LocalMapObject_UnkCallback sub_0205FB1C(Unkthing* unk) {
    return unk->unk8;
}

LocalMapObject_UnkCallback sub_0205FB20(Unkthing* unk) {
    return unk->unkC;
}

LocalMapObject_UnkCallback sub_0205FB24(Unkthing2* unk) {
    return unk->unk0;
}

LocalMapObject_UnkCallback sub_0205FB28(Unkthing2* unk) {
    return unk->unk4;
}

LocalMapObject_UnkCallback sub_0205FB2C(Unkthing2* unk) {
    return unk->unk8;
}

LocalMapObject_UnkCallback sub_0205FB30(Unkthing2* unk) {
    return unk->unkC;
}

LocalMapObject_UnkCallback sub_0205FB34(Unkthing2* unk) {
    return unk->unk10;
}

typedef struct ObjectEventGraphicsInfo {
    u16 sprite_no;
    u16 mmodel_no;
    u16 unk4_0:5; // Unknown actual size
    u16 unk4_5:5;
    u16 unk4_10:6; // Unknown actual size
} ObjectEventGraphicsInfo;

extern ObjectEventGraphicsInfo* GetObjectEventGfxInfoPtr(u32 gfx_id);
extern Unkthing2* ov01_02209A38[20];

Unkthing2* sub_0205FB38(u32 gfx_id) {
    ObjectEventGraphicsInfo* unk = GetObjectEventGfxInfoPtr(gfx_id);
    if (unk == NULL) {
        return NULL;
    }

    return ov01_02209A38[unk->unk4_5];
}

LocalMapObject* sub_0205FB58(MapObjectMan* manager, u32 x, u32 y, BOOL a3) {
    u32 count = MapObjectMan_GetCount(manager);
    LocalMapObject* objects = MapObjectMan_GetArray(manager);

    do {
        if (MapObject_GetBitsMask(objects, (1 << 0)) != 0) {
            if (a3 && x == MapObject_GetPrevX(objects) && y == MapObject_GetPrevY(objects)) {
                return objects;
            }

            if (x == MapObject_GetCurrentX(objects) && y == MapObject_GetCurrentY(objects)) {
                return objects;
            }
        }

        objects++;
        count--;
    } while (count > 0);

    return NULL;
}

void sub_0205FBC0(LocalMapObject* object, VecFx32* position_vec, u32 direction) {
    MapObject_SetCurrentX(object, (position_vec->x >> 4) / 4096);
    MapObject_SetCurrentHeight(object, (position_vec->y >> 3) / 4096);
    MapObject_SetCurrentY(object, (position_vec->z >> 4) / 4096);
    MapObject_SetPositionVec(object, position_vec);
    sub_02060F78(object);
    MapObject_ForceSetFacingDirection(object, direction);
    MapObject_ClearHeldMovement(object);
    MapObject_SetBits(object, (1 << 2));
    MapObject_ClearBits(object, (1 << 3) | (1 << 1));
}

void sub_0205FC2C(LocalMapObject* object, u32 x, u32 height, u32 y, u32 direction) {
    VecFx32 position_vec;
    position_vec.x = x * (16 * FX32_ONE) + (8 * FX32_ONE);
    MapObject_SetCurrentX(object, x);
    position_vec.y = height << 15;
    MapObject_SetCurrentHeight(object, height);
    position_vec.z = y * (16 * FX32_ONE) + (8 * FX32_ONE);
    MapObject_SetCurrentY(object, y);

    MapObject_SetPositionVec(object, &position_vec);
    sub_02060F78(object);
    MapObject_ForceSetFacingDirection(object, direction);
    MapObject_SetBits(object, (1 << 2));
    MapObject_ClearBits(object, (1 << 3) | (1 << 1));
    MapObject_ClearHeldMovement(object);
}

void sub_0205FC94(LocalMapObject* object, u32 movement) {
    sub_0205F444(object);
    MapObject_SetMovement(object, movement);
    sub_0205ECE0(object);
    sub_0205FD20(object);
}

void sub_0205FCB4(LocalMapObject*) {

}

void sub_0205FCB8(LocalMapObject*) {

}

void sub_0205FCBC(LocalMapObject*) {

}

void sub_0205FCC0(LocalMapObject*) {

}

void sub_0205FCC4(LocalMapObject*) {

}

void sub_0205FCC8(LocalMapObject*) {

}

void sub_0205FCCC(LocalMapObject*) {

}

void sub_0205FCD0(LocalMapObject*) {

}

void sub_0205FCD4(LocalMapObject* object) {
    u32 gfx_id = MapObject_GetGfxID(object);
    Unkthing2* unk = (gfx_id == 0x2000) ? (Unkthing2*)&ov01_0220724C : sub_0205FB38(gfx_id);
    sub_0205F47C(object, sub_0205FB28(unk));
}

SavedMapObject* SaveMapObjects_SearchSpriteId(SavedMapObject* list, u32 a1, u32 a2) {
    SavedMapObject* object = list;
    for (; a1 > 0; object++, a1--) {
        if ((object->unk0 & (1 << 0)) != 0 && object->gfxId == a2) {
            return object;
        }
    }

    return NULL;
}
