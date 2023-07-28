#include "global.h"
#include "battle_system.h"

BgConfig *BattleSystem_GetBgConfig(BattleSystem *bsys) {
    return bsys->bgConfig;
}

Window *BattleSystem_GetWindow(BattleSystem *bsys, int index) {
    return &bsys->window[index];
}

u32 BattleSystem_GetBattleType(BattleSystem *bsys) {
    return bsys->battleTypeFlags;
}

BATTLECONTEXT *BattleSystem_GetBattleContext(BattleSystem *bsys) {
    return bsys->ctx;
}

OpponentData *BattleSystem_GetOpponentData(BattleSystem *bsys, int battlerId) {
    return bsys->opponentData[battlerId];
}

int BattleSystem_GetMaxBattlers(BattleSystem *bsys) {
    return bsys->maxBattlers;
}
