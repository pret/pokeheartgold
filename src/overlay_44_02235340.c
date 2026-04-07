#include "overlay_44.h"

#include "unk_02037C94.h"
#include "unk_0200FA24.h"
#include "unk_0203A3B0.h"
#include "unk_02034354.h"
#include "unk_02035900.h"
#include "unk_020379A0.h"
#include "unk_02005D10.h"
#include "sound_02004A44.h"
#include "overlay_00_arm.h"
#include "overlay_00_thumb.h"
#include "overlay_42.h"
#include "unk_0200B150.h"
#include "unk_0200A090.h"
#include "unk_020971F8.h"

#include "global.h"
#include "obj_pltt_transfer.h"
#include "obj_char_transfer.h"
#include "overlay_manager.h"
#include "vram_transfer_manager.h"
#include "text.h"
#include "font.h"
#include "sprite.h"
#include "gf_gfx_loader.h"
#include "constants/sndseq.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0778.h"

#include "bg_window.h"
#include "filesystem.h"

// const u8 ov44_02236458[4] = {0x08, 0x00, 0x04, 0x0C};
// const WindowTemplate ov44_0223645C = {2, 25, 13, 5, 4, 1, 57};
// const func_type ov44_02236464[4] = {ov44_02234324, ov44_02234328, ov44_0223435C, ov44_02234388};
// const GraphicsModes ov44_02236474 = {
//     GX_DISPMODE_GRAPHICS,
//     GX_BGMODE_0,
//     GX_BGMODE_0,
//     GX_BG0_AS_2D
// };
// const ObjCharTransferTemplate ov44_02236484 = {
//     4,
//     0x00020000,
//     0x00004000,
//     HEAP_ID_DEFAULT
// };
// const BgTemplate ov44_02236494 = {0, 0, 2048, 0, 1, 0, 26, 4, 0, 1, 0, 0, 0};
// const BgTemplate ov44_022364B0 = {0, 0, 2048, 0, 1, 0, 28, 0, 0, 2, 0, 0, 0};
// const BgTemplate ov44_022364CC = {0, 0, 2048, 0, 1, 0, 27, 2, 1, 0, 0, 0, 0};

// const GraphicsBanks ov44_022364E8 = {
//     GX_VRAM_BG_128_A, GX_VRAM_BGEXTPLTT_NONE, GX_VRAM_SUB_BG_128_C,
//     GX_VRAM_SUB_BGEXTPLTT_NONE, GX_VRAM_OBJ_128_B, GX_VRAM_OBJEXTPLTT_NONE,
//     GX_VRAM_SUB_OBJ_16_I, GX_VRAM_SUB_OBJEXTPLTT_NONE, GX_VRAM_TEX_NONE, GX_VRAM_TEXPLTT_NONE};

// const u16 ov44_02236510[4][6] = {
//     { 208, 48, 0, 0, 1, 0 },
//     { 232, 72, 1, 0, 2, 0 },
//     { 208, 96, 2, 0, 0, 0 },
//     { 184, 72, 3, 0, 3, 0 },
// };
// const func_type_1 ov44_02236540[30] = 
//     {ov44_02234BF0, ov44_02234C10, Wifi_PromptAwaitingResponse, ov44_02234C88, ov44_02234CE8,
//     ov44_02234D28, ov44_02234D4C, ov44_02234D88, Wifi_PromptAwaitingMembers,
//     ov44_02234DE4, ov44_02234E08, ov44_02234EA4, ov44_02234EF4,
//     ov44_02234F44, ov44_02234F60, ov44_02234F88, Wifi_PromptMemberDrop,
//     ov44_02234FDC, Wifi_PromptToggleVoiceChat_, ov44_02235038, ov44_02235090,
//     ov44_02235100, ov44_02235158, ov44_0223518C, ov44_022351BC,
//     ov44_022351DC, ov44_02235218, ov44_02235268, ov44_0223532C,
//     ov44_02235340};

// const func_type_1 ov44_022365B8[33] = 
//     {ov44_02234474, Wifi_PromptReadyMessage, ov44_022344C4, Wifi_PromptUserJoinRequest,
//     ov44_022345C8, ov44_022345FC, Wifi_PromptInsufficientMembers, ov44_022346B4,
//     Wifi_PromptConfirmMembers, ov44_022346E8, ov44_0223471C, ov44_02234764,
//     ov44_0223479C, ov44_022347D4, ov44_022347FC, ov44_02234828,
//     ov44_02234858, ov44_022348A8, ov44_022348C4, Wifi_PromptStopFindingMembers,
//     ov44_02234904, ov44_02234944, Wifi_PromptDropAsLeader, ov44_022349B4,
//     ov44_022349F4, Wifi_PromptCancelInvites, ov44_02234A68, ov44_02234AA8,
//     Wifi_PromptMemberDropped, ov44_02234B18, Wifi_PromptToggleVoiceChat, ov44_02234B80,
//     ov44_02234BB4};

// const u8 ov44_0223663C[20] = {5, 4, 3, 2, 1, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 5, 5, 5, 0, 0};

// u8 ov44_0223689C[4] = {126, 127, 127, 127};

extern const u8 ov44_02236458[];
extern const WindowTemplate ov44_0223645C;

extern const func_type_022341C0 ov44_02236464[];
extern const GraphicsModes ov44_02236474;
extern const ObjCharTransferTemplate ov44_02236484;
extern const BgTemplate ov44_02236494;
extern const BgTemplate ov44_022364B0;
extern const BgTemplate ov44_022364CC;
extern const GraphicsBanks ov44_022364E8;
extern const u16 ov44_02236510[4][6];

extern const func_type_02232F64 ov44_02236540[];
extern const func_type_02232F64 ov44_022365B8[];
extern const u8 ov44_0223663C[];

extern u8 ov44_0223689C[];

FS_EXTERN_OVERLAY(OVY_42);

void ov44_02232EA8(OverlayManager* overlayMananger) {
    UnkStruct_ov44_args* temp_r5 = OverlayManager_GetArgs(overlayMananger);
    HandleLoadOverlay(FS_OVERLAY_ID(OVY_42), OVY_LOAD_ASYNC);
    if (sub_02039998() != 1) {
        GF_AssertFail();
    }
    Heap_Create(HEAP_ID_3, HEAP_ID_103, 0x18000);
    Heap_Create(HEAP_ID_3, HEAP_ID_104, 0xA000);
    UnkStruct_ov44_02235340* temp_r0 = OverlayManager_CreateAndGetData(overlayMananger, sizeof(UnkStruct_ov44_02235340), HEAP_ID_103);
    MI_CpuFill8(temp_r0, 0, sizeof(UnkStruct_ov44_02235340));
    MI_CpuFill8(temp_r0->unk1C, 1, 4);
    MI_CpuFill8(temp_r0->unk20, 1, 4);
    GF_CreateVramTransferManager(16, HEAP_ID_103);
    u8* temp_r0_2 = sub_020398C8();
    temp_r0->unk0 = temp_r0_2;
    temp_r0_2[33] = temp_r0_2[34];
    temp_r0->unk4 = ov44_022331B0(temp_r0);
    temp_r0->unk6 = 255;
    sub_020971F8(temp_r0);
    ov44_02234028(temp_r0);
    ov44_022331C4(temp_r0, temp_r5, HEAP_ID_103);
    Main_SetVBlankIntrCB((void*)&ov44_0223319C, temp_r0);
    sub_0203A880();
    temp_r0->unk27 = 1;
}

s32 ov44_02232F64(OverlayManager* overlayManager, u32* arg1) {
    UnkStruct_ov44_args* temp_r7;
    UnkStruct_ov44_02235340* temp_r4;
    s32 var_r6;

    temp_r4 = OverlayManager_GetData(overlayManager);
    temp_r7 = OverlayManager_GetArgs(overlayManager);
    switch (arg1[0]) {
        case 0:
            BeginNormalPaletteFade(3, 1, 1, RGB_BLACK, 6, 1, HEAP_ID_103);
            arg1[0]++;
            break;
        case 1:
            if (IsPaletteFadeFinished() != 0) {
                arg1[0]++;
            }
            break;
        case 2:
            if (temp_r4->unk27 != 0) {
                ov44_02233D8C(temp_r4, temp_r7, HEAP_ID_103);
            }
            if (temp_r4->unk4 != 0) {
                if (sub_02034420() == 1) {
                    ov44_0223438C(temp_r4);
                    sub_02034638();
                    ov44_02234248(temp_r4);
                }
                var_r6 = ov44_022365B8[temp_r4->unk5](temp_r4, temp_r7, HEAP_ID_103);
            }
            else {
                var_r6 = ov44_02236540[temp_r4->unk5](temp_r4, temp_r7, HEAP_ID_103);
                if (sub_02034420() == 1) {
                    ov44_0223427C(temp_r4, HEAP_ID_103);
                }
            }
            if (ov44_0223407C(temp_r4) != 0) {
                ov44_02233A50(temp_r4, temp_r7, HEAP_ID_103);
            }
            ov44_022341C0(temp_r4);
            if (var_r6 == 1) {
                temp_r7->unk3 = temp_r4->unk7;
                temp_r7->unk4 = temp_r4->unk11;
                arg1[0]++;
            }
            break;
        case 3:
            BeginNormalPaletteFade(3, 0, 0, RGB_BLACK, 6, 1, HEAP_ID_103);
            arg1[0]++;
            break;
        case 4:
            if (IsPaletteFadeFinished() != 0) {
                return 1;
            }
    }
    ov44_02233CCC(&temp_r4->unk30);
    SpriteList_RenderAndAnimateSprites(temp_r4->unk30.spriteList);
    return 0;
}

