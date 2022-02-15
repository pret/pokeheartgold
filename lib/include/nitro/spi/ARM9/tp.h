#ifndef NITRO_SPI_ARM9_TP_H
#define NITRO_SPI_ARM9_TP_H

#define     TP_TOUCH_OFF                0
#define     TP_TOUCH_ON                 1

#define     TP_VALIDITY_VALID           0
#define     TP_VALIDITY_INVALID_X       1
#define     TP_VALIDITY_INVALID_Y       2
#define     TP_VALIDITY_INVALID_XY      (TP_VALIDITY_INVALID_X | TP_VALIDITY_INVALID_Y)

typedef struct {
    u16 x;
    u16 y;
    u16 touch;
    u16 validity;
} TPData;

typedef struct NvTpData {
    s16 x0;
    s16 y0;
    s16 xDotSize;
    s16 yDotSize;
} TPCalibrateParam;

void TP_Init(void);
void TP_SetCalibrateParam(const TPCalibrateParam *param);
BOOL TP_GetUserInfo(TPCalibrateParam *param);
void TP_RequestSamplingAsync(void);
u32 TP_WaitRawResult(TPData *result);
void TP_GetLatestRawPointInAuto(TPData *result);
void TP_GetCalibratedPoint(TPData *calib, const TPData *raw);

static inline u32 TP_RequestRawSampling(TPData *result) {
    TP_RequestSamplingAsync();
    return TP_WaitRawResult(result);
}

#endif //NITRO_SPI_ARM9_TP_H
