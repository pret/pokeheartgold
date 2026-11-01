/*
 * Copyright (c) 2026 Gudf
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

#include "options.h"

#include <stdio.h>
#include <string.h>

#include "help.h"
#include "texture.h"
#include "vec.h"

#define OPTPARSE_IMPLEMENTATION
#define OPTPARSE_API static
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-function"
#include "external/optparse/optparse.h"
#pragma GCC diagnostic pop

enum CurrentInput {
    CURRENT_INPUT_NONE,
    CURRENT_INPUT_TEXTURE,
    CURRENT_INPUT_PALETTE,
    CURRENT_INPUT_NSBTX,
};

enum OptionCharacters {
    OPTION_HELP = 'h',
    OPTION_VERSION = 'V',
    OPTION_TEXTURE = 't',
    OPTION_PALETTE = 'p',
    OPTION_FORMAT = 'f',
    OPTION_NAME = 'n',
    OPTION_NAMES_FILE = 'N',
    OPTION_TRANSPARENT = 'T',
    OPTION_NO_TRANSPARENT = 'O',
    OPTION_TRANSPARENCY_MAP = 'm',
    OPTION_EXTRACT_PALETTE = 'e',
    OPTION_SPRITESHEET = 's',
    OPTION_NUM_FRAMES = 'F',
    OPTION_FRAME_HEIGHT = 'H',
    OPTION_REPEAT_PALETTE = 'r',
    OPTION_COMBINED_PALETTE = 'c',
    OPTION_PALETTE_SUFFIX = 'S',
    OPTION_PALETTES_DIR = 'd',
    OPTION_INVALID = '?',
};

static void InitOptions(struct Options *options);
static void ParsePackOptions(char *progName, char **argv, struct Options *options);
static void ParseDumpOptions(char *progName, char **argv, struct Options *options);
static enum TextureFormat ParseFormat(char *format);

static const struct optparse_long longopts_no_subcommand[] = {
    { "help", OPTION_HELP, OPTPARSE_NONE },
    { "version", OPTION_VERSION, OPTPARSE_NONE },
    { 0 }
};

static const struct optparse_long longopts_subcommands[] = {
    { "texture", OPTION_TEXTURE, OPTPARSE_REQUIRED },
    { "palette", OPTION_PALETTE, OPTPARSE_REQUIRED },
    { "format", OPTION_FORMAT, OPTPARSE_REQUIRED },
    { "name", OPTION_NAME, OPTPARSE_REQUIRED },
    { "names-file", OPTION_NAMES_FILE, OPTPARSE_REQUIRED },
    { "transparent", OPTION_TRANSPARENT, OPTPARSE_NONE },
    { "no-transparent", OPTION_NO_TRANSPARENT, OPTPARSE_NONE },
    { "transparency-map", OPTION_TRANSPARENCY_MAP, OPTPARSE_REQUIRED },
    { "extract-palette", OPTION_EXTRACT_PALETTE, OPTPARSE_NONE },
    { "spritesheet", OPTION_SPRITESHEET, OPTPARSE_NONE },
    { "num-frames", OPTION_NUM_FRAMES, OPTPARSE_REQUIRED },
    { "frame-height", OPTION_FRAME_HEIGHT, OPTPARSE_REQUIRED },
    { "repeat-palette", OPTION_REPEAT_PALETTE, OPTPARSE_NONE },
    { "combined-palette", OPTION_COMBINED_PALETTE, OPTPARSE_NONE },
    { "palette-suffix", OPTION_PALETTE_SUFFIX, OPTPARSE_NONE },
    { "palettes-dir", OPTION_PALETTES_DIR, OPTPARSE_REQUIRED },
    { "help", OPTION_HELP, OPTPARSE_NONE },
    { "version", OPTION_VERSION, OPTPARSE_NONE },
    { 0 }
};

static const struct {
    char *name;
    void (*func)(char *, char **, struct Options *);
} subcommands[] = {
    { "pack", ParsePackOptions },
    { "dump", ParseDumpOptions },
};

static const struct {
    char *name;
    enum TextureFormat fmt;
} formatStrings[] = {
    { "2bpp", TEX_FORMAT_2BPP_PALETTED },
    { "4bpp", TEX_FORMAT_4BPP_PALETTED },
    { "8bpp", TEX_FORMAT_8BPP_PALETTED },
    // { "a3i5", TEX_FORMAT_A3I5_TRANS },
    // { "a5i3", TEX_FORMAT_A5I3_TRANS },
    { "direct-color", TEX_FORMAT_DIRECT_COLOR },
    // { "compressed", TEX_FORMAT_4X4_COMPRESSED },
};

void ParseOptions(int argc, char **argv, struct Options *options)
{
    InitOptions(options);
    struct optparse opts = { 0 };

    optparse_init(&opts, argv);
    opts.permute = 0;

    int opt;
    while ((opt = optparse_long(&opts, longopts_no_subcommand, NULL)) != -1) {
        switch (opt) {
        case OPTION_HELP:
            PrintUsage(stdout, argv[0]);
            exit(0);
        case OPTION_VERSION:
            PrintVersion(stdout);
            exit(0);
        case OPTION_INVALID:
            fprintf(stderr, "Invalid option %s: %s!\nOnly '--help' and '--version' can be passed before a subcommand.\n", argv[opts.optind], opts.errmsg);
            PrintUsage(stderr, argv[0]);
            exit(1);
        }
    }

    char **subargv = argv + opts.optind;

    if (subargv[0] == 0) {
        fprintf(stderr, "Missing subcommand!\n");
        PrintUsage(stderr, argv[0]);
        exit(1);
    }

    for (int i = 0; i < sizeof(subcommands) / sizeof(subcommands[0]); i++) {
        if (strcmp(subargv[0], subcommands[i].name) == 0) {
            subcommands[i].func(argv[0], subargv, options);
            break;
        }
    }
}

void FreeOptions(struct Options *options)
{
    VecFree(options->textures);
    VecFree(options->palettes);
    VecFree(options->nsbtxs);
}

static void ParsePackOptions(char *progName, char **argv, struct Options *options)
{
    struct optparse opts = { 0 };
    optparse_init(&opts, argv);

    int opt;
    enum CurrentInput curr = CURRENT_INPUT_NONE;
    while ((opt = optparse_long(&opts, longopts_subcommands, NULL)) != -1) {
        switch ((enum OptionCharacters)opt) {
        case OPTION_TEXTURE:
            curr = CURRENT_INPUT_TEXTURE;
            VecAppend(options->textures, (struct TextureInput) { .path = opts.optarg });
            VecLast(options->textures).transparent = TRANSPARENT_AUTO;
            VecLast(options->textures).palIdx = -1;
            VecLast(options->textures).format = TEX_FORMAT_AUTO;
            break;
        case OPTION_PALETTE:
            curr = CURRENT_INPUT_PALETTE;
            VecAppend(options->palettes, (struct PaletteInput) { .path = opts.optarg });
            VecLast(options->palettes).inputType = INPUT_TYPE_JASC_PAL;
            break;
        case OPTION_NAME:
            switch (curr) {
            case CURRENT_INPUT_TEXTURE:
                if (strlen(opts.optarg) > 16) {
                    fprintf(stderr, "Resource names can only be up to 16 characters, '%s' is too long!\n", opts.optarg);
                    exit(1);
                }
                VecLast(options->textures).name = opts.optarg;
                break;
            case CURRENT_INPUT_PALETTE:
                if (strlen(opts.optarg) > 16) {
                    fprintf(stderr, "Resource names can only be up to 16 characters, '%s' is too long!\n", opts.optarg);
                    exit(1);
                }
                VecLast(options->palettes).name = opts.optarg;
                break;
            default:
                fprintf(stderr, "Option '%s' can only be passed after a texture or palette input!\n", argv[opts.optind - 2]);
                exit(1);
            }
            break;
        case OPTION_NAMES_FILE:
            if (curr != CURRENT_INPUT_TEXTURE || VecLast(options->textures).spritesheet == false) {
                fprintf(stderr, "For texture at %s: '%s' is only valid for spritesheet textures!\n", VecLast(options->textures).path, argv[opts.optind - 2]);
                exit(1);
            }
            VecLast(options->textures).namesFile = opts.optarg;
            break;
        case OPTION_FORMAT:
            if (curr != CURRENT_INPUT_TEXTURE) {
                fprintf(stderr, "Option '%s' can only be passed after a texture input!\n", argv[opts.optind - 2]);
                exit(1);
            }
            enum TextureFormat fmt = ParseFormat(opts.optarg);
            if (fmt == TEX_FORMAT_INVALID) {
                fprintf(stderr, "For texture at %s: invalid/unsupported texture format '%s'!\n", VecLast(options->textures).path, opts.optarg);
                exit(1);
            }
            VecLast(options->textures).format = fmt;
            break;
        case OPTION_TRANSPARENT:
            if (curr != CURRENT_INPUT_TEXTURE) {
                fprintf(stderr, "Option '%s' can only be passed after a texture input!\n", argv[opts.optind - 1]);
                exit(1);
            }
            VecLast(options->textures).transparent = 1;
            break;
        case OPTION_NO_TRANSPARENT:
            if (curr != CURRENT_INPUT_TEXTURE) {
                fprintf(stderr, "Option '%s' can only be passed after a texture input!\n", argv[opts.optind - 1]);
                exit(1);
            }
            VecLast(options->textures).transparent = 0;
            break;
        case OPTION_TRANSPARENCY_MAP:
            if (curr != CURRENT_INPUT_TEXTURE) {
                fprintf(stderr, "Option '%s' can only be passed after a texture input!\n", argv[opts.optind - 2]);
                exit(1);
            }
            if (VecLast(options->textures).format != TEX_FORMAT_A3I5_TRANS || VecLast(options->textures).format != TEX_FORMAT_A5I3_TRANS) {
                fprintf(stderr, "For texture at %s: option '%s' can only be used with one of the paletted formats with transparency (A3I5/A5I3)!\n", VecLast(options->textures).path, argv[opts.optind - 2]);
                exit(1);
            }
            VecLast(options->textures).transparencyInput = opts.optarg;
            break;
        case OPTION_SPRITESHEET:
            if (curr != CURRENT_INPUT_TEXTURE) {
                fprintf(stderr, "Option '%s' can only be passed after a texture input!\n", argv[opts.optind - 2]);
                exit(1);
            }
            VecLast(options->textures).spritesheet = true;
            VecLast(options->textures).frameHeight = -1;
            VecLast(options->textures).numFrames = -1;
            break;
        case OPTION_NUM_FRAMES:
            if (curr != CURRENT_INPUT_TEXTURE) {
                fprintf(stderr, "Option '%s' can only be passed after a texture input!\n", argv[opts.optind - 2]);
                exit(1);
            }
            if (!VecLast(options->textures).spritesheet) {
                fprintf(stderr, "For texture at %s: '%s' is only valid for spritesheet textures!\n", VecLast(options->textures).path, argv[opts.optind - 2]);
                exit(1);
            }
            if (VecLast(options->textures).frameHeight != -1) {
                fprintf(stderr, "For texture at %s: can't pass both a texture height and a number of frames!\n", VecLast(options->textures).path);
                exit(1);
            }
            VecLast(options->textures).numFrames = atoi(opts.optarg);
            break;
        case OPTION_FRAME_HEIGHT:
            if (curr != CURRENT_INPUT_TEXTURE) {
                fprintf(stderr, "Option '%s' can only be passed after a texture input!\n", argv[opts.optind - 2]);
                exit(1);
            }
            if (!VecLast(options->textures).spritesheet) {
                fprintf(stderr, "For texture at %s: '%s' is only valid for spritesheet textures!\n", VecLast(options->textures).path, argv[opts.optind - 2]);
                exit(1);
            }
            if (VecLast(options->textures).numFrames != -1) {
                fprintf(stderr, "For texture at %s: can't pass both a texture height and a number of frames!\n", VecLast(options->textures).path);
                exit(1);
            }
            VecLast(options->textures).frameHeight = atoi(opts.optarg);
            break;
        case OPTION_EXTRACT_PALETTE:
            if (curr != CURRENT_INPUT_TEXTURE) {
                fprintf(stderr, "Option '%s' can only be passed after a texture input!\n", argv[opts.optind - 1]);
                exit(1);
            }
            curr = CURRENT_INPUT_PALETTE;
            VecAppend(options->palettes, (struct PaletteInput) { .inputType = INPUT_TYPE_PNG });
            VecLast(options->palettes).path = VecLast(options->textures).path;
            VecLast(options->palettes).name = VecLast(options->textures).name;
            VecLast(options->textures).palIdx = options->palettes.n - 1;
            break;
        case OPTION_REPEAT_PALETTE:
            if (curr != CURRENT_INPUT_PALETTE || !(VecLast(options->palettes).inputType == INPUT_TYPE_PNG && VecLast(options->textures).spritesheet)) {
                fprintf(stderr, "Option '%s' can only be passed after a spritesheet texture palette input!\n", argv[opts.optind - 1]);
                exit(1);
            }
            VecLast(options->palettes).multiPalMode = MULTI_PALETTE_REPEAT;
            break;
        case OPTION_COMBINED_PALETTE:
            if (curr != CURRENT_INPUT_PALETTE || !(VecLast(options->palettes).inputType == INPUT_TYPE_PNG && VecLast(options->textures).spritesheet)) {
                fprintf(stderr, "Option '%s' can only be passed after a spritesheet texture palette input!\n", argv[opts.optind - 1]);
                exit(1);
            }
            VecLast(options->palettes).multiPalMode = MULTI_PALETTE_SPLIT;
            VecLast(options->textures).combinedPalette = true;
            break;
        case OPTION_PALETTE_SUFFIX:
            if (curr != CURRENT_INPUT_PALETTE) {
                fprintf(stderr, "Option '%s' can only be passed after a palette input!\n", argv[opts.optind - 1]);
                exit(1);
            }
            VecLast(options->palettes).addSuffix = true;
            break;
        case OPTION_HELP:
            PrintUsage(stdout, progName);
            exit(0);
        case OPTION_VERSION:
            PrintVersion(stdout);
            exit(0);
        case OPTION_PALETTES_DIR:
            fprintf(stderr, "Option '%s' not allowed in 'dump' mode!\n", argv[opts.optind - 1]);
            exit(1);
        case OPTION_INVALID:
            fprintf(stderr, "Invalid option '%s': %s!\n", argv[opts.optind - 1], opts.errmsg);
            PrintUsage(stderr, progName);
            exit(1);
        }
    }

    if (argv[opts.optind] == NULL) {
        fprintf(stderr, "Missing required output path argument!\n");
        exit(1);
    }

    options->mode = MODE_PACK;
    options->outputPath = argv[opts.optind];
}

static void ParseDumpOptions(char *progName, char **argv, struct Options *options)
{
    struct optparse opts = { 0 };
    optparse_init(&opts, argv);

    int opt;
    VecAppend(options->nsbtxs, (struct NSBTXInput) { 0 });
    while ((opt = optparse_long(&opts, longopts_subcommands, NULL)) != -1) {
        switch (opt) {
        case OPTION_SPRITESHEET:
            VecGet(options->nsbtxs, 0).spritesheet = true;
            break;
        case OPTION_PALETTES_DIR:
            if (!VecGet(options->nsbtxs, 0).spritesheet) {
                fprintf(stderr, "Options %s can only be used with a spritesheet NSBTX!\n", argv[opts.optind - 2]);
            }
            VecGet(options->nsbtxs, 0).palettesPath = opts.optarg;
            break;
        case OPTION_COMBINED_PALETTE:
            if (!VecGet(options->nsbtxs, 0).spritesheet) {
                fprintf(stderr, "Options %s can only be used with a spritesheet NSBTX!\n", argv[opts.optind - 1]);
            }
            VecGet(options->nsbtxs, 0).combinedPalette = true;
            break;
        case OPTION_HELP:
            PrintUsage(stdout, progName);
            exit(0);
        case OPTION_VERSION:
            PrintVersion(stdout);
            exit(0);
        case OPTION_INVALID:
            fprintf(stderr, "Invalid option '%s': %s!\n", argv[opts.optind - 1], opts.errmsg);
            PrintUsage(stderr, progName);
            exit(1);
        default:
            fprintf(stderr, "Option '%s' not allowed in 'pack' mode!\n", argv[opts.optind - 1]);
            exit(1);
        }
    }

    if (argv[opts.optind] == 0) {
        fprintf(stderr, "Missing required input path argument!\n");
        PrintUsage(stderr, progName);
        exit(1);
    }

    VecGet(options->nsbtxs, 0).path = argv[opts.optind];

    if (argv[++opts.optind] == 0) {
        fprintf(stderr, "Missing required output path argument!\n");
        PrintUsage(stderr, progName);
        exit(1);
    }

    options->mode = MODE_DUMP;
    options->outputPath = argv[opts.optind++];
}

static void InitOptions(struct Options *options)
{
    options->mode = 0;
    options->outputPath = NULL;
    VecInit(options->textures, 8);
    VecInit(options->palettes, 8);
    VecInit(options->nsbtxs, 4);
}

static enum TextureFormat ParseFormat(char *format)
{
    for (int i = 0; i < sizeof(formatStrings) / sizeof(formatStrings[0]); i++) {
        if (strcmp(format, formatStrings[i].name) == 0) {
            return formatStrings[i].fmt;
        }
    }
    return TEX_FORMAT_INVALID;
}
