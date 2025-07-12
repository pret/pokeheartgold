#include "overlay_25.h"

#include "global.h"

#include "constants/abilities.h"
#include "constants/easy_chat.h"

#include "battle/battle_setup.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0285.h"
#include "msgdata/msg/msg_0287.h"
#include "msgdata/msg/msg_0292.h"
#include "msgdata/msg/msg_0294.h"
#include "msgdata/msg/msg_0296.h"
#include "msgdata/msg/msg_0726.h"

#include "assert.h"
#include "encounter.h"
#include "fieldmap.h"
#include "heap.h"
#include "mail_message.h"
#include "msgdata.h"
#include "overlay_01.h"
#include "party.h"
#include "pm_string.h"
#include "pokemon.h"
#include "save_trainer_house.h"
#include "scrcmd.h"
#include "script.h"
#include "string_util.h"
#include "unk_020517A4.h"
#include "unk_0205B3DC.h"

#define MAX_TRAINER_HOUSE_LEVEL 50

static const MailMessageTemplate TrainerHouse_DefaultLoseMessage = {
    .msg_bank = MAILMSG_BANK_0292_GMM,
    .msg_no = msg_0292_00000,
    .ec_groups = { EC_GROUP_GREETINGS, EC_GROUP_NONE },
    .ec_words = { msg_0287_thanks,    0             },
};

static const MailMessageTemplate TrainerHouse_DefaultWinMessage = {
    .msg_bank = MAILMSG_BANK_0296_GMM,
    .msg_no = msg_0296_00007,
    .ec_groups = { EC_GROUP_TRAINER, EC_GROUP_NONE },
    .ec_words = { msg_0285_victory, 0             },
};

static const MailMessageTemplate TrainerHouse_DefaultIntroMessage = {
    .msg_bank = MAILMSG_BANK_0294_GMM,
    .msg_no = msg_0294_00003,
    .ec_groups = { EC_GROUP_TRAINER, EC_GROUP_NONE },
    .ec_words = { msg_0285_match,   0             },
};

#define DUMMY_TRAINER_HOUSE_MON    \
    {                              \
        .language = GAME_LANGUAGE, \
        .nickname = {              \
            EOS,                   \
            EOS,                   \
            EOS,                   \
            EOS,                   \
            EOS,                   \
            EOS,                   \
            EOS,                   \
            EOS,                   \
            EOS,                   \
            EOS,                   \
        },                         \
    }

