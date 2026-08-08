#include "field/fieldmap.h"

#include "global.h"

#include "constants/field/field_effect_renderer.h"
#include "constants/field/map_load.h"
#include "constants/init_script_types.h"
#include "constants/sndseq.h"

#include "field/area_data.h"
#include "field/dynamic_terrain_height.h"
#include "field/field_control.h"
#include "field/hblank_system.h"
#include "field/map_load_manager.h"
#include "field/map_prop_animation.h"
#include "field/model_attributes.h"
#include "field/overlay_01_021E66E4.h"
#include "field/overlay_01_021EABA8.h"
#include "field/overlay_01_021EAF00.h"
#include "field/overlay_01_021EAFD4.h"
#include "field/overlay_01_021FD1B8.h"
#include "field/overlay_01_02204004.h"
#include "field/signpost.h"
#include "overlay_2/overlay_02_02248728.h"

#include "bg_window.h"
#include "bug_contest.h"
#include "camera.h"
#include "dialog_box.h"
#include "dsprot.h"
#include "field_bgm.h"
#include "field_system.h"
#include "field_warp_tasks.h"
#include "gf_3d_render.h"
#include "gf_gfx_planes.h"
#include "map_events.h"
#include "map_header.h"
#include "map_matrix.h"
#include "map_object.h"
#include "math_util.h"
#include "obj_char_transfer.h"
#include "obj_pltt_transfer.h"
#include "overlay_01.h"
#include "overlay_01_021EA824.h"
#include "overlay_01_021EB1E8.h" // replace with field/weather_manager
#include "overlay_01_021F1348.h"
#include "overlay_01_021F6830.h"
#include "overlay_01_021F8D80.h"
#include "overlay_01_021F944C.h"
#include "overlay_01_021FB5D4.h"
#include "overlay_01_022053EC.h"
#include "player_avatar.h"
#include "poke_overlay.h"
#include "save_local_field_data.h"
#include "screen_fade.h"
#include "sound_02004A44.h"
#include "sys_flags.h"
#include "system.h"
#include "task.h"
#include "terrain_attributes.h"
#include "unk_0200B150.h"
#include "unk_02023694.h"
#include "unk_02026E30.h"
#include "unk_02055418.h"
#include "unk_02056D7C.h"
#include "unk_020648EC.h"
#include "vram_transfer_manager.h"

enum FieldMapInitState {
    FIELD_MAP_INIT_STATE_RESET = 0,
    FIELD_MAP_INIT_STATE_LOAD,
    FIELD_MAP_INIT_STATE_BOTTOM_SCREEN,
    FIELD_MAP_INIT_STATE_DONE
};

FS_EXTERN_OVERLAY(ds_protect);
FS_EXTERN_OVERLAY(OVY_2);
FS_EXTERN_OVERLAY(OVY_3);
FS_EXTERN_OVERLAY(OVY_4);

static BOOL FieldSystem_HasNoGymmick(FieldSystem *fieldSystem);
static BOOL FieldSystem_UpdateLocationToPlayerPosition(FieldSystem *fieldSystem);
static BOOL FieldMap_ChangeZone(FieldSystem *fieldSystem);
static void ov01_021E5FC0(FieldSystem *fieldSystem, u8 flag);
static void ov01_021E6028(void);
static void BgConfig_Init(BgConfig *bgConfig);
static void ov01_021E6138(BgConfig *bgConfig);
static void OamManager_Init(void);
static void Thunk_OamManager_Free(void);
static void ov01_021E61E0(void);
static void ov01_021E6214(void);
static void ov01_021E6220(FieldSystem *fieldSystem);
static void ov01_021E6364(FieldSystem *fieldSystem);
static void InitGraphicsAndManagers(FieldSystem *fieldSystem);
static void FieldSystem_InitMapLoadManager(FieldSystem *fieldSystem);
static void ov01_021E64A4(FieldSystem *fieldSystem);
static void ov01_021E6580(FieldSystem *fieldSystem);
static BOOL ov01_021E662C(void);
static MapObjectsToPreload *FetchMapObjectsToPreload(enum HeapID heapID, u16 modelBank);
static const int *MapObjectsToPreload_GetIDs(const MapObjectsToPreload *mapObjectsToPreload);
static int MapObjectsToPreload_GetCount(const MapObjectsToPreload *mapObjectsToPreload);
static void MapObjectsToPreload_Free(MapObjectsToPreload *mapObjectsToPreload);
static GFIntrCB ov01_021E66A8(void);
static GFIntrCB ov01_021E66B8(void);
static GFIntrCB ov01_021E66C8(void);
static void ov01_021E66D8(void);
static void ov01_021E66DC(void);
static void ov01_021E66E0(void);

static void FieldMap_VBlankCallback(void *fsys) {
    FieldSystem *fieldSystem = fsys;
    DoScheduledBgGpuUpdates(fieldSystem->bgConfig);
    GF_RunVramTransferTasks();
    OamManager_ApplyAndResetBuffers();

    sub_02023910(ov01_021FA1D0(sub_0205F1A0(fieldSystem->mapObjectManager)));
}

