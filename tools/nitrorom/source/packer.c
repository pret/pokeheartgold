// SPDX-License-Identifier: MIT

#include "packer.h"

#include <inttypes.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "constants.h"

#include "libs/litend.h"
#include "libs/strings.h"
#include "libs/vector.h"

rompacker *rompacker_new(unsigned int verbose, vector *vardefs)
{
    rompacker *packer = calloc(1, sizeof(*packer));
    if (!packer) return 0;

    packer->packing = 1;
    packer->verbose = verbose;

    // The header is the only constant-size element in the entire ROM, so we can pre-allocate it.
    packer->banner.source.filename = string("%HEADER%");
    packer->header.source.buf      = calloc(HEADER_BSIZE, 1);
    packer->header.size            = HEADER_BSIZE;

    packer->ovy9    = newvec(rommember, 128);
    packer->ovy7    = newvec(rommember, 128);
    packer->filesys = newvec(romfile, 512);
    packer->vardefs = vardefs;

    return packer;
}

static inline void safeclose(FILE *f)
{
    if (f) fclose(f);
}

void rompacker_del(rompacker *packer)
{
    // These are allocated by `cfg_overlays` in `cfg_arm.c`.
    if (packer->ovy9.len > 0) free(get(&packer->ovy9, rommember, 0)->source.filename.s);
    if (packer->ovy7.len > 0) free(get(&packer->ovy7, rommember, 0)->source.filename.s);

    free(packer->header.source.buf);
    free(packer->banner.source.buf);
    free(packer->fntb.source.buf);
    free(packer->fatb.source.buf);
    free(packer->ovy9.data);
    free(packer->ovy7.data);
    free(packer->filesys.data);

    safeclose(packer->arm9.source.hdl);
    safeclose(packer->ovt9.source.hdl);
    safeclose(packer->arm7.source.hdl);
    safeclose(packer->ovt7.source.hdl);

    free(packer);
}

static uint16_t crctable[16] = {
    0x0000, 0xCC01, 0xD801, 0x1400, 0xF001, 0x3C00, 0x2800, 0xE401,
    0xA001, 0x6C00, 0x7800, 0xB401, 0x5000, 0x9C01, 0x8801, 0x4400,
};

static uint16_t crc16(string data, uint16_t crc)
{
    const unsigned char *end = data.s + data.len;

    uint16_t x = 0;
    uint16_t y;
    uint16_t bit = 0;
    while (data.s < end) {
        if (bit == 0) x = lehalf(data.s);

        y     = crctable[crc & 15];
        crc >>= 4;
        crc  ^= y;
        crc  ^= crctable[(x >> bit) & 15];
        bit  += 4;

        if (bit == 16) {
            data.s += 2;
            bit     = 0;
        }
    }

    return crc;
}

static int comparefnames(const void *a, const void *b) // NOLINT
{
    const romfile *file1 = a;
    const romfile *file2 = b;

    string tpath1 = file1->target;
    string tpath2 = file2->target;
    int    result = 0;

    do {
        strpair tcomp1 = strcut(tpath1, '/');
        strpair tcomp2 = strcut(tpath2, '/');

        // Subdirectories are always sorted after files at the same depth.
        // e.g., `/data/sound/<file>` is always sorted after `/data/<file>`
        unsigned char tterm1 = tcomp1.tail.len > 0 ? tcomp1.head.s[tcomp1.head.len] : '\0';
        unsigned char tterm2 = tcomp2.tail.len > 0 ? tcomp2.head.s[tcomp2.head.len] : '\0';

        result = tterm1 == tterm2 ? stricmp(tcomp1.head, tcomp2.head) : tterm1 == '\0' ? -1 : 1;
        tpath1 = tcomp1.tail;
        tpath2 = tcomp2.tail;
    } while (tpath1.len > 0 && tpath2.len > 0 && result == 0);

    return result;
}

#define fatb_begin(__fatb, __i) ((__fatb) + ((ptrdiff_t)((__i) * 8)))
#define fatb_end(__fatb, __i)   ((__fatb) + ((ptrdiff_t)((__i) * 8) + 4))

#define membsize(__memb) ((__memb)->size + (__memb)->pad)

#define printmemb(__curs, __memb)                                     \
    {                                                                 \
        fprintf(                                                      \
            stderr,                                                   \
            "rompacker:member: 0x%08" PRIX64 ",0x%08X,0x%08X,%.*s\n", \
            __curs,                                                   \
            (__memb)->size,                                           \
            membsize(__memb),                                         \
            fmtstring((__memb)->source.filename)                      \
        );                                                            \
    }

