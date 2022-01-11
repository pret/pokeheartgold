#include <string.h>
#include <ctype.h>
#include "fx.h"
#include "global.h"

#define NAMEBUF_SIZ 32

static inline void usage(FILE *dest) {
    fprintf(dest, "USAGE: gen_fx_consts FILENAME\n\n"
                  "FILENAME     Path to write C header. Guard will be generated\n"
                  "             automatically from the path.\n");
}

int main(int argc, char ** argv) {
    int i;
    char namebuf[NAMEBUF_SIZ] = "";
    char *header_guard;
    FILE *outfile;

    FxConstTableInit();
    if (argc < 2) {
        outfile = stdout;
        header_guard = "NITRO_FX_FX_CONST_H_";
    } else {
        outfile = fopen(argv[1], "w");
        if (outfile == NULL) {
            fatal_error("Unable to open file '%s' for writing", argv[1]);
        }
        header_guard = strdup(argv[1]);
        if (header_guard == NULL) {
            fclose(outfile);
            fatal_error("Unable to allocate temp buffer for header guard");
        }
        for (i = 0; header_guard[i]; i++) {
            switch (header_guard[i]) {
            case '.':
            case '/':
                header_guard[i] = '_';
                break;
            default:
                header_guard[i] = toupper(header_guard[i]);
                break;
            }
        }
    }
    fprintf(outfile, "#ifndef %s_\n"
                     "#define %s_\n\n", header_guard, header_guard);
    for (i = 0; i < gNFxConstTable; i++) {
        long long value;
        int nbyte;
        char *suffix;
        char *fmtstr;
        int j;
        value = MakeFix(&gFxConstTable[i]);
        nbyte = GetFxWidth(gFxConstTable[i].fxtype) / 8;
        switch (nbyte) {
        case 2:
            suffix = "";
            fmtstr = "#define %-32s ((%s) 0x%04hx%s)    // %.12f\n";
            value &= 0xFFFFLL;
            break;
        case 4:
            suffix = "L";
            fmtstr = "#define %-32s ((%s) 0x%08lx%s)    // %.12f\n";
            value &= 0xFFFFFFFFLL;
            break;
        case 8:
            suffix = "LL";
            fmtstr = "#define %-32s ((%s) 0x%016llx%s)  // %.12f\n";
            break;
        default:
            fatal_error("invalid integer width: %d", nbyte);
        }
        snprintf(namebuf, NAMEBUF_SIZ, "%s_%s", gFxConstTable[i].fxtype->name, gFxConstTable[i].name);
        for (j = 0; j < NAMEBUF_SIZ && namebuf[j]; j++) {
            namebuf[j] = toupper(namebuf[j]);
        }
        fprintf(outfile, fmtstr, namebuf, gFxConstTable[i].fxtype->name, value, suffix, gFxConstTable[i].value);
    }
    fprintf(outfile, "\n#endif //%s_\n", header_guard);
    if (argc >= 2) {
        fclose(outfile);
        free(header_guard);
    }
    return 0;
}
