#include "unk_02026E30.h"

#include "global.h"

static struct {
    BOOL requested;
    GXSortMode sortMode;
    GXBufferMode bufferMode;
} sGXRequest;

void Init3DBufferSwapRequestState(void) {
    memset(&sGXRequest, 0, sizeof(sGXRequest));
    sGXRequest.requested = FALSE;
}

void Thunk_G3X_Reset(void) {
    G3X_Reset();
}

void RequestSwap3DBuffers(GXSortMode sortMode, GXBufferMode bufferMode) {
    sGXRequest.sortMode   = sortMode;
    sGXRequest.bufferMode = bufferMode;
    sGXRequest.requested  = TRUE;
}

void Handle3DBufferSwapRequest(void) {
    if (sGXRequest.requested) {
        G3_SwapBuffers(sGXRequest.sortMode, sGXRequest.bufferMode);
        sGXRequest.requested = FALSE;
    }
}
