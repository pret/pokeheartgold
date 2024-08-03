#ifndef NITRO_IO_REG_H_
#define NITRO_IO_REG_H_

#include <nitro/hw/mmap.h>
#include <nitro/hw/common/io_reg.h>

#ifdef SDK_ARM9
#include <nitro/hw/ARM9/io_reg.h>
#else
#include <nitro/hw/ARM7/io_reg.h>
#endif

#endif //NITRO_IO_REG_H_
