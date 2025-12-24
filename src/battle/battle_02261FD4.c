#include "math_util.h"
#include "pokepic.h"
#include "battle/battle_02261FD4.h"
#include "battle/battle_system.h"

static void Battle02261FD4_ShakeAnimation(SysTask *task, void *_data);

void ov12_02261FD4(OpponentData *data, BattleSystem *battleSystem) {
    if (data->sysTask == NULL && !(BattleSystem_GetBattleType(battleSystem) & (BATTLE_TYPE_SAFARI | BATTLE_TYPE_PAL_PARK))) {
        data->yOffset = 180;
        data->sysTask = SysTask_CreateOnMainQueue(Battle02261FD4_ShakeAnimation, data, 0x3F2);
    }
}

void ov12_02262014(OpponentData *data) {
    if (data->sysTask != NULL) {
        SysTask_Destroy(data->sysTask);
        data->sysTask = NULL;
        data->yOffset = 0;
        Pokepic_SetAttr(data->pokepic, POKEPIC_YOFFSET, 0);
    }
}

static void Battle02261FD4_ShakeAnimation(SysTask *task, void *_data) {
    OpponentData *data = _data;

    data->yOffset += 20;
    if (data->yOffset >= 360) {
        data->yOffset -= 360;
    }

    int dy = FX_Mul(GF_SinDegNoWrap(data->yOffset), FX32_CONST(1.5)) / FX32_ONE;
    Pokepic_SetAttr(data->pokepic, POKEPIC_YOFFSET, dy);
}
