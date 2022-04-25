#ifndef OVERLAY_DEFS_H
#define OVERLAY_DEFS_H

#include <stdbool.h>
#include "global.h"

#define MIN_OVERLAY_DEFS_FILE_SIZE    0x10
#define OVERLAY_DEFS_FOOTER_OFFSET    0x8
#define OVERLAY_DEFS_FILENAMES_OFFSET 0x10
#define OVERLAY_DEFS_FILENAMES_SIZE   0x10

#define OVERLAY_DEFS_HEADER_LOAD_ADDRESS_OFFSET  0
#define OVERLAY_DEFS_HEADER_ENTRY_ADDRESS_OFFSET 4
#define OVERLAY_DEFS_HEADER_MODULE_SIZE_OFFSET   8
#define OVERLAY_DEFS_HEADER_AUTOLOAD_DONE_OFFSET 12

bool ReadOverlayDefs(Component *component, char *filename);
bool WriteOverlayDefs(Component *component);
bool AddSuffixOverlayDefs(Component *component, char *suffix);
void FreeOverlayDefs(Component *component);

#endif // OVERLAY_DEFS_H
