#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include <stdlib.h>

// mwasmarm patcher v1.2
// Patches the Metrowerk C compiler assembler to stop the line ending bug and the 0x400 incbin bug.

// Changelog:
// v1.1: Added patch definitions and looped over them to find the matching
// definition as well as the version.
// v1.2: Switched to array system for applying multiple patches for compiler
// versions and added 0x400 incbin fix for each version.

struct PatchPair {
    int offsetPatch;
    int newByte;
};

struct PatchDef {
    char *version;
    char *sha1before;
    char *sha1after;
    struct PatchPair *patches;
};

// Patch definitions for each of the respective assembler versions.
struct PatchPair g12BasePatches[] = {
    { 0x57614, 0x5  },
    { 0xD47,   0x8D },
    {0}
};

struct PatchPair g20BasePatches[] = {
    { 0x57644, 0x5  },
    { 0xD47,   0x8D },
    {0}
};

struct PatchPair g20sp2p4Patches[] = {
    { 0x57834, 0x5  },
    { 0xD47,   0x8D },
    {0}
};

// Table of definitions for each assembler version
struct PatchDef gPatchDefs[] = {
    // mwasmarm 1.2/base definition
    {
        "mwasmarm 1.2/base",
        "87f942cc0a0e90e73550d8d6f3fffcdeb5f69fa5",
        "3395ac5decf49135d892e93a3e6dd38676025983",
        g12BasePatches
    },
    // mwasmarm 2.0/base definition
    {
        "mwasmarm 2.0/base",
        "9d63877c776245129b4727b41d3e9e63cfc9cd28",
        "ef75c3fb9f8d90cb4881386c41d8dc3ab4de7153",
        g20BasePatches
    },
    // mwasmarm 2.0/sp2p4 definition
    {
        "mwasmarm 2.0/sp2p4",
        "448cb0c7f1ace4393e9a9562f819f7a9f049be83",
        "caa84dd90b1987ab7b42749bd5c9dcfdcfef59f3",
        g20sp2p4Patches
    },
    {0}
};

// ---------------------------------------------------------
// Credit to ax6 for implementation of sha1 hash functions
// ---------------------------------------------------------

void sha1_process_block (const unsigned char * block, uint32_t * state);

unsigned char * calculate_sha1 (const void * data, unsigned length) {
  uint32_t state[5] = {0x67452301, 0xefcdab89, 0x98badcfe, 0x10325476, 0xc3d2e1f0};
  const char * current;
  unsigned remaining;
  for (current = data, remaining = length; remaining >= 64; current += 64, remaining -= 64) sha1_process_block((const uint8_t *)current, state);
  // technically only {0} is necessary, but better safe than sorry
  unsigned char last_block[64] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
  memcpy(last_block, current, remaining);
  last_block[remaining] = 0x80;
  if (remaining >= 56) {
    sha1_process_block(last_block, state);
    memset(last_block, 0, 64);
  }
  unsigned long long bit_length = ((unsigned long long) length) << 3;
  for (remaining = 5; remaining; remaining --) {
    last_block[58 + remaining] = bit_length;
    bit_length >>= 8;
  }
  sha1_process_block(last_block, state);
  unsigned char * result = malloc(20);
  for (remaining = 0; remaining < 20; remaining ++) result[remaining] = state[remaining >> 2] >> ((~remaining & 3) << 3);
  return result;
}

static inline unsigned sha1_rotate (unsigned value, unsigned count) {
  return (value << count) | (value >> (32 - count));
}

void sha1_process_block (const unsigned char * block, uint32_t * state) {
  uint32_t words[80];
  unsigned pos, temp, count, a, b, c, d, e;
  // constants used by SHA-1; they are actually simply the square roots of 2, 3, 5 and 10 as a fixed-point number (2.30 format)
  const uint32_t hash_constants[4] = {0x5a827999, 0x6ed9eba1, 0x8f1bbcdc, 0xca62c1d6};
  memset(words, 0, 16 * sizeof(uint32_t));
  for (pos = 0; pos < 64; pos ++) words[pos >> 2] = (words[pos >> 2] << 8) | block[pos];
  for (pos = 16; pos < 80; pos ++) words[pos] = sha1_rotate(words[pos - 3] ^ words[pos - 8] ^ words[pos - 14] ^ words[pos - 16], 1);
  a = *state;
  b = state[1];
  c = state[2];
  d = state[3];
  e = state[4];
  for (pos = 0; pos < 4; pos ++) for (count = 0; count < 20; count ++) {
    temp = sha1_rotate(a, 5) + e + words[pos * 20 + count] + hash_constants[pos];
    switch (pos) {
      case 0:
        temp += (b & c) | (~b & d);
        break;
      case 2:
        temp += (b & c) | (b & d) | (c & d);
        break;
      default:
        temp += b ^ c ^ d;
    }
    e = d;
    d = c;
    c = sha1_rotate(b, 30);
    b = a;
    a = temp;
  }
  *state += a;
  state[1] += b;
  state[2] += c;
  state[3] += d;
  state[4] += e;
}