BOOL FieldMap_Init(OverlayManager *man, int *state) {
    u32 offset = 0xDCE6A1;
    BOOL ret = FALSE;
    FieldSystem *fieldSystem = OverlayManager_GetArgs(man);

    switch (*state) {
    case FIELD_MAP_INIT_STATE_RESET:
        FS_LoadOverlay(MI_PROCESSOR_ARM9, FS_OVERLAY_ID(ds_protect));

        Main_SetVBlankIntrCB(NULL, NULL);
        HBlankInterruptDisable();

        G2_BlendNone();
        G2S_BlendNone();

        offset += (0x4CF * DSProt_DetectDummy(&ov01_021E66A8));

        ResetVisibleHardwareWindows(PM_LCD_TOP);
        ResetVisibleHardwareWindows(PM_LCD_BOTTOM);
        ov01_021E6364(fieldSystem);

        offset += (0x6B * (DSProt_DetectNotEmulator(&ov01_021E66D8) == FALSE));

        FieldMapChange_Set3DDisplay(fieldSystem);
        fieldSystem->unk11C = 8;

        if (fieldSystem->mapLoadMode->loadExtOverlay) {
            HandleLoadOverlay(FS_OVERLAY_ID(OVY_2), OVY_LOAD_ASYNC);

            switch (FieldSystem_HasNoGymmick(fieldSystem)) { // Do we really want to continue calling this 'Gymmick'?
            case FALSE:
                HandleLoadOverlay(FS_OVERLAY_ID(OVY_4), OVY_LOAD_ASYNC);
                break;
            case TRUE:
                HandleLoadOverlay(FS_OVERLAY_ID(OVY_3), OVY_LOAD_ASYNC);
                break;
            default: // Unreachable, but required for matching. Used to load Distortion World in Platinum.
                HandleLoadOverlay(FS_OVERLAY_ID(OVY_3), OVY_LOAD_ASYNC);
                break;
            }
        }

        offset += DSProt_DetectFlashcart(&ov01_021E66B8) * 0x3A1;

        Heap_Create(HEAP_ID_3, HEAP_ID_FIELD1, fieldSystem->mapLoadMode->unk_4);
        GF_ASSERT(fieldSystem->unk4 == NULL);

        FS_UnloadOverlay(MI_PROCESSOR_ARM9, FS_OVERLAY_ID(ds_protect));

        fieldSystem->unk4 = Heap_Alloc(HEAP_ID_FIELD1, sizeof(FieldSystemUnkSub4));
        MI_CpuFill8(fieldSystem->unk4, 0, sizeof(FieldSystemUnkSub4));
        fieldSystem->unk4->field3dObjectTaskManager = Field3dObjectTaskManager_Create(fieldSystem, HEAP_ID_FIELD1, 8);

        if (offset % 3433 != 0) {
            SysTask_CreateOnMainQueue(Task_AntipiracyRandom, NULL, 123);
        }

        ov01_021E6028();

        GF_CreateVramTransferManager(128, HEAP_ID_FIELD1);
        BillboardLists_Create(4, HEAP_ID_FIELD1);
        GF3dRender_InitSimpleManager(HEAP_ID_FIELD1);

        ov01_021E61E0();
        OamManager_Init();

        GfGfx_SwapDisplay();
        fieldSystem->bgConfig = BgConfig_Alloc(HEAP_ID_FIELD1);
        BgConfig_Init(fieldSystem->bgConfig);
        FieldMessage_LoadTextPalettes(GF_PAL_LOCATION_MAIN_BG, TRUE);
        TryStartMapScriptByType(fieldSystem, INIT_SCRIPT_ON_LOAD);

        if (offset % 4217 != 0) {
            SysTask_CreateOnMainQueue(Task_AntipiracyRandom, NULL, 789);
        }

        fieldSystem->unk120 = ov02_0224F864(HEAP_ID_FIELD1);
        break;
    case FIELD_MAP_INIT_STATE_LOAD:
        InitGraphicsAndManagers(fieldSystem);
        AreaDataManager_Load(fieldSystem->areaDataManager, fieldSystem->unkC0, fieldSystem->mapPropAnimationManager, fieldSystem->unkCC, fieldSystem->unk104);

        fieldSystem->mapPropManager = MapPropManager_New(HEAP_ID_FIELD1, fieldSystem->unkC0);

        FieldSystem_InitMapLoadManager(fieldSystem);
        ov01_021E64A4(fieldSystem);
        ov01_021E6580(fieldSystem);

        WeatherManager_SetWeather(fieldSystem->unk4->weatherManager, LocalFieldData_GetWeatherType(Save_LocalFieldData_Get(fieldSystem->saveData)));

        if (FieldBGM_PlayEffectiveForMapHeader(fieldSystem, fieldSystem->location->mapId) || fieldSystem->environmentSoundState == ENVIRONMENT_SOUND_NONE_UNK2) {
            FieldSystem_ProcessSoundplate(fieldSystem, FALSE);
        }

        TryStartMapScriptByType(fieldSystem, INIT_SCRIPT_ON_RESUME);

        fieldSystem->unk4->hBlankSystem = HBlankSystem_New(HEAP_ID_FIELD1);
        HBlankSystem_Start(fieldSystem->unk4->hBlankSystem);
        fieldSystem->unk4->unk20 = ov01_021FB5D4(HEAP_ID_FIELD1, fieldSystem->unk4->hBlankSystem);
        break;
    case FIELD_MAP_INIT_STATE_BOTTOM_SCREEN:
        FieldSystem_InitBottomScreen(fieldSystem);
        break;
    case FIELD_MAP_INIT_STATE_DONE:
        if (FieldSystem_IsBottomScreenRunningDummy(fieldSystem)) {
            ret = TRUE;
            fieldSystem->runningFieldMap = TRUE;
        }
        if (ov01_021E662C() == FALSE) {
            SysTask_CreateOnMainQueue(Task_AntipiracyMath, NULL, 1000);
            SysTask_CreateOnMainQueue(Task_AntipiracyMath, NULL, 1400);
        }
        break;
    }
    (*state)++;
    return ret;
}

