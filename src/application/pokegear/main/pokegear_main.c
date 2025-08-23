#include "application/pokegear/pokegear_main.h"

#include "application/pokegear/pokegear_internal.h"

#include "mail_misc.h"
#include "overlay_102.h"
#include "pokegear_apps.h"
#include "sound_02004A44.h"
#include "unk_02005D10.h"
#include "unk_02092BE8.h"
#include "vram_transfer_manager.h"

FS_EXTERN_OVERLAY(pokegear_app);
FS_EXTERN_OVERLAY(OVY_102);

typedef enum PokegearAppMainState {
    POKEGEAR_APP_MAIN_STATE_SETUP,
    POKEGEAR_APP_MAIN_STATE_TEARDOWN,
    POKEGEAR_APP_MAIN_STATE_LAUNCH_CONFIGURE,
    POKEGEAR_APP_MAIN_STATE_RUN_CONFIGURE,
    POKEGEAR_APP_MAIN_STATE_LAUNCH_RADIO,
    POKEGEAR_APP_MAIN_STATE_RUN_RADIO,
    POKEGEAR_APP_MAIN_STATE_LAUNCH_MAP,
    POKEGEAR_APP_MAIN_STATE_RUN_MAP,
    POKEGEAR_APP_MAIN_STATE_LAUNCH_DEBUG,
    POKEGEAR_APP_MAIN_STATE_RUN_DEBUG,
    POKEGEAR_APP_MAIN_STATE_LAUNCH_PHONE,
    POKEGEAR_APP_MAIN_STATE_RUN_PHONE,
    POKEGEAR_APP_MAIN_STATE_QUIT,
} PokegearAppMainState;

static BOOL PokegearApp_RunSubapp(OverlayManager **ppOvyMan);
static PokegearAppMainState Pokegear_MainStep_Setup(PokegearAppData *pokegearApp);
static PokegearAppMainState Pokegear_MainStep_Teardown(PokegearAppData *pokegearApp);
static PokegearAppMainState Pokegear_MainStep_LaunchMap(PokegearAppData *pokegearApp);
static PokegearAppMainState Pokegear_MainStep_RunMap(PokegearAppData *pokegearApp);
static PokegearAppMainState Pokegear_MainStep_LaunchDebug(PokegearAppData *pokegearApp);
static PokegearAppMainState Pokegear_MainStep_RunDebug(PokegearAppData *pokegearApp);
static PokegearAppMainState Pokegear_MainStep_LaunchConfigure(PokegearAppData *pokegearApp);
static PokegearAppMainState Pokegear_MainStep_RunConfigure(PokegearAppData *pokegearApp);
static PokegearAppMainState Pokegear_MainStep_LaunchPhone(PokegearAppData *pokegearApp);
static PokegearAppMainState Pokegear_MainStep_RunPhone(PokegearAppData *pokegearApp);
static PokegearAppMainState Pokegear_MainStep_LaunchRadio(PokegearAppData *pokegearApp);
static PokegearAppMainState Pokegear_MainStep_RunRadio(PokegearAppData *pokegearApp);

static BOOL PokegearApp_RunSubapp(OverlayManager **ppOvyMan) {
    if (*ppOvyMan != NULL && OverlayManager_Run(*ppOvyMan)) {
        OverlayManager_Delete(*ppOvyMan);
        *ppOvyMan = NULL;
        return TRUE;
    }

    return FALSE;
}

