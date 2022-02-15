#include <stdio.h>
#include <unistd.h>
#include "fx.h"
#include "global.h"

const struct FxSpec fx32 = {"fx32", 19, 12};
const struct FxSpec fx64 = {"fx64", 51, 12};
const struct FxSpec fx64c = {"fx64c", 31, 32};
const struct FxSpec fx16 = {"fx16", 3, 12};

const struct FxSpec *const sFxSpecPtrs[] = {
    &fx32,
    &fx64,
    &fx64c,
    &fx16,
};

struct FxConst *gFxConstTable = NULL;
size_t gNFxConstTable = 0;

void FxConstTableInit(void) {
    FILE *file;
    char *contents;
    char *ptr;
    char *linetok;
    char *linetok_r;
    char *commatok;
    char *commatok_r;
    char *_realpath;
    int i, j, k;
    long fsize;
    long readsz;
    static const char filename[] = SOURCE_DIR "/fx_const.csv";

    atexit(FxConstTableEnd);

    file = fopen(filename, "r");
    if (file == NULL) {
        fatal_error("Unable to open file '%s' for reading", filename);
    }
    fseek(file, 0, SEEK_END);
    fsize = ftell(file);
    fseek(file, 0, SEEK_SET);
    contents = malloc(fsize + 1);
    if (contents == NULL) {
        fclose(file);
        fatal_error("Unable to allocate CSV read buffer");
    }
    readsz = fread(contents, 1, fsize, file);
    fclose(file);
    if (readsz != fsize) {
        free(contents);
        fatal_error("Read error");
    }
    contents[fsize] = 0;
    ptr = contents - 1;
    gNFxConstTable = 0;
    do {
        ptr++;
        gNFxConstTable += (*ptr != '#' && *ptr != '\n');
        ptr = strchr(ptr, '\n');
    } while (ptr != NULL);
    if (gNFxConstTable == 0) {
        free(contents);
        fatal_error("Malformatted CSV file");
    }
    gFxConstTable = malloc(gNFxConstTable * sizeof(struct FxConst));
    if (gFxConstTable == NULL) {
        free(contents);
        fatal_error("Unable to allocate gFxConstTable");
    }
    ptr = contents;
    for (i = 0; i < gNFxConstTable; i++) {
        linetok = strtok_r(ptr, "\n", &linetok_r);
        ptr = NULL;
        if (linetok == NULL) {
            gNFxConstTable = i;
            break;
        }
        if (*linetok == '#') {
            i--;
            continue;
        }
        for (j = 0; j < 3; j++) {
            commatok = strtok_r(linetok, ",", &commatok_r);
            linetok = NULL;
            if (commatok == NULL) {
                free(contents);
                fatal_error("Malformatted CSV file at line %d col %d", i, j);
            }
            switch (j) {
            case 0:
                gFxConstTable[i].name = strdup(commatok);
                break;
            case 1:
                for (k = 0; k < len(sFxSpecPtrs); k++) {
                    if (strcmp(commatok, sFxSpecPtrs[k]->name) == 0) {
                        break;
                    }
                }
                if (k == len(sFxSpecPtrs)) {
                    free(contents);
                    fatal_error("Invalid fx type %s", commatok);
                }
                gFxConstTable[i].fxtype = sFxSpecPtrs[k];
                break;
            case 2:
                gFxConstTable[i].value = strtod(commatok, NULL);
                break;
            }
        }
    }
    free(contents);
}

void FxConstTableEnd(void) {
    int i;
    if (gFxConstTable != NULL) {
        for (i = 0; i < gNFxConstTable; i++) {
            if (gFxConstTable[i].name != NULL) {
                free(gFxConstTable[i].name);
            }
        }
        free(gFxConstTable);
        gFxConstTable = NULL;
    }
    gNFxConstTable = 0;
}
