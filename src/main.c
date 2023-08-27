#include "global.h"
#include "main.h"
#include "system.h"
#include "gf_rtc.h"
#include "sound.h"
#include "sound_02004A44.h"
#include "player_data.h"
#include "unk_02026E30.h"
#include "font.h"
#include "timer_3.h"
#include "unk_02037C94.h"
#include "wfc_user_info_warning.h"
#include "save_data_read_error.h"
#include "unk_0200FA24.h"
#include "unk_0200B150.h"
#include "unk_02018380.h"
#include "unk_02035900.h"
#include "unk_0201F79C.h"
#include "communication_error.h"
#include "math_util.h"
#include "unk_020210A0.h"
#include "brightness.h"

FS_EXTERN_OVERLAY(OVY_60);
FS_EXTERN_OVERLAY(OVY_36);

extern const OVY_MGR_TEMPLATE ov60_021EB030;
extern const OVY_MGR_TEMPLATE ov36_App_MainMenu_SelectOption_Continue;

struct UnkStruct_02111868 {
    FSOverlayID mainOverlayId;
    OVY_MANAGER *overlayManager;
    FSOverlayID queuedMainOverlayId;
    const OVY_MGR_TEMPLATE *queuedMainOverlayTemplate;
    struct UnkStruct_02111868_sub unk_10;
};

int _02111864;
PMBackLightSwitch gBacklightTop;
struct UnkStruct_02111868 _02111868;

void sub_02000F60(void);
void DoSoftReset(u32 param);
void Main_RunOverlayManager(void);
void sub_02000FD8(u32 a0, int a1);
BOOL sub_02001098(int a0);

void NitroMain(void) {
    InitSystemForTheGame();
    InitGraphicMemory();
    InitKeypadAndTouchpad();
    sub_0201A4B0(0);
    PM_GetBackLight(&gBacklightTop, NULL);
    sub_02026E30();
    GF_InitRTCWork();
    Main_ResetOverlayManager();
    FontWork_Init();
    FontID_Alloc(0, HEAP_ID_3);
    FontID_Alloc(1, HEAP_ID_3);
    FontID_Alloc(3, HEAP_ID_3);
    _02111868.unk_10.unk_00 = -1;
    _02111868.unk_10.saveData = SaveData_New();
    sub_02005D00();
    InitSoundData(Save_Chatot_Get(_02111868.unk_10.saveData), Save_PlayerData_GetOptionsAddr(_02111868.unk_10.saveData));
    Init_Timer3();
    if (sub_02039FFC(3) == 3) {
        ShowWFCUserInfoWarning(HEAP_ID_3, 0);
    }
    if (!Save_FlashChipIsDetected(_02111868.unk_10.saveData)) {
        ShowSaveDataReadError(HEAP_ID_DEFAULT);
    } else {
        switch (OS_GetResetParameter()) {
        case 0:
            _02111868.unk_10.unk_04 = 0;
            RegisterMainOverlay(FS_OVERLAY_ID(OVY_60), &ov60_021EB030);
            break;
        case 1:
            sub_0200FBF4(0, 0);
            sub_0200FBF4(1, 0);
            _02111868.unk_10.unk_04 = 1;
            RegisterMainOverlay(FS_OVERLAY_ID(OVY_36), &ov36_App_MainMenu_SelectOption_Continue);
            break;
        default:
            GF_ASSERT(0);
            break;
        }
    }
    gSystem.unk70 = 1;
    gSystem.unk30 = 0;
    InitializeMainRNG();
    ScreenBrightnessData_InitAll();
    sub_02018380();
    _02111864 = 0;
    OS_InitTick();
    while (1) {
        sub_02000F60();
        HandleDSLidAction();
        ReadKeypadAndTouchpad();
        if ((gSystem.heldKeysRaw & (PAD_BUTTON_START | PAD_BUTTON_SELECT | PAD_BUTTON_L | PAD_BUTTON_R)) == (PAD_BUTTON_START | PAD_BUTTON_SELECT | PAD_BUTTON_L | PAD_BUTTON_R)) {
            if (!gSystem.softResetDisabled) {
                DoSoftReset(0); // no return
            }
        }
        if (sub_02036144()) {
            sub_02000F60();
            OS_GetTick();
            Main_RunOverlayManager();
            OS_GetTick();
            sub_0201F880(gSystem.unk18);
            sub_0201F880(gSystem.unk24);
            if (!gSystem.unk30) {
                OS_WaitIrq(TRUE, OS_IE_VBLANK);
                gSystem.vblankCounter++;
            }
        }
        GF_RTC_UpdateOnFrame();
        sub_020183B0();
        sub_02026E60();
        sub_0201F880(gSystem.unk24);
        OS_WaitIrq(TRUE, OS_IE_VBLANK);
        gSystem.vblankCounter++;
        gSystem.unk30 = 0;
        DoAllScreenBrightnessTransitionStep();
        HandleFadeUpdateFrame();
        if (gSystem.vBlankIntr != NULL) {
            gSystem.vBlankIntr(gSystem.vBlankIntrArg);
        }
        DoSoundUpdateFrame();
        sub_0201F880(gSystem.unk20);
    }
}

