#include "field/fieldmap.h"
#include "field/field_control.h"
#include "field/overlay_01_021E66E4.h"
#include "field/overlay_01_02204004.h"
#include "overlay_01.h"
#include "overlay_01_021EA824.h"
#include "overlay_01_021F4704.h"
#include "overlay_01_021F6830.h"
#include "overlay_01_021F944C.h"
#include "overlay_01_021FB4C0.h"

#include "dsprot.h"
#include "global.h"
#include "system.h"

#include "bg_window.h"
#include "bug_contest.h"
#include "camera.h"
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
#include "player_avatar.h"
#include "save_local_field_data.h"
#include "sound_02004A44.h"
#include "sys_flags.h"
#include "task.h"
#include "unk_0200B150.h"
#include "unk_0200FA24.h"
#include "unk_02023694.h"
#include "unk_02055418.h"
#include "unk_020648EC.h"
#include "unk_02026E30.h"
#include "vram_transfer_manager.h"

FS_EXTERN_OVERLAY(ds_protect);
FS_EXTERN_OVERLAY(OVY_2);
FS_EXTERN_OVERLAY(OVY_3);
FS_EXTERN_OVERLAY(OVY_4);

// TODO: Make static
static void fieldmap(void *param0);
static BOOL FieldSystem_HasNoGymmick(FieldSystem *fieldSystem);
static BOOL FieldSystem_UpdateLocationToPlayerPosition(FieldSystem *fieldSystem);
static BOOL FieldMap_ChangeZone(FieldSystem *fieldSystem);
static void ov01_021E5FC0(FieldSystem *fieldSystem, u8 arg1);
static void ov01_021E6028(void);
static void BgConfig_Init(BgConfig *bgConfig);
static void ov01_021E6138(BgConfig *bgConfig);
static void ov01_021E6178(void);
static void OamManager_Free_thunk(void);
static void ov01_021E61E0(void);
static void ov01_021E6214(void);
static void ov01_021E6220(FieldSystem *fieldSystem);
static void ov01_021E6364(FieldSystem *fieldSystem);
static void InitGraphicsAndManagers(FieldSystem *fieldSystem);
static void FieldSystem_InitLandManager(FieldSystem *fieldSystem);
static void ov01_021E64A4(FieldSystem *fieldSystem);
static void ov01_021E6580(FieldSystem *fieldSystem);
static BOOL ov01_021E662C(void);
static MapObjectsToPreload *ov01_021E6644(enum HeapID heapID, u16 modelBank);
static const int *MapObjectsToPreload_GetIDs(const MapObjectsToPreload *mapObjectsToPreload);
static int MapObjectsToPreload_GetCount(const MapObjectsToPreload *mapObjectsToPreload);
static void MapObjectsToPreload_Free(MapObjectsToPreload *mapObjectsToPreload);
static GFIntrCB ov01_021E66A8(void);
static GFIntrCB ov01_021E66B8(void);
static GFIntrCB ov01_021E66C8(void);
static void ov01_021E66D8(void);
static void ov01_021E66DC(void);
static void ov01_021E66E0(void);

