#include "metatile_behavior.h"

#include "global.h"

#include "constants/metatile_behavior.h"

static const u8 sMetatileBehaviorFlags[] = {
    [TILE_BEHAVIOR_0]                       = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_1_UNUSED]                = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_TALL_GRASS]              = TILE_BEHAVIOR_FLAG_ENCOUNTER,
    [TILE_BEHAVIOR_VERY_TALL_GRASS]         = TILE_BEHAVIOR_FLAG_ENCOUNTER,
    [TILE_BEHAVIOR_4]                       = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_5]                       = TILE_BEHAVIOR_FLAG_ENCOUNTER,
    [TILE_BEHAVIOR_HEADBUTT]                = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_7]                       = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_CAVE_FLOOR]              = TILE_BEHAVIOR_FLAG_ENCOUNTER,
    [TILE_BEHAVIOR_9]                       = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_10]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_11]                      = TILE_BEHAVIOR_FLAG_ENCOUNTER,
    [TILE_BEHAVIOR_12]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_13]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_14]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_15]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_WATER_RIVER]             = TILE_BEHAVIOR_FLAG_SURFABLE_ENCOUNTER,
    [TILE_BEHAVIOR_WHIRLPOOL]               = TILE_BEHAVIOR_FLAG_SURFABLE,
    [TILE_BEHAVIOR_18]                      = TILE_BEHAVIOR_FLAG_SURFABLE_ENCOUNTER,
    [TILE_BEHAVIOR_WATERFALL]               = TILE_BEHAVIOR_FLAG_SURFABLE,
    [TILE_BEHAVIOR_20]                      = TILE_BEHAVIOR_FLAG_SURFABLE,
    [TILE_BEHAVIOR_WATER_SEA]               = TILE_BEHAVIOR_FLAG_SURFABLE_ENCOUNTER,
    [TILE_BEHAVIOR_PUDDLE]                  = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_SHALLOW_WATER]           = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_24]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_25]                      = TILE_BEHAVIOR_FLAG_SURFABLE,
    [TILE_BEHAVIOR_26]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_27]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_28]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_PUDDLE_NO_SPLASHING]     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_30]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_31]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_ICE]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_SAND]                    = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_34]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_35]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_36]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_37]                      = TILE_BEHAVIOR_FLAG_ENCOUNTER,
    [TILE_BEHAVIOR_38]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_39]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_40]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_41]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_42]                      = TILE_BEHAVIOR_FLAG_SURFABLE_ENCOUNTER,
    [TILE_BEHAVIOR_43]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_MAGMA]                   = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_REFLECTIVE]              = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_46]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_47]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_48]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_49]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_50]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_51]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_52]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_53]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_54]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_55]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_JUMP_EAST]               = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_JUMP_WEST]               = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_JUMP_NORTH]              = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_JUMP_SOUTH]              = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_LADDER_NORTH]            = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_LADDER_SOUTH]            = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_LADDER_DOWN]             = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_63]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_SLIDE_EAST]              = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_SLIDE_WEST]              = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_SLIDE_NORTH]             = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_SLIDE_SOUTH]             = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_68]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_69]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_70]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_71]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_72]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_73]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_74]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_ROCK_CLIMB_NORTH_SOUTH]  = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_ROCK_CLIMB_EAST_WEST]    = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_STOP_SLIDING]            = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_78]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_79]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_80]                      = TILE_BEHAVIOR_FLAG_SURFABLE,
    [TILE_BEHAVIOR_81]                      = TILE_BEHAVIOR_FLAG_SURFABLE,
    [TILE_BEHAVIOR_82]                      = TILE_BEHAVIOR_FLAG_SURFABLE,
    [TILE_BEHAVIOR_83]                      = TILE_BEHAVIOR_FLAG_SURFABLE,
    [TILE_BEHAVIOR_84]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_85]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_86]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_87]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_88]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_89]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_90]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_91]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_92]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_93]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_WARP_STAIRS_EAST]        = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_WARP_STAIRS_WEST]        = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_96]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_97]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_WARP_ENTRANCE_EAST]      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_WARP_ENTRANCE_WEST]      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_WARP_ENTRANCE_NORTH]     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_WARP_ENTRANCE_SOUTH]     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_102]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_WARP_PANEL]              = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_104]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_DOOR]                    = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_ESCALATOR_FLIP_FACE]     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_ESCALATOR]               = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_WARP_EAST]               = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_WARP_WEST]               = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_WARP_NORTH]              = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_WARP_SOUTH]              = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_112]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_113]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_114]                     = TILE_BEHAVIOR_FLAG_ENCOUNTER,
    [TILE_BEHAVIOR_115]                     = TILE_BEHAVIOR_FLAG_SURFABLE,
    [TILE_BEHAVIOR_116]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_117]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_118]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_119]                     = TILE_BEHAVIOR_FLAG_ENCOUNTER,
    [TILE_BEHAVIOR_120]                     = TILE_BEHAVIOR_FLAG_SURFABLE,
    [TILE_BEHAVIOR_121]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_122]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_123]                     = TILE_BEHAVIOR_FLAG_ENCOUNTER,
    [TILE_BEHAVIOR_124]                     = TILE_BEHAVIOR_FLAG_SURFABLE,
    [TILE_BEHAVIOR_125]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_126]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_127]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_128]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_129]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_130]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_PC]           = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_132]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_TOWN_MAP]                = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_TV]                      = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_135]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_136]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_137]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_138]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_139]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_140]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_141]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_142]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_143]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_144]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_145]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_146]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_147]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_148]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_149]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_150]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_151]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_152]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_153]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_154]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_155]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_156]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_157]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_158]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_159]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_160]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_161]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_162]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_163]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_MUD]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_165]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_166]                     = TILE_BEHAVIOR_FLAG_ENCOUNTER,
    [TILE_BEHAVIOR_167]                     = TILE_BEHAVIOR_FLAG_ENCOUNTER,
    [TILE_BEHAVIOR_SNOW]                    = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_169]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_170]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_171]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_172]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_173]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_174]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_175]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_176]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_177]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_178]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_179]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_180]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_181]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_182]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_183]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_184]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_185]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_186]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_187]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_188]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_189]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_190]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_191]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_192]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_193]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_194]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_195]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_196]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_197]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_198]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_199]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_200]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_201]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_202]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_203]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_204]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_205]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_206]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_207]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_208]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_209]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_210]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_211]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_212]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_213]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_214]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_215]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_216]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_217]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_218]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_219]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_220]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_221]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_222]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_223]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_SMALL_BOOKSHELF_1]           = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_BOOKSHELF_1]              = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_BOOKSHELF_2]               = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_227]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_EMPTY_TRASH_CAN]             = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_MART_SHELF_1]           = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_230]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_231]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_232]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_233]                     = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_SMALL_BOOKSHELF_2]       = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_MART_SHELF_2]        = TILE_BEHAVIOR_FLAG_NONE,
    [TILE_BEHAVIOR_MART_SHELF_3]     = TILE_BEHAVIOR_FLAG_NONE,
    TILE_BEHAVIOR_FLAG_NONE,
    TILE_BEHAVIOR_FLAG_NONE,
    TILE_BEHAVIOR_FLAG_NONE,
    TILE_BEHAVIOR_FLAG_NONE,
    TILE_BEHAVIOR_FLAG_NONE,
    TILE_BEHAVIOR_FLAG_NONE,
    TILE_BEHAVIOR_FLAG_NONE,
    TILE_BEHAVIOR_FLAG_NONE,
    TILE_BEHAVIOR_FLAG_NONE,
    TILE_BEHAVIOR_FLAG_NONE,
    TILE_BEHAVIOR_FLAG_NONE,
    TILE_BEHAVIOR_FLAG_NONE,
    TILE_BEHAVIOR_FLAG_NONE,
    TILE_BEHAVIOR_FLAG_NONE,
    TILE_BEHAVIOR_FLAG_NONE,
    TILE_BEHAVIOR_FLAG_NONE,
    TILE_BEHAVIOR_FLAG_NONE,
    TILE_BEHAVIOR_FLAG_NONE,
    TILE_BEHAVIOR_FLAG_NONE
};

