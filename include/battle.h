#ifndef POKEHEARTGOLD_BATTLE_H
#define POKEHEARTGOLD_BATTLE_H

typedef struct BATTLEMSG {
    u8 unk0;
    u8 unk1;
    u16 unk2;
    int unk4[6];
    int unk1C;
    int battlerId;
} BATTLEMSG;

typedef struct BATTLEMSGDATA {
    u8 unk0;
    u8 unk1;
    u16 unk2;
    int unk4[6];
    int unk1C;
} BATTLEMSGDATA;

typedef struct UnkBtlCtxSub_70 {
    u32 unk0;
    u8 unk4[4];
    u8 unk8[4];
    u16 unkC[4];
    int unk14[4];
    int unk24[4];
    u8 unk34[4];
} UnkBtlCtxSub_70;

typedef struct UnkBtlBitfield_72 {
    u32 unk0_0:2;
    u32 unk0_2:3;
    u32 unk0_5:2;
    u32 unk0_7:3;
    u32 unk0_A:2;
    u32 unk0_C:3;
    u32 unk0_F:2;
    u32 unk0_11:3;
    u32 unk0_14:1;
    u32 unk0_15:2;
    u32 unk0_17:6;
    u32 unk0_1D:3;
    u32 unk4_0:2;
    u32 unk4_2:2;
    u32 unk4_4:28;
} UnkBtlBitfield_72;

typedef struct UnkBtlCtxSub_73 {
    u32 unk0_0:1;
    u32 unk0_1:1;
    u32 unk0_2:1;
    u32 unk0_3:1;
    u32 unk0_4:1;
    u32 unk0_5:1;
    u32 unk0_6:1;
    u32 unk0_7:2;
    u32 unk0_9:1;
    u32 unk0_A:22;
    int unk4[4];
    int unk14;
    int unk18;
    int unk1C[4];
    int unk2C;
    int unk30;
    int unk34;
    int unk38;
    int unk3C;
} UnkBtlCtxSub_73;

typedef struct UnkBtlCtxSub_74 {
    u32 unk0_0:1;
    u32 unk0_1:1;
    u32 unk0_2:1;
    u32 unk0_3:1;
    u32 unk0_4:1;
    u32 unk0_5:1;
    u32 unk0_6:3;
    u32 unk0_9:23;
    int unk4;
    int unk8;
    int unkC;
    int unk10;
    int unk14;
    int unk18;
} UnkBtlCtxSub_74;

typedef struct UnkBtlCtxSub_76_Sub {
    u16 unk0;
    u8 moveType;
    u8 unk3;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    u16 unk8;
    s8 unkA;
    u8 unkB;
    u32 unkC;
} UnkBtlCtxSub_76_Sub;

typedef struct UnkBtlCtxSub_76 {
    u8 unk0;
    u8 unk1;
    u16 unk2;
    s8 unk4[4];
    int unk8;
    u32 unkC;
    u8 unk10;
    u8 unk11;
    u8 unk12;
    u8 unk13;
    u8 *unk14;
    u8 unk18[4];
    u16 unk1C[4][4];
    u8 unk5C[4];
    u16 unk60[4];
    u16 unk68[2][4];
    u32 unk78[8];
    u8 unk98;
    u8 unk99[2];
    u8 unk9B;
    u8 unk9C;
    u8 unk9D[2];
    u8 unk9F[2];
    u16 unkA0[2];
    u8 unkA4[4];
    UnkBtlCtxSub_76_Sub unkA8[468];
    u32 unk27C;
    u16 unk280[4];
    u16 unk288[4];
} UnkBtlCtxSub_76;


typedef struct UnkBattlemonSub {
    u32 unk4_0:2, unk4_2:4, unk4_6:2, unk4_8:2,
        unk4_A:3, unk4_D:3, unk4_10:3, unk4_13:3,
        unk4_16:1, unk4_17:4, unk4_2B:1, unk4_2C:1,
        unk4_2D:1, me_first_flag:1, unk4_2F:1;
    u32 unk0_0:3, unk0_3:3, unk0_6:2, unk0_8:3,
        unk0_B:2, unk0_D:2, unk0_F:3, unk0_12:3,
        unk0_15:3, unk0_18:3, unk0_1A:3, unk0_1D:1, unk0_1E:1;
    int unk8;
    int unkC;
    int unk10;
    int unk14;
    u32 unk18;
    u16 unk1A;
    u16 unk1C;
    u16 unk1E;
    u16 unk20;
    u16 unk24[4];
    u16 unk2C;
    u16 unk2E;
    int unk30;
} UnkBattlemonSub;

