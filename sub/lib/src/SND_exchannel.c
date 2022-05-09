#include <nitro.h>

int sLockChannel;
int sWeakLockChannel;

static void StartExChannel(struct SNDExChannel *chn, int length);
static u16 CalcRelease(int vol);
static void ExChannelSetup(struct SNDExChannel *chn, SNDExChannelCallback callback, void *callbackUserData, int priority);
static int ExChannelVolumeCmp(struct SNDExChannel *chn_a, struct SNDExChannel *chn_b);
static int ExChannelLfoUpdate(struct SNDExChannel *chn, BOOL step);
static int ExChannelSweepUpdate(struct SNDExChannel *chn, BOOL step);

extern const s16 SNDi_DecibelTable[];

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

void SND_UpdateExChannel(void) {
    struct SNDExChannel *chn;
    s32 i;

    for (i = 0; i < SND_CHANNEL_NUM; i++) {
        chn = &SNDi_Work.channel[i];

        if (chn->sync_flag == 0) {
            continue;
        }

        if (chn->sync_flag & SND_EX_CHANNEL_UPDATE_STOP) {
            SND_StopChannel(i, 0);
        }

        if (chn->sync_flag & SND_EX_CHANNEL_UPDATE_START) {
            switch (chn->type) {
            case SND_EX_CHANNEL_PCM:
                SND_SetupChannelPcm(i,
                                    chn->data,
                                    chn->wave.format,
                                    chn->wave.loopflag ? SND_CHANNEL_LOOP_REPEAT : SND_CHANNEL_LOOP_1SHOT,
                                    (s32)chn->wave.loopstart,
                                    (s32)chn->wave.looplen,
                                    chn->volume & 0xFF,
                                    chn->volume >> 8,
                                    chn->timer,
                                    chn->pan);
                break;
            case SND_EX_CHANNEL_PSG:
                SND_SetupChannelPsg(i,
                                    chn->duty,
                                    chn->volume & 0xFF,
                                    chn->volume >> 8,
                                    chn->timer,
                                    chn->pan);
                break;
            case SND_EX_CHANNEL_NOISE:
                SND_SetupChannelNoise(
                    i, chn->volume & 0xFF, chn->volume >> 8, chn->timer, chn->pan);
                break;
            }
        } else {
            if (chn->sync_flag & SND_EX_CHANNEL_UPDATE_TIMER) {
                SND_SetChannelTimer(i, chn->timer);
            }
            if (chn->sync_flag & SND_EX_CHANNEL_UPDATE_VOLUME) {
                SND_SetChannelVolume(i, chn->volume & 0xFF, chn->volume >> 8);
            }
            if (chn->sync_flag & SND_EX_CHANNEL_UPDATE_PAN) {
                SND_SetChannelPan(i, chn->pan);
            }
        }
    }

    for (i = 0; i < SND_CHANNEL_NUM; i++) {
        chn = &SNDi_Work.channel[i];

        if (!chn->sync_flag)
            continue;

        if (chn->sync_flag & SND_EX_CHANNEL_UPDATE_START) {
            reg_SOUNDxCNT_STAT(i) |= REG_SND_SOUNDCNT_8_E_MASK;
        }
        chn->sync_flag = 0;
    }
}

