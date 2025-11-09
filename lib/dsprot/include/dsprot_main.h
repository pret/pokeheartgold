#ifndef DSPROT_MAIN_H
#define DSPROT_MAIN_H

#include "sdk.h"

// Functions to be encrypted (cannot be called directly)
u32 DSProtInternal_DetectFlashcart(void *callback);
u32 DSProtInternal_DetectNotFlashcart(void *callback);
u32 DSProtInternal_DetectEmulator(void *callback);
u32 DSProtInternal_DetectNotEmulator(void *callback);
u32 DSProtInternal_DetectDummy(void *callback);
u32 DSProtInternal_DetectNotDummy(void *callback);

#endif // DSPROT_MAIN_H
