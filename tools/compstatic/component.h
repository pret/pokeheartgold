#ifndef COMPONENT_H
#define COMPONENT_H

#include <stdbool.h>
#include "global.h"

bool ConvertComponent(Options *options, char *a1, char *a2, char *overlayTable);
void ConvertFinal(Options *options); // TODO: Remove if this goes unused

#endif // COMPONENT_H
