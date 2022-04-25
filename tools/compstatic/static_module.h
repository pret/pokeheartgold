#ifndef STATIC_MODULE_H
#define STATIC_MODULE_H

#include <stdbool.h>
#include "global.h"

#define STATIC_FOOTER_MAGIC_OFFSET        (0)
#define STATIC_FOOTER_STATIC_PARAM_OFFSET (4)
#define STATIC_FOOTER_DIGEST_PARAM_OFFSET (8)

typedef struct {
    uint autoloadList;
    uint autoloadListEnd;
    uint autoloadStart;
    uint staticBssStart;
    uint staticBssEnd;
    int compressedStatic;
} StaticParams;

bool ReadStaticModule(Component *component, char *filename);
bool WriteStaticModule(Component *component);
bool AddSuffixStaticModule(Component *component, char *suffix);
void FreeStaticModule(Component *component);

#endif // STATIC_MODULE_H
