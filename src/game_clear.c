#include "global.h"
#include "event_data.h"
#include "game_stats.h"
#include "party.h"
#include "game_clear.h"
#include "hall_of_fame.h"
#include "overlay_63.h"
#include "player_data.h"
#include "save_arrays.h"
#include "save_flypoints.h"
#include "sound.h"
#include "sys_flags.h"
#include "task.h"
#include "text.h"
#include "sound_02004A44.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"
#include "unk_0203E348.h"
#include "unk_02054E00.h"
#include "unk_020552A4.h"
#include "unk_02055418.h"
#include "unk_0206793C.h"
#include "unk_0206D494.h"
#include "use_item_on_mon.h"
#include "window.h"
#include "constants/sndseq.h"
#include "credits/credits.h"
#include "msgdata/msg/msg_0040.h"
#include "render_window.h"

#define WAIT_SE_SAVE_FRAMES   32
#define SCREEN_FADEOUT_FRAMES 32

typedef struct {
    BOOL gameCleared;
    HOFCongratsAppArgs hofCongratsArgs;
    CreditsAppArgs creditsArgs;
    BGCONFIG *bgConfig;
    WINDOW window;
    STRING *windowText;
    WaitingIcon *waitingIcon;
    int printerId;
    int timer;
    BOOL vsTrainerRed;
    int bgmVolume;      // also used as a timer
} GameClearWork;

static const GF_GXBanksConfig sGameClearSaveBanksConfig = {
    .bg            = GX_VRAM_BG_128_B,
    .bgextpltt     = GX_VRAM_BGEXTPLTT_NONE,
    .subbg         = GX_VRAM_SUB_BG_128_C,
    .subbgextpltt  = GX_VRAM_SUB_BGEXTPLTT_NONE,
    .obj           = GX_VRAM_OBJ_64_E,
    .objextpltt    = GX_VRAM_OBJEXTPLTT_NONE,
    .subobj        = GX_VRAM_SUB_OBJ_16_I,
    .subobjextpltt = GX_VRAM_SUB_OBJEXTPLTT_NONE,
    .tex           = GX_VRAM_TEX_0_A,
    .texpltt       = GX_VRAM_TEXPLTT_01_FG,
};

static const struct GFBgModeSet sGameClearSaveBgModeSet = {
    .dispMode    = GX_DISPMODE_GRAPHICS,
    .bgModeMain  = GX_BGMODE_0,
    .bgModeSub   = GX_BGMODE_0,
    ._2d3dSwitch = GX_BG0_AS_2D,
};

static const BGTEMPLATE sGameClearSaveBgTemplate = {
    .x          = 0,
    .y          = 0,
    .bufferSize = 0x0800,
    .baseTile   = 0,
    .size       = GF_BG_SCR_SIZE_256x256,
    .colorMode  = GX_BG_COLORMODE_16,
    .screenBase = GX_BG_SCRBASE_0x0000,
    .charBase   = GX_BG_CHARBASE_0x00000,
    .bgExtPltt  = GX_BG_EXTPLTT_01,
    .priority   = 1,
    .areaOver   = GX_BG_AREAOVER_XLU,
    .dummy      = 0,
    .mosaic     = FALSE,
};

BOOL Task_GameClearSave(TaskManager *taskman);
static void GameClearSave_InitGraphics(FieldSystem *fsys, GameClearWork *env);
static void GameClearSave_PrintSaving(FieldSystem *fsys, GameClearWork *env);
static BOOL GameClearSave_IsPrintFinished(GameClearWork *env);
static void sub_02052E70(GameClearWork *env);
static void GameClearSave_PrintSaveStatus(FieldSystem *fsys, GameClearWork *env, int a2);
static void GameClearSave_Free(FieldSystem *fsys, GameClearWork *env);

// Might be called as Lance escorts player out of Champion room and into
// Hall of Fame?
BOOL sub_0205298C(TaskManager *taskman) {
    FieldSystem *fsys = TaskManager_GetSys(taskman);
    int *state = TaskManager_GetStatePtr(taskman);

    switch (*state) {
    case 0:
        sub_0206DB58(taskman, fsys);
        Fsys_ClearFollowingTrainer(fsys);
        HealParty(SaveArray_PlayerParty_get(fsys->savedata));
        *state += 1;
        break;
    case 1:
        GF_SndStartFadeOutBGM(0, 20);
        *state += 1;
        break;
    case 2:
        if (!GF_SndGetFadeTimer()) {
            sub_02054F14();
            *state += 1;
            break;
        }
        break;
    case 3:
        sub_020552A4(taskman);
        *state += 1;
        break;
    case 4:
        BeginNormalPaletteFade(0, 1, 1, RGB_WHITE, 8, 1, HEAP_ID_32);
        reg_G2_BLDCNT = 0;
        *state += 1;
        break;
    case 5:
        if (IsPaletteFadeFinished()) {
            return TRUE;
        }
        break;
    }
    return FALSE;
}