s32 ov44_022330A8(OverlayManager* arg0) {
    UnkStruct_ov44_02235340* temp_r4;

    temp_r4 = OverlayManager_GetData(arg0);
    OverlayManager_GetArgs(arg0);
    Main_SetVBlankIntrCB(0, 0);
    ov44_02234038(temp_r4);
    ov44_02234204(temp_r4);
    ov44_02233F20(temp_r4);
    FreeStructOv44_02235340(temp_r4, HEAP_ID_103);
    GF_DestroyVramTransferManager();
    OverlayManager_FreeData(arg0);
    Heap_Destroy(HEAP_ID_104);
    Heap_Destroy(HEAP_ID_103);
    UnloadOverlayByID(FS_OVERLAY_ID(OVY_42));
    return 1;
}

void ov44_02233100(UnkStruct_ov44_02235340* arg0, String* arg1) {
    if (arg0->unk4 == 0) {
        
        if (arg1->maxsize == sub_0203769C()) {
            switch (arg1->magic) {
            case 1:        
                arg0->unk13 = 1;
                return;
            case 0:
                arg0->unk13 = 2;
                return;

            case 2:
                arg0->unk13 = 3;
                return;
            }
        } else {
            switch (arg1->magic) {
            case 0:
                break;
            case 1: 
                arg0->unk28[arg1->maxsize] = 1;
                return;
            case 2: 
                break;
            default:
                return;
            }
            if (sub_02034420() == 1) {
                sub_020346E8(arg1->maxsize);
            }
        }
    }
}

void ov44_02233160(UnkStruct_ov44_02235340* arg0) {
    if (arg0->unk2C == 0) {
        arg0->unk2C = 1;
        sub_02037AC0(13);
    }
}

void ov44_0223317C(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1) {
    if (arg0->unk4 != 1) {
        __memcpy(arg0->unk20, arg1, 4);
    }
}

void ov44_0223319C(UnkStruct_ov44_02235340* arg0) {
    DoScheduledBgGpuUpdates(arg0->unk30.bgConfig);
    GF_RunVramTransferTasks();
    OamManager_ApplyAndResetBuffers();
}

s32 ov44_022331B0(UnkStruct_ov44_02235340* arg0) {
    if (sub_0203769C() == 0) {
        return 1;
    }
    return 0;
}

void ov44_022331C4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    ov44_0223323C();
    InitBgAndScrnData(&arg0->unk30, heapID);
    InitWindowList(&arg0->unk30, arg1, heapID);
    InitStringAndMsgData(&arg0->unk30, arg1, heapID);
    ov44_02233698(&arg0->unk30, arg1, heapID);
    ov44_02233A50(arg0, arg1, heapID);
    InitSpritesAnd2DGfxResObjs(&arg0->unk30, heapID);
}

void FreeStructOv44_02235340(UnkStruct_ov44_02235340* arg0, enum HeapID heapID) {
    FreeSpritesAnd2DGfxResObjs(&arg0->unk30);
    FreeStringAndMsgData(&arg0->unk30);
    FreeWindowList(&arg0->unk30, heapID);
    FreeBgAndScreenData(&arg0->unk30);
}

void ov44_0223323C(void) {
    GraphicsBanks graphicsBanks = ov44_022364E8;
    GfGfx_SetBanks(&graphicsBanks);
}

void InitBgAndScrnData(UnkStruct_ov44_02232F64* arg0, enum HeapID heapID) {
    arg0->bgConfig = BgConfig_Alloc(heapID);
    GraphicsModes graphicModes = ov44_02236474;
    SetBothScreensModesAndDisable(&graphicModes);

    BgTemplate bgTemplate1 = ov44_022364B0;
    InitBgFromTemplate(arg0->bgConfig, GF_BG_LYR_MAIN_0, &bgTemplate1, 0);
    BG_ClearCharDataRange(GF_BG_LYR_MAIN_0, 32, 0, heapID);
    BgClearTilemapBufferAndCommit(arg0->bgConfig, GF_BG_LYR_MAIN_0);

    BgTemplate bgTemplate2 = ov44_02236494;
    InitBgFromTemplate(arg0->bgConfig, GF_BG_LYR_MAIN_1, &bgTemplate2, 0);
    BG_ClearCharDataRange(GF_BG_LYR_MAIN_1, 32, 0, heapID);
    BgClearTilemapBufferAndCommit(arg0->bgConfig, GF_BG_LYR_MAIN_1);

    BgTemplate bgTemplate3 = ov44_022364CC;
    InitBgFromTemplate(arg0->bgConfig, GF_BG_LYR_MAIN_2, &bgTemplate3, 0);
    BG_ClearCharDataRange(GF_BG_LYR_MAIN_2, 32, 0, heapID);
    BgClearTilemapBufferAndCommit(arg0->bgConfig, GF_BG_LYR_MAIN_2);

    GfGfx_EngineATogglePlanes(8, 0);
    GfGfx_EngineATogglePlanes(16, 1);
    GfGfx_EngineBTogglePlanes(1, 0);
    GfGfx_EngineBTogglePlanes(2, 0);
    GfGfx_EngineBTogglePlanes(4, 0);
    GfGfx_EngineBTogglePlanes(8, 0);
    GfGfx_EngineBTogglePlanes(16, 0);
    
    NARC* narc = NARC_New(NARC_a_0_8_8, heapID);
    GfGfxLoader_GXLoadPalFromOpenNarc(narc, 14, GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_5_OFFSET, 32, heapID);
    GfGfxLoader_LoadCharDataFromOpenNarc(narc, 13, arg0->bgConfig, GF_BG_LYR_MAIN_2, 0, 1536, 0, heapID);
    arg0->scrnDataRaw = GfGfxLoader_GetScrnDataFromOpenNarc(narc, 15, 0, &arg0->scrnData, heapID);
    arg0->plttDataRaw = GfGfxLoader_GetPlttDataFromOpenNarc(narc, 45, &arg0->plttData, heapID);
    GfGfxLoader_LoadCharDataFromOpenNarc(narc, 46, arg0->bgConfig, GF_BG_LYR_MAIN_0, 0, 0, 0, heapID);
    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, 47, arg0->bgConfig, GF_BG_LYR_MAIN_0, 0, 0, 0, heapID);
    ov44_02233D08(arg0, 0);
    arg0->unk1F4 = 3;
    arg0->unk1F6 = 1;
    NARC_Delete(narc);
}

