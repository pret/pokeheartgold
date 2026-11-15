# NitroBTX

Program to dump and create NDS NSBTX files.

Currently supports dumping texture formats 1 to 7, but excluding 5, and writing formats 2, 3, 4 and 7.

# How to use:

```
Usage:
 nitrobtx pack [-t INPUT_FILE [texture options]]... [-p INPUT_FILE [palette options]]... OUTPUT_FILE
 nitrobtx dump INPUT_FILE OUTPUT_DIR
 nitrobtx dump --spritesheet [--palettes-dir OUTPUT_DIR] INPUT_FILE OUTPUT_FILE
 nitrobtx merge [--sort] INPUT_FILE... OUTPUT_FILE

General options:
 --help, -h                   Print this help message.
 --version, -V                Print the current version.

Pack options:

 --texture <path>, -t <path>  Path to a PNG to make into an NSBTX texture.
 --palette <path>, -p <path>  Path to a JASC-PAL file to make into an NSBTX palette.

  Texture options:

 --name <name>, -n <name>     The name to use for the texture in the output NSBTX. Determined from
                              the file name if not passed. If '--spritesheet' is passed, this is
                              used as a base name, and gets a frame number appended.
 --names-file <path>,         For spritesheet textures, a file to pull the texture names from. One
  -N <path>                   name per line, lines longer than 16 characters will get truncated.
 --format <format>,           The texture format to use. One of '2bpp', '4bpp', '8bpp' or
  -f <format>                 'direct-color'.
 --transparent, -T            For texture formats '2bpp', '4bpp' and '8bpp', makes the color with
                              index 0 transparent.
 --no-transparent, -O         Opposite of '--transparent', makes the color with index 0 explicitly
                              not transparent.
                              If neither '--transparent' not '--no-transparent' is passed, the
                              color with index 0 is transparent if the file contains a tRNS chunk.
 --spritesheet, -s            Treat the input PNG as a vertical spritesheet. Requires exactly one of
                              '--num-frames' or '--frame-height'.
 --num-frames <n>, -F <n>     The number of frames the associated spritesheet contains.
 --frame-height <h>, -H <h>   The height in pixels of each frame in the associated spritesheet.
 --extract-palette, -e        Extracts the palette from the associated texture to an NSBTX palette.
                              To be followed with palette options.

  Palette options:

 --name <name>, -n <name>     The name to use for the texture in the output NSBTX. Determined from
                              the file name if not passed. If '--repeat-texture' is passed, this is
                              used as a base name, and gets a frame number appended.
 --repeat-palette, -r         For palettes from a spritesheet PNG, repeat the palette as many times
                              as the number of frames in the spritesheet.
 --combined-palette           For palettes from a spritesheet PNG, split the palette into as many
                              parts as the number of frames in the spritesheet.


Dump options:

 --spritesheet, -s            Treat the input NSBTX as a spritesheet. Dumps all textures to a single
                              PNG file with the textures layed out vertically.
 --palettes-dir <path>,       If '--spritesheet' is passed, a directory to dump the individual
  -d <path>                   palettes into.
 --combined-palette, -c       If '--spritesheet' is passed, combine all the palettes in the input
                              into a single PNG and applies the corresponding colors to each frame.
                              Requires the number of textures and the number of palettes to be equal.
```