BOOL FieldMap_Main(OverlayManager *man, int *state) {
    FieldSystem *fieldSystem = OverlayManager_GetArgs(man);

    if (FieldSystem_UpdateLocationToPlayerPosition(fieldSystem)) {
        ov01_021F6830(fieldSystem, 1, 1);
        FieldMap_ChangeZone(fieldSystem);
    }

    ov01_021E5FC0(fieldSystem, fieldSystem->unkBC);

    if (fieldSystem->runningFieldMap) {
        return FALSE;
    }
    return TRUE;
}

BOOL FieldMap_Exit(OverlayManager *man, int *state) {
    FieldSystem *fieldSystem;
    int offset = 0x2AAACF;
    fieldSystem = OverlayManager_GetArgs(man);
    MapLoadManager_Tick(fieldSystem->mapLoadManager);

    switch (*state) {
    case 0:
        FS_LoadOverlay(MI_PROCESSOR_ARM9, FS_OVERLAY_ID(ds_protect));

        Gymmick_Free(fieldSystem);

        offset += 0x23B * DSProt_DetectDummy(&ov01_021E66C8);

        MapLoadManager_ForgetTrackedTarget(fieldSystem->mapLoadManager);

        fieldSystem->location->x = PlayerAvatar_GetXCoord(fieldSystem->playerAvatar);
        fieldSystem->location->y = PlayerAvatar_GetZCoord(fieldSystem->playerAvatar);
        fieldSystem->location->direction = PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar);

        DynamicTerrainHeightManager_Free(fieldSystem->dynamicTerrainHeightManager);

        GF_ASSERT(fieldSystem->mapPropAnimationManager != NULL);
        MapLoadManager_End(fieldSystem->mapLoadManager);

        offset += 0x18D * (DSProt_DetectNotFlashcart(&ov01_021E66DC) == FALSE);

        MapPropAnimationManager_UnloadAllAnimations(fieldSystem->mapPropAnimationManager);
        MapPropAnimationManager_Free(fieldSystem->mapPropAnimationManager);
        ov01_021E8DD4(&fieldSystem->mapPropOneShotAnimationManager);
        ov01_02204764(fieldSystem->unk104);
        ov01_02204634(fieldSystem->unkCC);
        ov01_02204278(fieldSystem->unkC8);

        BOOL notEmulator = DSProt_DetectNotEmulator(&ov01_021E66E0) == FALSE;
        u32 unkVal = notEmulator * 0x8B + offset;

        FieldTextureManager_FreeAllSlots(fieldSystem->unk4->textureManager);

        FS_UnloadOverlay(MI_PROCESSOR_ARM9, FS_OVERLAY_ID(ds_protect));

        FieldTextureManager_Destroy(fieldSystem->unk4->textureManager);

        fieldSystem->unk4->textureManager = NULL;

        if (unkVal % 2221 != 0) {
            SysTask_CreateOnMainQueue(Task_AntipiracyRandom, NULL, 7845);
        }

        sub_0205E4C8(fieldSystem->mapObjectManager);
        ov01_021F9250(fieldSystem->mapObjectManager);

        sub_0205F55C(fieldSystem->mapObjectManager);
        FieldEffectManager_Free(fieldSystem->fieldEffectManager);

        ov01_02205424(fieldSystem);
        MapObjectsToPreload_Free(fieldSystem->mapObjectsToPreload);
        fieldSystem->mapObjectsToPreload = NULL;

        if (unkVal % 1259 != 0) {
            SysTask_CreateOnMainQueue(Task_AntipiracyRandom, NULL, 1245);
        }

        ov01_021F3660(fieldSystem->mapPropManager);
        (*state)++;
        break;
    case 1:
        if (MapLoadManager_HasEnded(fieldSystem->mapLoadManager) == TRUE) {
            ov01_02204084(fieldSystem->unkC0);
            AreaDataManager_Free(&fieldSystem->areaDataManager);
            MapLoadManager_FreeNARCAndLoadedMapBuffers(fieldSystem->mapLoadManager);
            FieldCamera_Delete(fieldSystem);
            AreaLightManager_Free(&fieldSystem->areaLightManager);
            Signpost_Free(fieldSystem->signpost);
            FieldDrawMapNameInfo_Destroy(fieldSystem->unk4->drawMapNameInfo);
            WeatherManager_Delete(fieldSystem->unk4->weatherManager);
            ov01_021FB610(fieldSystem->unk4->unk20);
            HBlankSystem_Delete(fieldSystem->unk4->hBlankSystem);
            sub_020556A8(fieldSystem->unk4->unk18);
            Fog_Free(&fieldSystem->fog);
            ModelAttributes_Free(&fieldSystem->modelAttributes);
            Thunk_OamManager_Free();
            ov02_0224F8F4(fieldSystem->unk120);
            ov01_021E6138(fieldSystem->bgConfig);
            FieldSystem_EndBottomScreen(fieldSystem);
            (*state)++;
        }
        break;
    case 2:
        if (FieldSystem_IsBottomScreenDone(fieldSystem)) {
            ov01_021E6214();
            BillboardLists_Delete();
            GF_DestroyVramTransferManager();
            GF3dRender_DeleteSimpleManager();
            Field3dObjectTaskManager_Delete(fieldSystem->unk4->field3dObjectTaskManager);
            Main_SetVBlankIntrCB(NULL, NULL);
            Heap_Free(fieldSystem->bgConfig);
            Heap_Free(fieldSystem->unk4);

            fieldSystem->unk4 = NULL;

            Heap_Destroy(HEAP_ID_FIELD1);

            if (fieldSystem->mapLoadMode->loadExtOverlay) {
                UnloadOverlayByID(FS_OVERLAY_ID(OVY_2));
                UnloadOverlayByID(FS_OVERLAY_ID(OVY_4));
                UnloadOverlayByID(FS_OVERLAY_ID(OVY_3));
            }

            sub_02005D00();
            return TRUE;
        }
        break;
    }
    return FALSE;
}

