#include <nitro.h>

extern void SDK_IRQ_STACKSIZE(void);

#define OSi_HW_DTCM                 SDK_AUTOLOAD_DTCM_START
#define RESET_HW_DTCM_IRQ_STACK_END SDK_AUTOLOAD_DTCM_START + 0x00003fc0 - HW_SVC_STACK_SIZE

#ifdef SDK_ARM9
static vu16 OSi_IsResetOccurred = FALSE;
static u16 OSi_IsInitReset = FALSE;
#else
static u16 OSi_IsInitReset = FALSE;
static vu16 OSi_IsResetOccurred = FALSE;
#endif

u32 OSi_CpuClear32(u32 value, void *ptr, u32 size);
void OSi_ReadCardRom32(u32 src, void *dst, int len);

void OSi_DoResetSystem(void);
void OSi_ReloadRomData(void);
void OSi_DoBoot(void);

void OS_InitReset(void) {
    if (OSi_IsInitReset) {
        return;
    }
    OSi_IsInitReset = TRUE;
#ifdef SDK_ARM9
    PXI_Init();
    while (!PXI_IsCallbackReady(PXI_FIFO_TAG_OS, PXI_PROC_ARM7)) {}
#endif //SDK_ARM9
    PXI_SetFifoRecvCallback(PXI_FIFO_TAG_OS, OSi_CommonCallback);
}

BOOL OS_IsResetOccurred(void) {
    return OSi_IsResetOccurred;
}

void OSi_CommonCallback(PXIFifoTag tag, u32 data, BOOL err) {
#pragma unused(tag)
#pragma unused(err)
    u16 command;
    u16 commandArg;

    command = (u16)((data & OS_PXI_COMMAND_MASK) >> OS_PXI_COMMAND_SHIFT);
    commandArg = (u16)((data & OS_PXI_DATA_MASK) >> OS_PXI_DATA_SHIFT);
    if (command == OS_PXI_COMMAND_RESET) {
        OSi_IsResetOccurred = TRUE;
    } else {
        OS_Panic("");
    }
}

void OSi_SendToPxi(u16 data) {
    u32 pxi_send_data;

    pxi_send_data = (u32)(data) << OS_PXI_COMMAND_SHIFT;
    while (PXI_SendWordByFifo(PXI_FIFO_TAG_OS, pxi_send_data, FALSE) != PXI_FIFO_SUCCESS) {}
}

#ifdef SDK_ARM9
void OS_ResetSystem(u32 parameter) {
    u16 lockId;

    if (MB_IsMultiBootChild()) {
        OS_Panic("");
    }

    lockId = OS_GetLockID();
    CARD_LockRom(lockId);
    MI_StopDma(0);
    MI_StopDma(1);
    MI_StopDma(2);
    MI_StopDma(3);
    OS_SetIrqMask(OS_IE_SPFIFO_RECV);
    OS_ResetRequestIrqMask(~OS_IE_SPFIFO_RECV);
    *(vu32 *)HW_RESET_PARAMETER_BUF = parameter;
    OSi_SendToPxi(OS_PXI_COMMAND_RESET);
    asm {
        ldr r0, =RESET_HW_DTCM_IRQ_STACK_END
        ldr r1, =SDK_IRQ_STACKSIZE
        sub r0, r0, r1
        mov sp, r0
        bl OSi_DoResetSystem // noreturn
    }
}

#include <nitro/itcm_begin.h>
void OSi_DoResetSystem(void) {
    while (!OSi_IsResetOccurred) {}
    reg_OS_IME = 0;
    OSi_ReloadRomData();
    OSi_DoBoot(); // noreturn
}

