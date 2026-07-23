/*
 * #include <nitroarc.h> - implementation of Nintendo's Nitro Archive format
 * Copyright (C) 2026 Rachel <rachel@lhea.me>
 *
 * This library is free software: you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <https://www.gnu.org/licenses/>.
 */

#include "nitroarc.h"

#ifndef NITROARC_PRIVATE_H
#define NITROARC_PRIVATE_H

#include <stddef.h>
#include <stdint.h>

#define SIGNATURE_NARC 0x4352414E // "NARC" in little-endian
#define SIGNATURE_BTAF 0x46415442 // "BTAF" in little-endian
#define SIGNATURE_BTNF 0x464E5442 // "BTNF" in little-endian
#define SIGNATURE_GMIF 0x46494D47 // "GMIF" in little-endian

#define BOM_BIGEND 0xFEFF
#define BOM_LITEND 0xFFFE

#define NARC_VERSION    0x0100
#define NARC_HEADERSIZE 0x10
#define NARC_SECTIONS   0x03

#define NARC_MAXFILES   0xF000

#define FATB_HEADERSIZE 0x0C
#define FNTB_HEADERSIZE 0x08
#define FIMG_HEADERSIZE 0x08

#define FATB_ENTRYSIZE (sizeof(uint32_t) * 2)

#define FNTB_DIRTAB_ENTRYSIZE (sizeof(uint32_t) + (2 * sizeof(uint16_t)))
#define FNTB_FILESYS_MASKID   0x0FFF
#define FNTB_FILESYS_MASKTYPE 0xF000

#define FNTB_DIRENT_MASKSIZE 0x7F
#define FNTB_DIRENT_MASKTYPE 0x80
#define FNTB_DIRENT_TYPEFILE 0x00
#define FNTB_DIRENT_TYPEDIR  0x80

#define PACKCTL_ZERO      0
#define PACKCTL_NAMED    (1 << 0)
#define PACKCTL_STRIPPED (1 << 1)

#define PACKCTL_ISNAMED(p)    (((p)->flags & PACKCTL_NAMED) != 0)
#define PACKCTL_ISSTRIPPED(p) (((p)->flags & PACKCTL_STRIPPED) != 0)

struct nitroarc_file {
    char    *name;
    uint32_t offset;
    uint32_t size;
};

static inline uint16_t leu16(const void *_s) {
    const uint8_t *s = _s;
    return (uint16_t)((s[1] << 8) | (s[0]));
}

static inline uint32_t leu32(const void *_s) {
    const uint8_t *s = _s;
    return (s[3] << 24) | (s[2] << 16) | (s[1] << 8) | s[0];
}

static inline void putleu16(void *_s, uint16_t u) {
    uint8_t *s = _s;
    s[0] = ((unsigned)u >> 0) & 0xFF;
    s[1] = ((unsigned)u >> 8) & 0xFF;
}

static inline void putleu32(void *_s, uint32_t u) {
    uint8_t *s = _s;
    s[0] = (uint8_t)((u >> 0) & 0xFF);
    s[1] = (uint8_t)((u >> 8) & 0xFF);
    s[2] = (uint8_t)((u >> 16) & 0xFF);
    s[3] = (uint8_t)((u >> 24) & 0xFF);
}

#define align_u(u)   (-(u) & 3)
#define align_u32(u) (-(u) & 31)
#define align_d(d)   (-(uintptr_t)(d) & 3)

static inline ptrdiff_t ptrdiff(const void *_l, const void *_r) {
    const unsigned char *l = _l;
    const unsigned char *r = _r;

    return l - r;
}

static inline char* strchrnul(const char *_s, int _c) {
    const unsigned char  c = (unsigned char)_c;
    const unsigned char *s = (void *)_s;

    while (*s && *s != c) s++;
    return (char *)s;
}

#endif // NITROARC_PRIVATE_H

const char* errors[] = {
    [NITROARC_ESUCCESS]       = "success",
    [NITROARC_ENULL]          = "a required parameter is NULL",
    [NITROARC_ESIZERANGE]     = "input size is out-of-range",
    [NITROARC_ESIGNATURE]     = "archive has an invalid file signature",
    [NITROARC_EBYTEORDER]     = "archive has an invalid byte-order mark",
    [NITROARC_EVERSION]       = "archive has an unsupported version",
    [NITROARC_EARCHIVESIZE]   = "archive reports a different size from the input",
    [NITROARC_EHEADERSIZE]    = "archive has an invalid header size",
    [NITROARC_ESECTIONS]      = "archive has an invalid number of sections",
    [NITROARC_ENUMFILES]      = "archive member count does not align with its size",
    [NITROARC_EFATBSIG]       = "allocation table has an invalid section signature",
    [NITROARC_EFATBSIZE]      = "allocation table reports an invalid section size",
    [NITROARC_EFNTBSIG]       = "filename table has an invalid section signature",
    [NITROARC_EFNTBSIZE]      = "filename table reports an invalid section size",
    [NITROARC_EFIMGSIG]       = "file image table has an invalid section signature",
    [NITROARC_EFIMGSIZE]      = "file image table reports an invalid section size",
    [NITROARC_EINDEXDIR]      = "requested index would be a directory, not a file",
    [NITROARC_EINDEXRANGE]    = "requested index is greater than the number of members",
    [NITROARC_EINVALIDPATH]   = "requested filepath is improperly constructed",
    [NITROARC_ENOSUCHFILE]    = "no such member for the requested filepath",
    [NITROARC_EALLOCDEF]      = "allocation interface is improperly defined",
    [NITROARC_EALLOCFAIL]     = "allocation failure",
    [NITROARC_ETOOMANYFILES]  = "too many files expected",
    [NITROARC_ESIZEOVERFLOW]  = "output size exceeds 32-bit maximum",

    [NITROARC_EMAX] = "unknown error code",
};

