#include "save_follow_mon.h"

#include "global.h"

#include "save_arrays.h"

u32 Save_FollowMon_sizeof(void) {
    return sizeof(SaveFollowMon);
}

void Save_FollowMon_Init(SaveFollowMon *followMon) {
    memset(followMon, 0, sizeof(SaveFollowMon));
    followMon->mapNo = 0;
}

SaveFollowMon *Save_FollowMon_Get(SaveData *saveData) {
    return (SaveFollowMon *)SaveArray_Get(saveData, SAVE_FOLLOW_MON);
}

void Save_FollowMon_SetMapID(u32 mapNo, SaveFollowMon *followMon) {
    followMon->mapNo = mapNo;
}

u32 Save_FollowMon_GetMapID(SaveFollowMon *followMon) {
    return followMon->mapNo;
}

void Save_FollowMon_SetUnused2bitField(u8 value, SaveFollowMon *followMon) {
    followMon->unused = value;
}

void Save_FollowMon_SetInhibitFlagState(SaveFollowMon *followMon, u8 flag) {
    followMon->inhibitFlag = flag;
}

u8 Save_FollowMon_GetInhibitFlagState(SaveFollowMon *followMon) {
    return (u8)followMon->inhibitFlag;
}
