/*
 * NOTE:
 * This file is shared between ARM9 and ARM7
 * DO NOT PUT PROC SPECIFIC CODE IN HERE
 * Thank You!
 */

/*
 * DO NOT INCLUDE THIS FILE DIRECTLY
 * Include PXI_fifo.h from the specific proc's lib
 */

#ifndef NITRO_PXI_FIFO_SHARED_H_
#define NITRO_PXI_FIFO_SHARED_H_

typedef enum
{
    PXI_PROC_ARM9 = 0,
    PXI_PROC_ARM7 = 1
} PXIProc;

typedef enum {
    PXI_FIFO_TAG_EX = 0,               // Extension format
    PXI_FIFO_TAG_USER_0,               // for application programmer, use it in free
    PXI_FIFO_TAG_USER_1,               // for application programmer, use it in free
    PXI_FIFO_TAG_SYSTEM,               // SDK inner usage
    PXI_FIFO_TAG_NVRAM,                // NVRAM
    PXI_FIFO_TAG_RTC,                  // RTC
    PXI_FIFO_TAG_TOUCHPANEL,           // Touch Panel
    PXI_FIFO_TAG_SOUND,                // Sound
    PXI_FIFO_TAG_PM,                   // Power Management
    PXI_FIFO_TAG_MIC,                  // Microphone
    PXI_FIFO_TAG_WM,                   // Wireless Manager
    PXI_FIFO_TAG_FS,                   // File System
    PXI_FIFO_TAG_OS,                   // OS
    PXI_FIFO_TAG_CTRDG,                // Cartridge
    PXI_FIFO_TAG_CARD,                 // Card
    PXI_FIFO_TAG_WVR,                  // Control driving wireless library
    PXI_FIFO_TAG_CTRDG_Ex,             // Cartridge Ex
    PXI_MAX_FIFO_TAG = 32              // MAX FIFO TAG
} PXIFifoTag;

#endif //NITRO_PXI_FIFO_SHARED_H_
