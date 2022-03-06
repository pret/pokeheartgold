/*
 * NOTE:
 * This file is shared between ARM9 and ARM7
 * DO NOT PUT PROC SPECIFIC CODE IN HERE
 * Thank You!
 */

#ifndef NITRO_HW_IO_REG_SHARED_H_
#define NITRO_HW_IO_REG_SHARED_H_

#define HW_REG_BASE                0x04000000

#define REG_TM0CNT_L_OFFSET        0x100
#define REG_TM0CNT_L_ADDR          (HW_REG_BASE + REG_TM0CNT_L_OFFSET)
#define reg_OS_TM0CNT_L            (*(REGType16v *)REG_TM0CNT_L_ADDR)

#define REG_TM0CNT_H_OFFSET        0x102
#define REG_TM0CNT_H_ADDR          (HW_REG_BASE + REG_TM0CNT_H_OFFSET)
#define reg_OS_TM0CNT_H            (*(REGType16v *)REG_TM0CNT_H_ADDR)

#define REG_TM1CNT_L_OFFSET        0x104
#define REG_TM1CNT_L_ADDR          (HW_REG_BASE + REG_TM1CNT_L_OFFSET)
#define reg_OS_TM1CNT_L            (*(REGType16v *)REG_TM1CNT_L_ADDR)

#define REG_TM1CNT_H_OFFSET        0x106
#define REG_TM1CNT_H_ADDR          (HW_REG_BASE + REG_TM1CNT_H_OFFSET)
#define reg_OS_TM1CNT_H            (*(REGType16v *)REG_TM1CNT_H_ADDR)

#define REG_TM2CNT_L_OFFSET        0x108
#define REG_TM2CNT_L_ADDR          (HW_REG_BASE + REG_TM2CNT_L_OFFSET)
#define reg_OS_TM2CNT_L            (*(REGType16v *)REG_TM2CNT_L_ADDR)

#define REG_TM2CNT_H_OFFSET        0x10A
#define REG_TM2CNT_H_ADDR          (HW_REG_BASE + REG_TM2CNT_H_OFFSET)
#define reg_OS_TM2CNT_H            (*(REGType16v *)REG_TM2CNT_H_ADDR)

#define REG_TM3CNT_L_OFFSET        0x10C
#define REG_TM3CNT_L_ADDR          (HW_REG_BASE + REG_TM3CNT_L_OFFSET)
#define reg_OS_TM3CNT_L            (*(REGType16v *)REG_TM3CNT_L_ADDR)

#define REG_TM3CNT_H_OFFSET        0x10E
#define REG_TM3CNT_H_ADDR          (HW_REG_BASE + REG_TM3CNT_H_OFFSET)
#define reg_OS_TM3CNT_H            (*(REGType16v *)REG_TM3CNT_H_ADDR)

#define REG_IE_OFFSET              0x210
#define REG_IE_ADDR                (HW_REG_BASE + REG_IE_OFFSET)
#define reg_OS_IE                  (*(REGType32v *)REG_IE_ADDR)

#define REG_IME_OFFSET             0x208
#define REG_IME_ADDR               (HW_REG_BASE + REG_IME_OFFSET)
#define reg_OS_IME                 (*(REGType16v *)REG_IME_ADDR)

#define REG_IF_OFFSET              0x214
#define REG_IF_ADDR                (HW_REG_BASE + REG_IF_OFFSET)
#define reg_OS_IF                  (*(REGType32v *)REG_IF_ADDR)

#ifdef SDK_ARM7
#define REG_MAINPINTF_OFFSET       0x180
#define REG_MAINPINTF_ADDR         (HW_REG_BASE + REG_MAINPINTF_OFFSET)
#define reg_OS_MAININTF            (*(REGType16v *)REG_MAINPINTF_ADDR)
#else
#define REG_SUBINTF_OFFSET         0x180
#define REG_SUBINTF_ADDR           (HW_REG_BASE + REG_SUBINTF_OFFSET)
#define reg_OS_SUBINTF             (*(REGType16v *)REG_SUBINTF_ADDR)
#endif //SDK_ARM7

#define REG_OS_TM0CNT_H_PS_SHIFT                           0

#define REG_VCOUNT_OFFSET          0x6

#define reg_GX_DISPCNT             (*(REGType32v *)0x4000000)
#define reg_GX_DISPSTAT            (*(REGType16v *)0x4000004)
#define reg_GX_VCOUNT              (*(REGType16v *)(HW_REG_BASE + REG_VCOUNT_OFFSET))

#define reg_G2_BG0CNT              (*(REGType16v *)0x4000008)
#define reg_G2_BG1CNT              (*(REGType16v *)0x400000a)
#define reg_G2_BG2CNT              (*(REGType16v *)0x400000c)
#define reg_G2_BG3CNT              (*(REGType16v *)0x400000e)
#define reg_G2_BG0OFS              (*(REGType32v *)0x4000010)
#define reg_G2_BG0HOFS             (*(REGType16v *)0x4000010)
#define reg_G2_BG0VOFS             (*(REGType16v *)0x4000012)
#define reg_G2_BG1OFS              (*(REGType32v *)0x4000014)
#define reg_G2_BG1HOFS             (*(REGType16v *)0x4000014)
#define reg_G2_BG1VOFS             (*(REGType16v *)0x4000016)
#define reg_G2_BG2OFS              (*(REGType32v *)0x4000018)
#define reg_G2_BG2HOFS             (*(REGType16v *)0x4000018)
#define reg_G2_BG2VOFS             (*(REGType16v *)0x400001a)
#define reg_G2_BG3OFS              (*(REGType32v *)0x400001c)
#define reg_G2_BG3HOFS             (*(REGType16v *)0x400001c)
#define reg_G2_BG3VOFS             (*(REGType16v *)0x400001e)
#define reg_G2_BG2PA               (*(REGType16v *)0x4000020)
#define reg_G2_BG2PB               (*(REGType16v *)0x4000022)
#define reg_G2_BG2PC               (*(REGType16v *)0x4000024)
#define reg_G2_BG2PD               (*(REGType16v *)0x4000026)
#define reg_G2_BG2X                (*(REGType32v *)0x4000028)
#define reg_G2_BG2Y                (*(REGType32v *)0x400002c)
#define reg_G2_BG3PA               (*(REGType16v *)0x4000030)
#define reg_G2_BG3PB               (*(REGType16v *)0x4000032)
#define reg_G2_BG3PC               (*(REGType16v *)0x4000034)
#define reg_G2_BG3PD               (*(REGType16v *)0x4000036)
#define reg_G2_BG3X                (*(REGType32v *)0x4000038)
#define reg_G2_BG3Y                (*(REGType32v *)0x400003c)
#define reg_G2_WIN0H               (*(REGType16v *)0x4000040)
#define reg_G2_WIN1H               (*(REGType16v *)0x4000042)
#define reg_G2_WIN0V               (*(REGType16v *)0x4000044)
#define reg_G2_WIN1V               (*(REGType16v *)0x4000046)
#define reg_G2_WININ               (*(REGType16v *)0x4000048)
#define reg_G2_WINOUT              (*(REGType16v *)0x400004a)
#define reg_G2_MOSAIC              (*(REGType16v *)0x400004c)
#define reg_G2_BLDCNT              (*(REGType16v *)0x4000050)
#define reg_G2_BLDALPHA            (*(REGType16v *)0x4000052)
#define reg_G2_BLDY                (*(REGType16v *)0x4000054)

#define reg_G3X_DISP3DCNT          (*(REGType16v *)0x4000060)

#define reg_GX_DISPCAPCNT          (*(REGType32v *)0x4000064)
#define reg_GX_DISP_MMEM_FIFO      (*(REGType32v *)0x4000068)
#define reg_GX_DISP_MMEM_FIFO_L    (*(REGType16v *)0x4000068)
#define reg_GX_DISP_MMEM_FIFO_H    (*(REGType16v *)0x400006a)
#define reg_GX_MASTER_BRIGHT       (*(REGType16v *)0x400006c)
#define reg_GX_TVOUTCNT            (*(REGType16v *)0x4000070)

#define reg_MI_DMA0SAD             (*(REGType32v *)0x40000b0)
#define reg_MI_DMA0DAD             (*(REGType32v *)0x40000b4)
#define reg_MI_DMA0CNT             (*(REGType32v *)0x40000b8)
#define reg_MI_DMA1SAD             (*(REGType32v *)0x40000bc)
#define reg_MI_DMA1DAD             (*(REGType32v *)0x40000c0)
#define reg_MI_DMA1CNT             (*(REGType32v *)0x40000c4)
#define reg_MI_DMA2SAD             (*(REGType32v *)0x40000c8)
#define reg_MI_DMA2DAD             (*(REGType32v *)0x40000cc)
#define reg_MI_DMA2CNT             (*(REGType32v *)0x40000d0)
#define reg_MI_DMA3SAD             (*(REGType32v *)0x40000d4)
#define reg_MI_DMA3DAD             (*(REGType32v *)0x40000d8)
#define reg_MI_DMA3CNT             (*(REGType32v *)0x40000dc)
#define reg_MI_DMA0_CLR_DATA       (*(REGType32v *)0x40000e0)
#define reg_MI_DMA1_CLR_DATA       (*(REGType32v *)0x40000e4)
#define reg_MI_DMA2_CLR_DATA       (*(REGType32v *)0x40000e8)
#define reg_MI_DMA3_CLR_DATA       (*(REGType32v *)0x40000ec)

#define reg_EXI_SIODATA32          (*(REGType32v *)0x4000120)
#define reg_EXI_SIOCNT             (*(REGType16v *)0x4000128)
#define reg_EXI_SIOSEL             (*(REGType32v *)0x400012c)

#define reg_PAD_KEYINPUT           (*(REGType16v *)0x4000130)
#define reg_PAD_KEYCNT             (*(REGType16v *)0x4000132)

