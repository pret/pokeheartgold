/*
 * NOTE:
 * This file is shared between ARM9 and ARM7
 * DO NOT PUT PROC SPECIFIC CODE IN HERE
 * Thank You!
 */

/*
 * DO NOT INCLUDE THIS FILE DIRECTLY
 * Include OS_reset.h from the specific proc's lib
 */

#ifndef NITRO_OS_RESET_SHARED_H
#define NITRO_OS_RESET_SHARED_H

#define OS_PXI_COMMAND_MASK 0x7f00
#define OS_PXI_COMMAND_SHIFT 8
#define OS_PXI_COMMAND_RESET 0x10

#define OS_PXI_DATA_MASK    0xFF
#define OS_PXI_DATA_SHIFT      0

#endif //NITRO_OS_RESET_SHARED_H
