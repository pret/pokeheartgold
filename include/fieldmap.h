#ifndef POKEHEARTGOLD_FIELDMAP_H
#define POKEHEARTGOLD_FIELDMAP_H

#include "script.h"
#include "trainer_data.h"

typedef struct HiddenItemResponse {
    s16 x;
    s16 y;
    u8 unk4;
    u8 dummy;
} HiddenItemResponse;

void sub_0203FE74(UnkSavStruct80 *a0, u16 a1, UnkSavStruct80_Sub3C *a2);
void sub_0203FEA4(UnkSavStruct80 *a0, UnkSavStruct80_Sub3C *a1, int a2, int a3, int a4, int a5, int a6, int a7);
void sub_0203FED4(UnkSavStruct80_Sub10 *a0, u16 a1, UnkSavStruct80_Sub3C *a2, void *a3);
void sub_0203FF0C(UnkSavStruct80_Sub10 *a0, u16 a1, UnkSavStruct80_Sub3C *a2);
BOOL sub_0203FF44(UnkSavStruct80_Sub10 *unk);
UnkSavStruct80_Sub10_SubC *sub_0204001C(void);
void DestroyScriptContext(SCRIPTCONTEXT *ctx);
void sub_0204005C(UnkSavStruct80 *a0, UnkSavStruct80_Sub10_SubC *a1, u16 a2, UnkSavStruct80_Sub3C *a3, void* a4);
SCRIPTCONTEXT *CreateScriptContext(UnkSavStruct80 *a0, u16 mapId);
void SetUpScriptContextForMap(UnkSavStruct80 *a0, SCRIPTCONTEXT *ctx, u16 mapId, u32 unused_r3);
u16 LoadScriptsAndMessagesByMapId(UnkSavStruct80 *a0, SCRIPTCONTEXT *ctx, u16 mapId);
void LoadScriptsAndMessagesParameterized(UnkSavStruct80 *a0, SCRIPTCONTEXT *a1, int scriptBank, u32 msgBank);
void LoadScriptsAndMessagesForCurrentMap(UnkSavStruct80 *a0, SCRIPTCONTEXT *a1);
void *FieldSysGetAttrAddrInternal(UnkSavStruct80_Sub10_SubC *a0, enum Unk80_10_C_Field a1);
void *FieldSysGetAttrAddr(UnkSavStruct80 *a0, enum Unk80_10_C_Field a1);
void sub_0204031C(UnkSavStruct80 *a0);
void ScriptRunByIndex(SCRIPTCONTEXT *ctx, int idx);
u8 *LoadScriptsForCurrentMap(u32 mapId);
u32 GetCurrentMapMessageBank(u32 mapId);
u16* GetVarPointer(UnkSavStruct80* fsys, u16 varId);
u16 VarGet(UnkSavStruct80* fsys, u16 varId);
BOOL VarSet(UnkSavStruct80* fsys, u16 varId, u16 value);
u16 VarGetObjectEventGraphicsId(UnkSavStruct80* fsys, u16 objId);
BOOL FlagGet(UnkSavStruct80 *fsys, u16 flagId);
void FlagSet(UnkSavStruct80 *fsys, u16 flagId);
void FlagClear(UnkSavStruct80 *fsys, u16 flagId);
void ClearTempFieldEventData(UnkSavStruct80 *fsys);
void ClearDailyFlags(UnkSavStruct80 *fsys);
void sub_02040490(UnkSavStruct80 *a0, u16 a1, u16 a2, u16 a3, u16 a4);
u16 sub_020404C8(u16 a0);
BOOL sub_020404EC(u16 a0);
BOOL sub_02040500(u32 trainer);
BOOL TrainerFlagCheck(SAVEDATA *a0, u32 trno);
void TrainerFlagSet(SAVEDATA *a0, u32 trno);
void TrainerFlagClear(SAVEDATA *a0, u32 trno);
u16 HiddenItemScriptNoToFlagId(u16 a0);
u16 HiddenItemScriptNoToHiddenItemIdx(u16 a0);
u8 sub_02040578(u16 a0);
BOOL sub_020405AC(UnkSavStruct80_Sub10_SubC *a0, u16 a1);
HiddenItemResponse* AllocAndFetchNearbyHiddenItems(UnkSavStruct80 *fsys, HeapID heapId);
void RunPokemonCenterScriptsInNewContext(UnkSavStruct80 *fsys);
void sub_02040734(UnkSavStruct80 *fsys, u16 a1);
BOOL sub_02040750(UnkSavStruct80 *fsys, u8 a1);
BOOL sub_020407AC(UnkSavStruct80 *fsys);
u16 sub_020407E4(u8 *a0, u8 a1);
u16 sub_0204080C(UnkSavStruct80 *a0, u8 *a1, u8 a2);



BOOL sub_0203BC10(UnkSavStruct80 *);
void sub_0203BD64(UnkSavStruct80 *);

UnkSavStruct80_Sub10 *sub_020504C0(UnkSavStruct80 *a0, u32 a1);
void sub_020504F0(UnkSavStruct80 *a0, BOOL (*a1)(UnkSavStruct80_Sub10 *), UnkSavStruct80_Sub10_SubC *a2);
void sub_02050510(UnkSavStruct80_Sub10 *a0, BOOL (*a1)(UnkSavStruct80_Sub10 *), UnkSavStruct80_Sub10_SubC *a2);
void sub_02050530(UnkSavStruct80_Sub10 *a0, BOOL (*a1)(UnkSavStruct80_Sub10 *), UnkSavStruct80_Sub10_SubC *a2);
UnkSavStruct80 *sub_0205064C(UnkSavStruct80_Sub10 *a0);
UnkSavStruct80_Sub10_SubC* sub_02050650(UnkSavStruct80_Sub10 *a0);
void* sub_0205C654(void *);
u16 sub_0205F24C(struct UnkSavStruct80_Sub3C *);

#endif
