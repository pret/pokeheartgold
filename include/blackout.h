#ifndef POKEHEARTGOLD_BLACKOUT_H
#define POKEHEARTGOLD_BLACKOUT_H

#include "global.h"

#include "field_system.h"
#include "message_format.h"
#include "msgdata.h"
#include "task.h"

typedef struct BlackoutScreenEnvironment {
    s32 state;
    FieldSystem *fieldSystem;
    BgConfig *bgConfig;
    Window window;
    MsgData *msgData;
    MessageFormat *msgFmt;
} BlackoutScreenEnvironment;

BOOL Task_Blackout(TaskManager *taskManager);
void CallTask_Blackout(TaskManager *taskManager);

#endif // POKEHEARTGOLD_BLACKOUT_H
