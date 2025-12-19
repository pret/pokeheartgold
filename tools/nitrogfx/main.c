// Copyright (c) 2015 YamaArashi, 2021-2025 red031000

#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include "global.h"
#include "util.h"
#include "options.h"
#include "gfx.h"
#include "convert_png.h"
#include "jasc_pal.h"
#include "lz.h"
#include "rl.h"
#include "font.h"
#include "huff.h"
#include "json.h"

struct CommandHandler
{
    const char *inputFileExtension;
    const char *outputFileExtension;
    void(*function)(char *inputPath, char *outputPath, int argc, char **argv);
};

static int CountLzCompressArgs(int argc, char **argv);
static void HandleLZCompressCommand(char *inputPath, char *outputPath, int argc, char **argv);
static void HandleLZDecompressCommand(char *inputPath, char *outputPath, int argc UNUSED, char **argv UNUSED);

void ConvertGbaToPng(char *inputPath, char *outputPath, struct GbaToPngOptions *options)
{
    struct Image image;

    if (options->paletteFilePath != NULL)
    {
        ReadGbaPalette(options->paletteFilePath, &image.palette);
        image.hasPalette = true;
    }
    else
    {
        image.hasPalette = false;
    }

    ReadImage(inputPath, options->width, options->bitDepth, options->colsPerChunk, options->rowsPerChunk, &image, !image.hasPalette);

    image.hasTransparency = options->hasTransparency;

    WritePng(outputPath, &image);

    FreeImage(&image);
}

void ConvertNtrToPng(char *inputPath, char *outputPath, struct NtrToPngOptions *options)
{
    // handle empty files if possible
    if (options->handleEmpty)
    {
        FILE *fp = fopen(inputPath, "rb");
        if (fp != NULL)
        {
            fseek(fp, 0, SEEK_END);
            uint32_t size = ftell(fp);
            rewind(fp);
            if (size == 0)
            {
                FILE *out = fopen(outputPath, "wb+");
                if (out != NULL) {
                    fclose(out);
                }
                fclose(fp);
                return;
            }
            fclose(fp);
        }
    }

    struct Image image;

    if (options->paletteFilePath != NULL)
    {
        ReadNtrPalette(options->paletteFilePath, &image.palette, options->bitDepth, options->palIndex, false, options->convertTo8Bpp);
        image.hasPalette = true;
    }
    else
    {
        image.hasPalette = false;
    }

    uint32_t key = ReadNtrImage(inputPath, options->width, 0, options->colsPerChunk, options->rowsPerChunk, &image, !image.hasPalette, options->encodeMode, options->convertTo8Bpp, options->palIndex, options->verbose);

    if (key)
    {
        char* string = malloc(strlen(outputPath) + 5);
        sprintf(string, "%s.key", outputPath);
        FILE *fp = fopen(string, "wb");
        if (fp == NULL)
            FATAL_ERROR("Failed to open key file for writing.\n");
        fwrite(&key, 4, 1, fp);
        fclose(fp);
        free(string);
    }

    image.hasTransparency = options->hasTransparency;

    if (options->cellFilePath != NULL) {
        ApplyCellsToImage(options->cellFilePath, &image, true, options->cellSnap);
    }

    WritePng(outputPath, &image);

    FreeImage(&image);
}

void ConvertPngToGba(char *inputPath, char *outputPath, struct PngToGbaOptions *options)
{
    struct Image image;

    image.bitDepth = options->bitDepth;

    ReadPng(inputPath, &image);

    WriteImage(outputPath, options->numTiles, options->bitDepth, options->colsPerChunk, options->rowsPerChunk, &image, !image.hasPalette);

    FreeImage(&image);
}

void ConvertPngToNtr(char *inputPath, char *outputPath, struct PngToNtrOptions *options)
{
    // handle empty files if possible
    if (options->handleEmpty)
    {
        FILE *fp = fopen(inputPath, "rb");
        if (fp != NULL)
        {
            fseek(fp, 0, SEEK_END);
            uint32_t size = ftell(fp);
            rewind(fp);
            if (size == 0)
            {
                FILE *out = fopen(outputPath, "wb+");
                if (out != NULL) {
                    fclose(out);
                }
                fclose(fp);
                return;
            }
            fclose(fp);
        }
    }

    struct Image image;

    image.bitDepth = options->bitDepth == 0 ? 4 : options->bitDepth;

    ReadPng(inputPath, &image);

    uint32_t key = 0;
    if (options->encodeMode) {
        char* string = malloc(strlen(inputPath) + 5);
        sprintf(string, "%s.key", inputPath);
        FILE *fp = fopen(string, "rb");
        if (fp == NULL) {
            FATAL_ERROR("Failed to open key file for reading.\n");
        }
        size_t count = fread(&key, 4, 1, fp);
        if (count != 1)
            FATAL_ERROR("Not a valid key file.\n");
        fclose(fp);
        free(string);
    }

    options->bitDepth = options->bitDepth == 0 ? image.bitDepth : options->bitDepth;

    if (options->cellFilePath != NULL) {
        ApplyCellsToImage(options->cellFilePath, &image, false, options->cellSnap);
    }

    WriteNtrImage(outputPath, options->numTiles, options->bitDepth, options->colsPerChunk, options->rowsPerChunk, &image, !image.hasPalette, options->clobberSize, options->byteOrder, options->version101, options->sopc, options->vramTransfer, options->scan, options->encodeMode, options->mappingType, key, options->wrongSize, options->convertTo4Bpp);

    FreeImage(&image);
}

