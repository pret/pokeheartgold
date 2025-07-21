#include "game_clear.h"

#include "global.h"

#include "constants/sndseq.h"

#include "credits/credits.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0040.h"

#include "bg_window.h"
#include "game_stats.h"
#include "hall_of_fame.h"
#include "launch_application.h"
#include "location_backup.h"
#include "party.h"
#include "player_data.h"
#include "register_hall_of_fame.h"
#include "render_window.h"
#include "save_arrays.h"
#include "save_local_field_data.h"
#include "save_vars_flags.h"
#include "sound.h"
#include "sound_02004A44.h"
#include "sys_flags.h"
#include "task.h"
#include "text.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"
#include "unk_02054E00.h"
#include "unk_020552A4.h"
#include "unk_02055418.h"
#include "unk_0206793C.h"
#include "unk_0206D494.h"
#include "use_item_on_mon.h"

#define WAIT_SE_SAVE_FRAMES   32
#define SCREEN_FADEOUT_FRAMES 32

typedef struct {
    BOOL gameCleared;
    RegisterHallOfFameArgs hofCongratsArgs;
    CreditsArgs creditsArgs;
    BgConfig *bgConfig;
    Window window;
    String *windowText;
    WaitingIcon *waitingIcon;
    int printerId;
    int timer;
    BOOL vsTrainerRed;
    int bgmVolume; // also used as a timer
} GameClearWork;

static const GraphicsBanks sGameClearSaveBanksConfig = {
    .bg = GX_VRAM_BG_128_B,
    .bgextpltt = GX_VRAM_BGEXTPLTT_NONE,
    .subbg = GX_VRAM_SUB_BG_128_C,
    .subbgextpltt = GX_VRAM_SUB_BGEXTPLTT_NONE,
    .obj = GX_VRAM_OBJ_64_E,
    .objextpltt = GX_VRAM_OBJEXTPLTT_NONE,
    .subobj = GX_VRAM_SUB_OBJ_16_I,
    .subobjextpltt = GX_VRAM_SUB_OBJEXTPLTT_NONE,
    .tex = GX_VRAM_TEX_0_A,
    .texpltt = GX_VRAM_TEXPLTT_01_FG,
};

static const struct GraphicsModes sGameClearSaveBgModeSet = {
    .dispMode = GX_DISPMODE_GRAPHICS,
    .bgMode = GX_BGMODE_0,
    .subMode = GX_BGMODE_0,
    ._2d3dMode = GX_BG0_AS_2D,
};

static const BgTemplate sGameClearSaveBgTemplate = {
    .x = 0,
    .y = 0,
    .bufferSize = 0x0800,
    .baseTile = 0,
    .size = GF_BG_SCR_SIZE_256x256,
    .colorMode = GX_BG_COLORMODE_16,
    .screenBase = GX_BG_SCRBASE_0x0000,
    .charBase = GX_BG_CHARBASE_0x00000,
    .bgExtPltt = GX_BG_EXTPLTT_01,
    .priority = 1,
    .areaOver = GX_BG_AREAOVER_XLU,
    .dummy = 0,
    .mosaic = FALSE,
};

static BOOL Task_GameClear(TaskManager *taskman);
static void GameClearSave_InitGraphics(FieldSystem *fieldSystem, GameClearWork *env);
static void GameClearSave_PrintSaving(FieldSystem *fieldSystem, GameClearWork *env);
static BOOL GameClearSave_IsPrintFinished(GameClearWork *env);
static void sub_02052E70(GameClearWork *env);
static void GameClearSave_PrintSaveStatus(FieldSystem *fieldSystem, GameClearWork *env, int a2);
static void GameClearSave_Free(FieldSystem *fieldSystem, GameClearWork *env);

BOOL sub_0205298C(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    u32 *state = TaskManager_GetStatePtr(taskman);

    switch (*state) {
    case 0:
        BugContest_WarpToJudging(taskman, fieldSystem);
        FieldSystem_ClearFollowingTrainer(fieldSystem);
        HealParty(SaveArray_Party_Get(fieldSystem->saveData));
        ++(*state);
        break;
    case 1:
        GF_SndStartFadeOutBGM(0, 20);
        ++(*state);
        break;
    case 2:
        if (!GF_SndGetFadeTimer()) {
            sub_02054F14();
            ++(*state);
            break;
        }
        break;
    case 3:
        CallTask_RestoreOverworld(taskman);
        ++(*state);
        break;
    case 4:
        BeginNormalPaletteFade(0, 1, 1, RGB_WHITE, 8, 1, HEAP_ID_32);
        G2_BlendNone();
        ++(*state);
        break;
    case 5:
        if (IsPaletteFadeFinished()) {
            return TRUE;
        }
        break;
    }
    return FALSE;
}