void SND_ExChannelMain(BOOL step) {
    struct SNDExChannel *chn;
    s32 i;
    s32 vol;
    s32 pitch;
    s32 pan;
    s32 lfo;
    u16 newTimer;

    for (i = 0; i < SND_CHANNEL_NUM; i++) {
        vol = 0;
        pitch = 0;
        pan = 0;
        chn = &SNDi_Work.channel[i];

        if (!chn->active_flag) {
            continue;
        }

        if (chn->start_flag)
        {
            chn->sync_flag |= SND_EX_CHANNEL_UPDATE_START;
            chn->start_flag = FALSE;
        } else if (!SND_IsChannelActive(i)) {
            if (chn->callback) {
                chn->callback(chn, SND_EX_CHANNEL_CALLBACK_FINISH, chn->callback_data);
            } else {
                chn->prio = 0;
            }
            chn->volume = 0;
            chn->active_flag = FALSE;
            continue;
        }

        vol += SNDi_DecibelTable[chn->velocity];
        pitch += (chn->key - chn->original_key) * 0x40;

        vol += SND_UpdateExChannelEnvelope(chn, step);
        pitch += ExChannelSweepUpdate(chn, step);

        vol += chn->user_decay;
        vol += chn->user_decay2;
        pitch += chn->user_pitch;

        lfo = ExChannelLfoUpdate(chn, step);

        switch (chn->lfo.param.target) {
        case SND_LFO_VOLUME:
            if (vol > -0x8000)
                vol += lfo;
            break;
        case SND_LFO_PAN:
            pan += lfo;
            break;
        case SND_LFO_PITCH:
            pitch += lfo;
            break;
        }

        pan += chn->init_pan;
        if (chn->pan_range != 127) {
            pan = (pan * chn->pan_range + 0x40) >> 7;
        }
        pan += chn->user_pan;

        if (chn->env_status == SND_ENV_RELEASE && vol <= -723) {
            chn->sync_flag = SND_EX_CHANNEL_UPDATE_STOP;
            if (chn->callback) {
                chn->callback(chn, SND_EX_CHANNEL_CALLBACK_FINISH, chn->callback_data);
            } else {
                chn->prio = 0;
            }
            chn->volume = 0;
            chn->active_flag = 0;
        } else {
            vol = SND_CalcChannelVolume(vol);
            newTimer = SND_CalcTimer(chn->wave.timer, pitch);

            if (chn->type == SND_EX_CHANNEL_PSG) {
                newTimer &= 0xFFFC;
            }

            pan += 0x40;
            if (pan < 0) {
                pan = 0;
            } else if (pan > 127) {
                pan = 127;
            }

            if (vol != chn->volume) {
                chn->volume = (u16)vol;
                chn->sync_flag |= SND_EX_CHANNEL_UPDATE_VOLUME;
            }
            if (newTimer != chn->timer) {
                chn->timer = (u16)newTimer;
                chn->sync_flag |= SND_EX_CHANNEL_UPDATE_TIMER;
            }
            if (pan != chn->pan) {
                chn->pan = (u8)pan;
                chn->sync_flag |= SND_EX_CHANNEL_UPDATE_PAN;
            }
        }
    }
}

BOOL SND_StartExChannelPcm(struct SNDExChannel *chn, const struct SNDWaveParam *wave, const void *data, s32 length) {
    chn->type = SND_EX_CHANNEL_PCM;
    chn->wave = *wave;
    chn->data = data;
    StartExChannel(chn, length);
    return TRUE;
}

BOOL SND_StartExChannelPsg(struct SNDExChannel *chn, s32 duty, s32 length) {
    if (chn->myNo < 8) {
        return FALSE;
    } else if (chn->myNo > 13) {
        return FALSE;
    } else {
        chn->type = SND_EX_CHANNEL_PSG;
        chn->duty = duty;
        chn->wave.timer = 8006;
        StartExChannel(chn, length);
        return TRUE;
    }
}

BOOL SND_StartExChannelNoise(struct SNDExChannel *chn, s32 length) {
    if (chn->myNo < 14) {
        return FALSE;
    } else if (chn->myNo > 15) {
        return FALSE;
    } else {
        chn->type = SND_EX_CHANNEL_NOISE;
        chn->wave.timer = 8006;
        StartExChannel(chn, length);
        return TRUE;
    }
}

s32 SND_UpdateExChannelEnvelope(struct SNDExChannel *chn, BOOL step) {
    s32 sustain;

    if (step) {
        switch (chn->env_status) {
        case SND_ENV_ATTACK:
            chn->env_decay = -((-chn->env_decay * chn->attack) >> 8);
            if (chn->env_decay == 0) {
                chn->env_status = SND_ENV_DECAY;
            }
            break;
        case SND_ENV_DECAY:
            sustain = SNDi_DecibelTable[chn->sustain] << 7;
            chn->env_decay -= chn->decay;
            if (chn->env_decay <= sustain) {
                chn->env_decay = sustain;
                chn->env_status = SND_ENV_SUSTAIN;
            }
            break;
        case SND_ENV_SUSTAIN:
            break;
        case SND_ENV_RELEASE:
            chn->env_decay -= chn->release;
            break;
        }
    }

    return chn->env_decay >> 7;
}

void SND_SetExChannelAttack(SNDExChannel *ch_p, int attack) {
    extern const u8 SND_SetExChannelAttack__sinit__attack_table[];
    if (attack < 109) {
        ch_p->attack = (u8)(255 - attack);
    } else {
        ch_p->attack = SND_SetExChannelAttack__sinit__attack_table[127 - attack];
    }
}

void SND_SetExChannelDecay(SNDExChannel *ch_p, int decay) {
    ch_p->decay = CalcRelease(decay);
}

void SND_SetExChannelSustain(SNDExChannel *ch_p, int sustain) {
    ch_p->sustain = sustain;
}

void SND_SetExChannelRelease(SNDExChannel *ch_p, int release) {
    ch_p->release = CalcRelease(release);
}