BOOL Pokegear_Init(OverlayManager *man, int *state) {
    PokegearArgs *args = OverlayManager_GetArgs(man);
    sub_0200616C(0);
    Heap_Create(HEAP_ID_3, HEAP_ID_POKEGEAR, 0x32000);
    PokegearAppData *pokegearApp = OverlayManager_CreateAndGetData(man, sizeof(PokegearAppData), HEAP_ID_POKEGEAR);
    memset(pokegearApp, 0, sizeof(PokegearAppData));
    pokegearApp->args = args;
    pokegearApp->heapID = HEAP_ID_POKEGEAR;
    pokegearApp->saveData = pokegearApp->args->saveData;
    pokegearApp->savePokegear = SaveData_Pokegear_Get(pokegearApp->args->saveData);
    pokegearApp->saveVarsFlags = Save_VarsFlags_Get(pokegearApp->args->saveData);
    pokegearApp->options = Save_PlayerData_GetOptionsAddr(pokegearApp->args->saveData);
    pokegearApp->profile = Save_PlayerData_GetProfile(pokegearApp->args->saveData);
    pokegearApp->registeredCards = Pokegear_GetRegisteredCardsArray(pokegearApp->savePokegear);
    pokegearApp->menuInputState = MenuInputStateMgr_GetState(pokegearApp->args->menuInputStatePtr);
    pokegearApp->backgroundStyle = Pokegear_GetBackgroundStyle(pokegearApp->savePokegear);
    switch (pokegearApp->args->isScriptedLaunch) {
    case 1: // scripted phone call
        pokegearApp->app = GEAR_APP_PHONE;
        break;
    case 0: // normal menu open
    default:
        pokegearApp->app = SavePokegear_GetLastUsedApp(pokegearApp->savePokegear);
        if (pokegearApp->app == GEAR_APP_MAP) {
            if (!(pokegearApp->registeredCards & 1)) {
                pokegearApp->app = GEAR_APP_CONFIGURE;
            }
        } else if (pokegearApp->app == GEAR_APP_RADIO) {
            if (!(pokegearApp->registeredCards & 2)) {
                pokegearApp->app = GEAR_APP_CONFIGURE;
            }
        }
        break;
    }
    pokegearApp->unk_038 = 0;
    pokegearApp->mapSessionState.word = EC_WORD_NULL;
    pokegearApp->cursorInAppSwitchZone = 1;
    Sound_SetSceneAndPlayBGM(0x37, 0, 0);
    return TRUE;
}

BOOL Pokegear_Main(OverlayManager *man, int *state) {
    PokegearAppData *pokegearApp = OverlayManager_GetData(man);
    switch (*state) {
    case POKEGEAR_APP_MAIN_STATE_SETUP:
        *state = Pokegear_MainStep_Setup(pokegearApp);
        break;
    case POKEGEAR_APP_MAIN_STATE_TEARDOWN:
        *state = Pokegear_MainStep_Teardown(pokegearApp);
        break;
    case POKEGEAR_APP_MAIN_STATE_LAUNCH_CONFIGURE:
        *state = Pokegear_MainStep_LaunchConfigure(pokegearApp);
        break;
    case POKEGEAR_APP_MAIN_STATE_RUN_CONFIGURE:
        *state = Pokegear_MainStep_RunConfigure(pokegearApp);
        break;
    case POKEGEAR_APP_MAIN_STATE_LAUNCH_RADIO:
        *state = Pokegear_MainStep_LaunchRadio(pokegearApp);
        break;
    case POKEGEAR_APP_MAIN_STATE_RUN_RADIO:
        *state = Pokegear_MainStep_RunRadio(pokegearApp);
        break;
    case POKEGEAR_APP_MAIN_STATE_LAUNCH_MAP:
        *state = Pokegear_MainStep_LaunchMap(pokegearApp);
        break;
    case POKEGEAR_APP_MAIN_STATE_RUN_MAP:
        *state = Pokegear_MainStep_RunMap(pokegearApp);
        break;
    case POKEGEAR_APP_MAIN_STATE_LAUNCH_DEBUG:
        *state = Pokegear_MainStep_LaunchDebug(pokegearApp);
        break;
    case POKEGEAR_APP_MAIN_STATE_RUN_DEBUG:
        *state = Pokegear_MainStep_RunDebug(pokegearApp);
        break;
    case POKEGEAR_APP_MAIN_STATE_LAUNCH_PHONE:
        *state = Pokegear_MainStep_LaunchPhone(pokegearApp);
        break;
    case POKEGEAR_APP_MAIN_STATE_RUN_PHONE:
        *state = Pokegear_MainStep_RunPhone(pokegearApp);
        break;
    case POKEGEAR_APP_MAIN_STATE_QUIT:
        return TRUE;
    }
    return FALSE;
}

