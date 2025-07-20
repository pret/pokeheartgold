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

void StartMapSceneScript(FieldSystem *fieldSystem, u16 script, LocalMapObject *lastTalked);
void FieldSystem_SetEngagedTrainer(FieldSystem *fieldSystem, LocalMapObject *obj, int a2, int a3, int a4, int trainerId, int encounterType, int idx);
void QueueScript(TaskManager *taskman, u16 script, LocalMapObject *lastTalked, void *a3);
void StartScriptFromMenu(TaskManager *taskman, u16 script, LocalMapObject *lastTalked);
BOOL Task_RunScripts(TaskManager *taskman);
ScriptEnvironment *ScriptEnvironment_New(void);
void DestroyScriptContext(ScriptContext *ctx);
void SetupScriptEngine(FieldSystem *fieldSystem, ScriptEnvironment *env, u16 script, LocalMapObject *lastTalked, void *a4);
ScriptContext *CreateScriptContext(FieldSystem *fieldSystem, u16 script);
void SetUpScriptContextForMap(FieldSystem *fieldSystem, ScriptContext *ctx, u16 scriptId, u32 unused_r3);
u16 LoadScriptsAndMessagesByMapId(FieldSystem *fieldSystem, ScriptContext *ctx, u16 scriptId);
void LoadScriptsAndMessagesParameterized(FieldSystem *fieldSystem, ScriptContext *ctx, int scriptBank, u32 msgBank);
void LoadScriptsAndMessagesForCurrentMap(FieldSystem *fieldSystem, ScriptContext *ctx);
void *FieldSysGetAttrAddrInternal(ScriptEnvironment *fieldSystem, enum ScriptEnvField field);
void *FieldSysGetAttrAddr(FieldSystem *fieldSystem, enum ScriptEnvField field);
void sub_0204031C(FieldSystem *fieldSystem);
void ScriptRunByIndex(ScriptContext *ctx, int idx);
u8 *LoadScriptsForCurrentMap(u32 mapId);
u32 GetCurrentMapMessageBank(u32 mapId);
u16 *GetVarPointer(FieldSystem *fieldSystem, u16 varId);
u16 FieldSystem_VarGet(FieldSystem *fieldSystem, u16 varId);
BOOL FieldSystem_VarSet(FieldSystem *fieldSystem, u16 varId, u16 value);
u16 FieldSystem_VarGetObjectEventGraphicsId(FieldSystem *fieldSystem, u16 objId);
BOOL FieldSystem_FlagCheck(FieldSystem *fieldSystem, u16 flagId);
void FieldSystem_FlagSet(FieldSystem *fieldSystem, u16 flagId);
void FieldSystem_FlagClear(FieldSystem *fieldSystem, u16 flagId);
void ClearTempFieldEventData(FieldSystem *fieldSystem);
void ClearDailyFlags(FieldSystem *fieldSystem);
void FieldMove_SetArgs(FieldSystem *fieldSystem, u16 v8000, u16 v8001, u16 v8002, u16 v8003);
u16 ScriptNumToTrainerNum(u16 script);
BOOL ScriptNoToDoublePartnerNo(u16 a0);
BOOL TrainerNumIsDouble(u32 trainer);
BOOL TrainerFlagCheck(SaveData *a0, u32 trno);
void TrainerFlagSet(SaveData *a0, u32 trno);
void TrainerFlagClear(SaveData *a0, u32 trno);
u16 HiddenItemScriptNoToFlagId(u16 script);
u16 HiddenItemScriptNoToHiddenItemIdx(u16 script);
u8 sub_02040578(u16 script);
BOOL GetHiddenItemParams(ScriptEnvironment *env, u16 script);
HiddenItemResponse *AllocAndFetchNearbyHiddenItems(FieldSystem *fieldSystem, HeapID heapId);
void RunInitScript(FieldSystem *fieldSystem);
void StartMapLoadScript(FieldSystem *fieldSystem, u16 script);
BOOL TryStartMapScriptByType(FieldSystem *fieldSystem, u8 type);
BOOL MapSceneScriptCheck(FieldSystem *fieldSystem);
u16 GetMapLoadScriptId(u8 *header, u8 type);
u16 GetMapSceneScriptId(FieldSystem *fieldSystem, u8 *header, u8 type);
void *FieldSysGetAttrAddr(FieldSystem *fieldSystem, enum ScriptEnvField field);

#endif
