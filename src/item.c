#include "global.h"
#include "item.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "agb/constants/items.h"
#include "constants/balls.h"
#include "constants/items.h"
#include "constants/mail.h"
#include "heap.h"
#include "filesystem.h"
#include "itemtool/itemdata/item_data.naix"
#include "itemtool/itemdata/item_icon.naix"
#include "pm_string.h"
#include "msgdata.h"
#include "msgdata/msg.naix"

static const u16 sPocketCounts[POCKETS_COUNT] = {
    [POCKET_ITEMS]        = NUM_BAG_ITEMS,
    [POCKET_MEDICINE]     = NUM_BAG_MEDICINE,
    [POCKET_BALLS]        = NUM_BAG_BALLS,
    [POCKET_TMHMS]        = NUM_BAG_TMS_HMS,
    [POCKET_BERRIES]      = NUM_BAG_BERRIES,
    [POCKET_MAIL]         = NUM_BAG_MAIL,
    [POCKET_BATTLE_ITEMS] = NUM_BAG_BATTLE_ITEMS,
    [POCKET_KEY_ITEMS]    = NUM_BAG_KEY_ITEMS,
};

static const u16 sTMHMMoves[] = {
    MOVE_FOCUS_PUNCH,                  // TM01
    MOVE_DRAGON_CLAW,                  // TM02
    MOVE_WATER_PULSE,                  // TM03
    MOVE_CALM_MIND,                    // TM04
    MOVE_ROAR,                         // TM05
    MOVE_TOXIC,                        // TM06
    MOVE_HAIL,                         // TM07
    MOVE_BULK_UP,                      // TM08
    MOVE_BULLET_SEED,                  // TM09
    MOVE_HIDDEN_POWER,                 // TM10
    MOVE_SUNNY_DAY,                    // TM11
    MOVE_TAUNT,                        // TM12
    MOVE_ICE_BEAM,                     // TM13
    MOVE_BLIZZARD,                     // TM14
    MOVE_HYPER_BEAM,                   // TM15
    MOVE_LIGHT_SCREEN,                 // TM16
    MOVE_PROTECT,                      // TM17
    MOVE_RAIN_DANCE,                   // TM18
    MOVE_GIGA_DRAIN,                   // TM19
    MOVE_SAFEGUARD,                    // TM20
    MOVE_FRUSTRATION,                  // TM21
    MOVE_SOLAR_BEAM,                   // TM22
    MOVE_IRON_TAIL,                    // TM23
    MOVE_THUNDERBOLT,                  // TM24
    MOVE_THUNDER,                      // TM25
    MOVE_EARTHQUAKE,                   // TM26
    MOVE_RETURN,                       // TM27
    MOVE_DIG,                          // TM28
    MOVE_PSYCHIC,                      // TM29
    MOVE_SHADOW_BALL,                  // TM30
    MOVE_BRICK_BREAK,                  // TM31
    MOVE_DOUBLE_TEAM,                  // TM32
    MOVE_REFLECT,                      // TM33
    MOVE_SHOCK_WAVE,                   // TM34
    MOVE_FLAMETHROWER,                 // TM35
    MOVE_SLUDGE_BOMB,                  // TM36
    MOVE_SANDSTORM,                    // TM37
    MOVE_FIRE_BLAST,                   // TM38
    MOVE_ROCK_TOMB,                    // TM39
    MOVE_AERIAL_ACE,                   // TM40
    MOVE_TORMENT,                      // TM41
    MOVE_FACADE,                       // TM42
    MOVE_SECRET_POWER,                 // TM43
    MOVE_REST,                         // TM44
    MOVE_ATTRACT,                      // TM45
    MOVE_THIEF,                        // TM46
    MOVE_STEEL_WING,                   // TM47
    MOVE_SKILL_SWAP,                   // TM48
    MOVE_SNATCH,                       // TM49
    MOVE_OVERHEAT,                     // TM50
    MOVE_ROOST,                        // TM51
    MOVE_FOCUS_BLAST,                  // TM52
    MOVE_ENERGY_BALL,                  // TM53
    MOVE_FALSE_SWIPE,                  // TM54
    MOVE_BRINE,                        // TM55
    MOVE_FLING,                        // TM56
    MOVE_CHARGE_BEAM,                  // TM57
    MOVE_ENDURE,                       // TM58
    MOVE_DRAGON_PULSE,                 // TM59
    MOVE_DRAIN_PUNCH,                  // TM60
    MOVE_WILL_O_WISP,                  // TM61
    MOVE_SILVER_WIND,                  // TM62
    MOVE_EMBARGO,                      // TM63
    MOVE_EXPLOSION,                    // TM64
    MOVE_SHADOW_CLAW,                  // TM65
    MOVE_PAYBACK,                      // TM66
    MOVE_RECYCLE,                      // TM67
    MOVE_GIGA_IMPACT,                  // TM68
    MOVE_ROCK_POLISH,                  // TM69
    MOVE_FLASH,                        // TM70
    MOVE_STONE_EDGE,                   // TM71
    MOVE_AVALANCHE,                    // TM72
    MOVE_THUNDER_WAVE,                 // TM73
    MOVE_GYRO_BALL,                    // TM74
    MOVE_SWORDS_DANCE,                 // TM75
    MOVE_STEALTH_ROCK,                 // TM76
    MOVE_PSYCH_UP,                     // TM77
    MOVE_CAPTIVATE,                    // TM78
    MOVE_DARK_PULSE,                   // TM79
    MOVE_ROCK_SLIDE,                   // TM80
    MOVE_X_SCISSOR,                    // TM81
    MOVE_SLEEP_TALK,                   // TM82
    MOVE_NATURAL_GIFT,                 // TM83
    MOVE_POISON_JAB,                   // TM84
    MOVE_DREAM_EATER,                  // TM85
    MOVE_GRASS_KNOT,                   // TM86
    MOVE_SWAGGER,                      // TM87
    MOVE_PLUCK,                        // TM88
    MOVE_U_TURN,                       // TM89
    MOVE_SUBSTITUTE,                   // TM90
    MOVE_FLASH_CANNON,                 // TM91
    MOVE_TRICK_ROOM,                   // TM92
    MOVE_CUT,                          // HM01
    MOVE_FLY,                          // HM02
    MOVE_SURF,                         // HM03
    MOVE_STRENGTH,                     // HM04
    MOVE_WHIRLPOOL,                    // HM05
    MOVE_ROCK_SMASH,                   // HM06
    MOVE_WATERFALL,                    // HM07
    MOVE_ROCK_CLIMB,                   // HM08
};

