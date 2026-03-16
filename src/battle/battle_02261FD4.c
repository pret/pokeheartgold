#include "battle/battle_02261FD4.h"

#include "battle/battle_system.h"

#include "math_util.h"
#include "pokepic.h"

static void ov12_0226203C(SysTask *task, void *_data);

void ov12_02261FD4(OpponentData *data, BattleSystem *battleSystem) {
    if (data->unk198 == NULL && !(BattleSystem_GetBattleType(battleSystem) & (BATTLE_TYPE_SAFARI | BATTLE_TYPE_PAL_PARK))) {
        data->unk19C = 180;
        data->unk198 = SysTask_CreateOnMainQueue(ov12_0226203C, data, 0x3F2);
    }
}

void ov12_02262014(OpponentData *data) {
    if (data->unk198 != NULL) {
        SysTask_Destroy(data->unk198);
        data->unk198 = NULL;
        data->unk19C = 0;
        Pokepic_SetAttr(data->pokepic, POKEPIC_YOFFSET, 0);
    }
}

static void ov12_0226203C(SysTask *task, void *_data) {
    OpponentData *data = _data;

    data->unk19C += 20;

    if (data->unk19C >= 360) {
        data->unk19C -= 360;
    }

    int dy = FX_Mul(GF_SinDegNoWrap(data->unk19C), FX32_CONST(1.5)) / FX32_ONE;

    Pokepic_SetAttr(data->pokepic, POKEPIC_YOFFSET, dy);
}