void HandleGbaToPngCommand(char *inputPath, char *outputPath, int argc, char **argv)
{
    char *inputFileExtension = GetFileExtension(inputPath);
    struct GbaToPngOptions options;
    options.paletteFilePath = NULL;
    if (isdigit((unsigned char)inputFileExtension[0]))
        options.bitDepth = inputFileExtension[0] - '0';
    else
        options.bitDepth = 4;
    options.hasTransparency = false;
    options.width = 1;
    options.colsPerChunk = 1;
    options.rowsPerChunk = 1;

    for (int i = 3; i < argc; i++)
    {
        char *option = argv[i];

        if (strcmp(option, "-palette") == 0)
        {
            if (i + 1 >= argc)
                FATAL_ERROR("No palette file path following \"-palette\".\n");

            i++;

            options.paletteFilePath = argv[i];
        }
        else if (strcmp(option, "-object") == 0)
        {
            options.hasTransparency = true;
        }
        else if (strcmp(option, "-width") == 0)
        {
            if (i + 1 >= argc)
                FATAL_ERROR("No width following \"-width\".\n");

            i++;

            if (!ParseNumber(argv[i], NULL, 10, &options.width))
                FATAL_ERROR("Failed to parse width.\n");

            if (options.width < 1)
                FATAL_ERROR("Width must be positive.\n");
        }
        else if (strcmp(option, "-mwidth") == 0 || strcmp(option, "-cpc") == 0)
        {
            if (i + 1 >= argc)
                FATAL_ERROR("No columns per chunk value following \"%s\".\n", option);

            i++;

            if (!ParseNumber(argv[i], NULL, 10, &options.colsPerChunk))
                FATAL_ERROR("Failed to parse columns per chunk.\n");

            if (options.colsPerChunk < 1)
                FATAL_ERROR("columns per chunk must be positive.\n");
        }
        else if (strcmp(option, "-mheight") == 0 || strcmp(option, "-rpc") == 0)
        {
            if (i + 1 >= argc)
                FATAL_ERROR("No rows per chunk value following \"%s\".\n", option);

            i++;

            if (!ParseNumber(argv[i], NULL, 10, &options.rowsPerChunk))
                FATAL_ERROR("Failed to parse rows per chunk.\n");

            if (options.rowsPerChunk < 1)
                FATAL_ERROR("rows per chunk must be positive.\n");
        }
        else
        {
            FATAL_ERROR("Unrecognized option \"%s\".\n", option);
        }
    }

    if (options.colsPerChunk > options.width)
        options.width = options.colsPerChunk;

    ConvertGbaToPng(inputPath, outputPath, &options);
}

void HandleNtrToPngCommand(char *inputPath, char *outputPath, int argc, char **argv)
{
    struct NtrToPngOptions options;
    options.paletteFilePath = NULL;
    options.cellFilePath = NULL;
    options.cellSnap = true;
    options.hasTransparency = false;
    options.width = 0;
    options.colsPerChunk = 1;
    options.rowsPerChunk = 1;
    options.palIndex = 1;
    options.handleEmpty = false;
    options.encodeMode = 0;
    options.convertTo8Bpp = false;
    options.verbose = false;

    for (int i = 3; i < argc; i++)
    {
        char *option = argv[i];

        if (strcmp(option, "-palette") == 0)
        {
            if (i + 1 >= argc)
                FATAL_ERROR("No palette file path following \"-palette\".\n");

            i++;

            options.paletteFilePath = argv[i];
        } else if (strcmp(option, "-cell") == 0) {
            if (i + 1 >= argc) {
                FATAL_ERROR("No cell file path following \"-cell\".\n");
            }

            i++;

            options.cellFilePath = argv[i];

            if (i + 1 < argc) {
                if (strcmp(argv[i + 1], "-nosnap") == 0) {
                    options.cellSnap = false;
                    i++;
                }
            }
        } else if (strcmp(option, "-object") == 0) {
            options.hasTransparency = true;
        } else if (strcmp(option, "-palindex") == 0) {
            if (i + 1 >= argc)
                FATAL_ERROR("No palette index following \"-palindex\".\n");

            i++;

            if (!ParseNumber(argv[i], NULL, 10, &options.palIndex))
                FATAL_ERROR("Failed to parse palette index.\n");

            if (options.palIndex < 1)
                FATAL_ERROR("Palette index must be positive.\n");
        } else if (strcmp(option, "-width") == 0) {
            if (i + 1 >= argc)
                FATAL_ERROR("No width following \"-width\".\n");

            i++;

            if (!ParseNumber(argv[i], NULL, 10, &options.width))
                FATAL_ERROR("Failed to parse width.\n");

            if (options.width < 1)
                FATAL_ERROR("Width must be positive.\n");
        } else if (strcmp(option, "-mwidth") == 0 || strcmp(option, "-cpc") == 0) {
            if (i + 1 >= argc)
                FATAL_ERROR("No columns per chunk value following \"%s\".\n", option);

            i++;

            if (!ParseNumber(argv[i], NULL, 10, &options.colsPerChunk))
                FATAL_ERROR("Failed to parse columns per chunk.\n");

            if (options.colsPerChunk < 1)
                FATAL_ERROR("columns per chunk must be positive.\n");
        } else if (strcmp(option, "-mheight") == 0 || strcmp(option, "-rpc") == 0) {
            if (i + 1 >= argc)
                FATAL_ERROR("No rows per chunk value following \"%s\".\n", option);

            i++;

            if (!ParseNumber(argv[i], NULL, 10, &options.rowsPerChunk))
                FATAL_ERROR("Failed to parse rows per chunk.\n");

            if (options.rowsPerChunk < 1)
                FATAL_ERROR("rows per chunk must be positive.\n");
        } else if (strcmp(option, "-scanfronttoback") == 0) {
            // maintained for compatibility
            if (options.encodeMode != 0) {
                FATAL_ERROR("Encode mode specified more than once.\n-encodebacktofront goes back to front as in DP, -encodefronttoback goes front to back as in PtHGSS\n");
            }
            options.encodeMode = 2;
        } else if (strcmp(option, "-encodebacktofront") == 0) {
            if (options.encodeMode != 0) {
                FATAL_ERROR("Encode mode specified more than once.\n-encodebacktofront goes back to front as in DP, -encodefronttoback goes front to back as in PtHGSS\n");
            }
            options.encodeMode = 1;
        } else if (strcmp(option, "-encodefronttoback") == 0) {
            if (options.encodeMode != 0) {
                FATAL_ERROR("Encode mode specified more than once.\n-encodebacktofront goes back to front as in DP, -encodefronttoback goes front to back as in PtHGSS\n");
            }
            options.encodeMode = 2;
        } else if (strcmp(option, "-handleempty") == 0) {
            options.handleEmpty = true;
        } else if (strcmp(option, "-convertTo8Bpp") == 0) {
            options.convertTo8Bpp = true;
        } else if (strcmp(option, "-verbose") == 0) {
            options.verbose = true;
        } else {
            FATAL_ERROR("Unrecognized option \"%s\".\n", option);
        }
    }

    if (options.width != 0 && options.colsPerChunk > options.width)
        options.width = options.colsPerChunk;

    ConvertNtrToPng(inputPath, outputPath, &options);
}