static const u16 sItemNarcIds[ITEMS_COUNT][4] = {
    [ITEM_NONE]         = { NARC_item_data_0000_bin, NARC_item_icon_item_icon_793_NCGR, NARC_item_icon_item_icon_794_NCLR, AGB_ITEM_NONE },
    [ITEM_MASTER_BALL]  = { NARC_item_data_0001_bin, NARC_item_icon_item_icon_002_NCGR, NARC_item_icon_item_icon_003_NCLR, AGB_ITEM_MASTER_BALL },
    [ITEM_ULTRA_BALL]   = { NARC_item_data_0002_bin, NARC_item_icon_item_icon_004_NCGR, NARC_item_icon_item_icon_005_NCLR, AGB_ITEM_ULTRA_BALL },
    [ITEM_GREAT_BALL]   = { NARC_item_data_0003_bin, NARC_item_icon_item_icon_006_NCGR, NARC_item_icon_item_icon_007_NCLR, AGB_ITEM_GREAT_BALL },
    [ITEM_POKE_BALL]    = { NARC_item_data_0004_bin, NARC_item_icon_item_icon_008_NCGR, NARC_item_icon_item_icon_009_NCLR, AGB_ITEM_POKE_BALL },
    [ITEM_SAFARI_BALL]  = { NARC_item_data_0005_bin, NARC_item_icon_item_icon_010_NCGR, NARC_item_icon_item_icon_011_NCLR, AGB_ITEM_SAFARI_BALL },
    [ITEM_NET_BALL]     = { NARC_item_data_0006_bin, NARC_item_icon_item_icon_012_NCGR, NARC_item_icon_item_icon_013_NCLR, AGB_ITEM_NET_BALL },
    [ITEM_DIVE_BALL]    = { NARC_item_data_0007_bin, NARC_item_icon_item_icon_014_NCGR, NARC_item_icon_item_icon_015_NCLR, AGB_ITEM_DIVE_BALL },
    [ITEM_NEST_BALL]    = { NARC_item_data_0008_bin, NARC_item_icon_item_icon_016_NCGR, NARC_item_icon_item_icon_017_NCLR, AGB_ITEM_NEST_BALL },
    [ITEM_REPEAT_BALL]  = { NARC_item_data_0009_bin, NARC_item_icon_item_icon_018_NCGR, NARC_item_icon_item_icon_019_NCLR, AGB_ITEM_REPEAT_BALL },
    [ITEM_TIMER_BALL]   = { NARC_item_data_0010_bin, NARC_item_icon_item_icon_020_NCGR, NARC_item_icon_item_icon_019_NCLR, AGB_ITEM_TIMER_BALL },
    [ITEM_LUXURY_BALL]  = { NARC_item_data_0011_bin, NARC_item_icon_item_icon_021_NCGR, NARC_item_icon_item_icon_022_NCLR, AGB_ITEM_LUXURY_BALL },
    [ITEM_PREMIER_BALL] = { NARC_item_data_0012_bin, NARC_item_icon_item_icon_023_NCGR, NARC_item_icon_item_icon_022_NCLR, AGB_ITEM_PREMIER_BALL },
    [ITEM_DUSK_BALL]    = { NARC_item_data_0013_bin, NARC_item_icon_item_icon_663_NCGR, NARC_item_icon_item_icon_664_NCLR, AGB_ITEM_NONE },
    [ITEM_HEAL_BALL]    = { NARC_item_data_0014_bin, NARC_item_icon_item_icon_665_NCGR, NARC_item_icon_item_icon_666_NCLR, AGB_ITEM_NONE },
    [ITEM_QUICK_BALL]   = { NARC_item_data_0015_bin, NARC_item_icon_item_icon_667_NCGR, NARC_item_icon_item_icon_668_NCLR, AGB_ITEM_NONE },
    [ITEM_CHERISH_BALL] = { NARC_item_data_0016_bin, NARC_item_icon_item_icon_669_NCGR, NARC_item_icon_item_icon_670_NCLR, AGB_ITEM_NONE },
    [ITEM_POTION]       = { NARC_item_data_0017_bin, NARC_item_icon_item_icon_024_NCGR, NARC_item_icon_item_icon_025_NCLR, AGB_ITEM_POTION },
    [ITEM_ANTIDOTE]     = { NARC_item_data_0018_bin, NARC_item_icon_item_icon_026_NCGR, NARC_item_icon_item_icon_027_NCLR, AGB_ITEM_ANTIDOTE },
    [ITEM_BURN_HEAL]    = { NARC_item_data_0019_bin, NARC_item_icon_item_icon_030_NCGR, NARC_item_icon_item_icon_028_NCLR, AGB_ITEM_BURN_HEAL },
    [ITEM_ICE_HEAL]     = { NARC_item_data_0020_bin, NARC_item_icon_item_icon_030_NCGR, NARC_item_icon_item_icon_029_NCLR, AGB_ITEM_ICE_HEAL },
    [ITEM_AWAKENING]    = { NARC_item_data_0021_bin, NARC_item_icon_item_icon_030_NCGR, NARC_item_icon_item_icon_031_NCLR, AGB_ITEM_AWAKENING },
    [ITEM_PARLYZ_HEAL]  = { NARC_item_data_0022_bin, NARC_item_icon_item_icon_030_NCGR, NARC_item_icon_item_icon_032_NCLR, AGB_ITEM_PARALYZE_HEAL },
    [ITEM_FULL_RESTORE] = { NARC_item_data_0023_bin, NARC_item_icon_item_icon_033_NCGR, NARC_item_icon_item_icon_034_NCLR, AGB_ITEM_FULL_RESTORE },
    [ITEM_MAX_POTION]   = { NARC_item_data_0024_bin, NARC_item_icon_item_icon_033_NCGR, NARC_item_icon_item_icon_035_NCLR, AGB_ITEM_MAX_POTION },
    [ITEM_HYPER_POTION] = { NARC_item_data_0025_bin, NARC_item_icon_item_icon_024_NCGR, NARC_item_icon_item_icon_036_NCLR, AGB_ITEM_HYPER_POTION },
    [ITEM_SUPER_POTION] = { NARC_item_data_0026_bin, NARC_item_icon_item_icon_024_NCGR, NARC_item_icon_item_icon_037_NCLR, AGB_ITEM_SUPER_POTION },
    [ITEM_FULL_HEAL]    = { NARC_item_data_0027_bin, NARC_item_icon_item_icon_038_NCGR, NARC_item_icon_item_icon_039_NCLR, AGB_ITEM_FULL_HEAL },
    [ITEM_REVIVE]       = { NARC_item_data_0028_bin, NARC_item_icon_item_icon_040_NCGR, NARC_item_icon_item_icon_042_NCLR, AGB_ITEM_REVIVE },
    [ITEM_MAX_REVIVE]   = { NARC_item_data_0029_bin, NARC_item_icon_item_icon_041_NCGR, NARC_item_icon_item_icon_042_NCLR, AGB_ITEM_MAX_REVIVE },
    [ITEM_FRESH_WATER]  = { NARC_item_data_0030_bin, NARC_item_icon_item_icon_043_NCGR, NARC_item_icon_item_icon_044_NCLR, AGB_ITEM_FRESH_WATER },
    [ITEM_SODA_POP]     = { NARC_item_data_0031_bin, NARC_item_icon_item_icon_045_NCGR, NARC_item_icon_item_icon_046_NCLR, AGB_ITEM_SODA_POP },
    [ITEM_LEMONADE]     = { NARC_item_data_0032_bin, NARC_item_icon_item_icon_047_NCGR, NARC_item_icon_item_icon_048_NCLR, AGB_ITEM_LEMONADE },
    [ITEM_MOOMOO_MILK]  = { NARC_item_data_0033_bin, NARC_item_icon_item_icon_049_NCGR, NARC_item_icon_item_icon_050_NCLR, AGB_ITEM_MOOMOO_MILK },
    [ITEM_ENERGYPOWDER] = { NARC_item_data_0034_bin, NARC_item_icon_item_icon_051_NCGR, NARC_item_icon_item_icon_052_NCLR, AGB_ITEM_ENERGY_POWDER },
    [ITEM_ENERGY_ROOT]  = { NARC_item_data_0035_bin, NARC_item_icon_item_icon_053_NCGR, NARC_item_icon_item_icon_054_NCLR, AGB_ITEM_ENERGY_ROOT },
    [ITEM_HEAL_POWDER]  = { NARC_item_data_0036_bin, NARC_item_icon_item_icon_051_NCGR, NARC_item_icon_item_icon_055_NCLR, AGB_ITEM_HEAL_POWDER },
    [ITEM_REVIVAL_HERB] = { NARC_item_data_0037_bin, NARC_item_icon_item_icon_056_NCGR, NARC_item_icon_item_icon_057_NCLR, AGB_ITEM_REVIVAL_HERB },
    [ITEM_ETHER]        = { NARC_item_data_0038_bin, NARC_item_icon_item_icon_058_NCGR, NARC_item_icon_item_icon_059_NCLR, AGB_ITEM_ETHER },
    [ITEM_MAX_ETHER]    = { NARC_item_data_0039_bin, NARC_item_icon_item_icon_058_NCGR, NARC_item_icon_item_icon_060_NCLR, AGB_ITEM_MAX_ETHER },
    [ITEM_ELIXIR]       = { NARC_item_data_0040_bin, NARC_item_icon_item_icon_058_NCGR, NARC_item_icon_item_icon_061_NCLR, AGB_ITEM_ELIXIR },
    [ITEM_MAX_ELIXIR]   = { NARC_item_data_0041_bin, NARC_item_icon_item_icon_058_NCGR, NARC_item_icon_item_icon_062_NCLR, AGB_ITEM_MAX_ELIXIR },
    [ITEM_LAVA_COOKIE]  = { NARC_item_data_0042_bin, NARC_item_icon_item_icon_063_NCGR, NARC_item_icon_item_icon_064_NCLR, AGB_ITEM_LAVA_COOKIE },
    [ITEM_BERRY_JUICE]  = { NARC_item_data_0043_bin, NARC_item_icon_item_icon_071_NCGR, NARC_item_icon_item_icon_072_NCLR, AGB_ITEM_BERRY_JUICE },
    [ITEM_SACRED_ASH]   = { NARC_item_data_0044_bin, NARC_item_icon_item_icon_073_NCGR, NARC_item_icon_item_icon_074_NCLR, AGB_ITEM_SACRED_ASH },
    [ITEM_HP_UP]        = { NARC_item_data_0045_bin, NARC_item_icon_item_icon_083_NCGR, NARC_item_icon_item_icon_084_NCLR, AGB_ITEM_HP_UP },
    [ITEM_PROTEIN]      = { NARC_item_data_0046_bin, NARC_item_icon_item_icon_085_NCGR, NARC_item_icon_item_icon_086_NCLR, AGB_ITEM_PROTEIN },
    [ITEM_IRON]         = { NARC_item_data_0047_bin, NARC_item_icon_item_icon_085_NCGR, NARC_item_icon_item_icon_087_NCLR, AGB_ITEM_IRON },
    [ITEM_CARBOS]       = { NARC_item_data_0048_bin, NARC_item_icon_item_icon_085_NCGR, NARC_item_icon_item_icon_088_NCLR, AGB_ITEM_CARBOS },
    [ITEM_CALCIUM]      = { NARC_item_data_0049_bin, NARC_item_icon_item_icon_085_NCGR, NARC_item_icon_item_icon_089_NCLR, AGB_ITEM_CALCIUM },
    [ITEM_RARE_CANDY]   = { NARC_item_data_0050_bin, NARC_item_icon_item_icon_090_NCGR, NARC_item_icon_item_icon_091_NCLR, AGB_ITEM_RARE_CANDY },
    [ITEM_PP_UP]        = { NARC_item_data_0051_bin, NARC_item_icon_item_icon_092_NCGR, NARC_item_icon_item_icon_093_NCLR, AGB_ITEM_PP_UP },
    [ITEM_ZINC]         = { NARC_item_data_0052_bin, NARC_item_icon_item_icon_085_NCGR, NARC_item_icon_item_icon_094_NCLR, AGB_ITEM_ZINC },
    [ITEM_PP_MAX]       = { NARC_item_data_0053_bin, NARC_item_icon_item_icon_095_NCGR, NARC_item_icon_item_icon_096_NCLR, AGB_ITEM_PP_MAX },
    [ITEM_OLD_GATEAU]   = { NARC_item_data_0054_bin, NARC_item_icon_item_icon_466_NCGR, NARC_item_icon_item_icon_467_NCLR, AGB_ITEM_NONE },
    [ITEM_GUARD_SPEC_]  = { NARC_item_data_0055_bin, NARC_item_icon_item_icon_100_NCGR, NARC_item_icon_item_icon_097_NCLR, AGB_ITEM_POKEHEARTGOLD_AGB_SPEC },
    [ITEM_DIRE_HIT]     = { NARC_item_data_0056_bin, NARC_item_icon_item_icon_100_NCGR, NARC_item_icon_item_icon_098_NCLR, AGB_ITEM_DIRE_HIT },
    [ITEM_X_ATTACK]     = { NARC_item_data_0057_bin, NARC_item_icon_item_icon_100_NCGR, NARC_item_icon_item_icon_099_NCLR, AGB_ITEM_X_ATTACK },
    [ITEM_X_DEFENSE]    = { NARC_item_data_0058_bin, NARC_item_icon_item_icon_100_NCGR, NARC_item_icon_item_icon_101_NCLR, AGB_ITEM_X_DEFEND },
    [ITEM_X_SPEED]      = { NARC_item_data_0059_bin, NARC_item_icon_item_icon_100_NCGR, NARC_item_icon_item_icon_102_NCLR, AGB_ITEM_X_SPEED },
    [ITEM_X_ACCURACY]   = { NARC_item_data_0060_bin, NARC_item_icon_item_icon_100_NCGR, NARC_item_icon_item_icon_103_NCLR, AGB_ITEM_X_ACCURACY },
    [ITEM_X_SPECIAL]    = { NARC_item_data_0061_bin, NARC_item_icon_item_icon_100_NCGR, NARC_item_icon_item_icon_104_NCLR, AGB_ITEM_X_SPECIAL },
    [ITEM_X_SP__DEF]    = { NARC_item_data_0062_bin, NARC_item_icon_item_icon_100_NCGR, NARC_item_icon_item_icon_469_NCLR, AGB_ITEM_NONE },
    [ITEM_POKE_DOLL]    = { NARC_item_data_0063_bin, NARC_item_icon_item_icon_105_NCGR, NARC_item_icon_item_icon_106_NCLR, AGB_ITEM_POKE_DOLL },
    [ITEM_FLUFFY_TAIL]  = { NARC_item_data_0064_bin, NARC_item_icon_item_icon_107_NCGR, NARC_item_icon_item_icon_108_NCLR, AGB_ITEM_FLUFFY_TAIL },
    [ITEM_BLUE_FLUTE]   = { NARC_item_data_0065_bin, NARC_item_icon_item_icon_065_NCGR, NARC_item_icon_item_icon_066_NCLR, AGB_ITEM_BLUE_FLUTE },
    [ITEM_YELLOW_FLUTE] = { NARC_item_data_0066_bin, NARC_item_icon_item_icon_065_NCGR, NARC_item_icon_item_icon_067_NCLR, AGB_ITEM_YELLOW_FLUTE },
    [ITEM_RED_FLUTE]    = { NARC_item_data_0067_bin, NARC_item_icon_item_icon_065_NCGR, NARC_item_icon_item_icon_068_NCLR, AGB_ITEM_RED_FLUTE },
    [ITEM_BLACK_FLUTE]  = { NARC_item_data_0068_bin, NARC_item_icon_item_icon_065_NCGR, NARC_item_icon_item_icon_069_NCLR, AGB_ITEM_BLACK_FLUTE },
    [ITEM_WHITE_FLUTE]  = { NARC_item_data_0069_bin, NARC_item_icon_item_icon_065_NCGR, NARC_item_icon_item_icon_070_NCLR, AGB_ITEM_WHITE_FLUTE },
    [ITEM_SHOAL_SALT]   = { NARC_item_data_0070_bin, NARC_item_icon_item_icon_051_NCGR, NARC_item_icon_item_icon_075_NCLR, AGB_ITEM_SHOAL_SALT },
    [ITEM_SHOAL_SHELL]  = { NARC_item_data_0071_bin, NARC_item_icon_item_icon_076_NCGR, NARC_item_icon_item_icon_077_NCLR, AGB_ITEM_SHOAL_SHELL },
    [ITEM_RED_SHARD]    = { NARC_item_data_0072_bin, NARC_item_icon_item_icon_078_NCGR, NARC_item_icon_item_icon_079_NCLR, AGB_ITEM_RED_SHARD },
    [ITEM_BLUE_SHARD]   = { NARC_item_data_0073_bin, NARC_item_icon_item_icon_078_NCGR, NARC_item_icon_item_icon_080_NCLR, AGB_ITEM_BLUE_SHARD },
    [ITEM_YELLOW_SHARD] = { NARC_item_data_0074_bin, NARC_item_icon_item_icon_078_NCGR, NARC_item_icon_item_icon_081_NCLR, AGB_ITEM_YELLOW_SHARD },
    [ITEM_GREEN_SHARD]  = { NARC_item_data_0075_bin, NARC_item_icon_item_icon_078_NCGR, NARC_item_icon_item_icon_082_NCLR, AGB_ITEM_GREEN_SHARD },
    [ITEM_SUPER_REPEL]  = { NARC_item_data_0076_bin, NARC_item_icon_item_icon_109_NCGR, NARC_item_icon_item_icon_110_NCLR, AGB_ITEM_SUPER_REPEL },
    [ITEM_MAX_REPEL]    = { NARC_item_data_0077_bin, NARC_item_icon_item_icon_109_NCGR, NARC_item_icon_item_icon_111_NCLR, AGB_ITEM_MAX_REPEL },
    [ITEM_ESCAPE_ROPE]  = { NARC_item_data_0078_bin, NARC_item_icon_item_icon_112_NCGR, NARC_item_icon_item_icon_113_NCLR, AGB_ITEM_ESCAPE_ROPE },
    [ITEM_REPEL]        = { NARC_item_data_0079_bin, NARC_item_icon_item_icon_109_NCGR, NARC_item_icon_item_icon_114_NCLR, AGB_ITEM_REPEL },
    [ITEM_SUN_STONE]    = { NARC_item_data_0080_bin, NARC_item_icon_item_icon_115_NCGR, NARC_item_icon_item_icon_116_NCLR, AGB_ITEM_SUN_STONE },
    [ITEM_MOON_STONE]   = { NARC_item_data_0081_bin, NARC_item_icon_item_icon_117_NCGR, NARC_item_icon_item_icon_118_NCLR, AGB_ITEM_MOON_STONE },
    [ITEM_FIRE_STONE]   = { NARC_item_data_0082_bin, NARC_item_icon_item_icon_119_NCGR, NARC_item_icon_item_icon_120_NCLR, AGB_ITEM_FIRE_STONE },
    [ITEM_THUNDERSTONE] = { NARC_item_data_0083_bin, NARC_item_icon_item_icon_121_NCGR, NARC_item_icon_item_icon_122_NCLR, AGB_ITEM_THUNDER_STONE },
    [ITEM_WATER_STONE]  = { NARC_item_data_0084_bin, NARC_item_icon_item_icon_123_NCGR, NARC_item_icon_item_icon_124_NCLR, AGB_ITEM_WATER_STONE },
    [ITEM_LEAF_STONE]   = { NARC_item_data_0085_bin, NARC_item_icon_item_icon_125_NCGR, NARC_item_icon_item_icon_126_NCLR, AGB_ITEM_LEAF_STONE },
    [ITEM_TINYMUSHROOM] = { NARC_item_data_0086_bin, NARC_item_icon_item_icon_127_NCGR, NARC_item_icon_item_icon_129_NCLR, AGB_ITEM_TINY_MUSHROOM },
    [ITEM_BIG_MUSHROOM] = { NARC_item_data_0087_bin, NARC_item_icon_item_icon_128_NCGR, NARC_item_icon_item_icon_129_NCLR, AGB_ITEM_BIG_MUSHROOM },
    [ITEM_PEARL]        = { NARC_item_data_0088_bin, NARC_item_icon_item_icon_130_NCGR, NARC_item_icon_item_icon_131_NCLR, AGB_ITEM_PEARL },
    [ITEM_BIG_PEARL]    = { NARC_item_data_0089_bin, NARC_item_icon_item_icon_132_NCGR, NARC_item_icon_item_icon_131_NCLR, AGB_ITEM_BIG_PEARL },
    [ITEM_STARDUST]     = { NARC_item_data_0090_bin, NARC_item_icon_item_icon_133_NCGR, NARC_item_icon_item_icon_134_NCLR, AGB_ITEM_STARDUST },
    [ITEM_STAR_PIECE]   = { NARC_item_data_0091_bin, NARC_item_icon_item_icon_135_NCGR, NARC_item_icon_item_icon_134_NCLR, AGB_ITEM_STAR_PIECE },
    [ITEM_NUGGET]       = { NARC_item_data_0092_bin, NARC_item_icon_item_icon_136_NCGR, NARC_item_icon_item_icon_137_NCLR, AGB_ITEM_NUGGET },
    [ITEM_HEART_SCALE]  = { NARC_item_data_0093_bin, NARC_item_icon_item_icon_138_NCGR, NARC_item_icon_item_icon_139_NCLR, AGB_ITEM_HEART_SCALE },
    [ITEM_HONEY]        = { NARC_item_data_0094_bin, NARC_item_icon_item_icon_470_NCGR, NARC_item_icon_item_icon_471_NCLR, AGB_ITEM_NONE },
    [ITEM_GROWTH_MULCH] = { NARC_item_data_0095_bin, NARC_item_icon_item_icon_472_NCGR, NARC_item_icon_item_icon_473_NCLR, AGB_ITEM_NONE },
    [ITEM_DAMP_MULCH]   = { NARC_item_data_0096_bin, NARC_item_icon_item_icon_474_NCGR, NARC_item_icon_item_icon_475_NCLR, AGB_ITEM_NONE },
    [ITEM_STABLE_MULCH] = { NARC_item_data_0097_bin, NARC_item_icon_item_icon_476_NCGR, NARC_item_icon_item_icon_477_NCLR, AGB_ITEM_NONE },
    [ITEM_GOOEY_MULCH]  = { NARC_item_data_0098_bin, NARC_item_icon_item_icon_478_NCGR, NARC_item_icon_item_icon_479_NCLR, AGB_ITEM_NONE },
    [ITEM_ROOT_FOSSIL]  = { NARC_item_data_0099_bin, NARC_item_icon_item_icon_392_NCGR, NARC_item_icon_item_icon_393_NCLR, AGB_ITEM_ROOT_FOSSIL },
    [ITEM_CLAW_FOSSIL]  = { NARC_item_data_0100_bin, NARC_item_icon_item_icon_394_NCGR, NARC_item_icon_item_icon_393_NCLR, AGB_ITEM_CLAW_FOSSIL },
    [ITEM_HELIX_FOSSIL] = { NARC_item_data_0101_bin, NARC_item_icon_item_icon_431_NCGR, NARC_item_icon_item_icon_432_NCLR, AGB_ITEM_HELIX_FOSSIL },
    [ITEM_DOME_FOSSIL]  = { NARC_item_data_0102_bin, NARC_item_icon_item_icon_433_NCGR, NARC_item_icon_item_icon_432_NCLR, AGB_ITEM_DOME_FOSSIL },
    [ITEM_OLD_AMBER]    = { NARC_item_data_0103_bin, NARC_item_icon_item_icon_425_NCGR, NARC_item_icon_item_icon_426_NCLR, AGB_ITEM_OLD_AMBER },
    [ITEM_ARMOR_FOSSIL] = { NARC_item_data_0104_bin, NARC_item_icon_item_icon_617_NCGR, NARC_item_icon_item_icon_618_NCLR, AGB_ITEM_NONE },
    [ITEM_SKULL_FOSSIL] = { NARC_item_data_0105_bin, NARC_item_icon_item_icon_615_NCGR, NARC_item_icon_item_icon_616_NCLR, AGB_ITEM_NONE },
    [ITEM_RARE_BONE]    = { NARC_item_data_0106_bin, NARC_item_icon_item_icon_337_NCGR, NARC_item_icon_item_icon_338_NCLR, AGB_ITEM_NONE },
    [ITEM_SHINY_STONE]  = { NARC_item_data_0107_bin, NARC_item_icon_item_icon_480_NCGR, NARC_item_icon_item_icon_481_NCLR, AGB_ITEM_NONE },
    [ITEM_DUSK_STONE]   = { NARC_item_data_0108_bin, NARC_item_icon_item_icon_482_NCGR, NARC_item_icon_item_icon_483_NCLR, AGB_ITEM_NONE },
    [ITEM_DAWN_STONE]   = { NARC_item_data_0109_bin, NARC_item_icon_item_icon_484_NCGR, NARC_item_icon_item_icon_485_NCLR, AGB_ITEM_NONE },
    [ITEM_OVAL_STONE]   = { NARC_item_data_0110_bin, NARC_item_icon_item_icon_486_NCGR, NARC_item_icon_item_icon_487_NCLR, AGB_ITEM_NONE },
    [ITEM_ODD_KEYSTONE] = { NARC_item_data_0111_bin, NARC_item_icon_item_icon_488_NCGR, NARC_item_icon_item_icon_489_NCLR, AGB_ITEM_NONE },
    [ITEM_GRISEOUS_ORB] = { NARC_item_data_0112_bin, NARC_item_icon_item_icon_699_NCGR, NARC_item_icon_item_icon_700_NCLR, AGB_ITEM_NONE },
    [ITEM_UNUSED_113]   = { NARC_item_data_0000_bin, NARC_item_icon_item_icon_793_NCGR, NARC_item_icon_item_icon_794_NCLR, AGB_ITEM_NONE },
    [ITEM_UNUSED_114]   = { NARC_item_data_0000_bin, NARC_item_icon_item_icon_793_NCGR, NARC_item_icon_item_icon_794_NCLR, AGB_ITEM_NONE },
    [ITEM_UNUSED_115]   = { NARC_item_data_0000_bin, NARC_item_icon_item_icon_793_NCGR, NARC_item_icon_item_icon_794_NCLR, AGB_ITEM_NONE },
    [ITEM_UNUSED_116]   = { NARC_item_data_0000_bin, NARC_item_icon_item_icon_793_NCGR, NARC_item_icon_item_icon_794_NCLR, AGB_ITEM_NONE },
    [ITEM_UNUSED_117]   = { NARC_item_data_0000_bin, NARC_item_icon_item_icon_793_NCGR, NARC_item_icon_item_icon_794_NCLR, AGB_ITEM_NONE },
    [ITEM_UNUSED_118]   = { NARC_item_data_0000_bin, NARC_item_icon_item_icon_793_NCGR, NARC_item_icon_item_icon_794_NCLR, AGB_ITEM_NONE },
    [ITEM_UNUSED_119]   = { NARC_item_data_0000_bin, NARC_item_icon_item_icon_793_NCGR, NARC_item_icon_item_icon_794_NCLR, AGB_ITEM_NONE },
    [ITEM_UNUSED_120]   = { NARC_item_data_0000_bin, NARC_item_icon_item_icon_793_NCGR, NARC_item_icon_item_icon_794_NCLR, AGB_ITEM_NONE },
    [ITEM_UNUSED_121]   = { NARC_item_data_0000_bin, NARC_item_icon_item_icon_793_NCGR, NARC_item_icon_item_icon_794_NCLR, AGB_ITEM_NONE },
    [ITEM_UNUSED_122]   = { NARC_item_data_0000_bin, NARC_item_icon_item_icon_793_NCGR, NARC_item_icon_item_icon_794_NCLR, AGB_ITEM_NONE },
    [ITEM_UNUSED_123]   = { NARC_item_data_0000_bin, NARC_item_icon_item_icon_793_NCGR, NARC_item_icon_item_icon_794_NCLR, AGB_ITEM_NONE },
    [ITEM_UNUSED_124]   = { NARC_item_data_0000_bin, NARC_item_icon_item_icon_793_NCGR, NARC_item_icon_item_icon_794_NCLR, AGB_ITEM_NONE },
    [ITEM_UNUSED_125]   = { NARC_item_data_0000_bin, NARC_item_icon_item_icon_793_NCGR, NARC_item_icon_item_icon_794_NCLR, AGB_ITEM_NONE },
    [ITEM_UNUSED_126]   = { NARC_item_data_0000_bin, NARC_item_icon_item_icon_793_NCGR, NARC_item_icon_item_icon_794_NCLR, AGB_ITEM_NONE },
    [ITEM_UNUSED_127]   = { NARC_item_data_0000_bin, NARC_item_icon_item_icon_793_NCGR, NARC_item_icon_item_icon_794_NCLR, AGB_ITEM_NONE },
    [ITEM_UNUSED_128]   = { NARC_item_data_0000_bin, NARC_item_icon_item_icon_793_NCGR, NARC_item_icon_item_icon_794_NCLR, AGB_ITEM_NONE },
    [ITEM_UNUSED_129]   = { NARC_item_data_0000_bin, NARC_item_icon_item_icon_793_NCGR, NARC_item_icon_item_icon_794_NCLR, AGB_ITEM_NONE },
    [ITEM_UNUSED_130]   = { NARC_item_data_0000_bin, NARC_item_icon_item_icon_793_NCGR, NARC_item_icon_item_icon_794_NCLR, AGB_ITEM_NONE },
    [ITEM_UNUSED_131]   = { NARC_item_data_0000_bin, NARC_item_icon_item_icon_793_NCGR, NARC_item_icon_item_icon_794_NCLR, AGB_ITEM_NONE },
    [ITEM_UNUSED_132]   = { NARC_item_data_0000_bin, NARC_item_icon_item_icon_793_NCGR, NARC_item_icon_item_icon_794_NCLR, AGB_ITEM_NONE },
    [ITEM_UNUSED_133]   = { NARC_item_data_0000_bin, NARC_item_icon_item_icon_793_NCGR, NARC_item_icon_item_icon_794_NCLR, AGB_ITEM_NONE },
    [ITEM_UNUSED_134]   = { NARC_item_data_0000_bin, NARC_item_icon_item_icon_793_NCGR, NARC_item_icon_item_icon_794_NCLR, AGB_ITEM_NONE },
    [ITEM_ADAMANT_ORB]  = { NARC_item_data_0113_bin, NARC_item_icon_item_icon_648_NCGR, NARC_item_icon_item_icon_649_NCLR, AGB_ITEM_NONE },
    [ITEM_LUSTROUS_ORB] = { NARC_item_data_0114_bin, NARC_item_icon_item_icon_646_NCGR, NARC_item_icon_item_icon_647_NCLR, AGB_ITEM_NONE },
    [ITEM_GRASS_MAIL]   = { NARC_item_data_0115_bin, NARC_item_icon_item_icon_140_NCGR, NARC_item_icon_item_icon_141_NCLR, AGB_ITEM_NONE },
    [ITEM_FLAME_MAIL]   = { NARC_item_data_0116_bin, NARC_item_icon_item_icon_142_NCGR, NARC_item_icon_item_icon_143_NCLR, AGB_ITEM_NONE },
    [ITEM_BUBBLE_MAIL]  = { NARC_item_data_0117_bin, NARC_item_icon_item_icon_144_NCGR, NARC_item_icon_item_icon_145_NCLR, AGB_ITEM_NONE },
    [ITEM_BLOOM_MAIL]   = { NARC_item_data_0118_bin, NARC_item_icon_item_icon_146_NCGR, NARC_item_icon_item_icon_147_NCLR, AGB_ITEM_NONE },
    [ITEM_TUNNEL_MAIL]  = { NARC_item_data_0119_bin, NARC_item_icon_item_icon_148_NCGR, NARC_item_icon_item_icon_149_NCLR, AGB_ITEM_NONE },
    [ITEM_STEEL_MAIL]   = { NARC_item_data_0120_bin, NARC_item_icon_item_icon_150_NCGR, NARC_item_icon_item_icon_151_NCLR, AGB_ITEM_NONE },
    [ITEM_HEART_MAIL]   = { NARC_item_data_0121_bin, NARC_item_icon_item_icon_152_NCGR, NARC_item_icon_item_icon_153_NCLR, AGB_ITEM_NONE },
    [ITEM_SNOW_MAIL]    = { NARC_item_data_0122_bin, NARC_item_icon_item_icon_154_NCGR, NARC_item_icon_item_icon_155_NCLR, AGB_ITEM_NONE },
    [ITEM_SPACE_MAIL]   = { NARC_item_data_0123_bin, NARC_item_icon_item_icon_156_NCGR, NARC_item_icon_item_icon_157_NCLR, AGB_ITEM_NONE },
    [ITEM_AIR_MAIL]     = { NARC_item_data_0124_bin, NARC_item_icon_item_icon_158_NCGR, NARC_item_icon_item_icon_159_NCLR, AGB_ITEM_NONE },
    [ITEM_MOSAIC_MAIL]  = { NARC_item_data_0125_bin, NARC_item_icon_item_icon_160_NCGR, NARC_item_icon_item_icon_161_NCLR, AGB_ITEM_NONE },
    [ITEM_BRICK_MAIL]   = { NARC_item_data_0126_bin, NARC_item_icon_item_icon_162_NCGR, NARC_item_icon_item_icon_163_NCLR, AGB_ITEM_NONE },
    [ITEM_CHERI_BERRY]  = { NARC_item_data_0127_bin, NARC_item_icon_item_icon_164_NCGR, NARC_item_icon_item_icon_165_NCLR, AGB_ITEM_CHERI_BERRY },
    [ITEM_CHESTO_BERRY] = { NARC_item_data_0128_bin, NARC_item_icon_item_icon_166_NCGR, NARC_item_icon_item_icon_167_NCLR, AGB_ITEM_CHESTO_BERRY },
    [ITEM_PECHA_BERRY]  = { NARC_item_data_0129_bin, NARC_item_icon_item_icon_168_NCGR, NARC_item_icon_item_icon_169_NCLR, AGB_ITEM_PECHA_BERRY },
    [ITEM_RAWST_BERRY]  = { NARC_item_data_0130_bin, NARC_item_icon_item_icon_170_NCGR, NARC_item_icon_item_icon_171_NCLR, AGB_ITEM_RAWST_BERRY },
    [ITEM_ASPEAR_BERRY] = { NARC_item_data_0131_bin, NARC_item_icon_item_icon_172_NCGR, NARC_item_icon_item_icon_173_NCLR, AGB_ITEM_ASPEAR_BERRY },
    [ITEM_LEPPA_BERRY]  = { NARC_item_data_0132_bin, NARC_item_icon_item_icon_174_NCGR, NARC_item_icon_item_icon_175_NCLR, AGB_ITEM_LEPPA_BERRY },
    [ITEM_ORAN_BERRY]   = { NARC_item_data_0133_bin, NARC_item_icon_item_icon_176_NCGR, NARC_item_icon_item_icon_177_NCLR, AGB_ITEM_ORAN_BERRY },
    [ITEM_PERSIM_BERRY] = { NARC_item_data_0134_bin, NARC_item_icon_item_icon_178_NCGR, NARC_item_icon_item_icon_179_NCLR, AGB_ITEM_PERSIM_BERRY },
    [ITEM_LUM_BERRY]    = { NARC_item_data_0135_bin, NARC_item_icon_item_icon_180_NCGR, NARC_item_icon_item_icon_181_NCLR, AGB_ITEM_LUM_BERRY },
    [ITEM_SITRUS_BERRY] = { NARC_item_data_0136_bin, NARC_item_icon_item_icon_182_NCGR, NARC_item_icon_item_icon_183_NCLR, AGB_ITEM_SITRUS_BERRY },
    [ITEM_FIGY_BERRY]   = { NARC_item_data_0137_bin, NARC_item_icon_item_icon_184_NCGR, NARC_item_icon_item_icon_185_NCLR, AGB_ITEM_FIGY_BERRY },
    [ITEM_WIKI_BERRY]   = { NARC_item_data_0138_bin, NARC_item_icon_item_icon_186_NCGR, NARC_item_icon_item_icon_187_NCLR, AGB_ITEM_WIKI_BERRY },
    [ITEM_MAGO_BERRY]   = { NARC_item_data_0139_bin, NARC_item_icon_item_icon_188_NCGR, NARC_item_icon_item_icon_189_NCLR, AGB_ITEM_MAGO_BERRY },
    [ITEM_AGUAV_BERRY]  = { NARC_item_data_0140_bin, NARC_item_icon_item_icon_190_NCGR, NARC_item_icon_item_icon_191_NCLR, AGB_ITEM_AGUAV_BERRY },
    [ITEM_IAPAPA_BERRY] = { NARC_item_data_0141_bin, NARC_item_icon_item_icon_192_NCGR, NARC_item_icon_item_icon_193_NCLR, AGB_ITEM_IAPAPA_BERRY },
    [ITEM_RAZZ_BERRY]   = { NARC_item_data_0142_bin, NARC_item_icon_item_icon_194_NCGR, NARC_item_icon_item_icon_195_NCLR, AGB_ITEM_RAZZ_BERRY },
    [ITEM_BLUK_BERRY]   = { NARC_item_data_0143_bin, NARC_item_icon_item_icon_196_NCGR, NARC_item_icon_item_icon_197_NCLR, AGB_ITEM_BLUK_BERRY },
    [ITEM_NANAB_BERRY]  = { NARC_item_data_0144_bin, NARC_item_icon_item_icon_198_NCGR, NARC_item_icon_item_icon_199_NCLR, AGB_ITEM_NANAB_BERRY },
    [ITEM_WEPEAR_BERRY] = { NARC_item_data_0145_bin, NARC_item_icon_item_icon_200_NCGR, NARC_item_icon_item_icon_201_NCLR, AGB_ITEM_WEPEAR_BERRY },
    [ITEM_PINAP_BERRY]  = { NARC_item_data_0146_bin, NARC_item_icon_item_icon_202_NCGR, NARC_item_icon_item_icon_203_NCLR, AGB_ITEM_PINAP_BERRY },
    [ITEM_POMEG_BERRY]  = { NARC_item_data_0147_bin, NARC_item_icon_item_icon_204_NCGR, NARC_item_icon_item_icon_205_NCLR, AGB_ITEM_POMEG_BERRY },
    [ITEM_KELPSY_BERRY] = { NARC_item_data_0148_bin, NARC_item_icon_item_icon_206_NCGR, NARC_item_icon_item_icon_207_NCLR, AGB_ITEM_KELPSY_BERRY },
    [ITEM_QUALOT_BERRY] = { NARC_item_data_0149_bin, NARC_item_icon_item_icon_208_NCGR, NARC_item_icon_item_icon_209_NCLR, AGB_ITEM_QUALOT_BERRY },
    [ITEM_HONDEW_BERRY] = { NARC_item_data_0150_bin, NARC_item_icon_item_icon_210_NCGR, NARC_item_icon_item_icon_211_NCLR, AGB_ITEM_HONDEW_BERRY },
    [ITEM_GREPA_BERRY]  = { NARC_item_data_0151_bin, NARC_item_icon_item_icon_212_NCGR, NARC_item_icon_item_icon_213_NCLR, AGB_ITEM_GREPA_BERRY },
    [ITEM_TAMATO_BERRY] = { NARC_item_data_0152_bin, NARC_item_icon_item_icon_214_NCGR, NARC_item_icon_item_icon_215_NCLR, AGB_ITEM_TAMATO_BERRY },
    [ITEM_CORNN_BERRY]  = { NARC_item_data_0153_bin, NARC_item_icon_item_icon_216_NCGR, NARC_item_icon_item_icon_217_NCLR, AGB_ITEM_CORNN_BERRY },
    [ITEM_MAGOST_BERRY] = { NARC_item_data_0154_bin, NARC_item_icon_item_icon_218_NCGR, NARC_item_icon_item_icon_219_NCLR, AGB_ITEM_MAGOST_BERRY },
    [ITEM_RABUTA_BERRY] = { NARC_item_data_0155_bin, NARC_item_icon_item_icon_220_NCGR, NARC_item_icon_item_icon_221_NCLR, AGB_ITEM_RABUTA_BERRY },
    [ITEM_NOMEL_BERRY]  = { NARC_item_data_0156_bin, NARC_item_icon_item_icon_222_NCGR, NARC_item_icon_item_icon_223_NCLR, AGB_ITEM_NOMEL_BERRY },
    [ITEM_SPELON_BERRY] = { NARC_item_data_0157_bin, NARC_item_icon_item_icon_224_NCGR, NARC_item_icon_item_icon_225_NCLR, AGB_ITEM_SPELON_BERRY },
    [ITEM_PAMTRE_BERRY] = { NARC_item_data_0158_bin, NARC_item_icon_item_icon_226_NCGR, NARC_item_icon_item_icon_227_NCLR, AGB_ITEM_PAMTRE_BERRY },
    [ITEM_WATMEL_BERRY] = { NARC_item_data_0159_bin, NARC_item_icon_item_icon_228_NCGR, NARC_item_icon_item_icon_229_NCLR, AGB_ITEM_WATMEL_BERRY },
    [ITEM_DURIN_BERRY]  = { NARC_item_data_0160_bin, NARC_item_icon_item_icon_230_NCGR, NARC_item_icon_item_icon_231_NCLR, AGB_ITEM_DURIN_BERRY },
    [ITEM_BELUE_BERRY]  = { NARC_item_data_0161_bin, NARC_item_icon_item_icon_232_NCGR, NARC_item_icon_item_icon_233_NCLR, AGB_ITEM_BELUE_BERRY },
    [ITEM_OCCA_BERRY]   = { NARC_item_data_0162_bin, NARC_item_icon_item_icon_554_NCGR, NARC_item_icon_item_icon_555_NCLR, AGB_ITEM_NONE },
    [ITEM_PASSHO_BERRY] = { NARC_item_data_0163_bin, NARC_item_icon_item_icon_556_NCGR, NARC_item_icon_item_icon_557_NCLR, AGB_ITEM_NONE },
    [ITEM_WACAN_BERRY]  = { NARC_item_data_0164_bin, NARC_item_icon_item_icon_558_NCGR, NARC_item_icon_item_icon_559_NCLR, AGB_ITEM_NONE },
    [ITEM_RINDO_BERRY]  = { NARC_item_data_0165_bin, NARC_item_icon_item_icon_560_NCGR, NARC_item_icon_item_icon_561_NCLR, AGB_ITEM_NONE },
    [ITEM_YACHE_BERRY]  = { NARC_item_data_0166_bin, NARC_item_icon_item_icon_562_NCGR, NARC_item_icon_item_icon_563_NCLR, AGB_ITEM_NONE },
    [ITEM_CHOPLE_BERRY] = { NARC_item_data_0167_bin, NARC_item_icon_item_icon_564_NCGR, NARC_item_icon_item_icon_565_NCLR, AGB_ITEM_NONE },
    [ITEM_KEBIA_BERRY]  = { NARC_item_data_0168_bin, NARC_item_icon_item_icon_566_NCGR, NARC_item_icon_item_icon_567_NCLR, AGB_ITEM_NONE },
    [ITEM_SHUCA_BERRY]  = { NARC_item_data_0169_bin, NARC_item_icon_item_icon_568_NCGR, NARC_item_icon_item_icon_569_NCLR, AGB_ITEM_NONE },
    [ITEM_COBA_BERRY]   = { NARC_item_data_0170_bin, NARC_item_icon_item_icon_570_NCGR, NARC_item_icon_item_icon_571_NCLR, AGB_ITEM_NONE },
    [ITEM_PAYAPA_BERRY] = { NARC_item_data_0171_bin, NARC_item_icon_item_icon_572_NCGR, NARC_item_icon_item_icon_573_NCLR, AGB_ITEM_NONE },
    [ITEM_TANGA_BERRY]  = { NARC_item_data_0172_bin, NARC_item_icon_item_icon_574_NCGR, NARC_item_icon_item_icon_575_NCLR, AGB_ITEM_NONE },
    [ITEM_CHARTI_BERRY] = { NARC_item_data_0173_bin, NARC_item_icon_item_icon_576_NCGR, NARC_item_icon_item_icon_577_NCLR, AGB_ITEM_NONE },
    [ITEM_KASIB_BERRY]  = { NARC_item_data_0174_bin, NARC_item_icon_item_icon_578_NCGR, NARC_item_icon_item_icon_579_NCLR, AGB_ITEM_NONE },
    [ITEM_HABAN_BERRY]  = { NARC_item_data_0175_bin, NARC_item_icon_item_icon_580_NCGR, NARC_item_icon_item_icon_581_NCLR, AGB_ITEM_NONE },
    [ITEM_COLBUR_BERRY] = { NARC_item_data_0176_bin, NARC_item_icon_item_icon_582_NCGR, NARC_item_icon_item_icon_583_NCLR, AGB_ITEM_NONE },
    [ITEM_BABIRI_BERRY] = { NARC_item_data_0177_bin, NARC_item_icon_item_icon_584_NCGR, NARC_item_icon_item_icon_585_NCLR, AGB_ITEM_NONE },
    [ITEM_CHILAN_BERRY] = { NARC_item_data_0178_bin, NARC_item_icon_item_icon_586_NCGR, NARC_item_icon_item_icon_587_NCLR, AGB_ITEM_NONE },
    [ITEM_LIECHI_BERRY] = { NARC_item_data_0179_bin, NARC_item_icon_item_icon_234_NCGR, NARC_item_icon_item_icon_235_NCLR, AGB_ITEM_LIECHI_BERRY },
    [ITEM_GANLON_BERRY] = { NARC_item_data_0180_bin, NARC_item_icon_item_icon_236_NCGR, NARC_item_icon_item_icon_237_NCLR, AGB_ITEM_GANLON_BERRY },
    [ITEM_SALAC_BERRY]  = { NARC_item_data_0181_bin, NARC_item_icon_item_icon_238_NCGR, NARC_item_icon_item_icon_239_NCLR, AGB_ITEM_SALAC_BERRY },
    [ITEM_PETAYA_BERRY] = { NARC_item_data_0182_bin, NARC_item_icon_item_icon_240_NCGR, NARC_item_icon_item_icon_241_NCLR, AGB_ITEM_PETAYA_BERRY },
    [ITEM_APICOT_BERRY] = { NARC_item_data_0183_bin, NARC_item_icon_item_icon_242_NCGR, NARC_item_icon_item_icon_243_NCLR, AGB_ITEM_APICOT_BERRY },
    [ITEM_LANSAT_BERRY] = { NARC_item_data_0184_bin, NARC_item_icon_item_icon_244_NCGR, NARC_item_icon_item_icon_245_NCLR, AGB_ITEM_LANSAT_BERRY },
    [ITEM_STARF_BERRY]  = { NARC_item_data_0185_bin, NARC_item_icon_item_icon_246_NCGR, NARC_item_icon_item_icon_247_NCLR, AGB_ITEM_STARF_BERRY },
    [ITEM_ENIGMA_BERRY] = { NARC_item_data_0186_bin, NARC_item_icon_item_icon_248_NCGR, NARC_item_icon_item_icon_249_NCLR, AGB_ITEM_ENIGMA_BERRY },
    [ITEM_MICLE_BERRY]  = { NARC_item_data_0187_bin, NARC_item_icon_item_icon_588_NCGR, NARC_item_icon_item_icon_589_NCLR, AGB_ITEM_NONE },
    [ITEM_CUSTAP_BERRY] = { NARC_item_data_0188_bin, NARC_item_icon_item_icon_590_NCGR, NARC_item_icon_item_icon_591_NCLR, AGB_ITEM_NONE },
    [ITEM_JABOCA_BERRY] = { NARC_item_data_0189_bin, NARC_item_icon_item_icon_592_NCGR, NARC_item_icon_item_icon_593_NCLR, AGB_ITEM_NONE },
    [ITEM_ROWAP_BERRY]  = { NARC_item_data_0190_bin, NARC_item_icon_item_icon_594_NCGR, NARC_item_icon_item_icon_595_NCLR, AGB_ITEM_NONE },
    [ITEM_BRIGHTPOWDER] = { NARC_item_data_0191_bin, NARC_item_icon_item_icon_250_NCGR, NARC_item_icon_item_icon_251_NCLR, AGB_ITEM_BRIGHT_POWDER },
    [ITEM_WHITE_HERB]   = { NARC_item_data_0192_bin, NARC_item_icon_item_icon_252_NCGR, NARC_item_icon_item_icon_253_NCLR, AGB_ITEM_WHITE_HERB },
    [ITEM_MACHO_BRACE]  = { NARC_item_data_0193_bin, NARC_item_icon_item_icon_254_NCGR, NARC_item_icon_item_icon_255_NCLR, AGB_ITEM_MACHO_BRACE },
    [ITEM_EXP__SHARE]   = { NARC_item_data_0194_bin, NARC_item_icon_item_icon_256_NCGR, NARC_item_icon_item_icon_257_NCLR, AGB_ITEM_EXP_SHARE },
    [ITEM_QUICK_CLAW]   = { NARC_item_data_0195_bin, NARC_item_icon_item_icon_258_NCGR, NARC_item_icon_item_icon_259_NCLR, AGB_ITEM_QUICK_CLAW },
    [ITEM_SOOTHE_BELL]  = { NARC_item_data_0196_bin, NARC_item_icon_item_icon_260_NCGR, NARC_item_icon_item_icon_261_NCLR, AGB_ITEM_SOOTHE_BELL },
    [ITEM_MENTAL_HERB]  = { NARC_item_data_0197_bin, NARC_item_icon_item_icon_252_NCGR, NARC_item_icon_item_icon_262_NCLR, AGB_ITEM_MENTAL_HERB },
    [ITEM_CHOICE_BAND]  = { NARC_item_data_0198_bin, NARC_item_icon_item_icon_263_NCGR, NARC_item_icon_item_icon_264_NCLR, AGB_ITEM_CHOICE_BAND },
    [ITEM_KINGS_ROCK]   = { NARC_item_data_0199_bin, NARC_item_icon_item_icon_265_NCGR, NARC_item_icon_item_icon_266_NCLR, AGB_ITEM_KINGS_ROCK },
    [ITEM_SILVERPOWDER] = { NARC_item_data_0200_bin, NARC_item_icon_item_icon_267_NCGR, NARC_item_icon_item_icon_268_NCLR, AGB_ITEM_SILVER_POWDER },
    [ITEM_AMULET_COIN]  = { NARC_item_data_0201_bin, NARC_item_icon_item_icon_269_NCGR, NARC_item_icon_item_icon_270_NCLR, AGB_ITEM_AMULET_COIN },
    [ITEM_CLEANSE_TAG]  = { NARC_item_data_0202_bin, NARC_item_icon_item_icon_271_NCGR, NARC_item_icon_item_icon_272_NCLR, AGB_ITEM_CLEANSE_TAG },
    [ITEM_SOUL_DEW]     = { NARC_item_data_0203_bin, NARC_item_icon_item_icon_273_NCGR, NARC_item_icon_item_icon_274_NCLR, AGB_ITEM_SOUL_DEW },
    [ITEM_DEEPSEATOOTH] = { NARC_item_data_0204_bin, NARC_item_icon_item_icon_275_NCGR, NARC_item_icon_item_icon_276_NCLR, AGB_ITEM_DEEP_SEA_TOOTH },
    [ITEM_DEEPSEASCALE] = { NARC_item_data_0205_bin, NARC_item_icon_item_icon_277_NCGR, NARC_item_icon_item_icon_278_NCLR, AGB_ITEM_DEEP_SEA_SCALE },
    [ITEM_SMOKE_BALL]   = { NARC_item_data_0206_bin, NARC_item_icon_item_icon_279_NCGR, NARC_item_icon_item_icon_280_NCLR, AGB_ITEM_SMOKE_BALL },
    [ITEM_EVERSTONE]    = { NARC_item_data_0207_bin, NARC_item_icon_item_icon_281_NCGR, NARC_item_icon_item_icon_282_NCLR, AGB_ITEM_EVERSTONE },
    [ITEM_FOCUS_BAND]   = { NARC_item_data_0208_bin, NARC_item_icon_item_icon_283_NCGR, NARC_item_icon_item_icon_284_NCLR, AGB_ITEM_FOCUS_BAND },
    [ITEM_LUCKY_EGG]    = { NARC_item_data_0209_bin, NARC_item_icon_item_icon_285_NCGR, NARC_item_icon_item_icon_286_NCLR, AGB_ITEM_LUCKY_EGG },
    [ITEM_SCOPE_LENS]   = { NARC_item_data_0210_bin, NARC_item_icon_item_icon_287_NCGR, NARC_item_icon_item_icon_288_NCLR, AGB_ITEM_SCOPE_LENS },
    [ITEM_METAL_COAT]   = { NARC_item_data_0211_bin, NARC_item_icon_item_icon_289_NCGR, NARC_item_icon_item_icon_290_NCLR, AGB_ITEM_METAL_COAT },
    [ITEM_LEFTOVERS]    = { NARC_item_data_0212_bin, NARC_item_icon_item_icon_291_NCGR, NARC_item_icon_item_icon_292_NCLR, AGB_ITEM_LEFTOVERS },
    [ITEM_DRAGON_SCALE] = { NARC_item_data_0213_bin, NARC_item_icon_item_icon_293_NCGR, NARC_item_icon_item_icon_294_NCLR, AGB_ITEM_DRAGON_SCALE },
    [ITEM_LIGHT_BALL]   = { NARC_item_data_0214_bin, NARC_item_icon_item_icon_295_NCGR, NARC_item_icon_item_icon_296_NCLR, AGB_ITEM_LIGHT_BALL },
    [ITEM_SOFT_SAND]    = { NARC_item_data_0215_bin, NARC_item_icon_item_icon_297_NCGR, NARC_item_icon_item_icon_298_NCLR, AGB_ITEM_SOFT_SAND },
    [ITEM_HARD_STONE]   = { NARC_item_data_0216_bin, NARC_item_icon_item_icon_299_NCGR, NARC_item_icon_item_icon_300_NCLR, AGB_ITEM_HARD_STONE },
    [ITEM_MIRACLE_SEED] = { NARC_item_data_0217_bin, NARC_item_icon_item_icon_301_NCGR, NARC_item_icon_item_icon_302_NCLR, AGB_ITEM_MIRACLE_SEED },
    [ITEM_BLACKGLASSES] = { NARC_item_data_0218_bin, NARC_item_icon_item_icon_303_NCGR, NARC_item_icon_item_icon_304_NCLR, AGB_ITEM_BLACK_GLASSES },
    [ITEM_BLACK_BELT]   = { NARC_item_data_0219_bin, NARC_item_icon_item_icon_305_NCGR, NARC_item_icon_item_icon_304_NCLR, AGB_ITEM_BLACK_BELT },
    [ITEM_MAGNET]       = { NARC_item_data_0220_bin, NARC_item_icon_item_icon_306_NCGR, NARC_item_icon_item_icon_307_NCLR, AGB_ITEM_MAGNET },
    [ITEM_MYSTIC_WATER] = { NARC_item_data_0221_bin, NARC_item_icon_item_icon_308_NCGR, NARC_item_icon_item_icon_309_NCLR, AGB_ITEM_MYSTIC_WATER },
    [ITEM_SHARP_BEAK]   = { NARC_item_data_0222_bin, NARC_item_icon_item_icon_310_NCGR, NARC_item_icon_item_icon_311_NCLR, AGB_ITEM_SHARP_BEAK },
    [ITEM_POISON_BARB]  = { NARC_item_data_0223_bin, NARC_item_icon_item_icon_312_NCGR, NARC_item_icon_item_icon_313_NCLR, AGB_ITEM_POISON_BARB },
    [ITEM_NEVERMELTICE] = { NARC_item_data_0224_bin, NARC_item_icon_item_icon_314_NCGR, NARC_item_icon_item_icon_315_NCLR, AGB_ITEM_NEVER_MELT_ICE },
    [ITEM_SPELL_TAG]    = { NARC_item_data_0225_bin, NARC_item_icon_item_icon_316_NCGR, NARC_item_icon_item_icon_317_NCLR, AGB_ITEM_SPELL_TAG },
    [ITEM_TWISTEDSPOON] = { NARC_item_data_0226_bin, NARC_item_icon_item_icon_318_NCGR, NARC_item_icon_item_icon_319_NCLR, AGB_ITEM_TWISTED_SPOON },
    [ITEM_CHARCOAL]     = { NARC_item_data_0227_bin, NARC_item_icon_item_icon_320_NCGR, NARC_item_icon_item_icon_321_NCLR, AGB_ITEM_CHARCOAL },
    [ITEM_DRAGON_FANG]  = { NARC_item_data_0228_bin, NARC_item_icon_item_icon_322_NCGR, NARC_item_icon_item_icon_323_NCLR, AGB_ITEM_DRAGON_FANG },
    [ITEM_SILK_SCARF]   = { NARC_item_data_0229_bin, NARC_item_icon_item_icon_324_NCGR, NARC_item_icon_item_icon_325_NCLR, AGB_ITEM_SILK_SCARF },
    [ITEM_UPGRADE]      = { NARC_item_data_0230_bin, NARC_item_icon_item_icon_326_NCGR, NARC_item_icon_item_icon_327_NCLR, AGB_ITEM_UP_GRADE },
    [ITEM_SHELL_BELL]   = { NARC_item_data_0231_bin, NARC_item_icon_item_icon_328_NCGR, NARC_item_icon_item_icon_077_NCLR, AGB_ITEM_SHELL_BELL },
    [ITEM_SEA_INCENSE]  = { NARC_item_data_0232_bin, NARC_item_icon_item_icon_329_NCGR, NARC_item_icon_item_icon_330_NCLR, AGB_ITEM_SEA_INCENSE },
    [ITEM_LAX_INCENSE]  = { NARC_item_data_0233_bin, NARC_item_icon_item_icon_331_NCGR, NARC_item_icon_item_icon_332_NCLR, AGB_ITEM_LAX_INCENSE },
    [ITEM_LUCKY_PUNCH]  = { NARC_item_data_0234_bin, NARC_item_icon_item_icon_333_NCGR, NARC_item_icon_item_icon_334_NCLR, AGB_ITEM_LUCKY_PUNCH },
    [ITEM_METAL_POWDER] = { NARC_item_data_0235_bin, NARC_item_icon_item_icon_335_NCGR, NARC_item_icon_item_icon_336_NCLR, AGB_ITEM_METAL_POWDER },
    [ITEM_THICK_CLUB]   = { NARC_item_data_0236_bin, NARC_item_icon_item_icon_337_NCGR, NARC_item_icon_item_icon_338_NCLR, AGB_ITEM_THICK_CLUB },
    [ITEM_STICK]        = { NARC_item_data_0237_bin, NARC_item_icon_item_icon_339_NCGR, NARC_item_icon_item_icon_340_NCLR, AGB_ITEM_STICK },
    [ITEM_RED_SCARF]    = { NARC_item_data_0238_bin, NARC_item_icon_item_icon_341_NCGR, NARC_item_icon_item_icon_342_NCLR, AGB_ITEM_RED_SCARF },
    [ITEM_BLUE_SCARF]   = { NARC_item_data_0239_bin, NARC_item_icon_item_icon_341_NCGR, NARC_item_icon_item_icon_343_NCLR, AGB_ITEM_BLUE_SCARF },
    [ITEM_PINK_SCARF]   = { NARC_item_data_0240_bin, NARC_item_icon_item_icon_341_NCGR, NARC_item_icon_item_icon_344_NCLR, AGB_ITEM_PINK_SCARF },
    [ITEM_GREEN_SCARF]  = { NARC_item_data_0241_bin, NARC_item_icon_item_icon_341_NCGR, NARC_item_icon_item_icon_345_NCLR, AGB_ITEM_GREEN_SCARF },
    [ITEM_YELLOW_SCARF] = { NARC_item_data_0242_bin, NARC_item_icon_item_icon_341_NCGR, NARC_item_icon_item_icon_346_NCLR, AGB_ITEM_YELLOW_SCARF },
    [ITEM_WIDE_LENS]    = { NARC_item_data_0243_bin, NARC_item_icon_item_icon_490_NCGR, NARC_item_icon_item_icon_491_NCLR, AGB_ITEM_NONE },
    [ITEM_MUSCLE_BAND]  = { NARC_item_data_0244_bin, NARC_item_icon_item_icon_492_NCGR, NARC_item_icon_item_icon_493_NCLR, AGB_ITEM_NONE },
    [ITEM_WISE_GLASSES] = { NARC_item_data_0245_bin, NARC_item_icon_item_icon_494_NCGR, NARC_item_icon_item_icon_495_NCLR, AGB_ITEM_NONE },
    [ITEM_EXPERT_BELT]  = { NARC_item_data_0246_bin, NARC_item_icon_item_icon_496_NCGR, NARC_item_icon_item_icon_497_NCLR, AGB_ITEM_NONE },
    [ITEM_LIGHT_CLAY]   = { NARC_item_data_0247_bin, NARC_item_icon_item_icon_611_NCGR, NARC_item_icon_item_icon_612_NCLR, AGB_ITEM_NONE },
    [ITEM_LIFE_ORB]     = { NARC_item_data_0248_bin, NARC_item_icon_item_icon_498_NCGR, NARC_item_icon_item_icon_499_NCLR, AGB_ITEM_NONE },
    [ITEM_POWER_HERB]   = { NARC_item_data_0249_bin, NARC_item_icon_item_icon_500_NCGR, NARC_item_icon_item_icon_501_NCLR, AGB_ITEM_NONE },
    [ITEM_TOXIC_ORB]    = { NARC_item_data_0250_bin, NARC_item_icon_item_icon_502_NCGR, NARC_item_icon_item_icon_503_NCLR, AGB_ITEM_NONE },
    [ITEM_FLAME_ORB]    = { NARC_item_data_0251_bin, NARC_item_icon_item_icon_504_NCGR, NARC_item_icon_item_icon_505_NCLR, AGB_ITEM_NONE },
    [ITEM_QUICK_POWDER] = { NARC_item_data_0252_bin, NARC_item_icon_item_icon_335_NCGR, NARC_item_icon_item_icon_658_NCLR, AGB_ITEM_NONE },
    [ITEM_FOCUS_SASH]   = { NARC_item_data_0253_bin, NARC_item_icon_item_icon_659_NCGR, NARC_item_icon_item_icon_660_NCLR, AGB_ITEM_NONE },
    [ITEM_ZOOM_LENS]    = { NARC_item_data_0254_bin, NARC_item_icon_item_icon_506_NCGR, NARC_item_icon_item_icon_507_NCLR, AGB_ITEM_NONE },
    [ITEM_METRONOME]    = { NARC_item_data_0255_bin, NARC_item_icon_item_icon_508_NCGR, NARC_item_icon_item_icon_509_NCLR, AGB_ITEM_NONE },
    [ITEM_IRON_BALL]    = { NARC_item_data_0256_bin, NARC_item_icon_item_icon_613_NCGR, NARC_item_icon_item_icon_614_NCLR, AGB_ITEM_NONE },
    [ITEM_LAGGING_TAIL] = { NARC_item_data_0257_bin, NARC_item_icon_item_icon_650_NCGR, NARC_item_icon_item_icon_651_NCLR, AGB_ITEM_NONE },
    [ITEM_DESTINY_KNOT] = { NARC_item_data_0258_bin, NARC_item_icon_item_icon_654_NCGR, NARC_item_icon_item_icon_655_NCLR, AGB_ITEM_NONE },
    [ITEM_BLACK_SLUDGE] = { NARC_item_data_0259_bin, NARC_item_icon_item_icon_510_NCGR, NARC_item_icon_item_icon_511_NCLR, AGB_ITEM_NONE },
    [ITEM_ICY_ROCK]     = { NARC_item_data_0260_bin, NARC_item_icon_item_icon_636_NCGR, NARC_item_icon_item_icon_637_NCLR, AGB_ITEM_NONE },
    [ITEM_SMOOTH_ROCK]  = { NARC_item_data_0261_bin, NARC_item_icon_item_icon_638_NCGR, NARC_item_icon_item_icon_639_NCLR, AGB_ITEM_NONE },
    [ITEM_HEAT_ROCK]    = { NARC_item_data_0262_bin, NARC_item_icon_item_icon_640_NCGR, NARC_item_icon_item_icon_641_NCLR, AGB_ITEM_NONE },
    [ITEM_DAMP_ROCK]    = { NARC_item_data_0263_bin, NARC_item_icon_item_icon_642_NCGR, NARC_item_icon_item_icon_643_NCLR, AGB_ITEM_NONE },
    [ITEM_GRIP_CLAW]    = { NARC_item_data_0264_bin, NARC_item_icon_item_icon_652_NCGR, NARC_item_icon_item_icon_653_NCLR, AGB_ITEM_NONE },
    [ITEM_CHOICE_SCARF] = { NARC_item_data_0265_bin, NARC_item_icon_item_icon_512_NCGR, NARC_item_icon_item_icon_513_NCLR, AGB_ITEM_NONE },
    [ITEM_STICKY_BARB]  = { NARC_item_data_0266_bin, NARC_item_icon_item_icon_514_NCGR, NARC_item_icon_item_icon_515_NCLR, AGB_ITEM_NONE },
    [ITEM_POWER_BRACER] = { NARC_item_data_0267_bin, NARC_item_icon_item_icon_683_NCGR, NARC_item_icon_item_icon_684_NCLR, AGB_ITEM_NONE },
    [ITEM_POWER_BELT]   = { NARC_item_data_0268_bin, NARC_item_icon_item_icon_691_NCGR, NARC_item_icon_item_icon_692_NCLR, AGB_ITEM_NONE },
    [ITEM_POWER_LENS]   = { NARC_item_data_0269_bin, NARC_item_icon_item_icon_693_NCGR, NARC_item_icon_item_icon_694_NCLR, AGB_ITEM_NONE },
    [ITEM_POWER_BAND]   = { NARC_item_data_0270_bin, NARC_item_icon_item_icon_685_NCGR, NARC_item_icon_item_icon_686_NCLR, AGB_ITEM_NONE },
    [ITEM_POWER_ANKLET] = { NARC_item_data_0271_bin, NARC_item_icon_item_icon_687_NCGR, NARC_item_icon_item_icon_688_NCLR, AGB_ITEM_NONE },
    [ITEM_POWER_WEIGHT] = { NARC_item_data_0272_bin, NARC_item_icon_item_icon_689_NCGR, NARC_item_icon_item_icon_690_NCLR, AGB_ITEM_NONE },
    [ITEM_SHED_SHELL]   = { NARC_item_data_0273_bin, NARC_item_icon_item_icon_516_NCGR, NARC_item_icon_item_icon_517_NCLR, AGB_ITEM_NONE },
    [ITEM_BIG_ROOT]     = { NARC_item_data_0274_bin, NARC_item_icon_item_icon_518_NCGR, NARC_item_icon_item_icon_519_NCLR, AGB_ITEM_NONE },
    [ITEM_CHOICE_SPECS] = { NARC_item_data_0275_bin, NARC_item_icon_item_icon_520_NCGR, NARC_item_icon_item_icon_521_NCLR, AGB_ITEM_NONE },
    [ITEM_FLAME_PLATE]  = { NARC_item_data_0276_bin, NARC_item_icon_item_icon_619_NCGR, NARC_item_icon_item_icon_620_NCLR, AGB_ITEM_NONE },
    [ITEM_SPLASH_PLATE] = { NARC_item_data_0277_bin, NARC_item_icon_item_icon_619_NCGR, NARC_item_icon_item_icon_621_NCLR, AGB_ITEM_NONE },
    [ITEM_ZAP_PLATE]    = { NARC_item_data_0278_bin, NARC_item_icon_item_icon_619_NCGR, NARC_item_icon_item_icon_622_NCLR, AGB_ITEM_NONE },
    [ITEM_MEADOW_PLATE] = { NARC_item_data_0279_bin, NARC_item_icon_item_icon_619_NCGR, NARC_item_icon_item_icon_623_NCLR, AGB_ITEM_NONE },
    [ITEM_ICICLE_PLATE] = { NARC_item_data_0280_bin, NARC_item_icon_item_icon_619_NCGR, NARC_item_icon_item_icon_624_NCLR, AGB_ITEM_NONE },
    [ITEM_FIST_PLATE]   = { NARC_item_data_0281_bin, NARC_item_icon_item_icon_619_NCGR, NARC_item_icon_item_icon_625_NCLR, AGB_ITEM_NONE },
    [ITEM_TOXIC_PLATE]  = { NARC_item_data_0282_bin, NARC_item_icon_item_icon_619_NCGR, NARC_item_icon_item_icon_626_NCLR, AGB_ITEM_NONE },
    [ITEM_EARTH_PLATE]  = { NARC_item_data_0283_bin, NARC_item_icon_item_icon_619_NCGR, NARC_item_icon_item_icon_627_NCLR, AGB_ITEM_NONE },
    [ITEM_SKY_PLATE]    = { NARC_item_data_0284_bin, NARC_item_icon_item_icon_619_NCGR, NARC_item_icon_item_icon_628_NCLR, AGB_ITEM_NONE },
    [ITEM_MIND_PLATE]   = { NARC_item_data_0285_bin, NARC_item_icon_item_icon_619_NCGR, NARC_item_icon_item_icon_629_NCLR, AGB_ITEM_NONE },
    [ITEM_INSECT_PLATE] = { NARC_item_data_0286_bin, NARC_item_icon_item_icon_619_NCGR, NARC_item_icon_item_icon_630_NCLR, AGB_ITEM_NONE },
    [ITEM_STONE_PLATE]  = { NARC_item_data_0287_bin, NARC_item_icon_item_icon_619_NCGR, NARC_item_icon_item_icon_631_NCLR, AGB_ITEM_NONE },
    [ITEM_SPOOKY_PLATE] = { NARC_item_data_0288_bin, NARC_item_icon_item_icon_619_NCGR, NARC_item_icon_item_icon_632_NCLR, AGB_ITEM_NONE },
    [ITEM_DRACO_PLATE]  = { NARC_item_data_0289_bin, NARC_item_icon_item_icon_619_NCGR, NARC_item_icon_item_icon_633_NCLR, AGB_ITEM_NONE },
    [ITEM_DREAD_PLATE]  = { NARC_item_data_0290_bin, NARC_item_icon_item_icon_619_NCGR, NARC_item_icon_item_icon_634_NCLR, AGB_ITEM_NONE },
    [ITEM_IRON_PLATE]   = { NARC_item_data_0291_bin, NARC_item_icon_item_icon_619_NCGR, NARC_item_icon_item_icon_635_NCLR, AGB_ITEM_NONE },
    [ITEM_ODD_INCENSE]  = { NARC_item_data_0292_bin, NARC_item_icon_item_icon_522_NCGR, NARC_item_icon_item_icon_523_NCLR, AGB_ITEM_NONE },
    [ITEM_ROCK_INCENSE] = { NARC_item_data_0293_bin, NARC_item_icon_item_icon_524_NCGR, NARC_item_icon_item_icon_525_NCLR, AGB_ITEM_NONE },
    [ITEM_FULL_INCENSE] = { NARC_item_data_0294_bin, NARC_item_icon_item_icon_526_NCGR, NARC_item_icon_item_icon_527_NCLR, AGB_ITEM_NONE },
    [ITEM_WAVE_INCENSE] = { NARC_item_data_0295_bin, NARC_item_icon_item_icon_528_NCGR, NARC_item_icon_item_icon_529_NCLR, AGB_ITEM_NONE },
    [ITEM_ROSE_INCENSE] = { NARC_item_data_0296_bin, NARC_item_icon_item_icon_530_NCGR, NARC_item_icon_item_icon_531_NCLR, AGB_ITEM_NONE },
    [ITEM_LUCK_INCENSE] = { NARC_item_data_0297_bin, NARC_item_icon_item_icon_532_NCGR, NARC_item_icon_item_icon_533_NCLR, AGB_ITEM_NONE },
    [ITEM_PURE_INCENSE] = { NARC_item_data_0298_bin, NARC_item_icon_item_icon_534_NCGR, NARC_item_icon_item_icon_535_NCLR, AGB_ITEM_NONE },
    [ITEM_PROTECTOR]    = { NARC_item_data_0299_bin, NARC_item_icon_item_icon_695_NCGR, NARC_item_icon_item_icon_696_NCLR, AGB_ITEM_NONE },
    [ITEM_ELECTIRIZER]  = { NARC_item_data_0300_bin, NARC_item_icon_item_icon_536_NCGR, NARC_item_icon_item_icon_537_NCLR, AGB_ITEM_NONE },
    [ITEM_MAGMARIZER]   = { NARC_item_data_0301_bin, NARC_item_icon_item_icon_538_NCGR, NARC_item_icon_item_icon_539_NCLR, AGB_ITEM_NONE },
    [ITEM_DUBIOUS_DISC] = { NARC_item_data_0302_bin, NARC_item_icon_item_icon_540_NCGR, NARC_item_icon_item_icon_541_NCLR, AGB_ITEM_NONE },
    [ITEM_REAPER_CLOTH] = { NARC_item_data_0303_bin, NARC_item_icon_item_icon_542_NCGR, NARC_item_icon_item_icon_543_NCLR, AGB_ITEM_NONE },
    [ITEM_RAZOR_CLAW]   = { NARC_item_data_0304_bin, NARC_item_icon_item_icon_544_NCGR, NARC_item_icon_item_icon_545_NCLR, AGB_ITEM_NONE },
    [ITEM_RAZOR_FANG]   = { NARC_item_data_0305_bin, NARC_item_icon_item_icon_546_NCGR, NARC_item_icon_item_icon_547_NCLR, AGB_ITEM_NONE },
    [ITEM_TM01]         = { NARC_item_data_0306_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_398_NCLR, AGB_ITEM_TM01 },
    [ITEM_TM02]         = { NARC_item_data_0307_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_399_NCLR, AGB_ITEM_TM02 },
    [ITEM_TM03]         = { NARC_item_data_0308_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_400_NCLR, AGB_ITEM_TM03 },
    [ITEM_TM04]         = { NARC_item_data_0309_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_401_NCLR, AGB_ITEM_TM04 },
    [ITEM_TM05]         = { NARC_item_data_0310_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_402_NCLR, AGB_ITEM_TM05 },
    [ITEM_TM06]         = { NARC_item_data_0311_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_403_NCLR, AGB_ITEM_TM06 },
    [ITEM_TM07]         = { NARC_item_data_0312_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_404_NCLR, AGB_ITEM_TM07 },
    [ITEM_TM08]         = { NARC_item_data_0313_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_398_NCLR, AGB_ITEM_TM08 },
    [ITEM_TM09]         = { NARC_item_data_0314_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_405_NCLR, AGB_ITEM_TM09 },
    [ITEM_TM10]         = { NARC_item_data_0315_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_402_NCLR, AGB_ITEM_TM10 },
    [ITEM_TM11]         = { NARC_item_data_0316_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_406_NCLR, AGB_ITEM_TM11 },
    [ITEM_TM12]         = { NARC_item_data_0317_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_407_NCLR, AGB_ITEM_TM12 },
    [ITEM_TM13]         = { NARC_item_data_0318_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_404_NCLR, AGB_ITEM_TM13 },
    [ITEM_TM14]         = { NARC_item_data_0319_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_404_NCLR, AGB_ITEM_TM14 },
    [ITEM_TM15]         = { NARC_item_data_0320_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_402_NCLR, AGB_ITEM_TM15 },
    [ITEM_TM16]         = { NARC_item_data_0321_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_401_NCLR, AGB_ITEM_TM16 },
    [ITEM_TM17]         = { NARC_item_data_0322_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_402_NCLR, AGB_ITEM_TM17 },
    [ITEM_TM18]         = { NARC_item_data_0323_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_400_NCLR, AGB_ITEM_TM18 },
    [ITEM_TM19]         = { NARC_item_data_0324_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_405_NCLR, AGB_ITEM_TM19 },
    [ITEM_TM20]         = { NARC_item_data_0325_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_402_NCLR, AGB_ITEM_TM20 },
    [ITEM_TM21]         = { NARC_item_data_0326_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_402_NCLR, AGB_ITEM_TM21 },
    [ITEM_TM22]         = { NARC_item_data_0327_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_405_NCLR, AGB_ITEM_TM22 },
    [ITEM_TM23]         = { NARC_item_data_0328_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_408_NCLR, AGB_ITEM_TM23 },
    [ITEM_TM24]         = { NARC_item_data_0329_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_409_NCLR, AGB_ITEM_TM24 },
    [ITEM_TM25]         = { NARC_item_data_0330_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_409_NCLR, AGB_ITEM_TM25 },
    [ITEM_TM26]         = { NARC_item_data_0331_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_410_NCLR, AGB_ITEM_TM26 },
    [ITEM_TM27]         = { NARC_item_data_0332_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_402_NCLR, AGB_ITEM_TM27 },
    [ITEM_TM28]         = { NARC_item_data_0333_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_410_NCLR, AGB_ITEM_TM28 },
    [ITEM_TM29]         = { NARC_item_data_0334_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_401_NCLR, AGB_ITEM_TM29 },
    [ITEM_TM30]         = { NARC_item_data_0335_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_411_NCLR, AGB_ITEM_TM30 },
    [ITEM_TM31]         = { NARC_item_data_0336_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_398_NCLR, AGB_ITEM_TM31 },
    [ITEM_TM32]         = { NARC_item_data_0337_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_402_NCLR, AGB_ITEM_TM32 },
    [ITEM_TM33]         = { NARC_item_data_0338_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_401_NCLR, AGB_ITEM_TM33 },
    [ITEM_TM34]         = { NARC_item_data_0339_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_409_NCLR, AGB_ITEM_TM34 },
    [ITEM_TM35]         = { NARC_item_data_0340_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_406_NCLR, AGB_ITEM_TM35 },
    [ITEM_TM36]         = { NARC_item_data_0341_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_403_NCLR, AGB_ITEM_TM36 },
    [ITEM_TM37]         = { NARC_item_data_0342_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_412_NCLR, AGB_ITEM_TM37 },
    [ITEM_TM38]         = { NARC_item_data_0343_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_406_NCLR, AGB_ITEM_TM38 },
    [ITEM_TM39]         = { NARC_item_data_0344_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_412_NCLR, AGB_ITEM_TM39 },
    [ITEM_TM40]         = { NARC_item_data_0345_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_413_NCLR, AGB_ITEM_TM40 },
    [ITEM_TM41]         = { NARC_item_data_0346_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_407_NCLR, AGB_ITEM_TM41 },
    [ITEM_TM42]         = { NARC_item_data_0347_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_402_NCLR, AGB_ITEM_TM42 },
    [ITEM_TM43]         = { NARC_item_data_0348_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_402_NCLR, AGB_ITEM_TM43 },
    [ITEM_TM44]         = { NARC_item_data_0349_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_401_NCLR, AGB_ITEM_TM44 },
    [ITEM_TM45]         = { NARC_item_data_0350_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_402_NCLR, AGB_ITEM_TM45 },
    [ITEM_TM46]         = { NARC_item_data_0351_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_407_NCLR, AGB_ITEM_TM46 },
    [ITEM_TM47]         = { NARC_item_data_0352_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_408_NCLR, AGB_ITEM_TM47 },
    [ITEM_TM48]         = { NARC_item_data_0353_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_401_NCLR, AGB_ITEM_TM48 },
    [ITEM_TM49]         = { NARC_item_data_0354_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_407_NCLR, AGB_ITEM_TM49 },
    [ITEM_TM50]         = { NARC_item_data_0355_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_406_NCLR, AGB_ITEM_TM50 },
    [ITEM_TM51]         = { NARC_item_data_0356_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_413_NCLR, AGB_ITEM_NONE },
    [ITEM_TM52]         = { NARC_item_data_0357_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_398_NCLR, AGB_ITEM_NONE },
    [ITEM_TM53]         = { NARC_item_data_0358_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_405_NCLR, AGB_ITEM_NONE },
    [ITEM_TM54]         = { NARC_item_data_0359_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_402_NCLR, AGB_ITEM_NONE },
    [ITEM_TM55]         = { NARC_item_data_0360_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_400_NCLR, AGB_ITEM_NONE },
    [ITEM_TM56]         = { NARC_item_data_0361_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_407_NCLR, AGB_ITEM_NONE },
    [ITEM_TM57]         = { NARC_item_data_0362_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_409_NCLR, AGB_ITEM_NONE },
    [ITEM_TM58]         = { NARC_item_data_0363_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_402_NCLR, AGB_ITEM_NONE },
    [ITEM_TM59]         = { NARC_item_data_0364_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_399_NCLR, AGB_ITEM_NONE },
    [ITEM_TM60]         = { NARC_item_data_0365_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_398_NCLR, AGB_ITEM_NONE },
    [ITEM_TM61]         = { NARC_item_data_0366_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_406_NCLR, AGB_ITEM_NONE },
    [ITEM_TM62]         = { NARC_item_data_0367_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_610_NCLR, AGB_ITEM_NONE },
    [ITEM_TM63]         = { NARC_item_data_0368_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_407_NCLR, AGB_ITEM_NONE },
    [ITEM_TM64]         = { NARC_item_data_0369_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_402_NCLR, AGB_ITEM_NONE },
    [ITEM_TM65]         = { NARC_item_data_0370_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_411_NCLR, AGB_ITEM_NONE },
    [ITEM_TM66]         = { NARC_item_data_0371_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_407_NCLR, AGB_ITEM_NONE },
    [ITEM_TM67]         = { NARC_item_data_0372_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_402_NCLR, AGB_ITEM_NONE },
    [ITEM_TM68]         = { NARC_item_data_0373_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_402_NCLR, AGB_ITEM_NONE },
    [ITEM_TM69]         = { NARC_item_data_0374_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_412_NCLR, AGB_ITEM_NONE },
    [ITEM_TM70]         = { NARC_item_data_0375_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_402_NCLR, AGB_ITEM_NONE },
    [ITEM_TM71]         = { NARC_item_data_0376_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_412_NCLR, AGB_ITEM_NONE },
    [ITEM_TM72]         = { NARC_item_data_0377_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_404_NCLR, AGB_ITEM_NONE },
    [ITEM_TM73]         = { NARC_item_data_0378_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_409_NCLR, AGB_ITEM_NONE },
    [ITEM_TM74]         = { NARC_item_data_0379_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_408_NCLR, AGB_ITEM_NONE },
    [ITEM_TM75]         = { NARC_item_data_0380_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_402_NCLR, AGB_ITEM_NONE },
    [ITEM_TM76]         = { NARC_item_data_0381_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_412_NCLR, AGB_ITEM_NONE },
    [ITEM_TM77]         = { NARC_item_data_0382_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_402_NCLR, AGB_ITEM_NONE },
    [ITEM_TM78]         = { NARC_item_data_0383_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_402_NCLR, AGB_ITEM_NONE },
    [ITEM_TM79]         = { NARC_item_data_0384_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_407_NCLR, AGB_ITEM_NONE },
    [ITEM_TM80]         = { NARC_item_data_0385_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_412_NCLR, AGB_ITEM_NONE },
    [ITEM_TM81]         = { NARC_item_data_0386_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_610_NCLR, AGB_ITEM_NONE },
    [ITEM_TM82]         = { NARC_item_data_0387_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_402_NCLR, AGB_ITEM_NONE },
    [ITEM_TM83]         = { NARC_item_data_0388_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_402_NCLR, AGB_ITEM_NONE },
    [ITEM_TM84]         = { NARC_item_data_0389_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_403_NCLR, AGB_ITEM_NONE },
    [ITEM_TM85]         = { NARC_item_data_0390_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_401_NCLR, AGB_ITEM_NONE },
    [ITEM_TM86]         = { NARC_item_data_0391_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_405_NCLR, AGB_ITEM_NONE },
    [ITEM_TM87]         = { NARC_item_data_0392_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_402_NCLR, AGB_ITEM_NONE },
    [ITEM_TM88]         = { NARC_item_data_0393_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_413_NCLR, AGB_ITEM_NONE },
    [ITEM_TM89]         = { NARC_item_data_0394_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_610_NCLR, AGB_ITEM_NONE },
    [ITEM_TM90]         = { NARC_item_data_0395_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_402_NCLR, AGB_ITEM_NONE },
    [ITEM_TM91]         = { NARC_item_data_0396_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_408_NCLR, AGB_ITEM_NONE },
    [ITEM_TM92]         = { NARC_item_data_0397_bin, NARC_item_icon_item_icon_397_NCGR, NARC_item_icon_item_icon_401_NCLR, AGB_ITEM_NONE },
    [ITEM_HM01]         = { NARC_item_data_0398_bin, NARC_item_icon_item_icon_414_NCGR, NARC_item_icon_item_icon_402_NCLR, AGB_ITEM_HM01 },
    [ITEM_HM02]         = { NARC_item_data_0399_bin, NARC_item_icon_item_icon_414_NCGR, NARC_item_icon_item_icon_413_NCLR, AGB_ITEM_HM02 },
    [ITEM_HM03]         = { NARC_item_data_0400_bin, NARC_item_icon_item_icon_414_NCGR, NARC_item_icon_item_icon_400_NCLR, AGB_ITEM_HM03 },
    [ITEM_HM04]         = { NARC_item_data_0401_bin, NARC_item_icon_item_icon_414_NCGR, NARC_item_icon_item_icon_402_NCLR, AGB_ITEM_HM04 },
    [ITEM_HM05]         = { NARC_item_data_0402_bin, NARC_item_icon_item_icon_414_NCGR, NARC_item_icon_item_icon_400_NCLR, AGB_ITEM_HM05 },
    [ITEM_HM06]         = { NARC_item_data_0403_bin, NARC_item_icon_item_icon_414_NCGR, NARC_item_icon_item_icon_398_NCLR, AGB_ITEM_HM06 },
    [ITEM_HM07]         = { NARC_item_data_0404_bin, NARC_item_icon_item_icon_414_NCGR, NARC_item_icon_item_icon_400_NCLR, AGB_ITEM_HM07 },
    [ITEM_HM08]         = { NARC_item_data_0405_bin, NARC_item_icon_item_icon_414_NCGR, NARC_item_icon_item_icon_402_NCLR, AGB_ITEM_HM08 },
    [ITEM_EXPLORER_KIT] = { NARC_item_data_0000_bin, NARC_item_icon_item_icon_793_NCGR, NARC_item_icon_item_icon_794_NCLR, AGB_ITEM_NONE },
    [ITEM_LOOT_SACK]    = { NARC_item_data_0406_bin, NARC_item_icon_item_icon_550_NCGR, NARC_item_icon_item_icon_551_NCLR, AGB_ITEM_NONE },
    [ITEM_RULE_BOOK]    = { NARC_item_data_0407_bin, NARC_item_icon_item_icon_552_NCGR, NARC_item_icon_item_icon_553_NCLR, AGB_ITEM_NONE },
    [ITEM_POKE_RADAR]   = { NARC_item_data_0408_bin, NARC_item_icon_item_icon_697_NCGR, NARC_item_icon_item_icon_698_NCLR, AGB_ITEM_NONE },
    [ITEM_POINT_CARD]   = { NARC_item_data_0409_bin, NARC_item_icon_item_icon_681_NCGR, NARC_item_icon_item_icon_682_NCLR, AGB_ITEM_NONE },
    [ITEM_JOURNAL]      = { NARC_item_data_0410_bin, NARC_item_icon_item_icon_606_NCGR, NARC_item_icon_item_icon_607_NCLR, AGB_ITEM_NONE },
    [ITEM_SEAL_CASE]    = { NARC_item_data_0411_bin, NARC_item_icon_item_icon_671_NCGR, NARC_item_icon_item_icon_672_NCLR, AGB_ITEM_NONE },
    [ITEM_FASHION_CASE] = { NARC_item_data_0412_bin, NARC_item_icon_item_icon_675_NCGR, NARC_item_icon_item_icon_676_NCLR, AGB_ITEM_NONE },
    [ITEM_SEAL_BAG]     = { NARC_item_data_0413_bin, NARC_item_icon_item_icon_673_NCGR, NARC_item_icon_item_icon_674_NCLR, AGB_ITEM_NONE },
    [ITEM_PAL_PAD]      = { NARC_item_data_0414_bin, NARC_item_icon_item_icon_661_NCGR, NARC_item_icon_item_icon_662_NCLR, AGB_ITEM_NONE },
    [ITEM_WORKS_KEY]    = { NARC_item_data_0415_bin, NARC_item_icon_item_icon_644_NCGR, NARC_item_icon_item_icon_645_NCLR, AGB_ITEM_NONE },
    [ITEM_OLD_CHARM]    = { NARC_item_data_0416_bin, NARC_item_icon_item_icon_604_NCGR, NARC_item_icon_item_icon_605_NCLR, AGB_ITEM_NONE },
    [ITEM_GALACTIC_KEY] = { NARC_item_data_0417_bin, NARC_item_icon_item_icon_656_NCGR, NARC_item_icon_item_icon_657_NCLR, AGB_ITEM_NONE },
    [ITEM_RED_CHAIN]    = { NARC_item_data_0418_bin, NARC_item_icon_item_icon_679_NCGR, NARC_item_icon_item_icon_680_NCLR, AGB_ITEM_NONE },
    [ITEM_TOWN_MAP]     = { NARC_item_data_0419_bin, NARC_item_icon_item_icon_439_NCGR, NARC_item_icon_item_icon_440_NCLR, AGB_ITEM_TOWN_MAP },
    [ITEM_VS__SEEKER]   = { NARC_item_data_0420_bin, NARC_item_icon_item_icon_441_NCGR, NARC_item_icon_item_icon_442_NCLR, AGB_ITEM_VS_SEEKER },
    [ITEM_COIN_CASE]    = { NARC_item_data_0421_bin, NARC_item_icon_item_icon_349_NCGR, NARC_item_icon_item_icon_350_NCLR, AGB_ITEM_COIN_CASE },
    [ITEM_OLD_ROD]      = { NARC_item_data_0422_bin, NARC_item_icon_item_icon_353_NCGR, NARC_item_icon_item_icon_354_NCLR, AGB_ITEM_OLD_ROD },
    [ITEM_GOOD_ROD]     = { NARC_item_data_0423_bin, NARC_item_icon_item_icon_355_NCGR, NARC_item_icon_item_icon_356_NCLR, AGB_ITEM_GOOD_ROD },
    [ITEM_SUPER_ROD]    = { NARC_item_data_0424_bin, NARC_item_icon_item_icon_357_NCGR, NARC_item_icon_item_icon_358_NCLR, AGB_ITEM_SUPER_ROD },
    [ITEM_SPRAYDUCK]    = { NARC_item_data_0425_bin, NARC_item_icon_item_icon_363_NCGR, NARC_item_icon_item_icon_364_NCLR, AGB_ITEM_NONE },
    [ITEM_POFFIN_CASE]  = { NARC_item_data_0426_bin, NARC_item_icon_item_icon_373_NCGR, NARC_item_icon_item_icon_374_NCLR, AGB_ITEM_NONE },
    [ITEM_BICYCLE]      = { NARC_item_data_0427_bin, NARC_item_icon_item_icon_437_NCGR, NARC_item_icon_item_icon_438_NCLR, AGB_ITEM_BICYCLE },
    [ITEM_SUITE_KEY]    = { NARC_item_data_0428_bin, NARC_item_icon_item_icon_429_NCGR, NARC_item_icon_item_icon_430_NCLR, AGB_ITEM_NONE },
    [ITEM_OAKS_LETTER]  = { NARC_item_data_0429_bin, NARC_item_icon_item_icon_375_NCGR, NARC_item_icon_item_icon_064_NCLR, AGB_ITEM_NONE },
    [ITEM_LUNAR_WING]   = { NARC_item_data_0430_bin, NARC_item_icon_item_icon_602_NCGR, NARC_item_icon_item_icon_603_NCLR, AGB_ITEM_NONE },
    [ITEM_MEMBER_CARD]  = { NARC_item_data_0431_bin, NARC_item_icon_item_icon_608_NCGR, NARC_item_icon_item_icon_609_NCLR, AGB_ITEM_NONE },
    [ITEM_AZURE_FLUTE]  = { NARC_item_data_0432_bin, NARC_item_icon_item_icon_677_NCGR, NARC_item_icon_item_icon_678_NCLR, AGB_ITEM_NONE },
    [ITEM_S_S__TICKET]  = { NARC_item_data_0433_bin, NARC_item_icon_item_icon_359_NCGR, NARC_item_icon_item_icon_360_NCLR, AGB_ITEM_SS_TICKET },
    [ITEM_CONTEST_PASS] = { NARC_item_data_0434_bin, NARC_item_icon_item_icon_361_NCGR, NARC_item_icon_item_icon_362_NCLR, AGB_ITEM_CONTEST_PASS },
    [ITEM_MAGMA_STONE]  = { NARC_item_data_0435_bin, NARC_item_icon_item_icon_596_NCGR, NARC_item_icon_item_icon_597_NCLR, AGB_ITEM_NONE },
    [ITEM_PARCEL]       = { NARC_item_data_0436_bin, NARC_item_icon_item_icon_415_NCGR, NARC_item_icon_item_icon_416_NCLR, AGB_ITEM_OAKS_PARCEL },
    [ITEM_COUPON_1]     = { NARC_item_data_0437_bin, NARC_item_icon_item_icon_417_NCGR, NARC_item_icon_item_icon_418_NCLR, AGB_ITEM_NONE },
    [ITEM_COUPON_2]     = { NARC_item_data_0438_bin, NARC_item_icon_item_icon_419_NCGR, NARC_item_icon_item_icon_420_NCLR, AGB_ITEM_NONE },
    [ITEM_COUPON_3]     = { NARC_item_data_0439_bin, NARC_item_icon_item_icon_421_NCGR, NARC_item_icon_item_icon_422_NCLR, AGB_ITEM_NONE },
    [ITEM_STORAGE_KEY]  = { NARC_item_data_0440_bin, NARC_item_icon_item_icon_598_NCGR, NARC_item_icon_item_icon_599_NCLR, AGB_ITEM_STORAGE_KEY },
    [ITEM_SECRETPOTION] = { NARC_item_data_0441_bin, NARC_item_icon_item_icon_600_NCGR, NARC_item_icon_item_icon_601_NCLR, AGB_ITEM_NONE },
    [ITEM_VS__RECORDER] = { NARC_item_data_0442_bin, NARC_item_icon_item_icon_701_NCGR, NARC_item_icon_item_icon_702_NCLR, AGB_ITEM_NONE },
    [ITEM_GRACIDEA]     = { NARC_item_data_0443_bin, NARC_item_icon_item_icon_703_NCGR, NARC_item_icon_item_icon_704_NCLR, AGB_ITEM_NONE },
    [ITEM_SECRET_KEY]   = { NARC_item_data_0444_bin, NARC_item_icon_item_icon_705_NCGR, NARC_item_icon_item_icon_706_NCLR, AGB_ITEM_SECRET_KEY },
    [ITEM_APRICORN_BOX] = { NARC_item_data_0445_bin, NARC_item_icon_item_icon_709_NCGR, NARC_item_icon_item_icon_710_NCLR, AGB_ITEM_NONE },
    [ITEM_UNOWN_REPORT] = { NARC_item_data_0446_bin, NARC_item_icon_item_icon_759_NCGR, NARC_item_icon_item_icon_760_NCLR, AGB_ITEM_NONE },
    [ITEM_BERRY_POTS]   = { NARC_item_data_0447_bin, NARC_item_icon_item_icon_711_NCGR, NARC_item_icon_item_icon_712_NCLR, AGB_ITEM_NONE },
    [ITEM_DOWSING_MCHN] = { NARC_item_data_0448_bin, NARC_item_icon_item_icon_747_NCGR, NARC_item_icon_item_icon_748_NCLR, AGB_ITEM_ITEMFINDER },
    [ITEM_BLUE_CARD]    = { NARC_item_data_0449_bin, NARC_item_icon_item_icon_761_NCGR, NARC_item_icon_item_icon_762_NCLR, AGB_ITEM_NONE },
    [ITEM_SLOWPOKETAIL] = { NARC_item_data_0450_bin, NARC_item_icon_item_icon_763_NCGR, NARC_item_icon_item_icon_764_NCLR, AGB_ITEM_NONE },
    [ITEM_CLEAR_BELL]   = { NARC_item_data_0451_bin, NARC_item_icon_item_icon_765_NCGR, NARC_item_icon_item_icon_766_NCLR, AGB_ITEM_NONE },
    [ITEM_CARD_KEY]     = { NARC_item_data_0452_bin, NARC_item_icon_item_icon_767_NCGR, NARC_item_icon_item_icon_768_NCLR, AGB_ITEM_CARD_KEY },
    [ITEM_BASEMENT_KEY] = { NARC_item_data_0453_bin, NARC_item_icon_item_icon_769_NCGR, NARC_item_icon_item_icon_770_NCLR, AGB_ITEM_BASEMENT_KEY },
    [ITEM_SQUIRTBOTTLE] = { NARC_item_data_0454_bin, NARC_item_icon_item_icon_713_NCGR, NARC_item_icon_item_icon_714_NCLR, AGB_ITEM_NONE },
    [ITEM_RED_SCALE]    = { NARC_item_data_0455_bin, NARC_item_icon_item_icon_771_NCGR, NARC_item_icon_item_icon_772_NCLR, AGB_ITEM_NONE },
    [ITEM_LOST_ITEM]    = { NARC_item_data_0456_bin, NARC_item_icon_item_icon_773_NCGR, NARC_item_icon_item_icon_774_NCLR, AGB_ITEM_NONE },
    [ITEM_PASS]         = { NARC_item_data_0457_bin, NARC_item_icon_item_icon_775_NCGR, NARC_item_icon_item_icon_776_NCLR, AGB_ITEM_NONE },
    [ITEM_MACHINE_PART] = { NARC_item_data_0458_bin, NARC_item_icon_item_icon_777_NCGR, NARC_item_icon_item_icon_778_NCLR, AGB_ITEM_NONE },
    [ITEM_SILVER_WING]  = { NARC_item_data_0459_bin, NARC_item_icon_item_icon_779_NCGR, NARC_item_icon_item_icon_780_NCLR, AGB_ITEM_NONE },
    [ITEM_RAINBOW_WING] = { NARC_item_data_0460_bin, NARC_item_icon_item_icon_781_NCGR, NARC_item_icon_item_icon_782_NCLR, AGB_ITEM_NONE },
    [ITEM_MYSTERY_EGG]  = { NARC_item_data_0461_bin, NARC_item_icon_item_icon_783_NCGR, NARC_item_icon_item_icon_784_NCLR, AGB_ITEM_NONE },
    [ITEM_RED_APRICORN] = { NARC_item_data_0462_bin, NARC_item_icon_item_icon_733_NCGR, NARC_item_icon_item_icon_734_NCLR, AGB_ITEM_NONE },
    [ITEM_YLW_APRICORN] = { NARC_item_data_0463_bin, NARC_item_icon_item_icon_737_NCGR, NARC_item_icon_item_icon_738_NCLR, AGB_ITEM_NONE },
    [ITEM_BLU_APRICORN] = { NARC_item_data_0464_bin, NARC_item_icon_item_icon_735_NCGR, NARC_item_icon_item_icon_736_NCLR, AGB_ITEM_NONE },
    [ITEM_GRN_APRICORN] = { NARC_item_data_0465_bin, NARC_item_icon_item_icon_739_NCGR, NARC_item_icon_item_icon_740_NCLR, AGB_ITEM_NONE },
    [ITEM_PNK_APRICORN] = { NARC_item_data_0466_bin, NARC_item_icon_item_icon_741_NCGR, NARC_item_icon_item_icon_742_NCLR, AGB_ITEM_NONE },
    [ITEM_WHT_APRICORN] = { NARC_item_data_0467_bin, NARC_item_icon_item_icon_743_NCGR, NARC_item_icon_item_icon_744_NCLR, AGB_ITEM_NONE },
    [ITEM_BLK_APRICORN] = { NARC_item_data_0468_bin, NARC_item_icon_item_icon_745_NCGR, NARC_item_icon_item_icon_746_NCLR, AGB_ITEM_NONE },
    [ITEM_FAST_BALL]    = { NARC_item_data_0469_bin, NARC_item_icon_item_icon_723_NCGR, NARC_item_icon_item_icon_724_NCLR, AGB_ITEM_NONE },
    [ITEM_LEVEL_BALL]   = { NARC_item_data_0470_bin, NARC_item_icon_item_icon_717_NCGR, NARC_item_icon_item_icon_718_NCLR, AGB_ITEM_NONE },
    [ITEM_LURE_BALL]    = { NARC_item_data_0471_bin, NARC_item_icon_item_icon_715_NCGR, NARC_item_icon_item_icon_716_NCLR, AGB_ITEM_NONE },
    [ITEM_HEAVY_BALL]   = { NARC_item_data_0472_bin, NARC_item_icon_item_icon_721_NCGR, NARC_item_icon_item_icon_722_NCLR, AGB_ITEM_NONE },
    [ITEM_LOVE_BALL]    = { NARC_item_data_0473_bin, NARC_item_icon_item_icon_727_NCGR, NARC_item_icon_item_icon_728_NCLR, AGB_ITEM_NONE },
    [ITEM_FRIEND_BALL]  = { NARC_item_data_0474_bin, NARC_item_icon_item_icon_725_NCGR, NARC_item_icon_item_icon_726_NCLR, AGB_ITEM_NONE },
    [ITEM_MOON_BALL]    = { NARC_item_data_0475_bin, NARC_item_icon_item_icon_719_NCGR, NARC_item_icon_item_icon_720_NCLR, AGB_ITEM_NONE },
    [ITEM_SPORT_BALL]   = { NARC_item_data_0476_bin, NARC_item_icon_item_icon_731_NCGR, NARC_item_icon_item_icon_732_NCLR, AGB_ITEM_NONE },
    [ITEM_PARK_BALL]    = { NARC_item_data_0477_bin, NARC_item_icon_item_icon_729_NCGR, NARC_item_icon_item_icon_730_NCLR, AGB_ITEM_NONE },
    [ITEM_PHOTO_ALBUM]  = { NARC_item_data_0478_bin, NARC_item_icon_item_icon_606_NCGR, NARC_item_icon_item_icon_607_NCLR, AGB_ITEM_NONE },
    [ITEM_GB_SOUNDS]    = { NARC_item_data_0479_bin, NARC_item_icon_item_icon_785_NCGR, NARC_item_icon_item_icon_786_NCLR, AGB_ITEM_NONE },
    [ITEM_TIDAL_BELL]   = { NARC_item_data_0480_bin, NARC_item_icon_item_icon_787_NCGR, NARC_item_icon_item_icon_788_NCLR, AGB_ITEM_NONE },
    [ITEM_RAGECANDYBAR] = { NARC_item_data_0481_bin, NARC_item_icon_item_icon_749_NCGR, NARC_item_icon_item_icon_750_NCLR, AGB_ITEM_NONE },
    [ITEM_DATA_CARD_01] = { NARC_item_data_0482_bin, NARC_item_icon_item_icon_789_NCGR, NARC_item_icon_item_icon_790_NCLR, AGB_ITEM_NONE },
    [ITEM_DATA_CARD_02] = { NARC_item_data_0483_bin, NARC_item_icon_item_icon_789_NCGR, NARC_item_icon_item_icon_790_NCLR, AGB_ITEM_NONE },
    [ITEM_DATA_CARD_03] = { NARC_item_data_0484_bin, NARC_item_icon_item_icon_789_NCGR, NARC_item_icon_item_icon_790_NCLR, AGB_ITEM_NONE },
    [ITEM_DATA_CARD_04] = { NARC_item_data_0485_bin, NARC_item_icon_item_icon_789_NCGR, NARC_item_icon_item_icon_790_NCLR, AGB_ITEM_NONE },
    [ITEM_DATA_CARD_05] = { NARC_item_data_0486_bin, NARC_item_icon_item_icon_789_NCGR, NARC_item_icon_item_icon_790_NCLR, AGB_ITEM_NONE },
    [ITEM_DATA_CARD_06] = { NARC_item_data_0487_bin, NARC_item_icon_item_icon_789_NCGR, NARC_item_icon_item_icon_790_NCLR, AGB_ITEM_NONE },
    [ITEM_DATA_CARD_07] = { NARC_item_data_0488_bin, NARC_item_icon_item_icon_789_NCGR, NARC_item_icon_item_icon_790_NCLR, AGB_ITEM_NONE },
    [ITEM_DATA_CARD_08] = { NARC_item_data_0489_bin, NARC_item_icon_item_icon_789_NCGR, NARC_item_icon_item_icon_790_NCLR, AGB_ITEM_NONE },
    [ITEM_DATA_CARD_09] = { NARC_item_data_0490_bin, NARC_item_icon_item_icon_789_NCGR, NARC_item_icon_item_icon_790_NCLR, AGB_ITEM_NONE },
    [ITEM_DATA_CARD_10] = { NARC_item_data_0491_bin, NARC_item_icon_item_icon_789_NCGR, NARC_item_icon_item_icon_790_NCLR, AGB_ITEM_NONE },
    [ITEM_DATA_CARD_11] = { NARC_item_data_0492_bin, NARC_item_icon_item_icon_789_NCGR, NARC_item_icon_item_icon_790_NCLR, AGB_ITEM_NONE },
    [ITEM_DATA_CARD_12] = { NARC_item_data_0493_bin, NARC_item_icon_item_icon_789_NCGR, NARC_item_icon_item_icon_790_NCLR, AGB_ITEM_NONE },
    [ITEM_DATA_CARD_13] = { NARC_item_data_0494_bin, NARC_item_icon_item_icon_789_NCGR, NARC_item_icon_item_icon_790_NCLR, AGB_ITEM_NONE },
    [ITEM_DATA_CARD_14] = { NARC_item_data_0495_bin, NARC_item_icon_item_icon_789_NCGR, NARC_item_icon_item_icon_790_NCLR, AGB_ITEM_NONE },
    [ITEM_DATA_CARD_15] = { NARC_item_data_0496_bin, NARC_item_icon_item_icon_789_NCGR, NARC_item_icon_item_icon_790_NCLR, AGB_ITEM_NONE },
    [ITEM_DATA_CARD_16] = { NARC_item_data_0497_bin, NARC_item_icon_item_icon_789_NCGR, NARC_item_icon_item_icon_790_NCLR, AGB_ITEM_NONE },
    [ITEM_DATA_CARD_17] = { NARC_item_data_0498_bin, NARC_item_icon_item_icon_789_NCGR, NARC_item_icon_item_icon_790_NCLR, AGB_ITEM_NONE },
    [ITEM_DATA_CARD_18] = { NARC_item_data_0499_bin, NARC_item_icon_item_icon_789_NCGR, NARC_item_icon_item_icon_790_NCLR, AGB_ITEM_NONE },
    [ITEM_DATA_CARD_19] = { NARC_item_data_0500_bin, NARC_item_icon_item_icon_789_NCGR, NARC_item_icon_item_icon_790_NCLR, AGB_ITEM_NONE },
    [ITEM_DATA_CARD_20] = { NARC_item_data_0501_bin, NARC_item_icon_item_icon_789_NCGR, NARC_item_icon_item_icon_790_NCLR, AGB_ITEM_NONE },
    [ITEM_DATA_CARD_21] = { NARC_item_data_0502_bin, NARC_item_icon_item_icon_789_NCGR, NARC_item_icon_item_icon_790_NCLR, AGB_ITEM_NONE },
    [ITEM_DATA_CARD_22] = { NARC_item_data_0503_bin, NARC_item_icon_item_icon_789_NCGR, NARC_item_icon_item_icon_790_NCLR, AGB_ITEM_NONE },
    [ITEM_DATA_CARD_23] = { NARC_item_data_0504_bin, NARC_item_icon_item_icon_789_NCGR, NARC_item_icon_item_icon_790_NCLR, AGB_ITEM_NONE },
    [ITEM_DATA_CARD_24] = { NARC_item_data_0505_bin, NARC_item_icon_item_icon_789_NCGR, NARC_item_icon_item_icon_790_NCLR, AGB_ITEM_NONE },
    [ITEM_DATA_CARD_25] = { NARC_item_data_0506_bin, NARC_item_icon_item_icon_789_NCGR, NARC_item_icon_item_icon_790_NCLR, AGB_ITEM_NONE },
    [ITEM_DATA_CARD_26] = { NARC_item_data_0507_bin, NARC_item_icon_item_icon_789_NCGR, NARC_item_icon_item_icon_790_NCLR, AGB_ITEM_NONE },
    [ITEM_DATA_CARD_27] = { NARC_item_data_0508_bin, NARC_item_icon_item_icon_789_NCGR, NARC_item_icon_item_icon_790_NCLR, AGB_ITEM_NONE },
    [ITEM_JADE_ORB]     = { NARC_item_data_0509_bin, NARC_item_icon_item_icon_755_NCGR, NARC_item_icon_item_icon_756_NCLR, AGB_ITEM_NONE },
    [ITEM_LOCK_CAPSULE] = { NARC_item_data_0510_bin, NARC_item_icon_item_icon_791_NCGR, NARC_item_icon_item_icon_792_NCLR, AGB_ITEM_NONE },
    [ITEM_RED_ORB]      = { NARC_item_data_0511_bin, NARC_item_icon_item_icon_751_NCGR, NARC_item_icon_item_icon_752_NCLR, AGB_ITEM_RED_ORB },
    [ITEM_BLUE_ORB]     = { NARC_item_data_0512_bin, NARC_item_icon_item_icon_753_NCGR, NARC_item_icon_item_icon_754_NCLR, AGB_ITEM_BLUE_ORB },
    [ITEM_ENIGMA_STONE] = { NARC_item_data_0513_bin, NARC_item_icon_item_icon_757_NCGR, NARC_item_icon_item_icon_758_NCLR, AGB_ITEM_NONE },
};

