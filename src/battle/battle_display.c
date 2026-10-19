#include "battle/battle_display.h"

#include "constants/battle.h"
#include "constants/message_tags.h"
#include "constants/sndseq.h"

#include "battle/overlay_07.h"
#include "msgdata/msg/msg_0197.h"

typedef struct TrainerEncounterData {
    BattleSystem *battleSys;
    Pokepic *pokepic;
    UnkBattleSystemSub17C *terrain;
    ManagedSprite *managedSprite;
    u8 command;
    u8 battler;
    u8 state;
    u8 face;
    s16 targetX;
    u16 ballFlashStarted : 1;
    u16 padding_12_1 : 15;
    int battlerType;
    int delay;
    int enterFrameCount;
} TrainerEncounterData;

static void BattleDisplayTask_SetEncounter(SysTask *task, void *data);
static void BattleDisplayTask_SetGiratinaEncounter(SysTask *task, void *data);
static void BattleDisplayTask_ShowEncounter(SysTask *task, void *data);
static void ov12_0225BE38(SysTask *task, void *data);
static void BattleDisplayTask_ShowPokemon(SysTask *task, void *data);
static void ov12_0225C6C8(SysTask *task, void *data);
static void BattleDisplayTask_ReturnPokemon(SysTask *task, void *data);
static void ov12_0225CC58(SysTask *task, void *data);
static void BattleDisplayTask_OpenCaptureBall(SysTask *task, void *data);
static void BattleDisplayTask_SetTrainerEncounter(SysTask *task, void *data);
static void BattleDisplayTask_ThrowTrainerBall(SysTask *task, void *data);
static void ov12_0225D644(SysTask *task, void *data);
static void BattleDisplayTask_SlideTrainerOut(SysTask *task, void *data);
static void BattleDisplayTask_SlideTrainerIn(SysTask *task, void *data);
static void BattleDisplayTask_SlideHealthBoxIn(SysTask *task, void *data);
static void BattleDisplayTask_SlideHealthBoxOut(SysTask *task, void *data);
static void BattleDisplayTask_PlayerSetCommandSelection(SysTask *task, void *data);
static void BattleDisplayTask_TrainerSetCommandSelection(SysTask *task, void *data);
static void BattleDisplayTask_LinkSetCommandSelection(SysTask *task, void *data);
static void BattleDisplayTask_SafariPokemonSetCommandSelection(SysTask *task, void *data);
static void BattleDisplayTask_PalParkPokemonSetCommandSelection(SysTask *task, void *data);
static void BattleDisplayTask_RecordingSetCommandSelection(SysTask *task, void *data);
static void BattleDisplayTask_PlayerShowMoveSelectMenu(SysTask *task, void *data);
static void BattleDisplayTask_TrainerShowMoveSelectMenu(SysTask *task, void *data);
static void BattleDisplayTask_LinkShowMoveSelectMenu(SysTask *task, void *data);
static void BattleDisplayTask_RecordingShowMoveSelectMenu(SysTask *task, void *data);
static void BattleDisplayTask_PlayerShowTargetSelectMenu(SysTask *task, void *data);
static void BattleDisplayTask_TrainerShowTargetSelectMenu(SysTask *task, void *data);
static void BattleDisplayTask_LinkShowTargetSelectMenu(SysTask *task, void *data);
static void BattleDisplayTask_RecordingShowTargetSelectMenu(SysTask *task, void *data);
static void BattleDisplayTask_PlayerShowBagMenu(SysTask *task, void *data);
static void BattleDisplayTask_TrainerShowBagMenu(SysTask *task, void *data);
static void BattleDisplayTask_LinkShowBagMenu(SysTask *task, void *data);
static void BattleDisplayTask_RecordingShowBagMenu(SysTask *task, void *data);
static void BattleDisplayTask_PlayerShowPartyMenu(SysTask *task, void *data);
static void BattleDisplayTask_TrainerShowPartyMenu(SysTask *task, void *data);
static void BattleDisplayTask_LinkShowPartyMenu(SysTask *task, void *data);
static void BattleDisplayTask_RecordingShowPartyMenu(SysTask *task, void *data);
static void BattleDisplayTask_PlayerShowYesNoMenu(SysTask *task, void *data);
static void BattleDisplayTask_TrainerShowYesNoMenu(SysTask *task, void *data);
static void BattleDisplayTask_LinkShowYesNoMenu(SysTask *task, void *data);
static void BattleDisplayTask_RecordingShowYesNoMenu(SysTask *task, void *data);
static void BattleDisplayTask_SetMoveAnimation(SysTask *task, void *data);
static void BattleDisplayTask_FlickerBattler(SysTask *task, void *data);
static void BattleDisplayTask_UpdateHPGauge(SysTask *task, void *data);
static void BattleDisplayTask_UpdateExpGauge(SysTask *task, void *data);
static void BattleDisplayTask_PlayFaintingSequence(SysTask *task, void *data);
static void BattleDisplayTask_FadeOut(SysTask *task, void *data);
static void BattleDisplayTask_ToggleVanish(SysTask *task, void *data);
static void BattleDisplayTask_PlayLevelUpAnimation(SysTask *task, void *data);
static void BattleDisplayTask_WaitForBattleMessagePrint(SysTask *task, void *data);
static void BattleDisplayTask_WaitForAlertMessagePrint(SysTask *task, void *data);
static void ov12_02260668(SysTask *task, void *data);
static void BattleDisplayTask_ForgetMove(SysTask *task, void *data);
static void BattleDisplayTask_SetMosaic(SysTask *task, void *data);
static void BattleDisplayTask_ShowPartyGauge(SysTask *task, void *data);
static void BattleDisplayTask_HidePartyGauge(SysTask *task, void *data);
static void BattleDisplayTask_SpriteToOAM(SysTask *task, void *data);
static void BattleDisplayTask_OAMToSprite(SysTask *task, void *data);
static void ov12_02260D84(SysTask *sysTask, void *data);
static Pokepic *BattleDisplay_NewPokepic(BattleSystem *battleSys, PokepicManager *monSpriteMan, PokepicTemplate *spriteTemplate, int x, int y, int z, int yOffset, int height, int xOffset, int shadowSize, int battler, PokepicAnimScript *animScript, PokepicCallback callback);
static void ov12_02261390(BattleSystem *battleSys, OpponentData *opponentData, RecallMsgMessage *message, BattleMessage *battleMsg);
static void ov12_02261464(BattleSystem *battleSys, OpponentData *opponentData, SendOutMsgMessage *message, BattleMessage *battleMsg);
static void ov12_02261544(BattleSystem *battleSys, OpponentData *unused, BattleMessage *battleMsg);
static void ov12_022615F0(BattleSystem *battleSys, OpponentData *opponentData, LeadMonMsgMessage *message, BattleMessage *battleMsg);
static void ov12_02261928(BattleSystem *battleSys, OpponentData *opponentData, BattleMessage *battleMsg);
static void ov12_022619E4(BattleSystem *battleSys, OpponentData *opponentData, EscapeMsgMessage *message, BattleMessage *battleMsg);
static void ov12_02261AD4(BattleSystem *battleSys, OpponentData *opponentData, BattleMessage *battleMsg);
static ManagedSprite *BattleDisplay_NewManagedSpriteTrainer(BattleSystem *battleSys, int side, int trainerClass, int battlerType, u32 isLink, s16 x, s16 y);
static void BattleDisplay_PlayMoveAnimation(BattleSystem *battleSys, OpponentData *opponentData, BattleAnimSystem *battleAnimSystem, MoveAnimation *animation);
static void BattleDisplay_PopulateBattlerContext(BattleSystem *battleSys, MoveAnimation *animation, BattlerSpriteContext *battlerSpriteCtx, int battler);
static void BattleDisplay_GetAnimHideFlags(u8 *hideHealthboxes, u8 *hideShadows, int animMode, int secondaryAnimID, u16 move);
static BOOL ov12_02261DC8(TrainerEncounterData *trainerEncounterData, ManagedSprite *unused);
static void BattleDisplayTask_ScreenFlashForThrow(SysTask *task, void *data);
static void BattleDisplay_StopPlayback(BattleSystem *battleSys);
static void BattleDisplay_StopPlaybackAlt(BattleSystem *battleSys);
static u8 BattleDisplay_GetLinkTrainerClass(BattleSystem *battleSys, u8 battler, u8 trainerClass);
static void ov12_02261F38(BattleSystem *battleSystem, int battlerId, int battlerType, Pokepic *pokepic, NARC *narc, u32 species, u32 form, u32 face, u32 cryMod);

void BattleDisplay_InitTaskSetupUI(BattleSystem *battleSys, OpponentData *opponentData) {
    UISetupTaskData *uiSetupTaskData = (UISetupTaskData *)Heap_Alloc(HEAP_ID_BATTLE, sizeof(UISetupTaskData));
    uiSetupTaskData->battleSys = battleSys;
    uiSetupTaskData->step = 0;
    uiSetupTaskData->frameCount = 0;
    uiSetupTaskData->fadeStep = 0;

    SysTask_CreateOnMainQueue(ov12_02260668, uiSetupTaskData, 0);
}

typedef struct MonEncounterData {
    BattleSystem *battleSys;
    OpponentData *opponentData;
    Pokepic *sprite;
    UnkBattleSystemSub17C *terrain;
    u8 command;
    u8 battler;
    u8 state;
    u8 face;
    s16 targetPos;
    u16 species;
    int cryMod;
    int battlerType;
    int delay;
    int nature;
    BOOL isShiny;
    u8 formNum;
    u8 padding_2D[3];
} MonEncounterData;

extern const s16 ov07_022377F4[][3];
extern const s16 gBattlerEncounterX[][2];

void BattleDisplay_InitTaskSetEncounter(BattleSystem *battleSys, OpponentData *opponentData, MonEncounterMessage *message) {
    BOOL isShiny;
    PokepicTemplate spriteTemplate;
    PokepicManager *spriteMan = BattleSystem_GetPokepicManager(battleSys);
    PokepicAnimScript animScript[10];
    MonEncounterData *monEncounterData;
    int battleType = BattleSystem_GetBattleType(battleSys);
    u8 yOffset;
    s8 height;
    s8 shadowXOffset;
    u8 shadowSize;

    monEncounterData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(MonEncounterData));

    monEncounterData->state = 0;

    if (opponentData->battlerType & BATTLER_TYPE_SOLO_ENEMY) {
        monEncounterData->face = 2;
        monEncounterData->terrain = ov12_0223A8F4(battleSys, 1);
        ManagedSprite_SetPositionXY(monEncounterData->terrain->managedSprite, ov07_022377F4[opponentData->battlerType & 1][0], 8 * 11);
    } else {
        monEncounterData->face = 0;
        monEncounterData->terrain = ov12_0223A8F4(battleSys, 0);
        ManagedSprite_SetPositionXY(monEncounterData->terrain->managedSprite, ov07_022377F4[opponentData->battlerType & 1][0], 128 + 8);
    }

    isShiny = !!message->isShiny;

    GetMonSpriteCharAndPlttNarcIdsEx(&spriteTemplate, message->species, message->gender, monEncounterData->face, isShiny, message->formNum, message->personality);

    yOffset = GetMonPicHeightBySpeciesGenderForm(message->species, message->gender, monEncounterData->face, message->formNum, message->personality);

    sub_020729D8(opponentData->narc, &height, message->species);
    sub_020729FC(opponentData->narc, &shadowXOffset, message->species);
    sub_02072A20(opponentData->narc, &shadowSize, message->species);
    NARC_ReadPokepicAnimScript(opponentData->narc, &animScript[0], message->species, opponentData->battlerType);

    monEncounterData->sprite = opponentData->pokepic = BattleDisplay_NewPokepic(battleSys,
        spriteMan,
        &spriteTemplate,
        ov07_022377F4[opponentData->battlerType][0],
        ov07_022377F4[opponentData->battlerType][1],
        ov07_022377F4[opponentData->battlerType][2],
        yOffset,
        height,
        shadowXOffset,
        shadowSize,
        opponentData->battlerId,
        &animScript[0],
        NULL);

    if (monEncounterData->face == 2) {
        Pokepic_StartPaletteFade(monEncounterData->sprite, 8, 8, 0, RGB_BLACK);
    }

    if (monEncounterData->face == 2 && (BattleSystem_GetBattleSpecial(battleSys) & 0x40)) {
        int v10 = ((24 * 8) + 80) / 2;
        int spriteYCenter = Pokepic_GetAttr(monEncounterData->sprite, 1);

        Pokepic_SetAttr(monEncounterData->sprite, POKEPIC_SHADOW_SIZE, 0);
        Pokepic_SetAttr(monEncounterData->sprite, POKEPIC_X, 256 - 64);
        Pokepic_SetAttr(monEncounterData->sprite, POKEPIC_Y, spriteYCenter - v10);

        monEncounterData->targetPos = spriteYCenter;
    } else {
        monEncounterData->targetPos = gBattlerEncounterX[opponentData->battlerType][0];
    }

    monEncounterData->battleSys = battleSys;
    monEncounterData->opponentData = opponentData;
    monEncounterData->command = message->command;
    monEncounterData->battler = opponentData->battlerId;
    monEncounterData->species = message->species;
    monEncounterData->formNum = message->formNum;
    monEncounterData->cryMod = message->cryModulation;
    monEncounterData->battlerType = opponentData->battlerType;
    monEncounterData->nature = GetNatureFromPersonality(message->personality);
    monEncounterData->isShiny = message->isShiny;

    if (monEncounterData->face == 2 && (BattleSystem_GetBattleSpecial(battleSys) & BATTLE_SPECIAL_GIRATINA)) {
        SysTask_CreateOnMainQueue(BattleDisplayTask_SetGiratinaEncounter, monEncounterData, 0);
    } else {
        SysTask_CreateOnMainQueue(BattleDisplayTask_SetEncounter, monEncounterData, 0);
    }

    sub_02005B58(TRUE);
}

typedef struct MonShowData {
    BattleSystem *battleSys;
    OpponentData *opponentData;
    void *ballCapsuleSealEffect;
    void *ballRotation;
    void *btlMonObjData;
    PokepicTemplate spriteTemplate;
    void *battleAnimSys;
    MoveAnimation moveAnim;
    u8 command;
    u8 battler;
    u8 battlerType;
    u8 state;
    u8 face;
    u8 yOffset;
    u16 species;
    int cryMod;
    u8 selectedPartySlot;
    u8 nature;
    u16 capturedBall;
    s8 height;
    s8 shadowXOffset;
    u8 isShiny;
    u8 shadowSize;
    u16 isQuickSendOut;
    u8 delay;
    u8 formNum;
    int isSubstitute;
} MonShowData;

void BattleDisplay_InitTaskShowEncounter(BattleSystem *battleSys, OpponentData *opponentData, MonShowMessage *message) {
    BOOL isShiny;
    MonShowData *monShowData;
    int battleType = BattleSystem_GetBattleType(battleSys);
    monShowData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(MonShowData));

    if (opponentData->battlerType & BATTLER_TYPE_SOLO_ENEMY) {
        monShowData->face = 2;
    } else {
        monShowData->face = 0;
    }

    isShiny = !!message->isShiny;

    GetMonSpriteCharAndPlttNarcIdsEx(&monShowData->spriteTemplate, message->species, message->gender, monShowData->face, isShiny, message->formNum, message->personality);

    monShowData->yOffset = GetMonPicHeightBySpeciesGenderForm(message->species, message->gender, monShowData->face, message->formNum, message->personality);

    sub_020729D8(opponentData->narc, &monShowData->height, message->species);
    sub_020729FC(opponentData->narc, &monShowData->shadowXOffset, message->species);
    sub_02072A20(opponentData->narc, &monShowData->shadowSize, message->species);
    OpponentData_ClearBattleCursorPosition(opponentData);

    monShowData->battleSys = battleSys;
    monShowData->opponentData = opponentData;
    monShowData->state = 0;
    monShowData->delay = 0;
    monShowData->command = message->command;
    monShowData->battler = opponentData->battlerId;
    monShowData->species = message->species;
    monShowData->formNum = message->formNum;
    monShowData->battlerType = opponentData->battlerType;
    monShowData->cryMod = message->cryModulation;
    monShowData->selectedPartySlot = message->selectedPartySlot;
    monShowData->nature = GetNatureFromPersonality(message->personality);
    monShowData->capturedBall = message->capturedBall;
    monShowData->isShiny = message->isShiny;
    monShowData->isQuickSendOut = 0;

    sub_02005B58(TRUE);

    battleType = BattleSystem_GetBattleType(battleSys);

    if (ov12_0223C140(battleSys, opponentData->battlerId) != 255) {
        if ((battleType & BATTLE_TYPE_DOUBLES) && !(battleType & BATTLE_TYPE_MULTI) && opponentData->battlerType > BATTLER_TYPE_ENEMY_SIDE_SLOT_1) {
            SysTask_CreateOnMainQueue(BattleDisplayTask_ShowEncounter, monShowData, 0);
        } else {
            SysTask_CreateOnMainQueue(ov12_0225BE38, monShowData, 0);
        }
    } else {
        SysTask_CreateOnMainQueue(BattleDisplayTask_ShowEncounter, monShowData, 0);
    }
}

void BattleDisplay_InitTaskShowPokemon(BattleSystem *battleSys, OpponentData *opponentData, MonShowMessage *message) {
    BOOL isShiny;
    MonShowData *monShowData;
    int battleType = BattleSystem_GetBattleType(battleSys);
    monShowData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(MonShowData));
    monShowData->state = 0;

    if (opponentData->battlerType & BATTLER_TYPE_SOLO_ENEMY) {
        monShowData->face = 2;
    } else {
        monShowData->face = 0;
    }

    isShiny = !!message->isShiny;

    GetMonSpriteCharAndPlttNarcIdsEx(&monShowData->spriteTemplate, message->species, message->gender, monShowData->face, isShiny, message->formNum, message->personality);

    monShowData->yOffset = GetMonPicHeightBySpeciesGenderForm(message->species, message->gender, monShowData->face, message->formNum, message->personality);

    sub_020729D8(opponentData->narc, &monShowData->height, message->species);
    sub_020729FC(opponentData->narc, &monShowData->shadowXOffset, message->species);
    sub_02072A20(opponentData->narc, &monShowData->shadowSize, message->species);
    OpponentData_ClearBattleCursorPosition(opponentData);

    monShowData->battleSys = battleSys;
    monShowData->opponentData = opponentData;
    monShowData->command = message->command;
    monShowData->battler = opponentData->battlerId;
    monShowData->species = message->species;
    monShowData->formNum = message->formNum;
    monShowData->battlerType = opponentData->battlerType;
    monShowData->cryMod = message->cryModulation;
    monShowData->selectedPartySlot = message->selectedPartySlot;
    monShowData->nature = GetNatureFromPersonality(message->personality);
    monShowData->capturedBall = message->capturedBall;
    monShowData->isShiny = message->isShiny;
    monShowData->isQuickSendOut = message->isQuickSendOut;
    monShowData->delay = 0;
    monShowData->isSubstitute = message->isSubstitute;

    for (int i = 0; i < MAX_MON_MOVES; i++) {
        monShowData->moveAnim.species[i] = message->battleMonSpecies[i];
        monShowData->moveAnim.genders[i] = message->battleMonGenders[i];
        monShowData->moveAnim.isShiny[i] = message->battleMonIsShiny[i];
        monShowData->moveAnim.formNums[i] = message->battleMonFormNums[i];
        monShowData->moveAnim.personalities[i] = message->battleMonPersonalities[i];
    }

    u32 unk = ov12_0223C140(battleSys, opponentData->battlerId);

    if (unk == 255 || unk != monShowData->selectedPartySlot) {
        SysTask_CreateOnMainQueue(BattleDisplayTask_ShowPokemon, monShowData, 0);
    } else {
        SysTask_CreateOnMainQueue(ov12_0225C6C8, monShowData, 0);
    }
}

typedef struct MonReturnData {
    BattleSystem *battleSys;
    OpponentData *opponentData;
    Pokepic *pokepic;
    void *ballRotation;
    MoveAnimation moveAnim;
    u8 command;
    u8 battler;
    u8 battlerType;
    u8 state;
    u8 yOffset;
    u8 unused;
    u16 capturedBall;
    int isSubstitute;
    u32 unk_74;
} MonReturnData;

void BattleDisplay_InitTaskReturnPokemon(BattleSystem *battleSys, OpponentData *opponentData, MonReturnMessage *message) {
    MonReturnData *monReturnData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(MonReturnData));
    monReturnData->battleSys = battleSys;
    monReturnData->opponentData = opponentData;
    monReturnData->pokepic = opponentData->pokepic;
    monReturnData->command = message->command;
    monReturnData->battler = opponentData->battlerId;
    monReturnData->battlerType = opponentData->battlerType;
    monReturnData->state = 0;
    monReturnData->yOffset = message->yOffset;
    monReturnData->capturedBall = message->capturedBall;
    monReturnData->isSubstitute = message->isSubstitute;
    monReturnData->unk_74 = message->unk2C;

    for (int i = 0; i < MAX_MON_MOVES; i++) {
        monReturnData->moveAnim.species[i] = message->battleMonSpecies[i];
        monReturnData->moveAnim.genders[i] = message->battleMonGenders[i];
        monReturnData->moveAnim.isShiny[i] = message->battleMonIsShiny[i];
        monReturnData->moveAnim.formNums[i] = message->battleMonFormNums[i];
        monReturnData->moveAnim.personalities[i] = message->battleMonPersonalities[i];
    }

    u32 unk = ov12_0223C140(battleSys, opponentData->battlerId);

    if (unk == 255 || unk != monReturnData->unk_74) {
        SysTask_CreateOnMainQueue(BattleDisplayTask_ReturnPokemon, monReturnData, 0);
    } else {
        SysTask_CreateOnMainQueue(ov12_0225CC58, monReturnData, 0);
    }
}

typedef struct OpenCaptureBallData {
    BattleSystem *battleSys;
    Pokepic *pokepic;
    u8 command;
    u8 battler;
    u8 battlerType;
    u8 state;
    u8 yOffset;
    u8 unused_0D;
    u16 unused_0E;
} OpenCaptureBallData;

extern u16 ov12_0226D15A[];

void BattleDisplay_InitTaskOpenCaptureBall(BattleSystem *battleSys, OpponentData *opponentData, OpenCaptureBallMessage *message) {
    OpenCaptureBallData *captureOpenBallData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(OpenCaptureBallData));

    captureOpenBallData->battleSys = battleSys;
    captureOpenBallData->pokepic = opponentData->pokepic;
    captureOpenBallData->command = message->command;
    captureOpenBallData->battler = opponentData->battlerId;
    captureOpenBallData->battlerType = opponentData->battlerType;
    captureOpenBallData->state = 0;
    captureOpenBallData->yOffset = message->yOffset;

    Pokepic_StartPaletteFade(captureOpenBallData->pokepic, 0, 16, 0, ov12_0226D15A[message->ball]);
    Pokepic_SetAttr(captureOpenBallData->pokepic, POKEPIC_SHADOW_AFFINE, TRUE);
    SysTask_CreateOnMainQueue(BattleDisplayTask_OpenCaptureBall, captureOpenBallData, 0);
}

void BattleDisplay_InitTaskSetTrainerEncounter(BattleSystem *battleSys, OpponentData *opponentData, TrainerEncounterMessage *message) {
    TrainerEncounterData *trainerEncounterData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(TrainerEncounterData));
    int side;

    trainerEncounterData->state = 0;

    if (opponentData->battlerType & BATTLER_TYPE_SOLO_ENEMY) {
        trainerEncounterData->face = 2;
        trainerEncounterData->terrain = ov12_0223A8F4(battleSys, 1);
        ManagedSprite_SetPositionXY(trainerEncounterData->terrain->managedSprite, ov07_022377F4[opponentData->battlerType & 1][0], 8 * 11);
    } else {
        trainerEncounterData->face = 0;
        trainerEncounterData->terrain = ov12_0223A8F4(battleSys, 0);
        ManagedSprite_SetPositionXY(trainerEncounterData->terrain->managedSprite, ov07_022377F4[opponentData->battlerType & 1][0], 128 + 8);
    }

    if ((BattleSystem_GetBattleType(battleSys) & BATTLE_TYPE_MULTI)
        || (BattleSystem_GetBattleType(battleSys) & BATTLE_TYPE_TAG && opponentData->battlerType & BATTLE_TYPE_TRAINER)) {
        side = opponentData->battlerType;
    } else {
        side = opponentData->battlerType & BATTLER_TYPE_SOLO_ENEMY;
    }

    message->trainerType = BattleDisplay_GetLinkTrainerClass(battleSys, opponentData->battlerId, message->trainerType);

    u32 battleType = BattleSystem_GetBattleType(battleSys);
    u32 flag = 0;

    if (ov12_0223C140(battleSys, opponentData->battlerId) != 255) {
        if (battleType & BATTLE_TYPE_DOUBLES && !(battleType & BATTLE_TYPE_MULTI)) {
            flag = 0;
        } else {
            flag = 1;
        }
    }

    trainerEncounterData->managedSprite = opponentData->managedSprite = BattleDisplay_NewManagedSpriteTrainer(battleSys,
        side,
        message->trainerType,
        opponentData->battlerType,
        flag,
        ov07_022377F4[side][0],
        ov07_022377F4[side][1]);

    if (trainerEncounterData->face == 0
        && (BattleSystem_GetBattleType(battleSys) == BATTLE_TYPE_NONE
            || BattleSystem_GetBattleType(battleSys) == BATTLE_TYPE_SAFARI
            || BattleSystem_GetBattleType(battleSys) == BATTLE_TYPE_ROAMER
            || BattleSystem_GetBattleType(battleSys) == BATTLE_TYPE_PAL_PARK
            || BattleSystem_GetBattleType(battleSys) == BATTLE_TYPE_TUTORIAL
            || BattleSystem_GetBattleType(battleSys) == BATTLE_TYPE_BUG_CONTEST)) {
        PokepicManager *pokepicManager = BattleSystem_GetPokepicManager(battleSys);
        PokepicTemplate pokepicTemplate;
        UnkStruct_02070D3C unkStruct;
        sub_02070D84(message->trainerType, trainerEncounterData->face, &unkStruct);
        pokepicTemplate.narcID = unkStruct.narcId;
        pokepicTemplate.charDataID = unkStruct.ncbr_id;
        pokepicTemplate.palDataID = unkStruct.nclr_id;
        pokepicTemplate.species = SPECIES_NONE;
        pokepicTemplate.isAnimated = FALSE;
        pokepicTemplate.personality = 0;
        trainerEncounterData->pokepic = PokepicManager_CreatePokepic(pokepicManager, &pokepicTemplate, ov07_022377F4[side][0], ov07_022377F4[side][1], ov07_022377F4[side][2], opponentData->battlerId, 0, 0);

    } else {
        trainerEncounterData->pokepic = NULL;
    }
    trainerEncounterData->targetX = gBattlerEncounterX[side][0];
    trainerEncounterData->battleSys = battleSys;
    trainerEncounterData->command = message->command;
    trainerEncounterData->battler = opponentData->battlerId;
    trainerEncounterData->battlerType = opponentData->battlerType;
    trainerEncounterData->enterFrameCount = 0;

    if (trainerEncounterData->battlerType == BATTLER_TYPE_SOLO_PLAYER
        || trainerEncounterData->battlerType == BATTLER_TYPE_PLAYER_SIDE_SLOT_1) {
        BgSetPosTextAndCommit(BattleSystem_GetBgConfig(battleSys), GF_BG_LYR_MAIN_3, BG_POS_OP_SUB_X, 4 * 33);
    }

    SysTask_CreateOnMainQueue(BattleDisplayTask_SetTrainerEncounter, trainerEncounterData, 0);
}

typedef struct TrainerThrowBallData {
    BattleSystem *battleSys;
    OpponentData *opponentData;
    u8 command;
    u8 battler;
    u8 state;
    u8 face;
    int backSpriteIdx;
    int ballTypeIn;
    int delay;
    int ballTargetState;
} TrainerThrowBallData;

void BattleDisplay_InitTaskThrowTrainerBall(BattleSystem *battleSys, OpponentData *opponentData, TrainerThrowBallMessage *message) {
    TrainerThrowBallData *trainerThrowBallData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(TrainerThrowBallData));

    trainerThrowBallData->state = 0;
    trainerThrowBallData->battleSys = battleSys;
    trainerThrowBallData->command = message->command;
    trainerThrowBallData->ballTypeIn = message->ballTypeIn;
    trainerThrowBallData->battler = opponentData->battlerId;
    trainerThrowBallData->opponentData = opponentData;

    if (opponentData->battlerType & BATTLER_TYPE_SOLO_ENEMY) {
        trainerThrowBallData->face = 2;
        trainerThrowBallData->backSpriteIdx = 0;
    } else {
        Trainer *trainer = BattleSystem_GetTrainer(battleSys, opponentData->battlerId);
        trainerThrowBallData->face = 0;
        trainerThrowBallData->backSpriteIdx = TrainerClassToBackpicID(BattleDisplay_GetLinkTrainerClass(battleSys, opponentData->battlerId, trainer->data.trainerClass), 0);
    }

    u32 battleType = BattleSystem_GetBattleType(battleSys);

    if (ov12_0223C140(battleSys, opponentData->battlerId) != 255) {
        SysTask_CreateOnMainQueue(ov12_0225D644, trainerThrowBallData, 0);
    } else {
        SysTask_CreateOnMainQueue(BattleDisplayTask_ThrowTrainerBall, trainerThrowBallData, 0);
    }
}

typedef struct SlideTrainerOutData {
    BattleSystem *battleSys;
    OpponentData *opponentData;
    u8 command;
    u8 battler;
    u8 state;
    u8 face;
    int unused;
} SlideTrainerOutData;

void BattleDisplay_InitTaskSlideTrainerOut(BattleSystem *battleSys, OpponentData *opponentData) {
    SlideTrainerOutData *slideTrainerOutData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(SlideTrainerOutData));

    slideTrainerOutData->state = 0;
    slideTrainerOutData->battleSys = battleSys;
    slideTrainerOutData->command = opponentData->unk94[0];
    slideTrainerOutData->battler = opponentData->battlerId;
    slideTrainerOutData->opponentData = opponentData;

    if (opponentData->battlerType & BATTLER_TYPE_SOLO_ENEMY) {
        slideTrainerOutData->face = 2;
    } else {
        slideTrainerOutData->face = 0;
    }

    SysTask_CreateOnMainQueue(BattleDisplayTask_SlideTrainerOut, slideTrainerOutData, 0);
}

typedef struct SlideTrainerInData {
    BattleSystem *battleSys;
    ManagedSprite *managedSprite;
    u8 command;
    u8 battler;
    u8 state;
    u8 face;
    s16 x;
    u16 unused;
} SlideTrainerInData;

extern const s16 gSlideTrainerInCoords[][3];

void BattleDisplay_InitTaskSlideTrainerIn(BattleSystem *battleSys, OpponentData *opponentData, TrainerSlideInMessage *message) {
    PokepicManager *unused = BattleSystem_GetPokepicManager(battleSys);
    SlideTrainerInData *slideTrainerInData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(SlideTrainerInData));
    slideTrainerInData->state = 0;

    if (opponentData->battlerType & BATTLER_TYPE_SOLO_ENEMY) {
        slideTrainerInData->face = 2;
    } else {
        slideTrainerInData->face = 0;
    }

    slideTrainerInData->managedSprite = opponentData->managedSprite = BattleDisplay_NewManagedSpriteTrainer(battleSys,
        opponentData->battlerType & BATTLER_TYPE_SOLO_ENEMY,
        message->trainerType,
        opponentData->battlerType,
        0,
        gSlideTrainerInCoords[opponentData->battlerType & 1][0],
        gSlideTrainerInCoords[opponentData->battlerType & 1][1]);
    slideTrainerInData->x = gBattlerEncounterX[opponentData->battlerType & 1][message->posIn];
    slideTrainerInData->battleSys = battleSys;
    slideTrainerInData->command = message->command;
    slideTrainerInData->battler = opponentData->battlerId;

    SysTask_CreateOnMainQueue(BattleDisplayTask_SlideTrainerIn, slideTrainerInData, 0);
}

void BattleDisplay_InitTaskSlideHealthBoxIn(BattleSystem *battleSys, OpponentData *opponentData, HealthBoxData *healthboxData) {
    BattleHpBar *hpBar = &opponentData->hpBar;
    MI_CpuClearFast(&hpBar->script, sizeof(u8));

    hpBar->battleSystem = battleSys;
    hpBar->battlerId = opponentData->battlerId;
    hpBar->type = BattleHpBar_Util_GetBarTypeFromBattlerSide(opponentData->battlerType, BattleSystem_GetBattleType(battleSys));
    hpBar->unk4C = healthboxData->command;
    hpBar->hp = healthboxData->curHP;
    hpBar->maxHp = healthboxData->maxHP;
    hpBar->level = healthboxData->level;
    hpBar->unk49 = healthboxData->gender;
    hpBar->gainedHp = 0;
    hpBar->exp = healthboxData->expFromLastLevel;
    hpBar->maxExp = healthboxData->expToNextLevel;
    hpBar->monId = healthboxData->selectedPartySlot;
    hpBar->unk_4A = healthboxData->status;
    hpBar->unk4B = healthboxData->speciesCaught;
    hpBar->unk4D = healthboxData->delay;
    hpBar->unk27 = healthboxData->numSafariBalls;

    BattleHpBar_SetEnabled(hpBar, FALSE);
    ov12_0226498C(hpBar, hpBar->hp, -1);

    hpBar->unk10 = SysTask_CreateOnMainQueue(BattleDisplayTask_SlideHealthBoxIn, hpBar, 1000);
}

void BattleDisplay_InitTaskSlideHealthBoxOut(BattleSystem *battleSys, OpponentData *opponentData) {
    BattleHpBar *hpBar = &opponentData->hpBar;
    MI_CpuClearFast(&hpBar->script, sizeof(u8));

    hpBar->battleSystem = battleSys;
    hpBar->battlerId = opponentData->battlerId;
    hpBar->unk4C = opponentData->unk94[0];

    ov12_02264FB0(hpBar, 1);

    hpBar->unk10 = SysTask_CreateOnMainQueue(BattleDisplayTask_SlideHealthBoxOut, hpBar, 1000);
}

typedef struct CommandSetData {
    BattleSystem *battleSys;
    void *hpBar;
    u8 command;
    u8 battler;
    u8 state;
    s8 unused_0B;
    int input;
    u8 ballStatus[2][6];
    u8 expPercents[6];
    u8 unused_22;
    u8 partySlot;
    u16 moves[4];
    u8 curPP[4];
    u8 maxPP[4];
    u8 battlerType;
    u8 msgIdx;
    s16 curHP;
    u16 maxHP;
    u8 ballStatusBattler;
    u8 switchingOrCanPickCommandMask;
} CommandSetData;

void BattleDisplay_InitTaskSetCommandSelection(BattleSystem *battleSys, OpponentData *opponentData, CommandSetMessage *message) {
    CommandSetData *commandSetData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(CommandSetData));
    int i;
    MI_CpuClearFast(commandSetData, sizeof(CommandSetData));

    commandSetData->state = 0;
    commandSetData->unused_0B = 0;
    commandSetData->battleSys = battleSys;
    commandSetData->command = message->command;
    commandSetData->battler = opponentData->battlerId;
    commandSetData->battlerType = opponentData->battlerType;
    commandSetData->hpBar = &opponentData->hpBar;
    commandSetData->partySlot = message->partySlot;
    commandSetData->curHP = message->curHP;
    commandSetData->maxHP = message->maxHP;
    commandSetData->ballStatusBattler = message->ballStatusBattler;
    commandSetData->switchingOrCanPickCommandMask = message->switchingOrCanPickCommandMask;

    for (i = 0; i < 2; i++) {
        for (int j = 0; j < PARTY_SIZE; j++) {
            commandSetData->ballStatus[i][j] = message->ballStatus[i][j];
        }
    }

    for (i = 0; i < PARTY_SIZE; i++) {
        if (message->ballStatus[0][i] == 2) {
            commandSetData->expPercents[i] = 0;
        } else {
            commandSetData->expPercents[i] = message->expPercents[i];
        }
    }

    for (int battler = 0; battler < MAX_MON_MOVES; battler++) {
        commandSetData->moves[battler] = message->moves[battler];
        commandSetData->curPP[battler] = message->curPP[battler];
        commandSetData->maxPP[battler] = message->maxPP[battler];
    }

    SysTask_CreateOnMainQueue(opponentData->unk0[0], commandSetData, 0);
}

typedef struct MoveSelectMenuData {
    BattleSystem *battleSys;
    void *hpBar;
    int input;
    u16 moves[4];
    u8 ppCur[4];
    u8 ppMax[4];
    u8 command;
    u8 battler;
    u8 battlerType;
    u8 partySlot;
    u8 state;
    u8 unused;
    u16 invalidMoves;
} MoveSelectMenuData;

void BattleDisplay_InitTaskShowMoveSelectMenu(BattleSystem *battleSys, OpponentData *opponentData, MoveSelectMenuMessage *message) {
    MoveSelectMenuData *moveSelectMenuData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(MoveSelectMenuData));

    moveSelectMenuData->state = 0;
    moveSelectMenuData->battleSys = battleSys;
    moveSelectMenuData->command = opponentData->unk94[0];
    moveSelectMenuData->battler = opponentData->battlerId;
    moveSelectMenuData->battlerType = opponentData->battlerType;
    moveSelectMenuData->hpBar = &opponentData->hpBar;
    moveSelectMenuData->partySlot = message->partySlot;

    for (int i = 0; i < MAX_MON_MOVES; i++) {
        moveSelectMenuData->moves[i] = message->moves[i];
        moveSelectMenuData->ppCur[i] = message->ppCur[i];
        moveSelectMenuData->ppMax[i] = message->ppMax[i];
    }

    moveSelectMenuData->invalidMoves = message->invalidMoves;

    SysTask_CreateOnMainQueue(opponentData->unk0[1], moveSelectMenuData, 0);
}

typedef struct TargetSelectMenuData {
    BattleSystem *battleSys;
    void *hpBar;
    int input;
    u8 command;
    u8 battler;
    u8 battlerType;
    u8 state;
    TargetPokemon targetMon[4];
    u16 range;
    u8 shouldHidePanel;
    u8 unused;
} TargetSelectMenuData;