asm void OSi_DoBoot(void) {
    mov r12, #HW_REG_BASE
    str r12, [r12, #REG_IME_OFFSET]
    ldr r1, =OSi_HW_DTCM
    add r1, r1, #0x3FC0
    add r1, r1, #HW_DTCM_SYSRV_OFS_INTR_VECTOR
    mov r0, #0
    str r0, [r1]
    ldr r1, =REG_SUBPINTF_ADDR
    @waitSubIntf:
    ldrh r0, [r1]
    and r0, r0, #0x000F
    cmp r0, #0x0001
    bne @waitSubIntf
    mov r0, #0x0100
    strh r0, [r1]
    mov r0, #0
    ldr r3, =HW_EXCP_VECTOR_MAIN
    ldr r4, [r3]
    ldr r1, =HW_BIOS_EXCP_STACK_MAIN
    mov r2, #0x80
    bl OSi_CpuClear32
    str r4, [r3]
    ldr r1, =HW_PXI_SIGNAL_PARAM_ARM9
    mov r2, #0x18
    bl OSi_CpuClear32
    ldr r1, =HW_WM_RSSI_POOL
    strh r0, [r1]
    ldr r1, =HW_COMPONENT_PARAM
    mov r2, #0x64
    bl OSi_CpuClear32
    ldr r1, =REG_SUBPINTF_ADDR
    @waitSubIntf2:
    ldrh r0, [r1]
    and r0, r0, #0x000F
    cmp r0, #0x0001
    beq @waitSubIntf2
    mov r0, #0x0000
    strh r0, [r1]
    ldr r3, =HW_ROM_HEADER_BUF
    ldr r12, [r3, #0x24] // ARM9 entry
    mov lr, r12
    ldr r11, =HW_PXI_SIGNAL_PARAM_ARM9
    ldmia r11, {r0-r10}
    mov r11, #0
    bx r12
}

asm u32 OSi_CpuClear32(register u32 value, register void * startAddr, register u32 size) {
    add r12, r1, r2
    @loop:
    cmp r1, r12
    stmltia r1!, {r0}
    blt @loop
    bx lr
}

void OSi_ReloadRomData(void) {
    u32 p = (u32)HW_ROM_HEADER_BUF;
    const u32 rom_base = *(u32 *)HW_ROM_BASE_OFFSET_BUF;
    if (rom_base >= 0x8000) {
        OSi_ReadCardRom32(rom_base, (void *)p, 0x160);
    }
    u32 src_arm9 = *(u32 *)(p + 0x20);
    u32 dst_arm9 = *(u32 *)(p + 0x28);
    u32 len_arm9 = *(u32 *)(p + 0x2C);
    u32 src_arm7 = *(u32 *)(p + 0x30);
    u32 dst_arm7 = *(u32 *)(p + 0x38);
    u32 len_arm7 = *(u32 *)(p + 0x3C);
    OSIntrMode bak_cpsr = OS_DisableInterrupts();
    DC_StoreAll();
    DC_InvalidateAll();
    OS_RestoreInterrupts(bak_cpsr);
    IC_InvalidateAll();
    DC_WaitWriteBufferEmpty();
    src_arm9 += rom_base;
    src_arm7 += rom_base;
    if (src_arm9 < 0x8000) {
        u32 diff = 0x8000 - src_arm9;
        src_arm9 = 0x8000;
        dst_arm9 += diff;
        len_arm9 -= diff;
    }
    OSi_ReadCardRom32(src_arm9, (void *)dst_arm9, len_arm9);
    OSi_ReadCardRom32(src_arm7, (void *)dst_arm7, len_arm7);
}

#undef reg_CARD_MASTERCNT
#undef reg_CARD_CMD
#undef reg_CARD_CNT
#undef reg_CARD_DATA

void OSi_ReadCardRom32(u32 src, void *dst, int len) {
    vu8 *reg_CARD_MASTERCNT = (vu8 *)(HW_REG_BASE + 0x1a1);
    vu8 *reg_CARD_CMD = (vu8 *)(HW_REG_BASE + 0x1a8);
    vu32 *reg_CARD_CNT = (vu32 *)(HW_REG_BASE + 0x1a4);
    vu32 *reg_CARD_DATA = (vu32 *)(HW_REG_BASE + 0x100010);
    vu32 *hdr_GAME_BUF = (vu32 *)(HW_ROM_HEADER_BUF + 0x60);

    enum {
        CARD_MASTER_SELECT_ROM = 0x00,
        CARD_MASTER_ENABLE = 0x80,
        CARD_CMD_READ_PAGE = 0xb7,
        CARD_CTRL_CMD_MASK = 0x07000000,
        CARD_CTRL_CMD_PAGE = 0x01000000,
        CARD_CTRL_READ = 0x00000000,
        CARD_CTRL_RESET_HI = 0x20000000,
        CARD_CTRL_START = 0x80000000,
        CARD_CTRL_READY = 0x00800000,
        CARD_ENUM_END
    };

    const u32 ctrl_start = ((*hdr_GAME_BUF & ~CARD_CTRL_CMD_MASK) | (CARD_CTRL_CMD_PAGE | CARD_CTRL_READ | CARD_CTRL_START | CARD_CTRL_RESET_HI));
    int pos = -(src & 0x1FF);
    while ((*reg_CARD_CNT & CARD_CTRL_START) != 0) {}
    *reg_CARD_MASTERCNT = (u32)(CARD_MASTER_SELECT_ROM | CARD_MASTER_ENABLE);
    for (src += pos; pos < len; src += 512)
    {
        //---- setting for command of one page reading
        reg_CARD_CMD[0] = CARD_CMD_READ_PAGE;
        reg_CARD_CMD[1] = src >> 24;
        reg_CARD_CMD[2] = src >> 16;
        reg_CARD_CMD[3] = src >> 8;
        reg_CARD_CMD[4] = src >> 0;
        reg_CARD_CMD[5] = 0;
        reg_CARD_CMD[6] = 0;
        reg_CARD_CMD[7] = 0;
        *reg_CARD_CNT = ctrl_start;
        for (;;)
        {
            u32 ctrl = *reg_CARD_CNT;
            if ((ctrl & CARD_CTRL_READY) != 0) {
                const u32 data = *reg_CARD_DATA;
                if ((pos >= 0) && (pos < len)) {
                    *(u32 *)(dst + pos) = data;
                }
                pos += sizeof(u32);
            }
            if (!(ctrl & CARD_CTRL_START)) {
                break;
            }
        }
    }
}

#include <nitro/itcm_end.h>

#else
void OS_ResetSystem(void) {
    MI_StopDma(0);
    MI_StopDma(1);
    MI_StopDma(2);
    MI_StopDma(3);
    OS_SetIrqMask(OS_IE_FIFO_RECV);
    OS_ResetRequestIrqMask(0xFFFFFFFF);
    SND_Shutdown();
    OSi_SendToPxi(OS_PXI_COMMAND_RESET);
    OSi_DoResetSystem();
}

void OSi_DoResetSystem(void) {
    reg_OS_IME = 0;
    OSi_DoBoot();
}

#include <nitro/wram_begin.h>
asm void OSi_DoBoot(void) {
    mov r12, #HW_REG_BASE
    str r12, [r12, #REG_IME_OFFSET]
    ldr r1, =HW_INTR_VECTOR_BUF
    mov r0, #0
    str r0, [r1]
    ldr r1, =REG_MAINPINTF_ADDR
    mov r0, #0x100
    strh r0, [r1]
@waitMainpIntf:
    ldrh r0, [r1]
    and r0, r0, #0x000F
    cmp r0, #0x0001
    bne @waitMainpIntf
    ldr r1, =REG_MAINPINTF_ADDR
    mov r0, #0
    strh r0, [r1]
@waitMainpIntf2:
    ldrh r0, [r1]
    and r0, r0, #0x000F
    beq @waitMainpIntf2
    ldr r3, =HW_ROM_HEADER_BUF
    ldr r12, [r3, #0x34] // ARM7 entry
    mov lr, r12
    mov r0, #0
    mov r1, #0
    mov r2, #0
    mov r3, #0
    bx r12
}
#include <nitro/wram_end.h>
#endif
