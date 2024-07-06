#ifndef NITRO_FS_OVERLAY_H_
#define NITRO_FS_OVERLAY_H_

#if defined(__cplusplus)
extern "C" {
#endif

#ifdef SDK_ASM
#define FS_EXTERN_OVERLAY(name) .public SDK_OVERLAY_##name##_ID
#define FS_OVERLAY_ID(name) SDK_OVERLAY_##name##_ID
#else
#include <nitro/mi/exMemory.h>
#include <nitro/fs/file.h>
#include <nitro/card/rom.h>

typedef u32 FSOverlayID;

#define    FS_EXTERN_OVERLAY(name)    extern u32 SDK_OVERLAY_ ## name ## _ID[1]
#define    FS_OVERLAY_ID(name)    ((u32)&(SDK_OVERLAY_ ## name ## _ID))

typedef void (*FSOverlayInitFunc)(void);

typedef struct FSOverlayInfoHeader
{
    u32 id;
    u8 *ram_address;
    u32 ram_size;
    u32 bss_size;
    FSOverlayInitFunc *sinit_init;
    FSOverlayInitFunc *sinit_init_end;
    u32 file_id;
    u32 compressed: 24;
    u32 flag: 8;
} FSOverlayInfoHeader;

typedef struct FSOverlayInfo
{
    FSOverlayInfoHeader header;
    MIProcessor target;
    CARDRomRegion file_pos;
} FSOverlayInfo;

static inline u8 *const FS_GetOverlayAddress(FSOverlayInfo *p_ovi)
{
    return p_ovi->header.ram_address;
}

static inline u32 const FS_GetOverlayImageSize(FSOverlayInfo *p_ovi)
{
    return p_ovi->header.ram_size;
}

static inline u32 const FS_GetOverlayTotalSize(FSOverlayInfo *p_ovi)
{
    return p_ovi->header.ram_size + p_ovi->header.bss_size;
}

u32 FSi_GetOverlayBinarySize(FSOverlayInfo * p_ovi);
void FS_ClearOverlayImage(FSOverlayInfo * p_ovi);
FSFileID FS_GetOverlayFileID(FSOverlayInfo * p_ovi);
BOOL FSi_LoadOverlayInfoCore(FSOverlayInfo * p_ovi, MIProcessor target, FSOverlayID id, FSArchive * arc, u32 offset_arm9, u32 len_arm9, u32 offset_arm7, u32 len_arm7);
BOOL FS_LoadOverlayInfo(FSOverlayInfo *p_ovi, MIProcessor target, FSOverlayID id);
BOOL FS_LoadOverlayImageAsync(FSOverlayInfo *p_ovi, FSFile *p_file);
BOOL FS_LoadOverlayImage(FSOverlayInfo *p_ovi);
BOOL FSi_CompareDigest(const u8 *spec_digest, void *src, u32 len);
void FS_StartOverlay(FSOverlayInfo *p_ovi);
void FS_EndOverlay(FSOverlayInfo *p_ovi);
BOOL FS_UnloadOverlayImage(FSOverlayInfo * p_ovi);
BOOL FS_LoadOverlay(MIProcessor target, FSOverlayID id);
BOOL FS_UnloadOverlay(MIProcessor target, FSOverlayID id);
#endif

#if defined(__cplusplus)
}
#endif

#endif //NITRO_FS_OVERLAY_H_
