#include "global.h"
#include "poke_overlay.h"

#define OVY_MAX_PER_REGION            (8)

typedef enum PMiOverlayRegion {
    OVY_REGION_MAIN,
    OVY_REGION_ITCM,
    OVY_REGION_DTCM,
    OVY_REGION_NUM,
} PMiOverlayRegion;

typedef struct PMiLoadedOverlay {
    FSOverlayID id;
    BOOL active;
} PMiLoadedOverlay;

static PMiLoadedOverlay sOverlayRegions[OVY_REGION_NUM][OVY_MAX_PER_REGION];

static PMiOverlayRegion GetOverlayLoadDestination(FSOverlayID ovyId);
static PMiLoadedOverlay *GetLoadedOverlaysInRegion(PMiOverlayRegion region);
static BOOL CanOverlayBeLoaded(FSOverlayID ovyId);
static BOOL LoadOverlayNormal(MIProcessor proc, FSOverlayID ovyId);
static BOOL LoadOverlayNoInit(MIProcessor proc, FSOverlayID ovyId);
static BOOL LoadOverlayNoInitAsync(MIProcessor proc, FSOverlayID ovyId);
static BOOL GetOverlayRamBounds(FSOverlayID ovyId, void **start, void **end);

static void FreeOverlayAllocation(PMiLoadedOverlay *ovload) {
    GF_ASSERT(ovload->active == TRUE);
    GF_ASSERT(FS_UnloadOverlay(MI_PROCESSOR_ARM9, ovload->id) == TRUE);
    ovload->active = FALSE;
}

void UnloadOverlayByID(FSOverlayID ovyId) {
    int i;
    PMiLoadedOverlay *table = GetLoadedOverlaysInRegion(GetOverlayLoadDestination(ovyId));
    for (i = 0; i < OVY_MAX_PER_REGION; i++) {
        if (table[i].active == TRUE && table[i].id == ovyId) {
            FreeOverlayAllocation(&table[i]);
            break;
        }
    }
}

static PMiOverlayRegion GetOverlayLoadDestination(FSOverlayID id) {
    FSOverlayInfo info;
    u8 *end;
    u8 *start;
    GF_ASSERT(FS_LoadOverlayInfo(&info, MI_PROCESSOR_ARM9, id) == TRUE);
    start = (u8 *)HW_ITCM_IMAGE;
    end = (u8 *)HW_ITCM_END;
    if (info.header.ram_address <= end && info.header.ram_address >= start) {
        return OVY_REGION_ITCM;
    }
    start = (u8 *)HW_DTCM;
    end = start + HW_DTCM_SIZE;
    if (info.header.ram_address <= end && info.header.ram_address >= start) {
        return OVY_REGION_DTCM;
    }
    return OVY_REGION_MAIN;
}

BOOL HandleLoadOverlay(FSOverlayID ovyId, PMOverlayLoadType loadType) {
    BOOL result;
    u32 dmaBak = FS_DMA_NOT_USE;
    PMiOverlayRegion overlayRegion;
    PMiLoadedOverlay *loadedOverlays;
    int i;

    if (!CanOverlayBeLoaded(ovyId)) {
        return FALSE;
    }

    overlayRegion = GetOverlayLoadDestination(ovyId);
    loadedOverlays = GetLoadedOverlaysInRegion(overlayRegion);
    for (i = 0; i < OVY_MAX_PER_REGION; i++) {
        if (loadedOverlays[i].active == FALSE) {
            PMiLoadedOverlay *ovy = &loadedOverlays[i];
            ovy->active = TRUE;
            ovy->id = ovyId;
            break;
        }
    }
    if (i >= OVY_MAX_PER_REGION) {
        GF_ASSERT(0);
        return FALSE;
    }

    if (overlayRegion == OVY_REGION_ITCM || overlayRegion == OVY_REGION_DTCM) {
        dmaBak = FS_SetDefaultDMA(FS_DMA_NOT_USE);
    }

    switch (loadType) {
    case OVY_LOAD_NORMAL:
        result = LoadOverlayNormal(MI_PROCESSOR_ARM9, ovyId);
        break;
    case OVY_LOAD_NOINIT:
        result = LoadOverlayNoInit(MI_PROCESSOR_ARM9, ovyId);
        break;
    case OVY_LOAD_ASYNC:
        result = LoadOverlayNoInitAsync(MI_PROCESSOR_ARM9, ovyId);
        break;
    default:
        GF_ASSERT(0);
        return FALSE;
    }

    if (overlayRegion == OVY_REGION_ITCM || overlayRegion == OVY_REGION_DTCM) {
        FS_SetDefaultDMA(dmaBak);
    }

    if (result == FALSE) {
        GF_ASSERT(0);
        return FALSE;
    }

    return TRUE;
}

static BOOL CanOverlayBeLoaded(FSOverlayID ovyId) {
    void * my_start, * my_end;
    void * their_start, * their_end;
    int i;
    PMiLoadedOverlay *loadedOverlay;

    if (!GetOverlayRamBounds(ovyId, &my_start, &my_end)) {
        return FALSE;
    }

    loadedOverlay = GetLoadedOverlaysInRegion(GetOverlayLoadDestination(ovyId));
    for (i = 0; i < OVY_MAX_PER_REGION; i++) {
        if (loadedOverlay[i].active == TRUE && GetOverlayRamBounds(loadedOverlay[i].id, &their_start, &their_end) == TRUE) {
            if ((my_start >= their_start && my_start < their_end) || (my_end > their_start && my_end <= their_end) || (my_start <= their_start && my_end >= their_end)) {
                return FALSE;
            }
        }
    }

    return TRUE;
}

static PMiLoadedOverlay *GetLoadedOverlaysInRegion(PMiOverlayRegion region) {
    switch (region) {
    case OVY_REGION_MAIN:
    default:
        return sOverlayRegions[OVY_REGION_MAIN];
    case OVY_REGION_ITCM:
        return sOverlayRegions[OVY_REGION_ITCM];
    case OVY_REGION_DTCM:
        return sOverlayRegions[OVY_REGION_DTCM];
    }
}

static BOOL GetOverlayRamBounds(FSOverlayID ovyId, void ** start, void ** end) {
    FSOverlayInfo info;

    if (!FS_LoadOverlayInfo(&info, MI_PROCESSOR_ARM9, ovyId)) {
        GF_ASSERT(0);
        return FALSE;
    }

    *start = info.header.ram_address;
    *end = (char *)*start + (info.header.ram_size + info.header.bss_size);
    return TRUE;
}

static BOOL LoadOverlayNormal(MIProcessor proc, FSOverlayID ovyId) {
    return FS_LoadOverlay(proc, ovyId);
}

static BOOL LoadOverlayNoInit(MIProcessor proc, FSOverlayID ovyId) {
    FSOverlayInfo info;
    if (!FS_LoadOverlayInfo(&info, proc, ovyId)) {
        return FALSE;
    }
    if (!FS_LoadOverlayImage(&info)) {
        return FALSE;
    }
    FS_StartOverlay(&info);
    return TRUE;
}

static BOOL LoadOverlayNoInitAsync(MIProcessor proc, FSOverlayID ovyId) {
    FSFile file;
    FSOverlayInfo info;
    if (!FS_LoadOverlayInfo(&info, proc, ovyId)) {
        return FALSE;
    }
    FS_InitFile(&file);
    FS_LoadOverlayImageAsync(&info, &file);
    FS_WaitAsync(&file);
    FS_CloseFile(&file);
    FS_StartOverlay(&info);
    return TRUE;
}
