#include <nitro.h>

SNDWork SNDi_Work;
SNDSharedWork *SNDi_SharedWork;

#ifdef SDK_ARM7

void SND_SetPlayerLocalVariable(int playerNo, int varNo, s16 var) {
    SNDi_SharedWork->player[playerNo].variable[varNo] = var;
}

void SND_SetPlayerGlobalVariable(int varNo, s16 var) {
    SNDi_SharedWork->globalVariable[varNo] = var;
}

void SND_UpdateSharedWork(void) {
    u16 channelStatus = 0;
    u16 captureStatus = 0;
    int chNo;

    if (SNDi_SharedWork == NULL) {
        return;
    }

    for (chNo = 0; chNo < SND_CHANNEL_NUM; chNo++) {
        if (SND_IsChannelActive(chNo)) {
            channelStatus |= (1 << chNo);
        }
    }

    if (SND_IsCaptureActive(SND_CAPTURE_0)) {
        captureStatus |= (1 << 0);
    }
    if (SND_IsCaptureActive(SND_CAPTURE_1)) {
        captureStatus |= (1 << 1);
    }

    SNDi_SharedWork->channelStatus = channelStatus;
    SNDi_SharedWork->captureStatus = captureStatus;
}

#endif //SDK_ARM7