void HandleNtrLzToPngCommand(char *inputPath, char *outputPath, int argc, char **argv) {
    HandleLZDecompressCommand(inputPath, outputPath, argc, argv);

    HandleNtrToPngCommand(outputPath, outputPath, argc, argv);
}

void HandlePngToGbaCommand(char *inputPath, char *outputPath, int argc, char **argv)
{
    char *outputFileExtension = GetFileExtension(outputPath);
    int bitDepth;
    if (strcmp(outputFileExtension, "nbfc") == 0)
        bitDepth = 4;
    else
        bitDepth = outputFileExtension[0] - '0';
    struct PngToGbaOptions options;
    options.numTiles = 0;
    options.bitDepth = bitDepth;
    options.colsPerChunk = 1;
    options.rowsPerChunk = 1;

    for (int i = 3; i < argc; i++)
    {
        char *option = argv[i];

        if (strcmp(option, "-num_tiles") == 0)
        {
            if (i + 1 >= argc)
                FATAL_ERROR("No number of tiles following \"-num_tiles\".\n");

            i++;

            if (!ParseNumber(argv[i], NULL, 10, &options.numTiles))
                FATAL_ERROR("Failed to parse number of tiles.\n");

            if (options.numTiles < 1)
                FATAL_ERROR("Number of tiles must be positive.\n");
        }
        else if (strcmp(option, "-mwidth") == 0 || strcmp(option, "-cpc") == 0)
        {
            if (i + 1 >= argc)
                FATAL_ERROR("No columns per chunk value following \"%s\".\n", option);

            i++;

            if (!ParseNumber(argv[i], NULL, 10, &options.colsPerChunk))
                FATAL_ERROR("Failed to parse columns per chunk.\n");

            if (options.colsPerChunk < 1)
                FATAL_ERROR("columns per chunk must be positive.\n");
        }
        else if (strcmp(option, "-mheight") == 0 || strcmp(option, "-rpc") == 0)
        {
            if (i + 1 >= argc)
                FATAL_ERROR("No rows per chunk value following \"%s\".\n", option);

            i++;

            if (!ParseNumber(argv[i], NULL, 10, &options.rowsPerChunk))
                FATAL_ERROR("Failed to parse rows per chunk.\n");

            if (options.rowsPerChunk < 1)
                FATAL_ERROR("rows per chunk must be positive.\n");
        }
        else
        {
            FATAL_ERROR("Unrecognized option \"%s\".\n", option);
        }
    }

    ConvertPngToGba(inputPath, outputPath, &options);
}

void HandlePngToNtrCommand(char *inputPath, char *outputPath, int argc, char **argv)
{
    struct PngToNtrOptions options;
    options.cellFilePath = NULL;
    options.cellSnap = true;
    options.numTiles = 0;
    options.bitDepth = 0;
    options.colsPerChunk = 1;
    options.rowsPerChunk = 1;
    options.wrongSize = false;
    options.clobberSize = false;
    options.byteOrder = true;
    options.version101 = false;
    options.sopc = false;
    options.scan = false;
    options.handleEmpty = false;
    options.vramTransfer = false;
    options.mappingType = 0;
    options.encodeMode = 0;
    options.convertTo4Bpp = false;

    for (int i = 3; i < argc; i++)
    {
        char *option = argv[i];

        if (strcmp(option, "-num_tiles") == 0)
        {
            if (i + 1 >= argc)
                FATAL_ERROR("No number of tiles following \"-num_tiles\".\n");

            i++;

            if (!ParseNumber(argv[i], NULL, 10, &options.numTiles))
                FATAL_ERROR("Failed to parse number of tiles.\n");

            if (options.numTiles < 1)
                FATAL_ERROR("Number of tiles must be positive.\n");
        } else if (strcmp(option, "-cell") == 0) {
            if (i + 1 >= argc) {
                FATAL_ERROR("No cell file path following \"-cell\".\n");
            }

            i++;

            options.cellFilePath = argv[i];

            if (i + 1 < argc) {
                if (strcmp(argv[i + 1], "-nosnap") == 0) {
                    options.cellSnap = false;
                    i++;
                }
            }
        } else if (strcmp(option, "-mwidth") == 0 || strcmp(option, "-cpc") == 0) {
            if (i + 1 >= argc)
                FATAL_ERROR("No columns per chunk value following \"%s\".\n", option);

            i++;

            if (!ParseNumber(argv[i], NULL, 10, &options.colsPerChunk))
                FATAL_ERROR("Failed to parse columns per chunk.\n");

            if (options.colsPerChunk < 1)
                FATAL_ERROR("columns per chunk must be positive.\n");
        } else if (strcmp(option, "-mheight") == 0 || strcmp(option, "-rpc") == 0) {
            if (i + 1 >= argc)
                FATAL_ERROR("No rows per chunk value following \"%s\".\n", option);

            i++;

            if (!ParseNumber(argv[i], NULL, 10, &options.rowsPerChunk))
                FATAL_ERROR("Failed to parse rows per chunk.\n");

            if (options.rowsPerChunk < 1)
                FATAL_ERROR("rows per chunk must be positive.\n");
        } else if (strcmp(option, "-bitdepth") == 0) {
            if (i + 1 >= argc)
                FATAL_ERROR("No bitdepth value following \"-bitdepth\".\n");

            i++;

            if (!ParseNumber(argv[i], NULL, 10, &options.bitDepth))
                FATAL_ERROR("Failed to parse bitdepth.\n");

            if (options.bitDepth != 4 && options.bitDepth != 8)
                FATAL_ERROR("bitdepth must be either 4 or 8.\n");
        } else if (strcmp(option, "-clobbersize") == 0) {
            options.clobberSize = true;
        } else if (strcmp(option, "-nobyteorder") == 0) {
            options.byteOrder = false;
        } else if (strcmp(option, "-version101") == 0) {
            options.version101 = true;
        } else if (strcmp(option, "-sopc") == 0) {
            options.sopc = true;
        } else if (strcmp(option, "-scan") == 0) {
            options.scan = true;
        } else if (strcmp(option, "-scanned") == 0) {
            // maintained for compatibility
            if (options.encodeMode != 0) {
                FATAL_ERROR("Encode mode specified more than once.\n-encodebacktofront goes back to front as in DP, -encodefronttoback goes front to back as in PtHGSS\n");
            }
            options.encodeMode = 1;
            options.scan = true;
        } else if (strcmp(option, "-scanfronttoback") == 0) {
            // maintained for compatibility
            if (options.encodeMode != 0) {
                FATAL_ERROR("Encode mode specified more than once.\n-encodebacktofront goes back to front as in DP, -encodefronttoback goes front to back as in PtHGSS\n");
            }
            options.encodeMode = 2;
            options.scan = true;
        } else if (strcmp(option, "-encodebacktofront") == 0) {
            if (options.encodeMode != 0) {
                FATAL_ERROR("Encode mode specified more than once.\n-encodebacktofront goes back to front as in DP, -encodefronttoback goes front to back as in PtHGSS\n");
            }
            options.encodeMode = 1;
        } else if (strcmp(option, "-encodefronttoback") == 0) {
            if (options.encodeMode != 0) {
                FATAL_ERROR("Encode mode specified more than once.\n-encodebacktofront goes back to front as in DP, -encodefronttoback goes front to back as in PtHGSS\n");
            }
            options.encodeMode = 2;
        } else if (strcmp(option, "-wrongsize") == 0) {
            options.wrongSize = true;
        } else if (strcmp(option, "-handleempty") == 0) {
            options.handleEmpty = true;
        } else if (strcmp(option, "-vram") == 0) {
            options.vramTransfer = true;
        } else if (strcmp(option, "-mappingtype") == 0) {
            if (i + 1 >= argc)
                FATAL_ERROR("No mapping type value following \"-mappingtype\".\n");

            i++;

            if (!ParseNumber(argv[i], NULL, 10, &options.mappingType))
                FATAL_ERROR("Failed to parse mapping type.\n");

            if (options.mappingType != 0 && options.mappingType != 32 && options.mappingType != 64 && options.mappingType != 128 && options.mappingType != 256)
                FATAL_ERROR("bitdepth must be one of the following: 0, 32, 64, 128, or 256\n");
        } else if (strcmp(option, "-convertTo4Bpp") == 0) {
            options.convertTo4Bpp = true;
        } else {
            FATAL_ERROR("Unrecognized option \"%s\".\n", option);
        }
    }

    ConvertPngToNtr(inputPath, outputPath, &options);
}

