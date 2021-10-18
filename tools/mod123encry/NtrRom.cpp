#include <algorithm>
#include <cstring>
#include <iostream>
#include "NtrRom.h"
#include "ntruncompbw.h"

NtrRom::NtrRom(const char *filename, std::ios::openmode mode) : handle(filename, mode | std::ios::ate) {
    size_t romsize = handle.tellg();
    raw = new u8[romsize];
    handle.seekg(0);
    handle.read((char *)raw, romsize);

    const RomHeader *header = getHeader();
    arm9_static = raw + header->main_rom_offset;
    arm7_static = raw + header->sub_rom_offset;

    // ARM9 might be compressed
    u32 *_start_ModuleParams = (u32 *)(arm9_static + *(u32 *)(arm9_static + header->main_size + 4));
    if (_start_ModuleParams[5] != 0) {
        arm9_static = new u8[header->main_size];
        memcpy(arm9_static, raw + header->main_rom_offset, header->main_size);
        arm9_static_uncomp_size = MIi_UncompressBackwards((u8 **)&arm9_static, header->main_size);
    }
    // ARM7 static is never compressed
    
    // Set FAT
    AssignRomVector(fat, header->fat.offset, header->fat.length);
    
    // Set FNT
    fnt.raw = raw + header->fnt.offset;
    AssignRomVector(fnt.directories, header->fnt.offset, sizeof(FNTHeader));
    AssignRomVector(fnt.directories, header->fnt.offset, fnt.directories[0].parent * sizeof(FNTHeader));
    fnt.paths = (char *)&*fnt.directories.cend();

    // Set overlay tables
    AssignRomVector(arm9_ovt, header->main_ovt.offset, header->main_ovt.length);
    arm9_ovy = new u8*[arm9_ovt.size()];
    for (int i = 0; i < arm9_ovt.size(); i++) {
        if (arm9_ovt[i].flag & 1) {
            arm9_ovy[i] = new u8[arm9_ovt[i].compsize];
            memcpy(arm9_ovy[i], raw + fat[arm9_ovt[i].file_id].start, arm9_ovt[i].compsize);
            MIi_UncompressBackwards((u8 **)&arm9_ovy[i], arm9_ovt[i].compsize);
        } else {
            arm9_ovy[i] = raw + fat[arm9_ovt[i].file_id].start;
        }
    }
    AssignRomVector(arm7_ovt, header->main_ovt.offset, header->main_ovt.length);
    arm7_ovy = new u8*[arm7_ovt.size()];
    for (int i = 0; i < arm7_ovt.size(); i++) {
        if (arm7_ovt[i].flag & 1) {
            arm7_ovy[i] = new u8[arm7_ovt[i].compsize];
            memcpy(arm7_ovy[i], raw + fat[arm7_ovt[i].file_id].start, arm7_ovt[i].compsize);
            MIi_UncompressBackwards((u8 **)&arm7_ovy[i], arm7_ovt[i].compsize);
        } else {
            arm7_ovy[i] = raw + fat[arm7_ovt[i].file_id].start;
        }
    }

    banner = (NtrBanner *)(raw + header->banner_offset);
}

NtrRom::~NtrRom() {
    int i;

    for (i = 0; i < arm9_ovt.size(); i++) {
        if (arm9_ovt[i].flag & 1) {
            delete[] arm9_ovy[i];
        }
    }
    for (i = 0; i < arm7_ovt.size(); i++) {
        if (arm7_ovt[i].flag & 1) {
            delete[] arm7_ovy[i];
        }
    }
    delete[] arm9_ovy;
    delete[] arm7_ovy;
    // explicit delete for static only if uncomped
    if (arm9_static_uncomp_size != 0) {
        delete[] arm9_static;
    }
    delete[] raw;
}
