#include "global.h"
#include "battle_system.h"

BgConfig *BattleSystem_GetBgConfig(BattleSystem *bsys) {
    return bsys->bgConfig;
}

Window *BattleSystem_GetWindow(BattleSystem *bsys, int index) {
    return &bsys->window[index];
}