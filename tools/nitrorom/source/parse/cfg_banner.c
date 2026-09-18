// SPDX-License-Identifier: MIT

#include "packer.h"

#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <png.h>
#include <pngconf.h>

#include "cfgparse.h"
#include "constants.h"

#include "libs/config.h"
#include "libs/fileio.h"
#include "libs/litend.h"
#include "libs/strings.h"

static cfgresult cfg_banner_version(rompacker *packer, string val, long line)
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

    long bannersize;
    switch (result) {
    case 1:  bannersize = BANNER_BSIZE_V1; break;
    case 2:  bannersize = BANNER_BSIZE_V2; break;
    case 3:  bannersize = BANNER_BSIZE_V3; break;
    default: configerr("expected banner version to be 1, 2, or 3, but found %d", result);
    }

    packer->bannerver              = result;
    packer->banner.source.filename = string("%BANNER%");
    packer->banner.size            = bannersize;
    packer->banner.pad             = -bannersize & (ROM_ALIGN - 1);
    packer->banner.source.buf      = calloc(bannersize, 1);

    unsigned char *banner = packer->banner.source.buf;
    banner[0]             = result;
    if (packer->verbose) {
        fprintf(stderr, "rompacker:configuration:banner: set version to %d\n", result);
    }

    return configok;
}

static cfgresult cfg_banner_icon4bpp(rompacker *packer, string val, long line)
{
    varsub(val, packer);
    string ficon4bpp = floads(val);
    if (ficon4bpp.len < 0) configerr("could not open icon bitmap file “%.*s”", fmtstring(val));
    if (ficon4bpp.len > (long)ICON_BITMAP_BSIZE) {
        configerr(
            "icon bitmap file “%.*s” size 0x%08lX exceeds maximum size 0x%04X",
            fmtstring(val),
            ficon4bpp.len,
            ICON_BITMAP_BSIZE
        );
    }

    unsigned char *banner = packer->banner.source.buf;
    memcpy(banner + OFS_BANNER_ICON_BITMAP, ficon4bpp.s, ficon4bpp.len);
    free(ficon4bpp.s);

    if (packer->verbose) {
        fprintf(
            stderr,
            "rompacker:configuration:banner: loaded “%.*s” as the icon bitmap\n",
            fmtstring(val)
        );
    }

    return configok;
}

static cfgresult cfg_banner_iconpal(rompacker *packer, string val, long line)
{
    varsub(val, packer);
    string ficonpal = floads(val);
    if (ficonpal.len < 0) configerr("could not open icon palette file “%.*s”", fmtstring(val));
    if (ficonpal.len > (long)ICON_PALETTE_BSIZE) {
        configerr(
            "icon palette file “%.*s” size 0x%08lX exceeds maximum size 0x%04X",
            fmtstring(val),
            ficonpal.len,
            ICON_PALETTE_BSIZE
        );
    }

    unsigned char *banner = packer->banner.source.buf;
    memcpy(banner + OFS_BANNER_ICON_PALETTE, ficonpal.s, ficonpal.len);
    free(ficonpal.s);

    if (packer->verbose) {
        fprintf(
            stderr,
            "rompacker:configuration:banner: loaded “%.*s” as the icon palette\n",
            fmtstring(val)
        );
    }

    return configok;
}

#define PNGSIGSIZE 8

#define pngassert(__cond, __file, __errmsg, ...) \
    {                                            \
        if (!(__cond)) {                         \
            fclose(__file);                      \
            configerr(__errmsg, __VA_ARGS__);    \
        }                                        \
    }

#define copytile(__x, __y, __pixels, __tiles)                                                    \
    {                                                                                            \
        /* Top-left corner is at (4x, 8y), lower-right corner is at (4x + 4, 8y + 8) */          \
        /* The pixel buffer is row-ordered; y = 1, then, is pixel 16, y = 2 is pixel 32, etc. */ \
        for (int __rely = (8 * (__y)); __rely < (8 * (__y)) + 8; __rely++) {                     \
            for (int __relx = (4 * (__x)); __relx < (4 * (__x)) + 4; __relx++) {                 \
                unsigned char __pixel = (__pixels)[__rely * 16 + __relx];                        \
                unsigned char __left  = __pixel >> 4;                                            \
                unsigned char __right = __pixel & 0xF;                                           \
                                                                                                 \
                *(__tiles)++ = (__right << 4) | __left;                                          \
            }                                                                                    \
        }                                                                                        \
    }

