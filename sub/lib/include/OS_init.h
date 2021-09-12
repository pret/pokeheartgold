#ifndef NITRO_SUB_OS_INIT_H
#define NITRO_SUB_OS_INIT_H

#include "nitro/types.h"
#include "consts.h"
#include "OS_system.h"
#include "OS_arena.h"
#include "OS_alloc.h"
#include "OS_reset.h"
#include "OS_terminate_proc.h"
#include "OS_spinLock.h"
#include "OS_context.h"
#include "OS_interrupt.h"
#include "OS_irqTable.h"
#include "OS_timer.h"
#include "OS_tick.h"
#include "OS_message.h"

void OS_Init(void);

#endif //NITRO_SUB_OS_INIT_H
