#include <nitro.h>

__declspec(noinline)
void EXIi_SetBitRcnt0L(u16 mask, u16 data) {
    reg_EXI_RCNT0_L = (~mask & reg_EXI_RCNT0_L) | data;
}

void EXIi_SelectRcnt(EXIGpioIF type) {
    EXIi_SetBitRcnt0L(REG_EXI_RCNT0_L_RE1_MASK | REG_EXI_RCNT0_L_RE0_MASK, type);
}