const char* nitroarc_errs(int errc) {
    errc = errc >= NITROARC_ESUCCESS && errc < NITROARC_EMAX
         ? errc
         : NITROARC_EMAX;
    return errors[errc];
}

#include <stddef.h>
#include <stdint.h>


int nitroarc_geti(const nitroarc_t *narc, uint16_t i, void **out_member, uint32_t *out_size) {
    if (narc == NULL)                return NITROARC_ENULL;
    if ((i & FNTB_FILESYS_MASKTYPE)) return NITROARC_EINDEXDIR;
    if (narc->nfiles <= i)           return NITROARC_EINDEXRANGE;

    if (out_member != NULL && out_size != NULL) {
        const uint8_t *p_fatb = (uint8_t *)narc->fatb.data;
        const uint8_t *p_fent = p_fatb + (i * FATB_ENTRYSIZE);
        const uint32_t ofsbeg = leu32(p_fent);
        const uint32_t ofsend = leu32(p_fent + sizeof(uint32_t));

        *out_member = (uint8_t *)narc->fimg.data + ofsbeg;
        *out_size   = ofsend - ofsbeg;
    }

    return NITROARC_ESUCCESS;
}

#include <stddef.h>
#include <stdint.h>


// Similar to `strncmp`, but returns either `1` (if the strings are equivalent
// across a prefix of size `n`) or `0` (if they aren't).
//
// More formally:
// - `strnequ(l, r, n) == 1` is equivalent to `strncmp(l, r, n) == 0`
// - `strnequ(l, r, n) == 0` is equivalent to `strncmp(l, r, n) != 0`
static int strnequ(const char *_l, const char *_r, size_t n) {
    const unsigned char *l = (void *)_l;
    const unsigned char *r = (void *)_r;

    if (n == 0) return 1; // 0-length comparison is treated as "equal"

    for (n--; *l && *r && n && *l == *r; l++, r++, n--);
    return *l == *r;
}

#define skip_d() p_dirent += 3 + size; continue
#define skip_f() p_dirent += 1 + size; continue

int nitroarc_gets(const nitroarc_t *narc, const char *s, void **out_member, uint32_t *out_size) {
    if (narc == NULL) return NITROARC_ENULL;
    if (s == NULL)    return NITROARC_ENULL;
    if (s[0] != '/')  return NITROARC_EINVALIDPATH;
    if (s[1] == '\0') return NITROARC_EINVALIDPATH; // Only search for leaves

    const char *p_path   = &s[1];
    const char *p_dirsep = strchrnul(p_path, '/');
    size_t      compsize = p_dirsep - p_path;

    const char *p_fntb   = narc->fntb.data;
    const char *p_dirtab = p_fntb;
    const char *p_dirent = p_fntb + leu32(p_dirtab);

    uint16_t id_found = 0xFFFF;
    uint16_t id       = 0;
    while (*p_dirent != 0 && id_found == 0xFFFF && id < FNTB_FILESYS_MASKTYPE) {
        const uint8_t mask = *p_dirent;
        const uint8_t type = mask & FNTB_DIRENT_MASKTYPE;
        const uint8_t size = mask & FNTB_DIRENT_MASKSIZE;

        if (*p_dirsep == '/') {
            if (type != FNTB_DIRENT_TYPEDIR)             { skip_f(); }
            if (strnequ(p_path, p_dirent + 1, compsize)) { skip_d(); }

            if (p_dirent[1] == '\0') return NITROARC_EINVALIDPATH;

            uint16_t id_subdir = leu16(p_dirent + 1 + compsize);

            p_dirtab = p_fntb + (id_subdir & FNTB_FILESYS_MASKID);
            p_dirent = p_fntb + leu32(p_dirtab);
            p_path   = p_dirsep + 1;
            p_dirsep = strchrnul(p_path, '/');
            compsize = p_dirsep - p_path;
            id       = leu16(p_dirtab + 4);

            continue;
        }

        if (type != FNTB_DIRENT_TYPEFILE)            {       skip_d(); }
        if (strnequ(p_path, p_dirent + 1, compsize)) { id++; skip_f(); }

        id_found = id;
    }

    return *p_dirent != 0
        ? nitroarc_geti(narc, id_found, out_member, out_size)
        : NITROARC_ENOSUCHFILE;
}

#undef skip_d
#undef skip_f

#include <assert.h>
#include <stddef.h>
#include <stdint.h>


