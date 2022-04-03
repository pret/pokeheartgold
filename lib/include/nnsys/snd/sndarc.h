#ifndef NNSYS_SND_SNDARC_H_
#define NNSYS_SND_SNDARC_H_

#define NNS_SND_ARC_LOAD_SEQ    ( 1 << 0 )
#define NNS_SND_ARC_LOAD_BANK   ( 1 << 1 )
#define NNS_SND_ARC_LOAD_WAVE   ( 1 << 2 )
#define NNS_SND_ARC_LOAD_SEQARC ( 1 << 3 )
#define NNS_SND_ARC_LOAD_ALL   0xff

#define NNS_SND_ARC_BANK_TO_WAVEARC_NUM 4

typedef struct NNSSndArcFileInfo {
    u32 offset;
    u32 size;
    void* mem;
    u32 reserved;
} NNSSndArcFileInfo;

typedef struct NNSSndArcFat {
    struct SNDBinaryBlockHeader blockHeader;

    u32 count;
    NNSSndArcFileInfo files[0];
} NNSSndArcFat;

typedef struct NNSSndArcInfo {
    struct SNDBinaryBlockHeader blockHeader;

    u32 seqOffset;
    u32 seqArcOffset;
    u32 bankOffset;
    u32 waveArcOffset;
    u32 playerInfoOffset;
    u32 groupInfoOffset;
    u32 strmPlayerInfoOffset;
    u32 strmOffset;
} NNSSndArcInfo;

typedef struct NNSSndArcWaveArcInfo {
    u32 fileId : 24;
    u32 flags  :  8;
} NNSSndArcWaveArcInfo;

typedef struct NNSSndArcSymbol {
    struct SNDBinaryBlockHeader blockHeader;

    u32 seqOffset;
    u32 seqArcOffset;
    u32 bankOffset;
    u32 waveArcOffset;
    u32 playerOffset;
    u32 groupOffset;
    u32 strmPlayerOffset;
    u32 strmOffset;
} NNSSndArcSymbol;

typedef struct NNSSndArcHeader {
    struct SNDBinaryFileHeader fileHeader;
    u32 symbolDataOffset;
    u32 symbolDataSize;
    u32 infoOffset;
    u32 infoSize;
    u32 fatOffset;
    u32 fatSize;
    u32 fileImageOffset;
    u32 fileImageSize;
} NNSSndArcHeader;

typedef struct NNSSndArc {
    NNSSndArcHeader header;
    BOOL file_open;
#ifndef NNS_FROM_TOOL
    FSFile file;
    FSFileID fileId;
#endif // NNS_FROM_TOOL
    struct NNSSndArcFat* fat;
    struct NNSSndArcSymbol* symbol;
    struct NNSSndArcInfo* info;
    s32 loadBlockSize;
} NNSSndArc;

typedef struct NNSSndArcBankInfo {
    u32 fileId;
    u16 waveArcNo[ NNS_SND_ARC_BANK_TO_WAVEARC_NUM ];
} NNSSndArcBankInfo;

void NNS_SndArcInit(NNSSndArc *arc, const char *filePath, NNSSndHeapHandle heap, BOOL symbolLoadFlag);

const NNSSndSeqParam* NNS_SndArcGetSeqParam(int seqNo);

#endif //NNSYS_SND_SNDARC_H_
