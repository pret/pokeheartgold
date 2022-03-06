#ifndef NITRO_IO_REG_H_
#define NITRO_IO_REG_H_

#include <nitro/hw/common/io_reg.h>

#ifdef SDK_ARM9
#include <nitro/hw/ARM9/io_reg.h>
#else
#include <nitro/hw/ARM7/io_reg.h>
#endif

#define REG_OS_IME_IME_SHIFT                               0
#define REG_OS_IME_IME_SIZE                                1
#define REG_OS_IME_IME_MASK                                0x0001

#define REG_INTF_OFFSET               (0x180)
#define REG_INTF_ADDR                 (HW_REG_BASE + REG_INTF_OFFSET)
#define reg_PXI_INTF                  (*(REGType16v *)REG_INTF_ADDR)

#define REG_FIFO_CNT_OFFSET           (0x184)
#define REG_FIFO_CNT_ADDR             (HW_REG_BASE + REG_FIFO_CNT_OFFSET)
#define reg_PXI_FIFO_CNT              (*(REGType16v *)REG_FIFO_CNT_ADDR)

#define REG_PXI_INTF_I_SHIFT                          14
#define REG_PXI_INTF_I_SIZE                           1
#define REG_PXI_INTF_I_MASK                           0x4000

#define REG_PXI_INTF_IREQ_SHIFT                       13
#define REG_PXI_INTF_IREQ_SIZE                        1
#define REG_PXI_INTF_IREQ_MASK                        0x2000

#define REG_PXI_INTF_A7STATUS_SHIFT                   8
#define REG_PXI_INTF_A7STATUS_SIZE                    4
#define REG_PXI_INTF_A7STATUS_MASK                    0x0f00

#define REG_PXI_INTF_A9STATUS_SHIFT                   0
#define REG_PXI_INTF_A9STATUS_SIZE                    4
#define REG_PXI_INTF_A9STATUS_MASK                    0x000f

#ifndef SDK_ASM
#define REG_PXI_INTF_FIELD( i, ireq, a7status, a9status ) \
    (u16)( \
    ((u32)(i) << REG_PXI_INTF_I_SHIFT) | \
    ((u32)(ireq) << REG_PXI_INTF_IREQ_SHIFT) | \
    ((u32)(a7status) << REG_PXI_INTF_A7STATUS_SHIFT) | \
    ((u32)(a9status) << REG_PXI_INTF_A9STATUS_SHIFT))
#endif

#define REG_PXI_FIFO_CNT_E_SHIFT                     15
#define REG_PXI_FIFO_CNT_E_SIZE                      1
#define REG_PXI_FIFO_CNT_E_MASK                      0x8000

#define REG_PXI_FIFO_CNT_ERR_SHIFT                   14
#define REG_PXI_FIFO_CNT_ERR_SIZE                    1
#define REG_PXI_FIFO_CNT_ERR_MASK                    0x4000

#define REG_PXI_FIFO_CNT_RECV_RI_SHIFT               10
#define REG_PXI_FIFO_CNT_RECV_RI_SIZE                1
#define REG_PXI_FIFO_CNT_RECV_RI_MASK                0x0400

#define REG_PXI_FIFO_CNT_RECV_FULL_SHIFT             9
#define REG_PXI_FIFO_CNT_RECV_FULL_SIZE              1
#define REG_PXI_FIFO_CNT_RECV_FULL_MASK              0x0200

#define REG_PXI_FIFO_CNT_RECV_EMP_SHIFT              8
#define REG_PXI_FIFO_CNT_RECV_EMP_SIZE               1
#define REG_PXI_FIFO_CNT_RECV_EMP_MASK               0x0100

#define REG_PXI_FIFO_CNT_SEND_CL_SHIFT               3
#define REG_PXI_FIFO_CNT_SEND_CL_SIZE                1
#define REG_PXI_FIFO_CNT_SEND_CL_MASK                0x0008

#define REG_PXI_FIFO_CNT_SEND_TI_SHIFT               2
#define REG_PXI_FIFO_CNT_SEND_TI_SIZE                1
#define REG_PXI_FIFO_CNT_SEND_TI_MASK                0x0004

#define REG_PXI_FIFO_CNT_SEND_FULL_SHIFT             1
#define REG_PXI_FIFO_CNT_SEND_FULL_SIZE              1
#define REG_PXI_FIFO_CNT_SEND_FULL_MASK              0x0002

#define REG_PXI_FIFO_CNT_SEND_EMP_SHIFT              0
#define REG_PXI_FIFO_CNT_SEND_EMP_SIZE               1
#define REG_PXI_FIFO_CNT_SEND_EMP_MASK               0x0001

#ifndef SDK_ASM
#define REG_PXI_FIFO_CNT_FIELD( e, err, recv_ri, recv_full, recv_emp, send_cl, send_ti, send_full, send_emp ) \
    (u16)( \
    ((u32)(e) << REG_PXI_FIFO_CNT_E_SHIFT) | \
    ((u32)(err) << REG_PXI_FIFO_CNT_ERR_SHIFT) | \
    ((u32)(recv_ri) << REG_PXI_FIFO_CNT_RECV_RI_SHIFT) | \
    ((u32)(recv_full) << REG_PXI_FIFO_CNT_RECV_FULL_SHIFT) | \
    ((u32)(recv_emp) << REG_PXI_FIFO_CNT_RECV_EMP_SHIFT) | \
    ((u32)(send_cl) << REG_PXI_FIFO_CNT_SEND_CL_SHIFT) | \
    ((u32)(send_ti) << REG_PXI_FIFO_CNT_SEND_TI_SHIFT) | \
    ((u32)(send_full) << REG_PXI_FIFO_CNT_SEND_FULL_SHIFT) | \
    ((u32)(send_emp) << REG_PXI_FIFO_CNT_SEND_EMP_SHIFT))
#endif

#define REG_G3_SWAP_BUFFERS_DP_SHIFT                       1
#define REG_G3_SWAP_BUFFERS_DP_SIZE                        1
#define REG_G3_SWAP_BUFFERS_DP_MASK                        0x00000002

#define REG_G3_SWAP_BUFFERS_XS_SHIFT                       0
#define REG_G3_SWAP_BUFFERS_XS_SIZE                        1
#define REG_G3_SWAP_BUFFERS_XS_MASK                        0x00000001
#define REG_G3_SWAP_BUFFERS_DP_SHIFT                       1
#define REG_G3_SWAP_BUFFERS_DP_SIZE                        1
#define REG_G3_SWAP_BUFFERS_DP_MASK                        0x00000002

#define REG_G3_SWAP_BUFFERS_XS_SHIFT                       0
#define REG_G3_SWAP_BUFFERS_XS_SIZE                        1
#define REG_G3_SWAP_BUFFERS_XS_MASK                        0x00000001

#ifndef SDK_ASM
#define REG_G3_SWAP_BUFFERS_FIELD( dp, xs ) \
    (u32)( \
    ((u32)(dp) << REG_G3_SWAP_BUFFERS_DP_SHIFT) | \
    ((u32)(xs) << REG_G3_SWAP_BUFFERS_XS_SHIFT))
#endif

#endif //NITRO_IO_REG_H_