typedef struct BATTLEMON {
    u16 unk0;
    u16 unk2;
    u16 unk4;
    u16 unk6;
    u16 unk8;
    u16 unkA;
    u16 unkC[4];
    u32 hpIV:5, atkIV:5, defIV:5, spdIV:5, spatkIV:5, spdefIV:5, isEgg:1, isNicknamed:1;
    s8 unk18[8];
    int unk20;
    u8 unk24;
    u8 unk25;
    u8 unk26_0:5, unk26_5:1, unk26_6:2;
    u8 unk27;
    u32 unk28_0:1, unk28_1:1, unk28_2:1, unk28_3:1, 
        unk28_4:1, unk28_5:1, unk28_6:1, unk28_7:1,
        unk28_8:1, unk28_9:1, unk28_A:1, unk28_B:21;
    u32 unk2A;
    u8 unk2C[4];
    u8 unk30[4];
    u8 unk34;
    u8 unk35;
    u16 unk36[9];
    int hp;
    u32 maxHp;
    u32 unk;
    u16 unk54[8];
    u32 unk64;
    u32 unk68;
    u32 unk6C;
    u32 unk70;
    u32 unk74;
    u16 unk78;
    u16 unk7A;
    u8 unk7C;
    u8 unk7D;
    u8 unk7E_0:4, unk7E_4:4;
    u8 unk7F;
    u32 unk80;
    u32 unk84;
    UnkBattlemonSub unk88;
} BATTLEMON;

/*
typedef struct UnkBtlCtxSub_73 {
    
} UnkBtlCtxSub_73;
*/

