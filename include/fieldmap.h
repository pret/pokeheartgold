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

void StartMapSceneScript(FieldSystem *fsys, u16 script, LocalMapObject *lastTalked);
void FieldSys_SetEngagedTrainer(FieldSystem *fsys, LocalMapObject *obj, int a2, int a3, int a4, int trainerNum, int encounterType, int idx);
void QueueScript(TaskManager *taskman, u16 script, LocalMapObject *lastTalked, void *a3);
void StartScriptFromMenu(TaskManager *taskman, u16 script, LocalMapObject *lastTalked);
BOOL Task_RunScripts(TaskManager *taskman);
ScriptEnvironment *ScriptEnvironment_new(void);
void DestroyScriptContext(SCRIPTCONTEXT *ctx);
void SetupScriptEngine(FieldSystem *fsys, ScriptEnvironment *env, u16 script, LocalMapObject *lastTalked, void* a4);
SCRIPTCONTEXT *CreateScriptContext(FieldSystem *fsys, u16 script);
void SetUpScriptContextForMap(FieldSystem *fsys, SCRIPTCONTEXT *ctx, u16 scriptId, u32 unused_r3);
u16 LoadScriptsAndMessagesByMapId(FieldSystem *fsys, SCRIPTCONTEXT *ctx, u16 scriptId);
void LoadScriptsAndMessagesParameterized(FieldSystem *fsys, SCRIPTCONTEXT *ctx, int scriptBank, u32 msgBank);
void LoadScriptsAndMessagesForCurrentMap(FieldSystem *fsys, SCRIPTCONTEXT *ctx);
void *FieldSysGetAttrAddrInternal(ScriptEnvironment *fsys, enum ScriptEnvField field);
void *FieldSysGetAttrAddr(FieldSystem *fsys, enum ScriptEnvField field);
void sub_0204031C(FieldSystem *fsys);
void ScriptRunByIndex(SCRIPTCONTEXT *ctx, int idx);
u8 *LoadScriptsForCurrentMap(u32 mapId);
u32 GetCurrentMapMessageBank(u32 mapId);
u16* GetVarPointer(FieldSystem* fsys, u16 varId);
u16 VarGet(FieldSystem* fsys, u16 varId);
BOOL VarSet(FieldSystem* fsys, u16 varId, u16 value);
u16 VarGetObjectEventGraphicsId(FieldSystem* fsys, u16 objId);
BOOL FlagGet(FieldSystem *fsys, u16 flagId);
void FlagSet(FieldSystem *fsys, u16 flagId);
void FlagClear(FieldSystem *fsys, u16 flagId);
void ClearTempFieldEventData(FieldSystem *fsys);
void ClearDailyFlags(FieldSystem *fsys);
void FieldMoveArgsSet(FieldSystem *fsys, u16 v8000, u16 v8001, u16 v8002, u16 v8003);
u16 ScriptNumToTrainerNum(u16 script);
BOOL ScriptNoToDoublePartnerNo(u16 a0);
BOOL TrainerNumIsDouble(u32 trainer);
BOOL TrainerFlagCheck(SAVEDATA *a0, u32 trno);
void TrainerFlagSet(SAVEDATA *a0, u32 trno);
void TrainerFlagClear(SAVEDATA *a0, u32 trno);
u16 HiddenItemScriptNoToFlagId(u16 script);
u16 HiddenItemScriptNoToHiddenItemIdx(u16 script);
u8 sub_02040578(u16 script);
BOOL GetHiddenItemParams(ScriptEnvironment *env, u16 script);
HiddenItemResponse* AllocAndFetchNearbyHiddenItems(FieldSystem *fsys, HeapID heapId);
void RunInitScript(FieldSystem *fsys);
void StartMapLoadScript(FieldSystem *fsys, u16 script);
BOOL TryStartMapScriptByType(FieldSystem *fsys, u8 type);
BOOL MapSceneScriptCheck(FieldSystem *fsys);
u16 GetMapLoadScriptId(u8 *header, u8 type);
u16 GetMapSceneScriptId(FieldSystem *fsys, u8 *header, u8 type);
void* FieldSysGetAttrAddr(FieldSystem *fsys, enum ScriptEnvField field);


BOOL sub_0203BC10(FieldSystem *);
void sub_0203BD64(FieldSystem *);

#endif