void FreeBgAndScreenData(UnkStruct_ov44_02232F64* arg0) {
    Heap_Free(arg0->scrnDataRaw);
    Heap_Free(arg0->plttDataRaw);
    FreeBgTilemapBuffer(arg0->bgConfig, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(arg0->bgConfig, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(arg0->bgConfig, GF_BG_LYR_MAIN_0);
    Heap_Free(arg0->bgConfig);
}

void InitWindowList(UnkStruct_ov44_02232F64* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    LoadFontPal1(GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_1_OFFSET, heapID);

    Options* options = Save_PlayerData_GetOptionsAddr(arg1->unk8);
    LoadUserFrameGfx2(arg0->bgConfig, GF_BG_LYR_MAIN_1, 1, 2, Options_GetFrame(options), heapID);
    LoadUserFrameGfx1(arg0->bgConfig, GF_BG_LYR_MAIN_1, 31, 3, 0, heapID);
    LoadUserFrameGfx1(arg0->bgConfig, GF_BG_LYR_MAIN_2, 48, 4, 0, heapID);
    AddWindowParameterized(arg0->bgConfig, &arg0->windowList[0], GF_BG_LYR_MAIN_1, 2, 19, 27, 4, 1, 40);
    FillWindowPixelBuffer(&arg0->windowList[0], 15);
    DrawFrameAndWindow2(&arg0->windowList[0], 1, 1, 2);
    AddWindowParameterized(arg0->bgConfig, &arg0->windowList[1], GF_BG_LYR_MAIN_1, 1, 1, 27, 2, 1, 148);
    FillWindowPixelBuffer(&arg0->windowList[1], 15);
    DrawFrameAndWindow1(&arg0->windowList[1], 1, 31, 3);
    AddWindowParameterized(arg0->bgConfig, &arg0->windowList[2], GF_BG_LYR_MAIN_1, 2, 16, 28, 2, 1, 202);
    FillWindowPixelBuffer(&arg0->windowList[2], 0);
    AddWindowParameterized(arg0->bgConfig, &arg0->windowList[3], GF_BG_LYR_MAIN_1, 1, 5, 20, 8, 1, 258);
    FillWindowPixelBuffer(&arg0->windowList[3], 15);
    DrawFrameAndWindow1(&arg0->windowList[3], 1, 31, 3);
    AddWindowParameterized(arg0->bgConfig, &arg0->windowList[4], GF_BG_LYR_MAIN_1, 23, 5, 7, 5, 1, 418);
    FillWindowPixelBuffer(&arg0->windowList[4], 15);
}

void FreeWindowList(UnkStruct_ov44_02232F64* arg0, enum HeapID heapID) {
    ov44_02233954(arg0);
    ClearFrameAndWindow2(&arg0->windowList[0], 0);
    RemoveWindow(&arg0->windowList[0]);
    sub_0200E5D4(&arg0->windowList[1], 0);
    RemoveWindow(&arg0->windowList[1]);
    RemoveWindow(&arg0->windowList[2]);
    sub_0200E5D4(&arg0->windowList[3], 0);
    RemoveWindow(&arg0->windowList[3]);
    sub_0200E5D4(&arg0->windowList[4], 0);
    RemoveWindow(&arg0->windowList[4]);
    
    if (arg0->listMenu2D != NULL) {
        Clear2dMenuWindowAndDelete(arg0->listMenu2D, heapID);
    }
}

void InitStringAndMsgData(UnkStruct_ov44_02232F64* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    arg0->msgFmt = MessageFormat_New(heapID);
    arg0->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0778_bin, heapID);
    arg0->string1 = String_New(256, heapID);
    arg0->string2 = String_New(256, heapID);
    arg0->printerId = 255;

    Options* options = Save_PlayerData_GetOptionsAddr(arg1->unk8);
    arg0->textFrameDelay = Options_GetTextFrameDelay(options);
}

void FreeStringAndMsgData(UnkStruct_ov44_02232F64* arg0) {
    String_Delete(arg0->string2);
    String_Delete(arg0->string1);
    DestroyMsgData(arg0->msgData);
    MessageFormat_Delete(arg0->msgFmt);
}

void ov44_02233698(UnkStruct_ov44_02232F64* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    switch (arg1->unk0) {
    case 0:
        break;
    case 1:
        BufferWiFiPlazaActivityName(arg0->msgFmt, 0, 0);
        break;
    case 2:
        BufferWiFiPlazaActivityName(arg0->msgFmt, 0, 1);
        break;
    case 3:
        BufferWiFiPlazaActivityName(arg0->msgFmt, 0, 2);
        break;
    }

    // Seeking Poffin cooks! OR // Seeking {STRVAR_3 0, 0, 0} players!
    ReadMsgDataIntoString(arg0->msgData, ov44_0223689C[arg1->unk0], arg0->string2);
    StringExpandPlaceholders(arg0->msgFmt, arg0->string1, arg0->string2);
    AddTextPrinterParameterizedWithColor(&arg0->windowList[1], 0, arg0->string1, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 15), 0);
    ScheduleWindowCopyToVram(&arg0->windowList[1]);
    ScheduleWindowCopyToVram(&arg0->windowList[3]);

    // Voice Chat ON/OFF: X Button
    ReadMsgDataIntoString(arg0->msgData, msg_0778_00128, arg0->string1);
    AddTextPrinterParameterizedWithColor(&arg0->windowList[2], 0, arg0->string1, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), 0);
    ScheduleWindowCopyToVram(&arg0->windowList[2]);
    ScheduleWindowCopyToVram(&arg0->windowList[0]);
}

void InitSpritesAnd2DGfxResObjs(UnkStruct_ov44_02232F64* arg0, enum HeapID heapID) {
    NNS_G2dInitOamManagerModule();
    OamManager_Create(0, 126, 0, 31, 0, 126, 0, 31, heapID);
    ObjCharTransferTemplate objCharTransferTemplate = ov44_02236484;
    objCharTransferTemplate.heapID = heapID;
    ObjCharTransfer_InitEx(&objCharTransferTemplate, GX_OBJVRAMMODE_CHAR_1D_128K, GX_OBJVRAMMODE_CHAR_1D_32K);
    ObjPlttTransfer_Init(4, heapID);
    ObjCharTransfer_ClearBuffers();
    ObjPlttTransfer_Reset();
    G2dRenderer_SetObjCharTransferReservedRegion(NNS_G2D_VRAM_TYPE_2DMAIN, GX_OBJVRAMMODE_CHAR_1D_128K);
    G2dRenderer_SetPlttTransferReservedRegion(NNS_G2D_VRAM_TYPE_2DMAIN);
    arg0->spriteList = G2dRenderer_Init(4, &arg0->g2dRenderer, heapID);

    for (s32 i = 0; i < 4; i++) {
        arg0->gf2DGfxResManList[i] = Create2DGfxResObjMan(4, (GfGfxResType)i, heapID);
    }

    arg0->unk154 = ov42_02228010(4, heapID);
    arg0->unk158 = ov42_02228EDC(arg0->spriteList, 0, 4, 1, heapID);
}

void FreeSpritesAnd2DGfxResObjs(UnkStruct_ov44_02232F64* arg0) {
    ov42_02228F94(arg0->unk158);
    ov42_02228050(arg0->unk154);
    SpriteList_Delete(arg0->spriteList);

    for (s32 i = 0; i < 4; i++) {
        Destroy2DGfxResObjMan(arg0->gf2DGfxResManList[i]);
    }

    ObjCharTransfer_Destroy();
    ObjPlttTransfer_Destroy();
    OamManager_Free();
}

void Wifi_LoadAndPrintTextToWindowWrapper(UnkStruct_ov44_02232F64* arg0, UnkStruct_ov44_args* arg1, s32 strno, enum HeapID heapID) {
    Wifi_LoadAndPrintTextToWindow(arg0, arg1, strno, 0, heapID);
}

void Wifi_LoadAndPrintTextToWindow(UnkStruct_ov44_02232F64* arg0, UnkStruct_ov44_args* arg1, s32 strno, s32 arg3, enum HeapID heapID) {
    if ((arg0->printerId != 255) && (TextPrinterCheckActive(arg0->printerId) != 0)) {
        RemoveTextPrinter(arg0->printerId);
        arg0->printerId = 255;
    }
    FillWindowPixelBuffer(&arg0->windowList[0], 15);
    String* string = String_New(256, heapID);
    ReadMsgDataIntoString(arg0->msgData, strno, string);
    StringExpandPlaceholders(arg0->msgFmt, arg0->string1, string);
    arg0->printerId = AddTextPrinterParameterizedWithColor(&arg0->windowList[0], 1, arg0->string1, 0, 0, arg0->textFrameDelay, MAKE_TEXT_COLOR(1, 2, 15), 0);
    ScheduleWindowCopyToVram(&arg0->windowList[0]);
    String_Delete(string);
    Options* options = Save_PlayerData_GetOptionsAddr(arg1->unk8);
    LoadUserFrameGfx2(arg0->bgConfig, GF_BG_LYR_MAIN_1, 1, 2, Options_GetFrame(options), heapID);
    arg0->unk15 = arg3;
}

s32 ov44_02233914(UnkStruct_ov44_02232F64* arg0) {
    if (arg0->printerId == 255) {
        if (arg0->unk15 != 0) {
            arg0->unk15--;
            return 0;
        }
    }
    else if ((TextPrinterCheckActive(arg0->printerId) == 0) && (arg0->printerId != 255)) {
        arg0->printerId = 255;
    }
    if ((arg0->printerId == 255) && (arg0->unk15 == 0)) {
        return 1;
    }
    return 0;
}

void ov44_02233954(UnkStruct_ov44_02232F64* arg0) {
    if (arg0->printerId != 255) {
        if (TextPrinterCheckActive(arg0->printerId) != 0) {
            RemoveTextPrinter(arg0->printerId);
        }
        arg0->printerId = 255;
    }
    FillWindowPixelBuffer(&arg0->windowList[0], 15);
    ScheduleWindowCopyToVram(&arg0->windowList[0]);
    arg0->unk15 = 0;
}

// {STRVAR_1 3, 0, 0}\nID {STRVAR_1 54, 1, 0}
void ov44_0223398C(UnkStruct_ov44_02232F64* arg0, UnkStruct_ov44_args* arg1, s32 arg2, enum HeapID heapID) {
    String* string1 = String_New(256, heapID);
    String* string2 = String_New(256, heapID);
    
    ov44_02233C88(arg0, arg1, arg2, 0, heapID);
    ov44_02233CA0(arg0, arg1, arg2, 1, heapID);

    ReadMsgDataIntoString(arg0->msgData, msg_0778_00131, string1);
    StringExpandPlaceholders(arg0->msgFmt, string2, string1);
    FillWindowPixelBuffer(&arg0->windowList[4], 15);
    AddTextPrinterParameterizedWithColor(&arg0->windowList[4], 0, string2, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 15), 0);
    DrawFrameAndWindow1(&arg0->windowList[4], 1, 31, 3);
    ScheduleWindowCopyToVram(&arg0->windowList[4]);
    String_Delete(string1);
    String_Delete(string2);
}