#define reg_MI_MCCNT0              (*(REGType16v *)0x40001a0)
#define reg_CARD_MASTERCNT         (*(REGType8v  *)0x40001a1) //?
#define reg_MI_MCD0                (*(REGType16v *)0x40001a2)
#define reg_MI_MCCNT1              (*(REGType32v *)0x40001a4)
#define reg_CARD_CNT               (*(REGType32v *)0x40001a4) //?
#define reg_MI_MCCMD0              (*(REGType32v *)0x40001a8)
#define reg_CARD_CMD               (*(REGType8v  *)0x40001a8) //?
#define reg_MI_MCCMD1              (*(REGType32v *)0x40001ac)
#define reg_MI_EXMEMCNT            (*(REGType16v *)0x4000204)

#define reg_OS_PAUSE               (*(REGType16v *)0x4000300)

#define reg_GX_VRAMCNT             (*(REGType32v *)0x4000240)
#define reg_GX_VRAMCNT_A           (*(REGType8v  *)0x4000240)
#define reg_GX_VRAMCNT_B           (*(REGType8v  *)0x4000241)
#define reg_GX_VRAMCNT_C           (*(REGType8v  *)0x4000242)
#define reg_GX_VRAMCNT_D           (*(REGType8v  *)0x4000243)
#define reg_GX_WVRAMCNT            (*(REGType32v *)0x4000244)
#define reg_GX_VRAMCNT_E           (*(REGType8v  *)0x4000244)
#define reg_GX_VRAMCNT_F           (*(REGType8v  *)0x4000245)
#define reg_GX_VRAMCNT_G           (*(REGType8v  *)0x4000246)
#define reg_GX_VRAMCNT_WRAM        (*(REGType8v  *)0x4000247)
#define reg_GX_VRAM_HI_CNT         (*(REGType16v *)0x4000248)
#define reg_GX_VRAMCNT_H           (*(REGType8v  *)0x4000248)
#define reg_GX_VRAMCNT_I           (*(REGType8v  *)0x4000249)

#define reg_CP_DIVCNT              (*(REGType16v *)0x4000280)

#define REG_DIV_NUMER_ADDR         0x4000290
#define reg_CP_DIV_NUMER           (*(REGType64v *)REG_DIV_NUMER_ADDR)
#define reg_CP_DIV_NUMER_L         (*(REGType32v *)REG_DIV_NUMER_ADDR)
#define reg_CP_DIV_NUMER_H         (*(REGType32v *)0x4000294)
#define reg_CP_DIV_DENOM           (*(REGType64v *)0x4000298)
#define reg_CP_DIV_DENOM_L         (*(REGType32v *)0x4000298)
#define reg_CP_DIV_DENOM_H         (*(REGType32v *)0x400029c)
#define reg_CP_DIV_RESULT          (*(REGType64v *)0x40002A0)
#define reg_CP_DIV_RESULT_L        (*(REGType32v *)0x40002A0)
#define reg_CP_DIV_RESULT_H        (*(REGType32v *)0x40002A4)
#define reg_CP_DIVREM_RESULT       (*(REGType64v *)0x40002A8)
#define reg_CP_DIVREM_RESULT_L     (*(REGType32v *)0x40002A8)
#define reg_CP_DIVREM_RESULT_H     (*(REGType32v *)0x40002Ac)
#define reg_CP_SQRTCNT             (*(REGType16v *)0x40002B0)
#define reg_CP_SQRT_RESULT         (*(REGType32v *)0x40002B4)
#define reg_CP_SQRT_PARAM          (*(REGType64v *)0x40002B8)
#define reg_CP_SQRT_PARAM_L        (*(REGType32v *)0x40002B8)
#define reg_CP_SQRT_PARAM_H        (*(REGType32v *)0x40002Bc)

#define reg_GX_POWCNT              (*(REGType16v *)0x4000304)

#define reg_G3X_RDLINES_COUNT      (*(const REGType16v *)0x4000320)
#define reg_G3X_EDGE_COLOR_0       (*(REGType32v *)0x4000330)
#define reg_G3X_EDGE_COLOR_0_L     (*(REGType16v *)0x4000330)
#define reg_G3X_EDGE_COLOR_0_H     (*(REGType16v *)0x4000332)
#define reg_G3X_EDGE_COLOR_1       (*(REGType32v *)0x4000334)
#define reg_G3X_EDGE_COLOR_1_L     (*(REGType16v *)0x4000334)
#define reg_G3X_EDGE_COLOR_1_H     (*(REGType16v *)0x4000336)
#define reg_G3X_EDGE_COLOR_2       (*(REGType32v *)0x4000338)
#define reg_G3X_EDGE_COLOR_2_L     (*(REGType16v *)0x4000338)
#define reg_G3X_EDGE_COLOR_2_H     (*(REGType16v *)0x400033a)
#define reg_G3X_EDGE_COLOR_3       (*(REGType32v *)0x400033c)
#define reg_G3X_EDGE_COLOR_3_L     (*(REGType16v *)0x400033c)
#define reg_G3X_EDGE_COLOR_3_H     (*(REGType16v *)0x400033e)
#define reg_G3X_ALPHA_TEST_REF     (*(REGType16v *)0x4000340)
#define reg_G3X_CLEAR_COLOR        (*(REGType32v *)0x4000350)
#define reg_G3X_CLEAR_DEPTH        (*(REGType16v *)0x4000354)
#define reg_G3X_CLRIMAGE_OFFSET    (*(REGType16v *)0x4000356)
#define reg_G3X_FOG_COLOR          (*(REGType32v *)0x4000358)
#define reg_G3X_FOG_OFFSET         (*(REGType16v *)0x400035c)
#define reg_G3X_FOG_TABLE_0        (*(REGType32v *)0x4000360)
#define reg_G3X_FOG_TABLE_0_L      (*(REGType16v *)0x4000360)
#define reg_G3X_FOG_TABLE_0_H      (*(REGType16v *)0x4000362)
#define reg_G3X_FOG_TABLE_1        (*(REGType32v *)0x4000364)
#define reg_G3X_FOG_TABLE_1_L      (*(REGType16v *)0x4000364)
#define reg_G3X_FOG_TABLE_1_H      (*(REGType16v *)0x4000366)
#define reg_G3X_FOG_TABLE_2        (*(REGType32v *)0x4000368)
#define reg_G3X_FOG_TABLE_2_L      (*(REGType16v *)0x4000368)
#define reg_G3X_FOG_TABLE_2_H      (*(REGType16v *)0x400036a)
#define reg_G3X_FOG_TABLE_3        (*(REGType32v *)0x400036c)
#define reg_G3X_FOG_TABLE_3_L      (*(REGType16v *)0x400036c)
#define reg_G3X_FOG_TABLE_3_H      (*(REGType16v *)0x400036e)
#define reg_G3X_FOG_TABLE_4        (*(REGType32v *)0x4000370)
#define reg_G3X_FOG_TABLE_4_L      (*(REGType16v *)0x4000370)
#define reg_G3X_FOG_TABLE_4_H      (*(REGType16v *)0x4000372)
#define reg_G3X_FOG_TABLE_5        (*(REGType32v *)0x4000374)
#define reg_G3X_FOG_TABLE_5_L      (*(REGType16v *)0x4000374)
#define reg_G3X_FOG_TABLE_5_H      (*(REGType16v *)0x4000376)
#define reg_G3X_FOG_TABLE_6        (*(REGType32v *)0x4000378)
#define reg_G3X_FOG_TABLE_6_L      (*(REGType16v *)0x4000378)
#define reg_G3X_FOG_TABLE_6_H      (*(REGType16v *)0x400037a)
#define reg_G3X_FOG_TABLE_7        (*(REGType32v *)0x400037c)
#define reg_G3X_FOG_TABLE_7_L      (*(REGType16v *)0x400037c)
#define reg_G3X_FOG_TABLE_7_H      (*(REGType16v *)0x400037e)
#define reg_G3X_TOON_TABLE_0       (*(REGType32v *)0x4000380)
#define reg_G3X_TOON_TABLE_0_L     (*(REGType16v *)0x4000380)
#define reg_G3X_TOON_TABLE_0_H     (*(REGType16v *)0x4000382)
#define reg_G3X_TOON_TABLE_1       (*(REGType32v *)0x4000384)
#define reg_G3X_TOON_TABLE_1_L     (*(REGType16v *)0x4000384)
#define reg_G3X_TOON_TABLE_1_H     (*(REGType16v *)0x4000386)
#define reg_G3X_TOON_TABLE_2       (*(REGType32v *)0x4000388)
#define reg_G3X_TOON_TABLE_2_L     (*(REGType16v *)0x4000388)
#define reg_G3X_TOON_TABLE_2_H     (*(REGType16v *)0x400038a)
#define reg_G3X_TOON_TABLE_3       (*(REGType32v *)0x400038c)
#define reg_G3X_TOON_TABLE_3_L     (*(REGType16v *)0x400038c)
#define reg_G3X_TOON_TABLE_3_H     (*(REGType16v *)0x400038e)
#define reg_G3X_TOON_TABLE_4       (*(REGType32v *)0x4000390)
#define reg_G3X_TOON_TABLE_4_L     (*(REGType16v *)0x4000390)
#define reg_G3X_TOON_TABLE_4_H     (*(REGType16v *)0x4000392)
#define reg_G3X_TOON_TABLE_5       (*(REGType32v *)0x4000394)
#define reg_G3X_TOON_TABLE_5_L     (*(REGType16v *)0x4000394)
#define reg_G3X_TOON_TABLE_5_H     (*(REGType16v *)0x4000396)
#define reg_G3X_TOON_TABLE_7       (*(REGType32v *)0x400039c)
#define reg_G3X_TOON_TABLE_7_L     (*(REGType16v *)0x400039c)
#define reg_G3X_TOON_TABLE_7_H     (*(REGType16v *)0x400039e)
#define reg_G3X_TOON_TABLE_8       (*(REGType32v *)0x40003a0)
#define reg_G3X_TOON_TABLE_8_L     (*(REGType16v *)0x40003a0)
#define reg_G3X_TOON_TABLE_8_H     (*(REGType16v *)0x40003a2)
#define reg_G3X_TOON_TABLE_9       (*(REGType32v *)0x40003a4)
#define reg_G3X_TOON_TABLE_9_L     (*(REGType16v *)0x40003a4)
#define reg_G3X_TOON_TABLE_9_H     (*(REGType16v *)0x40003a6)
#define reg_G3X_TOON_TABLE_10      (*(REGType32v *)0x40003a8)
#define reg_G3X_TOON_TABLE_10_L    (*(REGType16v *)0x40003a8)
#define reg_G3X_TOON_TABLE_10_H    (*(REGType16v *)0x40003aa)
#define reg_G3X_TOON_TABLE_11      (*(REGType32v *)0x40003ac)
#define reg_G3X_TOON_TABLE_11_L    (*(REGType16v *)0x40003ac)
#define reg_G3X_TOON_TABLE_11_H    (*(REGType16v *)0x40003ae)
#define reg_G3X_TOON_TABLE_12      (*(REGType32v *)0x40003b0)
#define reg_G3X_TOON_TABLE_12_L    (*(REGType16v *)0x40003b0)
#define reg_G3X_TOON_TABLE_12_H    (*(REGType16v *)0x40003b2)
#define reg_G3X_TOON_TABLE_13      (*(REGType32v *)0x40003b4)
#define reg_G3X_TOON_TABLE_13_L    (*(REGType16v *)0x40003b4)
#define reg_G3X_TOON_TABLE_13_H    (*(REGType16v *)0x40003b6)
#define reg_G3X_TOON_TABLE_14      (*(REGType32v *)0x40003b8)
#define reg_G3X_TOON_TABLE_14_L    (*(REGType16v *)0x40003b8)
#define reg_G3X_TOON_TABLE_14_H    (*(REGType16v *)0x40003ba)
#define reg_G3X_TOON_TABLE_15      (*(REGType32v *)0x40003bc)
#define reg_G3X_TOON_TABLE_15_L    (*(REGType16v *)0x40003bc)
#define reg_G3X_TOON_TABLE_15_H    (*(REGType16v *)0x40003be)
#define reg_G3X_GXFIFO             (*(REGType32v *)0x4000400)

