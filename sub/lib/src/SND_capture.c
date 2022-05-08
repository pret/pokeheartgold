#include <nitro.h>

enum SNDLoop {
    SND_CAP_LOOP = 0,
    SND_CAP_ONESHOT = 1
};

void SND_SetupCapture(
    int idx, int format, void *captureData, int size, BOOL loop, int capCtrlSrc, int capCtrlDst) {
    int off = idx * 8;

    reg_SNDCAPxCNT(idx) = REG_SND_SNDCAP0CNT_FIELD(
        FALSE,
        format,
        loop ? SND_CAP_LOOP : SND_CAP_ONESHOT,
        capCtrlSrc,
        capCtrlDst
    );
    reg_SNDCAPoffDAD(off) = (u32)captureData;
    reg_SNDCAPoffLEN(off) = (u16)size;
}

BOOL SND_IsCaptureActive(int idx) {
    return (reg_SNDCAPxCNT(idx) & 0x80) != 0;
}
