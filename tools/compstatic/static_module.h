#ifndef STATIC_MODULE_H
#define STATIC_MODULE_H

#include <stdbool.h>
#include "global.h"

bool ReadStaticModule(Component *component, char *filename);
bool WriteStaticModule(Component *component);
bool AddSuffixStaticModule(Component *component, char *suffix);
void FreeStaticModule(Component *component);

#endif // STATIC_MODULE_H