void ov44_02233A34(UnkStruct_ov44_02232F64* arg0) {
    sub_0200E5D4(&arg0->windowList[4], 1);
    ClearWindowTilemapAndScheduleTransfer(&arg0->windowList[4]);
}

void ov44_02233A50(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    UnkStruct_ov44_02232F64* temp_r6;

    if (sub_02034420() != 0) {
        temp_r6 = &arg0->unk30;
        for (s32 i = 0; i < 4; i++) {
            if ((i == 0) && (sub_02034730(i) == 1)) {
                ov44_02233AB8(arg0, temp_r6, arg1, i, heapID);
            } else if (sub_02034750(i) == 1) {
                ov44_02233AB8(arg0, temp_r6, arg1, i, heapID);
            } else {
                ov44_02233C18(temp_r6, arg1, i, heapID);
            }
        }
    }
}

void ov44_02233AB8(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_02232F64* arg1, UnkStruct_ov44_args* arg2, s32 arg3, enum HeapID heapID) {
    String* string1 = String_New(256, heapID);
    String* string2 = String_New(256, heapID);
    ov44_02233C88(arg1, arg2, arg3, 0, heapID);

    // {STRVAR_1 3, 0, 0}
    ReadMsgDataIntoString(arg1->msgData, msg_0778_00129, string1);
    StringExpandPlaceholders(arg1->msgFmt, string2, string1);
    
    u32 temp_r6 = arg3 * 16;
    FillWindowPixelRect(&arg1->windowList[3], 15, 0, temp_r6, 160, 16);
    AddTextPrinterParameterizedWithColor(&arg1->windowList[3], 0, string2, 0, temp_r6, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 15), 0);
    ov44_02233CA0(arg1, arg2, arg3, 0, heapID);

    // ID {STRVAR_1 54, 0, 0}
    ReadMsgDataIntoString(arg1->msgData, msg_0778_00130, string1);
    StringExpandPlaceholders(arg1->msgFmt, string2, string1);
    AddTextPrinterParameterizedWithColor(&arg1->windowList[3], 0, string2, 72, temp_r6, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 15), 0);
    ScheduleWindowCopyToVram(&arg1->windowList[3]);
    s32 var_r2;
    if (arg3 == sub_0203769C()) {
        if (arg0->unk0[33] != 0) {
            var_r2 = 2;
        } else {
            var_r2 = 1;
        }
    } else if (arg0->unk20[arg3] != 0) {
        var_r2 = 2;
    } else {
        var_r2 = 1;
    }

    NNSG2dScreenData* screenData = arg1->scrnData;
    u32 temp_r4 = (arg3 << 1) + 5;
    CopyToBgTilemapRect(arg1->bgConfig, GF_BG_LYR_MAIN_2, 18, temp_r4, 2, 2, &screenData->rawData[0], var_r2*2, 0, screenData->screenWidth/8, screenData->screenHeight/8);
    BgTilemapRectChangePalette(arg1->bgConfig, GF_BG_LYR_MAIN_2, 18, temp_r4, 2, 2, 5);
    ScheduleBgTilemapBufferTransfer(arg1->bgConfig, GF_BG_LYR_MAIN_2);
    String_Delete(string1);
    String_Delete(string2);
}

void ov44_02233C18(UnkStruct_ov44_02232F64* arg0, UnkStruct_ov44_args* arg1, s32 arg2, enum HeapID heapID) {
    FillWindowPixelRect(&arg0->windowList[3], 15, 0, arg2 * 16, 160, 16);

    NNSG2dScreenData* screenData = arg0->scrnData;
    CopyToBgTilemapRect(arg0->bgConfig, GF_BG_LYR_MAIN_2, 18, arg2 * 2 + 5, 2, 2, &screenData->rawData[0], 0, 0, screenData->screenWidth/8, screenData->screenHeight/8);
    ScheduleBgTilemapBufferTransfer(arg0->bgConfig, GF_BG_LYR_MAIN_2);
    ScheduleWindowCopyToVram(&arg0->windowList[3]);
}

void ov44_02233C88(UnkStruct_ov44_02232F64* arg0, UnkStruct_ov44_args* arg1, s32 arg2, s32 arg3, enum HeapID heapID) {
    BufferPlayersName(arg0->msgFmt, arg3, sub_02034818(arg2));
}

void ov44_02233CA0(UnkStruct_ov44_02232F64* arg0, UnkStruct_ov44_args* arg1, s32 arg2, s32 arg3, enum HeapID heapID) {
    BufferIntegerAsString(arg0->msgFmt, arg3, PlayerProfile_GetTrainerID_VisibleHalf(sub_02034818(arg2)), 5, PRINTING_MODE_LEADING_ZEROS, 1);
}

void ov44_02233CCC(UnkStruct_ov44_02232F64* arg0) {
    if (arg0->unk1F4 <= 0) {
        ov44_02233D08(arg0, arg0->unk1F6);
        arg0->unk1F4 = 3;
        arg0->unk1F6 = (arg0->unk1F6 + 1) % 18;
        return;
    }
    arg0->unk1F4--;
}

void ov44_02233D08(UnkStruct_ov44_02232F64* arg0, s32 arg1) {
    if (GF_CreateNewVramTransferTask(NNS_GFD_DST_2D_BG_PLTT_MAIN, 0, (ov44_0223663C[arg1] << 5) + arg0->plttData->pRawData, 32) == 0) {
        GF_AssertFail();
    }
}

u8 ov44_02233D38(UnkStruct_ov44_02235340* arg0, enum HeapID heapID) {
    arg0->unk0[34] = 1 - arg0->unk0[34];
    arg0->unk0[33] = arg0->unk0[34];
    ov00_021E70B8(arg0->unk0[33]);
    ov00_021E6D60(arg0->unk0, 36);
    if (arg0->unk0[33] == 1) {
        ov44_02233F3C(arg0);
    } else {
        ov44_02233F50(arg0);
    }
    return arg0->unk0[34];
}

void ov44_02233D8C(UnkStruct_ov44_02235340 *arg0, UnkStruct_ov44_args *arg1, enum HeapID heapID) {
    s32 temp_r7;
    s32 temp_r6;
    s32 var_r5;

    if (arg0->unk4 != 0) {
        if ((u8)(arg0->unk5 + 229) <= 2) {
            return;
        }
        if ((sub_020390C4() <= 2) && (ov44_02233F64(arg0) <= 1) && (ov44_02233E6C(arg0) == 0)) {
            return;
        }
    } else if ((arg0->unk5 == 15) || (arg0->unk5 == 16) || (arg0->unk5 == 17) || ((u8)(arg0->unk5 + 250) <= 1)) {
        return;
    }

    temp_r6 = ov44_02234458(arg0);
    temp_r7 = ov44_02234044(arg0);
    if (ov44_02233F64(arg0) > sub_02037454()) {
        var_r5 = 1;
    } else {
        var_r5 = 0;
    }
    if ((sub_020390C4() >= 3) || (sub_020393C8() != 0) || (sub_02039264() != 0) || (sub_020373B4(0) == 0) || (ov44_02233E6C(arg0) == 0) || (var_r5 == 1) || (temp_r6 == 1) || (temp_r7 == 1)) {
        if (arg0->unk4 != 0) {
            arg0->unk5 = 27;
            return;
        }
        arg0->unk5 = 15;
    }
}

void ov44_02233E48(UnkStruct_ov44_02235340* arg0) {
    if ((sub_020390C4() > 3) || (sub_02039264() != 0) || (sub_020393C8() != 0)) {
        arg0->unk5 = 15;
    }
}

s32 ov44_02233E6C(UnkStruct_ov44_02235340* arg0) {
    if (sub_02037454() > 0) {
        return 1;
    }
    return 0;
}

s32 ov44_02233E80(u32 arg0, u32 arg1) {
    s32 var_r5 = sub_02039080(); 
    if (var_r5 == 1 ) {
        switch(arg1) {
            case 0:
                sub_02039AF8();
                break;
            case 1:
            case 2:
            case 3:
                sub_02039B18();
        }
    }
    return var_r5;
}

void ov44_02233EB4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1) {
    switch (arg1->unk0) {
    case 0:
        arg0->unk0[27] = 18;
        break;
    case 1:
        arg0->unk0[27] = 22;
        break;
    case 2:
        arg0->unk0[27] = 24;
        break;
    case 3:
        arg0->unk0[27] = 26;
        break;
    }
    ov00_021E6D60(arg0->unk0, 36);
}

s32 ov44_02233EF8(UnkStruct_ov44_02235340* arg0) {
    if (arg0->unk11 == 1) {
        return 0;
    }
    if (ov44_02233E6C(arg0) == 1) {
        ov00_021E69A8(104);
        arg0->unk11 = 1;
        return 1;
    }
    return 0;
}

