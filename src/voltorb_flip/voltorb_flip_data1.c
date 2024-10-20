#include "global.h"

#include "voltorb_flip/voltorb_flip_data.h"

const u8 sMainMenuMsgNos[] = { 17, 18, 19, 0 };
const u8 sGameInfoMsgNos[] = { 21, 22, 23, 24 };

const u8 ov122_021E9270[] = { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x00, 0x00 };

const Ov122_021E9278 ov122_021E9278 = {
    .unk0 = {
             { 0x77, 0x17 },
             { 0x74, 0x14 },
             { 0x71, 0x11 },
             { 0x6E, 0x0E },
             { 0x6B, 0x0B },
             },
    .menuTemplate = { 1, 1, 0, GF_BG_LYR_MAIN_3, 11, 0, 0, 58, 31, 104 },
};