#define reg_G3_MTX_MODE            (*(REGType32v *)0x4000440)
#define reg_G3_MTX_PUSH            (*(REGType32v *)0x4000444)
#define reg_G3_MTX_POP             (*(REGType32v *)0x4000448)
#define reg_G3_MTX_STORE           (*(REGType32v *)0x400044c)
#define reg_G3_MTX_RESTORE         (*(REGType32v *)0x4000450)
#define reg_G3_MTX_IDENTITY        (*(REGType32v *)0x4000454)
#define reg_G3_MTX_LOAD_4x4        (*(REGType32v *)0x4000458)
#define reg_G3_MTX_LOAD_4x3        (*(REGType32v *)0x400045c)
#define reg_G3_MTX_MULT_4x4        (*(REGType32v *)0x4000460)
#define reg_G3_MTX_MULT_4x3        (*(REGType32v *)0x4000464)
#define reg_G3_MTX_MULT_3x3        (*(REGType32v *)0x4000468)
#define reg_G3_MTX_SCALE           (*(REGType32v *)0x400046c)
#define reg_G3_MTX_TRANS           (*(REGType32v *)0x4000470)
#define reg_G3_COLOR               (*(REGType32v *)0x4000480)
#define reg_G3_NORMAL              (*(REGType32v *)0x4000484)
#define reg_G3_TEXCOORD            (*(REGType32v *)0x4000488)
#define reg_G3_VTX_16              (*(REGType32v *)0x400048c)
#define reg_G3_VTX_10              (*(REGType32v *)0x4000490)
#define reg_G3_VTX_XY              (*(REGType32v *)0x4000494)
#define reg_G3_VTX_XZ              (*(REGType32v *)0x4000498)
#define reg_G3_VTX_YZ              (*(REGType32v *)0x400049c)
#define reg_G3_VTX_DIFF            (*(REGType32v *)0x40004a0)
#define reg_G3_POLYGON_ATTR        (*(REGType32v *)0x40004a4)
#define reg_G3_TEXIMAGE_PARAM      (*(REGType32v *)0x40004a8)
#define reg_G3_TEXPLTT_BASE        (*(REGType32v *)0x40004ac)
#define reg_G3_DIF_AMB             (*(REGType32v *)0x40004c0)
#define reg_G3_SPE_EMI             (*(REGType32v *)0x40004c4)
#define reg_G3_LIGHT_VECTOR        (*(REGType32v *)0x40004c8)
#define reg_G3_LIGHT_COLOR         (*(REGType32v *)0x40004cc)
#define reg_G3_SHININESS           (*(REGType32v *)0x40004d0)
#define reg_G3_BEGIN_VTXS          (*(REGType32v *)0x4000500)
#define reg_G3_END_VTXS            (*(REGType32v *)0x4000504)
#define reg_G3_SWAP_BUFFERS        (*(REGType32v *)0x4000540)
#define reg_G3_VIEWPORT            (*(REGType32v *)0x4000580)
#define reg_G3_BOX_TEST            (*(REGType32v *)0x40005c0)
#define reg_G3_POS_TEST            (*(REGType32v *)0x40005c4)
#define reg_G3_VEC_TEST            (*(REGType32v *)0x40005c8)

#define reg_G3X_GXSTAT             (*(REGType32v *)0x4000600)
#define reg_G3X_LISTRAM_COUNT      (*(REGType16v *)0x4000604)
#define reg_G3X_VTXRAM_COUNT       (*(REGType16v *)0x4000606)
#define reg_G3X_DISP_1DOT_DEPTH    (*(REGType16v *)0x4000610)
#define reg_G3X_POS_RESULT_X       (*(const REGType32v *)0x4000620)
#define reg_G3X_POS_RESULT_Y       (*(const REGType32v *)0x4000624)
#define reg_G3X_POS_RESULT_Z       (*(const REGType32v *)0x4000628)
#define reg_G3X_POS_RESULT_W       (*(const REGType32v *)0x400062c)
#define reg_G3X_VEC_RESULT_X       (*(const REGType16v *)0x4000630)
#define reg_G3X_VEC_RESULT_Y       (*(const REGType16v *)0x4000632)
#define reg_G3X_VEC_RESULT_Z       (*(const REGType16v *)0x4000634)
#define reg_G3X_CLIPMTX_RESULT_0   (*(const REGType32v *)0x4000640)
#define reg_G3X_CLIPMTX_RESULT_1   (*(const REGType32v *)0x4000644)
#define reg_G3X_CLIPMTX_RESULT_2   (*(const REGType32v *)0x4000648)
#define reg_G3X_CLIPMTX_RESULT_3   (*(const REGType32v *)0x400064c)
#define reg_G3X_CLIPMTX_RESULT_4   (*(const REGType32v *)0x4000650)
#define reg_G3X_CLIPMTX_RESULT_5   (*(const REGType32v *)0x4000654)
#define reg_G3X_CLIPMTX_RESULT_6   (*(const REGType32v *)0x4000658)
#define reg_G3X_CLIPMTX_RESULT_7   (*(const REGType32v *)0x400065c)
#define reg_G3X_CLIPMTX_RESULT_8   (*(const REGType32v *)0x4000660)
#define reg_G3X_CLIPMTX_RESULT_9   (*(const REGType32v *)0x4000664)
#define reg_G3X_CLIPMTX_RESULT_10  (*(const REGType32v *)0x4000668)
#define reg_G3X_CLIPMTX_RESULT_11  (*(const REGType32v *)0x400066c)
#define reg_G3X_CLIPMTX_RESULT_12  (*(const REGType32v *)0x4000670)
#define reg_G3X_CLIPMTX_RESULT_13  (*(const REGType32v *)0x4000674)
#define reg_G3X_CLIPMTX_RESULT_14  (*(const REGType32v *)0x4000678)
#define reg_G3X_CLIPMTX_RESULT_15  (*(const REGType32v *)0x400067c)
#define reg_G3X_VECMTX_RESULT_0    (*(const REGType32v *)0x4000680)
#define reg_G3X_VECMTX_RESULT_1    (*(const REGType32v *)0x4000684)
#define reg_G3X_VECMTX_RESULT_2    (*(const REGType32v *)0x4000688)
#define reg_G3X_VECMTX_RESULT_3    (*(const REGType32v *)0x400068c)
#define reg_G3X_VECMTX_RESULT_4    (*(const REGType32v *)0x4000690)
#define reg_G3X_VECMTX_RESULT_5    (*(const REGType32v *)0x4000694)
#define reg_G3X_VECMTX_RESULT_6    (*(const REGType32v *)0x4000698)
#define reg_G3X_VECMTX_RESULT_7    (*(const REGType32v *)0x400069c)
#define reg_G3X_VECMTX_RESULT_8    (*(const REGType32v *)0x40006a0)

#define reg_GXS_DB_DISPCNT         (*(REGType32v *)0x4001000)

