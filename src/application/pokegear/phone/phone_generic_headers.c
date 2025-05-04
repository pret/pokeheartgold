#include "global.h"

#include "application/pokegear/phone/phone_internal.h"

#define PHONE_GENERIC_NULL {       \
    .type = 255,                   \
    .chance = 0,                   \
    .scriptType = 0,               \
    .scriptID = PHONE_SCRIPT_NONE, \
}

const u8 ov101_021F962C[][12] = {
    { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 },
    { 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23 },
    { 72, 72, 73, 73, 74, 74, 72, 72, 73, 73, 74, 74 },
    { 75, 75, 76, 76, 77, 77, 75, 75, 76, 76, 77, 77 },
    { 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35 },
    { 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47 },
    { 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59 },
    { 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71 },
};

const UnkStruct_ov101_021F968C ov101_021F968C[] = {
    // 000/1
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 000/2
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 001/1
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 001/2
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 002/1
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 002/2
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 003/1
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 003/2
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 004/1
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 004/2
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 005/1
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 005/2
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 006/1
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 006/2
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 007/1
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 007/2
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 008/1
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 008/2
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 009/1
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 009/2
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 010/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_034,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_033,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_035,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 010/2
    {
     .type = 2,
     .chance = 60,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_033,
     },
    {
     .type = 1,
     .chance = 40,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_030,
     },
    {
     .type = 1,
     .chance = 40,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_031,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_032,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 011/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_051,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_050,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_052,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 011/2
    {
     .type = 2,
     .chance = 50,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_050,
     },
    {
     .type = 1,
     .chance = 40,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_047,
     },
    {
     .type = 1,
     .chance = 40,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_048,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_049,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 012/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_058,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_057,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_060,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 012/2
    {
     .type = 1,
     .chance = 25,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_056,
     },
    {
     .type = 2,
     .chance = 25,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_057,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 2,
     .scriptID = PHONE_SCRIPT_059,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 013/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_041,
     },
    {
     .type = 8,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_044,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_040,
     },
    {
     .type = 4,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_045,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_042,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 013/2
    {
     .type = 8,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_044,
     },
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_041,
     },
    {
     .type = 2,
     .chance = 50,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_043,
     },
    {
     .type = 2,
     .chance = 50,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_040,
     },
    {
     .type = 1,
     .chance = 40,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_038,
     },
    {
     .type = 1,
     .chance = 40,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_039,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_037,
     },
    PHONE_GENERIC_NULL,

    // 014/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_066,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_065,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_067,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 014/2
    {
     .type = 2,
     .chance = 50,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_065,
     },
    {
     .type = 1,
     .chance = 40,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_062,
     },
    {
     .type = 1,
     .chance = 40,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_063,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_064,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 015/1
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 015/2
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 016/1
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 016/2
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 017/1
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 017/2
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 018/1
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 018/2
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 019/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_110,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_109,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_111,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 019/2
    {
     .type = 2,
     .chance = 25,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_109,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 2,
     .scriptID = PHONE_SCRIPT_108,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 020/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_118,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_116,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_119,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 020/2
    {
     .type = 2,
     .chance = 25,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_116,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 2,
     .scriptID = PHONE_SCRIPT_117,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 021/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_126,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_125,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_127,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 021/2
    {
     .type = 2,
     .chance = 25,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_125,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 2,
     .scriptID = PHONE_SCRIPT_124,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 022/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_132,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_131,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_133,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 022/2
    {
     .type = 2,
     .chance = 50,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_131,
     },
    {
     .type = 1,
     .chance = 50,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_129,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_130,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 023/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_138,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_137,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_139,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 023/2
    {
     .type = 2,
     .chance = 50,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_137,
     },
    {
     .type = 1,
     .chance = 50,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_135,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_136,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 024/1
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 024/2
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 025/1
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 025/2
    {
     .type = 0,
     .chance = 25,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 026/1
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 026/2
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 027/1
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 027/2
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 028/1
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 028/2
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 029/1
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 029/2
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 030/1
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 030/2
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 031/1
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 031/2
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 032/1
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 032/2
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 033/1
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 033/2
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 034/1
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 034/2
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 035/1
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 035/2
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 036/1
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 036/2
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 037/1
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 037/2
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 038/1
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 038/2
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 039/1
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 039/2
    {
     .type = 0,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_NONE,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 040/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_194,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_193,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_195,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 040/2
    {
     .type = 2,
     .chance = 60,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_193,
     },
    {
     .type = 1,
     .chance = 50,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_191,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_192,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 041/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_201,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_200,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_202,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 041/2
    {
     .type = 2,
     .chance = 50,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_200,
     },
    {
     .type = 1,
     .chance = 40,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_197,
     },
    {
     .type = 1,
     .chance = 40,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_198,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_199,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 042/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_208,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_207,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_209,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 042/2
    {
     .type = 2,
     .chance = 50,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_207,
     },
    {
     .type = 1,
     .chance = 40,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_204,
     },
    {
     .type = 1,
     .chance = 40,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_205,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_206,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 043/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_215,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_214,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_216,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 043/2
    {
     .type = 2,
     .chance = 50,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_214,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_211,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_212,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_213,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 044/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_221,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_220,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_222,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 044/2
    {
     .type = 2,
     .chance = 60,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_220,
     },
    {
     .type = 1,
     .chance = 50,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_218,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_219,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 045/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_227,
     },
    {
     .type = 3,
     .chance = 50,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_226,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_228,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 045/2
    {
     .type = 2,
     .chance = 60,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_226,
     },
    {
     .type = 1,
     .chance = 50,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_224,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_225,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 046/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_234,
     },
    {
     .type = 3,
     .chance = 50,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_233,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_235,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 046/2
    {
     .type = 2,
     .chance = 60,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_233,
     },
    {
     .type = 1,
     .chance = 40,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_231,
     },
    {
     .type = 1,
     .chance = 40,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_232,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_230,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 047/1
    {
     .type = 8,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_241,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_239,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 047/2
    {
     .type = 2,
     .chance = 25,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_240,
     },
    {
     .type = 1,
     .chance = 50,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_237,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_238,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 048/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_247,
     },
    {
     .type = 8,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_250,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_246,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_248,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 048/2
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_247,
     },
    {
     .type = 8,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_250,
     },
    {
     .type = 2,
     .chance = 30,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_249,
     },
    {
     .type = 2,
     .chance = 30,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_246,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_244,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_245,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_243,
     },
    PHONE_GENERIC_NULL,

    // 049/1
    {
     .type = 5,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_259,
     },
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_255,
     },
    {
     .type = 8,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_258,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_254,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_256,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 049/2
    {
     .type = 5,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_259,
     },
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_255,
     },
    {
     .type = 8,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_258,
     },
    {
     .type = 2,
     .chance = 30,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_254,
     },
    {
     .type = 2,
     .chance = 10,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_257,
     },
    {
     .type = 1,
     .chance = 50,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_252,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_253,
     },
    PHONE_GENERIC_NULL,

    // 050/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_264,
     },
    {
     .type = 8,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_267,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_263,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_265,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 050/2
    {
     .type = 2,
     .chance = 10,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_266,
     },
    {
     .type = 2,
     .chance = 30,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_263,
     },
    {
     .type = 1,
     .chance = 50,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_262,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_261,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 051/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_272,
     },
    {
     .type = 8,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_275,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_271,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_273,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 051/2
    {
     .type = 2,
     .chance = 10,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_274,
     },
    {
     .type = 2,
     .chance = 30,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_271,
     },
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_272,
     },
    {
     .type = 8,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_275,
     },
    {
     .type = 1,
     .chance = 50,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_269,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_270,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 052/1
    {
     .type = 8,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_281,
     },
    {
     .type = 4,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_282,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_279,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 052/2
    {
     .type = 2,
     .chance = 25,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_280,
     },
    {
     .type = 4,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_282,
     },
    {
     .type = 1,
     .chance = 50,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_277,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_278,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 053/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_287,
     },
    {
     .type = 8,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_290,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_286,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_288,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 053/2
    {
     .type = 2,
     .chance = 30,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_286,
     },
    {
     .type = 2,
     .chance = 10,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_289,
     },
    {
     .type = 1,
     .chance = 50,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_284,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_285,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 054/1
    {
     .type = 8,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_299,
     },
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_295,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_294,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_297,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 054/2
    {
     .type = 1,
     .chance = 25,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_296,
     },
    {
     .type = 2,
     .chance = 30,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_294,
     },
    {
     .type = 2,
     .chance = 10,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_298,
     },
    {
     .type = 1,
     .chance = 50,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_292,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_293,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 055/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_304,
     },
    {
     .type = 8,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_307,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_303,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_305,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 055/2
    {
     .type = 2,
     .chance = 50,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_303,
     },
    {
     .type = 2,
     .chance = 50,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_306,
     },
    {
     .type = 1,
     .chance = 50,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_301,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_302,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 056/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_313,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_312,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_314,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 056/2
    {
     .type = 2,
     .chance = 30,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_312,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_309,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_310,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_311,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 057/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_320,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_319,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_321,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 057/2
    {
     .type = 2,
     .chance = 30,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_319,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_316,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_317,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_318,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 058/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_327,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_326,
     },
    {
     .type = 4,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_329,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_328,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 058/2
    {
     .type = 4,
     .chance = 50,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_329,
     },
    {
     .type = 2,
     .chance = 30,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_326,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_323,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_324,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_325,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 059/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_335,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_334,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_336,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 059/2
    {
     .type = 2,
     .chance = 30,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_334,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_331,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_332,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_333,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 060/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_342,
     },
    {
     .type = 8,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_345,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_341,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_343,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 060/2
    {
     .type = 2,
     .chance = 30,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_341,
     },
    {
     .type = 2,
     .chance = 50,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_344,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_338,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_339,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_340,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 061/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_351,
     },
    {
     .type = 8,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_354,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_350,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_352,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 061/2
    {
     .type = 2,
     .chance = 30,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_350,
     },
    {
     .type = 2,
     .chance = 50,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_353,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_347,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_348,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_349,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 062/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_360,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_359,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_361,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 062/2
    {
     .type = 2,
     .chance = 30,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_359,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_356,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_357,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_358,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 063/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_367,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_366,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_368,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 063/2
    {
     .type = 2,
     .chance = 30,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_366,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_363,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_364,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_365,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 064/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_374,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_373,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_375,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 064/2
    {
     .type = 2,
     .chance = 30,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_373,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_370,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_371,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_372,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 065/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_381,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_380,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_382,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 065/2
    {
     .type = 2,
     .chance = 30,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_380,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_377,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_378,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_379,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 066/1
    {
     .type = 8,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_391,
     },
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_388,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_387,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_389,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 066/2
    {
     .type = 2,
     .chance = 30,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_387,
     },
    {
     .type = 2,
     .chance = 10,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_390,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_384,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_385,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_386,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 067/1
    {
     .type = 8,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_400,
     },
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_397,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_396,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_398,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 067/2
    {
     .type = 2,
     .chance = 30,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_396,
     },
    {
     .type = 2,
     .chance = 10,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_399,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_393,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_394,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_395,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 068/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_406,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_405,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_407,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 068/2
    {
     .type = 2,
     .chance = 30,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_405,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_402,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_403,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_404,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 069/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_414,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_413,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_415,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 069/2
    {
     .type = 1,
     .chance = 25,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_409,
     },
    {
     .type = 2,
     .chance = 30,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_413,
     },
    {
     .type = 1,
     .chance = 20,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_410,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_411,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_412,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 070/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_419,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_418,
     },
    {
     .type = 1,
     .chance = 20,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_420,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 2,
     .scriptID = PHONE_SCRIPT_417,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 070/2
    {
     .type = 2,
     .chance = 30,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_418,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 2,
     .scriptID = PHONE_SCRIPT_417,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 071/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_426,
     },
    {
     .type = 8,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_429,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_425,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_427,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 071/2
    {
     .type = 2,
     .chance = 10,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_428,
     },
    {
     .type = 2,
     .chance = 30,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_425,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_422,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_423,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_424,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 072/1
    {
     .type = 8,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_438,
     },
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_435,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_434,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_436,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 072/2
    {
     .type = 2,
     .chance = 30,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_434,
     },
    {
     .type = 2,
     .chance = 10,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_437,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_431,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_432,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_433,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 073/1
    {
     .type = 8,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_447,
     },
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_444,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_443,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_445,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 073/2
    {
     .type = 2,
     .chance = 30,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_443,
     },
    {
     .type = 2,
     .chance = 10,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_446,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_440,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_441,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_442,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 074/1
    {
     .type = 7,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_454,
     },
    {
     .type = 3,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_453,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_455,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,

    // 074/2
    {
     .type = 2,
     .chance = 30,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_453,
     },
    {
     .type = 1,
     .chance = 15,
     .scriptType = 0,
     .scriptID = PHONE_SCRIPT_449,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_450,
     },
    {
     .type = 1,
     .chance = 30,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_451,
     },
    {
     .type = 1,
     .chance = 100,
     .scriptType = 1,
     .scriptID = PHONE_SCRIPT_452,
     },
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
    PHONE_GENERIC_NULL,
};
