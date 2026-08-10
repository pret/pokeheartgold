#ifndef POKEHEARGOLD_ASM_INCLUDES
#define POKEHEARGOLD_ASM_INCLUDES

#include <nitro/types.h>

// These includes are to get the assembly files compiled without needing to include the entirity
// of the SDK, which breaks builds. These are defined as-is elsewhere and should not be modified.
// Ideally, this file should not exist in the future when the project is near completion.

#define FS_EXTERN_OVERLAY(name) extern u32 SDK_OVERLAY_ ## name ## _ID[1]

#endif //POKEHEARGOLD_ASM_INCLUDES