#include <nitro.h>

#define SND_PXI_FIFO_MESSAGE_BUFSIZE   8

#define SND_MSG_REQUEST_COMMAND_PROC   0

#define UNPACK_COMMAND( arg, shift, bit ) ( ( (arg) >> (shift) ) & ( ( 1 << (bit) ) - 1 ) )

OSMessage sCommandMesgBuffer[8];
OSMessageQueue sCommandMesgQueue;

static void InitPXI(void);
static void SetChannelTimer(u32 chBitMask, int timer);
static void SetChannelVolume(u32 chBitMask, int volume, SNDChannelDataShift shift);
static void SetChannelPan(u32 chBitMask, int pan);
static void StartTimer(u32 chBitMask, u32 capBitMask, u32 alarmBitMask, u32 /*flags */ );
static void StopTimer(u32 chBitMask, u32 capBitMask, u32 alarmBitMask, u32 flags);
static void ReadDriverInfo(SNDDriverInfo * info);

void SND_CommandInit(void) {
#ifdef SDK_ARM9
    SNDCommand *command;
    int i;
#endif //SDK_ARM9

#ifdef SDK_ARM7
    OS_InitMessageQueue(&sCommandMesgQueue, sCommandMesgBuffer, SND_PXI_FIFO_MESSAGE_BUFSIZE);
#endif //SDK_ARM7

    InitPXI();

#ifdef SDK_ARM9
    sFreeList = &sCommandArray[0];
    for (i = 0; i < SND_COMMAND_NUM - 1; i++) {
        sCommandArray[i].next = &sCommandArray[i + 1];
    }
    sCommandArray[SND_COMMAND_NUM - 1].next = NULL;
    sFreeListEnd = &sCommandArray[SND_COMMAND_NUM - 1];

    sReserveList = NULL;
    sReserveListEnd = NULL;

    sWaitingCommandListCount = 0;

    sWaitingCommandListQueueRead = 0;
    sWaitingCommandListQueueWrite = 0;

    sCurrentTag = 1;
    sFinishedTag = 0;

    SNDi_SharedWork = &sSharedWork;
    SNDi_InitSharedWork(SNDi_SharedWork);

    command = SND_AllocCommand(SND_COMMAND_BLOCK);
    if (command != NULL) {
        command->id = SND_COMMAND_SHARED_WORK;
        command->arg[0] = (u32)SNDi_SharedWork;

        SND_PushCommand(command);
        (void)SND_FlushCommand(SND_COMMAND_BLOCK);
    }

#else //SDK_ARM7

    SNDi_SharedWork = NULL;

#endif //SDK_ARM9
}