void MoveItemSlotInList(ItemSlot *slots, int from, int to, int pocket, HeapID heapId) {
    ItemSlot *buf;
    int i, j;
    if (from == to) {
        return;
    }

    buf = AllocFromHeap(heapId, sPocketCounts[pocket] * sizeof(ItemSlot));

    j = 0;
    for (i = 0; i < sPocketCounts[pocket]; i++) {
        if (from != i) {
            if (to == j) {
                buf[j] = slots[from];
                j++;
            }
            buf[j] = slots[i];
            j++;
        }
    }

    if (to == sPocketCounts[pocket] - 1) {
        buf[j] = slots[from];
    }

    for (j = 0; j < sPocketCounts[pocket]; j++) {
        slots[j] = buf[j];
    }

    FreeToHeap(buf);
}

int GetItemIndexMapping(u16 itemId, int attrNo) {
    switch (attrNo) {
    case ITEMNARC_PARAM:
        if (itemId != ITEM_NONE && itemId != 0xFFFF) {
            return sItemNarcIds[itemId][ITEMNARC_PARAM];
        }
        break;
    case ITEMNARC_NCGR:
        if (itemId == ITEM_NONE) {
            return NARC_item_icon_item_icon_793_NCGR;
        } else if (itemId == 0xFFFF) {
            return NARC_item_icon_item_icon_795_NCGR;
        } else {
            return sItemNarcIds[itemId][ITEMNARC_NCGR];
        }
    case ITEMNARC_NCLR:
        if (itemId == ITEM_NONE) {
            return NARC_item_icon_item_icon_794_NCLR;
        } else if (itemId == 0xFFFF) {
            return NARC_item_icon_item_icon_796_NCLR;
        } else {
            return sItemNarcIds[itemId][ITEMNARC_NCLR];
        }
    case ITEMNARC_AGBCODE:
        if (itemId != ITEM_NONE && itemId != 0xFFFF) {
            return sItemNarcIds[itemId][ITEMNARC_AGBCODE];
        }
        break;
    }

    return 0;
}