void BattleDisplay_InitTaskShowTargetSelectMenu(BattleSystem *battleSys, OpponentData *opponentData, TargetSelectMenuMessage *message) {
    TargetSelectMenuData *targetSelectMenuData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(TargetSelectMenuData));
    int maxBattlers;
    u32 battleType;
    u8 battlerTypes[6];

    targetSelectMenuData->state = 0;
    targetSelectMenuData->battleSys = battleSys;
    targetSelectMenuData->command = opponentData->unk94[0];
    targetSelectMenuData->battler = opponentData->battlerId;
    targetSelectMenuData->battlerType = opponentData->battlerType;
    targetSelectMenuData->range = message->range;
    targetSelectMenuData->hpBar = &opponentData->hpBar;
    targetSelectMenuData->shouldHidePanel = message->shouldHidePanel;

    ov12_0223C1C4(battleSys, &battlerTypes[0]);

    maxBattlers = BattleSystem_GetMaxBattlers(battleSys);
    battleType = BattleSystem_GetBattleType(battleSys);

    for (int i = 0; i < maxBattlers; i++) {
        targetSelectMenuData->targetMon[i] = message->targetMon[i];
    }

    SysTask_CreateOnMainQueue(opponentData->unk0[2], targetSelectMenuData, 0);
}

typedef struct PartyMenuData {
    BattleSystem *battleSys;
    BattlePartyContext *battlePartyCtx;
    u8 command;
    u8 battler;
    u8 state;
    u8 listMode;
    u8 partySlots[4];
    int canSwitch;
    u16 selectedBattleBagItem;
    u8 doublesSelection;
    u8 isCursorEnabled;
    u8 battlersSwitchingMask;
    u8 unused[3];
    u8 partyOrder[4][6];
} PartyMenuData;

typedef struct BagMenuData {
    BattleSystem *battleSys;
    BattleBagContext *battleBagCtx;
    PartyMenuData *partyMenuData;
    u8 command;
    u8 battler;
    u8 state;
    u8 battlerType;
    u8 isCursorEnabled;
    u8 msgIdx;
    u16 stateAfterDelay;
    u8 hasTwoOpponents;
    u8 semiInvulnerable;
    u8 substitute;
    u8 delay;
    u8 partyOrder[4][6];
    u8 embargoTurns[4];
} BagMenuData;

void BattleDisplay_InitTaskShowBagMenu(BattleSystem *battleSys, OpponentData *opponentData, BagMenuMessage *message) {
    BagMenuData *bagMenuData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(BagMenuData));

    bagMenuData->partyMenuData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(PartyMenuData));
    bagMenuData->partyMenuData->battlePartyCtx = Heap_Alloc(HEAP_ID_BATTLE, sizeof(BattlePartyContext));
    bagMenuData->partyMenuData->battlePartyCtx->party = SaveArray_Party_Alloc(HEAP_ID_BATTLE);
    bagMenuData->state = 0;
    bagMenuData->battleSys = battleSys;
    bagMenuData->command = message->command;
    bagMenuData->battler = opponentData->battlerId;
    bagMenuData->battlerType = opponentData->battlerType;
    bagMenuData->hasTwoOpponents = message->hasTwoOpponents;
    bagMenuData->semiInvulnerable = message->semiInvulnerable;
    bagMenuData->substitute = message->substitute;

    for (int i = 0; i < BATTLER_MAX; i++) {
        bagMenuData->partyMenuData->partySlots[i] = message->partySlots[i];

        for (int j = 0; j < PARTY_SIZE; j++) {
            bagMenuData->partyOrder[i][j] = message->partyOrder[i][j];
        }

        bagMenuData->embargoTurns[i] = message->embargoTurns[i];
    }

    SysTask_CreateOnMainQueue(opponentData->unk0[3], bagMenuData, 0);
}

void BattleDisplay_InitTaskShowPartyMenu(BattleSystem *battleSys, OpponentData *opponentData, PartyMenuMessage *message) {
    PartyMenuData *partyMenuData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(PartyMenuData));

    partyMenuData->state = 0;
    partyMenuData->battleSys = battleSys;
    partyMenuData->command = message->command;
    partyMenuData->battler = message->battler;
    partyMenuData->listMode = message->listMode;
    partyMenuData->canSwitch = message->canSwitch;
    partyMenuData->doublesSelection = message->doublesSelection;
    partyMenuData->selectedBattleBagItem = 0;
    partyMenuData->battlersSwitchingMask = message->battlersSwitchingMask;

    for (int i = 0; i < BATTLER_MAX; i++) {
        partyMenuData->partySlots[i] = message->selectedPartySlot[i];

        for (int j = 0; j < PARTY_SIZE; j++) {
            partyMenuData->partyOrder[i][j] = message->partyOrder[i][j];
        }
    }

    SysTask_CreateOnMainQueue(opponentData->unk0[4], partyMenuData, 0);
}

typedef struct YesNoMenuData {
    BattleSystem *battleSys;
    void *hpBar;
    int input;
    u8 command;
    u8 battler;
    u8 state;
    u8 yesNoType;
    int promptMsg;
    int nickname;
    u16 move;
    u16 msgIdx;
} YesNoMenuData;

void BattleDisplay_InitTaskShowYesNoMenu(BattleSystem *battleSys, OpponentData *opponentData, YesNoMenuMessage *message) {
    YesNoMenuData *yesNoMenuData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(YesNoMenuData));

    yesNoMenuData->state = 0;
    yesNoMenuData->battleSys = battleSys;
    yesNoMenuData->command = message->command;
    yesNoMenuData->battler = opponentData->battlerId;
    yesNoMenuData->hpBar = &opponentData->hpBar;
    yesNoMenuData->promptMsg = message->promptMsg;
    yesNoMenuData->yesNoType = message->yesNoType;
    yesNoMenuData->move = message->move;
    yesNoMenuData->nickname = message->nickname;

    SysTask_CreateOnMainQueue(opponentData->unk0[5], yesNoMenuData, 0);
}

typedef struct BattleMessageWaitTask {
    BattleSystem *battleSys;
    u8 command;
    u8 battler;
    u8 msgIdx;
} BattleMessageWaitTask;

void BattleDisplay_PrintAttackMessage(BattleSystem *battleSys, OpponentData *opponentData, AttackMsgMessage *message) {
    BattleMessageWaitTask *waitTask;
    MsgData *msgLoader = ov12_0223A934(battleSys);
    BattleMessage battleMsg;

    waitTask = (BattleMessageWaitTask *)Heap_Alloc(HEAP_ID_BATTLE, sizeof(BattleMessageWaitTask));

    waitTask->battleSys = battleSys;
    waitTask->command = message->command;
    waitTask->battler = opponentData->battlerId;

    battleMsg.id = message->move * 3;
    battleMsg.tag = TAG_NICKNAME;
    battleMsg.param[0] = opponentData->battlerId | (message->partySlot << 8);

    waitTask->msgIdx = BattleSystem_PrintBattleMessage(battleSys, msgLoader, &battleMsg, BattleSystem_GetTextFrameDelay(battleSys));

    SysTask_CreateOnMainQueue(BattleDisplayTask_WaitForBattleMessagePrint, waitTask, 0);
}

void BattleDisplay_PrintMessage(BattleSystem *battleSys, OpponentData *opponentData, BattleMessage *battleMsg) {
    MsgData *msgLoader = BattleSystem_GetMessageLoader(battleSys);
    BattleMessageWaitTask *waitTask = Heap_Alloc(HEAP_ID_BATTLE, sizeof(BattleMessageWaitTask));

    waitTask->battleSys = battleSys;
    waitTask->command = opponentData->unk94[0];
    waitTask->battler = opponentData->battlerId;
    waitTask->msgIdx = BattleSystem_PrintBattleMessage(battleSys, msgLoader, battleMsg, BattleSystem_GetTextFrameDelay(battleSys));

    SysTask_CreateOnMainQueue(BattleDisplayTask_WaitForBattleMessagePrint, waitTask, 0);
}

typedef struct SetMoveAnimationData {
    BattleSystem *battleSys;
    OpponentData *opponentData;
    Pokepic *pokepic;
    void *battleAnimSys;
    MoveAnimation moveAnim;
    u8 command;
    u8 battler;
    u8 state;
    u8 hideHealthboxes;
    u8 hideShadows;
    u8 unused[3];
} SetMoveAnimationData;

void BattleDisplay_InitTaskSetMoveAnimation(BattleSystem *battleSys, OpponentData *opponentData, MoveAnimation *animation) {
    SetMoveAnimationData *setMoveAnimationData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(SetMoveAnimationData));

    setMoveAnimationData->state = 0;
    setMoveAnimationData->battleSys = battleSys;
    setMoveAnimationData->opponentData = opponentData;
    setMoveAnimationData->command = opponentData->unk94[0];
    setMoveAnimationData->battler = opponentData->battlerId;
    setMoveAnimationData->battleAnimSys = BattleSystem_GetAnimationSystem(battleSys);
    setMoveAnimationData->moveAnim = *animation;
    setMoveAnimationData->pokepic = opponentData->pokepic;

    if (animation->animMode == 1 && animation->secondaryAnimID == 25) {
        opponentData->unk1A0 = 1;
    }

    if (animation->animMode == 1 && animation->secondaryAnimID == 26) {
        opponentData->unk1A0 = 0;
    }

    BattleDisplay_GetAnimHideFlags(&setMoveAnimationData->hideHealthboxes, &setMoveAnimationData->hideShadows, animation->animMode, animation->secondaryAnimID, animation->move);
    SysTask_CreateOnMainQueue(BattleDisplayTask_SetMoveAnimation, setMoveAnimationData, 0);
}

typedef struct FlickerOpponentData {
    BattleSystem *battleSys;
    Pokepic *pokepic;
    u8 battler;
    u8 counter;
    u8 delay;
    u8 unused;
} FlickerOpponentData;

void BattleDisplay_InitTaskFlickerBattler(BattleSystem *battleSys, OpponentData *opponentData) {
    FlickerOpponentData *flickerOpponentData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(FlickerOpponentData));

    flickerOpponentData->counter = 0;
    flickerOpponentData->battleSys = battleSys;
    flickerOpponentData->pokepic = opponentData->pokepic;
    flickerOpponentData->battler = opponentData->battlerId;
    flickerOpponentData->delay = 0;

    SysTask_CreateOnMainQueue(BattleDisplayTask_FlickerBattler, flickerOpponentData, 0);
}

void BattleDisplay_InitTaskUpdateHPGauge(BattleSystem *battleSys, OpponentData *opponentData, HPGaugeUpdateMessage *message) {
    BattleHpBar *hpBar;

    GF_ASSERT(opponentData->hpBar.boxObj != NULL);

    hpBar = &opponentData->hpBar;
    MI_CpuClear8(&hpBar->script, sizeof(u8));

    hpBar->battleSystem = battleSys;
    hpBar->unk4C = message->command;
    hpBar->battlerId = opponentData->battlerId;
    hpBar->type = BattleHpBar_Util_GetBarTypeFromBattlerSide(opponentData->battlerType, BattleSystem_GetBattleType(battleSys));
    hpBar->hp = message->curHP;
    hpBar->maxHp = message->maxHP;
    hpBar->gainedHp = message->hpCalcTemp;
    hpBar->level = message->level;

    if (message->hpCalcTemp == 0x7FFF) {
        hpBar->hp = 0;
        hpBar->gainedHp = 0;
    }

    hpBar->unk10 = SysTask_CreateOnMainQueue(BattleDisplayTask_UpdateHPGauge, hpBar, 1000);
}

void BattleDisplay_InitTaskUpdateExpGauge(BattleSystem *battleSys, OpponentData *opponentData, ExpGaugeUpdateMessage *message) {
    BattleHpBar *hpBar;

    GF_ASSERT(opponentData->hpBar.boxObj != NULL);

    hpBar = &opponentData->hpBar;

    MI_CpuClear8(&hpBar->script, sizeof(u8));

    hpBar->battleSystem = battleSys;
    hpBar->unk4C = message->command;
    hpBar->battlerId = opponentData->battlerId;
    hpBar->exp = message->curExp;
    hpBar->maxExp = message->expToNextLevel;
    hpBar->gainedExp = message->gainedExp - hpBar->exp;

    if (opponentData->battlerType == BATTLER_TYPE_SOLO_PLAYER) {
        hpBar->unk10 = SysTask_CreateOnMainQueue(BattleDisplayTask_UpdateExpGauge, hpBar, 1000);
        return;
    } else {
        BattleController_EmitClearCommand(hpBar->battleSystem, hpBar->battlerId, hpBar->unk4C);
    }
}

typedef struct FaintingSequenceData {
    BattleSystem *battleSys;
    OpponentData *opponentData;
    Pokepic *pokepic;
    MoveAnimation moveAnim;
    u8 command;
    u8 battler;
    u8 state;
    u8 face;
    u16 species;
    u8 gender;
    u8 form;
    u32 personality;
    u16 isSubstitute;
    u16 isTransformed;
} FaintingSequenceData;

void BattleDisplay_InitTaskPlayFaintingSequence(BattleSystem *battleSys, OpponentData *opponentData, FaintingSequenceMessage *message) {
    FaintingSequenceData *faintingSequenceData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(FaintingSequenceData));

    if (opponentData->battlerType & BATTLER_TYPE_SOLO_ENEMY) {
        faintingSequenceData->face = 2;
    } else {
        faintingSequenceData->face = 0;
    }

    faintingSequenceData->state = 0;
    faintingSequenceData->battleSys = battleSys;
    faintingSequenceData->opponentData = opponentData;
    faintingSequenceData->command = message->command;
    faintingSequenceData->battler = opponentData->battlerId;
    faintingSequenceData->pokepic = opponentData->pokepic;
    faintingSequenceData->species = message->species;
    faintingSequenceData->gender = message->gender;
    faintingSequenceData->form = message->form;
    faintingSequenceData->personality = message->personality;
    faintingSequenceData->isSubstitute = message->isSubstitute;
    faintingSequenceData->isTransformed = message->isTransformed;

    for (int i = 0; i < BATTLER_MAX; i++) {
        faintingSequenceData->moveAnim.species[i] = message->monSpecies[i];
        faintingSequenceData->moveAnim.genders[i] = message->monGenders[i];
        faintingSequenceData->moveAnim.isShiny[i] = message->monShiny[i];
        faintingSequenceData->moveAnim.formNums[i] = message->monFormNums[i];
        faintingSequenceData->moveAnim.personalities[i] = message->monPersonalities[i];
    }

    SysTask_CreateOnMainQueue(BattleDisplayTask_PlayFaintingSequence, faintingSequenceData, 0);
}

void BattleDisplay_PlaySound(BattleSystem *battleSys, OpponentData *opponentData, PlaySoundMessage *message) {
    int pan;

    if (opponentData->battlerType & BATTLER_TYPE_SOLO_ENEMY) {
        pan = 0x75;
    } else {
        pan = -0x75;
    }

    BattleController_EmitClearCommand(battleSys, opponentData->battlerId, message->command);
    Sound_PlayPannedEffect(message->sdatID, pan);
}

typedef struct FadeOutData {
    BattleSystem *battleSys;
    u8 command;
    u8 battler;
    u8 state;
    u8 unused;
} FadeOutData;

void BattleDisplay_InitTaskFadeOut(BattleSystem *battleSys, OpponentData *opponentData) {
    FadeOutData *fadeOutData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(FadeOutData));

    fadeOutData->state = 0;
    fadeOutData->battleSys = battleSys;
    fadeOutData->command = opponentData->unk94[0];
    fadeOutData->battler = opponentData->battlerId;

    SysTask_CreateOnMainQueue(BattleDisplayTask_FadeOut, fadeOutData, 0);
}

typedef struct ToggleVanishData {
    BattleSystem *battleSys;
    OpponentData *opponentData;
    MoveAnimation moveAnim;
    u8 command;
    u8 battler;
    u8 state;
    u8 toggleHide;
    int isSubstitute;
} ToggleVanishData;

void BattleDisplay_InitTaskToggleVanish(BattleSystem *battleSys, OpponentData *opponentData, ToggleVanishMessage *message) {
    ToggleVanishData *toggleVanishData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(ToggleVanishData));

    toggleVanishData->battleSys = battleSys;
    toggleVanishData->opponentData = opponentData;
    toggleVanishData->command = message->command;
    toggleVanishData->battler = opponentData->battlerId;
    toggleVanishData->state = 0;
    toggleVanishData->toggleHide = message->toggle;
    toggleVanishData->isSubstitute = message->isSubstitute;

    for (int i = 0; i < BATTLER_MAX; i++) {
        toggleVanishData->moveAnim.species[i] = message->species[i];
        toggleVanishData->moveAnim.genders[i] = message->gender[i];
        toggleVanishData->moveAnim.isShiny[i] = message->isShiny[i];
        toggleVanishData->moveAnim.formNums[i] = message->formNum[i];
        toggleVanishData->moveAnim.personalities[i] = message->personality[i];
    }

    SysTask_CreateOnMainQueue(BattleDisplayTask_ToggleVanish, toggleVanishData, 0);
}

void BattleDisplay_SetStatusIcon(BattleSystem *battleSys, OpponentData *opponentData, SetStatusIconMessage *message) {
    GF_ASSERT(opponentData->hpBar.boxObj != NULL);

    opponentData->hpBar.unk_4A = message->status;

    ov12_0226498C(&opponentData->hpBar, opponentData->hpBar.hp, (1 << 8));
    BattleController_EmitClearCommand(battleSys, opponentData->battlerId, message->command);
}

void BattleDisplay_PrintTrainerMessage(BattleSystem *battleSys, OpponentData *opponentData, TrainerMsgMessage *message) {
    BattleMessageWaitTask *waitTask;
    int trainerID = BattleSystem_GetTrainerIndex(battleSys, opponentData->battlerId);
    waitTask = (BattleMessageWaitTask *)Heap_Alloc(HEAP_ID_BATTLE, sizeof(BattleMessageWaitTask));

    waitTask->battleSys = battleSys;
    waitTask->command = message->command;
    waitTask->battler = opponentData->battlerId;
    waitTask->msgIdx = BattleSystem_PrintTrainerMessage(battleSys, trainerID, opponentData->battlerId, message->msg, BattleSystem_GetTextFrameDelay(battleSys));

    SysTask_CreateOnMainQueue(BattleDisplayTask_WaitForBattleMessagePrint, waitTask, 0);
}

void BattleDisplay_PrintRecallMessage(BattleSystem *battleSys, OpponentData *opponentData, RecallMsgMessage *message) {
    BattleMessageWaitTask *waitTask;
    MsgData *msgLoader;
    BattleMessage battleMsg;

    ov12_02261390(battleSys, opponentData, message, &battleMsg);

    msgLoader = BattleSystem_GetMessageLoader(battleSys);
    waitTask = (BattleMessageWaitTask *)Heap_Alloc(HEAP_ID_BATTLE, sizeof(BattleMessageWaitTask));

    waitTask->battleSys = battleSys;
    waitTask->command = message->command;
    waitTask->battler = opponentData->battlerId;
    waitTask->msgIdx = BattleSystem_PrintBattleMessage(battleSys, msgLoader, &battleMsg, BattleSystem_GetTextFrameDelay(battleSys));

    SysTask_CreateOnMainQueue(BattleDisplayTask_WaitForBattleMessagePrint, waitTask, 0);
}

void BattleDisplay_PrintSendOutMessage(BattleSystem *battleSys, OpponentData *opponentData, SendOutMsgMessage *message) {
    BattleMessageWaitTask *waitTask;
    MsgData *msgLoader;
    BattleMessage battleMsg;

    ov12_02261464(battleSys, opponentData, message, &battleMsg);

    msgLoader = BattleSystem_GetMessageLoader(battleSys);
    waitTask = (BattleMessageWaitTask *)Heap_Alloc(HEAP_ID_BATTLE, sizeof(BattleMessageWaitTask));

    waitTask->battleSys = battleSys;
    waitTask->command = message->command;
    waitTask->battler = opponentData->battlerId;
    waitTask->msgIdx = BattleSystem_PrintBattleMessage(battleSys, msgLoader, &battleMsg, BattleSystem_GetTextFrameDelay(battleSys));

    SysTask_CreateOnMainQueue(BattleDisplayTask_WaitForBattleMessagePrint, waitTask, 0);
}

void BattleDisplay_PrintBattleStartMessage(BattleSystem *battleSys, OpponentData *opponentData) {
    BattleMessageWaitTask *waitTask;
    MsgData *msgLoader;
    BattleMessage battleMsg;

    ov12_02261544(battleSys, opponentData, &battleMsg);

    msgLoader = BattleSystem_GetMessageLoader(battleSys);
    waitTask = (BattleMessageWaitTask *)Heap_Alloc(HEAP_ID_BATTLE, sizeof(BattleMessageWaitTask));

    waitTask->battleSys = battleSys;
    waitTask->command = BATTLE_COMMAND_PRINT_ENCOUNTER_MESSAGE;
    waitTask->battler = opponentData->battlerId;
    waitTask->msgIdx = BattleSystem_PrintBattleMessage(battleSys, msgLoader, &battleMsg, BattleSystem_GetTextFrameDelay(battleSys));

    SysTask_CreateOnMainQueue(BattleDisplayTask_WaitForBattleMessagePrint, waitTask, 0);
}

void BattleDisplay_PrintLeadMonMessage(BattleSystem *battleSys, OpponentData *opponentData, LeadMonMsgMessage *message) {
    BattleMessageWaitTask *waitTask;
    MsgData *msgLoader;
    BattleMessage battleMsg;

    ov12_022615F0(battleSys, opponentData, message, &battleMsg);

    msgLoader = BattleSystem_GetMessageLoader(battleSys);
    waitTask = (BattleMessageWaitTask *)Heap_Alloc(HEAP_ID_BATTLE, sizeof(BattleMessageWaitTask));

    waitTask->battleSys = battleSys;
    waitTask->command = message->command;
    waitTask->battler = opponentData->battlerId;
    waitTask->msgIdx = BattleSystem_PrintBattleMessage(battleSys, msgLoader, &battleMsg, BattleSystem_GetTextFrameDelay(battleSys));

    SysTask_CreateOnMainQueue(BattleDisplayTask_WaitForBattleMessagePrint, waitTask, 0);
}

typedef struct PlayLevelUpAnimationData {
    BattleSystem *battleSys;
    void *hpBar;
    u8 command;
    u8 battler;
    u8 state;
    u8 flashComplete;
} PlayLevelUpAnimationData;

void BattleDisplay_InitTaskPlayLevelUpAnimation(BattleSystem *battleSys, OpponentData *opponentData) {
    PlayLevelUpAnimationData *playLevelUpAnimationData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(PlayLevelUpAnimationData));

    playLevelUpAnimationData->battleSys = battleSys;
    playLevelUpAnimationData->command = opponentData->unk94[0];
    playLevelUpAnimationData->battler = opponentData->battlerId;
    playLevelUpAnimationData->state = 0;
    playLevelUpAnimationData->hpBar = &opponentData->hpBar;

    SysTask_CreateOnMainQueue(BattleDisplayTask_PlayLevelUpAnimation, playLevelUpAnimationData, 0);
}

typedef struct {
    BattleSystem *battleSys;
    u8 command;
    u8 battler;
    u8 msgIdx;
    u8 state;
    u8 delay;
    u8 unused[3];
} AlertMsgData;

void BattleDisplay_SetAlertMessage(BattleSystem *battleSys, OpponentData *opponentData, AlertMsgMessage *message) {
    AlertMsgData *alertMsgData;
    MsgData *msgLoader;

    if (opponentData->unk196 == 0) {
        msgLoader = BattleSystem_GetMessageLoader(battleSys);
        alertMsgData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(AlertMsgData));

        alertMsgData->battleSys = battleSys;
        alertMsgData->command = message->command;
        alertMsgData->battler = opponentData->battlerId;
        alertMsgData->state = 0;
        alertMsgData->msgIdx = BattleSystem_PrintBattleMessage(battleSys, msgLoader, &message->msg, BattleSystem_GetTextFrameDelay(battleSys));

        SysTask_CreateOnMainQueue(BattleDisplayTask_WaitForAlertMessagePrint, alertMsgData, 0);
    } else if (opponentData->unk196 == 1) {
        BattleController_EmitAlertMessageAck(battleSys, opponentData->battlerId);
        BattleController_EmitClearCommand(battleSys, opponentData->battlerId, message->command);
    } else {
        if ((BattleSystem_GetBattleType(battleSys) & BATTLE_TYPE_LINK) == FALSE) {
            BattleController_EmitAlertMessageAck(battleSys, opponentData->battlerId);
        }

        BattleController_EmitClearCommand(battleSys, opponentData->battlerId, message->command);
    }
}

void BattleDisplay_RefreshHPGauge(BattleSystem *battleSys, OpponentData *opponentData, RefreshHPGaugeMessage *message) {
    BattleHpBar *hpBar = &opponentData->hpBar;

    MI_CpuClearFast(&hpBar->script, sizeof(u8));

    hpBar->battleSystem = battleSys;
    hpBar->battlerId = opponentData->battlerId;
    hpBar->type = BattleHpBar_Util_GetBarTypeFromBattlerSide(opponentData->battlerType, BattleSystem_GetBattleType(battleSys));
    hpBar->unk4C = message->command;
    hpBar->hp = message->curHP;
    hpBar->maxHp = message->maxHP;
    hpBar->level = message->level;
    hpBar->unk49 = message->gender;
    hpBar->gainedHp = 0;
    hpBar->exp = message->curExp;
    hpBar->maxExp = message->maxExp;
    hpBar->monId = message->partySlot;
    hpBar->unk_4A = message->status;
    hpBar->unk4B = message->caughtSpecies;
    hpBar->unk27 = message->numSafariBalls;

    ov12_0226498C(hpBar, hpBar->hp, -33);
    BattleController_EmitClearCommand(hpBar->battleSystem, hpBar->battlerId, hpBar->unk4C);
}

typedef struct ForgetMoveData {
    BattleSystem *battleSys;
    BattlePartyContext *battlePartyCtx;
    u8 command;
    u8 battler;
    u8 state;
    u8 unused_0B;
    u16 move;
    u8 slot;
    u8 unused_0F;
} ForgetMoveData;

void BattleDisplay_InitTaskForgetMove(BattleSystem *battleSys, OpponentData *opponentData, ForgetMoveMessage *message) {
    ForgetMoveData *forgetMoveData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(ForgetMoveData));

    forgetMoveData->state = 0;
    forgetMoveData->battleSys = battleSys;
    forgetMoveData->command = message->command;
    forgetMoveData->battler = opponentData->battlerId;
    forgetMoveData->move = message->move;
    forgetMoveData->slot = message->slot;

    SysTask_CreateOnMainQueue(BattleDisplayTask_ForgetMove, forgetMoveData, 0);
}

typedef struct SetMosaicData {
    BattleSystem *battleSys;
    Pokepic *pokepic;
    u8 command;
    u8 battler;
    u8 state;
    u8 intensity;
    u8 counter;
    u8 wait;
    u16 unused;
} SetMosaicData;

void BattleDisplay_InitTaskSetMosaic(BattleSystem *battleSys, OpponentData *opponentData, MosaicSetMessage *message) {
    SetMosaicData *setMosaicData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(SetMosaicData));

    setMosaicData->state = 0;
    setMosaicData->battleSys = battleSys;
    setMosaicData->pokepic = opponentData->pokepic;
    setMosaicData->command = message->command;
    setMosaicData->battler = opponentData->battlerId;
    setMosaicData->intensity = message->intensity;
    setMosaicData->counter = 0;
    setMosaicData->wait = message->wait;

    SysTask_CreateOnMainQueue(BattleDisplayTask_SetMosaic, setMosaicData, 0);
}

typedef struct PartyGaugeTask {
    BattleSystem *battleSys;
    u8 command;
    u8 battler;
    u8 battlerType;
    u8 state;
    u8 status[6];
    u8 midBattle;
} PartyGaugeTask;

void BattleDisplay_InitTaskShowBattleStartPartyGauge(BattleSystem *battleSys, OpponentData *opponentData, PartyGaugeData *partyGauge) {
    PartyGaugeTask *task = Heap_Alloc(HEAP_ID_BATTLE, sizeof(PartyGaugeTask));

    task->state = 0;
    task->battleSys = battleSys;
    task->command = partyGauge->command;
    task->battler = opponentData->battlerId;
    task->battlerType = opponentData->battlerType;

    for (int i = 0; i < 6; i++) {
        task->status[i] = partyGauge->status[i];
    }

    task->midBattle = FALSE;
    SysTask_CreateOnMainQueue(BattleDisplayTask_ShowPartyGauge, task, 0);
}

void BattleDisplay_InitTaskHideBattleStartPartyGauge(BattleSystem *battleSys, OpponentData *opponentData, PartyGaugeData *partyGauge) {
    PartyGaugeTask *task = Heap_Alloc(HEAP_ID_BATTLE, sizeof(PartyGaugeTask));

    task->state = 0;
    task->battleSys = battleSys;
    task->command = partyGauge->command;
    task->battler = opponentData->battlerId;
    task->battlerType = opponentData->battlerType;
    task->midBattle = FALSE;

    SysTask_CreateOnMainQueue(BattleDisplayTask_HidePartyGauge, task, 0);
}

void BattleDisplay_InitTaskShowPartyGauge(BattleSystem *battleSys, OpponentData *opponentData, PartyGaugeData *partyGauge) {
    PartyGaugeTask *task = Heap_Alloc(HEAP_ID_BATTLE, sizeof(PartyGaugeTask));

    task->state = 0;
    task->battleSys = battleSys;
    task->command = partyGauge->command;
    task->battler = opponentData->battlerId;
    task->battlerType = opponentData->battlerType;

    for (int i = 0; i < PARTY_SIZE; i++) {
        task->status[i] = partyGauge->status[i];
    }

    task->midBattle = TRUE;
    SysTask_CreateOnMainQueue(BattleDisplayTask_ShowPartyGauge, task, 0);
}

void BattleDisplay_InitTaskHidePartyGauge(BattleSystem *battleSys, OpponentData *opponentData, PartyGaugeData *partyGauge) {
    PartyGaugeTask *task = Heap_Alloc(HEAP_ID_BATTLE, sizeof(PartyGaugeTask));

    task->state = 0;
    task->battleSys = battleSys;
    task->command = partyGauge->command;
    task->battler = opponentData->battlerId;
    task->battlerType = opponentData->battlerType;
    task->midBattle = TRUE;

    SysTask_CreateOnMainQueue(BattleDisplayTask_HidePartyGauge, task, 0);
}

void BattleDisplay_PrintLinkWaitMessage(BattleSystem *battleSys, OpponentData *opponentData) {
    MsgData *msgLoader;
    BattleMessage battleMsg;

    if (opponentData->unk196 == 0) {
        msgLoader = BattleSystem_GetMessageLoader(battleSys);

        // Communicating. Please stand by...
        battleMsg.id = msg_0197_stand_by;
        battleMsg.tag = TAG_NONE;

        BattleSystem_PrintBattleMessage(battleSys, msgLoader, &battleMsg, NULL);
        ov12_0223BB80(battleSys, WaitingIcon_New(BattleSystem_GetWindow(battleSys, 0), 1));
    }

    BattleController_EmitClearCommand(battleSys, opponentData->battlerId, 55);
}

void BattleDisplay_RestoreSprite(BattleSystem *battleSys, OpponentData *opponentData, MoveAnimation *animation) {
    BattlerSpriteContext battlerSpriteCtx;

    BattleDisplay_PopulateBattlerContext(battleSys, animation, &battlerSpriteCtx, opponentData->battlerId);
    ov07_0223494C(&battlerSpriteCtx, HEAP_ID_BATTLE);
    BattleController_EmitClearCommand(battleSys, opponentData->battlerId, animation->command);
}

typedef struct SpriteToOAMData {
    BattleSystem *battleSys;
    OpponentData *opponentData;
    Pokepic *pokepic;
    u8 command;
    u8 battler;
    u8 state;
    u8 unused[1];
} SpriteToOAMData;

void BattleDisplay_InitTaskSpriteToOAM(BattleSystem *battleSys, OpponentData *opponentData) {
    SpriteToOAMData *spriteToOAMData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(SpriteToOAMData));

    spriteToOAMData->state = 0;
    spriteToOAMData->battleSys = battleSys;
    spriteToOAMData->opponentData = opponentData;
    spriteToOAMData->command = opponentData->unk94[0];
    spriteToOAMData->battler = opponentData->battlerId;
    spriteToOAMData->pokepic = opponentData->pokepic;

    SysTask_CreateOnMainQueue(BattleDisplayTask_SpriteToOAM, spriteToOAMData, 0);
}

typedef struct OAMToSpriteData {
    BattleSystem *battleSys;
    OpponentData *opponentData;
    Pokepic *pokepic;
    u8 command;
    u8 battler;
    u8 delay;
    u8 unused[1];
} OAMToSpriteData;

void BattleDisplay_InitTaskOAMToSprite(BattleSystem *battleSys, OpponentData *opponentData) {
    OAMToSpriteData *oamToSpriteData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(OAMToSpriteData));

    oamToSpriteData->delay = 0;
    oamToSpriteData->battleSys = battleSys;
    oamToSpriteData->opponentData = opponentData;
    oamToSpriteData->command = opponentData->unk94[0];
    oamToSpriteData->battler = opponentData->battlerId;
    oamToSpriteData->pokepic = opponentData->pokepic;

    SysTask_CreateOnMainQueue(BattleDisplayTask_OAMToSprite, oamToSpriteData, 0);
}

void BattleDisplay_PrintResultMessage(BattleSystem *battleSys, OpponentData *opponentData) {
    BattleMessageWaitTask *waitTask;
    MsgData *msgLoader;
    BattleMessage battleMsg;

    ov12_02261928(battleSys, opponentData, &battleMsg);

    msgLoader = BattleSystem_GetMessageLoader(battleSys);
    waitTask = (BattleMessageWaitTask *)Heap_Alloc(HEAP_ID_BATTLE, sizeof(BattleMessageWaitTask));

    waitTask->battleSys = battleSys;
    waitTask->command = BATTLE_COMMAND_PRINT_RESULT_MESSAGE;
    waitTask->battler = opponentData->battlerId;
    waitTask->msgIdx = BattleSystem_PrintBattleMessage(battleSys, msgLoader, &battleMsg, BattleSystem_GetTextFrameDelay(battleSys));

    SysTask_CreateOnMainQueue(BattleDisplayTask_WaitForBattleMessagePrint, waitTask, 0);
}

void BattleDisplay_PrintEscapeMessage(BattleSystem *battleSys, OpponentData *opponentData, EscapeMsgMessage *message) {
    BattleMessageWaitTask *waitTask;
    MsgData *msgLoader;
    BattleMessage battleMsg;

    ov12_022619E4(battleSys, opponentData, message, &battleMsg);

    msgLoader = BattleSystem_GetMessageLoader(battleSys);
    waitTask = (BattleMessageWaitTask *)Heap_Alloc(HEAP_ID_BATTLE, sizeof(BattleMessageWaitTask));

    waitTask->battleSys = battleSys;
    waitTask->command = BATTLE_COMMAND_PRINT_ESCAPE_MESSAGE;
    waitTask->battler = opponentData->battlerId;
    waitTask->msgIdx = BattleSystem_PrintBattleMessage(battleSys, msgLoader, &battleMsg, BattleSystem_GetTextFrameDelay(battleSys));

    SysTask_CreateOnMainQueue(BattleDisplayTask_WaitForBattleMessagePrint, waitTask, 0);
}

void BattleDisplay_PrintForfeitMessage(BattleSystem *battleSys, OpponentData *opponentData) {
    BattleMessageWaitTask *waitTask;
    MsgData *msgLoader;
    BattleMessage battleMsg;

    ov12_02261AD4(battleSys, opponentData, &battleMsg);

    msgLoader = BattleSystem_GetMessageLoader(battleSys);
    waitTask = (BattleMessageWaitTask *)Heap_Alloc(HEAP_ID_BATTLE, sizeof(BattleMessageWaitTask));

    waitTask->battleSys = battleSys;
    waitTask->command = BATTLE_COMMAND_PRINT_FORFEIT_MESSAGE;
    waitTask->battler = opponentData->battlerId;
    waitTask->msgIdx = BattleSystem_PrintBattleMessage(battleSys, msgLoader, &battleMsg, BattleSystem_GetTextFrameDelay(battleSys));

    SysTask_CreateOnMainQueue(BattleDisplayTask_WaitForBattleMessagePrint, waitTask, 0);
}

void BattleDisplay_RefreshSprite(BattleSystem *battleSys, OpponentData *opponentData, MoveAnimation *animation) {
    BattlerSpriteContext battlerSpriteCtx;

    BattleDisplay_PopulateBattlerContext(battleSys, animation, &battlerSpriteCtx, opponentData->battlerId);
    ov07_02234A20(&battlerSpriteCtx, HEAP_ID_BATTLE);
    BattleController_EmitClearCommand(battleSys, opponentData->battlerId, animation->command);
}

void BattleDisplay_FlyMoveHitSoundEffect(BattleSystem *battleSys, OpponentData *opponentData, MoveHitSoundMessage *message) {
    int pan;

    if (opponentData->battlerType & 1) {
        pan = 0x75;
    } else {
        pan = -0x75;
    }

    switch (message->effectiveness) {
    case 0:
        Sound_PlayPannedEffect(SEQ_SE_DP_KOUKA_M, pan);
        break;
    case 2:
        Sound_PlayPannedEffect(SEQ_SE_DP_KOUKA_H, pan);
        break;
    case 1:
        Sound_PlayPannedEffect(SEQ_SE_DP_KOUKA_L, pan);
        break;
    }

    BattleController_EmitClearCommand(battleSys, opponentData->battlerId, message->command);
}

void BattleDisplay_PlayMusic(BattleSystem *battleSys, OpponentData *opponentData, MusicPlayMessage *message) {
    PlayBGM(message->bgmID);
    BattleController_EmitClearCommand(battleSys, opponentData->battlerId, message->command);
}

typedef struct Data_022645C8 {
    BattleSystem *battleSystem;
    u8 command;
    u8 battlerId;
    u8 unk6;
    u8 unk7;
    u8 unk8;
} Data_022645C8;

void ov12_0225B454(BattleSystem *battleSys, OpponentData *opponentData, Message_022645C8 *message) {
    Data_022645C8 *data = Heap_Alloc(HEAP_ID_BATTLE, sizeof(Data_022645C8));
    MI_CpuClear8(data, sizeof(Data_022645C8));

    data->unk6 = 0;
    data->battleSystem = battleSys;
    data->command = message->command;
    data->unk7 = message->unk1;
    data->unk8 = 0;
    data->battlerId = opponentData->battlerId;

    SysTask_CreateOnMainQueue(ov12_02260D84, data, 0);
}