void HandlePngToNtrLzCommand(char *inputPath, char *outputPath, int argc, char **argv) {
    int numLzArgs = CountLzCompressArgs(argc, argv);

    HandlePngToNtrCommand(inputPath, outputPath, argc - numLzArgs, argv);

    HandleLZCompressCommand(outputPath, outputPath, 3 + numLzArgs, &(argv[argc - 3 - numLzArgs]));
}

void HandlePngToGbaPaletteCommand(char *inputPath, char *outputPath, int argc UNUSED, char **argv UNUSED)
{
    struct Palette palette;

    ReadPngPalette(inputPath, &palette);
    WriteGbaPalette(outputPath, &palette);
}

void HandlePngToNtrPaletteCommand(char *inputPath, char *outputPath, int argc, char **argv)
{
    struct Palette palette;
    bool ncpr = false;
    bool ir = false;
    bool nopad = false;
    int bitdepth = 0;
    int compNum = 0;
    int pcmpStartIndex = 0;
    bool pcmp = false;
    bool inverted = false;
    bool convertTo4Bpp = false;

    for (int i = 3; i < argc; i++)
    {
        char *option = argv[i];

        if (strcmp(option, "-ncpr") == 0)
        {
            ncpr = true;
        }
        else if (strcmp(option, "-ir") == 0)
        {
            ir = true;
        }
        else if (strcmp(option, "-nopad") == 0)
        {
            nopad = true;
        }
        else if (strcmp(option, "-bitdepth") == 0)
        {
            if (i + 1 >= argc)
                FATAL_ERROR("No bitdepth following \"-bitdepth\".\n");

            i++;

            if (!ParseNumber(argv[i], NULL, 10, &bitdepth))
                FATAL_ERROR("Failed to parse bitdepth.\n");

            if (bitdepth != 4 && bitdepth != 8)
                FATAL_ERROR("Bitdepth must be 4 or 8.\n");
        }
        else if (strcmp(option, "-comp") == 0)
        {
            if (i + 1 >= argc)
                FATAL_ERROR("No compression value following \"-comp\".\n");

            i++;

            if (!ParseNumber(argv[i], NULL, 10, &compNum))
                FATAL_ERROR("Failed to parse compression value.\n");

            if (compNum > 255)
                FATAL_ERROR("Compression value must be 255 or below.\n");
        }
        else if (strcmp(option, "-pcmp") == 0)
        {
            pcmp = true;

            if (i + 2 < argc) {
                if (strcmp(argv[i + 1], "-start") == 0) {
                    i += 2;
                    if (!ParseNumber(argv[i], NULL, 10, &pcmpStartIndex)) {
                        FATAL_ERROR("Failed to parse PCMP start index value.\n");
                    }
                }
            }
        }
        else if (strcmp(option, "-invertsize") == 0)
        {
            inverted = true;
        } else if (strcmp(option, "-convertTo4Bpp") == 0) {
            convertTo4Bpp = true;
        } else {
            FATAL_ERROR("Unrecognized option \"%s\".\n", option);
        }
    }

    ReadPngPalette(inputPath, &palette);
    WriteNtrPalette(outputPath, &palette, ncpr, ir, bitdepth, !nopad, compNum, pcmp, pcmpStartIndex, inverted, convertTo4Bpp);
}

