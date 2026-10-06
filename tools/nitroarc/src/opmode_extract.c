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

#include <errno.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>

#include "nitroarc.h"
#include "common.h"
#include "extensions.h"

static int deduce_outdir(const options_t *opts, char **out_dirname);
static int extract_members(const nitroarc_t *narc, const char *outdir);

extern int tool_extract(const options_t *opts) {
    if (opts->file == NULL) {
        progerr(PROGRAM_NOFILE);
        progerr(PROGRAM_HELP, opts->name);
        return EXIT_FAILURE;
    }

    nitroarc_t narc   = { 0 };
    char      *outdir = NULL;
    char      *data   = NULL;
    size_t     size   = 0;

    int errc = load_file(opts->file, &data, &size)
            || read_archive(data, size, &narc)
            || deduce_outdir(opts, &outdir)
            || set_workdir(outdir)
            || extract_members(&narc, outdir)
            || EXIT_SUCCESS;

    free(data);
    free(outdir);
    return errc;
}

static int deduce_outdir(const options_t *opts, char **out_dirname) {
    size_t size = 0;
    char  *name = NULL;

    if (opts->argc > 0) {
        size = strlen(opts->argv[0]);
        name = malloc(size + 1);
        if (name == NULL) {
            progerr(
                "alloc failure setting up output directory '%s' for '%s': %s",
                opts->argv[0],
                opts->file,
                strerror(errno)
            );
            return PROGRAM_EALLOC;
        }

        memcpy(name, opts->argv[0], size);
        name[size] = 0;
    } else {
        size = strlen(opts->file);
        name = malloc(size + 3); // append '.d'
        if (name == NULL) {
            progerr(
                "alloc failure setting up output directory for '%s': %s",
                opts->file,
                strerror(errno)
            );
            return PROGRAM_EALLOC;
        }

        memcpy(name, opts->file, size);
        name[size + 0] = '.';
        name[size + 1] = 'd';
        name[size + 2] = 0;
    }

    *out_dirname = name;
    return PROGRAM_ENONE;
}

static int extract_members(const nitroarc_t *narc, const char *outdir) {
    const bool named       = narc->ndirs > 1;
    char       mname[4096] = { 0 };
    char      *fname;
    char      *data;
    uint32_t   size;

    for (uint16_t i = 0; i < narc->nfiles; i++) {
        int errc = nitroarc_geti(narc, i, (void **)&data, &size);
        if (errc) {
            progerr("error accessing member %u: %s", i, nitroarc_errs(errc));
            return PROGRAM_ELIBERROR;
        }

        if (named) {
            nitroarc_nameof(narc, i, mname, sizeof(mname));
            fname = &mname[1]; // Skip the leading `/`

            char *p = strchr(fname, '/');
            while (p != NULL) {
                *p = 0;
                if ((errc = ensure_mkdir(fname))) return errc;
                *p = '/';
                p  = strchr(p + 1, '/');
            }
        }
        else {
            snprintf(mname, sizeof(mname), "%05u.%s", i, guess_extension(data)->ext);
            fname = mname;
        }

        proglog("x %s/%s", outdir, fname);
        errc = write_file(fname, data, size);
        if (errc) return errc;
    }

    return PROGRAM_ENONE;
}