#define reg_G2S_DB_BG0CNT          (*(REGType16v *)0x4001008)
#define reg_G2S_DB_BG1CNT          (*(REGType16v *)0x400100a)
#define reg_G2S_DB_BG2CNT          (*(REGType16v *)0x400100c)
#define reg_G2S_DB_BG3CNT          (*(REGType16v *)0x400100e)
#define reg_G2S_DB_BG0OFS          (*(REGType32v *)0x4001010)
#define reg_G2S_DB_BG0HOFS         (*(REGType16v *)0x4001010)
#define reg_G2S_DB_BG0VOFS         (*(REGType16v *)0x4001012)
#define reg_G2S_DB_BG1OFS          (*(REGType32v *)0x4001014)
#define reg_G2S_DB_BG1HOFS         (*(REGType16v *)0x4001014)
#define reg_G2S_DB_BG1VOFS         (*(REGType16v *)0x4001016)
#define reg_G2S_DB_BG2OFS          (*(REGType32v *)0x4001018)
#define reg_G2S_DB_BG2HOFS         (*(REGType16v *)0x4001018)
#define reg_G2S_DB_BG2VOFS         (*(REGType16v *)0x400101a)
#define reg_G2S_DB_BG3OFS          (*(REGType32v *)0x400101c)
#define reg_G2S_DB_BG3HOFS         (*(REGType16v *)0x400101c)
#define reg_G2S_DB_BG3VOFS         (*(REGType16v *)0x400101e)
#define reg_G2S_DB_BG2PA           (*(REGType16v *)0x4001020)
#define reg_G2S_DB_BG2PB           (*(REGType16v *)0x4001022)
#define reg_G2S_DB_BG2PC           (*(REGType16v *)0x4001024)
#define reg_G2S_DB_BG2PD           (*(REGType16v *)0x4001026)
#define reg_G2S_DB_BG2X            (*(REGType32v *)0x4001028)
#define reg_G2S_DB_BG2Y            (*(REGType32v *)0x400102c)
#define reg_G2S_DB_BG3PA           (*(REGType16v *)0x4001030)
#define reg_G2S_DB_BG3PB           (*(REGType16v *)0x4001032)
#define reg_G2S_DB_BG3PC           (*(REGType16v *)0x4001034)
#define reg_G2S_DB_BG3PD           (*(REGType16v *)0x4001036)
#define reg_G2S_DB_BG3X            (*(REGType32v *)0x4001038)
#define reg_G2S_DB_BG3Y            (*(REGType32v *)0x400103c)
#define reg_G2S_DB_WIN0H           (*(REGType16v *)0x4001040)
#define reg_G2S_DB_WIN1H           (*(REGType16v *)0x4001042)
#define reg_G2S_DB_WIN0V           (*(REGType16v *)0x4001044)
#define reg_G2S_DB_WIN1V           (*(REGType16v *)0x4001046)
#define reg_G2S_DB_WININ           (*(REGType16v *)0x4001048)
#define reg_G2S_DB_WINOUT          (*(REGType16v *)0x400104a)
#define reg_G2S_DB_MOSAIC          (*(REGType16v *)0x400104c)
#define reg_G2S_DB_BLDCNT          (*(REGType16v *)0x4001050)
#define reg_G2S_DB_BLDALPHA        (*(REGType16v *)0x4001052)
#define reg_G2S_DB_BLDY            (*(REGType16v *)0x4001054)

#define reg_GXS_DB_MASTER_BRIGHT   (*(REGType16v *)0x400106c)

#define reg_MI_MCD1                (*(REGType32v *)0x4100010)
#define reg_CARD_DATA              (*(REGType32v *)0x4100010) //?

#define REG_OS_IE_VB_SHIFT                                 0
#define REG_OS_IE_HB_SHIFT                                 1
#define REG_OS_IE_VE_SHIFT                                 2
#define REG_OS_IE_T0_SHIFT                                 3
#define REG_OS_IE_T1_SHIFT                                 4
#define REG_OS_IE_T2_SHIFT                                 5
#define REG_OS_IE_T3_SHIFT                                 6
#define REG_OS_IE_D0_SHIFT                                 8
#define REG_OS_IE_D1_SHIFT                                 9
#define REG_OS_IE_D2_SHIFT                                 10
#define REG_OS_IE_D3_SHIFT                                 11
#define REG_OS_IE_K_SHIFT                                  12
#define REG_OS_IE_I_D_SHIFT                                13
#define REG_OS_IE_A7_SHIFT                                 16
#define REG_OS_IE_IFE_SHIFT                                17
#define REG_OS_IE_IFN_SHIFT                                18
#define REG_OS_IE_MC_SHIFT                                 19
#define REG_OS_IE_MI_SHIFT                                 20
#define REG_OS_IE_PM_SHIFT                                 22
#define REG_OS_IE_SPI_SHIFT                                23
#define REG_OS_IE_WL_SHIFT                                 24

#define REG_PAD_KEYINPUT_L_SHIFT                           9
#define REG_PAD_KEYINPUT_L_SIZE                            1
#define REG_PAD_KEYINPUT_L_MASK                            0x0200

#define REG_PAD_KEYINPUT_R_SHIFT                           8
#define REG_PAD_KEYINPUT_R_SIZE                            1
#define REG_PAD_KEYINPUT_R_MASK                            0x0100

#define REG_PAD_KEYINPUT_DOWN_SHIFT                        7
#define REG_PAD_KEYINPUT_DOWN_SIZE                         1
#define REG_PAD_KEYINPUT_DOWN_MASK                         0x0080

#define REG_PAD_KEYINPUT_UP_SHIFT                          6
#define REG_PAD_KEYINPUT_UP_SIZE                           1
#define REG_PAD_KEYINPUT_UP_MASK                           0x0040

#define REG_PAD_KEYINPUT_LEFT_SHIFT                        5
#define REG_PAD_KEYINPUT_LEFT_SIZE                         1
#define REG_PAD_KEYINPUT_LEFT_MASK                         0x0020

#define REG_PAD_KEYINPUT_RIGHT_SHIFT                       4
#define REG_PAD_KEYINPUT_RIGHT_SIZE                        1
#define REG_PAD_KEYINPUT_RIGHT_MASK                        0x0010

#define REG_PAD_KEYINPUT_START_SHIFT                       3
#define REG_PAD_KEYINPUT_START_SIZE                        1
#define REG_PAD_KEYINPUT_START_MASK                        0x0008

#define REG_PAD_KEYINPUT_SEL_SHIFT                         2
#define REG_PAD_KEYINPUT_SEL_SIZE                          1
#define REG_PAD_KEYINPUT_SEL_MASK                          0x0004

#define REG_PAD_KEYINPUT_B_SHIFT                           1
#define REG_PAD_KEYINPUT_B_SIZE                            1
#define REG_PAD_KEYINPUT_B_MASK                            0x0002

#define REG_PAD_KEYINPUT_A_SHIFT                           0
#define REG_PAD_KEYINPUT_A_SIZE                            1
#define REG_PAD_KEYINPUT_A_MASK                            0x0001

#ifndef SDK_ASM
#define REG_PAD_KEYINPUT_FIELD( l, r, down, up, left, right, start, sel, b, a ) \
    (u16)( \
    ((u32)(l) << REG_PAD_KEYINPUT_L_SHIFT) | \
    ((u32)(r) << REG_PAD_KEYINPUT_R_SHIFT) | \
    ((u32)(down) << REG_PAD_KEYINPUT_DOWN_SHIFT) | \
    ((u32)(up) << REG_PAD_KEYINPUT_UP_SHIFT) | \
    ((u32)(left) << REG_PAD_KEYINPUT_LEFT_SHIFT) | \
    ((u32)(right) << REG_PAD_KEYINPUT_RIGHT_SHIFT) | \
    ((u32)(start) << REG_PAD_KEYINPUT_START_SHIFT) | \
    ((u32)(sel) << REG_PAD_KEYINPUT_SEL_SHIFT) | \
    ((u32)(b) << REG_PAD_KEYINPUT_B_SHIFT) | \
    ((u32)(a) << REG_PAD_KEYINPUT_A_SHIFT))
#endif

#define REG_PAD_KEYCNT_LOGIC_SHIFT                         15
#define REG_PAD_KEYCNT_LOGIC_SIZE                          1
#define REG_PAD_KEYCNT_LOGIC_MASK                          0x8000

#define REG_PAD_KEYCNT_INTR_SHIFT                          14
#define REG_PAD_KEYCNT_INTR_SIZE                           1
#define REG_PAD_KEYCNT_INTR_MASK                           0x4000

#define REG_PAD_KEYCNT_L_SHIFT                             9
#define REG_PAD_KEYCNT_L_SIZE                              1
#define REG_PAD_KEYCNT_L_MASK                              0x0200

#define REG_PAD_KEYCNT_R_SHIFT                             8
#define REG_PAD_KEYCNT_R_SIZE                              1
#define REG_PAD_KEYCNT_R_MASK                              0x0100

#define REG_PAD_KEYCNT_DOWN_SHIFT                          7
#define REG_PAD_KEYCNT_DOWN_SIZE                           1
#define REG_PAD_KEYCNT_DOWN_MASK                           0x0080

#define REG_PAD_KEYCNT_UP_SHIFT                            6
#define REG_PAD_KEYCNT_UP_SIZE                             1
#define REG_PAD_KEYCNT_UP_MASK                             0x0040

#define REG_PAD_KEYCNT_LEFT_SHIFT                          5
#define REG_PAD_KEYCNT_LEFT_SIZE                           1
#define REG_PAD_KEYCNT_LEFT_MASK                           0x0020

#define REG_PAD_KEYCNT_RIGHT_SHIFT                         4
#define REG_PAD_KEYCNT_RIGHT_SIZE                          1
#define REG_PAD_KEYCNT_RIGHT_MASK                          0x0010

#define REG_PAD_KEYCNT_START_SHIFT                         3
#define REG_PAD_KEYCNT_START_SIZE                          1
#define REG_PAD_KEYCNT_START_MASK                          0x0008

#define REG_PAD_KEYCNT_SEL_SHIFT                           2
#define REG_PAD_KEYCNT_SEL_SIZE                            1
#define REG_PAD_KEYCNT_SEL_MASK                            0x0004

#define REG_PAD_KEYCNT_B_SHIFT                             1
#define REG_PAD_KEYCNT_B_SIZE                              1
#define REG_PAD_KEYCNT_B_MASK                              0x0002

#define REG_PAD_KEYCNT_A_SHIFT                             0
#define REG_PAD_KEYCNT_A_SIZE                              1
#define REG_PAD_KEYCNT_A_MASK                              0x0001

#define REG_G2_WINOUT_OBJWININ_SHIFT                       8
#define REG_G2_WINOUT_OBJWININ_SIZE                        6
#define REG_G2_WINOUT_OBJWININ_MASK                        0x3f00

#define REG_G2_WINOUT_WINOUT_SHIFT                         0
#define REG_G2_WINOUT_WINOUT_SIZE                          6
#define REG_G2_WINOUT_WINOUT_MASK                          0x003f

