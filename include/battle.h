#ifndef POKEHEARTGOLD_BATTLE_H
#define POKEHEARTGOLD_BATTLE_H

#include "move.h"
#include "trainer_data.h"

typedef struct BATTLEMSG {
    u8 unk0;
    u8 tag;
    u16 id;
    int param[6];
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

typedef struct GetterWork GetterWork;

typedef struct FieldConditionData {
    u32 weatherTurns;
    u8 futureSightTurns[4];
    u8 wishTurns[4];
    u16 futureSightMoveNo[4];
    int battlerIdFutureSight[4];
    int futureSightDamage[4];
    u8 wishTarget[4];
} FieldConditionData;

typedef struct SideConditionData {
    u32 reflectBattler:2;
    u32 reflectTurns:3;
    u32 lightScreenBattler:2;
    u32 lightScreenTurns:3;
    u32 mistBattler:2;
    u32 mistTurns:3;
    u32 safeguardBattler:2;
    u32 safeguardTurns:3;
    u32 followMeFlag:1;
    u32 battlerIdFollowMe:2;
    u32 battlerBitKnockedOffItem:6;
    u32 unk0_1D:3;
    u32 spikesLayers:2;
    u32 toxicSpikesLayers:2;
    u32 unk4_4:28;
} SideConditionData;

typedef struct TurnData {
    u32 struggleFlag:1;
    u32 unk0_1:1;
    u32 protectFlag:1;
    u32 helpingHandFlag:1;
    u32 magicCoatFlag:1;
    u32 snatchFlag:1;
    u32 unk0_6:1;
    u32 unk0_7:2;
    u32 unk0_9:1;
    u32 unk0_A:22;
    int physicalDamage[4];
    int battlerIdPhysicalDamage;
    int battlerBitPhysicalDamage;
    int specialDamage[4];
    int battlerIdSpecialDamage;
    int battlerBitSpecialDamage;
    int unk34;
    int unk38;
    int unk3C;
} TurnData;

typedef struct SelfTurnData {
    u32 ignorePressure:1;
    u32 unk0_1:1;
    u32 unk0_2:1;
    u32 unk0_3:1;
    u32 trickRoomFlag:1;
    u32 unk0_5:1;
    u32 rolloutCount:3;
    u32 unk0_9:23;
    int unk4;
    int unk8;
    int unkC;
    int unk10;
    int unk14;
    int unk18;
} SelfTurnData;

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
    MOVE moveData[468];
    u32 unk27C;
    u16 unk280[4];
    u16 unk288[4];
} UnkBtlCtxSub_76;


typedef struct UnkBattlemonSub {
    u32 disabledTurns:3, 
        encoredTurns:3, 
        unk0_6:2, 
        unk0_8:3,
        protectSuccessTurns:2, 
        perishSongTurns:2, 
        rolloutCount:3, 
        furyCutterCount:3,
        unk0_15:3, 
        unk0_18:3, 
        unk0_1A:3, 
        trauntFlag:1, 
        unk0_1E:1;
    u32 battlerIdLockOn:2, 
        mimicedMoveIndex:4, 
        battlerIdBinding:2, 
        unk4_8:2,
        lastResortCount:3, 
        unk4_D:3, 
        unk4_10:3, 
        unk4_13:3,
        unk4_16:1, 
        unk4_17:4, 
        unk4_2B:1, 
        unk4_2C:1,
        unk4_2D:1, 
        meFirstFlag:1, 
        unk4_2F:1;
    int unk;
    int unk8;
    int slowStartTurns;
    int meFirstCount;
    int substituteHp;
    u32 transformPersonality;
    u16 disabledMove;
    u16 bindingMove;
    u16 encoredMove;
    u16 encoredMoveIndex;
    u16 unk24[4];
    u16 moveNoChoice;
    u16 transformGender;
    int unk30;
} UnkBattlemonSub;

