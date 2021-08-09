#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

static inline uint32_t READ32(const unsigned char * ptr)
{
    return ptr[0] | (ptr[1] << 8) | (ptr[2] << 16) | (ptr[3] << 24);
}

static uint32_t MIi_UncompressBackwards(unsigned char ** out_p, size_t compsize)
{
    unsigned char * out = *out_p;

    // Read the pointer to the end of the compressed image
    uint8_t * endptr = out + compsize - 8;
    uint32_t size = READ32(endptr);
    uint32_t offset = READ32(endptr + 4);
    out = realloc(out, compsize + offset);
    if (out == NULL)
        return -1u;
    endptr = out + compsize;
    uint8_t * dest_p = endptr + offset;
    uint8_t * end = endptr - ((uint8_t)(size >> 24));
    uint8_t * start = endptr - (size & ~0xFF000000);
    while (end > start) {
        uint8_t r5 = *--end;
        for (int i = 0; i < 8; i++) {
            if ((r5 & 0x80) == 0)
                *--dest_p = *--end;
            else {
                int ip = *--end;
                int r7 = *--end;


                r7 = ((r7 | (ip << 8)) & ~0xF000) + 2;
                ip += 0x20;
                while (ip >= 0) {
                    dest_p[-1] = dest_p[r7];
                    dest_p--;
                    ip -= 0x10;
                }
            }
            if (end <= start)
                break;
                r5 <<= 1;
        }
    }
    *out_p = out;
    return compsize + offset;
}

int main(int argc, char ** argv)
{
    if (argc < 4) {
        fprintf(stderr, "usage: %s FILE VMA END\n\ninsufficient arguments\n", argv[0]);
        return 1;
    }
    char * infname = argv[1];
    uint32_t vma = strtoul(argv[2], NULL, 0);
    uint32_t end = strtoul(argv[3], NULL, 0);
    if (end == 0) {
        fprintf(stderr, "compressed size is 0, no action taken\n");
        return 0;
    }
    FILE * infile = fopen(infname, "r+b");
    if (infile == NULL) {
        fclose(infile);
        fprintf(stderr, "unable to open file %s for reading\n", infname);
        return 1;
    }
    fseek(infile, 0, SEEK_END);
    long infsize = ftell(infile);
    fseek(infile, 0, SEEK_SET);
    if (infsize != end - vma) {
        fclose(infile);
        fprintf(stderr, "compressed size does not match file size, I am cowardly doing nothing\n");
        return 0;
    }
    unsigned char * inbuf = malloc(infsize);
    if (inbuf == NULL) {
        fclose(infile);
        fprintf(stderr, "error: malloc(%d)\n", (int)infsize);
        return 1;
    }
    if (fread(inbuf, 1, infsize, infile) != infsize) {
        fclose(infile);
        free(inbuf);
        fprintf(stderr, "error reading from %s\n", infname);
        return 1;
    }
    uint32_t outsize = MIi_UncompressBackwards(&inbuf, end - vma);
    if (outsize == -1u) {
        fclose(infile);
        fprintf(stderr, "fatal error reallocating for decompression\n");
        return 1;
    }
    fseek(infile, 0, SEEK_SET);
    if (fwrite(inbuf, 1, outsize, infile) != outsize) {
        fclose(infile);
        free(inbuf);
        fprintf(stderr, "error writing back to %s\n", infname);
        return 1;
    }
    fclose(infile);
    free(inbuf);
    return 0;
}
