#ifndef NITRO_SND_EXCHANNEL_H_
#define NITRO_SND_EXCHANNEL_H_

typedef enum SNDEnvStatus {
    SND_ENV_ATTACK,
    SND_ENV_DECAY,
    SND_ENV_SUSTAIN,
    SND_ENV_RELEASE
} SNDEnvStatus;

void SND_ExChannelInit(void);
void SND_UpdateExChannel(void);
void SND_ExChannelMain(u32 update);

#endif //NITRO_SND_EXCHANNEL_H_
