#ifndef POKEDIAMOND_ARM7_OS_MESSAGE_H
#define POKEDIAMOND_ARM7_OS_MESSAGE_H

#include "OS_thread.h"
#include "OS_context.h"
#include "nitro/types.h"
#include "nitro/OS_message_shared.h"

void OS_InitMessageQueue(OSMessageQueue *mq, OSMessage *msgArray, s32 msgCount);
BOOL OS_SendMessage(OSMessageQueue *mq, OSMessage msg, s32 flags);
BOOL OS_ReceiveMessage(OSMessageQueue *mq, OSMessage *msg, s32 flags);
BOOL OS_ReadMessage(OSMessageQueue *mq, OSMessage *msg, s32 flags);

#endif //POKEDIAMOND_ARM7_OS_MESSAGE_H
