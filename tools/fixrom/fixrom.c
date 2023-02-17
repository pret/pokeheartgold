#include <stdlib.h>
#include <stdio.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>
#include <stdnoreturn.h>
#include <stdarg.h>

#define HEADER_SIZE 0x4000

uint8_t RomHeader[HEADER_SIZE];

static inline noreturn __attribute__((format(printf, 1, 2))) void fatal_error(const char * message, ...)
{
    va_list va_args;
    va_start(va_args, message);
    fputs("Error: ", stderr);
    vfprintf(stderr, message, va_args);
    fputc('\n', stderr);
    va_end(va_args);
    exit(EXIT_FAILURE);
}

static inline void OffsetCheck(int offset)
{
    if (offset < 0 || offset >= HEADER_SIZE)
    {
        fatal_error("illegal access to header+%d", offset);
    }
}

static inline uint16_t HeaderReadU16LE(int offset)
{
    OffsetCheck(offset);
    return RomHeader[offset] |
        (RomHeader[offset + 1] << 8);
}

static inline uint32_t HeaderReadU32LE(int offset)
{
    OffsetCheck(offset);
    return RomHeader[offset] |
        (RomHeader[offset + 1] << 8) |
        (RomHeader[offset + 2] << 16) |
        (RomHeader[offset + 3] << 24);
}

static inline void HeaderWriteU16LE(int offset, uint16_t value)
{
    OffsetCheck(offset);
    RomHeader[offset] = value;
    RomHeader[offset + 1] = value >> 8;
}
static inline void HeaderWriteU32LE(int offset, uint32_t value)
{
    OffsetCheck(offset);
    RomHeader[offset] = value;
    RomHeader[offset + 1] = value >> 8;
    RomHeader[offset + 2] = value >> 16;
    RomHeader[offset + 3] = value >> 24;
}

static uint16_t Calc_CRC16(uint8_t * data, size_t length, uint16_t crc)
{
    static uint16_t CrcTable[16] = {
        0x0000,
        0xCC01,
        0xD801,
        0x1400,
        0xF001,
        0x3C00,
        0x2800,
        0xE401,
        0xA001,
        0x6C00,
        0x7800,
        0xB401,
        0x5000,
        0x9C01,
        0x8801,
        0x4400,
    };

    uint16_t x = 0;
    uint16_t y;
    uint16_t bit = 0;
    uint8_t * end = data + length;
    while (data < end)
    {
        if (bit == 0)
        {
            x = data[0] | (data[1] << 8);
        }
        y = CrcTable[crc & 15];
        crc >>= 4;
        crc ^= y;
        y = CrcTable[(x >> bit) & 15];
        crc ^= y;
        bit += 4;
        if (bit == 16)
        {
            data += 2;
            bit = 0;
        }
    }
    return crc;
}

int main(int argc, char ** argv)
{
    uint16_t secure_crc = 0xFFFF;
    char game_code[4] = "NTRJ";
    int override_crc = 0;
    int override_code = 0;
    FILE * rom = NULL;

    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "--secure-crc") == 0)
        {
            if (override_crc)
            {
                fatal_error("multiple --secure-crc options specified");
            }
            char * endptr;
            unsigned long secure_crc_l = strtoul(argv[++i], &endptr, 0);
            if (secure_crc_l == 0 && endptr == argv[i])
            {
                fatal_error("argument to --secure-crc must be an integer");
            }
            if (secure_crc_l >= 0x10000)
            {
                fatal_error("argument to --secure-crc must be a 16-bit integer");
            }
            secure_crc = secure_crc_l;
            override_crc = 1;
        }
        else if (strcmp(argv[i], "--game-code") == 0)
        {
            if (override_code)
            {
                fatal_error("multiple --game-code options specified");
            }
            if (strlen(argv[++i]) > 4)
            {
                fatal_error("argument to --game-code must be 4 characters or fewer");
            }
            strncpy(game_code, argv[i], 4);
            override_code = 1;
        }
        else
        {
            if (rom != NULL)
            {
                fatal_error("unrecognized %s argument: %s", argv[i][0] == '-' ? "flag" : "positional", argv[i]);
            }
            rom = fopen(argv[i], "r+b");
            if (rom == NULL)
            {
                fatal_error(argv[i][0] == '-' ? "unrecognized flag argument: %s" : "unable to open file '%s' for reading", argv[i]);
            }
        }
    }

    if (fread(RomHeader, 1, HEADER_SIZE, rom) != HEADER_SIZE)
    {
        fatal_error("error reading the ROM header");
    }

    if (override_crc)
    {
        HeaderWriteU16LE(0x6C, secure_crc);
    }

    if (override_code)
    {
        memcpy(RomHeader + 0xC, game_code, 4);
    }

    uint16_t header_crc = Calc_CRC16((uint8_t *)RomHeader, 0x15E, 0xFFFF);
    HeaderWriteU16LE(0x15E, header_crc);

    fseek(rom, 0, SEEK_SET);
    if (fwrite(RomHeader, 1, HEADER_SIZE, rom) != HEADER_SIZE)
    {
        fatal_error("error writing the ROM header");
    }

    fclose(rom);
    return EXIT_SUCCESS;
}
