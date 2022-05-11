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

const s16 SNDi_DecibelTable[] = {
    -32768,   -722,   -721,   -651,   -601,   -562,   -530,   -503,
    -480,   -460,   -442,   -425,   -410,   -396,   -383,   -371,
    -360,   -349,   -339,   -330,   -321,   -313,   -305,   -297,
    -289,   -282,   -276,   -269,   -263,   -257,   -251,   -245,
    -239,   -234,   -229,   -224,   -219,   -214,   -210,   -205,
    -201,   -196,   -192,   -188,   -184,   -180,   -176,   -173,
    -169,   -165,   -162,   -158,   -155,   -152,   -149,   -145,
    -142,   -139,   -136,   -133,   -130,   -127,   -125,   -122,
    -119,   -116,   -114,   -111,   -109,   -106,   -103,   -101,
    -99,    -96,    -94,    -91,    -89,    -87,    -85,    -82,
    -80,    -78,    -76,    -74,    -72,    -70,    -68,    -66,
    -64,    -62,    -60,    -58,    -56,    -54,    -52,    -50,
    -49,    -47,    -45,    -43,    -42,    -40,    -38,    -36,
    -35,    -33,    -31,    -30,    -28,    -27,    -25,    -23,
    -22,    -20,    -19,    -17,    -16,    -14,    -13,    -11,
    -10,     -8,     -7,     -6,     -4,     -3,     -1,      0,
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
    static u32 u = 0x12345678;

    // values from "Numerical Recipes"
    u = u * 1664525u + 1013904223u;
    return (u16)(u >> 16u);
}