#define REG_G2_WINOUT_FIELD( objwinin, winout ) \
    (u16)( \
    ((u32)(objwinin) << REG_G2_WINOUT_OBJWININ_SHIFT) | \
    ((u32)(winout) << REG_G2_WINOUT_WINOUT_SHIFT))

#ifndef SDK_ASM
#define REG_PAD_KEYCNT_FIELD( logic, intr, l, r, down, up, left, right, start, sel, b, a ) \
    (u16)( \
    ((u32)(logic) << REG_PAD_KEYCNT_LOGIC_SHIFT) | \
    ((u32)(intr) << REG_PAD_KEYCNT_INTR_SHIFT) | \
    ((u32)(l) << REG_PAD_KEYCNT_L_SHIFT) | \
    ((u32)(r) << REG_PAD_KEYCNT_R_SHIFT) | \
    ((u32)(down) << REG_PAD_KEYCNT_DOWN_SHIFT) | \
    ((u32)(up) << REG_PAD_KEYCNT_UP_SHIFT) | \
    ((u32)(left) << REG_PAD_KEYCNT_LEFT_SHIFT) | \
    ((u32)(right) << REG_PAD_KEYCNT_RIGHT_SHIFT) | \
    ((u32)(start) << REG_PAD_KEYCNT_START_SHIFT) | \
    ((u32)(sel) << REG_PAD_KEYCNT_SEL_SHIFT) | \
    ((u32)(b) << REG_PAD_KEYCNT_B_SHIFT) | \
    ((u32)(a) << REG_PAD_KEYCNT_A_SHIFT))
#endif

#define REG_GX_POWCNT_GE_SHIFT                             3
#define REG_GX_POWCNT_GE_SIZE                              1
#define REG_GX_POWCNT_GE_MASK                              0x0008

#define REG_GX_POWCNT_RE_SHIFT                             2
#define REG_GX_POWCNT_RE_SIZE                              1
#define REG_GX_POWCNT_RE_MASK                              0x0004

#define REG_GX_POWCNT_E2DG_SHIFT                           1
#define REG_GX_POWCNT_E2DG_SIZE                            1
#define REG_GX_POWCNT_E2DG_MASK                            0x0002

#define REG_GX_POWCNT_LCD_SHIFT                            0
#define REG_GX_POWCNT_LCD_SIZE                             1
#define REG_GX_POWCNT_LCD_MASK                             0x0001

#define REG_GX_POWCNT_LCDB_SHIFT                           8
#define REG_GX_POWCNT_LCDB_SIZE                            1
#define REG_GX_POWCNT_LCDB_MASK                            0x0100

#define REG_GX_POWCNT_E2DGB_SHIFT                          9
#define REG_GX_POWCNT_E2DGB_SIZE                           1
#define REG_GX_POWCNT_E2DGB_MASK                           0x0200

#define REG_GX_POWCNT_DSEL_SHIFT                           15
#define REG_GX_POWCNT_DSEL_SIZE                            1
#define REG_GX_POWCNT_DSEL_MASK                            0x8000

// GX_DISPCNT
#define REG_GX_DISPCNT_O_SHIFT                             31
#define REG_GX_DISPCNT_O_SIZE                              1
#define REG_GX_DISPCNT_O_MASK                              0x80000000

#define REG_GX_DISPCNT_BG_SHIFT                            30
#define REG_GX_DISPCNT_BG_SIZE                             1
#define REG_GX_DISPCNT_BG_MASK                             0x40000000

#define REG_GX_DISPCNT_BGSCREENOFFSET_SHIFT                27
#define REG_GX_DISPCNT_BGSCREENOFFSET_SIZE                 3
#define REG_GX_DISPCNT_BGSCREENOFFSET_MASK                 0x38000000

#define REG_GX_DISPCNT_BGCHAROFFSET_SHIFT                  24
#define REG_GX_DISPCNT_BGCHAROFFSET_SIZE                   3
#define REG_GX_DISPCNT_BGCHAROFFSET_MASK                   0x07000000

#define REG_GX_DISPCNT_OH_SHIFT                            23
#define REG_GX_DISPCNT_OH_SIZE                             1
#define REG_GX_DISPCNT_OH_MASK                             0x00800000

#define REG_GX_DISPCNT_EXOBJ_SHIFT                         20
#define REG_GX_DISPCNT_EXOBJ_SIZE                          3
#define REG_GX_DISPCNT_EXOBJ_MASK                          0x00700000

#define REG_GX_DISPCNT_VRAM_SHIFT                          18
#define REG_GX_DISPCNT_VRAM_SIZE                           2
#define REG_GX_DISPCNT_VRAM_MASK                           0x000c0000

#define REG_GX_DISPCNT_MODE_SHIFT                          16
#define REG_GX_DISPCNT_MODE_SIZE                           2
#define REG_GX_DISPCNT_MODE_MASK                           0x00030000

#define REG_GX_DISPCNT_OW_SHIFT                            15
#define REG_GX_DISPCNT_OW_SIZE                             1
#define REG_GX_DISPCNT_OW_MASK                             0x00008000

#define REG_GX_DISPCNT_W1_SHIFT                            14
#define REG_GX_DISPCNT_W1_SIZE                             1
#define REG_GX_DISPCNT_W1_MASK                             0x00004000

#define REG_GX_DISPCNT_W0_SHIFT                            13
#define REG_GX_DISPCNT_W0_SIZE                             1
#define REG_GX_DISPCNT_W0_MASK                             0x00002000

#define REG_GX_DISPCNT_DISPLAY_SHIFT                       8
#define REG_GX_DISPCNT_DISPLAY_SIZE                        5
#define REG_GX_DISPCNT_DISPLAY_MASK                        0x00001f00

#define REG_GX_DISPCNT_BLANK_SHIFT                         7
#define REG_GX_DISPCNT_BLANK_SIZE                          1
#define REG_GX_DISPCNT_BLANK_MASK                          0x00000080

#define REG_GX_DISPCNT_OBJMAP_SHIFT                        4
#define REG_GX_DISPCNT_OBJMAP_SIZE                         3
#define REG_GX_DISPCNT_OBJMAP_MASK                         0x00000070

#define REG_GX_DISPCNT_BG02D3D_SHIFT                       3
#define REG_GX_DISPCNT_BG02D3D_SIZE                        1
#define REG_GX_DISPCNT_BG02D3D_MASK                        0x00000008

#define REG_GX_DISPCNT_BGMODE_SHIFT                        0
#define REG_GX_DISPCNT_BGMODE_SIZE                         3
#define REG_GX_DISPCNT_BGMODE_MASK                         0x00000007

#define REG_GX_DISPCNT_OBJMAP_CH_SHIFT                     4
#define REG_GX_DISPCNT_OBJMAP_CH_SIZE                      1
#define REG_GX_DISPCNT_OBJMAP_CH_MASK                      0x00000010

#define REG_GX_DISPCNT_OBJMAP_BM_SHIFT                     5
#define REG_GX_DISPCNT_OBJMAP_BM_SIZE                      2
#define REG_GX_DISPCNT_OBJMAP_BM_MASK                      0x00000060

#define REG_GX_DISPCNT_EXOBJ_CH_SHIFT                      20
#define REG_GX_DISPCNT_EXOBJ_CH_SIZE                       2
#define REG_GX_DISPCNT_EXOBJ_CH_MASK                       0x00300000

#define REG_GX_DISPCNT_EXOBJ_BM_SHIFT                      22
#define REG_GX_DISPCNT_EXOBJ_BM_SIZE                       1
#define REG_GX_DISPCNT_EXOBJ_BM_MASK                       0x00400000

// GXS_DB_DISPCNT
#define REG_GXS_DB_DISPCNT_O_SHIFT                         31
#define REG_GXS_DB_DISPCNT_O_SIZE                          1
#define REG_GXS_DB_DISPCNT_O_MASK                          0x80000000

#define REG_GXS_DB_DISPCNT_BG_SHIFT                        30
#define REG_GXS_DB_DISPCNT_BG_SIZE                         1
#define REG_GXS_DB_DISPCNT_BG_MASK                         0x40000000

#define REG_GXS_DB_DISPCNT_OH_SHIFT                        23
#define REG_GXS_DB_DISPCNT_OH_SIZE                         1
#define REG_GXS_DB_DISPCNT_OH_MASK                         0x00800000

#define REG_GXS_DB_DISPCNT_EXOBJ_SHIFT                     20
#define REG_GXS_DB_DISPCNT_EXOBJ_SIZE                      2
#define REG_GXS_DB_DISPCNT_EXOBJ_MASK                      0x00300000

#define REG_GXS_DB_DISPCNT_MODE_SHIFT                      16
#define REG_GXS_DB_DISPCNT_MODE_SIZE                       1
#define REG_GXS_DB_DISPCNT_MODE_MASK                       0x00010000

#define REG_GXS_DB_DISPCNT_OW_SHIFT                        15
#define REG_GXS_DB_DISPCNT_OW_SIZE                         1
#define REG_GXS_DB_DISPCNT_OW_MASK                         0x00008000

#define REG_GXS_DB_DISPCNT_W1_SHIFT                        14
#define REG_GXS_DB_DISPCNT_W1_SIZE                         1
#define REG_GXS_DB_DISPCNT_W1_MASK                         0x00004000

#define REG_GXS_DB_DISPCNT_W0_SHIFT                        13
#define REG_GXS_DB_DISPCNT_W0_SIZE                         1
#define REG_GXS_DB_DISPCNT_W0_MASK                         0x00002000

#define REG_GXS_DB_DISPCNT_DISPLAY_SHIFT                   8
#define REG_GXS_DB_DISPCNT_DISPLAY_SIZE                    5
#define REG_GXS_DB_DISPCNT_DISPLAY_MASK                    0x00001f00

#define REG_GXS_DB_DISPCNT_BLANK_SHIFT                     7
#define REG_GXS_DB_DISPCNT_BLANK_SIZE                      1
#define REG_GXS_DB_DISPCNT_BLANK_MASK                      0x00000080

