#ifndef NITRO_SND_EXCHANNEL_H_
#define NITRO_SND_EXCHANNEL_H_

typedef enum SNDExChannelCallbackStatus {
    SND_EX_CHANNEL_CALLBACK_DROP,
    SND_EX_CHANNEL_CALLBACK_FINISH
} SNDExChannelCallbackStatus;

typedef enum SNDEnvStatus {
    SND_ENV_ATTACK,
    SND_ENV_DECAY,
    SND_ENV_SUSTAIN,
    SND_ENV_RELEASE
} SNDEnvStatus;

struct SNDExChannel;

typedef void (*SNDExChannelCallback) (struct SNDExChannel *ch_p, SNDExChannelCallbackStatus status, void *userData);

typedef struct SNDWaveParam {
    u8 format;
    u8 loopflag;
    u16 rate;
    u16 timer;
    u16 loopstart;
    u32 looplen;
} SNDWaveParam;

typedef struct SNDLfoParam {
    u8 target;
    u8 speed;
    u8 depth;
    u8 range;
    u16 delay;
} SNDLfoParam;

typedef struct SNDLfo {
    struct SNDLfoParam param;
    u16 delay_counter;
    u16 counter;
} SNDLfo;

typedef struct SNDExChannel {
    u8 myNo;
    u8 type;
    u8 env_status;
    u8 active_flag:1;
    u8 start_flag:1;
    u8 auto_sweep:1;
    u8 sync_flag:5;
    u8 pan_range;
    u8 original_key;
    s16 user_decay2;
    u8 key;
    u8 velocity;
    s8 init_pan;
    s8 user_pan;
    s16 user_decay;
    s16 user_pitch;
    s32 env_decay;
    s32 sweep_counter;
    s32 sweep_length;
    u8 attack;
    u8 sustain;
    u16 decay;
    u16 release;
    u8 prio;
    u8 pan;
    u16 volume;
    u16 timer;
    struct SNDLfo lfo;
    s16 sweep_pitch;
    s32 length;
    struct SNDWaveParam wave;
    union {
        const void *data;
        SNDDuty duty;
    };
    SNDExChannelCallback callback;
    void *callback_data;
    struct SNDExChannel *nextLink;
} SNDExChannel;

void SND_ExChannelInit(void);
void SND_UpdateExChannel(void);
void SND_ExChannelMain(u32 update);

#endif //NITRO_SND_EXCHANNEL_H_
