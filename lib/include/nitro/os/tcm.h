//
// Created by red031000 on 2020-05-05.
//

#ifndef NITRO_OS_TCM_H
#define NITRO_OS_TCM_H

#include <nitro/hw/consts.h>

u32 OS_GetDTCMAddress(void);

void DC_FlushAll(void);
void DC_InvalidateAll(void);
void DC_StoreAll(void);
void IC_InvalidateAll(void);
void DC_WaitWriteBufferEmpty(void);

#endif //NITRO_OS_TCM_H
