// SPDX-License-Identifier: MIT

/*
 * nitrorom-list - List the components of a Nintendo DS ROM
 */

#include "nitrorom.h"

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "constants.h"

#include "libs/fileio.h"
#include "libs/litend.h"

#define PROGRAM_NAME "nitrorom-list"

static void showusage(FILE *stream);

#define args(__comp)                                       \
    __comp##ofs, __comp##ofs + __comp##size, __comp##size, \
        -(__comp##ofs + __comp##size) & (ROM_ALIGN - 1)

typedef struct romfile {
    uint32_t fileid;
    uint32_t romofs;
    uint32_t size;
} romfile;

static int sortfiles(const void *a, const void *b) // NOLINT
{
    const romfile *filea = a;
    const romfile *fileb = b;

    const uint32_t ofsa = filea->romofs;
    const uint32_t ofsb = fileb->romofs;

    return ofsa == ofsb ? 0 : ofsa < ofsb ? -1 : 1;
}

int nitrorom_list(int argc, const char **argv)
{
    if (argc <= 1 || strncmp(argv[1], "-h", 2) == 0 || strncmp(argv[1], "--help", 6) == 0) {
        showusage(stdout);
        exit(EXIT_SUCCESS);
    }

    const char *infile = argv[1];
    file        nds    = fprep(infile);
    if (nds.size < 0) die("could not open input file “%s”!", infile);

    unsigned char *header = malloc(HEADER_BSIZE);
    fread(header, 1, HEADER_BSIZE, nds.hdl);

    uint32_t arm9ofs  = leword(header + OFS_HEADER_ARM9_ROMOFFSET);
    uint32_t arm9size = leword(header + OFS_HEADER_ARM9_LOADSIZE);
    uint32_t arm7ofs  = leword(header + OFS_HEADER_ARM7_ROMOFFSET);
    uint32_t arm7size = leword(header + OFS_HEADER_ARM7_LOADSIZE);
    uint32_t fntbofs  = leword(header + OFS_HEADER_FNTB_ROMOFFSET);
    uint32_t fntbsize = leword(header + OFS_HEADER_FNTB_BSIZE);
    uint32_t fatbofs  = leword(header + OFS_HEADER_FATB_ROMOFFSET);
    uint32_t fatbsize = leword(header + OFS_HEADER_FATB_BSIZE);
    uint32_t ovt9ofs  = leword(header + OFS_HEADER_OVT9_ROMOFFSET);
    uint32_t ovt9size = leword(header + OFS_HEADER_OVT9_BSIZE);
    uint32_t ovt7ofs  = leword(header + OFS_HEADER_OVT7_ROMOFFSET);
    uint32_t ovt7size = leword(header + OFS_HEADER_OVT7_BSIZE);
    uint32_t bannofs  = leword(header + OFS_HEADER_BANNER_ROMOFFSET);

    unsigned char buf[4];

    fseek(nds.hdl, arm9ofs + arm9size, SEEK_SET);
    fread(buf, 1, sizeof(uint32_t), nds.hdl);
    uint32_t footer = leword(buf);
    if (footer == 0xDEC00621) arm9size += (3 * sizeof(uint32_t));

    fseek(nds.hdl, bannofs, SEEK_SET);
    fread(buf, 1, sizeof(uint16_t), nds.hdl);

    uint16_t bannvers = lehalf(buf);
    uint32_t bannsize;
    switch (bannvers) {
    case 1:  bannsize = BANNER_BSIZE_V1; break;
    case 2:  bannsize = BANNER_BSIZE_V2; break;
    case 3:  bannsize = BANNER_BSIZE_V3; break;
    default: die("unexpected banner size: %d", bannvers);
    }

    unsigned char *fatb = malloc(fatbsize);
    fseek(nds.hdl, fatbofs, SEEK_SET);
    fread(fatb, 1, fatbsize, nds.hdl);

    const char *rowformat = "0x%08X,0x%08X,0x%08X,0x%04X,%s\n";
    printf("ROM Start,ROM End,Size,Padding,Component\n");
    printf(rowformat, 0, HEADER_BSIZE, HEADER_BSIZE, 0, "% HEADER %");

    printf(rowformat, args(arm9), "% ARM9 %");
    if (ovt9size > 0) {
        printf(rowformat, args(ovt9), "% OVT9 %");
        unsigned char *ovt9 = malloc(ovt9size);
        fseek(nds.hdl, ovt9ofs, SEEK_SET);
        fread(ovt9, 1, ovt9size, nds.hdl);

        const char *ovyformat   = "%% OVY9_0x%04X %%";
        char        ovyname[32] = { 0 };
        for (long i = 0; i < ovt9size / 0x20; i++) {
            unsigned char *ovy     = &ovt9[i * 0x20];
            long           fileid  = leword(ovy + 0x18);
            uint32_t       ovyofs  = leword(fatb + (8 * fileid));
            uint32_t       ovysize = leword(fatb + (8 * fileid) + 4) - ovyofs;

            snprintf(ovyname, 32, ovyformat, leword(ovy));
            printf(rowformat, args(ovy), ovyname);
        }

        free(ovt9);
    }

    printf(rowformat, args(arm7), "% ARM7 %");
    if (ovt7size > 0) {
        printf(rowformat, args(ovt7), "% OVT7 %");
        unsigned char *ovt7 = malloc(ovt7size);
        fseek(nds.hdl, ovt7ofs, SEEK_SET);
        fread(ovt7, 1, ovt7size, nds.hdl);

        const char *ovyformat   = "%% OVY7_0x%04X %%";
        char        ovyname[32] = { 0 };
        for (long i = 0; i < ovt7size / 0x20; i++) {
            unsigned char *ovy     = &ovt7[i * 0x20];
            long           fileid  = leword(ovy + 0x18);
            uint32_t       ovyofs  = leword(fatb + (8 * fileid));
            uint32_t       ovysize = leword(fatb + (8 * fileid) + 4) - ovyofs;

            snprintf(ovyname, 32, ovyformat, leword(ovy));
            printf(rowformat, args(ovy), ovyname);
        }

        free(ovt7);
    }

    printf(rowformat, args(fntb), "% FNTB %");
    printf(rowformat, args(fatb), "% FATB %");
    printf(rowformat, args(bann), "% BANNER %");

    long noverlays = (ovt9size / 0x20) + (ovt7size / 0x20);
    long nfiles    = (fatbsize / 8) - noverlays;

    unsigned char *fatbfiles = fatb + (8 * noverlays);
    romfile       *files     = malloc(sizeof(romfile) * nfiles);
    for (long i = 0; i < nfiles; i++) {
        romfile *file = &files[i];
        file->fileid  = i + noverlays;
        file->romofs  = leword(&fatbfiles[(i * 8)]);
        file->size    = leword(&fatbfiles[(i * 8) + 4]) - file->romofs;
    }

    qsort(files, nfiles, sizeof(romfile), sortfiles);
    for (long i = 0; i < nfiles; i++) {
        romfile *file     = &files[i];
        uint32_t fileofs  = file->romofs;
        uint32_t filesize = file->size;

        char fileid[256];
        snprintf(fileid, 256, "%% FILE ID %d %%", file->fileid);
        printf(rowformat, args(file), fileid);
    }

    free(files);
    free(fatb);
    fclose(nds.hdl);
    exit(EXIT_SUCCESS);
}

static void showusage(FILE *stream)
{
    fprintf(stream, "nitrorom-list - List the components of a Nintendo DS ROM\n");
    fprintf(stream, "\n");
    fprintf(stream, "Usage: nitrorom list <INPUT.NDS>\n");
    fprintf(stream, "\n");
    fprintf(stream, "Options:\n");
    fprintf(stream, "  -h / --help            Display this help-text and exit.\n");
}
