#include "global.h"
#include "field_map_object.h"
#include "field_player_avatar.h"
#include "follow_mon.h"
#include "gf_gfx_loader.h"
#include "gf_rtc.h"
#include "system.h"
#include "map_preview_graphic.h"
#include "unk_0200FA24.h"
#include "unk_02062108.h"
#include "overlay_01_021F1AFC.h"
#include "overlay_01.h"
#include "constants/maps.h"
#include "fielddata/graphic/preview_graphic/preview_graphic.naix"

typedef struct MapPreviewGraphicData {
    int mapId;
    u32 unused4;
    struct {
        int palNo;
        int charNo;
        int scrnNo;
    } files[4];
    int unused3C; //this looks like it was originally used as a dungeon index const
} MapPreviewGraphicData;

typedef struct UnkStateMachineSubstruct_0206A388 {
    u16 state;
    u16 unk2;
} UnkStateMachineSubstruct_0206A388;

typedef struct UnkStruct_0206A388 {
    int state;
    int displayTimer;
    HeapID heapId;
    BgConfig *bgConfig;
    Window *window;
    u16 bgColorMode;
    u16 index;
    u16 fadeOutTimer;
    u16 unk1A;
    u32 bg2Prioirty;
    u32 bg0Prioirty;
    u32 bg1Prioirty;
    u32 bg3Prioirty;
    int timeIndex;
    int unk30;
    UnkStateMachineSubstruct_0206A388 unk34;
} UnkStruct_0206A388;