BOOL MetatileBehavior_IsTallGrass(u8 tile) {
    return tile == TILE_BEHAVIOR_TALL_GRASS;
}

BOOL MetatileBehavior_IsVeryTallGrass(u8 tile) {
    return tile == TILE_BEHAVIOR_VERY_TALL_GRASS;
}

BOOL sub_0205B700(u8 tile) {
    return tile == TILE_BEHAVIOR_128;
}

BOOL MetatileBehavior_IsDoor(u8 tile) {
    return tile == TILE_BEHAVIOR_DOOR;
}

BOOL MetatileBehavior_IsWarpEntranceEast(u8 tile) {
    return tile == TILE_BEHAVIOR_WARP_ENTRANCE_EAST;
}

BOOL MetatileBehavior_IsWarpEntranceWest(u8 tile) {
    return tile == TILE_BEHAVIOR_WARP_ENTRANCE_WEST;
}

BOOL MetatileBehavior_IsWarpEntranceNorth(u8 tile) {
    return tile == TILE_BEHAVIOR_WARP_ENTRANCE_NORTH;
}

BOOL MetatileBehavior_IsWarpEntranceSouth(u8 tile) {
    return tile == TILE_BEHAVIOR_WARP_ENTRANCE_SOUTH;
}

BOOL MetatileBehavior_IsWarpEast(u8 tile) {
    return tile == TILE_BEHAVIOR_WARP_EAST;
}

