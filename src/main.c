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

FS_EXTERN_OVERLAY(OVY_60);
FS_EXTERN_OVERLAY(OVY_36);

extern const OVY_MGR_TEMPLATE ov60_021EB030;
extern const OVY_MGR_TEMPLATE ov36_021E5C04;

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
void DoSoftReset(int a0);
void Main_RunOverlayManager(void);

void NitroMain(void) {
    InitSystemForTheGame();
    InitGraphicMemory();
    InitKeypadAndTouchpad();
    sub_0201A4B0(0);
    PM_GetBackLight(&gBacklightTop, NULL);
    sub_02026E30();
    GF_InitRTCWork();
    Main_ResetOverlayManager();
    sub_02002CA8();
    sub_02002CEC(0, 3);
    sub_02002CEC(1, 3);
    sub_02002CEC(3, 3);
    _02111868.unk_10.unk_00 = -1;
    _02111868.unk_10.savedata = SaveBlock2_new();
    sub_02005D00();
    InitSoundData(Sav2_Chatot_get(_02111868.unk_10.savedata), Sav2_PlayerData_GetOptionsAddr(_02111868.unk_10.savedata));
    Init_Timer3();
    if (sub_02039FFC(3) == 3) {
        ShowWFCUserInfoWarning(3, 0);
    }
    if (!sub_020274D0(_02111868.unk_10.savedata)) {
        ShowSaveDataReadError(0);
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
            RegisterMainOverlay(FS_OVERLAY_ID(OVY_36), &ov36_021E5C04);
            break;
        default:
            GF_ASSERT(0);
            break;
        }
    }
    gSystem.unk70 = 1;
    gSystem.unk30 = 0;
    InitializeMainRNG();
    sub_0200B528();
    sub_02018380();
    _02111864 = 0;
    OS_InitTick();
    while (1) {
        sub_02000F60();
        HandleDSLidAction();
        ReadKeypadAndTouchpad();
        if ((gSystem.heldKeysRaw & (PAD_BUTTON_START | PAD_BUTTON_SELECT | PAD_BUTTON_L | PAD_BUTTON_R)) == (PAD_BUTTON_START | PAD_BUTTON_SELECT | PAD_BUTTON_L | PAD_BUTTON_R)) {
            if (!gSystem.unk6C) {
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
                gSystem.unk2C++;
            }
        }
        GF_RTC_UpdateOnFrame();
        sub_020183B0();
        sub_02026E60();
        sub_0201F880(gSystem.unk24);
        OS_WaitIrq(TRUE, OS_IE_VBLANK);
        gSystem.unk2C++;
        gSystem.unk30 = 0;
        sub_0200B594();
        sub_0200FB2C();
        if (gSystem.vBlankIntr != NULL) {
            gSystem.vBlankIntr(gSystem.vBlankIntrArg);
        }
        DoSoundUpdateFrame();
        sub_0201F880(gSystem.unk20);
    }
}