static void BattleDisplayTask_SetEncounter(SysTask *task, void *data) {
    MonEncounterData *monEncounterData = data;
    BattleAnimSystem *battleAnimSys = BattleSystem_GetAnimationSystem(monEncounterData->battleSys);
    s16 x, y;

    switch (monEncounterData->state) {
    case 0:
        monEncounterData->delay = 28;
        monEncounterData->state++;
    case 1:
        if (--monEncounterData->delay) {
            break;
        }

        monEncounterData->state++;
    case 2:
        if (monEncounterData->face == 2) {
            ManagedSprite_GetPositionXY(monEncounterData->terrain->managedSprite, &x, &y);

            if (monEncounterData->battlerType == BATTLER_TYPE_SOLO_ENEMY || monEncounterData->battlerType == BATTLER_TYPE_ENEMY_SIDE_SLOT_1) {
                if (x < (24 * 8)) {
                    ManagedSprite_OffsetPositionXY(monEncounterData->terrain->managedSprite, 8, 0);
                } else {
                    ManagedSprite_SetPositionXY(monEncounterData->terrain->managedSprite, 24 * 8, 8 * 11);
                }
            }

            ManagedSprite_GetPositionXY(monEncounterData->terrain->managedSprite, &x, &y);

            if (monEncounterData->battlerType == BATTLER_TYPE_SOLO_ENEMY) {
                Pokepic_SetAttr(monEncounterData->sprite, 0, x);
            } else if (monEncounterData->battlerType == BATTLER_TYPE_ENEMY_SIDE_SLOT_1) {
                x = Pokepic_GetAttr(monEncounterData->sprite, 0) - x;
                x -= 24;

                Pokepic_AddAttr(monEncounterData->sprite, 0, -x);
            } else if (monEncounterData->battlerType == BATTLER_TYPE_ENEMY_SIDE_SLOT_2) {
                x = x - Pokepic_GetAttr(monEncounterData->sprite, 0);
                x -= 16;

                Pokepic_AddAttr(monEncounterData->sprite, 0, x);
            }

            if (Pokepic_GetAttr(monEncounterData->sprite, 0) >= monEncounterData->targetPos) {
                Pokepic_SetAttr(monEncounterData->sprite, 0x2C, FALSE);
                Pokepic_SetAttr(monEncounterData->sprite, 0x2D, FALSE);
                Pokepic_SetAttr(monEncounterData->sprite, 0, monEncounterData->targetPos);

                ov12_02261F38(monEncounterData->battleSys, monEncounterData->battler, monEncounterData->battlerType, monEncounterData->sprite, monEncounterData->opponentData->narc, monEncounterData->species, monEncounterData->formNum, monEncounterData->face, monEncounterData->cryMod);

                if (monEncounterData->battlerType == BATTLER_TYPE_SOLO_ENEMY || monEncounterData->battlerType == BATTLER_TYPE_ENEMY_SIDE_SLOT_1) {
                    ManagedSprite_SetPositionXY(monEncounterData->terrain->managedSprite, 24 * 8, 8 * 11);
                }

                Pokepic_StartPaletteFade(monEncounterData->sprite, 8, 0, 0, 0);
                monEncounterData->state++;
            }
        } else {
            ManagedSprite_GetPositionXY(monEncounterData->terrain->managedSprite, &x, &y);

            if (monEncounterData->battlerType == BATTLER_TYPE_SOLO_PLAYER || monEncounterData->battlerType == BATTLER_TYPE_PLAYER_SIDE_SLOT_1) {
                if (x > 64) {
                    ManagedSprite_OffsetPositionXY(monEncounterData->terrain->managedSprite, -8, 0);
                } else {
                    ManagedSprite_SetPositionXY(monEncounterData->terrain->managedSprite, 64, 128 + 8);
                }
            }

            ManagedSprite_GetPositionXY(monEncounterData->terrain->managedSprite, &x, &y);

            if (monEncounterData->battlerType == BATTLER_TYPE_SOLO_PLAYER) {
                Pokepic_SetAttr(monEncounterData->sprite, 0, x);
            } else if (monEncounterData->battlerType == BATTLER_TYPE_PLAYER_SIDE_SLOT_1) {
                x = x - Pokepic_GetAttr(monEncounterData->sprite, 0);
                x -= 24;
                Pokepic_AddAttr(monEncounterData->sprite, 0, x);
            } else if (monEncounterData->battlerType == BATTLER_TYPE_PLAYER_SIDE_SLOT_2) {
                x = Pokepic_GetAttr(monEncounterData->sprite, 0) - x;
                x -= 16;
                Pokepic_AddAttr(monEncounterData->sprite, 0, -x);
            }

            if (Pokepic_GetAttr(monEncounterData->sprite, 0) <= monEncounterData->targetPos) {
                Pokepic_SetAttr(monEncounterData->sprite, 0, monEncounterData->targetPos);

                ov12_02261F38(monEncounterData->battleSys, monEncounterData->battler, monEncounterData->battlerType, monEncounterData->sprite, monEncounterData->opponentData->narc, monEncounterData->species, monEncounterData->formNum, monEncounterData->face, monEncounterData->cryMod);

                if (monEncounterData->battlerType == BATTLER_TYPE_SOLO_PLAYER || monEncounterData->battlerType == BATTLER_TYPE_PLAYER_SIDE_SLOT_1) {
                    ManagedSprite_SetPositionXY(monEncounterData->terrain->managedSprite, 64, 128 + 8);
                }

                monEncounterData->state++;
            }
        }
        break;
    case 3:
        if (sub_02017068(ov12_0223B750(monEncounterData->battleSys), monEncounterData->battler) == TRUE
            && Pokepic_IsAnimFinished(monEncounterData->sprite) == FALSE) {
            if (monEncounterData->isShiny) {
                MoveAnimation moveAnim;

                BattleController_SetMoveAnimation(monEncounterData->battleSys, NULL, &moveAnim, 1, 11, monEncounterData->battler, monEncounterData->battler, NULL);
                BattleDisplay_PlayMoveAnimation(monEncounterData->battleSys, monEncounterData->opponentData, battleAnimSys, &moveAnim);
                monEncounterData->state = 4;
            } else {
                monEncounterData->state = 0xFF;
            }
        }
        break;
    case 4:
        ov07_0221C394(battleAnimSys);

        if (BattleAnimSystem_IsMoveActive(battleAnimSys) == FALSE) {
            BattleAnimSystem_FreeScriptData(battleAnimSys);
            monEncounterData->state = 0xFF;
        }
        break;
    default:
        sub_02005B58(FALSE);
        BattleController_EmitClearCommand(monEncounterData->battleSys, monEncounterData->battler, monEncounterData->command);
        Heap_Free(data);
        SysTask_Destroy(task);
        break;
    }
}

static void BattleDisplayTask_SetGiratinaEncounter(SysTask *task, void *data) {
    MonEncounterData *monEncounterData = data;
    BattleAnimSystem *battleAnimSys = BattleSystem_GetAnimationSystem(monEncounterData->battleSys);
    s16 x, y;

    switch (monEncounterData->state) {
    case 0:
        monEncounterData->delay = 28;
        monEncounterData->state++;
    case 1:
        if (--monEncounterData->delay) {
            break;
        }

        monEncounterData->state++;
    case 2:
        ManagedSprite_GetPositionXY(monEncounterData->terrain->managedSprite, &x, &y);

        if (monEncounterData->battlerType == BATTLER_TYPE_SOLO_ENEMY || monEncounterData->battlerType == BATTLER_TYPE_ENEMY_SIDE_SLOT_1) {
            if (x < (24 * 8)) {
                ManagedSprite_OffsetPositionXY(monEncounterData->terrain->managedSprite, 8, 0);
            } else {
                ManagedSprite_SetPositionXY(monEncounterData->terrain->managedSprite, 24 * 8, 8 * 11);
            }
        }

        ManagedSprite_GetPositionXY(monEncounterData->terrain->managedSprite, &x, &y);
        Pokepic_AddAttr(monEncounterData->sprite, 1, 8 / 2);

        if (Pokepic_GetAttr(monEncounterData->sprite, 1) >= monEncounterData->targetPos) {
            Pokepic_SetAttr(monEncounterData->sprite, 0x2C, FALSE);
            Pokepic_SetAttr(monEncounterData->sprite, 0x2D, FALSE);
            Pokepic_SetAttr(monEncounterData->sprite, 1, monEncounterData->targetPos);

            ov12_02261F38(monEncounterData->battleSys, monEncounterData->battler, monEncounterData->battlerType, monEncounterData->sprite, monEncounterData->opponentData->narc, monEncounterData->species, monEncounterData->formNum, monEncounterData->face, monEncounterData->cryMod);

            ManagedSprite_SetPositionXY(monEncounterData->terrain->managedSprite, 24 * 8, 8 * 11);
            Pokepic_StartPaletteFade(monEncounterData->sprite, 8, 0, 0, 0);

            monEncounterData->state++;
        }
        break;
    case 3:
        if (sub_02017068(ov12_0223B750(monEncounterData->battleSys), monEncounterData->battler) == TRUE
            && Pokepic_IsAnimFinished(monEncounterData->sprite) == FALSE) {
            if (monEncounterData->isShiny) {
                MoveAnimation moveAnim;

                BattleController_SetMoveAnimation(monEncounterData->battleSys, NULL, &moveAnim, 1, 11, monEncounterData->battler, monEncounterData->battler, NULL);
                BattleDisplay_PlayMoveAnimation(monEncounterData->battleSys, monEncounterData->opponentData, battleAnimSys, &moveAnim);
                monEncounterData->state = 4;
            } else {
                monEncounterData->state = 0xFF;
            }
        }
        break;
    case 4:
        ov07_0221C394(battleAnimSys);

        if (BattleAnimSystem_IsMoveActive(battleAnimSys) == FALSE) {
            BattleAnimSystem_FreeScriptData(battleAnimSys);
            monEncounterData->state = 0xFF;
        }
        break;
    default:
        sub_02005B58(FALSE);
        BattleController_EmitClearCommand(monEncounterData->battleSys, monEncounterData->battler, monEncounterData->command);
        Heap_Free(data);
        SysTask_Destroy(task);
        break;
    }
}

static void BattleDisplayTask_ShowEncounter(SysTask *task, void *data) {
    MonShowData *monShowData = data;

    switch (monShowData->state) {
    case 0:
        monShowData->delay = 0;
        monShowData->btlMonObjData = NULL;

        if (BattleSystem_GetBattleType(monShowData->battleSys) & BATTLE_TYPE_MULTI) {
            if ((BattleSystem_GetBattleSpecial(monShowData->battleSys) & (1 << 5)) == FALSE
                && monShowData->battlerType == BATTLER_TYPE_PLAYER_SIDE_SLOT_1) {
                monShowData->btlMonObjData = ov07_0221FDFC(monShowData->battleSys, HEAP_ID_BATTLE);
            }
        } else if ((BattleSystem_GetBattleSpecial(monShowData->battleSys) & (1 << 5)) == FALSE) {
            if (BattleSystem_IsInitialized(monShowData->battleSys) == TRUE && monShowData->battlerType == BATTLER_TYPE_PLAYER_SIDE_SLOT_1) {
                monShowData->btlMonObjData = ov07_0221FDFC(monShowData->battleSys, HEAP_ID_BATTLE);
            } else if (monShowData->battlerType == BATTLER_TYPE_SOLO_PLAYER) {
                monShowData->btlMonObjData = ov07_0221FDFC(monShowData->battleSys, HEAP_ID_BATTLE);
            }
        }

        monShowData->state++;
        break;
    case 1:
        BallCapsuleConfig ballCapCfg = { 0 };

        ballCapCfg.battlerType = monShowData->battlerType;
        ballCapCfg.mon = BattleSystem_GetPartyMon(monShowData->battleSys, monShowData->battler, monShowData->selectedPartySlot);

        monShowData->ballCapsuleSealEffect = ov07_02232694(HEAP_ID_BATTLE, &ballCapCfg);

        ov07_022329B0(monShowData->ballCapsuleSealEffect);
        monShowData->state++;
        break;
    case 2:
        if (ov07_02233F20(monShowData->opponentData->ballData) != 0) {
            break;
        }

        if (ov07_02232A04(monShowData->ballCapsuleSealEffect) != 1) {
            break;
        }

        if (ov07_02233EA0(monShowData->opponentData->ballData) == 1) {
            if (monShowData->battlerType == BATTLER_TYPE_PLAYER_SIDE_SLOT_2) {
                monShowData->delay++;

                if (monShowData->delay >= 12) {
                    monShowData->delay = 0;
                } else {
                    break;
                }
            }

            PokepicManager *monSpriteMan = BattleSystem_GetPokepicManager(monShowData->battleSys);
            PokepicAnimScript animScript[10];

            NARC_ReadPokepicAnimScript(monShowData->opponentData->narc, &animScript[0], monShowData->species, monShowData->battlerType);
            monShowData->opponentData->pokepic = BattleDisplay_NewPokepic(monShowData->battleSys,
                monSpriteMan,
                &monShowData->spriteTemplate,
                gBattlerEncounterX[monShowData->battlerType][0],
                ov07_022377F4[monShowData->battlerType][1],
                ov07_022377F4[monShowData->battlerType][2],
                monShowData->yOffset,
                monShowData->height,
                monShowData->shadowXOffset,
                monShowData->shadowSize,
                monShowData->battler,
                &animScript[0],
                NULL);

            Pokepic_SetAttr(monShowData->opponentData->pokepic, 12, 0);
            Pokepic_SetAttr(monShowData->opponentData->pokepic, 13, 0);
            Pokepic_SetAttr(monShowData->opponentData->pokepic, 0x2C, FALSE);
            Pokepic_SetAttr(monShowData->opponentData->pokepic, 6, TRUE);

            Pokepic_StartPaletteFade(monShowData->opponentData->pokepic, 16, 16, 0, ov12_0226D15A[monShowData->capturedBall]);
            Pokepic_SetAttr(monShowData->opponentData->pokepic, 6, FALSE);

            ov07_02232A44(monShowData->ballCapsuleSealEffect);

            if (monShowData->face == 2) {
                Sound_PlayPannedEffect(0x706, 0x75);
            } else {
                Sound_PlayPannedEffect(0x706, -0x75);
            }

            if (monShowData->btlMonObjData) {
                ov07_0221FE08(monShowData->btlMonObjData);
                monShowData->btlMonObjData = NULL;
            }

            monShowData->state++;
        }
        break;
    case 3:
        if (ov07_02233E88(monShowData->opponentData->ballData) != 1) {
            monShowData->state++;
        }
    case 4:
        if (Pokepic_GetAttr(monShowData->opponentData->pokepic, 12) == 0x100 && ov07_02232A54(monShowData->ballCapsuleSealEffect) == 0) {
            if (monShowData->face == 2) {
                Pokepic_SetAttr(monShowData->opponentData->pokepic, 0x2D, FALSE);
            }

            ov12_02261F38(monShowData->battleSys, monShowData->battler, monShowData->battlerType, monShowData->opponentData->pokepic, monShowData->opponentData->narc, monShowData->species, monShowData->formNum, monShowData->face, monShowData->cryMod);

            Pokepic_StartPaletteFade(monShowData->opponentData->pokepic, 16, 0, 0, ov12_0226D15A[monShowData->capturedBall]);

            monShowData->state = 5;
        } else if (Pokepic_GetAttr(monShowData->opponentData->pokepic, 12) >= 0x100) {
            Pokepic_SetAttr(monShowData->opponentData->pokepic, 12, 0x100);
            Pokepic_SetAttr(monShowData->opponentData->pokepic, 13, 0x100);

            if (monShowData->face == 2) {
                Pokepic_SetAttr(monShowData->opponentData->pokepic, 0x2D, FALSE);
            }

            ov12_02261F38(monShowData->battleSys, monShowData->battler, monShowData->battlerType, monShowData->opponentData->pokepic, monShowData->opponentData->narc, monShowData->species, monShowData->formNum, monShowData->face, monShowData->cryMod);

            Pokepic_StartPaletteFade(monShowData->opponentData->pokepic, 16, 0, 1, ov12_0226D15A[monShowData->capturedBall]);

            monShowData->state = 5;
        } else {
            Pokepic_AddAttr(monShowData->opponentData->pokepic, 12, 0x20);
            Pokepic_AddAttr(monShowData->opponentData->pokepic, 13, 0x20);
            sub_0200914C(monShowData->opponentData->pokepic, monShowData->height);
        }
        break;
    case 5:
        if (ov07_02232A54(monShowData->ballCapsuleSealEffect) == 0) {
            monShowData->state = 6;
        }
        break;
    case 6:
        if (sub_02017068(ov12_0223B750(monShowData->battleSys), monShowData->battler) == TRUE
            && Pokepic_IsAnimFinished(monShowData->opponentData->pokepic) == FALSE) {
            ov07_02233ECC(monShowData->opponentData->ballData);
            monShowData->opponentData->ballData = NULL;
            ov07_02232AB8(monShowData->ballCapsuleSealEffect);

            if (monShowData->isShiny) {
                MoveAnimation moveAnim;

                monShowData->battleAnimSys = ov07_0221BEDC(HEAP_ID_BATTLE);
                BattleController_SetMoveAnimation(monShowData->battleSys, NULL, &moveAnim, 1, 11, monShowData->battler, monShowData->battler, NULL);
                BattleDisplay_PlayMoveAnimation(monShowData->battleSys, monShowData->opponentData, monShowData->battleAnimSys, &moveAnim);
                monShowData->state = 7;
            } else {
                monShowData->state = 0xFF;
            }
        }
        break;
    case 7:
        ov07_0221C394(monShowData->battleAnimSys);

        if (BattleAnimSystem_IsMoveActive(monShowData->battleAnimSys) == FALSE) {
            BattleAnimSystem_FreeScriptData(monShowData->battleAnimSys);
            ov07_0221BFE0(monShowData->battleAnimSys);
            monShowData->state = 0xFF;
        }
        break;
    default:
        sub_02005B58(FALSE);
        BattleController_EmitClearCommand(monShowData->battleSys, monShowData->battler, monShowData->command);
        Heap_Free(data);
        SysTask_Destroy(task);
        break;
    }
}

static void ov12_0225BE38(SysTask *task, void *data) {
    MonShowData *monShowData = data;

    switch (monShowData->state) {
    case 0:
        monShowData->delay = 0;
        monShowData->btlMonObjData = NULL;

        if (BattleSystem_GetBattleType(monShowData->battleSys) & BATTLE_TYPE_MULTI) {
            if ((BattleSystem_GetBattleSpecial(monShowData->battleSys) & (1 << 5)) == FALSE
                && monShowData->battlerType == BATTLER_TYPE_PLAYER_SIDE_SLOT_1) {
                monShowData->btlMonObjData = ov07_0221FDFC(monShowData->battleSys, HEAP_ID_BATTLE);
            }
        } else if ((BattleSystem_GetBattleSpecial(monShowData->battleSys) & (1 << 5)) == FALSE) {
            if (BattleSystem_IsInitialized(monShowData->battleSys) == TRUE && monShowData->battlerType == BATTLER_TYPE_PLAYER_SIDE_SLOT_1) {
                monShowData->btlMonObjData = ov07_0221FDFC(monShowData->battleSys, HEAP_ID_BATTLE);
            } else if (monShowData->battlerType == BATTLER_TYPE_SOLO_PLAYER) {
                monShowData->btlMonObjData = ov07_0221FDFC(monShowData->battleSys, HEAP_ID_BATTLE);
            }
        }

        monShowData->state++;
        break;
    case 1:
        if (monShowData->battlerType == BATTLER_TYPE_PLAYER_SIDE_SLOT_2) {
            monShowData->delay++;

            if (monShowData->delay >= 12) {
                monShowData->delay = 0;
            } else {
                break;
            }
        }

        PokepicManager *monSpriteMan = BattleSystem_GetPokepicManager(monShowData->battleSys);
        PokepicAnimScript animScript[10];

        NARC_ReadPokepicAnimScript(monShowData->opponentData->narc, &animScript[0], monShowData->species, monShowData->battlerType);
        monShowData->opponentData->pokepic = BattleDisplay_NewPokepic(monShowData->battleSys,
            monSpriteMan,
            &monShowData->spriteTemplate,
            gSlideTrainerInCoords[monShowData->battlerType][0],
            gSlideTrainerInCoords[monShowData->battlerType][1],
            ov07_022377F4[monShowData->battlerType][2],
            monShowData->yOffset,
            monShowData->height,
            monShowData->shadowXOffset,
            monShowData->shadowSize,
            monShowData->battler,
            &animScript[0],
            NULL);

        Pokepic_SetAttr(monShowData->opponentData->pokepic, 12, (1 << 8));
        Pokepic_SetAttr(monShowData->opponentData->pokepic, 13, (1 << 8));
        Pokepic_SetAttr(monShowData->opponentData->pokepic, 0x2C, FALSE);
        Pokepic_SetAttr(monShowData->opponentData->pokepic, 6, FALSE);

        if (monShowData->btlMonObjData) {
            ov07_0221FE08(monShowData->btlMonObjData);
            monShowData->btlMonObjData = NULL;
        }

        monShowData->state++;

        break;
    case 2:
        MoveAnimation moveAnim;

        monShowData->battleAnimSys = ov07_0221BEDC(HEAP_ID_BATTLE);
        BattleController_SetMoveAnimation(monShowData->battleSys, NULL, &moveAnim, 1, 41, monShowData->battler, monShowData->battler, NULL);
        BattleDisplay_PlayMoveAnimation(monShowData->battleSys, monShowData->opponentData, monShowData->battleAnimSys, &moveAnim);

        monShowData->state++;
        break;
    case 3:
        ov07_0221C394(monShowData->battleAnimSys);
        if (BattleAnimSystem_IsMoveActive(monShowData->battleAnimSys) == FALSE) {
            BattleAnimSystem_FreeScriptData(monShowData->battleAnimSys);
            ov07_0221BFE0(monShowData->battleAnimSys);
            monShowData->state++;
        }
        break;
    case 4:
        if (monShowData->face == 2) {
            Pokepic_SetAttr(monShowData->opponentData->pokepic, 0x2D, 0);
        }

        ov12_02261F38(monShowData->battleSys, monShowData->battler, monShowData->battlerType, monShowData->opponentData->pokepic, monShowData->opponentData->narc, monShowData->species, monShowData->formNum, monShowData->face, monShowData->cryMod);

        monShowData->state = 5;

        break;
    case 5:
        if (sub_02017068(ov12_0223B750(monShowData->battleSys), monShowData->battler) == 1 && Pokepic_IsAnimFinished(monShowData->opponentData->pokepic) == FALSE) {
            ov07_02233ECC(monShowData->opponentData->ballData);
            monShowData->opponentData->ballData = NULL;
            if (monShowData->isShiny) {
                MoveAnimation moveAnim2;

                monShowData->battleAnimSys = ov07_0221BEDC(HEAP_ID_BATTLE);
                BattleController_SetMoveAnimation(monShowData->battleSys, NULL, &moveAnim2, 1, 11, monShowData->battler, monShowData->battler, NULL);
                BattleDisplay_PlayMoveAnimation(monShowData->battleSys, monShowData->opponentData, monShowData->battleAnimSys, &moveAnim2);
                monShowData->state = 6;
                break;
            }
            monShowData->state = 0xFF;
        }
        break;

    case 6:
        ov07_0221C394(monShowData->battleAnimSys);
        if (BattleAnimSystem_IsMoveActive(monShowData->battleAnimSys) == FALSE) {
            BattleAnimSystem_FreeScriptData(monShowData->battleAnimSys);
            ov07_0221BFE0(monShowData->battleAnimSys);
            monShowData->state = 0xFF;
        }
        break;
    default:
        sub_02005B58(FALSE);
        BattleController_EmitClearCommand(monShowData->battleSys, monShowData->battler, monShowData->command);
        Heap_Free(data);
        SysTask_Destroy(task);
        break;
    }
}

extern const u8 sBallThrowTypes[];

static void BattleDisplayTask_ShowPokemon(SysTask *task, void *data) {
    MonShowData *monShowData = data;
    BattleAnimSystem *battleAnimSys = BattleSystem_GetAnimationSystem(monShowData->battleSys);

    switch (monShowData->state) {
    case 0:
        BallThrow ballThrow;

        ballThrow.type = sBallThrowTypes[monShowData->battlerType];
        ballThrow.heapID = HEAP_ID_BATTLE;
        ballThrow.target = monShowData->battler;
        ballThrow.ballID = monShowData->capturedBall;
        ballThrow.spriteSystem = BattleSystem_GetSpriteSystem(monShowData->battleSys);
        ballThrow.paletteData = BattleSystem_GetPaletteData(monShowData->battleSys);
        ballThrow.bgPrio = 1;
        ballThrow.surface = 0;

        if (monShowData->isQuickSendOut == 1) {
            ballThrow.mode = BALL_THROW_MODE_SEND_OUT_QUICK;
        } else {
            ballThrow.mode = BALL_THROW_MODE_SEND_OUT;
        }

        monShowData->ballRotation = ov07_02233DB8(&ballThrow);
        PokepicManager *monSpriteMan = BattleSystem_GetPokepicManager(monShowData->battleSys);
        PokepicAnimScript animScript[10];

        NARC_ReadPokepicAnimScript(monShowData->opponentData->narc, &animScript[0], monShowData->species, monShowData->battlerType);
        monShowData->opponentData->pokepic = BattleDisplay_NewPokepic(monShowData->battleSys,
            monSpriteMan,
            &monShowData->spriteTemplate,
            gBattlerEncounterX[monShowData->battlerType][0],
            ov07_022377F4[monShowData->battlerType][1],
            ov07_022377F4[monShowData->battlerType][2],
            monShowData->yOffset,
            monShowData->height,
            monShowData->shadowXOffset,
            monShowData->shadowSize,
            monShowData->battler,
            &animScript[0],
            NULL);

        Pokepic_SetAttr(monShowData->opponentData->pokepic, 12, 0);
        Pokepic_SetAttr(monShowData->opponentData->pokepic, 13, 0);
        Pokepic_SetAttr(monShowData->opponentData->pokepic, 0x2C, FALSE);
        Pokepic_SetAttr(monShowData->opponentData->pokepic, 6, TRUE);
        monShowData->btlMonObjData = NULL;
        monShowData->btlMonObjData = ov07_0221FDFC(monShowData->battleSys, HEAP_ID_BATTLE);
        monShowData->state++;
        break;
    case 1:
        BallCapsuleConfig ballCapCfg = { 0 };

        ballCapCfg.battlerType = monShowData->battlerType;
        ballCapCfg.mon = BattleSystem_GetPartyMon(monShowData->battleSys, monShowData->battler, monShowData->selectedPartySlot);
        ballCapCfg.ballTypeOverride = monShowData->capturedBall;

        monShowData->ballCapsuleSealEffect = ov07_02232694(HEAP_ID_BATTLE, &ballCapCfg);
        ov07_022329B0(monShowData->ballCapsuleSealEffect);
        monShowData->state++;
        break;
    case 2:
        if (ov07_02233F20(monShowData->ballRotation) != 0 && monShowData->isQuickSendOut == 0) {
            break;
        }

        if (ov07_02232A04(monShowData->ballCapsuleSealEffect) != 1) {
            break;
        }

        if (ov07_02233EA0(monShowData->ballRotation) == 1) {
            if (monShowData->btlMonObjData) {
                ov07_0221FE08(monShowData->btlMonObjData);
            }

            Pokepic_StartPaletteFade(monShowData->opponentData->pokepic, 16, 16, 0, ov12_0226D15A[monShowData->capturedBall]);
            Pokepic_SetAttr(monShowData->opponentData->pokepic, 6, FALSE);

            ov07_02232A44(monShowData->ballCapsuleSealEffect);

            if (monShowData->face == 2) {
                Sound_PlayPannedEffect(0x706, 0x75);
            } else {
                Sound_PlayPannedEffect(0x706, -0x75);
            }

            monShowData->state++;
        }
        break;
    case 3:
        if (ov07_02233E88(monShowData->ballRotation) != 1) {
            monShowData->state++;
        }
    case 4:
        if (Pokepic_GetAttr(monShowData->opponentData->pokepic, 12) == 0x100 && ov07_02232A54(monShowData->ballCapsuleSealEffect) == 0) {
            if (monShowData->face == 2) {
                Pokepic_SetAttr(monShowData->opponentData->pokepic, 0x2D, FALSE);
            }

            ov12_02261F38(monShowData->battleSys, monShowData->battler, monShowData->battlerType, monShowData->opponentData->pokepic, monShowData->opponentData->narc, monShowData->species, monShowData->formNum, monShowData->face, monShowData->cryMod);

            Pokepic_StartPaletteFade(monShowData->opponentData->pokepic, 16, 0, 0, ov12_0226D15A[monShowData->capturedBall]);
            monShowData->state = 5;
        } else if (Pokepic_GetAttr(monShowData->opponentData->pokepic, 12) >= 0x100) {
            Pokepic_SetAttr(monShowData->opponentData->pokepic, 12, 0x100);
            Pokepic_SetAttr(monShowData->opponentData->pokepic, 13, 0x100);

            if (monShowData->face == 2) {
                Pokepic_SetAttr(monShowData->opponentData->pokepic, 0x2D, FALSE);
            }

            ov12_02261F38(monShowData->battleSys, monShowData->battler, monShowData->battlerType, monShowData->opponentData->pokepic, monShowData->opponentData->narc, monShowData->species, monShowData->formNum, monShowData->face, monShowData->cryMod);

            Pokepic_StartPaletteFade(monShowData->opponentData->pokepic, 16, 0, 1, ov12_0226D15A[monShowData->capturedBall]);
            monShowData->state = 5;
        } else {
            Pokepic_AddAttr(monShowData->opponentData->pokepic, 12, 0x20);
            Pokepic_AddAttr(monShowData->opponentData->pokepic, 13, 0x20);
            sub_0200914C(monShowData->opponentData->pokepic, monShowData->height);
        }
        break;
    case 5:
        if (ov07_02232A54(monShowData->ballCapsuleSealEffect) == 0) {
            monShowData->state = 6;
        }
        break;
    case 6:
        if (sub_02017068(ov12_0223B750(monShowData->battleSys), monShowData->battler) == TRUE
            && Pokepic_IsAnimFinished(monShowData->opponentData->pokepic) == FALSE) {
            ov07_02233ECC(monShowData->ballRotation);
            ov07_02232AB8(monShowData->ballCapsuleSealEffect);

            if (monShowData->isShiny) {
                MoveAnimation moveAnim;

                BattleController_SetMoveAnimation(monShowData->battleSys, NULL, &moveAnim, 1, 11, monShowData->battler, monShowData->battler, NULL);
                BattleDisplay_PlayMoveAnimation(monShowData->battleSys, monShowData->opponentData, battleAnimSys, &moveAnim);
                monShowData->state = 7;
            } else {
                monShowData->state = 8;
            }
        }
        break;
    case 7:
    case 9:
    case 11:
        ov07_0221C394(battleAnimSys);

        if (BattleAnimSystem_IsMoveActive(battleAnimSys) == FALSE) {
            BattleAnimSystem_FreeScriptData(battleAnimSys);
            monShowData->state++;
        }
        break;
    case 8:
        if (monShowData->isSubstitute) {
            MoveAnimation moveAnim;

            BattleController_SetMoveAnimation(monShowData->battleSys, NULL, &moveAnim, 1, 15, monShowData->battler, monShowData->battler, NULL);
            BattleDisplay_PlayMoveAnimation(monShowData->battleSys, monShowData->opponentData, battleAnimSys, &moveAnim);
            monShowData->state++;
        } else {
            monShowData->state = 0xFF;
        }
        break;
    case 10:
        BattlerSpriteContext battlerSpriteCtx;
        MoveAnimation moveAnim;

        BattleDisplay_PopulateBattlerContext(monShowData->battleSys, &monShowData->moveAnim, &battlerSpriteCtx, monShowData->battler);
        ov07_02234A20(&battlerSpriteCtx, HEAP_ID_BATTLE);
        BattleController_SetMoveAnimation(monShowData->battleSys, NULL, &moveAnim, 1, 16, monShowData->battler, monShowData->battler, NULL);
        BattleDisplay_PlayMoveAnimation(monShowData->battleSys, monShowData->opponentData, battleAnimSys, &moveAnim);

        monShowData->opponentData->unk1A0 = 1;
        monShowData->state++;
        break;
    default:
        BattleController_EmitClearCommand(monShowData->battleSys, monShowData->battler, monShowData->command);
        Heap_Free(data);
        SysTask_Destroy(task);
        break;
    }
}

static void ov12_0225C6C8(SysTask *task, void *data) {
    MonShowData *monShowData = data;

    BattleAnimSystem *battleAnimSys = BattleSystem_GetAnimationSystem(monShowData->battleSys);

    switch (monShowData->state) {
    case 0:
        PokepicManager *monSpriteMan = BattleSystem_GetPokepicManager(monShowData->battleSys);
        PokepicAnimScript animScript[10];

        NARC_ReadPokepicAnimScript(monShowData->opponentData->narc, &animScript[0], monShowData->species, monShowData->battlerType);
        monShowData->opponentData->pokepic = BattleDisplay_NewPokepic(monShowData->battleSys,
            monSpriteMan,
            &monShowData->spriteTemplate,
            gSlideTrainerInCoords[monShowData->battlerType][0],
            gSlideTrainerInCoords[monShowData->battlerType][1],
            ov07_022377F4[monShowData->battlerType][2],
            monShowData->yOffset,
            monShowData->height,
            monShowData->shadowXOffset,
            monShowData->shadowSize,
            monShowData->battler,
            &animScript[0],
            NULL);

        Pokepic_SetAttr(monShowData->opponentData->pokepic, 12, (1 << 8));
        Pokepic_SetAttr(monShowData->opponentData->pokepic, 13, (1 << 8));
        Pokepic_SetAttr(monShowData->opponentData->pokepic, 0x2C, FALSE);
        Pokepic_SetAttr(monShowData->opponentData->pokepic, 6, FALSE);

        monShowData->state++;

        break;
    case 1: {
        MoveAnimation moveAnim;

        BattleController_SetMoveAnimation(monShowData->battleSys, NULL, &moveAnim, 1, 41, monShowData->battler, monShowData->battler, NULL);
        BattleDisplay_PlayMoveAnimation(monShowData->battleSys, monShowData->opponentData, battleAnimSys, &moveAnim);

        monShowData->state++;
    } break;
    case 3:
        if (monShowData->face == 2) {
            Pokepic_SetAttr(monShowData->opponentData->pokepic, 0x2D, 0);
        }

        ov12_02261F38(monShowData->battleSys, monShowData->battler, monShowData->battlerType, monShowData->opponentData->pokepic, monShowData->opponentData->narc, monShowData->species, monShowData->formNum, monShowData->face, monShowData->cryMod);

        monShowData->state = 4;

        break;
    case 4: {
        if (sub_02017068(ov12_0223B750(monShowData->battleSys), monShowData->battler) == 1) {
            if (Pokepic_IsAnimFinished(monShowData->opponentData->pokepic) == FALSE) {
                if (monShowData->isShiny) {
                    MoveAnimation moveAnim;

                    BattleController_SetMoveAnimation(monShowData->battleSys, NULL, &moveAnim, 1, 11, monShowData->battler, monShowData->battler, NULL);
                    BattleDisplay_PlayMoveAnimation(monShowData->battleSys, monShowData->opponentData, battleAnimSys, &moveAnim);
                    monShowData->state = 5;
                } else {
                    monShowData->state = 6;
                }
            }
        }
    } break;
    case 2:
    case 5:
    case 7:
    case 9:
        ov07_0221C394(battleAnimSys);
        if (BattleAnimSystem_IsMoveActive(battleAnimSys) == FALSE) {
            BattleAnimSystem_FreeScriptData(battleAnimSys);
            monShowData->state++;
        }
        break;
    case 6: {
        if (monShowData->isSubstitute) {
            MoveAnimation moveAnim;

            BattleController_SetMoveAnimation(monShowData->battleSys, NULL, &moveAnim, 1, 15, monShowData->battler, monShowData->battler, NULL);
            BattleDisplay_PlayMoveAnimation(monShowData->battleSys, monShowData->opponentData, battleAnimSys, &moveAnim);
            monShowData->state++;
            break;
        }
        monShowData->state = 0xFF;
    } break;
    case 8: {
        BattlerSpriteContext battlerSpriteCtx;
        MoveAnimation moveAnim;

        BattleDisplay_PopulateBattlerContext(monShowData->battleSys, &monShowData->moveAnim, &battlerSpriteCtx, monShowData->battler);
        ov07_02234A20(&battlerSpriteCtx, HEAP_ID_BATTLE);
        BattleController_SetMoveAnimation(monShowData->battleSys, NULL, &moveAnim, 1, 16, monShowData->battler, monShowData->battler, NULL);
        BattleDisplay_PlayMoveAnimation(monShowData->battleSys, monShowData->opponentData, battleAnimSys, &moveAnim);

        monShowData->opponentData->unk1A0 = 1;
        monShowData->state++;
    } break;
    default:
        BattleController_EmitClearCommand(monShowData->battleSys, monShowData->battler, monShowData->command);
        Heap_Free(data);
        SysTask_Destroy(task);
        break;
    }
}

extern int ov12_0226D128[6];