static BOOL FieldSystem_HasNoGymmick(FieldSystem *fieldSystem) {
    return Save_Gymmick_GetType(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem))) == GYMMICK_NONE;
}

static BOOL FieldSystem_UpdateLocationToPlayerPosition(FieldSystem *fieldSystem) {
    int avatarX = PlayerAvatar_GetXCoord(fieldSystem->playerAvatar);
    int avatarZ = PlayerAvatar_GetZCoord(fieldSystem->playerAvatar);

    Location *currentLocation = fieldSystem->location;
    if (avatarX != currentLocation->x || avatarZ != currentLocation->y) {
        currentLocation->x = avatarX;
        fieldSystem->location->y = avatarZ;
        return TRUE;
    }
    return FALSE;
}

static BOOL FieldMap_ChangeZone(FieldSystem *fieldSystem) {
    int headerX = (int)PlayerAvatar_GetXCoord(fieldSystem->playerAvatar) / MAP_TILES_COUNT_X;
    int headerZ = (int)PlayerAvatar_GetZCoord(fieldSystem->playerAvatar) / MAP_TILES_COUNT_Z;

    int newMapID = MapMatrix_GetMapHeader(fieldSystem->mapMatrix, headerX, headerZ);
    int oldMapID = fieldSystem->location->mapId;
    if (newMapID == oldMapID) {
        return FALSE;
    }

    LocalFieldData *localFieldData = Save_LocalFieldData_Get(fieldSystem->saveData);

    fieldSystem->location->mapId = newMapID;

    Field_InitMapEvents(fieldSystem, newMapID);
    sub_02053038(fieldSystem, TRUE);

    sub_0205E104(fieldSystem->mapObjectManager, oldMapID, newMapID, Field_GetNumObjectEvents(fieldSystem), (ObjectEvent *)Field_GetObjectEvents(fieldSystem));

    FieldBGM_TryFadeOut(fieldSystem, FieldBGM_GetEffective(fieldSystem, fieldSystem->location->mapId), 1);
    Field_InitMapObjectsFromZoneEventData(fieldSystem);
    WeatherManager_ChangeWeather(fieldSystem->unk4->weatherManager, LocalFieldData_GetWeatherType(localFieldData));

    if (MapHeader_GetMapSec(oldMapID) != MapHeader_GetMapSec(newMapID)) {
        FieldSystem_DrawMapNameAnimation(fieldSystem);
    }
    return TRUE;
}

static void ov01_021E5FC0(FieldSystem *fieldSystem, u8 flag) {
    if (FieldSystem_TaskIsRunning(fieldSystem) == FALSE) {
        FieldSystem_StartBugContestTimer(fieldSystem);
    }

    AreaLightManager_UpdateActiveTemplate(fieldSystem->areaLightManager);
    ov01_022047DC(fieldSystem->unk104);
    ov01_021EAD8C(fieldSystem->unk28);
    Signpost_DoCurrentCommand(fieldSystem);

    if (flag & (1 << 0)) {
        FieldTextureManager_Free(fieldSystem->unk4->textureManager);
    }
    if (flag & (1 << 3)) {
        ov01_02204350(fieldSystem->unkC8);
    }
    if (flag & (1 << 1)) {
        MapLoadManager_Tick(fieldSystem->mapLoadManager);
    }
    if (flag & (1 << 2)) {
        ov01_021E6220(fieldSystem);
    }
}

