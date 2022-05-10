#ifndef NITRO_SND_COMMON_BANK_H_
#define NITRO_SND_COMMON_BANK_H_

#define SND_INST_KEYSPLIT_MAX 8

#define SND_BANK_TO_WAVEARC_MAX 4

#define SND_BANK_DISABLE_RELEASE 255

typedef struct SNDWaveArcLink {
    struct SNDWaveArc *waveArc;
    struct SNDWaveArcLink *next;
} SNDWaveArcLink;

typedef struct SNDWaveArc {
    struct SNDBinaryFileHeader fileHeader;
    struct SNDBinaryBlockHeader blockHeader;

    struct SNDWaveArcLink *topLink;
    u32 reserved[7];
    u32 waveCount;
    u32 waveOffset[0];
} SNDWaveArc;

typedef struct SNDWaveData {
    struct SNDWaveParam param;
    u8 samples[0];
} SNDWaveData;

typedef struct SNDBankData {
    struct SNDBinaryFileHeader fileHeader;
    struct SNDBinaryBlockHeader blockHeader;

    struct SNDWaveArcLink waveArcLink[SND_BANK_TO_WAVEARC_MAX];
    u32     instCount;
    u32     instOffset[0];
} SNDBankData;

typedef enum SNDInstType {
    SND_INST_INVALID = 0,

    SND_INST_PCM = 0x01,
    SND_INST_PSG,
    SND_INST_NOISE,
    SND_INST_DIRECTPCM,
    SND_INST_NULL,

    SND_INST_DRUM_SET = 0x10,
    SND_INST_KEY_SPLIT
} SNDInstType;

typedef struct SNDInstParam {
    u16 wave[2];
    u8 original_key;
    u8 attack;
    u8 decay;
    u8 sustain;
    u8 release;
    u8 pan;
} SNDInstParam;

typedef struct SNDInstData {
    u8 type;
    u8 padding_;

    struct SNDInstParam param;
} SNDInstData;

BOOL SND_ReadInstData(const struct SNDBankData *bank, int prgNo, int key,
                         struct SNDInstData *inst);

#ifdef SDK_ARM7
BOOL SND_NoteOn(struct SNDExChannel *ch_p, int key, int velocity, s32 length, const struct SNDBankData *bank, const struct SNDInstData *inst);
#endif /* SDK_ARM7 */

#endif //NITRO_SND_COMMON_BANK_H_