#ifdef SDK_ARM9
// TODO: port
#else //SDK_ARM7
void SND_CommandProc(void) {
    OSMessage message;
    const SNDCommand *command_p;
    SNDCommand command;

    while (OS_ReceiveMessage(&sCommandMesgQueue, &message, OS_MESSAGE_NOBLOCK)) {
        command_p = (const SNDCommand *)message;

        while (command_p != NULL) {
            command = *command_p;

            switch (command.id)
            {
            case SND_COMMAND_START_SEQ:
                SND_StartSeq((int)command.arg[0],
                             (const void *)command.arg[1],
                             command.arg[2], (struct SNDBankData *)command.arg[3]);
                break;

            case SND_COMMAND_STOP_SEQ:
                SND_StopSeq((int)command.arg[0]);
                break;

            case SND_COMMAND_PREPARE_SEQ:
                SND_PrepareSeq((int)command.arg[0],
                               (const void *)command.arg[1],
                               command.arg[2], (struct SNDBankData *)command.arg[3]);
                break;

            case SND_COMMAND_START_PREPARED_SEQ:
                SND_StartPreparedSeq((int)command.arg[0]);
                break;

            case SND_COMMAND_PAUSE_SEQ:
                SND_PauseSeq((int)command.arg[0], (BOOL)command.arg[1]);
                break;

            case SND_COMMAND_SKIP_SEQ:
                SND_SkipSeq((int)command.arg[0], (u32)command.arg[1]);
                break;

            case SND_COMMAND_PLAYER_PARAM:
                SNDi_SetPlayerParam((int)command.arg[0],
                                    command.arg[1], command.arg[2], (int)command.arg[3]);
                break;

            case SND_COMMAND_TRACK_PARAM:
                SNDi_SetTrackParam((int)UNPACK_COMMAND(command.arg[0], 0, 24),
                                   command.arg[1],
                                   command.arg[2],
                                   command.arg[3], (int)UNPACK_COMMAND(command.arg[0], 24, 8));
                break;

            case SND_COMMAND_MUTE_TRACK:
                SND_SetTrackMute((int)command.arg[0], command.arg[1], (SNDSeqMute) command.arg[2]);
                break;

            case SND_COMMAND_ALLOCATABLE_CHANNEL:
                SND_SetTrackAllocatableChannel((int)command.arg[0], command.arg[1], command.arg[2]);
                break;

            case SND_COMMAND_PLAYER_LOCAL_VAR:
                SND_SetPlayerLocalVariable((int)command.arg[0],
                                           (int)command.arg[1], (s16)command.arg[2]);
                break;

            case SND_COMMAND_PLAYER_GLOBAL_VAR:
                SND_SetPlayerGlobalVariable((int)command.arg[0], (s16)command.arg[1]);
                break;

            case SND_COMMAND_START_TIMER:
                StartTimer(command.arg[0], command.arg[1], command.arg[2], command.arg[3]);
                break;

            case SND_COMMAND_STOP_TIMER:
                StopTimer(command.arg[0], command.arg[1], command.arg[2], command.arg[3]);
                break;

            case SND_COMMAND_SETUP_CAPTURE:
                SND_SetupCapture((SNDCapture)UNPACK_COMMAND(command.arg[2], 31, 1),
                                 (SNDCaptureFormat)UNPACK_COMMAND(command.arg[2], 30, 1),
                                 (void *)command.arg[0],
                                 (int)command.arg[1],
                                 (BOOL)UNPACK_COMMAND(command.arg[2], 29, 1),
                                 (SNDCaptureIn)UNPACK_COMMAND(command.arg[2], 28, 1),
                                 (SNDCaptureOut)UNPACK_COMMAND(command.arg[2], 27, 1));
                break;

            case SND_COMMAND_SETUP_ALARM:
                SND_SetupAlarm((int)command.arg[0],
                               (OSTick)command.arg[1], (OSTick)command.arg[2], (int)command.arg[3]);
                break;

            case SND_COMMAND_CHANNEL_TIMER:
                SetChannelTimer((u32)command.arg[0], (int)command.arg[1]);
                break;

            case SND_COMMAND_CHANNEL_VOLUME:
                SetChannelVolume((u32)command.arg[0],
                                 (int)command.arg[1], (SNDChannelDataShift)command.arg[2]);
                break;

            case SND_COMMAND_CHANNEL_PAN:
                SetChannelPan((u32)command.arg[0], (int)command.arg[1]);
                break;

            case SND_COMMAND_SETUP_CHANNEL_PCM:
                SND_SetupChannelPcm((int)UNPACK_COMMAND(command.arg[0], 0, 16), /* chNo */
                                    (const void *)UNPACK_COMMAND(command.arg[1], 0, 27),        /* dataaddr */
                                    (SNDWaveFormat)UNPACK_COMMAND(command.arg[3], 24, 2),       /* format */
                                    (SNDChannelLoop)UNPACK_COMMAND(command.arg[3], 26, 2),      /* loop */
                                    (int)UNPACK_COMMAND(command.arg[3], 0, 16), /* loopStart */
                                    (int)UNPACK_COMMAND(command.arg[2], 0, 22), /* loopLen */
                                    (int)UNPACK_COMMAND(command.arg[2], 24, 7), /* volume */
                                    (SNDChannelDataShift)UNPACK_COMMAND(command.arg[2], 22, 2), /* shift */
                                    (int)UNPACK_COMMAND(command.arg[0], 16, 16),        /* timer */
                                    (int)UNPACK_COMMAND(command.arg[3], 16, 7)  /* pan */
                );
                break;

            case SND_COMMAND_SETUP_CHANNEL_PSG:
                SND_SetupChannelPsg((int)command.arg[0],        /* chNo */
                                    (SNDDuty)command.arg[3],    /* duty */
                                    (int)UNPACK_COMMAND(command.arg[1], 0, 7),  /* volume */
                                    (SNDChannelDataShift)UNPACK_COMMAND(command.arg[1], 8, 2),  /* shift */
                                    (int)UNPACK_COMMAND(command.arg[2], 8, 16), /* timer */
                                    (int)UNPACK_COMMAND(command.arg[2], 0, 7)   /* pan */
                );
                break;

            case SND_COMMAND_SETUP_CHANNEL_NOISE:
                SND_SetupChannelNoise((int)command.arg[0],      /* chNo */
                                      (int)UNPACK_COMMAND(command.arg[1], 0, 7),        /* volume */
                                      (SNDChannelDataShift)UNPACK_COMMAND(command.arg[1], 8, 2),        /* shift */
                                      (int)UNPACK_COMMAND(command.arg[2], 8, 16),       /* timer */
                                      (int)UNPACK_COMMAND(command.arg[2], 0, 7) /* pan */
                );
                break;

            case SND_COMMAND_SURROUND_DECAY:
                SNDi_SetSurroundDecay((int)command.arg[0]);
                break;

            case SND_COMMAND_MASTER_VOLUME:
                SND_SetMasterVolume((int)command.arg[0]);
                break;

            case SND_COMMAND_MASTER_PAN:
                SND_SetMasterPan((int)command.arg[0]);
                break;

            case SND_COMMAND_OUTPUT_SELECTOR:
                SND_SetOutputSelector((SNDOutput)command.arg[0],
                                      (SNDOutput)command.arg[1],
                                      (SNDChannelOut)command.arg[2], (SNDChannelOut)command.arg[3]);
                break;

            case SND_COMMAND_LOCK_CHANNEL:
                SND_LockChannel(command.arg[0], command.arg[1]);
                break;

            case SND_COMMAND_UNLOCK_CHANNEL:
                SND_UnlockChannel(command.arg[0], command.arg[1]);
                break;

            case SND_COMMAND_STOP_UNLOCKED_CHANNEL:
                SND_StopUnlockedChannel(command.arg[0], command.arg[1]);
                break;

            case SND_COMMAND_INVALIDATE_SEQ:
                SND_InvalidateSeq((const void *)command.arg[0], (const void *)command.arg[1]);
                break;

            case SND_COMMAND_INVALIDATE_BANK:
                SND_InvalidateBank((const void *)command.arg[0], (const void *)command.arg[1]);
                break;

            case SND_COMMAND_INVALIDATE_WAVE:
                SND_InvalidateWave((const void *)command.arg[0], (const void *)command.arg[1]);
                break;

            case SND_COMMAND_SHARED_WORK:
                SNDi_SharedWork = (SNDSharedWork *)command.arg[0];
                break;

            case SND_COMMAND_READ_DRIVER_INFO:
                ReadDriverInfo((SNDDriverInfo *) command.arg[0]);
                break;
            }

            command_p = command.next;

        }

        SNDi_SharedWork->finishCommandTag++;
    }
}


