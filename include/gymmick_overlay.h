#ifndef POKEHEARTGOLD_GYMMICK_OVERLAY_H
#define POKEHEARTGOLD_GYMMICK_OVERLAY_H

#include "script.h"
#include "gymmick.h"
#include "gymmick/violet.h"
#include "gymmick/azalea.h"
#include "gymmick/ecruteak.h"

static inline void *OverlayGymmick_AllocWork(FieldSystem *fsys, u32 size) {
    fsys->unk4->unk_24 = AllocFromHeap(4, size);
    MI_CpuClear8(fsys->unk4->unk_24, size);
    return fsys->unk4->unk_24;
}

void InitBlackthornGymPuzzleGimmick(FieldSystem *fsys);
void DeleteBlackthornPuzzleGimmick(FieldSystem *fsys);
BOOL ov04_022550D4(FieldSystem* fsys, u32 a1, u32 a2, u32 a3, u32 a4);
void InitCianwoodPuzzleGimmick(FieldSystem *fsys);
void DeleteCianwoodPuzzleGimmick(FieldSystem *fsys);
int ov04_02256058(FieldSystem *fsys);
void InitVermilionPuzzleGimmick(FieldSystem *fsys);
void DeleteVermilionPuzzleGimmick(FieldSystem *fsys);
BOOL ov04_022563C4(FieldSystem *fsys, u8 canId);
void ov04_0225640C(FieldSystem *fsys, u8 lockno, u8 relock);
void InitFuchsiaGymPuzzleGimmick(FieldSystem *fsys);
void DeleteFuchsiaPuzzleGimmick(FieldSystem *fsys);
void InitViridianGymPuzzleGimmick(FieldSystem *fsys);
void DeleteViridianPuzzleGimmick(FieldSystem *fsys);
void InitSinjohPuzzleGimmick(FieldSystem *fsys);
void DeleteSinjohPuzzleGimmick(FieldSystem *fsys);
void ov04_02256ED8(FieldSystem *fsys);
void ov04_02256F00(FieldSystem *fsys, u8 a1);

#endif //POKEHEARTGOLD_GYMMICK_OVERLAY_H