static void BattleDisplayTask_ReturnPokemon(SysTask *task, void *data) {
    MonReturnData *monReturnData = data;
    BattleAnimSystem *battleAnimSys = BattleSystem_GetAnimationSystem(monReturnData->battleSys);

    switch (monReturnData->state) {
    case 0:
        if (monReturnData->isSubstitute) {
            MoveAnimation moveAnim;

            BattleController_SetMoveAnimation(monReturnData->battleSys, NULL, &moveAnim, 1, 15, monReturnData->battler, monReturnData->battler, NULL);
            BattleDisplay_PlayMoveAnimation(monReturnData->battleSys, monReturnData->opponentData, battleAnimSys, &moveAnim);
            monReturnData->state++;
        } else {
            monReturnData->state = 4;
        }
        break;
    case 2:
        BattlerSpriteContext battlerSpriteCtx;
        MoveAnimation moveAnim;

        BattleDisplay_PopulateBattlerContext(monReturnData->battleSys, &monReturnData->moveAnim, &battlerSpriteCtx, monReturnData->battler);
        ov07_0223494C(&battlerSpriteCtx, HEAP_ID_BATTLE);
        BattleController_SetMoveAnimation(monReturnData->battleSys, NULL, &moveAnim, 1, 16, monReturnData->battler, monReturnData->battler, NULL);
        BattleDisplay_PlayMoveAnimation(monReturnData->battleSys, monReturnData->opponentData, battleAnimSys, &moveAnim);
        monReturnData->opponentData->unk1A0 = 0;
        monReturnData->state++;
        break;
    case 1:
    case 3:
        ov07_0221C394(battleAnimSys);

        if (BattleAnimSystem_IsMoveActive(battleAnimSys) == FALSE) {
            BattleAnimSystem_FreeScriptData(battleAnimSys);
            monReturnData->state++;
        }
        break;
    case 4:
        if (monReturnData->battlerType & 1) {
            BallThrow ballThrow;

            ballThrow.type = sBallThrowTypes[monReturnData->battlerType];
            ballThrow.heapID = HEAP_ID_BATTLE;
            ballThrow.mode = BALL_THROW_MODE_RECALL;
            ballThrow.target = monReturnData->battler;
            ballThrow.ballID = monReturnData->capturedBall;
            ballThrow.spriteSystem = BattleSystem_GetSpriteSystem(monReturnData->battleSys);
            ballThrow.paletteData = BattleSystem_GetPaletteData(monReturnData->battleSys);
            ballThrow.bgPrio = 1;
            ballThrow.surface = 0;
            monReturnData->ballRotation = ov07_02233DB8(&ballThrow);
        } else {
            BallThrow ballThrow;
            int ballThrowTypes[6];
            ballThrowTypes = ov12_0226D128;

            ballThrow.type = ballThrowTypes[monReturnData->battlerType];
            ballThrow.heapID = HEAP_ID_BATTLE;
            ballThrow.mode = BALL_THROW_MODE_RECALL;
            ballThrow.target = monReturnData->battler;
            ballThrow.ballID = monReturnData->capturedBall;
            ballThrow.spriteSystem = BattleSystem_GetSpriteSystem(monReturnData->battleSys);
            ballThrow.paletteData = BattleSystem_GetPaletteData(monReturnData->battleSys);
            ballThrow.bgPrio = 1;
            ballThrow.surface = 0;
            monReturnData->ballRotation = ov07_02233DB8(&ballThrow);
        }

        monReturnData->state = 5;
        Pokepic_StartPaletteFade(monReturnData->pokepic, 0, 16, 0, ov12_0226D15A[monReturnData->capturedBall]);

        switch (monReturnData->battlerType) {
        case 0:
        case 2:
        case 4:
            Sound_PlayPannedEffect(SEQ_SE_DP_BOWA2, -0x75);
            break;
        case 1:
        case 3:
        case 5:
            Sound_PlayPannedEffect(SEQ_SE_DP_BOWA2, 0x75);
            break;
        }
        break;
    case 5:
        if (Pokepic_ResumePaletteFade(monReturnData->pokepic) == FALSE) {
            monReturnData->state++;
        }
        break;
    case 6:
        Pokepic_AddAttr(monReturnData->pokepic, 12, -0x20);
        Pokepic_AddAttr(monReturnData->pokepic, 13, -0x20);
        sub_0200914C(monReturnData->pokepic, monReturnData->yOffset);

        if (Pokepic_GetAttr(monReturnData->pokepic, 12) <= 0) {
            Pokepic_Delete(monReturnData->pokepic);

            if (monReturnData->battlerType & 1) {
                monReturnData->state = 7;
            } else {
                monReturnData->state = 7;
            }
        }

        break;
    case 7:
        if (ov07_02233E88(monReturnData->ballRotation) == 0) {
            ov07_02233ECC(monReturnData->ballRotation);
            monReturnData->state = 8;
        }
        break;
    case 8:
        BattleController_EmitClearCommand(monReturnData->battleSys, monReturnData->battler, monReturnData->command);
        Heap_Free(data);
        SysTask_Destroy(task);
        break;
    }
}

static void ov12_0225CC58(SysTask *task, void *data) {
    MonReturnData *monReturnData = data;
    BattleAnimSystem *battleAnimSys = BattleSystem_GetAnimationSystem(monReturnData->battleSys);

    switch (monReturnData->state) {
    case 0:
        if (monReturnData->isSubstitute) {
            MoveAnimation moveAnim;

            BattleController_SetMoveAnimation(monReturnData->battleSys, NULL, &moveAnim, 1, 15, monReturnData->battler, monReturnData->battler, NULL);
            BattleDisplay_PlayMoveAnimation(monReturnData->battleSys, monReturnData->opponentData, battleAnimSys, &moveAnim);
            monReturnData->state++;
        } else {
            monReturnData->state = 4;
        }
        break;
    case 2:
        BattlerSpriteContext battlerSpriteCtx;
        MoveAnimation moveAnim;

        BattleDisplay_PopulateBattlerContext(monReturnData->battleSys, &monReturnData->moveAnim, &battlerSpriteCtx, monReturnData->battler);
        ov07_0223494C(&battlerSpriteCtx, HEAP_ID_BATTLE);
        BattleController_SetMoveAnimation(monReturnData->battleSys, NULL, &moveAnim, 1, 16, monReturnData->battler, monReturnData->battler, NULL);
        BattleDisplay_PlayMoveAnimation(monReturnData->battleSys, monReturnData->opponentData, battleAnimSys, &moveAnim);
        monReturnData->opponentData->unk1A0 = 0;
        monReturnData->state++;
        break;
    case 1:
    case 3:
    case 5:
        ov07_0221C394(battleAnimSys);

        if (BattleAnimSystem_IsMoveActive(battleAnimSys) == FALSE) {
            BattleAnimSystem_FreeScriptData(battleAnimSys);
            monReturnData->state++;
        }
        break;
    case 4: {
        MoveAnimation moveAnim;

        BattleController_SetMoveAnimation(monReturnData->battleSys, NULL, &moveAnim, 1, 42, monReturnData->battler, monReturnData->battler, NULL);
        BattleDisplay_PlayMoveAnimation(monReturnData->battleSys, monReturnData->opponentData, battleAnimSys, &moveAnim);
        monReturnData->state++;
    } break;
    case 6:
        Pokepic_Delete(monReturnData->pokepic);
    case 7:
        BattleController_EmitClearCommand(monReturnData->battleSys, monReturnData->battler, monReturnData->command);
        Heap_Free(data);
        SysTask_Destroy(task);
        break;
    }
}

static void BattleDisplayTask_OpenCaptureBall(SysTask *task, void *data) {
    OpenCaptureBallData *captureOpenBallData = data;

    switch (captureOpenBallData->state) {
    case 0:
        Pokepic_AddAttr(captureOpenBallData->pokepic, 12, -0x20);
        Pokepic_AddAttr(captureOpenBallData->pokepic, 13, -0x20);

        if (captureOpenBallData->yOffset) {
            captureOpenBallData->yOffset--;
            Pokepic_AddAttr(captureOpenBallData->pokepic, 1, -1);
        }

        if (Pokepic_GetAttr(captureOpenBallData->pokepic, 12) <= 0) {
            Pokepic_Delete(captureOpenBallData->pokepic);
            captureOpenBallData->state++;
        }
        break;
    case 1:
        BattleController_EmitClearCommand(captureOpenBallData->battleSys, captureOpenBallData->battler, captureOpenBallData->command);
        Heap_Free(data);
        SysTask_Destroy(task);
        break;
    }
}

static void BattleDisplayTask_SetTrainerEncounter(SysTask *task, void *data) {
    TrainerEncounterData *trainerEncounterData = data;
    s16 x1, y1, x2, y2;
    u32 battleType = BattleSystem_GetBattleType(trainerEncounterData->battleSys);

    if (trainerEncounterData->enterFrameCount < 33 && trainerEncounterData->state >= 2
        && (trainerEncounterData->battlerType == BATTLER_TYPE_SOLO_PLAYER || trainerEncounterData->battlerType == BATTLER_TYPE_PLAYER_SIDE_SLOT_1)) {
        BgSetPosTextAndCommit(BattleSystem_GetBgConfig(trainerEncounterData->battleSys), 3, 1, 4);
        trainerEncounterData->enterFrameCount++;
    }

    switch (trainerEncounterData->state) {
    case 0:
        if (ManagedSprite_GetNumFrames(trainerEncounterData->managedSprite) > 2) {
            ManagedSprite_SetAnimationFrame(trainerEncounterData->managedSprite, 0);
            ManagedSprite_SetAnim(trainerEncounterData->managedSprite, 2);
        }

        trainerEncounterData->delay = 28;
        trainerEncounterData->state = 1;
    case 1:
        if (--trainerEncounterData->delay) {
            break;
        }

        trainerEncounterData->state = 2;
    case 2:
        ManagedSprite_GetPositionXY(trainerEncounterData->terrain->managedSprite, &x1, &y1);
        ManagedSprite_GetPositionXY(trainerEncounterData->managedSprite, &x2, &y2);

        if (trainerEncounterData->face == 2) {
            if (trainerEncounterData->battlerType == BATTLER_TYPE_SOLO_ENEMY || trainerEncounterData->battlerType == BATTLER_TYPE_ENEMY_SIDE_SLOT_1) {
                if (x1 < (24 * 8)) {
                    ManagedSprite_OffsetPositionXY(trainerEncounterData->terrain->managedSprite, 8, 0);
                } else {
                    ManagedSprite_SetPositionXY(trainerEncounterData->terrain->managedSprite, 24 * 8, 8 * 11);
                }
            }

            ManagedSprite_GetPositionXY(trainerEncounterData->terrain->managedSprite, &x1, &y1);

            if (trainerEncounterData->battlerType == BATTLER_TYPE_SOLO_ENEMY
                || (trainerEncounterData->battlerType == BATTLER_TYPE_ENEMY_SIDE_SLOT_1 && (battleType == (BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES) || battleType == (BATTLE_TYPE_TRAINER | BATTLE_TYPE_FRONTIER | BATTLE_TYPE_DOUBLES) || battleType == ((BATTLE_TYPE_LINK | BATTLE_TYPE_TRAINER) | BATTLE_TYPE_DOUBLES)))) {
                ManagedSprite_SetPositionXY(trainerEncounterData->managedSprite, x1, y2);
            } else if (trainerEncounterData->battlerType == BATTLER_TYPE_ENEMY_SIDE_SLOT_1) {
                x1 = x2 - x1;
                x1 -= 24;

                ManagedSprite_OffsetPositionXY(trainerEncounterData->managedSprite, -x1, 0);
            } else if (trainerEncounterData->battlerType == BATTLER_TYPE_ENEMY_SIDE_SLOT_2) {
                x1 = x1 - x2;
                x1 -= 16;

                ManagedSprite_OffsetPositionXY(trainerEncounterData->managedSprite, x1, 0);
            }

            ManagedSprite_GetPositionXY(trainerEncounterData->managedSprite, &x2, &y2);

            if (x2 >= trainerEncounterData->targetX) {
                ManagedSprite_SetPositionXY(trainerEncounterData->managedSprite, trainerEncounterData->targetX, y2);

                if (trainerEncounterData->battlerType == BATTLER_TYPE_SOLO_ENEMY || trainerEncounterData->battlerType == BATTLER_TYPE_ENEMY_SIDE_SLOT_1) {
                    ManagedSprite_SetPositionXY(trainerEncounterData->terrain->managedSprite, 24 * 8, 8 * 11);
                }

                if (ManagedSprite_GetNumFrames(trainerEncounterData->managedSprite) > 1) {
                    ManagedSprite_SetAnimationFrame(trainerEncounterData->managedSprite, 0);
                    ManagedSprite_SetAnim(trainerEncounterData->managedSprite, 1);
                    trainerEncounterData->ballFlashStarted = 0;
                    trainerEncounterData->state = 3;
                } else {
                    trainerEncounterData->state = 4;
                }
            }
        } else {
            if (trainerEncounterData->battlerType == BATTLER_TYPE_SOLO_PLAYER || trainerEncounterData->battlerType == BATTLER_TYPE_PLAYER_SIDE_SLOT_1) {
                if (x1 > 64) {
                    ManagedSprite_OffsetPositionXY(trainerEncounterData->terrain->managedSprite, -8, 0);
                } else {
                    ManagedSprite_SetPositionXY(trainerEncounterData->terrain->managedSprite, 64, 128 + 8);
                }
            }

            ManagedSprite_GetPositionXY(trainerEncounterData->terrain->managedSprite, &x1, &y1);

            if (trainerEncounterData->battlerType == BATTLER_TYPE_SOLO_PLAYER
                || (trainerEncounterData->battlerType == BATTLER_TYPE_PLAYER_SIDE_SLOT_1
                    && (battleType == (BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES) || battleType == (BATTLE_TYPE_TRAINER | BATTLE_TYPE_FRONTIER | BATTLE_TYPE_DOUBLES) || battleType == (BATTLE_TYPE_TRAINER | BATTLE_TYPE_TAG | BATTLE_TYPE_DOUBLES) || battleType == (BATTLE_TYPE_TRAINER | BATTLE_TYPE_LINK | BATTLE_TYPE_DOUBLES)))) {
                ManagedSprite_SetPositionXY(trainerEncounterData->managedSprite, x1, y2);
            } else if (trainerEncounterData->battlerType == BATTLER_TYPE_PLAYER_SIDE_SLOT_1) {
                x1 = x1 - x2;
                x1 -= 24;

                ManagedSprite_OffsetPositionXY(trainerEncounterData->managedSprite, x1, 0);
            } else if (trainerEncounterData->battlerType == BATTLER_TYPE_PLAYER_SIDE_SLOT_2) {
                x1 = x2 - x1;
                x1 -= 16;

                ManagedSprite_OffsetPositionXY(trainerEncounterData->managedSprite, -x1, 0);
            }

            ManagedSprite_GetPositionXY(trainerEncounterData->managedSprite, &x2, &y2);

            if (trainerEncounterData->pokepic != NULL) {
                Pokepic_SetAttr(trainerEncounterData->pokepic, 0, x2);
            }

            if (x2 <= trainerEncounterData->targetX) {
                if (trainerEncounterData->pokepic) {
                    Pokepic_Delete(trainerEncounterData->pokepic);
                }

                ManagedSprite_SetPositionXY(trainerEncounterData->managedSprite, trainerEncounterData->targetX, y2);

                if (trainerEncounterData->battlerType == BATTLER_TYPE_SOLO_PLAYER || trainerEncounterData->battlerType == BATTLER_TYPE_PLAYER_SIDE_SLOT_1) {
                    ManagedSprite_SetPositionXY(trainerEncounterData->terrain->managedSprite, 64, 128 + 8);
                }

                trainerEncounterData->state = 4;
            }
        }
        break;
    case 3:
        if (ManagedSprite_IsAnimated(trainerEncounterData->managedSprite) == TRUE) {
            if (ov12_02261DC8(trainerEncounterData, trainerEncounterData->managedSprite) == 0) {
                break;
            }
        }

        trainerEncounterData->state = 4;
    case 4:
        BattleController_EmitClearCommand(trainerEncounterData->battleSys, trainerEncounterData->battler, trainerEncounterData->command);
        Heap_Free(data);
        SysTask_Destroy(task);
        break;
    }
}

extern s16 ov12_0226D1E8[10][6][2];

static void BattleDisplayTask_ThrowTrainerBall(SysTask *task, void *data) {
    TrainerThrowBallData *trainerThrowBallData = data;
    s16 x, y;
    int animFrame;
    u32 battleType;

    battleType = BattleSystem_GetBattleType(trainerThrowBallData->battleSys);

    switch (trainerThrowBallData->state) {
    case 0:
        if (trainerThrowBallData->ballTypeIn == 0) {
            trainerThrowBallData->state = 1;
        } else {
            BallThrow ballThrow;

            switch (trainerThrowBallData->ballTypeIn) {
            default:
            case 1:
                ballThrow.type = 15;
                trainerThrowBallData->ballTargetState = 3;
                ballThrow.ballID = 5;
                break;
            case 2:
                ballThrow.type = 12;
                trainerThrowBallData->ballTargetState = 0;
                ballThrow.ballID = 0x401;
                break;
            case 3:
                ballThrow.type = 13;
                trainerThrowBallData->ballTargetState = 0;
                ballThrow.ballID = 0x402;
                break;
            case 4:
                ballThrow.type = 15;
                trainerThrowBallData->ballTargetState = 3;
                ballThrow.ballID = 0x400;
                break;
            }

            ballThrow.heapID = HEAP_ID_BATTLE;
            ballThrow.mode = BALL_THROW_MODE_TRAINER_SEND_OUT;
            ballThrow.target = trainerThrowBallData->battler;
            ballThrow.spriteSystem = BattleSystem_GetSpriteSystem(trainerThrowBallData->battleSys);
            ballThrow.paletteData = BattleSystem_GetPaletteData(trainerThrowBallData->battleSys);
            ballThrow.surface = 0;
            ballThrow.battleSystem = trainerThrowBallData->battleSys;

            trainerThrowBallData->opponentData->ballData = ov07_02233DB8(&ballThrow);

            ov07_022344C4(trainerThrowBallData->opponentData->ballData, 100);
            ov07_022344D0(trainerThrowBallData->opponentData->ballData, 2);
            ov07_022344C0(trainerThrowBallData->opponentData->ballData, 0);

            ManagedSprite_SetAnimationFrame(trainerThrowBallData->opponentData->managedSprite, 0);
            ManagedSprite_SetAnim(trainerThrowBallData->opponentData->managedSprite, 1);
            ManagedSprite_SetAnimateFlag(trainerThrowBallData->opponentData->managedSprite, TRUE);

            trainerThrowBallData->state = 3;
        }
        break;
    case 1:
        if (trainerThrowBallData->face == 2) {
            ManagedSprite_OffsetPositionXY(trainerThrowBallData->opponentData->managedSprite, 5, 0);
            ManagedSprite_GetPositionXY(trainerThrowBallData->opponentData->managedSprite, &x, &y);

            if (x >= (256 - 48) - 48 && ov07_02233F20(trainerThrowBallData->opponentData->ballData) != 0) {
                ov07_0223449C(trainerThrowBallData->opponentData->ballData, 1);
                ov07_02233EFC(trainerThrowBallData->opponentData->ballData, 0);

                if (battleType & BATTLE_TYPE_DOUBLES && (battleType & BATTLE_TYPE_MULTI) == 0) {
                    OpponentData *opponentData = BattleSystem_GetOpponentData(trainerThrowBallData->battleSys, BattleSystem_GetBattlerIdPartner(trainerThrowBallData->battleSys, trainerThrowBallData->battler));

                    ov07_0223449C(opponentData->ballData, 1);
                    ov07_02233EFC(opponentData->ballData, 0);
                    ov07_022344DC(opponentData->ballData, 12);
                }
            } else if (x >= (256 + 40)) {
                SpriteManager *spriteMan = BattleSystem_GetSpriteManager(trainerThrowBallData->battleSys);
                Sprite_DeleteAndFreeResources(trainerThrowBallData->opponentData->managedSprite);
                trainerThrowBallData->opponentData->managedSprite = NULL;

                SpriteManager_UnloadCharObjById(spriteMan, 20015 + trainerThrowBallData->opponentData->battlerType);
                SpriteManager_UnloadPlttObjById(spriteMan, 20010 + trainerThrowBallData->opponentData->battlerType);
                SpriteManager_UnloadCellObjById(spriteMan, 20007 + trainerThrowBallData->opponentData->battlerType);
                SpriteManager_UnloadAnimObjById(spriteMan, 20007 + trainerThrowBallData->opponentData->battlerType);
                trainerThrowBallData->state = 6;
            }
        } else {
            ManagedSprite_SetAnimationFrame(trainerThrowBallData->opponentData->managedSprite, 0);
            ManagedSprite_SetAnim(trainerThrowBallData->opponentData->managedSprite, 1);
            ManagedSprite_SetAnimateFlag(trainerThrowBallData->opponentData->managedSprite, TRUE);
            trainerThrowBallData->state = 2;
        }
        break;
    case 2:
        ManagedSprite_OffsetPositionXY(trainerThrowBallData->opponentData->managedSprite, -5, 0);
        ManagedSprite_GetPositionXY(trainerThrowBallData->opponentData->managedSprite, &x, &y);

        if (trainerThrowBallData->opponentData->ballData) {
            animFrame = ManagedSprite_GetAnimationFrame(trainerThrowBallData->opponentData->managedSprite);

            if (ov12_0226D1E8[trainerThrowBallData->backSpriteIdx][animFrame][0] != 0x7FFF) {
                ov07_0223449C(trainerThrowBallData->opponentData->ballData, 1);
                ov07_022344A8(trainerThrowBallData->opponentData->ballData, x + ov12_0226D1E8[trainerThrowBallData->backSpriteIdx][animFrame][0], y + ov12_0226D1E8[trainerThrowBallData->backSpriteIdx][animFrame][1]);

                if (animFrame == 3 && ov07_02233F20(trainerThrowBallData->opponentData->ballData) != 0) {
                    ov07_02233EFC(trainerThrowBallData->opponentData->ballData, 0);
                    ov07_022344C0(trainerThrowBallData->opponentData->ballData, 1);

                    if (battleType & BATTLE_TYPE_DOUBLES && (battleType & BATTLE_TYPE_MULTI) == 0) {
                        OpponentData *opponentData = BattleSystem_GetOpponentData(trainerThrowBallData->battleSys, BattleSystem_GetBattlerIdPartner(trainerThrowBallData->battleSys, trainerThrowBallData->battler));

                        ov07_022344A8(opponentData->ballData, x + ov12_0226D1E8[trainerThrowBallData->backSpriteIdx][animFrame][0], y + ov12_0226D1E8[trainerThrowBallData->backSpriteIdx][animFrame][1]);
                        ov07_0223449C(opponentData->ballData, 1);
                        ov07_02233EFC(opponentData->ballData, 0);
                        ov07_022344C0(opponentData->ballData, 1);
                    }
                }
            }
        }

        if (x <= -40) {
            SpriteManager *spriteMan = BattleSystem_GetSpriteManager(trainerThrowBallData->battleSys);

            Sprite_DeleteAndFreeResources(trainerThrowBallData->opponentData->managedSprite);
            trainerThrowBallData->opponentData->managedSprite = NULL;

            SpriteManager_UnloadCharObjById(spriteMan, 20015 + trainerThrowBallData->opponentData->battlerType);
            SpriteManager_UnloadPlttObjById(spriteMan, 20010 + trainerThrowBallData->opponentData->battlerType);
            SpriteManager_UnloadCellObjById(spriteMan, 20007 + trainerThrowBallData->opponentData->battlerType);
            SpriteManager_UnloadAnimObjById(spriteMan, 20007 + trainerThrowBallData->opponentData->battlerType);
            trainerThrowBallData->state = 6;
        }
        break;
    case 3:
        ManagedSprite_GetPositionXY(trainerThrowBallData->opponentData->managedSprite, &x, &y);
        animFrame = ManagedSprite_GetAnimationFrame(trainerThrowBallData->opponentData->managedSprite);

        if (animFrame == 4) {
            trainerThrowBallData->delay = 8;
            trainerThrowBallData->state = 4;
        } else if (trainerThrowBallData->opponentData->ballData != NULL) {
            if (ov12_0226D1E8[trainerThrowBallData->backSpriteIdx][animFrame][0] != 0x7FFF) {
                ov07_022344A8(trainerThrowBallData->opponentData->ballData, x + ov12_0226D1E8[trainerThrowBallData->backSpriteIdx][animFrame][0], y + ov12_0226D1E8[trainerThrowBallData->backSpriteIdx][animFrame][1]);

                if (animFrame == 3 && ov07_02233F20(trainerThrowBallData->opponentData->ballData) != trainerThrowBallData->ballTargetState) {
                    ov07_02233EFC(trainerThrowBallData->opponentData->ballData, trainerThrowBallData->ballTargetState);
                    ov07_022344D0(trainerThrowBallData->opponentData->ballData, 1);
                    ov07_022344C0(trainerThrowBallData->opponentData->ballData, 1);

                    if (trainerThrowBallData->ballTargetState != 3) {
                        PlaySE(SEQ_SE_DP_THROW);
                    }
                }
            }
        }
        break;
    case 4:
        if (--trainerThrowBallData->delay == 0) {
            if (trainerThrowBallData->ballTargetState == 3) {
                trainerThrowBallData->state = 6;
            } else {
                trainerThrowBallData->state = 5;
            }
        }
        break;
    case 5:
        if (ov07_02233E88(trainerThrowBallData->opponentData->ballData) == 1) {
            break;
        }

        ov07_02233ECC(trainerThrowBallData->opponentData->ballData);

        trainerThrowBallData->opponentData->ballData = NULL;
        trainerThrowBallData->state = 6;
        break;
    case 6:
        BattleController_EmitClearCommand(trainerThrowBallData->battleSys, trainerThrowBallData->battler, trainerThrowBallData->command);
        Heap_Free(data);
        SysTask_Destroy(task);
        break;
    }
}

static void ov12_0225D644(SysTask *task, void *data) {
    TrainerThrowBallData *trainerThrowBallData = data;
    s16 x, y;
    int animFrame;
    u32 battleType;

    battleType = BattleSystem_GetBattleType(trainerThrowBallData->battleSys);

    switch (trainerThrowBallData->state) {
    case 0:
        if (trainerThrowBallData->face == 2) {
            ManagedSprite_OffsetPositionXY(trainerThrowBallData->opponentData->managedSprite, 5, 0);
            ManagedSprite_GetPositionXY(trainerThrowBallData->opponentData->managedSprite, &x, &y);
            if (x >= 296) {
                SpriteManager *spriteMan = BattleSystem_GetSpriteManager(trainerThrowBallData->battleSys);
                Sprite_DeleteAndFreeResources(trainerThrowBallData->opponentData->managedSprite);
                trainerThrowBallData->opponentData->managedSprite = NULL;

                SpriteManager_UnloadCharObjById(spriteMan, 20015 + trainerThrowBallData->opponentData->battlerType);
                SpriteManager_UnloadPlttObjById(spriteMan, 20010 + trainerThrowBallData->opponentData->battlerType);
                SpriteManager_UnloadCellObjById(spriteMan, 20007 + trainerThrowBallData->opponentData->battlerType);
                SpriteManager_UnloadAnimObjById(spriteMan, 20007 + trainerThrowBallData->opponentData->battlerType);
                trainerThrowBallData->state = 2;
            }
        } else {
            ManagedSprite_SetPriority(trainerThrowBallData->opponentData->managedSprite, 1);
            ManagedSprite_SetAnimationFrame(trainerThrowBallData->opponentData->managedSprite, 0);
            ManagedSprite_SetAnim(trainerThrowBallData->opponentData->managedSprite, 1);
            ManagedSprite_SetAnimateFlag(trainerThrowBallData->opponentData->managedSprite, TRUE);
            trainerThrowBallData->state = 1;
        }
        break;
    case 1:
        ManagedSprite_OffsetPositionXY(trainerThrowBallData->opponentData->managedSprite, -5, 0);
        ManagedSprite_GetPositionXY(trainerThrowBallData->opponentData->managedSprite, &x, &y);

        if (trainerThrowBallData->opponentData->ballData && (battleType & 2) && !(battleType & 8)) {
            animFrame = ManagedSprite_GetAnimationFrame(trainerThrowBallData->opponentData->managedSprite);

            if (ov12_0226D1E8[trainerThrowBallData->backSpriteIdx][animFrame][0] != 0x7FFF) {
                OpponentData *opponentData = BattleSystem_GetOpponentData(trainerThrowBallData->battleSys, BattleSystem_GetBattlerIdPartner(trainerThrowBallData->battleSys, trainerThrowBallData->battler));

                if (animFrame == 3 && ov07_02233F20(opponentData->ballData) != 0) {
                    ov07_022344A8(opponentData->ballData, x + ov12_0226D1E8[trainerThrowBallData->backSpriteIdx][animFrame][0], y + ov12_0226D1E8[trainerThrowBallData->backSpriteIdx][animFrame][1]);
                    ov07_0223449C(opponentData->ballData, 1);
                    ov07_02233EFC(opponentData->ballData, 0);
                    ov07_022344C0(opponentData->ballData, 1);
                    ov07_022344D0(opponentData->ballData, 1);
                }
            }
        }

        if (x <= -40) {
            SpriteManager *spriteMan = BattleSystem_GetSpriteManager(trainerThrowBallData->battleSys);

            Sprite_DeleteAndFreeResources(trainerThrowBallData->opponentData->managedSprite);
            trainerThrowBallData->opponentData->managedSprite = NULL;

            SpriteManager_UnloadCharObjById(spriteMan, 20015 + trainerThrowBallData->opponentData->battlerType);
            SpriteManager_UnloadPlttObjById(spriteMan, 20010 + trainerThrowBallData->opponentData->battlerType);
            SpriteManager_UnloadCellObjById(spriteMan, 20007 + trainerThrowBallData->opponentData->battlerType);
            SpriteManager_UnloadAnimObjById(spriteMan, 20007 + trainerThrowBallData->opponentData->battlerType);
            trainerThrowBallData->state = 2;
        }
        break;
    case 2:
        BattleController_EmitClearCommand(trainerThrowBallData->battleSys, trainerThrowBallData->battler, trainerThrowBallData->command);
        Heap_Free(data);
        SysTask_Destroy(task);
        break;
    }
}

static void BattleDisplayTask_SlideTrainerOut(SysTask *task, void *data) {
    SlideTrainerOutData *slideTrainerOutData = data;
    s16 x;
    s16 y;

    switch (slideTrainerOutData->state) {
    case 0:
        if (slideTrainerOutData->face == 2) {
            ManagedSprite_OffsetPositionXY(slideTrainerOutData->opponentData->managedSprite, 5, 0);
            ManagedSprite_GetPositionXY(slideTrainerOutData->opponentData->managedSprite, &x, &y);

            if (x >= (256 + 40)) {
                slideTrainerOutData->state++;
            }
        } else {
            ManagedSprite_OffsetPositionXY(slideTrainerOutData->opponentData->managedSprite, -5, 0);
            ManagedSprite_GetPositionXY(slideTrainerOutData->opponentData->managedSprite, &x, &y);

            if (x <= -40) {
                slideTrainerOutData->state++;
            }
        }
        break;
    case 1:
        SpriteManager *spriteMan = BattleSystem_GetSpriteManager(slideTrainerOutData->battleSys);
        Sprite_DeleteAndFreeResources(slideTrainerOutData->opponentData->managedSprite);
        slideTrainerOutData->opponentData->managedSprite = NULL;

        SpriteManager_UnloadCharObjById(spriteMan, 20015 + slideTrainerOutData->opponentData->battlerType);
        SpriteManager_UnloadPlttObjById(spriteMan, 20010 + slideTrainerOutData->opponentData->battlerType);
        SpriteManager_UnloadCellObjById(spriteMan, 20007 + slideTrainerOutData->opponentData->battlerType);
        SpriteManager_UnloadAnimObjById(spriteMan, 20007 + slideTrainerOutData->opponentData->battlerType);
        BattleController_EmitClearCommand(slideTrainerOutData->battleSys, slideTrainerOutData->battler, slideTrainerOutData->command);
        Heap_Free(data);
        SysTask_Destroy(task);
        break;
    }
}

static void BattleDisplayTask_SlideTrainerIn(SysTask *task, void *data) {
    SlideTrainerInData *slideTrainerInData = data;
    s16 x, y;

    switch (slideTrainerInData->state) {
    case 0:
        ManagedSprite_GetPositionXY(slideTrainerInData->managedSprite, &x, &y);

        if (slideTrainerInData->face == 0) {
            x += 5;

            if (x >= slideTrainerInData->x) {
                x = slideTrainerInData->x;
                slideTrainerInData->state++;
            }
        } else {
            x -= 5;

            if (x <= slideTrainerInData->x) {
                x = slideTrainerInData->x;
                slideTrainerInData->state++;
            }
        }

        ManagedSprite_SetPositionXY(slideTrainerInData->managedSprite, x, y);
        break;
    case 1:
        BattleController_EmitClearCommand(slideTrainerInData->battleSys, slideTrainerInData->battler, slideTrainerInData->command);
        Heap_Free(data);
        SysTask_Destroy(task);
        break;
    }
}

enum SlideHealthBoxInState {
    SLIDE_HEALTHBOX_IN_STATE_ENABLE = 0,
    SLIDE_HEALTHBOX_IN_STATE_WAIT,
    SLIDE_HEALTHBOX_IN_STATE_DONE,
};

static void BattleDisplayTask_SlideHealthBoxIn(SysTask *task, void *data) {
    BattleHpBar *hpBar = data;

    switch (hpBar->script) {
    case SLIDE_HEALTHBOX_IN_STATE_ENABLE:
        if (hpBar->unk4D > 0) {
            hpBar->unk4D--;
            break;
        }

        ov12_02264FB0(hpBar, 0);
        BattleHpBar_SetEnabled(hpBar, TRUE);
        hpBar->script++;
        break;

    case SLIDE_HEALTHBOX_IN_STATE_WAIT:
        if (hpBar->unk_4F_1 == TRUE) {
            hpBar->script++;
        }
        break;

    default:
        BattleController_EmitClearCommand(hpBar->battleSystem, hpBar->battlerId, hpBar->unk4C);
        hpBar->unk10 = NULL;
        SysTask_Destroy(task);
        break;
    }
}

enum SlideHealthBoxOutState {
    SLIDE_HEALTHBOX_OUT_STATE_WAIT = 0,
    SLIDE_HEALTHBOX_OUT_STATE_DONE,
};

static void BattleDisplayTask_SlideHealthBoxOut(SysTask *task, void *data) {
    BattleHpBar *hpBar = data;

    switch (hpBar->script) {
    case SLIDE_HEALTHBOX_OUT_STATE_WAIT:
        if (hpBar->unk_4F_1 == TRUE) {
            hpBar->script++;
        }
        break;

    default:
        BattleController_EmitClearCommand(hpBar->battleSystem, hpBar->battlerId, hpBar->unk4C);
        hpBar->unk10 = NULL;
        SysTask_Destroy(task);
        BattleHpBar_SetEnabled(hpBar, FALSE);
        break;
    }
}

static void BattleDisplayTask_PlayerSetCommandSelection(SysTask *task, void *data) {
    CommandSetData *commandSetData = data;
    BgConfig *bgConfig = BattleSystem_GetBgConfig(commandSetData->battleSys);
    BattleInput *btlSubscreen = BattleSystem_GetBattleInput(commandSetData->battleSys);
    OpponentData *opponentData = BattleSystem_GetOpponentData(commandSetData->battleSys, commandSetData->battler);
    u32 battleType = BattleSystem_GetBattleType(commandSetData->battleSys);
    int partner = BattleSystem_GetBattlerIdPartner(commandSetData->battleSys, commandSetData->battler);
    BattleHpBar *hpBar;

    if (partner != commandSetData->battler) {
        hpBar = BattleSystem_GetHpBar(commandSetData->battleSys, partner);
    } else {
        hpBar = NULL;
    }

    switch (commandSetData->state) {
    case 0:
        MoveDisplayInfo moveDisplayInfo;
        int i;

        for (i = 0; i < 4; i++) {
            moveDisplayInfo.move[i] = commandSetData->moves[i];
            moveDisplayInfo.curPP[i] = commandSetData->curPP[i];
            moveDisplayInfo.maxPP[i] = commandSetData->maxPP[i];
        }

        BattleInput_LoadFightMenuText(BattleSystem_GetBattleInput(commandSetData->battleSys), commandSetData->battlerType, &moveDisplayInfo);
        commandSetData->state++;

    case 1: {
        MsgData *msgLoader = BattleSystem_GetMessageLoader(commandSetData->battleSys);
        BattleMessage battleMsg;

        if (battleType & BATTLE_TYPE_TUTORIAL) {
            switch (ov12_0223BB04(commandSetData->battleSys)) {
            case FALSE:
                battleMsg.tag = TAG_NICKNAME;
                battleMsg.param[0] = commandSetData->battler | (commandSetData->partySlot << 8);
                // What will {MON} do?
                battleMsg.id = msg_0197_what_will_mon_do;
                BattleSystem_PrintBattleMessage(commandSetData->battleSys, msgLoader, &battleMsg, 0);
                commandSetData->state = 3;
                break;
            case TRUE:
                battleMsg.tag = TAG_NONE;
                battleMsg.id = msg_0197_tutorial_low_hp_lyra + BattleSystem_GetTrainerGender(commandSetData->battleSys, 0);
                commandSetData->msgIdx = BattleSystem_PrintBattleMessage(commandSetData->battleSys, msgLoader, &battleMsg, BattleSystem_GetTextFrameDelay(commandSetData->battleSys));
                commandSetData->state = 2;
                break;
            }
        } else {
            if (battleType & BATTLE_TYPE_SAFARI) {
                battleMsg.tag = TAG_TRNAME;
                battleMsg.param[0] = BattleSystem_GetTrainerIndex(commandSetData->battleSys, commandSetData->battler);
                // What will {TRAINER} throw?
                battleMsg.id = msg_0197_what_will_trainer_throw;
            } else if (battleType & BATTLE_TYPE_PAL_PARK) {
                battleMsg.tag = TAG_TRNAME;
                battleMsg.param[0] = BattleSystem_GetTrainerIndex(commandSetData->battleSys, commandSetData->battler);
                // What will {TRAINER} do?
                battleMsg.id = msg_0197_what_will_trainer_do;
            } else {
                battleMsg.tag = TAG_NICKNAME;
                battleMsg.param[0] = commandSetData->battler | (commandSetData->partySlot << 8);
                // What will {MON} do?
                battleMsg.id = msg_0197_what_will_mon_do;
            }

            BattleSystem_PrintBattleMessage(commandSetData->battleSys, msgLoader, &battleMsg, 0);
            commandSetData->state = 3;
        }
    } break;
    case 2:
        if (TextPrinterCheckActive(commandSetData->msgIdx) == FALSE) {
            commandSetData->state = 3;
        }
        break;
    case 3:
        ov12_02264E84(commandSetData->hpBar);
        ov12_02261FD4(opponentData, commandSetData->battleSys);
        commandSetData->state = 4;
    case 4:
        if (BattleInput_CheckFeedbackDone(btlSubscreen) == 0) {
            break;
        }

        ActionSelectData actionData;

        NARC *bgNarc = NARC_New(NARC_a_0_0_7, HEAP_ID_BATTLE);
        NARC *objNarc = NARC_New(NARC_a_0_0_8, HEAP_ID_BATTLE);

        actionData.battler = commandSetData->battler;
        actionData.battlerType = commandSetData->battlerType;
        actionData.partySlot = commandSetData->partySlot;
        actionData.curHp = commandSetData->curHP;
        actionData.maxHp = commandSetData->maxHP;
        actionData.ballStatusBattler = commandSetData->ballStatusBattler;
        actionData.isWaitingForPartner = ov12_0223B580(commandSetData->battleSys, commandSetData->battler, commandSetData->switchingOrCanPickCommandMask);

        if (opponentData->unk197) {
            BattleInput_Deadstriped_022698AC(btlSubscreen, 1);

            if (BattleSystem_GetBattleSpecial(commandSetData->battleSys) & BATTLE_SPECIAL_FIRST_RIVAL) {
                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 6, 0, &actionData);
            } else if (BattleSystem_GetBattleType(commandSetData->battleSys) & BATTLE_TYPE_PAL_PARK) {
                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 10, 0, &actionData);
            } else if (BattleSystem_GetBattleType(commandSetData->battleSys) & BATTLE_TYPE_SAFARI) {
                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 8, 0, &actionData);
            } else if (BattleSystem_GetBattleType(commandSetData->battleSys) & BATTLE_TYPE_BUG_CONTEST) {
                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 20, 0, &actionData);
            } else if (actionData.battlerType == BATTLER_TYPE_PLAYER_SIDE_SLOT_2 && (BattleSystem_GetBattleType(commandSetData->battleSys) & BATTLE_TYPE_MULTI) == FALSE) {
                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 4, 0, &actionData);
            } else {
                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 3, 0, &actionData);
            }

            ov12_0223BB64(commandSetData->battleSys, 1);
        } else {
            if (BattleSystem_GetBattleSpecial(commandSetData->battleSys) & BATTLE_SPECIAL_FIRST_RIVAL) {
                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 5, 0, &actionData);
            } else if (BattleSystem_GetBattleType(commandSetData->battleSys) & BATTLE_TYPE_PAL_PARK) {
                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 9, 0, &actionData);
            } else if (BattleSystem_GetBattleType(commandSetData->battleSys) & BATTLE_TYPE_SAFARI) {
                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 7, 0, &actionData);
            } else if (BattleSystem_GetBattleType(commandSetData->battleSys) & BATTLE_TYPE_BUG_CONTEST) {
                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 19, 0, &actionData);
            } else if (actionData.battlerType != BATTLER_TYPE_PLAYER_SIDE_SLOT_2) {
                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 1, 0, &actionData);
            } else {
                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 2, 0, &actionData);
            }

            opponentData->unk197 = 1;
        }

        BattleInput_SetPartyExpPercents(btlSubscreen, commandSetData->expPercents);
        BattleInput_UpdateBallGaugeAnimation(btlSubscreen, commandSetData->ballStatus[0], commandSetData->ballStatus[1]);
        BattleInput_EnableBallGauge(btlSubscreen);
        NARC_Delete(bgNarc);
        NARC_Delete(objNarc);

        if (hpBar != NULL) {
            ov12_02265D70(hpBar);
        }

        commandSetData->state = 5;
        break;
    case 5:
        if (gSystem.newKeys & PAD_BUTTON_START) {
            OpponentData *opponentData;

            for (int i = 0; i < BattleSystem_GetMaxBattlers(commandSetData->battleSys); i++) {
                opponentData = BattleSystem_GetOpponentData(commandSetData->battleSys, i);
                ov12_02264C84(&opponentData->hpBar);
            }
        }

        commandSetData->input = BattleInput_CheckTouch(btlSubscreen);

        if (commandSetData->input != 0xFFFFFFFF) {
            commandSetData->unused_0B = 10; // set but never used
            PlaySE(SEQ_SE_DP_DECIDE);
            commandSetData->state = 6;
        }
        break;
    case 6:
        if (BattleInput_CheckFeedbackDone(btlSubscreen) == 1 || commandSetData->input == 1) {
            switch (commandSetData->input) {
            case 1: // Fight
                if (BattleSystem_GetBattleType(commandSetData->battleSys) & (BATTLE_TYPE_SAFARI | BATTLE_TYPE_PAL_PARK)) {
                    commandSetData->state = 7;
                }
                break;
            case 2: { // Bag
                NARC *bgNarc = NARC_New(NARC_a_0_0_7, HEAP_ID_BATTLE);
                NARC *objNarc = NARC_New(NARC_a_0_0_8, HEAP_ID_BATTLE);

                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 0, 0, NULL);
                BattleInput_Deadstriped_022698AC(btlSubscreen, 0);
                ov12_02265D74(hpBar);
                ov12_02264EB4(commandSetData->hpBar);
                ov12_02262014(opponentData);
                NARC_Delete(bgNarc);
                NARC_Delete(objNarc);
            } break;
            case 3: { // Pokemon
                NARC *bgNarc = NARC_New(NARC_a_0_0_7, HEAP_ID_BATTLE);
                NARC *objNarc = NARC_New(NARC_a_0_0_8, HEAP_ID_BATTLE);

                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 0, 0, NULL);
                BattleInput_Deadstriped_022698AC(btlSubscreen, 0);
                ov12_02265D74(hpBar);
                ov12_02264EB4(commandSetData->hpBar);
                ov12_02262014(opponentData);
                NARC_Delete(bgNarc);
                NARC_Delete(objNarc);
            } break;
            case 4: { // Run
                NARC *bgNarc = NARC_New(NARC_a_0_0_7, HEAP_ID_BATTLE);
                NARC *objNarc = NARC_New(NARC_a_0_0_8, HEAP_ID_BATTLE);

                if (BattleInput_GetCancelRunFlag(btlSubscreen) == 1) {
                    ov12_02265D74(hpBar);
                    commandSetData->input = 0xFF;
                }

                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 0, 0, NULL);
                NARC_Delete(bgNarc);
                NARC_Delete(objNarc);
            } break;
            default:
                GF_ASSERT(FALSE);
                break;
            }

            commandSetData->state = 8;
        }
        break;
    case 7:
        if (BattleInput_CheckFeedbackDone(btlSubscreen) == 1) {
            NARC *bgNarc = NARC_New(NARC_a_0_0_7, HEAP_ID_BATTLE);
            NARC *objNarc = NARC_New(NARC_a_0_0_8, HEAP_ID_BATTLE);

            BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 0, 0, NULL);
            BattleInput_Deadstriped_022698AC(btlSubscreen, 0);
            ov12_02265D74(hpBar);
            ov12_02264EB4(commandSetData->hpBar);
            ov12_02262014(opponentData);
            BattleInput_DisableBallGauge(btlSubscreen);

            commandSetData->state = 8;

            NARC_Delete(bgNarc);
            NARC_Delete(objNarc);
        }
        break;
    case 8:
        if (ov12_022698B0(btlSubscreen) == 1) {
            BattleController_EmitSelectedCommand(commandSetData->battleSys, commandSetData->battler, commandSetData->input);
            BattleController_EmitClearCommand(commandSetData->battleSys, commandSetData->battler, commandSetData->command);
            Heap_Free(data);
            SysTask_Destroy(task);
        }
        break;
    }
}

