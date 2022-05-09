#ifndef NITRO_SND_EXCHANNEL_H_
#define NITRO_SND_EXCHANNEL_H_

#define SND_EX_CHANNEL_UPDATE_START  (0x01 << 0)
#define SND_EX_CHANNEL_UPDATE_STOP   (0x01 << 1)
#define SND_EX_CHANNEL_UPDATE_TIMER  (0x01 << 2)
#define SND_EX_CHANNEL_UPDATE_VOLUME (0x01 << 3)
#define SND_EX_CHANNEL_UPDATE_PAN    (0x01 << 4)

typedef enum SNDExChannelType {
    SND_EX_CHANNEL_PCM,
    SND_EX_CHANNEL_PSG,
    SND_EX_CHANNEL_NOISE
} SNDExChannelType;

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

typedef enum SNDLfoTarget {
    SND_LFO_PITCH,
    SND_LFO_VOLUME,
    SND_LFO_PAN
} SNDLfoTarget;

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

#ifdef SDK_ARM7
void SND_ExChannelInit(void);
void SND_UpdateExChannel(void);
void SND_ExChannelMain(BOOL step);
s32 SND_UpdateExChannelEnvelope(SNDExChannel *ch_p, BOOL doPeriodicProc);
void SND_SetExChannelAttack(struct SNDExChannel *ch_p, int attack);
void SND_SetExChannelDecay(struct SNDExChannel *ch_p, int decay);
void SND_SetExChannelSustain(struct SNDExChannel *ch_p, int sustain);
void SND_SetExChannelRelease(struct SNDExChannel *ch_p, int release);
void SND_InitLfoParam(SNDLfoParam *lfo);
s32 SND_GetLfoValue(SNDLfo *lfo);
void SND_StartLfo(SNDLfo *lfo);
void SND_UpdateLfo(SNDLfo *lfo);
void SND_LockChannel(u32 chBitMask, u32 flags);
void SND_UnlockChannel(u32 chBitMask, u32 flags);
void SND_StopUnlockedChannel(u32 chBitMask, u32 flags);
u32 SND_GetLockedChannel(u32 flags);
#endif //SDK_ARM7

#endif //NITRO_SND_EXCHANNEL_H_
