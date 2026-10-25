// SPDX-License-Identifier: MIT

#ifndef PACKER_H
#define PACKER_H

#include <stdint.h>
#include <stdio.h>

#include "libs/config.h"
#include "libs/sheets.h"
#include "libs/strings.h"
#include "libs/vector.h"

typedef struct source {
    string filename;

    union {
        FILE *hdl;
        void *buf;
    };
} source;

typedef struct rommember {
    source   source;
    uint32_t size;
    uint32_t offset; // final offset of the member
    uint16_t pad;
} rommember;

// We don't maintain file-handles for filesystem members as the upper-bound of filesystem members
// supported by the DS is quite large (61440).
typedef struct romfile {
    string   source;
    string   target;
    uint32_t size;
    uint32_t offset; // final offset of the file
    uint16_t pad;
    uint16_t filesysid;
    uint16_t packingid;
} romfile;

typedef struct rompacker {
    unsigned int packing : 1; // if 0, do not accept further input
    unsigned int verbose : 1; // if 1, emit verbose logs during packing

    // basic sanity-checks for setting banner components
    unsigned int bannerver      : 2;
    unsigned int hasbannertitle : 1;
    unsigned int hasbannersub   : 1;
    unsigned int hasbannerdev   : 1;
    unsigned int endbannertitle : 16;

    // rom-wide configuration values
    unsigned int filltail : 1;
    unsigned int fillwith : 8;
    unsigned int prom     : 1;

    unsigned int tailsize;

    vector *vardefs;

    rommember header;  // intermediate (optional template)
    rommember arm9;    // from disk (required)
    rommember ovt9;    // from disk (optional)
    vector    ovy9;    // T = rommember
    rommember arm7;    // from disk (required)
    rommember ovt7;    // from disk (optional)
    vector    ovy7;    // T = rommember
    rommember fntb;    // intermediate; computed by rompacker_seal
    rommember fatb;    // intermediate; computed by rompacker_seal
    rommember banner;  // intermediate
    vector    filesys; // T = romfile
} rompacker;

enum dumperr {
    E_dump_ok = 0,
    E_dump_packing,
};

rompacker   *rompacker_new(unsigned int verbose, vector *vardefs);
void         rompacker_del(rompacker *packer);
int          rompacker_seal(rompacker *packer);
enum dumperr rompacker_dump(rompacker *packer, FILE *stream);

// Handlers for packer configuration and filesystem entries. The definitions for these functions
// are contained within their own files in `source/parse/`.
cfgresult    cfg_header(string sec, string key, string val, void *packer, long line);
cfgresult    cfg_rom(string sec, string key, string val, void *packer, long line);
cfgresult    cfg_banner(string sec, string key, string val, void *packer, long line);
cfgresult    cfg_arm9(string sec, string key, string val, void *packer, long line);
cfgresult    cfg_arm7(string sec, string key, string val, void *packer, long line);
sheetsresult csv_addfile(sheetsrecord *record, void *packer, int line);

#endif // PACKER_H
