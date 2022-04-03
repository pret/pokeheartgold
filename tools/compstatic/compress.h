#ifndef COMPRESS_H
#define COMPRESS_H

#include <stdbool.h>
#include "component.h"

bool CompressOverlayModules(Component *component);
bool CompressStaticModule(Component *component, int headerSize);
bool CalculateHMAC_OverlayModules(Component *component, int a1, char *digestKey);

#endif // COMPRESS_H