u16 UpConvertItemId_Gen3to4(u16 agbcode) {
    u16 ntrcode;

    for (ntrcode = ITEM_MIN; ntrcode <= ITEM_MAX; ntrcode++) {
        if (agbcode == sItemNarcIds[ntrcode][ITEMNARC_AGBCODE]) {
            return ntrcode;
        }
    }

    return ITEM_NONE;
}

int GetItemIconCell(void) {
    return NARC_item_icon_item_icon_001_NCER;
}

int GetItemIconAnim(void) {
    return NARC_item_icon_item_icon_000_NANR;
}

void *LoadItemDataOrGfx(u16 itemId, int attrno, HeapID heapId) {
    if (itemId > ITEM_MAX) {
        itemId = ITEM_NONE;
    }
    switch (attrno) {
    case ITEMNARC_PARAM:
        return AllocAndReadWholeNarcMemberByIdPair(NARC_itemtool_itemdata_item_data, sItemNarcIds[itemId][ITEMNARC_PARAM], heapId);
    case ITEMNARC_NCGR:
        return AllocAndReadWholeNarcMemberByIdPair(NARC_itemtool_itemdata_item_icon, sItemNarcIds[itemId][ITEMNARC_NCGR], heapId);
    case ITEMNARC_NCLR:
        return AllocAndReadWholeNarcMemberByIdPair(NARC_itemtool_itemdata_item_icon, sItemNarcIds[itemId][ITEMNARC_NCLR], heapId);
    }

    return NULL;
}

