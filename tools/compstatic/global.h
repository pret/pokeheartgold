#ifndef GLOBAL_H
#define GLOBAL_H

#include <stdbool.h>

typedef unsigned char byte;
typedef unsigned short ushort;
typedef unsigned int uint;

#define MIN(X, Y) (((X) < (Y)) ? (X) : (Y))
#define MAX(X, Y) (((X) > (Y)) ? (X) : (Y))

#define ALIGN_4(addr) ((addr + 3U) & 0xfffffffc)

typedef struct {
    bool staticModule;
    int headerSize;      // size in bytes
    bool overlayModules;
    bool overlayDigest;
    int digestType;
    char *digestKey;
    char *outSuffix;
} Options;

#define SOURCE_FILES_STATIC_MODULE 0
#define SOURCE_FILES_OVERLAY_DEFS  1
#define SOURCE_FILES_OVERLAY_TABLE 2
#define NUM_SOURCE_FILES           3

typedef struct {
    char *filenames[NUM_SOURCE_FILES];
} SourceFiles;

extern bool gDebugMode;

typedef struct {
    char *filename;
    char *content;
    int fileSize;
    int compressedSize;
    bool rewrite; // File should be updated after compression
} FileInfo; // win32 sizeof == 0x14

typedef struct {
    FileInfo fileInfo;
    char *footerContent;
    uint footerSize;
} StaticModule; // win32 sizeof == 0x1c

typedef struct {
    FileInfo fileInfo;
    char *header;
} OverlayDefs; // win32 sizeof == 0x18

typedef struct {
    FileInfo fileInfo;
} OverlayModule; // win32 sizeof == 0x14

typedef struct {
    FileInfo fileInfo;
    char *table; // == fileInfo.content
} OverlayTable; // win32 sizeof == 0x18

typedef struct {
    StaticModule staticModule;
    int numOverlays;
    OverlayDefs overlayDefs;
    char *overlayFilenames;
    char *dirName;
    OverlayTable overlayTable;
    OverlayModule *overlayModules;
} Component; // win32 sizeof: 0x5c

#endif // GLOBAL_H
