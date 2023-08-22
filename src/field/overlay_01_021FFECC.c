#include "field_map_object.h"
#include "field_player_avatar.h"
#include "overlay_01_021FFECC.h"
#include "unk_0205FD20.h"
#include "unk_020658D4.h"
#include "unk_020689C8.h"
#include "unk_02069660.h"
#include "unk_0206979C.h"

static void ov01_021FFEF8(UnkOv01_021FFECC *a0);
static void ov01_021FFF38(UnkOv01_021FFECC *a0);
static BOOL ov01_021FFFCC(void *a0, UnkOv01_021FFFCD *a1);
static BOOL ov01_021FFFFC(void *a0, UnkOv01_021FFFCD *a1);
static void ov01_0220001C(void *a0, UnkOv01_021FFFCD *a1);
static void ov01_02200020(void *a0, UnkOv01_021FFFCD *a1);

static const int ov01_02209270[4] = { 0x64, 0x65, 0x66, 0x67 };
static const UnkOv01_02209280 ov01_02209280 = {
    0x24, ov01_021FFFCC, ov01_021FFFFC, ov01_0220001C, ov01_02200020
};

UnkOv01_021FFECC *ov01_021FFECC(void *a0) {
    UnkOv01_021FFECC *ptr = ov01_021F1430(a0, sizeof(UnkOv01_021FFECC), 0, 0);
    ptr->unk0 = a0;
    ov01_021FFEF8(ptr);
    return ptr;
}

void ov01_021FFEE8(UnkOv01_021FFECC *a0) {
    ov01_021FFF38(a0);
    ov01_021F1448(a0);
}

static void ov01_021FFEF8(UnkOv01_021FFECC *a0) {
    for (int i = 0; i < 4; i++) {
        ov01_021F19F4(a0->unk0, &a0->unk4[i], 0, ov01_02209270[i], 0);
        sub_02069978(&a0->unk54[i], &a0->unk4[i]);
    }
}

static void ov01_021FFF38(UnkOv01_021FFECC *a0) {
    for (int i = 0; i < 4; i++) {
        sub_02069784(&a0->unk4[i]);
    }
}

static NNSG3dRenderObj *ov01_021FFF50(UnkOv01_021FFECC *a0, int idx) {
    return &a0->unk54[idx];
}

void ov01_021FFF5C(LocalMapObject *mapObject, int a1) {
    VecFx32 temp;
    UnkOv01_021FFF5C temp2;

    FieldSystem *fieldSystem = ov01_021F146C(mapObject);
    TaskManager* taskman = ov01_021F1468(fieldSystem);

    int x = MapObject_GetCurrentX(mapObject);
    int y = MapObject_GetCurrentY(mapObject);

    sub_020611C8(x, y, &temp);
    sub_0206121C(taskman, &temp);

    temp2.unk0 = a1;
    temp2.unk4 = fieldSystem;

    UnkOv01_021FFECC *val1 = ov01_021F1450(fieldSystem, 0xe);
    temp2.unk8 = val1;
    temp2.unkC = mapObject;
    temp2.unk10 = ov01_021FFF50(val1, a1);

    int val3 = sub_0205F09C(mapObject, 2);
    ov01_021F1620(fieldSystem, &ov01_02209280, &temp, 0, &temp2, val3);
}

static BOOL ov01_021FFFCC(void *a0, UnkOv01_021FFFCD *a1) {
    UnkOv01_021FFFCC *ptr = sub_02068D98(a0);
    LocalMapObject *mapObject = ptr->unk0.unkC;

    a1->unk10 = ptr->unk0;
    a1->unk8 = MapObject_GetID(mapObject);
    a1->unkC = sub_0205F254(mapObject);
    return TRUE;
}

static BOOL ov01_021FFFFC(void *a0, UnkOv01_021FFFCD *a1) {
    LocalMapObject *mapObject = a1->unk10.unkC;

    BOOL val = sub_0205F0A8(mapObject, a1->unk8, a1->unkC);
    if (val == TRUE) {
        return sub_02066420(mapObject, 0);
    }
    return val;
}

static void ov01_0220001C(void *a0, UnkOv01_021FFFCD *a1) {}

static void ov01_02200020(void *a0, UnkOv01_021FFFCD *a1) {
    VecFx32 translation;

    if (a1->unk4 != TRUE) {
        sub_02068DB8(a0, &translation);
        sub_020699BC(a1->unk10.unk10, &translation);
    }
}