#define skip_d() p_enttab += 3 + nlen; continue
#define skip_f() p_enttab += 1 + nlen; continue

int nitroarc_nameof(const nitroarc_t *narc, uint16_t i, char *buf, size_t size) {
    assert(narc);
    assert(buf);
    assert(size);

    if (narc->ndirs == 1) {
        *buf = 0;
        return NITROARC_ESUCCESS;
    }

    if ((i & FNTB_FILESYS_MASKTYPE)) return NITROARC_EINDEXDIR;
    if (narc->nfiles <= i)           return NITROARC_EINDEXRANGE;

    char *p_buf = buf;
    *p_buf++    = '/';

    const char *p_fntb   = narc->fntb.data;
    const char *p_dirtab = p_fntb;
    const char *p_enttab = p_fntb + leu32(p_dirtab);
    const char *p_subent = NULL;
    uint16_t    i_firstf = 0;

loopback:
    while (*p_enttab != 0) {
        const uint8_t mask = *p_enttab;
        const uint8_t type = mask & FNTB_DIRENT_MASKTYPE;
        const uint8_t nlen = mask & FNTB_DIRENT_MASKSIZE;

        if (type == FNTB_DIRENT_TYPEFILE) {
            if (i_firstf < i) { i_firstf++; skip_f(); }

            for (uint8_t j = 0; j < nlen && size > 1; j++, size--) {
                *p_buf++ = *++p_enttab;
            }
            *p_buf = 0;
            return NITROARC_ESUCCESS;
        }

        // If this directory says it has a file with ID less than or equal to
        // the requested file, then the pointer to its subdirectory entry.
        uint16_t    dirid = leu16(&p_enttab[1 + nlen]) & FNTB_FILESYS_MASKID;
        const char *p_ent = p_fntb + (FNTB_DIRTAB_ENTRYSIZE * dirid);
        uint16_t    first = leu16(&p_ent[4]);
        if (first <= i) p_subent = p_enttab;

        skip_d();
    }


    // The last-recorded subdirectory is the next destination; copy its name,
    // then continue.
    if (p_subent == NULL) return NITROARC_ENULL;
    const uint8_t nlen = *p_subent & FNTB_DIRENT_MASKSIZE;
    for (uint8_t j = 0; j < nlen && size > 1; j++, size--) {
        *p_buf++ = *++p_subent;
    }
    *p_buf++ = '/';

    uint16_t dirid = leu16(++p_subent) & FNTB_FILESYS_MASKID;
    p_dirtab       = p_fntb + (FNTB_DIRTAB_ENTRYSIZE * dirid);
    p_enttab       = p_fntb + leu32(p_dirtab);
    i_firstf       = leu16(&p_dirtab[4]);
    goto loopback;
}

#undef skip_f
#undef skip_d

#include "nitroarc.h"

#include <assert.h>
#include <stdint.h>


int nitroarc_pinit(
    nitroarc_packer_t *p,
    uint16_t nfiles,
    unsigned named,
    unsigned stripped
) {
    assert(p);
    assert(p->malloc);
    assert(p->realloc);
    assert(p->free);
    assert(nfiles > 0);

    if (nfiles > NARC_MAXFILES) return NITROARC_ETOOMANYFILES;

    p->flags         = 0;
    p->fimg_capacity = nfiles * 1024;
    p->fimg_size     = 0;
    p->fimg_data     = p->malloc(p->ctx, p->fimg_capacity, 1);
    p->f_capacity    = nfiles;
    p->f_count       = 0;
    p->f_records     = p->malloc(p->ctx, nfiles, sizeof(*p->f_records));

    if (p->fimg_data == NULL) goto erralloc;
    if (p->f_records == NULL) goto erralloc;
    if (named)    p->flags |= PACKCTL_NAMED;
    if (stripped) p->flags |= PACKCTL_STRIPPED;

    return NITROARC_ESUCCESS;

erralloc:
    p->free(p->ctx, p->fimg_data, p->fimg_capacity, 1);
    p->free(p->ctx, p->f_records, nfiles, sizeof(*p->f_records));
    return NITROARC_EALLOCFAIL;
}


#include "nitroarc.h"

#include <assert.h>
#include <stddef.h>
#include <stdint.h>


