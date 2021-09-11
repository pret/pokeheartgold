/*
 * NOTE:
 * This file is shared between ARM9 and ARM7
 * DO NOT PUT PROC SPECIFIC CODE IN HERE
 * Thank You!
 */

#ifndef POKEDIAMOND_REGISTERS_SHARED_H
#define POKEDIAMOND_REGISTERS_SHARED_H

#include "nitro/types.h"

#define reg_OS_TM0CNT_L            (*(REGType16v *)0x4000100)
#define reg_OS_TM0CNT_H            (*(REGType16v *)0x4000102)
#define reg_OS_TM1CNT_L            (*(REGType16v *)0x4000104)
#define reg_OS_TM1CNT_H            (*(REGType16v *)0x4000106)
#define reg_OS_TM2CNT_L            (*(REGType16v *)0x4000108)
#define reg_OS_TM2CNT_H            (*(REGType16v *)0x400010a)
#define reg_OS_TM3CNT_L            (*(REGType16v *)0x400010c)
#define reg_OS_TM3CNT_H            (*(REGType16v *)0x400010e)

#define reg_OS_IME                 (*(REGType16v *)0x4000208)
#define reg_OS_IE                  (*(REGType32v *)0x4000210)
#define reg_OS_IF                  (*(REGType32v *)0x4000214)

#define REG_OS_TM0CNT_H_PS_SHIFT                           0

#endif //POKEDIAMOND_REGISTERS_SHARED_H
