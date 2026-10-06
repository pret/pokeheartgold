// SPDX-License-Identifier: MIT

#include "packer.h"

#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "cfgparse.h"
#include "constants.h"

#include "libs/config.h"
#include "libs/fileio.h"
#include "libs/strings.h"
#include "libs/vector.h"

// NOTE: This performs an allocation that may *appear* to be left dangling, but we employ a trick:
// The first element of the vector points to the beginning of the allocated region, so freeing the
// first element's filename string will free the entire region.
static cfgresult cfg_overlays(rompacker *packer, file *f, vector *ovyvec, long line, char *sec)
{
    long           lennames = f->size - 0x10;
    unsigned char *ovynames = malloc(lennames);
    fread(ovynames, 1, lennames, f->hdl);
    fclose(f->hdl);

    for (long i = 0; i < lennames; i++) {
        rommember *ovy           = push(ovyvec, rommember);
        ovy->source.filename.s   = &ovynames[i];
        ovy->source.filename.len = 0;

        // Continue until the next null-terminator
        for (long j = i; j < lennames && ovynames[j]; j++, ovy->source.filename.len++);
        i += ovy->source.filename.len;

        file fovy = fprep((const char *)ovy->source.filename.s);
        if (fovy.size < 0) {
            configerr(
                "could not open %s overlay file “%.*s”",
                sec,
                fmtstring(ovy->source.filename)
            );
        }

        ovy->source.hdl = fovy.hdl;
        ovy->size       = fovy.size;
        ovy->pad        = -(fovy.size) & (ROM_ALIGN - 1);

        if (packer->verbose) {
            fprintf(
                stderr,
                "rompacker:configuration:%s: loaded “%.*s” as an overlay\n",
                sec,
                fmtstring(ovy->source.filename)
            );
        }
    }

    return configok;
}

static inline cfgresult cfg_arm_prepfile(
    rompacker  *packer,
    rommember  *target,
    string      val,
    long        line,
    const char *sec, // NOLINT
    const char *key  // NOLINT
)
{
    varsub(val, packer);
    file fhandle = fpreps(val);
    if (fhandle.size < 0) configerr("could not open %s file “%.*s”", key, fmtstring(val));

    target->source.filename = val;
    target->source.hdl      = fhandle.hdl;
    target->size            = fhandle.size;
    target->pad             = -(fhandle.size) & (ROM_ALIGN - 1);

    if (packer->verbose) {
        fprintf(
            stderr,
            "rompacker:configuration:%s: loaded “%.*s” as the static binary\n",
            sec,
            fmtstring(val)
        );
    }

    return configok;
}

static cfgresult cfg_arm9_staticbinary(rompacker *packer, string val, long line)
{
    return cfg_arm_prepfile(packer, &packer->arm9, val, line, "arm9", "static binary");
}

static cfgresult cfg_arm9_definitions(rompacker *packer, string val, long line)
{
    varsub(val, packer);
    file fdefinitions = fpreps(val);
    if (fdefinitions.size < 0) {
        configerr("could not open arm9 definitions file “%.*s”", fmtstring(val));
    }
    if (fdefinitions.size < 0x10) {
        configerr("arm9 definitions file “%.*s” is beneath the minimum size 0x10", fmtstring(val));
    }

    unsigned char *header = packer->header.source.buf;
    fread(header + OFS_HEADER_ARM9_LOADADDR, 1, 4, fdefinitions.hdl);
    fread(header + OFS_HEADER_ARM9_ENTRYPOINT, 1, 4, fdefinitions.hdl);
    fread(header + OFS_HEADER_ARM9_LOADSIZE, 1, 4, fdefinitions.hdl);
    fread(header + OFS_HEADER_ARM9_AUTOLOADCB, 1, 4, fdefinitions.hdl);

    return fdefinitions.size > 0x10
             ? cfg_overlays(packer, &fdefinitions, &packer->ovy9, line, "arm9")
             : configok;
}

static cfgresult cfg_arm9_overlaytable(rompacker *packer, string val, long line)
{
    return cfg_arm_prepfile(packer, &packer->ovt9, val, line, "arm9", "overlay table");
}

static cfgresult cfg_arm7_staticbinary(rompacker *packer, string val, long line)
{
    return cfg_arm_prepfile(packer, &packer->arm7, val, line, "arm7", "static binary");
}

static cfgresult cfg_arm7_definitions(rompacker *packer, string val, long line)
{
    varsub(val, packer);
    file fdefinitions = fpreps(val);
    if (fdefinitions.size < 0) {
        configerr("could not open arm7 definitions file “%.*s”", fmtstring(val));
    }
    if (fdefinitions.size < 0x10) {
        configerr("arm7 definitions file “%.*s” is beneath the minimum size 0x10", fmtstring(val));
    }

    unsigned char *header = packer->header.source.buf;
    fread(header + OFS_HEADER_ARM7_LOADADDR, 1, 4, fdefinitions.hdl);
    fread(header + OFS_HEADER_ARM7_ENTRYPOINT, 1, 4, fdefinitions.hdl);
    fread(header + OFS_HEADER_ARM7_LOADSIZE, 1, 4, fdefinitions.hdl);
    fread(header + OFS_HEADER_ARM7_AUTOLOADCB, 1, 4, fdefinitions.hdl);

    return fdefinitions.size > 0x10
             ? cfg_overlays(packer, &fdefinitions, &packer->ovy7, line, "arm7")
             : configok;
}

static cfgresult cfg_arm7_overlaytable(rompacker *packer, string val, long line)
{
    return cfg_arm_prepfile(packer, &packer->ovt7, val, line, "arm7", "overlay table");
}

// clang-format off
static const keyvalueparser kvparsers_arm9[] = {
    { .key = string("static-binary"), .parser = cfg_arm9_staticbinary },
    { .key = string("definitions"),   .parser = cfg_arm9_definitions  },
    { .key = string("overlay-table"), .parser = cfg_arm9_overlaytable },
    { .key = stringZ,                 .parser = NULL                  },
};

static const keyvalueparser kvparsers_arm7[] = {
    { .key = string("static-binary"), .parser = cfg_arm7_staticbinary },
    { .key = string("definitions"),   .parser = cfg_arm7_definitions  },
    { .key = string("overlay-table"), .parser = cfg_arm7_overlaytable },
    { .key = stringZ,                 .parser = NULL                  },
};
// clang-format on

cfgresult cfg_arm9(string sec, string key, string val, void *user, long line) // NOLINT
{
    (void)sec;
    rompacker *packer = user;

    const keyvalueparser *match = &kvparsers_arm9[0];
    for (; match->parser != NULL && !strequ(key, match->key); match++);

    if (match->parser) return match->parser(packer, val, line);

    configerr("unrecognized arm9-section key “%.*s”", fmtstring(key));
}

cfgresult cfg_arm7(string sec, string key, string val, void *user, long line) // NOLINT
{
    (void)sec;
    rompacker *packer = user;

    const keyvalueparser *match = &kvparsers_arm7[0];
    for (; match->parser != NULL && !strequ(key, match->key); match++);

    if (match->parser) return match->parser(packer, val, line);

    configerr("unrecognized arm7-section key “%.*s”", fmtstring(key));
}
