#include <nitro.h>

#define MCCNT0_SPI_CLK_MASK    0x0003
#define MCCNT0_SPI_CLK_4M    0x0000
#define MCCNT0_SPI_CLK_2M    0x0001
#define MCCNT0_SPI_CLK_1M    0x0002
#define MCCNT0_SPI_CLK_524K    0x0003
#define MCCNT0_SPI_BUSY        0x0080
#define MMCNT0_SEL_MASK        0x2000
#define MMCNT0_SEL_CARD        0x0000
#define MMCNT0_SEL_SPI        0x2000
#define MCCNT0_INT_MASK        0x4000
#define MCCNT0_INT_ON        0x4000
#define MCCNT0_INT_OFF        0x0000
#define MCCNT0_MASTER_MASK    0x8000
#define MCCNT0_MASTER_ON    0x8000
#define MCCNT0_MASTER_OFF    0x0000

typedef struct {
    u32 rest_comm;
    u32 src;
    u32 dst;
    BOOL cmp;
} CARDiParam;

static CARDiParam cardi_param;

static BOOL CARDi_CommandCheckBusy(void);
static void CARDi_CommArray(const void *src, void *dst, u32 n, void (*func)(CARDiParam *));
static void CARDi_CommReadCore(CARDiParam *p);
static void CARDi_CommWriteCore(CARDiParam *p);
static void CARDi_CommVerifyCore(CARDiParam *p);

static inline void CARDi_CommArrayRead(void *dst, u32 len) {
    CARDi_CommArray(NULL, dst, len, CARDi_CommReadCore);
}

static inline void CARDi_CommArrayWrite(const void *src, u32 len) {
    CARDi_CommArray(src, NULL, len, CARDi_CommWriteCore);
}

static inline void CARDi_CommArrayVerify(const void *src, u32 len) {
    CARDi_CommArray(src, NULL, len, CARDi_CommVerifyCore);
}

static inline void CARDi_EnableSpi(u32 cont) {
    const u16 ctrl = (u16)(MCCNT0_MASTER_ON |
                           MCCNT0_INT_OFF | MMCNT0_SEL_SPI | MCCNT0_SPI_CLK_4M | cont);
    reg_MI_MCCNT0 = ctrl;
}

static inline void CARDi_WaitBusy(void) {
    while ((reg_MI_MCCNT0 & MCCNT0_SPI_BUSY) != 0) {
    }
}

static void CARDi_CommandBegin(int len) {
    cardi_param.rest_comm = (u32)len;
}

static void CARDi_CommandEnd(u32 force_wait, u32 timeout) {
    if (force_wait + timeout > 0) {
        if (force_wait > 0) {
            OS_Sleep(force_wait);
        }
        if (timeout > 0) {
            int rest = (int)(timeout - force_wait);
            while (!CARDi_CommandCheckBusy() && (rest > 0)) {
                int interval = (rest < 5) ? rest : 5;
                OS_Sleep((u32)interval);
                rest -= interval;
            }
        }

        if (!CARDi_CommandCheckBusy()) {
            cardi_common.cmd->result = CARD_RESULT_TIMEOUT;
        }
    }
}

u8 CARDi_CommandReadStatus(void) {
    const u8 buf = COMM_READ_STATUS;
    u8 dst;
    CARDi_CommandBegin(1 + 1);
    CARDi_CommArrayWrite(&buf, 1);
    CARDi_CommArrayRead(&dst, 1);
    CARDi_CommandEnd(0, 0);
    return dst;
}

static BOOL CARDi_CommandCheckBusy(void) {
    return ((CARDi_CommandReadStatus() & COMM_STATUS_WIP_BIT) == 0);
}

static BOOL CARDi_WaitPrevCommand(void) {
    CARDi_CommandEnd(0, 50);

    if (cardi_common.cmd->result == CARD_RESULT_TIMEOUT) {
        cardi_common.cmd->result = CARD_RESULT_NO_RESPONSE;
        return FALSE;
    }
    return TRUE;
}

