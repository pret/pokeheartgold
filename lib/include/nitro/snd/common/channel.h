#ifndef NITRO_SND_CHANNEL_H_
#define NITRO_SND_CHANNEL_H_

#define SND_CHANNEL_NUM 16

#ifdef SDK_ARM7
void SND_StopChannel(int chNo, s32 flags);
#endif //SDK_ARM7

#endif //NITRO_SND_CHANNEL_H_
