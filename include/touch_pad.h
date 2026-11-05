#ifndef POKEHEARTGOLD_TOUCH_PAD_H
#define POKEHEARTGOLD_TOUCH_PAD_H

#include <nitro.h>

#define MAX_TOUCH_BUFFER_SIZE 8

typedef struct TouchPadDataBuffer {
    u16 bufferSize;
    TPData buffer[MAX_TOUCH_BUFFER_SIZE];
} TouchPadDataBuffer;

enum TouchPadExternalBufferWriteMethod {
    TOUCH_PAD_EXTERNAL_BUFFER_WRITE_METHOD_ONLY_TOUCHES_WITH_WRAPPING = 1,
    TOUCH_PAD_EXTERNAL_BUFFER_WRITE_METHOD_NO_WRITE,
    TOUCH_PAD_EXTERNAL_BUFFER_WRITE_METHOD_ONLY_TOUCHES_WITHOUT_WRAPPING,
    TOUCH_PAD_EXTERNAL_BUFFER_WRITE_METHOD_ALL_DATA_WITHOUT_WRAPPING,
    TOUCH_PAD_EXTERNAL_BUFFER_WRITE_METHOD_ALL_DATA_WITH_WRAPPING,
};

enum AutoSamplingOperationResult {
    AUTO_SAMPLING_OPERATION_RESULT_BUFFER_INDEX_OUT_OF_RANGE = -1,
    AUTO_SAMPLING_OPERATION_RESULT_INVALID_REQUEST = 0,
    AUTO_SAMPLING_OPERATION_RESULT_SUCCESS = 1,
    AUTO_SAMPLING_OPERATION_RESULT_FAILURE,
    AUTO_SAMPLING_OPERATION_RESULT_NO_DATA_WRITTEN,
};

#include "global.h"

void GF_TouchpadInit(void);
void EnableTouchPad(void);
BOOL InitializeTouchPadWithExternalBuffer(TPData *externalBuffer, u32 externalBufferSize, u32 autoSamplingFrequency);
BOOL InitializeTouchPad(u32 autoSamplingFrequency);
u32 DisableTouchPad(void);
u32 WriteAutoSamplingDataToBuffer(TouchPadDataBuffer *outBuffer, enum TouchPadExternalBufferWriteMethod externalBufferWriteMethod, u32 changeThreshold);
void ConvertTouchPadDataToScreenSpace(TPData *touchPadDataBuffer, u32 touchPadDataBufferSize);
void GF_TouchpadResumeOnLidOpen(void);
void GF_TouchpadPauseOnLidClose(void);

#endif // POKEHEARTGOLD_TOUCH_PAD_H