void CARDi_CommArray(const void *src, void *dst, u32 len, void (*func)(CARDiParam *)) {
    static u8 _03806AF4 = 50;
    static int _03806AF8 = TRUE;

    vu16 tmp;

    CARDiParam *const p = &cardi_param;
    p->src = (u32)src;
    p->dst = (u32)dst;
    CARDi_EnableSpi(CSPI_CONTINUOUS_ON);
    for (; len > 0; --len) {
        if (_03806AF8 && ((cardi_common.cmd->type >> CARD_BACKUP_TYPE_VENDER_SHIFT) & CARD_BACKUP_TYPE_VENDER_MASK) == 0xFF) {
            {
                OSTick start;
                OSTick now;

                start = OS_GetTick();
                do {
                    now = OS_GetTick();
                } while ((((now - start) * 64000ull) / 33514ull) < _03806AF4);
            }
            reg_MI_MCCNT0 = (u16)(MCCNT0_MASTER_ON |
                                  MCCNT0_INT_OFF | MMCNT0_SEL_SPI | MCCNT0_SPI_CLK_1M | CSPI_CONTINUOUS_ON);
            CARDi_WaitBusy();
            reg_MI_MCD0 = 0;
            CARDi_WaitBusy();
            tmp = reg_MI_MCD0;
            _03806AF8 = FALSE;

            {
                OSTick start;
                OSTick now;

                start = OS_GetTick();
                do {
                    now = OS_GetTick();
                } while ((((now - start) * 64000ull) / 33514ull) < _03806AF4);
            }
        }

        if (--p->rest_comm) {
            CARDi_EnableSpi(CSPI_CONTINUOUS_ON);
        } else {
            CARDi_EnableSpi(CSPI_CONTINUOUS_OFF);
            _03806AF8 = TRUE;
        }
        CARDi_WaitBusy();
        (*func)(p);
        if (!p->rest_comm) {
            break;
        }
    }
    if (!p->rest_comm) {
        reg_MI_MCCNT0 = (u16)(MCCNT0_MASTER_OFF | MCCNT0_INT_OFF);
    }
}

void CARDi_CommReadCore(CARDiParam *p) {
    reg_MI_MCD0 = 0;
    CARDi_WaitBusy();
    MI_WriteByte((void *)p->dst, (u8)reg_MI_MCD0);
    ++p->dst;
}

void CARDi_CommWriteCore(CARDiParam *p) {
    vu16 tmp;
    reg_MI_MCD0 = (u16)MI_ReadByte((void *)p->src);
    ++p->src;
    CARDi_WaitBusy();
    tmp = reg_MI_MCD0;
}

void CARDi_CommVerifyCore(CARDiParam *p) {
    reg_MI_MCD0 = 0;
    CARDi_WaitBusy();
    if ((u8)reg_MI_MCD0 != MI_ReadByte((void *)p->src)) {
        p->cmp = FALSE;
        if (p->rest_comm > 1) {
            p->rest_comm = 1;
        }
    }
    ++p->src;
}

static void CARDi_WriteEnable(void) {
    static const u8 arg[1] = {COMM_WRITE_ENABLE,};
    CARDi_CommandBegin(sizeof(arg));
    CARDi_CommArrayWrite(arg, sizeof(arg));
    CARDi_CommandEnd(0, 0);
}

static void CARDi_SendSpiAddressingCommand(u32 addr, u32 mode) {
    const u32 width = cardi_common.cmd->spec.addr_width;
    u32 addr_cmd;
    switch (width) {
    case 1:

        addr_cmd = (u32)(mode | ((addr >> 5) & 0x8) | ((addr & 0xFF) << 8));
        break;
    case 2:
        addr_cmd = (u32)(mode | (addr & 0xFF00) | ((addr & 0xFF) << 16));
        break;
    case 3:
        addr_cmd = (u32)(mode |
                         ((addr >> 8) & 0xFF00) | ((addr & 0xFF00) << 8) | ((addr & 0xFF) << 24));
        break;
    default:
        break;
    }
    CARDi_CommArrayWrite(&addr_cmd, (u32)(1 + width));
}

void CARDi_InitStatusRegister(void) {
    const u8 stat = cardi_common.cmd->spec.initial_status;
    if (stat != 0xFF) {
        static BOOL status_checked = FALSE;
        if (!status_checked) {
            if (CARDi_CommandReadStatus() != stat) {
                CARDi_SetWriteProtectCore(stat);
            }
            status_checked = TRUE;
        }
    }
}


