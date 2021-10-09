#ifndef GUARD_NTRROM_H
#define GUARD_NTRROM_H

#include <fstream>
#include <vector>
#include "ntrtypes.h"
#include "Overlay.h"

struct CARDRomRegion {
    u32 offset;
    u32 length;
};

struct RomHeader {
    char game_name[12];
    u32 game_code;
    u16 maker_code;
    u8 product_id;
    u8 device_type;
    u8 device_size;
    u8 reserved_A[9];
    u8 game_version;
    u8 property;
    u32 main_rom_offset;
    u32 main_entry_address;
    u32 main_ram_address;
    u32 main_size;
    u32 sub_rom_offset;
    u32 sub_entry_address;
    u32 sub_ram_address;
    u32 sub_size;
    CARDRomRegion fnt;
    CARDRomRegion fat;
    CARDRomRegion main_ovt;
    CARDRomRegion sub_ovt;
    u8 rom_param_A[8];
    u32 banner_offset;
    u16 secure_crc;
    u8 rom_param_B[2];
    u32 main_autoload_done;
    u32 sub_autoload_done;
    u8 rom_param_C[8];
    u32 rom_size;
    u32 header_size;
    u8 reserved_B[0x38];
    u8 logo_data[0x9C];
    u16 logo_crc;
    u16 header_crc;
};

struct NtrBanner {
    u16 reserved[16];
    u16 pixels[0x100];
    u16 palette[16];
    char16_t titles[6][128];
};

struct FATEntry {
    u32 start;
    u32 end;
};

struct FNTHeader {
    u32 start;
    u16 index;
    u16 parent;
};

struct FNT {
    u8 *raw;
    std::vector<FNTHeader> directories;
    char *paths;
};

class NtrRom {
    std::ifstream handle;
    u8 * raw;
    u8 * arm9_static;
    u8 * arm7_static;
    u32 arm9_static_uncomp_size = 0;
    std::vector<FSOverlayInfo> arm9_ovt;
    std::vector<FSOverlayInfo> arm7_ovt;
    std::vector<FATEntry> fat;
    FNT fnt;
    u8 ** arm9_ovy;
    u8 ** arm7_ovy;
    NtrBanner *banner;

    template <typename T> void AssignRomVector(std::vector<T> &dest, u32 address, u32 size) {
        if (size % sizeof(T) != 0) {
            throw std::runtime_error("requested size not a multiple of type size");
        }
        dest.assign((T *)(raw + address), (T *)(raw + address + size));
    }

public:
    NtrRom(const char * filename, std::ios::openmode mode = std::ios::in);
    ~NtrRom();
    const RomHeader * getHeader() { return (const RomHeader *)(raw + 0); }
    FSOverlayInfo &getOverlayInfo(u32 proc, u32 ovy_id) {
        std::vector<FSOverlayInfo> &ovyi = (proc == 0) ? arm9_ovt : arm7_ovt;
        return ovyi[ovy_id];
    }
    std::vector<u8> getOverlayData(u32 proc, u32 ovy_id) {
        u8 *& data_raw = ((proc == 0) ? arm9_ovy : arm7_ovy)[ovy_id];
        FSOverlayInfo &info = getOverlayInfo(proc, ovy_id);
        return std::vector<u8>(data_raw, data_raw + info.size);
    }
    NtrOverlay getOverlay(u32 proc, u32 ovy_id) {
        std::vector<FSOverlayInfo> &ovyi = (proc == 0) ? arm9_ovt : arm7_ovt;
        u8 *& data_raw = ((proc == 0) ? arm9_ovy : arm7_ovy)[ovy_id];
        FSOverlayInfo &info = ovyi[ovy_id];
        std::vector<u8> data(data_raw, data_raw + info.size);
        return {info, data};
    }
};


#endif //GUARD_NTRROM_H
