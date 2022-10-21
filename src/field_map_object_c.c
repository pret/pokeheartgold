// #include "field_player_avatar.h"
// #include "field_map_object.h"
// #include "script.h"
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
    u8 unk0[4];
    u32 object_count;
    u8 unk8[4];
    u32 unkC;
    u8 unk10[0x124-0x10];
    LocalMapObject** objects;
    FieldSystem* fsys;
} MapObjectMan; // size: 0x12c

typedef void (LocalMapObject_UnkCallback)();

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
    /*0x0B0*/ int unkB0;
    /*0x0B4*/ MapObjectMan* manager;
    /*0x0B8*/ LocalMapObject_UnkCallback* unkB8;
    /*0x0BC*/ LocalMapObject_UnkCallback* unkBC;
    /*0x0C0*/ LocalMapObject_UnkCallback* unkC0;
    /*0x0C4*/ LocalMapObject_UnkCallback* unkC4;
    /*0x0C8*/ LocalMapObject_UnkCallback* unkC8;
    /*0x0CC*/ LocalMapObject_UnkCallback* unkCC;
    /*0x0D0*/ LocalMapObject_UnkCallback* unkD0;
    /*0x0D4*/ LocalMapObject_UnkCallback* unkD4;
    /*0x0D8*/ u8 unkD8[0x10];
    /*0x0E8*/ u8 unkE8[0x10];
    /*0x0F8*/ u8 unkF8[0x10];
    /*0x108*/ u8 unk108[0x20];
    /*0x128*/ u16 unk128;
} LocalMapObject;

// struct UnkStruct_0205FB00 {

// };

typedef struct SavedMapObject SavedMapObject;

MapObjectMan* MapObjectMan_new(u32 count);
void MapObjectMan_SetFieldSysPtr(MapObjectMan*, FieldSystem*);
void MapObjectMan_SetCount(MapObjectMan*, u32);
void sub_0205F198(MapObjectMan*, u32);
LocalMapObject** MapObjectMan_GetArray(MapObjectMan*);
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
int sub_0205F16C();
int sub_0205F160();
void sub_0205EAF0(MapObjectMan* manager, LocalMapObject* object);
int sub_0205EFB4();
int sub_0205EFA4();
void sub_0205F250(LocalMapObject* object, u32 a1);
void sub_0205EC90(LocalMapObject* object, MapObjectMan* manager);
void sub_0205EB2C(LocalMapObject* object, OBJECT_EVENT* template, FieldSystem* fsys);
FieldSystem* MapObjectMan_GetFieldSysPtr(MapObjectMan*);
LocalMapObject* sub_0205EA64(MapObjectMan*);
int sub_0205F058();
LocalMapObject* sub_0205EE10(MapObjectMan*, u32, u32);
u16 ObjectEventTemplate_GetFlagID_AssertScriptIdIsFFFF(OBJECT_EVENT* template);
int sub_0205F014();
LocalMapObject* sub_0205EA98(MapObjectMan*, u32, u32);
BOOL ObjectEventTemplate_ScriptIdIsFFFF();
u32 MapObjectMan_GetCount(MapObjectMan*);
BOOL MapObject_IsInUse(LocalMapObject*);
void ov01_021F9FB0();
void sub_0205F1A0();
u32 sub_0205ED90(LocalMapObject*, u32, u32, OBJECT_EVENT*);
int sub_0205F1A4();
LocalMapObject* CreateSpecialFieldObjectEx(MapObjectMan* manager, u16 x, u16 y, s16 direction, u32 sprite, u32 movement, u32 map_no, u32 a7, u32 a8, u32 a9);
void ObjectEventTemplate_SetID(OBJECT_EVENT* template, u16);
void ObjectEventTemplate_SetSprite(OBJECT_EVENT*, u32);
void ObjectEventTemplate_SetMovement(OBJECT_EVENT*, u32);
void ObjectEventTemplate_SetType(OBJECT_EVENT*, u16);
void ObjectEventTemplate_SetFlagID(OBJECT_EVENT*, u16);
void ObjectEventTemplate_SetScript(OBJECT_EVENT*, u16);
void ObjectEventTemplate_SetFacing(OBJECT_EVENT*, s16);
void ObjectEventTemplate_SetParam(OBJECT_EVENT*, u32 value, int param);
void ObjectEventTemplate_SetXRange(OBJECT_EVENT*, s16);
void ObjectEventTemplate_SetYRange(OBJECT_EVENT*, s16);
void ObjectEventTemplate_SetXCoord(OBJECT_EVENT*, u16);
void ObjectEventTemplate_SetYCoord(OBJECT_EVENT*, u16);
void ObjectEventTemplate_SetHeight(OBJECT_EVENT*, u32);
void* sub_0205F3BC(LocalMapObject*);
void* sub_0205F394(LocalMapObject*);
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
BOOL sub_0205EEF4(MapObjectMan*, void*, void*, void*);
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
void MapObjectMan_GetConstArray();
void sub_0205EF48(LocalMapObject* object);
void sub_0205FD20(LocalMapObject* object);
void MapObject_PauseMovement(LocalMapObject* object);
void MapObject_UnpauseMovement(LocalMapObject* object);
void* sub_0205F3E4(LocalMapObject*);
void* sub_0205F40C(LocalMapObject*);
void sub_0205F444(LocalMapObject* object);
void sub_0205F450(LocalMapObject*);
void sub_0205F468(LocalMapObject* object, LocalMapObject_UnkCallback* callback);
void sub_0205F47C(LocalMapObject* object, LocalMapObject_UnkCallback* callback);
void sub_0205F490(LocalMapObject* object, LocalMapObject_UnkCallback* callback);
void sub_0205F498(LocalMapObject* object);
void sub_0205F4A4(LocalMapObject* object, LocalMapObject_UnkCallback* callback);
void sub_0205F4B8(LocalMapObject* object, LocalMapObject_UnkCallback* callback);
void sub_0205FB00();
void sub_0205F354(LocalMapObject* object, MapObjectMan* manager);
MapObjectMan* sub_0205F35C(LocalMapObject* object);
MapObjectMan* sub_0205F364(LocalMapObject* object);
OBJECT_EVENT* sub_0205FA98(u32 id, u32 count_maybe, OBJECT_EVENT** templates);
void sub_0205F338(LocalMapObject* object, SysTask* a1);
BOOL FlagGet(FieldSystem*, u16);
void sub_0205EBFC(LocalMapObject* object, OBJECT_EVENT* template);
u16 ObjectEventTemplate_GetXCoord(OBJECT_EVENT* template);
u32 ObjectEventTemplate_GetHeight(OBJECT_EVENT* template);
u16 ObjectEventTemplate_GetYCoord(OBJECT_EVENT* template);

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

