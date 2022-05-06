#ifndef OVERLAY_MODULE_H
#define OVERLAY_MODULE_H

#include <stdbool.h>
#include "global.h"

bool ReadOverlayModules(Component *component);
bool WriteOverlayModules(Component *component);
bool AddSuffixOverlayModules(Component *component, char *suffix);
void FreeOverlayModules(Component *component);

#endif // OVERLAY_MODULE_H
