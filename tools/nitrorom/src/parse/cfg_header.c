// SPDX-License-Identifier: MIT

#include "packer.h"

#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "cfgparse.h"
#include "constants.h"

#include "libs/config.h"
#include "libs/fileio.h"
#include "libs/litend.h"
#include "libs/strings.h"

static cfgresult cfg_header_template(rompacker *packer, string val, long line)
{
    varsub(val, packer);
    string ftemplate = floads(val);
    if (ftemplate.len < 0) configerr("could not open template file “%.*s”", fmtstring(val));
    if (ftemplate.len > HEADER_BSIZE) {
        configerr(
            "template file “%.*s” size 0x%08lX exceeds maximum size 0x%04X",
            fmtstring(val),
            ftemplate.len,
            HEADER_BSIZE
        );
    }
    memcpy(packer->header.source.buf, ftemplate.s, ftemplate.len);
    free(ftemplate.s);

    if (packer->verbose) {
        fprintf(
            stderr,
            "rompacker:configuration:header: loaded “%.*s” as a template\n",
            fmtstring(val)
        );
    }

    return configok;
}

static inline cfgresult cfg_header_nchars(
    rompacker  *packer,
    string      val,
    long        line,
    const char *key,
    int         nmax, // NOLINT
    int         ofs   // NOLINT
)
{
    varsub(val, packer);
    if (val.len > nmax) {
        configerr("header %s “%.*s” exceeds maximum length %d", key, fmtstring(val), nmax);
    }

    memcpy(((unsigned char *)packer->header.source.buf) + ofs, val.s, val.len);
    if (packer->verbose) {
        fprintf(stderr, "rompacker:configuration:header: set %s to “%.*s”\n", key, fmtstring(val));
    }

    return configok;
}

static cfgresult cfg_header_title(rompacker *packer, string val, long line)
{
    return cfg_header_nchars(packer, val, line, "title", LEN_HEADER_TITLE, OFS_HEADER_TITLE);
}

static cfgresult cfg_header_serial(rompacker *packer, string val, long line)
{
    return cfg_header_nchars(packer, val, line, "serial", LEN_HEADER_SERIAL, OFS_HEADER_SERIAL);
}

static cfgresult cfg_header_maker(rompacker *packer, string val, long line)
{
    return cfg_header_nchars(packer, val, line, "maker", LEN_HEADER_MAKER, OFS_HEADER_MAKER);
}

static cfgresult cfg_header_revision(rompacker *packer, string val, long line)
{
    varsub(val, packer);
    unsigned int result = 0;
    for (long i = 0; i < val.len; i++) {
        int digit = val.s[i] - '0';
        if (digit < 0 || digit > 10) {
            configerr(
                "expected unsigned base-10 numeric-literal, but found “%.*s”",
                fmtstring(val)
            );
        }

        result *= 10;
        result += digit;
    }

    if (result > 255) configerr("revision value %d exceeds maximum of 255", result);

    ((unsigned char *)packer->header.source.buf)[OFS_HEADER_REVISION] = result;
    if (packer->verbose) {
        fprintf(stderr, "rompacker:configuration:header: set revision to %d\n", result);
    }

    return configok;
}

static cfgresult cfg_header_securecrc(rompacker *packer, string val, long line)
{
    varsub(val, packer);
    string par = val;
    if (par.len > 2 && par.s[0] == '0' && (par.s[1] == 'x' || par.s[1] == 'X')) {
        par.s   += 2;
        par.len -= 2;
    }

    unsigned int result = 0;
    for (long i = 0; i < par.len; i++) {
        int digit = -1;
        if (par.s[i] >= '0' && par.s[i] <= '9') digit = par.s[i] - '0';
        else if (par.s[i] >= 'A' && par.s[i] <= 'F') digit = par.s[i] - 'A' + 10;
        else if (par.s[i] >= 'a' && par.s[i] <= 'f') digit = par.s[i] - 'a' + 10;

        if (digit < 0 || digit > 15) {
            configerr(
                "expected unsigned base-16 numeric-literal, but found “%.*s”",
                fmtstring(val)
            );
        }

        result *= 16;
        result += digit;
    }

    if (result > 0xFFFF) configerr("secure-crc value 0x%08X exceeds maximum of 0xFFFF", result);

    unsigned char *header = packer->header.source.buf;
    putlehalf(header + OFS_HEADER_SECURECRC, result);
    if (packer->verbose) {
        fprintf(stderr, "rompacker:configuration:header: set secure CRC to 0x%04X\n", result);
    }

    return configok;
}

// clang-format off
static const keyvalueparser kvparsers[] = {
    { .key = string("template"),   .parser = cfg_header_template  },
    { .key = string("title"),      .parser = cfg_header_title     },
    { .key = string("serial"),     .parser = cfg_header_serial    },
    { .key = string("maker"),      .parser = cfg_header_maker     },
    { .key = string("revision"),   .parser = cfg_header_revision  },
    { .key = string("secure-crc"), .parser = cfg_header_securecrc },
    { .key = stringZ,              .parser = NULL                 },
};
// clang-format on

cfgresult cfg_header(string sec, string key, string val, void *user, long line) // NOLINT
{
    (void)sec;
    rompacker *packer = user;

    const keyvalueparser *match = &kvparsers[0];
    for (; match->parser != NULL && !strequ(key, match->key); match++);

    if (match->parser) return match->parser(packer, val, line);

    configerr("unrecognized header-section key “%.*s”", fmtstring(key));
}