static void ov01_021E6028(void) {
    GraphicsBanks banks = {
        .bg = GX_VRAM_BG_128_C,
        .bgextpltt = GX_VRAM_BGEXTPLTT_NONE,
        .subbg = GX_VRAM_SUB_BG_32_H,
        .subbgextpltt = GX_VRAM_SUB_BGEXTPLTT_NONE,
        .obj = GX_VRAM_OBJ_32_FG,
        .objextpltt = GX_VRAM_OBJEXTPLTT_NONE,
        .subobj = GX_VRAM_SUB_OBJ_16_I,
        .subobjextpltt = GX_VRAM_SUB_OBJEXTPLTT_NONE,
        .tex = GX_VRAM_TEX_01_AB,
        .texpltt = GX_VRAM_TEXPLTT_0123_E
    };
    GfGfx_SetBanks(&banks);
}

void Thunk_BgConfig_Init(BgConfig *bgConfig) {
    BgConfig_Init(bgConfig);
}

void Thunk_ov01_021E6138(BgConfig *bgConfig) {
    ov01_021E6138(bgConfig);
}

static const BgTemplate sBgTemplate_1 = {
    .x = 0,
    .y = 0,
    .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
    .baseTile = 0,
    .size = GF_BG_SCR_SIZE_256x256,
    .colorMode = GX_BG_COLORMODE_16,
    .screenBase = GX_BG_SCRBASE_0x0000,
    .charBase = GX_BG_CHARBASE_0x10000,
    .bgExtPltt = GX_BG_EXTPLTT_01,
    .priority = 3,
    .areaOver = GX_BG_AREAOVER_XLU,
    .mosaic = FALSE
};

static const BgTemplate sBgTemplate_3 = {
    .x = 0,
    .y = 0,
    .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
    .baseTile = 0,
    .size = GF_BG_SCR_SIZE_256x256,
    .colorMode = GX_BG_COLORMODE_16,
    .screenBase = GX_BG_SCRBASE_0x1000,
    .charBase = GX_BG_CHARBASE_0x08000,
    .bgExtPltt = GX_BG_EXTPLTT_23,
    .priority = 0,
    .areaOver = GX_BG_AREAOVER_XLU,
    .mosaic = FALSE
};

static const BgTemplate sBgTemplate_2 = {
    .x = 0,
    .y = 0,
    .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
    .baseTile = 0,
    .size = GF_BG_SCR_SIZE_256x256,
    .colorMode = GX_BG_COLORMODE_16,
    .screenBase = GX_BG_SCRBASE_0x0800,
    .charBase = GX_BG_CHARBASE_0x14000,
    .bgExtPltt = GX_BG_EXTPLTT_23,
    .priority = 3,
    .areaOver = GX_BG_AREAOVER_XLU,
    .mosaic = FALSE
};

static void BgConfig_Init(BgConfig *bgConfig) {
    GraphicsModes graphicsModes = {
        .dispMode = GX_DISPMODE_GRAPHICS,
        .bgMode = GX_BGMODE_0,
        .subMode = GX_BGMODE_0,
        ._2d3dMode = GX_BG0_AS_3D
    };
    SetBothScreensModesAndDisable(&graphicsModes);

    BgTemplate bgTemplate_1 = sBgTemplate_1;
    InitBgFromTemplate(bgConfig, 1, &bgTemplate_1, 0);
    BG_ClearCharDataRange(1, 32, 0, HEAP_ID_FIELD1);
    BgClearTilemapBufferAndCommit(bgConfig, 1);

    BgTemplate bgTemplate_2 = sBgTemplate_2;
    InitBgFromTemplate(bgConfig, 2, &bgTemplate_2, 0);
    BG_ClearCharDataRange(2, 32, 0, HEAP_ID_FIELD1);
    BgClearTilemapBufferAndCommit(bgConfig, 2);

    BgTemplate bgTemplate_3 = sBgTemplate_3;
    InitBgFromTemplate(bgConfig, 3, &bgTemplate_3, 0);
    BG_ClearCharDataRange(3, 32, 0, HEAP_ID_FIELD1);
    BgClearTilemapBufferAndCommit(bgConfig, 3);

    u16 val = 0;
    DC_FlushRange(NULL, 2);
    GX_LoadBGPltt(&val, 0, 2);
}

static void ov01_021E6138(BgConfig *bgConfig) {
    GfGfx_EngineATogglePlanes(1 << 0, FALSE);
    GfGfx_EngineATogglePlanes(1 << 1, FALSE);
    GfGfx_EngineATogglePlanes(1 << 2, FALSE);
    GfGfx_EngineATogglePlanes(1 << 3, FALSE);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_3);
}

static void OamManager_Init(void) {
    NNS_G2dInitOamManagerModule();
    OamManager_Create(0, 0x7C, 0, 0x1f, 0, 0x7C, 0, 0x1F, HEAP_ID_FIELD1);
}

