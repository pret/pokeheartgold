#ifndef NITRO_SND_WORK_H_
#define NITRO_SND_WORK_H_

typedef struct SNDChannelInfo {
    BOOL activeFlag: 1;
    BOOL lockFlag: 1;
    u16 volume;
    u8 pan;
    u8 pad_;
    SNDEnvStatus envStatus;
} SNDChannelInfo;

typedef struct SNDTrackInfo {
    u16 prgNo;
    u8 volume;
    u8 volume2;
    s8 pitchBend;
    u8 bendRange;
    u8 pan;
    s8 transpose;
    u8 pad_;
    u8 chCount;
    u8 channel[SND_CHANNEL_NUM];
} SNDTrackInfo;

typedef struct SNDWork {
    SNDExChannel channel[SND_CHANNEL_NUM];
    SNDPlayer player[SND_PLAYER_NUM];
    SNDTrack track[SND_TRACK_NUM];
    SNDAlarm alarm[SND_ALARM_NUM];
} SNDWork;

extern SNDWork SNDi_Work;
extern SNDWork *SND_SharedWork;

static inline SNDWork *SND_GetWork(void) {
    return &SNDi_Work;
}

void SND_UpdateSharedWork(void);

#endif //NITRO_SND_WORK_H_