static const TrainerHouseSet ov25_02259D9C = {
    .trainer = {
                .id = 0,
                .sprite = SPRITE_MAN3,
                .language = GAME_LANGUAGE,
                .version = GAME_VERSION,
                .gender = PLAYER_GENDER_MALE,
                .otName = {
            CHAR_JP_HIRA_HI,
            CHAR_JP_HIRA_KA,
            CHAR_JP_HIRA_RU,
            EOS,
            EOS,
            EOS,
            EOS,
            EOS,
        }, // "ひかる"
    },
    .party = {
                {
            .species = SPECIES_MEGANIUM, .item = ITEM_SITRUS_BERRY, .moves = { MOVE_LEECH_SEED, MOVE_PROTECT, MOVE_ENERGY_BALL, MOVE_TOXIC }, .otid = 0x11111111, .pid = 0x00000101, .hpIv = 20, .atkIv = 20, .defIv = 20, .spdIv = 20, .spAtkIv = 20, .spDefIv = 20, .hpEv = 255, .spDefEv = 255, .language = GAME_LANGUAGE, .ability = ABILITY_OVERGROW, .level = 50, .nickname = {
                                                                                                                                                                                                                                                                                                                                                                            CHAR_JP_KATA_ME,
                                                                                                                                                                                                                                                                                                                                                                            CHAR_JP_KATA_GA,
                                                                                                                                                                                                                                                                                                                                                                            CHAR_JP_KATA_NI,
                                                                                                                                                                                                                                                                                                                                                                            CHAR_JP_KATA_U,
                                                                                                                                                                                                                                                                                                                                                                            CHAR_JP_KATA_MU,
                                                                                                                                                                                                                                                                                                                                                                            EOS,
                                                                                                                                                                                                                                                                                                                                                                            EOS,
                                                                                                                                                                                                                                                                                                                                                                            EOS,
                                                                                                                                                                                                                                                                                                                                                                            EOS,
                                                                                                                                                                                                                                                                                                                                                                            EOS,
                                                                                                                                                                                                                                                                                                                                                                        }, // "メガニウム"
        },
                {
            .species = SPECIES_TYPHLOSION, .item = ITEM_SALAC_BERRY, .moves = { MOVE_ERUPTION, MOVE_SUBSTITUTE, MOVE_FLAMETHROWER, MOVE_FOCUS_BLAST }, .otid = 0x11111111, .pid = 0x00001010, .hpIv = 20, .atkIv = 20, .defIv = 20, .spdIv = 20, .spAtkIv = 20, .spDefIv = 20, .spdEv = 255, .spAtkEv = 255, .language = GAME_LANGUAGE, .ability = ABILITY_BLAZE, .level = 50, .nickname = {
                                                                                                                                                                                                                                                                                                                                                                                   CHAR_JP_KATA_BA,
                                                                                                                                                                                                                                                                                                                                                                                   CHAR_JP_KATA_KU,
                                                                                                                                                                                                                                                                                                                                                                                   CHAR_JP_KATA_HU,
                                                                                                                                                                                                                                                                                                                                                                                   CHAR_JP_HYPHEN,
                                                                                                                                                                                                                                                                                                                                                                                   CHAR_JP_KATA_N_,
                                                                                                                                                                                                                                                                                                                                                                                   EOS,
                                                                                                                                                                                                                                                                                                                                                                                   EOS,
                                                                                                                                                                                                                                                                                                                                                                                   EOS,
                                                                                                                                                                                                                                                                                                                                                                                   EOS,
                                                                                                                                                                                                                                                                                                                                                                                   EOS,
                                                                                                                                                                                                                                                                                                                                                                               }, // "バクフーン"
        },
                {
            .species = SPECIES_FERALIGATR, .item = ITEM_LUM_BERRY, .moves = { MOVE_DRAGON_DANCE, MOVE_WATERFALL, MOVE_ICE_PUNCH, MOVE_CRUNCH }, .otid = 0x11111111, .pid = 0x00000011, .hpIv = 20, .atkIv = 20, .defIv = 20, .spdIv = 20, .spAtkIv = 20, .spDefIv = 20, .hpEv = 255, .atkEv = 255, .language = GAME_LANGUAGE, .ability = ABILITY_TORRENT, .level = 50, .nickname = {
                                                                                                                                                                                                                                                                                                                                                                           CHAR_JP_KATA_O,
                                                                                                                                                                                                                                                                                                                                                                           CHAR_JP_HYPHEN,
                                                                                                                                                                                                                                                                                                                                                                           CHAR_JP_KATA_DA,
                                                                                                                                                                                                                                                                                                                                                                           CHAR_JP_KATA_I,
                                                                                                                                                                                                                                                                                                                                                                           CHAR_JP_KATA_RU,
                                                                                                                                                                                                                                                                                                                                                                           EOS,
                                                                                                                                                                                                                                                                                                                                                                           EOS,
                                                                                                                                                                                                                                                                                                                                                                           EOS,
                                                                                                                                                                                                                                                                                                                                                                           EOS,
                                                                                                                                                                                                                                                                                                                                                                           EOS,
                                                                                                                                                                                                                                                                                                                                                                       }, // "オーダイル"
        },
                DUMMY_TRAINER_HOUSE_MON,
                DUMMY_TRAINER_HOUSE_MON,
                DUMMY_TRAINER_HOUSE_MON,
                },
};

static void TrainerHouse_SetNames(TrainerHouseSet *set);
static BattleSetup *TrainerHouse_NewBattleSetup(FieldSystem *fieldSystem, TrainerHouseSet *set);
static void TrainerHouse_CopyToPokemon(TrainerHouseMon *trainerHouseMon, Pokemon *mon);
static void TrainerHouse_InitTrainer(TrainerHouseSet *set, Trainer *trainer);
static void TrainerHouse_InitBattleSetup(BattleSetup *setup, TrainerHouseSet *set, u32 battlerId);

void TrainerHouse_StartBattle(FieldSystem *fieldSystem, u32 trainerNum) {
    TrainerHouse *trainerHouse = Save_TrainerHouse_Get(fieldSystem->saveData);
    BattleSetup *setup;
    if (trainerNum == MAX_NUM_TRAINER_HOUSE_SETS) {
        TrainerHouseSet set;
        TrainerHouse_SetNames(&set);
        setup = TrainerHouse_NewBattleSetup(fieldSystem, &set);
        Trainer *trainer = &setup->trainer[BATTLER_ENEMY];
        MailMsg_Init_FromTemplate(&trainer->winMessage, &TrainerHouse_DefaultWinMessage);
        MailMsg_Init_FromTemplate(&trainer->loseMessage, &TrainerHouse_DefaultLoseMessage);
    } else {
        setup = TrainerHouse_NewBattleSetup(fieldSystem, &trainerHouse->sets[trainerNum]);
    }
    fieldSystem->unkA0 = NULL;
    u32 effect = BattleSetup_GetWildTransitionEffect(setup);
    u32 bgm = BattleSetup_GetWildBattleMusic(setup);
    u32 *winFlag = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_BATTLE_WIN_FLAG);
    CallTask_020509F0(fieldSystem->taskman, setup, effect, bgm, winFlag);
}

