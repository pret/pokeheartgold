#ifndef NITRO_CARD_COMMON_H_
#define NITRO_CARD_COMMON_H_

#include <cw/function_target.h>
#include <nitro/os/thread.h>
#include <nitro/os/system.h>
#include <nitro/mi/dma.h>
#include <nitro/pxi/fifo.h>

#define CARD_PXI_COMMAND_MASK           0x3f
#define CARD_PXI_COMMAND_PULLED_OUT     0x0011
#define CARD_PXI_COMMAND_TERMINATE      0x0001

#define    CARD_THREAD_PRIORITY_DEFAULT    4

#define    CARD_BACKUP_TYPE_DEVICE_SHIFT    0
#define    CARD_BACKUP_TYPE_DEVICE_MASK    0xFF
#define    CARD_BACKUP_TYPE_DEVICE_EEPROM    1
#define    CARD_BACKUP_TYPE_DEVICE_FLASH    2
#define    CARD_BACKUP_TYPE_DEVICE_FRAM    3
#define    CARD_BACKUP_TYPE_SIZEBIT_SHIFT    8
#define    CARD_BACKUP_TYPE_SIZEBIT_MASK    0xFF
#define    CARD_BACKUP_TYPE_VENDER_SHIFT    16
#define    CARD_BACKUP_TYPE_DEFINE(type, size, vender)    \
    (((CARD_BACKUP_TYPE_DEVICE_ ## type) << CARD_BACKUP_TYPE_DEVICE_SHIFT) |    \
    ((size) << CARD_BACKUP_TYPE_SIZEBIT_SHIFT) |    \
    ((vender) << CARD_BACKUP_TYPE_VENDER_SHIFT))

#define ALIGN_MASK(a)            ((a) - 1)
#define CARD_ALIGN_HI_BIT(n)     (((u32)(n)) & ~ALIGN_MASK(CARD_ROM_PAGE_SIZE))
#define CARD_ALIGN_LO_BIT(n)     (((u32)(n)) & ALIGN_MASK(CARD_ROM_PAGE_SIZE))

#define CARD_BACKUP_CAPS_AVAILABLE      (u32)(CARD_BACKUP_CAPS_READ - 1)
#define CARD_BACKUP_CAPS_READ           (u32)(1 << CARD_REQ_READ_BACKUP)
#define CARD_BACKUP_CAPS_WRITE          (u32)(1 << CARD_REQ_WRITE_BACKUP)
#define CARD_BACKUP_CAPS_PROGRAM        (u32)(1 << CARD_REQ_PROGRAM_BACKUP)
#define CARD_BACKUP_CAPS_VERIFY         (u32)(1 << CARD_REQ_VERIFY_BACKUP)
#define CARD_BACKUP_CAPS_ERASE_PAGE     (u32)(1 << CARD_REQ_ERASE_PAGE_BACKUP)
#define CARD_BACKUP_CAPS_ERASE_SECTOR   (u32)(1 << CARD_REQ_ERASE_SECTOR_BACKUP)
#define CARD_BACKUP_CAPS_ERASE_CHIP     (u32)(1 << CARD_REQ_ERASE_CHIP_BACKUP)

typedef enum
{
    CARD_BACKUP_TYPE_EEPROM_4KBITS = CARD_BACKUP_TYPE_DEFINE(EEPROM, 9, 0),
    CARD_BACKUP_TYPE_EEPROM_64KBITS = CARD_BACKUP_TYPE_DEFINE(EEPROM, 13, 0),
    CARD_BACKUP_TYPE_EEPROM_512KBITS = CARD_BACKUP_TYPE_DEFINE(EEPROM, 16, 0),
    CARD_BACKUP_TYPE_FLASH_2MBITS = CARD_BACKUP_TYPE_DEFINE(FLASH, 18, 0),
    CARD_BACKUP_TYPE_FLASH_4MBITS = CARD_BACKUP_TYPE_DEFINE(FLASH, 19, 0),
    CARD_BACKUP_TYPE_FLASH_8MBITS = CARD_BACKUP_TYPE_DEFINE(FLASH, 20, 0),
    CARD_BACKUP_TYPE_FRAM_256KBITS = CARD_BACKUP_TYPE_DEFINE(FRAM, 15, 0),
    CARD_BACKUP_TYPE_NOT_USE = 0
} CARDBackupType;

#define CARD_BACKUP_TYPE_FLASH_4MBITS_EX (CARDBackupType)(CARD_BACKUP_TYPE_FLASH_4MBITS | (255<<CARD_BACKUP_TYPE_VENDER_SHIFT))

typedef enum
{
    CARD_RESULT_SUCCESS = 0,
    CARD_RESULT_FAILURE,
    CARD_RESULT_INVALID_PARAM,
    CARD_RESULT_UNSUPPORTED,
    CARD_RESULT_TIMEOUT,
    CARD_RESULT_ERROR,
    CARD_RESULT_NO_RESPONSE,
    CARD_RESULT_CANCELED
} CARDResult;

typedef enum
{
    CARD_TARGET_NONE,
    CARD_TARGET_ROM,
    CARD_TARGET_BACKUP
} CARDTargetMode;

typedef enum
{
    CARD_REQ_INIT = 0,
    CARD_REQ_ACK,
    CARD_REQ_IDENTIFY,
    CARD_REQ_READ_ID,
    CARD_REQ_READ_ROM,
    CARD_REQ_WRITE_ROM,
    CARD_REQ_READ_BACKUP,
    CARD_REQ_WRITE_BACKUP,
    CARD_REQ_PROGRAM_BACKUP,
    CARD_REQ_VERIFY_BACKUP,
    CARD_REQ_ERASE_PAGE_BACKUP,
    CARD_REQ_ERASE_SECTOR_BACKUP,
    CARD_REQ_ERASE_CHIP_BACKUP,
    CARD_REQ_MAX
} CARDRequest;

typedef enum
{
    CARD_REQUEST_MODE_RECV,
    CARD_REQUEST_MODE_SEND,
    CARD_REQUEST_MODE_SEND_VERIFY,
    CARD_REQUEST_MODE_SPECIAL
} CARDRequestMode;

enum
{
    CARD_STAT_INIT = (1 << 0),
    CARD_STAT_INIT_CMD = (1 << 1),
    CARD_STAT_BUSY = (1 << 2),
    CARD_STAT_TASK = (1 << 3),
    CARD_STAT_RECV = (1 << 4),
    CARD_STAT_REQ = (1 << 5),
    CARD_STAT_CANCEL = (1 << 6)
};

typedef s32 CARDiOwner;

typedef struct CARDiCommandArg
{
    CARDResult result;
    CARDBackupType type;
    u32 id;
    u32 src;
    u32 dest;
    u32 len;

    struct
    {
        u32 total_size;
        u32 sect_size;
        u32 page_size;
        u32 addr_width;
        u32 program_page;
        u32 write_page;
        u32 write_page_total;
        u32 erase_chip;
        u32 erase_chip_total;
        u32 erase_sector;
        u32 erase_sector_total;
        u32 erase_page;
        u8 initial_status;
        u8 padding1[3];
        u32 caps;
        u8 padding2[16];
    } spec;
} CARDiCommandArg;

typedef struct CARDiCommon
{
    CARDiCommandArg *cmd;
    s32 command;

    volatile CARDiOwner lock_owner;
    volatile s32 lock_ref;
    OSThreadQueue lock_queue[1];
    CARDTargetMode lock_target;

    u32 src;
    u32 dst;
    u32 len;
    u32 dma;
    CARDRequest req_type;
    s32 req_retry;
    CARDRequestMode req_mode;
    MIDmaCallback callback;
    void *callback_arg;
    void (*task_func) (struct CARDiCommon *);

    OSThread thread[1];
    OSThread *cur_th;

    u32 priority;
    OSThreadQueue busy_q[1];

    volatile u32 flag;

    u8 dummy[8];

    u8 backup_cache_page_buf[256] ALIGN(32);
} CARDiCommon;

static inline void CARDi_EndTask(CARDiCommon *p, BOOL is_own_task)
{
    const MIDmaCallback func = p->callback;
    void *const arg = p->callback_arg;

    {
        OSIntrMode bak_psr = OS_DisableInterrupts();

        p->flag &= ~(CARD_STAT_BUSY | CARD_STAT_TASK | CARD_STAT_CANCEL);
        OS_WakeupThread(p->busy_q);
        if ((p->flag & CARD_STAT_RECV) != 0)
        {
            OS_WakeupThreadDirect(p->thread);
        }
        (void)OS_RestoreInterrupts(bak_psr);
    }

    if (is_own_task && func)
    {
        (*func)(arg);
    }
}

static inline void CARDi_WaitTask(CARDiCommon *p, MIDmaCallback callback, void *callback_arg)
{
    OSIntrMode bak_psr = OS_DisableInterrupts();
    while ((p->flag & CARD_STAT_BUSY) != 0)
    {
        OS_SleepThread(p->busy_q);
    }
    p->flag |= CARD_STAT_BUSY;
    p->callback = callback;
    p->callback_arg = callback_arg;
    (void)OS_RestoreInterrupts(bak_psr);
}

void CARDi_SetTask(void (*task) (CARDiCommon *));
void CARDi_InitCommon(void);
BOOL CARD_IsEnabled(void);
void CARD_CheckEnabled(void);
void CARD_Enable(BOOL enable);
BOOL CARDi_WaitAsync(void);
BOOL CARDi_TryWaitAsync(void);
CARDResult CARD_GetResultCode(void);
void CARD_LockRom(u16 lock_id);
void CARD_UnlockRom(u16 lock_id);
void CARD_UnlockBackup(u16 lock_id);

#define CARD_RETRY_COUNT_MAX 10

static inline void CARDi_SendPxi(u32 data)
{
    while (PXI_SendWordByFifo(PXI_FIFO_TAG_FS, data, TRUE) < 0)
        ;
}

void CARD_SetCacheFlushThreshold(u32 icache, u32 dcache);
BOOL CARD_IdentifyBackup(CARDBackupType type);
void CARD_LockBackup(u16 lock_id);
void CARD_UnlockBackup(u16 lock_id);

#endif //NITRO_CARD_COMMON_H_
