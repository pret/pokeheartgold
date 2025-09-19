#include "rom_util.h"

#include "nitro_card.h"
#include "nitro_io_reg.h"
#include "nitro_os.h"

// Not actually available from standard Nitro includes
#define REG_CARD_MASTER_CNT_OFFSET (0x1A1)
#define REG_CARDCNT_OFFSET         (0x1A4)
#define REG_CARD_CMD_OFFSET        (0x1A8)
#define REG_CARD_DATA_OFFSET       (0x100010)

#define CARDMST_ENABLE (0x80)

#define CARD_DATA_READY   (0x00800000)
#define CARD_COMMAND_PAGE (0x01000000)
#define CARD_COMMAND_MASK (0x07000000)
#define CARD_RESET_HI     (0x20000000)
#define CARD_ACCESS_MODE  (0x40000000)
#define CARD_READ_MODE    (0x00000000)
#define CARD_START        (0x80000000)

#define MROMOP_G_READ_PAGE (0xB7000000)

// Functions to be encrypted (cannot be called directly)
void ROMUtil_Read(void *dest, u32 addr, s32 num_bytes);
u32 ROMUtil_CRC32(void *buf, u32 size);

void ROMUtil_Read(void *dest, u32 addr, s32 num_bytes) {
    // This function is executing an obfuscated manual cartridge ROM read.
    // Nitro SDK usually does this for you with CARD_ReadRom* and friends.
    //
    // https://problemkaputt.de/gbatek-ds-cartridge-protocol.htm
    //
    // Most/all convoluted syntax here must be that way to match.
    // Some of the comment documentation may be inaccurate here.

    REGType8v *vnull;
    u32 register_base_1;
    s32 addr_offset;
    u32 card_ctrl_13;
    REGType8v *register_base_2;
    u8 buffer[8];
    u8 *bufptr;
    u16 lock_id;
    u16 ext_mem_register_val_original;
    u32 output;
    s32 card_ctrl_cmd;
    int i;

    lock_id = OS_GetLockID();
    CARD_LockRom(lock_id);

    // Alias for volatile null pointer
    vnull = (REGType8v *)NULL;

    // Alias for register base (0x04000000)
    register_base_1 = 1;
    register_base_1 <<= 26;

    // Another alias for register base (0x04000000)
    register_base_2 = (REGType8v *)HW_REG_BASE;

    // External memory control register (0x04000204)
    // Save value to rewrite later
    ext_mem_register_val_original = reg_MI_EXMEMCNT;
    reg_MI_EXMEMCNT &= ~REG_MI_EXMEMCNT_MP_MASK;

    // Obfuscated, create address 0x027FFE60
    // This is an address in the ROM header: port 0x040001A4 / setting for normal commands
    card_ctrl_13 = 5;
    card_ctrl_13 <<= 18;
    card_ctrl_13 -= 13;

    // This is not a used location, should always read 0
    if (*(REGType8v *)(register_base_1 + 0x4000) & 1) {
        card_ctrl_13 |= 0x40000;
    }

    card_ctrl_13 <<= 5;

    // Read port setting and set page read flags
    card_ctrl_cmd = (*(vs32 *)card_ctrl_13 & ~CARD_COMMAND_MASK) | (CARD_COMMAND_PAGE | CARD_READ_MODE | CARD_START | CARD_RESET_HI);

    // Calculate offset to round back to nearest 0x200-byte block.
    // E.G. if we want to read starting from 0x1208, we actually need to
    // request the block at 0x1200 and then ignore the first 8 bytes of the result.
    // This would set `addr_offset` to -8.
    addr_offset = 0 - (addr & (CARD_ROM_PAGE_SIZE - 1));

    // Wait for card to not be busy
    while (*(REGType32v *)(register_base_1 + REG_CARDCNT_OFFSET) & CARD_START) {}

    // Write enable flag to card ROM and SPI control register
    *(REGType8v *)(register_base_1 + REG_CARD_MASTER_CNT_OFFSET) = CARDMST_ENABLE;

    // Obfuscated read 8-byte command out from gamecard bus, write this back later
    bufptr = &buffer[0];
    for (i = 0; i < 8; i++) {
        *bufptr++ = *(vnull + HW_REG_BASE + REG_CARD_CMD_OFFSET + i);
    }

    addr += addr_offset;

    while (addr_offset < num_bytes) {
        // Read a 0x200-byte data block from ROM

        // Write 8-byte command to registers
        // B7XXXXXXXX000000 -> 0x200-byte encrypted data read from address XXXXXXXX
        register_base_2[REG_CARD_CMD_OFFSET + 0] = MROMOP_G_READ_PAGE >> 24;
        register_base_2[REG_CARD_CMD_OFFSET + 1] = addr >> 24;
        register_base_2[REG_CARD_CMD_OFFSET + 2] = addr >> 16;
        register_base_2[REG_CARD_CMD_OFFSET + 3] = addr >> 8;
        register_base_2[REG_CARD_CMD_OFFSET + 4] = addr;
        register_base_2[REG_CARD_CMD_OFFSET + 5] = 0x00;
        register_base_2[REG_CARD_CMD_OFFSET + 6] = 0x00;
        register_base_2[REG_CARD_CMD_OFFSET + 7] = 0x00;

        // Submit command
        *(REGType32v *)(register_base_1 + REG_CARDCNT_OFFSET) = card_ctrl_cmd;

        // Copy the output into the destination buffer, within the bounds of num_bytes
        // (Must read the output out of the I/O register regardless)
        do {
            if (*(REGType32v *)(register_base_1 + REG_CARDCNT_OFFSET) & CARD_DATA_READY) {
                output = *(REGType32v *)(register_base_1 + REG_CARD_DATA_OFFSET);
                if (addr_offset >= 0 && addr_offset < num_bytes) {
                    *(u32 *)(dest + addr_offset) = output;
                }

                addr_offset += 4;
            }
        } while (*(REGType32v *)(register_base_1 + REG_CARDCNT_OFFSET) & CARD_START);

        // Advance address to next block
        addr += CARD_ROM_PAGE_SIZE;
    }

    // Write 8-byte command back to gamecard bus
    bufptr = &buffer[0];
    for (i = 0; i < 8; i++) {
        *(vnull + HW_REG_BASE + REG_CARD_CMD_OFFSET + i) = *bufptr++;
    }

    // Write original value back to to external memory control register
    *(REGType16v *)(register_base_1 + REG_EXMEMCNT_OFFSET) = ext_mem_register_val_original;

    CARD_UnlockRom(lock_id);
    OS_ReleaseLockID(lock_id);
}

u32 ROMUtil_CRC32(void *buf, u32 size) {
    s32 i;
    u8 *byteptr = (u8 *)buf;
    u32 crc = 0xFFFFFFFF;
    u32 poly = 0xEDB88320;
    while (size-- != 0) {
        crc ^= *byteptr++;
        for (i = 0; i < 8; i++) {
            if (crc & 1) {
                crc = (crc >> 1);
            } else {
                crc = poly ^ (crc >> 1);
            }
        }
    }

    return ~crc;
}
