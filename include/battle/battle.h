#ifndef POKEHEARTGOLD_BATTLE_H
#define POKEHEARTGOLD_BATTLE_H

#include "constants/battle.h"
#include "constants/moves.h"

#include "bag.h"
#include "bag_cursor.h"
#include "bg_window.h"
#include "filesystem.h"
#include "font.h"
#include "game_stats.h"
#include "item.h"
#include "move.h"
#include "msgdata.h"
#include "options.h"
#include "palette.h"
#include "player_data.h"
#include "pokedex.h"
#include "pokemon_storage_system.h"
#include "pokepic.h"
#include "sav_chatot.h"
#include "sprite.h"
#include "sprite_system.h"
#include "sys_task_api.h"
#include "trainer_data.h"
#include "unk_0200CE7C.h"

typedef struct BattleMessage {
    u8 unk0;
    u8 tag;
    u16 id;
    int param[6];
    int numDigits;
    int battlerId;
} BattleMessage;

typedef struct BattleMessageData {
    u8 unk0;
    u8 unk1;
    u16 unk2;
    int unk4[6];
    int unk1C;
} BattleMessageData;

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
    u32 reflectBattler : 2;
    u32 reflectTurns : 3;
    u32 lightScreenBattler : 2;
    u32 lightScreenTurns : 3;
    u32 mistBattler : 2;
    u32 mistTurns : 3;
    u32 safeguardBattler : 2;
    u32 safeguardTurns : 3;
    u32 followMeFlag : 1;
    u32 battlerIdFollowMe : 2;
    u32 battlerBitKnockedOffItem : 6;
    u32 unk0_1D : 3;
    u32 spikesLayers : 2;
    u32 toxicSpikesLayers : 2;
    u32 unk4_4 : 28;
} SideConditionData;

typedef struct TurnData {
    u32 struggleFlag : 1;
    u32 unk0_1 : 1;
    u32 protectFlag : 1;
    u32 helpingHandFlag : 1;
    u32 magicCoatFlag : 1;
    u32 snatchFlag : 1;
    u32 roostFlag : 1;
    u32 runFlag : 2; // 1 - Fled using item, 2 - Fled using ability
    u32 endureFlag : 1;
    u32 unk0_A : 22;
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
    u32 ignorePressure : 1;
    u32 lightningRodFlag : 1;
    u32 stormDrainFlag : 1;
    u32 moldBreakerFlag : 1;
    u32 trickRoomFlag : 1;
    u32 endureItemFlag : 1;
    u32 rolloutCount : 3;
    u32 unk0_9 : 23;
    int physicalDamage;
    int battlerIdPhysicalAttacker;
    int specialDamage;
    int battlerIdSpecialAttacker;
    int unk14;
    int shellBellDamage;
} SelfTurnData;

typedef struct TrainerAIData {
    u8 unk0;
    u8 unk1;
    u16 unk2;
    s8 movePoints[4]; // higher points = more priority for selection
    int unk8;
    u32 aiFlags;
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
    u8 battlerIdAttacker;
    u8 battlerIdTarget;
    u8 useItem[2];
    u8 unk9F[2];
    u16 unkA0[2];
    u8 unkA4[4];
    MoveTbl moveData[NUM_MOVES + 1];
    ItemData *itemData;
    u16 unk280[4];
    u16 unk288[4];
} TrainerAIData;

typedef struct MoveFailFlags {
    u32 paralysis : 1;
    u32 noEffect : 1;
    u32 imprison : 1;
    u32 infatuation : 1;
    u32 disabled : 1;
    u32 unk0_5 : 1;
    u32 flinch : 1;
    u32 confusion : 1;
    u32 gravity : 1;
    u32 healBlock : 1;
    u32 unused : 21;
} MoveFailFlags;

