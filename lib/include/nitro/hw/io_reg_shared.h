/*
 * NOTE:
 * This file is shared between ARM9 and ARM7
 * DO NOT PUT PROC SPECIFIC CODE IN HERE
 * Thank You!
 */

#ifndef NITRO_HW_IO_REG_SHARED_H_
#define NITRO_HW_IO_REG_SHARED_H_

#define HW_REG_BASE                0x04000000

#define REG_IME_OFFSET             0x208

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

#define reg_OS_IME                 (*(REGType16v *)(HW_REG_BASE + REG_IME_OFFSET))
#define reg_OS_IE                  (*(REGType32v *)0x4000210)
#define reg_OS_IF                  (*(REGType32v *)0x4000214)

#define REG_OS_TM0CNT_H_PS_SHIFT                           0

#endif //NITRO_HW_IO_REG_SHARED_H_
