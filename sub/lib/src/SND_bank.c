#include <nitro.h>

BOOL SND_ReadInstData(const SNDBankData *bank, int prgNo, int key, SNDInstData *inst) {
    u32 instOffset;

    if (prgNo < 0) {
        return FALSE;
    }

    SNDi_LockMutex();

    if (prgNo >= bank->instCount) {
        SNDi_UnlockMutex();
        return FALSE;
    }

    instOffset = bank->instOffset[prgNo];
    inst->type = (u8)(instOffset & 0xff);
    instOffset >>= 8;

    switch (inst->type) {
    case SND_INST_PCM:
    case SND_INST_PSG:
    case SND_INST_NOISE:
    case SND_INST_DIRECTPCM:
    case SND_INST_NULL: {
        const SNDInstParam *param = (const SNDInstParam *)((u8 *)bank + instOffset);

        inst->param = *param;
        break;
    }

    case SND_INST_DRUM_SET: {
        const SNDDrumSet *drumSet = (const SNDDrumSet *)((u8 *)bank + instOffset);
        u8 min = MI_ReadByte(&drumSet->min);
        u8 max = MI_ReadByte(&drumSet->max);

        if (key < min || key > max)
        {
            SNDi_UnlockMutex();
            return FALSE;
        }

        *inst = drumSet->instOffset[key - min];     // structure copy
        break;
    }

    case SND_INST_KEY_SPLIT: {
        int index = 0;
        const SNDKeySplit *keySplit = (const SNDKeySplit *)((u8 *)bank + instOffset);

        while (key > MI_ReadByte(&keySplit->key[index])) {
            index++;
            if (index >= SND_INST_KEYSPLIT_MAX) {
                SNDi_UnlockMutex();
                return FALSE;
            }
        }

        *inst = keySplit->instOffset[index];        // structure copy
        break;
    }

    case SND_INST_INVALID:
    default:
        SNDi_UnlockMutex();
        return FALSE;
    }

    SNDi_UnlockMutex();

    return TRUE;
}

const SNDWaveData *SND_GetWaveDataAddress(const SNDWaveArc *waveArc, int index) {
    const SNDWaveData *wave;
    u32 offset;

    SNDi_LockMutex();

    offset = waveArc->waveOffset[index];

    if (offset != 0) {
        if (offset < HW_MAIN_MEM) {
            wave = (const SNDWaveData *)((u8 *)waveArc + offset);
        } else {
            wave = (const SNDWaveData *)offset;
        }
    } else {
        wave = NULL;
    }

    SNDi_UnlockMutex();

    return wave;
}

#ifdef SDK_ARM7
static const SNDWaveData *GetWaveData(const SNDBankData *bank, int waveArcNo, int waveIndex);

BOOL SND_NoteOn(SNDExChannel *ch_p, int key, int velocity, s32 length, const SNDBankData *bank, const SNDInstData *inst) {
    const SNDWaveData *wave_data;
    int release;
    BOOL result;

    release = inst->param.release;
    if (inst->param.release == SND_BANK_DISABLE_RELEASE) {
        length = -1;
        release = 0;
    }

    switch (inst->type) {
    case SND_INST_PCM:
    case SND_INST_DIRECTPCM:
        if (inst->type == SND_INST_PCM) {
            wave_data = GetWaveData(bank, inst->param.wave[1], inst->param.wave[0]);
        } else {
            wave_data = (const SNDWaveData *)(inst->param.wave[1] << 16 | inst->param.wave[0]);
        }

        if (wave_data != NULL)
        {
            result = SND_StartExChannelPcm(ch_p, &wave_data->param, wave_data->samples, length);
        } else {
            result = FALSE;
        }
        break;

    case SND_INST_PSG:
        result = SND_StartExChannelPsg(ch_p, (SNDDuty)inst->param.wave[0], length);
        break;

    case SND_INST_NOISE:
        result = SND_StartExChannelNoise(ch_p, length);
        break;

    default:
        result = FALSE;
        break;
    }

    if (!result)
        return FALSE;

    ch_p->key = (u8)key;
    ch_p->original_key = inst->param.original_key;
    ch_p->velocity = (u8)velocity;

    SND_SetExChannelAttack(ch_p, inst->param.attack);
    SND_SetExChannelDecay(ch_p, inst->param.decay);
    SND_SetExChannelSustain(ch_p, inst->param.sustain);
    SND_SetExChannelRelease(ch_p, release);

    ch_p->init_pan = (s8)(inst->param.pan - 64);

    return TRUE;
}

static const SNDWaveData *GetWaveData(const SNDBankData *bank, int waveArcNo, int waveIndex) {
    const SNDWaveArc *arc;

    arc = bank->waveArcLink[waveArcNo].waveArc;

    if (arc == NULL) {
        return NULL;
    }
    if (waveIndex >= arc->waveCount) {
        return NULL;
    }

    return SND_GetWaveDataAddress(arc, waveIndex);
}
#endif //SDK_ARM7
