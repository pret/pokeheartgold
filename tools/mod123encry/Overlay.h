#ifndef GUARD_OVERLAY_H
#define GUARD_OVERLAY_H

#include <vector>
#include "ntrtypes.h"

class NtrRom;

struct FSOverlayInfo {
    u32 ovy_id;
    u32 start;
    u32 size;
    u32 bssize;
    u32 sinit_start;
    u32 sinit_end;
    u32 file_id;
    u32 compsize : 24;
    u32 flag : 8;
};

class NtrOverlay {
protected:
    FSOverlayInfo info;
    std::vector<u8> data;
public:
    NtrOverlay() = default;
    NtrOverlay(FSOverlayInfo &_info, std::vector<u8> &_data) : info(_info), data(_data) {}
    NtrOverlay(NtrRom *baserom, u32 ovy_id);
};


#endif //GUARD_OVERLAY_H
