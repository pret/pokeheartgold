#ifndef NITRO_CTRDG_H_
#define NITRO_CTRDG_H_

#include <nitro/ctrdg/common/ctrdg_common.h>

#ifdef SDK_ARM7
#include <nitro/ctrdg/ARM7/vibrate.h>
#endif //SDK_ARM7

void CTRDG_Init(void);

#endif //NITRO_CTRDG_H_
