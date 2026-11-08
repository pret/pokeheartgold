
#include "touch_pad.h"

#include "system.h"

#define AUTO_SAMPLING_NUM_FRAMES_TO_STORE    2
#define AUTO_SAMPLING_BUFFER_MAX_SIZE        (SPI_TP_SAMPLING_FREQUENCY_MAX * AUTO_SAMPLING_NUM_FRAMES_TO_STORE) + 1 // + 1 for the active sample
#define AUTO_SAMPLING_FREQUENCY_LIMIT        SPI_TP_SAMPLING_FREQUENCY_MAX + 1
#define AUTO_SAMPLING_NUM_ERRORS_BEFORE_FAIL 5

enum TouchPadMode {
    TOUCH_PAD_MODE_INACTIVE = 0,
    TOUCH_PAD_MODE_ACTIVE_WITH_EXTERNAL_BUFFER,
    TOUCH_PAD_MODE_ACTIVE,
};

typedef struct {
    TPData *externalBuffer;
    u32 externalBufferSize;
    u32 autoSamplingBufferSize;
    TPData autoSamplingBuffer[AUTO_SAMPLING_BUFFER_MAX_SIZE];
    u32 currentExternalBufferIndex;
    u16 touchPadMode;
    u16 touchPadDisabled;
} TouchPadState;

static enum AutoSamplingOperationResult GF_TouchpadStartAutoSampling(u32 frequency);
static enum AutoSamplingOperationResult GF_TouchpadStopAutoSampling(void);
static u32 WriteAutoSamplingTouchDataToExternalBuffer(enum TouchPadExternalBufferWriteMethod externalBufferWriteMethod, u32 latestAutoSamplingIndex, u32 changeThreshold);
static u32 WriteAutoSamplingDataToExternalBuffer(enum TouchPadExternalBufferWriteMethod externalBufferWriteMethod, u32 latestAutoSamplingIndex);
static void OutputAutoSamplingData(TouchPadDataBuffer *outBuffer, u32 lastAutoSamplingIndex);
static u32 WriteAutoSamplingData(enum TouchPadExternalBufferWriteMethod externalBufferWriteMethod, u32 latestAutoSamplingIndex, u32 changeThreshold);
static void UpdateTouchScreenState(enum TouchPadMode touchPadMode, BOOL autoSamplingEnabled, void *externalBuffer, u32 externalBufferSize, u32 currentExternalBufferIndex, u32 autoSamplingBufferSize);
static void ResetTouchPadData(TPData *touchPadDataBuffer, int touchPadDataBufferSize);
static void sub_02021528(TouchPadDataBuffer *outBuffer);

static TouchPadState touchPadState;

void GF_TouchpadInit(void) {
    memset(&touchPadState, 0, sizeof(TouchPadState));
}

void EnableTouchPad(void) {
    // This was changed from Platinum to be incorrect.
    GF_ASSERT(touchPadState.touchPadMode == TOUCH_PAD_MODE_INACTIVE);

    touchPadState.touchPadMode = TOUCH_PAD_MODE_INACTIVE;
}

BOOL InitializeTouchPadWithExternalBuffer(TPData *externalBuffer, u32 externalBufferSize, u32 autoSamplingFrequency) {
    if (touchPadState.touchPadDisabled != FALSE) {
        UpdateTouchScreenState(TOUCH_PAD_MODE_ACTIVE_WITH_EXTERNAL_BUFFER, TRUE, externalBuffer, externalBufferSize, 0, autoSamplingFrequency * AUTO_SAMPLING_NUM_FRAMES_TO_STORE);

        return TRUE;
    }

    if (autoSamplingFrequency >= AUTO_SAMPLING_FREQUENCY_LIMIT || autoSamplingFrequency <= 0) {
        return FALSE;
    }

    if (touchPadState.touchPadMode != TOUCH_PAD_MODE_INACTIVE) {
        return FALSE;
    }

    enum AutoSamplingOperationResult autoSamplingResult = GF_TouchpadStartAutoSampling(autoSamplingFrequency);

    if (autoSamplingResult != AUTO_SAMPLING_OPERATION_RESULT_SUCCESS) {
        return autoSamplingResult;
    }

    UpdateTouchScreenState(TOUCH_PAD_MODE_ACTIVE_WITH_EXTERNAL_BUFFER, TRUE, externalBuffer, externalBufferSize, 0, autoSamplingFrequency * AUTO_SAMPLING_NUM_FRAMES_TO_STORE);

    return TRUE;
}