int nitroarc_ppack(nitroarc_packer_t *p, void *data, uint32_t size, char *name) {
    assert(p);
    assert(p->malloc);
    assert(p->realloc);
    assert(p->free);

    if (!data || size == 0) {
        p->f_records[p->f_count] = (nitroarc_file_t){
            .name   = name,
            .offset = p->fimg_size,
            .size   = 0,
        };
        p->f_count++;
        return NITROARC_ESUCCESS;
    }

    uint32_t align = align_u(size);

    if ((size_t)(p->fimg_size + size + align) >= (size_t)p->fimg_capacity) {
        size_t cap = p->fimg_capacity;
        while (p->fimg_size + size + align > cap) cap *= 2;

        if (cap > UINT32_MAX) return NITROARC_ESIZEOVERFLOW;

        void *tmp = p->realloc(p->ctx, p->fimg_data, (uint32_t)cap, 1);
        if (tmp == NULL) return NITROARC_EALLOCFAIL;

        p->fimg_data     = tmp;
        p->fimg_capacity = (uint32_t)cap;
    }

    if (PACKCTL_ISNAMED(p)) {
        if (name == NULL) return NITROARC_EINVALIDPATH;

        for (const char *p = name; p && *p; p++) {
            switch (*p & 0xFF) {
            default: break;

            case '\\':
            case '?':
            case '"':
            case '<':
            case '>':
            case '*':
            case ':':
            case ';':
            case '|':
                return NITROARC_EINVALIDPATH;
            }
        }
    }

    uint8_t *fimg_src = data;
    uint8_t *fimg_dst = (uint8_t *)p->fimg_data + p->fimg_size;
    for (size_t i = 0; i < size; i++)  fimg_dst[i] = fimg_src[i];
    for (size_t i = 0; i < align; i++) fimg_dst[size + i] = 0xFF;

    p->f_records[p->f_count] = (nitroarc_file_t){
        .name   = name,
        .offset = p->fimg_size,
        .size   = size,
    };

    p->fimg_size += size + align;
    p->f_count++;

    return NITROARC_ESUCCESS;
}


#include "nitroarc.h"

#include <assert.h>
#include <stddef.h>
#include <stdint.h>
#include <stdlib.h> // only for qsort


static const char fntb_unnamed[] = {
    0x04, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x01, 0x00,
};

typedef struct sect sect_t;
struct sect {
    uint32_t offs;
    uint32_t head;
    uint32_t size;
};

#define NARC_HEADER (sect_t){ \
    .offs = 0,                \
    .head = NARC_HEADERSIZE,  \
    .size = 0,                \
}

#define sect(prev, head_size, data_size) (sect_t){ \
    .offs = prev.offs + prev.head + prev.size,     \
    .head = head_size,                             \
    .size = data_size,                             \
}

#define sectsize(sect) (sect.head + sect.size)

static uint32_t pack_fntb(nitroarc_packer_t *p, uint8_t **out_dirtab);

static int pack(nitroarc_packer_t *p, uint8_t *dirtab, uint32_t dirtab_size, uint8_t **out_buf, uint32_t *out_size);
static int pack_stripped(nitroarc_packer_t *p, uint8_t *dirtab, uint32_t dirtab_size, uint8_t **out_buf, uint32_t *out_size);

static void put_narc(void *base, uint32_t size);
static void put_fatb(void *base, uint32_t size, const nitroarc_packer_t *p);
static void put_fntb(void *base, uint32_t size, const void *_fntb);
static void put_fimg(void *base, uint32_t size, const void *_fimg);

int nitroarc_pseal(nitroarc_packer_t *p, void **out_data, uint32_t *out_size) {
    assert(p);
    assert(p->malloc);
    assert(p->realloc);
    assert(p->free);
    assert(out_data);
    assert(out_size);

    int      errc        = NITROARC_ESUCCESS;
    uint8_t *dirtab      = NULL;
    uint32_t dirtab_size = pack_fntb(p, &dirtab);
    if (dirtab == NULL) { errc = dirtab_size; goto cleanup; }

    uint32_t size = 0;
    uint8_t *data = NULL;
    errc = PACKCTL_ISSTRIPPED(p)
         ? pack_stripped(p, dirtab, dirtab_size, &data, &size)
         : pack(p, dirtab, dirtab_size, &data, &size);

    if (errc) goto cleanup;

    *out_data = data;
    *out_size = size;

cleanup:
    p->free(p->ctx, p->fimg_data, p->fimg_size, 1);
    p->free(p->ctx, p->f_records, p->f_count, sizeof(*p->f_records));
    if (PACKCTL_ISNAMED(p)) p->free(p->ctx, dirtab, dirtab_size, 1);
    return errc;
}

static int pack(nitroarc_packer_t *p, uint8_t *dirtab, uint32_t dirtab_size, uint8_t **out_buf, uint32_t *out_size) {
    sect_t narc = NARC_HEADER;
    sect_t fatb = sect(narc, FATB_HEADERSIZE, p->f_capacity * FATB_ENTRYSIZE);
    sect_t fntb = sect(fatb, FNTB_HEADERSIZE, dirtab_size);
    sect_t fimg = sect(fntb, FIMG_HEADERSIZE, p->fimg_size);

    size_t size = sectsize(narc)
                + sectsize(fatb)
                + sectsize(fntb)
                + sectsize(fimg);
    if (size >= UINT32_MAX) return NITROARC_ESIZEOVERFLOW;

    uint32_t usize = (uint32_t)size;
    uint8_t *data  = p->malloc(p->ctx, usize, 1);
    if (data == NULL) return NITROARC_EALLOCFAIL;

    put_narc(data + narc.offs, usize);
    put_fatb(data + fatb.offs, fatb.size, p);
    put_fntb(data + fntb.offs, fntb.size, dirtab);
    put_fimg(data + fimg.offs, fimg.size, p->fimg_data);

    *out_buf  = data;
    *out_size = usize;
    return NITROARC_ESUCCESS;
}

