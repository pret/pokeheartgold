/*
 * NOTE:
 * This file is shared between ARM9 and ARM7
 * DO NOT PUT PROC SPECIFIC CODE IN HERE
 * Thank You!
 */

/*
 * DO NOT INCLUDE THIS FILE DIRECTLY
 * Include mmap.h from the specific proc's lib
 */

#ifndef POKEDIAMOND_MMAP_SHARED_H
#define POKEDIAMOND_MMAP_SHARED_H

#define HW_MAIN_MEM             0x02000000
#define HW_MAIN_MEM_SIZE        0x00400000
#define HW_MAIN_MEM_MAIN_SIZE   0x003E0000
#define HW_MAIN_MEM_SHARED_SIZE 0x00001000

#define HW_WRAM                 0x037F8000

#define HW_MAIN_MEM_SYSTEM      (HW_MAIN_MEM + 0x007ffc00)
#define HW_WM_BOOT_BUF          (HW_MAIN_MEM + 0x007ffc40)
#define HW_ARENA_INFO_BUF       (HW_MAIN_MEM + 0x007ffda0)
#define HW_CTRDG_LOCK_BUF       (HW_MAIN_MEM + 0x007fffe8)
#define HW_INIT_LOCK_BUF        (HW_MAIN_MEM + 0x007ffff0)
#define HW_MAIN_MEM_MAIN_END    (HW_MAIN_MEM + HW_MAIN_MEM_MAIN_SIZE)

#define HW_SVC_STACK_SIZE       0x00000040

#define HW_BUTTON_XY_BUF        (HW_MAIN_MEM + 0x007FFFA8)

#endif //POKEDIAMOND_MMAP_SHARED_H
