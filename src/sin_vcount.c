#include "global.h"
#include "math_util.h"

fx32 sub_02096594(void) {
    u16 vcount = GX_GetVCount();
    return GF_SinDegNoWrap(vcount);
}