static int pack_stripped(nitroarc_packer_t *p, uint8_t *dirtab, uint32_t dirtab_size, uint8_t **out_buf, uint32_t *out_size) {
    uint32_t head_size  = 0x10;
    uint32_t fntb_align = align_u32(head_size + dirtab_size);
    uint32_t fntb_offs  = head_size;
    uint32_t fntb_size  = dirtab_size + fntb_align;
    uint32_t fatb_offs  = head_size + fntb_size;
    uint32_t fatb_size  = p->f_capacity * FATB_ENTRYSIZE;
    uint32_t fatb_align = align_u32(fatb_offs + fatb_size);
    uint32_t fimg_offs  = fatb_offs + fatb_size + fatb_align;

    size_t size = fimg_offs + p->fimg_size;
    if (size >= UINT32_MAX) return NITROARC_ESIZEOVERFLOW;

    uint32_t usize = (uint32_t)size;
    uint8_t *data  = p->malloc(p->ctx, usize, 1);
    if (data == NULL) return NITROARC_EALLOCFAIL;

    putleu32(&data[0x00], fntb_offs);
    putleu32(&data[0x04], dirtab_size);
    putleu32(&data[0x08], fatb_offs);
    putleu32(&data[0x0C], fatb_size);

    uint8_t *fntb = &data[fntb_offs];
    uint8_t *fatb = &data[fatb_offs];
    uint8_t *fimg = &data[fimg_offs];

    for (size_t i = 0; i < dirtab_size; i++)         fntb[i] = dirtab[i];
    for (size_t i = dirtab_size; i < fntb_size; i++) fntb[i] = 0;

    for (size_t i = fatb_size; i < fatb_align; i++) fatb[i] = 0;
    for (size_t i = 0; i < p->f_count; i++) {
        nitroarc_file_t *p_file  = &p->f_records[i];
        unsigned char   *p_entry = &fatb[i * FATB_ENTRYSIZE];

        putleu32(&p_entry[0x00], p_file->offset + fimg_offs);
        putleu32(&p_entry[0x04], p_file->offset + fimg_offs + p_file->size);
    }

    for (size_t i = 0; i < p->fimg_size; i++) {
        fimg[i] = ((uint8_t *)p->fimg_data)[i];
    }

    *out_buf  = data;
    *out_size = usize;
    return NITROARC_ESUCCESS;
}

static void put_narc(void *base, uint32_t size) {
    unsigned char *data = (unsigned char *)base;

    putleu32(&data[0x00], SIGNATURE_NARC);
    putleu16(&data[0x04], BOM_LITEND);
    putleu16(&data[0x06], NARC_VERSION);
    putleu32(&data[0x08], size);
    putleu16(&data[0x0C], NARC_HEADERSIZE);
    putleu16(&data[0x0E], NARC_SECTIONS);
}

static void put_fatb(void *base, uint32_t size, const nitroarc_packer_t *p) {
    unsigned char *head = (unsigned char *)base;
    unsigned char *data = head + FATB_HEADERSIZE;

    putleu32(&head[0x00], SIGNATURE_BTAF);
    putleu32(&head[0x04], size + FATB_HEADERSIZE);
    putleu16(&head[0x08], p->f_count);
    putleu16(&head[0x0A], 0);

    for (size_t i = 0; i < p->f_count; i++) {
        nitroarc_file_t *p_file  = &p->f_records[i];
        unsigned char   *p_entry = &data[i * FATB_ENTRYSIZE];

        putleu32(&p_entry[0x00], p_file->offset);
        putleu32(&p_entry[0x04], p_file->offset + p_file->size);
    }
}

static void put_fntb(void *base, uint32_t size, const void *_fntb) {
    unsigned char *head = (unsigned char *)base;
    unsigned char *data = head + FNTB_HEADERSIZE;
    unsigned char *fntb = (unsigned char *)_fntb;

    putleu32(&head[0x00], SIGNATURE_BTNF);
    putleu32(&head[0x04], size + FNTB_HEADERSIZE);

    for (size_t i = 0; i < size; i++) data[i] = fntb[i];
}

static void put_fimg(void *base, uint32_t size, const void *_fimg) {
    unsigned char *head = (unsigned char *)base;
    unsigned char *data = head + FIMG_HEADERSIZE;
    unsigned char *fimg = (unsigned char *)_fimg;

    putleu32(&head[0x00], SIGNATURE_GMIF);
    putleu32(&head[0x04], size + FIMG_HEADERSIZE);

    for (size_t i = 0; i < size; i++) data[i] = fimg[i];
}

// ============================ FNTB PACKING CODE =========================== //

typedef struct fsnode fsnode_t;
struct fsnode {
    char     *name;
    fsnode_t *children;

    uint16_t id;
    uint16_t parent;
    uint16_t n_children;
    uint16_t c_children;
    uint16_t first;
    uint8_t  name_len;
};

static int      filecmp(const void *lhs, const void *rhs);
static void     flatten(fsnode_t *parent, fsnode_t **out);
static unsigned calcenttab(fsnode_t **dirs, uint16_t ndirs, uint16_t nfiles);
static void     serialize(fsnode_t **dirs, char *dirtab, char *enttab);

static int  fs_push(nitroarc_packer_t *p, fsnode_t *root, char *path, uint16_t *did, uint16_t *fid);
static void fs_free(nitroarc_packer_t *p, fsnode_t *parent);