void CARDi_IdentifyBackupCore(CARDBackupType type) {
    {
        CARDiCommandArg *const p = cardi_common.cmd;


        MI_CpuFill8(&p->spec, 0, sizeof(p->spec));
        p->type = type;
        p->spec.caps = (CARD_BACKUP_CAPS_AVAILABLE | CARD_BACKUP_CAPS_READ_STATUS);
        if (type != CARD_BACKUP_TYPE_NOT_USE) {
            const u32 size = (u32)(1 << ((type >> CARD_BACKUP_TYPE_SIZEBIT_SHIFT) &
                                         CARD_BACKUP_TYPE_SIZEBIT_MASK));
            const int device =
                ((type >> CARD_BACKUP_TYPE_DEVICE_SHIFT) & CARD_BACKUP_TYPE_DEVICE_MASK);
            const int vender =
                ((type >> CARD_BACKUP_TYPE_VENDER_SHIFT) & CARD_BACKUP_TYPE_VENDER_MASK);

            p->spec.total_size = size;

            p->spec.initial_status = 0xFF;
            if (device == CARD_BACKUP_TYPE_DEVICE_EEPROM) {
                switch (size) {
                default:
                    goto invalid_type;
                case 0x000200:
                    p->spec.page_size = 0x10;
                    p->spec.addr_width = 1;
                    p->spec.program_page = 5;
                    p->spec.initial_status = 0xF0;
                    break;
                case 0x002000:
                    p->spec.page_size = 0x0020;
                    p->spec.addr_width = 2;
                    p->spec.program_page = 5;
                    p->spec.initial_status = 0x00;
                    break;
                case 0x010000:
                    p->spec.page_size = 0x0080;
                    p->spec.addr_width = 2;
                    p->spec.program_page = 10;
                    p->spec.initial_status = 0x00;
                    break;
                }
                p->spec.sect_size = p->spec.page_size;
                p->spec.caps |= CARD_BACKUP_CAPS_READ;
                p->spec.caps |= CARD_BACKUP_CAPS_PROGRAM;
                p->spec.caps |= CARD_BACKUP_CAPS_VERIFY;
                p->spec.caps |= CARD_BACKUP_CAPS_WRITE_STATUS;
            } else if (device == CARD_BACKUP_TYPE_DEVICE_FLASH) {
                switch (size) {
                default:
                    goto invalid_type;
                case 0x040000:
                case 0x080000:
                case 0x100000:
                    p->spec.write_page = 25;
                    p->spec.write_page_total = 300;
                    p->spec.erase_page = 300;
                    p->spec.erase_sector = 5000;
                    p->spec.caps |= CARD_BACKUP_CAPS_WRITE;
                    p->spec.caps |= CARD_BACKUP_CAPS_ERASE_PAGE;
                    break;
                case 0x200000:
                    p->spec.write_page = 23;
                    p->spec.write_page_total = 300;
                    p->spec.erase_sector = 500;
                    p->spec.erase_sector_total = 5000;
                    p->spec.erase_chip = 10000;
                    p->spec.erase_chip_total = 60000;
                    p->spec.initial_status = 0x00;
                    p->spec.caps |= CARD_BACKUP_CAPS_WRITE;
                    p->spec.caps |= CARD_BACKUP_CAPS_ERASE_PAGE;
                    p->spec.caps |= CARD_BACKUP_CAPS_ERASE_CHIP;
                    p->spec.caps |= CARD_BACKUP_CAPS_WRITE_STATUS;
                    break;
                case 0x400000:
                    p->spec.erase_sector = 600;
                    p->spec.erase_sector_total = 3000;
                    p->spec.erase_subsector = 70;
                    p->spec.erase_subsector_total = 150;
                    p->spec.erase_chip = 23000;
                    p->spec.erase_chip_total = 800000;
                    p->spec.initial_status = 0x00;
                    p->spec.subsect_size = 0x1000;
                    p->spec.caps |= CARD_BACKUP_CAPS_ERASE_SUBSECTOR;
                    p->spec.caps |= CARD_BACKUP_CAPS_ERASE_CHIP;
                    p->spec.caps |= CARD_BACKUP_CAPS_WRITE_STATUS;
                    break;
                case 0x800000:
                    if (vender == 0) {
                        p->spec.erase_sector = 1000;
                        p->spec.erase_sector_total = 3000;
                        p->spec.erase_chip = 68000;
                        p->spec.erase_chip_total = 160000;
                        p->spec.initial_status = 0x00;
                        p->spec.caps |= CARD_BACKUP_CAPS_ERASE_CHIP;
                        p->spec.caps |= CARD_BACKUP_CAPS_WRITE_STATUS;
                    } else if (vender == 1) {
                        p->spec.erase_sector = 1000;
                        p->spec.erase_sector_total = 3000;
                        p->spec.erase_chip = 68000;
                        p->spec.erase_chip_total = 160000;
                        p->spec.initial_status = 0x84;
                        p->spec.caps |= CARD_BACKUP_CAPS_ERASE_CHIP;
                        p->spec.caps |= CARD_BACKUP_CAPS_WRITE_STATUS;
                    }
                    break;
                }
                p->spec.sect_size = 0x010000;
                p->spec.page_size = 0x0100;
                p->spec.addr_width = 3;
                p->spec.program_page = 5;
                p->spec.caps |= CARD_BACKUP_CAPS_READ;
                p->spec.caps |= CARD_BACKUP_CAPS_PROGRAM;
                p->spec.caps |= CARD_BACKUP_CAPS_VERIFY;
                p->spec.caps |= CARD_BACKUP_CAPS_ERASE_SECTOR;
            } else if (device == CARD_BACKUP_TYPE_DEVICE_FRAM) {
                switch (size) {
                default:
                    goto invalid_type;
                case 0x002000:
                case 0x008000:
                    break;
                }
                p->spec.page_size = size;
                p->spec.sect_size = size;
                p->spec.addr_width = 2;
                p->spec.initial_status = 0x00;
                p->spec.caps |= CARD_BACKUP_CAPS_READ;
                p->spec.caps |= CARD_BACKUP_CAPS_PROGRAM;
                p->spec.caps |= CARD_BACKUP_CAPS_VERIFY;
                p->spec.caps |= CARD_BACKUP_CAPS_WRITE_STATUS;
            } else {
                invalid_type:
                p->type = CARD_BACKUP_TYPE_NOT_USE;
                p->spec.total_size = 0;
                cardi_common.cmd->result = CARD_RESULT_UNSUPPORTED;
                return;
            }
        }
    }
}

