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
#include <stddef.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "nitroarc.h"
#include "common.h"
#include "extensions.h"

static int print_members(nitroarc_t *narc, const char *format, bool header);

extern int tool_list(const options_t *opts) {
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
            || print_members(&narc, opts->format, !opts->no_header)
            || EXIT_SUCCESS;

    free(data);
    return errc;
}

static int print_members_markdown(nitroarc_t *narc, bool header, bool named);
static int print_members_csv(nitroarc_t *narc, bool header, bool named);

typedef struct fmtfunc fmtfunc_t;
struct fmtfunc {
    const char *id;
    int (*func)(nitroarc_t *narc, bool header, bool named);
};

static const fmtfunc_t handlers[] = {
    { "markdown", print_members_markdown },
    { "csv",      print_members_csv      },
    { 0 },
};

static int print_members(nitroarc_t *narc, const char *format, bool header) {
    bool named = narc->ndirs > 1;
    if (format == NULL) return print_members_markdown(narc, header, named);

    const fmtfunc_t *candidate = &handlers[0];
    while (candidate->func != NULL) {
        if (strcmp(format, candidate->id) == 0) break;
        candidate++;
    }

    if (candidate->func == NULL) {
        progerr("unrecognized format '%s'", format);
        return PROGRAM_EGENERAL;
    }

    return candidate->func(narc, header, named);
}

static inline ptrdiff_t ptrdiff(const void *_l, const void *_r) {
    const unsigned char *l = _l;
    const unsigned char *r = _r;

    return l - r;
}

#define HEADER_MARKDOWN_1     "| Image Offset (rel) | Image Offset (abs) | Image Size (bytes) |\n"
#define HEADER_MARKDOWN_2     "| -----------------: | -----------------: | -----------------: |"
#define HEADER_MARKDOWN_INDEX "| Index | File Type " HEADER_MARKDOWN_1 \
                              "| :---- | --------- " HEADER_MARKDOWN_2

#define HEADER_MARKDOWN_NAME " | Path " HEADER_MARKDOWN_1 \
                             " | :--- " HEADER_MARKDOWN_2

#define printf_members(narc, format, ...)                               \
    do {                                                                \
        for (uint16_t i = 0; i < narc->nfiles && i < 0xF000; i++) {     \
            int errc = nitroarc_geti(narc, i, (void **)&mdata, &msize); \
            if (errc) {                                                 \
                progerr("%s", nitroarc_errs(errc));                     \
                return PROGRAM_ELIBERROR;                               \
            }                                                           \
                                                                        \
            nitroarc_nameof(narc, i, mname, sizeof(mname));             \
            printf(format, __VA_ARGS__);                                \
        }                                                               \
    } while (0)

static int print_members_markdown(nitroarc_t *narc, bool header, bool named) {
    const void *mdata       = NULL;
    uint32_t    msize       = 0;
    char        mname[4096] = { 0 };
    size_t      max_namelen = 0;

    if (named) {
        for (uint16_t i = 0; i < narc->nfiles && i < 0xF000; i++) {
            int errc = nitroarc_nameof(narc, i, mname, sizeof(mname));
            if (errc) {
                progerr("%s", nitroarc_errs(errc));
                return PROGRAM_ELIBERROR;
            }

            size_t namelen = strlen(mname);
            max_namelen = max_namelen < namelen ? namelen : max_namelen;
        }

        if (header) {
            printf("| %-*s %s", (int)max_namelen, "Path", HEADER_MARKDOWN_1);
            printf("| :");
            for (size_t i = 0; i < max_namelen - 1; i++) putc('-', stdout);
            printf(" %s\n", HEADER_MARKDOWN_2);
        }

        printf_members(
            narc,
            "| %-*s |         0x%08X |         0x%08X |         %10u |\n",
            (int)max_namelen,
            mname,
            (uint32_t)ptrdiff(mdata, narc->fimg.data),
            (uint32_t)ptrdiff(mdata, narc->head),
            msize
        );

        return NITROARC_ESUCCESS;
    }

    if (header) puts(HEADER_MARKDOWN_INDEX);
    printf_members(
        narc,
        "| %5d | %-9s |         0x%08X |         0x%08X |         %10u |\n",
        i,
        guess_extension(mdata)->ext,
        (uint32_t)ptrdiff(mdata, narc->fimg.data),
        (uint32_t)ptrdiff(mdata, narc->head),
        msize
    );

    return NITROARC_ESUCCESS;
}

#define HEADER_CSV "Image Offset (rel),Image Offset (abs),Image Size (bytes)"
#define HEADER_CSV_INDEX "Index,File Type" HEADER_CSV
#define HEADER_CSV_NAME  "Name," HEADER_CSV

static int print_members_csv(nitroarc_t *narc, bool header, bool named) {
    char        mname[4096] = { 0 };
    const void *mdata       = NULL;
    uint32_t    msize       = 0;

    if (named) {
        if (header) puts(HEADER_CSV_NAME);
        printf_members(
            narc,
            "%s,0x%08X,0x%08X,%u\n",
            mname,
            (uint32_t)ptrdiff(mdata, narc->fimg.data),
            (uint32_t)ptrdiff(mdata, narc->head),
            msize
        );

        return NITROARC_ESUCCESS;
    }

    if (header) puts(HEADER_CSV_INDEX);
    printf_members(
        narc,
        "%d,%s,0x%08X,0x%08X,%u\n",
        i,
        guess_extension(mdata)->ext,
        (uint32_t)ptrdiff(mdata, narc->fimg.data),
        (uint32_t)ptrdiff(mdata, narc->head),
        msize
    );

    return NITROARC_ESUCCESS;
}
