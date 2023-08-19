#include "global.h"
#include "metatile_behavior.h"
#include "constants/metatile_behavior.h"

static const u8 _020FCA74[] = {
    0x00, 0x00, 0x02, 0x02, 0x00, 0x02, 0x00, 0x00, 0x02, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00,
	0x03, 0x01, 0x03, 0x01, 0x01, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x02, 0x01, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0x00, 0x02, 0x01, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
};

BOOL MetatileBehavior_IsEncounterGrass(u8 tile) {
    return tile == TILE_BEHAVIOR_2;
}

BOOL sub_0205B6F4(u8 tile) {
    return tile == TILE_BEHAVIOR_3;
}

BOOL sub_0205B700(u8 tile) {
    return tile == TILE_BEHAVIOR_128;
}

BOOL sub_0205B70C(u8 tile) {
    return tile == TILE_BEHAVIOR_105;
}

BOOL sub_0205B718(u8 tile) {
    return tile == TILE_BEHAVIOR_98;
}

BOOL sub_0205B724(u8 tile) {
    return tile == TILE_BEHAVIOR_99;
}

BOOL sub_0205B730(u8 tile) {
    return tile == TILE_BEHAVIOR_100;
}

BOOL sub_0205B73C(u8 tile) {
    return tile == TILE_BEHAVIOR_101;
}

BOOL sub_0205B748(u8 tile) {
    return tile == TILE_BEHAVIOR_108;
}

BOOL sub_0205B754(u8 tile) {
    return tile == TILE_BEHAVIOR_109;
}

BOOL sub_0205B760(u8 tile) {
    return tile == TILE_BEHAVIOR_110;
}

BOOL sub_0205B76C(u8 tile) {
    return tile == TILE_BEHAVIOR_111;
}

BOOL MetatileBehavior_IsSurfableWater(u8 tile) {
    return (_020FCA74[tile] & 1) != FALSE;
}

BOOL sub_0205B78C(u8 tile) {
    return tile == TILE_BEHAVIOR_34;
}

BOOL sub_0205B798(u8 tile) {
    return tile == TILE_BEHAVIOR_33;
}

BOOL sub_0205B7A4(u8 tile) {
    return tile == TILE_BEHAVIOR_23;
}

BOOL sub_0205B7B0(u8 tile) {
    return tile == TILE_BEHAVIOR_58;
}

BOOL sub_0205B7BC(u8 tile) {
    return tile == TILE_BEHAVIOR_59;
}

BOOL sub_0205B7C8(u8 tile) {
    return tile == TILE_BEHAVIOR_57;
}

BOOL sub_0205B7D4(u8 tile) {
    return tile == TILE_BEHAVIOR_56;
}

BOOL sub_0205B7E0(u8 tile) {
    return tile == TILE_BEHAVIOR_131;
}

BOOL sub_0205B7EC(u8 tile) {
    return tile == TILE_BEHAVIOR_133;
}

BOOL sub_0205B7F8(u8 tile) {
    return tile == TILE_BEHAVIOR_106;
}

BOOL sub_0205B804(u8 tile) {
    return tile == TILE_BEHAVIOR_107;
}

BOOL sub_0205B810(u8 tile) {
    return tile == TILE_BEHAVIOR_94;
}

BOOL sub_0205B81C(u8 tile) {
    return tile == TILE_BEHAVIOR_95;
}

BOOL sub_0205B828(u8 tile) {
    return tile == TILE_BEHAVIOR_32;
}

BOOL sub_0205B834(u8 tile) {
    return tile == TILE_BEHAVIOR_75;
}

BOOL sub_0205B840(u8 tile) {
    return tile == TILE_BEHAVIOR_76;
}

BOOL sub_0205B84C(u8 tile) {
    return tile == TILE_BEHAVIOR_224;
}

BOOL sub_0205B858(u8 tile) {
    return tile == TILE_BEHAVIOR_234;
}

BOOL sub_0205B864(u8 tile) {
    return tile == TILE_BEHAVIOR_225;
}

BOOL sub_0205B870(u8 tile) {
    return tile == TILE_BEHAVIOR_226;
}

BOOL sub_0205B87C(u8 tile) {
    return tile == TILE_BEHAVIOR_228;
}

BOOL sub_0205B888(u8 tile) {
    return tile == TILE_BEHAVIOR_229;
}

BOOL sub_0205B894(u8 tile) {
    return tile == TILE_BEHAVIOR_235;
}

BOOL sub_0205B8A0(u8 tile) {
    return tile == TILE_BEHAVIOR_236;
}

BOOL sub_0205B8AC(u8 tile) {
    return tile == TILE_BEHAVIOR_164;
}