void HandleGbaToJascPaletteCommand(char *inputPath, char *outputPath, int argc UNUSED, char **argv UNUSED)
{
    struct Palette palette;

    ReadGbaPalette(inputPath, &palette);
    WriteJascPalette(outputPath, &palette);
}

void HandleNtrToJascPaletteCommand(char *inputPath, char *outputPath, int argc, char **argv)
{
    struct Palette palette;
    int bitdepth = 0;
    bool inverted = false;

    for (int i = 3; i < argc; i++)
    {
        char *option = argv[i];

        if (strcmp(option, "-bitdepth") == 0)
        {
            if (i + 1 >= argc)
                FATAL_ERROR("No bitdepth following \"-bitdepth\".\n");

            i++;

            if (!ParseNumber(argv[i], NULL, 10, &bitdepth))
                FATAL_ERROR("Failed to parse bitdepth.\n");

            if (bitdepth != 4 && bitdepth != 8)
                FATAL_ERROR("Bitdepth must be 4 or 8.\n");
        }
        else if (strcmp(option, "-invertsize") == 0)
        {
            inverted = true;
        }
        else
        {
            FATAL_ERROR("Unrecognized option \"%s\".\n", option);
        }
    }

    ReadNtrPalette(inputPath, &palette, bitdepth, 0, inverted, false);
    WriteJascPalette(outputPath, &palette);
}

void HandleJascToGbaPaletteCommand(char *inputPath, char *outputPath, int argc, char **argv)
{
    int numColors = 0;

    for (int i = 3; i < argc; i++)
    {
        char *option = argv[i];

        if (strcmp(option, "-num_colors") == 0)
        {
            if (i + 1 >= argc)
                FATAL_ERROR("No number of colors following \"-num_colors\".\n");

            i++;

            if (!ParseNumber(argv[i], NULL, 10, &numColors))
                FATAL_ERROR("Failed to parse number of colors.\n");

            if (numColors < 1)
                FATAL_ERROR("Number of colors must be positive.\n");
        }
        else
        {
            FATAL_ERROR("Unrecognized option \"%s\".\n", option);
        }
    }

    struct Palette palette;

    ReadJascPalette(inputPath, &palette);

    if (numColors != 0)
        palette.numColors = numColors;

    WriteGbaPalette(outputPath, &palette);
}

void HandleJascToNtrPaletteCommand(char *inputPath, char *outputPath, int argc, char **argv)
{
    int numColors = 0;
    bool ncpr = false;
    bool ir = false;
    bool nopad = false;
    int bitdepth = 0;
    int compNum = 0;
    int pcmpStartIndex = 0;
    bool pcmp = false;
    bool inverted = false;

    for (int i = 3; i < argc; i++)
    {
        char *option = argv[i];

        if (strcmp(option, "-num_colors") == 0)
        {
            if (i + 1 >= argc)
                FATAL_ERROR("No number of colors following \"-num_colors\".\n");

            i++;

            if (!ParseNumber(argv[i], NULL, 10, &numColors))
                FATAL_ERROR("Failed to parse number of colors.\n");

            if (numColors < 1)
                FATAL_ERROR("Number of colors must be positive.\n");
        }
        else if (strcmp(option, "-bitdepth") == 0)
        {
            if (i + 1 >= argc)
                FATAL_ERROR("No bitdepth following \"-bitdepth\".\n");

            i++;

            if (!ParseNumber(argv[i], NULL, 10, &bitdepth))
                FATAL_ERROR("Failed to parse bitdepth.\n");

            if (bitdepth != 4 && bitdepth != 8)
                FATAL_ERROR("Bitdepth must be 4 or 8.\n");
        }
        else if (strcmp(option, "-comp") == 0)
        {
            if (i + 1 >= argc)
                FATAL_ERROR("No compression value following \"-comp\".\n");

            i++;

            if (!ParseNumber(argv[i], NULL, 10, &compNum))
                FATAL_ERROR("Failed to parse compression value.\n");

            if (compNum > 255)
                FATAL_ERROR("Compression value must be 255 or below.\n");
        }
        else if (strcmp(option, "-ncpr") == 0)
        {
            ncpr = true;
        }
        else if (strcmp(option, "-ir") == 0)
        {
            ir = true;
        }
        else if (strcmp(option, "-nopad") == 0)
        {
            nopad = true;
        }
        else if (strcmp(option, "-pcmp") == 0)
        {
            pcmp = true;

            if (i + 2 < argc) {
                if (strcmp(argv[i + 1], "-start") == 0) {
                    i += 2;
                    if (!ParseNumber(argv[i], NULL, 10, &pcmpStartIndex)) {
                        FATAL_ERROR("Failed to parse PCMP start index value.\n");
                    }
                }
            }
        }
        else if (strcmp(option, "-invertsize") == 0)
        {
            inverted = true;
        }
        else
        {
            FATAL_ERROR("Unrecognized option \"%s\".\n", option);
        }
    }

    struct Palette palette;

    ReadJascPalette(inputPath, &palette);

    if (numColors != 0)
        palette.numColors = numColors;

    WriteNtrPalette(outputPath, &palette, ncpr, ir, bitdepth, !nopad, compNum, pcmp, pcmpStartIndex, inverted, false);
}

void HandleJsonToNtrCellCommand(char *inputPath, char *outputPath, int argc UNUSED, char **argv UNUSED)
{
    struct JsonToCellOptions *options;

    options = ParseNCERJson(inputPath);

    WriteNtrCell(outputPath, options);

    FreeNCERCell(options);
}

void HandleJsonToNtrCellLzCommand(char *inputPath, char *outputPath, int argc, char **argv) {
    HandleJsonToNtrCellCommand(inputPath, outputPath, argc, argv);

    HandleLZCompressCommand(outputPath, outputPath, argc, argv);
}

void HandleNtrCellToJsonCommand(char *inputPath, char *outputPath, int argc UNUSED, char **argv UNUSED)
{
    struct JsonToCellOptions *options = malloc(sizeof(struct JsonToCellOptions));

    ReadNtrCell(inputPath, options);

    char *json = GetNCERJson(options);

    WriteWholeStringToFile(outputPath, json);

    FreeNCERCell(options);
}

