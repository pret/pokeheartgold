#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "asmwriter.h"
#include "encoder.h"

static int parseKey(const char *key_text, uint32_t *out_key) {
    char *outptr;
    *out_key = strtoul(key_text, &outptr, 16);
    return (*outptr == '\0') && (errno != ERANGE);
}

static int isValidIdentifier(const char *str) {
    if (str == NULL) {
        return 0;
    }

    // Must start with [_a-zA-Z]
    if (
        str[0] != '_' && (str[0] < 'a' || str[0] > 'z') && (str[0] < 'A' || str[0] > 'Z')) {
        return 0;
    }

    // Subsequent characters must be [_a-zA-Z0-9]+
    for (int i = 1; str[i] != '\0'; i++) {
        if (
            str[i] != '_' && (str[i] < 'a' || str[i] > 'z') && (str[i] < 'A' || str[i] > 'Z') && (str[i] < '0' || str[i] > '9')) {
            return 0;
        }
    }

    return 1;
}

static void printDescription(void) {
    printf(
        "Encode or decode ARM ELF files, with or without a key.                          \n"
        "If encoding, output an assembly file that will decode them.                     \n"
        "For DS Protect version 1.23.                                                    \n");
}

static void printUsage(const char *self_name) {
    printf(
        "Usage: %s <arguments>                                                           \n"
        "  -i, --input [file1, [file2, [ ... ]]]      List of input files to process.    \n"
        "  -o, --output [outfile]                     Output file to create, if encoding.\n"
        "  -e, --encode                               Encode the input files.            \n"
        "  -d, --decode                               Decode the input files.            \n"
        "  -f, --functions [func1, [func2, [ ... ]]]  List of functions to encode/decode.\n"
        "  -k, --key [key]                            Optional encryption key.           \n"
        "  -p, --prefix [prefix = RunEncrypted_]      Prefix for decryption wrappers.    \n"
        "  -r, --replace-prefix [prefix]              Remove prefix from input functions.\n"
        "  -g  --garbage [symbol]                     Optional added garbage reference.  \n"
        "  -v, --verbose                              Print encoding progress.           \n",
        self_name);
}

static int argCompare(char *arg, char short_letter, char *long_str) {
    return (arg[1] == short_letter && arg[2] == '\0') || (strcmp(arg, long_str) == 0);
}

enum {
    AWAIT_INPUT_FILE,
    AWAIT_SYMBOL,
    AWAIT_NONE
};