#define INIT_CAP 32

static uint32_t pack_fntb(nitroarc_packer_t *p, uint8_t **out_fntb) {
    if (!PACKCTL_ISNAMED(p)) {
        *out_fntb = (uint8_t *)fntb_unnamed;
        return sizeof(fntb_unnamed);
    }

    *out_fntb        = NULL;
    uint16_t dir_id  = 0xF000;
    uint16_t n_files = 0;
    fsnode_t root    = {
        .name        = "",
        .children    = p->malloc(p->ctx, INIT_CAP, sizeof(fsnode_t)),
        .id          = dir_id++,
        .parent      = 0,
        .first       = n_files,
        .n_children  = 0,
        .c_children  = INIT_CAP,
        .name_len    = 0,
    };

    qsort(p->f_records, p->f_count, sizeof(nitroarc_file_t), filecmp);

    fsnode_t **dirs  = NULL;
    char      *fntb  = NULL;
    unsigned   size  = 0;
    int        errc  = NITROARC_ESUCCESS;

    for (size_t i = 0; i < p->f_count; i++) {
        errc = fs_push(p, &root, p->f_records[i].name, &dir_id, &n_files);
        if (errc) goto erralloc;
    }

    root.parent = (dir_id & FNTB_FILESYS_MASKID);
    dirs        = p->malloc(p->ctx, root.parent, sizeof(fsnode_t*));

    if (dirs == NULL) { errc = NITROARC_EALLOCFAIL; goto erralloc; }
    flatten(&root, dirs);

    unsigned size_dirtab = root.parent * FNTB_DIRTAB_ENTRYSIZE;
    unsigned size_enttab = calcenttab(dirs, root.parent, n_files);

    size         = size_dirtab + size_enttab;
    fntb         = p->malloc(p->ctx, size, 1);
    char *dirtab = fntb;
    char *enttab = fntb + size_dirtab;

    serialize(dirs, dirtab, enttab);

    *out_fntb = (uint8_t *)fntb;
    errc      = size;
    goto cleanup;

erralloc:
    p->free(p->ctx, fntb, size, 1);

cleanup:
    p->free(p->ctx, dirs, root.parent, sizeof(fsnode_t*));
    fs_free(p, &root);
    return errc;
}

static char lower(char c) {
    return (c >= 'A' && c <= 'Z') ? c + ('a' - 'A') : c;
}

static int filecmp(const void *_lhs, const void *_rhs) {
    const nitroarc_file_t *file_l = _lhs;
    const nitroarc_file_t *file_r = _rhs;

    const char *lhs = file_l->name;
    const char *rhs = file_r->name;

    int result = 0;
    for (; result == 0 && *lhs && *rhs; lhs++, rhs++) {
        const char *sep_l = strchrnul(lhs, '/');
        const char *sep_r = strchrnul(rhs, '/');

        // always sort directories after files
        if (*sep_l == '/' && *sep_r != '/') return  1;
        if (*sep_l != '/' && *sep_r == '/') return -1;

        for (; result == 0 && lhs != sep_l && rhs != sep_r; lhs++, rhs++) {
            result = lower(*lhs) - lower(*rhs);
        }

        if (result)       return result;
        if (lhs != sep_l) return  1; // rhs is shorter
        if (rhs != sep_r) return -1; // lhs is shorter
    }

    return result;
}

static void flatten(fsnode_t *parent, fsnode_t **out) {
    uint16_t id = parent->id & 0x0FFF;
    out[id]     = parent;

    for (size_t i = 0; i < parent->n_children; i++) {
        fsnode_t *child = &parent->children[i];
        if (child->id >= 0xF000) flatten(child, out);
    }
}

static unsigned calcenttab(fsnode_t **dirs, uint16_t ndirs, uint16_t nfiles) {
    unsigned total = 0;
    for (int i = 0; i < ndirs; i++) {
        total += dirs[i]->name_len;

        for (int j = 0; j < dirs[i]->n_children; j++) {
            if (dirs[i]->children[j].children == NULL) {
                total += dirs[i]->children[j].name_len;
            }
        }
    }

    return total            // Total length of all unique components
        + ((ndirs - 1) * 2) // 2 bytes for each subdirectory ID
        + (ndirs - 1)       // 1 byte for each subdirectory's name-length
        + nfiles            // 1 byte for each file's name-length
        + ndirs;            // 1 byte to zero-terminate each entry
}

static void record(fsnode_t *dir, char *p_dirtab, uint32_t offset) {
    putleu32(&p_dirtab[0], offset);
    putleu16(&p_dirtab[4], dir->first);
    putleu16(&p_dirtab[6], dir->parent);
}