s32 ov44_02233F20(UnkStruct_ov44_02235340* arg0) {
    if (arg0->unk11 == 0) {
        return 0;
    }
    ov00_021E6A4C();
    arg0->unk11 = 0;
    return 1;
}

void ov44_02233F3C(UnkStruct_ov44_02235340* arg0) {
    if (ov44_02233EF8(arg0) != 0) {
        GF_GetCurrentPlayingBGM();
        sub_02005448();
    }
}

void ov44_02233F50(UnkStruct_ov44_02235340* arg0) {
    if (ov44_02233F20(arg0) != 0) {
        GF_SndHandleSetInitialVolume(0, 120);
    }
}

s32 ov44_02233F64(UnkStruct_ov44_02235340* arg0) {
    return sub_020347A0();
}

s32 ov44_02233F6C(UnkStruct_ov44_02235340* arg0, enum HeapID heapID) {
    s32 var_r7 = 1;
    for (s32 i = sub_0203769C() - 1; i >= 0; i--) {
        if (sub_02034714(i) == 1) {
            ov44_022340BC(arg0, i, heapID);
        } else if (sub_02034750(i) == 0) {
            var_r7 = 0;
        }
    }
    return var_r7;
}

void ov44_02233FA8(UnkStruct_ov44_02235340* arg0) {
    UnkStruct_ov44_022345FC var_r5;
    var_r5.unk2 = 0;
    for (s32 i = 1; i < 4; i++) {
        if (sub_02034714(i) == 1) {
            var_r5.unk0 = i;
            
            if (sub_02037030(22, &var_r5, 8) != 1) {
                GF_AssertFail();
            }
            sub_020346E8(i);
        }
    }
}

void ov44_02233FE8(UnkStruct_ov44_02235340* arg0) {
    UnkStruct_ov44_022345FC var_r5;
    var_r5.unk2 = 0;
    for (s32 i = 1; i < 4; i++) {
        if (sub_02034730(i) == 1) {
            var_r5.unk0 = i;
            if (sub_02037030(22, &var_r5, 8) != 1) {
                GF_AssertFail();
            }
            sub_020346E8(i);
        }
    }
}

void ov44_02234028(UnkStruct_ov44_02235340* arg0) {
    ov00_021E5CA0(ov44_02234070, arg0);
}

void ov44_02234038(UnkStruct_ov44_02235340* arg0) {
    ov00_021E5CA0(0, 0);
}

s32 ov44_02234044(UnkStruct_ov44_02235340* arg0) {
    s32 var_r7 = 0;
    for (s32 i = 0; i < 4; i++) {
        if (arg0->unk14[i] == 1) {
            if (sub_02034750(arg0->unk18[i]) == 1) {
                var_r7 = 1;
            }
            arg0->unk14[i] = 0;
            arg0->unk18[i]= 0;
        }
    }
    return var_r7;
}

void ov44_02234070(u8 arg0, UnkStruct_ov44_02235340* arg1, s32 arg2) {
    arg1->unk14[arg0] = 1;
    arg1->unk18[arg0] = arg0;
}

s32 ov44_0223407C(UnkStruct_ov44_02235340* arg0) {
    s32 i;
    s32 ret = 0;
    for (i = 0; i < 4; i++) {
        if (arg0->unk1C[i] != arg0->unk20[i]) {
            ret = 1;
        }
        arg0->unk1C[i] = arg0->unk20[i];
    }
    
    if (arg0->unk24 != 0) {
        arg0->unk24 = 0;
        ret = 1;
    }
    
    return ret;
}

void ov44_022340B4(UnkStruct_ov44_02235340* arg0) {
    arg0->unk24 = 1;
}

void ov44_022340BC(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    if (sub_02034750(arg1) == 0) {
        sub_0203476C(arg1);
        arg0->unk25 = arg1;
        ov44_022340EC(arg0, arg1, heapID);
        ov44_022340B4(arg0);
    }
}

void ov44_022340EC(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    u16 sp4[6];

    if (arg0->unk30.unk15C[arg1].unk0 == 0) {
        sp4 = ov44_02236510[arg1];
        
        if (arg1 != sub_0203769C()) {
            PlayerProfile* playerProfile = sub_02034818(arg1);
            if (playerProfile == NULL) {
                GF_AssertFail();
            }
            sp4[5] = PlayerProfile_GetAvatar(playerProfile);
        } else if (arg0->unk0[30] == 0) {
            sp4[5] = 0;
        } else {
            sp4[5] = 97;
        }
        arg0->unk30.unk15C[arg1].unk0 = ov42_022280B8(arg0->unk30.unk154, sp4);
        if (ov42_02229010(arg0->unk30.unk158, sp4[5]) == 0) {
            ov42_02228FE0(arg0->unk30.unk158, sp4[5], 2, heapID);
        }

        arg0->unk30.unk15C[arg1].unk4 = ov42_0222903C(arg0->unk30.unk158, arg0->unk30.unk15C[arg1].unk0, 0, heapID);
        ov42_02229200(arg0->unk30.unk15C[arg1].unk4, 0);
        arg0->unk30.unk15C[arg1].unk8++;
    }
}

void ov44_022341C0(UnkStruct_ov44_02235340* arg0) {
    for (s32 i = 0; i < 4; i++) {
        func_type_022341C0 ov44_func = ov44_02236464[arg0->unk30.unk15C[i].unk8];
        ov44_func(arg0, &arg0->unk30.unk15C[i]);
    }
    ov42_0222807C(arg0->unk30.unk154);
    ov42_022290DC(arg0->unk30.unk158);
}

void ov44_02234204(UnkStruct_ov44_02235340* arg0) {
    ov42_0222901C(arg0->unk30.unk158);
    memset(&arg0->unk30.unk15C, 0, 48);
}

void ov44_02234224(UnkStruct_ov44_02235340* arg0, s32 arg1) {
    UnkStruct_ov44_022345FC sp;
    sp.unk0 = arg1;
    sp.unk2 = 2;
    if (sub_02037030(22, &sp, 8) != 1) {
        GF_AssertFail();
    }
}

void ov44_02234248(UnkStruct_ov44_02235340* arg0) {
    for (s32 i = 0; i < 4; i++) {
        if (((arg0->unk25 + 1) < i) && (sub_02034714(i) == 1)) {
            ov44_02234224(arg0, i);
            sub_020346E8(i);
        }
    }
}

void ov44_0223427C(UnkStruct_ov44_02235340* arg0, enum HeapID heapID) {
    for (s32 i = 0; i < 4; i++) {
        if ((arg0->unk28[i] == 1) && (sub_02034730(i) == 1)) {
            ov44_022340BC(arg0, i, heapID);
            arg0->unk28[i] = 0;
            arg0->unk12 = 1;
        }
    } 
}

void ov44_022342B8(UnkStruct_ov44_02235340* arg0) {
    if (arg0->unk30.waitingIcon != 0) {
        GF_AssertFail();
    }
    arg0->unk30.waitingIcon = WaitingIcon_New(&arg0->unk30.windowList[0], 1);
}

void ov44_022342E0(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    if (arg0->unk30.waitingIcon != 0) {
        sub_0200F450(arg0->unk30.waitingIcon);
        arg0->unk30.waitingIcon = 0;
        Options* options = Save_PlayerData_GetOptionsAddr(arg1->unk8);
        LoadUserFrameGfx2(arg0->unk30.bgConfig, GF_BG_LYR_MAIN_1, 1, 2, Options_GetFrame(options), heapID);
    }
}

void ov44_02234324(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_022341C0* arg1) {

}

void ov44_02234328(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_022341C0* arg1) {
    ov42_0222919C(arg1->unk4, 0);
    ov42_022291A0(arg1->unk4);
    ov42_02229200(arg1->unk4, 1);
    arg1->unk8 = 2;
    s32 idx = ov42_02228188(arg1->unk0, 6);
    arg1->unkA = ov44_02236458[idx] + 16;
}

void ov44_0223435C(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_022341C0* arg1) {
    ov42_022291AC(arg1->unk4);
    arg1->unkA = (arg1->unkA - 1);
    if (arg1->unkA <= 0) {
        ov42_022291B8(arg1->unk4);
        ov42_0222919C(arg1->unk4, 1);
        arg1->unk8 = 3;
    }
}

void ov44_02234388(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_022341C0* arg1) {

}

void ov44_0223438C(UnkStruct_ov44_02235340* arg0) {
    u8 sp4[4];
    s32 sp0;
    s32 sp_count;
    s32 temp_r7;
    u32 var_r0;
    sp0 = 0;
    if (sub_02034420() != 0) {
        sp_count = sub_020347A0();
        if ((sub_020346D4() != 0) && (sub_02037824(5) == 0)) {
            sp0 = 1;
        }
        for (s32 i = 0; i < sp_count; i++) {
            if (i == 0) {
                var_r0 = arg0->unk0[33];
            } else {
                temp_r7 = sub_02034870(i);
                if (temp_r7 == 32) {
                    GF_AssertFail();
                }
                var_r0 = arg0->unk0[33 + (temp_r7 + 1) * 36];
            }
            if (var_r0 != arg0->unk20[i]) {
                sp0 = 1;
            }
            arg0->unk20[i] = var_r0;
        }
        if (sp0 == 1) {
            __memcpy(&sp4, arg0->unk20, 4);
            sub_02037030(24, &sp4, 4);
        }
    }
}

