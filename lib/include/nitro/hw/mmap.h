#ifndef NITRO_HW_MMAP_H_
#define NITRO_HW_MMAP_H_

#include <nitro/types.h>
#include <nitro/hw/mmap_shared.h>

#ifdef SDK_ARM7
#include <nitro/hw/ARM7/mmap.h>
#else //ARM9
#include <nitro/hw/ARM9/mmap.h>
#endif

#endif //NITRO_HW_MMAP_H_