BOOL InitializeTouchPad(u32 autoSamplingFrequency) {
    if (touchPadState.touchPadDisabled != FALSE) {
        UpdateTouchScreenState(TOUCH_PAD_MODE_ACTIVE, TRUE, NULL, 0, 0, autoSamplingFrequency * AUTO_SAMPLING_NUM_FRAMES_TO_STORE);

        return TRUE;
    }

    if (autoSamplingFrequency >= AUTO_SAMPLING_FREQUENCY_LIMIT || autoSamplingFrequency <= 0) {
        return FALSE;
    }

    if (touchPadState.touchPadMode != TOUCH_PAD_MODE_INACTIVE) {
        return FALSE;
    }

    enum AutoSamplingOperationResult autoSamplingResult = GF_TouchpadStartAutoSampling(autoSamplingFrequency);

    if (autoSamplingResult != AUTO_SAMPLING_OPERATION_RESULT_SUCCESS) {
        return autoSamplingResult;
    }

    UpdateTouchScreenState(TOUCH_PAD_MODE_ACTIVE, TRUE, NULL, 0, 0, autoSamplingFrequency * AUTO_SAMPLING_NUM_FRAMES_TO_STORE);

    return TRUE;
}

static void UpdateTouchScreenState(enum TouchPadMode touchPadMode, BOOL autoSamplingEnabled, void *externalBuffer, u32 externalBufferSize, u32 currentExternalBufferIndex, u32 autoSamplingBufferSize) {
    touchPadState.touchPadMode = touchPadMode;
    gSystem.touchpadReadAuto = autoSamplingEnabled;
    touchPadState.externalBuffer = externalBuffer;
    touchPadState.externalBufferSize = externalBufferSize;
    touchPadState.autoSamplingBufferSize = autoSamplingBufferSize;
    touchPadState.currentExternalBufferIndex = currentExternalBufferIndex;

    ResetTouchPadData(touchPadState.autoSamplingBuffer, AUTO_SAMPLING_BUFFER_MAX_SIZE);
}

static void ResetTouchPadData(TPData *touchPadDataBuffer, int touchPadDataBufferSize) {
    int i;

    for (i = 0; i < touchPadDataBufferSize; i++) {
        touchPadDataBuffer[i].touch = TP_TOUCH_OFF;
    }
}

static enum AutoSamplingOperationResult GF_TouchpadStopAutoSampling(void) {
    u32 errorCount = 0;
    BOOL hasError;

    if (touchPadState.touchPadMode == TOUCH_PAD_MODE_INACTIVE) {
        return AUTO_SAMPLING_OPERATION_RESULT_SUCCESS;
    }

    do {
        TP_RequestAutoSamplingStopAsync();
        TP_WaitBusy(TP_REQUEST_COMMAND_FLAG_AUTO_OFF);

        hasError = TP_CheckError(TP_REQUEST_COMMAND_FLAG_AUTO_OFF);

        if (hasError != FALSE) {
            errorCount++;
        }
    } while ((hasError != FALSE) && (errorCount <= AUTO_SAMPLING_NUM_ERRORS_BEFORE_FAIL));

    if (errorCount > AUTO_SAMPLING_NUM_ERRORS_BEFORE_FAIL) {
        return AUTO_SAMPLING_OPERATION_RESULT_FAILURE;
    }