#ifdef NONMATCHING
void sub_0205E104(MapObjectMan* manager, u32 a1, u32 a2, u32 a3, OBJECT_EVENT* object_events) {
    u32 count = MapObjectMan_GetCount(manager);
    LocalMapObject** objects = MapObjectMan_GetArray(manager);
    for (int i = 0; i < count; i++) {
        if (MapObject_IsInUse(objects[i]) != TRUE) {
            continue;
        }

        if (sub_0205ED90(objects[i], a2, a3, object_events, manager, a3, count) != 0) {
            continue;
        }

        if (a2 == sub_0205F254(objects[i])) {
            continue;
        }

        if (MapObject_TestBits(objects[i], 1 << 10) != FALSE) {
            continue;
        }

        MapObject_Remove(objects[i]);
    }

    ov01_021F9FB0(manager, sub_0205F1A0(manager));
}
#else
asm void sub_0205E104(MapObjectMan* manager, u32 a1, u32 a2, u32 a3, OBJECT_EVENT* object_events) {
    push {r3, r4, r5, r6, r7, lr}
    sub sp, #8
    str r0, [sp]
    add r5, r2, #0
    str r3, [sp, #4]
    ldr r7, [sp, #0x20]
    bl MapObjectMan_GetCount
    add r6, r0, #0
    ldr r0, [sp]
    bl MapObjectMan_GetArray
    add r4, r0, #0
    cmp r6, #0
    beq _0205E16C
    _0205E122:
    add r0, r4, #0
    bl MapObject_IsInUse
    cmp r0, #1
    bne _0205E162
    ldr r2, [sp, #4]
    add r0, r4, #0
    add r1, r5, #0
    add r3, r7, #0
    bl sub_0205ED90
    cmp r0, #0
    beq _0205E144
    cmp r0, #1
    beq _0205E162
    cmp r0, #2
    b _0205E162
    _0205E144:
    add r0, r4, #0
    bl sub_0205F254
    cmp r5, r0
    beq _0205E162
    mov r1, #1
    add r0, r4, #0
    lsl r1, r1, #0xa
    bl MapObject_TestBits
    cmp r0, #0
    bne _0205E162
    add r0, r4, #0
    bl MapObject_Remove
    _0205E162:
    mov r0, #0x4b
    lsl r0, r0, #2
    add r4, r4, r0
    sub r6, r6, #1
    bne _0205E122
    _0205E16C:
    ldr r0, [sp]
    bl sub_0205F1A0
    add r1, r0, #0
    ldr r0, [sp]
    bl ov01_021F9FB0
    add sp, #8
    pop {r3, r4, r5, r6, r7, pc}
}
#endif

#ifdef NONMATCHING
MapObjectMan* MapObjectMan_new(u32 object_count) {
    MapObjectMan* manager = AllocFromHeap((HeapID)11, sizeof(MapObjectMan));
    GF_ASSERT(manager != NULL);
    memset(manager, 0, sizeof(MapObjectMan));

    LocalMapObject** objects = AllocFromHeap((HeapID)11, object_count * sizeof(LocalMapObject));
    GF_ASSERT(objects != NULL);
    memset(objects, 0, object_count * sizeof(LocalMapObject));

    sub_0205F1A4(manager, objects);

    return manager;
}
#else
asm MapObjectMan* MapObjectMan_new(u32 object_count) {
    push {r4, r5, r6, lr}
    mov r1, #0x4b
    add r4, r0, #0
    mov r0, #0xb
    lsl r1, r1, #2
    bl AllocFromHeap
    add r5, r0, #0
    bne _0205E196
    bl GF_AssertFail
    _0205E196:
    mov r2, #0x4b
    add r0, r5, #0
    mov r1, #0
    lsl r2, r2, #2
    bl memset
    mov r0, #0x4b
    lsl r0, r0, #2
    add r6, r4, #0
    mul r6, r0
    mov r0, #0xb
    add r1, r6, #0
    bl AllocFromHeap
    add r4, r0, #0
    bne _0205E1BA
    bl GF_AssertFail
    _0205E1BA:
    add r0, r4, #0
    mov r1, #0
    add r2, r6, #0
    bl memset
    add r0, r5, #0
    add r1, r4, #0
    bl sub_0205F1A4
    add r0, r5, #0
    pop {r4, r5, r6, pc}
}
#endif

// LocalMapObject* sub_0205E1D0(MapObjectMan* manager, OBJECT_EVENT* object_events, u32 a2) {
//     OBJECT_EVENT template = *object_events;
//     u16 id = ObjectEventTemplate_GetID(&template);
// }
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

#ifdef NONMATCHING
LocalMapObject* CreateSpecialFieldObject(MapObjectMan* manager, u16 x, u16 y, s16 direction, u16 sprite, u16 movement, u32 map_no) {
    return CreateSpecialFieldObjectEx(manager, x, y, direction, sprite, movement, map_no, 0, 0, 0);
}
#else
asm LocalMapObject* CreateSpecialFieldObject(MapObjectMan* manager, u16 x, u16 y, s16 direction, u16 sprite, u16 movement, u32 map_no) {
    push {r4, lr}
    sub sp, #0x18
    ldr r4, [sp, #0x20]
    str r4, [sp]
    ldr r4, [sp, #0x24]
    str r4, [sp, #4]
    ldr r4, [sp, #0x28]
    str r4, [sp, #8]
    mov r4, #0
    str r4, [sp, #0xc]
    str r4, [sp, #0x10]
    str r4, [sp, #0x14]
    bl CreateSpecialFieldObjectEx
    add sp, #0x18
    pop {r4, pc}
}
#endif

LocalMapObject* CreateSpecialFieldObjectEx(MapObjectMan* manager, u16 x, u16 y, s16 direction, u32 sprite, u32 movement, u32 map_no, u32 a7, u32 a8, u32 a9) {
    OBJECT_EVENT template;
    ObjectEventTemplate_SetID(&template, 0);
    ObjectEventTemplate_SetSprite(&template,sprite);
    ObjectEventTemplate_SetMovement(&template,movement);
    ObjectEventTemplate_SetType(&template,0);
    ObjectEventTemplate_SetFlagID(&template,0);
    ObjectEventTemplate_SetScript(&template,0);
    ObjectEventTemplate_SetFacing(&template,direction);
    ObjectEventTemplate_SetParam(&template,a7,0);
    ObjectEventTemplate_SetParam(&template,a8,1);
    ObjectEventTemplate_SetParam(&template,a9,2);
    ObjectEventTemplate_SetXRange(&template,0);
    ObjectEventTemplate_SetYRange(&template,0);
    ObjectEventTemplate_SetXCoord(&template,x);
    ObjectEventTemplate_SetYCoord(&template,y);
    ObjectEventTemplate_SetHeight(&template,0);

    return sub_0205E1D0(manager, &template, map_no);
}

u16 ObjectEventTemplate_GetFlagID(OBJECT_EVENT*);

#ifdef NONMATCHING
LocalMapObject* CreateMapObjectFromTemplate(MapObjectMan* manager, u32 a1, u32 a2, u32 a3, OBJECT_EVENT** template) {
    LocalMapObject* ret = NULL;
    OBJECT_EVENT* event = sub_0205FA98(a1, a2, template);
    if (event != NULL) {
        u32 flag_id = ObjectEventTemplate_GetFlagID(event);
        FieldSystem* fsys = MapObjectMan_GetFieldSysPtr(manager);
        if (FlagGet(fsys, (u16)flag_id) == FALSE) {
            ret = sub_0205E1D0(manager, event, template);
        }
    }

    return ret;
}
#else
asm LocalMapObject* CreateMapObjectFromTemplate(MapObjectMan* manager, u32 a1, u32 a2, u32 a3, OBJECT_EVENT** template) {
    push {r3, r4, r5, r6, r7, lr}
    add r5, r0, #0
    add r0, r1, #0
    add r1, r2, #0
    ldr r2, [sp, #0x18]
    add r7, r3, #0
    mov r6, #0
    bl sub_0205FA98
    str r0, [sp]
    cmp r0, #0
    beq _0205E388
    bl ObjectEventTemplate_GetFlagID
    add r4, r0, #0
    add r0, r5, #0
    bl MapObjectMan_GetFieldSysPtr
    lsl r1, r4, #0x10
    lsr r1, r1, #0x10
    bl FlagGet
    cmp r0, #0
    bne _0205E388
    ldr r1, [sp]
    add r0, r5, #0
    add r2, r7, #0
    bl sub_0205E1D0
    add r6, r0, #0
    _0205E388:
    add r0, r6, #0
    pop {r3, r4, r5, r6, r7, pc}
}
#endif

//void MapObject_SetGfxId(LocalMapObject*, u32);

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

#ifdef NONMATCHING
void sub_0205E494(MapObjectMan* manager) {
    int i = 0;
    u32 count = MapObjectMan_GetCount(manager);
    LocalMapObject** objects = MapObjectMan_GetArray(manager);
    for (; i < count; i++) {
        LocalMapObject* object = objects[i];
        BOOL bit0 = MapObject_GetBitsMask(object, (1 << 0));
        if (bit0) {
            MapObject_Remove(object);
        }
    }
}
#else
asm void sub_0205E494(MapObjectMan* manager) {
    push {r3, r4, r5, r6, r7, lr}
    add r5, r0, #0
    mov r4, #0
    bl MapObjectMan_GetCount
    add r6, r0, #0
    add r0, r5, #0
    bl MapObjectMan_GetArray
    mov r7, #0x4b
    add r5, r0, #0
    lsl r7, r7, #2
    _0205E4AC:
    add r0, r5, #0
    mov r1, #1
    bl MapObject_GetBitsMask
    cmp r0, #0
    beq _0205E4BE
    add r0, r5, #0
    bl MapObject_Remove
    _0205E4BE:
    add r4, r4, #1
    add r5, r5, r7
    cmp r4, r6
    blt _0205E4AC
    pop {r3, r4, r5, r6, r7, pc}
}
#endif

asm void sub_0205E4C8(MapObjectMan*) {
    push {r3, r4, r5, r6, r7, lr}
    add r5, r0, #0
    bl sub_0205F5D4
    cmp r0, #1
    beq _0205E4D8
    bl GF_AssertFail
    _0205E4D8:
    add r0, r5, #0
    mov r4, #0
    bl MapObjectMan_GetCount
    add r6, r0, #0
    add r0, r5, #0
    bl MapObjectMan_GetArray
    mov r7, #0x4b
    add r5, r0, #0
    lsl r7, r7, #2
    _0205E4EE:
    add r0, r5, #0
    mov r1, #1
    bl MapObject_GetBitsMask
    cmp r0, #0
    beq _0205E514
    mov r1, #1
    add r0, r5, #0
    lsl r1, r1, #0xe
    bl MapObject_GetBitsMask
    cmp r0, #0
    beq _0205E514
    add r0, r5, #0
    bl sub_0205F4AC
    add r0, r5, #0
    bl sub_0205EF6C
    _0205E514:
    add r4, r4, #1
    add r5, r5, r7
    cmp r4, r6
    blt _0205E4EE
    pop {r3, r4, r5, r6, r7, pc}
}

asm void sub_0205E520(MapObjectMan*) {
    push {r3, r4, r5, r6, r7, lr}
    add r5, r0, #0
    bl sub_0205F5D4
    cmp r0, #1
    beq _0205E530
    bl GF_AssertFail
    _0205E530:
    add r0, r5, #0
    mov r4, #0
    bl MapObjectMan_GetCount
    add r6, r0, #0
    add r0, r5, #0
    bl MapObjectMan_GetArray
    mov r7, #0x4b
    add r5, r0, #0
    lsl r7, r7, #2
    _0205E546:
    add r0, r5, #0
    bl MapObject_IsInUse
    cmp r0, #1
    bne _0205E574
    add r0, r5, #0
    bl sub_0205F678
    cmp r0, #1
    bne _0205E562
    add r0, r5, #0
    bl sub_0205F4C0
    b _0205E568
    _0205E562:
    add r0, r5, #0
    bl sub_0205EFB4
    _0205E568:
    add r0, r5, #0
    bl sub_0205EF48
    add r0, r5, #0
    bl sub_020611DC
    _0205E574:
    add r4, r4, #1
    add r5, r5, r7
    cmp r4, r6
    blt _0205E546
    pop {r3, r4, r5, r6, r7, pc}
}

asm void sub_0205E580(MapObjectMan*) {
    push {r3, r4, r5, r6, r7, lr}
    add r5, r0, #0
    bl sub_0205F5D4
    cmp r0, #1
    beq _0205E590
    bl GF_AssertFail
    _0205E590:
    add r0, r5, #0
    mov r4, #0
    bl MapObjectMan_GetCount
    add r6, r0, #0
    add r0, r5, #0
    bl MapObjectMan_GetArray
    mov r7, #0x4b
    add r5, r0, #0
    lsl r7, r7, #2
    _0205E5A6:
    add r0, r5, #0
    bl MapObject_IsInUse
    cmp r0, #1
    bne _0205E5E0
    add r0, r5, #0
    bl MapObject_GetID
    cmp r0, #0xff
    bne _0205E5E0
    add r0, r5, #0
    bl sub_0205F678
    cmp r0, #1
    bne _0205E5CC
    add r0, r5, #0
    bl sub_0205F4C0
    b _0205E5D2
    _0205E5CC:
    add r0, r5, #0
    bl sub_0205EFB4
    _0205E5D2:
    add r0, r5, #0
    bl sub_0205EF48
    add r0, r5, #0
    bl sub_020611DC
    pop {r3, r4, r5, r6, r7, pc}
    _0205E5E0:
    add r4, r4, #1
    add r5, r5, r7
    cmp r4, r6
    blt _0205E5A6
    pop {r3, r4, r5, r6, r7, pc}
}

typedef struct SavedMapObjectList SavedMapObjectList;

asm void Fsys_SyncMapObjectsToSaveEx(FieldSystem* fsys, MapObjectMan*, SavedMapObjectList*, u32) {
    push {r3, r4, r5, r6, r7, lr}
    sub sp, #8
    add r7, r0, #0
    add r6, r1, #0
    mov r0, #0
    add r5, r2, #0
    add r4, r3, #0
    str r0, [sp, #4]
    add r0, r6, #0
    add r1, sp, #0
    add r2, sp, #4
    mov r3, #1
    bl sub_0205EEF4
    cmp r0, #0
    beq _0205E632
    _0205E60C:
    ldr r1, [sp]
    add r0, r7, #0
    add r2, r5, #0
    bl sub_0205E680
    sub r4, r4, #1
    add r5, #0x50
    cmp r4, #0
    bgt _0205E622
    bl GF_AssertFail
    _0205E622:
    add r0, r6, #0
    add r1, sp, #0
    add r2, sp, #4
    mov r3, #1
    bl sub_0205EEF4
    cmp r0, #0
    bne _0205E60C
    _0205E632:
    cmp r4, #0
    beq _0205E642
    mov r2, #0x50
    add r0, r5, #0
    mov r1, #0
    mul r2, r4
    bl memset
    _0205E642:
    add sp, #8
    pop {r3, r4, r5, r6, r7, pc}
}

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

asm void sub_0205E680(FieldSystem* fsys, LocalMapObject* local_object, SavedMapObject* saved_object) {
    push {r3, r4, r5, r6, lr}
    sub sp, #0xc
    add r5, r1, #0
    add r6, r0, #0
    add r4, r2, #0
    add r0, r5, #0
    bl MapObject_GetBitsWord
    str r0, [r4]
    add r0, r5, #0
    bl sub_0205F23C
    str r0, [r4, #4]
    add r0, r5, #0
    bl MapObject_GetID
    strb r0, [r4, #8]
    add r0, r5, #0
    bl sub_0205F254
    strh r0, [r4, #0x10]
    add r0, r5, #0
    bl MapObject_GetGfxID
    strh r0, [r4, #0x12]
    add r0, r5, #0
    bl MapObject_GetMovement
    strb r0, [r4, #9]
    add r0, r5, #0
    bl MapObject_GetType
    strh r0, [r4, #0x14]
    add r0, r5, #0
    bl MapObject_GetFlagID
    strh r0, [r4, #0x16]
    add r0, r5, #0
    bl MapObject_GetScript
    strh r0, [r4, #0x18]
    add r0, r5, #0
    bl MapObject_GetInitialFacing
    strb r0, [r4, #0xc]
    add r0, r5, #0
    bl MapObject_GetFacingDirection
    strb r0, [r4, #0xd]
    add r0, r5, #0
    bl MapObject_GetNextFacing
    strb r0, [r4, #0xe]
    add r0, r5, #0
    mov r1, #0
    bl MapObject_GetParam
    strh r0, [r4, #0x1a]
    add r0, r5, #0
    mov r1, #1
    bl MapObject_GetParam
    strh r0, [r4, #0x1c]
    add r0, r5, #0
    mov r1, #2
    bl MapObject_GetParam
    strh r0, [r4, #0x1e]
    add r0, r5, #0
    bl MapObject_GetXRange
    strb r0, [r4, #0xa]
    add r0, r5, #0
    bl MapObject_GetYRange
    strb r0, [r4, #0xb]
    add r0, r5, #0
    bl MapObject_GetInitialX
    strh r0, [r4, #0x20]
    add r0, r5, #0
    bl MapObject_GetInitialHeight
    strh r0, [r4, #0x22]
    add r0, r5, #0
    bl MapObject_GetInitialY
    strh r0, [r4, #0x24]
    add r0, r5, #0
    bl MapObject_GetCurrentX
    strh r0, [r4, #0x26]
    add r0, r5, #0
    bl MapObject_GetCurrentHeight
    strh r0, [r4, #0x28]
    add r0, r5, #0
    bl MapObject_GetCurrentY
    strh r0, [r4, #0x2a]
    mov r0, #0x26
    mov r1, #0x2a
    ldrsh r0, [r4, r0]
    ldrsh r1, [r4, r1]
    add r2, sp, #0
    bl sub_020611C8
    add r0, r5, #0
    bl MapObject_GetPosVecYCoord
    str r0, [sp, #4]
    add r0, r5, #0
    bl sub_0205F8B8
    add r2, r0, #0
    add r0, r6, #0
    add r1, sp, #0
    bl sub_02061248
    cmp r0, #0
    bne _0205E77C
    add r0, r5, #0
    bl MapObject_GetPosVecYCoord
    str r0, [r4, #0x2c]
    b _0205E792
    _0205E77C:
    add r0, r5, #0
    bl sub_0205F784
    cmp r0, #1
    bne _0205E78E
    add r0, r5, #0
    bl MapObject_GetPosVecYCoord
    str r0, [sp, #4]
    _0205E78E:
    ldr r0, [sp, #4]
    str r0, [r4, #0x2c]
    _0205E792:
    add r0, r5, #0
    bl sub_0205F394
    add r3, r4, #0
    add r3, #0x30
    mov r2, #0x10
    _0205E79E:
    ldrb r1, [r0]
    add r0, r0, #1
    strb r1, [r3]
    add r3, r3, #1
    sub r2, r2, #1
    bne _0205E79E
    add r0, r5, #0
    bl sub_0205F3BC
    add r4, #0x40
    mov r2, #0x10
    _0205E7B4:
    ldrb r1, [r0]
    add r0, r0, #1
    strb r1, [r4]
    add r4, r4, #1
    sub r2, r2, #1
    bne _0205E7B4
    add sp, #0xc
    pop {r3, r4, r5, r6, pc}
}

asm void sub_0205E7C4() {
    push {r4, r5, lr}
    sub sp, #0xc
    add r4, r1, #0
    ldr r1, [r4, #0]
    add r5, r0, #0
    bl sub_0205F204
    ldr r1, [r4, #4]
    add r0, r5, #0
    bl sub_0205F238
    ldrb r1, [r4, #8]
    add r0, r5, #0
    bl MapObject_SetID
    ldrh r1, [r4, #0x10]
    add r0, r5, #0
    bl sub_0205F250
    ldrh r1, [r4, #0x12]
    add r0, r5, #0
    bl MapObject_SetGfxID
    ldrb r1, [r4, #9]
    add r0, r5, #0
    bl MapObject_SetMovement
    ldrh r1, [r4, #0x14]
    add r0, r5, #0
    bl MapObject_SetType
    ldrh r1, [r4, #0x16]
    add r0, r5, #0
    bl MapObject_SetFlagID
    ldrh r1, [r4, #0x18]
    add r0, r5, #0
    bl MapObject_SetScript
    mov r1, #0xc
    ldrsb r1, [r4, r1]
    add r0, r5, #0
    bl MapObject_SetInitialFacing
    mov r1, #0xd
    ldrsb r1, [r4, r1]
    add r0, r5, #0
    bl MapObject_ForceSetFacingDirection
    mov r1, #0xe
    ldrsb r1, [r4, r1]
    add r0, r5, #0
    bl MapObject_SetNextFacing
    mov r1, #0x1a
    ldrsh r1, [r4, r1]
    add r0, r5, #0
    mov r2, #0
    bl MapObject_SetParam
    mov r1, #0x1c
    ldrsh r1, [r4, r1]
    add r0, r5, #0
    mov r2, #1
    bl MapObject_SetParam
    mov r1, #0x1e
    ldrsh r1, [r4, r1]
    add r0, r5, #0
    mov r2, #2
    bl MapObject_SetParam
    mov r1, #0xa
    ldrsb r1, [r4, r1]
    add r0, r5, #0
    bl MapObject_SetXRange
    mov r1, #0xb
    ldrsb r1, [r4, r1]
    add r0, r5, #0
    bl MapObject_SetYRange
    mov r1, #0x20
    ldrsh r1, [r4, r1]
    add r0, r5, #0
    bl MapObject_SetInitialX
    mov r1, #0x22
    ldrsh r1, [r4, r1]
    add r0, r5, #0
    bl MapObject_SetInitialHeight
    mov r1, #0x24
    ldrsh r1, [r4, r1]
    add r0, r5, #0
    bl MapObject_SetInitialY
    mov r1, #0x26
    ldrsh r1, [r4, r1]
    add r0, r5, #0
    bl MapObject_SetCurrentX
    mov r1, #0x28
    ldrsh r1, [r4, r1]
    add r0, r5, #0
    bl MapObject_SetCurrentHeight
    mov r1, #0x2a
    ldrsh r1, [r4, r1]
    add r0, r5, #0
    bl MapObject_SetCurrentY
    add r1, sp, #0
    mov r0, #0
    str r0, [r1]
    str r0, [r1, #4]
    str r0, [r1, #8]
    ldr r0, [r4, #0x2c]
    str r0, [sp, #4]
    add r0, r5, #0
    bl MapObject_SetPositionVec
    add r0, r5, #0
    bl sub_0205F394
    add r3, r4, #0
    add r3, #0x30
    mov r2, #0x10
    _0205E8C4:
    ldrb r1, [r3]
    add r3, r3, #1
    strb r1, [r0]
    add r0, r0, #1
    sub r2, r2, #1
    bne _0205E8C4
    add r0, r5, #0
    bl sub_0205F3BC
    add r4, #0x40
    mov r2, #0x10
    _0205E8DA:
    ldrb r1, [r4]
    add r4, r4, #1
    strb r1, [r0]
    add r0, r0, #1
    sub r2, r2, #1
    bne _0205E8DA
    add sp, #0xc
    pop {r4, r5, pc}
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

asm void sub_0205E954(LocalMapObject*) {
    push {r3, r4, lr}
    sub sp, #0xc
    add r4, r0, #0
    add r1, sp, #0
    bl MapObject_GetPositionVec
    add r0, r4, #0
    bl MapObject_GetCurrentX
    add r1, r0, #0
    mov r0, #2
    lsl r2, r1, #0x10
    lsl r0, r0, #0xe
    add r0, r2, r0
    str r0, [sp]
    add r0, r4, #0
    bl MapObject_SetPrevX
    add r0, r4, #0
    bl MapObject_GetCurrentHeight
    add r1, r0, #0
    add r0, r4, #0
    bl MapObject_SetPrevHeight
    add r0, r4, #0
    bl MapObject_GetCurrentY
    add r1, r0, #0
    mov r0, #2
    lsl r2, r1, #0x10
    lsl r0, r0, #0xe
    add r0, r2, r0
    str r0, [sp, #8]
    add r0, r4, #0
    bl MapObject_SetPrevY
    add r0, r4, #0
    add r1, sp, #0
    bl MapObject_SetPositionVec
    add sp, #0xc
    pop {r3, r4, pc}
}

asm void InitMapObjectsFromEventTemplates(MapObjectMan*, u32 map_no, u32 num_object_events, OBJECT_EVENT*) {
    push {r3, r4, r5, r6, r7, lr}
    sub sp, #8
    add r5, r2, #0
    add r7, r0, #0
    add r4, r3, #0
    str r1, [sp]
    cmp r5, #0
    bne _0205E9C0
    bl GF_AssertFail
    _0205E9C0:
    lsl r0, r5, #5
    str r0, [sp, #4]
    ldr r1, [sp, #4]
    mov r0, #0xb
    bl AllocFromHeapAtEnd
    add r6, r0, #0
    bne _0205E9D4
    bl GF_AssertFail
    _0205E9D4:
    ldr r2, [sp, #4]
    add r0, r6, #0
    add r1, r4, #0
    bl memcpy
    mov r0, #0xb
    mov r1, #0x14
    bl AllocFromHeapAtEnd
    add r4, r0, #0
    bne _0205E9EE
    bl GF_AssertFail
    _0205E9EE:
    ldr r0, [sp]
    str r0, [r4]
    str r5, [r4, #4]
    mov r0, #0
    str r0, [r4, #8]
    str r7, [r4, #0xc]
    add r0, r4, #0
    str r6, [r4, #0x10]
    bl sub_0205EA08
    add sp, #8
    pop {r3, r4, r5, r6, r7, pc}
}

asm void sub_0205EA08(void*) {
    push {r3, r4, r5, r6, r7, lr}
    add r5, r0, #0
    ldr r0, [r5, #0xc]
    bl MapObjectMan_GetFieldSysPtr
    add r6, r5, #0
    ldr r4, [r5, #0x10]
    add r7, r0, #0
    add r6, #8
    _0205EA1A:
    add r0, r4, #0
    bl ObjectEventTemplate_ScriptIdIsFFFF
    cmp r0, #1
    beq _0205EA30
    ldrh r1, [r4, #8]
    add r0, r7, #0
    bl FlagGet
    cmp r0, #0
    bne _0205EA42
    _0205EA30:
    ldr r0, [r5, #0xc]
    ldr r2, [r5, #0]
    add r1, r4, #0
    bl sub_0205E1D0
    cmp r0, #0
    bne _0205EA42
    bl GF_AssertFail
    _0205EA42:
    ldr r0, [r6, #0]
    add r4, #0x20
    add r0, r0, #1
    str r0, [r6]
    ldr r1, [r5, #8]
    ldr r0, [r5, #4]
    cmp r1, r0
    blt _0205EA1A
    ldr r1, [r5, #0x10]
    mov r0, #0xb
    bl FreeToHeapExplicit
    mov r0, #0xb
    add r1, r5, #0
    bl FreeToHeapExplicit
    pop {r3, r4, r5, r6, r7, pc}
}

asm LocalMapObject* sub_0205EA64(MapObjectMan*) {
    push {r3, r4, r5, r6, r7, lr}
    add r5, r0, #0
    mov r4, #0
    bl MapObjectMan_GetCount
    add r6, r0, #0
    add r0, r5, #0
    bl MapObjectMan_GetArray
    mov r7, #0x4b
    add r5, r0, #0
    lsl r7, r7, #2
    _0205EA7C:
    add r0, r5, #0
    mov r1, #1
    bl MapObject_GetBitsMask
    cmp r0, #0
    bne _0205EA8C
    add r0, r5, #0
    pop {r3, r4, r5, r6, r7, pc}
    _0205EA8C:
    add r4, r4, #1
    add r5, r5, r7
    cmp r4, r6
    blt _0205EA7C
    mov r0, #0
    pop {r3, r4, r5, r6, r7, pc}
}

asm LocalMapObject* sub_0205EA98(MapObjectMan*, u32, u32) {
    push {r3, r4, r5, r6, r7, lr}
    sub sp, #8
    add r5, r1, #0
    mov r1, #0
    add r4, r2, #0
    str r1, [sp, #4]
    add r1, sp, #0
    add r2, sp, #4
    mov r3, #1
    add r6, r0, #0
    bl sub_0205EEF4
    cmp r0, #1
    bne _0205EAEA
    add r7, sp, #0
    _0205EAB6:
    ldr r0, [sp]
    bl sub_0205F7D4
    cmp r0, #1
    bne _0205EADA
    ldr r0, [sp]
    bl MapObject_GetID
    cmp r5, r0
    bne _0205EADA
    ldr r0, [sp]
    bl sub_0205F544
    cmp r4, r0
    bne _0205EADA
    ldr r0, [sp]
    add sp, #8
    pop {r3, r4, r5, r6, r7, pc}
    _0205EADA:
    add r0, r6, #0
    add r1, r7, #0
    add r2, sp, #4
    mov r3, #1
    bl sub_0205EEF4
    cmp r0, #1
    beq _0205EAB6
    _0205EAEA:
    mov r0, #0
    add sp, #8
    pop {r3, r4, r5, r6, r7, pc}
}

void sub_0205F12C();

void sub_0205EAF0(MapObjectMan* manager, LocalMapObject* object) {
    u32 priority = sub_0205F19C(manager);
    u32 movement = MapObject_GetMovement(object);
    if (movement == 48 || movement == 50) {
        priority += 2;
    }

    SysTask* task = CreateSysTask(sub_0205F12C, object, priority);
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
    MapObject_SetBits(object, 0x1801);
    if (sub_0205EFF8(object) == TRUE) {
        sub_0205F7B8(object, TRUE);
    }
    sub_0205F354(object, manager);
    MapObject_ForceSetFacingDirection(object, MapObject_GetInitialFacing(object));
    MapObject_SetNextFacing(object, MapObject_GetInitialFacing(object));
    MapObject_ClearHeldMovement(object);
}