static void TrainerHouse_SetNames(TrainerHouseSet *set) {
    MI_CpuCopy16(&ov25_02259D9C, set, sizeof(TrainerHouseSet));
    MsgData *messageData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0726_bin, HEAP_ID_FIELD2);
    GF_ASSERT(messageData);
    if (messageData) {
        String *otName = NewString_ReadMsgData(messageData, msg_0726_00003);
        DestroyMsgData(messageData);
        GF_ASSERT(otName);
        if (otName) {
            u32 length = String_GetLength(otName);
            GF_ASSERT(length <= PLAYER_NAME_LENGTH);
            if (length > PLAYER_NAME_LENGTH) {
                length = PLAYER_NAME_LENGTH;
            }
            MI_CpuFill16(set->trainer.otName, EOS, (PLAYER_NAME_LENGTH + 1) * sizeof(u16));
            MI_CpuCopy16(String_cstr(otName), set->trainer.otName, length * sizeof(u16));
            String_Delete(otName);
        }
    }
    for (s32 i = 0; i < PARTY_SIZE; i++) {
        TrainerHouseMon *trainerHouseMon = &(set->party[i]);
        if (trainerHouseMon->species == SPECIES_NONE) {
            continue;
        }
        String *name = GetSpeciesName(trainerHouseMon->species, HEAP_ID_FIELD2);
        GF_ASSERT(name);
        if (name) {
            u32 length = String_GetLength(name);
            GF_ASSERT(length <= POKEMON_NAME_LENGTH);
            if (length > POKEMON_NAME_LENGTH) {
                length = POKEMON_NAME_LENGTH;
            }
            MI_CpuFill16(trainerHouseMon->nickname, EOS, POKEMON_NAME_LENGTH * sizeof(u16));
            MI_CpuCopy16(String_cstr(name), trainerHouseMon->nickname, length * sizeof(u16));
            String_Delete(name);
        }
    }
}

BOOL ScrCmd_ShowTrainerHouseIntroMessage(ScriptContext *ctx) {
    u16 trainerNum = ScriptGetVar(ctx);
    TrainerHouse *trainerHouse = Save_TrainerHouse_Get(ctx->fieldSystem->saveData);
    MailMessage intro;
    MailMessage temp;
    if (trainerNum == MAX_NUM_TRAINER_HOUSE_SETS) {
        MailMsg_Init_FromTemplate(&temp, &TrainerHouse_DefaultIntroMessage);
        MI_CpuCopy16(&temp, &intro, sizeof(MailMessage));
    } else {
        MI_CpuCopy16(&(trainerHouse->sets[trainerNum].trainer.introMessage), &intro, sizeof(MailMessage));
    }
    ov01_021EF564(ctx, intro.msg_bank, intro.msg_no, intro.fields[0], intro.fields[1], TRUE);
    SetupNativeScript(ctx, ov01_021EF348);
    return TRUE;
}

static BattleSetup *TrainerHouse_NewBattleSetup(FieldSystem *fieldSystem, TrainerHouseSet *set) {
    s32 i;
    BattleSetup *setup = BattleSetup_New(HEAP_ID_FIELD2, BATTLE_TYPE_TRAINER | BATTLE_TYPE_FRONTIER | BATTLE_TYPE_13);
    SaveData *saveData = fieldSystem->saveData;
    Party *party = SaveArray_Party_Get(saveData);
    sub_02051D18(setup, fieldSystem, saveData, fieldSystem->location->mapId, fieldSystem->bagCursor, fieldSystem->unkB0);
    setup->battleBg = BATTLE_BG_BUILDING_1;
    setup->terrain = TERRAIN_BUILDING;
    Pokemon *mon = AllocMonZeroed(HEAP_ID_FIELD2);
    s32 partyCount = Party_GetCount(party);
    Party_InitWithMaxSize(setup->party[BATTLER_PLAYER], PARTY_SIZE);
    for (i = 0; i < partyCount; i++) {
        CopyPokemonToPokemon(Party_GetMonByIndex(party, i), mon);
        if (GetMonData(mon, MON_DATA_LEVEL, NULL) > MAX_TRAINER_HOUSE_LEVEL) {
            u32 exp = GetMonExpBySpeciesAndLevel(GetMonData(mon, MON_DATA_SPECIES, NULL), MAX_TRAINER_HOUSE_LEVEL);
            SetMonData(mon, MON_DATA_EXPERIENCE, &exp);
            CalcMonLevelAndStats(mon);
        }
        BattleSetup_AddMonToParty(setup, mon, BATTLER_PLAYER);
    }
    Heap_Free(mon);
    BattleSetup_SetAllySideBattlersToPlayer(setup);
    TrainerHouse_InitBattleSetup(setup, set, BATTLER_ENEMY);
    for (i = 0; i < BATTLER_MAX; i++) {
        setup->trainer[i].data.aiFlags = 7;
    }
    return setup;
}

