#include <nitro.h>

extern int sMasterPan; // = -1;
extern u8 sOrgVolume[SND_CHANNEL_NUM];
extern u8 sOrgPan[SND_CHANNEL_NUM];
extern int sSurroundDecay;

int CalcSurroundDecay(int vol, int pan);

void SND_SetupChannelPcm(int chNo, const void *data, SNDWaveFormat format, SNDChannelLoop loop, int loopStart, int dataLen, int volume, SNDChannelDataShift shift, int timer, int pan) {
    int off = chNo * 0x10;

    sOrgPan[chNo] = (u8)pan;
    if (sMasterPan >= 0) {
        pan = sMasterPan;
    }

    sOrgVolume[chNo] = (u8)volume;
    if (sSurroundDecay > 0 && (1 << chNo) & 0xFFF5) {
        volume = CalcSurroundDecay(volume, pan);
    }

    reg_SOUNDoffCNT(off) = REG_SND_SOUND0CNT_FIELD(FALSE, format, loop, 0, pan, 0, shift, volume);
    reg_SOUNDoffTMR(off) = (u16)(0x10000 - timer);
    reg_SOUNDoffPNT(off) = (u16)loopStart;
    reg_SOUNDoffLEN(off) = (u32)dataLen;
    reg_SOUNDoffSAD(off) = (u32)data;
}

void SND_SetupChannelPsg(int chNo, SNDDuty duty, int volume, SNDChannelDataShift shift, int timer, int pan) {
    int off = chNo * 0x10;

    sOrgPan[chNo] = (u8)pan;
    if (sMasterPan >= 0) {
        pan = sMasterPan;
    }

    sOrgVolume[chNo] = (u8)volume;
    if (sSurroundDecay > 0 && (1 << chNo) & 0xFFF5) {
        volume = CalcSurroundDecay(volume, pan);
    }

    reg_SOUNDoffCNT(off) = REG_SND_SOUND0CNT_FIELD(FALSE, SND_WAVE_FORMAT_PSG, SND_CHANNEL_LOOP_MANUAL, duty, pan, 0, shift, volume);
    reg_SOUNDoffTMR(off) = (u16)(0x10000 - timer);
}

void SND_SetupChannelNoise(int chNo, int volume, SNDChannelDataShift shift, int timer, int pan)
{
    int off = chNo * 0x10;

    sOrgPan[chNo] = (u8)pan;
    if (sMasterPan >= 0) {
        pan = sMasterPan;
    }

    sOrgVolume[chNo] = (u8)volume;
    if (sSurroundDecay > 0 && (1 << chNo) & 0xFFF5) {
        volume = CalcSurroundDecay(volume, pan);
    }

    reg_SOUNDoffCNT(off) = REG_SND_SOUND0CNT_FIELD(FALSE, SND_WAVE_FORMAT_NOISE, SND_CHANNEL_LOOP_MANUAL, SND_DUTY_1_8, pan, 0, shift, volume);
    reg_SOUNDoffTMR(off) = (u16)(0x10000 - timer);
}

void SND_StopChannel(int chNo, s32 flags) {
    REGType32v *reg_p = &reg_SOUNDxCNT(chNo);
    u32 reg = *reg_p;

    reg &= ~REG_SND_SOUND0CNT_E_MASK;
    if (flags & 1) {
        reg |= REG_SND_SOUND0CNT_HOLD_MASK;
    }
    *reg_p = reg;
}

void SND_SetChannelVolume(int chNo, int volume, SNDChannelDataShift shift) {
    sOrgVolume[chNo] = (u8)volume;

    if (sSurroundDecay > 0 && (1 << chNo) & 0xFFF5) {
        int pan = reg_SOUNDxCNT_PAN(chNo);
        volume = CalcSurroundDecay(volume, pan);
    }

    reg_SOUNDxCNT_VOLS(chNo) = (u16)((shift << 8) | volume);
}

void SND_SetChannelTimer(int chNo, int timer) {
    reg_SOUNDxTMR(chNo) = (u16)(0x10000 - timer);
}

void SND_SetChannelPan(int chNo, int pan) {
    sOrgPan[chNo] = (u8)pan;

    if (sMasterPan >= 0) {
        pan = sMasterPan;
    }

    reg_SOUNDxCNT_PAN(chNo) = (u8)pan;

    if (sSurroundDecay > 0 && (1 << chNo) & 0xFFF5) {
        reg_SOUNDxCNT_VOL(chNo) = (u8)CalcSurroundDecay(sOrgVolume[chNo], pan);
    }
}

BOOL SND_IsChannelActive(int chnIdx) {
    return (reg_SOUNDxCNT_STAT(chnIdx) & 0x80) != 0;
}


void SND_SetMasterPan(int pan) {
    sMasterPan = pan;

    if (pan >= 0) {
        for (int i = 0; i < SND_CHANNEL_NUM; i++) {
            reg_SOUNDxCNT_PAN(i) = (u8)pan;
        }
    } else {
        for (int i = 0; i < SND_CHANNEL_NUM; i++) {
            reg_SOUNDxCNT_PAN(i) = sOrgPan[i];
        }
    }
}

u32 SND_GetChannelControl(int chnIdx) {
    return reg_SOUNDxCNT(chnIdx);
}

void SNDi_SetSurroundDecay(int decay) {
    sSurroundDecay = decay;

    for (int i = 0; i < SND_CHANNEL_NUM; i++) {
        // do not process channel 1+3 (capture playback channels)
        if ((1 << i) & 0xFFF5) {
            int pan = reg_SOUNDxCNT_PAN(i);
            reg_SOUNDxCNT_VOL(i) = (u8)CalcSurroundDecay(sOrgVolume[i], pan);
        }
    }
}

static int CalcSurroundDecay(int vol, int pan) {
    if (pan < 24) {
        return vol * (sSurroundDecay * (pan + 40) + ((0x7FFF - sSurroundDecay) << 6)) >> 21;
    } else if (pan <= 104) {
        return vol;
    } else {
        return vol * (-sSurroundDecay * (pan - 40) + ((sSurroundDecay + 0x7FFF) << 6)) >> 21;
    }
}
