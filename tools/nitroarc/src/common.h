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

#ifndef TOOL_COMMON_H
#define TOOL_COMMON_H

#include <stdbool.h>
#include <stddef.h>
#include <stdio.h>

#include "nitroarc.h"

#ifdef __GNUC__
#  define ATTR_FORMAT(f, a) __attribute__((format(printf, f, a)))
#else
#  define ATTR_FORMAT(f, a)
#endif

#define PROGRAM        "nitroarc"
#define PROGRAM_NOFILE "no archive file specified (missing -f option?)"
#define PROGRAM_HELP   "try '%s --help' for more information"

#define PROGRAM_ENONE     0
#define PROGRAM_EGENERAL  1
#define PROGRAM_EFILEIO   2
#define PROGRAM_EALLOC    3
#define PROGRAM_ELIBERROR 127

typedef struct options options_t;
struct options {
    unsigned int mode       : 4; // operation mode
    unsigned int verbose    : 1; // -v, --verbose
    unsigned int help       : 1; // -?, --help
    unsigned int version    : 1; // -V, --version
    unsigned int no_header  : 1; // -H, --no-header
    unsigned int index      : 1; // -I, --index
    unsigned int index_ns   : 1; // -P, --index-namespace
    unsigned int no_recurse : 1; // -R, --no-recursion
    unsigned int named      : 1; // -N, --named
    unsigned int stripped   : 1; // -S, --stripped

    int          argc;
    const char **argv;
    const char  *name;

    const char *directory;    // -C, --directory=DIR
    const char *file;         // -f, --file=ARCHIVE
    const char *format;       // -F, --format=FORMAT
    const char *files_from;   // -T, --files-from=FILE
    const char *exclude_from; // -X, --exclude-from=FILE
    const char *exclude_pat;  //     --exclude=PATTERN
};

ATTR_FORMAT(1, 2) void progerr(const char *fmt, ...);
ATTR_FORMAT(1, 2) void proglog(const char *fmt, ...);

int open_file(const char *path, const char *mode, FILE **out_f);
int load_file(const char *path, char **out_buf, size_t *out_size);
int write_file(const char *path, void *data, size_t size);
int read_archive(const char *data, size_t size, nitroarc_t *narc);
int set_logfile(bool verbose);
int set_workdir(const char *path);
int ensure_mkdir(const char *path);

#endif // TOOL_COMMON_H