#define printfile(__curs, __file)                                     \
    {                                                                 \
        fprintf(                                                      \
            stderr,                                                   \
            "rompacker:member: 0x%08" PRIX64 ",0x%08X,0x%08X,%.*s\n", \
            __curs,                                                   \
            (__file)->size,                                           \
            membsize(__file),                                         \
            fmtstring((__file)->target)                               \
        );                                                            \
    }

#define sealarmparams(__packer, __n)                                         \
    &(__packer)->arm##__n, &(__packer)->ovt##__n, &(__packer)->ovy##__n, __n

#define sealmemb(__memb, __cursor, __verbose)             \
    {                                                     \
        if (__verbose) printmemb(__cursor, __memb);       \
        (__memb)->offset = (__cursor);                    \
        (__cursor)       = (__cursor) + membsize(__memb); \
    }

static void sealarm(
    rommember     *arm,
    rommember     *ovt,
    vector        *ovyvec,
    int            which,
    unsigned char *header, // NOLINT
    unsigned char *fatb,   // NOLINT
    uint64_t      *romcursor,
    int            ovyofs, // NOLINT
    int            verbose // NOLINT
)
{
    uint32_t ofsarmrom  = which == 9 ? OFS_HEADER_ARM9_ROMOFFSET : OFS_HEADER_ARM7_ROMOFFSET;
    uint32_t ofsovtrom  = which == 9 ? OFS_HEADER_OVT9_ROMOFFSET : OFS_HEADER_OVT7_ROMOFFSET;
    uint32_t ofsovtsize = which == 9 ? OFS_HEADER_OVT9_BSIZE : OFS_HEADER_OVT7_BSIZE;

    putleword(header + ofsarmrom, *romcursor);
    sealmemb(arm, *romcursor, verbose);

    putleword(header + ofsovtrom, ovt->size > 0 ? *romcursor : 0);
    putleword(header + ofsovtsize, ovt->size);
    sealmemb(ovt, *romcursor, verbose);

    for (int i = 0, j = ovyofs; i < ovyvec->len; i++, j++) {
        rommember *ovy = get(ovyvec, rommember, i);
        putleword(fatb_begin(fatb, j), *romcursor);
        putleword(fatb_end(fatb, j), *romcursor + ovy->size);
        sealmemb(ovy, *romcursor, verbose);
    }
}

typedef struct virtdir {
    vector   children;
    string   path;
    uint16_t file0;
    uint16_t id;
    uint16_t parent;
} virtdir;

typedef struct virtnode {
    string   name;
    uint16_t dirid; // 0 is implicitly not a subdirectory.
} virtnode;

#define INITCAP 32

static int findmismatch(vector *filesys, strpair *pathcut, int parts[INITCAP], virtdir **parent)
{
    int partsp = 0;
    while (partsp < INITCAP && strequ((*parent)->path, pathcut->head)) {
        partsp++;
        *pathcut = strcut(pathcut->tail, '/');
        *parent  = get(filesys, virtdir, parts[partsp]);
    }

    memset(parts + partsp, 0, INITCAP - partsp);
    return partsp;
}

static int makevirtfile(vector *dirtree, int parentid, string name)
{
    virtdir  *parent = get(dirtree, virtdir, parentid);
    virtnode *file   = push(&parent->children, virtnode);
    file->dirid      = 0;
    file->name       = name;

    return 1 + (int)name.len;
    //     ^   ~~~~~~~~^ -----> file name (no null-terminator)
    //     `------------------> 1 byte for data mask
}

