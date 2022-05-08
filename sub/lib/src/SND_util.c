#include <nitro.h>

extern u16 SVC_GetPitchTable(int idx);
extern u16 SVC_GetVolumeTable(int idx);

static const s8 SinTable[] = {
    0,6,12,19,25,31,37,43,
    49,54,60,65,71,76,81,85,
    90,94,98,102,106,109,112,115,
    117,120,122,123,125,126,126,127,
    127
};

u16 SND_CalcTimer(int timer, int pitch) {
    int octave = 0;
    int pitch_normalized = -pitch;

    while (pitch_normalized < 0) {
        octave--;
        pitch_normalized += 768;
    }

    while (pitch_normalized >= 768) {
        octave++;
        pitch_normalized -= 768;
    }

    u64 result = SVC_GetPitchTable(pitch_normalized);

    result += 0x10000;
    result *= timer;

    int shift = octave - 16;

    if (shift <= 0) {
        shift = -shift;
        result >>= shift;
    } else if (shift < 32) {
        // clamp in case timer value overflows
        u64 tmp = result & ~0uLL << (32 - shift);
        if (tmp != 0) {
            return 0xFFFF;
        }
        result <<= shift;
    } else {
        return 0xFFFF;
    }

    if (result < 0x10) {
        result = 0x10;
    } else if (result > 0xFFFF) {
        result = 0xFFFF;
    }

    return (u16)result;
}

u16 SND_CalcChannelVolume(int value) {
    if (value < SND_VOLUME_DB_MIN) {
        value = SND_VOLUME_DB_MIN;
    } else if (value > 0) {
        value = 0;
    }

    int result = SVC_GetVolumeTable(value + (-SND_VOLUME_DB_MIN));
    SNDChannelDataShift div;

    if (value < -240) {
        div = SND_CHANNEL_DATASHIFT_4BIT;
    } else if (value < -120) {
        div = SND_CHANNEL_DATASHIFT_2BIT;
    } else if (value < -60) {
        div = SND_CHANNEL_DATASHIFT_1BIT;
    } else {
        div = SND_CHANNEL_DATASHIFT_NONE;
    }

    return (u16)(result | (div << 8));
}

s8 SND_SinIdx(int x) {
    // BUG: UB for out of range values

    if (x < 0x20) {
        return SinTable[x];
    } else if (x < 0x40) {
        return SinTable[0x40 - x];
    } else if (x < 0x60) {
        return (s8)(-SinTable[x - 0x40]);
    } else {
        return (s8)(-SinTable[0x20 - (x - 0x60)]);
    }
}

u16 SND_CalcRandom(void) {
    extern u32 SND_CalcRandom__sinit__u; // = 0x12345678;

    // values from "Numerical Recipes"
    SND_CalcRandom__sinit__u = SND_CalcRandom__sinit__u * 1664525u + 1013904223u;
    return (u16)(SND_CalcRandom__sinit__u >> 16u);
}