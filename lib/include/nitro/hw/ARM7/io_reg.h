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

/* POWCNT */

#define REG_POWCNT_OFFSET                                  0x304
#define REG_POWCNT_ADDR                                    (HW_REG_BASE + REG_POWCNT_OFFSET)
#define reg_SND_POWCNT                                     (*( REGType16v *) REG_POWCNT_ADDR)

/* SOUND0CNT */

#define REG_SOUND0CNT_OFFSET                               0x400
#define REG_SOUND0CNT_ADDR                                 (HW_REG_BASE + REG_SOUND0CNT_OFFSET)
#define reg_SND_SOUND0CNT                                  (*( REGType32v *) REG_SOUND0CNT_ADDR)

/* SOUND0CNT_VOL_16 */

#define REG_SOUND0CNT_VOL_16_OFFSET                        0x400
#define REG_SOUND0CNT_VOL_16_ADDR                          (HW_REG_BASE + REG_SOUND0CNT_VOL_16_OFFSET)
#define reg_SND_SOUND0CNT_VOL_16                           (*( REGType16v *) REG_SOUND0CNT_VOL_16_ADDR)

/* SOUND0CNT_VOL */

#define REG_SOUND0CNT_VOL_OFFSET                           0x400
#define REG_SOUND0CNT_VOL_ADDR                             (HW_REG_BASE + REG_SOUND0CNT_VOL_OFFSET)
#define reg_SND_SOUND0CNT_VOL                              (*( REGType8v *) REG_SOUND0CNT_VOL_ADDR)

/* SOUND0CNT_PAN */

#define REG_SOUND0CNT_PAN_OFFSET                           0x402
#define REG_SOUND0CNT_PAN_ADDR                             (HW_REG_BASE + REG_SOUND0CNT_PAN_OFFSET)
#define reg_SND_SOUND0CNT_PAN                              (*( REGType8v *) REG_SOUND0CNT_PAN_ADDR)

/* SOUND0CNT_8 */

#define REG_SOUND0CNT_8_OFFSET                             0x403
#define REG_SOUND0CNT_8_ADDR                               (HW_REG_BASE + REG_SOUND0CNT_8_OFFSET)
#define reg_SND_SOUND0CNT_8                                (*( REGType8v *) REG_SOUND0CNT_8_ADDR)

/* SOUND0SAD */

#define REG_SOUND0SAD_OFFSET                               0x404
#define REG_SOUND0SAD_ADDR                                 (HW_REG_BASE + REG_SOUND0SAD_OFFSET)
#define reg_SND_SOUND0SAD                                  (*( REGType32v *) REG_SOUND0SAD_ADDR)

/* SOUND0TMR */

#define REG_SOUND0TMR_OFFSET                               0x408
#define REG_SOUND0TMR_ADDR                                 (HW_REG_BASE + REG_SOUND0TMR_OFFSET)
#define reg_SND_SOUND0TMR                                  (*( REGType16v *) REG_SOUND0TMR_ADDR)

/* SOUND0RPT_PT */

#define REG_SOUND0RPT_PT_OFFSET                            0x40a
#define REG_SOUND0RPT_PT_ADDR                              (HW_REG_BASE + REG_SOUND0RPT_PT_OFFSET)
#define reg_SND_SOUND0RPT_PT                               (*( REGType16v *) REG_SOUND0RPT_PT_ADDR)

/* SOUND0RPT_LEN */

#define REG_SOUND0RPT_LEN_OFFSET                           0x40c
#define REG_SOUND0RPT_LEN_ADDR                             (HW_REG_BASE + REG_SOUND0RPT_LEN_OFFSET)
#define reg_SND_SOUND0RPT_LEN                              (*( REGType32v *) REG_SOUND0RPT_LEN_ADDR)

/* SOUNDCNT */

#define REG_SOUNDCNT_OFFSET                                0x500
#define REG_SOUNDCNT_ADDR                                  (HW_REG_BASE + REG_SOUNDCNT_OFFSET)
#define reg_SND_SOUNDCNT                                   (*( REGType16v *) REG_SOUNDCNT_ADDR)

/* SOUNDCNT_8 */

#define REG_SOUNDCNT_8_OFFSET                              0x501
#define REG_SOUNDCNT_8_ADDR                                (HW_REG_BASE + REG_SOUNDCNT_8_OFFSET)
#define reg_SND_SOUNDCNT_8                                 (*( REGType8v *) REG_SOUNDCNT_8_ADDR)

