#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <unistd.h>

#ifndef NDEBUG
#ifdef _MSC_VER
#define debug_printf(fmt, ...) fprintf(stderr, fmt, __VA_ARGS__)
#else
#define debug_printf(fmt, ...) fprintf(stderr, fmt, ##__VA_ARGS__)
#endif //_MSC_VER
#else
#define debug_printf(fmt, ...) ((void)0)
#endif //NDEBUG

#define FIND_FAIL (-1u)

struct NtrDirHeader {
    unsigned offset;
    unsigned short first_file;
    unsigned short count_or_parent;
};

static char FILEBUF[BUFSIZ];

unsigned find_file(struct NtrDirHeader * fnt, const char * cfilename) {
    unsigned file_id = fnt->first_file;
    char * filename = strdup(cfilename);
    char * tokenizer = filename;
    int found = 0;
    char * tree = (char *)fnt + fnt->offset;
    char * token;

    while ((token = strtok(tokenizer, "/")) != NULL) {
        tokenizer = NULL;
        debug_printf("TOKEN: %s\n", token);
        long toklen = strlen(token);
        while (*tree) {
            char flag = *tree++;
#ifndef NDEBUG
            char *entname = malloc((flag & 0x7F) + 1);
            *stpncpy(entname, tree, flag & 0x7F) = 0;
            debug_printf("testing entry %s...", entname);
            free(entname);
#endif //NDEBUG
            if ((toklen != (flag & 0x7F)) || strncmp(tree, token, toklen) != 0) {
                debug_printf("no; is %s\n", (flag & 0x80) ? "dir" : "file");
                // Next entry
                tree += (flag & 0x7F);
                if (flag & 0x80) {
                    tree += 2; // skip dir id
                }
                else {
                    file_id++;
                }
            }
            else {
                debug_printf("yes; is %s\n", (flag & 0x80) ? "dir" : "file");
                tree += (flag & 0x7F);
                if (flag & 0x80) {
                    // navigate to next dir
                    unsigned short dir_id = (unsigned char) tree[0] | ((unsigned char) tree[1] << 8);
                    file_id = fnt[dir_id & 0xFFF].first_file;
                    tree = (char *)fnt + fnt[dir_id & 0xFFF].offset;
                    break;
                }
                else {
                    found = 1;
                    token = strtok(NULL, "/");
                    goto done;
                }
            }
        }
    }

done:
    free(filename);
    if (!found || token != NULL) {
        file_id = FIND_FAIL;
    }
    return file_id;
}

int main(int argc, char ** argv) {
    if (argc < 3) {
        fprintf(stderr, "missing required argument: %s\n", (argc == 1) ? "BASEROM" : "FILENAME");
        return 1;
    }
    FILE *baserom = fopen(argv[1], "rb");
    if (baserom == NULL) {
        fprintf(stderr, "unable to open ROM %s for reading\n", argv[1]);
        return 1;
    }
    debug_printf("opened baserom\n");

    // fnt offset, fnt size, fat offset, fat size
    unsigned offsets[4];
    fseek(baserom, 64, SEEK_SET);
    if (fread(offsets, 4, 4, baserom) != 4) {
        fprintf(stderr, "failed to read from baserom\n");
        fclose(baserom);
        return 1;
    }
    debug_printf("read offsets\n");

    // read fnt
    struct NtrDirHeader *fnt = malloc(offsets[1]);
    if (fnt == NULL) {
        fprintf(stderr, "unable to allocate FNT buffer\n");
        fclose(baserom);
        return 1;
    }
    fseek(baserom, offsets[0], SEEK_SET);
    if (fread(fnt, 1, offsets[1], baserom) != offsets[1]) {
        fprintf(stderr, "unable to read FNT\n");
        free(fnt);
        fclose(baserom);
        return 1;
    }
    debug_printf("read fnt\n");

    unsigned file_id = find_file(fnt, argv[2]);
    free(fnt);
    if (file_id == FIND_FAIL) {
        fprintf(stderr, "file not found");
        fclose(baserom);
        return 1;
    }
    debug_printf("found file with id %u\n", file_id);

    // Extract the file to stdout
    if (8 * file_id >= offsets[3]) {
        fprintf(stderr, "nitrofs lookup failed");
        fclose(baserom);
        return 1;
    }

    FILE *out = fdopen(dup(fileno(stdout)), "wb");
    fseek(baserom, offsets[2] + 8 * file_id, SEEK_SET);
    fread(offsets, 4, 2, baserom);
    fseek(baserom, offsets[0], SEEK_SET);
    while (offsets[1] - offsets[0] > BUFSIZ) {
        fread(FILEBUF, 1, BUFSIZ, baserom);
        fwrite(FILEBUF, 1, BUFSIZ, out);
        offsets[0] += BUFSIZ;
    }
    fread(FILEBUF, 1, offsets[1] - offsets[0], baserom);
    fwrite(FILEBUF, 1, offsets[1] - offsets[0], out);
    fclose(out);

    fclose(baserom);
    return 0;
}