// TODO: Put in relevant headers
void sub_02023738(int arg0, enum HeapID heapID);
void sub_0205B4EC(int arg0, BOOL arg1);
FieldSystemUnkSub120 *ov02_0224F864(enum HeapID heapID);
void ov01_021FBA3C(void *arg0, void *arg1, FieldSystemUnkSub54 *unk54, void *arg3, void *arg4);
void *ov01_021F3638(enum HeapID heapID, void *arg1);
void WeatherManager_SetWeather(void *weatherManager, int a1);
void *ov01_021FB4C0(enum HeapID heapID);
void *ov01_021FB5D4(enum HeapID heapID, void *arg1);
void ov01_021EAF18(FieldSystem *fieldSystem);
BOOL ov01_021EAF34(FieldSystem *fieldSystem);
void ov01_021F50F0(FieldSystemUnkSub2C *unkSub2C);
void ov01_021FB418(FieldSystemUnkSub98 *unkSub98);
void ov01_021F13F4(FieldSystemUnkSub44 *unkSub44);
void ov01_02205424(FieldSystem *fieldSystem);
void ov01_021F61F8(FieldSystemUnkSub2C *unkSub2C);
void ov01_021E8A28(FieldSystemUnkSub54 *unkSub54);
void ov01_021E8AEC(FieldSystemUnkSub54 *unkSub54);
void ov01_021E8DD4(FieldSystemUnkSub58 **unkSub58_ptr);
void ov01_02204764(void *unk104);
void ov01_02204634(void *unkCC);
void ov01_02204278(FieldSystemUnkSubC8 *unkC8);
void ov01_02204084(void *unkC0);
void ov01_021FB944(void *unk34);
void ov01_021F62B0(FieldSystemUnkSub2C *unkSub2C);
void ov01_021EAC30(FieldSystem *fieldSystem);
void ov01_021EA284(void **unk50);
void ov01_021F3D50(struct FieldSystemUnkSub68 *unkSub68);
void ov01_021EB1BC(UnkStruct_ov01_021EB1E8 *arg0);
void ov01_021EB1DC(UnkStruct_ov01_021EB1E8 *arg0);
void ov01_021F9250(MapObjectManager *mapObjectManager);
void ov01_021F3660(void *unk9C);
BOOL ov01_021F62CC(FieldSystemUnkSub2C *unkSub2C);
void ov01_021EB234(void *weatherManager);
void ov01_021FB610(void *unk20);
void ov01_021FB4D4(void *unk1C);
void ov01_021EA8FC(FieldSystemUnkSub48 **unkSub48_ptr);
void ov02_0224F8F4(FieldSystemUnkSub120 *unkSub120);
void ov01_021EAF54(FieldSystem *fieldSystem);
void sub_02023778();
BOOL ov01_021EAF70(FieldSystem *fieldSystem);
void ov01_021EA2A4(void *unk50);
void ov01_022047DC(void *unk104);
void ov01_021EAD8C(void *unk28);
void ov01_021EB114(UnkStruct_ov01_021EB1E8 *unk10);
void ov01_02204350(FieldSystemUnkSubC8 *unkSubC8);
void ov01_021EA910(FieldSystemUnkSub48*, s32);
void ov01_021EAB44(FieldSystemUnkSub48*, s32, s32);
void ov01_021EAB58(FieldSystemUnkSub48*, s32, s32);
void ov01_021EAB6C(FieldSystemUnkSub48*, s32, s32);
void ov01_021EAB80(FieldSystemUnkSub48*, s32, s32, s32);
void ov01_021F3C9C(void *unk9C, void *unk34);                  
void ov01_021F61A8(FieldSystemUnkSub2C *unkSub2C, FieldSystemUnkSub48 *unkSub48);
void ov01_021F13EC(FieldSystemUnkSub44 *unkSub44);
void sub_020237B0(void);
FieldSystemUnkSub54 *ov01_021E87E4(NARC *narc, FieldSystemUnkSubC8 *unkSubC8);
FieldSystemUnkSub58 *ov01_021E8DB4();
void *ov01_021FB888(u8 areaDataBank);
NARC *ov01_021FB904(void *unk34);
NNSG3dResFileHeader *ov01_021FB934(void *unk34);
void *ov01_022041C4(enum HeapID heapID);
void *ov01_0220460C(FieldSystemUnkSubC8 *unkSubC8);
void *ov01_02204744(enum HeapID heapID);
FieldSystemUnkSub2C *ov01_021F6020(MAPMATRIX *mapMatrix, void *unk34, void *unkC0, FieldSystemUnkSub54 *unkSub54, void *unkCC, int unk64, SaveData *saveData);
void ov01_021F6118(FieldSystemUnkSub2C *unkSub2C, int x, int z);
FieldSystemUnkSub98 *ov01_021FB3A4(const u8 platesCount, enum HeapID heapID);
FieldSystemUnkSub44* ov01_021F1348(FieldSystem *fieldSystem, u32 rendererCount, enum HeapID heapID);
void ov01_021F1384(FieldSystemUnkSub44 *unkSub44, u32 animManCount);
void ov01_021F1390(FieldSystemUnkSub44 *unkSub44, enum HeapID heapID, int, int, int, int, int, int, int);
void ov01_021F13D0(FieldSystemUnkSub44 *unkSub44, const u32 *idIter);
void ov01_021F91F8(MapObjectManager *mapObjectManager, int arg1, int arg2, const int *arg3, int arg4);
void ov01_022057DC(MapObjectManager *mapObjectManager);
void ov01_021FD3F8(FieldSystemUnkSub44 *unkSub44);
void ov01_022059AC(FieldSystem *fieldSystem);
void sub_02057FA4();
FieldSystemUnkSub48 *ov01_021EA8E0();
void ov01_021EABA8(const VecFx32 *_target, FieldSystem *fieldSystem, const u32 cameraType, const BOOL withHistory);
u32 ov01_021FBA14(void *unk34);
void *ov01_021EA220(FieldSystemUnkSub48 *areaModelAttrs, const u32 archiveID);
void *ov01_021EB1F4(FieldSystem *fieldSystem);
struct FieldSystemUnkSub68 *ov01_021F3D38(enum HeapID heapID);
UnkStruct_ov01_021EB1E8 *ov01_021EAFD4();
void ov01_021EB00C(UnkStruct_ov01_021EB1E8 *textureManager, NNSG3dResTex *textureResource);
NNSG3dResTex *ov01_021FB9CC(void *unk34);

int CARD_SpiWaitGetStatus();

void fieldmap(void *param0) {
    FieldSystem *fieldSystem = param0;

    DoScheduledBgGpuUpdates(fieldSystem->bgConfig);
    GF_RunVramTransferTasks();
    OamManager_ApplyAndResetBuffers();

    sub_02023910(ov01_021FA1D0(sub_0205F1A0(fieldSystem->mapObjectManager)));
}