static void Thunk_OamManager_Free(void) {
    OamManager_Free();
}

static void FieldMap_InitModelAttributes(ModelAttributes *modelAttributes) {
    ModelAttributes_SetPolygonMode(modelAttributes, GX_POLYGONMODE_MODULATE, FALSE);
    ModelAttributes_SetCullMode(modelAttributes, GX_CULL_BACK, FALSE);
    ModelAttributes_SetAlpha(modelAttributes, 31, FALSE);
    ModelAttributes_SetMiscAttrEnabled(modelAttributes, 0x8000, TRUE, FALSE); // GX_POLYGON_ATTR_MISC_FOG
    ModelAttributes_ApplyGlobal(modelAttributes, 0x400000);                   // MODEL_ATTRIBUTES_LAST_BIT
}

static void ov01_021E61E0(void) {
    ObjCharTransferTemplate template = {
        .maxTasks = 20,
        .sizeMain = 0x8000,
        .sizeSub = 0x4000,
        .heapID = HEAP_ID_FIELD1
    };

    ObjCharTransfer_InitEx(&template, GX_OBJVRAMMODE_CHAR_1D_32K, GX_OBJVRAMMODE_CHAR_1D_32K);

    ObjPlttTransfer_Init(20, HEAP_ID_FIELD1);
    ObjCharTransfer_ClearBuffers();
    ObjPlttTransfer_Reset();
}

static void ov01_021E6214(void) {
    ObjCharTransfer_Destroy();
    ObjPlttTransfer_Destroy();
}

static void ov01_021E6220(FieldSystem *fieldSystem) {
    CameraAngle camAngle;

    Thunk_G3X_Reset();

    Camera_PushLookAtToNNSGlb();

    MapLoadManager_RenderLoadedMaps(fieldSystem->mapLoadManager, fieldSystem->modelAttributes);

    ov01_021F3C9C(fieldSystem->mapPropManager, fieldSystem->areaDataManager);

    camAngle = Camera_GetAngle(fieldSystem->camera);
    fx64 temp_ret = (fieldSystem->unk11C << FX32_SHIFT) * (fx64)(FX_CosIdx((u16)(-camAngle.x)));
    fx64 temp_r2_2 = temp_ret + 0x800;
    fx64 temp_r2_3 = temp_r2_2 >> FX32_SHIFT;
    MtxFx44 v0 = NNS_G3dGlb.projMtx;
    MtxFx44 v1 = v0;
    fx64 temp_ret_2 = v1._22 * (fx64)((fx32)temp_r2_3);
    fx64 temp_r3 = temp_ret_2 + 0x800;
    v1._32 += temp_r3 >> FX32_SHIFT;

    // Resembles NNS_G3dGlbSetProjectionMtx(), except this has no NNS_G3D_NULL_ASSERT func,
    // So static below is either a diff func or that one is incorrect?
    MIi_CpuCopyFast((u32 *)&v1, (u32 *)&NNS_G3dGlb.projMtx, sizeof(MtxFx44));
    NNS_G3dGlb.flag &= ~(NNS_G3D_GLB_FLAG_INVPROJ_UPTODATE | NNS_G3D_GLB_FLAG_INVCAMERAPROJ_UPTODATE);
    NNS_G3dGlbFlushP();

    FieldEffectManager_Render(fieldSystem->fieldEffectManager);
    BillboardLists_Draw();

    // Same here.
    MIi_CpuCopyFast((u32 *)&v0, (u32 *)&NNS_G3dGlb.projMtx, sizeof(MtxFx44));
    NNS_G3dGlb.flag &= ~(NNS_G3D_GLB_FLAG_INVPROJ_UPTODATE | NNS_G3D_GLB_FLAG_INVCAMERAPROJ_UPTODATE);
    NNS_G3dGlbFlushP();

    Field3dObjectTaskManager_RunDrawTasks(fieldSystem->unk4->field3dObjectTaskManager);
    RequestSwap3DBuffers(GX_SORTMODE_AUTO, gG3dDepthBufferingMode);
}

void ov01_021E631C(FieldSystem *fieldSystem, BOOL setFlag) {
    if (setFlag == TRUE) {
        fieldSystem->unkBC |= (1 << 2);
    } else {
        fieldSystem->unkBC &= ~(1 << 2);
    }
}

void ov01_021E6340(FieldSystem *fieldSystem, BOOL setFlag) {
    if (setFlag == TRUE) {
        fieldSystem->unkBC |= (1 << 0);
    } else {
        fieldSystem->unkBC &= ~(1 << 0);
    }
}

static void ov01_021E6364(FieldSystem *fieldSystem) {
    fieldSystem->unkBC = ((1 << 3) | (1 << 0) | (1 << 1) | (1 << 2));
}

