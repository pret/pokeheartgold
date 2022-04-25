#ifndef OVERLAY_TABLE_H
#define OVERLAY_TABLE_H

#include <stdbool.h>
#include "component.h"

#define OVERLAY_ENTRY_SIZE 32

#define OT_FILESIZE_OFFSET            0x8
#define OT_COMPRESSED_FILESIZE_OFFSET 0x1c
#define OT_COMPRESSED_FLAGS_OFFSET    0x1f

bool ReadOverlayTable(Component *component, char *filename);
bool WriteOverlayTable(Component *component);
bool AddSuffixOverlayTable(Component *component, char *suffix);
void FreeOverlayTable(Component *component);

#endif // OVERLAY_TABLE_H
