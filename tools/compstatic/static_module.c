#include <stdbool.h>
#include <string.h>
#include "files.h"
#include "global.h"
#include "misc.h"
#include "overlay_defs.h"
#include "print.h"
#include "static_module.h"

bool ReadStaticModule(Component *component, char *filename) {
    bool success;

    StaticModule *staticModule = &component->staticModule;

    DebugPrintf("Reading staticModule=%s\n", filename);
    int fileSize = ReadFile(filename, &staticModule->fileInfo.content);
    staticModule->fileInfo.fileSize = fileSize;
    staticModule->fileInfo.compressedSize = 0;
    staticModule->fileInfo.rewrite = false;
    staticModule->fileInfo.filename = strdup(filename);
    if (staticModule->fileInfo.fileSize < 0) {
        success = false;
    } else if (staticModule->fileInfo.fileSize % 4 == 0) {
        int footerOffset = *(int *)(component->overlayDefs.header + OVERLAY_DEFS_FOOTER_OFFSET);
        uint footerOffsetAligned = ALIGN_4(footerOffset);
        staticModule->footerSize = staticModule->fileInfo.fileSize - footerOffsetAligned;
        staticModule->footerContent = staticModule->fileInfo.content + footerOffsetAligned;
        staticModule->fileInfo.fileSize = footerOffset;

        int staticParamsOffset = *(uint *)(staticModule->footerContent + 4);
        if (staticModule->footerSize < 0xc || *(uint *)(staticModule->footerContent + STATIC_FOOTER_MAGIC_OFFSET) != 0xDEC00621) {
            ErrorPrintf("Static module is older format (No footer extension).\n");
            success = false;
        } else if (((staticParamsOffset % 4) == 0) &&
                   (staticParamsOffset > -1) &&
                   (staticParamsOffset < footerOffset)) {
                       success = true;
        } else {
            ErrorPrintf("Static module is illegal format (Unknown footer format).\n");
            success = false;
        }
    } else {
        ErrorPrintf("Static module size is illegal (size=%d). Must be aligned by 4\n");
        success = false;
    }
    return success;
}

bool WriteStaticModule(Component *component) {
    bool success;
    StaticModule *staticModule = &component->staticModule;

    if (!staticModule->fileInfo.rewrite) {
        success = true;
    } else {
        DebugPrintf("Writing staticModule=%s\n", staticModule->fileInfo.filename);
        int fileSize = staticModule->fileInfo.compressedSize ? staticModule->fileInfo.compressedSize : staticModule->fileInfo.fileSize;
        int sizeWritten = WriteFile(staticModule->fileInfo.filename, staticModule->fileInfo.content, fileSize + staticModule->footerSize);
        success = sizeWritten >= 0;
    }
    return success;
}

bool AddSuffixStaticModule(Component *component, char *suffix) {
    DebugPrintf("Adding suffix staticModule=%s\n", suffix);
    return AddSuffixBuffer(&component->staticModule.fileInfo, suffix);
}

void FreeStaticModule(Component *component) {
    DebugPrintf("Releasing staticModule\n");
    FreeBuffer(&component->staticModule.fileInfo);
    component->staticModule.footerContent = NULL;
    component->staticModule.footerSize = 0;
}
