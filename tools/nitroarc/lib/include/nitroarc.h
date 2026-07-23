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

#ifndef NITROARC_H
#define NITROARC_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stddef.h>
#include <stdint.h>

typedef struct nitroarc_fatb nitroarc_fatb_t;
struct nitroarc_fatb {
    uint32_t ofs_head;
    uint32_t ofs_data;
    uint32_t size;

    const void *data;
};

typedef struct nitroarc_fntb nitroarc_fntb_t;
struct nitroarc_fntb {
    uint32_t ofs_head;
    uint32_t ofs_data;
    uint32_t size;

    const void *data;
};

typedef struct nitroarc_fimg nitroarc_fimg_t;
struct nitroarc_fimg {
    uint32_t ofs_head;
    uint32_t ofs_data;
    uint32_t size;

    const void *data;
};

typedef struct nitroarc nitroarc_t;
struct nitroarc {
    uint32_t size;
    uint16_t nfiles;
    uint16_t ndirs;

    const void     *head;
    nitroarc_fatb_t fatb;
    nitroarc_fntb_t fntb;
    nitroarc_fimg_t fimg;
};

/*
 * Read an arbitrary byte-stream according to the NitroARC file format.
 *
 * The incoming byte-stream `stream` is assumed to be untrusted, and this
 * routine will validate it against the file format's binary schema. If any
 * invariant of the schema is unsatisfied, then the provided `narc` structure
 * handle will be filled with zeroes and a non-zero error code will be returned.
 *
 * The resulting `narc` is computed using zero allocations, and the owner of
 * the byte-stream maintains responsibility for freeing it. Any other operations
 * against a `narc` that has had any of its memory-pointers invalidated shall
 * result in undefined behavior.
 */
int nitroarc_read(const void *stream, uint32_t size, nitroarc_t *out_narc);

/*
 * Get the image data for an archive member with a given integer index.
 *
 * If `i` is some value greater than the number of members present in the
 * archive, then a non-zero error code will be returned. If neither `out_member`
 * nor `out_size` are `NULL`, this routine will store a pointer to the image
 * data in `*out_member` and the size of the image data in bytes in `*out_size`.
 */
int nitroarc_geti(const nitroarc_t *narc, uint16_t i, void **out_member, uint32_t *out_size);

/*
 * Get the image data for an archive member with a given virtual filepath.
 *
 * If `s` is `NULL` or does not match the filepath of some member of the
 * archive, then a non-zero error code will be returned. If neither `out_member`
 * nor `out_size` are `NULL`, this routine will store a pointer to the image
 * data in `*out_member` and the size of the image data in bytes in `*out_size`.
 *
 * The value of `s` is interpreted as a null-terminated Unix-style filepath
 * using `'/'` as the directory separator. `s[0]` must be `'/'`, and the final
 * character before the terminator must NOT be `'/'`.
 */
int nitroarc_gets(const nitroarc_t *narc, const char *s, void **out_member, uint32_t *out_size);

/*
 * Get the name of an archive member with a given integer index.
 *
 * The input buffer `buf` will be filled with the archive member's filesystem
 * path. At most `size` characters will be printed into `buf`, including the
 * zero-terminator.
 *
 * If `i` is some value greater than the number of members present in the
 * archive, then a non-zero error code will be returned. If the input archive
 * does not record file-names, then `buf` will not be modified, and this routine
 * will return 0.
 */
int nitroarc_nameof(const nitroarc_t *narc, uint16_t i, char *buf, size_t size);

enum {
    NITROARC_ESUCCESS = 0,
    NITROARC_ENULL,
    NITROARC_ESIZERANGE,
    NITROARC_ESIGNATURE,
    NITROARC_EBYTEORDER,
    NITROARC_EVERSION,
    NITROARC_EARCHIVESIZE,
    NITROARC_EHEADERSIZE,
    NITROARC_ESECTIONS,
    NITROARC_ENUMFILES,
    NITROARC_EFATBSIG,
    NITROARC_EFATBSIZE,
    NITROARC_EFNTBSIG,
    NITROARC_EFNTBSIZE,
    NITROARC_EFIMGSIG,
    NITROARC_EFIMGSIZE,
    NITROARC_EINDEXDIR,
    NITROARC_EINDEXRANGE,
    NITROARC_EINVALIDPATH,
    NITROARC_ENOSUCHFILE,

    NITROARC_EALLOCDEF,
    NITROARC_EALLOCFAIL,
    NITROARC_ETOOMANYFILES,
    NITROARC_ESIZEOVERFLOW,
    NITROARC_EINVALIDNAME,

    NITROARC_EMAX, // Reserved for internal use
};

/*
 * Get a printable, user-facing error message for a library error.
 *
 * If `errc` is not recognized, then a standard message will be emitted.
 */
const char* nitroarc_errs(int errc);

#ifndef NITROARC_DISABLE_PACKING_API // Define this to disable the packing API

typedef struct nitroarc_file   nitroarc_file_t;
typedef struct nitroarc_packer nitroarc_packer_t;
struct nitroarc_packer {
    void    *fimg_data;     // buffer of packed file images
    uint32_t fimg_size;     // size of the image buffer
    uint32_t fimg_capacity; // byte-capacity of the image buffer

    nitroarc_file_t *f_records;  // records for packed files
    uint16_t         f_count;    // number of files packed so far
    uint16_t         f_capacity; // number of files, maximum

    uint32_t flags; // control flags

    // memory interface
    void   *ctx;
    void* (*malloc)(void *ctx, unsigned items, unsigned size);
    void* (*realloc)(void *ctx, void *ptr, unsigned items, unsigned size);
    void  (*free)(void *ctx, void *ptr, unsigned items, unsigned size);
};

/*
 * Initialize an encoder with a known number of file images.
 *
 * The packing interface must be initialized with an allocation interface before
 * invoking this routine.
 *
 * If `named` is given as any value other than 0, then the initialized encoder
 * will output a filesystem table which enables lookup of member files by their
 * local names. Otherwise, the names of individual member files shall be
 * stripped from the final archive, and member files will only be accessible via
 * direct access by their indices.
 *
 * If `stripped` is given as any value other than 0, then the initialized
 * encoder will output an archive which does not contain a NARC-signed header.
 *
 * Any names provided for encoding are *not* owned by this API; if they are
 * dynamically-allocated, then the calling code assumes responsibility for
 * freeing them.
 *
 * If the value of `nfiles` is equal to 0 or is greater than 61,440, then a
 * non-zero error code will be returned denoting that too many files are
 * expected for packing.
 */
int nitroarc_pinit(nitroarc_packer_t *p, uint16_t nfiles, unsigned named, unsigned stripped);

/*
 * Pack a (possibly named) file-image into the encoder.
 *
 * When serialized, the resulting block of member file-images will be ordered
 * identically to the order in which they were packed into the encoder. If the
 * encoder was initialized with `named == 0`, then this ordering will also
 * mirror the ordering of filesystem IDs assigned to each member-file.
 *
 * If this encoder was initialized with `named == 0`, then it is safe to call
 * this routine with `name = NULL`.
 */
int nitroarc_ppack(nitroarc_packer_t *p, void *data, uint32_t size, char *name);

/*
 * Seal the encoder into a serialized format.
 *
 * When successful, all memory which was dynamically-allocated by the encoder
 * via the provided allocation interface will be released by that interface.
 *
 * If the resulting archive size would result in an overflow, then a non-zero
 * error code will be returned.
 */
int nitroarc_pseal(nitroarc_packer_t *p, void **out_data, uint32_t *out_size);

#endif

#ifdef __cplusplus
}
#endif

#endif // NITROARC_H