BOOL Pokegear_Exit(OverlayManager *man, int *state) {
    PokegearAppData *pokegearApp = OverlayManager_GetData(man);
    SavePokegear_SetLastUsedApp(pokegearApp->savePokegear, pokegearApp->app);
    MenuInputStateMgr_SetState(pokegearApp->args->menuInputStatePtr, pokegearApp->menuInputState);
    enum HeapID heapID = pokegearApp->heapID;
    OverlayManager_FreeData(man);
    sub_02004B10();
    sub_0203E354();
    Heap_Destroy(heapID);
    return TRUE;
}

// -----------------------------
// Local functions
// -----------------------------

void PokegearApp_VBlankCB(void *cb_args) {
    PokegearAppData *pokegearApp = (PokegearAppData *)cb_args;

    if (pokegearApp->vblankCB != NULL) {
        pokegearApp->vblankCB(pokegearApp, pokegearApp->childAppdata);
    }

    if (pokegearApp->plttData != NULL) {
        PaletteData_PushTransparentBuffers(pokegearApp->plttData);
    }

    if (pokegearApp->spriteSystem != NULL) {
        if (pokegearApp->unk_094 != NULL) {
            PokegearApp_UpdateClockSprites(pokegearApp, 0);
            ov100_021E6AB0(pokegearApp->unk_094);
        }
        PokegearApp_DrawSprites(pokegearApp);
        SpriteSystem_TransferOam();
    }

    GF_RunVramTransferTasks();
    DoScheduledBgGpuUpdates(pokegearApp->bgConfig);
    OS_SetIrqCheckFlag(OS_IE_V_BLANK);
}

static PokegearAppMainState Pokegear_MainStep_Setup(PokegearAppData *pokegearApp) {
    if (!PokegearApp_LoadGFX(pokegearApp)) {
        return POKEGEAR_APP_MAIN_STATE_SETUP;
    }

    switch (pokegearApp->app) {
    case GEAR_APP_MAP:
    case GEAR_APP_CANCEL:
        return POKEGEAR_APP_MAIN_STATE_LAUNCH_MAP;
    case GEAR_APP_RADIO:
        return POKEGEAR_APP_MAIN_STATE_LAUNCH_RADIO;
    case GEAR_APP_PHONE:
        return POKEGEAR_APP_MAIN_STATE_LAUNCH_PHONE;
    case GEAR_APP_CONFIGURE:
        return POKEGEAR_APP_MAIN_STATE_LAUNCH_CONFIGURE;
    }

    return POKEGEAR_APP_MAIN_STATE_LAUNCH_CONFIGURE;
}

static PokegearAppMainState Pokegear_MainStep_Teardown(PokegearAppData *pokegearApp) {
    if (PokegearApp_UnloadGFX(pokegearApp)) {
        return POKEGEAR_APP_MAIN_STATE_QUIT;
    }

    return POKEGEAR_APP_MAIN_STATE_TEARDOWN;
}

static PokegearAppMainState Pokegear_MainStep_LaunchMap(PokegearAppData *pokegearApp) {
    static const OverlayManagerTemplate sOverlayTemplate_GearMap = { PokegearMap_Init, PokegearMap_Main, PokegearMap_Exit, FS_OVERLAY_ID(pokegear_app) };
    pokegearApp->childApplication = OverlayManager_New(&sOverlayTemplate_GearMap, pokegearApp, pokegearApp->heapID);
    return POKEGEAR_APP_MAIN_STATE_RUN_MAP;
}

