#ifndef COMPONENT_H
#define COMPONENT_H

#include <stdbool.h>
#include "global.h"

bool ConvertComponent(Options *options, char *staticModule, char *overlayDefs, char *overlayTable);
void ConvertFinal(Options *options);

#endif // COMPONENT_H