static void TrainerHouse_CopyToPokemon(TrainerHouseMon *trainerHouseMon, Pokemon *mon) {
    s32 i;
    u8 tempByte;
    ZeroMonData(mon);
    u32 level = trainerHouseMon->level > MAX_TRAINER_HOUSE_LEVEL
        ? MAX_TRAINER_HOUSE_LEVEL
        : trainerHouseMon->level;
    tempByte = level;
    u32 species = trainerHouseMon->species;
    u32 ivs = trainerHouseMon->ivsWord & 0x3fffffff;
    u32 pid = trainerHouseMon->pid;
    CreateMonWithFixedIVs(mon, species, tempByte, ivs, pid);
    tempByte = trainerHouseMon->form;
    SetMonData(mon, MON_DATA_FORM, &tempByte);
    SetMonData(mon, MON_DATA_HELD_ITEM, &trainerHouseMon->item);
    for (i = 0; i < MAX_MON_MOVES; i++) {
        u16 move = trainerHouseMon->moves[i];
        SetMonData(mon, MON_DATA_MOVE1 + i, &move);
        tempByte = trainerHouseMon->ppUp >> (i * 2) & 3;
        SetMonData(mon, MON_DATA_MOVE1PPUP + i, &tempByte);
        u8 pp = GetMonData(mon, MON_DATA_MOVE1MAXPP + i, NULL);
        SetMonData(mon, MON_DATA_MOVE1PP + i, &pp);
    }
    u32 otid = trainerHouseMon->otid;
    SetMonData(mon, MON_DATA_OTID, &otid);
    for (i = 0; i < NUM_STATS; i++) {
        tempByte = *(&trainerHouseMon->hpEv + i);
        SetMonData(mon, MON_DATA_HP_EV + i, &tempByte);
    }
    SetMonData(mon, MON_DATA_ABILITY, &(trainerHouseMon->ability));
    SetMonData(mon, MON_DATA_FRIENDSHIP, &(trainerHouseMon->friendship));
    u16 nickname[POKEMON_NAME_LENGTH + 1];
    StringFillEOS(nickname, NELEMS(nickname));
    CopyU16StringArrayN(nickname, trainerHouseMon->nickname, POKEMON_NAME_LENGTH);
    SetMonData(mon, MON_DATA_NICKNAME_FLAT, nickname);
    SetMonData(mon, MON_DATA_GAME_LANGUAGE, &(trainerHouseMon->language));
    CalcMonLevelAndStats(mon);
}

static void TrainerHouse_InitTrainer(TrainerHouseSet *set, Trainer *trainer) {
    MI_CpuFill8(trainer, 0, sizeof(Trainer));
    trainer->data.trainerClass = GetUnionRoomAvatarAttrBySprite(set->trainer.gender, set->trainer.sprite, 1);
    trainer->data.unk_2 = 0;
    trainer->data.aiFlags = 0xffffffff;
    CopyU16StringArray(trainer->name, set->trainer.otName);
    MailMsg_Copy(&trainer->winMessage, &set->trainer.winMessage);
    MailMsg_Copy(&trainer->loseMessage, &set->trainer.loseMessage);
    trainer->data.doubleBattle = 0;
}

static void TrainerHouse_InitBattleSetup(BattleSetup *setup, TrainerHouseSet *set, u32 battlerId) {
    s32 i;
    TrainerHouse_InitTrainer(set, &setup->trainer[battlerId]);
    setup->trainerId[battlerId] = set->trainer.id;
    Pokemon *tempMon = AllocMonZeroed(HEAP_ID_FIELD2);
    Party_InitWithMaxSize(setup->party[battlerId], PARTY_SIZE);
    TrainerHouseMon *trainerHouseMon = set->party;
    for (i = 0; i < PARTY_SIZE; trainerHouseMon++, i++) {
        if (trainerHouseMon->species == SPECIES_NONE) {
            break;
        }
        TrainerHouse_CopyToPokemon(&set->party[i], tempMon);
        BattleSetup_AddMonToParty(setup, tempMon, battlerId);
    }
    Heap_Free(tempMon);
}
