#include <nitro.h>

extern int sWeakLockChannel;
//extern int sLockChannel;
#define sLockChannel (*(int *)((u32)&sWeakLockChannel + 4)) // -ipa file

void SND_ExChannelInit(void) {
    SNDExChannel *chn;
    s32 i;

    for (i = 0; i < SND_CHANNEL_NUM; i++) {
        chn = &SNDi_Work.channel[i];

        chn->myNo = (u8)i;
        chn->sync_flag = 0;
        chn->active_flag = FALSE;
    }

    sLockChannel = 0;
    sWeakLockChannel = 0;
}