void GetItemNameIntoString(String *dest, u16 itemId, HeapID heapId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0222_bin, heapId);
    ReadMsgDataIntoString(msgData, itemId, dest);
    DestroyMsgData(msgData);
}

void GetItemDescIntoString(String *dest, u16 itemId, HeapID heapId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0221_bin, heapId);
    ReadMsgDataIntoString(msgData, itemId, dest);
    DestroyMsgData(msgData);
}

static s32 GetItemAttrSub(ItemPartyParam *param, u16 attrno);

s32 GetItemAttr(u16 itemId, u16 attrno, HeapID heapId) {
    ItemData *itemData = (ItemData *)LoadItemDataOrGfx(itemId, ITEMNARC_PARAM, heapId);
    s32 ret = GetItemAttr_PreloadedItemData(itemData, attrno);
    FreeToHeapExplicit(heapId, itemData);
    return ret;
}

s32 GetItemAttr_PreloadedItemData(ItemData *itemData, u16 attrno) {
    switch (attrno) {
    case ITEMATTR_PRICE:
        return itemData->price;
    case ITEMATTR_HOLD_EFFECT:
        return itemData->holdEffect;
    case ITEMATTR_HOLD_EFFECT_PARAM:
        return itemData->holdEffectParam;
    case ITEMATTR_PREVENT_TOSS:
        return itemData->prevent_toss;
    case ITEMATTR_SELECTABLE:
        return itemData->selectable;
    case ITEMATTR_FIELD_POCKET:
        return itemData->fieldPocket;
    case ITEMATTR_FIELDUSEFUNC:
        return itemData->fieldUseFunc;
    case ITEMATTR_BATTLEUSEFUNC:
        return itemData->battleUseFunc;
    case ITEMATTR_PLUCK_EFFECT:
        return itemData->pluckEffect;
    case ITEMATTR_FLING_EFFECT:
        return itemData->flingEffect;
    case ITEMATTR_FLING_POWER:
        return itemData->flingPower;
    case ITEMATTR_NATURAL_GIFT_POWER:
        return itemData->naturalGiftPower;
    case ITEMATTR_NATURAL_GIFT_TYPE:
        return itemData->naturalGiftType;
    case ITEMATTR_BATTLE_POCKET:
        return itemData->battlePocket;
    case ITEMATTR_PARTY_USE:
        return itemData->partyUse;
    default:
        switch (itemData->partyUse) {
        case PARTYUSE_NO:
            return itemData->dummy;
        case PARTYUSE_YES:
            return GetItemAttrSub(&itemData->partyUseParam, attrno);
        }
    }

    return 0;
}