static void BattleDisplayTask_TrainerSetCommandSelection(SysTask *task, void *data) {
    CommandSetData *commandSetData = data;
    int command = ov10_022205BC(commandSetData->battleSys, commandSetData->battler);

    BattleController_EmitSelectedCommand(commandSetData->battleSys, commandSetData->battler, command);
    BattleController_EmitClearCommand(commandSetData->battleSys, commandSetData->battler, commandSetData->command);

    Heap_Free(data);
    SysTask_Destroy(task);
}

static void BattleDisplayTask_LinkSetCommandSelection(SysTask *task, void *data) {
    CommandSetData *commandSetData = data;

    BattleController_EmitClearCommand(commandSetData->battleSys, commandSetData->battler, commandSetData->command);
    Heap_Free(data);
    SysTask_Destroy(task);
}

extern u8 ov12_0226D140[13][2];

static void BattleDisplayTask_SafariPokemonSetCommandSelection(SysTask *task, void *data) {
    CommandSetData *commandSetData = data;
    u8 escapeCount = ov12_0223B694(commandSetData->battleSys);
    u16 species = BattleMon_Get(BattleSystem_GetBattleContext(commandSetData->battleSys), commandSetData->battler, BMON_DATA_SPECIES, NULL);
    int fleeRate = GetMonBaseStat(species, BASE_GREAT_MARSH_RATE);
    fleeRate = fleeRate * ov12_0226D140[escapeCount][0] / ov12_0226D140[escapeCount][1];

    if (BattleSystem_Random(commandSetData->battleSys) % 255 <= fleeRate) {
        BattleController_EmitSelectedCommand(commandSetData->battleSys, commandSetData->battler, 4);
    } else {
        BattleController_EmitSelectedCommand(commandSetData->battleSys, commandSetData->battler, 5);
    }

    BattleController_EmitClearCommand(commandSetData->battleSys, commandSetData->battler, commandSetData->command);

    Heap_Free(data);
    SysTask_Destroy(task);
}

static void BattleDisplayTask_PalParkPokemonSetCommandSelection(SysTask *task, void *data) {
    CommandSetData *commandSetData = data;

    BattleController_EmitSelectedCommand(commandSetData->battleSys, commandSetData->battler, 4);
    BattleController_EmitClearCommand(commandSetData->battleSys, commandSetData->battler, commandSetData->command);

    Heap_Free(data);
    SysTask_Destroy(task);
}

static void BattleDisplayTask_RecordingSetCommandSelection(SysTask *task, void *data) {
    CommandSetData *commandSetData = data;
    u8 v1;

    if (BattleSystem_ReadNextRecordedInput(commandSetData->battleSys, commandSetData->battler, &v1) == 1) {
        BattleDisplay_StopPlaybackAlt(commandSetData->battleSys);
    }

    if (!v1 || v1 > 4 || v1 == 2) {
        BattleDisplay_StopPlayback(commandSetData->battleSys);
    }

    BattleController_EmitSelectedCommand(commandSetData->battleSys, commandSetData->battler, v1);
    BattleController_EmitClearCommand(commandSetData->battleSys, commandSetData->battler, commandSetData->command);

    Heap_Free(data);
    SysTask_Destroy(task);
}

static void BattleDisplayTask_PlayerShowMoveSelectMenu(SysTask *task, void *data) {
    MoveSelectMenuData *moveSelectMenuData = data;
    BgConfig *bgConfig = BattleSystem_GetBgConfig(moveSelectMenuData->battleSys);
    BattleHpBar *hpBar;

    BattleInput *btlSubscreen = BattleSystem_GetBattleInput(moveSelectMenuData->battleSys);
    OpponentData *opponentData = BattleSystem_GetOpponentData(moveSelectMenuData->battleSys, moveSelectMenuData->battler);
    int partner = BattleSystem_GetBattlerIdPartner(moveSelectMenuData->battleSys, moveSelectMenuData->battler);

    if (partner != moveSelectMenuData->battler) {
        hpBar = BattleSystem_GetHpBar(moveSelectMenuData->battleSys, partner);
    } else {
        hpBar = NULL;
    }

    switch (moveSelectMenuData->state) {
    case 0:
        if (BattleInput_CheckFeedbackDone(btlSubscreen) == 0) {
            break;
        }

        MsgData *msgLoader = BattleSystem_GetMessageLoader(moveSelectMenuData->battleSys);
        BattleMessage battleMsg;

        battleMsg.tag = TAG_NICKNAME;
        battleMsg.param[0] = moveSelectMenuData->battler | (moveSelectMenuData->partySlot << 8);
        // What will {MON} do?
        battleMsg.id = msg_0197_what_will_mon_do;

        BattleSystem_PrintBattleMessage(moveSelectMenuData->battleSys, msgLoader, &battleMsg, 0);

        BattleInput_EnableBallGauge(btlSubscreen);

        MoveSelectData moveSelectData;
        NARC *bgNarc = NARC_New(NARC_a_0_0_7, HEAP_ID_BATTLE);
        NARC *objNarc = NARC_New(NARC_a_0_0_8, HEAP_ID_BATTLE);

        for (int i = 0; i < MAX_MON_MOVES; i++) {
            moveSelectData.moveIDs[i] = moveSelectMenuData->moves[i];
            moveSelectData.currPP[i] = moveSelectMenuData->ppCur[i];
            moveSelectData.maxPP[i] = moveSelectMenuData->ppMax[i];
        }

        moveSelectData.battlerType = moveSelectMenuData->battlerType;

        BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 11, 0, &moveSelectData);
        NARC_Delete(bgNarc);
        NARC_Delete(objNarc);
        moveSelectMenuData->state++;
        break;
    case 1:
        moveSelectMenuData->input = BattleInput_CheckTouch(btlSubscreen);

        if (moveSelectMenuData->input != 0xFFFFFFFF) {
            PlaySE(SEQ_SE_DP_DECIDE);
            moveSelectMenuData->state++;
        }
        break;
    case 2:
        if (moveSelectMenuData->input != 0xFF) {
            if ((BattleSystem_GetBattleType(moveSelectMenuData->battleSys) & BATTLE_TYPE_DOUBLES) == FALSE) {
                BattleInput_Deadstriped_022698AC(btlSubscreen, 0);
                ov12_02265D74(hpBar);
                ov12_02264EB4(moveSelectMenuData->hpBar);
                ov12_02262014(opponentData);
            }
            BattleInput_DisableBallGauge(btlSubscreen);
        }

        BattleController_EmitSelectedMove(moveSelectMenuData->battleSys, moveSelectMenuData->battler, moveSelectMenuData->input);
        moveSelectMenuData->state++;
        break;
    case 3:
        moveSelectMenuData->state++;
    default:
        if (ov12_022698B0(btlSubscreen) == 1) {
            ov12_0223BB10(moveSelectMenuData->battleSys, TRUE);
            BattleController_EmitClearCommand(moveSelectMenuData->battleSys, moveSelectMenuData->battler, moveSelectMenuData->command);
            Heap_Free(data);
            SysTask_Destroy(task);
        }
        break;
    }
}

static void BattleDisplayTask_TrainerShowMoveSelectMenu(SysTask *task, void *data) {
    MoveSelectMenuData *moveSelectMenuData = data;
    int action;
    u32 battleType = BattleSystem_GetBattleType(moveSelectMenuData->battleSys);
    BattleContext *battleCtx = BattleSystem_GetBattleContext(moveSelectMenuData->battleSys);

    if ((battleType & (BATTLE_TYPE_TRAINER | BATTLE_TYPE_ROAMER))
        || (BattleSystem_GetBattleSpecial(moveSelectMenuData->battleSys) & BATTLE_SPECIAL_FIRST_RIVAL)
        || BattleSystem_GetFieldSide(moveSelectMenuData->battleSys, moveSelectMenuData->battler) == 0) {
        action = ov10_0221BEF4(moveSelectMenuData->battleSys, moveSelectMenuData->battler);

        switch (action) {
        case 0xFF:
            return;
            break;
        default:
            action++;
            break;
        }
    } else {
        int validMoves[4];
        int validMovesCount = 0;

        for (int i = 0; i < MAX_MON_MOVES; i++) {
            if ((moveSelectMenuData->invalidMoves & MaskOfFlagNo(i)) == FALSE) {
                validMoves[validMovesCount] = i + 1;
                validMovesCount++;
            }
        }

        action = validMoves[BattleSystem_Random(moveSelectMenuData->battleSys) % validMovesCount];

        ov12_022582B8(moveSelectMenuData->battleSys, battleCtx, 11, moveSelectMenuData->battler, ov12_022506D4(moveSelectMenuData->battleSys, battleCtx, moveSelectMenuData->battler, moveSelectMenuData->moves[action - 1], 1, NULL));
    }

    BattleController_EmitSelectedMove(moveSelectMenuData->battleSys, moveSelectMenuData->battler, action);
    BattleController_EmitClearCommand(moveSelectMenuData->battleSys, moveSelectMenuData->battler, moveSelectMenuData->command);

    Heap_Free(data);
    SysTask_Destroy(task);
}

static void BattleDisplayTask_LinkShowMoveSelectMenu(SysTask *task, void *data) {
    MoveSelectMenuData *moveSelectMenuData = data;

    BattleController_EmitClearCommand(moveSelectMenuData->battleSys, moveSelectMenuData->battler, moveSelectMenuData->command);
    Heap_Free(data);
    SysTask_Destroy(task);
}

static void BattleDisplayTask_RecordingShowMoveSelectMenu(SysTask *task, void *data) {
    MoveSelectMenuData *moveSelectMenuData = data;
    u8 moveSlot;

    if (BattleSystem_ReadNextRecordedInput(moveSelectMenuData->battleSys, moveSelectMenuData->battler, &moveSlot) == 1) {
        BattleDisplay_StopPlaybackAlt(moveSelectMenuData->battleSys);
    }

    if (!moveSlot || moveSlot > 4) {
        BattleDisplay_StopPlayback(moveSelectMenuData->battleSys);
    } else {
        u16 move = BattleMon_Get(BattleSystem_GetBattleContext(moveSelectMenuData->battleSys), moveSelectMenuData->battler, BMON_DATA_MOVE1 + (moveSlot - 1), NULL);

        if (!move || move > 0x1D3) {
            BattleDisplay_StopPlayback(moveSelectMenuData->battleSys);
        }
    }

    BattleController_EmitSelectedMove(moveSelectMenuData->battleSys, moveSelectMenuData->battler, moveSlot);
    BattleController_EmitClearCommand(moveSelectMenuData->battleSys, moveSelectMenuData->battler, moveSelectMenuData->command);

    Heap_Free(data);
    SysTask_Destroy(task);
}

static void BattleDisplayTask_PlayerShowTargetSelectMenu(SysTask *task, void *data) {
    TargetSelectMenuData *targetSelectMenuData = data;
    BgConfig *bgConfig = BattleSystem_GetBgConfig(targetSelectMenuData->battleSys);
    BattleHpBar *hpBar;
    OpponentData *opponentData = BattleSystem_GetOpponentData(targetSelectMenuData->battleSys, targetSelectMenuData->battler);
    BattleInput *btlSubscreen = BattleSystem_GetBattleInput(targetSelectMenuData->battleSys);
    int partner = BattleSystem_GetBattlerIdPartner(targetSelectMenuData->battleSys, targetSelectMenuData->battler);

    if (partner != targetSelectMenuData->battler) {
        hpBar = BattleSystem_GetHpBar(targetSelectMenuData->battleSys, partner);
    } else {
        hpBar = NULL;
    }

    switch (targetSelectMenuData->state) {
    case 0:
        if (BattleInput_CheckFeedbackDone(btlSubscreen) == 0) {
            break;
        }

        TargetSelectData targetSelectData;
        NARC *bgNarc = NARC_New(NARC_a_0_0_7, HEAP_ID_BATTLE);
        NARC *objNarc = NARC_New(NARC_a_0_0_8, HEAP_ID_BATTLE);

        for (int i = 0; i < BATTLER_MAX; i++) {
            targetSelectData.targetMonData[i] = targetSelectMenuData->targetMon[i];
        }

        targetSelectData.battlerType = targetSelectMenuData->battlerType;
        targetSelectData.targetingLayout = ov12_02266C84(targetSelectMenuData->range, targetSelectMenuData->battlerType);

        BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 12, 0, &targetSelectData);
        NARC_Delete(bgNarc);
        NARC_Delete(objNarc);

        targetSelectMenuData->state++;
        break;
    case 1:
        targetSelectMenuData->input = BattleInput_CheckTouch(btlSubscreen);

        if (targetSelectMenuData->input != 0xFFFFFFFF) {
            PlaySE(SEQ_SE_DP_DECIDE);
            targetSelectMenuData->state++;
        }
        break;
    case 2:
        if (targetSelectMenuData->input != 0xFF) {
            ov12_02264EB4(targetSelectMenuData->hpBar);
            ov12_02262014(opponentData);
            ov12_02265D74(hpBar);

            if (targetSelectMenuData->shouldHidePanel == 1) {
                BattleInput_Deadstriped_022698AC(btlSubscreen, 0);
            }
        }

        targetSelectMenuData->state++;
        break;
    case 3:
        targetSelectMenuData->state++;
    default:
        if (ov12_022698B0(btlSubscreen) == 1) {
            u8 v10[6];
            int input = targetSelectMenuData->input;
            u32 battleType = BattleSystem_GetBattleType(targetSelectMenuData->battleSys);

            if (input != 0xFF) {
                ov12_0223C1A0(targetSelectMenuData->battleSys, &v10[0]);

                if (battleType & BATTLE_TYPE_DOUBLES) {
                    input = v10[2 + (targetSelectMenuData->input - 1)] + 1;
                } else {
                    input = v10[0 + (targetSelectMenuData->input - 1)] + 1;
                }
            }

            BattleController_EmitSelectedTarget(targetSelectMenuData->battleSys, targetSelectMenuData->battler, input);
            BattleController_EmitClearCommand(targetSelectMenuData->battleSys, targetSelectMenuData->battler, targetSelectMenuData->command);
            Heap_Free(data);
            SysTask_Destroy(task);
        }
        break;
    }
}

static void BattleDisplayTask_TrainerShowTargetSelectMenu(SysTask *task, void *data) {
    TargetSelectMenuData *targetSelectMenuData = data;
    BattleContext *battleCtx = BattleSystem_GetBattleContext(targetSelectMenuData->battleSys);
    int selectedTarget = ov12_022581D4(targetSelectMenuData->battleSys, battleCtx, 11, targetSelectMenuData->battler) + 1;

    GF_ASSERT(selectedTarget < 5);

    BattleController_EmitSelectedTarget(targetSelectMenuData->battleSys, targetSelectMenuData->battler, selectedTarget);
    BattleController_EmitClearCommand(targetSelectMenuData->battleSys, targetSelectMenuData->battler, targetSelectMenuData->command);

    Heap_Free(data);
    SysTask_Destroy(task);
}

static void BattleDisplayTask_LinkShowTargetSelectMenu(SysTask *task, void *data) {
    TargetSelectMenuData *targetSelectMenuData = data;

    BattleController_EmitClearCommand(targetSelectMenuData->battleSys, targetSelectMenuData->battler, targetSelectMenuData->command);

    Heap_Free(data);
    SysTask_Destroy(task);
}

static void BattleDisplayTask_RecordingShowTargetSelectMenu(SysTask *task, void *data) {
    TargetSelectMenuData *targetSelectMenuData = data;
    u8 v1;

    if (BattleSystem_ReadNextRecordedInput(targetSelectMenuData->battleSys, targetSelectMenuData->battler, &v1) == 1) {
        BattleDisplay_StopPlaybackAlt(targetSelectMenuData->battleSys);
    }

    if (!v1 || v1 > 4) {
        BattleDisplay_StopPlayback(targetSelectMenuData->battleSys);
    } else {
        int battler = v1 - 1;

        switch (targetSelectMenuData->range) {
        case 0x0:

            if (targetSelectMenuData->battler == battler) {
                BattleDisplay_StopPlayback(targetSelectMenuData->battleSys);
            }
            break;
        case 0x200:

            if (BattleSystem_GetFieldSide(targetSelectMenuData->battleSys, targetSelectMenuData->battler) != BattleSystem_GetFieldSide(targetSelectMenuData->battleSys, battler)) {
                BattleDisplay_StopPlayback(targetSelectMenuData->battleSys);
            }
            break;
        case 0x1:
        case 0x2:
        case 0x4:
        case 0x8:
        case 0x10:
        case 0x20:
        case 0x40:
        case 0x80:
        case 0x100:
        case 0x400:
            break;
        }
    }

    BattleController_EmitSelectedTarget(targetSelectMenuData->battleSys, targetSelectMenuData->battler, v1);
    BattleController_EmitClearCommand(targetSelectMenuData->battleSys, targetSelectMenuData->battler, targetSelectMenuData->command);

    Heap_Free(data);
    SysTask_Destroy(task);
}

static void BattleDisplayTask_PlayerShowBagMenu(SysTask *task, void *data) {
    BagMenuData *bagMenuData = data;
    PaletteData *paletteData = BattleSystem_GetPaletteData(bagMenuData->battleSys);

    switch (bagMenuData->state) {
    case 0:
        bagMenuData->isCursorEnabled = BattleInput_GetKeyPressed(BattleSystem_GetBattleInput(bagMenuData->battleSys));
        sub_0201649C(BattleSystem_GetMessageIcon(bagMenuData->battleSys), 1);
        PaletteData_BeginPaletteFade(paletteData, PLTTBUF_MAIN_BG_F | PLTTBUF_MAIN_OBJ_F, 0xC00, -8, 0, 7, 0);
        PaletteData_BeginPaletteFade(paletteData, PLTTBUF_SUB_BG_F | PLTTBUF_SUB_OBJ_F, 0xFFFF, -8, 0, 16, 0);
        bagMenuData->state++;
        break;
    case 1:
        if (PaletteData_GetSelectedBuffersBitmask(paletteData) == 0) {
            ov12_02237B0C(bagMenuData->battleSys);

            bagMenuData->battleBagCtx = Heap_Alloc(HEAP_ID_BATTLE, sizeof(BattleBagContext));
            memset(bagMenuData->battleBagCtx, 0, sizeof(BattleBagContext));

            bagMenuData->battleBagCtx->battleSys = bagMenuData->battleSys;
            bagMenuData->battleBagCtx->trainerInfo = BattleSystem_GetPlayerProfile(bagMenuData->battleSys, bagMenuData->battler);
            bagMenuData->battleBagCtx->heapID = HEAP_ID_BATTLE;
            bagMenuData->battleBagCtx->battleBagExited = FALSE;
            bagMenuData->battleBagCtx->bag = BattleSystem_GetBag(bagMenuData->battleSys);
            bagMenuData->battleBagCtx->battler = bagMenuData->battler;
            bagMenuData->battleBagCtx->isCursorEnabled = bagMenuData->isCursorEnabled;
            bagMenuData->battleBagCtx->hasTwoOpponents = bagMenuData->hasTwoOpponents;
            bagMenuData->battleBagCtx->opponentHidden = bagMenuData->semiInvulnerable;
            bagMenuData->battleBagCtx->opponentSubstituted = bagMenuData->substitute;
            bagMenuData->battleBagCtx->embargoRemainingTurns = bagMenuData->embargoTurns[bagMenuData->battler];
            ov08_022225D4(bagMenuData->battleBagCtx);
            bagMenuData->state = 3;
        }
        break;
    case 2:
        bagMenuData->battleBagCtx->isCursorEnabled = bagMenuData->isCursorEnabled;
        ov08_022225D4(bagMenuData->battleBagCtx);
        bagMenuData->state++;
    case 3:
        if (bagMenuData->battleBagCtx->battleBagExited) {
            bagMenuData->battleBagCtx->battleBagExited = 0;
            bagMenuData->isCursorEnabled = bagMenuData->battleBagCtx->isCursorEnabled;

            if (bagMenuData->battleBagCtx->selectedBattleBagItem) {
                switch (bagMenuData->battleBagCtx->selectedBattleBagPocket) {
                case 0:
                case 1:
                    bagMenuData->state = 4;
                    break;
                case 2:
                case 3:
                    bagMenuData->state = 6;
                    break;
                }
            } else {
                bagMenuData->state = 6;
            }
        }
        break;
    case 4:
        int battler;
        Party *party = BattleSystem_GetParty(bagMenuData->battleSys, bagMenuData->battler);
        Pokemon *mon;

        if (BattleSystem_GetBattleType(bagMenuData->battleSys) & BATTLE_TYPE_DOUBLES && (BattleSystem_GetBattleType(bagMenuData->battleSys) & BATTLE_TYPE_MULTI) == 0) {
            battler = bagMenuData->battler & 1;
        } else {
            battler = bagMenuData->battler;
        }

        Party_InitWithMaxSize(bagMenuData->partyMenuData->battlePartyCtx->party, 6);

        for (int i = 0; i < Party_GetCount(party); i++) {
            mon = BattleSystem_GetPartyMon(bagMenuData->battleSys, battler, bagMenuData->partyOrder[battler][i]);
            Party_AddMon(bagMenuData->partyMenuData->battlePartyCtx->party, mon);
            bagMenuData->partyMenuData->battlePartyCtx->pokemonPartySlots[i] = bagMenuData->partyOrder[battler][i];
        }

        bagMenuData->partyMenuData->battlePartyCtx->battleSys = bagMenuData->battleSys;
        bagMenuData->partyMenuData->battlePartyCtx->heapID = HEAP_ID_BATTLE;
        bagMenuData->partyMenuData->battlePartyCtx->selectedPartyIndex = 0;
        bagMenuData->partyMenuData->battlePartyCtx->battlePartyExited = 0;
        bagMenuData->partyMenuData->battlePartyCtx->moveToLearn = MOVE_NONE;
        bagMenuData->partyMenuData->battlePartyCtx->battlePartyMode = 2;
        bagMenuData->partyMenuData->battlePartyCtx->selectedBattleBagItem = bagMenuData->battleBagCtx->selectedBattleBagItem;
        bagMenuData->partyMenuData->battlePartyCtx->selectedBattleBagPocket = bagMenuData->battleBagCtx->selectedBattleBagPocket;
        bagMenuData->partyMenuData->battlePartyCtx->battler = bagMenuData->battleBagCtx->battler;
        bagMenuData->partyMenuData->battlePartyCtx->isCursorEnabled = bagMenuData->isCursorEnabled;
        bagMenuData->partyMenuData->battlePartyCtx->playerPokemonPartySlot = bagMenuData->partyMenuData->partySlots[bagMenuData->battler];
        bagMenuData->partyMenuData->battlePartyCtx->partnerPokemonPartySlot = bagMenuData->partyMenuData->partySlots[BattleSystem_GetBattlerIdPartner(bagMenuData->battleSys, bagMenuData->battler)];

        if (bagMenuData->battlerType == 4) {
            bagMenuData->partyMenuData->battlePartyCtx->embargoRemainingTurns[0] = bagMenuData->embargoTurns[BattleSystem_GetBattlerIdPartner(bagMenuData->battleSys, bagMenuData->battler)];
            bagMenuData->partyMenuData->battlePartyCtx->embargoRemainingTurns[1] = bagMenuData->embargoTurns[bagMenuData->battler];
        } else {
            bagMenuData->partyMenuData->battlePartyCtx->embargoRemainingTurns[0] = bagMenuData->embargoTurns[bagMenuData->battler];
            bagMenuData->partyMenuData->battlePartyCtx->embargoRemainingTurns[1] = bagMenuData->embargoTurns[BattleSystem_GetBattlerIdPartner(bagMenuData->battleSys, bagMenuData->battler)];
        }

        ov10_0221BE20(bagMenuData->partyMenuData->battlePartyCtx);
        bagMenuData->state++;
        break;
    case 5:
        if (bagMenuData->partyMenuData->battlePartyCtx->battlePartyExited) {
            bagMenuData->isCursorEnabled = bagMenuData->partyMenuData->battlePartyCtx->isCursorEnabled;
            bagMenuData->partyMenuData->battlePartyCtx->battlePartyExited = 0;

            if (bagMenuData->partyMenuData->battlePartyCtx->selectedPartyIndex == 6) {
                bagMenuData->state = 2;
            } else {
                bagMenuData->state = 6;
            }
        }
        break;
    case 6:
        ov12_02237BB8(bagMenuData->battleSys);
        BattleInput_SetKeyPressed(BattleSystem_GetBattleInput(bagMenuData->battleSys), bagMenuData->isCursorEnabled);
        PaletteData_BeginPaletteFade(paletteData, PLTTBUF_MAIN_BG_F | PLTTBUF_MAIN_OBJ_F, 0xC00, -8, 7, 0, 0);
        PaletteData_BeginPaletteFade(paletteData, PLTTBUF_SUB_BG_F | PLTTBUF_SUB_OBJ_F, 0xFFFF, -8, 16, 0, 0);
        bagMenuData->state++;
        break;
    case 7:
        if (PaletteData_GetSelectedBuffersBitmask(paletteData) == 0) {
            sub_0201649C(BattleSystem_GetMessageIcon(bagMenuData->battleSys), 0);

            if (bagMenuData->battleBagCtx->selectedBattleBagItem) {
                bagMenuData->state = 9;

                switch (bagMenuData->battleBagCtx->selectedBattleBagPocket) {
                case 1:
                    if (bagMenuData->battleBagCtx->selectedBattleBagItem == ITEM_REVIVE || bagMenuData->battleBagCtx->selectedBattleBagItem == ITEM_MAX_REVIVE) {
                        bagMenuData->state = 8;
                    } else if ((bagMenuData->partyMenuData->battlePartyCtx->selectedPartyIndex < 2 && (BattleSystem_GetBattleType(bagMenuData->battleSys) == (BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES) || BattleSystem_GetBattleType(bagMenuData->battleSys) == 19))
                        || bagMenuData->partyMenuData->battlePartyCtx->selectedPartyIndex < 1) {
                        if (bagMenuData->battleBagCtx->selectedBattleBagItem == ITEM_FULL_RESTORE) {
                            if (BattleSystem_AreBattleAnimationsOn(bagMenuData->battleSys) == TRUE) {
                                bagMenuData->stateAfterDelay = 17;
                            } else {
                                Sound_PlayPannedEffect(SEQ_SE_DP_KAIFUKU, -0x75);
                                bagMenuData->stateAfterDelay = 21;
                            }
                        } else {
                            if (BattleSystem_AreBattleAnimationsOn(bagMenuData->battleSys) == TRUE) {
                                bagMenuData->stateAfterDelay = 25;
                            } else {
                                Sound_PlayPannedEffect(SEQ_SE_DP_KAIFUKU, -0x75);
                                bagMenuData->stateAfterDelay = 29;
                            }
                        }
                    } else {
                        bagMenuData->state = 8;
                    }
                    break;
                case 0:
                    if (((bagMenuData->partyMenuData->battlePartyCtx->selectedPartyIndex < 2 && (BattleSystem_GetBattleType(bagMenuData->battleSys) == (BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES) || BattleSystem_GetBattleType(bagMenuData->battleSys) == 19))
                            || bagMenuData->partyMenuData->battlePartyCtx->selectedPartyIndex < 1)
                        && GetItemAttr(bagMenuData->battleBagCtx->selectedBattleBagItem, 0x26, HEAP_ID_BATTLE)) {
                        if (BattleSystem_AreBattleAnimationsOn(bagMenuData->battleSys) == TRUE) {
                            bagMenuData->stateAfterDelay = 17;
                        } else {
                            Sound_PlayPannedEffect(SEQ_SE_DP_KAIFUKU, -0x75);
                            bagMenuData->stateAfterDelay = 21;
                        }
                    } else {
                        bagMenuData->state = 8;
                    }
                    break;
                case 3:
                    if (bagMenuData->battleBagCtx->selectedBattleBagItem == ITEM_POKE_DOLL || bagMenuData->battleBagCtx->selectedBattleBagItem == ITEM_FLUFFY_TAIL) {
                        bagMenuData->state = 8;
                    } else {
                        if (bagMenuData->battleBagCtx->selectedBattleBagItem == 0x37) {
                            if (BattleSystem_AreBattleAnimationsOn(bagMenuData->battleSys) == TRUE) {
                                bagMenuData->stateAfterDelay = 13;
                            } else {
                                Sound_PlayPannedEffect(SEQ_SE_DP_KAIFUKU, -0x75);
                                bagMenuData->stateAfterDelay = 15;
                            }
                        } else {
                            if (BattleSystem_AreBattleAnimationsOn(bagMenuData->battleSys) == TRUE) {
                                bagMenuData->stateAfterDelay = 11;
                            } else {
                                Sound_PlayPannedEffect(SEQ_SE_DP_KAIFUKU, -0x75);
                                bagMenuData->stateAfterDelay = 15;
                            }
                        }
                    }
                    break;
                case 2:
                    bagMenuData->state = 8;
                    break;
                }
            } else {
                bagMenuData->state = 8;
            }

            if (bagMenuData->state != 8) {
                ov12_02237ED0(bagMenuData->battleSys, FALSE);
            }
        }
        break;
    case 8:
        BattleItemUse used;

        if (bagMenuData->battleBagCtx->selectedBattleBagItem == ITEM_NONE) {
            used.item = 0xFF;
        } else {
            used.item = bagMenuData->battleBagCtx->selectedBattleBagItem;
            used.category = bagMenuData->battleBagCtx->selectedBattleBagPocket;

            if (bagMenuData->battleBagCtx->selectedBattleBagPocket == 0 || bagMenuData->battleBagCtx->selectedBattleBagPocket == 1) {
                used.target = 1 + bagMenuData->partyMenuData->battlePartyCtx->pokemonPartySlots[bagMenuData->partyMenuData->battlePartyCtx->selectedPartyIndex];
            }
        }

        BattleController_EmitSelectedBagItem(bagMenuData->battleSys, bagMenuData->battler, used);
        BattleController_EmitClearCommand(bagMenuData->battleSys, bagMenuData->battler, bagMenuData->command);

        Heap_Free(bagMenuData->partyMenuData->battlePartyCtx->party);
        Heap_Free(bagMenuData->partyMenuData->battlePartyCtx);
        Heap_Free(bagMenuData->partyMenuData);
        Heap_Free(bagMenuData->battleBagCtx);
        Heap_Free(data);
        SysTask_Destroy(task);
        break;
    case 9:
        BattleMessage battleMsg;

        // Used the {ITEM}!
        battleMsg.id = msg_0197_01206;
        battleMsg.tag = TAG_ITEM;
        battleMsg.param[0] = bagMenuData->battleBagCtx->selectedBattleBagItem;

        MsgData *msgLoader = BattleSystem_GetMessageLoader(bagMenuData->battleSys);

        bagMenuData->msgIdx = BattleSystem_PrintBattleMessage(bagMenuData->battleSys, msgLoader, &battleMsg, BattleSystem_GetTextFrameDelay(bagMenuData->battleSys));
        bagMenuData->delay = 30;
        bagMenuData->state++;
        break;
    case 10:
        if (TextPrinterCheckActive(bagMenuData->msgIdx) == FALSE) {
            if (--bagMenuData->delay == 0) {
                bagMenuData->state = bagMenuData->stateAfterDelay;
            }
        }
        break;
    case 11: {
        MoveAnimation moveAnim;

        BattleController_SetMoveAnimation(bagMenuData->battleSys, NULL, &moveAnim, 1, 9, bagMenuData->battler, bagMenuData->battler, NULL);
        BattleDisplay_PlayMoveAnimation(bagMenuData->battleSys, BattleSystem_GetOpponentData(bagMenuData->battleSys, bagMenuData->battler), BattleSystem_GetAnimationSystem(bagMenuData->battleSys), &moveAnim);
    }
        bagMenuData->state++;
        break;
    case 17:
    case 25: {
        MoveAnimation moveAnim;
        int battler = bagMenuData->partyMenuData->battlePartyCtx->selectedPartyIndex * 2;
        BattleController_SetMoveAnimation(bagMenuData->battleSys, NULL, &moveAnim, 1, 9, battler, battler, NULL);
        BattleDisplay_PlayMoveAnimation(bagMenuData->battleSys, BattleSystem_GetOpponentData(bagMenuData->battleSys, battler), BattleSystem_GetAnimationSystem(bagMenuData->battleSys), &moveAnim);
    }
        bagMenuData->state++;
        break;
    case 13: {
        MoveAnimation moveAnim;

        if (bagMenuData->battleBagCtx->selectedBattleBagItem == 0x37) {
            BattleController_SetMoveAnimation(bagMenuData->battleSys, NULL, &moveAnim, 0, NULL, bagMenuData->battler, bagMenuData->battler, 54);
            BattleDisplay_PlayMoveAnimation(bagMenuData->battleSys, BattleSystem_GetOpponentData(bagMenuData->battleSys, bagMenuData->battler), BattleSystem_GetAnimationSystem(bagMenuData->battleSys), &moveAnim);
        } else if (bagMenuData->battleBagCtx->selectedBattleBagItem == 0x38) {
            BattleController_SetMoveAnimation(bagMenuData->battleSys, NULL, &moveAnim, 0, NULL, bagMenuData->battler, bagMenuData->battler, 116);
            BattleDisplay_PlayMoveAnimation(bagMenuData->battleSys, BattleSystem_GetOpponentData(bagMenuData->battleSys, bagMenuData->battler), BattleSystem_GetAnimationSystem(bagMenuData->battleSys), &moveAnim);
        } else {
            BattleController_SetMoveAnimation(bagMenuData->battleSys, NULL, &moveAnim, 1, 12, bagMenuData->battler, bagMenuData->battler, NULL);
            BattleDisplay_PlayMoveAnimation(bagMenuData->battleSys, BattleSystem_GetOpponentData(bagMenuData->battleSys, bagMenuData->battler), BattleSystem_GetAnimationSystem(bagMenuData->battleSys), &moveAnim);
        }

        bagMenuData->state++;
    } break;
    case 15: {
        BattleMessage battleMsg;

        // {STAT} rose!
        battleMsg.id = msg_0197_01203;
        battleMsg.tag = TAG_NICKNAME_STAT;
        battleMsg.param[0] = bagMenuData->battler | (bagMenuData->partyMenuData->partySlots[bagMenuData->battler] << 8);

        switch (bagMenuData->battleBagCtx->selectedBattleBagItem) {
        case 57:
            battleMsg.param[1] = 1;
            break;
        case 58:
            battleMsg.param[1] = 2;
            break;
        case 59:
            battleMsg.param[1] = 3;
            break;
        case 60:
            battleMsg.param[1] = 6;
            break;
        case 61:
            battleMsg.param[1] = 4;
            break;
        case 62:
            battleMsg.param[1] = 5;
            break;
        case 55:
            battleMsg.id = msg_0197_01204;
            battleMsg.tag = TAG_NONE;
            break;
        case 56:
            battleMsg.id = msg_0197_01205;
            battleMsg.tag = TAG_NICKNAME;
            break;
        }

        MsgData *msgLoader = BattleSystem_GetMessageLoader(bagMenuData->battleSys);
        bagMenuData->msgIdx = BattleSystem_PrintBattleMessage(bagMenuData->battleSys, msgLoader, &battleMsg, BattleSystem_GetTextFrameDelay(bagMenuData->battleSys));
        bagMenuData->delay = 30;
    }
        bagMenuData->state++;
        break;
    case 19:
    case 27: {
        MoveAnimation moveAnim;
        int battler = bagMenuData->partyMenuData->battlePartyCtx->selectedPartyIndex * 2;
        BattleController_SetMoveAnimation(bagMenuData->battleSys, NULL, &moveAnim, 1, 14, battler, battler, NULL);
        BattleDisplay_PlayMoveAnimation(bagMenuData->battleSys, BattleSystem_GetOpponentData(bagMenuData->battleSys, battler), BattleSystem_GetAnimationSystem(bagMenuData->battleSys), &moveAnim);
    }
        bagMenuData->state++;
        break;
    case 21: {

        int battler = bagMenuData->partyMenuData->battlePartyCtx->selectedPartyIndex * 2;
        int slots = bagMenuData->partyMenuData->battlePartyCtx->pokemonPartySlots[bagMenuData->partyMenuData->battlePartyCtx->selectedPartyIndex];

        BattleHpBar *hpBar = BattleSystem_GetHpBar(bagMenuData->battleSys, battler);
        MI_CpuClear8(&hpBar->script, sizeof(u8));
        hpBar->type = BattleHpBar_Util_GetBarTypeFromBattlerSide(BattleSystem_GetBattlerType(bagMenuData->battleSys, battler), BattleSystem_GetBattleType(bagMenuData->battleSys));

        Pokemon *mon = BattleSystem_GetPartyMon(bagMenuData->battleSys, battler, slots);
        hpBar->hp = GetMonData(mon, MON_DATA_HP, NULL) - bagMenuData->partyMenuData->battlePartyCtx->currentDamage;
        hpBar->maxHp = GetMonData(mon, MON_DATA_MAX_HP, NULL);
        hpBar->gainedHp = bagMenuData->partyMenuData->battlePartyCtx->currentDamage;

        if (GetMonData(mon, MON_DATA_STATUS, NULL) == 0) {
            hpBar->unk_4A = 0;
        }

        ov12_02264DCC(hpBar, hpBar->gainedHp);
    }
        bagMenuData->state++;
        break;
    case 22: {
        int battler = bagMenuData->partyMenuData->battlePartyCtx->selectedPartyIndex * 2;
        BattleHpBar *hpBar = BattleSystem_GetHpBar(bagMenuData->battleSys, battler);

        if (ov12_02264E00(hpBar) == -1) {
            ov12_0226498C(hpBar, NULL, 1 << 8);
            bagMenuData->state++;
        }
    } break;
    case 23: {
        BattleMessage battleMsg;

        MsgData *msgLoader = BattleSystem_GetMessageLoader(bagMenuData->battleSys);
        int battler = bagMenuData->partyMenuData->battlePartyCtx->selectedPartyIndex * 2;

        if (bagMenuData->partyMenuData->battlePartyCtx->currentDamage) {
            // {MON}'s HP was restored.
            battleMsg.id = msg_0197_01214;
            battleMsg.tag = TAG_NICKNAME_NUM;
            battleMsg.param[0] = battler | (bagMenuData->partyMenuData->partySlots[battler] << 8);
            battleMsg.param[1] = bagMenuData->partyMenuData->battlePartyCtx->currentDamage;
        } else {
            // {MON} became healthy.
            battleMsg.id = msg_0197_01250;
            battleMsg.tag = TAG_NICKNAME;
            battleMsg.param[0] = battler | (bagMenuData->partyMenuData->partySlots[battler] << 8);
        }

        bagMenuData->msgIdx = BattleSystem_PrintBattleMessage(bagMenuData->battleSys, msgLoader, &battleMsg, BattleSystem_GetTextFrameDelay(bagMenuData->battleSys));
        bagMenuData->delay = 30;

        bagMenuData->state++;
    } break;
    case 29: {
        BattleMessage battleMsg;
        int msgType;
        int effect = 0;

        int battler = bagMenuData->partyMenuData->battlePartyCtx->selectedPartyIndex * 2;
        BattleHpBar *hpBar = BattleSystem_GetHpBar(bagMenuData->battleSys, battler);
        int slot = bagMenuData->partyMenuData->battlePartyCtx->pokemonPartySlots[bagMenuData->partyMenuData->battlePartyCtx->selectedPartyIndex];
        Pokemon *mon = BattleSystem_GetPartyMon(bagMenuData->battleSys, battler, slot);

        if (GetMonData(mon, MON_DATA_STATUS, NULL) == 0) {
            hpBar->unk_4A = 0;
        }

        ov12_0226498C(hpBar, hpBar->hp, 1 << 8);

        battleMsg.tag = TAG_NICKNAME;
        battleMsg.param[0] = battler | (bagMenuData->partyMenuData->partySlots[battler] << 8);

        if (GetItemAttr(bagMenuData->battleBagCtx->selectedBattleBagItem, 15, HEAP_ID_BATTLE)) {
            msgType = 0;
            effect++;
        }

        if (GetItemAttr(bagMenuData->battleBagCtx->selectedBattleBagItem, 16, HEAP_ID_BATTLE)) {
            msgType = 1;
            effect++;
        }

        if (GetItemAttr(bagMenuData->battleBagCtx->selectedBattleBagItem, 17, HEAP_ID_BATTLE)) {
            msgType = 2;
            effect++;
        }

        if (GetItemAttr(bagMenuData->battleBagCtx->selectedBattleBagItem, 18, HEAP_ID_BATTLE)) {
            msgType = 3;
            effect++;
        }

        if (GetItemAttr(bagMenuData->battleBagCtx->selectedBattleBagItem, 19, HEAP_ID_BATTLE)) {
            msgType = 4;
            effect++;
        }

        if (GetItemAttr(bagMenuData->battleBagCtx->selectedBattleBagItem, 20, HEAP_ID_BATTLE)) {
            msgType = 5;
            effect++;
        }

        if (GetItemAttr(bagMenuData->battleBagCtx->selectedBattleBagItem, 21, HEAP_ID_BATTLE)) {
            msgType = 6;
            effect++;
        }

        if (effect != 1) {
            // {MON} got over its status.
            battleMsg.id = msg_0197_01229;
        } else {
            switch (msgType) {
            case 0:
                // {MON} woke up.
                battleMsg.id = msg_0197_01210;
                break;
            case 1:
                // {MON} was cured of its poisoning.
                battleMsg.id = msg_0197_01207;
                break;
            case 2:
                // {MON}'s burn was healed
                battleMsg.id = msg_0197_01209;
                break;
            case 3:
                // {MON} was thawed out.
                battleMsg.id = msg_0197_01211;
                break;
            case 4:
                // {MON} was cured of paralysis.
                battleMsg.id = msg_0197_01208;
                break;
            case 5:
                // {MON} snapped out of its confusion.
                battleMsg.id = msg_0197_01212;
                break;
            case 6:
                // {MON} got over its infatuation.
                battleMsg.id = msg_0197_01213;
                break;
            }
        }

        MsgData *msgLoader = BattleSystem_GetMessageLoader(bagMenuData->battleSys);
        bagMenuData->msgIdx = BattleSystem_PrintBattleMessage(bagMenuData->battleSys, msgLoader, &battleMsg, BattleSystem_GetTextFrameDelay(bagMenuData->battleSys));
        bagMenuData->delay = 30;
    }
        bagMenuData->state++;
        break;

    case 12:
    case 14:
    case 18:
    case 20:
    case 26:
    case 28:
        ov07_0221C394(BattleSystem_GetAnimationSystem(bagMenuData->battleSys));

        if (BattleAnimSystem_IsMoveActive(BattleSystem_GetAnimationSystem(bagMenuData->battleSys)) == FALSE) {
            BattleAnimSystem_FreeScriptData(BattleSystem_GetAnimationSystem(bagMenuData->battleSys));
            bagMenuData->state++;
        }
        break;
    case 16:
    case 24:
    case 30:
        if (TextPrinterCheckActive(bagMenuData->msgIdx) == FALSE) {
            if (--bagMenuData->delay == 0) {
                ov12_02237ED0(bagMenuData->battleSys, TRUE);
                bagMenuData->state = 8;
            }
        }
        break;
    }
}