int ArgParse_CreateTask(EncodingTask *task, char **argv) {
    // Defaults
    task->inputs = NULL;
    task->output_fname = NULL;
    task->encoding_type = ENC_INVALID;
    task->key_mode = MODE_UNKEYED;
    task->symbols = NULL;
    task->wrapper_prefix = NULL;
    task->replace_prefix = NULL;
    task->garbage = NULL;
    task->key = 0;
    task->verbose = 0;

    int arg_idx = 0;

    // No arguments?
    char *self_name = argv[arg_idx];
    if (self_name == NULL) {
        return 1;
    }

    arg_idx++;

    if (argv[arg_idx] == NULL) {
        printDescription();
        printf("\n");
        printUsage(self_name);
        return 1;
    }

    int max_files = 16;
    int max_symbols = 64;

    task->symbols = calloc(max_symbols, sizeof(char *));
    int symbol_idx = 0;

    task->inputs = calloc(max_files, sizeof(FILE *));
    int file_idx = 0;

    int await_state = AWAIT_NONE;

    for (; argv[arg_idx] != NULL; arg_idx++) {
        char *curr_arg = argv[arg_idx];
        char *next_arg = argv[arg_idx + 1];

        if (curr_arg[0] == '-') {
            await_state = AWAIT_NONE;

            if (argCompare(curr_arg, 'i', "--input")) {
                if (next_arg == NULL || next_arg[0] == '-') {
                    printf("Error: %s but no files provided\n", curr_arg);
                    return 1;
                }

                await_state = AWAIT_INPUT_FILE;

            } else if (argCompare(curr_arg, 'o', "--output")) {
                if (next_arg == NULL || next_arg[0] == '-') {
                    printf("Error: %s but no output filename provided\n", curr_arg);
                    return 1;
                }

                if (task->output_fname != NULL) {
                    printf("Error: multiple output files provided\n");
                    return 1;
                }

                task->output_fname = next_arg;
                arg_idx++;

            } else if (argCompare(curr_arg, 'e', "--encode")) {
                if (task->encoding_type != ENC_INVALID) {
                    printf("Error: multiple operations provided\n");
                    return 1;
                }

                task->encoding_type = ENC_ENCODE;

            } else if (argCompare(curr_arg, 'd', "--decode")) {
                if (task->encoding_type != ENC_INVALID) {
                    printf("Error: multiple operations provided\n");
                    return 1;
                }

                task->encoding_type = ENC_DECODE;

            } else if (argCompare(curr_arg, 'f', "--functions")) {
                if (next_arg == NULL || next_arg[0] == '-') {
                    printf("Error: %s but no functions provided\n", curr_arg);
                    return 1;
                }

                await_state = AWAIT_SYMBOL;

            } else if (argCompare(curr_arg, 'k', "--key")) {
                if (next_arg == NULL || next_arg[0] == '-') {
                    printf("Error: %s but no key provided\n", curr_arg);
                    return 1;
                }

                uint32_t key;
                int valid = parseKey(next_arg, &key);
                if (!valid) {
                    printf("Error: could not parse key: %s\n", next_arg);
                    return 1;
                }

                if (task->key_mode != MODE_UNKEYED) {
                    printf("Error: multiple keys provided\n");
                    return 1;
                }

                task->key_mode = MODE_KEYED;
                task->key = key;
                arg_idx++;

            } else if (argCompare(curr_arg, 'p', "--prefix")) {
                if (next_arg == NULL || next_arg[0] == '-') {
                    printf("Error: %s but no prefix string provided\n", curr_arg);
                    return 1;
                }

                if (task->wrapper_prefix != NULL) {
                    printf("Error: multiple prefix strings provided\n");
                    return 1;
                }

                if (!isValidIdentifier(next_arg)) {
                    printf("Error: invalid identifier: %s\n", next_arg);
                    return 1;
                }

                task->wrapper_prefix = next_arg;
                arg_idx++;

            } else if (argCompare(curr_arg, 'r', "--replace-prefix")) {
                if (next_arg == NULL || next_arg[0] == '-') {
                    printf("Error: %s but no prefix string provided\n", curr_arg);
                    return 1;
                }

                if (task->replace_prefix != NULL) {
                    printf("Error: multiple prefix strings provided\n");
                    return 1;
                }

                if (!isValidIdentifier(next_arg)) {
                    printf("Error: invalid identifier: %s\n", next_arg);
                    return 1;
                }

                task->replace_prefix = next_arg;
                arg_idx++;

            } else if (argCompare(curr_arg, 'g', "--garbage")) {
                if (next_arg == NULL || next_arg[0] == '-') {
                    printf("Error: %s but no reference provided\n", curr_arg);
                    return 1;
                }

                if (task->garbage != NULL) {
                    printf("Error: multiple garbage references provided\n");
                    return 1;
                }

                if (!isValidIdentifier(next_arg)) {
                    printf("Error: invalid identifier: %s\n", next_arg);
                    return 1;
                }

                task->garbage = next_arg;
                arg_idx++;

            } else if (argCompare(curr_arg, 'v', "--verbose")) {
                task->verbose = 1;

            } else {
                printf("Unknown argument: %s\n\n", curr_arg);
                printUsage(self_name);
                return 1;
            }
        } else {
            switch (await_state) {
            case AWAIT_SYMBOL:
                // Maintain null terminator
                if ((symbol_idx + 1) == max_symbols) {
                    max_symbols += 32;
                    task->symbols = realloc(task->symbols, max_symbols * sizeof(char *));
                }

                if (!isValidIdentifier(curr_arg)) {
                    printf("Error: invalid identifier: %s\n", curr_arg);
                    return 1;
                }

                for (int i = 0; i < symbol_idx; i++) {
                    if (strcmp(curr_arg, task->symbols[i]) == 0) {
                        printf("Error: duplicate function: %s\n", curr_arg);
                        return 1;
                    }
                }

                task->symbols[symbol_idx] = curr_arg;
                symbol_idx++;
                task->symbols[symbol_idx] = NULL;
                break;

            case AWAIT_INPUT_FILE:
                // Maintain null terminator
                if ((file_idx + 1) == max_files) {
                    max_files += 8;
                    task->inputs = realloc(task->inputs, max_files * sizeof(char *));
                }

                // Don't check for duplicate input files here, since "foo.o" != "./foo.o" etc
                // Instead check later when we open each file

                task->inputs[file_idx] = curr_arg;
                file_idx++;
                task->inputs[file_idx] = NULL;
                break;

            default:
            case AWAIT_NONE:
                printf("Unknown argument: %s\n\n", curr_arg);
                printUsage(self_name);
                return 1;
            }
        }
    }

    if (file_idx == 0) {
        printf("Error: no input file(s) provided (-i)\n");
        return 1;
    }

    if (task->encoding_type == ENC_INVALID) {
        printf("Error: no encoding operation provided (-e/-d)\n");
        return 1;
    }

    if (symbol_idx == 0) {
        printf("Error: no functions provided (-f)\n");
        return 1;
    }

    if (task->replace_prefix != NULL && task->encoding_type == ENC_ENCODE && task->key_mode == MODE_KEYED) {
        if ((task->wrapper_prefix == NULL && strcmp(task->replace_prefix, DEFAULT_ADDED_PREFIX) == 0) || (task->wrapper_prefix != NULL && strcmp(task->wrapper_prefix, task->replace_prefix) == 0)) {
            printf("Error: replaced prefix and added prefix cannot be the same\n");
            return 1;
        }
    }

    if (task->output_fname != NULL && task->encoding_type == ENC_DECODE) {
        printf("Warning: output file name provided, but no output will be generated for decoding\n");
        task->output_fname = NULL;
    }

    if (task->wrapper_prefix != NULL && !(task->encoding_type == ENC_ENCODE && task->key_mode == MODE_KEYED)) {
        printf("Warning: decryption wrapper prefix provided, but will not be used unless encoding with key\n");
        task->wrapper_prefix = NULL;
    }

    if (task->replace_prefix != NULL && !(task->encoding_type == ENC_ENCODE && task->key_mode == MODE_KEYED)) {
        printf("Warning: replaced prefix provided, but will not be used unless encoding with key\n");
        task->replace_prefix = NULL;
    }

    if (task->garbage != NULL && task->encoding_type == ENC_DECODE) {
        printf("Warning: garbage reference provided, but will not be used for decoding\n");
        task->garbage = NULL;
    }

    return 0;
}

void ArgParse_DestroyTask(EncodingTask *task) {
    if (task != NULL) {
        free(task->symbols);
        free(task->inputs);
    }
}