static void serialize(fsnode_t **dirs, char *dirtab, char *enttab) {
    assert(dirs);
    assert(dirs[0]);

    uint16_t n_dirs   = dirs[0]->parent;
    char    *p_dirtab = dirtab;
    char    *p_enttab = enttab;

    for (int i = 0; i < n_dirs; i++) {
        fsnode_t *dir = dirs[i];
        record(dir, p_dirtab, (uint32_t)(p_enttab - dirtab));

        for (int j = 0; j < dir->n_children; j++) {
            fsnode_t *child = &dir->children[j];
            *p_enttab++     = child->name_len | ((child->id >= 0xF000) * FNTB_DIRENT_MASKTYPE);

            for (int k = 0; k < child->name_len; k++) {
                *p_enttab++ = child->name[k];
            }

            if (child->id >= 0xF000) {
                putleu16(p_enttab, child->id);
                p_enttab += 2;
            }
        }

        *p_enttab = 0;
        p_dirtab += FNTB_DIRTAB_ENTRYSIZE;
        p_enttab += 1;
    }
}

static void fs_free(nitroarc_packer_t *p, fsnode_t *parent) {
    for (size_t i = 0; i < parent->n_children; i++) {
        fs_free(p, &parent->children[i]);
    }

    p->free(p->ctx, parent->children, parent->n_children, sizeof(fsnode_t));
}

static int fs_pushone(
    nitroarc_packer_t *p,
    fsnode_t  *parent,
    char      *path,
    uint8_t    path_len,
    uint16_t  *id,
    uint16_t   first,
    fsnode_t **out_child
) {
    assert(parent);
    assert(path);
    assert(id);
    assert(out_child);

    *out_child = NULL;

    for (size_t i = 0; i < parent->n_children; i++) {
        fsnode_t *child = &parent->children[i];

        char *p = path;
        char *s = child->name;
        for (; *p && *s && *p == *s; p++, s++);

        if (*p == *s) {
            *out_child = child;
            return NITROARC_ESUCCESS;
        }
    }

    // no match found; add this as a child
    if (parent->n_children + 1 >= parent->c_children) {
        int cap = parent->c_children * 2;
        if (cap > UINT16_MAX) return NITROARC_EALLOCFAIL;

        fsnode_t *tmp = p->realloc(p->ctx, parent->children, cap, sizeof(fsnode_t));
        if (tmp == NULL) return NITROARC_EALLOCFAIL;

        parent->c_children = (uint16_t)cap;
        parent->children   = tmp;
    }

    fsnode_t *child   = &parent->children[parent->n_children++];
    child->name       = path;
    child->children   = NULL;
    child->id         = *id;
    child->parent     = parent->id;
    child->first      = first;
    child->n_children = 0;
    child->c_children = 0;
    child->name_len   = path_len;

    if (*id >= 0xF000) {
        child->c_children = INIT_CAP;
        child->children   = p->malloc(p->ctx, INIT_CAP, sizeof(fsnode_t));
        if (child->children == NULL) return NITROARC_EALLOCFAIL;
    }

    (*id)++;
    *out_child = child;
    return NITROARC_ESUCCESS;
}

static int fs_push(
    nitroarc_packer_t *p,
    fsnode_t *root,
    char     *path,
    uint16_t *did,
    uint16_t *fid
) {
    int       errc  = NITROARC_ESUCCESS;
    fsnode_t *child = NULL;

    char *s;
    for (s = path; s && *s; s++) {
        if (*s == '/') {
            *s   = 0;
            errc = fs_pushone(p, root, path, (uint8_t)(s - path), did, *fid, &child);
            if (errc) return errc;

            path   = s + 1;
            root   = child;
        }
    }

    errc = fs_pushone(p, root, path, (uint8_t)(s - path), fid, 0, &child);
    if (errc) return errc;

    return NITROARC_ESUCCESS;
}


#include <stddef.h>
#include <stdint.h>


// Minimum allowable size for a standard NARC file: no member files
// +12 is the minimum size of an FNTB data section:
//   - 8 bytes for the root directory entry
//   - 1 byte for the subdirectory entry terminator
//   - 3 bytes of alignment padding
#define NARC_MINSIZE ( \
    NARC_HEADERSIZE    \
    + FATB_HEADERSIZE  \
    + FNTB_HEADERSIZE  \
    + FIMG_HEADERSIZE  \
    + 12               \
)

static int nitroarc_fatb(nitroarc_t *narc, int64_t *running_size);
static int nitroarc_fntb(nitroarc_t *narc, int64_t *running_size);
static int nitroarc_fimg(nitroarc_t *narc, int64_t *running_size);

static int read_stripped(const uint8_t *blob, uint32_t size, nitroarc_t *narc);

int nitroarc_read(const void *blob, uint32_t size, nitroarc_t *narc) {
    if (narc == NULL)        return NITROARC_ENULL;
    if (blob == NULL)        return NITROARC_ENULL;
    if (size < NARC_MINSIZE) return NITROARC_ESIZERANGE;
    *narc = (nitroarc_t){ 0 };

    const uint8_t *data = blob;
    if (leu32(&data[0x00]) != SIGNATURE_NARC)  return read_stripped(data, size, narc);
    if (leu16(&data[0x04]) != BOM_LITEND)      return NITROARC_EBYTEORDER;
    if (leu16(&data[0x06]) != NARC_VERSION)    return NITROARC_EVERSION;
    if (leu32(&data[0x08]) != size)            return NITROARC_EARCHIVESIZE;
    if (leu16(&data[0x0C]) != NARC_HEADERSIZE) return NITROARC_EHEADERSIZE;
    if (leu16(&data[0x0E]) != NARC_SECTIONS)   return NITROARC_ESECTIONS;

    narc->size      = (uint32_t)size;
    narc->head      = data;
    narc->fatb.data = data + NARC_HEADERSIZE; // Start of section

    // Safety: make sure the section sizes are sensible along the way
    int64_t running_size = size - NARC_HEADERSIZE;
    int errc = nitroarc_fatb(narc, &running_size)
            || nitroarc_fntb(narc, &running_size)
            || nitroarc_fimg(narc, &running_size)
            || NITROARC_ESUCCESS;

    if (errc) *narc = (nitroarc_t){ 0 };
    return errc;
}

