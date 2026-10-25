// SPDX-License-Identifier: MIT

#include "packer.h"

#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include "cfgparse.h"
#include "constants.h"

#include "libs/config.h"
#include "libs/litend.h"
#include "libs/strings.h"

// clang-format off
static const strkeyval storagetypes[] = {
    { .smatch = string("PROM"),  .val = ST_PROM },
    { .smatch = string("MROM"),  .val = ST_MROM },
    { .smatch = stringZ,         .val = 0       },
};

static const strkeyval booleans[] = {
    { .smatch = string("true"),  .val = 1 },
    { .smatch = string("false"), .val = 0 },
    { .smatch = string("yes"),   .val = 1 },
    { .smatch = string("no"),    .val = 0 },
    { .smatch = string("off"),   .val = 0 },
    { .smatch = string("on"),    .val = 1 },
    { .smatch = stringZ,         .val = 0 },
};
// clang-format on

static cfgresult cfg_rom_storagetype(rompacker *packer, string val, long line)
{
    varsub(val, packer);
    const strkeyval *match = &storagetypes[0];
    for (; match->smatch.len > 0 && !strequ(val, match->smatch); match++);
    if (match->smatch.len <= 0) {
        configerr("expected either “MROM” or “PROM”, but found “%.*s”", fmtstring(val));
    }

    uint32_t       romctrl_dec = match->val == ST_MROM ? ROMCTRL_DEC_MROM : ROMCTRL_DEC_PROM;
    uint32_t       romctrl_enc = match->val == ST_MROM ? ROMCTRL_ENC_MROM : ROMCTRL_ENC_PROM;
    unsigned char *header      = packer->header.source.buf;
    putleword(header + OFS_HEADER_ROMCTRL_DEC, romctrl_dec);
    putleword(header + OFS_HEADER_ROMCTRL_ENC, romctrl_enc);
    putlehalf(header + OFS_HEADER_SECURE_DELAY, match->val);

    packer->prom = match->val == ST_PROM;
    if (packer->verbose) {
        fprintf(
            stderr,
            "rompacker:configuration:rom: setting storage type to %.*s\n",
            fmtstring(val)
        );
    }

    return configok;
}

static cfgresult cfg_rom_filltail(rompacker *packer, string val, long line)
{
    varsub(val, packer);
    const strkeyval *match = &booleans[0];
    for (; match->smatch.len > 0 && !strequ(val, match->smatch); match++);
    if (match->smatch.len <= 0) {
        configerr("expected boolean-literal, but found “%.*s”", fmtstring(val));
    }

    packer->filltail = match->val;
    if (packer->verbose) {
        fprintf(stderr, "rompacker:configuration:rom: will fill final ROM to capacity\n");
    }

    return configok;
}

static cfgresult cfg_rom_fillwith(rompacker *packer, string val, long line)
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

    if (result > 0xFF) configerr("fill-with value 0x%08X exceeds maximum of 0xFF", result);

    packer->fillwith = result;
    if (packer->verbose) {
        fprintf(
            stderr,
            "rompacker:configuration:rom: will fill padding-values with 0x%02X\n",
            result
        );
    }

    return configok;
}

// clang-format off
static const keyvalueparser kvparsers[] = {
    { .key = string("storage-type"), .parser = cfg_rom_storagetype  },
    { .key = string("fill-tail"),    .parser = cfg_rom_filltail     },
    { .key = string("fill-with"),    .parser = cfg_rom_fillwith     },
    { .key = stringZ,                .parser = NULL                 },
};
// clang-format on

cfgresult cfg_rom(string sec, string key, string val, void *user, long line) // NOLINT
{
    (void)sec;
    rompacker *packer = user;

    const keyvalueparser *match = &kvparsers[0];
    for (; match->parser != NULL && !strequ(key, match->key); match++);

    if (match->parser) return match->parser(packer, val, line);

    configerr("unrecognized rom-section key “%.*s”", fmtstring(key));
}
