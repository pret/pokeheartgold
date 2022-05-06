#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include "files.h"
#include "global.h"
#include "misc.h"
#include "overlay_defs.h"
#include "print.h"

bool ReadOverlayDefs(Component *component, char *filename) {
    int numWords;
    int checkPtr;
    bool success = false;

    DebugPrintf("Reading overlayDefs=%s\n", filename);
    int fileSize = ReadFile(filename, &component->overlayDefs.fileInfo.content);
    component->overlayDefs.fileInfo.fileSize = fileSize;
    component->overlayDefs.fileInfo.compressedSize = 0;
    component->overlayDefs.fileInfo.rewrite = false;
    component->overlayDefs.fileInfo.filename = strdup(filename);

    if (component->overlayDefs.fileInfo.fileSize < 0) {
        success = false;
    } else if (component->overlayDefs.fileInfo.fileSize < MIN_OVERLAY_DEFS_FILE_SIZE) {
        ErrorPrintf("Overlaydefs is too small (size=%d). Must be >= %d\n", component->overlayDefs.fileInfo.fileSize, MIN_OVERLAY_DEFS_FILE_SIZE);
        success = false;
    } else {
        component->overlayDefs.header = component->overlayDefs.fileInfo.content;
        component->overlayFilenames = component->overlayDefs.header + OVERLAY_DEFS_FILENAMES_OFFSET;
        component->dirName = GetDirName(filename);
        if (component->dirName == NULL) {
            success = false;
        } else {
            // Count the number of words in the footer. Once two '\0' chars
            // appear back-to-back, stop checking.
            numWords = 0;
            checkPtr = 0;
            for (int i = 0; i < component->overlayDefs.fileInfo.fileSize - OVERLAY_DEFS_FILENAMES_SIZE; i++) {
                if (component->overlayFilenames[i] == '\0') {
                    if (checkPtr == i) break;
                    numWords++;
                    checkPtr = i + 1;
                }
            }
            component->numOverlays = numWords;
            success = true;
        }
    }

    return success;
}

bool WriteOverlayDefs(Component *component) {
    int sizeWritten;
    bool success;

    OverlayDefs *overlayDefs = &component->overlayDefs;
    if (!overlayDefs->fileInfo.rewrite) {
        success = true;
    } else {
        DebugPrintf("Writing overlayDefs=%s\n", overlayDefs->fileInfo.filename);
        if (overlayDefs->fileInfo.compressedSize == 0) {
            sizeWritten = WriteFile(overlayDefs->fileInfo.filename, overlayDefs->fileInfo.content, overlayDefs->fileInfo.fileSize);
            success = sizeWritten >= 0;
        } else {
            ErrorPrintf("Don\'t support compressed overlaydefs\n");
            success = false;
        }
    }
    return success;
}

bool AddSuffixOverlayDefs(Component *component, char *suffix) {
    DebugPrintf("Adding suffix overlayDefs=%s\n", suffix);
    return AddSuffixBuffer(&component->overlayDefs.fileInfo, suffix);
}

void FreeOverlayDefs(Component *component) {
    DebugPrintf("Releasing overlayDefs\n");
    FreeBuffer(&component->overlayDefs.fileInfo);
    component->overlayDefs.header = NULL;
    component->overlayFilenames = NULL;
    if (component->dirName != NULL) {
        free(component->dirName);
        component->dirName = NULL;
    }
}
