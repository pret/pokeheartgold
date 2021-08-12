#ifndef NITRO_PXI_FIFO_H_
#define NITRO_PXI_FIFO_H_

#include <nitro/pxi/fifo_shared.h>

typedef enum
{
    PXI_FIFO_SUCCESS = 0,
    PXI_FIFO_FAIL_SEND_ERR = -1,
    PXI_FIFO_FAIL_SEND_FULL = -2,
    PXI_FIFO_FAIL_RECV_ERR = -3,
    PXI_FIFO_FAIL_RECV_EMPTY = -4,
    PXI_FIFO_NO_CALLBACK_ENTRY = -5
} PXIFifoStatus;

typedef void (*PXIFifoCallback) (PXIFifoTag tag, u32 data, BOOL err);

typedef union
{
    struct
    {
        u32 tag:5;
        u32 err:1;
        u32 data:26;
    } e;
    u32 raw;
} PXIFifoMessage;

void PXI_InitFifo(void);
void PXI_SetFifoRecvCallback(s32 fifotag, PXIFifoCallback callback);
BOOL PXI_IsCallbackReady(s32 fifotag, PXIProc proc);
s32 PXI_SendWordByFifo(s32 fifotag, u32 data, BOOL err);
void PXIi_HandlerRecvFifoNotEmpty(void);

#endif //NITRO_PXI_FIFO_H_
