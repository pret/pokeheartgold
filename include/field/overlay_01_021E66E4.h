#ifndef POKEHEARTGOLD_FIELD_OVERLAY_01_021E66E4_H
#define POKEHEARTGOLD_FIELD_OVERLAY_01_021E66E4_H

#include "heap.h"
#include "sys_task.h"

struct FieldSystem;

typedef struct UnkStruct_Overlay01_021E66E4_subC UnkStruct_Overlay01_021E66E4_subC;

typedef void (*Ov01_021E66E4_subC_func)(UnkStruct_Overlay01_021E66E4_subC *a0, struct FieldSystem *a1, void *a2);

typedef struct UnkStruct_Overlay01_021E67BC_template {
    int taskPriority;
    u16 dataSize;
    Ov01_021E66E4_subC_func initFunc;
    Ov01_021E66E4_subC_func destroyFunc;
    Ov01_021E66E4_subC_func buildFunc;
    Ov01_021E66E4_subC_func renderFunc;
} UnkStruct_Overlay01_021E67BC_template;

struct UnkStruct_Overlay01_021E66E4_subC {
    BOOL inUse;
    SysTask *mainTask;
    SysTask *g3dRenderTask;
    const UnkStruct_Overlay01_021E67BC_template *param;
    void *data;
};

typedef struct UnkStruct_Overlay01_021E66E4 {
    struct FieldSystem *fieldSystem;
    HeapID heapId;
    int max;
    UnkStruct_Overlay01_021E66E4_subC *tasks;
    SysTaskQueue *taskQueue;
} UnkStruct_Overlay01_021E66E4;

// @red031000: struct keyword is necessary because cannot double-typedef and cannot circular include
UnkStruct_Overlay01_021E66E4 *ov01_021E66E4(struct FieldSystem *a0, HeapID heapId, int num);
UnkStruct_Overlay01_021E66E4_subC *ov01_021E67BC(UnkStruct_Overlay01_021E66E4 *a0, const UnkStruct_Overlay01_021E67BC_template *a1);  // Create
void ov01_021E683C(UnkStruct_Overlay01_021E66E4_subC *a0);  // Destroy
void *ov01_021E687C(UnkStruct_Overlay01_021E66E4_subC *a0);  // GetData

#endif //POKEHEARTGOLD_FIELD_OVERLAY_01_021E66E4_H