typedef struct UnkBattlemonSub {
    u32 disabledTurns : 3;
    u32 encoredTurns : 3;
    u32 isCharged : 2;
    u32 tauntTurns : 3;
    u32 protectSuccessTurns : 2;
    u32 perishSongTurns : 2;
    u32 rolloutCount : 3;
    u32 furyCutterCount : 3;
    u32 stockpileCount : 3;
    u32 stockpileDefCount : 3;
    u32 stockpileSpDefCount : 3;
    u32 truantFlag : 1;
    u32 flashFire : 1;
    u32 battlerIdLockOn : 2;
    u32 mimicedMoveIndex : 4;
    u32 battlerIdBinding : 2;
    u32 battlerIdMeanLook : 2;
    u32 lastResortCount : 3;
    u32 magnetRiseTurns : 3;
    u32 healBlockTurns : 3;
    u32 embargoFlag : 3;
    u32 knockOffFlag : 1;   // unclear whether true mean knocked off or not knocked
                            // off based on current information on its usage
    u32 metronomeTurns : 4; // refers to the item, not the move
    u32 micleBerryFlag : 1;
    u32 custapBerryFlag : 1;
    u32 quickClawFlag : 1;
    u32 meFirstFlag : 1;
    u32 unk4_2F : 1; // unused
    int rechargeCount;
    int fakeOutCount;
    int slowStartTurns;
    int meFirstCount;
    int substituteHp;
    u32 transformPersonality;
    u16 disabledMove;
    u16 bindingMove;
    u16 encoredMove;
    u16 encoredMoveIndex;
    u16 lastResortMoves[4];
    u16 moveNoChoice;
    u16 transformGender;
    int unk30;
} UnkBattlemonSub;

typedef struct BattleMon {
    u16 species;
    u16 atk;
    u16 def;
    u16 speed;
    u16 spAtk;
    u16 spDef;
    u16 moves[MAX_MON_MOVES];
    u32 hpIV : 5;
    u32 atkIV : 5;
    u32 defIV : 5;
    u32 speedIV : 5;
    u32 spAtkIV : 5;
    u32 spDefIV : 5;
    u32 isEgg : 1;
    u32 hasNickname : 1;
    s8 statChanges[NUM_BATTLE_STATS];
    int weight;
    u8 type1;
    u8 type2;
    u8 form : 5;
    u8 shiny : 1;
    u8 unk26_6 : 2;
    u8 ability;
    u32 sendOutFlag : 1;
    u32 intimidateFlag : 1;
    u32 traceFlag : 1;
    u32 downloadFlag : 1;
    u32 anticipationFlag : 1;
    u32 forewarnFlag : 1;
    u32 slowStartFlag : 1;
    u32 slowStartEnded : 1;
    u32 friskFlag : 1;
    u32 moldBreakerFlag : 1;
    u32 pressureFlag : 1;
    u32 unk28_B : 21;
    u8 movePPCur[MAX_MON_MOVES];
    u8 movePP[MAX_MON_MOVES];
    u8 level;
    u8 friendship;
    u16 nickname[POKEMON_NAME_LENGTH + 1];
    s32 hp;
    u32 maxHp;
    u16 otName[PLAYER_NAME_LENGTH + 1];
    u32 exp;
    u32 personality;
    u32 status;
    u32 status2;
    u32 otid;
    u16 item;
    u16 unk76;
    u8 unk78;
    u8 msgFlag;
    u8 gender : 4;
    u8 metGender : 4;
    u8 ball;
    u32 moveEffectFlags;
    u32 moveEffectFlagsTemp;
    UnkBattlemonSub unk88;
} BattleMon;

typedef struct PokemonStats {
    u32 stats[6];
} PokemonStats;

typedef struct PlayerActions {
    ControllerCommand command;
    u32 unk4;
    u32 unk8;
    u32 inputSelection;
} PlayerActions;