void CARDi_ReadBackupCore(u32 src, void *dst, u32 len) {
    if (CARDi_WaitPrevCommand()) {
        CARDiCommandArg *const cmd = cardi_common.cmd;

        CARDi_CommandBegin((int)(1 + cmd->spec.addr_width + len));
        CARDi_SendSpiAddressingCommand(src, COMM_READ_ARRAY);
        CARDi_CommArrayRead(dst, len);
        CARDi_CommandEnd(0, 0);
    }
}

void CARDi_ProgramBackupCore(u32 dst, const void *src, u32 len) {
    if (CARDi_WaitPrevCommand()) {
        CARDiCommandArg *const cmd = cardi_common.cmd;

        const u32 page = cmd->spec.page_size;
        while (len > 0) {
            const u32 mod = (u32)(dst & (page - 1));
            u32 size = page - mod;
            if (size > len) {
                size = len;
            }
            CARDi_WriteEnable();
            CARDi_CommandBegin((int)(1 + cmd->spec.addr_width + size));
            CARDi_SendSpiAddressingCommand(dst, COMM_PROGRAM_PAGE);
            CARDi_CommArrayWrite(src, size);
            CARDi_CommandEnd(cmd->spec.program_page, 0);
            if (cmd->result != CARD_RESULT_SUCCESS) {
                break;
            }
            src = (const void *)((u32)src + size);
            dst += size;
            len -= size;
        }
    }
}