BOOL ov01_021E5924(OverlayManager *man, int *state) { // FieldMap_Init
    u32 offset = 0xDCE6A1;
    BOOL ret = FALSE;
    FieldSystem *fieldSystem = OverlayManager_GetArgs(man);

    switch (*state) { 
    case 0: // FIELD_MAP_INIT_STATE_RESET
        FS_LoadOverlay(MI_PROCESSOR_ARM9, FS_OVERLAY_ID(ds_protect));

        Main_SetVBlankIntrCB(NULL, NULL);
        HBlankInterruptDisable();

        G2_BlendNone();
        G2S_BlendNone();

        offset += (0x4CF * DSProt_DetectDummy(&ov01_021E66A8));

        sub_0200FBDC(0); // ResetVisibleHardwareWindows(DS_SCREEN_MAIN)
        sub_0200FBDC(1); // DS_SCREEN_SUB
        ov01_021E6364(fieldSystem);
        
        offset += (0x6B * (DSProt_DetectNotEmulator(&ov01_021E66D8) == FALSE));

        sub_02053018(fieldSystem); // FieldMapChange_Set3DDisplay
        fieldSystem->unk11C = 8;

        if (fieldSystem->unk74->unk0_14) { // fieldSystem->mapLoadMode->loadExtOverlay
            HandleLoadOverlay(FS_OVERLAY_ID(OVY_2), OVY_LOAD_ASYNC);

            switch (FieldSystem_HasNoGymmick(fieldSystem)) { // Do we really want to continue calling this 'Gymmick'?
            case FALSE: // FIELD_EXTENSION_OVERLAY_GYM
                HandleLoadOverlay(FS_OVERLAY_ID(OVY_4), OVY_LOAD_ASYNC);
                break;
            case TRUE: // FIELD_EXTENSION_OVERLAY_GENERIC
                HandleLoadOverlay(FS_OVERLAY_ID(OVY_3), OVY_LOAD_ASYNC);
                break;
            default: // Unreachable, but required for matching. Used to load Distortion World in Platinum.
                HandleLoadOverlay(FS_OVERLAY_ID(OVY_3), OVY_LOAD_ASYNC);
                break;
            }
        }

        offset += DSProt_DetectFlashcart(&ov01_021E66B8) * 0x3A1;

        Heap_Create(HEAP_ID_3, HEAP_ID_FIELD1, fieldSystem->unk74->unk_4);
        GF_ASSERT(fieldSystem->unk4 == NULL);

        FS_UnloadOverlay(MI_PROCESSOR_ARM9, FS_OVERLAY_ID(ds_protect));

        fieldSystem->unk4 = Heap_Alloc(HEAP_ID_FIELD1, sizeof(FieldSystemUnkSub4));
        MI_CpuFill8(fieldSystem->unk4, 0, sizeof(FieldSystemUnkSub4));
        fieldSystem->unk4->field3dObjectTaskManager = Field3dObjectTaskManager_Create(fieldSystem, HEAP_ID_FIELD1, 8);
        
        if (offset % 3433 != 0) {
            SysTask_CreateOnMainQueue(sub_0203E348, NULL, 0x7B);
        }
        
        ov01_021E6028();

        GF_CreateVramTransferManager(128, HEAP_ID_FIELD1);
        sub_02023738(4, HEAP_ID_FIELD1); // BillboardLists_Create
        GF3dRender_InitSimpleManager(HEAP_ID_FIELD1);

        ov01_021E61E0();
        ov01_021E6178();

        GfGfx_SwapDisplay();
        fieldSystem->bgConfig = BgConfig_Alloc(HEAP_ID_FIELD1); // Should probably BgConfig_New
        BgConfig_Init(fieldSystem->bgConfig);
        sub_0205B4EC(0, TRUE); // FieldMessage_LoadTextPalettes(PAL_LOAD_MAIN_BG, TRUE);
        TryStartMapScriptByType(fieldSystem, 4); // MAP_SCRIPT_ON_LOAD

        if (offset % 4217 != 0) SysTask_CreateOnMainQueue(sub_0203E348, NULL, 0x315);

        fieldSystem->unk120 = ov02_0224F864(HEAP_ID_FIELD1);
        break;
    case 1: // FIELD_MAP_INIT_STATE_LOAD
        InitGraphicsAndManagers(fieldSystem);
        ov01_021FBA3C(fieldSystem->unk34, fieldSystem->unkC0, fieldSystem->unk54, fieldSystem->unkCC, fieldSystem->unk104); //  AreaDataManager_Load(fieldSystem->areaDataManager)?
        
        fieldSystem->unk9C = ov01_021F3638(HEAP_ID_FIELD1, fieldSystem->unkC0); // fieldSystem->mapPropManager = MapPropManager_New
        
        FieldSystem_InitLandManager(fieldSystem);
        ov01_021E64A4(fieldSystem);
        ov01_021E6580(fieldSystem);

        WeatherManager_SetWeather(fieldSystem->unk4->weatherManager, LocalFieldData_GetWeatherType(Save_LocalFieldData_Get(fieldSystem->saveData)));
        
        if (FieldBGM_PlayEffectiveForMapHeader(fieldSystem, fieldSystem->location->mapId) || fieldSystem->unkC4 == -2) {
            ov01_021E7F00(fieldSystem, FALSE);
        }
        
        TryStartMapScriptByType(fieldSystem, 3); // MAP_SCRIPT_ON_RESUME
        
        fieldSystem->unk4->unk1C = ov01_021FB4C0(HEAP_ID_FIELD1); // hBlankSystem = HBlankSystem_New(HEAP_ID_FIELD1);
        ov01_021FB4F4(fieldSystem->unk4->unk1C); // HBlankSystem_Start
        fieldSystem->unk4->unk20 = ov01_021FB5D4(HEAP_ID_FIELD1, fieldSystem->unk4->unk1C);
        break;
    case 2: // FIELD_MAP_INIT_STATE_BOTTOM_SCREEN
        ov01_021EAF18(fieldSystem); // FieldSystem_InitBottomScreen
        break;
    case 3: // FIELD_MAP_INIT_STATE_DONE
        if (ov01_021EAF34(fieldSystem)) { // FieldSystem_IsBottomScreenRunningDummy?
            ret = TRUE;
            fieldSystem->unk6C = TRUE; // runningFieldMap
        }
        if (ov01_021E662C() == FALSE) {
            SysTask_CreateOnMainQueue(Task_AntipiracyMath, NULL, 0x3E8);
            SysTask_CreateOnMainQueue(Task_AntipiracyMath, NULL, 0x578);
        }
        break;
    }
    (*state)++;
    return ret;
}

