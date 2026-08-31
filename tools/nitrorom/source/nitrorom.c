// SPDX-License-Identifier: MIT

#include "nitrorom.h"

#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "config.h"

#define PROGRAM_NAME "nitrorom"

static void showusage(FILE *stream);
extern int  nitrorom_list(int argc, const char **argv);
extern int  nitrorom_pack(int argc, const char **argv);

typedef int (*commandfunc)(int argc, const char **argv);

typedef struct command {
    const char *name;
    commandfunc func;
} command;

// clang-format off
static const command commands[] = {
    { .name = "list", .func = nitrorom_list },
    { .name = "pack", .func = nitrorom_pack },
    { 0 },
};
// clang-format on

int main(int argc, const char **argv)
{
    if (argc <= 1 || strncmp(argv[1], "-h", 2) == 0 || strncmp(argv[1], "--help", 6) == 0) {
        // TODO: Permit help to take an argument for a command
        showusage(stdout);
        exit(EXIT_SUCCESS);
    }

    if (strncmp(argv[1], "--version", 9) == 0) {
        printf("%s%s\n", VERSION, REVISION);
        exit(EXIT_SUCCESS);
    }

    const command *match = &commands[0];
    for (; match->name != NULL && strcmp(argv[1], match->name) != 0; match++);

    if (match->name == NULL) dieusage("unrecognized command “%s”", argv[1]);

    return match->func(argc - 1, argv + 1);
}

static void showusage(FILE *stream)
{
    fprintf(stream, "nitrorom - Interface with Nintendo DS ROM images\n");
    fprintf(stream, "\n");
    fprintf(stream, "Usage: nitrorom [OPTIONS] [COMMAND]\n");
    fprintf(stream, "\n");
    fprintf(stream, "Options:\n");
    fprintf(stream, "  -h / --help      Display this help-text and exit.\n");
    fprintf(stream, "  -v / --version   Display the program's version number and exit.\n");
    fprintf(stream, "\n");
    fprintf(stream, "Commands:\n");
    fprintf(stream, "  list             List the components of a Nintendo DS ROM\n");
    fprintf(stream, "  pack             Produce a ROM image from source files\n");
}