#define REG_GXS_DB_DISPCNT_OBJMAP_SHIFT                    4
#define REG_GXS_DB_DISPCNT_OBJMAP_SIZE                     3
#define REG_GXS_DB_DISPCNT_OBJMAP_MASK                     0x00000070

#define REG_GXS_DB_DISPCNT_BGMODE_SHIFT                    0
#define REG_GXS_DB_DISPCNT_BGMODE_SIZE                     3
#define REG_GXS_DB_DISPCNT_BGMODE_MASK                     0x00000007

#define REG_GXS_DB_DISPCNT_OBJMAP_CH_SHIFT                 4
#define REG_GXS_DB_DISPCNT_OBJMAP_CH_SIZE                  1
#define REG_GXS_DB_DISPCNT_OBJMAP_CH_MASK                  0x00000010

#define REG_GXS_DB_DISPCNT_OBJMAP_BM_SHIFT                 5
#define REG_GXS_DB_DISPCNT_OBJMAP_BM_SIZE                  2
#define REG_GXS_DB_DISPCNT_OBJMAP_BM_MASK                  0x00000060

#define REG_GXS_DB_DISPCNT_EXOBJ_CH_SHIFT                  20
#define REG_GXS_DB_DISPCNT_EXOBJ_CH_SIZE                   2
#define REG_GXS_DB_DISPCNT_EXOBJ_CH_MASK                   0x00300000

// MASTER BRIGHT
#define REG_GX_MASTER_BRIGHT_E_MOD_SHIFT                   14
#define REG_GX_MASTER_BRIGHT_E_MOD_SIZE                    2
#define REG_GX_MASTER_BRIGHT_E_MOD_MASK                    0xc000

#define REG_GX_MASTER_BRIGHT_E_VALUE_SHIFT                 0
#define REG_GX_MASTER_BRIGHT_E_VALUE_SIZE                  5
#define REG_GX_MASTER_BRIGHT_E_VALUE_MASK                  0x001f

// DISPSTAT
#define REG_GX_DISPSTAT_VCOUNTER_SHIFT                     7
#define REG_GX_DISPSTAT_VCOUNTER_SIZE                      9
#define REG_GX_DISPSTAT_VCOUNTER_MASK                      0xff80

#define REG_GX_DISPSTAT_VQI_SHIFT                          5
#define REG_GX_DISPSTAT_VQI_SIZE                           1
#define REG_GX_DISPSTAT_VQI_MASK                           0x0020

#define REG_GX_DISPSTAT_HBI_SHIFT                          4
#define REG_GX_DISPSTAT_HBI_SIZE                           1
#define REG_GX_DISPSTAT_HBI_MASK                           0x0010

#define REG_GX_DISPSTAT_VBI_SHIFT                          3
#define REG_GX_DISPSTAT_VBI_SIZE                           1
#define REG_GX_DISPSTAT_VBI_MASK                           0x0008

#define REG_GX_DISPSTAT_LYC_SHIFT                          2
#define REG_GX_DISPSTAT_LYC_SIZE                           1
#define REG_GX_DISPSTAT_LYC_MASK                           0x0004

#define REG_GX_DISPSTAT_HBLK_SHIFT                         1
#define REG_GX_DISPSTAT_HBLK_SIZE                          1
#define REG_GX_DISPSTAT_HBLK_MASK                          0x0002

#define REG_GX_DISPSTAT_VBLK_SHIFT                         0
#define REG_GX_DISPSTAT_VBLK_SIZE                          1
#define REG_GX_DISPSTAT_VBLK_MASK                          0x0001

// G2_BG0CNT
#define REG_G2_BG0CNT_SCREENSIZE_SHIFT                     14
#define REG_G2_BG0CNT_SCREENSIZE_SIZE                      2
#define REG_G2_BG0CNT_SCREENSIZE_MASK                      0xc000

#define REG_G2_BG0CNT_BGPLTTSLOT_SHIFT                     13
#define REG_G2_BG0CNT_BGPLTTSLOT_SIZE                      1
#define REG_G2_BG0CNT_BGPLTTSLOT_MASK                      0x2000

#define REG_G2_BG0CNT_SCREENBASE_SHIFT                     8
#define REG_G2_BG0CNT_SCREENBASE_SIZE                      5
#define REG_G2_BG0CNT_SCREENBASE_MASK                      0x1f00

#define REG_G2_BG0CNT_COLORMODE_SHIFT                      7
#define REG_G2_BG0CNT_COLORMODE_SIZE                       1
#define REG_G2_BG0CNT_COLORMODE_MASK                       0x0080

#define REG_G2_BG0CNT_MOSAIC_SHIFT                         6
#define REG_G2_BG0CNT_MOSAIC_SIZE                          1
#define REG_G2_BG0CNT_MOSAIC_MASK                          0x0040

#define REG_G2_BG0CNT_CHARBASE_SHIFT                       2
#define REG_G2_BG0CNT_CHARBASE_SIZE                        4
#define REG_G2_BG0CNT_CHARBASE_MASK                        0x003c

#define REG_G2_BG0CNT_PRIORITY_SHIFT                       0
#define REG_G2_BG0CNT_PRIORITY_SIZE                        2
#define REG_G2_BG0CNT_PRIORITY_MASK                        0x0003

// G2_BG1CNT
#define REG_G2_BG1CNT_SCREENSIZE_SHIFT                     14
#define REG_G2_BG1CNT_SCREENSIZE_SIZE                      2
#define REG_G2_BG1CNT_SCREENSIZE_MASK                      0xc000

#define REG_G2_BG1CNT_BGPLTTSLOT_SHIFT                     13
#define REG_G2_BG1CNT_BGPLTTSLOT_SIZE                      1
#define REG_G2_BG1CNT_BGPLTTSLOT_MASK                      0x2000

#define REG_G2_BG1CNT_SCREENBASE_SHIFT                     8
#define REG_G2_BG1CNT_SCREENBASE_SIZE                      5
#define REG_G2_BG1CNT_SCREENBASE_MASK                      0x1f00

#define REG_G2_BG1CNT_COLORMODE_SHIFT                      7
#define REG_G2_BG1CNT_COLORMODE_SIZE                       1
#define REG_G2_BG1CNT_COLORMODE_MASK                       0x0080

#define REG_G2_BG1CNT_MOSAIC_SHIFT                         6
#define REG_G2_BG1CNT_MOSAIC_SIZE                          1
#define REG_G2_BG1CNT_MOSAIC_MASK                          0x0040

#define REG_G2_BG1CNT_CHARBASE_SHIFT                       2
#define REG_G2_BG1CNT_CHARBASE_SIZE                        4
#define REG_G2_BG1CNT_CHARBASE_MASK                        0x003c

#define REG_G2_BG1CNT_PRIORITY_SHIFT                       0
#define REG_G2_BG1CNT_PRIORITY_SIZE                        2
#define REG_G2_BG1CNT_PRIORITY_MASK                        0x0003

// G2_BG2CNT
#define REG_G2_BG2CNT_SCREENSIZE_SHIFT                     14
#define REG_G2_BG2CNT_SCREENSIZE_SIZE                      2
#define REG_G2_BG2CNT_SCREENSIZE_MASK                      0xc000

#define REG_G2_BG2CNT_AREAOVER_SHIFT                       13
#define REG_G2_BG2CNT_AREAOVER_SIZE                        1
#define REG_G2_BG2CNT_AREAOVER_MASK                        0x2000

#define REG_G2_BG2CNT_SCREENBASE_SHIFT                     8
#define REG_G2_BG2CNT_SCREENBASE_SIZE                      5
#define REG_G2_BG2CNT_SCREENBASE_MASK                      0x1f00

#define REG_G2_BG2CNT_COLORMODE_SHIFT                      7
#define REG_G2_BG2CNT_COLORMODE_SIZE                       1
#define REG_G2_BG2CNT_COLORMODE_MASK                       0x0080

#define REG_G2_BG2CNT_MOSAIC_SHIFT                         6
#define REG_G2_BG2CNT_MOSAIC_SIZE                          1
#define REG_G2_BG2CNT_MOSAIC_MASK                          0x0040

#define REG_G2_BG2CNT_CHARBASE_SHIFT                       2
#define REG_G2_BG2CNT_CHARBASE_SIZE                        4
#define REG_G2_BG2CNT_CHARBASE_MASK                        0x003c

#define REG_G2_BG2CNT_PRIORITY_SHIFT                       0
#define REG_G2_BG2CNT_PRIORITY_SIZE                        2
#define REG_G2_BG2CNT_PRIORITY_MASK                        0x0003

// G2_BG3CNT
#define REG_G2_BG3CNT_SCREENSIZE_SHIFT                     14
#define REG_G2_BG3CNT_SCREENSIZE_SIZE                      2
#define REG_G2_BG3CNT_SCREENSIZE_MASK                      0xc000

#define REG_G2_BG3CNT_AREAOVER_SHIFT                       13
#define REG_G2_BG3CNT_AREAOVER_SIZE                        1
#define REG_G2_BG3CNT_AREAOVER_MASK                        0x2000

#define REG_G2_BG3CNT_SCREENBASE_SHIFT                     8
#define REG_G2_BG3CNT_SCREENBASE_SIZE                      5
#define REG_G2_BG3CNT_SCREENBASE_MASK                      0x1f00

#define REG_G2_BG3CNT_COLORMODE_SHIFT                      7
#define REG_G2_BG3CNT_COLORMODE_SIZE                       1
#define REG_G2_BG3CNT_COLORMODE_MASK                       0x0080

#define REG_G2_BG3CNT_MOSAIC_SHIFT                         6
#define REG_G2_BG3CNT_MOSAIC_SIZE                          1
#define REG_G2_BG3CNT_MOSAIC_MASK                          0x0040

#define REG_G2_BG3CNT_CHARBASE_SHIFT                       2
#define REG_G2_BG3CNT_CHARBASE_SIZE                        4
#define REG_G2_BG3CNT_CHARBASE_MASK                        0x003c

