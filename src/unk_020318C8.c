#include "unk_020318C8.h"

#include <nitro/mi/memory.h>

#include "global.h"

#include "save.h"

u32 UnkStruct_020318C8_Sizeof(void) {
    return sizeof(UnkStruct_020318C8);
}

void UnkStruct_020318C8_Init(UnkStruct_020318C8 *data) {
    MI_CpuClear32(data, UnkStruct_020318C8_Sizeof());
    data->activityId = -1;
}

UnkStruct_020318C8 *UnkStruct_020318C8_Get(SaveData *saveData) {
    return SaveArray_Get(saveData, SAVE_UNK_32);
}

u32 UnkStruct_020318C8_GetActivityId(UnkStruct_020318C8 *data) {
    return data->activityId;
}

u32 UnkStruct_020318C8_GetRank(UnkStruct_020318C8 *data) {
    return data->rank;
}

void UnkStruct_020318C8_SetActivityId(UnkStruct_020318C8 *data, u32 activityId) {
    data->activityId = activityId;
}

void UnkStruct_020318C8_SetRank(UnkStruct_020318C8 *data, u32 rank) {
    data->rank = rank;
}