static void BattleDisplayTask_TrainerShowBagMenu(SysTask *task, void *data) {
    BagMenuData *bagMenuData = data;
    BattleItemUse used;

    used.item = 1;

    BattleController_EmitSelectedBagItem(bagMenuData->battleSys, bagMenuData->battler, used);
    BattleController_EmitClearCommand(bagMenuData->battleSys, bagMenuData->battler, bagMenuData->command);

    Heap_Free(bagMenuData->partyMenuData->battlePartyCtx->party);
    Heap_Free(bagMenuData->partyMenuData->battlePartyCtx);
    Heap_Free(bagMenuData->partyMenuData);
    Heap_Free(data);
    SysTask_Destroy(task);
}

static void BattleDisplayTask_LinkShowBagMenu(SysTask *task, void *data) {
    BagMenuData *bagMenuData = data;

    BattleController_EmitClearCommand(bagMenuData->battleSys, bagMenuData->battler, bagMenuData->command);

    Heap_Free(bagMenuData->partyMenuData->battlePartyCtx->party);
    Heap_Free(bagMenuData->partyMenuData->battlePartyCtx);
    Heap_Free(bagMenuData->partyMenuData);
    Heap_Free(data);
    SysTask_Destroy(task);
}

static void BattleDisplayTask_RecordingShowBagMenu(SysTask *task, void *data) {
    BagMenuData *bagMenuData = data;
    BattleItemUse used;
    u8 v2;

    if (BattleSystem_ReadNextRecordedInput(bagMenuData->battleSys, bagMenuData->battler, &v2) == 1) {
        BattleDisplay_StopPlaybackAlt(bagMenuData->battleSys);
    }

    used.item = v2;

    if (BattleSystem_ReadNextRecordedInput(bagMenuData->battleSys, bagMenuData->battler, &v2) == 1) {
        BattleDisplay_StopPlaybackAlt(bagMenuData->battleSys);
    }

    used.item |= (v2 << 8);

    if (BattleSystem_ReadNextRecordedInput(bagMenuData->battleSys, bagMenuData->battler, &v2) == 1) {
        BattleDisplay_StopPlaybackAlt(bagMenuData->battleSys);
    }

    used.category = v2 & 0xF;
    used.target = (v2 & 0xF0) >> 8;

    BattleController_EmitSelectedBagItem(bagMenuData->battleSys, bagMenuData->battler, used);
    BattleController_EmitClearCommand(bagMenuData->battleSys, bagMenuData->battler, bagMenuData->command);

    Heap_Free(bagMenuData->partyMenuData->battlePartyCtx->party);
    Heap_Free(bagMenuData->partyMenuData->battlePartyCtx);
    Heap_Free(bagMenuData->partyMenuData);
    Heap_Free(data);
    SysTask_Destroy(task);
}

static void BattleDisplayTask_PlayerShowPartyMenu(SysTask *task, void *data) {
    PartyMenuData *partyMenuData = data;
    PaletteData *paletteData = BattleSystem_GetPaletteData(partyMenuData->battleSys);

    switch (partyMenuData->state) {
    case 0:
        Window *window = BattleSystem_GetWindow(partyMenuData->battleSys, 0);

        FillWindowPixelBuffer(window, 0xFF);
        CopyWindowPixelsToVram_TextMode(window);

        partyMenuData->isCursorEnabled = BattleInput_GetKeyPressed(BattleSystem_GetBattleInput(partyMenuData->battleSys));
        sub_0201649C(BattleSystem_GetMessageIcon(partyMenuData->battleSys), 1);
        PaletteData_BeginPaletteFade(paletteData, PLTTBUF_MAIN_BG_F | PLTTBUF_MAIN_OBJ_F, 0xC00, -8, 0, 7, 0);
        PaletteData_BeginPaletteFade(paletteData, PLTTBUF_SUB_BG_F | PLTTBUF_SUB_OBJ_F, 0xFFFF, -8, 0, 16, 0);
        partyMenuData->state++;
        break;
    case 1:
        if (PaletteData_GetSelectedBuffersBitmask(paletteData) == 0) {
            int i;
            int battler;
            int battler1, battler2;
            Pokemon *monSrc, *monDst;

            ov12_02237B0C(partyMenuData->battleSys);

            partyMenuData->battlePartyCtx = Heap_Alloc(HEAP_ID_BATTLE, sizeof(BattlePartyContext));
            partyMenuData->battlePartyCtx->party = SaveArray_Party_Alloc(HEAP_ID_BATTLE);

            if ((BattleSystem_GetBattleType(partyMenuData->battleSys) & (BATTLE_TYPE_LINK | BATTLE_TYPE_MULTI)) == (BATTLE_TYPE_LINK | BATTLE_TYPE_MULTI)
                || BattleSystem_GetBattleType(partyMenuData->battleSys) == (((BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES) | BATTLE_TYPE_MULTI | BATTLE_TYPE_AI) | BATTLE_TYPE_FRONTIER)) {
                if (BattleSystem_GetBattlerType(partyMenuData->battleSys, partyMenuData->battler) == BATTLER_TYPE_PLAYER_SIDE_SLOT_1) {
                    battler1 = partyMenuData->battler;
                    battler2 = BattleSystem_GetBattlerIdPartner(partyMenuData->battleSys, partyMenuData->battler);
                } else {
                    battler1 = BattleSystem_GetBattlerIdPartner(partyMenuData->battleSys, partyMenuData->battler);
                    battler2 = partyMenuData->battler;
                }

                monSrc = AllocMonZeroed(HEAP_ID_BATTLE);

                for (i = 0; i < PARTY_SIZE; i++) {
                    Party_AddMon(partyMenuData->battlePartyCtx->party, monSrc);
                }

                Heap_Free(monSrc);

                for (i = 0; i < BattleSystem_GetPartySize(partyMenuData->battleSys, battler1); i++) {
                    monSrc = BattleSystem_GetPartyMon(partyMenuData->battleSys, battler1, partyMenuData->partyOrder[battler1][i]);
                    monDst = Party_GetMonByIndex(partyMenuData->battlePartyCtx->party, i * 2);
                    CopyPokemonToPokemon(monSrc, monDst);
                    partyMenuData->battlePartyCtx->pokemonPartySlots[i * 2] = partyMenuData->partyOrder[battler1][i];
                }

                for (i = 0; i < BattleSystem_GetPartySize(partyMenuData->battleSys, battler2); i++) {
                    monSrc = BattleSystem_GetPartyMon(partyMenuData->battleSys, battler2, partyMenuData->partyOrder[battler2][i]);
                    monDst = Party_GetMonByIndex(partyMenuData->battlePartyCtx->party, i * 2 + 1);
                    CopyPokemonToPokemon(monSrc, monDst);
                    partyMenuData->battlePartyCtx->pokemonPartySlots[i * 2 + 1] = partyMenuData->partyOrder[battler2][i];
                }

                if (BattleSystem_GetBattlerType(partyMenuData->battleSys, partyMenuData->battler) == BATTLER_TYPE_PLAYER_SIDE_SLOT_2) {
                    partyMenuData->battlePartyCtx->selectedPartyIndex = 1;
                } else {
                    partyMenuData->battlePartyCtx->selectedPartyIndex = 0;
                }
            } else {
                if (BattleSystem_GetBattleType(partyMenuData->battleSys) & BATTLE_TYPE_DOUBLES
                    && (BattleSystem_GetBattleType(partyMenuData->battleSys) & BATTLE_TYPE_MULTI) == FALSE) {
                    battler = partyMenuData->battler & 1;
                } else {
                    battler = partyMenuData->battler;
                }

                if (BattleSystem_GetBattlerType(partyMenuData->battleSys, partyMenuData->battler) == BATTLER_TYPE_PLAYER_SIDE_SLOT_2) {
                    partyMenuData->battlePartyCtx->selectedPartyIndex = 1;
                } else {
                    partyMenuData->battlePartyCtx->selectedPartyIndex = 0;
                }

                Party *party = BattleSystem_GetParty(partyMenuData->battleSys, partyMenuData->battler);

                for (i = 0; i < Party_GetCount(party); i++) {
                    monSrc = BattleSystem_GetPartyMon(partyMenuData->battleSys, battler, partyMenuData->partyOrder[battler][i]);
                    Party_AddMon(partyMenuData->battlePartyCtx->party, monSrc);
                    partyMenuData->battlePartyCtx->pokemonPartySlots[i] = partyMenuData->partyOrder[battler][i];
                }
            }

            partyMenuData->battlePartyCtx->battleSys = partyMenuData->battleSys;
            partyMenuData->battlePartyCtx->heapID = HEAP_ID_BATTLE;
            partyMenuData->battlePartyCtx->battlePartyExited = 0;
            partyMenuData->battlePartyCtx->moveToLearn = partyMenuData->canSwitch;
            partyMenuData->battlePartyCtx->doubleBattleFirstSelectedPartySlot = partyMenuData->doublesSelection;
            partyMenuData->battlePartyCtx->battlePartyMode = partyMenuData->listMode;
            partyMenuData->battlePartyCtx->selectedBattleBagItem = partyMenuData->selectedBattleBagItem;
            partyMenuData->battlePartyCtx->battler = partyMenuData->battler;
            partyMenuData->battlePartyCtx->isCursorEnabled = partyMenuData->isCursorEnabled;

            if ((partyMenuData->battlersSwitchingMask & MaskOfFlagNo(partyMenuData->battler)) == 0) {
                partyMenuData->battlePartyCtx->playerPokemonPartySlot = partyMenuData->partySlots[partyMenuData->battler];
            } else {
                partyMenuData->battlePartyCtx->playerPokemonPartySlot = 6;
            }

            if (BattleSystem_GetBattleType(partyMenuData->battleSys) & BATTLE_TYPE_MULTI) {
                partyMenuData->battlePartyCtx->partnerPokemonPartySlot = 6;
            } else if ((partyMenuData->battlersSwitchingMask & MaskOfFlagNo(BattleSystem_GetBattlerIdPartner(partyMenuData->battleSys, partyMenuData->battler))) == 0) {
                partyMenuData->battlePartyCtx->partnerPokemonPartySlot = partyMenuData->partySlots[BattleSystem_GetBattlerIdPartner(partyMenuData->battleSys, partyMenuData->battler)];
            } else {
                partyMenuData->battlePartyCtx->partnerPokemonPartySlot = 6;
            }

            ov10_0221BE20(partyMenuData->battlePartyCtx);
            partyMenuData->state++;
        }
        break;
    case 2:
        if (partyMenuData->battlePartyCtx->battlePartyExited) {
            ov12_02237BB8(partyMenuData->battleSys);
            BattleInput_SetKeyPressed(BattleSystem_GetBattleInput(partyMenuData->battleSys), partyMenuData->battlePartyCtx->isCursorEnabled);
            PaletteData_BeginPaletteFade(paletteData, PLTTBUF_MAIN_BG_F | PLTTBUF_MAIN_OBJ_F, 0xC00, -8, 7, 0, 0);
            PaletteData_BeginPaletteFade(paletteData, PLTTBUF_SUB_BG_F | PLTTBUF_SUB_OBJ_F, 0xFFFF, -8, 16, 0, 0);
            partyMenuData->state++;
        }
        break;
    case 3:
        if (PaletteData_GetSelectedBuffersBitmask(paletteData) == 0) {
            sub_0201649C(BattleSystem_GetMessageIcon(partyMenuData->battleSys), 0);

            if (partyMenuData->battlePartyCtx->selectedPartyIndex == 6) {
                BattleController_EmitPartyMenuResult(partyMenuData->battleSys, partyMenuData->battler, 0xFF);
            } else {
                BattleController_EmitPartyMenuResult(partyMenuData->battleSys, partyMenuData->battler, 1 + partyMenuData->battlePartyCtx->pokemonPartySlots[partyMenuData->battlePartyCtx->selectedPartyIndex]);
            }

            BattleController_EmitClearCommand(partyMenuData->battleSys, partyMenuData->battler, partyMenuData->command);
            Heap_Free(partyMenuData->battlePartyCtx->party);
            Heap_Free(partyMenuData->battlePartyCtx);
            Heap_Free(data);
            SysTask_Destroy(task);
        }
        break;
    }
}

static void BattleDisplayTask_TrainerShowPartyMenu(SysTask *task, void *data) {
    PartyMenuData *partyMenuData = data;
    Party *party;
    Pokemon *mon;
    int partner;
    u32 battleType = BattleSystem_GetBattleType(partyMenuData->battleSys);
    int battler = partyMenuData->battler;

    if (battleType & BATTLE_TYPE_TAG || battleType & BATTLE_TYPE_MULTI) {
        partner = battler;
    } else {
        partner = BattleSystem_GetBattlerIdPartner(partyMenuData->battleSys, battler);
    }

    int slot = ov12_02258BA0(partyMenuData->battleSys, battler);

    if (slot == 6) {
        slot = ov12_02258800(partyMenuData->battleSys, battler);

        if (slot == 6) {
            party = BattleSystem_GetParty(partyMenuData->battleSys, partyMenuData->battler);

            for (slot = 0; slot < Party_GetCount(party); slot++) {
                mon = BattleSystem_GetPartyMon(partyMenuData->battleSys, partyMenuData->battler, slot);

                if (GetMonData(mon, MON_DATA_HP, NULL) && partyMenuData->partySlots[battler] != slot && partyMenuData->partySlots[partner] != slot) {
                    break;
                }
            }
        }
    }

    BattleController_EmitPartyMenuResult(partyMenuData->battleSys, partyMenuData->battler, 1 + slot);
    BattleController_EmitClearCommand(partyMenuData->battleSys, partyMenuData->battler, partyMenuData->command);

    Heap_Free(data);
    SysTask_Destroy(task);
}

static void BattleDisplayTask_LinkShowPartyMenu(SysTask *task, void *data) {
    PartyMenuData *partyMenuData = data;

    BattleController_EmitClearCommand(partyMenuData->battleSys, partyMenuData->battler, partyMenuData->command);

    Heap_Free(data);
    SysTask_Destroy(task);
}

static void BattleDisplayTask_RecordingShowPartyMenu(SysTask *task, void *data) {
    PartyMenuData *partyMenuData = data;
    u8 v1;

    if (BattleSystem_ReadNextRecordedInput(partyMenuData->battleSys, partyMenuData->battler, &v1) == 1) {
        BattleDisplay_StopPlaybackAlt(partyMenuData->battleSys);
    }

    if (!v1 || v1 > 6) {
        BattleDisplay_StopPlayback(partyMenuData->battleSys);
    } else {
        Pokemon *mon;
        int v4 = v1 - 1;

        Party *party = BattleSystem_GetParty(partyMenuData->battleSys, partyMenuData->battler);

        if (v4 == partyMenuData->partySlots[partyMenuData->battler] || v4 == partyMenuData->doublesSelection) {
            BattleDisplay_StopPlayback(partyMenuData->battleSys);
        } else if (v1 > Party_GetCount(party)) {
            BattleDisplay_StopPlayback(partyMenuData->battleSys);
        } else {
            mon = BattleSystem_GetPartyMon(partyMenuData->battleSys, partyMenuData->battler, v1 - 1);

            if (GetMonData(mon, MON_DATA_HP, NULL) == 0) {
                BattleDisplay_StopPlayback(partyMenuData->battleSys);
            }

            if (GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) == SPECIES_EGG) {
                BattleDisplay_StopPlayback(partyMenuData->battleSys);
            }
        }
    }

    BattleController_EmitPartyMenuResult(partyMenuData->battleSys, partyMenuData->battler, v1);
    BattleController_EmitClearCommand(partyMenuData->battleSys, partyMenuData->battler, partyMenuData->command);

    Heap_Free(data);
    SysTask_Destroy(task);
}

static void BattleDisplayTask_PlayerShowYesNoMenu(SysTask *task, void *data) {
    YesNoMenuData *yesNoMenuData = data;
    BgConfig *bgConfig = BattleSystem_GetBgConfig(yesNoMenuData->battleSys);
    BattleInput *btlSubscreen = BattleSystem_GetBattleInput(yesNoMenuData->battleSys);
    int partner;
    BattleHpBar *hpBar;
    OpponentData *opponentData = BattleSystem_GetOpponentData(yesNoMenuData->battleSys, yesNoMenuData->battler);
    partner = BattleSystem_GetBattlerIdPartner(yesNoMenuData->battleSys, yesNoMenuData->battler);

    if (partner != yesNoMenuData->battler) {
        hpBar = BattleSystem_GetHpBar(yesNoMenuData->battleSys, partner);
    } else {
        hpBar = NULL;
    }

    switch (yesNoMenuData->state) {
    case 0:
        if (BattleInput_CheckFeedbackDone(btlSubscreen) == 0) {
            break;
        }

        if (yesNoMenuData->promptMsg) {
            MsgData *msgLoader = BattleSystem_GetMessageLoader(yesNoMenuData->battleSys);
            BattleMessage battleMsg;

            if (yesNoMenuData->yesNoType == 5) {
                battleMsg.tag = TAG_NICKNAME | 0x80;
                battleMsg.param[0] = yesNoMenuData->nickname;
            } else {
                battleMsg.tag = TAG_NONE;
            }

            battleMsg.id = yesNoMenuData->promptMsg;
            yesNoMenuData->msgIdx = BattleSystem_PrintBattleMessage(yesNoMenuData->battleSys, msgLoader, &battleMsg, BattleSystem_GetTextFrameDelay(yesNoMenuData->battleSys));
        }

        yesNoMenuData->state = 1;
        break;
    case 1:
        if (TextPrinterCheckActive(yesNoMenuData->msgIdx) == FALSE || yesNoMenuData->promptMsg == 0) {
            NARC *bgNarc = NARC_New(NARC_a_0_0_7, HEAP_ID_BATTLE);
            NARC *objNarc = NARC_New(NARC_a_0_0_8, HEAP_ID_BATTLE);
            GiveUpMoveData giveUpMoveData;

            BattleInput_DisableBallGauge(btlSubscreen);

            giveUpMoveData.move = yesNoMenuData->move;

            switch (yesNoMenuData->yesNoType) {
            case 0:
            case 5:
                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 13, 0, &giveUpMoveData);
                break;
            case 1:
                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 14, 0, &giveUpMoveData);
                break;
            case 2:
                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 15, 0, &giveUpMoveData);
                break;
            case 3:
                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 16, 0, &giveUpMoveData);
                break;
            case 4:
                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 17, 0, &giveUpMoveData);
                break;
            default:
                GF_ASSERT(FALSE);
                break;
            }

            yesNoMenuData->state = 2;

            NARC_Delete(bgNarc);
            NARC_Delete(objNarc);
        }
        break;
    case 2:
        yesNoMenuData->input = BattleInput_CheckTouch(btlSubscreen);

        if (yesNoMenuData->input != 0xFFFFFFFF) {
            PlaySE(SEQ_SE_DP_DECIDE);
            yesNoMenuData->state = 3;
        }
        break;
    case 3:
        if (BattleInput_CheckFeedbackDone(btlSubscreen) == 1) {
            NARC *bgNarc = NARC_New(NARC_a_0_0_7, HEAP_ID_BATTLE);
            NARC *objNarc = NARC_New(NARC_a_0_0_8, HEAP_ID_BATTLE);

            ov12_02264EB4(yesNoMenuData->hpBar);
            ov12_02262014(opponentData);
            ov12_02265D74(hpBar);
            BattleInput_DisableBallGauge(btlSubscreen);
            BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 0, 0, NULL);

            if (yesNoMenuData->input == 1) {
                BattleInput_Deadstriped_022698AC(btlSubscreen, 0);
            }

            yesNoMenuData->state = 4;

            NARC_Delete(bgNarc);
            NARC_Delete(objNarc);
        }
        break;
    case 4:
        if (ov12_022698B0(btlSubscreen) == 1) {
            BattleController_EmitSelectedCommand(yesNoMenuData->battleSys, yesNoMenuData->battler, yesNoMenuData->input);
            BattleController_EmitClearCommand(yesNoMenuData->battleSys, yesNoMenuData->battler, yesNoMenuData->command);
            Heap_Free(data);
            SysTask_Destroy(task);
        }
        break;
    }
}

static void BattleDisplayTask_TrainerShowYesNoMenu(SysTask *task, void *data) {
    YesNoMenuData *yesNoMenuData = data;

    BattleController_EmitClearCommand(yesNoMenuData->battleSys, yesNoMenuData->battler, yesNoMenuData->command);

    Heap_Free(data);
    SysTask_Destroy(task);
}

static void BattleDisplayTask_LinkShowYesNoMenu(SysTask *task, void *data) {
    YesNoMenuData *yesNoMenuData = data;

    BattleController_EmitClearCommand(yesNoMenuData->battleSys, yesNoMenuData->battler, yesNoMenuData->command);

    Heap_Free(data);
    SysTask_Destroy(task);
}

static void BattleDisplayTask_RecordingShowYesNoMenu(SysTask *task, void *data) {
    YesNoMenuData *yesNoMenuData = data;
    u8 v1;

    if (BattleSystem_ReadNextRecordedInput(yesNoMenuData->battleSys, yesNoMenuData->battler, &v1) == 1) {
        BattleDisplay_StopPlaybackAlt(yesNoMenuData->battleSys);
    }

    if (!v1 || (v1 != 0xFF && v1 != 1)) {
        BattleDisplay_StopPlayback(yesNoMenuData->battleSys);
    }

    BattleController_EmitSelectedCommand(yesNoMenuData->battleSys, yesNoMenuData->battler, v1);
    BattleController_EmitClearCommand(yesNoMenuData->battleSys, yesNoMenuData->battler, yesNoMenuData->command);

    Heap_Free(data);
    SysTask_Destroy(task);
}

static void BattleDisplayTask_SetMoveAnimation(SysTask *task, void *data) {
    SetMoveAnimationData *setMoveAnimationData = data;

    switch (setMoveAnimationData->state) {
    case 0:
        if (setMoveAnimationData->moveAnim.isSubstitute && setMoveAnimationData->moveAnim.animMode == 0 && Pokepic_GetAttr(setMoveAnimationData->pokepic, 6) == FALSE) {
            MoveAnimation moveAnim;

            BattleController_SetMoveAnimation(setMoveAnimationData->battleSys, NULL, &moveAnim, 1, 15, setMoveAnimationData->battler, setMoveAnimationData->battler, NULL);
            BattleDisplay_PlayMoveAnimation(setMoveAnimationData->battleSys, setMoveAnimationData->opponentData, setMoveAnimationData->battleAnimSys, &moveAnim);
            setMoveAnimationData->state = 1;
        } else {
            setMoveAnimationData->state = 4;
        }
        break;
    case 2:
        BattlerSpriteContext battlerSpriteCtx;
        MoveAnimation moveAnim;

        BattleDisplay_PopulateBattlerContext(setMoveAnimationData->battleSys, &setMoveAnimationData->moveAnim, &battlerSpriteCtx, setMoveAnimationData->battler);
        ov07_0223494C(&battlerSpriteCtx, HEAP_ID_BATTLE);

        BattleController_SetMoveAnimation(setMoveAnimationData->battleSys, NULL, &moveAnim, 1, 16, setMoveAnimationData->battler, setMoveAnimationData->battler, NULL);
        BattleDisplay_PlayMoveAnimation(setMoveAnimationData->battleSys, setMoveAnimationData->opponentData, setMoveAnimationData->battleAnimSys, &moveAnim);
        setMoveAnimationData->opponentData->unk1A0 = 0;
        setMoveAnimationData->state++;
        break;
    case 4:
        BattleSystem_SetCriticalHpMusicFlag(setMoveAnimationData->battleSys, 2);

        if (setMoveAnimationData->hideHealthboxes) {
            BattleSystem_SetHpBarDisabled(setMoveAnimationData->battleSys);
        }

        if (setMoveAnimationData->hideShadows) {
            PokepicManager_SetG3UpdateFlagsMask(BattleSystem_GetPokepicManager(setMoveAnimationData->battleSys), 1);
        }

        BattleDisplay_PlayMoveAnimation(setMoveAnimationData->battleSys, setMoveAnimationData->opponentData, setMoveAnimationData->battleAnimSys, &setMoveAnimationData->moveAnim);
        setMoveAnimationData->state++;
        break;
    case 6:
        BattleSystem_SetCriticalHpMusicFlag(setMoveAnimationData->battleSys, 0);

        if (setMoveAnimationData->hideHealthboxes) {
            BattleSystem_SetHpBarEnabled(setMoveAnimationData->battleSys);
        }

        if (setMoveAnimationData->hideShadows) {
            PokepicManager_ResetG3UpdateFlagsMask(BattleSystem_GetPokepicManager(setMoveAnimationData->battleSys), 1);
        }

        if (setMoveAnimationData->moveAnim.isSubstitute && setMoveAnimationData->moveAnim.animMode == 0 && Pokepic_GetAttr(setMoveAnimationData->pokepic, 6) == FALSE) {
            MoveAnimation moveAnim;

            BattleController_SetMoveAnimation(setMoveAnimationData->battleSys, NULL, &moveAnim, 1, 15, setMoveAnimationData->battler, setMoveAnimationData->battler, NULL);
            BattleDisplay_PlayMoveAnimation(setMoveAnimationData->battleSys, setMoveAnimationData->opponentData, setMoveAnimationData->battleAnimSys, &moveAnim);
            setMoveAnimationData->state = 7;
        } else {
            setMoveAnimationData->state = 10;
        }
        break;
    case 8: {
        BattlerSpriteContext battlerSpriteCtx;
        MoveAnimation moveAnim;

        BattleDisplay_PopulateBattlerContext(setMoveAnimationData->battleSys, &setMoveAnimationData->moveAnim, &battlerSpriteCtx, setMoveAnimationData->battler);
        ov07_02234A20(&battlerSpriteCtx, HEAP_ID_BATTLE);

        BattleController_SetMoveAnimation(setMoveAnimationData->battleSys, NULL, &moveAnim, 1, 16, setMoveAnimationData->battler, setMoveAnimationData->battler, NULL);
        BattleDisplay_PlayMoveAnimation(setMoveAnimationData->battleSys, setMoveAnimationData->opponentData, setMoveAnimationData->battleAnimSys, &moveAnim);
        setMoveAnimationData->opponentData->unk1A0 = 1;
    }
        setMoveAnimationData->state++;
        break;
    case 10:
        BattleController_EmitClearCommand(setMoveAnimationData->battleSys, setMoveAnimationData->battler, setMoveAnimationData->command);
        Heap_Free(data);
        SysTask_Destroy(task);
        break;
    case 1:
    case 3:
    case 5:
    case 7:
    case 9:
        ov07_0221C394(setMoveAnimationData->battleAnimSys);

        if (BattleAnimSystem_IsMoveActive(setMoveAnimationData->battleAnimSys) == FALSE) {
            BattleAnimSystem_FreeScriptData(setMoveAnimationData->battleAnimSys);
            setMoveAnimationData->state++;
        }
        break;
    }
}

static void BattleDisplayTask_FlickerBattler(SysTask *task, void *data) {
    FlickerOpponentData *flickerOpponentData = data;
    int hide;

    if (flickerOpponentData->counter < 6) {
        if (flickerOpponentData->delay == 0) {
            flickerOpponentData->delay = 2;
            flickerOpponentData->counter++;
            hide = Pokepic_GetAttr(flickerOpponentData->pokepic, 6);
            hide ^= 1;
            Pokepic_SetAttr(flickerOpponentData->pokepic, 6, hide);
        } else {
            flickerOpponentData->delay--;
        }
    } else {
        hide = FALSE;
        Pokepic_SetAttr(flickerOpponentData->pokepic, 6, hide);
        BattleController_EmitClearCommand(flickerOpponentData->battleSys, flickerOpponentData->battler, BATTLE_COMMAND_FLICKER_BATTLER);
        Heap_Free(data);
        SysTask_Destroy(task);
    }
}

static void BattleDisplayTask_UpdateHPGauge(SysTask *task, void *data) {
    BattleHpBar *hpBar = data;
    int result;

    switch (hpBar->script) {
    case 0:
        ov12_02264DCC(hpBar, hpBar->gainedHp);
        hpBar->script++;
    case 1:
        result = ov12_02264E00(hpBar);

        if (result == -1) {
            hpBar->script++;
        }
        break;
    default:
        BattleController_EmitClearCommand(hpBar->battleSystem, hpBar->battlerId, hpBar->unk4C);
        hpBar->unk10 = NULL;
        SysTask_Destroy(task);
        return;
    }
}

static void BattleDisplayTask_UpdateExpGauge(SysTask *task, void *data) {
    BattleHpBar *hpBar = data;
    int result;

    switch (hpBar->script) {
    case 0:
        hpBar->unk4E = 0;
        PlaySE(SEQ_SE_DP_EXP);
        ov12_02264E34(hpBar, hpBar->gainedExp);
        hpBar->script++;
    case 1:
        if (hpBar->unk4E < 8) {
            hpBar->unk4E++;
        }

        result = ov12_02264E68(hpBar);

        if (result == -1) {
            if (hpBar->unk4E >= 8) {
                StopSE(SEQ_SE_DP_EXP, 0);
                hpBar->script = 100;
            } else {
                hpBar->script++;
            }
        }
        break;
    case 2:
        hpBar->unk4E++;

        if (hpBar->unk4E >= 8) {
            StopSE(SEQ_SE_DP_EXP, 0);
            hpBar->script = 100;
        }
        break;
    default:
        BattleController_EmitClearCommand(hpBar->battleSystem, hpBar->battlerId, hpBar->unk4C);
        hpBar->unk10 = NULL;
        SysTask_Destroy(task);
        break;
    }
}

