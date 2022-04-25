#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "component.h"
#include "files.h"
#include "global.h"
#include "print.h"
#include "str.h"

bool gDebugMode = false;

void InitializeOptions(Options *options) {
    options->staticModule = false;
    options->headerSize = 0x4000;
    options->overlayModules = false;
    options->overlayDigest = false;
    options->digestType = 2;
    options->digestKey = StrDup(NULL, NULL);
    options->outSuffix = StrDup(NULL, "_LZ");
}

void usage(void) {
    printf("NDS Development Tool - compstatic - Compress static module\n\n"
           "Usage: compstatic [-sHSIZE|-9|-7] [-c] [-a[FILE]]\n"
           "                  [-F] [-eSUFFIX] [-fRESFILE] [-d] [-h]\n"
           "                  [STATICMODULE OVERLAYDEFS [OVERLAYTABLE]]\n\n"
           "  Compress component modules\n\n"
           "    -sHSIZE   Compress STATICMODULE\n"
           "                       without header region specified by HSIZE(bytes)\n"
           "    -9        Compress as ARM9 static module (HEADER_SIZE = 16k)\n"
           "    -7        Compress as ARM7 static module (HEADER_SIZE =  1k)\n"
           "    -c        Compress overlay modules\n"
           "    -a[FILE]  Generate overlay digest code with FILE as key\n"
           "    -F        Overwrite original component files\n"
           "    -eSUFFIX  SUFFIX for output file (default:\"_LZ\")\n"
           "    -fRESFILE Use response file to specify source files\n"
           "    -d        Show debug messages (for test purpose)\n"
           "    -h        Show this message\n\n");
}

int main(int argc, char *argv[]) {
    int opt;
    int useResponseFile = false;
    int argsLeft;
    char **remainingArgs;
    char *overlayTable;
    bool success;
    SourceFiles sourceFiles;
    Options options;

    InitializeOptions(&options);
    while ((opt = getopt(argc, argv, "s:ca::A:97Fe:fdhv")) != -1) {
        switch (opt) {
        case '7':
            options.staticModule = true;
            options.headerSize = 0x400;
            break;
        case '9':
            options.staticModule = true;
            options.headerSize = 0x4000;
            break;
        // Not referenced in usage
        case 'A':
            options.digestType = atoi(optarg);
            break;
        case 'F':
            options.outSuffix = StrDup(options.outSuffix, NULL);
            break;
        case 'a':
            options.overlayDigest = true;
            options.digestKey = StrDup(options.digestKey, optarg);
            break;
        case 'c':
            options.overlayModules = true;
            break;
        case 'd':
            gDebugMode = true;
            break;
        case 'e':
            options.outSuffix = strdup(optarg);
            break;
        case 'f':
            useResponseFile = true;
            break;
        case 's':
            options.staticModule = true;
            options.headerSize = atoi(optarg);
            break;
        default:
            usage();
            break;
        }
        DebugPrintf("option -%c: %s\n", opt, (optarg == NULL) ? "No ARG" : optarg);
    }

    argsLeft = argc - optind;
    remainingArgs = &argv[optind];

    DebugPrintf("argc=%d  optind=%d\n", argsLeft, optind);
    for (int i = 0; i < argsLeft; i++) {
      DebugPrintf("argv[%d] = [%s]\n", i, argv[optind + i]);
    }

    if (!useResponseFile || argsLeft != 1) {
        if (!useResponseFile && (argsLeft == 2 || argsLeft == 3)) {
            overlayTable = (argsLeft == 3) ? remainingArgs[2] : NULL;
            success = ConvertComponent(&options, remainingArgs[0], remainingArgs[1], overlayTable);
        } else {
            usage();
        }
    } else {
        success = GetFiles(remainingArgs[0], &sourceFiles);
        if (success) {
            printf("StaticModule = %s\n", sourceFiles.filenames[SOURCE_FILES_STATIC_MODULE]);
            printf("OverlayDefs = %s\n", sourceFiles.filenames[SOURCE_FILES_OVERLAY_DEFS]);
            printf("OverlayTable = %s\n", sourceFiles.filenames[SOURCE_FILES_OVERLAY_TABLE]);

            success = ConvertComponent(&options, sourceFiles.filenames[SOURCE_FILES_STATIC_MODULE], sourceFiles.filenames[SOURCE_FILES_OVERLAY_DEFS], sourceFiles.filenames[SOURCE_FILES_OVERLAY_TABLE]);
            free(sourceFiles.filenames[SOURCE_FILES_STATIC_MODULE]);
            free(sourceFiles.filenames[SOURCE_FILES_OVERLAY_DEFS]);
            free(sourceFiles.filenames[SOURCE_FILES_OVERLAY_TABLE]);
        }
    }

    ConvertFinal(&options);
    if (!success) {
        ErrorPrintf("exit...\n");
        return EXIT_FAILURE;
    }

    return EXIT_SUCCESS;
}