BOOL sub_0205B8B8(u8 tile) {
    return tile == TILE_BEHAVIOR_168;
}

BOOL sub_0205B8C4(u8 tile) {
    return tile == TILE_BEHAVIOR_168;
}

BOOL sub_0205B8D0(u8 tile) {
    return tile == TILE_BEHAVIOR_8;
}

BOOL MetatileBehavior_IsWaterfall(u8 tile) {
    return tile == TILE_BEHAVIOR_WATERFALL;
}

BOOL MetatileBehavior_IsWhirlpool(u8 tile) {
    return tile == TILE_BEHAVIOR_WHIRLPOOL;
}

BOOL sub_0205B8F4(u8 tile) {
    return tile == TILE_BEHAVIOR_50 ||
           tile == TILE_BEHAVIOR_52 ||
           tile == TILE_BEHAVIOR_53 ||
           tile == TILE_BEHAVIOR_60 ||
           tile == TILE_BEHAVIOR_73;
}

BOOL sub_0205B918(u8 tile) {
    return tile == TILE_BEHAVIOR_51 ||
           tile == TILE_BEHAVIOR_54 ||
           tile == TILE_BEHAVIOR_55 ||
           tile == TILE_BEHAVIOR_61 ||
           tile == TILE_BEHAVIOR_73;
}

BOOL sub_0205B93C(u8 tile) {
    return tile == TILE_BEHAVIOR_49 ||
           tile == TILE_BEHAVIOR_53 ||
           tile == TILE_BEHAVIOR_55 ||
           tile == TILE_BEHAVIOR_74;
}

BOOL sub_0205B960(u8 tile) {
    return tile == TILE_BEHAVIOR_48 ||
           tile == TILE_BEHAVIOR_52 ||
           tile == TILE_BEHAVIOR_54 ||
           tile == TILE_BEHAVIOR_74;
}

BOOL sub_0205B984(u8 tile) {
    return tile == TILE_BEHAVIOR_22 || tile == TILE_BEHAVIOR_29;
}

BOOL sub_0205B994(u8 tile) {
    return (_020FCA74[tile] & 2) != 0;
}

BOOL sub_0205B9AC(u8 tile) {
    return tile == TILE_BEHAVIOR_134;
}

BOOL sub_0205B9B8(u8 tile) {
    return tile == TILE_BEHAVIOR_16 ||
           tile == TILE_BEHAVIOR_22 ||
           tile == TILE_BEHAVIOR_29 ||
           tile == TILE_BEHAVIOR_32 ||
           tile == TILE_BEHAVIOR_45;
}

BOOL sub_0205B9DC(u8 tile) {
    return tile == TILE_BEHAVIOR_64;
}

BOOL sub_0205B9E8(u8 tile) {
    return tile == TILE_BEHAVIOR_65;
}

BOOL sub_0205B9F4(u8 tile) {
    return tile == TILE_BEHAVIOR_66;
}

BOOL sub_0205BA00(u8 tile) {
    return tile == TILE_BEHAVIOR_67;
}

BOOL sub_0205BA0C(u8 tile) {
    return tile == TILE_BEHAVIOR_77;
}

BOOL sub_0205BA18(u8 tile) {
    return tile == TILE_BEHAVIOR_103;
}

BOOL sub_0205BA24(u8 tile) {
    return tile == TILE_BEHAVIOR_112;
}

BOOL sub_0205BA30(u8 tile) {
    return tile == TILE_BEHAVIOR_113 ||
           tile == TILE_BEHAVIOR_114 ||
           tile == TILE_BEHAVIOR_115;
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

u8 sub_0205BA6C(void) {
    return TILE_BEHAVIOR_NONE;
}

BOOL sub_0205BA70(u8 tile) {
    return tile == TILE_BEHAVIOR_29 ||
           tile == TILE_BEHAVIOR_32 ||
           tile == TILE_BEHAVIOR_45;
}

BOOL sub_0205BA94(u8 tile) {
    return tile == TILE_BEHAVIOR_169;
}

BOOL sub_0205BAA0(u8 tile) {
    return tile == TILE_BEHAVIOR_60;
}

BOOL sub_0205BAAC(u8 tile) {
    return tile == TILE_BEHAVIOR_61;
}

BOOL sub_0205BAB8(u8 tile) {
    return tile == TILE_BEHAVIOR_62;
}

BOOL sub_0205BAC4(u8 tile) {
    return tile == TILE_BEHAVIOR_44;
}

BOOL sub_0205BAD0(u8 tile) {
    return tile == TILE_BEHAVIOR_0 ||
           tile == TILE_BEHAVIOR_33 ||
           tile == TILE_BEHAVIOR_164;
}

BOOL sub_0205BAE4(u8 tile) {
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
