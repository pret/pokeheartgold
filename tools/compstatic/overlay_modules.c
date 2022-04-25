#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "files.h"
#include "global.h"
#include "misc.h"
#include "overlay_modules.h"
#include "print.h"

bool ReadOverlayModules(Component *component) {
    bool success;
    char c;
    OverlayModule *overlayModules;

    char *overlayFilenames = component->overlayFilenames;
    char *dirName = component->dirName;
    int dirNameLength = strlen(dirName);

    if (component->numOverlays == 0) {
        DebugPrintf("No overlay to read\n");
        component->overlayModules = NULL;
        success = true;
    } else {
        overlayModules = calloc(component->numOverlays, sizeof(OverlayModule));
        if (overlayModules == NULL) {
            ErrorPrintf("Cannot allocate memory.\n");
            success = false;
        } else {
            component->overlayModules = overlayModules;
            for (int i = 0; i < component->numOverlays; i++) {
                int filenameLength = strlen(overlayFilenames);
                overlayModules->fileInfo.filename = malloc(filenameLength + dirNameLength + 2);;
                if (overlayModules->fileInfo.filename == NULL) {
                    ErrorPrintf("Cannot allocate memory\n");
                    return false;
                }
                sprintf(overlayModules->fileInfo.filename, "%s/%s", dirName, overlayFilenames);
                DebugPrintf("Reading overlay[%d]=%s\n", i, overlayModules->fileInfo.filename);

                int fileSize = ReadFile(overlayModules->fileInfo.filename, &overlayModules->fileInfo.content);
                overlayModules->fileInfo.fileSize = fileSize;
                overlayModules->fileInfo.compressedSize = 0;
                overlayModules->fileInfo.rewrite = false;
                if (overlayModules->fileInfo.fileSize < 0) return false;

                overlayModules++;
                do {
                    c = *overlayFilenames;
                    overlayFilenames++;
                } while (c != '\0');
            }
            success = true;
        }
    }
    return success;
}

bool WriteOverlayModules(Component *component) {
    OverlayModule *overlayModule = component->overlayModules;
    int i = 0;

    do {
        if (i >= component->numOverlays) {
            return true;
        }
        if (overlayModule->fileInfo.rewrite) {
            DebugPrintf("Writing overlay[%d]=%s\n", i, overlayModule->fileInfo.filename);
            int overlaySize = overlayModule->fileInfo.compressedSize ? overlayModule->fileInfo.compressedSize : overlayModule->fileInfo.fileSize;
            int sizeWritten = WriteFile(overlayModule->fileInfo.filename, overlayModule->fileInfo.content, overlaySize);
            if (sizeWritten < 0) {
                return false;
            }
        }
        overlayModule++;
        i++;
    } while (true);
}

bool AddSuffixOverlayModules(Component *component, char *suffix) {
    bool success;

    OverlayModule *overlayModule = component->overlayModules;
    if (component->numOverlays == 0 || overlayModule == NULL) {
        DebugPrintf("No overlay to add suffix\n");
        success = true;
    } else if (suffix == NULL || *suffix == '\0') {
        success = true;
    } else {
        int suffixLength = strlen(suffix);
        int fileSize = suffixLength * component->numOverlays + component->overlayDefs.fileInfo.fileSize;
        char *buffer = malloc(fileSize);
        if (buffer == NULL) {
            ErrorPrintf("Cannot allocate memory\n");
            success = false;
        } else {
            uint *header32 = (uint *)component->overlayDefs.header;
            *(uint *)buffer = header32[0];
            *(uint *)(buffer + 4) = header32[1];
            *(uint *)(buffer + 8) = header32[2];
            *(uint *)(buffer + 0xc) = header32[3];

            char *contentPtr = buffer + 0x10;
            char *ovFilename = component->overlayFilenames;
            for (int i = 0; i < component->numOverlays; i++) {
                DebugPrintf("Adding suffix overlay[%d]\n", i);
                strcpy(contentPtr, ovFilename);
                strcat(contentPtr, suffix);

                int length = strlen(ovFilename);
                ovFilename += length + 1;
                length = strlen(contentPtr);
                contentPtr += length + 1;

                bool addSuffixSuccess = AddSuffixBuffer(&overlayModule->fileInfo, suffix);
                if (!addSuffixSuccess) {
                    return false;
                }
                overlayModule++;
            }
            CopyBuffer(ovFilename, contentPtr, fileSize - ((size_t)contentPtr - (size_t)buffer));
            free(component->overlayDefs.fileInfo.content);
            component->overlayDefs.fileInfo.content = buffer;
            component->overlayDefs.fileInfo.fileSize = fileSize;
            component->overlayDefs.fileInfo.rewrite = true;
            component->overlayDefs.header = buffer;
            component->overlayFilenames = buffer + 0x10;
            success = true;
        }
    }
    return success;
}

void FreeOverlayModules(Component *component) {
    OverlayModule *overlayModule = component->overlayModules;
    if (component->numOverlays == 0 || overlayModule == NULL) {
        DebugPrintf("No overlay to release\n");
    } else {
        for (int i = 0; i < component->numOverlays; i++) {
            DebugPrintf("Releasing overlay[%d]\n", i);
            FreeBuffer(&overlayModule->fileInfo);
            overlayModule++;
        }
    }
    if (component->overlayModules != NULL) {
        free(component->overlayModules);
        component->overlayModules = NULL;
    }
}