static cfgresult cfg_banner_iconpng(rompacker *packer, string val, long line)
{
    varsub(val, packer);
    file ficonpng = fpreps(val);
    if (ficonpng.size < 0) configerr("could not open icon PNG file “%.*s”", fmtstring(val));

    unsigned char pngsig[PNGSIGSIZE];
    fread(pngsig, 1, PNGSIGSIZE, ficonpng.hdl);
    if (!png_check_sig(pngsig, PNGSIGSIZE)) {
        configerr("icon file “%.*s” is not a PNG", fmtstring(val));
    }

    png_structp ppng = png_create_read_struct(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);
    if (!ppng) configerr("error setting up PNG reader for icon file “%.*s”", fmtstring(val));

    png_infop pinfo = png_create_info_struct(ppng);
    if (!pinfo) {
        png_destroy_read_struct(&ppng, NULL, NULL);
        configerr("error setting up PNG info struct for icon file “%.*s”", fmtstring(val));
    }

    png_init_io(ppng, ficonpng.hdl);
    png_set_sig_bytes(ppng, PNGSIGSIZE);
    png_read_info(ppng, pinfo);

    png_colorp    colors;
    int           ncolors;
    unsigned char bitdepth  = png_get_bit_depth(ppng, pinfo);
    unsigned char coltype   = png_get_color_type(ppng, pinfo);
    uint32_t      width     = png_get_image_width(ppng, pinfo);
    uint32_t      height    = png_get_image_height(ppng, pinfo);
    uint32_t      pltechunk = png_get_PLTE(ppng, pinfo, &colors, &ncolors);

    // clang-format off
    pngassert(coltype == PNG_COLOR_TYPE_PALETTE, ficonpng.hdl, "icon file “%.*s” is not an indexed PNG", fmtstring(val));
    pngassert(bitdepth == 4, ficonpng.hdl, "icon file “%.*s” has unsupported bitdepth %d", fmtstring(val), bitdepth);
    pngassert(width == ICON_BITMAP_DIMEN, ficonpng.hdl, "icon file “%.*s” has invalid width %d", fmtstring(val), width);
    pngassert(height == ICON_BITMAP_DIMEN, ficonpng.hdl, "icon file “%.*s” has invalid height %d", fmtstring(val), height);
    pngassert(pltechunk == PNG_INFO_PLTE, ficonpng.hdl, "icon file “%.*s” has no palette section", fmtstring(val));
    pngassert(ncolors <= 16, ficonpng.hdl, "icon file “%.*s” has more than 16 colors", fmtstring(val));
    // clang-format on

    unsigned char *banner  = packer->banner.source.buf;
    unsigned char *tiles   = banner + OFS_BANNER_ICON_BITMAP;
    unsigned char *palette = banner + OFS_BANNER_ICON_PALETTE;

    for (int i = 0; i < ICON_COLOR_DEPTH; i++) {
        unsigned char r = colors[i].red / 8;
        unsigned char g = colors[i].green / 8;
        unsigned char b = colors[i].blue / 8;

        putlehalf(palette, (b << 10) | (g << 5) | r);
        palette += 2;
    }

    size_t     rowsize = png_get_rowbytes(ppng, pinfo);
    uint8_t   *pixels  = malloc(height * rowsize);
    png_bytepp prows   = (png_bytepp)malloc(height * sizeof(png_bytep));
    for (uint32_t i = 0; i < height; i++) prows[i] = (png_bytep)(pixels + (i * rowsize));

    png_read_image(ppng, prows);
    png_destroy_read_struct(&ppng, &pinfo, NULL);
    free((png_bytep)prows);
    fclose(ficonpng.hdl);

    for (int y = 0; y < 4; y++) {
        for (int x = 0; x < 4; x++) copytile(x, y, pixels, tiles);
    }

    if (packer->verbose) {
        fprintf(
            stderr,
            "rompacker:configuration:banner: loaded “%.*s” as the icon\n",
            fmtstring(val)
        );
    }

    free(pixels);
    return configok;
}

enum {
    E_utf8_invalidprefix = -1,
    E_utf8_surrogatehalf = -2,
    E_utf8_outofrange    = -3,
};

static inline long dcont(unsigned char byte, int shift)
{
    return (byte & 0x3F) << shift;
}

static inline void *utf8dec(void *s, long *c)
{
    unsigned char *buf = s;
    unsigned char *next;

    if (buf[0] < 0x80) {
        *c   = buf[0];
        next = buf + 1;
    } else if ((buf[0] & 0xE0) == 0xC0) {
        *c   = ((buf[0] & 0x1F) << 6) | dcont(buf[1], 0);
        next = buf + 2;
    } else if ((buf[0] & 0xF0) == 0xE0) {
        *c   = ((buf[0] & 0x0F) << 12) | dcont(buf[1], 6) | dcont(buf[2], 0);
        next = buf + 3;
    } else if ((buf[0] & 0xF8) == 0xF0 && buf[0] <= 0xF4) {
        *c   = E_utf8_outofrange;
        next = buf + 1;
    } else {
        *c   = E_utf8_invalidprefix;
        next = buf + 1;
    }

    if (*c >= 0xD800 && *c <= 0xDFFF) *c = E_utf8_surrogatehalf;
    return next;
}

