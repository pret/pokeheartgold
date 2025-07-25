#include <nitro/fs/overlay.h>
#pragma once
.public RegisterMainOverlay
.public CopyU16StringArrayN
.public TextFlags_SetCanABSpeedUpPrint
.public TextFlags_SetCanTouchSpeedUpPrint
.public FontID_Alloc
.public FontID_Release
.public FontID_String_GetWidth
.public LoadFontPal0
.public LoadFontPal1
.public FontID_String_GetCenterAlignmentX
.public Sound_SetSceneAndPlayBGM
.public PlayBGM
.public GF_SndStartFadeOutBGM
.public PlaySE
.public IsSEPlaying
.public PlayFanfare
.public sub_02006B84
.public IsFanfarePlaying
.public OverlayManager_New
.public OverlayManager_Delete
.public OverlayManager_CreateAndGetData
.public OverlayManager_GetData
.public OverlayManager_FreeData
.public OverlayManager_GetArgs
.public OverlayManager_Run
.public ReadWholeNarcMemberByIdPair
.public AllocAndReadWholeNarcMemberByIdPair
.public NARC_New
.public NARC_Delete
.public NARC_AllocAndReadWholeMember
.public GfGfxLoader_LoadCharData
.public GfGfxLoader_LoadScrnData
.public GfGfxLoader_GXLoadPal
.public GfGfxLoader_GetCharData
.public GfGfxLoader_LoadFromNarc
.public GfGfxLoader_LoadCharDataFromOpenNarc
.public GfGfxLoader_LoadScrnDataFromOpenNarc
.public GfGfxLoader_GXLoadPalFromOpenNarc
.public CreateSpriteResourcesHeader
.public G2dRenderer_Init
.public G2dRenderer_SetSubSurfaceCoords
.public Create2DGfxResObjMan
.public Destroy2DGfxResObjMan
.public AddCharResObjFromNarc
.public AddPlttResObjFromNarc
.public AddCellOrAnimResObjFromNarc
.public sub_0200ADA4
.public sub_0200AEB0
.public sub_0200AF00
.public sub_0200AF94
.public sub_0200B0A8
.public SpriteTransfer_GetPaletteProxy
.public OamManager_Create
.public OamManager_Free
.public NewMsgDataFromNarc
.public DestroyMsgData
.public NewString_ReadMsgData
.public GetSpeciesNameIntoArray
.public ReadMsgData_ExpandPlaceholders
.public GetSpeciesName
.public MessageFormat_New
.public MessageFormat_New_Custom
.public MessageFormat_Delete
.public BufferString
.public BufferSpeciesName
.public BufferBoxMonNickname
.public BufferIntegerAsString
.public BufferItemName
.public BufferPokewalkerCourseName
.public StringExpandPlaceholders
.public SpriteSystem_Alloc
.public SpriteManager_New
.public SpriteSystem_GetRenderer
.public SpriteSystem_Init
.public SpriteSystem_InitSprites
.public SpriteSystem_DrawSprites
.public SpriteSystem_TransferOam
.public SpriteSystem_Free
.public SpriteSystem_InitManagerWithCapacities
.public SpriteSystem_LoadCharResObjFromOpenNarc
.public SpriteSystem_LoadPlttResObjFromOpenNarc
.public SpriteSystem_LoadCellResObjFromOpenNarc
.public SpriteSystem_LoadAnimResObjFromOpenNarc
.public SpriteSystem_NewSprite
.public SpriteSystem_NewSpriteWithYOffset
.public SpriteSystem_FreeResourcesAndManager
.public Sprite_DeleteAndFreeResources
.public ManagedSprite_SetAnim
.public ManagedSprite_SetAnimNoRestart
.public ManagedSprite_GetActiveAnim
.public ManagedSprite_SetAnimateFlag
.public ManagedSprite_IsAnimated
.public ManagedSprite_ResetSpriteAnimCtrlState
.public ManagedSprite_SetAnimationFrame
.public thunk_Sprite_SetDrawFlag
.public ManagedSprite_SetDrawFlag
.public ManagedSprite_GetDrawFlag
.public ManagedSprite_SetPaletteOverride
.public ManagedSprite_SetPriority
.public ManagedSprite_SetDrawPriority
.public ManagedSprite_SetPositionXY
.public ManagedSprite_SetPositionXYWithSubscreenOffset
.public ManagedSprite_GetPositionXY
.public ManagedSprite_SetAffineOverwriteMode
.public ManagedSprite_SetOamMode
.public SysTask_CreateOnMainQueue
.public SysTask_Destroy
.public LoadUserFrameGfx2
.public DrawFrameAndWindow2
.public WaitingIcon_New
.public sub_0200F450
.public BeginNormalPaletteFade
.public IsPaletteFadeFinished
.public sub_0200FBDC
.public sub_02014494
.public sub_02014540
.public sub_020145B4
.public GF_RTC_TimeToSec
.public GF_RTC_DateTimeToSec
.public MailMsg_Copy
.public Main_SetVBlankIntrCB
.public HBlankInterruptDisable
.public SetKeyRepeatTimers
.public sub_0201A728
.public sub_0201A738
.public CreateHeap
.public DestroyHeap
.public AllocFromHeap
.public AllocFromHeapAtEnd
.public Heap_Free
.public Heap_FreeExplicit
.public BgConfig_Alloc
.public SetBothScreensModesAndDisable
.public InitBgFromTemplate
.public FreeBgTilemapBuffer
.public ToggleBgLayer
.public BgSetPosTextAndCommit
.public BgCommitTilemapBufferToVram
.public BG_ClearCharDataRange
.public BG_FillCharDataRange
.public FillBgTilemapRect
.public BgClearTilemapBufferAndCommit
.public AddWindowParameterized
.public AddWindow
.public RemoveWindow
.public CopyWindowToVram
.public ClearWindowTilemapAndCopyToVram
.public FillWindowPixelBuffer
.public GetWindowWidth
.public DoScheduledBgGpuUpdates
.public GF_SinDeg
.public GF_CosDeg
.public SetLCRNGSeed
.public LCRandom
.public MTRandom
.public GF_CalcCRC16
.public TextPrinterCheckActive
.public AddTextPrinterParameterized
.public AddTextPrinterParameterizedWithColor
.public GF_CreateVramTransferManager
.public GF_DestroyVramTransferManager
.public GF_RunVramTransferTasks
.public sub_020210BC
.public sub_02021148
.public sub_02021238
.public ObjCharTransfer_Init
.public ObjCharTransfer_Destroy
.public ObjCharTransfer_ClearBuffers
.public ObjPlttTransfer_Init
.public ObjPlttTransfer_Destroy
.public ObjPlttTransfer_Reset
.public GfGfx_SetBanks
.public GfGfx_DisableEngineAPlanes
.public GfGfx_EngineATogglePlanes
.public GfGfx_DisableEngineBPlanes
.public GfGfx_EngineBTogglePlanes
.public GfGfx_SwapDisplay
.public SpriteList_Delete
.public SpriteList_RenderAndAnimateSprites
.public Sprite_CreateAffine
.public Sprite_Delete
.public Sprite_SetDrawFlag
.public Sprite_SetAnimActiveFlag
.public Sprite_SetAnimCtrlSeq
.public Sprite_SetPriority
.public Sprite_GetImageProxy
.public Sprite_GetPaletteProxy
.public Sprite_GetVramType
.public TouchscreenHitbox_FindRectAtTouchNew
.public TouchscreenHitbox_TouchNewIsIn
.public GF_AssertFail
.public String_New
.public String_Delete
.public String_Copy
.public String_GetLength
.public CopyU16ArrayToString
.public CopyU16ArrayToStringN
.public CopyStringToU16Array
.public String_Cat
.public String_AddChar
.public SaveArray_PCStorage_Get
.public SaveGameNormal
.public Save_ClearStatusFlags
.public Save_PlayerData_GetProfile
.public Save_PlayerData_GetOptionsAddr
.public PlayerProfile_GetNamePtr
.public PlayerProfile_GetPlayerName_NewString
.public PlayerProfile_GetTrainerID
.public PlayerProfile_GetTrainerGender
.public PlayerProfile_GetAvatar
.public PlayerProfile_GetVersion
.public PlayerProfile_GetLanguage
.public Pokedex_SetMonSeenFlag
.public Pokedex_SetMonCaughtFlag
.public Pokedex_GetNatDexFlag
.public Save_Pokedex_Get
.public Options_GetTextFrameDelay
.public Options_GetFrame
.public sub_0202D660
.public Save_Pokewalker_Get
.public sub_02032624
.public sub_0203263C
.public sub_02032644
.public sub_02032650
.public sub_02032674
.public sub_02032688
.public sub_020326A4
.public Pokewalker_SetBoxMon
.public Pokewalker_ClearBoxMon
.public Pokewalker_TryGetBoxMon
.public sub_02032718
.public sub_02032720
.public sub_02032728
.public Pokewalker_CourseIsUnlocked
.public Pokewalker_UnlockCourse
.public sub_02032764
.public sub_0203276C
.public Save_TrainerHouse_Get
.public TrainerHouseSet_SetZero
.public TrainerHouseSet_CheckHasData
.public TrainerHouseTrainer_Compare
.public LocalFieldData_GetCurrentPosition
.public Save_LocalFieldData_Get
.public Save_VarsFlags_Get
.public Save_VarsFlags_CheckFlagInArray
.public Save_VarsFlags_SetFlagInArray
.public Save_VarsFlags_ClearFlagInArray
.public SpeciesToOverworldModelIndexOffset
.public OverworldModelLookupFormCount
.public OverworldModelLookupHasFemaleForm
.public ZeroMonData
.public AllocMonZeroed
.public AcquireBoxMonLock
.public ReleaseBoxMonLock
.public CreateMon
.public CalcMonLevelAndStats
.public GetMonData
.public GetBoxMonData
.public SetMonData
.public SetBoxMonData
.public AllocAndLoadMonPersonal_HandleAlternateForm
.public AllocAndLoadMonPersonal
.public GetPersonalAttr
.public FreeMonPersonal
.public CalcBoxMonExpToNextLevel
.public MonApplyFriendshipMod
.public GetBoxMonGender
.public MonIsShiny
.public BoxMonIsShiny
.public GetBoxmonSpriteCharAndPlttNarcIds
.public GetMonSpriteCharAndPlttNarcIdsEx
.public sub_02070438
.public Mon_GetBoxMon
.public CopyBoxPokemonToPokemon
.public Mon_UpdateShayminForm
.public ChangePersonalityToNatureGenderAndAbility
.public PCStorage_PlaceMonInBoxByIndexPair
.public PCStorage_DeleteBoxMonByIndexPair
.public PCStorage_FindFirstEmptySlot
.public PCStorage_CountEmptySpotsInAllBoxes
.public PCStorage_GetBoxName
.public PCStorage_CountMonsInAllBoxes
.public PCStorage_GetMonByIndexPair
.public Boxmon_GetIconNaix
.public GetMonIconNaixEx
.public GetMonIconPaletteEx
.public sub_02074490
.public Party_GetCount
.public Party_GetMonByIndex
.public SaveArray_Party_Get
.public GetItemNameIntoString
.public Bag_AddItem
.public Save_Bag_Get
.public BoxMonSetTrainerMemo
.public sub_020932E0
.public sub_02093354
.public sub_02093440
.public sub_02093594
.public sub_020935E0
.public sub_02093A40
.public NNS_G2dGetUnpackedPaletteData
.public NNS_G2dInitOamManagerModule
.public NNS_G2dGetImageLocation
.public NNS_G2dGetImagePaletteLocation
.public NNS_G3dGetTex
.public G2x_SetBlendAlpha_
.public GX_LoadOBJPltt
.public GXS_LoadOBJPltt
.public GX_LoadOBJ
.public GXS_LoadOBJ
.public OS_CreateThread
.public OS_KillThread
.public OS_WakeupThreadDirect
.public OS_Sleep
.public OS_InitMessageQueue
.public OS_InitMutex
.public OS_LockMutex
.public OS_UnlockMutex
.public DC_FlushRange
.public OS_GetTick
.public OS_GetOwnerRtcOffset
.public OS_GetLowEntropyData
.public OS_Halt
.public MIi_CpuCopy16
.public MIi_CpuClearFast
.public MIi_CpuCopyFast
.public MI_CpuFill8
.public MI_CpuCopy8
.public MI_CompressLZImpl
.public RTC_GetDate
.public RTC_GetTime
.public RTC_GetDateTime
.public RTC_ConvertDateTimeToSecond
.public RTC_ConvertSecondToDateTime
.public CARD_SetSpiReadWaitCycles
.public CARD_SetSpiWriteWaitCycles
.public CARD_SpiWaitInit
.public CARD_SpiWaitReadRange
.public CARD_SpiWaitWriteRange
.public CARD_SpiWaitGetStatus
.public MATH_QSort
.public memset
.public _fdiv
.public _f_ulltof
.public _ll_udiv
.public _s32_div_f
.public _u32_div_f
.public gSystem
.public gApplication_TitleScreen
.public ov112_App_MainMenu_SelectOption_ConnectToPokewalker