void SND_ReleaseExChannel(struct SNDExChannel *chn) {
    chn->env_status = SND_ENV_RELEASE;
}

BOOL SND_IsExChannelActive(struct SNDExChannel *chn) {
    return chn->active_flag;
}

SNDExChannel *SND_AllocExChannel(u32 channelMask, int priority, u32 flags, SNDExChannelCallback callback, void *callbackUserData) {
    struct SNDExChannel *chnPrev;
    int i;
    struct SNDExChannel *chn;
    u8 channelCandidate;
    extern u8 SND_AllocExChannel__sinit__channel_order[];

    channelMask &= ~sLockChannel;
    if (flags == 0) {
        channelMask &= ~sWeakLockChannel;
    }

    chnPrev = NULL;

    for (i = 0; i < SND_CHANNEL_NUM; i++) {
        channelCandidate = SND_AllocExChannel__sinit__channel_order[i];

        if (channelMask & (1 << channelCandidate)) {
            chn = &SNDi_Work.channel[channelCandidate];

            if (chnPrev == NULL) {
                chnPrev = chn;
                continue;
            }

            if (chn->prio > chnPrev->prio) {
                continue;
            }

            if (chn->prio != chnPrev->prio || ExChannelVolumeCmp(chnPrev, chn) < 0) {
                chnPrev = chn;
            }
        }
    }

    if (chnPrev == NULL) {
        return NULL;
    }

    if (priority < chnPrev->prio) {
        return NULL;
    }

    if (chnPrev->callback) {
        chnPrev->callback(chnPrev, SND_EX_CHANNEL_CALLBACK_DROP, chnPrev->callback_data);
    }

    chnPrev->sync_flag = SND_EX_CHANNEL_UPDATE_STOP;
    chnPrev->active_flag = FALSE;
    ExChannelSetup(chnPrev, callback, callbackUserData, priority);
    return chnPrev;
}

void SND_FreeExChannel(struct SNDExChannel *chn) {
    if (chn) {
        chn->callback = NULL;
        chn->callback_data = NULL;
    }
}

void SND_StopUnlockedChannel(u32 channelMask, u32 flags) {
    SNDExChannel *chn;
    int i;

    for (i = 0; i < SND_CHANNEL_NUM && channelMask != 0; i++, channelMask >>= 1) {
        if ((channelMask & 1) == 0) {
            continue;
        }

        chn = &SNDi_Work.channel[i];

        if (sLockChannel & (1 << i)) {
            continue;
        }

        if (chn->callback) {
            chn->callback(chn, SND_EX_CHANNEL_CALLBACK_DROP, chn->callback_data);
        }

        SND_StopChannel(i, 0);
        chn->prio = 0;
        SND_FreeExChannel(chn);
        chn->sync_flag = 0;
        chn->active_flag = 0;
    }
}

void SND_LockChannel(u32 channelMask, u32 weak) {
    struct SNDExChannel *chn;
    u32 j = channelMask;
    int i = 0;

    for (; i < SND_CHANNEL_NUM && j != 0; i++, j >>= 1) {
        if ((j & 1) == 0) {
            continue;
        }

        chn = &SNDi_Work.channel[i];

        if (sLockChannel & (1 << i)) {
            continue;
        }

        if (chn->callback) {
            chn->callback(chn, 0, chn->callback_data);
        }

        SND_StopChannel(i, 0);
        chn->prio = 0;
        SND_FreeExChannel(chn);
        chn->sync_flag = 0;
        chn->active_flag = 0;
    }

    if (weak & 1) {
        sWeakLockChannel |= channelMask;
    } else {
        sLockChannel |= channelMask;
    }
}

void SND_UnlockChannel(u32 channelMask, u32 weak) {
    if (weak & 1) {
        sWeakLockChannel &= ~channelMask;
    } else {
        sLockChannel &= ~channelMask;
    }
}

u32 SND_GetLockedChannel(u32 weak) {
    if (weak & 1) {
        return sWeakLockChannel;
    } else {
        return sLockChannel;
    }
}

void SND_InvalidateWave(const void *start, const void *end) {
    for (u8 i = 0; i < SND_CHANNEL_NUM; i++) {
        struct SNDExChannel *chn = &SNDi_Work.channel[i];

        if (chn->active_flag && chn->type == 0 && start <= chn->data &&
            chn->data <= end) {
            chn->start_flag = FALSE;
            SND_StopChannel(i, 0);
        }
    }
}

