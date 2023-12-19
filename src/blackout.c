#include "scrcmd.h"
#include "gf_gfx_loader.h"
#include "unk_0200FA24.h"
#include "blackout.h"
#include "system.h"
#include "render_window.h"
#include "font.h"
#include "text.h"
#include "save_local_field_data.h"
#include "unk_0203BA5C.h"
#include "field_warp_tasks.h"
#include "brightness.h"
#include "unk_0206793C.h"
#include "unk_0200B150.h"
#include "unk_02054E00.h"
#include "unk_020552A4.h"
#include "use_item_on_mon.h"
#include "sound.h"
#include "msgdata/msg/msg_0203.h"
#include "msgdata/msg.naix"

static void Blackout_InitDisplays(BgConfig *bgConfig);
static void Blackout_DrawMessage(FieldSystem *fieldSystem, TaskManager *taskManager);
static BOOL Task_ShowPrintedBlackoutMessage(TaskManager *taskManager);
static void Blackout_PrintMessage(BlackoutScreenEnvironment *environment, s32 msgNo, u8 x, u8 y);

static const struct GraphicsBanks sBlackoutGraphicsBanks = {
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

static const struct GraphicsModes sBlackoutGraphicsModes = {
    .dispMode = GX_DISPMODE_GRAPHICS,
    .bgMode = GX_BGMODE_0,
    .subMode = GX_BGMODE_0,
    ._2d3dMode = GX_BG0_AS_2D,
};

static const BgTemplate sBlackoutBgTemplate = {
    .x = 0,
    .y = 0,
    .bufferSize = 0x800,
    .baseTile = 0,
    .size = GF_BG_SCR_SIZE_256x256,
    .colorMode = GX_BG_COLORMODE_16,
    .screenBase = GX_BG_SCRBASE_0xf800,
    .charBase = GX_BG_CHARBASE_0x00000,
    .bgExtPltt = GX_BG_EXTPLTT_01,
    .priority = 1,
    .areaOver = GX_BG_AREAOVER_XLU,
    .dummy = 0,
    .mosaic = FALSE
};

static const WindowTemplate sBlackoutWindowTemplate = {
    .bgId = GF_BG_LYR_MAIN_3,
    .left = 4,
    .top = 5,
    .width = 25,
    .height = 15,
    .palette = 13,
    .baseTile = 0x01
};

static void Blackout_InitDisplays(BgConfig *bgConfig) {
    GfGfx_SetBanks(&sBlackoutGraphicsBanks);
    SetBothScreensModesAndDisable(&sBlackoutGraphicsModes);
    InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_3, &sBlackoutBgTemplate, GF_BG_TYPE_TEXT);
    GfGfxLoader_GXLoadPal(NARC_graphic_font, 7, GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_13_OFFSET, 0x20, HEAP_ID_FIELD);
    BG_SetMaskColor(GF_BG_LYR_MAIN_3, RGB_WHITE);
}

static void Blackout_DrawMessage(FieldSystem *fieldSystem, TaskManager *taskManager) {
    BlackoutScreenEnvironment *env = AllocFromHeap(HEAP_ID_FIELD, sizeof(BlackoutScreenEnvironment));

    GF_ASSERT(env != NULL);
    memset(env, 0, sizeof(BlackoutScreenEnvironment));
    env->state = 0;
    env->fieldSystem = fieldSystem;
    env->bgConfig = BgConfig_Alloc(HEAP_ID_FIELD);
    sub_0200FBF4(PM_LCD_TOP, RGB_WHITE); //are RGBs correct here?
    sub_0200FBF4(PM_LCD_BOTTOM, RGB_WHITE);
    sub_0200FBDC(0); //PM_LCD_TOP?
    sub_0200FBDC(1); //PM_LCD_TOP?
    Blackout_InitDisplays(env->bgConfig);
    env->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0203_bin, HEAP_ID_FIELD);
    env->msgFmt = MessageFormat_New(HEAP_ID_FIELD);

    AddWindow(env->bgConfig, &env->window, &sBlackoutWindowTemplate);

    BufferPlayersName(env->msgFmt, 0, Save_PlayerData_GetProfileAddr(FieldSystem_GetSaveData(fieldSystem)));
    if (fieldSystem->location->mapId == MAP_T20R0201) {
        // {STRVAR_1 3, 0, 0} scurried back home, protecting the exhausted and fainted Pokémon from further harm...
        Blackout_PrintMessage(env, msg_0203_00004, 0, 0);
    } else {
        // {STRVAR_1 3, 0, 0} scurried to a Pokémon Center, protecting the exhausted and fainted Pokémon from further harm...
        Blackout_PrintMessage(env, msg_0203_00003, 0, 0);
    }
    CopyWindowToVram(&env->window);
    TaskManager_Call(taskManager, Task_ShowPrintedBlackoutMessage, env);
}

enum {
    STATE_SHOW_PRINTED_BLACKOUT_FADE_IN,
    STATE_SHOW_PRINTED_BLACKOUT_FADE_IN_WAIT,
    STATE_SHOW_PRINTED_BLACKOUT_FADE_OUT_INPUT,
    STATE_SHOW_PRINTED_BLACKOUT_FADE_OUT_WAIT,
    STATE_SHOW_PRINTED_BLACKOUT_CLEANUP,
};

