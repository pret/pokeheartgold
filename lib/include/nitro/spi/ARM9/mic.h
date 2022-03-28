#ifndef NITRO_SPI_ARM9_MIC_H_
#define NITRO_SPI_ARM9_MIC_H_

#include <nitro/os/common/armArch.h>

typedef enum MICResult {
    MIC_RESULT_SUCCESS = 0,
    MIC_RESULT_BUSY,
    MIC_RESULT_ILLEGAL_PARAMETER,
    MIC_RESULT_SEND_ERROR,
    MIC_RESULT_INVALID_COMMAND,
    MIC_RESULT_ILLEGAL_STATUS,
    MIC_RESULT_FATAL_ERROR,
    MIC_RESULT_MAX
} MICResult;

typedef enum MICSamplingType {
    MIC_SAMPLING_TYPE_8BIT = 0,
    MIC_SAMPLING_TYPE_12BIT,
    MIC_SAMPLING_TYPE_SIGNED_8BIT,
    MIC_SAMPLING_TYPE_SIGNED_12BIT,
    MIC_SAMPLING_TYPE_12BIT_FILTER_OFF,
    MIC_SAMPLING_TYPE_SIGNED_12BIT_FILTER_OFF,
    MIC_SAMPLING_TYPE_MAX
} MICSamplingType;

typedef enum MICSamplingRate {
    MIC_SAMPLING_RATE_8K = (HW_CPU_CLOCK_ARM7 / 8000),
    MIC_SAMPLING_RATE_11K = (HW_CPU_CLOCK_ARM7 / 11025),
    MIC_SAMPLING_RATE_16K = (HW_CPU_CLOCK_ARM7 / 16000),
    MIC_SAMPLING_RATE_22K = (HW_CPU_CLOCK_ARM7 / 22050),
    MIC_SAMPLING_RATE_32K = (HW_CPU_CLOCK_ARM7 / 32000),
    MIC_SAMPLING_RATE_LIMIT = 1024
} MICSamplingRate;

typedef void (*MICCallback)(MICResult result, void *arg);

typedef struct MICAutoParam {
    MICSamplingType type;
    void *buffer;
    u32 size;
    u32 rate;
    BOOL loop_enable;
    MICCallback full_callback;
    void *full_arg;
} MICAutoParam;

void MIC_Init(void);

#endif //NITRO_SPI_ARM9_MIC_H_