    return AUTO_SAMPLING_OPERATION_RESULT_SUCCESS;
}

u32 DisableTouchPad(void) {
    enum AutoSamplingOperationResult autoSamplingResult;

    if (touchPadState.touchPadDisabled != FALSE) {
        UpdateTouchScreenState(TOUCH_PAD_MODE_INACTIVE, FALSE, NULL, 0, 0, 0);

        return AUTO_SAMPLING_OPERATION_RESULT_SUCCESS;
    }

    autoSamplingResult = GF_TouchpadStopAutoSampling();

    if (autoSamplingResult == AUTO_SAMPLING_OPERATION_RESULT_SUCCESS) {
        UpdateTouchScreenState(TOUCH_PAD_MODE_INACTIVE, FALSE, NULL, 0, 0, 0);
    }

    return autoSamplingResult;
}

u32 WriteAutoSamplingDataToBuffer(TouchPadDataBuffer *outBuffer, enum TouchPadExternalBufferWriteMethod externalBufferWriteMethod, u32 changeThreshold) {
    u32 result = AUTO_SAMPLING_OPERATION_RESULT_NO_DATA_WRITTEN;
    u32 latestAutoSamplingIndex;

    if (touchPadState.touchPadDisabled != FALSE) {
        if (outBuffer != NULL) {
            sub_02021528(outBuffer);
        }
        if (externalBufferWriteMethod == TOUCH_PAD_EXTERNAL_BUFFER_WRITE_METHOD_NO_WRITE) {
            return AUTO_SAMPLING_OPERATION_RESULT_SUCCESS;
        }

        return AUTO_SAMPLING_OPERATION_RESULT_INVALID_REQUEST;
    }

    if (touchPadState.touchPadMode != TOUCH_PAD_MODE_INACTIVE) {
        latestAutoSamplingIndex = TP_GetLatestIndexInAuto();

        ConvertTouchPadDataToScreenSpace(touchPadState.autoSamplingBuffer, AUTO_SAMPLING_BUFFER_MAX_SIZE);

        if (outBuffer != NULL) {
            OutputAutoSamplingData(outBuffer, latestAutoSamplingIndex);
        }

        if (touchPadState.touchPadMode == TOUCH_PAD_MODE_ACTIVE_WITH_EXTERNAL_BUFFER) {
            result = WriteAutoSamplingData(externalBufferWriteMethod, latestAutoSamplingIndex, changeThreshold);
        } else {
            result = AUTO_SAMPLING_OPERATION_RESULT_SUCCESS;
        }
    }

    return result;
}

void ConvertTouchPadDataToScreenSpace(TPData *touchPadDataBuffer, u32 touchPadDataBufferSize) {
    int i;
    TPData convertedData;

    for (i = 0; i < touchPadDataBufferSize; i++) {
        TP_GetCalibratedPoint(&convertedData, &(touchPadDataBuffer[i]));
        touchPadDataBuffer[i] = convertedData;
    }
}

void GF_TouchpadResumeOnLidOpen(void) {
    enum AutoSamplingOperationResult autoSamplingResult;

    if (touchPadState.touchPadDisabled == FALSE || touchPadState.touchPadMode == TOUCH_PAD_MODE_INACTIVE) {
        return;
    }

    autoSamplingResult = GF_TouchpadStartAutoSampling(touchPadState.autoSamplingBufferSize / AUTO_SAMPLING_NUM_FRAMES_TO_STORE);
    GF_ASSERT(autoSamplingResult == AUTO_SAMPLING_OPERATION_RESULT_SUCCESS);

    touchPadState.touchPadDisabled = FALSE;
}

