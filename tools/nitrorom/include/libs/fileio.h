// SPDX-License-Identifier: MIT

/*
 * fileio - Wrapper functions for file-based I/O.
 * Copyright (C) 2025  <lhearachel@proton.me>
 */

#ifndef FILEIO_H
#define FILEIO_H

#include <stdio.h>

#include "libs/strings.h"

typedef struct file {
    FILE *hdl;
    long  size;
} file;

/*
 * Load the contents of a file into memory.
 */
string fload(const char *filename);

/*
 * Load the contents of a file into memory. `fload`-wrapper for `string` filenames.
 */
string floads(const string filename);

/*
 * Get the size of a file from disk.
 */
long fsize(const char *filename);

/*
 * Get the size of a file from disk. `fsize`-wrapper for `string` filenames.
 */
long fsizes(const string filename);

/*
 * Prepare a file-handle for consumption by other processes.
 */
file fprep(const char *filename);

/*
 * Prepare a file-handle for consumption by other processes. `fprep`-wrapper for `string` filenames.
 */
file fpreps(const string filename);

/*
 * Dump file contents to a file on-disk.
 */
void fdump(const char *filename, const void *buf, const long bufsize);

#endif // FILEIO_H
