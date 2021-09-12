#ifndef NITRO_SUB_PXI_FIFO_H
#define NITRO_SUB_PXI_FIFO_H

#include "nitro/PXI_fifo_shared.h"

s32 PXI_SendWordByFifo(s32 fifotag, u32 data, BOOL err);
void PXI_SetFifoRecvCallback(s32 fifotag, PXIFifoCallback callback);

#endif //NITRO_SUB_PXI_FIFO_H