void Main_ResetOverlayManager(void) {
    _02111868.mainOverlayId = FS_OVERLAY_ID_NONE;
    _02111868.overlayManager = NULL;
    _02111868.queuedMainOverlayId = FS_OVERLAY_ID_NONE;
    _02111868.queuedMainOverlayTemplate = NULL;
}

void Main_RunOverlayManager(void) {
    if (_02111868.overlayManager == NULL) {
        if (_02111868.queuedMainOverlayTemplate == NULL) {
            return;
        }
        if (_02111868.queuedMainOverlayId != FS_OVERLAY_ID_NONE) {
            HandleLoadOverlay(_02111868.queuedMainOverlayId, OVY_LOAD_NORMAL);
        }
        _02111868.mainOverlayId = _02111868.queuedMainOverlayId;
        _02111868.overlayManager = OverlayManager_New(_02111868.queuedMainOverlayTemplate, &_02111868.unk_10, HEAP_ID_DEFAULT);
        _02111868.queuedMainOverlayId = FS_OVERLAY_ID_NONE;
        _02111868.queuedMainOverlayTemplate = NULL;
    }
    if (OverlayManager_Run(_02111868.overlayManager)) {
        OverlayManager_Delete(_02111868.overlayManager);
        _02111868.overlayManager = NULL;
        if (_02111868.mainOverlayId != FS_OVERLAY_ID_NONE) {
            UnloadOverlayByID(_02111868.mainOverlayId);
        }
    }
}

void RegisterMainOverlay(FSOverlayID overlayId, const OVY_MGR_TEMPLATE *template) {
    GF_ASSERT(_02111868.queuedMainOverlayTemplate == NULL);
    _02111868.queuedMainOverlayId = overlayId;
    _02111868.queuedMainOverlayTemplate = template;
}

static void sub_02000F14(void) {
    sub_02036144();
    OS_WaitIrq(TRUE, OS_IE_VBLANK);
    gSystem.vblankCounter++;
    gSystem.unk30 = 0;
    if (gSystem.vBlankIntr != NULL) {
        gSystem.vBlankIntr(gSystem.vBlankIntrArg);
    }
}

static void sub_02000F40(u32 param) {
    if (sub_02039AA4() && CARD_TryWaitBackupAsync() == TRUE) {
        OS_ResetSystem(param);
    }
    sub_02000F14();
}

void sub_02000F60(void) {
    int r1 = sub_020399B8();
    switch (r1) {
    case 5:
        sub_02000FD8(0, r1);
        break;
    case 1:
        sub_02000FD8(1, r1);
        break;
    case 2:
        sub_02000FD8(0, r1);
        break;
    case 3:
        sub_02000FD8(1, r1);
        break;
    }
}