typedef struct BattleContext {
    u8 unk_0[4];
    u8 unk_4[4];
    ControllerCommand command;
    ControllerCommand commandNext;
    int stateFieldConditionUpdate;
    int fieldConditionUpdateData;
    int stateUpdateMonCondition;
    int updateMonConditionData;
    int stateUpdateFieldConditionExtra;
    int updateFieldConditionExtraData;
    int stateBeforeTurn;
    int beforeTurnData;
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
    int sendOutState;
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
    int statChangeType;
    int statChangeParam;
    int statChangeFlag;
    int battlerIdStatChange;
    int unk_98;
    int gainedExp;
    int partyGainedExp;
    u32 unk_A4[2];
    NarcId scriptNarcId;
    int scriptFileId;
    int scriptSeqNo;
    int unk_B8;
    NarcId unk_BC[4];
    int unk_CC[4];
    int unk_DC[4];
    int executionIndex;
    int unk_F0;
    BattleMessage buffMsg;
    int battlerIdTemp;
    int battlerIdLeechSeedRecv;
    int battlerIdLeechSeeded;
    int moveTemp;
    int itemTemp;
    int abilityTemp;
    int msgTemp;
    int calcTemp;
    int tempData;
    u32 unk_13C[4];
    u32 unk_14C;
    int totalTurns;
    int totalTimesFainted[4];
    int totalDamage[4];
    int meFirstTotal;
    GetterWork *getterWork;
    PokemonStats *prevLevelStats;
    u32 fieldCondition;
    FieldConditionData fieldConditionData;
    u32 fieldSideConditionFlags[2];
    SideConditionData fieldSideConditionData[2];
    TurnData turnData[4];
    SelfTurnData selfTurnData[4];
    MoveFailFlags moveFail[4];
    TrainerAIData trainerAIData;
    u32 *unk_2134;
    u32 unk_2138;
    u32 battleStatus;
    u32 battleStatus2;
    int damage;
    int hitDamage; // amount of damage dealt on hit, ie ignoring overkill damage
    int criticalCnt;
    int criticalMultiplier;
    int movePower;
    int unk_2158;
    int hpCalc;
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
    u8 selectedMonIndex[4];
    u8 unk_21A0[4];
    u8 unk_21A4[4];
    PlayerActions playerActions[4];
    u8 executionOrder[4]; // accounts for running, items, etc used in battler
                          // slots
    u8 turnOrder[4];      // by pokemon speed, accounting for trick room
    u32 effectiveSpeed[4];
    u8 linkBuffer[4][4][16];
    u8 battleBuffer[4][256];
    int battleScriptBuffer[400];
    BattleMon battleMons[4];
    u32 moveNoTemp;
    u32 moveNoCur;
    u32 moveNoPrev;
    u32 moveNoLockedInto[4];
    u16 moveNoProtect[4];
    u16 moveNoHit[4];
    u16 moveNoHitBattler[4];
    u16 moveNoHitType[4];
    u16 moveNoBattlerPrev[4];
    u16 moveNoCopied[4];
    u16 moveNoCopiedHit[4][4];
    u16 moveNoSketch[4];
    u16 unk_30B4[4];
    u16 movePos[4];
    u16 conversion2Move[4];
    u16 conversion2BattlerId[4];
    u16 conversion2Type[4];
    u16 moveNoMetronome[4];
    int unk_30E4[4];
    int unk_30F4[4];
    int unk_3104;
    u8 switchInFlag;
    u8 levelUpMons;
    u16 unk_310A;
    u16 unk_310C[4];
    int flingData;
    int flingScript;
    u8 unk_311C;
    u8 safariRunAttempts;
    u8 runAttempts;
    u8 battleEndFlag;
    u8 magnitude;
    u8 weatherCheckFlag;
    s16 hpTemp;
    u16 recycleItem[4];
    u8 unk_312C[4][6];
    int unk_3144;
    int queueTimeout;
    u8 unk_314C[4];
    int battlersOnField;
    u32 battleContinueFlag : 1;
    u32 unused : 31;
} BattleContext;

typedef struct BattleSystem BattleSystem;

typedef struct BattleHpBar {
    struct {
        u8 script;
    };
    ManagedSprite *boxObj;
    ManagedSprite *arrowObj;
    BattleSystem *bsys;
    SysTask *unk10;
    Window unk14;
    u8 battlerId;
    u8 type;
    u8 monId;
    u8 unk27;
    s32 hp;
    s32 maxHp;
    s32 gainedHp;
    s32 hpCalc;
    s32 exp;
    s32 maxExp;
    s32 gainedExp;
    s32 expCalc;
    u8 level;
    u8 unk49;
    u8 unk_4A;
    u8 unk4B;
    u8 unk4C;
    u8 unk4D;
    u8 unk4E;
    u8 unk_4F_0 : 1;
    u8 unk_4F_1 : 1;
    u8 unk_4F_2 : 1;
    u8 unk_4F_3 : 1;
    SysTask *sysTask;
    u16 unk54;
} BattleHpBar;

typedef struct OpponentData {
    u32 unk0[6];
    u32 unk18;
    u32 *unk1C;
    Pokepic *pokepic;
    u32 *unk24;
    BattleHpBar hpBar;
    void *unk80;
    u8 unk84[0x110];
    u8 unk194;
    u8 unk195;
    u8 unk196;
    u8 unk197;
    SysTask *unk198;
    u16 unk19C;
    int unk1A0;
    u32 *unk1A4;
    u8 unk1A8;
    u8 unk1A9[3];
} OpponentData;