static void BattleDisplayTask_PlayFaintingSequence(SysTask *task, void *data) {
    FaintingSequenceData *faintingSequenceData = data;
    BattleAnimSystem *battleAnimSys = BattleSystem_GetAnimationSystem(faintingSequenceData->battleSys);
    int y;
    int height;

    switch (faintingSequenceData->state) {
    case 0:
        if (faintingSequenceData->isSubstitute) {
            MoveAnimation moveAnim;

            BattleController_SetMoveAnimation(faintingSequenceData->battleSys, NULL, &moveAnim, 1, 15, faintingSequenceData->battler, faintingSequenceData->battler, NULL);
            BattleDisplay_PlayMoveAnimation(faintingSequenceData->battleSys, faintingSequenceData->opponentData, battleAnimSys, &moveAnim);
            faintingSequenceData->state++;
        } else {
            faintingSequenceData->state = 4;
        }
        break;
    case 2:
        BattlerSpriteContext battlerSpriteCtx;
        MoveAnimation moveAnim;

        BattleDisplay_PopulateBattlerContext(faintingSequenceData->battleSys, &faintingSequenceData->moveAnim, &battlerSpriteCtx, faintingSequenceData->battler);
        ov07_0223494C(&battlerSpriteCtx, HEAP_ID_BATTLE);

        BattleController_SetMoveAnimation(faintingSequenceData->battleSys, NULL, &moveAnim, 1, 16, faintingSequenceData->battler, faintingSequenceData->battler, NULL);
        BattleDisplay_PlayMoveAnimation(faintingSequenceData->battleSys, faintingSequenceData->opponentData, battleAnimSys, &moveAnim);
        faintingSequenceData->opponentData->unk1A0 = 0;
        faintingSequenceData->state++;
        break;
    case 1:
    case 3:
        ov07_0221C394(battleAnimSys);

        if (BattleAnimSystem_IsMoveActive(battleAnimSys) == FALSE) {
            BattleAnimSystem_FreeScriptData(battleAnimSys);
            faintingSequenceData->state++;
        }
        break;
    case 4: {
        int pan;

        if (faintingSequenceData->face == 2) {
            pan = 0x75;
        } else {
            pan = -0x75;
        }

        Species_PlayDelayedCry(BattleSystem_GetChatotVoice(faintingSequenceData->battleSys, faintingSequenceData->battler),
            5,
            faintingSequenceData->species,
            faintingSequenceData->form,
            pan,
            0x7F,
            faintingSequenceData->isTransformed,
            HEAP_ID_BATTLE,
            0);
        faintingSequenceData->state++;
    }
    case 5:
        if (IsCryFinished() == FALSE) {
            faintingSequenceData->state++;
        }
        break;
    case 6:
        if (faintingSequenceData->face == 2) {
            Sound_PlayPannedEffect(SEQ_SE_DP_POKE_DEAD3, 0x75);
        } else {
            Sound_PlayPannedEffect(SEQ_SE_DP_POKE_DEAD3, -0x75);
        }

        if (Pokepic_GetAttr(faintingSequenceData->pokepic, POKEPIC_SHADOW_H) > 0) {
            faintingSequenceData->state = 7;
        } else {
            faintingSequenceData->state = 8;
        }
        break;
    case 7:
        height = Pokepic_GetAttr(faintingSequenceData->pokepic, POKEPIC_SHADOW_H);
        height -= 8;

        if (height < 0) {
            height = 0;
        }

        Pokepic_SetAttr(faintingSequenceData->pokepic, POKEPIC_SHADOW_H, height);

        if (height) {
            break;
        }

        faintingSequenceData->state++;
    case 8:
        height = GetMonPicHeightBySpeciesGenderForm(faintingSequenceData->species, faintingSequenceData->gender, faintingSequenceData->face, faintingSequenceData->form, faintingSequenceData->personality);
        height = 0x50 - height;
        Pokepic_SetVisible(faintingSequenceData->pokepic, 0, 0, 0x50, height);
        faintingSequenceData->state++;
        break;
    case 9:
        y = Pokepic_GetAttr(faintingSequenceData->pokepic, POKEPIC_Y);
        y += 8;
        Pokepic_SetAttr(faintingSequenceData->pokepic, POKEPIC_Y, y);
        height = Pokepic_GetAttr(faintingSequenceData->pokepic, POKEPIC_H);
        height -= 8;

        if (height < 0) {
            height = 0;
        }

        Pokepic_SetAttr(faintingSequenceData->pokepic, POKEPIC_H, height);

        if (height == 0) {
            Pokepic_Delete(faintingSequenceData->pokepic);
            faintingSequenceData->state++;
        }
        break;
    case 10:
        BattleController_EmitClearCommand(faintingSequenceData->battleSys, faintingSequenceData->battler, faintingSequenceData->command);
        Heap_Free(data);
        SysTask_Destroy(task);
        break;
    }
}

static void BattleDisplayTask_FadeOut(SysTask *task, void *data) {
    FadeOutData *fadeOutData = data;
    PaletteData *paletteData = BattleSystem_GetPaletteData(fadeOutData->battleSys);
    PokepicManager *monSpriteMan = BattleSystem_GetPokepicManager(fadeOutData->battleSys);

    switch (fadeOutData->state) {
    case 0:
        sub_0201649C(BattleSystem_GetMessageIcon(fadeOutData->battleSys), 1);
        PaletteData_BeginPaletteFade(paletteData, PLTTBUF_MAIN_BG_F | PLTTBUF_SUB_BG_F | PLTTBUF_MAIN_OBJ_F | PLTTBUF_SUB_OBJ_F, 0xFFFF, 1, 0, 16, 0);
        Pokepic_StartPaletteFadeAll(monSpriteMan, 0, 16, 0, 0);
        GF_SndStartFadeOutBGM(0, 16);
        fadeOutData->state++;
    case 1:
        if (PaletteData_GetSelectedBuffersBitmask(paletteData) == 0) {
            fadeOutData->state++;
        }
        break;
    case 2:
        BattleController_EmitClearCommand(fadeOutData->battleSys, fadeOutData->battler, fadeOutData->command);
        Heap_Free(data);
        SysTask_Destroy(task);
        break;
    }
}

static void BattleDisplayTask_ToggleVanish(SysTask *task, void *data) {
    ToggleVanishData *toggleVanishData = data;
    BattleAnimSystem *battleAnimSys = BattleSystem_GetAnimationSystem(toggleVanishData->battleSys);

    switch (toggleVanishData->state) {
    case 0:
        if (toggleVanishData->opponentData->pokepic) {
            Pokepic_SetAttr(toggleVanishData->opponentData->pokepic, 6, toggleVanishData->toggleHide);

            if (toggleVanishData->toggleHide == 1) {
                toggleVanishData->state = 0xFF;
            } else {
                toggleVanishData->state++;
            }
        } else {
            toggleVanishData->state = 0xFF;
        }
        break;
    case 1:
        if (toggleVanishData->isSubstitute && toggleVanishData->opponentData->unk1A0 == 0) {
            MoveAnimation moveAnim;

            BattleController_SetMoveAnimation(toggleVanishData->battleSys, NULL, &moveAnim, 1, 15, toggleVanishData->battler, toggleVanishData->battler, NULL);
            BattleDisplay_PlayMoveAnimation(toggleVanishData->battleSys, toggleVanishData->opponentData, battleAnimSys, &moveAnim);
            toggleVanishData->state++;
        } else {
            toggleVanishData->state = 0xFF;
        }
        break;
    case 3:
        BattlerSpriteContext battlerSpriteCtx;
        MoveAnimation moveAnim;

        BattleDisplay_PopulateBattlerContext(toggleVanishData->battleSys, &toggleVanishData->moveAnim, &battlerSpriteCtx, toggleVanishData->battler);
        ov07_02234A20(&battlerSpriteCtx, HEAP_ID_BATTLE);

        BattleController_SetMoveAnimation(toggleVanishData->battleSys, NULL, &moveAnim, 1, 16, toggleVanishData->battler, toggleVanishData->battler, NULL);
        BattleDisplay_PlayMoveAnimation(toggleVanishData->battleSys, toggleVanishData->opponentData, battleAnimSys, &moveAnim);
        toggleVanishData->opponentData->unk1A0 = 1;
        toggleVanishData->state++;
        break;
    case 2:
    case 4:
        ov07_0221C394(battleAnimSys);

        if (BattleAnimSystem_IsMoveActive(battleAnimSys) == FALSE) {
            BattleAnimSystem_FreeScriptData(battleAnimSys);
            toggleVanishData->state++;
        }
        break;
    default:
        BattleController_EmitClearCommand(toggleVanishData->battleSys, toggleVanishData->battler, toggleVanishData->command);
        Heap_Free(data);
        SysTask_Destroy(task);
        break;
    }
}

static void BattleDisplayTask_PlayLevelUpAnimation(SysTask *task, void *data) {
    PlayLevelUpAnimationData *playLevelUpAnimationData = data;

    switch (playLevelUpAnimationData->state) {
    case 0:
        BattleHpBar_BeginExpBarFullFlashEffect(playLevelUpAnimationData->hpBar, &playLevelUpAnimationData->flashComplete);
        PlaySE(SEQ_SE_DP_EXPMAX);
        playLevelUpAnimationData->state++;
        break;
    case 1:
        if (playLevelUpAnimationData->flashComplete == 1) {
            BattleController_EmitClearCommand(playLevelUpAnimationData->battleSys, playLevelUpAnimationData->battler, playLevelUpAnimationData->command);
            Heap_Free(data);
            SysTask_Destroy(task);
        }
        break;
    }
}

static void BattleDisplayTask_WaitForBattleMessagePrint(SysTask *task, void *data) {
    BattleMessageWaitTask *waitTask = data;

    if (ov12_0223BB78(waitTask->battleSys)) {
        sub_0200F450(ov12_0223BB78(waitTask->battleSys));
        ov12_0223BB80(waitTask->battleSys, NULL);
    }

    if (TextPrinterCheckActive(waitTask->msgIdx) == FALSE) {
        BattleController_EmitClearCommand(waitTask->battleSys, waitTask->battler, waitTask->command);
        Heap_Free(data);
        SysTask_Destroy(task);
    }
}

static void BattleDisplayTask_WaitForAlertMessagePrint(SysTask *task, void *data) {
    AlertMsgData *alertMsgData = data;

    switch (alertMsgData->state) {
    case 0:
        if (TextPrinterCheckActive(alertMsgData->msgIdx) == FALSE) {
            alertMsgData->state++;
            alertMsgData->delay = 0;
        }
        break;
    case 1:
        if (++alertMsgData->delay == 40) {
            BattleController_EmitAlertMessageAck(alertMsgData->battleSys, alertMsgData->battler);
            BattleController_EmitClearCommand(alertMsgData->battleSys, alertMsgData->battler, alertMsgData->command);
            Heap_Free(data);
            SysTask_Destroy(task);
        }
        break;
    }
}

extern const int ov12_0226D18C[];
extern const u8 ov12_0226D350[];

static void ov12_02260668(SysTask *task, void *data) {
    UISetupTaskData *uiSetupTaskData = (UISetupTaskData *)data;
    BgConfig *bgConfig = BattleSystem_GetBgConfig(uiSetupTaskData->battleSys);
    PaletteData *paletteData = BattleSystem_GetPaletteData(uiSetupTaskData->battleSys);
    int terrain = BattleSystem_GetTerrainId(uiSetupTaskData->battleSys);
    int fadeTarget = ov12_0226D18C[BattleSystem_GetBackgroundId(uiSetupTaskData->battleSys)];

    uiSetupTaskData->frameCount++;

    switch (uiSetupTaskData->step) {
    case 0:
        ParticleEffectTemplate particleEffectTemplate;

        uiSetupTaskData->animContext = ov07_0223458C(HEAP_ID_BATTLE, NULL);

        particleEffectTemplate.resourceID = ov12_0226D350[terrain];
        particleEffectTemplate.cameraProjection = 1;

        uiSetupTaskData->animObjects[0] = ov07_022345C8(uiSetupTaskData->animContext, &particleEffectTemplate);

        particleEffectTemplate.resourceID = ov12_0226D350[terrain] + 1;
        particleEffectTemplate.cameraProjection = 1;

        uiSetupTaskData->animObjects[1] = ov07_022345C8(uiSetupTaskData->animContext, &particleEffectTemplate);

        ov07_02234694(uiSetupTaskData->animObjects[0]);
        PlaySE(SEQ_SE_DP_PASA2);

        uiSetupTaskData->step = 1;
    case 1:
        if (uiSetupTaskData->frameCount == 10) {
            PaletteData_BeginPaletteFade(paletteData, PLTTBUF_MAIN_BG_F, 0xF3FF, 0, 0, 16, fadeTarget);
            PaletteData_BeginPaletteFade(paletteData, PLTTBUF_MAIN_OBJ_F, 0x3FFF, 0, 0, 16, fadeTarget);
        }

        if (uiSetupTaskData->frameCount >= 10 && uiSetupTaskData->fadeStep < 16) {
            u16 i, v7;
            u16 *buffer;

            uiSetupTaskData->fadeStep++;

            if (uiSetupTaskData->fadeStep > 16) {
                uiSetupTaskData->fadeStep = 16;
            }

            buffer = PaletteData_GetFadedBuf(paletteData, 1);

            for (i = 0; i < 256; i++) {
                v7 = (0 + ((0x1F - 0) * uiSetupTaskData->fadeStep >> 4));
                buffer[i] = v7 | (v7 << 5) | (v7 << 10);
            }
        }

        if (uiSetupTaskData->frameCount == 20) {
            ov07_02234694(uiSetupTaskData->animObjects[1]);
        }

        if (uiSetupTaskData->frameCount == 23) {
            PlaySE(SEQ_SE_DP_PASA3);
        }

        if (uiSetupTaskData->frameCount == 28) {
            MI_CpuCopy16(ov12_0223BAE0(uiSetupTaskData->battleSys), PaletteData_GetUnfadedBuf(paletteData, 0), 32 * 7);

            if (BattleSystem_GetBattleType(uiSetupTaskData->battleSys) == (BATTLE_TYPE_DOUBLES | BATTLE_TYPE_MULTI | BATTLE_TYPE_AI)) {
                MI_CpuCopy16(ov12_0223BAEC(uiSetupTaskData->battleSys), PaletteData_GetUnfadedBuf(paletteData, 2), 32 * 5);
            } else if (BattleSystem_GetBattleType(uiSetupTaskData->battleSys) & BATTLE_TYPE_DOUBLES) {
                MI_CpuCopy16(ov12_0223BAEC(uiSetupTaskData->battleSys), PaletteData_GetUnfadedBuf(paletteData, 2), 32 * 7);
            } else if (BattleSystem_GetBattleType(uiSetupTaskData->battleSys) & BATTLE_TYPE_TRAINER) {
                MI_CpuCopy16(ov12_0223BAEC(uiSetupTaskData->battleSys), PaletteData_GetUnfadedBuf(paletteData, 2), 32 * 5);
            } else {
                MI_CpuCopy16(ov12_0223BAEC(uiSetupTaskData->battleSys), PaletteData_GetUnfadedBuf(paletteData, 2), 32 * 4);
            }

            PaletteData_BeginPaletteFade(paletteData, PLTTBUF_MAIN_BG_F, 0xF3FF, 0, 16, 0, fadeTarget);
            PaletteData_BeginPaletteFade(paletteData, PLTTBUF_MAIN_OBJ_F, 0x3FFF, 0, 16, 0, fadeTarget);
            PaletteData_BeginPaletteFade(paletteData, PLTTBUF_SUB_BG_F | PLTTBUF_SUB_OBJ_F, 0xFFFF, 0, 16, 0, fadeTarget);
        }

        if (uiSetupTaskData->frameCount >= 50) {
            PaletteData_BeginPaletteFade(paletteData, PLTTBUF_MAIN_BG_F, 0xC00, 0, 16, 0, 0);
            uiSetupTaskData->step++;
        }
        break;
    case 2:
        if (ov07_022346BC(uiSetupTaskData->animObjects[1]) == 0) {
            ov07_02234604(uiSetupTaskData->animContext);
            uiSetupTaskData->step++;
        }
        break;
    case 3:
        sub_0201649C(BattleSystem_GetMessageIcon(uiSetupTaskData->battleSys), 0);
        Heap_Free(data);
        SysTask_Destroy(task);
        break;
    case 4:
        ov07_02234628(uiSetupTaskData->animContext);
        ov07_02234604(uiSetupTaskData->animContext);
        uiSetupTaskData->step++;
    case 5:
        MI_CpuCopy16(ov12_0223BAE0(uiSetupTaskData->battleSys), PaletteData_GetUnfadedBuf(paletteData, 0), 32 * 7);

        if (BattleSystem_GetBattleType(uiSetupTaskData->battleSys) == (BATTLE_TYPE_DOUBLES | BATTLE_TYPE_MULTI | BATTLE_TYPE_AI)) {
            MI_CpuCopy16(ov12_0223BAEC(uiSetupTaskData->battleSys), PaletteData_GetUnfadedBuf(paletteData, 2), 32 * 5);
        } else if (BattleSystem_GetBattleType(uiSetupTaskData->battleSys) & BATTLE_TYPE_DOUBLES) {
            MI_CpuCopy16(ov12_0223BAEC(uiSetupTaskData->battleSys), PaletteData_GetUnfadedBuf(paletteData, 2), 32 * 7);
        } else if (BattleSystem_GetBattleType(uiSetupTaskData->battleSys) & BATTLE_TYPE_TRAINER) {
            MI_CpuCopy16(ov12_0223BAEC(uiSetupTaskData->battleSys), PaletteData_GetUnfadedBuf(paletteData, 2), 32 * 5);
        } else {
            MI_CpuCopy16(ov12_0223BAEC(uiSetupTaskData->battleSys), PaletteData_GetUnfadedBuf(paletteData, 2), 32 * 4);
        }

        PaletteData_BeginPaletteFade(paletteData, PLTTBUF_MAIN_BG_F, 0xFFFF, 0, 0, 0, 0x7FFF);
        PaletteData_BeginPaletteFade(paletteData, PLTTBUF_MAIN_OBJ_F, 0x3FFF, 0, 0, 0, 0xFFFF);
        PaletteData_BeginPaletteFade(paletteData, PLTTBUF_SUB_BG_F | PLTTBUF_SUB_OBJ_F, 0xFFFF, 0, 0, 0, 0x7FFF);
        uiSetupTaskData->step = 3;
        break;
    }
}

static void BattleDisplayTask_ForgetMove(SysTask *task, void *data) {
    ForgetMoveData *forgetMoveData = data;
    PaletteData *paletteData = BattleSystem_GetPaletteData(forgetMoveData->battleSys);

    switch (forgetMoveData->state) {
    case 0:
        PaletteData_BeginPaletteFade(paletteData, PLTTBUF_SUB_BG_F | PLTTBUF_SUB_OBJ_F, 0xFFFF, -8, 0, 16, 0);
        forgetMoveData->state++;
        break;
    case 1:
        if (PaletteData_GetSelectedBuffersBitmask(paletteData) == 0) {
            ov12_02237B0C(forgetMoveData->battleSys);

            forgetMoveData->battlePartyCtx = Heap_Alloc(HEAP_ID_BATTLE, sizeof(BattlePartyContext));
            forgetMoveData->battlePartyCtx->party = BattleSystem_GetParty(forgetMoveData->battleSys, forgetMoveData->battler);
            forgetMoveData->battlePartyCtx->battleSys = forgetMoveData->battleSys;
            forgetMoveData->battlePartyCtx->heapID = HEAP_ID_BATTLE;
            forgetMoveData->battlePartyCtx->selectedPartyIndex = forgetMoveData->slot;
            forgetMoveData->battlePartyCtx->moveToLearn = forgetMoveData->move;
            forgetMoveData->battlePartyCtx->battlePartyExited = 0;
            forgetMoveData->battlePartyCtx->doubleBattleFirstSelectedPartySlot = 0;
            forgetMoveData->battlePartyCtx->battlePartyMode = 3;
            forgetMoveData->battlePartyCtx->selectedBattleBagItem = 0;
            forgetMoveData->battlePartyCtx->battler = forgetMoveData->battler;
            forgetMoveData->battlePartyCtx->isCursorEnabled = 0;

            ov10_0221BE20(forgetMoveData->battlePartyCtx);
            forgetMoveData->state++;
        }
        break;
    case 2:
        if (forgetMoveData->battlePartyCtx->battlePartyExited) {
            ov12_02237BB8(forgetMoveData->battleSys);
            PaletteData_BeginPaletteFade(paletteData, PLTTBUF_SUB_BG_F | PLTTBUF_SUB_OBJ_F, 0xFFFF, -8, 16, 0, 0);
            forgetMoveData->state++;
        }
        break;
    case 3:
        if (PaletteData_GetSelectedBuffersBitmask(paletteData) == 0) {
            if (forgetMoveData->battlePartyCtx->selectedMoveSlot == 4) {
                BattleController_EmitPartyMenuResult(forgetMoveData->battleSys, forgetMoveData->battler, 0xFF);
            } else {
                BattleController_EmitPartyMenuResult(forgetMoveData->battleSys, forgetMoveData->battler, forgetMoveData->battlePartyCtx->selectedMoveSlot + 1);
            }

            BattleController_EmitClearCommand(forgetMoveData->battleSys, forgetMoveData->battler, forgetMoveData->command);

            Heap_Free(forgetMoveData->battlePartyCtx);
            Heap_Free(data);
            SysTask_Destroy(task);
        }
        break;
    }
}

static void BattleDisplayTask_SetMosaic(SysTask *task, void *data) {
    SetMosaicData *setMosaicData = data;
    int intensity;

    switch (setMosaicData->state) {
    case 0:
        if (setMosaicData->counter == setMosaicData->wait) {
            setMosaicData->counter = 0;
            intensity = Pokepic_GetAttr(setMosaicData->pokepic, POKEPIC_MOSAIC);

            if (intensity > setMosaicData->intensity) {
                intensity--;
            } else if (intensity < setMosaicData->intensity) {
                intensity++;
            }

            Pokepic_SetAttr(setMosaicData->pokepic, POKEPIC_MOSAIC, intensity);

            if (intensity == setMosaicData->intensity) {
                setMosaicData->state++;
            }
        } else {
            setMosaicData->counter++;
        }
        break;
    case 1:
        BattleController_EmitClearCommand(setMosaicData->battleSys, setMosaicData->battler, setMosaicData->command);
        Heap_Free(data);
        SysTask_Destroy(task);
        break;
    }
}

enum PartyGaugeSide {
    PARTY_GAUGE_OURS,
    PARTY_GAUGE_THEIRS,
    PARTY_GAUGE_COUNT
};

static void BattleDisplayTask_ShowPartyGauge(SysTask *task, void *data) {
    PartyGaugeTask *gaugeTask = (PartyGaugeTask *)data;
    u32 showType;
    u32 gaugePosition;
    enum PartyGaugeSide side;

    if (BattleSystem_GetFieldSide(gaugeTask->battleSys, gaugeTask->battler) == 0) {
        side = 0;
    } else {
        side = 1;
    }

    switch (gaugeTask->state) {
    case 0: {
        if (gaugeTask->midBattle == FALSE) {
            showType = 0;
            gaugePosition = 1;
        } else {
            showType = 1;

            switch (gaugeTask->battlerType) {
            case BATTLER_TYPE_ENEMY_SIDE_SLOT_1:
                gaugePosition = 0;
                break;
            case BATTLER_TYPE_ENEMY_SIDE_SLOT_2:
                gaugePosition = 2;
                break;
            default:
                gaugePosition = 1;
                break;
            }
        }

        PartyGauge *gauge = PartyGauge_NewAndShow(gaugeTask->status, side, showType, gaugePosition, BattleSystem_GetSpriteSystem(gaugeTask->battleSys), BattleSystem_GetSpriteManager(gaugeTask->battleSys));
        ov12_0223A914(gaugeTask->battleSys, side, gauge);
    }
        gaugeTask->state++;
        break;
    case 1:
        if (PartyGauge_IsArrowTaskFinished(ov12_0223A908(gaugeTask->battleSys, side)) == TRUE) {
            gaugeTask->state++;
        }
        break;
    default:
        BattleController_EmitClearCommand(gaugeTask->battleSys, gaugeTask->battler, gaugeTask->command);
        Heap_Free(data);
        SysTask_Destroy(task);
        break;
    }
}

static void BattleDisplayTask_HidePartyGauge(SysTask *task, void *data) {
    PartyGaugeTask *gaugeTask = (PartyGaugeTask *)data;
    enum PartyGaugeSide side;
    u32 hideArrowType;
    u32 hideGaugeType;

    if (BattleSystem_GetFieldSide(gaugeTask->battleSys, gaugeTask->battler) == 0) {
        side = PARTY_GAUGE_OURS;
    } else {
        side = PARTY_GAUGE_THEIRS;
    }

    PartyGauge *gauge = ov12_0223A908(gaugeTask->battleSys, side);

    switch (gaugeTask->state) {
    case 0:
        if (gaugeTask->midBattle == FALSE) {
            hideArrowType = 0;
            hideGaugeType = 0;
        } else {
            hideArrowType = 1;
            hideGaugeType = 1;
        }

        PartyGauge_StartHideTask(gauge, hideArrowType, hideGaugeType);
        gaugeTask->state++;
        break;
    case 1:
        if (PartyGauge_IsHideTaskFinished(gauge) == TRUE) {
            PartyGauge_DeleteAndFreeResources(gauge);
            ov12_0223A914(gaugeTask->battleSys, side, NULL);
            gaugeTask->state++;
        }
        break;
    default:
        BattleController_EmitClearCommand(gaugeTask->battleSys, gaugeTask->battler, gaugeTask->command);
        Heap_Free(data);
        SysTask_Destroy(task);
        break;
    }
}

static void BattleDisplayTask_SpriteToOAM(SysTask *task, void *data) {
    SpriteToOAMData *spriteToOAMData = data;

    switch (spriteToOAMData->state) {
    case 0:
        GF_ASSERT(spriteToOAMData->opponentData->unk8C == NULL);
        spriteToOAMData->opponentData->unk8C = ov07_0221FB90(spriteToOAMData->battleSys, HEAP_ID_BATTLE, spriteToOAMData->battler);
        spriteToOAMData->state++;
        break;
    default:
        BattleController_EmitClearCommand(spriteToOAMData->battleSys, spriteToOAMData->battler, spriteToOAMData->command);
        Heap_Free(data);
        SysTask_Destroy(task);
        break;
    }
}

static void BattleDisplayTask_OAMToSprite(SysTask *task, void *data) {
    OAMToSpriteData *oamToSpriteData = data;

    GF_ASSERT(oamToSpriteData->opponentData->unk8C != NULL);

    if (ov07_0221FE70(oamToSpriteData->opponentData->unk8C) == 3) {
        if (oamToSpriteData->delay < 5) {
            oamToSpriteData->delay++;
            return;
        }
    }

    ov07_0221FE3C(oamToSpriteData->opponentData->unk8C, oamToSpriteData->battler);
    oamToSpriteData->opponentData->unk8C = NULL;
    BattleController_EmitClearCommand(oamToSpriteData->battleSys, oamToSpriteData->battler, oamToSpriteData->command);

    Heap_Free(data);
    SysTask_Destroy(task);
}

static void ov12_02260D84(SysTask *sysTask, void *data) {
    Data_022645C8 *unkData = data;
    PaletteData *paletteData = BattleSystem_GetPaletteData(unkData->battleSystem);
    PokepicManager *pokepicManager = BattleSystem_GetPokepicManager(unkData->battleSystem);

    switch (unkData->unk6) {
    case 0:
        if (unkData->unk7 == 0) {
            void *msgIcon = BattleSystem_GetMessageIcon(unkData->battleSystem);
            sub_0201649C(msgIcon, 1);
            Pokepic_StartPaletteFadeAll(pokepicManager, 0, 16, 0, 0xFFFF);
        } else {
            GF_SndStartFadeOutBGM(0, 16);
        }
        unkData->unk6++;
    case 1:
        if (unkData->unk7 == 0) {
            PaletteData_BlendPalette(paletteData, 0, 0, 0xA0, unkData->unk8, 0xFFFF);
            PaletteData_BlendPalette(paletteData, 0, 0xC0, 0x40, unkData->unk8, 0xFFFF);
            PaletteData_BlendPalette(paletteData, 2, 0, 0xE0, unkData->unk8, 0xFFFF);
        } else {
            PaletteData_BlendPalette(paletteData, 0, 0xA0, 0x20, unkData->unk8, 0xFFFF);
            PaletteData_BlendPalette(paletteData, 1, 0, 0x100, unkData->unk8, 0xFFFF);
            PaletteData_BlendPalette(paletteData, 3, 0, 0x100, unkData->unk8, 0xFFFF);
        }

        if (unkData->unk8++ == 16) {
            if (unkData->unk7 == 0) {
                ToggleBgLayer(0, 0);
            }
            unkData->unk6++;
        }
        break;
    case 2:
        BattleController_EmitClearCommand(unkData->battleSystem, unkData->battlerId, unkData->command);
        Heap_Free(unkData);
        SysTask_Destroy(sysTask);
    }
}

void OpponentData_SetTaskFuncs(BattleSystem *battleSys, OpponentData *opponentData) {
    u32 battleType = BattleSystem_GetBattleType(battleSys);
    u32 battleSpecial = BattleSystem_GetBattleSpecial(battleSys);

    if (battleType & BATTLE_TYPE_AI) {
        if (opponentData->battlerId) {
            opponentData->unk0[0] = &BattleDisplayTask_TrainerSetCommandSelection;
            opponentData->unk0[1] = &BattleDisplayTask_TrainerShowMoveSelectMenu;
            opponentData->unk0[2] = &BattleDisplayTask_TrainerShowTargetSelectMenu;
            opponentData->unk0[3] = &BattleDisplayTask_TrainerShowBagMenu;
            opponentData->unk0[4] = &BattleDisplayTask_TrainerShowPartyMenu;
            opponentData->unk0[5] = &BattleDisplayTask_TrainerShowYesNoMenu;
            opponentData->unk196 = 1;
        } else {
            if (battleSpecial & BATTLE_SPECIAL_RECORDING) {
                opponentData->unk0[0] = &BattleDisplayTask_RecordingSetCommandSelection;
                opponentData->unk0[1] = &BattleDisplayTask_RecordingShowMoveSelectMenu;
                opponentData->unk0[2] = &BattleDisplayTask_RecordingShowTargetSelectMenu;
                opponentData->unk0[3] = &BattleDisplayTask_RecordingShowBagMenu;
                opponentData->unk0[4] = &BattleDisplayTask_RecordingShowPartyMenu;
                opponentData->unk0[5] = &BattleDisplayTask_RecordingShowYesNoMenu;
                opponentData->unk196 = 0;
            } else {
                opponentData->unk0[0] = &BattleDisplayTask_PlayerSetCommandSelection;
                opponentData->unk0[1] = &BattleDisplayTask_PlayerShowMoveSelectMenu;
                opponentData->unk0[2] = &BattleDisplayTask_PlayerShowTargetSelectMenu;
                opponentData->unk0[3] = &BattleDisplayTask_PlayerShowBagMenu;
                opponentData->unk0[4] = &BattleDisplayTask_PlayerShowPartyMenu;
                opponentData->unk0[5] = &BattleDisplayTask_PlayerShowYesNoMenu;
                opponentData->unk196 = 0;
            }
        }
    } else if ((battleType & (BATTLE_TYPE_MULTI | BATTLE_TYPE_FRONTIER)) == (BATTLE_TYPE_MULTI | BATTLE_TYPE_FRONTIER)) {
        if (opponentData->battlerType & BATTLER_ENEMY) {
            if (BattleSystem_IsInitialized(battleSys)) {
                opponentData->unk0[0] = &BattleDisplayTask_TrainerSetCommandSelection;
                opponentData->unk0[1] = &BattleDisplayTask_TrainerShowMoveSelectMenu;
                opponentData->unk0[2] = &BattleDisplayTask_TrainerShowTargetSelectMenu;
                opponentData->unk0[3] = &BattleDisplayTask_TrainerShowBagMenu;
                opponentData->unk0[4] = &BattleDisplayTask_TrainerShowPartyMenu;
                opponentData->unk0[5] = &BattleDisplayTask_TrainerShowYesNoMenu;
                opponentData->unk196 = 1;
            } else {
                opponentData->unk0[0] = &BattleDisplayTask_LinkSetCommandSelection;
                opponentData->unk0[1] = &BattleDisplayTask_LinkShowMoveSelectMenu;
                opponentData->unk0[2] = &BattleDisplayTask_LinkShowTargetSelectMenu;
                opponentData->unk0[3] = &BattleDisplayTask_LinkShowBagMenu;
                opponentData->unk0[4] = &BattleDisplayTask_LinkShowPartyMenu;
                opponentData->unk0[5] = &BattleDisplayTask_LinkShowYesNoMenu;
                opponentData->unk196 = 2;
            }
        } else if (battleSpecial & BATTLE_SPECIAL_RECORDING) {
            opponentData->unk0[0] = &BattleDisplayTask_RecordingSetCommandSelection;
            opponentData->unk0[1] = &BattleDisplayTask_RecordingShowMoveSelectMenu;
            opponentData->unk0[2] = &BattleDisplayTask_RecordingShowTargetSelectMenu;
            opponentData->unk0[3] = &BattleDisplayTask_RecordingShowBagMenu;
            opponentData->unk0[4] = &BattleDisplayTask_RecordingShowPartyMenu;
            opponentData->unk0[5] = &BattleDisplayTask_RecordingShowYesNoMenu;
            opponentData->unk196 = 0;
        } else if (opponentData->battlerType != BattleSystem_GetBattlerType(battleSys, ov12_0223BFC0(battleSys) * 2)) {
            opponentData->unk0[0] = &BattleDisplayTask_LinkSetCommandSelection;
            opponentData->unk0[1] = &BattleDisplayTask_LinkShowMoveSelectMenu;
            opponentData->unk0[2] = &BattleDisplayTask_LinkShowTargetSelectMenu;
            opponentData->unk0[3] = &BattleDisplayTask_LinkShowBagMenu;
            opponentData->unk0[4] = &BattleDisplayTask_LinkShowPartyMenu;
            opponentData->unk0[5] = &BattleDisplayTask_LinkShowYesNoMenu;
            opponentData->unk196 = 2;
        } else {
            opponentData->unk0[0] = &BattleDisplayTask_PlayerSetCommandSelection;
            opponentData->unk0[1] = &BattleDisplayTask_PlayerShowMoveSelectMenu;
            opponentData->unk0[2] = &BattleDisplayTask_PlayerShowTargetSelectMenu;
            opponentData->unk0[3] = &BattleDisplayTask_PlayerShowBagMenu;
            opponentData->unk0[4] = &BattleDisplayTask_PlayerShowPartyMenu;
            opponentData->unk0[5] = &BattleDisplayTask_PlayerShowYesNoMenu;
            opponentData->unk196 = 0;
        }
    } else if (battleType & BATTLE_TYPE_MULTI) {
        if (battleSpecial & BATTLE_SPECIAL_RECORDING) {
            opponentData->unk0[0] = &BattleDisplayTask_RecordingSetCommandSelection;
            opponentData->unk0[1] = &BattleDisplayTask_RecordingShowMoveSelectMenu;
            opponentData->unk0[2] = &BattleDisplayTask_RecordingShowTargetSelectMenu;
            opponentData->unk0[3] = &BattleDisplayTask_RecordingShowBagMenu;
            opponentData->unk0[4] = &BattleDisplayTask_RecordingShowPartyMenu;
            opponentData->unk0[5] = &BattleDisplayTask_RecordingShowYesNoMenu;
            opponentData->unk196 = 0;
        } else if (opponentData->battlerType != BattleSystem_GetBattlerType(battleSys, ov12_0223BFC0(battleSys))) {
            opponentData->unk0[0] = &BattleDisplayTask_LinkSetCommandSelection;
            opponentData->unk0[1] = &BattleDisplayTask_LinkShowMoveSelectMenu;
            opponentData->unk0[2] = &BattleDisplayTask_LinkShowTargetSelectMenu;
            opponentData->unk0[3] = &BattleDisplayTask_LinkShowBagMenu;
            opponentData->unk0[4] = &BattleDisplayTask_LinkShowPartyMenu;
            opponentData->unk0[5] = &BattleDisplayTask_LinkShowYesNoMenu;
            opponentData->unk196 = 2;
        } else {
            opponentData->unk0[0] = &BattleDisplayTask_PlayerSetCommandSelection;
            opponentData->unk0[1] = &BattleDisplayTask_PlayerShowMoveSelectMenu;
            opponentData->unk0[2] = &BattleDisplayTask_PlayerShowTargetSelectMenu;
            opponentData->unk0[3] = &BattleDisplayTask_PlayerShowBagMenu;
            opponentData->unk0[4] = &BattleDisplayTask_PlayerShowPartyMenu;
            opponentData->unk0[5] = &BattleDisplayTask_PlayerShowYesNoMenu;
            opponentData->unk196 = 0;
        }
    } else if (battleType & BATTLE_TYPE_LINK) {
        if (battleSpecial & BATTLE_SPECIAL_RECORDING) {
            opponentData->unk0[0] = &BattleDisplayTask_RecordingSetCommandSelection;
            opponentData->unk0[1] = &BattleDisplayTask_RecordingShowMoveSelectMenu;
            opponentData->unk0[2] = &BattleDisplayTask_RecordingShowTargetSelectMenu;
            opponentData->unk0[3] = &BattleDisplayTask_RecordingShowBagMenu;
            opponentData->unk0[4] = &BattleDisplayTask_RecordingShowPartyMenu;
            opponentData->unk0[5] = &BattleDisplayTask_RecordingShowYesNoMenu;
            opponentData->unk196 = 0;
        } else if (opponentData->battlerType & BATTLER_ENEMY) {
            opponentData->unk0[0] = &BattleDisplayTask_LinkSetCommandSelection;
            opponentData->unk0[1] = &BattleDisplayTask_LinkShowMoveSelectMenu;
            opponentData->unk0[2] = &BattleDisplayTask_LinkShowTargetSelectMenu;
            opponentData->unk0[3] = &BattleDisplayTask_LinkShowBagMenu;
            opponentData->unk0[4] = &BattleDisplayTask_LinkShowPartyMenu;
            opponentData->unk0[5] = &BattleDisplayTask_LinkShowYesNoMenu;
            opponentData->unk196 = 2;
        } else {
            opponentData->unk0[0] = &BattleDisplayTask_PlayerSetCommandSelection;
            opponentData->unk0[1] = &BattleDisplayTask_PlayerShowMoveSelectMenu;
            opponentData->unk0[2] = &BattleDisplayTask_PlayerShowTargetSelectMenu;
            opponentData->unk0[3] = &BattleDisplayTask_PlayerShowBagMenu;
            opponentData->unk0[4] = &BattleDisplayTask_PlayerShowPartyMenu;
            opponentData->unk0[5] = &BattleDisplayTask_PlayerShowYesNoMenu;
            opponentData->unk196 = 0;
        }
    } else if (battleType & BATTLE_TYPE_PAL_PARK) {
        if (opponentData->battlerType & BATTLER_ENEMY) {
            opponentData->unk0[0] = &BattleDisplayTask_PalParkPokemonSetCommandSelection;
            opponentData->unk0[1] = NULL;
            opponentData->unk0[2] = NULL;
            opponentData->unk0[3] = NULL;
            opponentData->unk0[4] = NULL;
            opponentData->unk0[5] = NULL;
            opponentData->unk196 = 1;
        } else {
            opponentData->unk0[0] = &BattleDisplayTask_PlayerSetCommandSelection;
            opponentData->unk0[1] = NULL;
            opponentData->unk0[2] = NULL;
            opponentData->unk0[3] = NULL;
            opponentData->unk0[4] = NULL;
            opponentData->unk0[5] = NULL;
            opponentData->unk196 = 0;
        }
    } else if (battleType & BATTLE_TYPE_SAFARI) {
        if (opponentData->battlerType & BATTLER_ENEMY) {
            opponentData->unk0[0] = &BattleDisplayTask_SafariPokemonSetCommandSelection;
            opponentData->unk0[1] = NULL;
            opponentData->unk0[2] = NULL;
            opponentData->unk0[3] = NULL;
            opponentData->unk0[4] = NULL;
            opponentData->unk0[5] = NULL;
            opponentData->unk196 = 1;
        } else {
            opponentData->unk0[0] = &BattleDisplayTask_PlayerSetCommandSelection;
            opponentData->unk0[1] = NULL;
            opponentData->unk0[2] = NULL;
            opponentData->unk0[3] = NULL;
            opponentData->unk0[4] = NULL;
            opponentData->unk0[5] = &BattleDisplayTask_PlayerShowYesNoMenu;
            opponentData->unk196 = 0;
        }
    } else {
        if (opponentData->battlerType & BATTLER_ENEMY) {
            opponentData->unk0[0] = &BattleDisplayTask_TrainerSetCommandSelection;
            opponentData->unk0[1] = &BattleDisplayTask_TrainerShowMoveSelectMenu;
            opponentData->unk0[2] = &BattleDisplayTask_TrainerShowTargetSelectMenu;
            opponentData->unk0[3] = &BattleDisplayTask_TrainerShowBagMenu;
            opponentData->unk0[4] = &BattleDisplayTask_TrainerShowPartyMenu;
            opponentData->unk0[5] = &BattleDisplayTask_TrainerShowYesNoMenu;
            opponentData->unk196 = 1;
        } else {
            if (battleSpecial & BATTLE_SPECIAL_RECORDING) {
                opponentData->unk0[0] = &BattleDisplayTask_RecordingSetCommandSelection;
                opponentData->unk0[1] = &BattleDisplayTask_RecordingShowMoveSelectMenu;
                opponentData->unk0[2] = &BattleDisplayTask_RecordingShowTargetSelectMenu;
                opponentData->unk0[3] = &BattleDisplayTask_RecordingShowBagMenu;
                opponentData->unk0[4] = &BattleDisplayTask_RecordingShowPartyMenu;
                opponentData->unk0[5] = &BattleDisplayTask_RecordingShowYesNoMenu;
                opponentData->unk196 = 0;
            } else {
                opponentData->unk0[0] = &BattleDisplayTask_PlayerSetCommandSelection;
                opponentData->unk0[1] = &BattleDisplayTask_PlayerShowMoveSelectMenu;
                opponentData->unk0[2] = &BattleDisplayTask_PlayerShowTargetSelectMenu;
                opponentData->unk0[3] = &BattleDisplayTask_PlayerShowBagMenu;
                opponentData->unk0[4] = &BattleDisplayTask_PlayerShowPartyMenu;
                opponentData->unk0[5] = &BattleDisplayTask_PlayerShowYesNoMenu;
                opponentData->unk196 = 0;
            }
        }
    }
}