static s32 GetItemAttrSub(ItemPartyParam * partyParam, u16 attr)
{
    switch (attr)
    {
    case ITEMATTR_SLP_HEAL:
        return partyParam->slp_heal;
    case ITEMATTR_PSN_HEAL:
        return partyParam->psn_heal;
    case ITEMATTR_BRN_HEAL:
        return partyParam->brn_heal;
    case ITEMATTR_FRZ_HEAL:
        return partyParam->frz_heal;
    case ITEMATTR_PRZ_HEAL:
        return partyParam->prz_heal;
    case ITEMATTR_CFS_HEAL:
        return partyParam->cfs_heal;
    case ITEMATTR_INF_HEAL:
        return partyParam->inf_heal;
    case ITEMATTR_GUARD_SPEC:
        return partyParam->guard_spec;
    case ITEMATTR_REVIVE:
        return partyParam->revive;
    case ITEMATTR_REVIVE_ALL:
        return partyParam->revive_all;
    case ITEMATTR_LEVEL_UP:
        return partyParam->level_up;
    case ITEMATTR_EVOLVE:
        return partyParam->evolve;
    case ITEMATTR_ATK_STAGES:
        return partyParam->atk_stages;
    case ITEMATTR_DEF_STAGES:
        return partyParam->def_stages;
    case ITEMATTR_SPATK_STAGES:
        return partyParam->spatk_stages;
    case ITEMATTR_SPDEF_STAGES:
        return partyParam->spdef_stages;
    case ITEMATTR_SPEED_STAGES:
        return partyParam->speed_stages;
    case ITEMATTR_ACCURACY_STAGES:
        return partyParam->accuracy_stages;
    case ITEMATTR_CRITRATE_STAGES:
        return partyParam->critrate_stages;
    case ITEMATTR_PP_UP:
        return partyParam->pp_up;
    case ITEMATTR_PP_MAX:
        return partyParam->pp_max;
    case ITEMATTR_PP_RESTORE:
        return partyParam->pp_restore;
    case ITEMATTR_PP_RESTORE_ALL:
        return partyParam->pp_restore_all;
    case ITEMATTR_HP_RESTORE:
        return partyParam->hp_restore;
    case ITEMATTR_HP_EV_UP:
        return partyParam->hp_ev_up;
    case ITEMATTR_ATK_EV_UP:
        return partyParam->atk_ev_up;
    case ITEMATTR_DEF_EV_UP:
        return partyParam->def_ev_up;
    case ITEMATTR_SPEED_EV_UP:
        return partyParam->speed_ev_up;
    case ITEMATTR_SPATK_EV_UP:
        return partyParam->spatk_ev_up;
    case ITEMATTR_SPDEF_EV_UP:
        return partyParam->spdef_ev_up;
    case ITEMATTR_FRIENDSHIP_MOD_LO:
        return partyParam->friendship_mod_lo;
    case ITEMATTR_FRIENDSHIP_MOD_MED:
        return partyParam->friendship_mod_med;
    case ITEMATTR_FRIENDSHIP_MOD_HI:
        return partyParam->friendship_mod_hi;
    case ITEMATTR_HP_EV_UP_PARAM:
        return partyParam->hp_ev_up_param;
    case ITEMATTR_ATK_EV_UP_PARAM:
        return partyParam->atk_ev_up_param;
    case ITEMATTR_DEF_EV_UP_PARAM:
        return partyParam->def_ev_up_param;
    case ITEMATTR_SPEED_EV_UP_PARAM:
        return partyParam->speed_ev_up_param;
    case ITEMATTR_SPATK_EV_UP_PARAM:
        return partyParam->spatk_ev_up_param;
    case ITEMATTR_SPDEF_EV_UP_PARAM:
        return partyParam->spdef_ev_up_param;
    case ITEMATTR_HP_RESTORE_PARAM:
        return partyParam->hp_restore_param;
    case ITEMATTR_PP_RESTORE_PARAM:
        return partyParam->pp_restore_param;
    case ITEMATTR_FRIENDSHIP_MOD_LO_PARAM:
        return partyParam->friendship_mod_lo_param;
    case ITEMATTR_FRIENDSHIP_MOD_MED_PARAM:
        return partyParam->friendship_mod_med_param;
    case ITEMATTR_FRIENDSHIP_MOD_HI_PARAM:
        return partyParam->friendship_mod_hi_param;
    default:
        return 0;
    }
}