#define REG_G2_BG3CNT_PRIORITY_SHIFT                       0
#define REG_G2_BG3CNT_PRIORITY_SIZE                        2
#define REG_G2_BG3CNT_PRIORITY_MASK                        0x0003

// G2S_DB_BG0CNT
#define REG_G2S_DB_BG0CNT_SCREENSIZE_SHIFT                 14
#define REG_G2S_DB_BG0CNT_SCREENSIZE_SIZE                  2
#define REG_G2S_DB_BG0CNT_SCREENSIZE_MASK                  0xc000

#define REG_G2S_DB_BG0CNT_BGPLTTSLOT_SHIFT                 13
#define REG_G2S_DB_BG0CNT_BGPLTTSLOT_SIZE                  1
#define REG_G2S_DB_BG0CNT_BGPLTTSLOT_MASK                  0x2000

#define REG_G2S_DB_BG0CNT_SCREENBASE_SHIFT                 8
#define REG_G2S_DB_BG0CNT_SCREENBASE_SIZE                  5
#define REG_G2S_DB_BG0CNT_SCREENBASE_MASK                  0x1f00

#define REG_G2S_DB_BG0CNT_COLORMODE_SHIFT                  7
#define REG_G2S_DB_BG0CNT_COLORMODE_SIZE                   1
#define REG_G2S_DB_BG0CNT_COLORMODE_MASK                   0x0080

#define REG_G2S_DB_BG0CNT_MOSAIC_SHIFT                     6
#define REG_G2S_DB_BG0CNT_MOSAIC_SIZE                      1
#define REG_G2S_DB_BG0CNT_MOSAIC_MASK                      0x0040

#define REG_G2S_DB_BG0CNT_CHARBASE_SHIFT                   2
#define REG_G2S_DB_BG0CNT_CHARBASE_SIZE                    4
#define REG_G2S_DB_BG0CNT_CHARBASE_MASK                    0x003c

#define REG_G2S_DB_BG0CNT_PRIORITY_SHIFT                   0
#define REG_G2S_DB_BG0CNT_PRIORITY_SIZE                    2
#define REG_G2S_DB_BG0CNT_PRIORITY_MASK                    0x0003

// G2S_DB_BG1CNT
#define REG_G2S_DB_BG1CNT_SCREENSIZE_SHIFT                 14
#define REG_G2S_DB_BG1CNT_SCREENSIZE_SIZE                  2
#define REG_G2S_DB_BG1CNT_SCREENSIZE_MASK                  0xc000

#define REG_G2S_DB_BG1CNT_BGPLTTSLOT_SHIFT                 13
#define REG_G2S_DB_BG1CNT_BGPLTTSLOT_SIZE                  1
#define REG_G2S_DB_BG1CNT_BGPLTTSLOT_MASK                  0x2000

#define REG_G2S_DB_BG1CNT_SCREENBASE_SHIFT                 8
#define REG_G2S_DB_BG1CNT_SCREENBASE_SIZE                  5
#define REG_G2S_DB_BG1CNT_SCREENBASE_MASK                  0x1f00

#define REG_G2S_DB_BG1CNT_COLORMODE_SHIFT                  7
#define REG_G2S_DB_BG1CNT_COLORMODE_SIZE                   1
#define REG_G2S_DB_BG1CNT_COLORMODE_MASK                   0x0080

#define REG_G2S_DB_BG1CNT_MOSAIC_SHIFT                     6
#define REG_G2S_DB_BG1CNT_MOSAIC_SIZE                      1
#define REG_G2S_DB_BG1CNT_MOSAIC_MASK                      0x0040

#define REG_G2S_DB_BG1CNT_CHARBASE_SHIFT                   2
#define REG_G2S_DB_BG1CNT_CHARBASE_SIZE                    4
#define REG_G2S_DB_BG1CNT_CHARBASE_MASK                    0x003c

#define REG_G2S_DB_BG1CNT_PRIORITY_SHIFT                   0
#define REG_G2S_DB_BG1CNT_PRIORITY_SIZE                    2
#define REG_G2S_DB_BG1CNT_PRIORITY_MASK                    0x0003

// G2S_DB_BG2CNT
#define REG_G2S_DB_BG2CNT_SCREENSIZE_SHIFT                 14
#define REG_G2S_DB_BG2CNT_SCREENSIZE_SIZE                  2
#define REG_G2S_DB_BG2CNT_SCREENSIZE_MASK                  0xc000

#define REG_G2S_DB_BG2CNT_AREAOVER_SHIFT                   13
#define REG_G2S_DB_BG2CNT_AREAOVER_SIZE                    1
#define REG_G2S_DB_BG2CNT_AREAOVER_MASK                    0x2000

#define REG_G2S_DB_BG2CNT_SCREENBASE_SHIFT                 8
#define REG_G2S_DB_BG2CNT_SCREENBASE_SIZE                  5
#define REG_G2S_DB_BG2CNT_SCREENBASE_MASK                  0x1f00

#define REG_G2S_DB_BG2CNT_COLORMODE_SHIFT                  7
#define REG_G2S_DB_BG2CNT_COLORMODE_SIZE                   1
#define REG_G2S_DB_BG2CNT_COLORMODE_MASK                   0x0080

#define REG_G2S_DB_BG2CNT_MOSAIC_SHIFT                     6
#define REG_G2S_DB_BG2CNT_MOSAIC_SIZE                      1
#define REG_G2S_DB_BG2CNT_MOSAIC_MASK                      0x0040

#define REG_G2S_DB_BG2CNT_CHARBASE_SHIFT                   2
#define REG_G2S_DB_BG2CNT_CHARBASE_SIZE                    4
#define REG_G2S_DB_BG2CNT_CHARBASE_MASK                    0x003c

#define REG_G2S_DB_BG2CNT_PRIORITY_SHIFT                   0
#define REG_G2S_DB_BG2CNT_PRIORITY_SIZE                    2
#define REG_G2S_DB_BG2CNT_PRIORITY_MASK                    0x0003

// G2S_DB_BG3CNT
#define REG_G2S_DB_BG3CNT_SCREENSIZE_SHIFT                 14
#define REG_G2S_DB_BG3CNT_SCREENSIZE_SIZE                  2
#define REG_G2S_DB_BG3CNT_SCREENSIZE_MASK                  0xc000

#define REG_G2S_DB_BG3CNT_AREAOVER_SHIFT                   13
#define REG_G2S_DB_BG3CNT_AREAOVER_SIZE                    1
#define REG_G2S_DB_BG3CNT_AREAOVER_MASK                    0x2000

#define REG_G2S_DB_BG3CNT_SCREENBASE_SHIFT                 8
#define REG_G2S_DB_BG3CNT_SCREENBASE_SIZE                  5
#define REG_G2S_DB_BG3CNT_SCREENBASE_MASK                  0x1f00

#define REG_G2S_DB_BG3CNT_COLORMODE_SHIFT                  7
#define REG_G2S_DB_BG3CNT_COLORMODE_SIZE                   1
#define REG_G2S_DB_BG3CNT_COLORMODE_MASK                   0x0080

#define REG_G2S_DB_BG3CNT_MOSAIC_SHIFT                     6
#define REG_G2S_DB_BG3CNT_MOSAIC_SIZE                      1
#define REG_G2S_DB_BG3CNT_MOSAIC_MASK                      0x0040

#define REG_G2S_DB_BG3CNT_CHARBASE_SHIFT                   2
#define REG_G2S_DB_BG3CNT_CHARBASE_SIZE                    4
#define REG_G2S_DB_BG3CNT_CHARBASE_MASK                    0x003c

#define REG_G2S_DB_BG3CNT_PRIORITY_SHIFT                   0
#define REG_G2S_DB_BG3CNT_PRIORITY_SIZE                    2
#define REG_G2S_DB_BG3CNT_PRIORITY_MASK                    0x0003

// G2_BG0OFS
#define REG_G2_BG0OFS_VOFFSET_SHIFT                        16
#define REG_G2_BG0OFS_VOFFSET_SIZE                         9
#define REG_G2_BG0OFS_VOFFSET_MASK                         0x01ff0000

#define REG_G2_BG0OFS_HOFFSET_SHIFT                        0
#define REG_G2_BG0OFS_HOFFSET_SIZE                         9
#define REG_G2_BG0OFS_HOFFSET_MASK                         0x000001ff

// G2_BG1OFS
#define REG_G2_BG1OFS_VOFFSET_SHIFT                        16
#define REG_G2_BG1OFS_VOFFSET_SIZE                         9
#define REG_G2_BG1OFS_VOFFSET_MASK                         0x01ff0000

#define REG_G2_BG1OFS_HOFFSET_SHIFT                        0
#define REG_G2_BG1OFS_HOFFSET_SIZE                         9
#define REG_G2_BG1OFS_HOFFSET_MASK                         0x000001ff

// G2_BG2OFS
#define REG_G2_BG2OFS_VOFFSET_SHIFT                        16
#define REG_G2_BG2OFS_VOFFSET_SIZE                         9
#define REG_G2_BG2OFS_VOFFSET_MASK                         0x01ff0000

#define REG_G2_BG2OFS_HOFFSET_SHIFT                        0
#define REG_G2_BG2OFS_HOFFSET_SIZE                         9
#define REG_G2_BG2OFS_HOFFSET_MASK                         0x000001ff

// G2_BG3OFS
#define REG_G2_BG3OFS_VOFFSET_SHIFT                        16
#define REG_G2_BG3OFS_VOFFSET_SIZE                         9
#define REG_G2_BG3OFS_VOFFSET_MASK                         0x01ff0000

#define REG_G2_BG3OFS_HOFFSET_SHIFT                        0
#define REG_G2_BG3OFS_HOFFSET_SIZE                         9
#define REG_G2_BG3OFS_HOFFSET_MASK                         0x000001ff