u8 OpponentData_GetBattlerType(OpponentData *opponentData) {
    return opponentData->battlerType;
}

u8 ov12_02261264(OpponentData *opponentData) {
    return opponentData->unk196;
}

Pokepic *OpponentData_GetPokepic(OpponentData *opponentData) {
    if (opponentData->pokepic) {
        return opponentData->pokepic;
    } else {
        return opponentData->unk1C;
    }
}

BattleHpBar *OpponentData_GetHpBar(OpponentData *opponentData) {
    return &opponentData->hpBar;
}

BattleCursorPosition *OpponentData_GetBattleCursorPosition(OpponentData *opponentData) {
    return &opponentData->battleCursorPosition;
}

void OpponentData_ClearBattleCursorPosition(OpponentData *opponentData) {
    MI_CpuClear8(&opponentData->battleCursorPosition, sizeof(BattleCursorPosition));
}

void OpponentData_SetTrainerVisibility(OpponentData *opponentData, BOOL drawFlag) {
    if (opponentData->managedSprite != NULL) {
        ManagedSprite_SetDrawFlag(opponentData->managedSprite, drawFlag);
    }
}

static Pokepic *BattleDisplay_NewPokepic(BattleSystem *battleSys, PokepicManager *monSpriteMan, PokepicTemplate *spriteTemplate, int x, int y, int z, int yOffset, int height, int xOffset, int shadowSize, int battler, PokepicAnimScript *animScript, PokepicCallback callback) {
    Pokepic *pokepic;
    u8 *tiles = ov12_0223BB94(ov12_0223A99C(battleSys), battler);
    int battlerType = BattleSystem_GetBattlerType(battleSys, battler);
    int face;

    if (battlerType & BATTLER_ENEMY) {
        face = 2;
    } else {
        face = 0;
    }

    sub_02014540(spriteTemplate->narcID, spriteTemplate->charDataID, HEAP_ID_BATTLE, tiles, spriteTemplate->personality, FALSE, face, spriteTemplate->species);
    ov12_0223BBA8(ov12_0223A99C(battleSys), battler, spriteTemplate->narcID);
    ov12_0223BBC0(ov12_0223A99C(battleSys), battler, spriteTemplate->palDataID);
    ov12_0223BBD8(ov12_0223A99C(battleSys), battler, yOffset);

    pokepic = PokepicManager_CreatePokepicAt(monSpriteMan, spriteTemplate, x, y + yOffset, z, battler, battler, animScript, callback);

    if (battlerType & BATTLER_ENEMY) {
        if (battlerType > BATTLER_TYPE_SOLO_ENEMY) {
            battlerType = battlerType >> 1;
        }

        Pokepic_SetAttr(pokepic, POKEPIC_SHADOW_PLTT, battlerType);
        Pokepic_SetAttr(pokepic, POKEPIC_SHADOW_SIZE, shadowSize);
        Pokepic_SetAttr(pokepic, POKEPIC_SHADOW_Y, y + 36);
        Pokepic_SetAttr(pokepic, POKEPIC_SHADOW_XOFFSET, xOffset);
        Pokepic_SetAttr(pokepic, POKEPIC_SHADOW_YOFFSET, 36 - yOffset);
        Pokepic_SetAttr(pokepic, POKEPIC_SHADOW_H, height);
    }

    return pokepic;
}

static void ov12_02261390(BattleSystem *battleSys, OpponentData *opponentData, RecallMsgMessage *message, BattleMessage *battleMsg) {
    if (opponentData->battlerType & 1) {
        if (BattleSystem_GetBattleType(battleSys) & BATTLE_TYPE_LINK) {
            // {TRAINER} withdrew {MON}!
            battleMsg->id = msg_0197_00990;
            battleMsg->tag = TAG_TRNAME_NICKNAME;
            battleMsg->param[0] = opponentData->battlerId;
            battleMsg->param[1] = opponentData->battlerId | (message->partySlot << 8);
        } else {
            // {CLASS} {TRAINER} withdrew {MON}
            battleMsg->id = msg_0197_00989;
            battleMsg->tag = TAG_TRCLASS_TRNAME_NICKNAME;
            battleMsg->param[0] = opponentData->battlerId;
            battleMsg->param[1] = opponentData->battlerId;
            battleMsg->param[2] = opponentData->battlerId | (message->partySlot << 8);
        }
    } else {
        if ((BattleSystem_GetBattleType(battleSys) & BATTLE_TYPE_DOUBLES) == FALSE && (BattleSystem_GetBattleType(battleSys) & BATTLE_TYPE_LINK) == FALSE) {
            if (message->hpPercent == 0) {
                // {MON}, switch out! Come back!
                battleMsg->id = msg_0197_00984;
            } else if (message->hpPercent < 25) {
                // {MON}, come back!
                battleMsg->id = msg_0197_00985;
            } else if (message->hpPercent < 50) {
                // {MON}, good! Come back!
                battleMsg->id = msg_0197_00988;
            } else if (message->hpPercent < 75) {
                // {MON}, OK! Come back!
                battleMsg->id = msg_0197_00986;
            } else {
                // {MON}, enough! Get back!
                battleMsg->id = msg_0197_00987;
            }
        } else {
            // {MON}, come back!
            battleMsg->id = msg_0197_00985;
        }

        battleMsg->tag = TAG_NICKNAME;
        battleMsg->param[0] = opponentData->battlerId | (message->partySlot << 8);
    }
}

static void ov12_02261464(BattleSystem *battleSys, OpponentData *opponentData, SendOutMsgMessage *message, BattleMessage *battleMsg) {
    if (opponentData->battlerType & 1) {
        if (!(BattleSystem_GetBattleType(battleSys) & BATTLE_TYPE_LINK)) {
            // {CLASS} {TRAINER} sent out {MON}!
            battleMsg->id = msg_0197_00972;
            battleMsg->tag = TAG_TRCLASS_TRNAME_NICKNAME;
            battleMsg->param[0] = opponentData->battlerId;
            battleMsg->param[1] = opponentData->battlerId;
            battleMsg->param[2] = opponentData->battlerId | (message->partySlot << 8);
        } else {
            // {TRAINER} sent out {MON}!
            battleMsg->id = msg_0197_00974;
            battleMsg->tag = TAG_TRNAME_NICKNAME;
            battleMsg->param[0] = opponentData->battlerId;
            battleMsg->param[1] = opponentData->battlerId | (message->partySlot << 8);
        }
    } else {
        if ((BattleSystem_GetBattleType(battleSys) & BATTLE_TYPE_DOUBLES) == FALSE && (BattleSystem_GetBattleType(battleSys) & BATTLE_TYPE_LINK) == FALSE) {
            if (message->hpPercent < 100) {
                // Your foe's weak! Get 'em {MON}!
                battleMsg->id = msg_0197_00982;
            } else if (message->hpPercent < 325) {
                // Just a little more! Hang in there, {MON}!
                battleMsg->id = msg_0197_00983;
            } else if (message->hpPercent < 550) {
                // Go for it, {MON}!
                battleMsg->id = msg_0197_00981;
            } else if (message->hpPercent < 775) {
                // You're in charge, {MON}!
                battleMsg->id = msg_0197_00980;
            } else {
                // Go! {MON}!
                battleMsg->id = msg_0197_00979;
            }
        } else {
            // Go! {MON}!
            battleMsg->id = msg_0197_00979;
        }

        battleMsg->tag = TAG_NICKNAME;
        battleMsg->param[0] = opponentData->battlerId | (message->partySlot << 8);
    }
}

static void ov12_02261544(BattleSystem *battleSys, OpponentData *unused, BattleMessage *battleMsg) {
    u32 battleType = BattleSystem_GetBattleType(battleSys);
    int battler1;
    int battler2;

    if (battleType & BATTLE_TYPE_DOUBLES) {
        battler1 = BattleSystem_GetBattlerFromBattlerType(battleSys, BATTLER_TYPE_ENEMY_SIDE_SLOT_1);
        battler2 = BattleSystem_GetBattlerFromBattlerType(battleSys, BATTLER_TYPE_ENEMY_SIDE_SLOT_2);
    } else {
        battler1 = BattleSystem_GetBattlerFromBattlerType(battleSys, BATTLER_TYPE_SOLO_ENEMY);
        battler2 = battler1;
    }

    if (battleType & BATTLE_TYPE_LINK) {
        if (battleType & BATTLE_TYPE_FRONTIER) {
            // You are challenged by {CLASS} {TRAINER} and {CLASS} {TRAINER}!
            battleMsg->id = msg_0197_00992;
            battleMsg->tag = TAG_TRCLASS_TRNAME_TRCLASS_TRNAME;
            battleMsg->param[0] = battler1;
            battleMsg->param[1] = battler1;
            battleMsg->param[2] = battler2;
            battleMsg->param[3] = battler2;
        } else if (battleType & BATTLE_TYPE_MULTI) {
            // You are challegend by {TRAINER} and {TRAINER}!
            battleMsg->id = msg_0197_00971;
            battleMsg->tag = TAG_TRNAME_TRNAME;
            battleMsg->param[0] = battler1;
            battleMsg->param[1] = battler2;
        } else {
            // You are challenged by {TRAINER}!
            battleMsg->id = msg_0197_00970;
            battleMsg->tag = TAG_TRNAME;
            battleMsg->param[0] = battler1;
        }
    } else {
        if (battleType & BATTLE_TYPE_TAG || battleType & BATTLE_TYPE_MULTI) {
            // You are challenged by {CLASS} {TRAINER} and {CLASS} {TRAINER}!
            battleMsg->id = msg_0197_00992;
            battleMsg->tag = TAG_TRCLASS_TRNAME_TRCLASS_TRNAME;
            battleMsg->param[0] = battler1;
            battleMsg->param[1] = battler1;
            battleMsg->param[2] = battler2;
            battleMsg->param[3] = battler2;
        } else {
            // You are challegend by {CLASS} {TRAINER}
            battleMsg->id = msg_0197_00969;
            battleMsg->tag = TAG_TRCLASS_TRNAME;
            battleMsg->param[0] = battler1;
            battleMsg->param[1] = battler1;
        }
    }
}

static void ov12_022615F0(BattleSystem *battleSys, OpponentData *opponentData, LeadMonMsgMessage *message, BattleMessage *battleMsg) {
    u32 battleType = BattleSystem_GetBattleType(battleSys);
    int battler1;
    int battler2;

    if (opponentData->battlerType & BATTLER_ENEMY) {
        if (battleType & BATTLE_TYPE_DOUBLES) {
            battler1 = opponentData->battlerId;
            battler2 = BattleSystem_GetBattlerIdPartner(battleSys, opponentData->battlerId);
        } else {
            battler1 = opponentData->battlerId;
            battler2 = battler1;
        }

        if (battleType & BATTLE_TYPE_LINK) {
            if (battleType & BATTLE_TYPE_FRONTIER) {
                // {CLASS} {TRAINER} sent out {MON}!
                // {CLASS} {TRAINER} sent out {MON}!
                battleMsg->id = msg_0197_00991;
                battleMsg->tag = TAG_TRCLASS_TRNAME_NICKNAME_TRCLASS_TRNAME_NICKNAME;
                battleMsg->param[0] = battler1;
                battleMsg->param[1] = battler1;
                battleMsg->param[2] = battler1 | (message->partySlot[battler1] << 8);
                battleMsg->param[3] = battler2;
                battleMsg->param[4] = battler2;
                battleMsg->param[5] = battler2 | (message->partySlot[battler2] << 8);
            } else if (battleType & BATTLE_TYPE_MULTI) {
                // {Trainer} sent out {MON}!
                // {Trainer} sent out {MON}!
                battleMsg->id = msg_0197_00976;
                battleMsg->tag = TAG_TRNAME_NICKNAME_TRNAME_NICKNAME;
                battleMsg->param[0] = battler1;
                battleMsg->param[1] = battler1 | (message->partySlot[battler1] << 8);
                battleMsg->param[2] = battler2;
                battleMsg->param[3] = battler2 | (message->partySlot[battler2] << 8);
            } else if (battleType & BATTLE_TYPE_DOUBLES) {
                // {TRAINER} sent out {MON} and {MON}!
                battleMsg->id = msg_0197_00975;
                battleMsg->tag = TAG_TRNAME_NICKNAME_NICKNAME;
                battleMsg->param[0] = battler1;
                battleMsg->param[1] = battler1 | (message->partySlot[battler1] << 8);
                battleMsg->param[2] = battler2 | (message->partySlot[battler2] << 8);
            } else {
                // {TRAINER} sent out {MON}!
                battleMsg->id = msg_0197_00974;
                battleMsg->tag = TAG_TRNAME_NICKNAME;
                battleMsg->param[0] = battler1;
                battleMsg->param[1] = battler1 | (message->partySlot[battler1] << 8);
            }
        } else {
            if (battleType & BATTLE_TYPE_TAG || battleType & BATTLE_TYPE_MULTI) {
                // {CLASS} {TRAINER} sent out {MON}!
                // {CLASS} {TRAINER} sent out {MON}!
                battleMsg->id = msg_0197_00991;
                battleMsg->tag = TAG_TRCLASS_TRNAME_NICKNAME_TRCLASS_TRNAME_NICKNAME;
                battleMsg->param[0] = battler1;
                battleMsg->param[1] = battler1;
                battleMsg->param[2] = battler1 | (message->partySlot[battler1] << 8);
                battleMsg->param[3] = battler2;
                battleMsg->param[4] = battler2;
                battleMsg->param[5] = battler2 | (message->partySlot[battler2] << 8);
            } else if (battleType & BATTLE_TYPE_DOUBLES) {
                // {CLASS} {TRAINER} sent out {MON} and {MON}!
                battleMsg->id = msg_0197_00973;
                battleMsg->tag = TAG_TRCLASS_TRNAME_NICKNAME_NICKNAME;
                battleMsg->param[0] = battler1;
                battleMsg->param[1] = battler1;
                battleMsg->param[2] = battler1 | (message->partySlot[battler1] << 8);
                battleMsg->param[3] = battler2 | (message->partySlot[battler2] << 8);
            } else {
                // {CLASS} {TRAINER} sent out {MON}!
                battleMsg->id = msg_0197_00972;
                battleMsg->tag = TAG_TRCLASS_TRNAME_NICKNAME;
                battleMsg->param[0] = battler1;
                battleMsg->param[1] = battler1;
                battleMsg->param[2] = battler1 | (message->partySlot[battler1] << 8);
            }
        }
    } else {
        if (battleType & BATTLE_TYPE_LINK) {
            u8 networkID = ov12_0223BFC0(battleSys);

            if (battleType & BATTLE_TYPE_MULTI) {
                switch (ov12_0223BFCC(battleSys, networkID)) {
                case 0:
                case 3:
                    battler1 = BattleSystem_GetBattlerFromBattlerType(battleSys, BATTLER_TYPE_PLAYER_SIDE_SLOT_2);
                    battler2 = BattleSystem_GetBattlerFromBattlerType(battleSys, BATTLER_TYPE_PLAYER_SIDE_SLOT_1);
                    break;
                case 1:
                case 2:
                    battler1 = BattleSystem_GetBattlerFromBattlerType(battleSys, BATTLER_TYPE_PLAYER_SIDE_SLOT_1);
                    battler2 = BattleSystem_GetBattlerFromBattlerType(battleSys, BATTLER_TYPE_PLAYER_SIDE_SLOT_2);
                    break;
                }
            } else if (battleType & BATTLE_TYPE_DOUBLES) {
                battler1 = BattleSystem_GetBattlerFromBattlerType(battleSys, BATTLER_TYPE_PLAYER_SIDE_SLOT_1);
                battler2 = BattleSystem_GetBattlerFromBattlerType(battleSys, BATTLER_TYPE_PLAYER_SIDE_SLOT_2);
            } else {
                battler1 = BattleSystem_GetBattlerFromBattlerType(battleSys, BATTLER_TYPE_SOLO_PLAYER);
                battler2 = battler1;
            }
        } else if (battleType & BATTLE_TYPE_MULTI) {
            battler1 = BattleSystem_GetBattlerIdPartner(battleSys, opponentData->battlerId);
            battler2 = opponentData->battlerId;
        } else if (battleType & BATTLE_TYPE_DOUBLES) {
            battler1 = BattleSystem_GetBattlerFromBattlerType(battleSys, BATTLER_TYPE_PLAYER_SIDE_SLOT_1);
            battler2 = BattleSystem_GetBattlerFromBattlerType(battleSys, BATTLER_TYPE_PLAYER_SIDE_SLOT_2);
        } else {
            battler1 = opponentData->battlerId;
            battler2 = battler1;
        }

        if (battleType & BATTLE_TYPE_LINK) {
            if (battleType & BATTLE_TYPE_MULTI) {
                // {TRAINER} Sent out {MON}! Go! {MON}!
                battleMsg->id = msg_0197_00977;
                battleMsg->tag = TAG_TRNAME_NICKNAME_NICKNAME;
                battleMsg->param[0] = battler1;
                battleMsg->param[1] = battler1 | (message->partySlot[battler1] << 8);
                battleMsg->param[2] = battler2 | (message->partySlot[battler2] << 8);
            } else if (battleType & BATTLE_TYPE_DOUBLES) {
                // Go! {MON} and {MON}!
                battleMsg->id = msg_0197_00978;
                battleMsg->tag = TAG_NICKNAME_NICKNAME;
                battleMsg->param[0] = battler1 | (message->partySlot[battler1] << 8);
                battleMsg->param[1] = battler2 | (message->partySlot[battler2] << 8);
            } else {
                // Go! {MON}!
                battleMsg->id = msg_0197_00979;
                battleMsg->tag = TAG_NICKNAME;
                battleMsg->param[0] = battler1 | (message->partySlot[battler1] << 8);
            }
        } else {
            if (battleType & BATTLE_TYPE_MULTI) {
                // {CLASS} {TRAINER} sent out {MON}! Go! {MON}!
                battleMsg->id = msg_0197_00993;
                battleMsg->tag = TAG_TRCLASS_TRNAME_NICKNAME_NICKNAME;
                battleMsg->param[0] = battler1;
                battleMsg->param[1] = battler1;
                battleMsg->param[2] = battler1 | (message->partySlot[battler1] << 8);
                battleMsg->param[3] = battler2 | (message->partySlot[battler2] << 8);
            } else if (battleType & BATTLE_TYPE_DOUBLES) {
                // Go! {MON} and {MON}!
                battleMsg->id = msg_0197_00978;
                battleMsg->tag = TAG_NICKNAME_NICKNAME;
                battleMsg->param[0] = battler1 | (message->partySlot[battler1] << 8);
                battleMsg->param[1] = battler2 | (message->partySlot[battler2] << 8);
            } else {
                // Go! {MON}!
                battleMsg->id = msg_0197_00979;
                battleMsg->tag = TAG_NICKNAME;
                battleMsg->param[0] = battler1 | (message->partySlot[battler1] << 8);
            }
        }
    }
}

static void ov12_02261928(BattleSystem *battleSys, OpponentData *opponentData, BattleMessage *battleMsg) {
    u32 battleType = BattleSystem_GetBattleType(battleSys);
    int battler1;
    int battler2;
    int battleResultMask = BattleSystem_GetBattleOutcomeFlags(battleSys);

    if (battleType & BATTLE_TYPE_DOUBLES) {
        battler1 = BattleSystem_GetBattlerFromBattlerType(battleSys, BATTLER_TYPE_ENEMY_SIDE_SLOT_1);
        battler2 = BattleSystem_GetBattlerFromBattlerType(battleSys, BATTLER_TYPE_ENEMY_SIDE_SLOT_2);
    } else {
        battler1 = BattleSystem_GetBattlerFromBattlerType(battleSys, BATTLER_TYPE_SOLO_ENEMY);
        battler2 = battler1;
    }

    switch (battleResultMask) {
    case BATTLE_RESULT_WIN:
        if (battleType & BATTLE_TYPE_MULTI) {
            // Player defeated {TRAINER} and {TRAINER}!
            battleMsg->id = msg_0197_00786;
            battleMsg->tag = TAG_TRNAME_TRNAME;
            battleMsg->param[0] = battler1;
            battleMsg->param[1] = battler2;
        } else {
            // Player defeated {TRAINER}!
            battleMsg->id = msg_0197_00785;
            battleMsg->tag = TAG_TRNAME;
            battleMsg->param[0] = battler1;
        }
        break;
    case BATTLE_RESULT_LOSE:
        if (battleType & BATTLE_TYPE_MULTI) {
            // Player lost to {TRAINER} and {TRAINER}!
            battleMsg->id = msg_0197_00788;
            battleMsg->tag = TAG_TRNAME_TRNAME;
            battleMsg->param[0] = battler1;
            battleMsg->param[1] = battler2;
        } else {
            // Player lost against {TRAINER}!
            battleMsg->id = msg_0197_00787;
            battleMsg->tag = TAG_TRNAME;
            battleMsg->param[0] = battler1;
        }
        break;
    case BATTLE_RESULT_DRAW:
        if (battleType & BATTLE_TYPE_MULTI) {
            // Player battled to a draw against {TRAINER} and {TRAINER}!
            battleMsg->id = msg_0197_00790;
            battleMsg->tag = TAG_TRNAME_TRNAME;
            battleMsg->param[0] = battler1;
            battleMsg->param[1] = battler2;
        } else {
            // Player battled to a draw against {TRAINER}!
            battleMsg->id = msg_0197_00789;
            battleMsg->tag = TAG_TRNAME;
            battleMsg->param[0] = battler1;
        }
        break;
    }
}

static void ov12_022619E4(BattleSystem *battleSys, OpponentData *opponentData, EscapeMsgMessage *message, BattleMessage *battleMsg) {
    int playerMonCount = 0;
    int enemyMonCount = 0;

    for (int i = 0; i < BattleSystem_GetMaxBattlers(battleSys); i++) {
        if (message->escaperBitmask & MaskOfFlagNo(i)) {
            if (BattleSystem_GetFieldSide(battleSys, i)) {
                enemyMonCount++;
            } else {
                playerMonCount++;
            }
        }
    }

    if (playerMonCount && enemyMonCount) {
        // Got away safely!
        battleMsg->id = msg_0197_00781;
        battleMsg->tag = TAG_NONE;
        BattleSystem_SetBattleOutcomeFlags(battleSys, BATTLE_RESULT_DRAW | BATTLE_RESULT_TRY_FLEE | BATTLE_RESULT_TRY_FLEE_WAIT);
    } else if (playerMonCount) {
        // Got away safely!
        battleMsg->id = msg_0197_00781;
        battleMsg->tag = TAG_NONE;
        BattleSystem_SetBattleOutcomeFlags(battleSys, BATTLE_RESULT_LOSE | BATTLE_RESULT_TRY_FLEE | BATTLE_RESULT_TRY_FLEE_WAIT);
    } else {
        if (BattleSystem_GetBattleType(battleSys) & BATTLE_TYPE_MULTI) {
            // {TRAINER} and {TRAINER} fled!
            battleMsg->id = msg_0197_00792;
            battleMsg->tag = TAG_TRNAME_TRNAME;
            battleMsg->param[0] = BattleSystem_GetBattlerFromBattlerType(battleSys, BATTLER_TYPE_ENEMY_SIDE_SLOT_1);
            battleMsg->param[1] = BattleSystem_GetBattlerFromBattlerType(battleSys, BATTLER_TYPE_ENEMY_SIDE_SLOT_2);
        } else if (BattleSystem_GetBattleType(battleSys) & BATTLE_TYPE_DOUBLES) {
            // {TRAINER} fled!
            battleMsg->id = msg_0197_00791;
            battleMsg->tag = TAG_TRNAME;
            battleMsg->param[0] = BattleSystem_GetBattlerFromBattlerType(battleSys, BATTLER_TYPE_ENEMY_SIDE_SLOT_1);
        } else {
            // {TRAINER} fled!
            battleMsg->id = msg_0197_00791;
            battleMsg->tag = TAG_TRNAME;
            battleMsg->param[0] = BattleSystem_GetBattlerFromBattlerType(battleSys, BATTLER_TYPE_SOLO_ENEMY);
        }

        BattleSystem_SetBattleOutcomeFlags(battleSys, BATTLE_RESULT_WIN | BATTLE_RESULT_TRY_FLEE | BATTLE_RESULT_TRY_FLEE_WAIT);
    }
}

static void ov12_02261AD4(BattleSystem *battleSys, OpponentData *opponentData, BattleMessage *battleMsg) {
    // {TRAINER} forfeited the match!
    battleMsg->id = msg_0197_00956;
    battleMsg->tag = TAG_TRNAME;

    if (BattleSystem_GetBattleType(battleSys) & BATTLE_TYPE_LINK) {
        if (ov12_0223BFCC(battleSys, ov12_0223BFC0(battleSys))) {
            battleMsg->param[0] = BattleSystem_GetBattlerFromBattlerType(battleSys, BATTLER_TYPE_PLAYER_SIDE_SLOT_2);
        } else {
            battleMsg->param[0] = BattleSystem_GetBattlerFromBattlerType(battleSys, BATTLER_TYPE_PLAYER_SIDE_SLOT_1);
        }
    } else {
        battleMsg->param[0] = opponentData->battlerId;
    }

    BattleSystem_SetBattleOutcomeFlags(battleSys, BATTLE_RESULT_LOSE | BATTLE_RESULT_TRY_FLEE | BATTLE_RESULT_TRY_FLEE_WAIT);
}

static ManagedSprite *BattleDisplay_NewManagedSpriteTrainer(BattleSystem *battleSys, int side, int trainerClass, int battlerType, u32 isLink, s16 x, s16 y) {
    SpriteSystem *spriteSys = BattleSystem_GetSpriteSystem(battleSys);
    SpriteManager *spriteMan = BattleSystem_GetSpriteManager(battleSys);
    PaletteData *paletteData = BattleSystem_GetPaletteData(battleSys);
    int face;

    if (side & 1) {
        face = 2;
    } else {
        face = 0;
    }

    ManagedSprite *managedSprite = sub_02070C24(spriteSys, spriteMan, paletteData, x, y, trainerClass, face, isLink, battlerType, HEAP_ID_BATTLE);

    return managedSprite;
}

static void BattleDisplay_PlayMoveAnimation(BattleSystem *battleSys, OpponentData *opponentData, BattleAnimSystem *battleAnimSystem, MoveAnimation *animation) {
    BattleAnimBattlerContext battlerContext;
    int move;

    if (animation->animMode == 0) {
        battlerContext.moveArcID = 10;
        move = animation->move;
    } else {
        battlerContext.moveArcID = 61;
        move = animation->secondaryAnimID;
    }

    battlerContext.bgConfig = BattleSystem_GetBgConfig(battleSys);
    battlerContext.paletteData = BattleSystem_GetPaletteData(battleSys);
    battlerContext.spriteSystem = BattleSystem_GetSpriteSystem(battleSys);

    for (int i = 0; i < 4; i++) {
        battlerContext.pokemonSpriteData[i] = ov12_0223BB88(battleSys, i);
        battlerContext.battlerSpecies[i] = animation->species[i];
        battlerContext.battlerGenders[i] = animation->genders[i];
        battlerContext.battlerShinyFlags[i] = animation->isShiny[i];
        battlerContext.battlerForms[i] = animation->formNums[i];
        battlerContext.battlerPersonalities[i] = animation->personalities[i];
        battlerContext.battlerMoveEffects[i] = animation->moveEffectMasks[i];
    }

    ov12_0223C1C4(battleSys, &(battlerContext.battlerTypes[0]));
    ov12_0223C1F4(battleSys, &(battlerContext.pokemonSprites[0]));

    battlerContext.battleType = BattleSystem_GetBattleType(battleSys);
    battlerContext.chatotCry = BattleSystem_GetChatotVoice(battleSys, opponentData->battlerId);
    battlerContext.bgTiles = ov12_0223BAD0(battleSys);
    battlerContext.bgPaletteBuffer = ov12_0223BAD8(battleSys);
    battlerContext.battleBgRef.narcID = 7;
    battlerContext.battleBgRef.tilesNarcMemberIdx = 3 + BattleSystem_GetBackgroundId(battleSys);
    battlerContext.battleBgRef.paletteNarcMemberIdx = 176 + BattleSystem_GetBackgroundId(battleSys) * 3 + ov12_0223B52C(battleSys);
    battlerContext.battleBgRef.tilemapNarcMemberIdx = 2;
    battlerContext.battleBgRef.paletteDestStart = 0;
    battlerContext.battleBgRef.paletteSrcSize = 8;

    ov07_0221C01C(battleAnimSystem, animation, (u16)move, &battlerContext);
}

static void BattleDisplay_PopulateBattlerContext(BattleSystem *battleSys, MoveAnimation *animation, BattlerSpriteContext *battlerSpriteCtx, int battler) {
    battlerSpriteCtx->targetBattler = battler;
    battlerSpriteCtx->sourceBattler = battler;

    for (int i = 0; i < BATTLER_MAX; i++) {
        battlerSpriteCtx->pokemonSpriteData[i] = ov12_0223BB88(battleSys, i);
        battlerSpriteCtx->species[i] = animation->species[i];
        battlerSpriteCtx->genders[i] = animation->genders[i];
        battlerSpriteCtx->shinyFlags[i] = animation->isShiny[i];
        battlerSpriteCtx->forms[i] = animation->formNums[i];
        battlerSpriteCtx->personalities[i] = animation->personalities[i];
    }

    ov12_0223C1C4(battleSys, &(battlerSpriteCtx->types[0]));
    ov12_0223C1F4(battleSys, &(battlerSpriteCtx->sprites[0]));
}

static void BattleDisplay_GetAnimHideFlags(u8 *hideHealthboxes, u8 *hideShadows, int animMode, int secondaryAnimID, u16 move) {
    if (animMode == 0) {
        if ((GetMoveAttr(move, 9) & 0x40) == 0) {
            hideHealthboxes[0] = 1;
        } else {
            hideHealthboxes[0] = 0;
        }

        if (GetMoveAttr(move, 9) & 0x80) {
            hideShadows[0] = 1;
        } else {
            hideShadows[0] = 0;
        }
    } else {
        switch (secondaryAnimID) {
        case 18:
        case 19:
        case 20:
        case 21:
        case 22:
        case 31:
        case 32:
        case 34:
        case 35:
        case 37:
        case 39:
            hideHealthboxes[0] = 1;
            hideShadows[0] = 0;
            break;
        case 36:
        case 38:
            hideHealthboxes[0] = 1;
            hideShadows[0] = 1;
            break;
        default:
            hideHealthboxes[0] = 0;
            hideShadows[0] = 0;
            break;
        }
    }
}

static BOOL ov12_02261DC8(TrainerEncounterData *trainerEncounterData, ManagedSprite *unused) {
    BallThrowFlashData *ballThrowFlashData;
    BOOL val = FALSE;
    int userAttr = ManagedSprite_GetUserAttrForCurrentAnimFrame(trainerEncounterData->managedSprite);

    switch (userAttr) {
    case 1:
        if (trainerEncounterData->ballFlashStarted == 0) {
            trainerEncounterData->ballFlashStarted = 1;
            ballThrowFlashData = (BallThrowFlashData *)Heap_Alloc(HEAP_ID_BATTLE, sizeof(BallThrowFlashData));
            ballThrowFlashData->state = 0;
            ballThrowFlashData->unread_04 = 0;

            SysTask_CreateOnMainQueue(BattleDisplayTask_ScreenFlashForThrow, ballThrowFlashData, 0);
        }

        break;
    case 4095:
        val = TRUE;
        break;
    default:
        if ((userAttr & 0xF00) == 0x100 && userAttr & 0xFF) {
            ManagedSprite_SetAnimationFrame(trainerEncounterData->managedSprite, 0);
            ManagedSprite_SetAnim(trainerEncounterData->managedSprite, (userAttr & 0xFF) - 1);
            val = TRUE;
        }

        break;
    }

    return val;
}

static void BattleDisplayTask_ScreenFlashForThrow(SysTask *task, void *data) {
    BallThrowFlashData *ballThrowFlashData = (BallThrowFlashData *)data;

    switch (ballThrowFlashData->state) {
    case 0:
        if (!IsBrightnessTransitionActive(1)) {
            ballThrowFlashData->state = 2;
            break;
        }
        StartBrightnessTransition(4, 16, 0, (GX_BLEND_PLANEMASK_BG0 | GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3 | GX_BLEND_PLANEMASK_OBJ | GX_BLEND_PLANEMASK_BD) & (GX_BLEND_PLANEMASK_BG1 ^ 0xFFFF), 1);
        ballThrowFlashData->state++;
        break;
    case 1:
        if (IsBrightnessTransitionActive(1) == TRUE) {
            StartBrightnessTransition(4, 0, 16, (GX_BLEND_PLANEMASK_BG0 | GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3 | GX_BLEND_PLANEMASK_OBJ | GX_BLEND_PLANEMASK_BD) & (GX_BLEND_PLANEMASK_BG1 ^ 0xFFFF), 1);
            ballThrowFlashData->state++;
        }
        break;
    case 2:
        if (IsBrightnessTransitionActive(1) == TRUE) {
            Heap_Free(data);
            SysTask_Destroy(task);
        }
        break;
    }
}

static void BattleDisplay_StopPlayback(BattleSystem *battleSys) {
    ov12_0223BFFC(battleSys, 1);
    BattleController_TryEmitExitRecording(battleSys, BattleSystem_GetBattleContext(battleSys));
}

static void BattleDisplay_StopPlaybackAlt(BattleSystem *battleSys) {
    ov12_0223BFFC(battleSys, 2);
    BattleController_TryEmitExitRecording(battleSys, BattleSystem_GetBattleContext(battleSys));
}

static u8 BattleDisplay_GetLinkTrainerClass(BattleSystem *battleSys, u8 battler, u8 trainerClass) {
    if (!(BattleSystem_GetBattleType(battleSys) & BATTLE_TYPE_LINK) || (trainerClass != 0 && trainerClass != 1)) {
        return trainerClass;
    }

    switch (PlayerProfile_GetVersion(BattleSystem_GetPlayerProfile(battleSys, battler))) {
    case 0:
        trainerClass += 0x7D;
        break;
    case 12:
        trainerClass += 0x7F;
        break;
    default:
        break;
    }

    return trainerClass;
}

static void ov12_02261F38(BattleSystem *battleSystem, int battlerId, int battlerType, Pokepic *pokepic, NARC *narc, u32 species, u32 form, u32 face, u32 cryMod) {
    u8 v0 = 0;

    if (BattleSystem_AreBattleAnimationsOn(battleSystem) == 1) {
        Pokepic_StartAnim(pokepic, 1);
        sub_0207294C(narc, ov12_0223B750(battleSystem), pokepic, species, face, 0, battlerId);
        sub_020729A4(narc, &v0, species, battlerType);
    }

    int pan;
    if (face == 2) {
        pan = 0x75;
    } else {
        pan = -0x75;
    }

    if (v0 == 0) {
        v0 = 8;
    }

    Species_PlayDelayedCry(BattleSystem_GetChatotVoice(battleSystem, battlerId),
        cryMod,
        species,
        form,
        pan,
        0x7F,
        0,
        HEAP_ID_BATTLE,
        v0);
}