u16 TMHMGetMove(u16 itemId) {
    if (itemId < ITEM_TM01 || itemId > ITEM_HM08) {
        return MOVE_NONE;
    }

    itemId -= ITEM_TM01;
    return sTMHMMoves[itemId];
}

BOOL MoveIsHM(u16 moveId) {
    u8 i;

    for (i = 0; i < NUM_HMS; i++) {
        if (sTMHMMoves[i + ITEM_HM01 - ITEM_TM01] == moveId) {
            return TRUE;
        }
    }

    return FALSE;
}

u8 ItemToTMHMId(u16 itemId) {
    if (itemId < ITEM_TM01 || itemId > ITEM_HM08) {
        return 0;
    }

    return itemId - ITEM_TM01;
}

BOOL ItemIdIsMail(u16 itemId) {
    if (itemId < FIRST_MAIL_IDX || itemId > LAST_MAIL_IDX) {
        return FALSE;
    } else {
        return TRUE;
    }
}

u8 ItemToMailId(u16 itemId) {
    if (itemId < FIRST_MAIL_IDX || itemId > LAST_MAIL_IDX) {
        return 0;
    } else {
        return itemId - ITEM_GRASS_MAIL + MAIL_GRASS;
    }
}

u16 MailToItemId(u8 mailId) {
    if (mailId >= NUM_MAIL) {
        return ITEM_NONE;
    } else {
        return mailId - MAIL_GRASS + ITEM_GRASS_MAIL;
    }
}

