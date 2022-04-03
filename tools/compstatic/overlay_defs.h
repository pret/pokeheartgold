#ifndef OVERLAY_DEFS_H
#define OVERLAY_DEFS_H

#include <stdbool.h>
#include "global.h"

#define MIN_OVERLAY_DEFS_FILE_SIZE 0x10
#define OVERLAY_DEFS_FOOTER_OFFSET 0x8
#define OVERLAY_DEFS_FILENAMES_OFFSET 0x10
#define OVERLAY_DEFS_FILENAMES_SIZE 0x10

bool ReadOverlayDefs(Component *component, char *filename);
bool WriteOverlayDefs(Component *component);
bool AddSuffixOverlayDefs(Component *component, char *suffix);
void FreeOverlayDefs(Component *component);

#endif // OVERLAY_DEFS_H