static int buildfntb(rompacker *packer, romfile *sorted, vector *dirtree, int fileid)
{
    int parts[INITCAP] = { 0 };
    int ndirs          = 1;
    int fntbsize       = 0;

    for (int i = 0; i < packer->filesys.len; i++) {
        romfile *sfile   = sorted + i;
        virtdir *parent  = get(dirtree, virtdir, 0);
        strpair  pathcut = strcut(sfile->target, '/');
        int      partsp  = findmismatch(dirtree, &pathcut, parts, &parent);

        // Make any needed virtual-parents for this file.
        while (pathcut.tail.len > 0) {
            virtdir *subdir  = push(dirtree, virtdir);
            parent           = get(dirtree, virtdir, parts[partsp - 1]);
            subdir->children = newvec(virtnode, INITCAP);
            subdir->path     = pathcut.head;
            subdir->file0    = fileid;
            subdir->id       = ndirs | 0xF000;
            subdir->parent   = parent->id;

            virtnode *virdir = push(&parent->children, virtnode);
            virdir->dirid    = subdir->id;
            virdir->name     = pathcut.head;

            pathcut          = strcut(pathcut.tail, '/');
            parts[partsp++]  = ndirs++;
            fntbsize        += 3 + (int)subdir->path.len;
            //                 ^    ~~~~~~~~~~~~~~~^ -----> sub-directory name (no null-terminator)
            //                 `--------------------------> 1 byte for data mask, 2 for subdir ID
        }

        fntbsize         += makevirtfile(dirtree, parts[partsp - 1], pathcut.head);
        romfile *ufile    = get(&packer->filesys, romfile, sfile->packingid);
        ufile->filesysid  = fileid++;
    }

    virtdir *root = get(dirtree, virtdir, 0);
    root->parent  = ndirs;
    return fntbsize + (9 * dirtree->len);
    //                 ^   ~~~~~~~~~~~~~ ----> final number of directories
    //                 `---------------------> 8 bytes for header, 1 null-terminator for contents
}

static void sealfntb(rompacker *packer, romfile *sorted, int fileid)
{
    vector  *dirtree = &newvec(virtdir, packer->filesys.len);
    virtdir *root    = push(dirtree, virtdir); // WARN: do NOT use this pointer after buildfntb
    root->children   = newvec(virtnode, INITCAP);
    root->path       = stringZ;
    root->file0      = fileid;
    root->id         = 0xF000;

    packer->fntb.size            = buildfntb(packer, sorted, dirtree, fileid);
    packer->fntb.pad             = -packer->fntb.size & (ROM_ALIGN - 1);
    packer->fntb.source.filename = string("%FILENAMES%");
    packer->fntb.source.buf      = calloc(packer->fntb.size, 1);

    unsigned char *pstart    = packer->fntb.source.buf;
    unsigned char *pheader   = pstart;
    unsigned char *pcontents = pstart + ((ptrdiff_t)(8 * dirtree->len));
    for (int i = 0; i < dirtree->len; i++) {
        virtdir *vdir = get(dirtree, virtdir, i);
        putleword(pheader, pcontents - pstart); // Offset from start of FNTB to this dir's contents
        putlehalf(pheader + 4, vdir->file0);    // ID of the first file-child of this dir
        putlehalf(pheader + 6, vdir->parent);   // ID of the parent dir

        for (int j = 0; j < vdir->children.len; j++) {
            virtnode *child = get(&vdir->children, virtnode, j);
            pcontents[0]    = child->name.len | ((child->dirid != 0) << 7);

            memcpy(pcontents + 1, child->name.s, child->name.len);
            pcontents += child->name.len + 1;
            if (child->dirid != 0) {
                putlehalf(pcontents, child->dirid);
                pcontents += 2;
            }
        }

        pheader += 8;              // Next directory header
        pcontents++;               // Skip over the null-terminator for this dir's contents
        free(vdir->children.data); // Done with this directory and its children
    }

    free(dirtree->data);
}

static int sealheader(rompacker *packer, uint64_t romsize)
{
    unsigned char *header = packer->header.source.buf;

    uint32_t trycap   = TRY_CAPSHIFT_BASE;
    int      maxshift = packer->prom ? MAX_CAPSHIFT_PROM : MAX_CAPSHIFT_MROM;
    int      shift    = 0;
    for (; shift < maxshift; shift++) {
        if (romsize < (trycap << shift)) {
            header[OFS_HEADER_CHIPCAPACITY] = shift;
            break;
        }
    }

    // ROM size exceeds the maximum; main thread should die from here
    if (shift == maxshift) return 1;

    packer->tailsize = (trycap << shift);
    putleword(header + OFS_HEADER_ROMSIZE, romsize);
    putleword(header + OFS_HEADER_HEADERSIZE, HEADER_BSIZE);
    putleword(header + OFS_HEADER_STATICFOOTER, 0x00004BA0); // static NitroSDK footer

    uint16_t crc = crc16(string(header, OFS_HEADER_HEADERCRC), 0xFFFF);
    if (packer->verbose) fprintf(stderr, "rompacker: header CRC: 0x%04X\n", crc);
    putlehalf(header + OFS_HEADER_HEADERCRC, crc);

    if (packer->verbose) {
        fprintf(
            stderr,
            "rompacker: storage: 0x%08" PRIX64 " used / 0x%08X avail (%f%%)\n",
            romsize,
            (trycap << shift),
            (double)romsize / (trycap << shift)
        );
    }

    return 0;
}