/* SOUNDCNT_VOL */

#define REG_SOUNDCNT_VOL_OFFSET                            0x500
#define REG_SOUNDCNT_VOL_ADDR                              (HW_REG_BASE + REG_SOUNDCNT_VOL_OFFSET)
#define reg_SND_SOUNDCNT_VOL                               (*( REGType8v *) REG_SOUNDCNT_VOL_ADDR)

/* SNDCAP0CNT */

#define REG_SNDCAP0CNT_OFFSET                              0x508
#define REG_SNDCAP0CNT_ADDR                                (HW_REG_BASE + REG_SNDCAP0CNT_OFFSET)
#define reg_SND_SNDCAP0CNT                                 (*( REGType8v *) REG_SNDCAP0CNT_ADDR)

/* SNDCAP1CNT */

#define REG_SNDCAP1CNT_OFFSET                              0x509
#define REG_SNDCAP1CNT_ADDR                                (HW_REG_BASE + REG_SNDCAP1CNT_OFFSET)
#define reg_SND_SNDCAP1CNT                                 (*( REGType8v *) REG_SNDCAP1CNT_ADDR)

#define reg_SOUNDxCNT_VOL(x)    (*(REGType8v *)(0x4000400 + ((int)(x) * 0x10)))
#define reg_SOUNDxCNT_VOLS(x)   (*(REGType16v *)(0x4000400 + ((int)(x) * 0x10)))
#define reg_SOUNDxCNT_PAN(x)    (*(REGType8v *)(0x4000402 + ((int)(x) * 0x10)))
#define reg_SOUNDxCNT_STAT(x)   (*(REGType8v *)(0x4000403 + ((int)(x) * 0x10)))
#define reg_SOUNDxCNT(x)        (*(REGType32v *)(0x4000400 + ((int)x) * 0x10))
#define reg_SOUNDoffCNT(off)    (*(REGType32v *)(0x4000400 + (int)(off)))
#define reg_SOUNDxSAD(x)        (*(REGType32v *)(0x4000404 + ((int)x) * 0x10))
#define reg_SOUNDoffSAD(off)    (*(REGType32v *)(0x4000404 + (int)(off)))
#define reg_SOUNDxTMR(x)        (*(REGType16v *)(0x4000408 + ((int)x) * 0x10))
#define reg_SOUNDoffTMR(off)    (*(REGType16v *)(0x4000408 + (int)(off)))
#define reg_SOUNDxPNT(x)        (*(REGType16v *)(0x400040A + ((int)x) * 0x10))
#define reg_SOUNDoffPNT(off)    (*(REGType16v *)(0x400040A + (int)(off)))
#define reg_SOUNDxLEN(x)        (*(REGType32v *)(0x400040C + ((int)x) * 0x10))
#define reg_SOUNDoffLEN(off)    (*(REGType32v *)(0x400040C + (int)(off)))


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

/* POWCNT */

#define REG_SND_POWCNT_EWL_SHIFT                           1
#define REG_SND_POWCNT_EWL_SIZE                            1
#define REG_SND_POWCNT_EWL_MASK                            0x0002

#define REG_SND_POWCNT_SPE_SHIFT                           0
#define REG_SND_POWCNT_SPE_SIZE                            1
#define REG_SND_POWCNT_SPE_MASK                            0x0001

#ifndef SDK_ASM
#define REG_SND_POWCNT_FIELD( ewl, spe ) \
    (u16)( \
    ((u32)(ewl) << REG_SND_POWCNT_EWL_SHIFT) | \
    ((u32)(spe) << REG_SND_POWCNT_SPE_SHIFT))
#endif

/* SOUND0CNT */

#define REG_SND_SOUND0CNT_E_SHIFT                          31
#define REG_SND_SOUND0CNT_E_SIZE                           1
#define REG_SND_SOUND0CNT_E_MASK                           0x80000000

#define REG_SND_SOUND0CNT_FORMAT_SHIFT                     29
#define REG_SND_SOUND0CNT_FORMAT_SIZE                      2
#define REG_SND_SOUND0CNT_FORMAT_MASK                      0x60000000

#define REG_SND_SOUND0CNT_REPEAT_SHIFT                     27
#define REG_SND_SOUND0CNT_REPEAT_SIZE                      2
#define REG_SND_SOUND0CNT_REPEAT_MASK                      0x18000000