typedef struct BATTLEMON {
    u16 species;
    u16 unk2;
    u16 unk4;
    u16 unk6;
    u16 unk8;
    u16 unkA;
    u16 moves[4];
    u32 hpIV:5, 
        atkIV:5, 
        defIV:5, 
        spdIV:5, 
        spatkIV:5, 
        spdefIV:5, 
        isEgg:1, 
        isNicknamed:1;
    s8 statChanges[8];
    int weight;
    u8 type1;
    u8 type2;
    u8 forme:5, 
       unk26_5:1, 
       unk26_6:2;
    u8 unk27;
    u32 unk28_0:1, 
        intimidateFlag:1, 
        traceFlag:1, 
        downloadFlag:1, 
        anticipationFlag:1, 
        forewarnFlag:1, 
        slowStartFlag:1, 
        slowStartEnded:1,
        friskFlag:1, 
        moldBreakerFlag:1, 
        pressureFlag:1, 
        unk28_B:21;
    u8 movePPCur[4];
    u8 movePP[4];
    u8 level;
    u8 unk31;
    u8 unk32;
    u8 unk33;
    u8 unk34;
    u8 unk35;
    u16 unk36[9];
    int hp;
    u32 maxHp;
    u32 unk;
    u16 unk54[8];
    u32 personality;
    u32 status;
    u32 status2;
    u32 unk70;
    u16 item;
    u16 unk76;
    u16 unk78;
    u8 gender:4, 
       unk7A_4:4;
    u8 unk7B;
    u32 moveEffectFlags;
    u32 unk80;
    UnkBattlemonSub unk88;
} BATTLEMON;

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
    int battlerIdAttackerTemp;
    int battlerIdTarget;
    int battlerIdTargetTemp;
    int battlerIdFainted;
    int battlerIdSwitch;
    int battlerIdSwitchTemp;
    int battlerIdAbility;
    int battlerIdMagicCoat;
    int unk_88;
    int statChangeParam;
    int unk_90;
    int battlerIdStatChange;
    int unk_98;
    int gainedExp;
    int partyGainedExp;
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
    int battlerIdWork;
    int unk_11C;
    int unk_120;
    int moveWork;
    int unk_128;
    int unk_12C;
    int msgWork;
    int calcWork;
    int tempWork;
    u32 unk_13C[4];
    u32 unk_14C;
    int totalTurns;
    int totalTimesFainted[4];
    int totalDamage[4];
    int meFirstTotal;
    GetterWork *getterWork;
    void * unk_17C;
    u32 fieldCondition;
    FieldConditionData fieldConditionData;
    u32 fieldSideConditionFlags[2];
    SideConditionData fieldSideConditionData[2];
    TurnData turnData[4];
    SelfTurnData selfTurnData[4];
    u32 field75_0x198[4]; //note: this is an unidentified bitfield array
    UnkBtlCtxSub_76 unk_334;
    u32 * unk_2134;
    u32 unk_2138;
    u32 linkStatus;
    u32 linkStatus2;
    int damage;
    int hitDamage;
    int unk_214C;
    int criticalMultiplier;
    int movePower;
    int unk_2158;
    int hpCalcWork;
    int moveType;
    int unk_2164;
    int prizeMoneyValue;
    u32 moveStatusFlag;
    u32 unk_2170;
    u32 unk_2174;
    u32 unk_2178;
    u8 multiHitCount;
    u8 multiHitCountTemp;
    u8 unk_217E;
    u8 beatUpCount;
    u32 unk_2180;
    u32 unk_2184;
    u32 checkMultiHit;
    u32 unk_218C[4];
    u8 battlerIdSelected[4];
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
    u32 moveNoTemp;
    u32 moveNoCur;
    u32 moveNoPrev;
    u32 moveNoKeep[4];
    u16 moveNoProtect[4];
    u16 field119_0xdec[4];
    u16 field120_0xdf4[4];
    u16 field121_0xdfc[4];
    u16 moveNoBattlerPrev[4];
    u16 moveNoCopied[4];
    u16 moveNoCopiedHit[4][4];
    u16 moveNoSketch[4];
    u16 unk_30B4[4];
    u16 movePos[4];
    u16 conversion2Move[4];
    u16 conversion2BattlerId[4];
    u16 conversion2Type[4];
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
    u8 magnitude;
    u8 unk_3121;
    s16 hpTemp;
    u16 unk_3124[4];
    u8 unk_312C[4][6];
    int unk_3144;
    int unk_3148;
    u8 unk_314C[4];
    int battlersOnField;
    u32 battleContinueFlag:1;
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
    u32 battleTypeFlags; 
    BATTLECONTEXT *ctx;
    OpponentData *opponentData[4];
    int unk44; //labels wrong from here until unk23E8
    u32 *unk48[4];
    u32 *unk58;
    u32 *unk5C;
    u32 *unk60;
    u32 *unk64;
    PARTY *trainerParty[4];
    u32 *unk78[4];
    u32 *unk88;
    u32 unk8C;
    u32 unk90;
    u32 unk94;
    u32 *unk98;
    u32 *unk9C;
    u16 trainerId[4];
    u8 trainerGender[4];
    TRAINER trainers[4];
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
    u8 battleOutcomeFlag;
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
    u32 unk2474_0:1, unk2474_1:1, unk2474_2:30;
    u32 unk2478;
    u8 unk247C[4];
};

struct GetterWork {
    BattleSystem *bsys;
    BATTLECONTEXT *ctx;
    u32 unk8;
    u32 unkC[2];
    u32 unk14;
    u32 unk18[3];
    int unk24;
    int unk28;
    int unk2C;
    int unk30[8];
    void *unk50[2];
}; //size: 0x58

typedef BOOL (*BtlCmdFunc)(BattleSystem*, BATTLECONTEXT*);

typedef struct {
    u16 unk0;
    u16 unk2;
    u16 unk4;
    u16 unk6;
    u16 unk8[4];
    u16 unk10;
} UnkBtlCmdStruct_CPM;

#endif