// G2S_DB_BG0OFS
#define REG_G2S_DB_BG0OFS_VOFFSET_SHIFT                    16
#define REG_G2S_DB_BG0OFS_VOFFSET_SIZE                     9
#define REG_G2S_DB_BG0OFS_VOFFSET_MASK                     0x01ff0000

#define REG_G2S_DB_BG0OFS_HOFFSET_SHIFT                    0
#define REG_G2S_DB_BG0OFS_HOFFSET_SIZE                     9
#define REG_G2S_DB_BG0OFS_HOFFSET_MASK                     0x000001ff

// G2S_DB_BG1OFS
#define REG_G2S_DB_BG1OFS_VOFFSET_SHIFT                    16
#define REG_G2S_DB_BG1OFS_VOFFSET_SIZE                     9
#define REG_G2S_DB_BG1OFS_VOFFSET_MASK                     0x01ff0000

#define REG_G2S_DB_BG1OFS_HOFFSET_SHIFT                    0
#define REG_G2S_DB_BG1OFS_HOFFSET_SIZE                     9
#define REG_G2S_DB_BG1OFS_HOFFSET_MASK                     0x000001ff

// G2S_DB_BG2OFS
#define REG_G2S_DB_BG2OFS_VOFFSET_SHIFT                    16
#define REG_G2S_DB_BG2OFS_VOFFSET_SIZE                     9
#define REG_G2S_DB_BG2OFS_VOFFSET_MASK                     0x01ff0000

#define REG_G2S_DB_BG2OFS_HOFFSET_SHIFT                    0
#define REG_G2S_DB_BG2OFS_HOFFSET_SIZE                     9
#define REG_G2S_DB_BG2OFS_HOFFSET_MASK                     0x000001ff

// G2S_DB_BG3OFS
#define REG_G2S_DB_BG3OFS_VOFFSET_SHIFT                    16
#define REG_G2S_DB_BG3OFS_VOFFSET_SIZE                     9
#define REG_G2S_DB_BG3OFS_VOFFSET_MASK                     0x01ff0000

#define REG_G2S_DB_BG3OFS_HOFFSET_SHIFT                    0
#define REG_G2S_DB_BG3OFS_HOFFSET_SIZE                     9
#define REG_G2S_DB_BG3OFS_HOFFSET_MASK                     0x000001ff

// Timer control

#define REG_OS_TM0CNT_L_TIMER0CNT_SHIFT                    0
#define REG_OS_TM0CNT_L_TIMER0CNT_SIZE                     16
#define REG_OS_TM0CNT_L_TIMER0CNT_MASK                     0xffff

#define REG_OS_TM0CNT_H_E_SHIFT                            7
#define REG_OS_TM0CNT_H_E_SIZE                             1
#define REG_OS_TM0CNT_H_E_MASK                             0x0080

#define REG_OS_TM0CNT_H_I_SHIFT                            6
#define REG_OS_TM0CNT_H_I_SIZE                             1
#define REG_OS_TM0CNT_H_I_MASK                             0x0040

#define REG_OS_TM0CNT_H_PS_SHIFT                           0
#define REG_OS_TM0CNT_H_PS_SIZE                            2
#define REG_OS_TM0CNT_H_PS_MASK                            0x0003

#define REG_OS_TM1CNT_L_TIMER0CNT_SHIFT                    0
#define REG_OS_TM1CNT_L_TIMER0CNT_SIZE                     16
#define REG_OS_TM1CNT_L_TIMER0CNT_MASK                     0xffff

#define REG_OS_TM1CNT_H_E_SHIFT                            7
#define REG_OS_TM1CNT_H_E_SIZE                             1
#define REG_OS_TM1CNT_H_E_MASK                             0x0080

#define REG_OS_TM1CNT_H_I_SHIFT                            6
#define REG_OS_TM1CNT_H_I_SIZE                             1
#define REG_OS_TM1CNT_H_I_MASK                             0x0040

#define REG_OS_TM1CNT_H_PS_SHIFT                           0
#define REG_OS_TM1CNT_H_PS_SIZE                            2
#define REG_OS_TM1CNT_H_PS_MASK                            0x0003

#define REG_OS_TM2CNT_L_TIMER0CNT_SHIFT                    0
#define REG_OS_TM2CNT_L_TIMER0CNT_SIZE                     16
#define REG_OS_TM2CNT_L_TIMER0CNT_MASK                     0xffff

#define REG_OS_TM2CNT_H_E_SHIFT                            7
#define REG_OS_TM2CNT_H_E_SIZE                             1
#define REG_OS_TM2CNT_H_E_MASK                             0x0080

#define REG_OS_TM2CNT_H_I_SHIFT                            6
#define REG_OS_TM2CNT_H_I_SIZE                             1
#define REG_OS_TM2CNT_H_I_MASK                             0x0040

#define REG_OS_TM2CNT_H_PS_SHIFT                           0
#define REG_OS_TM2CNT_H_PS_SIZE                            2
#define REG_OS_TM2CNT_H_PS_MASK                            0x0003

#define REG_OS_TM3CNT_L_TIMER0CNT_SHIFT                    0
#define REG_OS_TM3CNT_L_TIMER0CNT_SIZE                     16
#define REG_OS_TM3CNT_L_TIMER0CNT_MASK                     0xffff

#define REG_OS_TM3CNT_H_E_SHIFT                            7
#define REG_OS_TM3CNT_H_E_SIZE                             1
#define REG_OS_TM3CNT_H_E_MASK                             0x0080

#define REG_OS_TM3CNT_H_I_SHIFT                            6
#define REG_OS_TM3CNT_H_I_SIZE                             1
#define REG_OS_TM3CNT_H_I_MASK                             0x0040

#define REG_OS_TM3CNT_H_PS_SHIFT                           0
#define REG_OS_TM3CNT_H_PS_SIZE                            2
#define REG_OS_TM3CNT_H_PS_MASK                            0x0003

#define REG_G3X_DISP3DCNT_PRI_SHIFT                        14
#define REG_G3X_DISP3DCNT_PRI_SIZE                         1
#define REG_G3X_DISP3DCNT_PRI_MASK                         0x4000

#define REG_G3X_DISP3DCNT_GO_SHIFT                         13
#define REG_G3X_DISP3DCNT_GO_SIZE                          1
#define REG_G3X_DISP3DCNT_GO_MASK                          0x2000

#define REG_G3X_DISP3DCNT_RO_SHIFT                         12
#define REG_G3X_DISP3DCNT_RO_SIZE                          1
#define REG_G3X_DISP3DCNT_RO_MASK                          0x1000

#define REG_G3X_DISP3DCNT_FOG_SHIFT_SHIFT                  8
#define REG_G3X_DISP3DCNT_FOG_SHIFT_SIZE                   4
#define REG_G3X_DISP3DCNT_FOG_SHIFT_MASK                   0x0f00

#define REG_G3X_DISP3DCNT_FME_SHIFT                        7
#define REG_G3X_DISP3DCNT_FME_SIZE                         1
#define REG_G3X_DISP3DCNT_FME_MASK                         0x0080

#define REG_G3X_DISP3DCNT_FMOD_SHIFT                       6
#define REG_G3X_DISP3DCNT_FMOD_SIZE                        1
#define REG_G3X_DISP3DCNT_FMOD_MASK                        0x0040

#define REG_G3X_DISP3DCNT_EME_SHIFT                        5
#define REG_G3X_DISP3DCNT_EME_SIZE                         1
#define REG_G3X_DISP3DCNT_EME_MASK                         0x0020

#define REG_G3X_DISP3DCNT_AAE_SHIFT                        4
#define REG_G3X_DISP3DCNT_AAE_SIZE                         1
#define REG_G3X_DISP3DCNT_AAE_MASK                         0x0010

#define REG_G3X_DISP3DCNT_ABE_SHIFT                        3
#define REG_G3X_DISP3DCNT_ABE_SIZE                         1
#define REG_G3X_DISP3DCNT_ABE_MASK                         0x0008

#define REG_G3X_DISP3DCNT_ATE_SHIFT                        2
#define REG_G3X_DISP3DCNT_ATE_SIZE                         1
#define REG_G3X_DISP3DCNT_ATE_MASK                         0x0004

#define REG_G3X_DISP3DCNT_THS_SHIFT                        1
#define REG_G3X_DISP3DCNT_THS_SIZE                         1
#define REG_G3X_DISP3DCNT_THS_MASK                         0x0002

#define REG_G3X_DISP3DCNT_TME_SHIFT                        0
#define REG_G3X_DISP3DCNT_TME_SIZE                         1
#define REG_G3X_DISP3DCNT_TME_MASK                         0x0001

#ifndef SDK_ASM
#define REG_G3X_DISP3DCNT_FIELD( pri, go, ro, fog_shift, fme, fmod, eme, aae, abe, ate, ths, tme ) \
    (u16)( \
    ((u32)(pri) << REG_G3X_DISP3DCNT_PRI_SHIFT) | \
    ((u32)(go) << REG_G3X_DISP3DCNT_GO_SHIFT) | \
    ((u32)(ro) << REG_G3X_DISP3DCNT_RO_SHIFT) | \
    ((u32)(fog_shift) << REG_G3X_DISP3DCNT_FOG_SHIFT_SHIFT) | \
    ((u32)(fme) << REG_G3X_DISP3DCNT_FME_SHIFT) | \
    ((u32)(fmod) << REG_G3X_DISP3DCNT_FMOD_SHIFT) | \
    ((u32)(eme) << REG_G3X_DISP3DCNT_EME_SHIFT) | \
    ((u32)(aae) << REG_G3X_DISP3DCNT_AAE_SHIFT) | \
    ((u32)(abe) << REG_G3X_DISP3DCNT_ABE_SHIFT) | \
    ((u32)(ate) << REG_G3X_DISP3DCNT_ATE_SHIFT) | \
    ((u32)(ths) << REG_G3X_DISP3DCNT_THS_SHIFT) | \
    ((u32)(tme) << REG_G3X_DISP3DCNT_TME_SHIFT))
#endif

#endif //NITRO_HW_IO_REG_SHARED_H_