int ov44_0223442C(UnkStruct_ov44_02235340* arg0) {
    if (sub_02037B38(13) != 0) {
        return 1;
    }
    return 0;
}

void ov44_02234440(UnkStruct_ov44_02235340* arg0) {
    arg0->unk10 = 1;
    arg0->unkC = 1800;
}

void ov44_02234450(UnkStruct_ov44_02235340* arg0) {
    arg0->unk10 = 0;
}

s32 ov44_02234458(UnkStruct_ov44_02235340* arg0) {
    if (arg0->unk10 == 0) {
        return 0;
    }
    if (arg0->unkC > 0) {
        arg0->unkC--;
        return 0;
    }
    return 1;
}

s32 ov44_02234474(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    if (arg0->unk0[33] == 1) {
        ov44_02233F3C(arg0);
    }
    ov00_021E7220(0);
    sub_020398D4(0, 1);
    ov44_022340EC(arg0, sub_0203769C(), heapID);
    arg0->unk5 = 1;
    return 0;
}

// When the group is ready:\nA Button: Proceed   B Button: Cancel
s32 Wifi_PromptReadyMessage(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    Wifi_LoadAndPrintTextToWindowWrapper(&arg0->unk30, arg1, msg_0778_00107, heapID);
    arg0->unk5 = 2;
    return 0;
}

s32 ov44_022344C4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    s32 temp_r0;

    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    if (ov44_02233E6C(arg0) == 1) {
        temp_r0 = sub_02034780();
        if ((temp_r0 != 255) && (arg0->unk6 != 0)) {
            if (sub_02034870(temp_r0) == 32) {
                UnkStruct_ov44_022345FC subroutine_arg0;
                subroutine_arg0.unk0 = temp_r0;
                subroutine_arg0.unk2 = 0;
                sub_020346E8(temp_r0);
                if (sub_02037030(22, &subroutine_arg0, 8) != 1) {
                    GF_AssertFail();
                }
            } else {
                arg0->unk6 = temp_r0;
            }
        }
    }
    if (1 & gSystem.newKeys) {
        PlaySE(SEQ_SE_DP_DECIDE);
        if (ov44_02233E6C(arg0) == 0) {
            arg0->unk5 = 6;
        } else if (arg1->unk1 <= ov44_02233F64(arg0)) {
            arg0->unk5 = 8;
        } else {
            arg0->unk5 = 6;
        }
    } else if (gSystem.newKeys & 2) {
        PlaySE(SEQ_SE_DP_DECIDE);
        arg0->unk5 = 22;
    } else if (arg0->unk6 != 255) {
        PlaySE(SEQ_SE_DP_DECIDE);
        arg0->unk5 = 3;
    } else if (gSystem.newKeys & 1024) {
        arg0->unk5 = 30;
        PlaySE(SEQ_SE_DP_DECIDE);
    }
    return 0;
}

// Someone wishes to join.\nAccept this Trainer as a member?
s32 Wifi_PromptUserJoinRequest(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    ov44_0223398C(&arg0->unk30, arg1, arg0->unk6, heapID);
    Wifi_LoadAndPrintTextToWindowWrapper(&arg0->unk30, arg1, msg_0778_00108, heapID);
    arg0->unk5 = 4;
    return 0;
}

s32 ov44_022345C8(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    arg0->unk30.listMenu2D = Std_CreateYesNoMenu(arg0->unk30.bgConfig, &ov44_0223645C, 48, 4, heapID);
    arg0->unk5 = 5;
    return 0;
}

s32 ov44_022345FC(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    s32 temp_r0;

    temp_r0 = Handle2dMenuInput_DeleteOnFinish(arg0->unk30.listMenu2D, heapID);
    if (temp_r0 != -1) {
        UnkStruct_ov44_022345FC subroutine_arg0;
        subroutine_arg0.unk0 = (s16) arg0->unk6;
        if (temp_r0 == 0) {
            subroutine_arg0.unk2 = 1;
            ov44_022340BC(arg0, arg0->unk6, heapID);
            if (arg0->unk0[33] == 1) {
                ov44_02233F20(arg0);
                ov44_02233F3C(arg0);
            }
            if (arg1->unk2 <= ov44_02233F64(arg0)) {
                arg0->unk5 = 8;
            } else {
                arg0->unk5 = 1;
            }
        } else {
            subroutine_arg0.unk2 = 0;
            sub_020346E8(arg0->unk6);
            arg0->unk5 = 1;
        }
        if (sub_02037030(22, &subroutine_arg0, 8) != 1) {
            GF_AssertFail();
        }
        arg0->unk6 = 255;
        ov44_02233A34(&arg0->unk30);
        arg0->unk30.listMenu2D = NULL;
    }
    return 0;
}

// There aren’t enough members.\r
s32 Wifi_PromptInsufficientMembers(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    Wifi_LoadAndPrintTextToWindowWrapper(&arg0->unk30, arg1, msg_0778_00119, heapID);
    arg0->unk5 = 7;
    return 0;
}

s32 ov44_022346B4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    arg0->unk5 = 19;
    return 0;
}

// Are these members OK?
s32 Wifi_PromptConfirmMembers(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    Wifi_LoadAndPrintTextToWindowWrapper(&arg0->unk30, arg1, msg_0778_00111, heapID);
    arg0->unk5 = 9;
    return 0;
}

s32 ov44_022346E8(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    arg0->unk30.listMenu2D = Std_CreateYesNoMenu(arg0->unk30.bgConfig, &ov44_0223645C, 48, 4, heapID);
    arg0->unk5 = 10;
    return 0;
}

s32 ov44_0223471C(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    s32 temp_r0;

    temp_r0 = Handle2dMenuInput_DeleteOnFinish(arg0->unk30.listMenu2D, heapID);
    if (temp_r0 != -1) {
        if (temp_r0 == 0) {
            arg0->unk5 = 11;
        } else if (arg1->unk2 <= ov44_02233F64(arg0)) {
            arg0->unk5 = 19;
        } else {
            arg0->unk5 = 1;
        }
        arg0->unk30.listMenu2D = NULL;
    }
    return 0;
}

// Communicating. Please stand by...
s32 ov44_02234764(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    arg0->unk8 = 30;
    ov44_02233FA8(arg0);
    Wifi_LoadAndPrintTextToWindowWrapper(&arg0->unk30, arg1, msg_0778_00102, heapID);
    ov44_022342B8(arg0);
    ov44_02234440(arg0);
    arg0->unk5 = 12;
    ov00_021E7130();
    return 0;
}

s32 ov44_0223479C(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    if (sub_02037454() != sub_020347A0()) {
        ov44_02233FA8(arg0);
        return 0;
    }
    if (ov00_021E70F4() == 0) {
        return 0;
    }
    ov00_021E7220(1);
    arg0->unk5 = 13;
    return 0;
}

s32 ov44_022347D4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    if (arg0->unk8 == 0) {
        if (sub_02037030(23, NULL, 0) != 0) {
            arg0->unk5 = 14;
        }
    } else {
        arg0->unk8--;
    }
    return 0;
}

s32 ov44_022347FC(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    if (sub_02037B38(13) != 0) {
        ov44_02233EB4(arg0, arg1);
        sub_02037BEC();
        sub_02037AC0(14);
        arg0->unk5 = 15;
    }
    return 0;
}

s32 ov44_02234828(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    if (sub_02037B38(14) != 0) {
        s16 subroutine_arg0 = (s16) arg0->unk0[27];
        if (sub_02037C0C(sub_0203769C(), &subroutine_arg0) == 1) {
            arg0->unk5 = 16;
        }
    }
    return 0;
}

s32 ov44_02234858(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    s32 i = 0;
    s32 temp_r7 = ov44_02233F64(arg0);
    s32 sp0 = sub_0203769C();
    s32 var_r5 = 0;

    for (i = 0; i < temp_r7; i++) {
        if (sp0 != i) {
            u16* temp_r0 = sub_02037C44(i);
            if (temp_r0 != NULL) {
                if (temp_r0[0] == arg0->unk0[27]) {
                    var_r5++;
                } else {
                    arg0->unk5 = 27;
                }
            }
        } else {
            var_r5++;
        }
    }
    if (var_r5 == temp_r7) {
        arg0->unk5 = 17;
    }
    return 0;
}

s32 ov44_022348A8(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    sub_020398D4(1, 1);
    sub_02037AC0(18);
    arg0->unk5 = 18;
    return 0;
}

s32 ov44_022348C4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    if (sub_02037B38(18) != 0) {
        arg0->unk7 = 1;
        ov44_022342E0(arg0, arg1, heapID);
        return 1;
    }
    return 0;
}

