#ifndef NITRO_SPI_ARM9_MIC_H_
#define NITRO_SPI_ARM9_MIC_H_

typedef struct MIC_SamplingData {
    int unk00;
    void *unk04;
    int unk08;
    int unk0c;
    int unk10;
    int unk14;
    int unk18;
} MIC_SamplingData;

void MIC_Init(void);

#endif //NITRO_SPI_ARM9_MIC_H_