static int nitroarc_fatb(nitroarc_t *narc, int64_t *running_size) {
    const uint8_t *head = narc->fatb.data;

    if (leu32(&head[0x00]) != SIGNATURE_BTAF) return NITROARC_EFATBSIG;

    uint32_t size = leu32(&head[0x04]);
    *running_size -= size;
    if (*running_size < 0) return NITROARC_EFATBSIZE;

    uint16_t nfiles = leu16(&head[0x08]);
    uint32_t xsize  = (uint32_t)(FATB_HEADERSIZE + (nfiles * FATB_ENTRYSIZE));
    if (size != xsize) return NITROARC_ENUMFILES;

    narc->fatb.size     = size;
    narc->fatb.data     = head + FATB_HEADERSIZE; // First entry pointer
    narc->fntb.data     = head + narc->fatb.size; // Head of next section
    narc->fatb.ofs_head = (uint32_t)ptrdiff(head, narc->head);
    narc->fatb.ofs_data = (uint32_t)ptrdiff(narc->fatb.data, narc->head);

    narc->nfiles = nfiles;
    return NITROARC_ESUCCESS;
}

static int nitroarc_fntb(nitroarc_t *narc, int64_t *running_size) {
    const uint8_t *head = narc->fntb.data;

    if (leu32(&head[0x00]) != SIGNATURE_BTNF) return NITROARC_EFNTBSIG;

    uint32_t size = leu32(&head[0x04]);
    *running_size -= size;
    if (*running_size < 0) return NITROARC_EFNTBSIZE;

    narc->fntb.size     = size;
    narc->fntb.data     = head + FNTB_HEADERSIZE;  // First entry pointer
    narc->fimg.data     = head + narc->fntb.size; // Head of next section
    narc->fntb.ofs_head = (uint32_t)ptrdiff(head, narc->head);
    narc->fntb.ofs_data = (uint32_t)ptrdiff(narc->fntb.data, narc->head);

    narc->ndirs = leu16(&((uint8_t *)narc->fntb.data)[0x06]);
    return NITROARC_ESUCCESS;
}

static int nitroarc_fimg(nitroarc_t *narc, int64_t *running_size) {
    const char *head = narc->fimg.data;
    if (leu32(&head[0x00]) != SIGNATURE_GMIF) return NITROARC_EFIMGSIG;

    uint32_t size = leu32(&head[0x04]);
    *running_size -= size;
    if (*running_size < 0) return NITROARC_EFIMGSIZE;

    narc->fimg.size = size;
    narc->fimg.data = head + FIMG_HEADERSIZE; // First entry pointer
    narc->fimg.ofs_head = (uint32_t)ptrdiff(head, narc->head);
    narc->fimg.ofs_data = (uint32_t)ptrdiff(narc->fimg.data, narc->head);

    return NITROARC_ESUCCESS;
}

static int read_stripped(const uint8_t *data, uint32_t size, nitroarc_t *narc) {
    if (size < 0x10) return NITROARC_ESIGNATURE;

    const uint32_t fntb_offs = leu32(&data[0x00]);
    const uint32_t fatb_offs = leu32(&data[0x08]);
    const uint32_t fntb_size = leu32(&data[0x04]);
    const uint32_t fatb_size = leu32(&data[0x0C]);

    uint32_t expected = fntb_offs + fntb_size + align_u32(fntb_offs + fntb_size);
    if (fntb_offs != 0x10 || fatb_offs != expected) {
        return NITROARC_ESIGNATURE;
    }

    narc->size = size;
    narc->head = data;

    narc->fatb.size = fatb_size;
    narc->fatb.data = data + fatb_offs;
    narc->fatb.ofs_head = 0x08;
    narc->fatb.ofs_data = fatb_offs;
    narc->nfiles = (uint16_t)(fatb_size / FATB_ENTRYSIZE);

    narc->fntb.size = fntb_size;
    narc->fntb.data = data + fntb_offs;
    narc->fntb.ofs_head = 0x00;
    narc->fntb.ofs_data = fntb_offs;
    narc->ndirs = leu16(&((uint8_t *)narc->fntb.data)[0x06]);

    narc->fimg.size = size - fntb_size - fatb_size - 0x10;
    narc->fimg.data = data; // all FATB offsets in stripped variant are absolute
    narc->fimg.ofs_head = 0x00;
    narc->fimg.ofs_data = 0x00;

    return NITROARC_ESUCCESS;
}