void GF_TouchpadPauseOnLidClose(void) {
    u32 autoSamplingResult;

    if (touchPadState.touchPadDisabled == TRUE || touchPadState.touchPadMode == TOUCH_PAD_MODE_INACTIVE) {
        return;
    }

    autoSamplingResult = GF_TouchpadStopAutoSampling();
    GF_ASSERT(autoSamplingResult == AUTO_SAMPLING_OPERATION_RESULT_SUCCESS);

    touchPadState.touchPadDisabled = TRUE;
}

static enum AutoSamplingOperationResult GF_TouchpadStartAutoSampling(u32 frequency) {
    int errorCount = 0;
    BOOL hasError;

    do {
        TP_RequestAutoSamplingStartAsync(0, frequency, touchPadState.autoSamplingBuffer, AUTO_SAMPLING_BUFFER_MAX_SIZE);
        TP_WaitBusy(TP_REQUEST_COMMAND_FLAG_AUTO_ON);

        hasError = TP_CheckError(TP_REQUEST_COMMAND_FLAG_AUTO_ON);

        if (hasError != FALSE) {
            errorCount++;
        }
    } while ((hasError != FALSE) && (errorCount <= AUTO_SAMPLING_NUM_ERRORS_BEFORE_FAIL));

    if (errorCount > AUTO_SAMPLING_NUM_ERRORS_BEFORE_FAIL) {
        return AUTO_SAMPLING_OPERATION_RESULT_FAILURE;
    }

    return AUTO_SAMPLING_OPERATION_RESULT_SUCCESS;
}

static u32 WriteAutoSamplingData(enum TouchPadExternalBufferWriteMethod externalBufferWriteMethod, u32 latestAutoSamplingIndex, u32 changeThreshold) {
    u32 externalBufferEndIndex;

    switch (externalBufferWriteMethod) {
    case TOUCH_PAD_EXTERNAL_BUFFER_WRITE_METHOD_ONLY_TOUCHES_WITH_WRAPPING:
    case TOUCH_PAD_EXTERNAL_BUFFER_WRITE_METHOD_ONLY_TOUCHES_WITHOUT_WRAPPING:
        externalBufferEndIndex = WriteAutoSamplingTouchDataToExternalBuffer(externalBufferWriteMethod, latestAutoSamplingIndex, changeThreshold);
        break;
    case TOUCH_PAD_EXTERNAL_BUFFER_WRITE_METHOD_ALL_DATA_WITHOUT_WRAPPING:
    case TOUCH_PAD_EXTERNAL_BUFFER_WRITE_METHOD_ALL_DATA_WITH_WRAPPING:
        externalBufferEndIndex = WriteAutoSamplingDataToExternalBuffer(externalBufferWriteMethod, latestAutoSamplingIndex);
        break;
    default:
        externalBufferEndIndex = AUTO_SAMPLING_OPERATION_RESULT_SUCCESS;
        break;
    }

    return externalBufferEndIndex;
}

static inline int CalcAbsDifference(int int1, int int2) {
    return (int1 >= int2) ? (int1 - int2) : (int2 - int1);
}