static MapPreviewGraphicData sMapPreviewGraphicData[] = {
    {
        //Dark Cave, North Side
        .mapId = MAP_D42R0101,
        .unused4 = 0,
        .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000000_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000001_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000002_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000003_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000004_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000005_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000003_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000004_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000005_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000006_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000007_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000008_NSCR_lz
            }
        },
        .unused3C = 0
    },
    {
        //Dark Cave, South Side
        .mapId = MAP_D42R0102,
        .unused4 = 0,
        .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000009_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000010_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000011_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000012_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000013_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000014_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000012_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000013_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000014_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000015_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000016_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000017_NSCR_lz
            }
        },
        .unused3C = 0
    },
    {
        //Sprout Tower
        .mapId = MAP_D15R0101,
        .unused4 = 0,
        .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000018_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000019_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000020_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000021_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000022_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000023_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000021_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000022_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000023_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000024_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000025_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000026_NSCR_lz
            }
        },
        .unused3C = 1
    },
    {
        //Ruins of Alph 1
        .mapId = MAP_D24R0211,
        .unused4 = 0,
        .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000027_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000028_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000029_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000030_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000031_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000032_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000030_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000031_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000032_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000033_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000034_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000035_NSCR_lz
            }
        },
        .unused3C = 2
    },
    {
        //Ruins of Alph 2
        .mapId = MAP_D24R0217,
        .unused4 = 0,
        .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000027_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000028_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000029_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000030_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000031_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000032_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000030_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000031_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000032_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000033_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000034_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000035_NSCR_lz
            }
        },
        .unused3C = 2
    },
    {
        //Union Cave
        .mapId = MAP_D25R0101,
        .unused4 = 0,
        .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000036_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000037_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000038_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000039_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000040_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000041_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000039_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000040_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000041_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000042_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000043_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000044_NSCR_lz
            }
        },
        .unused3C = 3
    },
    {
        //Slowpoke Well
        .mapId = MAP_D26R0101,
        .unused4 = 0,
        .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000045_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000046_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000047_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000048_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000049_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000050_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000048_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000049_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000050_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000051_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000052_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000053_NSCR_lz
            }
        },
        .unused3C = 4
    },
    {
        //Ilex Forest
        .mapId = MAP_D36R0101,
        .unused4 = 0,
        .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000054_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000055_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000056_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000057_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000058_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000059_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000060_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000061_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000062_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000063_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000064_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000065_NSCR_lz
            }
        },
        .unused3C = 5
    },
    {
        //National Park
        .mapId = MAP_D22R0101,
        .unused4 = 0,
        .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000066_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000067_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000068_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000069_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000070_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000071_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000072_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000073_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000074_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000075_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000076_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000077_NSCR_lz
            }
        },
        .unused3C = 6
    },
    {
        //Burned Tower
        .mapId = MAP_D18R0101,
        .unused4 = 0,
        .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000078_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000079_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000080_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000081_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000082_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000083_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000084_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000085_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000086_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000087_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000088_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000089_NSCR_lz
            }
        },
        .unused3C = 7
    },
    {
        //Bell Tower
        .mapId = MAP_D17R0101,
        .unused4 = 0,
        .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000090_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000091_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000092_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000093_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000094_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000095_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000096_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000097_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000098_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000099_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000100_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000101_NSCR_lz
            }
        },
        .unused3C = 8
    },
    {
        //Whirl Islands
        .mapId = MAP_D40R0101,
        .unused4 = 0,
        .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000102_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000103_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000104_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000105_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000106_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000107_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000105_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000106_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000107_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000108_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000109_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000110_NSCR_lz
            }
        },
        .unused3C = 9
    },
    {
        //Mt Mortar
        .mapId = MAP_D38R0101,
        .unused4 = 0,
        .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000111_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000112_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000113_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000114_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000115_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000116_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000117_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000118_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000119_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000120_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000121_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000122_NSCR_lz
            }
        },
        .unused3C = 11
    },
    {
        //Ice Path
        .mapId = MAP_D39R0101,
        .unused4 = 0,
        .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000123_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000124_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000125_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000126_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000127_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000128_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000126_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000127_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000128_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000129_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000130_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000131_NSCR_lz
            }
        },
        .unused3C = 12
    },
    {
        //Dragon's Den
        .mapId = MAP_D44R0101,
        .unused4 = 0,
        .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000132_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000133_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000134_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000135_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000136_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000137_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000135_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000136_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000137_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000138_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000139_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000140_NSCR_lz
            }
        },
        .unused3C = 13
    },
    {
        //Tohjo Falls
        .mapId = MAP_D45R0101,
        .unused4 = 0,
        .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000141_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000142_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000143_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000144_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000145_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000146_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000144_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000145_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000146_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000147_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000148_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000149_NSCR_lz
            }
        },
        .unused3C = 14
    },
    {
        //Victory Road South
        .mapId = MAP_D43R0101,
        .unused4 = 0,
        .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000150_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000151_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000152_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000153_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000154_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000155_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000153_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000154_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000155_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000156_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000157_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000158_NSCR_lz
            }
        },
        .unused3C = 15
    },
    {
        //Victory Road North
        .mapId = MAP_D43R0103,
        .unused4 = 0,
        .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000150_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000151_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000152_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000153_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000154_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000155_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000153_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000154_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000155_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000156_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000157_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000158_NSCR_lz
            }
        },
        .unused3C = 15
    },
    {
        //Viridian Forest
        .mapId = MAP_D46R0101,
        .unused4 = 0,
        .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000159_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000160_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000161_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000162_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000163_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000164_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000165_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000166_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000167_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000168_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000169_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000170_NSCR_lz
            }
        },
        .unused3C = 16
    },
    {
        //Diglett Cave
        .mapId = MAP_D01R0101,
        .unused4 = 0,
        .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000171_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000172_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000173_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000174_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000175_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000176_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000174_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000175_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000176_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000177_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000178_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000179_NSCR_lz
            }
        },
        .unused3C = 17
    },
    {
        //Rock Tunnel
        .mapId = MAP_D05R0101,
        .unused4 = 0,
        .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000180_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000181_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000182_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000183_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000184_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000185_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000183_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000184_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000185_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000186_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000187_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000188_NSCR_lz
            }
        },
        .unused3C = 18
    },
    {
        //Mt Moon
        .mapId = MAP_D02R0101,
        .unused4 = 0,
        .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000189_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000190_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000191_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000192_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000193_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000194_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000195_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000196_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000197_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000198_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000199_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000200_NSCR_lz
            }
        },
        .unused3C = 20
    },
    {
        //Seafoam Islands
        .mapId = MAP_D11R0101,
        .unused4 = 0,
        .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000201_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000202_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000203_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000204_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000205_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000206_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000204_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000205_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000206_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000207_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000208_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000209_NSCR_lz
            }
        },
        .unused3C = 21
    },
    {
        //Mt Silver
        .mapId = MAP_D41R0101,
        .unused4 = 0,
        .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000210_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000211_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000212_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000213_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000214_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000215_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000213_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000214_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000215_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000216_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000217_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000218_NSCR_lz
            }
        },
        .unused3C = 22
    },
    {
        //Cerulean Cave
        .mapId = MAP_D03R0101,
        .unused4 = 0,
        .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000219_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000220_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000221_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000222_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000223_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000224_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000222_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000223_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000224_NSCR_lz
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_00000225_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_00000226_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_00000227_NSCR_lz
            }
        },
        .unused3C = 23
    }
};