BOOL MetatileBehavior_IsWarpWest(u8 tile) {
    return tile == TILE_BEHAVIOR_WARP_WEST;
}

BOOL MetatileBehavior_IsWarpNorth(u8 tile) {
    return tile == TILE_BEHAVIOR_WARP_NORTH;
}

BOOL MetatileBehavior_IsWarpSouth(u8 tile) {
    return tile == TILE_BEHAVIOR_WARP_SOUTH;
}

BOOL MetatileBehavior_IsSurfableWater(u8 tile) {
    return (sMetatileBehaviorFlags[tile] & 1) != TILE_BEHAVIOR_FLAG_NONE;
}

BOOL sub_0205B78C(u8 tile) {
    return tile == TILE_BEHAVIOR_34;
}

BOOL MetatileBehavior_IsSand(u8 tile) {
    return tile == TILE_BEHAVIOR_SAND;
}

BOOL MetatileBehavior_IsShallowWater(u8 tile) {
    return tile == TILE_BEHAVIOR_SHALLOW_WATER;
}

BOOL MetatileBehavior_IsJumpNorth(u8 tile) {
    return tile == TILE_BEHAVIOR_JUMP_NORTH;
}

BOOL MetatileBehavior_IsJumpSouth(u8 tile) {
    return tile == TILE_BEHAVIOR_JUMP_SOUTH;
}

BOOL MetatileBehavior_IsJumpWest(u8 tile) {
    return tile == TILE_BEHAVIOR_JUMP_WEST;
}

BOOL MetatileBehavior_IsJumpEast(u8 tile) {
    return tile == TILE_BEHAVIOR_JUMP_EAST;
}

BOOL MetatileBehavior_IsPC(u8 tile) {
    return tile == TILE_BEHAVIOR_PC;
}

BOOL MetatileBehavior_IsTownMap(u8 tile) {
    return tile == TILE_BEHAVIOR_TOWN_MAP;
}

BOOL MetatileBehavior_IsEscalatorFlipFace(u8 tile) {
    return tile == TILE_BEHAVIOR_ESCALATOR_FLIP_FACE;
}

BOOL MetatileBehavior_IsEscalator(u8 tile) {
    return tile == TILE_BEHAVIOR_ESCALATOR;
}

BOOL MetatileBehavior_IsWarpStairsEast(u8 tile) {
    return tile == TILE_BEHAVIOR_WARP_STAIRS_EAST;
}

BOOL MetatileBehavior_IsWarpStairsWest(u8 tile) {
    return tile == TILE_BEHAVIOR_WARP_STAIRS_WEST;
}

