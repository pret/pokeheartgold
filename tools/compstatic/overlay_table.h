#ifndef OVERLAY_TABLE_H
#define OVERLAY_TABLE_H

#include <stdbool.h>
#include "component.h"

bool ReadOverlayTable(Component *component, char *filename);
bool WriteOverlayTable(Component *component);
bool AddSuffixOverlayTable(Component *component, char *suffix);
void FreeOverlayTable(Component *component);

#endif // OVERLAY_TABLE_H