static void SetChannelTimer(u32 chBitMask, int timer) {
    int ch;

    for (ch = 0; ch < SND_CHANNEL_NUM && chBitMask != 0; ch++, chBitMask >>= 1) {
        if ((chBitMask & 0x01) == 0) {
            continue;
        }
        SND_SetChannelTimer(ch, timer);
    }
}

static void SetChannelVolume(u32 chBitMask, int volume, SNDChannelDataShift shift) {
    int ch;

    for (ch = 0; ch < SND_CHANNEL_NUM && chBitMask != 0; ch++, chBitMask >>= 1) {
        if ((chBitMask & 0x01) == 0) {
            continue;
        }
        SND_SetChannelVolume(ch, volume, shift);
    }
}

static void SetChannelPan(u32 chBitMask, int pan) {
    int ch;

    for (ch = 0; ch < SND_CHANNEL_NUM && chBitMask != 0; ch++, chBitMask >>= 1) {
        if ((chBitMask & 0x01) == 0) {
            continue;
        }
        SND_SetChannelPan(ch, pan);
    }
}


static void StartTimer(u32 chBitMask, u32 capBitMask, u32 alarmBitMask, u32 flags ) {
    OSIntrMode enabled;
    int i;

    enabled = OS_DisableInterrupts();

    for (i = 0; i < SND_CHANNEL_NUM && chBitMask != 0; i++, chBitMask >>= 1) {
        if ((chBitMask & 0x01) == 0) {
            continue;
        }
        SND_StartChannel(i);
    }

    if (capBitMask & (1 << SND_CAPTURE_0)) {
        if (capBitMask & (1 << SND_CAPTURE_1))
        {
            SND_StartCaptureBoth();
        } else {
            SND_StartCapture(SND_CAPTURE_0);
        }
    }
    else if (capBitMask & (1 << SND_CAPTURE_1)) {
        SND_StartCapture(SND_CAPTURE_1);
    }

    for (i = 0; i < SND_ALARM_NUM && alarmBitMask != 0; i++, alarmBitMask >>= 1) {
        if ((alarmBitMask & 0x01) == 0) {
            continue;
        }
        SND_StartAlarm(i);
    }

    (void)OS_RestoreInterrupts(enabled);

    SND_UpdateSharedWork();
}

