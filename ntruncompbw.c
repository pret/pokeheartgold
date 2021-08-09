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
    //     stmfd sp!, {r4-r7}
    // Read the pointer to the end of the compressed image
    uint8_t * endptr = out + compsize - 8; //     ldmdb r0, {r1, r2}
    uint32_t size = READ32(endptr);
    uint32_t offset = READ32(endptr + 4);

    out = realloc(out, compsize + offset);
    if (out == NULL) {
        return -1u;
    }
    endptr = out + compsize;
    uint8_t * dest_p = endptr + offset;                                        //     add r2, r0, r2
    uint8_t * end = endptr - ((uint8_t)(size >> 24));                          //     sub r3, r0, r1, lsr #24
    //     bic r1, r1, #0xff000000
    uint8_t * start = endptr - (size & ~0xFF000000);                           //     sub r1, r0, r1
    // uint8_t * dest_end = dest_p;
    //     mov r4, r2 ; not crucial
    // @.loop:
    while (end > start)                                                        //     cmp r3, r1
    {                                                                          //     ble @.dc_flush
        uint8_t r5 = *--end;                                                   //     ldrb r5, [r3, #-1]!
        //     mov r6, #8
        // @.byte_loop:
        for (int i = 0; i < 8; i++)                                            //     subs r6, r6, #1
        {                                                                      //     blt @.loop
            if ((r5 & 0x80) == 0)                                              //     tst r5, #0x80
            {                                                                  //     bne @.readback
            //     ldrb r0, [r3, #-1]!
                *--dest_p = *--end;                                            //     strb r0, [r2, #-1]!
            }                                                                  //     b @.byte_after
            else                                                               // @.readback:
            {
                int ip = *--end;                                               //     ldrb r12, [r3, #-1]!
                int r7 = *--end;                                               //     ldrb r7, [r3, #-1]!
                //     orr r7, r7, r12, lsl #8
                //     bic r7, r7, #0xf000
                r7 = ((r7 | (ip << 8)) & ~0xF000) + 2;                         //     add r7, r7, #0x0002
                ip += 0x20;                                                    //     add r12, r12, #0x0020
                while (ip >= 0)                                                // @.readback_loop:
                {
                    dest_p[-1] = dest_p[r7];                                   //     ldrb r0, [r2, r7]
                    dest_p--;                                                  //     strb r0, [r2, -1]!
                    ip -= 0x10;                                                //     subs r12, r12, #0x0010
                }                                                              //     bge @.readback_loop
            }                                                                  // @.byte_after:
            if (end <= start)                                                  //     cmp r3, r1
                break;                                                         //     mov r5, r5, lsl #1
                r5 <<= 1;                                                          //     bgt @.byte_loop
        }                                                                      // @.dc_flush:
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
