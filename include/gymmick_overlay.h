#ifndef POKEHEARTGOLD_GYMMICK_OVERLAY_H
#define POKEHEARTGOLD_GYMMICK_OVERLAY_H

#include "script.h"
#include "gymmick.h"
#include "gymmick/violet.h"
#include "gymmick/azalea.h"

static inline void *OverlayGymmick_AllocWork(FieldSystem *fsys, u32 size) {
    fsys->unk4->unk_24 = AllocFromHeap(4, size);
    MI_CpuClear8(fsys->unk4->unk_24, size);
    return fsys->unk4->unk_24;
}

void InitEcruteakGymPuzzleGimmick(FieldSystem *fsys);
void DeleteEcruteakGymPuzzleGimmick(FieldSystem *fsys);
void Fsys_EcruteakGymEyeTrainerApproachCarryCandleEffectBegin(FieldSystem *fsys);
void Fsys_EcruteakGymTrainerApproachCarryCandleEffectEnd(FieldSystem *fsys);
void Fsys_EcruteakGymExtinguishCandle(FieldSystem *fsys, enum ScriptEnvField a1);
void ov04_02254F8C(FieldSystem *fsys);
void ov04_0225507C(FieldSystem *fsys);
BOOL ov04_022550D4(FieldSystem* fsys, u32 a1, u32 a2, u32 a3, u32 a4);
void ov04_02255FC0(FieldSystem *fsys);
void ov04_02256044(FieldSystem *fsys);
int ov04_02256058(FieldSystem *fsys);
void ov04_02256304(FieldSystem *fsys);
void ov04_022563B0(FieldSystem *fsys);
BOOL ov04_022563C4(FieldSystem *fsys, u8 canId);
void ov04_0225640C(FieldSystem *fsys, u8 lockno, u8 relock);
void ov04_02256650(FieldSystem *fsys);
void ov04_022566A0(FieldSystem *fsys);
void ov04_02256B64(FieldSystem *fsys);
void ov04_02256BA0(FieldSystem *fsys);
void ov04_02256E60(FieldSystem *fsys);
void ov04_02256EB0(FieldSystem *fsys);
void ov04_02256ED8(FieldSystem *fsys);
void ov04_02256F00(FieldSystem *fsys, u8 a1);

#endif //POKEHEARTGOLD_GYMMICK_OVERLAY_H