static void sealbanner(rompacker *packer)
{
    unsigned char *banner    = packer->banner.source.buf;
    unsigned char *crcregion = banner + OFS_BANNER_ICON_BITMAP;

    uint16_t crc = crc16(string(crcregion, BANNER_BSIZE_V1 - OFS_BANNER_ICON_BITMAP), 0xFFFF);
    putleword(banner + OFS_BANNER_CRC_V1OFFSET, crc);
    if (packer->verbose) fprintf(stderr, "rompacker: banner v1 CRC: 0x%04X\n", crc);

    if (packer->bannerver > 1) {
        crc = crc16(string(crcregion, BANNER_BSIZE_V2 - OFS_BANNER_ICON_BITMAP), 0xFFFF);
        putleword(banner + OFS_BANNER_CRC_V2OFFSET, crc);
        if (packer->verbose) fprintf(stderr, "rompacker: banner v2 CRC: 0x%04X\n", crc);
    }

    if (packer->bannerver > 2) {
        crc = crc16(string(crcregion, BANNER_BSIZE_V3 - OFS_BANNER_ICON_BITMAP), 0xFFFF);
        putleword(banner + OFS_BANNER_CRC_V3OFFSET, crc);
        if (packer->verbose) fprintf(stderr, "rompacker: banner v3 CRC: 0x%04X\n", crc);
    }
}

int rompacker_seal(rompacker *packer)
{
    if (packer->verbose) fprintf(stderr, "rompacker: sealing the packer...\n");

    packer->packing = 0;

    int numovys  = packer->ovy9.len + packer->ovy7.len;
    int numfiles = numovys + packer->filesys.len;
    if (numfiles > 0) {
        packer->fatb.source.filename = string("%FILEALLOCS%");
        packer->fatb.size            = numfiles * 8;
        packer->fatb.source.buf      = calloc(packer->fatb.size, 1);
        packer->fatb.pad             = -(packer->fatb.size) & (ROM_ALIGN - 1);
    }

    uint64_t       romcursor = HEADER_BSIZE;
    unsigned char *fatb      = packer->fatb.source.buf;
    unsigned char *header    = packer->header.source.buf;
    sealarm(sealarmparams(packer, 9), header, fatb, &romcursor, 0, packer->verbose);
    sealarm(sealarmparams(packer, 7), header, fatb, &romcursor, packer->ovy9.len, packer->verbose);

    if (packer->filesys.len > 0) {
        romfile *sorted = malloc(sizeof(romfile) * packer->filesys.len);
        memcpy(sorted, packer->filesys.data, sizeof(romfile) * packer->filesys.len);
        qsort(sorted, packer->filesys.len, sizeof(romfile), comparefnames);
        sealfntb(packer, sorted, numovys);
        free(sorted);
    }

    putleword(header + OFS_HEADER_FNTB_ROMOFFSET, romcursor);
    putleword(header + OFS_HEADER_FNTB_BSIZE, packer->fntb.size);
    sealmemb(&packer->fntb, romcursor, packer->verbose);

    putleword(header + OFS_HEADER_FATB_ROMOFFSET, romcursor);
    putleword(header + OFS_HEADER_FATB_BSIZE, packer->fatb.size);
    sealmemb(&packer->fatb, romcursor, packer->verbose);

    putleword(header + OFS_HEADER_BANNER_ROMOFFSET, romcursor);
    sealmemb(&packer->banner, romcursor, packer->verbose);

    for (int i = 0; i < packer->filesys.len; i++) {
        romfile *topack = get(&packer->filesys, romfile, i);
        putleword(fatb_begin(fatb, topack->filesysid), romcursor);
        putleword(fatb_end(fatb, topack->filesysid), romcursor + topack->size);

        if (packer->verbose) printfile(romcursor, topack);
        topack->offset  = romcursor;
        romcursor      += membsize(topack);
    }

    // Final ROM size must ignore the padding of the last-added member (either the banner or the
    // last filesystem entry).
    uint64_t romsize = romcursor;
    if (packer->filesys.len > 0) {
        romsize -= get(&packer->filesys, romfile, packer->filesys.len - 1)->pad;
    } else {
        romsize -= packer->banner.pad;
    }

    sealbanner(packer);
    int result = sealheader(packer, romsize);
    if (packer->verbose) fprintf(stderr, "rompacker: packer is sealed, okay to dump!\n");
    return result;
}