static void AddHallOfFameEntry(FieldSystem *fsys, BOOL gameCleared) {
    int val;
    RTCDate date;

    HALL_OF_FAME *hof = LoadHallOfFame(fsys->savedata, HEAP_ID_FIELD, &val);
    if (val != 1 || !gameCleared) {
        Save_HOF_init(hof);
    }
    PARTY *party = SaveArray_PlayerParty_get(fsys->savedata);

    GF_RTC_CopyDate(&date);
    Save_HOF_RecordParty(hof, party, &date);
    SaveHallOfFame(fsys->savedata, hof);
    FreeToHeap(hof);
}

// Launches the Hall of Fame Congratulations app if the player beat Lance. Saves
// the game and launches the credits.
static BOOL Task_GameClearSave(TaskManager *taskman) {
    FieldSystem *fsys = TaskManager_GetSys(taskman);
    GameClearWork *env = TaskManager_GetEnv(taskman);
    int *state = TaskManager_GetStatePtr(taskman);

    switch (*state) {
    case 0:
        if (!env->vsTrainerRed) {
            LaunchHOFCongratsApp(fsys, &env->hofCongratsArgs);
            *state += 1;
            break;
        }
        GameClearSave_InitGraphics(fsys, env);
        BeginNormalPaletteFade(3, 1, 1, RGB_BLACK, 8, 1, HEAP_ID_32);
        *state = 2;
        break;
    case 1:
        if (!FieldSys_ApplicationIsRunning(fsys)) {
            CreateHeap(3, 4, 0x20000);
            GameClearSave_InitGraphics(fsys, env);
            BeginNormalPaletteFade(3, 1, 1, RGB_BLACK, 8, 1, HEAP_ID_32);
            *state += 1;
        }
        break;
    case 2:
        if (IsPaletteFadeFinished()) {
            if (!Save_FileDoesNotBelongToPlayer(fsys->savedata)) {
                GameClearSave_PrintSaving(fsys, env);
                *state += 1;
                break;
            }
            *state = 7;
        }
        break;
    case 3:
        if (GameClearSave_IsPrintFinished(env)) {
            *state += 1;
        }
        break;
    case 4:
        HealParty(SaveArray_PlayerParty_get(fsys->savedata));
        int writeStatus = SaveGameNormal(fsys->savedata);
        if (!env->vsTrainerRed) {
            AddHallOfFameEntry(fsys, env->gameCleared);
        }
        sub_02052E70(env);
        GameClearSave_PrintSaveStatus(fsys, env, writeStatus);
        *state += 1;
        break;
    case 5:
        if (GameClearSave_IsPrintFinished(env)) {
            PlaySE(SEQ_SE_DP_SAVE);
            env->timer = WAIT_SE_SAVE_FRAMES;
            *state += 1;
        }
        break;
    case 6:
        if (env->timer != 0) {
            env->timer--;
            break;
        }
        *state += 1;
        break;
    case 7:
        BeginNormalPaletteFade(3, 0, 0, RGB_BLACK, 8, 1, HEAP_ID_32);
        env->bgmVolume = 127;
        *state += 1;
        break;
    case 8:
        env->bgmVolume--;
        sub_020059D0(env->bgmVolume);
        if (env->bgmVolume == 0) {
            StopBGM(GF_GetCurrentPlayingBGM(), 0);
            sub_0200616C(0);
            env->timer = SCREEN_FADEOUT_FRAMES;
            *state += 1;
        }
        break;
    case 9:
        if (env->timer != 0) {
            env->timer--;
            break;
        }
        *state += 1;
        break;
    case 10:
        if (IsPaletteFadeFinished()) {
            GameClearSave_Free(fsys, env);
            sub_020059D0(127);
            LaunchCreditsApp(fsys, &env->creditsArgs);
            *state += 1;
        }
        break;
    case 11:
        if (!FieldSys_ApplicationIsRunning(fsys)) {
            FreeToHeap(env);
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
void Task_GameClear(TaskManager *taskman, u16 vsTrainerRed) {
    FieldSystem *fsys;
    GameClearWork *env;
    SCRIPT_STATE *scriptState;
    Location *dynamicWarp;
    Location *spawnWarp;
    PLAYERPROFILE *profile;

    fsys = TaskManager_GetSys(taskman);
    env = AllocFromHeap(HEAP_ID_32, sizeof(GameClearWork));
    scriptState = SaveArray_Flags_get(fsys->savedata);
    profile = Save_PlayerData_GetProfileAddr(fsys->savedata);
    dynamicWarp = FlyPoints_GetDynamicWarp(Save_FlyPoints_get(fsys->savedata));
    spawnWarp = FlyPoints_GetSpecialSpawnWarpPtr(Save_FlyPoints_get(fsys->savedata));

    env->gameCleared = CheckGameClearFlag(scriptState);
    env->hofCongratsArgs.profile = Save_PlayerData_GetProfileAddr(fsys->savedata);
    env->hofCongratsArgs.party = SaveArray_PlayerParty_get(fsys->savedata);
    env->hofCongratsArgs.igt = Save_PlayerData_GetIGTAddr(fsys->savedata);
    env->creditsArgs.gender = PlayerProfile_GetTrainerGender(Save_PlayerData_GetProfileAddr(fsys->savedata));
    env->creditsArgs.gameCleared = CheckGameClearFlag(scriptState);
    env->vsTrainerRed = vsTrainerRed;

    if (!CheckGameClearFlag(scriptState)) {
        FieldSys_SetGameClearTime(fsys);
    }
    SaveArray_PlayerParty_get(fsys->savedata);
    LocationData_BackUp(dynamicWarp);
    LocationData_Restore(spawnWarp);
    SetFlag966(scriptState);
    SetGameClearFlag(scriptState);
    PlayerProfile_SetGameClearFlag(profile);

    if (!env->vsTrainerRed) {
        GameStats_Inc(Save_GameStats_get(fsys->savedata), 74);
    }
    TaskManager_Call(taskman, Task_GameClearSave, env);
}

static void GameClearSave_InitGraphics(FieldSystem *fsys, GameClearWork *env) {
    env->bgConfig = BgConfig_Alloc(HEAP_ID_FIELD);
    env->windowText = NULL;
    env->waitingIcon = NULL;
    InitWindow(&env->window);
    GX_SetBanks(&sGameClearSaveBanksConfig);
    GX_SetDispSelect(GX_DISP_SELECT_MAIN_SUB);
    SetBothScreensModesAndDisable(&sGameClearSaveBgModeSet);
    BG_SetMaskColor(3, RGB_BLACK);
    InitBgFromTemplate(env->bgConfig, 3, &sGameClearSaveBgTemplate, 0);
    BG_ClearCharDataRange(3, 32, 0, HEAP_ID_32);
    FillBgTilemapRect(env->bgConfig, 3, RGB_BLACK, 0, 0, 32, 32, 17);
    BgCommitTilemapBufferToVram(env->bgConfig, 3);
}

static void GameClearSave_PrintSaving(FieldSystem *fsys, GameClearWork *env) {
    OPTIONS *options = Save_PlayerData_GetOptionsAddr(fsys->savedata);
    env->windowText = ReadMsgData_NewNarc_NewString(NARC_msgdata_msg, NARC_msg_msg_0040_bin, msg_0040_00015, HEAP_ID_32);
    sub_0205B514(env->bgConfig, &env->window, 3);
    sub_0205B564(&env->window, options);
    env->printerId = sub_0205B5B4(&env->window, env->windowText, options, 1);
    env->waitingIcon = WaitingIcon_new(&env->window, 0x000003e2);
}

static BOOL GameClearSave_IsPrintFinished(GameClearWork *env) {
    return IsPrintFinished((u8)env->printerId);
}

static void sub_02052E70(GameClearWork *env) {
    String_Delete(env->windowText);
    sub_0200F450(env->waitingIcon);
    sub_0205B5A8(&env->window);
}

static void GameClearSave_PrintSaveStatus(FieldSystem *fsys, GameClearWork *env, int writeStatus) {
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0040_bin, HEAP_ID_4);

    if (writeStatus == 2) {
        MessageFormat *msgFmt = MessageFormat_new(HEAP_ID_4);
        BufferPlayersName(msgFmt, 0, Save_PlayerData_GetProfileAddr(fsys->savedata));
        env->windowText = ReadMsgData_ExpandPlaceholders(msgFmt, msgData, msg_0040_00016, HEAP_ID_4);
        MessageFormat_delete(msgFmt);
    } else {
        env->windowText = NewString_ReadMsgData(msgData, msg_0040_00018);
    }
    DestroyMsgData(msgData);
    OPTIONS *options = Save_PlayerData_GetOptionsAddr(fsys->savedata);
    env->printerId = sub_0205B5B4(&env->window, env->windowText, options, 1);
}

static void GameClearSave_Free(FieldSystem *fsys, GameClearWork *env) {
    if (env->windowText != NULL) {
        String_Delete(env->windowText);
    }
    if (WindowIsInUse(&env->window)) {
        RemoveWindow(&env->window);
    }
    FreeBgTilemapBuffer(env->bgConfig, 3);
    FreeToHeap(env->bgConfig);
}