#define puttitlechar(__banner, __packer, __c)                                              \
    {                                                                                      \
        putlehalf((__banner) + OFS_BANNER_TITLE_JP + (__packer)->endbannertitle, __c);     \
        putlehalf((__banner) + OFS_BANNER_TITLE_EN + (__packer)->endbannertitle, __c);     \
        putlehalf((__banner) + OFS_BANNER_TITLE_FR + (__packer)->endbannertitle, __c);     \
        putlehalf((__banner) + OFS_BANNER_TITLE_DE + (__packer)->endbannertitle, __c);     \
        putlehalf((__banner) + OFS_BANNER_TITLE_IT + (__packer)->endbannertitle, __c);     \
        putlehalf((__banner) + OFS_BANNER_TITLE_ES + (__packer)->endbannertitle, __c);     \
        if ((__packer)->bannerver > 1)                                                     \
            putlehalf((__banner) + OFS_BANNER_TITLE_CN + (__packer)->endbannertitle, __c); \
        if ((__packer)->bannerver > 2)                                                     \
            putlehalf((__banner) + OFS_BANNER_TITLE_KR + (__packer)->endbannertitle, __c); \
                                                                                           \
        (__packer)->endbannertitle += 2;                                                   \
    }

static inline cfgresult cfg_banner_titlepart(rompacker *packer, string val, long line)
{
    varsub(val, packer);
    unsigned char *curr   = val.s;
    unsigned char *banner = packer->banner.source.buf;
    while (curr - val.s < val.len && packer->endbannertitle < BANNER_TITLE_BSIZE) {
        long decoded = 0;

        unsigned char *next = utf8dec(curr, &decoded);
        switch (decoded) {
        case -1: configerr("expected a valid UTF-8 encoding, but found “%.*s”", fmtstring(val));

        case -2: configerr("unexpected UTF-8 surrogate pair in “%.*s”", fmtstring(val));

        case -3:
            configerr(
                "expected Basic Multilingual Plane Unicode, but found “%.*s”",
                fmtstring(val)
            );

        default: break;
        }

        puttitlechar(banner, packer, decoded);
        curr = next;
    }

    if (packer->endbannertitle >= BANNER_TITLE_BSIZE && curr - val.s < val.len) {
        configerr(
            "total banner title length is greater than the maximum allowable size 0x%04X",
            BANNER_TITLE_BSIZE
        );
    }

    return configok;
}

static cfgresult cfg_banner_title(rompacker *packer, string val, long line)
{
    if (packer->endbannertitle != 0) {
        configerr("attempted to set title after setting some other value");
    }

    cfgresult result = cfg_banner_titlepart(packer, val, line);
    if (result.code != E_config_none) return result;

    if (packer->verbose) {
        fprintf(stderr, "rompacker:configuration:banner: set title to “%.*s”\n", fmtstring(val));
    }

    return configok;
}

static cfgresult cfg_banner_subtitle(rompacker *packer, string val, long line)
{
    if (packer->endbannertitle == 0) {
        configerr("attempted to set subtitle before setting primary title");
    }

    if (packer->hasbannerdev) configerr("attempted to set subtitle after setting developer");

    if (packer->hasbannersub) configerr("attempted to set multiple subtitles");

    unsigned char *banner = packer->banner.source.buf;
    puttitlechar(banner, packer, '\n');

    cfgresult result = cfg_banner_titlepart(packer, val, line);
    if (result.code != E_config_none) return result;

    if (packer->verbose) {
        fprintf(stderr, "rompacker:configuration:banner: set subtitle to “%.*s”\n", fmtstring(val));
    }

    return configok;
}

static cfgresult cfg_banner_developer(rompacker *packer, string val, long line)
{
    if (packer->endbannertitle == 0) {
        configerr("attempted to set developer before setting primary title");
    }

    if (packer->hasbannerdev) configerr("attempted to set multiple developers");

    unsigned char *banner = packer->banner.source.buf;
    puttitlechar(banner, packer, '\n');

    cfgresult result = cfg_banner_titlepart(packer, val, line);
    if (result.code != E_config_none) return result;

    if (packer->verbose) {
        fprintf(
            stderr,
            "rompacker:configuration:banner: set developer to “%.*s”\n",
            fmtstring(val)
        );
    }

    return configok;
}

// clang-format off
static const keyvalueparser kvparsers[] = {
    { .key = string("version"),   .parser = cfg_banner_version   },
    { .key = string("icon4bpp"),  .parser = cfg_banner_icon4bpp  },
    { .key = string("iconpal"),   .parser = cfg_banner_iconpal   },
    { .key = string("icon"),      .parser = cfg_banner_iconpng,  },
    { .key = string("title"),     .parser = cfg_banner_title     },
    { .key = string("subtitle"),  .parser = cfg_banner_subtitle  },
    { .key = string("developer"), .parser = cfg_banner_developer },
    { .key = stringZ,             .parser = NULL                 },
};
// clang-format on

cfgresult cfg_banner(string sec, string key, string val, void *user, long line) // NOLINT
{
    (void)sec;
    rompacker *packer = user;

    const keyvalueparser *match = &kvparsers[0];
    for (; match->parser != NULL && !strequ(key, match->key); match++);

    if (!match->parser) configerr("unrecognized banner-section key “%.*s”", fmtstring(key));
    if (!packer->banner.source.buf && !strequ(string("version"), match->key)) {
        configerr("attempted to set banner-section value before specifying the version");
    }

    return match->parser(packer, val, line);
}
