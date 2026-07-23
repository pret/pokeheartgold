/*
 * nitroarc - an archiving utility for Nintendo's Nitro Archive format
 * Copyright (C) 2026 Rachel <rachel@lhea.me>
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any
 * any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "nitroarc.h"
#include "common.h"

static int print_metadata(const nitroarc_t *narc, const options_t *opts);

extern int tool_metadata(const options_t *opts) {
    if (opts->file == NULL) {
        progerr(PROGRAM_NOFILE);
        progerr(PROGRAM_HELP, opts->name);
        return EXIT_FAILURE;
    }

    nitroarc_t narc = { 0 };
    char      *data = NULL;
    size_t     size = 0;

    int errc = load_file(opts->file, &data, &size)
            || read_archive(data, size, &narc)
            || print_metadata(&narc, opts)
            || EXIT_SUCCESS;

    free(data);
    return errc;
}

static int print_metadata_markdown(const nitroarc_t *narc, bool header);
static int print_metadata_csv(const nitroarc_t *narc, bool header);

typedef struct fmtfunc fmtfunc_t;
struct fmtfunc {
    const char *id;
    int (*func)(const nitroarc_t *narc, bool header);
};

static const fmtfunc_t handlers[] = {
    { "markdown", print_metadata_markdown },
    { "csv",      print_metadata_csv    },
    { 0 },
};

static int print_metadata(const nitroarc_t *narc, const options_t *opts) {
    bool header = !opts->no_header;
    if (opts->format == NULL) return print_metadata_markdown(narc, header);

    const fmtfunc_t *candidate = &handlers[0];
    while (candidate->func != NULL) {
        if (strcmp(opts->format, candidate->id) == 0) break;
        candidate++;
    }

    if (candidate->func == NULL) {
        progerr("unrecognized format '%s'", opts->format);
        return PROGRAM_EGENERAL;
    }

    return candidate->func(narc, header);
}

#define putf printf // Only for nice alignment below

#define HEADER_MARKDOWN "| Section | Size (bytes) | Header Offset (abs) | Data Offset (abs) | Entry Count |\n" \
                        "| :------ | -----------: | ------------------: | ----------------: | ----------: |"
#define ROW_MARKDOWN    "| %s    |   %10u |          0x%08X |        0x%08X |       %5u |\n"

static int print_metadata_markdown(const nitroarc_t *narc, bool header) {
    const nitroarc_fatb_t *fatb = &narc->fatb;
    const nitroarc_fntb_t *fntb = &narc->fntb;
    const nitroarc_fimg_t *fimg = &narc->fimg;

    if (header) puts(HEADER_MARKDOWN);
    putf(ROW_MARKDOWN, "NARC", narc->size, 0, fatb->ofs_head, 3);
    putf(ROW_MARKDOWN, "FATB", fatb->size, fatb->ofs_head, fatb->ofs_data, narc->nfiles);
    putf(ROW_MARKDOWN, "FNTB", fntb->size, fntb->ofs_head, fntb->ofs_data, narc->ndirs);
    putf(ROW_MARKDOWN, "FIMG", fimg->size, fimg->ofs_head, fimg->ofs_data, narc->nfiles);

    return PROGRAM_ENONE;
}

#define HEADER_CSV "Section,Size (bytes),Header Offset (abs),Data Offset (abs),Entry Count"
#define ROW_CSV    "%s,%u,0x%08X,0x%08X,%u\n"

static int print_metadata_csv(const nitroarc_t *narc, bool header) {
    const nitroarc_fatb_t *fatb = &narc->fatb;
    const nitroarc_fntb_t *fntb = &narc->fntb;
    const nitroarc_fimg_t *fimg = &narc->fimg;

    if (header) puts(HEADER_CSV);
    putf(ROW_CSV, "NARC", narc->size, 0, fatb->ofs_head, 3);
    putf(ROW_CSV, "FATB", fatb->size, fatb->ofs_head, fatb->ofs_data, narc->nfiles);
    putf(ROW_CSV, "FNTB", fntb->size, fntb->ofs_head, fntb->ofs_data, narc->ndirs);
    putf(ROW_CSV, "FIMG", fimg->size, fimg->ofs_head, fimg->ofs_data, narc->nfiles);

    return PROGRAM_ENONE;
}
