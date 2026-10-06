// SPDX-License-Identifier: MIT

#include "packer.h"

#include <stdio.h>
#include <stdlib.h> // NOLINT: misc-include-cleaner

#include "constants.h"

#include "libs/fileio.h"
#include "libs/sheets.h"
#include "libs/strings.h"
#include "libs/vector.h"

#define sheetserr(__msg, ...)                                           \
    {                                                                   \
        sheetsresult __res = { .code = E_sheets_user, .pos = stringZ }; \
        snprintf(                                                       \
            (__res).msg,                                                \
            sizeof(__res).msg,                                          \
            "rompacker:filesystem:%d: " __msg,                          \
            line,                                                       \
            __VA_ARGS__                                                 \
        );                                                              \
        return __res;                                                   \
    }

#define SOURCE 0
#define TARGET 1

sheetsresult csv_addfile(sheetsrecord *record, void *user, int line)
{
    if (record->nfields != 2) {
        sheetserr("expected 2 fields for record, but found %lu", record->nfields);
    }

    rompacker *packer = user;
    romfile   *file   = push(&packer->filesys, romfile);
    file->source      = record->fields[SOURCE];
    file->target      = record->fields[TARGET];

    long fsize      = fsizes(file->source);
    file->size      = fsize;
    file->pad       = -file->size & (ROM_ALIGN - 1);
    file->packingid = packer->filesys.len - 1;

    if (fsize < 0) sheetserr("could not open source file “%.*s”", fmtstring(file->source));

    if (packer->verbose) {
        fprintf(
            stderr,
            "rompacker:filesystem: 0x%08X,0x%08X,%.*s,%.*s\n",
            file->size,
            file->pad,
            fmtstring(file->source),
            fmtstring(file->target)
        );
    }

    return (sheetsresult){ .code = E_sheets_none };
}
