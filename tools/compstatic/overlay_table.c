#include <stdbool.h>
#include <string.h>
#include "files.h"
#include "global.h"
#include "misc.h"
#include "overlay_table.h"
#include "print.h"

#define OVERLAY_ENTRY_SIZE (32)

bool ReadOverlayTable(Component *component, char *filename) {
    OverlayTable *overlayTable = &component->overlayTable;
    if (filename == NULL || component->numOverlays < 1) {
        DebugPrintf("No overlay table to read\n");
        overlayTable->fileInfo.content = NULL;
        overlayTable->fileInfo.fileSize = 0;
        overlayTable->fileInfo.filename = NULL;
    } else {
        // TODO: Removed duplicate var `ovTable2`. Clean up
        DebugPrintf("Reading overlayTable=%s\n", filename);
        int fileSize = ReadFile(filename, &overlayTable->fileInfo.content);
        overlayTable->fileInfo.fileSize = fileSize;
        overlayTable->fileInfo.filename = strdup(filename);
    }
    overlayTable->fileInfo.unkC = false;
    overlayTable->fileInfo.unk10 = 0;
    bool success = overlayTable->fileInfo.fileSize == component->numOverlays * OVERLAY_ENTRY_SIZE;
    if (success) {
        overlayTable->content_dup = overlayTable->fileInfo.content;
    } else {
        ErrorPrintf("Not matched number of overlays and size of overlay table\n");
    }
    return success;
}

bool WriteOverlayTable(Component *component) {
    bool success;
    OverlayTable *overlayTable = &component->overlayTable;

    if (overlayTable->fileInfo.unk10 == 0) {
        success = true;
    } else if (overlayTable->fileInfo.filename == NULL) {
        ErrorPrintf("No filename specified for overlay table\n");
        success = false;
    } else {
        DebugPrintf("Writing overlayTable=%s\n", overlayTable->fileInfo.filename);
        if (overlayTable->fileInfo.unkC == 0) {
            // CLEAN UP: I re-wrote this from (success := ~sizeWriten >> 0x1f)
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
    component->overlayTable.content_dup = NULL;
}