// Stop looking for members?
s32 Wifi_PromptStopFindingMembers(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    Wifi_LoadAndPrintTextToWindowWrapper(&arg0->unk30, arg1, msg_0778_00120, heapID);
    arg0->unk5 = 20;
    return 0;
}

s32 ov44_02234904(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    arg0->unk30.listMenu2D = CreateYesNoMenu(arg0->unk30.bgConfig, &ov44_0223645C, 48U, 4, 1, heapID);
    arg0->unk5 = 21;
    return 0;
}

s32 ov44_02234944(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    s32 temp_r0;

    temp_r0 = Handle2dMenuInput_DeleteOnFinish(arg0->unk30.listMenu2D, heapID);
    if (temp_r0 != -1) {
        if (temp_r0 == 0) {
            arg0->unk5 = 22;
        } else if (ov44_02233E6C(arg0) != 0) {
            if (arg1->unk2 <= ov44_02233F64(arg0)) {
                arg0->unk5 = 8;
            } else {
                arg0->unk5 = 1;
            }
        } else {
            arg0->unk5 = 1;
        }
        arg0->unk30.listMenu2D = NULL;
    }
    return 0;
}

// If the leader drops out, the group will\nbe disbanded. Is that OK?
s32 Wifi_PromptDropAsLeader(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    Wifi_LoadAndPrintTextToWindowWrapper(&arg0->unk30, arg1, msg_0778_00121, heapID);
    arg0->unk5 = 23;
    return 0;
}

s32 ov44_022349B4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    arg0->unk30.listMenu2D = CreateYesNoMenu(arg0->unk30.bgConfig, &ov44_0223645C, 48, 4, 1, heapID);
    arg0->unk5 = 24;
    return 0;
}

s32 ov44_022349F4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    s32 temp_r0;

    temp_r0 = Handle2dMenuInput_DeleteOnFinish(arg0->unk30.listMenu2D, heapID);
    if (temp_r0 != -1) {
        if (temp_r0 == 0) {
            arg0->unk5 = 25;
        } else if (ov44_02233E6C(arg0) != 0) {
            if (arg1->unk2 <= ov44_02233F64(arg0)) {
                arg0->unk5 = 8;
            } else {
                arg0->unk5 = 1;
            }
        } else {
            arg0->unk5 = 1;
        }
        arg0->unk30.listMenu2D = NULL;
    }
    return 0;
}

// The member invitations will be canceled.
s32 Wifi_PromptCancelInvites(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    Wifi_LoadAndPrintTextToWindowWrapper(&arg0->unk30, arg1, msg_0778_00122, heapID);
    arg0->unk8 = 30;
    arg0->unk5 = 26;
    return 0;
}

s32 ov44_02234A68(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    s32 temp_r0;

    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    temp_r0 = arg0->unk8 - 1;
    arg0->unk8 = temp_r0;
    if (temp_r0 > 0) {
        return 0;
    }
    arg0->unk7 = 0;
    sub_02039358();
    ov44_02233FE8(arg0);
    sub_02039B58();
    sub_020398D4(0, 1);
    return 1;
}

s32 ov44_02234AA8(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    if (arg0->unk30.listMenu2D != NULL) {
        Clear2dMenuWindowAndDelete(arg0->unk30.listMenu2D, heapID);
        arg0->unk30.listMenu2D = NULL;
    }
    ov44_02233A34(&arg0->unk30);
    ov44_022342E0(arg0, arg1, heapID);
    arg0->unk5 = 28;
    return 0;
}

// A member had to drop out.\nPlease register from the start again.\r
s32 Wifi_PromptMemberDropped(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    Wifi_LoadAndPrintTextToWindowWrapper(&arg0->unk30, arg1, msg_0778_00118, heapID);
    arg0->unk5 = 29;
    ov44_02233FE8(arg0);
    ov44_02233EB4(arg0, arg1);
    if ((u32) (sub_020390C4() - 4) <= 1U) {
        ov00_021EDB1C();
    }
    return 0;
}

s32 ov44_02234B18(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    if ((u32) (sub_020390C4() - 4) <= 1) {
        ov00_021EDB1C();
    }
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    sub_02039358();
    sub_02039B58();
    ov44_02233FE8(arg0);
    arg0->unk7 = 0;
    sub_020398D4(0, 1);
    return 1;
}

s32 Wifi_PromptToggleVoiceChat(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    s32 strno;

    if (arg0->unk0[33] == 1) {
        // Is it OK to turn off the Voice Chat?
        strno = msg_0778_00125;
    } else {
        // Is it OK to turn on the Voice Chat?
        strno = msg_0778_00124;
    }
    Wifi_LoadAndPrintTextToWindowWrapper(&arg0->unk30, arg1, strno, heapID);
    arg0->unk5 = 31;
    return 0;
}

s32 ov44_02234B80(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    arg0->unk30.listMenu2D = Std_CreateYesNoMenu(arg0->unk30.bgConfig, &ov44_0223645C, 48, 4, heapID);
    arg0->unk5 = 32;
    return 0;
}

s32 ov44_02234BB4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    s32 temp_r0;

    temp_r0 = Handle2dMenuInput_DeleteOnFinish(arg0->unk30.listMenu2D, heapID);
    if (temp_r0 != -1) {
        if (temp_r0 == 0) {
            ov44_02233D38(arg0, heapID);
            ov44_022340B4(arg0);
        }
        arg0->unk5 = 1;
        arg0->unk30.listMenu2D = NULL;
    }
    return 0;
}

s32 ov44_02234BF0(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    sub_02034434();
    sub_020398D4(0, 1);
    ov44_02234440(arg0);
    arg0->unk5 = 1;
    return 0;
}

s32 ov44_02234C10(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    ov44_02233F6C(arg0, heapID);
    if (sub_020373B4(0) == 0) {
        ov44_02234450(arg0);
        arg0->unk5 = 15;
    } else if (sub_02034750(0) != 0) {
        ov44_02234450(arg0);
        arg0->unk5 = 2;
    }
    return 0;
}

// Awaiting {STRVAR_1 3, 0, 0}’s response...
s32 Wifi_PromptAwaitingResponse(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    ov44_02233F6C(arg0, heapID);
    ov44_02233C88(&arg0->unk30, arg1, 0, 0, heapID);
    Wifi_LoadAndPrintTextToWindowWrapper(&arg0->unk30, arg1, msg_0778_00114, heapID);
    ov44_022342B8(arg0);
    arg0->unk5 = 3;
    return 0;
}

s32 ov44_02234C88(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    u8 temp_r0;

    ov44_02233F6C(arg0, heapID);
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    if (arg0->unk13 != 0) {
        ov44_022342E0(arg0, arg1, heapID);
        temp_r0 = arg0->unk13;
        switch (temp_r0) {
        case 1:
            arg0->unk5 = 4;
            break;
        case 2:
            arg0->unk5 = 6;
            arg0->unk2D = 116;
            break;
        case 3:
            arg0->unk5 = 6;
            arg0->unk2D = 132;
            break;
        }
    }
    return 0;
}

// {STRVAR_1 3, 0, 0} approved your\nmember-registration request.
s32 ov44_02234CE8(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    ov44_02233C88(&arg0->unk30, arg1, 0, 0, heapID);

    Wifi_LoadAndPrintTextToWindow(&arg0->unk30, arg1, msg_0778_00115, 30, heapID);
    arg0->unk5 = 5;
    ov44_022340BC(arg0, sub_0203769C(), HEAP_ID_103);
    return 0;
}

s32 ov44_02234D28(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    ov44_02233F6C(arg0, heapID);
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    arg0->unk5 = 8;
    return 0;
}

s32 ov44_02234D4C(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    ov44_02233C88(&arg0->unk30, arg1, 0, 0, heapID);
    Wifi_LoadAndPrintTextToWindowWrapper(&arg0->unk30, arg1, arg0->unk2D, heapID);
    arg0->unk5 = 7;
    sub_02039358();
    sub_02039B58();
    return 0;
}

s32 ov44_02234D88(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    arg0->unk7 = 0;
    sub_020398D4(0, 1);
    return 1;
}

// Awaiting other members.
s32 Wifi_PromptAwaitingMembers(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    ov44_02233F6C(arg0, heapID);
    Wifi_LoadAndPrintTextToWindowWrapper(&arg0->unk30, arg1, msg_0778_00123, heapID);
    ov44_022342B8(arg0);
    arg0->unk5 = 9;
    if (arg0->unk0[33] == 1) {
        ov44_02233F3C(arg0);
    }
    return 0;
}

s32 ov44_02234DE4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    ov44_02233F6C(arg0, heapID);
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    arg0->unk5 = 10;
    return 0;
}