typedef struct BATTLECONTEXT {
    u8 unk_0[4];
    u8 unk_4[4];
    int unk_8;
    int unk_C;
    int unk_10;
    int unk_14;
    int unk_18;
    int unk_1C;
    int unk_20;
    int unk_24;
    int unk_28;
    int unk_2C;
    int unk_30;
    int unk_34;
    int unk_38;
    int unk_3C;
    int unk_40;
    int unk_44;
    int unk_48;
    int unk_4C;
    int unk_50;
    int unk_54;
    int unk_58;
    int unk_5C;
    int unk_60;
    int battlerIdAttacker;
    int unk_68;
    int battlerIdTarget;
    int unk_70;
    int battlerIdFainted;
    int unk_78;
    int unk_7C;
    int unk_80;
    int unk_84;
    int unk_88;
    int unk_8C;
    int unk_90;
    int unk_94;
    int unk_98;
    int unk_9C;
    int unk_A0;
    u32 unk_A4[2];
    int unk_AC;
    int unk_B0;
    int unk_B4;
    int unk_B8;
    int unk_BC[4];
    int unk_CC[4];
    int unk_DC[4];
    int unk_EC;
    int unk_F0;
    BATTLEMSG buffMsg;
    int unk_118;
    int unk_11C;
    int unk_120;
    int unk_124;
    int unk_128;
    int unk_12C;
    int unk_130;
    int unk_134;
    int unk_138;
    u32 unk_13C[4];
    u32 unk_14C;
    int unk_150;
    int unk_154[4];
    int unk_164[4];
    int unk_174;
    u32 unk_178;
    void * unk_17C;
    u32 unk_180;
    UnkBtlCtxSub_70 unk_184;
    u32 field71_0x168[2];
    UnkBtlBitfield_72 field72_0x170[2];
    UnkBtlCtxSub_73 unk_1D4[4];
    UnkBtlCtxSub_74 field74_0x188[4];
    u32 field75_0x198[4]; //note: this is an unidentified bitfield array
    UnkBtlCtxSub_76 unk_334;
    u32 * unk_2134;
    u32 unk_2138;
    u32 unk_213C;
    u32 unk_2140;
    int damage;
    int unk_2148;
    int unk_214C;
    int criticalMultiplier;
    int movePower;
    int unk_2158;
    int unk_215C;
    int moveType;
    int unk_2164;
    int unk_2168;
    u32 unk_216C;
    u32 unk_2170;
    u32 unk_2174;
    u32 unk_2178;
    u8 unk_217C;
    u8 unk_217D;
    u8 unk_217E;
    u8 unk_217F;
    u32 unk_2180;
    u32 unk_2184;
    u32 unk_2188;
    u32 unk_218C[4];
    u8 unk_219C[4];
    u8 unk_21A0[4];
    u8 unk_21A4[4];
    u32 unk_21A8[4][4];
    u8 unk_21E8[4];
    u8 unk_21EC[4];
    u32 unk_21F0[4];
    u8 unk_2200[4][4][16];
    u8 field111_0x378[4][256];
    int unk_2700[400];
    BATTLEMON battleMons[4];
    u32 field114_0xdc8;
    u32 field115_0xdcc;
    u32 field116_0xdd0;
    u32 field117_0xdd4[4];
    u16 field118_0xde4[4];
    u16 field119_0xdec[4];
    u16 field120_0xdf4[4];
    u16 field121_0xdfc[4];
    u16 field122_0xe04[4];
    u16 field123_0xe0c[4];
    u16 field124_0xe14[4][4];
    u16 unk_30AC[4];
    u16 unk_30B4[4];
    u16 unk_30BC[4];
    u16 unk_30C4[4];
    u16 unk_30CC[4];
    u16 unk_30D4[4];
    u16 unk_30DC[4];
    int unk_30E4[4];
    int unk_30F4[4];
    int unk_3104;
    u8 unk_3108;
    u8 unk_3109;
    u16 unk_310A;
    u16 unk_310C[4];
    int unk_3114;
    int unk_3118;
    u8 unk_311C;
    u8 unk_311D;
    u8 unk_311E;
    u8 unk_311F;
    u8 unk_3120;
    u8 unk_3121;
    s16 unk_3122;
    u16 unk_3124[4];
    u8 unk_312C[4][6];
    int unk_3144;
    int unk_3148;
    u8 unk_314C[4];
    int unk_3150;
    u32 unk_3154:1;
    u32 unused:31;
} BATTLECONTEXT;

typedef struct BattleSystem BattleSystem;

typedef struct OpponentData_UnkSub_28 {
    u8 unk0;
    u32 unk4;
    u32 unk8;
    BattleSystem *bsys;
    u32 unk10;
    u8 unk14;
    u8 unk15;
    u8 unk16;
    u8 unk17;
    int unk18;
    int unk1C;
    int unk20;
    int unk24;
    int unk28;
    int unk2C;
    int unk30;
    int unk34;
    u8 unk38;
    u8 unk39;
    u8 unk3A;
    u8 unk3B;
    u8 unk3C;
    u8 unk3D;
    u8 unk3E;
    u8 unk3F_0:1, unk3F_1:1, unk3F_2:1, unk3F_3:1;
    u32 unk40;
    u16 unk44;
} OpponentData_UnkSub_28;

typedef struct OpponentData_UnkSub_70 {
    s8 unk0;
    s8 unk1;
    s8 unk2;
    s8 unk3;
    s8 unk4;
    s8 unk5;
    s8 unk6;
    u8 unk7;
} OpponentData_UnkSub_70;

typedef struct OpponentData {
    u32 unk0[6];
    u32 unk18;
    u32 *unk1C;
    u32 *unk20;
    u32 *unk24;
    OpponentData_UnkSub_28 unk28;
    OpponentData_UnkSub_70 unk70;
    u32 unk78;
    u32 *unk7C;
    void *unk80;
    u8 unk84[0x110];
    u8 unk194;
    u8 unk195;
    u8 unk196;
    u8 unk197;
    u32 unk198;
    u16 unk19C;
    int unk1A0;
    u32 *unk1A4;
    u8 unk1A8;
    u8 unk1A9[3];
} OpponentData;

