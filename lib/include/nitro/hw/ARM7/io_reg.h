#ifndef NITRO_HW_ARM7_IO_REG_H_
#define NITRO_HW_ARM7_IO_REG_H_

#define REG_MAINPINTF_OFFSET        0x180
#define REG_MAINPINTF_ADDR          (HW_REG_BASE + REG_MAINPINTF_OFFSET)
#define reg_PXI_MAINPINTF           (*( REGType16v *) REG_MAINPINTF_ADDR)

#define REG_MAINP_FIFO_CNT_OFFSET   (0x184)
#define REG_MAINP_FIFO_CNT_ADDR     (HW_REG_BASE + REG_MAINP_FIFO_CNT_OFFSET)
#define reg_PXI_MAINP_FIFO_CNT      (*(REGType16v *)REG_MAINP_FIFO_CNT_ADDR)

#define REG_SEND_FIFO_OFFSET                               0x188
#define REG_SEND_FIFO_ADDR                                 (HW_REG_BASE + REG_SEND_FIFO_OFFSET)
#define reg_PXI_SEND_FIFO                                  (*( REGType32v *) REG_SEND_FIFO_ADDR)

/* RECV_FIFO */

#define REG_RECV_FIFO_OFFSET                               0x100000
#define REG_RECV_FIFO_ADDR                                 (HW_REG_BASE + REG_RECV_FIFO_OFFSET)
#define reg_PXI_RECV_FIFO                                  (*( REGType32v *) REG_RECV_FIFO_ADDR)

#define REG_PXI_MAINPINTF_I_SHIFT                          14
#define REG_PXI_MAINPINTF_I_SIZE                           1
#define REG_PXI_MAINPINTF_I_MASK                           0x4000

#define REG_PXI_MAINPINTF_IREQ_SHIFT                       13
#define REG_PXI_MAINPINTF_IREQ_SIZE                        1
#define REG_PXI_MAINPINTF_IREQ_MASK                        0x2000

#define REG_PXI_MAINPINTF_A7STATUS_SHIFT                   8
#define REG_PXI_MAINPINTF_A7STATUS_SIZE                    4
#define REG_PXI_MAINPINTF_A7STATUS_MASK                    0x0f00

#define REG_PXI_MAINPINTF_A9STATUS_SHIFT                   0
#define REG_PXI_MAINPINTF_A9STATUS_SIZE                    4
#define REG_PXI_MAINPINTF_A9STATUS_MASK                    0x000f

#ifndef SDK_ASM
#define REG_PXI_MAINPINTF_FIELD( i, ireq, a7status, a9status ) \
    (u16)( \
    ((u32)(i) << REG_PXI_MAINPINTF_I_SHIFT) | \
    ((u32)(ireq) << REG_PXI_MAINPINTF_IREQ_SHIFT) | \
    ((u32)(a7status) << REG_PXI_MAINPINTF_A7STATUS_SHIFT) | \
    ((u32)(a9status) << REG_PXI_MAINPINTF_A9STATUS_SHIFT))
#endif

#define REG_PXI_MAINP_FIFO_CNT_E_SHIFT                     15
#define REG_PXI_MAINP_FIFO_CNT_E_SIZE                      1
#define REG_PXI_MAINP_FIFO_CNT_E_MASK                      0x8000

#define REG_PXI_MAINP_FIFO_CNT_ERR_SHIFT                   14
#define REG_PXI_MAINP_FIFO_CNT_ERR_SIZE                    1
#define REG_PXI_MAINP_FIFO_CNT_ERR_MASK                    0x4000

#define REG_PXI_MAINP_FIFO_CNT_RECV_RI_SHIFT               10
#define REG_PXI_MAINP_FIFO_CNT_RECV_RI_SIZE                1
#define REG_PXI_MAINP_FIFO_CNT_RECV_RI_MASK                0x0400

#define REG_PXI_MAINP_FIFO_CNT_RECV_FULL_SHIFT             9
#define REG_PXI_MAINP_FIFO_CNT_RECV_FULL_SIZE              1
#define REG_PXI_MAINP_FIFO_CNT_RECV_FULL_MASK              0x0200

#define REG_PXI_MAINP_FIFO_CNT_RECV_EMP_SHIFT              8
#define REG_PXI_MAINP_FIFO_CNT_RECV_EMP_SIZE               1
#define REG_PXI_MAINP_FIFO_CNT_RECV_EMP_MASK               0x0100

#define REG_PXI_MAINP_FIFO_CNT_SEND_CL_SHIFT               3
#define REG_PXI_MAINP_FIFO_CNT_SEND_CL_SIZE                1
#define REG_PXI_MAINP_FIFO_CNT_SEND_CL_MASK                0x0008

#define REG_PXI_MAINP_FIFO_CNT_SEND_TI_SHIFT               2
#define REG_PXI_MAINP_FIFO_CNT_SEND_TI_SIZE                1
#define REG_PXI_MAINP_FIFO_CNT_SEND_TI_MASK                0x0004