static BOOL Task_MapPreviewGraphic_ShowImage(TaskManager *man);
static void MapPreviewGraphic_LoadGfx(UnkStruct_0206A388 *unk);
static void MapPreviewGraphic_InitWindow(UnkStruct_0206A388 *unk);
static int sub_0206A694(UnkStruct_0206A388 *unk, FieldSystem *fsys);

u8 MapPreviewGraphic_GetIndex(u32 mapId) {
    u8 ret = -1;
    for (int i = 0; i < (int) NELEMS(sMapPreviewGraphicData); i++) {
        if (sMapPreviewGraphicData[i].mapId == mapId) {
            ret = i;
            break;
        }
    }
    return ret;
}

void MapPreviewGraphic_BeginShowImage(TaskManager *man, int index, u8 time, int a3) {
    FieldSystem *fsys = TaskManager_GetFieldSystem(man);
    UnkStruct_0206A388 *unk = AllocFromHeapAtEnd(HEAP_ID_4, sizeof(UnkStruct_0206A388));

    unk->state = 0;
    unk->displayTimer = 0;
    unk->bgConfig = FieldSystem_GetBgConfigPtr(fsys);
    unk->fadeOutTimer = 0;
    unk->unk1A = 0;
    unk->index = index;

    switch (time) {
    case RTC_TIMEOFDAY_MORN:
        unk->timeIndex = 0;
        break;
    case RTC_TIMEOFDAY_DAY:
        unk->timeIndex = 1;
        break;
    case RTC_TIMEOFDAY_EVE:
        unk->timeIndex = 2;
        break;
    case RTC_TIMEOFDAY_NITE:
    case RTC_TIMEOFDAY_LATE:
        unk->timeIndex = 3;
        break;
    default:
        GF_ASSERT(FALSE);
        unk->timeIndex = 0;
        break;
    }

    unk->heapId = HEAP_ID_4;
    unk->unk30 = a3;
    unk->unk34.state = 0;
    unk->unk34.unk2 = 0;
    
    TaskManager_Call(man, Task_MapPreviewGraphic_ShowImage, unk);
}

typedef enum PreviewGraphicState {
    PG_STATE_INIT,
    PG_STATE_FADE_IN,
    PG_STATE_WAIT_OR_SKIP,
    PG_STATE_FADE_OUT
} PreviewGraphicState;

static BOOL Task_MapPreviewGraphic_ShowImage(TaskManager *man) {
    FieldSystem *fsys = TaskManager_GetFieldSystem(man);
    UnkStruct_0206A388 *unk = TaskManager_GetEnvironment(man);

    switch (unk->state) {
    case PG_STATE_INIT:
        unk->bgColorMode = GetBgColorMode(unk->bgConfig, 2);
        unk->bg2Prioirty = GetBgPriority(unk->bgConfig, GF_BG_LYR_MAIN_2);
        unk->bg0Prioirty = GetBgPriority(unk->bgConfig, GF_BG_LYR_MAIN_0);
        unk->bg1Prioirty = GetBgPriority(unk->bgConfig, GF_BG_LYR_MAIN_1);
        unk->bg3Prioirty = GetBgPriority(unk->bgConfig, GF_BG_LYR_MAIN_3);
        SetBgControlParam(unk->bgConfig, 2, GF_BG_CNT_SET_COLOR_MODE, 1);
        SetBgPriority(GF_BG_LYR_MAIN_3, 0);
        SetBgPriority(GF_BG_LYR_MAIN_2, 1);
        SetBgPriority(GF_BG_LYR_MAIN_0, 2);
        MapPreviewGraphic_LoadGfx(unk);
        MapPreviewGraphic_InitWindow(unk);
        G2_SetBlendAlpha(4, 33, 16, 0);
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 16, 1, unk->heapId);
        unk->state++;
        break;
    case PG_STATE_FADE_IN:
        if (IsPaletteFadeFinished()) {
            unk->state++;
        }
        break;
    case PG_STATE_WAIT_OR_SKIP:
        if (gSystem.newKeys & PAD_BUTTON_A) {
            unk->fadeOutTimer = 0;
            unk->state++;
            break;
        }
        if (++unk->displayTimer > 60) {
            unk->fadeOutTimer = 0;
            unk->state++;
            
        }
        break;
    case PG_STATE_FADE_OUT:
        if (unk->fadeOutTimer < 16) {
            if (++unk->unk1A >= 2) {
                unk->unk1A = 0;
                unk->fadeOutTimer++;
            } 
            reg_G2_BLDALPHA = (16 - unk->fadeOutTimer) | (unk->fadeOutTimer << 8);
        } 
        if (sub_0206A694(unk, fsys) && unk->fadeOutTimer >= 16) {
            ToggleBgLayer(2, GF_PLANE_TOGGLE_OFF);
            SetBgControlParam(unk->bgConfig, 2, GF_BG_CNT_SET_COLOR_MODE, unk->bgColorMode);
            SetBgPriority(GF_BG_LYR_MAIN_2, (u8) unk->bg2Prioirty);
            SetBgPriority(GF_BG_LYR_MAIN_0, (u8) unk->bg0Prioirty);
            SetBgPriority(GF_BG_LYR_MAIN_1, (u8) unk->bg1Prioirty);
            SetBgPriority(GF_BG_LYR_MAIN_3, (u8) unk->bg3Prioirty);
            reg_G2_BLDCNT = 0;
            BG_ClearCharDataRange(2, 0x20, 0, unk->heapId);
            BgClearTilemapBufferAndCommit(unk->bgConfig, 2);
            WindowArray_Delete(unk->window, 1);
            FreeToHeap(unk);
            return TRUE;
        }
        break;
    }
    return FALSE;
}