static void AddHallOfFameEntry(FieldSystem *fieldSystem, BOOL gameCleared) {
    int val;
    RTCDate date;

    HallOfFame *hof = LoadHallOfFame(fieldSystem->saveData, HEAP_ID_FIELD, &val);
    if (val != 1 || !gameCleared) {
        Save_HOF_Init(hof);
    }
    Party *party = SaveArray_Party_Get(fieldSystem->saveData);

    GF_RTC_CopyDate(&date);
    Save_HOF_RecordParty(hof, party, &date);
    SaveHallOfFame(fieldSystem->saveData, hof);
    Heap_Free(hof);
}

// Launches the Hall of Fame Congratulations app if the player beat Lance. Saves
// the game and launches the credits.
static BOOL Task_GameClear(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    GameClearWork *env = TaskManager_GetEnvironment(taskman);
    u32 *state = TaskManager_GetStatePtr(taskman);

    switch (*state) {
    case 0:
        if (!env->vsTrainerRed) {
            RegisterHallOfFame_LaunchApp(fieldSystem, &env->hofCongratsArgs);
            ++(*state);
            break;
        }
        GameClearSave_InitGraphics(fieldSystem, env);
        BeginNormalPaletteFade(3, 1, 1, RGB_BLACK, 8, 1, HEAP_ID_32);
        *state = 2;
        break;
    case 1:
        if (!FieldSystem_ApplicationIsRunning(fieldSystem)) {
            CreateHeap(HEAP_ID_3, HEAP_ID_4, 0x20000);
            GameClearSave_InitGraphics(fieldSystem, env);
            BeginNormalPaletteFade(3, 1, 1, RGB_BLACK, 8, 1, HEAP_ID_32);
            ++(*state);
        }
        break;
    case 2:
        if (IsPaletteFadeFinished()) {
            if (!Save_FileDoesNotBelongToPlayer(fieldSystem->saveData)) {
                GameClearSave_PrintSaving(fieldSystem, env);
                ++(*state);
                break;
            }
            *state = 7;
        }
        break;
    case 3:
        if (GameClearSave_IsPrintFinished(env)) {
            ++(*state);
        }
        break;
    case 4:
        HealParty(SaveArray_Party_Get(fieldSystem->saveData));
        int writeStatus = SaveGameNormal(fieldSystem->saveData);
        if (!env->vsTrainerRed) {
            AddHallOfFameEntry(fieldSystem, env->gameCleared);
        }
        sub_02052E70(env);
        GameClearSave_PrintSaveStatus(fieldSystem, env, writeStatus);
        ++(*state);
        break;
    case 5:
        if (GameClearSave_IsPrintFinished(env)) {
            PlaySE(SEQ_SE_DP_SAVE);
            env->timer = WAIT_SE_SAVE_FRAMES;
            ++(*state);
        }
        break;
    case 6:
        if (env->timer != 0) {
            env->timer--;
            break;
        }
        ++(*state);
        break;
    case 7:
        BeginNormalPaletteFade(3, 0, 0, RGB_BLACK, 8, 1, HEAP_ID_32);
        env->bgmVolume = 127;
        ++(*state);
        break;
    case 8:
        env->bgmVolume--;
        Sound_SetMasterVolume(env->bgmVolume);
        if (env->bgmVolume == 0) {
            StopBGM(GF_GetCurrentPlayingBGM(), 0);
            sub_0200616C(0);
            env->timer = SCREEN_FADEOUT_FRAMES;
            ++(*state);
        }
        break;
    case 9:
        if (env->timer != 0) {
            env->timer--;
            break;
        }
        ++(*state);
        break;
    case 10:
        if (IsPaletteFadeFinished()) {
            GameClearSave_Free(fieldSystem, env);
            Sound_SetMasterVolume(127);
            Credits_LaunchApp(fieldSystem, &env->creditsArgs);
            ++(*state);
        }
        break;
    case 11:
        if (!FieldSystem_ApplicationIsRunning(fieldSystem)) {
            Heap_Free(env);
            DestroyHeap(HEAP_ID_4);
            OS_ResetSystem(0);
            return TRUE;
        }
        break;
    }
    return FALSE;
}

