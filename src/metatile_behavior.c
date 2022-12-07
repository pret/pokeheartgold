#include "metatile_behavior.h"

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

BOOL sub_0205B6E8(u8 tile) {
    return tile == 2;
}

BOOL sub_0205B6F4(u8 tile) {
    return tile == 3;
}

BOOL sub_0205B700(u8 tile) {
    return tile == 128;
}

BOOL sub_0205B70C(u8 tile) {
    return tile == 105;
}

BOOL sub_0205B718(u8 tile) {
    return tile == 98;
}

BOOL sub_0205B724(u8 tile) {
    return tile == 99;
}

BOOL sub_0205B730(u8 tile) {
    return tile == 100;
}

BOOL sub_0205B73C(u8 tile) {
    return tile == 101;
}

BOOL sub_0205B748(u8 tile) {
    return tile == 108;
}

BOOL sub_0205B754(u8 tile) {
    return tile == 109;
}

BOOL sub_0205B760(u8 tile) {
    return tile == 110;
}

BOOL sub_0205B76C(u8 tile) {
    return tile == 111;
}

BOOL sub_0205B778(u8 tile) {
    return (_020FCA74[tile] & 1) != FALSE;
}

BOOL sub_0205B78C(u8 tile) {
    return tile == 34;
}

BOOL sub_0205B798(u8 tile) {
    return tile == 33;
}

BOOL sub_0205B7A4(u8 tile) {
    return tile == 23;
}

BOOL sub_0205B7B0(u8 tile) {
    return tile == 58;
}

BOOL sub_0205B7BC(u8 tile) {
    return tile == 59;
}

BOOL sub_0205B7C8(u8 tile) {
    return tile == 57;
}

BOOL sub_0205B7D4(u8 tile) {
    return tile == 56;
}

BOOL sub_0205B7E0(u8 tile) {
    return tile == 131;
}

BOOL sub_0205B7EC(u8 tile) {
    return tile == 133;
}

BOOL sub_0205B7F8(u8 tile) {
    return tile == 106;
}

BOOL sub_0205B804(u8 tile) {
    return tile == 107;
}

BOOL sub_0205B810(u8 tile) {
    return tile == 94;
}

BOOL sub_0205B81C(u8 tile) {
    return tile == 95;
}

BOOL sub_0205B828(u8 tile) {
    return tile == 32;
}

BOOL sub_0205B834(u8 tile) {
    return tile == 75;
}

BOOL sub_0205B840(u8 tile) {
    return tile == 76;
}

BOOL sub_0205B84C(u8 tile) {
    return tile == 224;
}

BOOL sub_0205B858(u8 tile) {
    return tile == 234;
}

BOOL sub_0205B864(u8 tile) {
    return tile == 225;
}

BOOL sub_0205B870(u8 tile) {
    return tile == 226;
}

BOOL sub_0205B87C(u8 tile) {
    return tile == 228;
}

BOOL sub_0205B888(u8 tile) {
    return tile == 229;
}

BOOL sub_0205B894(u8 tile) {
    return tile == 235;
}

BOOL sub_0205B8A0(u8 tile) {
    return tile == 236;
}

BOOL sub_0205B8AC(u8 tile) {
    return tile == 164;
}

BOOL sub_0205B8B8(u8 tile) {
    return tile == 168;
}

BOOL sub_0205B8C4(u8 tile) {
    return tile == 168;
}

BOOL sub_0205B8D0(u8 tile) {
    return tile == 8;
}

BOOL MetatileBehavior_IsWaterfall(u8 tile) {
    return tile == 19;
}

BOOL MetatileBehavior_IsWhirlpool(u8 tile) {
    return tile == 17;
}

BOOL sub_0205B8F4(u8 tile) {
    return tile == 50 || tile == 52 || tile == 53 || tile == 60 || tile == 73;
}

BOOL sub_0205B918(u8 tile) {
    return tile == 51 || tile == 54 || tile == 55  || tile == 61 || tile == 73;
}

BOOL sub_0205B93C(u8 tile) {
    return tile == 49 || tile == 53 || tile == 55 || tile == 74;
}

BOOL sub_0205B960(u8 tile) {
    return tile == 48 || tile == 52 || tile == 54 || tile == 74;
}

BOOL sub_0205B984(u8 tile) {
    return tile == 22 || tile == 29;
}

BOOL sub_0205B994(u8 tile) {
    return (_020FCA74[tile] & 2) != 0;
}

BOOL sub_0205B9AC(u8 tile) {
    return tile == 134;
}

BOOL sub_0205B9B8(u8 tile) {
    return tile == 16 || tile == 22 || tile == 29 || tile == 32 || tile == 45;
}

BOOL sub_0205B9DC(u8 tile) {
    return tile == 64;
}

BOOL sub_0205B9E8(u8 tile) {
    return tile == 65;
}

BOOL sub_0205B9F4(u8 tile) {
    return tile == 66;
}

BOOL sub_0205BA00(u8 tile) {
    return tile == 67;
}

BOOL sub_0205BA0C(u8 tile) {
    return tile == 77;
}

BOOL sub_0205BA18(u8 tile) {
    return tile == 103;
}

BOOL sub_0205BA24(u8 tile) {
    return tile == 112;
}

BOOL sub_0205BA30(u8 tile) {
    return tile == 113 || tile == 114 || tile == 115;
}

BOOL sub_0205BA44(u8 tile) {
    return tile == 113 || tile == 114;
}

BOOL sub_0205BA54(u8 tile) {
    return tile == 115;
}

BOOL sub_0205BA60(u8 tile) {
    return tile == 255;
}

u8 sub_0205BA6C(void) {
    return 255;
}

BOOL sub_0205BA70(u8 tile) {
    return tile == 29 || tile == 32 || tile == 45;
}

BOOL sub_0205BA94(u8 tile) {
    return tile == 169;
}

BOOL sub_0205BAA0(u8 tile) {
    return tile == 60;
}

BOOL sub_0205BAAC(u8 tile) {
    return tile == 61;
}

BOOL sub_0205BAB8(u8 tile) {
    return tile == 62;
}

BOOL sub_0205BAC4(u8 tile) {
    return tile == 44;
}

BOOL sub_0205BAD0(u8 tile) {
    return (tile == 0 || tile == 33 || tile == 164);
}

BOOL sub_0205BAE4(u8 tile) {
    return sub_0205B778(tile);
}

BOOL sub_0205BAEC(u8 tile) {
    return tile == 35;
}

BOOL MetatileBehavior_IsHeadbutt(u8 tile) {
    return tile == 6;
}

BOOL sub_0205BB04(u8 tile) {
    return sub_0205BA44(tile) || tile == 46;
}

