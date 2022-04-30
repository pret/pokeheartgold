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

static bool ReadComponent(Component *component, char *staticModule, char *overlayDefs, char *overlayTable);
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
            if (!options->overlayDigest || CalculateHMAC_OverlayModules(&component, options->digestType, options->digestKey)) {
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
    if (suffix == NULL || *suffix == '\0') return true;

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
    StaticParams *staticParams = (StaticParams *)(component->staticModule.fileInfo.content + staticParamsOffset);

    DebugPrintf("-------------------------------------------------------------\n");

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
                component->staticModule.fileInfo.compressedSize, component->staticModule.fileInfo.compressedSize,
                component->staticModule.footerSize, component->staticModule.footerSize,
                component->staticModule.footerContent,
                *(uint *)(component->staticModule.footerContent + STATIC_FOOTER_MAGIC_OFFSET), (*(uint *)(component->staticModule.footerContent + STATIC_FOOTER_MAGIC_OFFSET) == 0xDEC00621) ? "NITROCODE" : "UNKNOWN!!",
                *(uint *)(component->staticModule.footerContent + STATIC_FOOTER_STATIC_PARAM_OFFSET), *(uint *)(component->staticModule.footerContent + STATIC_FOOTER_STATIC_PARAM_OFFSET),
                *(uint *)(component->staticModule.footerContent + STATIC_FOOTER_DIGEST_PARAM_OFFSET), *(uint *)(component->staticModule.footerContent + STATIC_FOOTER_DIGEST_PARAM_OFFSET));

    DebugPrintf("static.Params                    = %p\n"
                "      .Params.autoloadList       = %p\n"
                "      .Params.autoloadListEnd    = %p\n"
                "      .Params.autoloadStart      = %p\n"
                "      .Params.staticBssStart     = %p\n"
                "      .Params.staticBssEnd       = %p\n"
                "      .Params.compressedStatic   = %p\n",
                component->staticModule.fileInfo.content + staticParamsOffset,
                staticParams->autoloadList,
                staticParams->autoloadListEnd,
                staticParams->autoloadStart,
                staticParams->staticBssStart,
                staticParams->staticBssEnd,
                staticParams->compressedStatic);

    DebugPrintf("-------------------------------------------------------------\n");
    DebugPrintf("numOverlays                      = %d\n", component->numOverlays);
    DebugPrintf("-------------------------------------------------------------\n");

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
                &component->overlayDefs.fileInfo.compressedSize, component->overlayDefs.fileInfo.compressedSize,
                component->overlayDefs.header,
                *(uint *)(component->overlayDefs.header + OVERLAY_DEFS_HEADER_LOAD_ADDRESS_OFFSET),
                *(uint *)(component->overlayDefs.header + OVERLAY_DEFS_HEADER_ENTRY_ADDRESS_OFFSET),
                component->overlayDefs.header + OVERLAY_DEFS_HEADER_MODULE_SIZE_OFFSET, *(uint *)(component->overlayDefs.header + OVERLAY_DEFS_HEADER_MODULE_SIZE_OFFSET),
                *(uint *)(component->overlayDefs.header + OVERLAY_DEFS_HEADER_AUTOLOAD_DONE_OFFSET),
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
