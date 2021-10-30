#ifndef GUARD_SEQDATA_H
#define GUARD_SEQDATA_H

typedef struct NNSSndSeqParam {
    u16 bankNo;
    u8 volume;
    u8 channelPrio;
    u8 playerPrio;
    u8 playerNo;
    u16 reserved;
} NNSSndSeqParam;

#endif //GUARD_SEQDATA_H