void DoSoftReset(u32 param) {
    sub_0200FBF4(0, RGB_WHITE);
    sub_0200FBF4(1, RGB_WHITE);
    if (sub_02038D90()) {
        Save_Cancel(SaveData_Get());
    }
    while (1) {
        HandleDSLidAction();
        sub_02000F40(param);
    }
}

void sub_02000FD8(u32 a0, int a1) {
    int sp4;
    int r7;
    int r4;
    int r5;

    r4 = 0;
    sp4 = sub_0203993C();
    r7 = sub_02039998();
    gSystem.touchpadReadAuto = FALSE;
    if (a1 == 3) {
        r5 = 3;
    } else {
        if (a0 == 0) {
            if (sub_02039998() == TRUE) {
                r5 = 6;
            } else {
                r5 = 2;
            }
        } else {
            if (sub_02039998() == TRUE) {
                r5 = 5;
            } else {
                r5 = 0;
            }
        }
    }
    ShowCommunicationError(HEAP_ID_DEFAULT, r5, 0);
    sub_02038D90();
    sub_02000F14();
    DoSoundUpdateFrame();
    while (1) {
        HandleDSLidAction();
        ReadKeypadAndTouchpad();
        if (a1 == 1 && r5 == 0 && sub_02001098(sp4) && r7 == 0 && (gSystem.newKeys & PAD_BUTTON_B) && r4 >= 10) {
            a0 = 0;
            break;
        }
        if ((gSystem.newKeys & PAD_BUTTON_A) && r4 >= 10) {
            break;
        }
        DoSoundUpdateFrame();
        sub_02000F14();
        if (r4 < 10) {
            r4++;
        }
    }
    DoSoftReset(a0);
}

BOOL sub_02001098(int a0) {
    switch (a0) {
    case 0:
    case 7:
    case 9:
    case 13:
    case 18:
    case 26:
        return TRUE;
    default:
        return FALSE;
    }
}

void InitializeMainRNG(void) {
    RTCDate date;
    RTCTime time;
    u32 seed;
    GF_RTC_CopyDateTime(&date, &time);
    seed = date.year + date.month * 0x100 * date.day * 0x10000 + time.hour * 0x10000 + (time.minute + time.second) * 0x1000000 + gSystem.vblankCounter;
    SetMTRNGSeed(seed);
    SetLCRNGSeed(seed);
}

void HandleDSLidAction(void) {
    PMBackLightSwitch top, bottom;
    PMWakeUpTrigger trigger;
    if (PAD_DetectFold()) {
        if (!gSystem.lidClosedPauseDisabled) {
            GF_TouchpadPauseOnLidClose();
            GF_MicPauseOnLidClose();
            if (CTRDG_IsPulledOut() == TRUE) {
                _02111864 = 1;
            }
            while (1) {
                trigger = PM_TRIGGER_COVER_OPEN | PM_TRIGGER_CARD;
                if (gSystem.unk6A && !_02111864) {
                    trigger |= PM_TRIGGER_CARTRIDGE;
                }
                PM_GoSleepMode(trigger, PM_PAD_LOGIC_OR, 0);
                if (CARD_IsPulledOut()) {
                    PM_ForceToPowerOff();
                } else if (PAD_DetectFold()) {
                    _02111864 = 1;
                    continue;
                }
                break;
            }
            GF_TouchpadResumeOnLidOpen();
            GF_MicResumeOnLidOpen();
        } else {
            GF_TouchpadPauseOnLidClose();
            PM_GetBackLight(&top, &bottom);
            if (top == PM_BACKLIGHT_ON) {
                PM_SetBackLight(PM_LCD_ALL, PM_BACKLIGHT_OFF);
            }
        }
    } else {
        PM_GetBackLight(&top, &bottom);
        GF_TouchpadResumeOnLidOpen();
        if (top == PM_BACKLIGHT_OFF) {
            PM_SetBackLight(PM_LCD_ALL, gBacklightTop);
        }
    }
}