BOOL MetatileBehavior_IsIce(u8 tile) {
    return tile == TILE_BEHAVIOR_ICE;
}

BOOL MetatileBehavior_IsRockClimbNorthSouth(u8 tile) {
    return tile == TILE_BEHAVIOR_ROCK_CLIMB_NORTH_SOUTH;
}

BOOL MetatileBehavior_IsRockClimbEastWest(u8 tile) {
    return tile == TILE_BEHAVIOR_ROCK_CLIMB_EAST_WEST;
}

BOOL MetatileBehavior_IsSmallBookshelf1(u8 tile) {
    return tile == TILE_BEHAVIOR_SMALL_BOOKSHELF_1;
}

BOOL MetatileBehavior_IsSmallBookshelf2(u8 tile) {
    return tile == TILE_BEHAVIOR_SMALL_BOOKSHELF_2;
}

BOOL TileBehavior_IsBookshelf1(u8 tile) {
    return tile == TILE_BEHAVIOR_BOOKSHELF_1;
}

BOOL TileBehavior_IsBookshelf2(u8 tile) {
    return tile == TILE_BEHAVIOR_BOOKSHELF_2;
}

BOOL MetatileBehavior_IsEmptyTrashCan(u8 tile) {
    return tile == TILE_BEHAVIOR_EMPTY_TRASH_CAN;
}

BOOL MetatileBehavior_IsMartShelf1(u8 tile) {
    return tile == TILE_BEHAVIOR_MART_SHELF_1;
}

BOOL MetatileBehavior_IsMartShelf2(u8 tile) {
    return tile == TILE_BEHAVIOR_MART_SHELF_2;
}

BOOL MetatileBehavior_IsMartShelf3(u8 tile) {
    return tile == TILE_BEHAVIOR_MART_SHELF_3;
}

BOOL MetatileBehavior_IsMud(u8 tile) {
    return tile == TILE_BEHAVIOR_MUD;
}

BOOL MetatileBehavior_IsSnow(u8 tile) {
    return tile == TILE_BEHAVIOR_SNOW;
}

BOOL sub_0205B8C4(u8 tile) {
    return tile == TILE_BEHAVIOR_SNOW;
}

BOOL MetatileBehavior_IsCaveFloor(u8 tile) {
    return tile == TILE_BEHAVIOR_CAVE_FLOOR;
}

BOOL MetatileBehavior_IsWaterfall(u8 tile) {
    return tile == TILE_BEHAVIOR_WATERFALL;
}

BOOL MetatileBehavior_IsWhirlpool(u8 tile) {
    return tile == TILE_BEHAVIOR_WHIRLPOOL;
}

BOOL sub_0205B8F4(u8 tile) {
    return tile == TILE_BEHAVIOR_50 || tile == TILE_BEHAVIOR_52 || tile == TILE_BEHAVIOR_53 || tile == TILE_BEHAVIOR_LADDER_NORTH || tile == TILE_BEHAVIOR_73;
}

BOOL sub_0205B918(u8 tile) {
    return tile == TILE_BEHAVIOR_51 || tile == TILE_BEHAVIOR_54 || tile == TILE_BEHAVIOR_55 || tile == TILE_BEHAVIOR_LADDER_SOUTH || tile == TILE_BEHAVIOR_73;
}

BOOL sub_0205B93C(u8 tile) {
    return tile == TILE_BEHAVIOR_49 || tile == TILE_BEHAVIOR_53 || tile == TILE_BEHAVIOR_55 || tile == TILE_BEHAVIOR_74;
}

BOOL sub_0205B960(u8 tile) {
    return tile == TILE_BEHAVIOR_48 || tile == TILE_BEHAVIOR_52 || tile == TILE_BEHAVIOR_54 || tile == TILE_BEHAVIOR_74;
}

BOOL MetatileBehavior_IsPuddle(u8 tile) {
    return tile == TILE_BEHAVIOR_PUDDLE || tile == TILE_BEHAVIOR_PUDDLE_NO_SPLASHING;
}

BOOL MetatileBehavior_CanGenerateWalkingEncounters(u8 tile) {
    return (sMetatileBehaviorFlags[tile] & 2) != TILE_BEHAVIOR_FLAG_NONE;
}

