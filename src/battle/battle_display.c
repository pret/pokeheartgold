#include "battle/battle_display.h"
#include "constants/battle.h"
#include "constants/message_tags.h"
#include "constants/sndseq.h"

extern void ov12_02260668(SysTask *, void *);

void BattleDisplay_InitTaskSetupUI(BattleSystem *battleSys, OpponentData *opponentData)
{
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

extern void BattleDisplayTask_SetGiratinaEncounter(SysTask *, void *);
extern void BattleDisplayTask_SetEncounter(SysTask *, void *);

void BattleDisplay_InitTaskSetEncounter(BattleSystem *battleSys, OpponentData *opponentData, MonEncounterMessage *message)
{
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

    if (opponentData->battlerType & 1) {
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
        Pokepic_StartPaletteFade(monEncounterData->sprite, 8, 8, 0, 0);
    }

    if (monEncounterData->face == 2 && (BattleSystem_GetBattleSpecial(battleSys) & 0x40)) {
        int v10 = ((24 * 8) + 80) / 2;
        int spriteYCenter = Pokepic_GetAttr(monEncounterData->sprite, 1);

        Pokepic_SetAttr(monEncounterData->sprite, 46, 0);
        Pokepic_SetAttr(monEncounterData->sprite, 0, 256 - 64);
        Pokepic_SetAttr(monEncounterData->sprite, 1, spriteYCenter - v10);

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

    if (monEncounterData->face == 2 && (BattleSystem_GetBattleSpecial(battleSys) & 0x40)) {
        SysTask_CreateOnMainQueue(BattleDisplayTask_SetGiratinaEncounter, monEncounterData, 0);
    } else {
        SysTask_CreateOnMainQueue(BattleDisplayTask_SetEncounter, monEncounterData, 0);
    }

    sub_02005B58(TRUE);
}

extern void BattleDisplayTask_ShowEncounter(SysTask *, void *);
extern void ov12_0225BE38(SysTask *, void *);

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

void BattleDisplay_InitTaskShowEncounter(BattleSystem *battleSys, OpponentData *opponentData, MonShowMessage *message)
{
    BOOL isShiny;
    MonShowData *monShowData;
    int battleType = BattleSystem_GetBattleType(battleSys);
    monShowData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(MonShowData));

    if (opponentData->battlerType & 1) {
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
    OpponentData_ClearSavedCursorPosition(opponentData);

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
        if ((battleType & 2) && !(battleType & 8) && opponentData->battlerType > 3) {
            SysTask_CreateOnMainQueue(BattleDisplayTask_ShowEncounter, monShowData, 0);
        } else {
            SysTask_CreateOnMainQueue(ov12_0225BE38, monShowData, 0);
        }
    } else {
        SysTask_CreateOnMainQueue(BattleDisplayTask_ShowEncounter, monShowData, 0);
    }
}

extern void BattleDisplayTask_ShowPokemon(SysTask *, void *);
extern void ov12_0225C6C8(SysTask *, void *);

void BattleDisplay_InitTaskShowPokemon(BattleSystem *battleSys, OpponentData *opponentData, MonShowMessage *message)
{
    BOOL isShiny;
    MonShowData *monShowData;
    int battleType = BattleSystem_GetBattleType(battleSys);
    monShowData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(MonShowData));
    monShowData->state = 0;

    if (opponentData->battlerType & 1) {
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
    OpponentData_ClearSavedCursorPosition(opponentData);

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

    for (int i = 0; i < 4; i++) {
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

void BattleDisplayTask_ReturnPokemon(SysTask *, void *);
void ov12_0225CC58(SysTask *, void *);

void BattleDisplay_InitTaskReturnPokemon(BattleSystem *battleSys, OpponentData *opponentData, MonReturnMessage *message)
{
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

    for (int i = 0; i < 4; i++) {
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
extern void BattleDisplayTask_OpenCaptureBall(SysTask *, void *);

void BattleDisplay_InitTaskOpenCaptureBall(BattleSystem *battleSys, OpponentData *opponentData, OpenCaptureBallMessage *message)
{
    OpenCaptureBallData *captureOpenBallData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(OpenCaptureBallData));

    captureOpenBallData->battleSys = battleSys;
    captureOpenBallData->pokepic = opponentData->pokepic;
    captureOpenBallData->command = message->command;
    captureOpenBallData->battler = opponentData->battlerId;
    captureOpenBallData->battlerType = opponentData->battlerType;
    captureOpenBallData->state = 0;
    captureOpenBallData->yOffset = message->yOffset;

    Pokepic_StartPaletteFade(captureOpenBallData->pokepic, 0, 16, 0, ov12_0226D15A[message->ball]);
    Pokepic_SetAttr(captureOpenBallData->pokepic, 0x2D, TRUE);
    SysTask_CreateOnMainQueue(BattleDisplayTask_OpenCaptureBall, captureOpenBallData, 0);
}

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

extern void BattleDisplayTask_SetTrainerEncounter(SysTask *, void *);
extern u8 BattleDisplay_GetLinkTrainerClass(BattleSystem *battleSys, u8 battler, u8 trainerClass);

void BattleDisplay_InitTaskSetTrainerEncounter(BattleSystem *battleSys, OpponentData *opponentData, TrainerEncounterMessage *message)
{
    TrainerEncounterData *trainerEncounterData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(TrainerEncounterData));
    int side;

    trainerEncounterData->state = 0;

    if (opponentData->battlerType & 1) {
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
        side = opponentData->battlerType & 1;
    }

    message->trainerType = BattleDisplay_GetLinkTrainerClass(battleSys, opponentData->battlerId, message->trainerType);

    u32 battleType = BattleSystem_GetBattleType(battleSys);
    u32 flag = 0;
    
    if (ov12_0223C140(battleSys, opponentData->battlerId) != 255) {
        if (battleType & 2 && !(battleType & 8)) {
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
        && (BattleSystem_GetBattleType(battleSys) == 0 
        || BattleSystem_GetBattleType(battleSys) == 0x20 
        || BattleSystem_GetBattleType(battleSys) == (1 << 8) 
        || BattleSystem_GetBattleType(battleSys) == (1 << 9) 
        || BattleSystem_GetBattleType(battleSys) == (1 << 10) 
        || BattleSystem_GetBattleType(battleSys) == (1 << 12))) {
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
        BgSetPosTextAndCommit(BattleSystem_GetBgConfig(battleSys), 3, 2, 4 * 33);
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

extern void ov12_0225D644(SysTask *, void *);
extern void BattleDisplayTask_ThrowTrainerBall(SysTask *, void *);

void BattleDisplay_InitTaskThrowTrainerBall(BattleSystem *battleSys, OpponentData *opponentData, TrainerThrowBallMessage *message)
{
    TrainerThrowBallData *trainerThrowBallData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(TrainerThrowBallData));

    trainerThrowBallData->state = 0;
    trainerThrowBallData->battleSys = battleSys;
    trainerThrowBallData->command = message->command;
    trainerThrowBallData->ballTypeIn = message->ballTypeIn;
    trainerThrowBallData->battler = opponentData->battlerId;
    trainerThrowBallData->opponentData = opponentData;

    if (opponentData->battlerType & 1) {
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

extern void BattleDisplayTask_SlideTrainerOut(SysTask *, void *);

void BattleDisplay_InitTaskSlideTrainerOut(BattleSystem *battleSys, OpponentData *opponentData)
{
    SlideTrainerOutData *slideTrainerOutData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(SlideTrainerOutData));

    slideTrainerOutData->state = 0;
    slideTrainerOutData->battleSys = battleSys;
    slideTrainerOutData->command = opponentData->unk94[0];
    slideTrainerOutData->battler = opponentData->battlerId;
    slideTrainerOutData->opponentData = opponentData;

    if (opponentData->battlerType & 1) {
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

extern void BattleDisplayTask_SlideTrainerIn(SysTask *, void *);
extern const s16 gSlideTrainerInCoords[][3];

void BattleDisplay_InitTaskSlideTrainerIn(BattleSystem *battleSys, OpponentData *opponentData, TrainerSlideInMessage *message)
{
    PokepicManager *unused = BattleSystem_GetPokepicManager(battleSys);
    SlideTrainerInData *slideTrainerInData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(SlideTrainerInData));
    slideTrainerInData->state = 0;

    if (opponentData->battlerType & 1) {
        slideTrainerInData->face = 2;
    } else {
        slideTrainerInData->face = 0;
    }

    slideTrainerInData->managedSprite = opponentData->managedSprite = BattleDisplay_NewManagedSpriteTrainer(battleSys,
        opponentData->battlerType & 1,
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

extern void BattleDisplayTask_SlideHealthBoxIn(SysTask *, void *);

void BattleDisplay_InitTaskSlideHealthBoxIn(BattleSystem *battleSys, OpponentData *opponentData, HealthBoxData *healthboxData)
{
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

extern void BattleDisplayTask_SlideHealthBoxOut(SysTask *, void *);

void BattleDisplay_InitTaskSlideHealthBoxOut(BattleSystem *battleSys, OpponentData *opponentData)
{
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

void BattleDisplay_InitTaskSetCommandSelection(BattleSystem *battleSys, OpponentData *opponentData, CommandSetMessage *message)
{
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
        for (int j = 0; j < 6; j++) {
            commandSetData->ballStatus[i][j] = message->ballStatus[i][j];
        }
    }

    for (i = 0; i < 6; i++) {
        if (message->ballStatus[0][i] == 2) {
            commandSetData->expPercents[i] = 0;
        } else {
            commandSetData->expPercents[i] = message->expPercents[i];
        }
    }

    for (int battler = 0; battler < 4; battler++) {
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

void BattleDisplay_InitTaskShowMoveSelectMenu(BattleSystem *battleSys, OpponentData *opponentData, MoveSelectMenuMessage *message)
{
    MoveSelectMenuData *moveSelectMenuData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(MoveSelectMenuData));

    moveSelectMenuData->state = 0;
    moveSelectMenuData->battleSys = battleSys;
    moveSelectMenuData->command = opponentData->unk94[0];
    moveSelectMenuData->battler = opponentData->battlerId;
    moveSelectMenuData->battlerType = opponentData->battlerType;
    moveSelectMenuData->hpBar = &opponentData->hpBar;
    moveSelectMenuData->partySlot = message->partySlot;

    for (int i = 0; i < 4; i++) {
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

void BattleDisplay_InitTaskShowTargetSelectMenu(BattleSystem *battleSys, OpponentData *opponentData, TargetSelectMenuMessage *message)
{
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
    void *battleBagCtx;
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

void BattleDisplay_InitTaskShowBagMenu(BattleSystem *battleSys, OpponentData *opponentData, BagMenuMessage *message)
{
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

    for (int i = 0; i < 4; i++) {
        bagMenuData->partyMenuData->partySlots[i] = message->partySlots[i];

        for (int j = 0; j < 6; j++) {
            bagMenuData->partyOrder[i][j] = message->partyOrder[i][j];
        }

        bagMenuData->embargoTurns[i] = message->embargoTurns[i];
    }

    SysTask_CreateOnMainQueue(opponentData->unk0[3], bagMenuData, 0);
}

void BattleDisplay_InitTaskShowPartyMenu(BattleSystem *battleSys, OpponentData *opponentData, PartyMenuMessage *message)
{
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

    for (int i = 0; i < 4; i++) {
        partyMenuData->partySlots[i] = message->selectedPartySlot[i];

        for (int j = 0; j < 6; j++) {
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

void BattleDisplay_InitTaskShowYesNoMenu(BattleSystem *battleSys, OpponentData *opponentData, YesNoMenuMessage *message)
{
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

extern void ov12_022605D0(SysTask *, void *);

void BattleDisplay_PrintAttackMessage(BattleSystem *battleSys, OpponentData *opponentData, AttackMsgMessage *message)
{
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

    SysTask_CreateOnMainQueue(ov12_022605D0, waitTask, 0);
}

void BattleDisplay_PrintMessage(BattleSystem *battleSys, OpponentData *opponentData, BattleMessage *battleMsg)
{
    MsgData *msgLoader = BattleSystem_GetMessageLoader(battleSys);
    BattleMessageWaitTask *waitTask = Heap_Alloc(HEAP_ID_BATTLE, sizeof(BattleMessageWaitTask));

    waitTask->battleSys = battleSys;
    waitTask->command = opponentData->unk94[0];
    waitTask->battler = opponentData->battlerId;
    waitTask->msgIdx = BattleSystem_PrintBattleMessage(battleSys, msgLoader, battleMsg, BattleSystem_GetTextFrameDelay(battleSys));

    SysTask_CreateOnMainQueue(ov12_022605D0, waitTask, 0);
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

extern void ov12_0225FD14(SysTask *, void *);

void BattleDisplay_InitTaskSetMoveAnimation(BattleSystem *battleSys, OpponentData *opponentData, MoveAnimation *animation)
{
    SetMoveAnimationData *setMoveAnimationData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(SetMoveAnimationData));

    setMoveAnimationData->state = 0;
    setMoveAnimationData->battleSys = battleSys;
    setMoveAnimationData->opponentData = opponentData;
    setMoveAnimationData->command = opponentData->unk94[0];
    setMoveAnimationData->battler = opponentData->battlerId;
    setMoveAnimationData->battleAnimSys = ov12_0223A8DC(battleSys);
    setMoveAnimationData->moveAnim = *animation;
    setMoveAnimationData->pokepic = opponentData->pokepic;

    if (animation->animMode == 1 && animation->secondaryAnimID == 25) {
        opponentData->unk1A0 = 1;
    }

    if (animation->animMode == 1 && animation->secondaryAnimID == 26) {
        opponentData->unk1A0 = 0;
    }

    BattleDisplay_GetAnimHideFlags(&setMoveAnimationData->hideHealthboxes, &setMoveAnimationData->hideShadows, animation->animMode, animation->secondaryAnimID, animation->move);
    SysTask_CreateOnMainQueue(ov12_0225FD14, setMoveAnimationData, 0);
}

typedef struct FlickerOpponentData {
    BattleSystem *battleSys;
    Pokepic *pokepic;
    u8 battler;
    u8 counter;
    u8 delay;
    u8 unused;
} FlickerOpponentData;

void ov12_0225FF80(SysTask *, void *);

void BattleDisplay_InitTaskFlickerBattler(BattleSystem *battleSys, OpponentData *opponentData)
{
    FlickerOpponentData *flickerOpponentData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(FlickerOpponentData));

    flickerOpponentData->counter = 0;
    flickerOpponentData->battleSys = battleSys;
    flickerOpponentData->pokepic = opponentData->pokepic;
    flickerOpponentData->battler = opponentData->battlerId;
    flickerOpponentData->delay = 0;

    SysTask_CreateOnMainQueue(ov12_0225FF80, flickerOpponentData, 0);
}

void ov12_0225FFDC(SysTask *, void *);

void BattleDisplay_InitTaskUpdateHPGauge(BattleSystem *battleSys, OpponentData *opponentData, HPGaugeUpdateMessage *message)
{
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

    hpBar->unk10 = SysTask_CreateOnMainQueue(ov12_0225FFDC, hpBar, 1000);
}

void ov12_02260030(SysTask *, void *);

void BattleDisplay_InitTaskUpdateExpGauge(BattleSystem *battleSys, OpponentData *opponentData, ExpGaugeUpdateMessage *message)
{
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
        hpBar->unk10 = SysTask_CreateOnMainQueue(ov12_02260030, hpBar, 1000);
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

extern void ov12_022600F0(SysTask *, void *);

void BattleDisplay_InitTaskPlayFaintingSequence(BattleSystem *battleSys, OpponentData *opponentData, FaintingSequenceMessage *message)
{
    FaintingSequenceData *faintingSequenceData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(FaintingSequenceData));

    if (opponentData->battlerType & 1) {
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

    for (int i = 0; i < 4; i++) {
        faintingSequenceData->moveAnim.species[i] = message->monSpecies[i];
        faintingSequenceData->moveAnim.genders[i] = message->monGenders[i];
        faintingSequenceData->moveAnim.isShiny[i] = message->monShiny[i];
        faintingSequenceData->moveAnim.formNums[i] = message->monFormNums[i];
        faintingSequenceData->moveAnim.personalities[i] = message->monPersonalities[i];
    }

    SysTask_CreateOnMainQueue(ov12_022600F0, faintingSequenceData, 0);
}

void BattleDisplay_PlaySound(BattleSystem *battleSys, OpponentData *opponentData, PlaySoundMessage *message)
{
    int pan;

    if (opponentData->battlerType & 1) {
        pan = 0x75;
    } else {
        pan = -0x75;
    }

    BattleController_EmitClearCommand(battleSys, opponentData->battlerId, message->command);
    sub_0200602C(message->sdatID, pan);
}

typedef struct FadeOutData {
    BattleSystem *battleSys;
    u8 command;
    u8 battler;
    u8 state;
    u8 unused;
} FadeOutData;

extern void ov12_0226037C(SysTask *, void *);

void BattleDisplay_InitTaskFadeOut(BattleSystem *battleSys, OpponentData *opponentData)
{
    FadeOutData *fadeOutData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(FadeOutData));

    fadeOutData->state = 0;
    fadeOutData->battleSys = battleSys;
    fadeOutData->command = opponentData->unk94[0];
    fadeOutData->battler = opponentData->battlerId;

    SysTask_CreateOnMainQueue(ov12_0226037C, fadeOutData, 0);
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

extern void ov12_02260418(SysTask *, void *);

void BattleDisplay_InitTaskToggleVanish(BattleSystem *battleSys, OpponentData *opponentData, ToggleVanishMessage *message)
{
    ToggleVanishData *toggleVanishData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(ToggleVanishData));

    toggleVanishData->battleSys = battleSys;
    toggleVanishData->opponentData = opponentData;
    toggleVanishData->command = message->command;
    toggleVanishData->battler = opponentData->battlerId;
    toggleVanishData->state = 0;
    toggleVanishData->toggleHide = message->toggle;
    toggleVanishData->isSubstitute = message->isSubstitute;

    for (int i = 0; i < 4; i++) {
        toggleVanishData->moveAnim.species[i] = message->species[i];
        toggleVanishData->moveAnim.genders[i] = message->gender[i];
        toggleVanishData->moveAnim.isShiny[i] = message->isShiny[i];
        toggleVanishData->moveAnim.formNums[i] = message->formNum[i];
        toggleVanishData->moveAnim.personalities[i] = message->personality[i];
    }

    SysTask_CreateOnMainQueue(ov12_02260418, toggleVanishData, 0);
}

void BattleDisplay_SetStatusIcon(BattleSystem *battleSys, OpponentData *opponentData, SetStatusIconMessage *message)
{
    GF_ASSERT(opponentData->hpBar.boxObj != NULL);

    opponentData->hpBar.unk_4A = message->status;

    ov12_0226498C(&opponentData->hpBar, opponentData->hpBar.hp, (1 << 8));
    BattleController_EmitClearCommand(battleSys, opponentData->battlerId, message->command);
}

void BattleDisplay_PrintTrainerMessage(BattleSystem *battleSys, OpponentData *opponentData, TrainerMsgMessage *message)
{
    BattleMessageWaitTask *waitTask;
    int trainerID = BattleSystem_GetTrainerIndex(battleSys, opponentData->battlerId);
    waitTask = (BattleMessageWaitTask *)Heap_Alloc(HEAP_ID_BATTLE, sizeof(BattleMessageWaitTask));

    waitTask->battleSys = battleSys;
    waitTask->command = message->command;
    waitTask->battler = opponentData->battlerId;
    waitTask->msgIdx = BattleSystem_PrintTrainerMessage(battleSys, trainerID, opponentData->battlerId, message->msg, BattleSystem_GetTextFrameDelay(battleSys));

    SysTask_CreateOnMainQueue(ov12_022605D0, waitTask, 0);
}

void BattleDisplay_PrintRecallMessage(BattleSystem *battleSys, OpponentData *opponentData, RecallMsgMessage *message)
{
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

    SysTask_CreateOnMainQueue(ov12_022605D0, waitTask, 0);
}

void BattleDisplay_PrintSendOutMessage(BattleSystem *battleSys, OpponentData *opponentData, SendOutMsgMessage *message)
{
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

    SysTask_CreateOnMainQueue(ov12_022605D0, waitTask, 0);
}

void BattleDisplay_PrintBattleStartMessage(BattleSystem *battleSys, OpponentData *opponentData)
{
    BattleMessageWaitTask *waitTask;
    MsgData *msgLoader;
    BattleMessage battleMsg;

    ov12_02261544(battleSys, opponentData, &battleMsg);

    msgLoader = BattleSystem_GetMessageLoader(battleSys);
    waitTask = (BattleMessageWaitTask *)Heap_Alloc(HEAP_ID_BATTLE, sizeof(BattleMessageWaitTask));

    waitTask->battleSys = battleSys;
    waitTask->command = 34;
    waitTask->battler = opponentData->battlerId;
    waitTask->msgIdx = BattleSystem_PrintBattleMessage(battleSys, msgLoader, &battleMsg, BattleSystem_GetTextFrameDelay(battleSys));

    SysTask_CreateOnMainQueue(ov12_022605D0, waitTask, 0);
}

void BattleDisplay_PrintLeadMonMessage(BattleSystem *battleSys, OpponentData *opponentData, LeadMonMsgMessage *message)
{
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

    SysTask_CreateOnMainQueue(ov12_022605D0, waitTask, 0);
}

typedef struct PlayLevelUpAnimationData {
    BattleSystem *battleSys;
    void *hpBar;
    u8 command;
    u8 battler;
    u8 state;
    u8 flashComplete;
} PlayLevelUpAnimationData;

void ov12_02260584(SysTask *, void *);

void BattleDisplay_InitTaskPlayLevelUpAnimation(BattleSystem *battleSys, OpponentData *opponentData)
{
    PlayLevelUpAnimationData *playLevelUpAnimationData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(PlayLevelUpAnimationData));

    playLevelUpAnimationData->battleSys = battleSys;
    playLevelUpAnimationData->command = opponentData->unk94[0];
    playLevelUpAnimationData->battler = opponentData->battlerId;
    playLevelUpAnimationData->state = 0;
    playLevelUpAnimationData->hpBar = &opponentData->hpBar;

    SysTask_CreateOnMainQueue(ov12_02260584, playLevelUpAnimationData, 0);
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

extern void ov12_02260614(SysTask *, void *);

void BattleDisplay_SetAlertMessage(BattleSystem *battleSys, OpponentData *opponentData, AlertMsgMessage *message)
{
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

        SysTask_CreateOnMainQueue(ov12_02260614, alertMsgData, 0);
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

void BattleDisplay_RefreshHPGauge(BattleSystem *battleSys, OpponentData *opponentData, RefreshHPGaugeMessage *message)
{
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

void ov12_022609F8(SysTask *, void *);

void BattleDisplay_InitTaskForgetMove(BattleSystem *battleSys, OpponentData *opponentData, ForgetMoveMessage *message)
{
    ForgetMoveData *forgetMoveData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(ForgetMoveData));

    forgetMoveData->state = 0;
    forgetMoveData->battleSys = battleSys;
    forgetMoveData->command = message->command;
    forgetMoveData->battler = opponentData->battlerId;
    forgetMoveData->move = message->move;
    forgetMoveData->slot = message->slot;

    SysTask_CreateOnMainQueue(ov12_022609F8, forgetMoveData, 0);
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

void ov12_02260B30(SysTask *, void *);

void BattleDisplay_InitTaskSetMosaic(BattleSystem *battleSys, OpponentData *opponentData, MosaicSetMessage *message)
{
    SetMosaicData *setMosaicData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(SetMosaicData));

    setMosaicData->state = 0;
    setMosaicData->battleSys = battleSys;
    setMosaicData->pokepic = opponentData->pokepic;
    setMosaicData->command = message->command;
    setMosaicData->battler = opponentData->battlerId;
    setMosaicData->intensity = message->intensity;
    setMosaicData->counter = 0;
    setMosaicData->wait = message->wait;

    SysTask_CreateOnMainQueue(ov12_02260B30, setMosaicData, 0);
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

void ov12_02260BA0(SysTask *, void *);

void BattleDisplay_InitTaskShowBattleStartPartyGauge(BattleSystem *battleSys, OpponentData *opponentData, PartyGaugeData *partyGauge)
{
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
    SysTask_CreateOnMainQueue(ov12_02260BA0, task, 0);
}

void ov12_02260C58(SysTask *, void *);

void BattleDisplay_InitTaskHideBattleStartPartyGauge(BattleSystem *battleSys, OpponentData *opponentData, PartyGaugeData *partyGauge)
{
    PartyGaugeTask *task = Heap_Alloc(HEAP_ID_BATTLE, sizeof(PartyGaugeTask));

    task->state = 0;
    task->battleSys = battleSys;
    task->command = partyGauge->command;
    task->battler = opponentData->battlerId;
    task->battlerType = opponentData->battlerType;
    task->midBattle = FALSE;

    SysTask_CreateOnMainQueue(ov12_02260C58, task, 0);
}

void ov12_02260BA0(SysTask *, void *);

void BattleDisplay_InitTaskShowPartyGauge(BattleSystem *battleSys, OpponentData *opponentData, PartyGaugeData *partyGauge)
{
    PartyGaugeTask *task = Heap_Alloc(HEAP_ID_BATTLE, sizeof(PartyGaugeTask));

    task->state = 0;
    task->battleSys = battleSys;
    task->command = partyGauge->command;
    task->battler = opponentData->battlerId;
    task->battlerType = opponentData->battlerType;

    for (int i = 0; i < 6; i++) {
        task->status[i] = partyGauge->status[i];
    }

    task->midBattle = TRUE;
    SysTask_CreateOnMainQueue(ov12_02260BA0, task, 0);
}

void BattleDisplay_InitTaskHidePartyGauge(BattleSystem *battleSys, OpponentData *opponentData, PartyGaugeData *partyGauge)
{
    PartyGaugeTask *task = Heap_Alloc(HEAP_ID_BATTLE, sizeof(PartyGaugeTask));

    task->state = 0;
    task->battleSys = battleSys;
    task->command = partyGauge->command;
    task->battler = opponentData->battlerId;
    task->battlerType = opponentData->battlerType;
    task->midBattle = TRUE;

    SysTask_CreateOnMainQueue(ov12_02260C58, task, 0);
}

void BattleDisplay_PrintLinkWaitMessage(BattleSystem *battleSys, OpponentData *opponentData)
{
    MsgData *msgLoader;
    BattleMessage battleMsg;

    if (opponentData->unk196 == 0) {
        msgLoader = BattleSystem_GetMessageLoader(battleSys);

        battleMsg.id = 0x39B;
        battleMsg.tag = TAG_NONE;

        BattleSystem_PrintBattleMessage(battleSys, msgLoader, &battleMsg, NULL);
        ov12_0223BB80(battleSys, WaitingIcon_New(BattleSystem_GetWindow(battleSys, 0), 1));
    }

    BattleController_EmitClearCommand(battleSys, opponentData->battlerId, 55);
}

void BattleDisplay_RestoreSprite(BattleSystem *battleSys, OpponentData *opponentData, MoveAnimation *animation)
{
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

void ov12_02260CDC(SysTask *, void *);

void BattleDisplay_InitTaskSpriteToOAM(BattleSystem *battleSys, OpponentData *opponentData)
{
    SpriteToOAMData *spriteToOAMData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(SpriteToOAMData));

    spriteToOAMData->state = 0;
    spriteToOAMData->battleSys = battleSys;
    spriteToOAMData->opponentData = opponentData;
    spriteToOAMData->command = opponentData->unk94[0];
    spriteToOAMData->battler = opponentData->battlerId;
    spriteToOAMData->pokepic = opponentData->pokepic;

    SysTask_CreateOnMainQueue(ov12_02260CDC, spriteToOAMData, 0);
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

void ov12_02260D28(SysTask *, void *);

void BattleDisplay_InitTaskOAMToSprite(BattleSystem *battleSys, OpponentData *opponentData)
{
    OAMToSpriteData *oamToSpriteData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(OAMToSpriteData));

    oamToSpriteData->delay = 0;
    oamToSpriteData->battleSys = battleSys;
    oamToSpriteData->opponentData = opponentData;
    oamToSpriteData->command = opponentData->unk94[0];
    oamToSpriteData->battler = opponentData->battlerId;
    oamToSpriteData->pokepic = opponentData->pokepic;

    SysTask_CreateOnMainQueue(ov12_02260D28, oamToSpriteData, 0);
}

void BattleDisplay_PrintResultMessage(BattleSystem *battleSys, OpponentData *opponentData)
{
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

    SysTask_CreateOnMainQueue(ov12_022605D0, waitTask, 0);
}

void BattleDisplay_PrintEscapeMessage(BattleSystem *battleSys, OpponentData *opponentData, EscapeMsgMessage *message)
{
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

    SysTask_CreateOnMainQueue(ov12_022605D0, waitTask, 0);
}

void BattleDisplay_PrintForfeitMessage(BattleSystem *battleSys, OpponentData *opponentData)
{
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

    SysTask_CreateOnMainQueue(ov12_022605D0, waitTask, 0);
}

void BattleDisplay_RefreshSprite(BattleSystem *battleSys, OpponentData *opponentData, MoveAnimation *animation)
{
    BattlerSpriteContext battlerSpriteCtx;

    BattleDisplay_PopulateBattlerContext(battleSys, animation, &battlerSpriteCtx, opponentData->battlerId);
    ov07_02234A20(&battlerSpriteCtx, HEAP_ID_BATTLE);
    BattleController_EmitClearCommand(battleSys, opponentData->battlerId, animation->command);
}

void BattleDisplay_FlyMoveHitSoundEffect(BattleSystem *battleSys, OpponentData *opponentData, MoveHitSoundMessage *message)
{
    int pan;

    if (opponentData->battlerType & 1) {
        pan = 0x75;
    } else {
        pan = -0x75;
    }

    switch (message->effectiveness) {
    case 0:
        sub_0200602C(SEQ_SE_DP_KOUKA_M, pan);
        break;
    case 2:
        sub_0200602C(SEQ_SE_DP_KOUKA_H, pan);
        break;
    case 1:
        sub_0200602C(SEQ_SE_DP_KOUKA_L, pan);
        break;
    }

    BattleController_EmitClearCommand(battleSys, opponentData->battlerId, message->command);
}

void BattleDisplay_PlayMusic(BattleSystem *battleSys, OpponentData *opponentData, MusicPlayMessage *message)
{
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

extern void ov12_02260D84(SysTask *, void *);

void ov12_0225B454(BattleSystem *battleSys, OpponentData* opponentData, Message_022645C8* message) {
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

static void BattleDisplayTask_SetEncounter(SysTask *task, void *data)
{
    MonEncounterData *monEncounterData = data;
    BattleAnimSystem *battleAnimSys = ov12_0223A8DC(monEncounterData->battleSys);
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

        if (ov07_0221C3B0(battleAnimSys) == FALSE) {
            ov07_0221C3C0(battleAnimSys);
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

static void BattleDisplayTask_SetGiratinaEncounter(SysTask *task, void *data)
{
    MonEncounterData *monEncounterData = data;
    BattleAnimSystem *battleAnimSys = ov12_0223A8DC(monEncounterData->battleSys);
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

        if (ov07_0221C3B0(battleAnimSys) == FALSE) {
            ov07_0221C3C0(battleAnimSys);
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

static void BattleDisplayTask_ShowEncounter(SysTask *task, void *data)
{
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
                sub_0200602C(0x706, 0x75);
            } else {
                sub_0200602C(0x706, -0x75);
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

        if (ov07_0221C3B0(monShowData->battleAnimSys) == FALSE) {
            ov07_0221C3C0(monShowData->battleAnimSys);
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

static void ov12_0225BE38(SysTask *task, void *data)
{
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
        if (ov07_0221C3B0(monShowData->battleAnimSys) == FALSE) {
            ov07_0221C3C0(monShowData->battleAnimSys);
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
        if (ov07_0221C3B0(monShowData->battleAnimSys) == FALSE) {
            ov07_0221C3C0(monShowData->battleAnimSys);
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

static void BattleDisplayTask_ShowPokemon(SysTask *task, void *data)
{
    MonShowData *monShowData = data;
    BattleAnimSystem *battleAnimSys = ov12_0223A8DC(monShowData->battleSys);

    switch (monShowData->state) {
    case 0:
        BallThrow ballThrow;

        ballThrow.type = sBallThrowTypes[monShowData->battlerType];
        ballThrow.heapID = HEAP_ID_BATTLE;
        ballThrow.target = monShowData->battler;
        ballThrow.ballID = monShowData->capturedBall;
        ballThrow.cellActorSys = BattleSystem_GetSpriteSystem(monShowData->battleSys);
        ballThrow.paletteSys = BattleSystem_GetPaletteData(monShowData->battleSys);
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
                sub_0200602C(0x706, 0x75);
            } else {
                sub_0200602C(0x706, -0x75);
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

        if (ov07_0221C3B0(battleAnimSys) == FALSE) {
            ov07_0221C3C0(battleAnimSys);
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

static void ov12_0225C6C8(SysTask *task, void *data)
{
    MonShowData *monShowData = data;

    BattleAnimSystem *battleAnimSys = ov12_0223A8DC(monShowData->battleSys);

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
    case 1:
        {
            MoveAnimation moveAnim;
    
            BattleController_SetMoveAnimation(monShowData->battleSys, NULL, &moveAnim, 1, 41, monShowData->battler, monShowData->battler, NULL);
            BattleDisplay_PlayMoveAnimation(monShowData->battleSys, monShowData->opponentData, battleAnimSys, &moveAnim);
            
            monShowData->state++;   
        }
        break;
    case 3:
        if (monShowData->face == 2) {
            Pokepic_SetAttr(monShowData->opponentData->pokepic, 0x2D, 0);    
        }
        
        ov12_02261F38(monShowData->battleSys, monShowData->battler, monShowData->battlerType, monShowData->opponentData->pokepic, monShowData->opponentData->narc, monShowData->species, monShowData->formNum, monShowData->face, monShowData->cryMod);

        monShowData->state = 4;
        
        break;
    case 4:
        {
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
        }
        break;
    case 2:
    case 5:
    case 7:
    case 9:
        ov07_0221C394(battleAnimSys);
        if (ov07_0221C3B0(battleAnimSys) == FALSE) {
            ov07_0221C3C0(battleAnimSys);
            monShowData->state++;
        }
        break;
    case 6:
        {
            if (monShowData->isSubstitute) {
                MoveAnimation moveAnim;
        
                BattleController_SetMoveAnimation(monShowData->battleSys, NULL, &moveAnim, 1, 15, monShowData->battler, monShowData->battler, NULL);
                BattleDisplay_PlayMoveAnimation(monShowData->battleSys, monShowData->opponentData, battleAnimSys, &moveAnim);
                monShowData->state++;
                break;
            }
            monShowData->state = 0xFF;
        }
        break;
    case 8:
        {
            BattlerSpriteContext battlerSpriteCtx;
            MoveAnimation moveAnim;
    
            BattleDisplay_PopulateBattlerContext(monShowData->battleSys, &monShowData->moveAnim, &battlerSpriteCtx, monShowData->battler);
            ov07_02234A20(&battlerSpriteCtx, HEAP_ID_BATTLE);
            BattleController_SetMoveAnimation(monShowData->battleSys, NULL, &moveAnim, 1, 16, monShowData->battler, monShowData->battler, NULL);
            BattleDisplay_PlayMoveAnimation(monShowData->battleSys, monShowData->opponentData, battleAnimSys, &moveAnim);
    
            monShowData->opponentData->unk1A0 = 1;
            monShowData->state++;
        }
        break;    
    default:
        BattleController_EmitClearCommand(monShowData->battleSys, monShowData->battler, monShowData->command);
        Heap_Free(data);
        SysTask_Destroy(task);
        break;
    }
}

extern int ov12_0226D128[6];

static void BattleDisplayTask_ReturnPokemon(SysTask *task, void *data)
{
    MonReturnData *monReturnData = data;
    BattleAnimSystem *battleAnimSys = ov12_0223A8DC(monReturnData->battleSys);

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

        if (ov07_0221C3B0(battleAnimSys) == FALSE) {
            ov07_0221C3C0(battleAnimSys);
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
            ballThrow.cellActorSys = BattleSystem_GetSpriteSystem(monReturnData->battleSys);
            ballThrow.paletteSys = BattleSystem_GetPaletteData(monReturnData->battleSys);
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
            ballThrow.cellActorSys = BattleSystem_GetSpriteSystem(monReturnData->battleSys);
            ballThrow.paletteSys = BattleSystem_GetPaletteData(monReturnData->battleSys);
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
            sub_0200602C(SEQ_SE_DP_BOWA2, -0x75);
            break;
        case 1:
        case 3:
        case 5:
            sub_0200602C(SEQ_SE_DP_BOWA2, 0x75);
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

static void ov12_0225CC58(SysTask *task, void *data)
{
    MonReturnData *monReturnData = data;
    BattleAnimSystem *battleAnimSys = ov12_0223A8DC(monReturnData->battleSys);

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

        if (ov07_0221C3B0(battleAnimSys) == FALSE) {
            ov07_0221C3C0(battleAnimSys);
            monReturnData->state++;
        }
        break;
    case 4:
        {
        MoveAnimation moveAnim;

        BattleController_SetMoveAnimation(monReturnData->battleSys, NULL, &moveAnim, 1, 42, monReturnData->battler, monReturnData->battler, NULL);
        BattleDisplay_PlayMoveAnimation(monReturnData->battleSys, monReturnData->opponentData, battleAnimSys, &moveAnim);
       monReturnData->state++;
        }
        break;
    case 6:
        Pokepic_Delete(monReturnData->pokepic);
    case 7:
        BattleController_EmitClearCommand(monReturnData->battleSys, monReturnData->battler, monReturnData->command);
        Heap_Free(data);
        SysTask_Destroy(task);
        break;
    }
}

static void BattleDisplayTask_OpenCaptureBall(SysTask *task, void *data)
{
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

static void BattleDisplayTask_SetTrainerEncounter(SysTask *task, void *data)
{
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


extern void ov07_022344A8(UnkBallData *, s16, s16);

extern s16 ov12_0226D1E8[10][6][2];

static void BattleDisplayTask_ThrowTrainerBall(SysTask *task, void *data)
{
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
            ballThrow.cellActorSys = BattleSystem_GetSpriteSystem(trainerThrowBallData->battleSys);
            ballThrow.paletteSys = BattleSystem_GetPaletteData(trainerThrowBallData->battleSys);
            ballThrow.surface = 0;
            ballThrow.battleSys = trainerThrowBallData->battleSys;

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

static void ov12_0225D644(SysTask *task, void *data)
{
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

static void BattleDisplayTask_SlideTrainerOut(SysTask *task, void *data)
{
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

static void BattleDisplayTask_SlideTrainerIn(SysTask *task, void *data)
{
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

static void BattleDisplayTask_SlideHealthBoxIn(SysTask *task, void *data)
{
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

static void BattleDisplayTask_SlideHealthBoxOut(SysTask *task, void *data)
{
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

//static 
void BattleDisplayTask_PlayerSetCommandSelection(SysTask *task, void *data)
{
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
                battleMsg.id = 0x399;
                BattleSystem_PrintBattleMessage(commandSetData->battleSys, msgLoader, &battleMsg, 0);
                commandSetData->state = 3;
                break;
            case TRUE:
                battleMsg.tag = TAG_NONE;
                battleMsg.id = 0x4CA + BattleSystem_GetTrainerGender(commandSetData->battleSys, 0);
                commandSetData->msgIdx = BattleSystem_PrintBattleMessage(commandSetData->battleSys, msgLoader, &battleMsg, BattleSystem_GetTextFrameDelay(commandSetData->battleSys));
                commandSetData->state = 2;
                break;
            }
        } else {
            if (battleType & BATTLE_TYPE_SAFARI) {
                battleMsg.tag = TAG_TRNAME;
                battleMsg.param[0] = BattleSystem_GetTrainerIndex(commandSetData->battleSys, commandSetData->battler);
                battleMsg.id = 0x39A;
            } else if (battleType & BATTLE_TYPE_PAL_PARK) {
                battleMsg.tag = TAG_TRNAME;
                battleMsg.param[0] = BattleSystem_GetTrainerIndex(commandSetData->battleSys, commandSetData->battler);
                battleMsg.id = 0x4C6;
            } else {
                battleMsg.tag = TAG_NICKNAME;
                battleMsg.param[0] = commandSetData->battler | (commandSetData->partySlot << 8);
                battleMsg.id = 0x399;
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

        NARC *bgNarc = NARC_New(7, HEAP_ID_BATTLE);
        NARC *objNarc = NARC_New(8, HEAP_ID_BATTLE);

        actionData.battler = commandSetData->battler;
        actionData.battlerType = commandSetData->battlerType;
        actionData.partySlot = commandSetData->partySlot;
        actionData.curHp = commandSetData->curHP;
        actionData.maxHp = commandSetData->maxHP;
        actionData.ballStatusBattler = commandSetData->ballStatusBattler;
        actionData.isWaitingForPartner = ov12_0223B580(commandSetData->battleSys, commandSetData->battler, commandSetData->switchingOrCanPickCommandMask);

        if (opponentData->unk197) {
            BattleInput_Deadstriped_022698AC(btlSubscreen, 1);

            if (BattleSystem_GetBattleSpecial(commandSetData->battleSys) & 1) {
                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 6, 0, &actionData);
            } else if (BattleSystem_GetBattleType(commandSetData->battleSys) & BATTLE_TYPE_PAL_PARK) {
                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 10, 0, &actionData);
            } else if (BattleSystem_GetBattleType(commandSetData->battleSys) & BATTLE_TYPE_SAFARI) {
                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 8, 0, &actionData);
            } else if (BattleSystem_GetBattleType(commandSetData->battleSys) & (1 << 12)) {
                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 20, 0, &actionData);
            } else if (actionData.battlerType == 4 && (BattleSystem_GetBattleType(commandSetData->battleSys) & BATTLE_TYPE_MULTI) == FALSE) {
                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 4, 0, &actionData);
            } else {
                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 3, 0, &actionData);
            }

            ov12_0223BB64(commandSetData->battleSys, 1);
        } else {
            if (BattleSystem_GetBattleSpecial(commandSetData->battleSys) & 1) {
                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 5, 0, &actionData);
            } else if (BattleSystem_GetBattleType(commandSetData->battleSys) & BATTLE_TYPE_PAL_PARK) {
                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 9, 0, &actionData);
            } else if (BattleSystem_GetBattleType(commandSetData->battleSys) & BATTLE_TYPE_SAFARI) {
                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 7, 0, &actionData);
            } else if (BattleSystem_GetBattleType(commandSetData->battleSys) & (1 << 12)) {
                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 19, 0, &actionData);
            } 
            else if (actionData.battlerType != 4) {
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
                NARC *bgNarc = NARC_New(7, HEAP_ID_BATTLE);
                NARC *objNarc = NARC_New(8, HEAP_ID_BATTLE);

                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 0, 0, NULL);
                BattleInput_Deadstriped_022698AC(btlSubscreen, 0);
                ov12_02265D74(hpBar);
                ov12_02264EB4(commandSetData->hpBar);
                ov12_02262014(opponentData);
                NARC_Delete(bgNarc);
                NARC_Delete(objNarc);
            } break;
            case 3: { // Pokemon
                NARC *bgNarc = NARC_New(7, HEAP_ID_BATTLE);
                NARC *objNarc = NARC_New(8, HEAP_ID_BATTLE);

                BattleInput_ChangeMenu(bgNarc, objNarc, btlSubscreen, 0, 0, NULL);
                BattleInput_Deadstriped_022698AC(btlSubscreen, 0);
                ov12_02265D74(hpBar);
                ov12_02264EB4(commandSetData->hpBar);
                ov12_02262014(opponentData);
                NARC_Delete(bgNarc);
                NARC_Delete(objNarc);
            } break;
            case 4: { // Run
                NARC *bgNarc = NARC_New(7, HEAP_ID_BATTLE);
                NARC *objNarc = NARC_New(8, HEAP_ID_BATTLE);

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
            NARC *bgNarc = NARC_New(7, HEAP_ID_BATTLE);
            NARC *objNarc = NARC_New(8, HEAP_ID_BATTLE);

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

//static 
void BattleDisplayTask_TrainerSetCommandSelection(SysTask *task, void *data)
{
    CommandSetData *commandSetData = data;
    int command = ov10_022205BC(commandSetData->battleSys, commandSetData->battler);

    BattleController_EmitSelectedCommand(commandSetData->battleSys, commandSetData->battler, command);
    BattleController_EmitClearCommand(commandSetData->battleSys, commandSetData->battler, commandSetData->command);

    Heap_Free(data);
    SysTask_Destroy(task);
}

//static 
void BattleDisplayTask_LinkSetCommandSelection(SysTask *task, void *data)
{
    CommandSetData *commandSetData = data;

    BattleController_EmitClearCommand(commandSetData->battleSys, commandSetData->battler, commandSetData->command);
    Heap_Free(data);
    SysTask_Destroy(task);
}

extern u8 ov12_0226D140[13][2];

//static 
void BattleDisplayTask_SafariPokemonSetCommandSelection(SysTask *task, void *data)
{
    CommandSetData *commandSetData = data;
    u8 escapeCount = ov12_0223B694(commandSetData->battleSys);
    u16 species = BattleMon_Get(BattleSystem_GetBattleContext(commandSetData->battleSys), commandSetData->battler, BMON_DATA_SPECIES, NULL);
    int fleeRate = GetMonBaseStat(species, 26);
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

//static
void BattleDisplayTask_PalParkPokemonSetCommandSelection(SysTask *task, void *data)
{
    CommandSetData *commandSetData = data;

    BattleController_EmitSelectedCommand(commandSetData->battleSys, commandSetData->battler, 4);
    BattleController_EmitClearCommand(commandSetData->battleSys, commandSetData->battler, commandSetData->command);

    Heap_Free(data);
    SysTask_Destroy(task);
}

//static 
void BattleDisplayTask_RecordingSetCommandSelection(SysTask *task, void *data)
{
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