static void StopTimer(u32 chBitMask, u32 capBitMask, u32 alarmBitMask, u32 flags) {
    OSIntrMode enabled;
    int i;

    enabled = OS_DisableInterrupts();

    for (i = 0; i < SND_ALARM_NUM && alarmBitMask != 0; i++, alarmBitMask >>= 1) {
        if ((alarmBitMask & 0x01) == 0) {
            continue;
        }
        SND_StopAlarm(i);
    }

    for (i = 0; i < SND_CHANNEL_NUM && chBitMask != 0; i++, chBitMask >>= 1) {
        if ((chBitMask & 0x01) == 0) {
            continue;
        }
        SND_StopChannel(i, (s32)flags);
    }

    if (capBitMask & (1 << SND_CAPTURE_0)) {
        SND_StopCapture(SND_CAPTURE_0);
    }
    if (capBitMask & (1 << SND_CAPTURE_1)) {
        SND_StopCapture(SND_CAPTURE_1);
    }

    (void)OS_RestoreInterrupts(enabled);

    SND_UpdateSharedWork();
}

static void ReadDriverInfo(SNDDriverInfo * info) {
    int ch;

    MI_CpuCopy32(&SNDi_Work, &info->work, sizeof(SNDi_Work));

    info->workAddress = &SNDi_Work;

    for (ch = 0; ch < SND_CHANNEL_NUM; ch++) {
        info->chCtrl[ch] = SND_GetChannelControl(ch);
    }

    info->lockedChannels = SND_GetLockedChannel(0);
}

#endif //SDK_ARM9

static void PxiFifoCallback(PXIFifoTag tag, u32 data, BOOL err) {
    OSIntrMode enabled;
    BOOL result;

    enabled = OS_DisableInterrupts();

#ifdef SDK_ARM9
    SNDi_CallAlarmHandler((int)data);
#else //SDK_ARM7
    if (data >= HW_MAIN_MEM) {
        result = OS_SendMessage(&sCommandMesgQueue, (OSMessage)data, OS_MESSAGE_NOBLOCK);
    } else {
        switch (data) {
        case SND_MSG_REQUEST_COMMAND_PROC:
        {
            (void)SND_SendWakeupMessage();
            break;
        }
        }
    }
#endif //SDK_ARM9

    (void)OS_RestoreInterrupts(enabled);
}

static void InitPXI(void) {
    PXI_SetFifoRecvCallback(PXI_FIFO_TAG_SOUND, PxiFifoCallback);

#ifdef SDK_ARM9
    if (IsCommandAvailable()) {
        while (!PXI_IsCallbackReady(PXI_FIFO_TAG_SOUND, PXI_PROC_ARM7)) {
            OS_SpinWait(100);
        }
    }
#endif
}