// Communicating. Please stand by...
s32 ov44_02234E08(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    ov44_02233F6C(arg0, heapID);
    if (arg0->unk12 != 0) {
        arg0->unk12 = 0U;
        if (arg0->unk0[33] == 1) {
            ov44_02233F20(arg0);
            ov44_02233F3C(arg0);
        }
        ov44_022340B4(arg0);
    }
    if (ov44_0223442C(arg0) == 1) {
        sub_02037BEC();
        sub_02037AC0(14);
        ov44_022342E0(arg0, arg1, heapID);
        Wifi_LoadAndPrintTextToWindowWrapper(&arg0->unk30, arg1, msg_0778_00102, heapID);
        ov44_02234440(arg0);
        arg0->unk8 = 300;
        ov44_022342B8(arg0);
        arg0->unk5 = 11;
    } else if (1024 & gSystem.newKeys) {
        ov44_022342E0(arg0, arg1, heapID);
        arg0->unk5 = 18;
    }
    return 0;
}

s32 ov44_02234EA4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    s32 temp_r0;

    if (sub_02037B38(14) != 0) {
        s16 subroutine_arg0 = (s16) arg0->unk0[27];
        if (ov44_02233F64(arg0) != sub_02037454()) {
            temp_r0 = arg0->unk8 - 1;
            arg0->unk8 = temp_r0;
            if (temp_r0 <= 0) {
                arg0->unk5 = 15;
            }
            return 0;
        }
        if (sub_02037C0C(sub_0203769C(), &subroutine_arg0) == 1) {
            arg0->unk5 = 12;
        }
    }
    return 0;
}

s32 ov44_02234EF4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    s32 i = 0;
    s32 temp_r7 = ov44_02233F64(arg0);
    s32 sp0 = sub_0203769C();
    s32 var_r5 = 0;
    
    for (i = 0; i < temp_r7; i++) {
        if (sp0 != i) {
            u16* temp_r0 = sub_02037C44(i);
            if (temp_r0 != NULL) {
                if (temp_r0[0] == arg0->unk0[27]) {
                    var_r5++;
                } else {
                    arg0->unk5 = 0xF;
                }
            }
        } else {
            var_r5++;
        }
    }

    if (var_r5 == temp_r7) {
        arg0->unk5 = 0xD;
    }
    return 0;
}

s32 ov44_02234F44(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    sub_020398D4(1, 1);
    sub_02037AC0(18);
    arg0->unk5 = 14;
    return 0;
}

s32 ov44_02234F60(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    if (sub_02037B38(18) != 0) {
        ov44_022342E0(arg0, arg1, heapID);
        arg0->unk7 = 1;
        return 1;
    }
    return 0;
}

s32 ov44_02234F88(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    if (arg0->unk30.listMenu2D != NULL) {
        Clear2dMenuWindowAndDelete(arg0->unk30.listMenu2D, heapID);
        arg0->unk30.listMenu2D = NULL;
    }
    ov44_02233A34(&arg0->unk30);
    ov44_022342E0(arg0, arg1, heapID);
    arg0->unk5 = 16;
    return 0;
}

// A member had to drop out.\nPlease register from the start again.\r
s32 Wifi_PromptMemberDrop(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    Wifi_LoadAndPrintTextToWindowWrapper(&arg0->unk30, arg1, msg_0778_00118, heapID);
    arg0->unk5 = 17;
    return 0;
}

s32 ov44_02234FDC(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    sub_02039358();
    sub_02039B58();
    arg0->unk7 = 0;
    sub_020398D4(0, 1);
    return 1;
}

s32 Wifi_PromptToggleVoiceChat_(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    s32 strno;

    ov44_02233F6C(arg0, heapID);
    if (arg0->unk0[33] == 1) {
        // Is it OK to turn off the Voice Chat?
        strno = msg_0778_00125;
    } else {
        // Is it OK to turn on the Voice Chat?
        strno = msg_0778_00124;
    }
    Wifi_LoadAndPrintTextToWindowWrapper(&arg0->unk30, arg1, strno, heapID);
    arg0->unk5 = 19;
    return 0;
}

s32 ov44_02235038(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    ov44_02233F6C(arg0, heapID);
    if (ov44_0223442C(arg0) == 1) {
        arg0->unk5 = 10;
        ov44_02233954(&arg0->unk30);
        return 0;
    }
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    arg0->unk30.listMenu2D = Std_CreateYesNoMenu(arg0->unk30.bgConfig, &ov44_0223645C, 48, 4, heapID);
    arg0->unk5 = 20;
    return 0;
}

s32 ov44_02235090(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    s32 temp_r0;

    ov44_02233F6C(arg0, heapID);
    if (ov44_0223442C(arg0) == 1) {
        arg0->unk5 = 10;
        ov44_02233954(&arg0->unk30);
        Clear2dMenuWindowAndDelete(arg0->unk30.listMenu2D, heapID);
        arg0->unk30.listMenu2D = 0;
        return 0;
    }
    temp_r0 = Handle2dMenuInput_DeleteOnFinish(arg0->unk30.listMenu2D, heapID);
    if (temp_r0 != -1) {
        if (temp_r0 == 0) {
            ov44_02233D38(arg0, heapID);
            ov44_022340B4(arg0);
        }
        arg0->unk5 = 8;
        arg0->unk30.listMenu2D = 0;
    }
    return 0;
}

// The leader appears busy.\nPlease apply again.\r
s32 ov44_02235100(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    arg0->unk26 = sub_02034870(0);
    if (arg0->unk26 == 32) {
        GF_AssertFail();
    }
    ov44_02233C88(&arg0->unk30, arg1, 0, 0, heapID);
    sub_02039358();
    arg0->unk27 = 0;
    Wifi_LoadAndPrintTextToWindowWrapper(&arg0->unk30, arg1, msg_0778_00132, heapID);
    arg0->unk5 = 22;
    return 0;
}

s32 ov44_02235158(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    arg0->unk30.listMenu2D = Std_CreateYesNoMenu(arg0->unk30.bgConfig, &ov44_0223645C, 48, 4, heapID);
    arg0->unk5 = 23;
    return 0;
}

s32 ov44_0223518C(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    s32 temp_r0;
    s8 var_r0;

    temp_r0 = Handle2dMenuInput_DeleteOnFinish(arg0->unk30.listMenu2D, heapID);
    if (temp_r0 != -1) {
        if (temp_r0 == 0) {
            var_r0 = 24;
        } else {
            var_r0 = 29;
        }
        arg0->unk5 = var_r0;
        arg0->unk30.listMenu2D = 0;
    }
    return 0;
}

// Communicating with {STRVAR_1 3, 0, 0}...
s32 ov44_022351BC(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    Wifi_LoadAndPrintTextToWindowWrapper(&arg0->unk30, arg1, msg_0778_00017, heapID);
    ov44_022342B8(arg0);
    arg0->unk8 = 90;
    arg0->unk5 = 25;
    return 0;
}

s32 ov44_022351DC(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    if (arg0->unk8 > 0) {
        arg0->unk8 = arg0->unk8 - 1;
        return 0;
    }
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    if (ov44_02233E80(arg0->unk26, arg1->unk0) != 0) {
        arg0->unk5 = 26;
    }
    return 0;
}

s32 ov44_02235218(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    ov44_02233E48(arg0);
    if ((sub_020390C4() == 1) && (sub_020373B4(0) == 1)) {
        sub_020378E4(0);
        ov44_022342E0(arg0, arg1, heapID);
        BeginNormalPaletteFade(3, 0, 0, RGB_BLACK, 6, 1, heapID);
        arg0->unk5 = 27;
    }
    return 0;
}

s32 ov44_02235268(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    u8* temp_r0;
    
    if (IsPaletteFadeFinished() != 0) {
        sub_02034354(arg1->unk8, 0);
        arg0->unk27 = 1;
        ov44_02234204(arg0);
        FreeStructOv44_02235340(arg0, heapID);
        arg0 = arg0;
        memset(&arg0->unk30, 0, 504);
        ov44_02234028(arg0);
        ov44_022331C4(arg0, arg1, heapID);
        sub_0203A880();
        arg0->unk12 = 0;
        arg0->unk13 = 0;
        temp_r0 = arg0->unk14;
        arg0->unk14[0] = 0;
        temp_r0[1] = 0;
        temp_r0[2] = 0;
        temp_r0[3] = 0;
        temp_r0 = arg0->unk18;
        arg0->unk18[0] = 0;
        temp_r0[1] = 0;
        temp_r0[2] = 0;
        temp_r0[3] = 0;
        MI_CpuFill8(&arg0->unk1C, 1, 4);
        MI_CpuFill8(&arg0->unk20, 1, 4);
        temp_r0 = arg0->unk28;
        arg0->unk24 = 0;
        arg0->unk26 = 0;
        arg0->unk28[0] = 0;
        temp_r0[1] = 0;
        temp_r0[2] = 0;
        temp_r0[3] = 0;
        BeginNormalPaletteFade(3, 1, 1, RGB_BLACK, 6, 1, heapID);
        arg0->unk5 = 28;
    }
    return 0;
}


s32 ov44_0223532C(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    if (IsPaletteFadeFinished() != 0) {
        arg0->unk5 = 0;
    }
    return 0;
}

s32 ov44_02235340(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID) {
    sub_02039358();
    sub_02039B58();
    arg0->unk7 = 0;
    sub_020398D4(0, 1);
    return 1;
}