#define REG_PXI_MAINP_FIFO_CNT_SEND_FULL_SHIFT             1
#define REG_PXI_MAINP_FIFO_CNT_SEND_FULL_SIZE              1
#define REG_PXI_MAINP_FIFO_CNT_SEND_FULL_MASK              0x0002

#define REG_PXI_MAINP_FIFO_CNT_SEND_EMP_SHIFT              0
#define REG_PXI_MAINP_FIFO_CNT_SEND_EMP_SIZE               1
#define REG_PXI_MAINP_FIFO_CNT_SEND_EMP_MASK               0x0001

#ifndef SDK_ASM
#define REG_PXI_MAINP_FIFO_CNT_FIELD( e, err, recv_ri, recv_full, recv_emp, send_cl, send_ti, send_full, send_emp ) \
    (u16)( \
    ((u32)(e) << REG_PXI_MAINP_FIFO_CNT_E_SHIFT) | \
    ((u32)(err) << REG_PXI_MAINP_FIFO_CNT_ERR_SHIFT) | \
    ((u32)(recv_ri) << REG_PXI_MAINP_FIFO_CNT_RECV_RI_SHIFT) | \
    ((u32)(recv_full) << REG_PXI_MAINP_FIFO_CNT_RECV_FULL_SHIFT) | \
    ((u32)(recv_emp) << REG_PXI_MAINP_FIFO_CNT_RECV_EMP_SHIFT) | \
    ((u32)(send_cl) << REG_PXI_MAINP_FIFO_CNT_SEND_CL_SHIFT) | \
    ((u32)(send_ti) << REG_PXI_MAINP_FIFO_CNT_SEND_TI_SHIFT) | \
    ((u32)(send_full) << REG_PXI_MAINP_FIFO_CNT_SEND_FULL_SHIFT) | \
    ((u32)(send_emp) << REG_PXI_MAINP_FIFO_CNT_SEND_EMP_SHIFT))
#endif


#define REG_RCNT0_L_OFFSET                    0x134
#define REG_RCNT0_L_ADDR                      (HW_REG_BASE + REG_RCNT0_L_OFFSET)
#define reg_EXI_RCNT0_L                       (*(REGType16v *)REG_RCNT0_L_ADDR)

#define REG_RCNT0_H_OFFSET                    0x136
#define REG_RCNT0_H_ADDR                      (HW_REG_BASE + REG_RCNT0_H_OFFSET)
#define reg_EXI_RCNT0_H                       (*(REGType16v *)REG_RCNT0_H_ADDR)

#define REG_EXI_RCNT0_L_RE1_SHIFT                          15
#define REG_EXI_RCNT0_L_RE1_SIZE                           1
#define REG_EXI_RCNT0_L_RE1_MASK                           0x8000

#define REG_EXI_RCNT0_L_RE0_SHIFT                          14
#define REG_EXI_RCNT0_L_RE0_SIZE                           1
#define REG_EXI_RCNT0_L_RE0_MASK                           0x4000

#define REG_EXI_RCNT0_L_I_SHIFT                            8
#define REG_EXI_RCNT0_L_I_SIZE                             1
#define REG_EXI_RCNT0_L_I_MASK                             0x0100

#define REG_EXI_RCNT0_L_DIR_SO_SHIFT                       7
#define REG_EXI_RCNT0_L_DIR_SO_SIZE                        1
#define REG_EXI_RCNT0_L_DIR_SO_MASK                        0x0080

#define REG_EXI_RCNT0_L_DIR_SI_SHIFT                       6
#define REG_EXI_RCNT0_L_DIR_SI_SIZE                        1
#define REG_EXI_RCNT0_L_DIR_SI_MASK                        0x0040

#define REG_EXI_RCNT0_L_DIR_SD_SHIFT                       5
#define REG_EXI_RCNT0_L_DIR_SD_SIZE                        1
#define REG_EXI_RCNT0_L_DIR_SD_MASK                        0x0020

#define REG_EXI_RCNT0_L_DIR_SC_SHIFT                       4
#define REG_EXI_RCNT0_L_DIR_SC_SIZE                        1
#define REG_EXI_RCNT0_L_DIR_SC_MASK                        0x0010

#define REG_EXI_RCNT0_L_DATA_SO_SHIFT                      3
#define REG_EXI_RCNT0_L_DATA_SO_SIZE                       1
#define REG_EXI_RCNT0_L_DATA_SO_MASK                       0x0008

#define REG_EXI_RCNT0_L_DATA_SI_SHIFT                      2
#define REG_EXI_RCNT0_L_DATA_SI_SIZE                       1
#define REG_EXI_RCNT0_L_DATA_SI_MASK                       0x0004

#define REG_EXI_RCNT0_L_DATA_SD_SHIFT                      1
#define REG_EXI_RCNT0_L_DATA_SD_SIZE                       1
#define REG_EXI_RCNT0_L_DATA_SD_MASK                       0x0002