BOOL ov01_021E5BE4(OverlayManager *man, int *state) { // FieldMap_Main
    FieldSystem *fieldSystem = OverlayManager_GetArgs(man);

    if (FieldSystem_UpdateLocationToPlayerPosition(fieldSystem)) {
        ov01_021F6830(fieldSystem, 1, 1); // Possibly equivalent to FieldSystem_SendPoketchEvent(fieldSystem, POKETCH_EVENT_PLAYER_MOVED, 1);
        FieldMap_ChangeZone(fieldSystem);
    }

    ov01_021E5FC0(fieldSystem, fieldSystem->unkBC);

    if (fieldSystem->unk6C != FALSE) return FALSE;
    return TRUE;
}

BOOL ov01_021E5C24(OverlayManager *man, int *state) { // FieldMap_Exit
    FieldSystem *fieldSystem;
    int offset = 0x2AAACF;
    fieldSystem = OverlayManager_GetArgs(man);
    ov01_021F50F0(fieldSystem->unk2C); // LandDataManager_Tick?

    switch (*state) {
    case 0:
        FS_LoadOverlay(MI_PROCESSOR_ARM9, FS_OVERLAY_ID(ds_protect));

        sub_02064910(fieldSystem); // DynamicMapFeatures_Free

        offset += 0x23B * DSProt_DetectDummy(&ov01_021E66C8);

        ov01_021F6304(fieldSystem->unk2C); // LandDataManager_ForgetTrackedTarget

        fieldSystem->location->x = PlayerAvatar_GetXCoord(fieldSystem->playerAvatar);
        fieldSystem->location->y = PlayerAvatar_GetZCoord(fieldSystem->playerAvatar);
        fieldSystem->location->direction = PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar);
        
        ov01_021FB418(fieldSystem->unk98); // DynamicTerrainHeightManager_Free

        GF_ASSERT(fieldSystem->unk54 != NULL); // mapPropAnimMan
        ov01_021F61F8(fieldSystem->unk2C); // LandDataManager_End
        
        offset += 0x18D * (DSProt_DetectNotFlashcart(&ov01_021E66DC) == FALSE);

        ov01_021E8A28(fieldSystem->unk54); // MapPropAnimationManager_UnloadAllAnimations
        ov01_021E8AEC(fieldSystem->unk54); // MapPropAnimationManager_Free
        ov01_021E8DD4(&fieldSystem->unk58); // MapPropOneShotAnimationManager_Free(&fieldSystem->mapPropOneShotAnimMan)
        ov01_02204764(fieldSystem->unk104);
        ov01_02204634(fieldSystem->unkCC);
        ov01_02204278(fieldSystem->unkC8);
        
        BOOL notEmulator = DSProt_DetectNotEmulator(&ov01_021E66E0) == FALSE;
        u32 unkVal = notEmulator * 0x8B + offset;

        ov01_021EB1BC(fieldSystem->unk4->unk10); // TextureResourceManager_FreeAllSlots

        FS_UnloadOverlay(MI_PROCESSOR_ARM9, FS_OVERLAY_ID(ds_protect));

        ov01_021EB1DC(fieldSystem->unk4->unk10); // TextureResourceManager_Destroy

        fieldSystem->unk4->unk10 = NULL;

        if (unkVal % 2221 != 0) { 
            SysTask_CreateOnMainQueue(sub_0203E348, NULL, 0x1EA5);
        }

        sub_0205E4C8(fieldSystem->mapObjectManager);
        ov01_021F9250(fieldSystem->mapObjectManager);

        sub_0205F55C(fieldSystem->mapObjectManager); // MapObjectMan_StopAllMovement
        ov01_021F13F4(fieldSystem->unk44); // FieldEffectManager_Free

        ov01_02205424(fieldSystem);
        MapObjectsToPreload_Free(fieldSystem->mapObjectsToPreload);
        fieldSystem->mapObjectsToPreload = NULL;

        if (unkVal % 1259 != 0) { 
            SysTask_CreateOnMainQueue(sub_0203E348, NULL, 0x4DD);
        }
        
        ov01_021F3660(fieldSystem->unk9C);
        (*state)++;
        break;
    case 1:
        if (ov01_021F62CC(fieldSystem->unk2C) == TRUE) { // LandDataManager_HasEnded
            ov01_02204084(fieldSystem->unkC0);
            ov01_021FB944(&fieldSystem->unk34); // AreaDataManager_Free
            ov01_021F62B0(fieldSystem->unk2C); // LandDataManager_FreeNARCAndLoadedMapBuffers
            ov01_021EAC30(fieldSystem); // FieldCamera_Delete
            ov01_021EA284(&fieldSystem->unk50); // AreaLightManager_Free
            ov01_021F3D50(fieldSystem->unk68); // Signpost_Free
            FieldDrawMapNameInfo_Destroy(fieldSystem->unk4->drawMapNameInfo);
            ov01_021EB234(fieldSystem->unk4->weatherManager);
            ov01_021FB610(fieldSystem->unk4->unk20);
            ov01_021FB4D4(fieldSystem->unk4->unk1C); // HBlankSystem_Delete
            sub_020556A8(fieldSystem->unk4->unk18); // Some equivalent to BerryPatchManager_Free
            FieldSystem_Unk4C_Free(&fieldSystem->unk4C); // FogManager_Free(&fieldSystem->fogMan);
            ov01_021EA8FC(&fieldSystem->unk48); // ModelAttributes_Free
            OamManager_Free_thunk();
            ov02_0224F8F4(fieldSystem->unk120);
            ov01_021E6138(fieldSystem->bgConfig);
            ov01_021EAF54(fieldSystem); // FieldSystem_EndBottomScreen
            (*state)++;
        }
        break;
    case 2:
        if (ov01_021EAF70(fieldSystem)) { // FieldSystem_IsBottomScreenDone
            ov01_021E6214();
            sub_02023778(); // BillboardLists_Delete
            GF_DestroyVramTransferManager();
            GF3dRender_DeleteSimpleManager();
            Field3dObjectTaskManager_Delete(fieldSystem->unk4->field3dObjectTaskManager);
            Main_SetVBlankIntrCB(NULL, NULL);
            Heap_Free(fieldSystem->bgConfig);
            Heap_Free(fieldSystem->unk4);

            fieldSystem->unk4 = NULL;

            Heap_Destroy(HEAP_ID_FIELD1);

            if (fieldSystem->unk74->unk0_14) {
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

/*const ApplicationManagerTemplate gFieldMapTemplate = {
    FieldMap_Init,
    FieldMap_Main,
    FieldMap_Exit,
    0xffffffff
};*/

static BOOL FieldSystem_HasNoGymmick(FieldSystem* fieldSystem) {
    return Save_Gymmick_GetType(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem))) == GYMMICK_NONE;
}

static BOOL FieldSystem_UpdateLocationToPlayerPosition(FieldSystem* fieldSystem) {
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

static BOOL FieldMap_ChangeZone(FieldSystem* fieldSystem) {
    int headerX = (int)PlayerAvatar_GetXCoord(fieldSystem->playerAvatar) / 32; // MAP_TILES_COUNT_X or equivalent
    int headerZ = (int)PlayerAvatar_GetZCoord(fieldSystem->playerAvatar) / 32; // MAP_TILES_COUNT_Z or equivalent
    
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

static void ov01_021E5FC0(FieldSystem* fieldSystem, u8 flag) {
    if (FieldSystem_TaskIsRunning(fieldSystem) == FALSE) {
        FieldSystem_StartBugContestTimer(fieldSystem);
    }

    ov01_021EA2A4(fieldSystem->unk50); // AreaLightManager_UpdateActiveTemplate
    ov01_022047DC(fieldSystem->unk104);
    ov01_021EAD8C(fieldSystem->unk28);
    ov01_021F3D98(fieldSystem); // Signpost_DoCurrentCommand

    if (1 & flag) ov01_021EB114(fieldSystem->unk4->unk10); // TextureResourceManager_Free
    if (8 & flag) ov01_02204350(fieldSystem->unkC8); // MapPropAnimationManager_AdvanceAnimations
    if (2 & flag) ov01_021F50F0(fieldSystem->unk2C); // LandDataManager_Tick
    if (4 & flag) ov01_021E6220(fieldSystem);
}

extern const GraphicsBanks ov01_02206350; /*= {
    .bg = 4,
    .bgextpltt = GX_VRAM_BGEXTPLTT_NONE,
    .subbg = 128,
    .subbgextpltt = 0,
    .obj = 96,
    .objextpltt = 0,
    .subobj = 256,
    .subobjextpltt = 0,
    .tex = 3,
    .texpltt = 16
};*/

static void ov01_021E6028(void) {
    GraphicsBanks local;
    for(int i = 5; i > 0; i--) {
        local = ov01_02206350;
    }
    GfGfx_SetBanks(&local);
}

void ov01_021E6058_thunk(BgConfig* bgConfig) { // Thunk_BgConfig_Init
    BgConfig_Init(bgConfig);
}

void ov01_021E6138_thunk(BgConfig *bgConfig) {
    ov01_021E6138(bgConfig);
}

extern const GraphicsModes ov01_022062EC; /*= {
    .dispMode = 1,
    .bgMode = 0,
    .subMode = 0,
    ._2d3dMode = 1
};*/

extern const BgTemplate ov01_022062FC; /* = {
    0,
    0,
    0x800,
    0,
    1,
    0,
    1,
    5,
    1,
    3,
    0,
    0,
    0
};*/

extern const BgTemplate ov01_02206318; /* = {
    0,
    0,
    0x800,
    0,
    1,
    0,
    0,
    4,
    0,
    3,
    0,
    0,
    0
};*/

extern const BgTemplate ov01_02206334; /* = {
    0,
    0,
    0x800,
    0,
    1,
    0,
    2,
    2,
    1,
    0,
    0,
    0,
    0
};*/

static void BgConfig_Init(BgConfig* bgConfig) {
    GraphicsModes graphicsModes = ov01_022062EC;
    SetBothScreensModesAndDisable(&graphicsModes);
    
    BgTemplate bgTemplate_1 = ov01_02206318;
    InitBgFromTemplate(bgConfig, 1, &bgTemplate_1, 0);
    BG_ClearCharDataRange(1, 32, 0, HEAP_ID_FIELD1);
    BgClearTilemapBufferAndCommit(bgConfig, 1);
    
    BgTemplate bgTemplate_2 = ov01_022062FC;
    InitBgFromTemplate(bgConfig, 2, &bgTemplate_2, 0);
    BG_ClearCharDataRange(2, 32, 0, HEAP_ID_FIELD1);
    BgClearTilemapBufferAndCommit(bgConfig, 2);
    
    BgTemplate bgTemplate_3 = ov01_02206334;
    InitBgFromTemplate(bgConfig, 3, &bgTemplate_3, 0);
    BG_ClearCharDataRange(3, 32, 0, HEAP_ID_FIELD1);
    BgClearTilemapBufferAndCommit(bgConfig, 3);
    
    u16 val = 0;
    DC_FlushRange(NULL, 2);
    GX_LoadBGPltt(&val, 0, 2);
}

static void ov01_021E6138(BgConfig* bgConfig) {
    GfGfx_EngineATogglePlanes(1, 0);
    GfGfx_EngineATogglePlanes(2, 0);
    GfGfx_EngineATogglePlanes(4, 0);
    GfGfx_EngineATogglePlanes(8, 0);
    FreeBgTilemapBuffer(bgConfig, 1);
    FreeBgTilemapBuffer(bgConfig, 2);
    FreeBgTilemapBuffer(bgConfig, 3);
}

static void ov01_021E6178(void) {
    NNS_G2dInitOamManagerModule();
    OamManager_Create(0, 0x7C, 0, 0x1f, 0, 0x7C, 0, 0x1F, HEAP_ID_FIELD1);
}

static void OamManager_Free_thunk(void) {
    OamManager_Free();
}

// TODO: Make static
void ov01_021E61A4(FieldSystemUnkSub48 *unkSub48);

void ov01_021E61A4(FieldSystemUnkSub48 *unkSub48) { // FieldMap_InitModelAttributes
    ov01_021EAB44(unkSub48, GX_POLYGONMODE_MODULATE, FALSE); // ModelAttributes_SetPolygonMode
    ov01_021EAB58(unkSub48, GX_CULL_BACK, FALSE); // ModelAttributes_SetCullMode
    ov01_021EAB6C(unkSub48, 31, FALSE); // ModelAttributes_SetAlpha
    ov01_021EAB80(unkSub48, 0x8000, TRUE, FALSE); // ModelAttributes_SetMiscAttrEnabled(modelAttrs, GX_POLYGON_ATTR_MISC_FOG, TRUE, FALSE);
    ov01_021EA910(unkSub48, 0x400000); // ModelAttributes_ApplyGlobal(modelAttrs, MODEL_ATTRIBUTES_LAST_BIT);
}

extern const ObjCharTransferTemplate ov01_022062DC; /*= {
    14,
    0x8000,
    0x4000,
    HEAP_ID_FIELD1
};*/

static void ov01_021E61E0(void) {
    ObjCharTransferTemplate objCharTransferTemplate = ov01_022062DC;
    ObjCharTransfer_InitEx(&objCharTransferTemplate, GX_OBJVRAMMODE_CHAR_1D_32K, GX_OBJVRAMMODE_CHAR_1D_32K);
    
    ObjPlttTransfer_Init(20, HEAP_ID_FIELD1);
    ObjCharTransfer_ClearBuffers();
    ObjPlttTransfer_Reset();
}

static void ov01_021E6214(void) {
    ObjCharTransfer_Destroy();
    ObjPlttTransfer_Destroy();
}

static void ov01_021E6220(FieldSystem* fieldSystem) {
    CameraAngle camAngle;

    Thunk_G3X_Reset();

    Camera_PushLookAtToNNSGlb();

    ov01_021F61A8(fieldSystem->unk2C, fieldSystem->unk48); // LandDataManager_RenderLoadedMaps

    ov01_021F3C9C(fieldSystem->unk9C, fieldSystem->unk34); // MapPropManager_Render2

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
    MIi_CpuCopyFast((u32 *)&v1, (u32 *) &NNS_G3dGlb.projMtx, sizeof(MtxFx44));
    NNS_G3dGlb.flag &= ~(NNS_G3D_GLB_FLAG_INVPROJ_UPTODATE | NNS_G3D_GLB_FLAG_INVCAMERAPROJ_UPTODATE);
    NNS_G3dGlbFlushP();

    ov01_021F13EC(fieldSystem->unk44); // FieldEffectManager_Render
    sub_020237B0(); // BillboardLists_Draw

    // Same here.
    MIi_CpuCopyFast((u32 *)&v0, (u32 *) &NNS_G3dGlb.projMtx, sizeof(MtxFx44));
    NNS_G3dGlb.flag &= ~(NNS_G3D_GLB_FLAG_INVPROJ_UPTODATE | NNS_G3D_GLB_FLAG_INVCAMERAPROJ_UPTODATE);
    NNS_G3dGlbFlushP();

    Field3dObjectTaskManager_RunDrawTasks(fieldSystem->unk4->field3dObjectTaskManager);
    RequestSwap3DBuffers(GX_SORTMODE_AUTO, gG3dDepthBufferingMode);
}

void ov01_021E631C(FieldSystem *fieldSystem, BOOL setFlag) {
    if (setFlag == TRUE) {
        fieldSystem->unkBC |= 4;
    } else {
        fieldSystem->unkBC &= ~4;
    }
}

void ov01_021E6340(FieldSystem* fieldSystem, BOOL setFlag) {
    if (setFlag == TRUE) {
        fieldSystem->unkBC |= 1;
    } else {
        fieldSystem->unkBC &= ~1;
    }
}

static void ov01_021E6364(FieldSystem* fieldSystem) {
    fieldSystem->unkBC = (8 | 1 | 2 | 4);
}

void ov01_021E636C(const u8 fadeType) { // FieldMap_FadeScreen
    if (fadeType == 1) { // FADE_TYPE_BRIGHTNESS_IN
        BeginNormalPaletteFade(0, 1, 1, 0, 6, 1, HEAP_ID_FIELD1); // FADE_BOTH_SCREENS, FADE_TYPE_BRIGHTNESS_IN, FADE_TYPE_BRIGHTNESS_IN, COLOR_BLACK, 6, 1,
    } else if (fadeType == 0) { // FADE_TYPE_BRIGHTNESS_OUT
        BeginNormalPaletteFade(0, 0, 0, 0, 6, 1, HEAP_ID_FIELD1); // FADE_BOTH_SCREENS, FADE_TYPE_BRIGHTNESS_OUT, FADE_TYPE_BRIGHTNESS_OUT, COLOR_BLACK, 6, 1,
    } else {
        GF_AssertFail();
    }
}

static void InitGraphicsAndManagers(FieldSystem* fieldSystem) {
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, FALSE);
    G3_SwapBuffers(GX_SORTMODE_AUTO, gG3dDepthBufferingMode);

    fieldSystem->unk34 = ov01_021FB888(MapHeader_GetAreaDataBank(fieldSystem->location->mapId)); // fieldSystem->areaDataManager = AreaDataManager_Alloc
    fieldSystem->unkC0 = ov01_02204004(HEAP_ID_FIELD1, 550, 128, ov01_021FB934(fieldSystem->unk34));
    
    u16 moveModelBank = MapHeader_GetMoveModelBank(fieldSystem->location->mapId);
    
    GF_ASSERT(fieldSystem->mapObjectsToPreload == NULL);
    fieldSystem->mapObjectsToPreload = ov01_021E6644(HEAP_ID_FIELD1, moveModelBank); // FetchMapObjectsToPreload
    
    fieldSystem->unkC8 = ov01_022041C4(HEAP_ID_FIELD1);
    fieldSystem->unkCC = ov01_0220460C(fieldSystem->unkC8);
    fieldSystem->unk104 = ov01_02204744(HEAP_ID_FIELD1);
    fieldSystem->unk54 = ov01_021E87E4(ov01_021FB904(fieldSystem->unk34), fieldSystem->unkC8);
    fieldSystem->unk58 = ov01_021E8DB4();
}

static void FieldSystem_InitLandManager(FieldSystem* fieldSystem) {
    fieldSystem->unk2C = ov01_021F6020(fieldSystem->mapMatrix, fieldSystem->unk34, fieldSystem->unkC0, fieldSystem->unk54, fieldSystem->unkCC, fieldSystem->unk64, fieldSystem->saveData); // LandDataManager_New
    fieldSystem->unk98 = ov01_021FB3A4(8, HEAP_ID_FIELD1); // dynamicTerrainHeightMan = DynamicTerrainHeightManager_New
    ov01_021F6118(fieldSystem->unk2C, fieldSystem->location->x, fieldSystem->location->y); // LandDataManager_InitialLoad
}

extern int ov01_02208BFC[]; /* = { // sDefaultFieldEffectRenderers?
    20,
    19,
    17,
    1,
    16,
    5,
    22,
    8,
    9,
    10,
    11,
    12,
    13,
    15,
    18,
    0,
    2,
    3,
    4,
    14,
    6,
    7,
    21,
    23
};*/

static void ov01_021E64A4(FieldSystem* fieldSystem) {
    fieldSystem->unk44 = ov01_021F1348(fieldSystem, 0x17, HEAP_ID_FIELD1); // fieldSystem->fieldEffMan = FieldEffectManager_New(fieldSystem, FIELD_EFFECT_RENDERER_COUNT, HEAP_ID_FIELD1);
    
    ov01_021F1384(fieldSystem->unk44, 80); // FieldEffectManager_InitAnimManagerList
    
    ov01_021F1390(fieldSystem->unk44, HEAP_ID_FIELD1, 32, 32, 32, 32, 0x500 * (32 / 2), 0x80 * (32 / 2), 0x800 * 32);
    
    fieldSystem->unk4->unk18 = sub_02055680(fieldSystem, HEAP_ID_FIELD1);
    if (fieldSystem->unk70 == 2) { // fieldSystem->mapLoadType == MAP_LOAD_TYPE_UNION?
        sub_0205F5F8(fieldSystem->mapObjectManager, FALSE); //  MapObjectMan_SetEndMovement
    }
    
    ov01_021F13D0(fieldSystem->unk44, ov01_02208BFC); // FieldEffectManager_InitRenderers
    
    int v0 = 10;
    if (fieldSystem->unk70 == 2) { // MAP_LOAD_TYPE_UNION?
        v0 = 5;
    }
    
    ov01_021F91F8(fieldSystem->mapObjectManager, 32, MapObjectsToPreload_GetCount(fieldSystem->mapObjectsToPreload) + 3, MapObjectsToPreload_GetIDs(fieldSystem->mapObjectsToPreload), v0);
    ov01_022057DC(fieldSystem->mapObjectManager);
    ov01_021FD3F8(fieldSystem->unk44); // FieldEffect_InitRenderObject
    sub_0205C46C(fieldSystem->playerAvatar); // PlayerAvatar_InitMapFeatures
    
    if (fieldSystem->unkAC != 0) {
        sub_0205E580(fieldSystem->mapObjectManager);
    } else {
        sub_0205E520(fieldSystem->mapObjectManager);
        ov01_022059AC(fieldSystem);
    }
    
    sub_02057FA4(); // CommPlayerMan_ForcePos
    
    if (fieldSystem->unkAC != 0) {
        MapObjectManager_ClearFlagsBits(fieldSystem->mapObjectManager, MAPOBJECTMANAGERFLAG_UNK1);
    } else {
        sub_0205F568(fieldSystem->mapObjectManager);
    }
    
    ov01_021F62E8(PlayerAvatar_GetPositionVector(fieldSystem->playerAvatar), fieldSystem->unk2C); // LandDataManager_TrackTarget
}

static void ov01_021E6580(FieldSystem *fieldSystem) {
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, 1);
    GfGfx_BothDispOn();
    fieldSystem->unk48 = ov01_021EA8E0(); // ModelAttributes_New
    ov01_021E61A4(fieldSystem->unk48); // FieldMap_InitModelAttributes
    fieldSystem->unk4C = ov01_021EA824(); // FogManager_New
    
    int cameraType = LocalFieldData_GetCameraType(Save_LocalFieldData_Get(fieldSystem->saveData));
    ov01_021EABA8(PlayerAvatar_GetPositionVector(fieldSystem->playerAvatar), fieldSystem, cameraType, TRUE); // FieldCamera_Create
    
    u32 lightArchiveID = ov01_021FBA14(fieldSystem->unk34); // AreaDataManager_GetAreaLightArchiveID
    if (lightArchiveID == 3 && CheckFlag96A(Save_VarsFlags_Get(fieldSystem->saveData))) {
        lightArchiveID = 4;
    }
    
    fieldSystem->unk50 = ov01_021EA220(fieldSystem->unk48, lightArchiveID); // AreaLightManager_New
    fieldSystem->unk4->weatherManager = ov01_021EB1F4(fieldSystem);
    fieldSystem->unk4->drawMapNameInfo = FieldDrawMapNameInfo_Create(fieldSystem->bgConfig);
    fieldSystem->unk68 = ov01_021F3D38(HEAP_ID_FIELD1); // Signpost_Init
    fieldSystem->unk4->unk10 = ov01_021EAFD4(); // TextureResourceManager_Create
    
    ov01_021EB00C(fieldSystem->unk4->unk10, ov01_021FB9CC(fieldSystem->unk34)); // TextureResourceManager_LoadTexture, AreaDataManager_GetMapTexture
    sub_020648EC(fieldSystem); // Probably DynamicMapFeatures_Init
    Main_SetVBlankIntrCB(fieldmap, fieldSystem);
}

static BOOL ov01_021E662C(void) {
    CARD_SpiWaitGetStatus();
    return CARD_SpiWaitGetStatus() == 170;
}

static MapObjectsToPreload *ov01_021E6644(enum HeapID heapID, u16 modelBank) {
    int i;
    MapObjectsToPreload *result = Heap_Alloc(heapID, sizeof(MapObjectsToPreload));
    u16 *mapObjectsToPreload = AllocAtEndAndReadWholeNarcMemberByIdPair(NARC_a_0_9_2, modelBank, heapID);
    
    for(i = 0; i < MAX_MAP_OBJECTS_TO_PRELOAD; i++) {
        result->ids[i] = MAP_OBJECT_PRELOAD_SENTINEL;
    }
    
    for(i = 0; i < MAX_MAP_OBJECTS_TO_PRELOAD; i++) {
        result->ids[i] = mapObjectsToPreload[i];
        if (mapObjectsToPreload[i] == MAP_OBJECT_PRELOAD_SENTINEL) break;
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

// Possibly start of antipiracy file

static GFIntrCB ov01_021E66A8(void) {
    return Heap_AllocAtEnd(HEAP_ID_3, 0x3E8);
}

static GFIntrCB ov01_021E66B8(void) {
    return Heap_AllocAtEnd(HEAP_ID_3, 0x3E8);
}

static GFIntrCB ov01_021E66C8(void) {
    return Heap_AllocAtEnd(HEAP_ID_3, 0x3E8);
}

static void ov01_021E66D8(void) {
    // Empty.
}

static void ov01_021E66DC(void) {
    // Empty.
}

static void ov01_021E66E0(void) {
    // Empty.
}