void SND_InitLfoParam(SNDLfoParam *lfoParam) {
    lfoParam->target = SND_LFO_PITCH;
    lfoParam->depth = 0;
    lfoParam->range = 1;
    lfoParam->speed = 16;
    lfoParam->delay = 0;
}

void SND_StartLfo(SNDLfo *lfo) {
    lfo->counter = 0;
    lfo->delay_counter = 0;
}

void SND_UpdateLfo(SNDLfo *lfo)
{
    if (lfo->delay_counter < lfo->param.delay)
    {
        lfo->delay_counter++;
    }
    else
    {
        u32 tmp = lfo->counter;
        tmp += lfo->param.speed << 6;
        tmp >>= 8;
        while (tmp >= 0x80)
        {
            tmp -= 0x80;
        }
        lfo->counter += lfo->param.speed << 6;
        lfo->counter &= 0xFF;
        lfo->counter |= tmp << 8;
    }
}

s32 SND_GetLfoValue(struct SNDLfo *lfo) {
    if (lfo->param.depth == 0) {
        return 0;
    } else if (lfo->delay_counter < lfo->param.delay) {
        return 0;
    } else {
        return SND_SinIdx((s32)((u32)lfo->counter >> 8)) * lfo->param.depth * lfo->param.range;
    }
}

u16 CalcRelease(int vol) {
    if (vol == 127) {
        return 0xFFFF;
    } else if (vol == 126) {
        return 0x3C00;
    } else if (vol < 50) {
        return (u16)(vol * 2 + 1);
    } else {
        return (u16)(0x1E00 / (126 - vol));
    }
}

static void StartExChannel(struct SNDExChannel *chn, int length) {
    chn->env_decay = -92544;
    chn->env_status = 0;
    chn->length = length;
    SND_StartLfo(&chn->lfo);
    chn->start_flag = TRUE;
    chn->active_flag = TRUE;
}

static void ExChannelSetup(SNDExChannel *chn, SNDExChannelCallback callback, void *callbackUserData, int priority) {
    chn->nextLink = NULL;
    chn->callback = callback;
    chn->callback_data = callbackUserData;
    chn->length = 0;
    chn->prio = (u8)priority;
    chn->volume = 127;
    chn->start_flag = FALSE;
    chn->auto_sweep = TRUE;
    chn->key = 60;
    chn->original_key = 60;
    chn->velocity = 127;
    chn->init_pan = 0;
    chn->user_decay = 0;
    chn->user_decay2 = 0;
    chn->user_pitch = 0;
    chn->user_pan = 0;
    chn->pan_range = 127;
    chn->sweep_pitch = 0;
    chn->sweep_length = 0;
    chn->sweep_counter = 0;
    chn->attack = 0;
    chn->decay = 0xFFFF;
    chn->sustain = 127;
    chn->release = 0xFFFF;
    SND_InitLfoParam(&chn->lfo.param);
}

static int ExChannelVolumeCmp(struct SNDExChannel *chn_a, struct SNDExChannel *chn_b) {
    extern const u8 SND_AllocExChannel__sinit__shift[];
    int vol_a = chn_a->volume & 0xFF;
    int vol_b = chn_b->volume & 0xFF;

    vol_a <<= 4;
    vol_b <<= 4;

    vol_a >>= SND_AllocExChannel__sinit__shift[chn_a->volume >> 8];
    vol_b >>= SND_AllocExChannel__sinit__shift[chn_b->volume >> 8];

    if (vol_a != vol_b) {
        if (vol_a < vol_b) {
            return 1;
        } else {
            return -1;
        }
    }
    return 0;
}

static int ExChannelSweepUpdate(struct SNDExChannel *chn, BOOL step) {
    s64 result;

    if (chn->sweep_pitch == 0) {
        result = 0;
    } else if (chn->sweep_counter >= chn->sweep_length) {
        result = 0;
    } else {
        result = (s64)chn->sweep_pitch * (chn->sweep_length - chn->sweep_counter) / chn->sweep_length;

        if (step && chn->auto_sweep) {
            chn->sweep_counter++;
        }
    }

    return (int)result;
}

static int ExChannelLfoUpdate(struct SNDExChannel *chn, BOOL step) {
    s64 result = SND_GetLfoValue(&chn->lfo);

    if (result != 0) {
        switch (chn->lfo.param.target) {
        case SND_LFO_VOLUME:
            result *= 60;
            break;
        case SND_LFO_PITCH:
            result <<= 6;
            break;
        case SND_LFO_PAN:
            result <<= 6;
            break;
        }
        result >>= 14;
    }

    if (step) {
        SND_UpdateLfo(&chn->lfo);
    }

    return (int)result;
}