#define REG_SND_SOUND0CNT_DUTY_SHIFT                       24
#define REG_SND_SOUND0CNT_DUTY_SIZE                        3
#define REG_SND_SOUND0CNT_DUTY_MASK                        0x07000000

#define REG_SND_SOUND0CNT_PAN_SHIFT                        16
#define REG_SND_SOUND0CNT_PAN_SIZE                         7
#define REG_SND_SOUND0CNT_PAN_MASK                         0x007f0000

#define REG_SND_SOUND0CNT_HOLD_SHIFT                       15
#define REG_SND_SOUND0CNT_HOLD_SIZE                        1
#define REG_SND_SOUND0CNT_HOLD_MASK                        0x00008000

#define REG_SND_SOUND0CNT_SHIFT_SHIFT                      8
#define REG_SND_SOUND0CNT_SHIFT_SIZE                       2
#define REG_SND_SOUND0CNT_SHIFT_MASK                       0x00000300

#define REG_SND_SOUND0CNT_VOLUME_SHIFT                     0
#define REG_SND_SOUND0CNT_VOLUME_SIZE                      7
#define REG_SND_SOUND0CNT_VOLUME_MASK                      0x0000007f

#ifndef SDK_ASM
#define REG_SND_SOUND0CNT_FIELD( e, format, repeat, duty, pan, hold, shift, volume ) \
    (u32)( \
    ((u32)(e) << REG_SND_SOUND0CNT_E_SHIFT) | \
    ((u32)(format) << REG_SND_SOUND0CNT_FORMAT_SHIFT) | \
    ((u32)(repeat) << REG_SND_SOUND0CNT_REPEAT_SHIFT) | \
    ((u32)(duty) << REG_SND_SOUND0CNT_DUTY_SHIFT) | \
    ((u32)(pan) << REG_SND_SOUND0CNT_PAN_SHIFT) | \
    ((u32)(hold) << REG_SND_SOUND0CNT_HOLD_SHIFT) | \
    ((u32)(shift) << REG_SND_SOUND0CNT_SHIFT_SHIFT) | \
    ((u32)(volume) << REG_SND_SOUND0CNT_VOLUME_SHIFT))
#endif

/* SOUNDCNT_8 */

#define REG_SND_SOUNDCNT_8_E_SHIFT                         7
#define REG_SND_SOUNDCNT_8_E_SIZE                          1
#define REG_SND_SOUNDCNT_8_E_MASK                          0x80

#define REG_SND_SOUNDCNT_8_MIX_CH3_SHIFT                   5
#define REG_SND_SOUNDCNT_8_MIX_CH3_SIZE                    1
#define REG_SND_SOUNDCNT_8_MIX_CH3_MASK                    0x20

#define REG_SND_SOUNDCNT_8_MIX_CH1_SHIFT                   4
#define REG_SND_SOUNDCNT_8_MIX_CH1_SIZE                    1
#define REG_SND_SOUNDCNT_8_MIX_CH1_MASK                    0x10

#define REG_SND_SOUNDCNT_8_ROUT_SHIFT                      2
#define REG_SND_SOUNDCNT_8_ROUT_SIZE                       2
#define REG_SND_SOUNDCNT_8_ROUT_MASK                       0x0c

#define REG_SND_SOUNDCNT_8_LOUT_SHIFT                      0
#define REG_SND_SOUNDCNT_8_LOUT_SIZE                       2
#define REG_SND_SOUNDCNT_8_LOUT_MASK                       0x03

#ifndef SDK_ASM
#define REG_SND_SOUNDCNT_8_FIELD( e, mix_ch3, mix_ch1, rout, lout ) \
    (u8)( \
    ((u32)(e) << REG_SND_SOUNDCNT_8_E_SHIFT) | \
    ((u32)(mix_ch3) << REG_SND_SOUNDCNT_8_MIX_CH3_SHIFT) | \
    ((u32)(mix_ch1) << REG_SND_SOUNDCNT_8_MIX_CH1_SHIFT) | \
    ((u32)(rout) << REG_SND_SOUNDCNT_8_ROUT_SHIFT) | \
    ((u32)(lout) << REG_SND_SOUNDCNT_8_LOUT_SHIFT))
#endif

#endif //NITRO_HW_ARM7_IO_REG_H_