void CARDi_WriteBackupCore(u32 dst, const void *src, u32 len) {
    if (CARDi_WaitPrevCommand()) {
        CARDiCommandArg *const cmd = cardi_common.cmd;

        const u32 page = cmd->spec.page_size;
        while (len > 0) {
            const u32 mod = (u32)(dst & (page - 1));
            u32 size = page - mod;
            if (size > len) {
                size = len;
            }
            CARDi_WriteEnable();
            CARDi_CommandBegin((int)(1 + cmd->spec.addr_width + size));
            CARDi_SendSpiAddressingCommand(dst, COMM_PAGE_WRITE);
            CARDi_CommArrayWrite(src, size);
            CARDi_CommandEnd(cmd->spec.write_page, cmd->spec.write_page_total);
            if (cmd->result != CARD_RESULT_SUCCESS) {
                break;
            }
            src = (const void *)((u32)src + size);
            dst += size;
            len -= size;
        }
    }
}

void CARDi_VerifyBackupCore(u32 dst, const void *src, u32 len) {
    if (CARDi_WaitPrevCommand()) {
        CARDiCommandArg *const cmd = cardi_common.cmd;

        cardi_param.cmp = TRUE;
        CARDi_CommandBegin((int)(1 + cmd->spec.addr_width + len));
        CARDi_SendSpiAddressingCommand(dst, COMM_READ_ARRAY);
        CARDi_CommArrayVerify(src, len);
        CARDi_CommandEnd(0, 0);
        if ((cmd->result == CARD_RESULT_SUCCESS) && !cardi_param.cmp) {
            cmd->result = CARD_RESULT_FAILURE;
        }
    }
}

void CARDi_EraseBackupSectorCore(u32 dst, u32 len) {
    CARDiCommandArg *const cmd = cardi_common.cmd;
    const u32 sector = cmd->spec.sect_size;

    if (((dst | len) & (sector - 1)) != 0) {
        cmd->result = CARD_RESULT_INVALID_PARAM;
    } else if (CARDi_WaitPrevCommand()) {

        while (len > 0) {
            CARDi_WriteEnable();
            CARDi_CommandBegin((int)(1 + cmd->spec.addr_width + 0));
            CARDi_SendSpiAddressingCommand(dst, COMM_SECTOR_ERASE);
            CARDi_CommandEnd(cmd->spec.erase_sector, cmd->spec.erase_sector_total);
            if (cmd->result != CARD_RESULT_SUCCESS) {
                break;
            }
            dst += sector;
            len -= sector;
        }
    }
}

void CARDi_EraseBackupSubSectorCore(u32 dst, u32 len) {
    CARDiCommandArg *const cmd = cardi_common.cmd;
    const u32 sector = cmd->spec.subsect_size;

    if (((dst | len) & (sector - 1)) != 0) {
        cmd->result = CARD_RESULT_INVALID_PARAM;
    } else if (CARDi_WaitPrevCommand()) {

        while (len > 0) {
            CARDi_WriteEnable();
            CARDi_CommandBegin((int)(1 + cmd->spec.addr_width + 0));
            CARDi_SendSpiAddressingCommand(dst, COMM_SUBSECTOR_ERASE);
            CARDi_CommandEnd(cmd->spec.erase_subsector, cmd->spec.erase_subsector_total);
            if (cmd->result != CARD_RESULT_SUCCESS) {
                break;
            }
            dst += sector;
            len -= sector;
        }
    }
}

void CARDi_EraseChipCore(void) {
    if (CARDi_WaitPrevCommand()) {
        CARDiCommandArg *const cmd = cardi_common.cmd;
        static const u8 arg[1] = {COMM_CHIP_ERASE,};
        CARDi_WriteEnable();
        CARDi_CommandBegin(sizeof(arg));
        CARDi_CommArrayWrite(arg, sizeof(arg));
        CARDi_CommandEnd(cmd->spec.erase_chip, cmd->spec.erase_chip_total);
    }
}

void CARDi_SetWriteProtectCore(u16 stat) {
    if (CARDi_WaitPrevCommand()) {
        CARDiCommandArg *const cmd = cardi_common.cmd;
        int retry_count = 10;
        u8 arg[2];
        arg[0] = COMM_WRITE_STATUS;
        arg[1] = (u8)stat;
        do {
            CARDi_WriteEnable();
            CARDi_CommandBegin(1 + 1);
            CARDi_CommArrayWrite(&arg, sizeof(arg));
            CARDi_CommandEnd(5, 0);
        } while ((cmd->result == CARD_RESULT_TIMEOUT) && (--retry_count > 0));
    }
}
