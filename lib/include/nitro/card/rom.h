#ifndef NITRO_CARD_ROM_H_
#define NITRO_CARD_ROM_H_

#include <nitro/mi/exMemory.h>
#include <nitro/mi/dma.h>
#include <nitro/card/common.h>
#include <nitro/os/tcm.h>

#define CARD_ROM_PAGE_SIZE    512

#define CARDMST_SEL_ROM     0x00
#define CARDMST_IF_ENABLE   0x40
#define CARDMST_ENABLE      0x80

#define CARD_DATA_READY     0x00800000
#define CARD_COMMAND_PAGE   0x01000000
#define CARD_COMMAND_ID     0x07000000
#define CARD_COMMAND_MASK   0x07000000
#define CARD_RESET_HI       0x20000000
#define CARD_READ_MODE      0x00000000
#define CARD_START          0x80000000
#define CARD_LATENCY1_MASK  0x00001FFF

#define MROMOP_G_READ_PAGE  0xB7000000
#define MROMOP_G_READ_ID    0xB8000000

extern CARDiCommon cardi_common;

typedef struct
{
    u32 offset;
    u32 length;
}
CARDRomRegion;

typedef struct CARDRomStat
{
    void (*read_func) (struct CARDRomStat *);
    u32 ctrl;
    u8 *cache_page;
    u32 dummy[5];
    u8 cache_buf[CARD_ROM_PAGE_SIZE];
} CARDRomStat;

static inline const CARDRomRegion * CARD_GetRomRegionOVT(MIProcessor target)
{
    return (target == MI_PROCESSOR_ARM9)
    ? (const CARDRomRegion *)((const u8 *)HW_ROM_HEADER_BUF + 0x50)
    : (const CARDRomRegion *)((const u8 *)HW_ROM_HEADER_BUF + 0x58);
}

BOOL CARDi_TryReadCardDma(CARDRomStat *p);
void CARDi_ReadCard(CARDRomStat *p);
u32 CARDi_ReadRomIDCore(void);
void CARDi_CheckPulledOutCore(u32 id);
void CARDi_ReadRom(u32 dma, const void *src, void *dst, u32 len, MIDmaCallback callback, void *arg, BOOL is_async);
void CARD_Init(void);
void CARD_WaitRomAsync(void);
void (*CARDi_GetRomAccessor(void)) (CARDRomStat *);

static inline void CARD_ReadRomAsync(u32 dma, const void * src, void * dst, u32 len, MIDmaCallback callback, void * arg)
{
    CARDi_ReadRom(dma, src, dst, len, callback, arg, TRUE);
}

static inline const CARDRomRegion * CARD_GetRomRegionFNT() {
    return (const CARDRomRegion *)((const u8 *)HW_ROM_HEADER_BUF + 0x40);
}

static inline const CARDRomRegion * CARD_GetRomRegionFAT() {
    return (const CARDRomRegion *)((const u8 *)HW_ROM_HEADER_BUF + 0x48);
}

static inline void CARDi_ReadEnd(void)
{
    CARDiCommon *const p = &cardi_common;
    CARDi_CheckPulledOutCore(CARDi_ReadRomIDCore());
    p->cmd->result = CARD_RESULT_SUCCESS;
    CARDi_EndTask(p, TRUE);
}

#ifdef SDK_ARM9
static inline BOOL CARDi_IsInTcm(u32 buf, u32 len)
{
    const u32 i = (u32)HW_ITCM;
    const u32 d = OS_GetDTCMAddress();
    return ((i < buf + len) && (i + HW_ITCM_SIZE > buf)) ||
           ((d < buf + len) && (d + HW_DTCM_SIZE > buf));
}
#endif

extern u32 cardi_rom_header_addr;

static inline u32 CARDi_GetRomFlag(u32 flag)
{
    const u32 rom_ctrl = *(vu32 *)(cardi_rom_header_addr + 0x60);
    return (u32)((rom_ctrl & ~CARD_COMMAND_MASK) | flag |
                 CARD_READ_MODE | CARD_START | CARD_RESET_HI);
}

#endif //NITRO_CARD_ROM_H_