// Marks the game as cleared and launches Hall of Fame Congratulations and
// Credits.
void CallTask_GameClear(TaskManager *taskman, u16 vsTrainerRed) {
    FieldSystem *fieldSystem;
    GameClearWork *env;
    SaveVarsFlags *varsFlags;
    Location *dynamicWarp;
    Location *spawnWarp;
    PlayerProfile *profile;

    fieldSystem = TaskManager_GetFieldSystem(taskman);
    env = AllocFromHeap(HEAP_ID_32, sizeof(GameClearWork));
    varsFlags = Save_VarsFlags_Get(fieldSystem->saveData);
    profile = Save_PlayerData_GetProfile(fieldSystem->saveData);
    dynamicWarp = LocalFieldData_GetDynamicWarp(Save_LocalFieldData_Get(fieldSystem->saveData));
    spawnWarp = LocalFieldData_GetSpecialSpawnWarpPtr(Save_LocalFieldData_Get(fieldSystem->saveData));

    env->gameCleared = CheckGameClearFlag(varsFlags);
    env->hofCongratsArgs.profile = Save_PlayerData_GetProfile(fieldSystem->saveData);
    env->hofCongratsArgs.party = SaveArray_Party_Get(fieldSystem->saveData);
    env->hofCongratsArgs.igt = Save_PlayerData_GetIGTAddr(fieldSystem->saveData);
    env->creditsArgs.gender = PlayerProfile_GetTrainerGender(Save_PlayerData_GetProfile(fieldSystem->saveData));
    env->creditsArgs.gameCleared = CheckGameClearFlag(varsFlags);
    env->vsTrainerRed = vsTrainerRed;

    if (!CheckGameClearFlag(varsFlags)) {
        FieldSystem_SetGameClearTime(fieldSystem);
    }
    SaveArray_Party_Get(fieldSystem->saveData);
    Location_SetToPlayerRoom(dynamicWarp);
    Location_SetToOutsidePlayerHome(spawnWarp);
    SetFlag966(varsFlags);
    SetGameClearFlag(varsFlags);
    PlayerProfile_SetGameClearFlag(profile);

    if (!env->vsTrainerRed) {
        GameStats_Inc(Save_GameStats_Get(fieldSystem->saveData), GAME_STAT_UNK74);
    }
    TaskManager_Call(taskman, Task_GameClear, env);
}

static void GameClearSave_InitGraphics(FieldSystem *fieldSystem, GameClearWork *env) {
    env->bgConfig = BgConfig_Alloc(HEAP_ID_FIELD);
    env->windowText = NULL;
    env->waitingIcon = NULL;
    InitWindow(&env->window);
    GfGfx_SetBanks(&sGameClearSaveBanksConfig);
    GX_SetDispSelect(GX_DISP_SELECT_MAIN_SUB);
    SetBothScreensModesAndDisable(&sGameClearSaveBgModeSet);
    BG_SetMaskColor(3, RGB_BLACK);
    InitBgFromTemplate(env->bgConfig, 3, &sGameClearSaveBgTemplate, 0);
    BG_ClearCharDataRange(3, 32, 0, HEAP_ID_32);
    FillBgTilemapRect(env->bgConfig, 3, RGB_BLACK, 0, 0, 32, 32, 17);
    BgCommitTilemapBufferToVram(env->bgConfig, 3);
}

static void GameClearSave_PrintSaving(FieldSystem *fieldSystem, GameClearWork *env) {
    Options *options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    env->windowText = ReadMsgData_NewNarc_NewString(NARC_msgdata_msg, NARC_msg_msg_0040_bin, msg_0040_00015, HEAP_ID_32);
    sub_0205B514(env->bgConfig, &env->window, 3);
    sub_0205B564(&env->window, options);
    env->printerId = sub_0205B5B4(&env->window, env->windowText, options, 1);
    env->waitingIcon = WaitingIcon_New(&env->window, 0x000003e2);
}

static BOOL GameClearSave_IsPrintFinished(GameClearWork *env) {
    return IsPrintFinished((u8)env->printerId);
}

static void sub_02052E70(GameClearWork *env) {
    String_Delete(env->windowText);
    sub_0200F450(env->waitingIcon);
    sub_0205B5A8(&env->window);
}

static void GameClearSave_PrintSaveStatus(FieldSystem *fieldSystem, GameClearWork *env, int writeStatus) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0040_bin, HEAP_ID_4);

    if (writeStatus == 2) {
        MessageFormat *msgFmt = MessageFormat_New(HEAP_ID_4);
        BufferPlayersName(msgFmt, 0, Save_PlayerData_GetProfile(fieldSystem->saveData));
        env->windowText = ReadMsgData_ExpandPlaceholders(msgFmt, msgData, msg_0040_00016, HEAP_ID_4);
        MessageFormat_Delete(msgFmt);
    } else {
        env->windowText = NewString_ReadMsgData(msgData, msg_0040_00018);
    }
    DestroyMsgData(msgData);
    Options *options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    env->printerId = sub_0205B5B4(&env->window, env->windowText, options, 1);
}

static void GameClearSave_Free(FieldSystem *fieldSystem, GameClearWork *env) {
    if (env->windowText != NULL) {
        String_Delete(env->windowText);
    }
    if (WindowIsInUse(&env->window)) {
        RemoveWindow(&env->window);
    }
    FreeBgTilemapBuffer(env->bgConfig, 3);
    Heap_Free(env->bgConfig);
}