BOOL MetatileBehavior_IsTV(u8 tile) {
    return tile == TILE_BEHAVIOR_TV;
}

BOOL MetatileBehavior_HasReflectiveSurface(u8 tile) {
    return tile == TILE_BEHAVIOR_WATER_RIVER || tile == TILE_BEHAVIOR_PUDDLE || tile == TILE_BEHAVIOR_PUDDLE_NO_SPLASHING || tile == TILE_BEHAVIOR_ICE || tile == TILE_BEHAVIOR_REFLECTIVE;
}

BOOL MetatileBehavior_IsSlideEast(u8 tile) {
    return tile == TILE_BEHAVIOR_SLIDE_EAST;
}

BOOL MetatileBehavior_IsSlideWest(u8 tile) {
    return tile == TILE_BEHAVIOR_SLIDE_WEST;
}

BOOL MetatileBehavior_IsSlideNorth(u8 tile) {
    return tile == TILE_BEHAVIOR_SLIDE_NORTH;
}

BOOL MetatileBehavior_IsSlideSouth(u8 tile) {
    return tile == TILE_BEHAVIOR_SLIDE_SOUTH;
}

BOOL MetatileBehavior_StopSliding(u8 tile) {
    return tile == TILE_BEHAVIOR_STOP_SLIDING;
}

BOOL MetatileBehavior_IsWarpPanel(u8 tile) {
    return tile == TILE_BEHAVIOR_WARP_PANEL;
}

BOOL sub_0205BA24(u8 tile) {
    return tile == TILE_BEHAVIOR_112;
}

BOOL sub_0205BA30(u8 tile) {
    return tile == TILE_BEHAVIOR_113 || tile == TILE_BEHAVIOR_114 || tile == TILE_BEHAVIOR_115;
}

BOOL sub_0205BA44(u8 tile) {
    return tile == TILE_BEHAVIOR_113 || tile == TILE_BEHAVIOR_114;
}

BOOL sub_0205BA54(u8 tile) {
    return tile == TILE_BEHAVIOR_115;
}

BOOL MetatileBehavior_IsNone(u8 tile) {
    return tile == TILE_BEHAVIOR_NONE;
}

u8 GetMetatileBehavior_None(void) {
    return TILE_BEHAVIOR_NONE;
}

BOOL MetatileBehavior_IsReflective(u8 tile) {
    return tile == TILE_BEHAVIOR_PUDDLE_NO_SPLASHING || tile == TILE_BEHAVIOR_ICE || tile == TILE_BEHAVIOR_REFLECTIVE;
}

BOOL sub_0205BA94(u8 tile) {
    return tile == TILE_BEHAVIOR_169;
}

BOOL MetatileBehavior_IsLadderNorth(u8 tile) {
    return tile == TILE_BEHAVIOR_LADDER_NORTH;
}

BOOL MetatileBehavior_IsLadderSouth(u8 tile) {
    return tile == TILE_BEHAVIOR_LADDER_SOUTH;
}

BOOL MetatileBehavior_IsLadderDown(u8 tile) {
    return tile == TILE_BEHAVIOR_LADDER_DOWN;
}

BOOL MetatileBehavior_IsMagma(u8 tile) {
    return tile == TILE_BEHAVIOR_MAGMA;
}

BOOL sub_0205BAD0(u8 tile) {
    return tile == TILE_BEHAVIOR_0 || tile == TILE_BEHAVIOR_SAND || tile == TILE_BEHAVIOR_MUD;
}

BOOL MetatileBehavior_IsSurfableWater_thunk(u8 tile) {
    return MetatileBehavior_IsSurfableWater(tile);
}

BOOL sub_0205BAEC(u8 tile) {
    return tile == TILE_BEHAVIOR_35;
}

BOOL MetatileBehavior_IsHeadbutt(u8 tile) {
    return tile == TILE_BEHAVIOR_HEADBUTT;
}

BOOL sub_0205BB04(u8 tile) {
    return sub_0205BA44(tile) || tile == TILE_BEHAVIOR_46;
}