void HandleNtrCellLzToJsonCommand(char *inputPath, char *outputPath, int argc UNUSED, char **argv UNUSED) {
    HandleLZDecompressCommand(inputPath, outputPath, argc, argv);

    HandleNtrCellToJsonCommand(outputPath, outputPath, argc, argv);
}

void HandleJsonToNtrScreenCommand(char *inputPath, char *outputPath, int argc UNUSED, char **argv UNUSED)
{
    struct JsonToScreenOptions *options;

    options = ParseNSCRJson(inputPath);

    int bitdepth = 4;

    for (int i = 3; i < argc; i++)
    {
        char *option = argv[i];

        if (strcmp(option, "-bitdepth") == 0)
        {
            if (i + 1 >= argc)
                FATAL_ERROR("No bitdepth following \"-bitdepth\".\n");

            i++;

            if (!ParseNumber(argv[i], NULL, 10, &bitdepth))
                FATAL_ERROR("Failed to parse bitdepth.\n");

            if (bitdepth != 4 && bitdepth != 8)
                FATAL_ERROR("Bitdepth must be 4 or 8.\n");
        }
        else
        {
            FATAL_ERROR("Unrecognized option \"%s\".\n", option);
        }
    }

    options->bitdepth = bitdepth;

    WriteNtrScreen(outputPath, options);

    FreeNSCRScreen(options);
}

void HandleJsonToNtrAnimationCommand(char *inputPath, char *outputPath, int argc UNUSED, char **argv UNUSED)
{
    struct JsonToAnimationOptions *options;

    options = ParseNANRJson(inputPath);

    options->multiCell = false;

    WriteNtrAnimation(outputPath, options);

    FreeNANRAnimation(options);
}

void HandleJsonToNtrAnimationLzCommand(char *inputPath, char *outputPath, int argc, char **argv) {
    HandleJsonToNtrAnimationCommand(inputPath, outputPath, argc, argv);

    HandleLZCompressCommand(outputPath, outputPath, argc, argv);
}

void HandleNtrAnimationToJsonCommand(char *inputPath, char *outputPath, int argc UNUSED, char **argv UNUSED)
{
    struct JsonToAnimationOptions *options = malloc(sizeof(struct JsonToAnimationOptions));

    ReadNtrAnimation(inputPath, options);

    char *json = GetNANRJson(options);

    WriteWholeStringToFile(outputPath, json);

    FreeNANRAnimation(options);
}

void HandleNtrAnimationLzToJsonCommand(char *inputPath, char *outputPath, int argc UNUSED, char **argv UNUSED) {
    HandleLZDecompressCommand(inputPath, outputPath, argc, argv);

    HandleNtrAnimationToJsonCommand(outputPath, outputPath, argc, argv);
}

void HandleJsonToNtrMulticellAnimationCommand(char *inputPath, char *outputPath, int argc UNUSED, char **argv UNUSED)
{
    struct JsonToAnimationOptions *options;

    options = ParseNANRJson(inputPath);

    options->multiCell = true;

    WriteNtrAnimation(outputPath, options);

    FreeNANRAnimation(options);
}

void HandleLatinFontToPngCommand(char *inputPath, char *outputPath, int argc UNUSED, char **argv UNUSED)
{
    struct Image image;

    ReadLatinFont(inputPath, &image);
    WritePng(outputPath, &image);

    FreeImage(&image);
}

void HandlePngToLatinFontCommand(char *inputPath, char *outputPath, int argc UNUSED, char **argv UNUSED)
{
    struct Image image;

    image.bitDepth = 2;

    ReadPng(inputPath, &image);
    WriteLatinFont(outputPath, &image);

    FreeImage(&image);
}

void HandleHalfwidthJapaneseFontToPngCommand(char *inputPath, char *outputPath, int argc UNUSED, char **argv UNUSED)
{
    struct Image image;

    ReadHalfwidthJapaneseFont(inputPath, &image);
    WritePng(outputPath, &image);

    FreeImage(&image);
}

void HandlePngToHalfwidthJapaneseFontCommand(char *inputPath, char *outputPath, int argc UNUSED, char **argv UNUSED)
{
    struct Image image;

    image.bitDepth = 2;

    ReadPng(inputPath, &image);
    WriteHalfwidthJapaneseFont(outputPath, &image);

    FreeImage(&image);
}

void HandleFullwidthJapaneseFontToPngCommand(char *inputPath, char *outputPath, int argc UNUSED, char **argv UNUSED)
{
    struct Image image;

    ReadFullwidthJapaneseFont(inputPath, &image);
    WritePng(outputPath, &image);

    FreeImage(&image);
}

void HandlePngToFullwidthJapaneseFontCommand(char *inputPath, char *outputPath, int argc UNUSED, char **argv UNUSED)
{
    struct Image image;

    image.bitDepth = 2;

    ReadPng(inputPath, &image);
    WriteFullwidthJapaneseFont(outputPath, &image);

    FreeImage(&image);
}

static int CountLzCompressArgs(int argc, char **argv) {
    int count = 0;

    for (int i = 3; i < argc; i++) {
        char *option = argv[i];

        if (strcmp(option, "-overflow") == 0) {
            if (i + 1 >= argc) {
                FATAL_ERROR("No size following \"-overflow\".\n");
            }

            i++;

            count += 2;
        } else if (strcmp(option, "-search") == 0) {
            if (i + 1 >= argc) {
                FATAL_ERROR("No size following \"-overflow\".\n");
            }

            i++;

            count += 2;
        } else if (strcmp(option, "-reverse") == 0) {
            count++;
        } else if (strcmp(option, "-nopad") == 0) {
            count++;
        }
    }

    return count;
}