// ---------------------------------------------------------
// ax6 code end
// ---------------------------------------------------------

__attribute__((format(printf, 1, 2)))
void fatal_printf(char *str, ...) {
    va_list args;
    va_start(args, str);
    vprintf(str, args);
    va_end(args);
    exit(1);
}

// return size in bytes
int get_file_size (FILE * fp) {
    int curpos = ftell(fp);
    fseek(fp, 0, SEEK_END);
    int result = ftell(fp);
    fseek(fp, curpos, SEEK_SET);
    return result;
}

#define SHA_DIGEST_LENGTH 20

void print_help(void) {
    printf("Usage:\n"
           "\tmwasmarm_patcher [OPTIONS] FILENAME\n\n"
           "Arguments:\n"
           "\tFILENAME: path to MWASMARM.exe program\n\n"
           "OPTIONS:\n"
           "\t-q/--quietly: Suppress verbose output\n"
           "\t-h/--help: Print this message and exit\n");
}

int main(int argc, char *argv[]) {
    int quietly = 0;
    char* filename = NULL;
    for (int i = 1; i < argc; i++)
    {
        if (argv[i][0] == '-') {
            if (strcmp(argv[i], "-q") == 0 || strcmp(argv[i], "--quietly") == 0)
                quietly = 1;
            else if (strcmp(argv[i], "-h") == 0 || strcmp(argv[i], "--help") == 0) {
                print_help();
                exit(0);
            }
            else
            {
                print_help();
                fatal_printf("Unrecognized option: %s\n", argv[i]);
            }
        } else if (filename != NULL) {
            print_help();
            fatal_printf("Excess filename supplied\n");
        }
        else
            filename = argv[i];
    }
    if (filename == NULL) {
        print_help();
        fatal_printf("Missing required argument: filename\n");
    } else {
        // Open the file and read it's sha1 hash.
        FILE *f = fopen(filename, "rb+");
        if (f == NULL) {
            fatal_printf("ERROR: No file detected\n");
        }
        int fsize = get_file_size(f);
        unsigned char *string = malloc(fsize + 1);
        if (string == NULL) {
            fatal_printf("ERROR: Failed to allocate string variable\n");
        }
        int readvar = fread(string, 1, fsize, f); // var to surpress warning

        // Check if sha1 matches either known assembler hashes.
        unsigned char *sha1 = calculate_sha1(string, fsize);
        if (sha1 == NULL) {
            fatal_printf("ERROR: Failed to retrieve sha1 hash\n");
        }
        free(string);

        char buf[(SHA_DIGEST_LENGTH*2)+1];
        for (int i=0; i < SHA_DIGEST_LENGTH; i++) {
            sprintf(&(buf[i*2]), "%02x", sha1[i]);
        }
        free(sha1);

        // loop over each patch definition to attempt to locate a supported version and, if
        // needed, apply the patch definitions.
        for (int i = 0; gPatchDefs[i].sha1before != NULL; i++) {
            // check if already patched for the current loop.
            if (!strcmp(buf, gPatchDefs[i].sha1after)) {
                if (!quietly) printf("Supported patched version detected (%s): no action needed\n", gPatchDefs[i].version);
                return 0;
            } else if(!strcmp(buf, gPatchDefs[i].sha1before)) {
                // we found an unpatched version: apply the patches.
                for (int j = 0; gPatchDefs[i].patches[j].offsetPatch != 0; j++) {
                    fseek(f, gPatchDefs[i].patches[j].offsetPatch, SEEK_SET);
                    fputc(gPatchDefs[i].patches[j].newByte, f);
                }
                if (!quietly) printf("Supported unpatched version detected (%s): assembler patched\n", gPatchDefs[i].version);
                return 0;
            }
        }
        // Unable to locate supported version, quitting
        fatal_printf("ERROR: Unsupported mwasmarm.exe version\n");
    }
    return 0;
}
