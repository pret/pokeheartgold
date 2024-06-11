#ifndef NITRO_GX_H_
#define NITRO_GX_H_

#ifdef SDK_ARM9
#include <nitro/gx/gxcommon.h>
#include <nitro/gx/gx.h>
#include <nitro/gx/gx_bgcnt.h>
#include <nitro/gx/g2.h>
#include <nitro/gx/g3.h>
#include <nitro/gx/g3b.h>
#include <nitro/gx/g3x.h>
#include <nitro/gx/g3_util.h>
#include <nitro/gx/g3imm.h>
#include <nitro/gx/gx_load.h>
#include <nitro/gx/g2_oam.h>
#include <nitro/gx/gx_vramcnt.h>
#else
#include <nitro/gx/gx_sp.h>
#endif //SDK_ARM9

#endif //NITRO_GX_H_