static PokegearAppMainState Pokegear_MainStep_RunMap(PokegearAppData *pokegearApp) {
    if (!PokegearApp_RunSubapp(&pokegearApp->childApplication)) {
        return POKEGEAR_APP_MAIN_STATE_RUN_MAP;
    }

    int outcome = pokegearApp->appReturnCode;
    pokegearApp->appReturnCode = 0;
    switch (outcome) {
    case GEAR_RETURN_MAP:
        pokegearApp->app = GEAR_APP_MAP;
        return POKEGEAR_APP_MAIN_STATE_LAUNCH_MAP;
    case GEAR_RETURN_CANCEL:
        pokegearApp->app = GEAR_APP_CANCEL;
        return POKEGEAR_APP_MAIN_STATE_LAUNCH_DEBUG;
    case GEAR_RETURN_CONFIGURE:
        pokegearApp->app = GEAR_APP_CONFIGURE;
        DoScheduledBgGpuUpdates(pokegearApp->bgConfig);
        return POKEGEAR_APP_MAIN_STATE_LAUNCH_CONFIGURE;
    case GEAR_RETURN_RADIO:
        pokegearApp->app = GEAR_APP_RADIO;
        DoScheduledBgGpuUpdates(pokegearApp->bgConfig);
        return POKEGEAR_APP_MAIN_STATE_LAUNCH_RADIO;
    case GEAR_RETURN_PHONE:
        pokegearApp->app = GEAR_APP_PHONE;
        DoScheduledBgGpuUpdates(pokegearApp->bgConfig);
        return POKEGEAR_APP_MAIN_STATE_LAUNCH_PHONE;
    default:
        return POKEGEAR_APP_MAIN_STATE_TEARDOWN;
    }
}

static PokegearAppMainState Pokegear_MainStep_LaunchDebug(PokegearAppData *pokegearApp) {
    static const OverlayManagerTemplate sOverlayTemplate_EasyChat = { EasyChat_Init, EasyChat_Main, EasyChat_Exit, FS_OVERLAY_ID(OVY_102) };

    if (!PokegearApp_UnloadGFX(pokegearApp)) {
        return POKEGEAR_APP_MAIN_STATE_LAUNCH_DEBUG;
    }

    pokegearApp->easyChatArgs = EasyChat_CreateArgs(0, 0, pokegearApp->args->saveData, pokegearApp->args->menuInputStatePtr, pokegearApp->heapID);
    pokegearApp->mapSessionState.word = EC_WORD_NULL;
    sub_02090D14(pokegearApp->easyChatArgs, pokegearApp->mapSessionState.word);
    pokegearApp->childApplication = OverlayManager_New(&sOverlayTemplate_EasyChat, pokegearApp->easyChatArgs, pokegearApp->heapID);
    return POKEGEAR_APP_MAIN_STATE_RUN_DEBUG;
}

static PokegearAppMainState Pokegear_MainStep_RunDebug(PokegearAppData *pokegearApp) {
    if (!PokegearApp_RunSubapp(&pokegearApp->childApplication)) {
        return POKEGEAR_APP_MAIN_STATE_RUN_DEBUG;
    }

    if (!sub_02090D48(pokegearApp->easyChatArgs)) {
        pokegearApp->mapSessionState.word = sub_02090D50(pokegearApp->easyChatArgs);
    }

    EasyChat_FreeArgs(pokegearApp->easyChatArgs);
    pokegearApp->unk_038 = 1;
    pokegearApp->app = GEAR_APP_CANCEL;
    return POKEGEAR_APP_MAIN_STATE_SETUP;
}

static PokegearAppMainState Pokegear_MainStep_LaunchConfigure(PokegearAppData *pokegearApp) {
    static const OverlayManagerTemplate sOverlayTemplate_GearConfigure = { PokegearConfigure_Init, PokegearConfigure_Main, PokegearConfigure_Exit, FS_OVERLAY_ID(pokegear_app) };
    pokegearApp->childApplication = OverlayManager_New(&sOverlayTemplate_GearConfigure, pokegearApp, pokegearApp->heapID);
    return POKEGEAR_APP_MAIN_STATE_RUN_CONFIGURE;
}

static PokegearAppMainState Pokegear_MainStep_RunConfigure(PokegearAppData *pokegearApp) {
    if (!PokegearApp_RunSubapp(&pokegearApp->childApplication)) {
        return POKEGEAR_APP_MAIN_STATE_RUN_CONFIGURE;
    }

    int outcome = pokegearApp->appReturnCode;
    pokegearApp->appReturnCode = 0;
    switch (outcome) {
    case 2:
        pokegearApp->app = GEAR_APP_MAP;
        DoScheduledBgGpuUpdates(pokegearApp->bgConfig);
        return POKEGEAR_APP_MAIN_STATE_LAUNCH_MAP;
    case 1:
        pokegearApp->app = GEAR_APP_RADIO;
        DoScheduledBgGpuUpdates(pokegearApp->bgConfig);
        return POKEGEAR_APP_MAIN_STATE_LAUNCH_RADIO;
    case 3:
        pokegearApp->app = GEAR_APP_PHONE;
        DoScheduledBgGpuUpdates(pokegearApp->bgConfig);
        return POKEGEAR_APP_MAIN_STATE_LAUNCH_PHONE;
    default:
        return POKEGEAR_APP_MAIN_STATE_TEARDOWN;
    }
}