static void HandleLZCompressCommand(char *inputPath, char *outputPath, int argc, char **argv) {
    int overflowSize = 0;
    int minDistance = 2; // default, for compatibility with LZ77UnCompVram()
    bool forwardIteration = true;
    bool extFormat = false;
    bool nopad = false;

    for (int i = 3; i < argc; i++)
    {
        char *option = argv[i];

        if (strcmp(option, "-overflow") == 0)
        {
            if (i + 1 >= argc)
                FATAL_ERROR("No size following \"-overflow\".\n");

            i++;

            if (!ParseNumber(argv[i], NULL, 10, &overflowSize))
                FATAL_ERROR("Failed to parse overflow size.\n");

            if (overflowSize < 1)
                FATAL_ERROR("Overflow size must be positive.\n");
        }
        else if (strcmp(option, "-search") == 0)
        {
            if (i + 1 >= argc)
                FATAL_ERROR("No size following \"-overflow\".\n");

            i++;

            if (!ParseNumber(argv[i], NULL, 10, &minDistance))
                FATAL_ERROR("Failed to parse LZ min search distance.\n");

            if (minDistance < 1)
                FATAL_ERROR("LZ min search distance must be positive.\n");
        }
        else if (strcmp(option, "-reverse") == 0)
        {
            forwardIteration = false;
        } else if (strcmp(option, "-extfmt") == 0) {
            extFormat = true;
        } else if (strcmp(option, "-nopad") == 0) {
            nopad = true;
        } else {
            FATAL_ERROR("Unrecognized option \"%s\".\n", option);
        }
    }

    // The overflow option allows a quirk in some of Ruby/Sapphire's tilesets
    // to be reproduced. It works by appending a number of zeros to the data
    // before compressing it and then amending the LZ header's size field to
    // reflect the expected size. This will cause an overflow when decompressing
    // the data.

    int fileSize;
    unsigned char *buffer = ReadWholeFileZeroPadded(inputPath, &fileSize, overflowSize);

    int compressedSize;
    unsigned char *compressedData = LZCompress(buffer, fileSize + overflowSize, &compressedSize, minDistance, forwardIteration, !nopad, extFormat);

    compressedData[1] = (unsigned char)fileSize;
    compressedData[2] = (unsigned char)(fileSize >> 8);
    compressedData[3] = (unsigned char)(fileSize >> 16);

    free(buffer);

    WriteWholeFile(outputPath, compressedData, compressedSize);

    free(compressedData);
}

static void HandleLZDecompressCommand(char *inputPath, char *outputPath, int argc UNUSED, char **argv UNUSED) {
    int fileSize;
    unsigned char *buffer = ReadWholeFile(inputPath, &fileSize);

    int uncompressedSize;
    unsigned char *uncompressedData = LZDecompress(buffer, fileSize, &uncompressedSize);

    free(buffer);

    WriteWholeFile(outputPath, uncompressedData, uncompressedSize);

    free(uncompressedData);
}

void HandleRLCompressCommand(char *inputPath, char *outputPath, int argc UNUSED, char **argv UNUSED)
{
    int fileSize;
    unsigned char *buffer = ReadWholeFile(inputPath, &fileSize);

    int compressedSize;
    unsigned char *compressedData = RLCompress(buffer, fileSize, &compressedSize);

    free(buffer);

    WriteWholeFile(outputPath, compressedData, compressedSize);

    free(compressedData);
}

void HandleRLDecompressCommand(char *inputPath, char *outputPath, int argc UNUSED, char **argv UNUSED)
{
    int fileSize;
    unsigned char *buffer = ReadWholeFile(inputPath, &fileSize);

    int uncompressedSize;
    unsigned char *uncompressedData = RLDecompress(buffer, fileSize, &uncompressedSize);

    free(buffer);

    WriteWholeFile(outputPath, uncompressedData, uncompressedSize);

    free(uncompressedData);
}

void HandleHuffCompressCommand(char *inputPath, char *outputPath, int argc, char **argv)
{
    int fileSize;
    int bitDepth = 4;

    for (int i = 3; i < argc; i++)
    {
        char *option = argv[i];

        if (strcmp(option, "-depth") == 0)
        {
            if (i + 1 >= argc)
                FATAL_ERROR("No size following \"-depth\".\n");

            i++;

            if (!ParseNumber(argv[i], NULL, 10, &bitDepth))
                FATAL_ERROR("Failed to parse bit depth.\n");

            if (bitDepth != 4 && bitDepth != 8)
                FATAL_ERROR("GBA only supports bit depth of 4 or 8.\n");
        }
        else
        {
            FATAL_ERROR("Unrecognized option \"%s\".\n", option);
        }
    }

    unsigned char *buffer = ReadWholeFile(inputPath, &fileSize);

    int compressedSize;
    unsigned char *compressedData = HuffCompress(buffer, fileSize, &compressedSize, bitDepth);

    free(buffer);

    WriteWholeFile(outputPath, compressedData, compressedSize);

    free(compressedData);
}

void HandleHuffDecompressCommand(char *inputPath, char *outputPath, int argc UNUSED, char **argv UNUSED)
{
    int fileSize;
    unsigned char *buffer = ReadWholeFile(inputPath, &fileSize);

    int uncompressedSize;
    unsigned char *uncompressedData = HuffDecompress(buffer, fileSize, &uncompressedSize);

    free(buffer);

    WriteWholeFile(outputPath, uncompressedData, uncompressedSize);

    free(uncompressedData);
}

void HandleNtrFontToPngCommand(char *inputPath, char *outputPath, int argc, char **argv)
{
    struct NtrFontOptions options;
    options.metadataFilePath = NULL;
    options.useSubscreenPalette = false;

    for (int i = 3; i < argc; i++)
    {
        char *option = argv[i];

        if (strcmp(option, "-metadata") == 0)
        {
            if (i + 1 >= argc)
                FATAL_ERROR("No file path following \"-metadata\".\n");

            options.metadataFilePath = argv[++i];
        }
        else if (strcmp(option, "-subscreen") == 0)
        {
            options.useSubscreenPalette = true;
        }
    }

    if (options.metadataFilePath == NULL)
        FATAL_ERROR("No file path given for \"-metadata\".\n");

    struct Image image;
    struct NtrFontMetadata metadata;
    ReadNtrFont(inputPath, &image, &metadata, options.useSubscreenPalette);
    WritePng(outputPath, &image);

    char *metadataJson = GetNtrFontMetadataJson(&metadata);
    WriteWholeStringToFile(options.metadataFilePath, metadataJson);

    free(metadata.glyphWidthTable);
    FreeImage(&image);
}