static u32 WriteAutoSamplingTouchDataToExternalBuffer(enum TouchPadExternalBufferWriteMethod externalBufferWriteMethod, u32 latestAutoSamplingIndex, u32 changeThreshold) {
    int i;
    s32 xDiff;
    s32 yDiff;
    s16 bufferIndex;

    for (i = 0; i < touchPadState.autoSamplingBufferSize; i++) {
        bufferIndex = latestAutoSamplingIndex - touchPadState.autoSamplingBufferSize + i + 1;

        if (bufferIndex < 0) {
            bufferIndex += AUTO_SAMPLING_BUFFER_MAX_SIZE;
        }

        if ((touchPadState.autoSamplingBuffer[bufferIndex].touch == TP_TOUCH_ON) && (touchPadState.autoSamplingBuffer[bufferIndex].validity == TP_VALIDITY_VALID)) {
            xDiff = CalcAbsDifference(touchPadState.externalBuffer[touchPadState.currentExternalBufferIndex - 1].x, touchPadState.autoSamplingBuffer[bufferIndex].x);
            yDiff = CalcAbsDifference(touchPadState.externalBuffer[touchPadState.currentExternalBufferIndex - 1].y, touchPadState.autoSamplingBuffer[bufferIndex].y);

            if ((xDiff >= changeThreshold) || (yDiff >= changeThreshold)) {
                touchPadState.externalBuffer[touchPadState.currentExternalBufferIndex] = touchPadState.autoSamplingBuffer[bufferIndex];
                touchPadState.currentExternalBufferIndex++;

                if (touchPadState.currentExternalBufferIndex >= touchPadState.externalBufferSize) {
                    if (externalBufferWriteMethod == TOUCH_PAD_EXTERNAL_BUFFER_WRITE_METHOD_ONLY_TOUCHES_WITH_WRAPPING) {
                        touchPadState.currentExternalBufferIndex %= touchPadState.externalBufferSize;
                    } else {
                        return AUTO_SAMPLING_OPERATION_RESULT_BUFFER_INDEX_OUT_OF_RANGE;
                    }
                }
            }
        }
    }

    return touchPadState.currentExternalBufferIndex;
}

static u32 WriteAutoSamplingDataToExternalBuffer(enum TouchPadExternalBufferWriteMethod externalBufferWriteMethod, u32 latestAutoSamplingIndex) {
    int i;
    s16 bufferIndex;

    for (i = 0; i < touchPadState.autoSamplingBufferSize; i++) {
        bufferIndex = latestAutoSamplingIndex - touchPadState.autoSamplingBufferSize + i + 1;

        if (bufferIndex < 0) {
            bufferIndex += AUTO_SAMPLING_BUFFER_MAX_SIZE;
        }

        touchPadState.externalBuffer[touchPadState.currentExternalBufferIndex] = touchPadState.autoSamplingBuffer[bufferIndex];
        touchPadState.currentExternalBufferIndex++;

        if (touchPadState.currentExternalBufferIndex >= touchPadState.externalBufferSize) {
            if (externalBufferWriteMethod == TOUCH_PAD_EXTERNAL_BUFFER_WRITE_METHOD_ALL_DATA_WITHOUT_WRAPPING) {
                touchPadState.currentExternalBufferIndex %= touchPadState.externalBufferSize;
            } else {
                return AUTO_SAMPLING_OPERATION_RESULT_BUFFER_INDEX_OUT_OF_RANGE;
            }
        }
    }

    return touchPadState.currentExternalBufferIndex;
}

static void sub_02021528(TouchPadDataBuffer *outBuffer) {
    int i;

    outBuffer->bufferSize = 0;

    for (i = 0; i < MAX_TOUCH_BUFFER_SIZE; i++) {
        outBuffer->buffer[i].validity = TP_VALIDITY_VALID;
        outBuffer->buffer[i].touch = TP_TOUCH_OFF;
        outBuffer->buffer[i].x = 0;
        outBuffer->buffer[i].y = 0;
    }
}

static void OutputAutoSamplingData(TouchPadDataBuffer *outBuffer, u32 lastAutoSamplingIndex) {
    int i;
    s16 bufferIndex;

    sub_02021528(outBuffer);

    for (i = 0; i < touchPadState.autoSamplingBufferSize; i++) {
        bufferIndex = lastAutoSamplingIndex - touchPadState.autoSamplingBufferSize + i + 1;

        if (bufferIndex < 0) {
            bufferIndex += AUTO_SAMPLING_BUFFER_MAX_SIZE;
        }

        if (touchPadState.autoSamplingBuffer[bufferIndex].validity == TP_VALIDITY_VALID) {
            outBuffer->buffer[outBuffer->bufferSize] = touchPadState.autoSamplingBuffer[bufferIndex];
            outBuffer->bufferSize++;
        }
    }
}
