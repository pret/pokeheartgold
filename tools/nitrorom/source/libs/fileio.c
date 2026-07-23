#include "libs/fileio.h"

#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "libs/strings.h"

static inline long priv_fsize(FILE *infp)
{
    fseek(infp, 0, SEEK_END);
    long fsize = ftell(infp);
    fseek(infp, 0, SEEK_SET);

    return fsize;
}

#define wrapsfn(__cfn)                                                           \
    {                                                                            \
        char cfilename[256] = { 0 };                                             \
        memcpy(cfilename, filename.s, filename.len <= 255 ? filename.len : 255); \
        return __cfn(cfilename);                                                 \
    }

string fload(const char *filename)
{
    FILE *infp = fopen(filename, "rb");
    if (!infp) return string(NULL, -1);

    long fsize = priv_fsize(infp);
    if (fsize < 0) {
        fclose(infp);
        return string(NULL, -1);
    }

    string fcont = string(calloc(fsize, 1), fsize);
    fread(fcont.s, 1, fsize, infp);
    fclose(infp);
    return fcont;
}

string floads(const string filename)
{
    wrapsfn(fload);
}

long fsize(const char *filename)
{
    FILE *infp = fopen(filename, "rb");
    if (!infp) return -1;

    long fsize = priv_fsize(infp);

    fclose(infp);
    return fsize;
}

long fsizes(const string filename)
{
    wrapsfn(fsize);
}

file fprep(const char *filename)
{
    FILE *infp = fopen(filename, "rb");
    if (!infp) return (file){ .hdl = NULL, .size = -1 };

    long fsize = priv_fsize(infp);
    if (fsize < 0) {
        fclose(infp);
        return (file){ .hdl = NULL, .size = -1 };
    }

    return (file){ .hdl = infp, .size = fsize };
}

file fpreps(const string filename)
{
    wrapsfn(fprep);
}

void fdump(const char *filename, const void *buf, const long bufsize)
{
    FILE *outfp = fopen(filename, "wb");
    if (!outfp) return;

    fwrite(buf, 1, bufsize, outfp);
    fclose(outfp);
}
