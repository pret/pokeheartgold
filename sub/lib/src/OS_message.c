#include "OS_message.h"
#include "function_target.h"
#include "OS_system.h"
#include "OS_thread.h"

ARM_FUNC void OS_InitMessageQueue(OSMessageQueue *mq, OSMessage *msgArray, s32 msgCount)
{
    OS_InitThreadQueue(&mq->queueSend);
    OS_InitThreadQueue(&mq->queueReceive);
    mq->msgArray = msgArray;
    mq->msgCount = msgCount;
    mq->firstIndex = 0;
    mq->usedCount = 0;
}

ARM_FUNC BOOL OS_SendMessage(OSMessageQueue *mq, OSMessage msg, s32 flags)
{
    OSIntrMode enabled = OS_DisableInterrupts();

    while (mq->msgCount <= mq->usedCount)
    {
        if (!(flags & OS_MESSAGE_BLOCK))
        {
            (void)OS_RestoreInterrupts(enabled);
            return FALSE;
        }
        else
        {
            OS_SleepThread(&mq->queueSend);
        }
    }

    s32 lastIndex = (mq->firstIndex + mq->usedCount) % mq->msgCount;
    mq->msgArray[lastIndex] = msg;
    mq->usedCount++;

    OS_WakeupThread(&mq->queueReceive);

    (void)OS_RestoreInterrupts(enabled);
    return TRUE;
}

ARM_FUNC BOOL OS_ReceiveMessage(OSMessageQueue *mq, OSMessage *msg, s32 flags)
{
    OSIntrMode enabled = OS_DisableInterrupts();

    while (mq->usedCount == 0)
    {
        if (!(flags & OS_MESSAGE_BLOCK))
        {
            (void)OS_RestoreInterrupts(enabled);
            return FALSE;
        }
        else
        {
            OS_SleepThread(&mq->queueReceive);
        }
    }

    if (msg != NULL)
    {
        *msg = mq->msgArray[mq->firstIndex];
    }
    mq->firstIndex = (mq->firstIndex + 1) % mq->msgCount;
    mq->usedCount--;

    OS_WakeupThread(&mq->queueSend);

    (void)OS_RestoreInterrupts(enabled);
    return TRUE;
}

ARM_FUNC BOOL OS_ReadMessage(OSMessageQueue *mq, OSMessage *msg, s32 flags)
{
    OSIntrMode enabled = OS_DisableInterrupts();

    while (mq->usedCount == 0)
    {
        if (!(flags & OS_MESSAGE_BLOCK))
        {
            (void)OS_RestoreInterrupts(enabled);
            return FALSE;
        }
        else
        {
            OS_SleepThread(&mq->queueReceive);
        }
    }

    if (msg != NULL)
    {
        *msg = mq->msgArray[mq->firstIndex];
    }

    (void)OS_RestoreInterrupts(enabled);
    return TRUE;
}
