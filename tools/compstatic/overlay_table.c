#include <stdbool.h>
#include <string.h>
#include "files.h"
#include "global.h"
#include "misc.h"
#include "overlay_table.h"
#include "print.h"

bool ReadOverlayTable(Component *component, char *filename) {
    OverlayTable *overlayTable = &component->overlayTable;
    if (filename == NULL || component->numOverlays < 1) {
        DebugPrintf("No overlay table to read\n");
        overlayTable->fileInfo.content = NULL;
        overlayTable->fileInfo.fileSize = 0;
        overlayTable->fileInfo.filename = NULL;
    } else {
        DebugPrintf("Reading overlayTable=%s\n", filename);
        int fileSize = ReadFile(filename, &overlayTable->fileInfo.content);
        overlayTable->fileInfo.fileSize = fileSize;
        overlayTable->fileInfo.filename = strdup(filename);
    }
    overlayTable->fileInfo.compressedSize = 0;
    overlayTable->fileInfo.rewrite = false;
    bool success = overlayTable->fileInfo.fileSize == component->numOverlays * OVERLAY_ENTRY_SIZE;
    if (success) {
        overlayTable->table = overlayTable->fileInfo.content;
    } else {
        ErrorPrintf("Not matched number of overlays and size of overlay table\n");
    }
    return success;
}

bool WriteOverlayTable(Component *component) {
    bool success;
    OverlayTable *overlayTable = &component->overlayTable;

    if (!overlayTable->fileInfo.rewrite) {
        success = true;
    } else if (overlayTable->fileInfo.filename == NULL) {
        ErrorPrintf("No filename specified for overlay table\n");
        success = false;
    } else {
        DebugPrintf("Writing overlayTable=%s\n", overlayTable->fileInfo.filename);
        if (overlayTable->fileInfo.compressedSize == 0) {
            int sizeWritten = WriteFile(overlayTable->fileInfo.filename, overlayTable->fileInfo.content, overlayTable->fileInfo.fileSize);
            success = sizeWritten >= 0;
        } else {
            ErrorPrintf("Don\'t support compressed overlay table\n");
            success = false;
        }
    }
    return success;
}

bool AddSuffixOverlayTable(Component *component, char *suffix) {
    bool success;

    if (component->overlayTable.fileInfo.content == NULL || component->numOverlays == 0) {
        DebugPrintf("No overlaytable to add suffix\n");
        success = true;
    } else {
        DebugPrintf("Adding suffix overlayTable=%s\n", suffix);
        success = AddSuffixBuffer(&component->overlayTable.fileInfo, suffix);
    }
    return success;
}

void FreeOverlayTable(Component *component) {
    if (component->overlayTable.fileInfo.content == NULL) {
        DebugPrintf("No overlaytable to release\n");
    } else {
        DebugPrintf("Releasing overlayTable\n");
        FreeBuffer(&component->overlayTable.fileInfo);
    }
    component->overlayTable.table = NULL;
}
