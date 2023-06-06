#include "scrcmd.h"
#include "gf_gfx_loader.h"
#include "unk_0200FA24.h"
#include "field_black_out.h"
#include "system.h"
#include "render_window.h"
#include "font.h"
#include "text.h"
#include "save_flypoints.h"
#include "unk_0203BA5C.h"
#include "field_warp_tasks.h"
#include "unk_0200B380.h"
#include "unk_0206793C.h"
#include "unk_0200B150.h"
#include "unk_02054E00.h"
#include "unk_020552A4.h"
#include "use_item_on_mon.h"
#include "sound.h"
#include "msgdata/msg/msg_0203.h"

struct BlackoutScreenWork {
    int state;
    FieldSystem *fsys;
    BGCONFIG *bgConfig;
    WINDOW window;
    MSGDATA *msgData;
    MessageFormat *msgFmt;
};

void _InitDisplays(BGCONFIG *bgConfig);
void _DrawScurryMessageScreen(FieldSystem *fsys, TaskManager *taskManager);
BOOL _Task_ShowPrintedMessage(TaskManager *taskManager);
void _PrintMessage(struct BlackoutScreenWork *work, int msgno, u8 x, u8 y);

static void _InitDisplays(BGCONFIG *bgConfig) {
    {
        static const struct GXBanksConfig _020FC550 = {
            GX_VRAM_BG_128_B,
            GX_VRAM_BGEXTPLTT_NONE,
            GX_VRAM_SUB_BG_128_C,
            GX_VRAM_SUB_BGEXTPLTT_NONE,
            GX_VRAM_OBJ_64_E,
            GX_VRAM_OBJEXTPLTT_NONE,
            GX_VRAM_SUB_OBJ_16_I,
            GX_VRAM_SUB_OBJEXTPLTT_NONE,
            GX_VRAM_TEX_0_A,
            GX_VRAM_TEXPLTT_01_FG,
        };
        GX_SetBanks(&_020FC550);
    }
    {
        static const struct GFBgModeSet _020FC524 = {
            GX_DISPMODE_GRAPHICS,
            GX_BGMODE_0,
            GX_BGMODE_0,
            GX_BG0_AS_2D,
        };
        SetBothScreensModesAndDisable(&_020FC524);
    }
    {
        static const BGTEMPLATE _020FC534 = {
            0, 0, 0x800, 0,
            GF_BG_SCR_SIZE_256x256, GF_BG_CLR_4BPP, 31, 0, 0, 1, 0, 0, 0
        };
        InitBgFromTemplate(bgConfig, 3, &_020FC534, GF_BG_TYPE_TEXT);
    }
    GfGfxLoader_GXLoadPal(NARC_graphic_font, 7, GF_BG_LYR_MAIN_0, 0x1A0, 0x20, (HeapID)11);
    BG_SetMaskColor(3, RGB_WHITE);
}

static void _DrawScurryMessageScreen(FieldSystem *fsys, TaskManager *taskManager) {
    struct BlackoutScreenWork *env;

    env = AllocFromHeap((HeapID)11, sizeof(struct BlackoutScreenWork));
    GF_ASSERT(env != NULL);
    memset(env, 0, sizeof(struct BlackoutScreenWork));
    env->state = 0;
    env->fsys = fsys;
    env->bgConfig = BgConfig_Alloc((HeapID)11);
    sub_0200FBF4(0, RGB_WHITE);
    sub_0200FBF4(1, RGB_WHITE);
    sub_0200FBDC(0);
    sub_0200FBDC(1);
    _InitDisplays(env->bgConfig);
    env->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0203_bin, (HeapID)11);
    env->msgFmt = MessageFormat_new((HeapID)11);
    {
        static const WINDOWTEMPLATE _020FC51C = {
            3,
            4,
            5,
            25,
            15,
            13,
            0x001
        };

        AddWindow(env->bgConfig, &env->window, &_020FC51C);
    }
    BufferPlayersName(env->msgFmt, 0, Save_PlayerData_GetProfileAddr(FieldSys_GetSaveDataPtr(fsys)));
    if (fsys->location->mapId == MAP_T20R0201) {
        _PrintMessage(env, msg_0203_00004, 0, 0);
    } else {
        _PrintMessage(env, msg_0203_00003, 0, 0);
    }
    CopyWindowToVram(&env->window);
    TaskManager_Call(taskManager, _Task_ShowPrintedMessage, env);
}

