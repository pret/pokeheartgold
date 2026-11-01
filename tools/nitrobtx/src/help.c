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

#include "help.h"

#include <stdio.h>

void PrintVersion(FILE *out)
{
    fprintf(out, "nitrobtx 0.0.2\n");
}

void PrintUsage(FILE *out, char *progPath)
{
    PrintVersion(out);
    fprintf(out, "Usage:\n");
    fprintf(out, " %s pack [-t INPUT_FILE [texture options]]... [-p INPUT_FILE [palette options]]... OUTPUT_FILE\n", progPath);
    fprintf(out, " %s dump INPUT_FILE OUTPUT_DIR\n", progPath);
    fprintf(out, " %s dump --spritesheet [--palettes-dir OUTPUT_DIR] INPUT_FILE OUTPUT_FILE\n", progPath);
    fprintf(out, " %s merge [--sort] INPUT_FILE... OUTPUT_FILE\n", progPath);
    fprintf(out, "\n");
    fprintf(out, "General options:\n");
    fprintf(out, " --help, -h                   Print this help message.\n");
    fprintf(out, " --version, -V                Print the current version.\n");
    fprintf(out, "\n");
    fprintf(out, "Pack options:\n");
    fprintf(out, "\n");
    fprintf(out, " --texture <path>, -t <path>  Path to a PNG to make into an NSBTX texture.\n");
    fprintf(out, " --palette <path>, -p <path>  Path to a JASC-PAL file to make into an NSBTX palette.\n");
    fprintf(out, "\n");
    fprintf(out, "  Texture options:\n");
    fprintf(out, "\n");
    fprintf(out, " --name <name>, -n <name>     The name to use for the texture in the output NSBTX. Determined from\n");
    fprintf(out, "                              the file name if not passed. If '--spritesheet' is passed, this is\n");
    fprintf(out, "                              used as a base name, and gets a frame number appended.\n");
    fprintf(out, " --names-file <path>,         For spritesheet textures, a file to pull the texture names from. One\n");
    fprintf(out, "  -N <path>                   name per line, lines longer than 16 characters will get truncated.\n");
    fprintf(out, " --format <format>,           The texture format to use. One of '2bpp', '4bpp', '8bpp' or\n");
    fprintf(out, "  -f <format>                 'direct-color'.\n");
    fprintf(out, " --transparent, -T            For texture formats '2bpp', '4bpp' and '8bpp', makes the color with\n");
    fprintf(out, "                              index 0 transparent.\n");
    fprintf(out, " --no-transparent, -O         Opposite of '--transparent', makes the color with index 0 explicitly\n");
    fprintf(out, "                              not transparent.\n");
    fprintf(out, "                              If neither '--transparent' not '--no-transparent' is passed, the\n");
    fprintf(out, "                              color with index 0 is transparent if the file contains a tRNS chunk.\n");
    fprintf(out, " --spritesheet, -s            Treat the input PNG as a vertical spritesheet. Requires exactly one of\n");
    fprintf(out, "                              '--num-frames' or '--frame-height'.\n");
    fprintf(out, " --num-frames <n>, -F <n>     The number of frames the associated spritesheet contains.\n");
    fprintf(out, " --frame-height <h>, -H <h>   The height in pixels of each frame in the associated spritesheet.\n");
    // fprintf(out, " --transparency-map <path>,   For texture formats 'a3i5' and 'a5i3', the path to a grayscale PNG\n");
    // fprintf(out, "  -m <path>                   to be used as the alpha channel for the associated texture.\n");
    fprintf(out, " --extract-palette, -e        Extracts the palette from the associated texture to an NSBTX palette.\n");
    fprintf(out, "                              To be followed with palette options.\n");
    fprintf(out, "\n");
    fprintf(out, "  Palette options:\n");
    fprintf(out, "\n");
    fprintf(out, " --name <name>, -n <name>     The name to use for the texture in the output NSBTX. Determined from\n");
    fprintf(out, "                              the file name if not passed. If '--repeat-texture' is passed, this is\n");
    fprintf(out, "                              used as a base name, and gets a frame number appended.\n");
    fprintf(out, " --repeat-palette, -r         For palettes from a spritesheet PNG, repeat the palette as many times\n");
    fprintf(out, "                              as the number of frames in the spritesheet.\n");
    fprintf(out, " --combined-palette           For palettes from a spritesheet PNG, split the palette into as many\n");
    fprintf(out, "                              parts as the number of frames in the spritesheet.\n");
    fprintf(out, "\n");
    fprintf(out, "\n");
    fprintf(out, "Dump options:\n");
    fprintf(out, "\n");
    fprintf(out, " --spritesheet, -s            Treat the input NSBTX as a spritesheet. Dumps all textures to a single\n");
    fprintf(out, "                              PNG file with the textures layed out vertically.\n");
    fprintf(out, " --palettes-dir <path>,       If '--spritesheet' is passed, a directory to dump the individual\n");
    fprintf(out, "  -d <path>                   palettes into.\n");
    fprintf(out, " --combined-palette, -c       If '--spritesheet' is passed, combine all the palettes in the input\n");
    fprintf(out, "                              into a single PNG and applies the corresponding colors to each frame.\n");
    fprintf(out, "                              Requires the number of textures and the number of palettes to be equal.\n");
}