s32 ItemToBallId(u16 itemId) {
    if (itemId >= ITEM_MASTER_BALL && itemId <= ITEM_CHERISH_BALL) {
        return itemId - ITEM_MASTER_BALL + BALL_MASTER;
    } else if (itemId >= ITEM_FAST_BALL && itemId <= ITEM_SPORT_BALL) {
        return itemId - ITEM_FAST_BALL + BALL_FAST;
    } else {
        return BALL_POKE;
    }
}

u16 BallToItemId(s32 ballId) {
    if (ballId >= BALL_MASTER && ballId <= BALL_CHERISH) {
        return ballId - BALL_MASTER + ITEM_MASTER_BALL;
    } else if (ballId >= BALL_FAST && ballId <= BALL_SPORT) {
        return ballId - BALL_FAST + ITEM_FAST_BALL;
    } else {
        return ITEM_POKE_BALL;
    }
}

BOOL ItemIdIsBerry(u16 itemId) {
    if (itemId < FIRST_BERRY_IDX || itemId > LAST_BERRY_IDX) {
        return FALSE;
    } else {
        return TRUE;
    }
}

u16 BerryToItemId(u8 berryId) {
    if (berryId >= NUM_BERRIES)
        return 0xFFFF;
    return (u16)(berryId + FIRST_BERRY_IDX);
}

String *GetNutName(u16 berryId, HeapID heapId) {
    String *ret;
    MsgData *msgData;

    if (berryId != 0) {
        berryId--;
    }
    msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0251_bin, heapId);
    ret = NewString_ReadMsgData(msgData, berryId);
    DestroyMsgData(msgData);
    return ret;
}

ItemData *LoadAllItemData(HeapID heapId) {
    return AllocAndReadFromNarcMemberByIdPair(NARC_itemtool_itemdata_item_data, 0, heapId, 0, GetItemIndexMapping(ITEM_MAX, ITEMNARC_PARAM) * sizeof(ItemData));
}

ItemData *GetItemDataPtrFromArray(ItemData *itemData, u32 itemDataIdx) {
    return &itemData[itemDataIdx];
}

BOOL ItemIdIsNotJohtoBall(u16 itemId) {
    // stupid hack to get it to match
    if ((u16)(itemId + (u16)-ITEM_FAST_BALL) > (ITEM_PARK_BALL - ITEM_FAST_BALL)) {
        return TRUE;
    } else {
        return FALSE;
    }
}