static BOOL _Task_ShowPrintedMessage(TaskManager *taskManager) {
    struct BlackoutScreenWork *work = TaskManager_GetEnv(taskManager);
    switch (work->state) {
    case 0:
        BeginNormalPaletteFade(3, 1, 43, RGB_WHITE, 8, 1, (HeapID)32);
        G2_BlendNone();
        work->state++;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            work->state++;
        }
        break;
    case 2:
        if (gSystem.newKeys & PAD_BUTTON_A || gSystem.newKeys & PAD_BUTTON_B || gSystem.touchNew != 0) {
            BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 8, 1, (HeapID)32);
            work->state++;
        }
        break;
    case 3:
        if (IsPaletteFadeFinished()) {
            FillWindowPixelBuffer(&work->window, 0);
            work->state++;
        }
        break;
    case 4:
        ClearFrameAndWindow2(&work->window, 0);
        RemoveWindow(&work->window);
        MessageFormat_delete(work->msgFmt);
        DestroyMsgData(work->msgData);
        FreeBgTilemapBuffer(work->bgConfig, 3);
        FreeToHeap(work->bgConfig);
        FreeToHeap(work);
        return TRUE;
    }

    return FALSE;
}

static void _PrintMessage(struct BlackoutScreenWork *work, int msgno, u8 x, u8 y) {
    STRING *str0 = String_New(1024, (HeapID)11);
    STRING *str1 = String_New(1024, (HeapID)11);

    FillWindowPixelBuffer(&work->window, 0);
    ReadMsgDataIntoString(work->msgData, msgno, str0);
    StringExpandPlaceholders(work->msgFmt, str1, str0);
    {
        u32 width = FontID_String_GetWidthMultiline(0, str1, 0);
        x = (work->window.width * 8 - width);
        x /= 2;
        x -= 4;
        AddTextPrinterParameterized2(&work->window, 0, str1, x, y, TEXT_SPEED_NOTRANSFER, MakeTextColor(1, 2, 0), NULL);
    }

    String_dtor(str0);
    String_dtor(str1);
}

BOOL Task_BlackOut(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    u32 *state = TaskManager_GetStatePtr(taskManager);
    FLYPOINTS_SAVE *flypointsSave;
    Location deathWarp;
    u16 deathSpawn;

    switch (*state) {
    case 0:
        flypointsSave = Save_FlyPoints_get(fsys->savedata);
        deathSpawn = FlyPoints_GetDeathSpawn(flypointsSave);
        GetDeathWarpData(deathSpawn, &deathWarp);
        GetSpecialSpawnWarpData(deathSpawn, FlyPoints_GetSpecialSpawnWarpPtr(flypointsSave));
        sub_020537A8(taskManager, &deathWarp);
        Fsys_ClearFollowingTrainer(fsys);
        HealParty(SaveArray_PlayerParty_get(fsys->savedata));
        (*state)++;
        break;
    case 1:
        GF_SndStartFadeOutBGM(0, 20);
        (*state)++;
        break;
    case 2:
        if (GF_SndGetFadeTimer() == 0) {
            sub_02054F14();
            (*state)++;
        }
        break;
    case 3:
        SetBlendBrightness(-16, 0x37, 1);
        SetBlendBrightness(-16, 0x3F, 2);
        _DrawScurryMessageScreen(fsys, taskManager);
        (*state)++;
        break;
    case 4:
        sub_020552A4(taskManager);
        (*state)++;
        break;
    case 5:
        SetBlendBrightness(0, 0x3F, 3);
        if (GetMomSpawnId() == FlyPoints_GetDeathSpawn(Save_FlyPoints_get(fsys->savedata))) {
            QueueScript(taskManager, std_whited_out_to_mom, NULL, NULL);
        } else {
            QueueScript(taskManager, std_whited_out_to_pokecenter, NULL, NULL);
        }
        (*state)++;
        break;
    case 6:
        return TRUE;
    }

    return FALSE;
}

void FieldTask_CallBlackOut(TaskManager *taskManager) {
    TaskManager_Call(taskManager, Task_BlackOut, NULL);
}