typedef struct UnkBattleSystemSub17C {
    ManagedSprite *unk0;
    BattleSystem *bsys;
    u8 unk8;
    u8 unk9;
    s16 unkA;
    s16 unkC;
    u16 unused;
} UnkBattleSystemSub17C; // size: 0x10

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
    BgConfig *bgConfig;
    Window *window;
    MsgData *msgData;
    u32 *unk10;
    MessageFormat *msgFormat;
    String *msgBuffer;
    u32 unk1C;
    u32 unk20;
    u32 unk24;
    PaletteData *palette;
    u32 battleType;
    BattleContext *ctx;
    OpponentData *opponentData[4];
    int maxBattlers;
    PlayerProfile *playerProfile[4];
    Bag *bag;
    BagCursor *bagCursor;
    Pokedex *pokedex;
    PCStorage *storage;
    Party *trainerParty[4];
    SOUND_CHATOT *chatotVoice[4];
    u32 *unk88;
    u32 *unk8C;
    SpriteSystem *spriteRenderer;
    SpriteManager *gfxHandler;
    u32 *unk98;
    u32 *unk9C;
    u16 trainerId[4];
    u8 trainerGender[4];
    Trainer trainers[4];
    UnkBattleSystemSub17C unk17C[2]; // Battle Background..?
    u32 *unk19C;
    u32 *unk1A0[2];
    BattleNumberPrinter *hpNumPrinter;
    BattleNumberPrinter *levelNumPrinter;
    void *msgIcon;
    Options *options;
    u32 *unk1B8;
    void *unk1BC;
    u32 *unk1C0;
    u32 *unk1C4;
    void *unk1C8; // related to animations
    u32 *unk1CC;
    UnkBattleSystemSub1D0 unk1D0[4];
    UnkBattleSystemSub220 unk210;
    GameStats *gameStats;
    u8 *unk220;
    u16 *unk224;
    u8 sendBuffer[0x1000];
    u8 recvBuffer[0x1000];
    u16 unk2228[0x70];
    u16 unk2308[0x70];
    u16 unk23E8;
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
    u8 unk240F_0 : 1;
    u8 unk240F_1 : 1;
    u8 unk240E_F : 1;
    u8 criticalHpMusic : 2;
    u8 criticalHpMusicDelay : 3;
    Terrain terrain;
    int unk2404;
    int location;
    u32 battleSpecial;
    int timezone; // might be timeOfDay? unclear
    int safariBallCnt;
    u8 unk2418[4];
    u32 unk241C;
    u8 battleOutcomeFlag;
    u8 unk2421;
    u16 unk2422;
    int unk2424;
    int unk2428;
    int weather;
    int unk2430;
    u32 unk2434;
    int unk2438;
    int unk243C;
    int unk2440;
    u8 unk2442;
    u8 unk2445;
    u16 unk2446;
    u32 rand;
    u32 randTemp;
    u16 unk244C[4];
    u16 unk2454[4];
    u16 unk245C[4];
    int unk2464[4];
    u32 isRecordingPaused : 1;
    u32 unk2474_1 : 1;
    u32 unk2474_2 : 1;
    u32 unk2474_3 : 1;
    u32 unk2474_4 : 28;
    u32 unk2478;
    SysTask *unk247C;
    u8 chatotVoiceParam[4];
    u32 unk2488;
    u8 unk248C[4];
};

struct GetterWork {
    BattleSystem *bsys;
    BattleContext *ctx;
    u32 unk8;
    u32 unkC[2];
    u32 unk14;
    u32 unk18[3];
    int unk24;
    int state;
    int unk2C;
    int unk30[8];
    void *unk50[2];
}; // size: 0x58

typedef BOOL (*BtlCmdFunc)(BattleSystem *, BattleContext *);

typedef struct {
    u16 unk0;
    u16 unk2;
    u16 unk4;
    u16 unk6;
    u16 unk8[4];
    u16 unk10;
} UnkBtlCmdStruct_CPM;

// This is information used for selecting a target on the bottom screen in a
// double battle
typedef struct TargetPokemon {
    u8 selectedMon;
    u8 gender : 2;
    u8 hide : 1;
    u8 unused1_3 : 5;
    u8 status;
    u8 unused3;
    s16 hp;
    u16 hpMax;
} TargetPokemon;

// Information used for selecting an item on the bottom screen
typedef struct BattleItem {
    u16 id;
    u8 page;
    u8 monIndex;
} BattleItem;

#endif
