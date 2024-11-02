#ifndef POKEHEARTGOLD_OV_01_021F1348_H
#define POKEHEARTGOLD_OV_01_021F1348_H

#include "map_object.h"
#include "script.h"
#include "task.h"
#include "unk_020689C8.h"

typedef struct {
    u8 unk0[0xc];
    NNSG3dResMdl *unkC;
    u8 unk10[4];
} UnkOv01_021FFECC_sub;

typedef struct {
    void *unk0;
    UnkOv01_021FFECC_sub unk4[4];
    NNSG3dRenderObj unk54[4];
} UnkOv01_021FFECC;

typedef struct {
    int unk0;
    BOOL unk4;
    u32 localMapObjectId;
    u32 mapId;
    UnkOv01_021FFFCC_common unk10;
    NNSG3dRenderObj *unk24;
} UnkOv01_021FFFCD;

typedef BOOL (*UnkOv01_02209280_Cb1)(void *, UnkOv01_021FFFCD *);
typedef void (*UnkOv01_02209280_Cb2)(void *, UnkOv01_021FFFCD *);

typedef struct {
    int unk0;
    UnkOv01_02209280_Cb1 unk4;
    UnkOv01_02209280_Cb1 unk8;
    UnkOv01_02209280_Cb2 unkC;
    UnkOv01_02209280_Cb2 unk10;
} UnkOv01_02209280;

typedef struct {
    int unk0;
    FieldSystem *unk4;
    UnkOv01_021FFECC *unk8;
    LocalMapObject *unkC;
    NNSG3dRenderObj *unk10;
} UnkOv01_021FFF5C;

UnkOv01_021FFECC *ov01_021F1430(void *a0, int a1, int a2, int a3);
FieldSystem *ov01_021F146C(LocalMapObject *mapObject);
TaskManager *ov01_021F1468(FieldSystem *fieldSystem);
UnkOv01_021FFECC *ov01_021F1450(FieldSystem *fieldSystem, int a1);
void ov01_021F1620(FieldSystem *fieldSystem, const UnkOv01_02209280 *a1, VecFx32 *a2, int a3, UnkOv01_021FFF5C *a4, int a5);
void ov01_021F1448(UnkOv01_021FFECC *a0);
void ov01_021F19F4(void *a0, UnkOv01_021FFECC_sub *a1, int a2, int a3, int a4);
void ov01_021F1640(int a0);

#endif // POKEHEARTGOLD_OV_01_021F1348_H
