#ifndef NITRO_HW_ARM9_IO_REG_H_
#define NITRO_HW_ARM9_IO_REG_H_

#define REG_SUBPINTF_ADDR          0x4000180
#define reg_PXI_SUBPINTF           (*(REGType16v *)REG_SUBPINTF_ADDR)
#define reg_PXI_SUBP_FIFO_CNT      (*(REGType16v *)0x4000184)
#define reg_PXI_SEND_FIFO          (*(REGType32v *)0x4000188)

#define reg_PXI_RECV_FIFO          (*(REGType32v *)0x4100000)

#endif //NITRO_HW_ARM9_IO_REG_H_
