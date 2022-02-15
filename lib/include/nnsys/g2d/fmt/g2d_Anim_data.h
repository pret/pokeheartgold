#ifndef NNSYS_G2D_FMT_G2D_ANIM_DATA_H_
#define NNSYS_G2D_FMT_G2D_ANIM_DATA_H_

typedef enum NNSG2dAnimationPlayMode {
    NNS_G2D_ANIMATIONPLAYMODE_INVALID = 0x0,
    NNS_G2D_ANIMATIONPLAYMODE_FORWARD,
    NNS_G2D_ANIMATIONPLAYMODE_FORWARD_LOOP,
    NNS_G2D_ANIMATIONPLAYMODE_REVERSE,
    NNS_G2D_ANIMATIONPLAYMODE_REVERSE_LOOP,
    NNS_G2D_ANIMATIONPLAYMODE_MAX
} NNSG2dAnimationPlayMode;

typedef struct NNSG2dAnimFrameData {
    void* pContent;
    u16 frames;
    u16 pad16;

} NNSG2dAnimFrameData;

typedef struct NNSG2dAnimSequenceData {
    u16 numFrames;
    u16 loopStartFrameIdx;
    u32 animType;
    NNSG2dAnimationPlayMode playMode;
    NNSG2dAnimFrameData *pAnmFrameArray;

} NNSG2dAnimSequenceData;

typedef struct NNSG2dAnimBankData {
    u16 numSequences;
    u16 numTotalFrames;
    NNSG2dAnimSequenceData* pSequenceArrayHead;
    NNSG2dAnimFrameData* pFrameArrayHead;
    void* pAnimContents;
    void* pStringBank;
    void* pExtendedData;
} NNSG2dAnimBankData;

#endif //NNSYS_G2D_FMT_G2D_ANIM_DATA_H_
