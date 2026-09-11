#include "global.h"

#include "math_util.h"

void Task_AntipiracyMath(SysTask *task_unused, void *data_unused) { // Intentionally lags the game.
    u16 vcount = GX_GetVCount();
    GF_SinDegNoWrap(vcount);
}