void FieldMap_FadeScreen(const u8 fadeType) {
    if (fadeType == FADE_TYPE_BRIGHTNESS_IN) {
        BeginNormalPaletteFade(FADE_BOTH_SCREENS, FADE_TYPE_BRIGHTNESS_IN, FADE_TYPE_BRIGHTNESS_IN, RGB_BLACK, 6, 1, HEAP_ID_FIELD1);
    } else if (fadeType == FADE_TYPE_BRIGHTNESS_OUT) {
        BeginNormalPaletteFade(FADE_BOTH_SCREENS, FADE_TYPE_BRIGHTNESS_OUT, FADE_TYPE_BRIGHTNESS_OUT, RGB_BLACK, 6, 1, HEAP_ID_FIELD1);
    } else {
        GF_ASSERT(FALSE);
    }
}

static void InitGraphicsAndManagers(FieldSystem *fieldSystem) {
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, FALSE);
    G3_SwapBuffers(GX_SORTMODE_AUTO, gG3dDepthBufferingMode);

    fieldSystem->areaDataManager = AreaDataManager_Alloc(MapHeader_GetAreaDataBank(fieldSystem->location->mapId));
    fieldSystem->unkC0 = ov01_02204004(HEAP_ID_FIELD1, 550, 128, AreaDataManager_GetMapPropModelFile(fieldSystem->areaDataManager));

    u16 moveModelBank = MapHeader_GetMoveModelBank(fieldSystem->location->mapId);

    GF_ASSERT(fieldSystem->mapObjectsToPreload == NULL);
    fieldSystem->mapObjectsToPreload = FetchMapObjectsToPreload(HEAP_ID_FIELD1, moveModelBank);

    fieldSystem->unkC8 = ov01_022041C4(HEAP_ID_FIELD1);
    fieldSystem->unkCC = ov01_0220460C(fieldSystem->unkC8);
    fieldSystem->unk104 = ov01_02204744(HEAP_ID_FIELD1);
    fieldSystem->mapPropAnimationManager = MapPropAnimationManager_Init(ov01_021FB904(fieldSystem->areaDataManager), fieldSystem->unkC8);
    fieldSystem->mapPropOneShotAnimationManager = ov01_021E8DB4();
}

static void FieldSystem_InitMapLoadManager(FieldSystem *fieldSystem) {
    fieldSystem->mapLoadManager = MapLoadManager_New(fieldSystem->mapMatrix, fieldSystem->areaDataManager, fieldSystem->unkC0, fieldSystem->mapPropAnimationManager, fieldSystem->unkCC, fieldSystem->skipMapAttributes, fieldSystem->saveData);
    fieldSystem->dynamicTerrainHeightManager = DynamicTerrainHeightManager_New(8, HEAP_ID_FIELD1);
    MapLoadManager_InitialLoad(fieldSystem->mapLoadManager, fieldSystem->location->x, fieldSystem->location->y);
}

extern int defaultFieldEffectRenderers[]; /* = {
    FIELD_EFFECT_RENDERER_20,
    FIELD_EFFECT_RENDERER_19,
    FIELD_EFFECT_RENDERER_17,
    FIELD_EFFECT_RENDERER_1,
    FIELD_EFFECT_RENDERER_16,
    FIELD_EFFECT_RENDERER_5,
    FIELD_EFFECT_RENDERER_22,
    FIELD_EFFECT_RENDERER_8,
    FIELD_EFFECT_RENDERER_9,
    FIELD_EFFECT_RENDERER_10,
    FIELD_EFFECT_RENDERER_11,
    FIELD_EFFECT_RENDERER_12,
    FIELD_EFFECT_RENDERER_13,
    FIELD_EFFECT_RENDERER_15,
    FIELD_EFFECT_RENDERER_18,
    FIELD_EFFECT_RENDERER_0,
    FIELD_EFFECT_RENDERER_2,
    FIELD_EFFECT_RENDERER_3,
    FIELD_EFFECT_RENDERER_4,
    FIELD_EFFECT_RENDERER_14,
    FIELD_EFFECT_RENDERER_6,
    FIELD_EFFECT_RENDERER_7,
    FIELD_EFFECT_RENDERER_21,
    FIELD_EFFECT_RENDERER_INVALID
};*/

