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

#include "common.h"

#include <assert.h>
#include <errno.h>
#include <stdarg.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/stat.h>

#include "nitroarc.h"

static FILE *s_logfile = NULL;

void progput(FILE *stream, const char *fmt, va_list args) {
    fputs(PROGRAM ": ", stream);
    vfprintf(stream, fmt, args);
    fputc('\n', stream);
}

void progerr(const char *fmt, ...) {
    va_list args;
    va_start(args, fmt);
    progput(stderr, fmt, args);
    va_end(args);
}

void proglog(const char *fmt, ...) {
    if (s_logfile) {
        va_list args;
        va_start(args, fmt);
        progput(stdout, fmt, args);
        va_end(args);
    }
}

int open_file(const char *path, const char *mode, FILE **out_f) {
    assert(out_f);

    FILE *f = fopen(path, mode);
    if (f == NULL) {
        progerr("could not open file '%s': %s", path, strerror(errno));
        return PROGRAM_EFILEIO;
    }

    *out_f  = f;
    return PROGRAM_ENONE;
}

int load_file(const char *path, char **out_buf, size_t *out_size) {
    assert(out_buf);
    assert(out_size);

    if (path == NULL) return PROGRAM_ENONE;

    FILE *f    = NULL;
    char *buf  = NULL;
    int   errc = open_file(path, "rb", &f);
    if (errc) return errc;
    if (!f)   return PROGRAM_EGENERAL; // NOTE: Only to silence the compiler

    fseek(f, 0, SEEK_END);
    long fsize = ftell(f);
    fseek(f, 0, SEEK_SET);

    if (fsize == 0) { fclose(f); return PROGRAM_ENONE; }
    if (fsize < 0) {
        progerr("negative size for file '%s': %s", path, strerror(errno));
        errc = PROGRAM_EFILEIO;
        goto cleanup;
    }

    if ((buf = calloc(fsize + 1, 1)) == NULL) {
        progerr("alloc failure for file '%s': %s", path, strerror(errno));
        errc = PROGRAM_EALLOC;
        goto cleanup;
    }

    long nread = fread(buf, 1, fsize, f);
    if (nread != fsize) {
        progerr("I/O failure for file '%s': %s", path, strerror(errno));
        errc = PROGRAM_EFILEIO;
        goto cleanup;
    }

    *out_buf  = buf;
    *out_size = fsize;
    fclose(f);
    return PROGRAM_ENONE;

cleanup:
    free(buf);
    fclose(f);
    return errc;
}

int read_archive(const char *data, size_t size, nitroarc_t *narc) {
    assert(data);
    assert(narc);

    if (size > UINT32_MAX) {
        progerr("input data is too large to be an archive");
        return PROGRAM_EGENERAL;
    }

    int errc = nitroarc_read(data, (uint32_t)size, narc);
    if (errc) {
        progerr("archive format error: %s", nitroarc_errs(errc));
        return PROGRAM_ELIBERROR;
    }

    return PROGRAM_ENONE;
}

int set_logfile(bool verbose) {
    s_logfile = verbose ? stderr : NULL;
    return PROGRAM_ENONE;
}

int ensure_mkdir(const char *path) {
    if (path == NULL || path[0] == 0) return PROGRAM_ENONE;

    if (mkdir(path, S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH) == -1) {
        if (errno != EEXIST) {
            progerr("could not create directory '%s': %s", path, strerror(errno));
            return PROGRAM_EGENERAL;
        }

        errno = 0;
    } else {
        proglog("created new directory '%s'", path);
    }

    return PROGRAM_ENONE;
}

int set_workdir(const char *path) {
    int errc = ensure_mkdir(path);
    if (errc) return errc;

    if (path && chdir(path) == -1) {
        progerr("could not change directory '%s': %s", path, strerror(errno));
        return PROGRAM_EFILEIO;
    }

    return PROGRAM_ENONE;
}

int write_file(const char *path, void *data, size_t size) {
    assert(data);

    FILE *f  = NULL;
    int errc = open_file(path, "wb", &f);
    if (errc) return errc;
    if (!f)   return PROGRAM_EGENERAL; // NOTE: Only to silence the compiler

    if (fwrite(data, 1, size, f) != size) {
        progerr("partial write failure for file '%s': %s", path, strerror(errno));
        return PROGRAM_EFILEIO;
    }

    fclose(f);
    return PROGRAM_ENONE;
}
