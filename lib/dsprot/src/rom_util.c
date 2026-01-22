#include "rom_util.h"

void ROMUtil_Read(void *dest, u32 addr, s32 numBytes) {
    // This function is executing an obfuscated manual cartridge ROM read.
    // Nitro SDK usually does this for you with CARD_ReadRom* and friends.
    //
    // https://problemkaputt.de/gbatek-ds-cartridge-protocol.htm
    //
    // Most/all convoluted syntax here must be that way to match.
    // Some of the comment documentation may be inaccurate here.

    u8 buffer[8];
    REGType8v *vnull;
    u32 registerBase1;
    REGType8v *registerBase2;
    u32 cardCtrl13;
    s32 addrOffset;
    u16 lockID;
    u16 extMemRegisterValOriginal;
    u32 output;
    s32 cardCtrlCmd;
    s32 i;

    lockID = OS_GetLockID();
    CARD_LockRom(lockID);

    // Alias for volatile null pointer
    vnull = (REGType8v *)NULL;

    // Alias for register base (0x04000000)
    registerBase1 = 1;
    registerBase1 <<= 26;

    // Another alias for register base (0x04000000)
    registerBase2 = (REGType8v *)HW_REG_BASE;

    // External memory control register (0x04000204)
    // Save value to rewrite later
    extMemRegisterValOriginal = reg_MI_EXMEMCNT;

    // Set current processor accessing the gamecard bus to the ARM9
    reg_MI_EXMEMCNT = (reg_MI_EXMEMCNT & ~REG_MI_EXMEMCNT_MP_MASK) | (MI_PROCESSOR_ARM9 << REG_MI_EXMEMCNT_MP_SHIFT);

    // Obfuscated, create address 0x027FFE60
    // This is an address in the ROM header: port 0x040001A4 / setting for normal commands
    cardCtrl13 = 5;
    cardCtrl13 <<= 18;
    cardCtrl13 -= 13;

    // Detect if the system is in DSi mode. If so, change the address to 0x02FFFE60
    if (*(REGType8v *)(registerBase1 + REG_A9ROM_OFFSET) & REG_SCFG_A9ROM_SEC_MASK) {
        cardCtrl13 |= 0x40000;
    }

    cardCtrl13 <<= 5;

    // Read port setting and set page read flags
    cardCtrlCmd = (*(vs32 *)cardCtrl13 & ~CARD_COMMAND_MASK) | (CARD_COMMAND_PAGE | CARD_READ_MODE | CARD_START | CARD_RESET_HI);

    // Calculate offset to round back to nearest 0x200-byte block.
    // E.G. if we want to read starting from 0x1208, we actually need to
    // request the block at 0x1200 and then ignore the first 8 bytes of the result.
    // This would set `addrOffset` to -8.
    addrOffset = 0 - (addr & (CARD_ROM_PAGE_SIZE - 1));

    // Wait for card to not be busy
    while (*(REGType32v *)(registerBase1 + REG_CARDCNT_OFFSET) & CARD_START) {
        continue;
    }

    // Write enable flag to card ROM and SPI control register
    *(REGType8v *)(registerBase1 + REG_CARD_MASTER_CNT_OFFSET) = CARDMST_ENABLE;

    // Read 8-byte command out from gamecard bus, write this back later
    for (i = 0; i < 8; i++) {
        buffer[i] = *(vnull + HW_REG_BASE + REG_CARD_CMD_OFFSET + i);
    }

    addr += addrOffset;

    while (addrOffset < numBytes) {
        // Read a 0x200-byte data block from ROM

        // Write 8-byte command to registers
        // B7XXXXXXXX000000 -> 0x200-byte encrypted data read from address XXXXXXXX
        registerBase2[REG_CARD_CMD_OFFSET + 0] = MROMOP_G_READ_PAGE >> 24;
        registerBase2[REG_CARD_CMD_OFFSET + 1] = addr >> 24;
        registerBase2[REG_CARD_CMD_OFFSET + 2] = addr >> 16;
        registerBase2[REG_CARD_CMD_OFFSET + 3] = addr >> 8;
        registerBase2[REG_CARD_CMD_OFFSET + 4] = addr;
        registerBase2[REG_CARD_CMD_OFFSET + 5] = 0x00;
        registerBase2[REG_CARD_CMD_OFFSET + 6] = 0x00;
        registerBase2[REG_CARD_CMD_OFFSET + 7] = 0x00;

        // Submit command
        *(REGType32v *)(registerBase1 + REG_CARDCNT_OFFSET) = cardCtrlCmd;

        // Copy the output into the destination buffer, within the bounds of numBytes
        // (Must read the output out of the I/O register regardless)
        do {
            if (*(REGType32v *)(registerBase1 + REG_CARDCNT_OFFSET) & CARD_DATA_READY) {
                output = *(REGType32v *)(registerBase1 + REG_CARD_DATA_OFFSET);
                if (addrOffset >= 0 && addrOffset < numBytes) {
                    *(u32 *)((u32)dest + addrOffset) = output;
                }

                addrOffset += 4;
            }
        } while (*(REGType32v *)(registerBase1 + REG_CARDCNT_OFFSET) & CARD_START);

        // Advance address to next block
        addr += CARD_ROM_PAGE_SIZE;
    }

    // Done reading, restore everything how it was before

    // Write original command back to gamecard bus
    for (i = 0; i < 8; i++) {
        *(vnull + HW_REG_BASE + REG_CARD_CMD_OFFSET + i) = buffer[i];
    }

    // Write original value back to to external memory control register
    *(REGType16v *)(registerBase1 + REG_EXMEMCNT_OFFSET) = extMemRegisterValOriginal;

    CARD_UnlockRom(lockID);
    OS_ReleaseLockID(lockID);
}

u32 ROMUtil_CRC32(void *buf, u32 size) {
    s32 i;
    u8 *bytePtr = (u8 *)buf;
    u32 crc = 0xFFFFFFFF;
    u32 poly = 0xEDB88320;
    while (size-- != 0) {
        crc ^= *bytePtr++;
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