static void MapPreviewGraphic_LoadGfx(UnkStruct_0206A388 *unk) {
    GfGfxLoader_GXLoadPal(NARC_a_1_5_0, sMapPreviewGraphicData[unk->index].files[unk->timeIndex].palNo, GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_0_OFFSET, 0x160, unk->heapId);
    GfGfxLoader_LoadCharData(NARC_a_1_5_0, sMapPreviewGraphicData[unk->index].files[unk->timeIndex].charNo, unk->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, 1, unk->heapId);
    GfGfxLoader_LoadScrnData(NARC_a_1_5_0, sMapPreviewGraphicData[unk->index].files[unk->timeIndex].scrnNo, unk->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, 1, unk->heapId);
}

static void MapPreviewGraphic_InitWindow(UnkStruct_0206A388 *unk) {
    unk->window = AllocWindows(unk->heapId, 1);
    AddWindowParameterized(unk->bgConfig, unk->window, 2, 0, 0, 28, 2, 13, 0x2C0);
}

static int sub_0206A694(UnkStruct_0206A388 *unk, FieldSystem *fsys) {
    LocalMapObject *player;
    
    if (!unk->unk30) {
        return TRUE;
    }

    UnkStateMachineSubstruct_0206A388 *unkSub = &unk->unk34; //required to match
    
    switch (unk->unk34.state) {
    case 0:
        PlayerAvatar_ToggleAutomaticHeightUpdating_NowApply(fsys->playerAvatar, 0);
        unkSub->state++;
        break;
    case 1:
        VecFx32 pos;
        player = PlayerAvatar_GetMapObject(fsys->playerAvatar);
        unkSub->unk2++;
        MapObject_GetPositionVec(player, &pos);
        pos.y -= 2 * FX32_ONE;
        MapObject_SetPositionVec(player, &pos);
        if (unkSub->unk2 >= 16) {
            PlayerAvatar_ToggleAutomaticHeightUpdating_NowApply(fsys->playerAvatar, TRUE);
            unkSub->state++;
        }
        break;
    case 2:
        Field_PlayerAvatar_OrrTransitionFlags(fsys->playerAvatar, 1);
        Field_PlayerAvatar_ApplyTransitionFlags(fsys->playerAvatar);
        unkSub->state++;
        break;
    case 3:
        player = PlayerAvatar_GetMapObject(fsys->playerAvatar);
        if (MapObject_AreBitsSetForMovementScriptInit(player)) {
            MapObject_SetHeldMovement(player, 1);
            unkSub->state++;
        }
        break;
    case 4:
        player = PlayerAvatar_GetMapObject(fsys->playerAvatar);
        if (MapObject_AreBitsSetForMovementScriptInit(player)) {
            if (FollowMon_IsActive(fsys)) {
                ov01_02205790(fsys, 1);
                sub_0205FC94(FollowMon_GetMapObject(fsys), 0x30);
                sub_02069DC8(FollowMon_GetMapObject(fsys), 1);
            }
            unkSub->state++;
        }
        break;
    case 5:
        return TRUE;
    }

    return FALSE;
}