static BOOL Task_ShowPrintedBlackoutMessage(TaskManager *taskManager) {
    BlackoutScreenEnvironment *env = TaskManager_GetEnvironment(taskManager);
    switch (env->state) {
        case STATE_SHOW_PRINTED_BLACKOUT_FADE_IN:
            BeginNormalPaletteFade(3, 1, 43, RGB_WHITE, 8, 1, HEAP_ID_32);
            G2_BlendNone();
            env->state++;
            break;
        case STATE_SHOW_PRINTED_BLACKOUT_FADE_IN_WAIT:
            if (IsPaletteFadeFinished()) {
                env->state++;
            }
            break;
        case STATE_SHOW_PRINTED_BLACKOUT_FADE_OUT_INPUT:
            if (gSystem.newKeys & PAD_BUTTON_A || gSystem.newKeys & PAD_BUTTON_B || gSystem.touchNew != 0) {
                BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 8, 1, HEAP_ID_32);
                env->state++;
            }
            break;
        case STATE_SHOW_PRINTED_BLACKOUT_FADE_OUT_WAIT:
            if (IsPaletteFadeFinished()) {
                FillWindowPixelBuffer(&env->window, 0);
                env->state++;
            }
            break;
        case STATE_SHOW_PRINTED_BLACKOUT_CLEANUP:
            ClearFrameAndWindow2(&env->window, FALSE);
            RemoveWindow(&env->window);
            MessageFormat_Delete(env->msgFmt);
            DestroyMsgData(env->msgData);
            FreeBgTilemapBuffer(env->bgConfig, GF_BG_LYR_MAIN_3);
            FreeToHeap(env->bgConfig);
            FreeToHeap(env);
            return TRUE;
    }

    return FALSE;
}

static void Blackout_PrintMessage(BlackoutScreenEnvironment *environment, s32 msgNo, u8 x, u8 y) {
    String *tmpStr = String_New(1024, HEAP_ID_FIELD);
    String *finStr = String_New(1024, HEAP_ID_FIELD);

    FillWindowPixelBuffer(&environment->window, 0);
    ReadMsgDataIntoString(environment->msgData, msgNo, tmpStr);
    StringExpandPlaceholders(environment->msgFmt, finStr, tmpStr);
        
    u32 width = FontID_String_GetWidthMultiline(0, finStr, 0);
    x = (environment->window.width * 8 - width);
    x /= 2;
    x -= 4;

    AddTextPrinterParameterized2(&environment->window, 0, finStr, x, y, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);

    String_Delete(tmpStr);
    String_Delete(finStr);
}

enum {
    STATE_BLACKOUT_TASK_INIT,
    STATE_BLACKOUT_TASK_SOUND_FADE,
    STATE_BLACKOUT_TASK_SOUND_FADE_WAIT,
    STATE_BLACKOUT_TASK_DRAW,
    STATE_BLACKOUT_TASK_RESTORE_OVERWORLD,
    STATE_BLACKOUT_TASK_QUEUE_SCRIPT,
    STATE_BLACKOUT_TASK_EXIT
};

BOOL Task_Blackout(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    u32 *state = TaskManager_GetStatePtr(taskManager);
    LocalFieldData *localFieldData;
    Location deathWarp;
    u16 deathSpawn;

    switch (*state) {
        case STATE_BLACKOUT_TASK_INIT:
            localFieldData = Save_LocalFieldData_Get(fieldSystem->saveData);
            deathSpawn = LocalFieldData_GetBlackoutSpawn(localFieldData);
            GetDeathWarpData(deathSpawn, &deathWarp);
            GetSpecialSpawnWarpData(deathSpawn, LocalFieldData_GetSpecialSpawnWarpPtr(localFieldData));
            sub_020537A8(taskManager, &deathWarp);
            FieldSystem_ClearFollowingTrainer(fieldSystem);
            HealParty(SaveArray_Party_Get(fieldSystem->saveData));
            (*state)++;
            break;
        case STATE_BLACKOUT_TASK_SOUND_FADE:
            GF_SndStartFadeOutBGM(0, 20);
            (*state)++;
            break;
        case STATE_BLACKOUT_TASK_SOUND_FADE_WAIT:
            if (GF_SndGetFadeTimer() == 0) {
                sub_02054F14();
                (*state)++;
            }
            break;
        case STATE_BLACKOUT_TASK_DRAW:
            SetBlendBrightness(-16, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BD | GX_BLEND_PLANEMASK_OBJ | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG0), SCREEN_MASK_MAIN);
            SetBlendBrightness(-16, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BD | GX_BLEND_PLANEMASK_OBJ | GX_BLEND_PLANEMASK_BG3 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG0), SCREEN_MASK_SUB);
            Blackout_DrawMessage(fieldSystem, taskManager);
            (*state)++;
            break;
        case STATE_BLACKOUT_TASK_RESTORE_OVERWORLD:
            CallTask_RestoreOverworld(taskManager);
            (*state)++;
            break;
        case STATE_BLACKOUT_TASK_QUEUE_SCRIPT:
            SetBlendBrightness(0, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BD | GX_BLEND_PLANEMASK_OBJ | GX_BLEND_PLANEMASK_BG3 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG0), SCREEN_MASK_MAIN | SCREEN_MASK_SUB);
            if (GetMomSpawnId() == LocalFieldData_GetBlackoutSpawn(Save_LocalFieldData_Get(fieldSystem->saveData))) {
                QueueScript(taskManager, std_whited_out_to_mom, NULL, NULL);
            } else {
                QueueScript(taskManager, std_whited_out_to_pokecenter, NULL, NULL);
            }
            (*state)++;
            break;
        case STATE_BLACKOUT_TASK_EXIT:
            return TRUE;
    }

    return FALSE;
}

void CallTask_Blackout(TaskManager *taskManager) {
    TaskManager_Call(taskManager, Task_Blackout, NULL);
}