typedef struct UnkBattleSystemSubAC_Sub {
    u16 unk0;
    u16 unk2;
    u16 unk4[2];
} UnkBattleSystemSubAC_Sub;

typedef struct UnkBattleSystemSubAC {
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u16 unk4[4];
    u32 unkC;
    u32 unk10;
    u16 unk14[8];
    UnkBattleSystemSubAC_Sub unk24;
    UnkBattleSystemSubAC_Sub unk2C;
} UnkBattleSystemSubAC; //size: 0x34

typedef struct UnkBattleSystemSub17C {
    u32 unk0;
    BattleSystem *bsys;
    u8 unk8;
    u8 unk9;
    s16 unkA;
    s16 unkC;
    u16 unused;
} UnkBattleSystemSub17C; //size: 0x10

typedef struct UnkBattleSystemSub1D0 {
    u8 *unk0;
    int unk4;
    int unk8;
    int unkC;
} UnkBattleSystemSub1D0;

typedef struct UnkBattleSystemSub220 {
    int unk0;
    int unk4;
    int unk8;
} UnkBattleSystemSub220;

struct BattleSystem {
    u32 *unk0;
    u32 *unk4;
    u32 *unk8;
    u32 *unkC;
    u32 *unk10;
    u32 *unk14;
    u32 *unk18;
    u32 unk1C;
    u32 unk20;
    u32 unk24;
    u32 unk28;
    u32 unk2C; 
    BATTLECONTEXT *ctx;
    OpponentData *opponentData[4];
    int unk44; //labels wrong from here until unk23E8
    u32 *unk48[4];
    u32 *unk58;
    u32 *unk5C;
    u32 *unk60;
    u32 *unk64;
    u32 *unk68[4];
    u32 *unk78[4];
    u32 *unk88;
    u32 unk8C;
    u32 unk90;
    u32 unk94;
    u32 *unk98;
    u32 *unk9C;
    u16 unkA0[4];
    u8 unkA8[4];
    UnkBattleSystemSubAC unkAC[4];
    UnkBattleSystemSub17C unk17C[2];
    u32 unk19C;
    u32 unk1A0[2];
    u32 *unk1A8;
    u32 *unk1AC;
    void *unk1B0;
    u32 *unk1B4;
    u32 *unk1B8;
    void *unk1BC;
    u32 *unk1C0;
    u32 *unk1C4;
    u32 unk1C8;
    u32 *unk1CC;
    UnkBattleSystemSub1D0 unk1D0[4];
    UnkBattleSystemSub220 unk220;
    u32 *unk22C;
    u8 *unk230;
    u16 *unk234;
    u8 unk238[0x1000];
    u8 unk1238[0x1000];
    u16 unk2238[0x70];
    u16 unk2318[0x70];
    u16 unk23E8; //labeling may be wrong before here 
    u16 unk23EA;
    u16 unk23EC;
    u16 unk23EE;
    u16 unk23F0;
    u16 unk23F2;
    u8 *unk23F4;
    u8 *unk23F8;
    u8 unk23FC;
    u8 unk23FD;
    u8 unk23FE;
    u8 unk240F_0:1, unk240F_1:1, unk240E_F:1, unk240F_3:2, unk240F_5:3;
    int unk2400;
    int unk2404;
    int unk2408;
    u32 unk240C; 
    int unk2410;
    int unk2414;
    u8 unk2418[4];
    u32 unk241C;
    u8 unk2420;
    u8 unk2421;
    u16 unk2422;
    int unk2424;
    int unk2428;
    int unk242C;
    int unk2430;
    u32 unk2434;
    int unk2438;
    int unk243C;
    u8 unk2440;
    u8 unk2441;
    u32 unk2442;
    u32 unk2444;
    u32 unk2448;
    u16 unk244C[4];
    u16 unk2454[4];
    u16 unk245C[4];
    int unk2464[4];
    u32 unk2474_0:1, unk2474_1:31;
    u32 unk2478;
    u8 unk247C[4];
};

typedef BOOL (*BtlCmdFunc)(BattleSystem*, BATTLECONTEXT*);

#endif