static PokegearAppMainState Pokegear_MainStep_LaunchPhone(PokegearAppData *pokegearApp) {
    static const OverlayManagerTemplate sOverlayTemplate_GearPhone = { PokegearPhone_Init, PokegearPhone_Main, PokegearPhone_Exit, FS_OVERLAY_ID(pokegear_app) };
    pokegearApp->childApplication = OverlayManager_New(&sOverlayTemplate_GearPhone, pokegearApp, pokegearApp->heapID);
    return POKEGEAR_APP_MAIN_STATE_RUN_PHONE;
}

static PokegearAppMainState Pokegear_MainStep_RunPhone(PokegearAppData *pokegearApp) {
    if (!PokegearApp_RunSubapp(&pokegearApp->childApplication)) {
        return POKEGEAR_APP_MAIN_STATE_RUN_PHONE;
    }

    int outcome = pokegearApp->appReturnCode;
    pokegearApp->appReturnCode = 0;
    switch (outcome) {
    case 2:
        pokegearApp->app = GEAR_APP_MAP;
        DoScheduledBgGpuUpdates(pokegearApp->bgConfig);
        return POKEGEAR_APP_MAIN_STATE_LAUNCH_MAP;
    case 0:
        pokegearApp->app = GEAR_APP_CONFIGURE;
        DoScheduledBgGpuUpdates(pokegearApp->bgConfig);
        return POKEGEAR_APP_MAIN_STATE_LAUNCH_CONFIGURE;
    case 1:
        pokegearApp->app = GEAR_APP_RADIO;
        DoScheduledBgGpuUpdates(pokegearApp->bgConfig);
        return POKEGEAR_APP_MAIN_STATE_LAUNCH_RADIO;
    default:
        return POKEGEAR_APP_MAIN_STATE_TEARDOWN;
    }
}

static PokegearAppMainState Pokegear_MainStep_LaunchRadio(PokegearAppData *pokegearApp) {
    static const OverlayManagerTemplate sOverlayTemplate_GearRadio = { PokegearRadio_Init, PokegearRadio_Main, PokegearRadio_Exit, FS_OVERLAY_ID(pokegear_app) };
    pokegearApp->childApplication = OverlayManager_New(&sOverlayTemplate_GearRadio, pokegearApp, pokegearApp->heapID);
    return POKEGEAR_APP_MAIN_STATE_RUN_RADIO;
}

static PokegearAppMainState Pokegear_MainStep_RunRadio(PokegearAppData *pokegearApp) {
    if (!PokegearApp_RunSubapp(&pokegearApp->childApplication)) {
        return POKEGEAR_APP_MAIN_STATE_RUN_RADIO;
    }

    int outcome = pokegearApp->appReturnCode;
    pokegearApp->appReturnCode = 0;
    switch (outcome) {
    case 2:
        pokegearApp->app = GEAR_APP_MAP;
        DoScheduledBgGpuUpdates(pokegearApp->bgConfig);
        return POKEGEAR_APP_MAIN_STATE_LAUNCH_MAP;
    case 0:
        pokegearApp->app = GEAR_APP_CONFIGURE;
        DoScheduledBgGpuUpdates(pokegearApp->bgConfig);
        return POKEGEAR_APP_MAIN_STATE_LAUNCH_CONFIGURE;
    case 3:
        pokegearApp->app = GEAR_APP_PHONE;
        DoScheduledBgGpuUpdates(pokegearApp->bgConfig);
        return POKEGEAR_APP_MAIN_STATE_LAUNCH_PHONE;
    default:
        return POKEGEAR_APP_MAIN_STATE_TEARDOWN;
    }
}
