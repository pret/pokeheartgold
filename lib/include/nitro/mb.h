#ifndef NITRO_MB_H_
#define NITRO_MB_H_

#define MB_TYPE_ILLEGAL                 0
#define MB_TYPE_NORMAL                  1
#define MB_TYPE_MULTIBOOT               2

typedef struct {
    u16 length;
    u16 rssi;
    u16 bssid[3];
    u16 ssidLength;
    u8 ssid[32];
    u16 capaInfo;
    struct {
        u16 basic;
        u16 support;
    } rateSet;
    u16 beaconPeriod;
    u16 dtimPeriod;
    u16 channel;
    u16 cfpPeriod;
    u16 cfpMaxDuration;
}
MBParentBssDesc;

typedef struct {
    u16 boot_type;
    MBParentBssDesc parent_bss_desc;
} MBParam;

static inline const MBParam *MB_GetMultiBootParam(void)
{
    return (const MBParam *)HW_WM_BOOT_BUF;
}

static inline BOOL MB_IsMultiBootChild(void)
{
    return MB_GetMultiBootParam()->boot_type == MB_TYPE_MULTIBOOT;
}

#endif //NITRO_MB_H_