#define REG_EXI_RCNT0_L_DATA_SC_SHIFT                      0
#define REG_EXI_RCNT0_L_DATA_SC_SIZE                       1
#define REG_EXI_RCNT0_L_DATA_SC_MASK                       0x0001

#ifndef SDK_ASM
#define REG_EXI_RCNT0_L_FIELD( re1, re0, i, dir_so, dir_si, dir_sd, dir_sc, data_so, data_si, data_sd, data_sc ) \
    (u16)( \
    ((u32)(re1) << REG_EXI_RCNT0_L_RE1_SHIFT) | \
    ((u32)(re0) << REG_EXI_RCNT0_L_RE0_SHIFT) | \
    ((u32)(i) << REG_EXI_RCNT0_L_I_SHIFT) | \
    ((u32)(dir_so) << REG_EXI_RCNT0_L_DIR_SO_SHIFT) | \
    ((u32)(dir_si) << REG_EXI_RCNT0_L_DIR_SI_SHIFT) | \
    ((u32)(dir_sd) << REG_EXI_RCNT0_L_DIR_SD_SHIFT) | \
    ((u32)(dir_sc) << REG_EXI_RCNT0_L_DIR_SC_SHIFT) | \
    ((u32)(data_so) << REG_EXI_RCNT0_L_DATA_SO_SHIFT) | \
    ((u32)(data_si) << REG_EXI_RCNT0_L_DATA_SI_SHIFT) | \
    ((u32)(data_sd) << REG_EXI_RCNT0_L_DATA_SD_SHIFT) | \
    ((u32)(data_sc) << REG_EXI_RCNT0_L_DATA_SC_SHIFT))
#endif

#define REG_EXI_RCNT0_H_DATA_R7_SHIFT                      7
#define REG_EXI_RCNT0_H_DATA_R7_SIZE                       1
#define REG_EXI_RCNT0_H_DATA_R7_MASK                       0x0080

#define REG_EXI_RCNT0_H_DATA_R6_SHIFT                      6
#define REG_EXI_RCNT0_H_DATA_R6_SIZE                       1
#define REG_EXI_RCNT0_H_DATA_R6_MASK                       0x0040

#define REG_EXI_RCNT0_H_DATA_R5_SHIFT                      5
#define REG_EXI_RCNT0_H_DATA_R5_SIZE                       1
#define REG_EXI_RCNT0_H_DATA_R5_MASK                       0x0020

#define REG_EXI_RCNT0_H_DATA_R4_SHIFT                      4
#define REG_EXI_RCNT0_H_DATA_R4_SIZE                       1
#define REG_EXI_RCNT0_H_DATA_R4_MASK                       0x0010

#define REG_EXI_RCNT0_H_DATA_R3_SHIFT                      3
#define REG_EXI_RCNT0_H_DATA_R3_SIZE                       1
#define REG_EXI_RCNT0_H_DATA_R3_MASK                       0x0008

#define REG_EXI_RCNT0_H_DATA_R2_SHIFT                      2
#define REG_EXI_RCNT0_H_DATA_R2_SIZE                       1
#define REG_EXI_RCNT0_H_DATA_R2_MASK                       0x0004

#define REG_EXI_RCNT0_H_DATA_R1_SHIFT                      1
#define REG_EXI_RCNT0_H_DATA_R1_SIZE                       1
#define REG_EXI_RCNT0_H_DATA_R1_MASK                       0x0002

#define REG_EXI_RCNT0_H_DATA_R0_SHIFT                      0
#define REG_EXI_RCNT0_H_DATA_R0_SIZE                       1
#define REG_EXI_RCNT0_H_DATA_R0_MASK                       0x0001

#ifndef SDK_ASM
#define REG_EXI_RCNT0_H_FIELD( data_r7, data_r6, data_r5, data_r4, data_r3, data_r2, data_r1, data_r0 ) \
    (u16)( \
    ((u32)(data_r7) << REG_EXI_RCNT0_H_DATA_R7_SHIFT) | \
    ((u32)(data_r6) << REG_EXI_RCNT0_H_DATA_R6_SHIFT) | \
    ((u32)(data_r5) << REG_EXI_RCNT0_H_DATA_R5_SHIFT) | \
    ((u32)(data_r4) << REG_EXI_RCNT0_H_DATA_R4_SHIFT) | \
    ((u32)(data_r3) << REG_EXI_RCNT0_H_DATA_R3_SHIFT) | \
    ((u32)(data_r2) << REG_EXI_RCNT0_H_DATA_R2_SHIFT) | \
    ((u32)(data_r1) << REG_EXI_RCNT0_H_DATA_R1_SHIFT) | \
    ((u32)(data_r0) << REG_EXI_RCNT0_H_DATA_R0_SHIFT))
#endif

#endif //NITRO_HW_ARM7_IO_REG_H_
