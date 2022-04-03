#ifndef GLOBAL_H
#define GLOBAL_H

#include <stdbool.h>

typedef unsigned char byte;
typedef unsigned short ushort;
typedef unsigned int uint;

#define MIN(X, Y) (((X) < (Y)) ? (X) : (Y))
#define MAX(X, Y) (((X) > (Y)) ? (X) : (Y))

// NOTE TO SELF: All the fields are ints in the original!
typedef struct {
    bool staticModule;
    int headerSize;      // size in bytes
    bool overlayModules;
    bool overlayDigest;
    int unk10;
    char *digestKey;
    char *outSuffix;
    int unk1C; // stack allocated but unitialized - delete?
    int unk20; // stack allocated but unitialized - delete?
} Options;

#define SOURCE_FILES_STATIC_MODULE 0
#define SOURCE_FILES_OVERLAY_DEFS  1
#define SOURCE_FILES_OVERLAY_TABLE 2
#define NUM_SOURCE_FILES           3

typedef struct {
    char *filenames[NUM_SOURCE_FILES];
} SourceFiles;

bool gDebugMode;

typedef struct {
    char *filename;
    char *content;
    int fileSize;
    int unkC;
    int unk10;
} FileInfo; // sizeof == 0x14

typedef struct {
    FileInfo fileInfo;
    char *footerContent;
    uint footerSize;
} StaticModule; // sizeof == 0x1c

typedef struct {
    FileInfo fileInfo;
    char *content_dup;
} OverlayDefs; // sizeof == 0x18

typedef struct {
    FileInfo fileInfo;
} OverlayModule; // sizeof == 0x14

// TODO: Size seems to be 0x18 from ReadOverlayTable(). Make sure this is
// consistent with other usages.
typedef struct {
    FileInfo fileInfo;
    char *content_dup;
} OverlayTable; // sizeof == 0x18

typedef struct {
    StaticModule staticModule;
    int numOverlays;
    OverlayDefs overlayDefs;
    char *overlayFilenames;
    char *dirName;
    OverlayTable overlayTable;
    OverlayModule *overlayModules;
} Component; // size: 0x5c

#endif // GLOBAL_H