void HandlePngToNtrFontCommand(char *inputPath, char *outputPath, int argc, char **argv)
{
    struct NtrFontOptions options;
    options.metadataFilePath = NULL;

    for (int i = 3; i < argc; i++)
    {
        char *option = argv[i];

        if (strcmp(option, "-metadata") == 0)
        {
            if (i + 1 >= argc)
                FATAL_ERROR("No file path following \"-metadata\".\n");

            options.metadataFilePath = argv[++i];
        }
    }

    if (options.metadataFilePath == NULL)
        FATAL_ERROR("No file path given for \"-metadata\".\n");

    struct NtrFontMetadata *metadata = ParseNtrFontMetadataJson(options.metadataFilePath);
    struct Image image = { .bitDepth = 2 };

    ReadPng(inputPath, &image);
    WriteNtrFont(outputPath, &image, metadata);

    FreeNtrFontMetadata(metadata);
    FreeImage(&image);
}

int main(int argc, char **argv)
{
    if (argc < 3)
        FATAL_ERROR("Usage: nitrogfx INPUT_PATH OUTPUT_PATH [options...]\n");

    struct CommandHandler handlers[] = {
        { "1bpp",      "png",       HandleGbaToPngCommand                    },
        { "4bpp",      "png",       HandleGbaToPngCommand                    },
        { "8bpp",      "png",       HandleGbaToPngCommand                    },
        { "nbfc",      "png",       HandleGbaToPngCommand                    },
        { "NCGR",      "png",       HandleNtrToPngCommand                    },
        { "NCGR.lz",   "png",       HandleNtrLzToPngCommand                  },
        { "png",       "1bpp",      HandlePngToGbaCommand                    },
        { "png",       "4bpp",      HandlePngToGbaCommand                    },
        { "png",       "nbfc",      HandlePngToGbaCommand                    },
        { "png",       "8bpp",      HandlePngToGbaCommand                    },
        { "png",       "NCGR",      HandlePngToNtrCommand                    },
        { "png",       "NCGR.lz",   HandlePngToNtrLzCommand                  },
        { "png",       "gbapal",    HandlePngToGbaPaletteCommand             },
        { "png",       "nbfp",      HandlePngToGbaPaletteCommand             },
        { "png",       "NCLR",      HandlePngToNtrPaletteCommand             },
        { "gbapal",    "pal",       HandleGbaToJascPaletteCommand            },
        { "NCLR",      "pal",       HandleNtrToJascPaletteCommand            },
        { "NCPR",      "pal",       HandleNtrToJascPaletteCommand            },
        { "pal",       "gbapal",    HandleJascToGbaPaletteCommand            },
        { "pal",       "NCLR",      HandleJascToNtrPaletteCommand            },
        { "latfont",   "png",       HandleLatinFontToPngCommand              },
        { "png",       "latfont",   HandlePngToLatinFontCommand              },
        { "hwjpnfont", "png",       HandleHalfwidthJapaneseFontToPngCommand  },
        { "png",       "hwjpnfont", HandlePngToHalfwidthJapaneseFontCommand  },
        { "fwjpnfont", "png",       HandleFullwidthJapaneseFontToPngCommand  },
        { "png",       "fwjpnfont", HandlePngToFullwidthJapaneseFontCommand  },
        { "json",      "NCER",      HandleJsonToNtrCellCommand               },
        { "json",      "NCER.lz",   HandleJsonToNtrCellLzCommand             },
        { "NCER",      "json",      HandleNtrCellToJsonCommand               },
        { "NCER.lz",   "json",      HandleNtrCellLzToJsonCommand             },
        { "json",      "NSCR",      HandleJsonToNtrScreenCommand             },
        { "json",      "NANR",      HandleJsonToNtrAnimationCommand          },
        { "json",      "NANR.lz",   HandleJsonToNtrAnimationLzCommand        },
        { "NANR",      "json",      HandleNtrAnimationToJsonCommand          },
        { "NANR.lz",   "json",      HandleNtrAnimationLzToJsonCommand        },
        { "json",      "NMAR",      HandleJsonToNtrMulticellAnimationCommand },
        { "NMAR",      "json",      HandleNtrAnimationToJsonCommand          },
        { NULL,        "huff",      HandleHuffCompressCommand                },
        { NULL,        "lz",        HandleLZCompressCommand                  },
        { "huff",      NULL,        HandleHuffDecompressCommand              },
        { "lz",        NULL,        HandleLZDecompressCommand                },
        { NULL,        "rl",        HandleRLCompressCommand                  },
        { "rl",        NULL,        HandleRLDecompressCommand                },
        { "NFGR",      "png",       HandleNtrFontToPngCommand                },
        { "png",       "NFGR",      HandlePngToNtrFontCommand                },
        { NULL,        NULL,        NULL                                     }
    };

    char *inputPath = argv[1];
    char *outputPath = argv[2];
    char *inputFileExtension = GetFileExtension(inputPath);
    char *outputFileExtension = GetFileExtension(outputPath);

    if (inputFileExtension == NULL)
        FATAL_ERROR("Input file \"%s\" has no extension.\n", inputPath);

    if (outputFileExtension == NULL)
        FATAL_ERROR("Output file \"%s\" has no extension.\n", outputPath);

    for (int i = 0; handlers[i].function != NULL; i++)
    {
        if (((handlers[i].inputFileExtension == NULL || strcmp(handlers[i].inputFileExtension, inputFileExtension) == 0)
                && (handlers[i].outputFileExtension == NULL || strcmp(handlers[i].outputFileExtension, outputFileExtension) == 0))
            || (handlers[i].inputFileExtension == NULL && strrchr(outputFileExtension, '.') && strstr(outputFileExtension, handlers[i].outputFileExtension))
            || (handlers[i].outputFileExtension == NULL && strrchr(inputFileExtension, '.') && strstr(inputFileExtension, handlers[i].inputFileExtension))) {
            handlers[i].function(inputPath, outputPath, argc, argv);
            return 0;
        }
    }

    FATAL_ERROR("Don't know how to convert \"%s\" to \"%s\".\n", inputPath, outputPath);
}