static void ov01_021E64A4(FieldSystem *fieldSystem) {
    fieldSystem->fieldEffectManager = FieldEffectManager_New(fieldSystem, FIELD_EFFECT_RENDERER_COUNT, HEAP_ID_FIELD1);

    FieldEffectManager_InitAnimManagerList(fieldSystem->fieldEffectManager, 80);

    ov01_021F1390(fieldSystem->fieldEffectManager, HEAP_ID_FIELD1, 32, 32, 32, 32, 0x500 * (32 / 2), 0x80 * (32 / 2), 0x800 * 32);

    fieldSystem->unk4->unk18 = sub_02055680(fieldSystem, HEAP_ID_FIELD1);
    if (fieldSystem->mapLoadType == MAP_LOAD_TYPE_UNION) {
        MapObjectManager_SetEndMovement(fieldSystem->mapObjectManager, FALSE);
    }

    FieldEffectManager_InitRenderers(fieldSystem->fieldEffectManager, defaultFieldEffectRenderers);

    int v0 = 10;
    if (fieldSystem->mapLoadType == MAP_LOAD_TYPE_UNION) {
        v0 = 5;
    }

    ov01_021F91F8(fieldSystem->mapObjectManager, 32, MapObjectsToPreload_GetCount(fieldSystem->mapObjectsToPreload) + 3, MapObjectsToPreload_GetIDs(fieldSystem->mapObjectsToPreload), v0);
    ov01_022057DC(fieldSystem->mapObjectManager);
    FieldEffect_InitRenderObject(fieldSystem->fieldEffectManager);
    PlayerAvatar_InitMapFeatures(fieldSystem->playerAvatar);

    if (fieldSystem->unkAC != 0) {
        sub_0205E580(fieldSystem->mapObjectManager);
    } else {
        sub_0205E520(fieldSystem->mapObjectManager);
        ov01_022059AC(fieldSystem);
    }

    CommPlayerManager_ForcePosition();

    if (fieldSystem->unkAC != 0) {
        MapObjectManager_ClearFlagsBits(fieldSystem->mapObjectManager, MAPOBJECTFLAG_SINGLE_MOVEMENT);
    } else {
        sub_0205F568(fieldSystem->mapObjectManager);
    }

    MapLoadManager_TrackTarget(PlayerAvatar_GetPositionVector(fieldSystem->playerAvatar), fieldSystem->mapLoadManager);
}

static void ov01_021E6580(FieldSystem *fieldSystem) {
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, 1);
    GfGfx_BothDispOn();
    fieldSystem->modelAttributes = ModelAttributes_Init();
    FieldMap_InitModelAttributes(fieldSystem->modelAttributes);
    fieldSystem->fog = Fog_New();

    int cameraType = LocalFieldData_GetCameraType(Save_LocalFieldData_Get(fieldSystem->saveData));
    FieldCamera_Create(PlayerAvatar_GetPositionVector(fieldSystem->playerAvatar), fieldSystem, cameraType, TRUE);

    u32 lightArchiveID = AreaDataManager_GetAreaLightArchiveID(fieldSystem->areaDataManager);
    if (lightArchiveID == 3 && CheckFlag96A(Save_VarsFlags_Get(fieldSystem->saveData))) {
        lightArchiveID = 4;
    }

    fieldSystem->areaLightManager = AreaLightManager_New(fieldSystem->modelAttributes, lightArchiveID);
    fieldSystem->unk4->weatherManager = WeatherManager_New(fieldSystem);
    fieldSystem->unk4->drawMapNameInfo = FieldDrawMapNameInfo_Create(fieldSystem->bgConfig);
    fieldSystem->signpost = Signpost_Init(HEAP_ID_FIELD1);
    fieldSystem->unk4->textureManager = FieldTextureManager_Init();

    FieldTextureManager_LoadTexture(fieldSystem->unk4->textureManager, AreaDataManager_GetMapTexture(fieldSystem->areaDataManager));
    Gymmick_Init(fieldSystem);
    Main_SetVBlankIntrCB(FieldMap_VBlankCallback, fieldSystem);
}

static BOOL ov01_021E662C(void) {
    CARD_SpiWaitGetStatus();
    return CARD_SpiWaitGetStatus() == 170;
}

static MapObjectsToPreload *FetchMapObjectsToPreload(enum HeapID heapID, u16 modelBank) {
    int i;
    MapObjectsToPreload *result = Heap_Alloc(heapID, sizeof(MapObjectsToPreload));
    u16 *mapObjectsToPreload = AllocAtEndAndReadWholeNarcMemberByIdPair(NARC_a_0_9_2, modelBank, heapID);

    for (i = 0; i < MAX_MAP_OBJECTS_TO_PRELOAD; i++) {
        result->ids[i] = MAP_OBJECT_PRELOAD_SENTINEL;
    }

    for (i = 0; i < MAX_MAP_OBJECTS_TO_PRELOAD; i++) {
        result->ids[i] = mapObjectsToPreload[i];
        if (mapObjectsToPreload[i] == MAP_OBJECT_PRELOAD_SENTINEL) {
            break;
        }
    }
    result->count = i;
    Heap_Free(mapObjectsToPreload);
    return result;
}

static const int *MapObjectsToPreload_GetIDs(const MapObjectsToPreload *mapObjectsToPreload) {
    return mapObjectsToPreload->ids;
}

static int MapObjectsToPreload_GetCount(const MapObjectsToPreload *mapObjectsToPreload) {
    return mapObjectsToPreload->count;
}

static void MapObjectsToPreload_Free(MapObjectsToPreload *mapObjectsToPreload) {
    Heap_Free(mapObjectsToPreload);
}

static GFIntrCB ov01_021E66A8(void) {
    return Heap_AllocAtEnd(HEAP_ID_3, 1000);
}

static GFIntrCB ov01_021E66B8(void) {
    return Heap_AllocAtEnd(HEAP_ID_3, 1000);
}

static GFIntrCB ov01_021E66C8(void) {
    return Heap_AllocAtEnd(HEAP_ID_3, 1000);
}

static void ov01_021E66D8(void) {
}

static void ov01_021E66DC(void) {
}

static void ov01_021E66E0(void) {
}
