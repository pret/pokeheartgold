#include <stdbool.h>
#include <string.h>
#include "component.h"
#include "compress.h"
#include "global.h"
#include "overlay_defs.h"
#include "overlay_modules.h"
#include "overlay_table.h"
#include "print.h"
#include "static_module.h"
#include "str.h"

static bool ReadComponent(Component *component, char *a1, char *a2, char *overlayTable);
static bool WriteComponent(Component *component);
static bool ComponentAddSuffix(Component *component, char *suffix);
static void FreeComponent(Component *component);
static void DebugPrintComponent(Component *component);

bool ConvertComponent(Options *options, char *staticModule, char *overlayDefs, char *overlayTable) {
    bool finalSuccess = false;
    Component component;
    memset(&component, 0, sizeof(component));

    bool success = ReadComponent(&component, staticModule, overlayDefs, overlayTable);
    if (success) {
        DebugPrintComponent(&component);
        if (!options->overlayModules || CompressOverlayModules(&component)) {
            if (!options->overlayDigest || CalculateHMAC_OverlayModules(&component, options->unk10, options->digestKey)) {
                if (!options->staticModule || CompressStaticModule(&component, options->headerSize)) {
                    if (options->outSuffix == NULL || ComponentAddSuffix(&component, options->outSuffix)) {
                        DebugPrintComponent(&component);
                        finalSuccess = WriteComponent(&component);
                    }
                }
            }
        }
    }

    FreeComponent(&component);
    return finalSuccess;
}

static bool ReadComponent(Component *component, char *staticModule, char *overlayDefs, char *overlayTable) {
    bool finalSuccess = false;

    bool success = ReadOverlayDefs(component, overlayDefs);
    if (success) {
        success = ReadStaticModule(component, staticModule);
        if (success) {
            success = ReadOverlayTable(component, overlayTable);
            if (success) {
                finalSuccess = ReadOverlayModules(component);
            }
        }
    }

    return finalSuccess;
}

static bool WriteComponent(Component *component) {
    bool finalSuccess = false;

    bool success = WriteOverlayDefs(component);
    if (success) {
        success = WriteStaticModule(component);
        if (success) {
            success = WriteOverlayTable(component);
            if (success) {
                finalSuccess = WriteOverlayModules(component);
            }
        }
    }

    return finalSuccess;
}

static bool ComponentAddSuffix(Component *component, char *suffix) {
    if (suffix == NULL || suffix == "") return true;

    bool finalSuccess = false;
    bool success = AddSuffixOverlayDefs(component, suffix);
    if (success) {
        success = AddSuffixStaticModule(component, suffix);
        if (success) {
            success = AddSuffixOverlayTable(component, suffix);
            if (success) {
                finalSuccess = AddSuffixOverlayModules(component, suffix);
            }
        }
    }

    return finalSuccess;
}

static void FreeComponent(Component *component) {
    FreeOverlayDefs(component);
    FreeStaticModule(component);
    FreeOverlayTable(component);
    FreeOverlayModules(component);
    component->numOverlays = 0;
}

static void DebugPrintComponent(Component *component) {
    int i;
    char *filename;
    char c;
    uint staticParamsOffset = *(uint *)(component->staticModule.footerContent + 4);

    DebugPrintf("-------------------------------------------------------------\n");

    // TODO: Replace offsets with constants!
    DebugPrintf("static.buffer.filename           = %s\n"
                "             .ptr                = %p\n"
                "             .size               = %p %9d\n"
                "             .compressed         = %p %9d\n"
                "      .footerSize                = %p %9d\n"
                "      .footer                    = %p\n"
                "      .footer.magicNumber        = %08x %9s\n"
                "             .staticParamsOffset = %p %9d\n"
                "             .digestParamsOffset = %p %9d\n",
                component->staticModule.fileInfo.filename,
                component->staticModule.fileInfo.content,
                component->staticModule.fileInfo.fileSize, component->staticModule.fileInfo.fileSize,
                component->staticModule.fileInfo.unkC, component->staticModule.fileInfo.unkC,
                component->staticModule.footerSize, component->staticModule.footerSize,
                component->staticModule.footerContent,
                *(uint *)(component->staticModule.footerContent), (*(uint *)(component->staticModule.footerContent) == 0xDEC00621) ? "NITROCODE" : "UNKNOWN!!",
                *(uint *)(component->staticModule.footerContent + 4), *(uint *)(component->staticModule.footerContent + 4),
                *(uint *)(component->staticModule.footerContent + 8), *(uint *)(component->staticModule.footerContent + 8));

    // TODO: Replace offsets with constants!
    DebugPrintf("static.Params                    = %p\n"
                "      .Params.autoloadList       = %p\n"
                "      .Params.autoloadListEnd    = %p\n"
                "      .Params.autoloadStart      = %p\n"
                "      .Params.staticBssStart     = %p\n"
                "      .Params.staticBssEnd       = %p\n"
                "      .Params.compressedStatic   = %p\n",
                component->staticModule.fileInfo.content + staticParamsOffset,
                *(uint *)(component->staticModule.fileInfo.content + staticParamsOffset),
                *(uint *)(component->staticModule.fileInfo.content + staticParamsOffset + 4),
                *(uint *)(component->staticModule.fileInfo.content + staticParamsOffset + 8),
                *(uint *)(component->staticModule.fileInfo.content + staticParamsOffset + 12),
                *(uint *)(component->staticModule.fileInfo.content + staticParamsOffset + 16),
                *(uint *)(component->staticModule.fileInfo.content + staticParamsOffset + 20));

    DebugPrintf("-------------------------------------------------------------\n");
    DebugPrintf("numOverlays                      = %d\n", component->numOverlays);
    DebugPrintf("-------------------------------------------------------------\n");

    // TODO: Replace offsets with constants!
    DebugPrintf("ovdefs.buffer.filename           = %s\n"
                "             .ptr                = %p\n"
                "             .size               = %p %9d\n"
                "             .compressed         = %p %9d\n"
                "      .header                    = %p\n"
                "      .header.loadAddress        = %p\n"
                "      .header.entryAddress       = %p\n"
                "      .header.moduleSize         = %p %9d\n"
                "      .header.autoloadDone       = %p\n"
                "      .dirname                   = %s\n",
                component->overlayDefs.fileInfo.filename,
                component->overlayDefs.fileInfo.content,
                &component->overlayDefs.fileInfo.fileSize, component->overlayDefs.fileInfo.fileSize,
                &component->overlayDefs.fileInfo.unkC, component->overlayDefs.fileInfo.unkC,
                component->overlayDefs.content_dup,
                *(uint *)(component->overlayDefs.content_dup + 0),
                *(uint *)(component->overlayDefs.content_dup + 4),
                component->overlayDefs.content_dup + 8, *(uint *)(component->overlayDefs.content_dup + 8),
                *(uint *)(component->overlayDefs.content_dup + 12),
                component->dirName);

    filename = component->overlayFilenames;
    for (i = 0; i < component->numOverlays; i++) {
        DebugPrintf("      .filename[%2d]              = %s\n", i, filename);
        do {
            c = *filename;
            filename++;
        } while (c != '\0');
    }

    DebugPrintf("-------------------------------------------------------------\n");
    DebugPrintf("-------------------------------------------------------------\n");
}

void ConvertFinal(Options *options) {
    options->digestKey = StrDup(options->digestKey, NULL);
    options->outSuffix = StrDup(options->outSuffix, NULL);
}