#define READSIZE 4096

#define writememb_buf(__memb, __fill, __stream)                         \
    {                                                                   \
        fwrite((__memb).source.buf, 1, (__memb).size, __stream);        \
        for (int i = 0; i < (__memb).pad; i++) fputc(__fill, __stream); \
    };

#define writememb_hdl(__memb, __fill, __stream)                         \
    {                                                                   \
        while ((__memb).size > 0) {                                     \
            size_t __nread = fread(                                     \
                readbuf,                                                \
                1,                                                      \
                (__memb).size > READSIZE ? READSIZE : (__memb).size,    \
                (__memb).source.hdl                                     \
            );                                                          \
            fwrite(readbuf, 1, __nread, __stream);                      \
            (__memb).size -= __nread;                                   \
        }                                                               \
        for (int i = 0; i < (__memb).pad; i++) fputc(__fill, __stream); \
    }

enum dumperr rompacker_dump(rompacker *packer, FILE *stream)
{
    if (packer->verbose) fprintf(stderr, "rompacker: dumping contents to disk... ");
    if (packer->packing) return E_dump_packing;

    unsigned char *readbuf = malloc(READSIZE);

    if (packer->verbose) fprintf(stderr, "header... ");
    writememb_buf(packer->header, packer->fillwith, stream);

    if (packer->verbose) fprintf(stderr, "arm9... ");
    writememb_hdl(packer->arm9, packer->fillwith, stream);

    if (packer->verbose && packer->ovt9.size) fprintf(stderr, "ovt9... ");
    writememb_hdl(packer->ovt9, packer->fillwith, stream);

    if (packer->verbose && packer->ovy9.len) fprintf(stderr, "ovy9... ");
    for (int i = 0; i < packer->ovy9.len; i++) {
        rommember *ovy = get(&packer->ovy9, rommember, i);
        writememb_hdl(*ovy, packer->fillwith, stream);
    }

    if (packer->verbose) fprintf(stderr, "arm7... ");
    writememb_hdl(packer->arm7, packer->fillwith, stream);

    if (packer->verbose && packer->ovt7.size) fprintf(stderr, "ovt7... ");
    writememb_hdl(packer->ovt7, packer->fillwith, stream);

    if (packer->verbose && packer->ovy7.len) fprintf(stderr, "ovy7... ");
    for (int i = 0; i < packer->ovy7.len; i++) {
        rommember *ovy = get(&packer->ovy7, rommember, i);
        writememb_hdl(*ovy, packer->fillwith, stream);
    }

    if (packer->verbose && packer->fntb.size) fprintf(stderr, "fntb... ");
    writememb_buf(packer->fntb, packer->fillwith, stream);

    if (packer->verbose && packer->fatb.size) fprintf(stderr, "fatb... ");
    writememb_buf(packer->fatb, packer->fillwith, stream);

    if (packer->verbose && packer->banner.size) fprintf(stderr, "banner... ");
    writememb_buf(packer->banner, packer->fillwith, stream);

    char sourcefn[256] = { 0 };
    if (packer->verbose && packer->banner.size) fprintf(stderr, "filesys... ");
    for (int i = 0; i < packer->filesys.len; i++) {
        romfile *file = get(&packer->filesys, romfile, i);

        int sourcefnlen = file->source.len <= 255 ? (int)file->source.len : 255;
        memcpy(sourcefn, file->source.s, sourcefnlen);
        sourcefn[sourcefnlen] = '\0';

        FILE *source = fopen(sourcefn, "rb"); // NOLINT; this file is known to exist
        while (file->size > 0) {
            size_t nread = fread( // NOLINT: clang-tidy claims that this can invoke fread on EOF, which is impossible
                readbuf,
                1,
                file->size > READSIZE ? READSIZE : file->size,
                source
            );

            fwrite(readbuf, 1, nread, stream);
            file->size -= nread;
        }
        for (int i = 0; i < file->pad; i++) fputc(packer->fillwith, stream);
        fclose(source); // NOLINT; filesystem entries must exist to get this far
    }

    if (packer->filltail) {
        for (size_t curr = ftell(stream); curr < packer->tailsize; curr++) {
            fputc(packer->fillwith, stream);
        }
    }

    if (packer->verbose) fprintf(stderr, "done!\n");
    free(readbuf);
    return E_dump_ok;
}
