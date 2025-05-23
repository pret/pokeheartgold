#include "register_hall_of_fame.h"

#include "global.h"

#include "constants/map_sections.h"
#include "constants/sndseq.h"

#include "data/mmodel/mmodel.naix"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0180.h"

#include "bg_window.h"
#include "camera.h"
#include "follow_mon.h"
#include "font.h"
#include "gf_3d_vramman.h"
#include "gf_gfx_loader.h"
#include "gf_gfx_planes.h"
#include "heap.h"
#include "math_util.h"
#include "message_format.h"
#include "msgdata.h"
#include "overlay_manager.h"
#include "pokemon.h"
#include "pokepic.h"
#include "sound_02004A44.h"
#include "sprite_system.h"
#include "sys_task_api.h"
#include "system.h"
#include "text.h"
#include "touchscreen.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"
#include "unk_02013FDC.h"
#include "unk_02026E84.h"
#include "unk_0206D494.h"

typedef enum RegisterHallOfFameScene {
    REGHOF_SCENE_WAIT_FADE,
    REGHOF_SCENE_WAIT_SUBPROC,
    REGHOF_SCENE_INDIV_MONS_INIT,
    REGHOF_SCENE_INDIV_MONS_MAIN,
    REGHOF_SCENE_INDIV_MONS_EXIT,
    REGHOF_SCENE_WHOLE_PARTY_INIT,
    REGHOF_SCENE_WHOLE_PARTY_MAIN,
    REGHOF_SCENE_WHOLE_PARTY_EXIT,
    REGHOF_SCENE_MAX,
} RegisterHallOfFameScene;

typedef enum RegisterHallOfFameIndivMonsSubscene {
    REGHOF_INDIV_SUBSCENE_RESET,
    REGHOF_INDIV_SUBSCENE_SETUP,
    REGHOF_INDIV_SUBSCENE_PLAY,
    REGHOF_INDIV_SUBSCENE_INCREMENT,
    REGHOF_INDIV_SUBSCENE_EXIT,
} RegisterHallOfFameIndivMonsSubscene;

typedef enum RegisterHallOfFameWholePartySubscene {
    REGHOF_WHOLE_SUBSCENE_INIT,
    REGHOF_WHOLE_SUBSCENE_MAIN,
    REGHOF_WHOLE_SUBSCENE_EXIT,
} RegisterHallOfFameWholePartySubscene;

typedef enum RegisterHallOfFameWholePartyExitSubscene {
    REGHOF_WHOLEEXIT_SUBSCENE_INIT,
    REGHOF_WHOLEEXIT_SUBSCENE_MAIN,
    REGHOF_WHOLEEXIT_SUBSCENE_EXIT,
} RegisterHallOfFameWholePartyExitSubscene;

typedef enum RegisterHallOfFameSilhouettePal {
    REGHOF_SILHOUETTE_PAL_BLACK,
    REGHOF_SILHOUETTE_PAL_WHITE,
    REGHOF_SILHOUETTE_PAL_RED,
} RegisterHallOfFameSilhouettePal;

typedef enum RegisterHallOfFamePicIdx_Indiv {
    REGHOF_PIC_INDIV_FRONT,
    REGHOF_PIC_INDIV_FRONT_SHADOW,
    REGHOF_PIC_INDIV_BACK,
    REGHOF_PIC_INDIV_BACK_SHADOW,
    REGHOF_PIC_INDIV_OWSPRITE,
    REGHOF_PIC_INDIV_OWSPRITE_SHADOW,
} RegisterHallOfFamePicIdx_Indiv;

typedef enum RegisterHallOfFamePicIdx_WholeParty {
    REGHOF_PIC_WHOLE_MON1,
    REGHOF_PIC_WHOLE_MON2,
    REGHOF_PIC_WHOLE_MON3,
    REGHOF_PIC_WHOLE_MON4,
    REGHOF_PIC_WHOLE_MON5,
    REGHOF_PIC_WHOLE_MON6,
    REGHOF_PIC_WHOLE_MON1_SHADOW,
    REGHOF_PIC_WHOLE_MON2_SHADOW,
    REGHOF_PIC_WHOLE_MON3_SHADOW,
    REGHOF_PIC_WHOLE_MON4_SHADOW,
    REGHOF_PIC_WHOLE_MON5_SHADOW,
    REGHOF_PIC_WHOLE_MON6_SHADOW,
    REGHOF_PIC_WHOLE_PLAYER,
    REGHOF_PIC_WHOLE_PLAYER_SHADOW,
    REGHOF_PIC_WHOLE_TWINKLE,

    REGHOF_PIC_WHOLE_MON = 0,
    REGHOF_PIC_WHOLE_MON_SHADOW = 6,
} RegisterHallOfFamePicIdx_WholeParty;

typedef enum RegisterHallOfFame_IndivMonsScene_SubprocState {
    REGHOF_INDIV_SUBPROC_FLY_IN_BACKPIC,
    REGHOF_INDIV_SUBPROC_BACKPIC_CRY,
    REGHOF_INDIV_SUBPROC_HOLD_BACKPIC,
    REGHOF_INDIV_SUBPROC_FLY_IN_OVERWORLD_SPRITE,
    REGHOF_INDIV_SUBPROC_ANIM_OVERWORLD_SPRITE,
    REGHOF_INDIV_SUBPROC_HOLD_OVERWORLD_SPRITE,
    REGHOF_INDIV_SUBPROC_SHOW_HEADER_WINDOW,
    REGHOF_INDIV_SUBPROC_HOLD_HEADER_WINDOW,
    REGHOF_INDIV_SUBPROC_FLY_IN_FRONTPIC,
    REGHOF_INDIV_SUBPROC_SILHOUETTE_BACKPIC_OVERWORLD_SPRITES,
    REGHOF_INDIV_SUBPROC_HOLD_FRONTPIC,
    REGHOF_INDIV_SUBPROC_PRINT_MON_SPECIES_LEVEL_GENDER_AND_CRY,
    REGHOF_INDIV_SUBPROC_HOLD_MON_SPECIES_LEVEL_GENDER,
    REGHOF_INDIV_SUBPROC_PRINT_MON_CAUGHT_DETAIL,
    REGHOF_INDIV_SUBPROC_HOLD_MON_CAUGHT_DETAIL,
    REGHOF_INDIV_SUBPROC_FLY_OUT,
    REGHOF_INDIV_SUBPROC_TAIL_DELAY,
} RegisterHallOfFame_IndivMonsScene_SubprocState;

typedef enum RegisterHallOfFame_WholePartyScene_SubprocState {
    REGHOF_WHOLE_SUBPROC_INITIAL_DELAY,
    REGHOF_WHOLE_SUBPROC_FLY_IN_MONS,
    REGHOF_WHOLE_SUBPROC_DELAY_AFTER_FLY_IN,
    REGHOF_WHOLE_SUBPROC_REQUEST_FIRST_PHOTO_FLASH,
    REGHOF_WHOLE_SUBPROC_ANIMATE_MONS_SHADOWS,
    REGHOF_WHOLE_SUBPROC_WAIT_BUTTON,
    REGHOF_WHOLE_SUBPROC_SECOND_PHOTO_FLASH,
    REGHOF_WHOLE_SUBPROC_WAIT_FINAL_FADEOUT,
} RegisterHallOfFame_WholePartyScene_SubprocState;

typedef enum RegisterHallOfFame_MetLocationType {
    REGHOF_METLOC_CAUGHT,
    REGHOF_METLOC_HATCHED,
    REGHOF_METLOC_TRADED,
    REGHOF_METLOC_KANTO,
    REGHOF_METLOC_HOENN,
    REGHOF_METLOC_SINNOH,
    REGHOF_METLOC_ORRE,
    REGHOF_METLOC_FATEFUL,
    REGHOF_METLOC_SHUCKIE,
    REGHOF_METLOC_KENYA,
} RegisterHallOfFame_MetLocationType;

typedef struct RegisterHofMon {
    Pokemon *mon;
    u8 followPokeParam[4];
    u32 personality;
    u16 species;
    u16 level;
    u8 form;
    u8 gender;
    u8 printGender;
    u8 yOffset;
    u32 metLocation;
    int partyIndex;
    PokepicAnimScript frontspriteAnim[10];
    PokepicAnimScript backspriteAnim[10];
    u16 frontspriteCharbuf[2][1600];
    u16 backspriteCharbuf[2][1600];
    u16 plttBak[16];
} RegisterHofMon;

typedef struct RegisterHallOfFameData RegisterHallOfFameData;

typedef BOOL (*RegisterHallOfFameSubprocCallback)(RegisterHallOfFameData *);

struct RegisterHallOfFameData {
    RegisterHallOfFameArgs *args; // 00000
    SysTask *vblankTask;          // 00004
    RegisterHallOfFameSubprocCallback subprocCallback;
    u16 subprocTimer;
    u16 subprocStage;
    BgConfig *bgConfig; // 00010
    Window windows[7];
    MsgData *msgData;         // 00084
    MessageFormat *msgFormat; // 00088
    String *strbuf1;
    String *strbuf2;
    NARC *narcA101;
    NARC *narcA180;
    SpriteSystem *spriteRenderer;    // 0009C
    SpriteManager *spriteGfxHandler; // 000A0
    ManagedSprite *monPics[15];
    Camera *camera;
    VecFx32 cameraTarget;
    CameraAngle cameraAngle;
    SysTask *spotlightsTask;
    SysTask *confettiTask;
    RegisterHofMon mons[PARTY_SIZE];
    u32 numMons;
    RegisterHallOfFameScene currentScene; // 1304C
    RegisterHallOfFameScene nextScene;    // 13050
    u16 sceneSubstep;
    u16 curMonIndex;
    f32 unk_13058;
    f32 unk_1305C;
    u32 requestUnsilhouetteFrontpic : 1;
    u32 requestUnsilhouetteBackpic : 1;
    u32 requestBeginSpotlightsAndConfetti : 1;
    u32 requestPlayFlashKanseiSfx : 1;
    u32 unk_13060_4 : 1;
    u32 scrollingPolkadotBackground : 1;
    u32 generatingConfetti : 1;
    int fadeDuration;
    u16 generateConfettiDelayLength;
    u16 generateConfettiDelayTimer;
};

typedef struct RegisterHofSpotlightTaskData {
    GXDLInfo gxDlInfo;
    u8 gxCommand[0x800];
    u32 gxCommandLength;
    SysTask *childTasks[8];
    SysTask *endMakeDLTask;
    int numSpotlights;
    RegisterHallOfFameData *parent;
} RegisterHofSpotlightTaskData;

typedef struct RegisterHofSpotlightChildTaskData {
    RegisterHofSpotlightTaskData *parent;
    u8 filler_004[0x800]; // scrapped feature?
    int unused_804;
    fx32 angle;
    fx32 speed;
    int color;
    int polygonId;
    fx16 xOffset;
    VecFx16 vertices[5];
} RegisterHofSpotlightChildTaskData;

typedef struct RegHOFConfettiParticle {
    u32 color;
    u8 filler_04[0x4];
    VecFx16 unk_08[4];
    VecFx16 unk_20;
    VecFx16 unk_26;
    MtxFx44 translationMat;
    u32 unk_6C;
} RegHOFConfettiParticle;

typedef struct RegisterHofConfettiEmitterTaskData {
    BOOL active;
    BOOL requestPushGxCommand;
    RegHOFConfettiParticle particles[48];
    GXDLInfo gxDlInfo;
    u8 gxCommand[0x7800];
    u32 gxCommandLength;
    BOOL unk_8D20; // scrapped feature?
    u8 filler_8D24[0x40];
} RegisterHofConfettiEmitterTaskData;

typedef struct RegHOFSpritePosScaleAnimParam {
    s16 xStart;
    s16 yStart;
    s16 xEnd;
    s16 yEnd;
    f32 scaleStart;
    f32 scaleEnd;
} RegHOFSpritePosScaleAnimParam;

typedef struct RegisterHofTaskData_IndivMonAnimAndCry {
    RegisterHofMon *hofMon;
    PokepicAnim anim;
    NARC *narc;
    u16 (*charbuf)[1600];
    u32 imageLocation;
    u16 isFrontpic;
    BOOL startCry;
} RegisterHofTaskData_IndivMonAnimAndCry;

static void RegisterHallOfFame_SetGfxBanks(void);
static void VBlankTask_RegisterHallOfFame_IndividualMonsCongrats(SysTask *task, void *taskData);
static void RegisterHallOfFame_ReplaceSpriteChar(const void *pSrc, u32 offset, u32 size);
static void RegisterHallOfFame_ReplaceSpritePltt(const void *pSrc, u32 offset, u32 size);
static void RegisterHallOfFame_CreateBgConfig(RegisterHallOfFameData *data);
static void RegisterHallOfFame_DestroyBgConfig(RegisterHallOfFameData *data);
static void RegisterHallOfFame_CreateSpriteGfxHandlers(RegisterHallOfFameData *data);
static void RegisterHallOfFame_DestroySpriteGfxHandlers(RegisterHallOfFameData *data);
static void RegisterHallOfFame_DeletePicByIndex(RegisterHallOfFameData *data, u32 picIdx);
static void RegisterHallOfFame_PicAnimationsTick(RegisterHallOfFameData *data);
static void RegisterHallOfFame_StartPicAnimSeq(RegisterHallOfFameData *data, u32 picIdx, int animSeqNo);
static RegisterHallOfFameScene RegisterHallOfFame_FadeFromBlack(RegisterHallOfFameData *data, RegisterHallOfFameScene nextScene);
static RegisterHallOfFameScene RegisterHallOfFame_FadeToBlack(RegisterHallOfFameData *data, RegisterHallOfFameScene nextScene);
static BOOL RegisterHallOfFame_SetupSubproc(RegisterHallOfFameData *data, RegisterHallOfFameSubprocCallback callback, RegisterHallOfFameScene nextScene);
static RegisterHallOfFameScene RegisterHallOfFame_WaitFade(RegisterHallOfFameData *data);
static RegisterHallOfFameScene RegisterHallOfFame_WaitSubproc(RegisterHallOfFameData *data);
static RegisterHallOfFameScene RegisterHallOfFame_IndivMonsInit(RegisterHallOfFameData *data);
static RegisterHallOfFameScene RegisterHallOfFame_IndivMonsMain(RegisterHallOfFameData *data);
static RegisterHallOfFameScene RegisterHallOfFame_IndivMonsExit(RegisterHallOfFameData *data);
static RegisterHallOfFameScene RegisterHallOfFame_WholePartyInit(RegisterHallOfFameData *data);
static RegisterHallOfFameScene RegisterHallOfFame_WholePartyMain(RegisterHallOfFameData *data);
static RegisterHallOfFameScene RegisterHallOfFame_WholePartyExit(RegisterHallOfFameData *data);
static void RegisterHallOfFame_MonSpritePosScaleAnimStep(ManagedSprite *unkImageStruct, const RegHOFSpritePosScaleAnimParam *param, u32 duration, u32 step);
static void RegisterHallOfFame_IndivMonsScene_LoadSpriteGfx(RegisterHallOfFameData *data);
static void RegisterHallOfFame_IndivMonsScene_UnloadSpriteGfx(RegisterHallOfFameData *data);
static void RegisterHallOfFame_IndivMonsScene_SetPicGfxAndPltt(RegisterHallOfFameData *data, RegisterHofMon *mon, u8 whichFacing, int picIdx);
static void RegisterHallOfFame_SetSilhouettePalette(RegisterHallOfFameData *data, int picIdx, RegisterHallOfFameSilhouettePal pal);
static void RegisterHallOfFame_BackupMonPicPalette(RegisterHallOfFameData *data, int monIdx, int picIdx);
static void RegisterHallOfFame_RestoreMonPicPalette(RegisterHallOfFameData *data, int monIdx, int picIdx);
static void RegisterHallOfFame_IndivMonsScene_LoadMonOverworldSprite(RegisterHallOfFameData *data, RegisterHofMon *mon);
static void RegisterHallOfFame_IndivMonsScene_UnloadMonOverworldSprite(RegisterHallOfFameData *data);
static void RegisterHallOfFame_IndivMonsScene_SetMon3dSpriteTex(RegisterHallOfFameData *data, RegisterHofMon *hofMon, int picIdx);
static void RegisterHallOfFame_IndivMons_InitBgLayers(RegisterHallOfFameData *data);
static void RegisterHallOfFame_IndivMonsScene_RemoveWindows(RegisterHallOfFameData *data);
static void RegisterHallOfFame_IndivMonsScene_PrintMonDetailsOnWindow(RegisterHallOfFameData *data, u16 monIdx, int windowIdx);
static void RegisterHallOfFame_IndivMonsScene_CreateMonSpriteAndEnableObjLayer(RegisterHallOfFameData *data, int monIdx);
static void RegisterHallOfFame_IndivMonsScene_DeleteSprites(RegisterHallOfFameData *data);
static void RegisterHallOfFame_IndivMonsScene_CreateMonSprites(RegisterHallOfFameData *data, int monIdx);
static void RegisterHallOfFame_IndivMonsScene_SetOverworldSpritePos(RegisterHallOfFameData *data, RegisterHofMon *mon);
static void RegisterHallOfFame_IndivMons_DeleteBgTilemapBuffers(RegisterHallOfFameData *data);
static void RegisterHallOfFames_IndivMons_LoadBgGfx(RegisterHallOfFameData *data);
static void RegisterHallOfFame_IndivMonsScene_InitWindows(RegisterHallOfFameData *data);
static void RegisterHallOfFame_IndivMonsScene_DeleteSprites(RegisterHallOfFameData *data);
static void RegisterHallOfFame_IndivMons_ResetBgAndSpritePos(RegisterHallOfFameData *data);
static BOOL RegisterHallOfFame_ShowMon_LeftSide(RegisterHallOfFameData *data);
static BOOL RegisterHallOfFame_ShowMon_RightSide(RegisterHallOfFameData *data);
static void RegisterHallOfFame_GetPartyDetails(RegisterHallOfFameData *data);
static RegisterHallOfFame_MetLocationType RegisterHallOfFame_GetMetLocationType(RegisterHallOfFameData *data, Pokemon *pokemon, PlayerProfile *profile);
static int RegisterHallOfFame_GetMmodelBySpeciesFormGender(int species, u8 form, u8 gender);
static void RegisterHallOfFame_CreateTask_IndivMonAnimAndCry(RegisterHallOfFameData *data, int monIdx, int picIdx, int needLoadFromNarc, int facing);
static void Task_RegisterHallOfFame_IndivMonAnimAndCry(SysTask *task, void *taskData);
static void RegisterHallOfFame_BlendAlphaFadeStep(RegisterHallOfFameData *data, u16 duration, u16 pos);
static BOOL RegisterHallOfFame_WholeMonsSceneSubproc(RegisterHallOfFameData *data);
static void RegisterHallOfFame_AfterFullParty_FadeFromWhite(RegisterHallOfFameData *data);
static void RegisterHallOfFame_AfterFullParty_FadeToBlack(RegisterHallOfFameData *data);
static void VBlankTask_RegisterHallOfFame_WholePartyCongrats(SysTask *task, void *taskData);
static void RegisterHallOfFame_WholePartyScene_InitBGs(RegisterHallOfFameData *data);
static void RegisterHallOfFame_WholePartyScene_DeleteBgTilemapBuffers(RegisterHallOfFameData *data);
static void RegisterHallOfFame_WholePartyScene_LoadBgGfx(RegisterHallOfFameData *data);
static void RegisterHallOfFame_WholePartyScene_InitWindows(RegisterHallOfFameData *data);
static void RegisterHallOfFame_WholePartyScene_DeleteWindows(RegisterHallOfFameData *data);
static void RegisterHallOfFame_WholePartyScene_CreateSprites(RegisterHallOfFameData *data);
static void RegisterHallOfFame_AfterWholePartyView_UnloadSpriteRes(RegisterHallOfFameData *data);
static void RegisterHallOfFame_G3Init(RegisterHallOfFameData *data);
static void RegisterHallOfFame_CreateCamera(RegisterHallOfFameData *data);
static void RegisterHallOfFame_DeleteCamera(RegisterHallOfFameData *data);
static void RegisterHallOfFame_G3Commit(RegisterHallOfFameData *data);
static SysTask *RegisterHallOfFame_CreateSpotlightController(RegisterHallOfFameData *data);
static void Task_RegisterHallOfFame_Spotlights_BeginMakeDL(SysTask *task, void *taskData);
static void Task_RegisterHallOfFame_Spotlights_EndMakeDL(SysTask *task, void *taskData);
static void RegisterHallOfFame_AddSpotlight(SysTask *task, int xOffset, fx32 angle);
static SysTask *RegisterHallOfFame_CreateSpotlightTaskEx(RegisterHofSpotlightTaskData *spotlight, int xOffset, fx32 angle, int index);
static void Task_RegisterHallOfFame_SpotlightInstance(SysTask *task, void *taskData);
static void RegisterHallOfFame_SpotlightsTask_G3Commit(SysTask *task);
static void RegisterHallOfFame_DestroySpotlightsTask(SysTask *task);
static BOOL RegisterHallOfFame_AreAllSpotlightsFinished(RegisterHallOfFameData *data);
static SysTask *RegisterHallOfFame_CreateConfettiTask(RegisterHallOfFameData *data);
static void RegisterHallOfFame_EndConfetti(SysTask *task);
static void RegisterHallOfFame_StartConfetti(SysTask *task);
static void Task_RegisterHallOfFame_Confetti(SysTask *task, void *taskData);
static void RegisterHallOfFame_ConfettiTask_G3Commit(SysTask *task);

static BOOL sSpotlightsActive = TRUE;
static int sNumSpotlightTasks;

static const fx16 sSpotlightSpeeds[6] = {
    FX16_CONST(0.75),
    FX16_CONST(0.6875),
    FX16_CONST(0.625),
    FX16_CONST(0.75),
    FX16_CONST(0.6875),
    FX16_CONST(0.625),
};

static const GraphicsModes sGraphicsModes_IndivMons = {
    GX_DISPMODE_GRAPHICS,
    GX_BGMODE_0,
    GX_BGMODE_0,
    GX_BG0_AS_2D,
};

static const WindowTemplate sWholePartySceneWindowTemplates[2] = {
    {
     .bgId = GF_BG_LYR_MAIN_1,
     .left = 0,
     .top = 0,
     .width = 32,
     .height = 2,
     .palette = 15,
     .baseTile = 0x001,
     },
    {
     .bgId = GF_BG_LYR_MAIN_1,
     .left = 0,
     .top = 22,
     .width = 32,
     .height = 2,
     .palette = 15,
     .baseTile = 0x041,
     },
};

static const UnkStruct_02014E30 ov63_0221FAF0 = {
    0,
    0,
    10,
    10,
};

static const GraphicsModes sGraphicsModes_WholePartyScene = {
    GX_DISPMODE_GRAPHICS,
    GX_BGMODE_0,
    GX_BGMODE_0,
    GX_BG0_AS_3D,
};

static const OamCharTransferParam ov63_0221FB30 = {
    0x400,
    0x10000,
    0x4000,
    GX_OBJVRAMMODE_CHAR_1D_64K,
    GX_OBJVRAMMODE_CHAR_1D_64K,
};

static const VecFx16 sConfettiCoords[4] = {
    {
     .x = -FX16_CONST(0.038),
     .y = -FX16_CONST(0.05),
     .z = 0,
     },
    {
     .x = FX16_CONST(0.038),
     .y = -FX16_CONST(0.05),
     .z = 0,
     },
    {
     .x = FX16_CONST(0.038),
     .y = FX16_CONST(0.05),
     .z = 0,
     },
    {
     .x = -FX16_CONST(0.038),
     .y = FX16_CONST(0.05),
     .z = 0,
     },
};

static const SpriteResourceCountsListUnion sSpriteGfxHandlerCapacities = {
    .numChar = 9,
    .numPltt = 11,
    .numCell = 4,
    .numAnim = 4,
    .numMcel = 0,
    .numManm = 0,
};

static const BgTemplate sBgTemplate_IndivMons_Main0 = {
    .x = 0,
    .y = 0,
    .bufferSize = GF_BG_BUF_SIZE_512x512_4BPP,
    .baseTile = 0,
    .size = GF_BG_SCR_SIZE_512x512,
    .colorMode = GX_BG_COLORMODE_16,
    .screenBase = GX_BG_SCRBASE_0xe000,
    .charBase = GX_BG_CHARBASE_0x18000,
    .bgExtPltt = GX_BG_EXTPLTT_01,
    .priority = 0,
    .areaOver = GX_BG_AREAOVER_XLU,
    .mosaic = FALSE,
};

static const BgTemplate sBgTemplate_IndivMons_Main1 = {
    .x = 0,
    .y = 0,
    .bufferSize = GF_BG_BUF_SIZE_512x512_4BPP,
    .baseTile = 0,
    .size = GF_BG_SCR_SIZE_512x512,
    .colorMode = GX_BG_COLORMODE_16,
    .screenBase = GX_BG_SCRBASE_0xc000,
    .charBase = GX_BG_CHARBASE_0x10000,
    .bgExtPltt = GX_BG_EXTPLTT_01,
    .priority = 1,
    .areaOver = GX_BG_AREAOVER_XLU,
    .mosaic = FALSE,
};

static const BgTemplate sBgTemplate_WholePartyScene_Main3 = {
    .x = 0,
    .y = 0,
    .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
    .baseTile = 0,
    .size = GF_BG_SCR_SIZE_256x256,
    .colorMode = GX_BG_COLORMODE_16,
    .screenBase = GX_BG_SCRBASE_0xe800,
    .charBase = GX_BG_CHARBASE_0x10000,
    .bgExtPltt = GX_BG_EXTPLTT_01,
    .priority = 3,
    .areaOver = GX_BG_AREAOVER_XLU,
    .mosaic = FALSE,
};

static const BgTemplate sBgTemplate_WholePartyScene_Main1 = {
    .x = 0,
    .y = 0,
    .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
    .baseTile = 0,
    .size = GF_BG_SCR_SIZE_256x256,
    .colorMode = GX_BG_COLORMODE_16,
    .screenBase = GX_BG_SCRBASE_0xf800,
    .charBase = GX_BG_CHARBASE_0x00000,
    .bgExtPltt = GX_BG_EXTPLTT_01,
    .priority = 0,
    .areaOver = GX_BG_AREAOVER_XLU,
    .mosaic = FALSE,
};

static const BgTemplate sBgTemplate_WholePartyScene_Main2 = {
    .x = 0,
    .y = 0,
    .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
    .baseTile = 0,
    .size = GF_BG_SCR_SIZE_256x256,
    .colorMode = GX_BG_COLORMODE_16,
    .screenBase = GX_BG_SCRBASE_0xf000,
    .charBase = GX_BG_CHARBASE_0x10000,
    .bgExtPltt = GX_BG_EXTPLTT_01,
    .priority = 2,
    .areaOver = GX_BG_AREAOVER_XLU,
    .mosaic = FALSE,
};

static const BgTemplate sBgTemplate_IndivMons_Main3 = {
    .x = 0,
    .y = 0,
    .bufferSize = GF_BG_BUF_SIZE_512x512_4BPP,
    .baseTile = 0,
    .size = GF_BG_SCR_SIZE_512x512,
    .colorMode = GX_BG_COLORMODE_16,
    .screenBase = GX_BG_SCRBASE_0x8000,
    .charBase = GX_BG_CHARBASE_0x10000,
    .bgExtPltt = GX_BG_EXTPLTT_01,
    .priority = 3,
    .areaOver = GX_BG_AREAOVER_XLU,
    .mosaic = FALSE,
};

static const BgTemplate sBgTemplate_IndivMons_Main2 = {
    .x = 0,
    .y = 0,
    .bufferSize = GF_BG_BUF_SIZE_512x512_4BPP,
    .baseTile = 0,
    .size = GF_BG_SCR_SIZE_512x512,
    .colorMode = GX_BG_COLORMODE_16,
    .screenBase = GX_BG_SCRBASE_0xa000,
    .charBase = GX_BG_CHARBASE_0x10000,
    .bgExtPltt = GX_BG_EXTPLTT_01,
    .priority = 2,
    .areaOver = GX_BG_AREAOVER_XLU,
    .mosaic = FALSE,
};

static const UnkStruct_02014E30 ov63_0221FC38[2] = {
    {
     0,
     0,
     10,
     10,
     },
    {
     10,
     0,
     10,
     10,
     },
};

static const GXRgb sSpritePltt_White[16] = {
    RGB_WHITE,
    RGB_WHITE,
    RGB_WHITE,
    RGB_WHITE,
    RGB_WHITE,
    RGB_WHITE,
    RGB_WHITE,
    RGB_WHITE,
    RGB_WHITE,
    RGB_WHITE,
    RGB_WHITE,
    RGB_WHITE,
    RGB_WHITE,
    RGB_WHITE,
    RGB_WHITE,
    RGB_WHITE,
};

static const GXRgb sSpritePltt_Red[16] = {
    RGB(31, 0, 0),
    RGB(31, 0, 0),
    RGB(31, 0, 0),
    RGB(31, 0, 0),
    RGB(31, 0, 0),
    RGB(31, 0, 0),
    RGB(31, 0, 0),
    RGB(31, 0, 0),
    RGB(31, 0, 0),
    RGB(31, 0, 0),
    RGB(31, 0, 0),
    RGB(31, 0, 0),
    RGB(31, 0, 0),
    RGB(31, 0, 0),
    RGB(31, 0, 0),
    RGB(31, 0, 0),
};

static const UnkStruct_02014E30 sDeadstrippedData_0221FCD8[2] = {
    {
     0,
     0,
     10,
     10,
     },
    {
     10,
     0,
     10,
     10,
     },
};

static const int sSpotlightColors[8] = {
    RGB(31, 31, 12),
    RGB(31, 31, 16),
    RGB(31, 28, 8),
    RGB(31, 31, 12),
    RGB(31, 31, 16),
    RGB(31, 28, 8),
    RGB(31, 31, 12),
    RGB(31, 31, 12),
};

static RegisterHallOfFameScene (*const sSceneFuncs[8])(RegisterHallOfFameData *data) = {
    RegisterHallOfFame_WaitFade,
    RegisterHallOfFame_WaitSubproc,
    RegisterHallOfFame_IndivMonsInit,
    RegisterHallOfFame_IndivMonsMain,
    RegisterHallOfFame_IndivMonsExit,
    RegisterHallOfFame_WholePartyInit,
    RegisterHallOfFame_WholePartyMain,
    RegisterHallOfFame_WholePartyExit,
};

static const int sConfettiColors[8] = {
    RGB(16, 28, 21),
    RGB(31, 16, 29),
    RGB(8, 8, 31),
    RGB(6, 31, 31),
    RGB(31, 31, 0),
    RGB(9, 31, 0),
    RGB(31, 18, 0),
    RGB(22, 0, 31),
};

static const GXRgb sSpritePltt_Black[16] = {
    RGB_BLACK,
    RGB_BLACK,
    RGB_BLACK,
    RGB_BLACK,
    RGB_BLACK,
    RGB_BLACK,
    RGB_BLACK,
    RGB_BLACK,
    RGB_BLACK,
    RGB_BLACK,
    RGB_BLACK,
    RGB_BLACK,
    RGB_BLACK,
    RGB_BLACK,
    RGB_BLACK,
    RGB_BLACK,
};

static const OamManagerParam ov63_0221FCB8 = {
    0,
    0x80,
    0,
    0x20,
    0,
    0x80,
    0,
    0x20,
};

static const GraphicsBanks sGfxBanks = {
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

static const WindowTemplate sIndivMonsSceneWindowTemplates[7] = {
    {
     .bgId = GF_BG_LYR_MAIN_0,
     .left = 0,
     .top = 0,
     .width = 32,
     .height = 2,
     .palette = 15,
     .baseTile = 0x001,
     },
    {
     .bgId = GF_BG_LYR_MAIN_0,
     .left = 18,
     .top = 3,
     .width = 14,
     .height = 2,
     .palette = 15,
     .baseTile = 0x041,
     },
    {
     .bgId = GF_BG_LYR_MAIN_0,
     .left = 18,
     .top = 6,
     .width = 14,
     .height = 4,
     .palette = 15,
     .baseTile = 0x05D,
     },
    {
     .bgId = GF_BG_LYR_MAIN_0,
     .left = 18,
     .top = 12,
     .width = 14,
     .height = 9,
     .palette = 15,
     .baseTile = 0x095,
     },
    {
     .bgId = GF_BG_LYR_MAIN_0,
     .left = 0,
     .top = 3,
     .width = 14,
     .height = 2,
     .palette = 15,
     .baseTile = 0x041,
     },
    {
     .bgId = GF_BG_LYR_MAIN_0,
     .left = 0,
     .top = 6,
     .width = 14,
     .height = 4,
     .palette = 15,
     .baseTile = 0x05D,
     },
    {
     .bgId = GF_BG_LYR_MAIN_0,
     .left = 0,
     .top = 12,
     .width = 14,
     .height = 9,
     .palette = 15,
     .baseTile = 0x095,
     },
};

static const RegHOFSpritePosScaleAnimParam sPicPosScaleAnimParams[27] = {
    { 168, -40, 96,  120, 1.0f, 1.0f  },
    { -92, 88,  160, 120, 1.0f, 1.0f  },
    { 348, 88,  56,  104, 1.0f, 1.0f  },
    { 88,  -40, 200, 104, 1.0f, 1.0f  },
    { 336, 0,   40,  80,  1.0f, 1.0f  },
    { -80, 0,   216, 80,  1.0f, 1.0f  },
    { 93,  110, 99,  110, 1.0f, 1.0f  },
    { 157, 110, 163, 110, 1.0f, 1.0f  },
    { 53,  96,  59,  96,  1.0f, 1.0f  },
    { 197, 96,  203, 96,  1.0f, 1.0f  },
    { 37,  72,  43,  72,  1.0f, 1.0f  },
    { 213, 72,  219, 72,  1.0f, 1.0f  },
    { 125, 120, 131, 120, 1.0f, 1.0f  },
    { 96,  120, 108, 100, 1.0f, 0.8f  },
    { 160, 120, 148, 100, 1.0f, 0.8f  },
    { 56,  104, 84,  90,  1.0f, 0.75f },
    { 200, 104, 170, 90,  1.0f, 0.75f },
    { 40,  80,  64,  75,  1.0f, 0.7f  },
    { 216, 80,  190, 75,  1.0f, 0.7f  },
    { 128, 128, 128, 120, 1.0f, 0.7f  },
    { 96,  90,  108, 100, 1.0f, 0.9f  },
    { 160, 90,  148, 100, 1.0f, 0.9f  },
    { 56,  80,  84,  90,  1.0f, 0.8f  },
    { 200, 80,  170, 90,  1.0f, 0.8f  },
    { 40,  60,  64,  75,  1.0f, 0.75f },
    { 216, 60,  190, 75,  1.0f, 0.75f },
    { 128, 100, 128, 120, 1.0f, 0.8f  },
};

static const ManagedSpriteTemplate sPicTemplates[21] = {
    [0] = {
           .x = 512,
           .y = 480,
           .z = 0,
           .animation = 0,
           .spritePriority = 0,
           .pal = 0,
           .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
           .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = 55512,
            [GF_GFX_RES_TYPE_PLTT] = 55512,
            [GF_GFX_RES_TYPE_CELL] = 55512,
            [GF_GFX_RES_TYPE_ANIM] = 55512,
            [GF_GFX_RES_TYPE_MCEL] = -1,
            [GF_GFX_RES_TYPE_MANM] = -1 },
           .bgPriority = 2,
           .vramTransfer = 0                                                                                                                                                                                                                                                                                                                                            },
    [1] = { .x = 512, .y = 480, .z = 0, .animation = 0, .spritePriority = 1,  .pal = 0, .vram = NNS_G2D_VRAM_TYPE_2DMAIN, .resIdList = { [GF_GFX_RES_TYPE_CHAR] = 55512, [GF_GFX_RES_TYPE_PLTT] = 55513, [GF_GFX_RES_TYPE_CELL] = 55512, [GF_GFX_RES_TYPE_ANIM] = 55512, [GF_GFX_RES_TYPE_MCEL] = -1, [GF_GFX_RES_TYPE_MANM] = -1 }, .bgPriority = 2, .vramTransfer = 0 },
    [2] = { .x = 512, .y = 480, .z = 0, .animation = 0, .spritePriority = 2,  .pal = 0, .vram = NNS_G2D_VRAM_TYPE_2DMAIN, .resIdList = { [GF_GFX_RES_TYPE_CHAR] = 55513, [GF_GFX_RES_TYPE_PLTT] = 55514, [GF_GFX_RES_TYPE_CELL] = 55513, [GF_GFX_RES_TYPE_ANIM] = 55513, [GF_GFX_RES_TYPE_MCEL] = -1, [GF_GFX_RES_TYPE_MANM] = -1 }, .bgPriority = 3, .vramTransfer = 0 },
    [3] = { .x = 512, .y = 480, .z = 0, .animation = 0, .spritePriority = 3,  .pal = 0, .vram = NNS_G2D_VRAM_TYPE_2DMAIN, .resIdList = { [GF_GFX_RES_TYPE_CHAR] = 55513, [GF_GFX_RES_TYPE_PLTT] = 55515, [GF_GFX_RES_TYPE_CELL] = 55513, [GF_GFX_RES_TYPE_ANIM] = 55513, [GF_GFX_RES_TYPE_MCEL] = -1, [GF_GFX_RES_TYPE_MANM] = -1 }, .bgPriority = 3, .vramTransfer = 0 },
    [4] = { .x = 512, .y = 480, .z = 0, .animation = 0, .spritePriority = 4,  .pal = 0, .vram = NNS_G2D_VRAM_TYPE_2DMAIN, .resIdList = { [GF_GFX_RES_TYPE_CHAR] = 55518, [GF_GFX_RES_TYPE_PLTT] = 55518, [GF_GFX_RES_TYPE_CELL] = 55514, [GF_GFX_RES_TYPE_ANIM] = 55514, [GF_GFX_RES_TYPE_MCEL] = -1, [GF_GFX_RES_TYPE_MANM] = -1 }, .bgPriority = 2, .vramTransfer = 0 },
    [5] = { .x = 512, .y = 480, .z = 0, .animation = 0, .spritePriority = 5,  .pal = 0, .vram = NNS_G2D_VRAM_TYPE_2DMAIN, .resIdList = { [GF_GFX_RES_TYPE_CHAR] = 55518, [GF_GFX_RES_TYPE_PLTT] = 55519, [GF_GFX_RES_TYPE_CELL] = 55514, [GF_GFX_RES_TYPE_ANIM] = 55514, [GF_GFX_RES_TYPE_MCEL] = -1, [GF_GFX_RES_TYPE_MANM] = -1 }, .bgPriority = 2, .vramTransfer = 0 },
    [6] = { .x = 168, .y = -40, .z = 0, .animation = 0, .spritePriority = 20, .pal = 0, .vram = NNS_G2D_VRAM_TYPE_2DMAIN, .resIdList = { [GF_GFX_RES_TYPE_CHAR] = 55512, [GF_GFX_RES_TYPE_PLTT] = 55512, [GF_GFX_RES_TYPE_CELL] = 55512, [GF_GFX_RES_TYPE_ANIM] = 55512, [GF_GFX_RES_TYPE_MCEL] = -1, [GF_GFX_RES_TYPE_MANM] = -1 }, .bgPriority = 2, .vramTransfer = 0 },
    [7] = { .x = -92, .y = 88,  .z = 0, .animation = 0, .spritePriority = 21, .pal = 0, .vram = NNS_G2D_VRAM_TYPE_2DMAIN, .resIdList = { [GF_GFX_RES_TYPE_CHAR] = 55513, [GF_GFX_RES_TYPE_PLTT] = 55513, [GF_GFX_RES_TYPE_CELL] = 55512, [GF_GFX_RES_TYPE_ANIM] = 55512, [GF_GFX_RES_TYPE_MCEL] = -1, [GF_GFX_RES_TYPE_MANM] = -1 }, .bgPriority = 2, .vramTransfer = 0 },
    [8] = { .x = 348, .y = 88,  .z = 0, .animation = 0, .spritePriority = 22, .pal = 0, .vram = NNS_G2D_VRAM_TYPE_2DMAIN, .resIdList = { [GF_GFX_RES_TYPE_CHAR] = 55514, [GF_GFX_RES_TYPE_PLTT] = 55514, [GF_GFX_RES_TYPE_CELL] = 55512, [GF_GFX_RES_TYPE_ANIM] = 55512, [GF_GFX_RES_TYPE_MCEL] = -1, [GF_GFX_RES_TYPE_MANM] = -1 }, .bgPriority = 2, .vramTransfer = 0 },
    [9] = { .x = 88,  .y = -40, .z = 0, .animation = 0, .spritePriority = 23, .pal = 0, .vram = NNS_G2D_VRAM_TYPE_2DMAIN, .resIdList = { [GF_GFX_RES_TYPE_CHAR] = 55515, [GF_GFX_RES_TYPE_PLTT] = 55515, [GF_GFX_RES_TYPE_CELL] = 55512, [GF_GFX_RES_TYPE_ANIM] = 55512, [GF_GFX_RES_TYPE_MCEL] = -1, [GF_GFX_RES_TYPE_MANM] = -1 }, .bgPriority = 2, .vramTransfer = 0 },
    [10] = { .x = 336, .y = 0,   .z = 0, .animation = 0, .spritePriority = 24, .pal = 0, .vram = NNS_G2D_VRAM_TYPE_2DMAIN, .resIdList = { [GF_GFX_RES_TYPE_CHAR] = 55516, [GF_GFX_RES_TYPE_PLTT] = 55516, [GF_GFX_RES_TYPE_CELL] = 55512, [GF_GFX_RES_TYPE_ANIM] = 55512, [GF_GFX_RES_TYPE_MCEL] = -1, [GF_GFX_RES_TYPE_MANM] = -1 }, .bgPriority = 2, .vramTransfer = 0 },
    [11] = { .x = -80, .y = 0,   .z = 0, .animation = 0, .spritePriority = 25, .pal = 0, .vram = NNS_G2D_VRAM_TYPE_2DMAIN, .resIdList = { [GF_GFX_RES_TYPE_CHAR] = 55517, [GF_GFX_RES_TYPE_PLTT] = 55517, [GF_GFX_RES_TYPE_CELL] = 55512, [GF_GFX_RES_TYPE_ANIM] = 55512, [GF_GFX_RES_TYPE_MCEL] = -1, [GF_GFX_RES_TYPE_MANM] = -1 }, .bgPriority = 2, .vramTransfer = 0 },
    [12] = { .x = 93,  .y = 110, .z = 0, .animation = 0, .spritePriority = 40, .pal = 0, .vram = NNS_G2D_VRAM_TYPE_2DMAIN, .resIdList = { [GF_GFX_RES_TYPE_CHAR] = 55512, [GF_GFX_RES_TYPE_PLTT] = 55521, [GF_GFX_RES_TYPE_CELL] = 55512, [GF_GFX_RES_TYPE_ANIM] = 55512, [GF_GFX_RES_TYPE_MCEL] = -1, [GF_GFX_RES_TYPE_MANM] = -1 }, .bgPriority = 3, .vramTransfer = 0 },
    [13] = { .x = 157, .y = 110, .z = 0, .animation = 0, .spritePriority = 40, .pal = 0, .vram = NNS_G2D_VRAM_TYPE_2DMAIN, .resIdList = { [GF_GFX_RES_TYPE_CHAR] = 55513, [GF_GFX_RES_TYPE_PLTT] = 55521, [GF_GFX_RES_TYPE_CELL] = 55512, [GF_GFX_RES_TYPE_ANIM] = 55512, [GF_GFX_RES_TYPE_MCEL] = -1, [GF_GFX_RES_TYPE_MANM] = -1 }, .bgPriority = 3, .vramTransfer = 0 },
    [14] = { .x = 53,  .y = 96,  .z = 0, .animation = 0, .spritePriority = 40, .pal = 0, .vram = NNS_G2D_VRAM_TYPE_2DMAIN, .resIdList = { [GF_GFX_RES_TYPE_CHAR] = 55514, [GF_GFX_RES_TYPE_PLTT] = 55521, [GF_GFX_RES_TYPE_CELL] = 55512, [GF_GFX_RES_TYPE_ANIM] = 55512, [GF_GFX_RES_TYPE_MCEL] = -1, [GF_GFX_RES_TYPE_MANM] = -1 }, .bgPriority = 3, .vramTransfer = 0 },
    [15] = { .x = 197, .y = 96,  .z = 0, .animation = 0, .spritePriority = 40, .pal = 0, .vram = NNS_G2D_VRAM_TYPE_2DMAIN, .resIdList = { [GF_GFX_RES_TYPE_CHAR] = 55515, [GF_GFX_RES_TYPE_PLTT] = 55521, [GF_GFX_RES_TYPE_CELL] = 55512, [GF_GFX_RES_TYPE_ANIM] = 55512, [GF_GFX_RES_TYPE_MCEL] = -1, [GF_GFX_RES_TYPE_MANM] = -1 }, .bgPriority = 3, .vramTransfer = 0 },
    [16] = { .x = 37,  .y = 72,  .z = 0, .animation = 0, .spritePriority = 40, .pal = 0, .vram = NNS_G2D_VRAM_TYPE_2DMAIN, .resIdList = { [GF_GFX_RES_TYPE_CHAR] = 55516, [GF_GFX_RES_TYPE_PLTT] = 55521, [GF_GFX_RES_TYPE_CELL] = 55512, [GF_GFX_RES_TYPE_ANIM] = 55512, [GF_GFX_RES_TYPE_MCEL] = -1, [GF_GFX_RES_TYPE_MANM] = -1 }, .bgPriority = 3, .vramTransfer = 0 },
    [17] = { .x = 213, .y = 72,  .z = 0, .animation = 0, .spritePriority = 40, .pal = 0, .vram = NNS_G2D_VRAM_TYPE_2DMAIN, .resIdList = { [GF_GFX_RES_TYPE_CHAR] = 55517, [GF_GFX_RES_TYPE_PLTT] = 55521, [GF_GFX_RES_TYPE_CELL] = 55512, [GF_GFX_RES_TYPE_ANIM] = 55512, [GF_GFX_RES_TYPE_MCEL] = -1, [GF_GFX_RES_TYPE_MANM] = -1 }, .bgPriority = 3, .vramTransfer = 0 },
    [18] = { .x = 128, .y = 128, .z = 0, .animation = 0, .spritePriority = 10, .pal = 0, .vram = NNS_G2D_VRAM_TYPE_2DMAIN, .resIdList = { [GF_GFX_RES_TYPE_CHAR] = 55519, [GF_GFX_RES_TYPE_PLTT] = 55520, [GF_GFX_RES_TYPE_CELL] = 55512, [GF_GFX_RES_TYPE_ANIM] = 55512, [GF_GFX_RES_TYPE_MCEL] = -1, [GF_GFX_RES_TYPE_MANM] = -1 }, .bgPriority = 2, .vramTransfer = 0 },
    [19] = { .x = 125, .y = 120, .z = 0, .animation = 0, .spritePriority = 40, .pal = 0, .vram = NNS_G2D_VRAM_TYPE_2DMAIN, .resIdList = { [GF_GFX_RES_TYPE_CHAR] = 55519, [GF_GFX_RES_TYPE_PLTT] = 55521, [GF_GFX_RES_TYPE_CELL] = 55512, [GF_GFX_RES_TYPE_ANIM] = 55512, [GF_GFX_RES_TYPE_MCEL] = -1, [GF_GFX_RES_TYPE_MANM] = -1 }, .bgPriority = 3, .vramTransfer = 0 },
    [20] = { .x = 0,   .y = 0,   .z = 0, .animation = 0, .spritePriority = 0,  .pal = 0, .vram = NNS_G2D_VRAM_TYPE_2DMAIN, .resIdList = { [GF_GFX_RES_TYPE_CHAR] = 55520, [GF_GFX_RES_TYPE_PLTT] = 55522, [GF_GFX_RES_TYPE_CELL] = 55515, [GF_GFX_RES_TYPE_ANIM] = 55515, [GF_GFX_RES_TYPE_MCEL] = -1, [GF_GFX_RES_TYPE_MANM] = -1 }, .bgPriority = 2, .vramTransfer = 0 }
};

BOOL RegisterHallOfFame_Init(OVY_MANAGER *man, int *state) {
    Main_SetVBlankIntrCB(NULL, NULL);
    HBlankInterruptDisable();
    GfGfx_EngineASetPlanes(GX_PLANEMASK_NONE);
    GfGfx_EngineBSetPlanes(0);
    G2_BlendNone();
    G2S_BlendNone();
    GX_SetDispSelect(GX_DISP_SELECT_MAIN_SUB);
    CreateHeap(HEAP_ID_3, HEAP_ID_REGISTER_HALL_OF_FAME, 0x50000);
    RegisterHallOfFameData *data = (RegisterHallOfFameData *)OverlayManager_CreateAndGetData(man, sizeof(RegisterHallOfFameData), HEAP_ID_REGISTER_HALL_OF_FAME);
    MI_CpuFill8(data, 0, sizeof(RegisterHallOfFameData));
    data->args = OverlayManager_GetArgs(man);
    data->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0180_bin, HEAP_ID_REGISTER_HALL_OF_FAME);
    data->msgFormat = MessageFormat_New(HEAP_ID_REGISTER_HALL_OF_FAME);
    data->strbuf1 = String_New(500, HEAP_ID_REGISTER_HALL_OF_FAME);
    data->strbuf2 = String_New(500, HEAP_ID_REGISTER_HALL_OF_FAME);
    data->narcA101 = NARC_New(NARC_a_1_0_1, HEAP_ID_REGISTER_HALL_OF_FAME);
    data->narcA180 = NARC_New(NARC_a_1_8_0, HEAP_ID_REGISTER_HALL_OF_FAME);
    RegisterHallOfFame_GetPartyDetails(data);
    RegisterHallOfFame_SetGfxBanks();
    RegisterHallOfFame_CreateBgConfig(data);
    RegisterHallOfFame_CreateSpriteGfxHandlers(data);
    Sound_SetSceneAndPlayBGM(8, SEQ_GS_E_DENDOUIRI, 1);
    Sound_SetSceneAndPlayBGM(71, 0, 0);
    LoadFontPal0(GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0x1E0, HEAP_ID_REGISTER_HALL_OF_FAME);
    data->currentScene = REGHOF_SCENE_INDIV_MONS_INIT;
    return TRUE;
}

BOOL RegisterHallOfFame_Exit(OVY_MANAGER *man, int *state) {
    RegisterHallOfFameData *data = OverlayManager_GetData(man);
    RegisterHallOfFame_DestroySpriteGfxHandlers(data);
    RegisterHallOfFame_DestroyBgConfig(data);
    NARC_Delete(data->narcA180);
    NARC_Delete(data->narcA101);
    String_Delete(data->strbuf1);
    String_Delete(data->strbuf2);
    MessageFormat_Delete(data->msgFormat);
    DestroyMsgData(data->msgData);
    OverlayManager_FreeData(man);
    DestroyHeap(HEAP_ID_REGISTER_HALL_OF_FAME);
    return TRUE;
}

static RegisterHallOfFameScene (*const sSceneFuncs[8])(RegisterHallOfFameData *data);

BOOL RegisterHallOfFame_Main(OVY_MANAGER *man, int *state) {
    RegisterHallOfFameData *data = OverlayManager_GetData(man);
    data->currentScene = sSceneFuncs[data->currentScene](data);
    if (data->currentScene == REGHOF_SCENE_MAX) {
        return TRUE;
    }
    RegisterHallOfFame_PicAnimationsTick(data);
    return FALSE;
}

static void RegisterHallOfFame_SetGfxBanks(void) {
    GfGfx_SetBanks(&sGfxBanks);
}

static void VBlankTask_RegisterHallOfFame_IndividualMonsCongrats(SysTask *task, void *taskData) {
    RegisterHallOfFameData *data = (RegisterHallOfFameData *)taskData;
    if (data->subprocCallback != NULL && !data->subprocCallback(data)) {
        data->subprocCallback = NULL;
    }
    DoScheduledBgGpuUpdates(data->bgConfig);
    SpriteSystem_DrawSprites(data->spriteGfxHandler);
    SpriteSystem_TransferOam();
    OS_SetIrqCheckFlag(OS_IE_V_BLANK);
}

static void RegisterHallOfFame_ReplaceSpriteChar(const void *pSrc, u32 offset, u32 size) {
    DC_FlushRange(pSrc, size);
    GX_LoadOBJ(pSrc, offset, size);
}

static void RegisterHallOfFame_ReplaceSpritePltt(const void *pSrc, u32 offset, u32 size) {
    DC_FlushRange(pSrc, size);
    GX_LoadOBJPltt(pSrc, offset, size);
}

static void RegisterHallOfFame_CreateBgConfig(RegisterHallOfFameData *data) {
    data->bgConfig = BgConfig_Alloc(HEAP_ID_REGISTER_HALL_OF_FAME);
    BG_SetMaskColor(GF_BG_LYR_SUB_0, RGB_BLACK);
}

static void RegisterHallOfFame_DestroyBgConfig(RegisterHallOfFameData *data) {
    FreeToHeap(data->bgConfig);
}

static void RegisterHallOfFame_CreateSpriteGfxHandlers(RegisterHallOfFameData *data) {
    data->spriteRenderer = SpriteSystem_Alloc(HEAP_ID_REGISTER_HALL_OF_FAME);
    data->spriteGfxHandler = SpriteManager_New(data->spriteRenderer);

    {
        OamManagerParam sp2C = ov63_0221FCB8;
        OamCharTransferParam sp18 = ov63_0221FB30;
        SpriteSystem_Init(data->spriteRenderer, &sp2C, &sp18, 0x20);
    }

    {
        SpriteResourceCountsListUnion sp00 = sSpriteGfxHandlerCapacities;
        SpriteSystem_InitSprites(data->spriteRenderer, data->spriteGfxHandler, 15);
        SpriteSystem_InitManagerWithCapacities(data->spriteRenderer, data->spriteGfxHandler, &sp00);
    }
    G2dRenderer_SetSubSurfaceCoords(SpriteSystem_GetRenderer(data->spriteRenderer), 0, FX32_CONST(1024));
}

static void RegisterHallOfFame_DestroySpriteGfxHandlers(RegisterHallOfFameData *data) {
    SpriteSystem_FreeResourcesAndManager(data->spriteRenderer, data->spriteGfxHandler);
    SpriteSystem_Free(data->spriteRenderer);
}

static void RegisterHallOfFame_DeletePicByIndex(RegisterHallOfFameData *data, u32 picIdx) {
    if (data->monPics[picIdx] != NULL) {
        Sprite_DeleteAndFreeResources(data->monPics[picIdx]);
        data->monPics[picIdx] = NULL;
    }
}

static void RegisterHallOfFame_PicAnimationsTick(RegisterHallOfFameData *data) {
    for (u32 i = 0; i < 15; ++i) {
        if (data->monPics[i] != NULL) {
            ManagedSprite_TickFrame(data->monPics[i]);
        }
    }
}

static void RegisterHallOfFame_StartPicAnimSeq(RegisterHallOfFameData *data, u32 picIdx, int animSeqNo) {
    ManagedSprite_SetAnimationFrame(data->monPics[picIdx], 0);
    ManagedSprite_SetAnim(data->monPics[picIdx], animSeqNo);
}

static RegisterHallOfFameScene RegisterHallOfFame_FadeFromBlack(RegisterHallOfFameData *data, RegisterHallOfFameScene nextScene) {
    BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, HEAP_ID_REGISTER_HALL_OF_FAME);
    data->nextScene = nextScene;
    return REGHOF_SCENE_WAIT_FADE;
}

static RegisterHallOfFameScene RegisterHallOfFame_FadeToBlack(RegisterHallOfFameData *data, RegisterHallOfFameScene nextScene) {
    BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, HEAP_ID_REGISTER_HALL_OF_FAME);
    data->nextScene = nextScene;
    return REGHOF_SCENE_WAIT_FADE;
}

static BOOL RegisterHallOfFame_SetupSubproc(RegisterHallOfFameData *data, RegisterHallOfFameSubprocCallback callback, RegisterHallOfFameScene nextScene) {
    data->nextScene = nextScene;
    data->subprocTimer = 0;
    data->subprocStage = 0;
    data->subprocCallback = callback;
    return TRUE;
}

static RegisterHallOfFameScene RegisterHallOfFame_WaitFade(RegisterHallOfFameData *data) {
    if (IsPaletteFadeFinished() == TRUE) {
        return data->nextScene;
    } else {
        return REGHOF_SCENE_WAIT_FADE;
    }
}

static RegisterHallOfFameScene RegisterHallOfFame_WaitSubproc(RegisterHallOfFameData *data) {
    if (data->subprocCallback == NULL) {
        return data->nextScene;
    } else {
        return REGHOF_SCENE_WAIT_SUBPROC;
    }
}

static RegisterHallOfFameScene RegisterHallOfFame_IndivMonsInit(RegisterHallOfFameData *data) {
    RegisterHallOfFame_IndivMons_InitBgLayers(data);
    RegisterHallOfFame_IndivMonsScene_InitWindows(data);
    RegisterHallOfFames_IndivMons_LoadBgGfx(data);
    data->sceneSubstep = REGHOF_INDIV_SUBSCENE_RESET;
    data->curMonIndex = 0;
    data->vblankTask = SysTask_CreateOnVBlankQueue(VBlankTask_RegisterHallOfFame_IndividualMonsCongrats, data, 0);
    return RegisterHallOfFame_FadeFromBlack(data, REGHOF_SCENE_INDIV_MONS_MAIN);
}

static RegisterHallOfFameScene RegisterHallOfFame_IndivMonsMain(RegisterHallOfFameData *data) {
    switch (data->sceneSubstep) {
    case REGHOF_INDIV_SUBSCENE_RESET:
        RegisterHallOfFame_IndivMons_ResetBgAndSpritePos(data);
        ++data->sceneSubstep;
        break;
    case REGHOF_INDIV_SUBSCENE_SETUP:
        ++data->sceneSubstep;
        if ((data->curMonIndex & 1) == 0) {
            RegisterHallOfFame_SetupSubproc(data, RegisterHallOfFame_ShowMon_LeftSide, REGHOF_SCENE_INDIV_MONS_MAIN);
        } else {
            RegisterHallOfFame_SetupSubproc(data, RegisterHallOfFame_ShowMon_RightSide, REGHOF_SCENE_INDIV_MONS_MAIN);
        }
        break;
    case REGHOF_INDIV_SUBSCENE_PLAY:
        if (data->subprocCallback == NULL) {
            ++data->sceneSubstep;
        } else {
            if (data->requestUnsilhouetteBackpic == TRUE) {
                RegisterHallOfFame_CreateTask_IndivMonAnimAndCry(data, data->curMonIndex, REGHOF_PIC_INDIV_BACK, TRUE, 0);
                data->requestUnsilhouetteBackpic = FALSE;
            }
            if (data->requestUnsilhouetteFrontpic == TRUE) {
                RegisterHallOfFame_CreateTask_IndivMonAnimAndCry(data, data->curMonIndex, REGHOF_PIC_INDIV_FRONT, TRUE, 2);
                data->requestUnsilhouetteFrontpic = FALSE;
            }
        }
        break;
    case REGHOF_INDIV_SUBSCENE_INCREMENT:
        RegisterHallOfFame_IndivMonsScene_DeleteSprites(data);
        ++data->curMonIndex;
        if (data->numMons == data->curMonIndex) {
            ++data->sceneSubstep;
        } else {
            data->sceneSubstep = REGHOF_INDIV_SUBSCENE_RESET;
        }
        break;
    case REGHOF_INDIV_SUBSCENE_EXIT:
        return RegisterHallOfFame_FadeToBlack(data, REGHOF_SCENE_INDIV_MONS_EXIT);
    }
    return REGHOF_SCENE_INDIV_MONS_MAIN;
}

static RegisterHallOfFameScene RegisterHallOfFame_IndivMonsExit(RegisterHallOfFameData *data) {
    SysTask_Destroy(data->vblankTask);
    RegisterHallOfFame_IndivMonsScene_RemoveWindows(data);
    RegisterHallOfFame_IndivMons_DeleteBgTilemapBuffers(data);
    return REGHOF_SCENE_WHOLE_PARTY_INIT;
}

static RegisterHallOfFameScene RegisterHallOfFame_WholePartyInit(RegisterHallOfFameData *data) {
    data->curMonIndex = 0;
    data->sceneSubstep = REGHOF_WHOLE_SUBSCENE_INIT;
    RegisterHallOfFame_WholePartyScene_InitBGs(data);
    RegisterHallOfFame_WholePartyScene_LoadBgGfx(data);
    RegisterHallOfFame_WholePartyScene_InitWindows(data);
    RegisterHallOfFame_WholePartyScene_CreateSprites(data);
    RegisterHallOfFame_G3Init(data);
    data->vblankTask = SysTask_CreateOnVBlankQueue(VBlankTask_RegisterHallOfFame_WholePartyCongrats, data, 4);
    return RegisterHallOfFame_FadeFromBlack(data, REGHOF_SCENE_WHOLE_PARTY_MAIN);
}

static RegisterHallOfFameScene RegisterHallOfFame_WholePartyMain(RegisterHallOfFameData *data) {
    switch (data->sceneSubstep) {
    case REGHOF_WHOLE_SUBSCENE_INIT:
        ++data->sceneSubstep;
        RegisterHallOfFame_SetupSubproc(data, RegisterHallOfFame_WholeMonsSceneSubproc, REGHOF_SCENE_WHOLE_PARTY_MAIN);
        break;
    case REGHOF_WHOLE_SUBSCENE_MAIN:
        if (data->subprocCallback == NULL) {
            ++data->sceneSubstep;
        }
        if (data->requestBeginSpotlightsAndConfetti == TRUE) {
            data->spotlightsTask = RegisterHallOfFame_CreateSpotlightController(data);
            RegisterHallOfFame_AddSpotlight(data->spotlightsTask, -2925, FX32_CONST(20));
            RegisterHallOfFame_AddSpotlight(data->spotlightsTask, -1757, FX32_CONST(60));
            RegisterHallOfFame_AddSpotlight(data->spotlightsTask, -586, FX32_CONST(40));
            RegisterHallOfFame_AddSpotlight(data->spotlightsTask, 586, FX32_CONST(140));
            RegisterHallOfFame_AddSpotlight(data->spotlightsTask, 1757, FX32_CONST(120));
            RegisterHallOfFame_AddSpotlight(data->spotlightsTask, 2925, FX32_CONST(160));
            data->confettiTask = RegisterHallOfFame_CreateConfettiTask(data);
            RegisterHallOfFame_StartConfetti(data->confettiTask);
            GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_ON);
            GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_ON);
            GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_ON);
            ManagedSprite_SetDrawFlag(data->monPics[REGHOF_PIC_WHOLE_PLAYER], TRUE);
            ManagedSprite_SetDrawFlag(data->monPics[REGHOF_PIC_WHOLE_PLAYER_SHADOW], TRUE);
            for (int i = 0; i < data->numMons; ++i) {
                RegisterHallOfFame_RestoreMonPicPalette(data, i, REGHOF_PIC_WHOLE_MON + i);
                ManagedSprite_SetAffineScale(data->monPics[REGHOF_PIC_WHOLE_MON + i], 1.0f, 1.0f);
                ManagedSprite_SetDrawFlag(data->monPics[REGHOF_PIC_WHOLE_MON_SHADOW + i], TRUE);
                ManagedSprite_SetOamMode(data->monPics[REGHOF_PIC_WHOLE_MON + i], GX_OAM_MODE_NORMAL);
                ManagedSprite_SetOamMode(data->monPics[REGHOF_PIC_WHOLE_MON_SHADOW + i], GX_OAM_MODE_XLU);
            }
            data->requestBeginSpotlightsAndConfetti = FALSE;
        }
        if (data->requestPlayFlashKanseiSfx == TRUE) {
            // simulate taking a photo
            RegisterHallOfFame_AfterFullParty_FadeFromWhite(data);
            PlaySE(SEQ_SE_GS_DENDOUIRI_FLASH);
            PlaySE(SEQ_SE_GS_DENDOUIRI_KANSEI);
            data->requestPlayFlashKanseiSfx = FALSE;
        }
        if (data->unk_13060_4 == TRUE) {
            RegisterHallOfFame_AfterFullParty_FadeToBlack(data);
            data->unk_13060_4 = FALSE;
        }
        break;
    case REGHOF_WHOLE_SUBSCENE_EXIT:
        data->sceneSubstep = REGHOF_WHOLEEXIT_SUBSCENE_INIT;
        return REGHOF_SCENE_WHOLE_PARTY_EXIT;
    }

    return REGHOF_SCENE_WHOLE_PARTY_MAIN;
}

static RegisterHallOfFameScene RegisterHallOfFame_WholePartyExit(RegisterHallOfFameData *data) {
    switch (data->sceneSubstep) {
    case REGHOF_WHOLEEXIT_SUBSCENE_INIT:
        SysTask_Destroy(data->vblankTask);
        RegisterHallOfFame_EndConfetti(data->confettiTask);
        RegisterHallOfFame_DestroySpotlightsTask(data->spotlightsTask);
        ++data->sceneSubstep;
        break;
    case REGHOF_WHOLEEXIT_SUBSCENE_MAIN:
        if (RegisterHallOfFame_AreAllSpotlightsFinished(data) == TRUE) {
            ++data->sceneSubstep;
        }
        break;
    case REGHOF_WHOLEEXIT_SUBSCENE_EXIT:
        RegisterHallOfFame_DeleteCamera(data);
        RegisterHallOfFame_AfterWholePartyView_UnloadSpriteRes(data);
        RegisterHallOfFame_WholePartyScene_DeleteWindows(data);
        RegisterHallOfFame_WholePartyScene_DeleteBgTilemapBuffers(data);
        return REGHOF_SCENE_MAX;
    }

    return REGHOF_SCENE_WHOLE_PARTY_EXIT;
}

static void RegisterHallOfFame_MonSpritePosScaleAnimStep(ManagedSprite *unkImageStruct, const RegHOFSpritePosScaleAnimParam *param, u32 duration, u32 step) {
    if (step == 0) {
        ManagedSprite_SetPositionXY(unkImageStruct, param->xStart, param->yStart);
        ManagedSprite_SetAffineScale(unkImageStruct, param->scaleStart, param->scaleStart);
    } else if (step == duration) {
        ManagedSprite_SetPositionXY(unkImageStruct, param->xEnd, param->yEnd);
        ManagedSprite_SetAffineScale(unkImageStruct, param->scaleEnd, param->scaleEnd);
    } else {
        s16 dx = ((abs(param->xStart - param->xEnd) * 256) / duration * step) / 256;
        if (param->xStart > param->xEnd) {
            dx = param->xStart - dx;
        } else {
            dx = param->xStart + dx;
        }
        s16 dy = ((abs(param->yStart - param->yEnd) * 256) / duration * step) / 256;
        if (param->yStart > param->yEnd) {
            dy = param->yStart - dy;
        } else {
            dy = param->yStart + dy;
        }
        ManagedSprite_SetPositionXY(unkImageStruct, dx, dy);

        f32 fpos = param->scaleStart + (param->scaleEnd - param->scaleStart) / (float)duration * (float)step;
        ManagedSprite_SetAffineScale(unkImageStruct, fpos, fpos);
    }
}

static void RegisterHallOfFame_IndivMonsScene_LoadSpriteGfx(RegisterHallOfFameData *data) {
    NARC *narc = NARC_New(NARC_a_0_0_8, HEAP_ID_REGISTER_HALL_OF_FAME);
    SpriteSystem_LoadCharResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 76, FALSE, NNS_G2D_VRAM_TYPE_2DMAIN, 55512);
    SpriteSystem_LoadCellResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 77, FALSE, 55512);
    SpriteSystem_LoadAnimResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 78, FALSE, 55512);
    SpriteSystem_LoadPlttResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 75, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 55512);
    SpriteSystem_LoadPlttResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 75, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 55513);
    SpriteSystem_LoadCharResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 76, FALSE, NNS_G2D_VRAM_TYPE_2DMAIN, 55513);
    SpriteSystem_LoadCellResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 77, FALSE, 55513);
    SpriteSystem_LoadAnimResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 78, FALSE, 55513);
    SpriteSystem_LoadPlttResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 75, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 55514);
    SpriteSystem_LoadPlttResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 75, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 55515);
    NARC_Delete(narc);
}

static void RegisterHallOfFame_IndivMonsScene_UnloadSpriteGfx(RegisterHallOfFameData *data) {
    SpriteManager_UnloadPlttObjById(data->spriteGfxHandler, 55512);
    SpriteManager_UnloadPlttObjById(data->spriteGfxHandler, 55513);
    SpriteManager_UnloadPlttObjById(data->spriteGfxHandler, 55514);
    SpriteManager_UnloadPlttObjById(data->spriteGfxHandler, 55515);
    SpriteManager_UnloadCharObjById(data->spriteGfxHandler, 55512);
    SpriteManager_UnloadCellObjById(data->spriteGfxHandler, 55512);
    SpriteManager_UnloadAnimObjById(data->spriteGfxHandler, 55512);
    SpriteManager_UnloadCharObjById(data->spriteGfxHandler, 55513);
    SpriteManager_UnloadCellObjById(data->spriteGfxHandler, 55513);
    SpriteManager_UnloadAnimObjById(data->spriteGfxHandler, 55513);
}

static void RegisterHallOfFame_IndivMonsScene_SetPicGfxAndPltt(RegisterHallOfFameData *data, RegisterHofMon *hofMon, u8 whichFacing, int picIdx) {
    PokepicTemplate drawMonStruct;
    GetPokemonSpriteCharAndPlttNarcIds(&drawMonStruct, hofMon->mon, whichFacing);
    RegisterHallOfFame_ReplaceSpriteChar(
        whichFacing == MON_PIC_FACING_FRONT ? hofMon->frontspriteCharbuf : hofMon->backspriteCharbuf,
        NNS_G2dGetImageLocation(Sprite_GetImageProxy(data->monPics[picIdx]->sprite), NNS_G2D_VRAM_TYPE_2DMAIN),
        3200);
    GfGfxLoader_GXLoadPal(
        (NarcId)drawMonStruct.narcID,
        drawMonStruct.palDataID,
        GF_PAL_LOCATION_MAIN_OBJ,
        (enum GFPalSlotOffset)NNS_G2dGetImagePaletteLocation(Sprite_GetPaletteProxy(data->monPics[picIdx]->sprite), NNS_G2D_VRAM_TYPE_2DMAIN),
        0x20,
        HEAP_ID_REGISTER_HALL_OF_FAME);
}

int ov63_dummy_00(RegisterHallOfFameData *data);
int ov63_dummy_00(RegisterHallOfFameData *data) {
    return sDeadstrippedData_0221FCD8[data->curMonIndex].x;
}

static void RegisterHallOfFame_SetSilhouettePalette(RegisterHallOfFameData *data, int picIdx, RegisterHallOfFameSilhouettePal pal) {
    u32 dest = NNS_G2dGetImagePaletteLocation(Sprite_GetPaletteProxy(data->monPics[picIdx]->sprite), NNS_G2D_VRAM_TYPE_2DMAIN);
    const u16 *pltt;

    switch (pal) {
    case REGHOF_SILHOUETTE_PAL_BLACK:
        pltt = sSpritePltt_Black;
        break;
    case REGHOF_SILHOUETTE_PAL_WHITE:
        pltt = sSpritePltt_White;
        break;
    case REGHOF_SILHOUETTE_PAL_RED:
        pltt = sSpritePltt_Red;
        break;
    }

    RegisterHallOfFame_ReplaceSpritePltt(pltt, dest, 0x20);
}

static void RegisterHallOfFame_BackupMonPicPalette(RegisterHallOfFameData *data, int monIdx, int picIdx) {
    u32 dest = NNS_G2dGetImagePaletteLocation(Sprite_GetPaletteProxy(data->monPics[picIdx]->sprite), NNS_G2D_VRAM_TYPE_2DMAIN);
    u16 *base = GetMainObjPlttAddr();
    RegisterHofMon *mon = &data->mons[monIdx];

    MI_CpuCopy8(base + (dest / 2), mon->plttBak, 0x20);
}

static void RegisterHallOfFame_RestoreMonPicPalette(RegisterHallOfFameData *data, int monIdx, int picIdx) {
    u32 dest = NNS_G2dGetImagePaletteLocation(Sprite_GetPaletteProxy(data->monPics[picIdx]->sprite), NNS_G2D_VRAM_TYPE_2DMAIN);
    RegisterHofMon *mon = &data->mons[monIdx];

    RegisterHallOfFame_ReplaceSpritePltt(mon->plttBak, dest, 0x20);
}

static void RegisterHallOfFame_IndivMonsScene_LoadMonOverworldSprite(RegisterHallOfFameData *data, RegisterHofMon *mon) {
    if (mon->followPokeParam[1]) {
        SpriteSystem_LoadCharResObjFromOpenNarc(
            data->spriteRenderer,
            data->spriteGfxHandler,
            data->narcA101,
            12,
            TRUE,
            NNS_G2D_VRAM_TYPE_2DMAIN,
            55518);
        SpriteSystem_LoadCellResObjFromOpenNarc(
            data->spriteRenderer,
            data->spriteGfxHandler,
            data->narcA101,
            13,
            TRUE,
            55514);
        SpriteSystem_LoadAnimResObjFromOpenNarc(
            data->spriteRenderer,
            data->spriteGfxHandler,
            data->narcA101,
            14,
            TRUE,
            55514);
    } else {
        SpriteSystem_LoadCharResObjFromOpenNarc(
            data->spriteRenderer,
            data->spriteGfxHandler,
            data->narcA101,
            9,
            TRUE,
            NNS_G2D_VRAM_TYPE_2DMAIN,
            55518);
        SpriteSystem_LoadCellResObjFromOpenNarc(
            data->spriteRenderer,
            data->spriteGfxHandler,
            data->narcA101,
            10,
            TRUE,
            55514);
        SpriteSystem_LoadAnimResObjFromOpenNarc(
            data->spriteRenderer,
            data->spriteGfxHandler,
            data->narcA101,
            11,
            TRUE,
            55514);
    }
    SpriteSystem_LoadPlttResObjFromOpenNarc(
        data->spriteRenderer,
        data->spriteGfxHandler,
        data->narcA101,
        15,
        FALSE,
        1,
        NNS_G2D_VRAM_TYPE_2DMAIN,
        55518);
    SpriteSystem_LoadPlttResObjFromOpenNarc(
        data->spriteRenderer,
        data->spriteGfxHandler,
        data->narcA101,
        15,
        FALSE,
        1,
        NNS_G2D_VRAM_TYPE_2DMAIN,
        55519);
}

static void RegisterHallOfFame_IndivMonsScene_UnloadMonOverworldSprite(RegisterHallOfFameData *data) {
    SpriteManager_UnloadPlttObjById(data->spriteGfxHandler, 55518);
    SpriteManager_UnloadPlttObjById(data->spriteGfxHandler, 55519);
    SpriteManager_UnloadCharObjById(data->spriteGfxHandler, 55518);
    SpriteManager_UnloadCellObjById(data->spriteGfxHandler, 55514);
    SpriteManager_UnloadAnimObjById(data->spriteGfxHandler, 55514);
}

static void RegisterHallOfFame_IndivMonsScene_SetMon3dSpriteTex(RegisterHallOfFameData *data, RegisterHofMon *hofMon, int picIdx) {
    NNSG3dResTex *resTex;
    void *fileData;
    const void *texData;
    u32 imageLoc = NNS_G2dGetImageLocation(Sprite_GetImageProxy(data->monPics[picIdx]->sprite), NNS_G2D_VRAM_TYPE_2DMAIN);
    int spriteSquareDim = hofMon->followPokeParam[1] ? 8 : 4;
    u32 size = 32 * spriteSquareDim * spriteSquareDim;
    int fileno = RegisterHallOfFame_GetMmodelBySpeciesFormGender(hofMon->species, hofMon->form, hofMon->gender);
    fileData = AllocAndReadWholeNarcMemberByIdPair(NARC_data_mmodel_mmodel, fileno, HEAP_ID_REGISTER_HALL_OF_FAME);
    resTex = NNS_G3dGetTex(fileData);
    texData = NNS_G3dGetTexData(resTex);
    void *buffer = AllocFromHeap(HEAP_ID_REGISTER_HALL_OF_FAME, size);
    for (u8 i = 0; i < 8; ++i) {
        sub_020145B4((const u8 *)texData + size * i, spriteSquareDim, 0, 0, spriteSquareDim, spriteSquareDim, buffer);
        RegisterHallOfFame_ReplaceSpriteChar(buffer, imageLoc + size * i, size);
    }
    FreeToHeap(buffer);

    u32 plttLoc = NNS_G2dGetImagePaletteLocation(Sprite_GetPaletteProxy(data->monPics[picIdx]->sprite), NNS_G2D_VRAM_TYPE_2DMAIN);
    const void *loadPos = NNS_G3dGetPlttData(resTex);
    if (MonIsShiny(hofMon->mon) == TRUE) {
        loadPos = (const u8 *)loadPos + 0x20;
    }
    RegisterHallOfFame_ReplaceSpritePltt(loadPos, plttLoc, 0x20);
    FreeToHeap(fileData);
}

static void RegisterHallOfFame_IndivMons_InitBgLayers(RegisterHallOfFameData *data) {
    {
        GraphicsModes graphicsModes = sGraphicsModes_IndivMons;
        SetBothScreensModesAndDisable(&graphicsModes);
    }

    {
        BgTemplate bgTemplate = sBgTemplate_IndivMons_Main0;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_0, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_0);
        BG_ClearCharDataRange(GF_BG_LYR_MAIN_0, 0x20, 0x0000, HEAP_ID_REGISTER_HALL_OF_FAME);
    }

    {
        BgTemplate bgTemplate = sBgTemplate_IndivMons_Main1;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_1, &bgTemplate, GF_BG_TYPE_TEXT);
    }

    {
        BgTemplate bgTemplate = sBgTemplate_IndivMons_Main2;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_2, &bgTemplate, GF_BG_TYPE_TEXT);
    }

    {
        BgTemplate bgTemplate = sBgTemplate_IndivMons_Main3;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_3, &bgTemplate, GF_BG_TYPE_TEXT);
    }
}

static void RegisterHallOfFame_IndivMons_DeleteBgTilemapBuffers(RegisterHallOfFameData *data) {
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_3);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_0);
}

static void RegisterHallOfFames_IndivMons_LoadBgGfx(RegisterHallOfFameData *data) {
    GfGfxLoader_LoadScrnDataFromOpenNarc(data->narcA101, 0, data->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, TRUE, HEAP_ID_REGISTER_HALL_OF_FAME);
    GfGfxLoader_LoadScrnDataFromOpenNarc(data->narcA101, 1, data->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_REGISTER_HALL_OF_FAME);
    GfGfxLoader_LoadScrnDataFromOpenNarc(data->narcA101, 2, data->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_REGISTER_HALL_OF_FAME);
    GfGfxLoader_LoadCharDataFromOpenNarc(data->narcA101, 3, data->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, TRUE, HEAP_ID_REGISTER_HALL_OF_FAME);
    GfGfxLoader_GXLoadPalFromOpenNarc(data->narcA101, 4, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0, 0x20, HEAP_ID_REGISTER_HALL_OF_FAME);
}

static void RegisterHallOfFame_IndivMonsScene_InitWindows(RegisterHallOfFameData *data) {
    for (u32 i = 0; i < 7; ++i) {
        AddWindow(data->bgConfig, &data->windows[i], &sIndivMonsSceneWindowTemplates[i]);
    }

    FillWindowPixelBuffer(&data->windows[0], 0);
    ReadMsgDataIntoString(data->msgData, msg_0180_00000, data->strbuf1); // The Hall of Fame!
    AddTextPrinterParameterizedWithColor(&data->windows[0], 0, data->strbuf1, 128 - FontID_String_GetWidth(0, data->strbuf1, 0) / 2, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 2, 0), NULL);
    CopyWindowPixelsToVram_TextMode(&data->windows[0]);
}

static void RegisterHallOfFame_IndivMonsScene_RemoveWindows(RegisterHallOfFameData *data) {
    for (u32 i = 0; i < 7; ++i) {
        RemoveWindow(&data->windows[i]);
    }
}

static void RegisterHallOfFame_IndivMonsScene_PrintMonDetailsOnWindow(RegisterHallOfFameData *data, u16 monIdx, int windowIdx) {
    Window *windows = &data->windows[windowIdx];
    RegisterHofMon *hofMon = &data->mons[monIdx];
    Pokemon *mon = hofMon->mon;
    BoxPokemon *boxmon = Mon_GetBoxMon(mon);

    FillWindowPixelBuffer(&windows[0], 0);
    ReadMsgDataIntoString(data->msgData, msg_0180_00004, data->strbuf1);
    BufferBoxMonNickname(data->msgFormat, 0, boxmon);
    StringExpandPlaceholders(data->msgFormat, data->strbuf2, data->strbuf1);
    AddTextPrinterParameterizedWithColor(&windows[0], 0, data->strbuf2, 2, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 2, 0), NULL);
    CopyWindowPixelsToVram_TextMode(&windows[0]);

    FillWindowPixelBuffer(&windows[1], 0);
    if (hofMon->gender == MON_GENDERLESS || !hofMon->printGender) {
        ReadMsgDataIntoString(data->msgData, msg_0180_00003, data->strbuf1);
    } else if (hofMon->gender == MON_MALE) {
        ReadMsgDataIntoString(data->msgData, msg_0180_00001, data->strbuf1);
    } else if (hofMon->gender == MON_FEMALE) {
        ReadMsgDataIntoString(data->msgData, msg_0180_00002, data->strbuf1);
    } else {
        ReadMsgDataIntoString(data->msgData, msg_0180_00003, data->strbuf1);
    }
    BufferBoxMonSpeciesName(data->msgFormat, 0, boxmon);
    StringExpandPlaceholders(data->msgFormat, data->strbuf2, data->strbuf1);
    AddTextPrinterParameterizedWithColor(&windows[1], 0, data->strbuf2, 2, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 2, 0), NULL);

    ReadMsgDataIntoString(data->msgData, msg_0180_00005, data->strbuf1);
    BufferIntegerAsString(data->msgFormat, 0, hofMon->level, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
    StringExpandPlaceholders(data->msgFormat, data->strbuf2, data->strbuf1);
    AddTextPrinterParameterizedWithColor(&windows[1], 0, data->strbuf2, 2, 16, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 2, 0), NULL);
    CopyWindowPixelsToVram_TextMode(&windows[1]);

    FillWindowPixelBuffer(&windows[2], 0);
    ReadMsgDataIntoString(data->msgData, msg_0180_00006, data->strbuf1);
    BufferBoxMonOTName(data->msgFormat, 0, boxmon);
    StringExpandPlaceholders(data->msgFormat, data->strbuf2, data->strbuf1);
    AddTextPrinterParameterizedWithColor(&windows[2], 0, data->strbuf2, 2, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 2, 0), NULL);

    switch (RegisterHallOfFame_GetMetLocationType(data, mon, data->args->profile)) {
    case REGHOF_METLOC_CAUGHT:
        ReadMsgDataIntoString(data->msgData, msg_0180_00007, data->strbuf1);
        BufferLandmarkName(data->msgFormat, 0, hofMon->metLocation);
        StringExpandPlaceholders(data->msgFormat, data->strbuf2, data->strbuf1);
        break;
    case REGHOF_METLOC_HATCHED:
        ReadMsgDataIntoString(data->msgData, msg_0180_00008, data->strbuf1);
        BufferLandmarkName(data->msgFormat, 0, hofMon->metLocation);
        StringExpandPlaceholders(data->msgFormat, data->strbuf2, data->strbuf1);
        break;
    case REGHOF_METLOC_TRADED:
        ReadMsgDataIntoString(data->msgData, msg_0180_00009, data->strbuf2);
        break;
    case REGHOF_METLOC_KANTO:
        ReadMsgDataIntoString(data->msgData, msg_0180_00010, data->strbuf2);
        break;
    case REGHOF_METLOC_HOENN:
        ReadMsgDataIntoString(data->msgData, msg_0180_00011, data->strbuf2);
        break;
    case REGHOF_METLOC_SINNOH:
        ReadMsgDataIntoString(data->msgData, msg_0180_00014, data->strbuf2);
        break;
    case REGHOF_METLOC_ORRE:
        ReadMsgDataIntoString(data->msgData, msg_0180_00012, data->strbuf2);
        break;
    case REGHOF_METLOC_FATEFUL:
        ReadMsgDataIntoString(data->msgData, msg_0180_00013, data->strbuf2);
        break;
    case REGHOF_METLOC_SHUCKIE:
    case REGHOF_METLOC_KENYA:
        ReadMsgDataIntoString(data->msgData, msg_0180_00015, data->strbuf1);
        BufferLandmarkName(data->msgFormat, 0, hofMon->metLocation);
        StringExpandPlaceholders(data->msgFormat, data->strbuf2, data->strbuf1);
        break;
    }
    AddTextPrinterParameterizedWithColor(&windows[2], 0, data->strbuf2, 2, 24, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 2, 0), NULL);
    CopyWindowPixelsToVram_TextMode(&windows[2]);
}

static void RegisterHallOfFame_IndivMonsScene_CreateMonSpriteAndEnableObjLayer(RegisterHallOfFameData *data, int monIdx) {
    RegisterHallOfFame_IndivMonsScene_CreateMonSprites(data, monIdx);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
}

static void RegisterHallOfFame_IndivMonsScene_DeleteSprites(RegisterHallOfFameData *data) {
    for (u32 i = 0; i < 15; ++i) {
        RegisterHallOfFame_DeletePicByIndex(data, i);
    }
    RegisterHallOfFame_IndivMonsScene_UnloadMonOverworldSprite(data);
    RegisterHallOfFame_IndivMonsScene_UnloadSpriteGfx(data);
}

static void RegisterHallOfFame_IndivMonsScene_CreateMonSprites(RegisterHallOfFameData *data, int monIdx) {
    RegisterHofMon *hofMon = &data->mons[monIdx];
    RegisterHallOfFame_IndivMonsScene_LoadSpriteGfx(data);
    RegisterHallOfFame_IndivMonsScene_LoadMonOverworldSprite(data, hofMon);
    for (int i = 0; i <= 5u; ++i) {
        data->monPics[i] = SpriteSystem_NewSprite(data->spriteRenderer, data->spriteGfxHandler, &sPicTemplates[i]);
    }
    RegisterHallOfFame_IndivMonsScene_SetPicGfxAndPltt(data, hofMon, 2, REGHOF_PIC_INDIV_FRONT);
    RegisterHallOfFame_IndivMonsScene_SetPicGfxAndPltt(data, hofMon, 0, REGHOF_PIC_INDIV_BACK);
    RegisterHallOfFame_IndivMonsScene_SetMon3dSpriteTex(data, hofMon, REGHOF_PIC_INDIV_OWSPRITE);
    if (hofMon->species == SPECIES_KRABBY || hofMon->species == SPECIES_KINGLER) {
        RegisterHallOfFame_StartPicAnimSeq(data, REGHOF_PIC_INDIV_OWSPRITE, 2);
        RegisterHallOfFame_StartPicAnimSeq(data, REGHOF_PIC_INDIV_OWSPRITE_SHADOW, 2);
    }
    RegisterHallOfFame_SetSilhouettePalette(data, REGHOF_PIC_INDIV_FRONT_SHADOW, REGHOF_SILHOUETTE_PAL_BLACK);
    RegisterHallOfFame_SetSilhouettePalette(data, REGHOF_PIC_INDIV_BACK_SHADOW, REGHOF_SILHOUETTE_PAL_BLACK);
    RegisterHallOfFame_SetSilhouettePalette(data, REGHOF_PIC_INDIV_OWSPRITE_SHADOW, REGHOF_SILHOUETTE_PAL_BLACK);
}

static void RegisterHallOfFame_IndivMonsScene_SetOverworldSpritePos(RegisterHallOfFameData *data, RegisterHofMon *mon) {
    if (mon->followPokeParam[1]) {
        ManagedSprite_OffsetPositionXY(data->monPics[REGHOF_PIC_INDIV_OWSPRITE], -32, -32);
        ManagedSprite_OffsetPositionXY(data->monPics[REGHOF_PIC_INDIV_OWSPRITE_SHADOW], -32, -32);
    } else {
        ManagedSprite_OffsetPositionXY(data->monPics[REGHOF_PIC_INDIV_OWSPRITE], -16, -16);
        ManagedSprite_OffsetPositionXY(data->monPics[REGHOF_PIC_INDIV_OWSPRITE_SHADOW], -16, -16);
    }
}

static void RegisterHallOfFame_IndivMons_ResetBgAndSpritePos(RegisterHallOfFameData *data) {
    RegisterHofMon *hofMon = &data->mons[data->curMonIndex];

    RegisterHallOfFame_IndivMonsScene_CreateMonSpriteAndEnableObjLayer(data, data->curMonIndex);
    BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_0);
    ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_X, 0);
    ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_Y, 0);
    if ((data->curMonIndex & 1) == 0) {
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SET_X, 0);
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SET_Y, 0);
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, 0);
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, 0);
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_X, 0);
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, 0);
        ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_FRONT], 256, -40);
        ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_FRONT_SHADOW], 296, -80);
        ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_BACK], 288, 152 + hofMon->yOffset);
        ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_BACK_SHADOW], 296, 152 + hofMon->yOffset);
        ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_OWSPRITE], -82, -2);
        ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_OWSPRITE_SHADOW], -89, -3);
        RegisterHallOfFame_IndivMonsScene_PrintMonDetailsOnWindow(data, data->curMonIndex, 1);
    } else {
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SET_X, 0);
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SET_Y, 256);
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, -184);
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, 0);
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_X, 256);
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, 0);
        ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_FRONT], 0, -40);
        ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_FRONT_SHADOW], -40, -80);
        ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_BACK], -80, 152 + hofMon->yOffset);
        ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_BACK_SHADOW], -92, 152 + hofMon->yOffset);
        ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_OWSPRITE], 338, -2);
        ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_OWSPRITE_SHADOW], 345, -3);
        RegisterHallOfFame_IndivMonsScene_PrintMonDetailsOnWindow(data, data->curMonIndex, 4);
    }
    ManagedSprite_SetAffineOverwriteMode(data->monPics[REGHOF_PIC_INDIV_FRONT], 2);
    ManagedSprite_SetAffineOverwriteMode(data->monPics[REGHOF_PIC_INDIV_FRONT_SHADOW], 2);
    ManagedSprite_SetAffineScale(data->monPics[REGHOF_PIC_INDIV_FRONT_SHADOW], 1.5, 1.5);
    RegisterHallOfFame_IndivMonsScene_SetOverworldSpritePos(data, hofMon);
    ScheduleBgTilemapBufferTransfer(data->bgConfig, GF_BG_LYR_MAIN_0);
}

static BOOL RegisterHallOfFame_ShowMon_LeftSide(RegisterHallOfFameData *data) {
    switch (data->subprocStage) {
    case REGHOF_INDIV_SUBPROC_FLY_IN_BACKPIC:
        if (data->subprocTimer == 10) {
            u8 yOffset = data->mons[data->curMonIndex].yOffset;
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SET_X, -72);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, 72);
            ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_BACK], 48, yOffset + 152);
            ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_BACK_SHADOW], 46, yOffset + 152);
            data->subprocTimer = 0;
            ++data->subprocStage;
        } else {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SUB_X, 7);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_ADD_X, 7);
            ManagedSprite_OffsetPositionXY(data->monPics[REGHOF_PIC_INDIV_BACK], -24, 0);
            ManagedSprite_OffsetPositionXY(data->monPics[REGHOF_PIC_INDIV_BACK_SHADOW], -25, 0);
            ++data->subprocTimer;
        }
        break;
    case REGHOF_INDIV_SUBPROC_BACKPIC_CRY:
        data->requestUnsilhouetteBackpic = TRUE;
        ++data->subprocStage;
        break;
    case REGHOF_INDIV_SUBPROC_HOLD_BACKPIC:
        if (data->subprocTimer == 50) {
            data->subprocTimer = 0;
            ++data->subprocStage;
        } else {
            ++data->subprocTimer;
        }
        break;
    case REGHOF_INDIV_SUBPROC_FLY_IN_OVERWORLD_SPRITE:
        if (data->subprocTimer == 6) {
            ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_OWSPRITE], 32, 40);
            ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_OWSPRITE_SHADOW], 31, 39);
            RegisterHallOfFame_IndivMonsScene_SetOverworldSpritePos(data, &data->mons[data->curMonIndex]);
            data->subprocTimer = 0;
            ++data->subprocStage;
        } else {
            ManagedSprite_OffsetPositionXY(data->monPics[REGHOF_PIC_INDIV_OWSPRITE], 19, 7);
            ManagedSprite_OffsetPositionXY(data->monPics[REGHOF_PIC_INDIV_OWSPRITE_SHADOW], 20, 7);
            ++data->subprocTimer;
        }
        break;
    case REGHOF_INDIV_SUBPROC_ANIM_OVERWORLD_SPRITE:
        if (data->mons[data->curMonIndex].species == SPECIES_KRABBY || data->mons[data->curMonIndex].species == SPECIES_KINGLER) {
            RegisterHallOfFame_StartPicAnimSeq(data, REGHOF_PIC_INDIV_OWSPRITE, 3);
            RegisterHallOfFame_StartPicAnimSeq(data, REGHOF_PIC_INDIV_OWSPRITE_SHADOW, 3);
        } else {
            RegisterHallOfFame_StartPicAnimSeq(data, REGHOF_PIC_INDIV_OWSPRITE, 1);
            RegisterHallOfFame_StartPicAnimSeq(data, REGHOF_PIC_INDIV_OWSPRITE_SHADOW, 1);
        }
        ++data->subprocStage;
        break;
    case REGHOF_INDIV_SUBPROC_HOLD_OVERWORLD_SPRITE:
        if (data->subprocTimer == 20) {
            data->subprocTimer = 0;
            ++data->subprocStage;
        } else {
            ++data->subprocTimer;
        }
        break;
    case REGHOF_INDIV_SUBPROC_SHOW_HEADER_WINDOW:
        ScheduleWindowCopyToVram(&data->windows[0]);
        ++data->subprocStage;
        break;
    case REGHOF_INDIV_SUBPROC_HOLD_HEADER_WINDOW:
        if (data->subprocTimer == 60) {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, -16);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, 256);
            ManagedSprite_SetPriority(data->monPics[REGHOF_PIC_INDIV_BACK], 2);
            ManagedSprite_SetPriority(data->monPics[REGHOF_PIC_INDIV_BACK_SHADOW], 2);
            data->subprocTimer = 0;
            ++data->subprocStage;
        } else {
            ++data->subprocTimer;
        }
        break;
    case REGHOF_INDIV_SUBPROC_FLY_IN_FRONTPIC:
        if (data->subprocTimer == 8) {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, 112);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, 192);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, 256);
            ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_FRONT], 88, 88);
            ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_FRONT_SHADOW], 104, 72);
            data->subprocTimer = 0;
            ++data->subprocStage;
        } else {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_ADD_X, 16);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SUB_Y, 8);
            ManagedSprite_OffsetPositionXY(data->monPics[REGHOF_PIC_INDIV_FRONT], -21, 16);
            ManagedSprite_OffsetPositionXY(data->monPics[REGHOF_PIC_INDIV_FRONT_SHADOW], -24, 19);
            ++data->subprocTimer;
        }
        break;
    case REGHOF_INDIV_SUBPROC_SILHOUETTE_BACKPIC_OVERWORLD_SPRITES:
        ScheduleWindowCopyToVram(&data->windows[1]);
        RegisterHallOfFame_SetSilhouettePalette(data, 2, REGHOF_SILHOUETTE_PAL_BLACK);
        RegisterHallOfFame_SetSilhouettePalette(data, 4, REGHOF_SILHOUETTE_PAL_BLACK);
        RegisterHallOfFame_SetSilhouettePalette(data, 3, REGHOF_SILHOUETTE_PAL_RED);
        RegisterHallOfFame_SetSilhouettePalette(data, 5, REGHOF_SILHOUETTE_PAL_RED);
        ++data->subprocStage;
        break;
    case REGHOF_INDIV_SUBPROC_HOLD_FRONTPIC:
        if (data->subprocTimer == 40) {
            data->subprocTimer = 0;
            ++data->subprocStage;
        } else {
            ++data->subprocTimer;
        }
        break;
    case REGHOF_INDIV_SUBPROC_PRINT_MON_SPECIES_LEVEL_GENDER_AND_CRY:
        ScheduleWindowCopyToVram(&data->windows[2]);
        data->requestUnsilhouetteFrontpic = TRUE;
        ++data->subprocStage;
        break;
    case REGHOF_INDIV_SUBPROC_HOLD_MON_SPECIES_LEVEL_GENDER:
        if (data->subprocTimer == 20) {
            data->subprocTimer = 0;
            ++data->subprocStage;
        } else {
            ++data->subprocTimer;
        }
        break;
    case REGHOF_INDIV_SUBPROC_PRINT_MON_CAUGHT_DETAIL:
        ScheduleWindowCopyToVram(&data->windows[3]);
        ++data->subprocStage;
        break;
    case REGHOF_INDIV_SUBPROC_HOLD_MON_CAUGHT_DETAIL:
        if (data->subprocTimer == 240) {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, 72);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, 0);
            ManagedSprite_SetPriority(data->monPics[REGHOF_PIC_INDIV_FRONT], 3);
            ManagedSprite_SetPriority(data->monPics[REGHOF_PIC_INDIV_FRONT_SHADOW], 3);
            ManagedSprite_SetPriority(data->monPics[REGHOF_PIC_INDIV_BACK], 3);
            ManagedSprite_SetPriority(data->monPics[REGHOF_PIC_INDIV_BACK_SHADOW], 3);
            ManagedSprite_SetPriority(data->monPics[REGHOF_PIC_INDIV_OWSPRITE], 3);
            ManagedSprite_SetPriority(data->monPics[REGHOF_PIC_INDIV_OWSPRITE_SHADOW], 3);
            data->unk_13058 = 1.0f;
            data->unk_1305C = 1.5f;
            data->subprocTimer = 0;
            ++data->subprocStage;
        } else {
            ++data->subprocTimer;
        }
        break;
    case REGHOF_INDIV_SUBPROC_FLY_OUT:
        if (data->subprocTimer == 10) {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_X, -80);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_Y, -200);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SET_X, 0);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, 0);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_X, 60);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, 226);
            ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_BACK], 148, 252);
            ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_BACK_SHADOW], 64, 192);
            ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_OWSPRITE], -28, -30);
            ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_OWSPRITE_SHADOW], -29, -31);
            ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_FRONT], 48, 128);
            ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_FRONT_SHADOW], 64, 112);
            ManagedSprite_SetAffineScale(data->monPics[REGHOF_PIC_INDIV_FRONT], 1.8f, 1.8f);
            ManagedSprite_SetAffineScale(data->monPics[REGHOF_PIC_INDIV_FRONT_SHADOW], 2.0f, 2.0f);
            data->subprocTimer = 0;
            ++data->subprocStage;
        } else {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SUB_X, 8);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_ADD_Y, 20);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_ADD_X, 7);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SUB_X, 7);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_ADD_X, 6);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SUB_Y, 3);
            ManagedSprite_OffsetPositionXY(data->monPics[REGHOF_PIC_INDIV_BACK], 10, 10);
            ManagedSprite_OffsetPositionXY(data->monPics[REGHOF_PIC_INDIV_BACK_SHADOW], 10, 10);
            ManagedSprite_OffsetPositionXY(data->monPics[REGHOF_PIC_INDIV_OWSPRITE], -6, -7);
            ManagedSprite_OffsetPositionXY(data->monPics[REGHOF_PIC_INDIV_OWSPRITE_SHADOW], -6, -7);
            ManagedSprite_OffsetPositionXY(data->monPics[REGHOF_PIC_INDIV_FRONT], -4, 4);
            ManagedSprite_OffsetPositionXY(data->monPics[REGHOF_PIC_INDIV_FRONT_SHADOW], -4, 4);
            data->unk_13058 += 0.08;
            data->unk_1305C += 0.05;
            ManagedSprite_SetAffineScale(data->monPics[REGHOF_PIC_INDIV_FRONT], data->unk_13058, data->unk_13058);
            ManagedSprite_SetAffineScale(data->monPics[REGHOF_PIC_INDIV_FRONT_SHADOW], data->unk_1305C, data->unk_1305C);
            ++data->subprocTimer;
        }
        break;
    case REGHOF_INDIV_SUBPROC_TAIL_DELAY:
        if (data->subprocTimer == 60) {
            return FALSE;
        } else {
            ++data->subprocTimer;
        }
        break;
    }

    return TRUE;
}

static BOOL RegisterHallOfFame_ShowMon_RightSide(RegisterHallOfFameData *data) {
    switch (data->subprocStage) {
    case REGHOF_INDIV_SUBPROC_FLY_IN_BACKPIC:
        if (data->subprocTimer == 10) {
            u8 yOffset = data->mons[data->curMonIndex].yOffset;
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SET_X, 72);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, -256);
            ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_BACK], 160, yOffset + 152);
            ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_BACK_SHADOW], 158, yOffset + 152);
            data->subprocTimer = 0;
            ++data->subprocStage;
        } else {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_ADD_X, 7);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SUB_X, 7);
            ManagedSprite_OffsetPositionXY(data->monPics[REGHOF_PIC_INDIV_BACK], 24, 0);
            ManagedSprite_OffsetPositionXY(data->monPics[REGHOF_PIC_INDIV_BACK_SHADOW], 25, 0);
            ++data->subprocTimer;
        }
        break;
    case REGHOF_INDIV_SUBPROC_BACKPIC_CRY:
        data->requestUnsilhouetteBackpic = TRUE;
        ++data->subprocStage;
        break;
    case REGHOF_INDIV_SUBPROC_HOLD_BACKPIC:
        if (data->subprocTimer == 50) {
            data->subprocTimer = 0;
            ++data->subprocStage;
        } else {
            ++data->subprocTimer;
        }
        break;
    case REGHOF_INDIV_SUBPROC_FLY_IN_OVERWORLD_SPRITE:
        if (data->subprocTimer == 6) {
            ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_OWSPRITE], 224, 40);
            ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_OWSPRITE_SHADOW], 225, 39);
            RegisterHallOfFame_IndivMonsScene_SetOverworldSpritePos(data, &data->mons[data->curMonIndex]);
            data->subprocTimer = 0;
            ++data->subprocStage;
        } else {
            ManagedSprite_OffsetPositionXY(data->monPics[REGHOF_PIC_INDIV_OWSPRITE], -19, 7);
            ManagedSprite_OffsetPositionXY(data->monPics[REGHOF_PIC_INDIV_OWSPRITE_SHADOW], -20, 7);
            ++data->subprocTimer;
        }
        break;
    case REGHOF_INDIV_SUBPROC_ANIM_OVERWORLD_SPRITE:
        if (data->mons[data->curMonIndex].species == 98 || data->mons[data->curMonIndex].species == 99) {
            RegisterHallOfFame_StartPicAnimSeq(data, REGHOF_PIC_INDIV_OWSPRITE, 3);
            RegisterHallOfFame_StartPicAnimSeq(data, REGHOF_PIC_INDIV_OWSPRITE_SHADOW, 3);
        } else {
            RegisterHallOfFame_StartPicAnimSeq(data, REGHOF_PIC_INDIV_OWSPRITE, 1);
            RegisterHallOfFame_StartPicAnimSeq(data, REGHOF_PIC_INDIV_OWSPRITE_SHADOW, 1);
        }
        ++data->subprocStage;
        break;
    case REGHOF_INDIV_SUBPROC_HOLD_OVERWORLD_SPRITE:
        if (data->subprocTimer == 20) {
            data->subprocTimer = 0;
            ++data->subprocStage;
        } else {
            ++data->subprocTimer;
        }
        break;
    case REGHOF_INDIV_SUBPROC_SHOW_HEADER_WINDOW:
        ScheduleWindowCopyToVram(&data->windows[0]);
        ++data->subprocStage;
        break;
    case REGHOF_INDIV_SUBPROC_HOLD_HEADER_WINDOW:
        if (data->subprocTimer == 60) {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, 272);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, 256);
            ManagedSprite_SetPriority(data->monPics[REGHOF_PIC_INDIV_BACK], 2);
            ManagedSprite_SetPriority(data->monPics[REGHOF_PIC_INDIV_BACK_SHADOW], 2);
            data->subprocTimer = 0;
            ++data->subprocStage;
        } else {
            ++data->subprocTimer;
        }
        break;
    case REGHOF_INDIV_SUBPROC_FLY_IN_FRONTPIC:
        if (data->subprocTimer == 8) {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, 144);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, 192);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, 256);
            ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_FRONT], 168, 88);
            ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_FRONT_SHADOW], 152, 72);
            data->subprocTimer = 0;
            ++data->subprocStage;
        } else {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SUB_X, 16);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SUB_Y, 8);
            ManagedSprite_OffsetPositionXY(data->monPics[REGHOF_PIC_INDIV_FRONT], 21, 16);
            ManagedSprite_OffsetPositionXY(data->monPics[REGHOF_PIC_INDIV_FRONT_SHADOW], 24, 19);
            ++data->subprocTimer;
        }
        break;
    case REGHOF_INDIV_SUBPROC_SILHOUETTE_BACKPIC_OVERWORLD_SPRITES:
        ScheduleWindowCopyToVram(&data->windows[4]);
        RegisterHallOfFame_SetSilhouettePalette(data, 2, REGHOF_SILHOUETTE_PAL_BLACK);
        RegisterHallOfFame_SetSilhouettePalette(data, 4, REGHOF_SILHOUETTE_PAL_BLACK);
        RegisterHallOfFame_SetSilhouettePalette(data, 3, REGHOF_SILHOUETTE_PAL_RED);
        RegisterHallOfFame_SetSilhouettePalette(data, 5, REGHOF_SILHOUETTE_PAL_RED);
        ++data->subprocStage;
        break;
    case REGHOF_INDIV_SUBPROC_HOLD_FRONTPIC:
        if (data->subprocTimer == 40) {
            data->subprocTimer = 0;
            ++data->subprocStage;
        } else {
            ++data->subprocTimer;
        }
        break;
    case REGHOF_INDIV_SUBPROC_PRINT_MON_SPECIES_LEVEL_GENDER_AND_CRY:
        ScheduleWindowCopyToVram(&data->windows[5]);
        data->requestUnsilhouetteFrontpic = TRUE;
        ++data->subprocStage;
        break;
    case REGHOF_INDIV_SUBPROC_HOLD_MON_SPECIES_LEVEL_GENDER:
        if (data->subprocTimer == 20) {
            data->subprocTimer = 0;
            ++data->subprocStage;
        } else {
            ++data->subprocTimer;
        }
        break;
    case REGHOF_INDIV_SUBPROC_PRINT_MON_CAUGHT_DETAIL:
        ScheduleWindowCopyToVram(&data->windows[6]);
        ++data->subprocStage;
        break;
    case REGHOF_INDIV_SUBPROC_HOLD_MON_CAUGHT_DETAIL:
        if (data->subprocTimer == 240) {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, -256);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, 0);
            ManagedSprite_SetPriority(data->monPics[REGHOF_PIC_INDIV_FRONT], 3);
            ManagedSprite_SetPriority(data->monPics[REGHOF_PIC_INDIV_FRONT_SHADOW], 3);
            ManagedSprite_SetPriority(data->monPics[REGHOF_PIC_INDIV_BACK], 3);
            ManagedSprite_SetPriority(data->monPics[REGHOF_PIC_INDIV_BACK_SHADOW], 3);
            ManagedSprite_SetPriority(data->monPics[REGHOF_PIC_INDIV_OWSPRITE], 3);
            ManagedSprite_SetPriority(data->monPics[REGHOF_PIC_INDIV_OWSPRITE_SHADOW], 3);
            data->unk_13058 = 1.0f;
            data->unk_1305C = 1.5f;
            data->subprocTimer = 0;
            ++data->subprocStage;
        } else {
            ++data->subprocTimer;
        }
        break;
    case REGHOF_INDIV_SUBPROC_FLY_OUT:
        if (data->subprocTimer == 10) {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_X, 80);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_Y, -200);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SET_X, 0);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, -184);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_X, 196);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, 226);
            ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_BACK], 260, 252);
            ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_BACK_SHADOW], 192, 192);
            ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_OWSPRITE], 164, -30);
            ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_OWSPRITE_SHADOW], 165, -31);
            ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_FRONT], 208, 128);
            ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_INDIV_FRONT_SHADOW], 192, 112);
            ManagedSprite_SetAffineScale(data->monPics[REGHOF_PIC_INDIV_FRONT], 1.8f, 1.8f);
            ManagedSprite_SetAffineScale(data->monPics[REGHOF_PIC_INDIV_FRONT_SHADOW], 2.0f, 2.0f);
            data->subprocTimer = 0;
            ++data->subprocStage;
        } else {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_ADD_X, 8);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_ADD_Y, 20);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SUB_X, 7);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_ADD_X, 7);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SUB_X, 6);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SUB_Y, 3);
            ManagedSprite_OffsetPositionXY(data->monPics[REGHOF_PIC_INDIV_BACK], -10, 10);
            ManagedSprite_OffsetPositionXY(data->monPics[REGHOF_PIC_INDIV_BACK_SHADOW], -10, 10);
            ManagedSprite_OffsetPositionXY(data->monPics[REGHOF_PIC_INDIV_OWSPRITE], 6, -7);
            ManagedSprite_OffsetPositionXY(data->monPics[REGHOF_PIC_INDIV_OWSPRITE_SHADOW], 6, -7);
            ManagedSprite_OffsetPositionXY(data->monPics[REGHOF_PIC_INDIV_FRONT], 4, 4);
            ManagedSprite_OffsetPositionXY(data->monPics[REGHOF_PIC_INDIV_FRONT_SHADOW], 4, 4);
            data->unk_13058 += 0.08;
            data->unk_1305C += 0.05;
            ManagedSprite_SetAffineScale(data->monPics[REGHOF_PIC_INDIV_FRONT], data->unk_13058, data->unk_13058);
            ManagedSprite_SetAffineScale(data->monPics[REGHOF_PIC_INDIV_FRONT_SHADOW], data->unk_1305C, data->unk_1305C);
            ++data->subprocTimer;
        }
        break;
    case REGHOF_INDIV_SUBPROC_TAIL_DELAY:
        if (data->subprocTimer == 60) {
            return FALSE;
        } else {
            ++data->subprocTimer;
        }
        break;
    }

    return TRUE;
}

static void RegisterHallOfFame_GetPartyDetails(RegisterHallOfFameData *data) {
    u32 i;
    PokepicTemplate sp40;
    UnkStruct_02014E30 sp20[2];
    ARRAY_ASSIGN(sp20, ov63_0221FC38);
    NARC *narc = NARC_New(NARC_a_1_8_0, HEAP_ID_REGISTER_HALL_OF_FAME);
    BOOL encry;
    Pokemon *pokemon;
    RegisterHofMon *hofMon;

    for (i = 0; i < Party_GetCount(data->args->party); ++i) {
        pokemon = Party_GetMonByIndex(data->args->party, i);
        encry = AcquireMonLock(pokemon);
        if (!GetMonData(pokemon, MON_DATA_IS_EGG, NULL)) {
            hofMon = &data->mons[data->numMons];
            hofMon->mon = pokemon;
            hofMon->species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
            hofMon->personality = GetMonData(pokemon, MON_DATA_PERSONALITY, NULL);
            hofMon->form = GetMonData(pokemon, MON_DATA_FORM, NULL);
            hofMon->gender = GetMonData(pokemon, MON_DATA_GENDER, NULL);
            hofMon->yOffset = GetMonPicHeightBySpeciesGenderForm(hofMon->species, hofMon->gender, 0, hofMon->form, hofMon->personality) + 8;
            hofMon->metLocation = GetMonData(pokemon, MON_DATA_MET_LOCATION, NULL);
            hofMon->level = GetMonData(pokemon, MON_DATA_LEVEL, NULL);
            hofMon->partyIndex = i;
            if (hofMon->species == SPECIES_NIDORAN_F || hofMon->species == SPECIES_NIDORAN_M) {
                hofMon->printGender = FALSE;
            } else {
                hofMon->printGender = TRUE;
            }
            ReadWholeNarcMemberByIdPair(hofMon->followPokeParam, NARC_fielddata_tsurepoke_tp_param, SpeciesToOverworldModelIndexOffset(hofMon->species));
            GetPokemonSpriteCharAndPlttNarcIds(&sp40, pokemon, MON_PIC_FACING_FRONT);
            sub_02014510((NarcId)sp40.narcID, sp40.charDataID, HEAP_ID_REGISTER_HALL_OF_FAME, &sp20[0], hofMon->frontspriteCharbuf[0], hofMon->personality, TRUE, 2, hofMon->species);
            sub_02014510((NarcId)sp40.narcID, sp40.charDataID, HEAP_ID_REGISTER_HALL_OF_FAME, &sp20[1], hofMon->frontspriteCharbuf[1], hofMon->personality, TRUE, 2, hofMon->species);
            GetPokemonSpriteCharAndPlttNarcIds(&sp40, pokemon, MON_PIC_FACING_BACK);
            sub_02014510((NarcId)sp40.narcID, sp40.charDataID, HEAP_ID_REGISTER_HALL_OF_FAME, &sp20[0], hofMon->backspriteCharbuf[0], hofMon->personality, TRUE, 0, hofMon->species);
            sub_02014510((NarcId)sp40.narcID, sp40.charDataID, HEAP_ID_REGISTER_HALL_OF_FAME, &sp20[1], hofMon->backspriteCharbuf[1], hofMon->personality, TRUE, 0, hofMon->species);
            NARC_ReadPokepicAnimScript(narc, hofMon->frontspriteAnim, hofMon->species, 1);
            NARC_ReadPokepicAnimScript(narc, hofMon->backspriteAnim, hofMon->species, 0);
            ++data->numMons;
        }
        ReleaseMonLock(pokemon, encry);
    }
    NARC_Delete(narc);
}

static RegisterHallOfFame_MetLocationType RegisterHallOfFame_GetMetLocationType(RegisterHallOfFameData *data, Pokemon *pokemon, PlayerProfile *profile) {
    BOOL encry = AcquireMonLock(pokemon);
    RegisterHallOfFame_MetLocationType ret;
    int version = GetMonData(pokemon, MON_DATA_GAME_VERSION, NULL);
    if (version == VERSION_SAPPHIRE || version == VERSION_RUBY || version == VERSION_EMERALD) {
        ret = REGHOF_METLOC_HOENN;
    } else if (version == VERSION_FIRE_RED || version == VERSION_LEAF_GREEN) {
        ret = REGHOF_METLOC_KANTO;
    } else if (version == VERSION_GAMECUBE) {
        ret = REGHOF_METLOC_ORRE;
    } else if (version == VERSION_DIAMOND || version == VERSION_PEARL || version == VERSION_PLATINUM) {
        ret = REGHOF_METLOC_SINNOH;
    } else if (GetMonData(pokemon, MON_DATA_FATEFUL_ENCOUNTER, NULL)) {
        ret = REGHOF_METLOC_FATEFUL;
    } else if (MonIsInGameTradePoke(pokemon, NPC_TRADE_SHUCKIE_SHUCKLE) == TRUE) {
        ret = REGHOF_METLOC_SHUCKIE;
    } else if (MonIsInGameTradePoke(pokemon, NPC_TRADE_KENYA_SPEAROW) == TRUE) {
        ret = REGHOF_METLOC_KENYA;
    } else if (PlayerProfile_GetTrainerID(profile) != GetMonData(pokemon, MON_DATA_OTID, NULL)) {
        ret = REGHOF_METLOC_TRADED;
    } else {
        PlayerName_FlatToString(profile, data->strbuf1);
        GetMonData(pokemon, MON_DATA_OT_NAME_2, data->strbuf2);
        if (String_Compare(data->strbuf1, data->strbuf2)) {
            ret = REGHOF_METLOC_TRADED;
        } else if (GetMonData(pokemon, MON_DATA_MET_LOCATION, NULL) >= METLOC_DAY_CARE_COUPLE) {
            ret = REGHOF_METLOC_FATEFUL;
        } else if (GetMonData(pokemon, MON_DATA_EGG_MET_MONTH, NULL) == 0) {
            ret = REGHOF_METLOC_CAUGHT;
        } else {
            ret = REGHOF_METLOC_HATCHED;
        }
    }
    ReleaseMonLock(pokemon, encry);
    return ret;
}

static int RegisterHallOfFame_GetMmodelBySpeciesFormGender(int species, u8 form, u8 gender) {
    int ret;

    if (species <= 0 || species > SPECIES_ARCEUS) {
        ret = NARC_mmodel_mmodel_00000001_bin;
    } else {
        ret = SpeciesToOverworldModelIndexOffset(species) + NARC_mmodel_mmodel_00000297_bin;
        if (OverworldModelLookupHasFemaleForm(species)) {
            if (gender == MON_FEMALE) {
                ++ret;
            }
        } else {
            if (form > OverworldModelLookupFormCount(species)) {
                form = 0;
            }
            ret += form;
        }
    }
    return ret;
}

static void RegisterHallOfFame_CreateTask_IndivMonAnimAndCry(RegisterHallOfFameData *data, int monIdx, int picIdx, BOOL startCry, int facing) {
    RegisterHofTaskData_IndivMonAnimAndCry *taskData = AllocFromHeap(HEAP_ID_REGISTER_HALL_OF_FAME, sizeof(RegisterHofTaskData_IndivMonAnimAndCry));
    taskData->hofMon = &data->mons[monIdx];
    taskData->startCry = startCry;
    taskData->narc = data->narcA180;
    taskData->imageLocation = NNS_G2dGetImageLocation(Sprite_GetImageProxy(data->monPics[picIdx]->sprite), NNS_G2D_VRAM_TYPE_2DMAIN);
    if (facing == MON_PIC_FACING_FRONT) {
        taskData->charbuf = taskData->hofMon->frontspriteCharbuf;
        taskData->isFrontpic = 1;
        PokepicAnim_Init(&taskData->anim, taskData->hofMon->frontspriteAnim);
    } else {
        taskData->charbuf = taskData->hofMon->backspriteCharbuf;
        taskData->isFrontpic = 0;
        PokepicAnim_Init(&taskData->anim, taskData->hofMon->backspriteAnim);
    }
    SysTask_CreateOnMainQueue(Task_RegisterHallOfFame_IndivMonAnimAndCry, taskData, 0);
}

static void Task_RegisterHallOfFame_IndivMonAnimAndCry(SysTask *task, void *taskData) {
    u8 sp4;
    RegisterHofTaskData_IndivMonAnimAndCry *showPic = (RegisterHofTaskData_IndivMonAnimAndCry *)taskData;
    if (showPic->startCry == TRUE) {
        sub_020729A4(showPic->narc, &sp4, showPic->hofMon->species, showPic->isFrontpic);
        if (showPic->hofMon->species == SPECIES_CHATOT) {
            sub_02006EA0(NULL, 0, 100, 0, sp4);
        } else {
            sub_020062E0(showPic->hofMon->species, sp4, showPic->hofMon->form);
        }
        showPic->startCry = FALSE;
    }
    int animStep = PokepicAnim_Exec(&showPic->anim);
    if (animStep >= 0) {
        RegisterHallOfFame_ReplaceSpriteChar(showPic->charbuf[animStep], showPic->imageLocation, 3200);
    } else {
        FreeToHeap(showPic);
        SysTask_Destroy(task);
    }
}

static void RegisterHallOfFame_BlendAlphaFadeStep(RegisterHallOfFameData *data, u16 duration, u16 pos) {
    if (duration == pos) {
        G2_SetBlendAlpha(0, 28, 0, 0);
    } else {
        u32 ev = (0x100000u / duration * pos) / 0x10000u;
        G2_SetBlendAlpha(4, 28, ev, 16 - ev);
    }
}

static BOOL RegisterHallOfFame_WholeMonsSceneSubproc(RegisterHallOfFameData *data) {
    if (data->scrollingPolkadotBackground == TRUE) {
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SUB_X, 2);
    }
    if (data->generatingConfetti == TRUE) {
        if (data->generateConfettiDelayTimer == data->generateConfettiDelayLength) {
            s16 x = LCRandom() % 224 + 16;
            s16 y = LCRandom() % 64 + 16;
            ManagedSprite_SetPositionXY(data->monPics[REGHOF_PIC_WHOLE_TWINKLE], x, y);
            RegisterHallOfFame_StartPicAnimSeq(data, REGHOF_PIC_WHOLE_TWINKLE, 0);
            data->generateConfettiDelayLength = LCRandom() % 255 + 28;
            data->generateConfettiDelayTimer = 0;
        } else {
            ++data->generateConfettiDelayTimer;
        }
    }

    switch (data->subprocStage) {
    case REGHOF_WHOLE_SUBPROC_INITIAL_DELAY:
        if (data->subprocTimer == 20) {
            data->subprocTimer = 0;
            ++data->subprocStage;
        } else {
            ++data->subprocTimer;
        }
        break;
    case REGHOF_WHOLE_SUBPROC_FLY_IN_MONS:
        RegisterHallOfFame_MonSpritePosScaleAnimStep(data->monPics[data->curMonIndex], &sPicPosScaleAnimParams[data->curMonIndex], 6, data->subprocTimer);
        if (data->subprocTimer == 6) {
            ManagedSprite_SetAffineOverwriteMode(data->monPics[data->curMonIndex], 1);
            ++data->curMonIndex;
            data->subprocTimer = 0;
            if (data->curMonIndex == PARTY_SIZE) {
                data->curMonIndex = 0;
                ++data->subprocStage;
            }
        } else {
            ++data->subprocTimer;
        }
        break;
    case REGHOF_WHOLE_SUBPROC_DELAY_AFTER_FLY_IN:
        if (data->subprocTimer == 32) {
            data->subprocTimer = 0;
            ++data->subprocStage;
        } else {
            ++data->subprocTimer;
        }
        break;
    case REGHOF_WHOLE_SUBPROC_REQUEST_FIRST_PHOTO_FLASH:
        data->fadeDuration = 40;
        data->requestPlayFlashKanseiSfx = TRUE;
        data->requestBeginSpotlightsAndConfetti = TRUE;
        data->scrollingPolkadotBackground = TRUE;
        data->generatingConfetti = TRUE;
        ManagedSprite_SetDrawFlag(data->monPics[REGHOF_PIC_WHOLE_TWINKLE], TRUE);
        ++data->subprocStage;
        break;
    case REGHOF_WHOLE_SUBPROC_ANIMATE_MONS_SHADOWS:
        RegisterHallOfFame_BlendAlphaFadeStep(data, 80, data->subprocTimer);
        for (int i = 0; i < data->numMons; ++i) {
            RegisterHallOfFame_MonSpritePosScaleAnimStep(data->monPics[REGHOF_PIC_WHOLE_MON_SHADOW + i], &(sPicPosScaleAnimParams + 6)[i], 80, data->subprocTimer);
        }
        RegisterHallOfFame_MonSpritePosScaleAnimStep(data->monPics[REGHOF_PIC_WHOLE_PLAYER_SHADOW], &sPicPosScaleAnimParams[12], 80, data->subprocTimer);
        if (data->subprocTimer == 80) {
            data->subprocTimer = 0;
            ++data->subprocStage;
        } else {
            ++data->subprocTimer;
        }
        break;
    case REGHOF_WHOLE_SUBPROC_WAIT_BUTTON:
        if (IsPaletteFadeFinished() == TRUE) {
            if ((gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B)) || System_GetTouchNew() == TRUE) {
                data->fadeDuration = 15;
                data->requestPlayFlashKanseiSfx = TRUE;
                ++data->subprocStage;
            }
        }
        break;
    case REGHOF_WHOLE_SUBPROC_SECOND_PHOTO_FLASH:
        RegisterHallOfFame_BlendAlphaFadeStep(data, 60, data->subprocTimer);
        if (data->subprocTimer == 30) {
            if (IsPaletteFadeFinished() == TRUE) {
                data->fadeDuration = 15;
                data->unk_13060_4 = TRUE;
                ++data->subprocStage;
            }
        } else {
            ++data->subprocTimer;
        }
        // fallthrough
    case REGHOF_WHOLE_SUBPROC_WAIT_FINAL_FADEOUT:
        for (int i = 0; i < data->numMons; ++i) {
            RegisterHallOfFame_MonSpritePosScaleAnimStep(data->monPics[REGHOF_PIC_WHOLE_MON + i], &(sPicPosScaleAnimParams + 13)[i], 60, data->subprocTimer);
            RegisterHallOfFame_MonSpritePosScaleAnimStep(data->monPics[REGHOF_PIC_WHOLE_MON_SHADOW + i], &(sPicPosScaleAnimParams + 20)[i], 60, data->subprocTimer);
        }
        RegisterHallOfFame_MonSpritePosScaleAnimStep(data->monPics[REGHOF_PIC_WHOLE_PLAYER], &sPicPosScaleAnimParams[19], 60, data->subprocTimer);
        RegisterHallOfFame_MonSpritePosScaleAnimStep(data->monPics[REGHOF_PIC_WHOLE_PLAYER_SHADOW], &sPicPosScaleAnimParams[26], 60, data->subprocTimer);
        if (data->subprocStage == REGHOF_WHOLE_SUBPROC_WAIT_FINAL_FADEOUT) {
            if (data->subprocTimer == 60) {
                if (IsPaletteFadeFinished() == TRUE) {
                    data->subprocTimer = 0;
                    data->subprocStage = 0;
                    return FALSE;
                }
            } else {
                ++data->subprocTimer;
            }
        }
        break;
    }

    return TRUE;
}

static void RegisterHallOfFame_AfterFullParty_FadeFromWhite(RegisterHallOfFameData *data) {
    BeginNormalPaletteFade(3, 1, 1, RGB_WHITE, data->fadeDuration, 1, HEAP_ID_REGISTER_HALL_OF_FAME);
}

static void RegisterHallOfFame_AfterFullParty_FadeToBlack(RegisterHallOfFameData *data) {
    BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, data->fadeDuration, 1, HEAP_ID_REGISTER_HALL_OF_FAME);
}

static void VBlankTask_RegisterHallOfFame_WholePartyCongrats(SysTask *task, void *taskData) {
    RegisterHallOfFameData *data = (RegisterHallOfFameData *)taskData;
    if (data->subprocCallback != NULL && !data->subprocCallback(data)) {
        data->subprocCallback = NULL;
    }
    RegisterHallOfFame_G3Commit(data);
    DoScheduledBgGpuUpdates(data->bgConfig);
    SpriteSystem_DrawSprites(data->spriteGfxHandler);
    SpriteSystem_TransferOam();
    OS_SetIrqCheckFlag(OS_IE_V_BLANK);
}

static void RegisterHallOfFame_WholePartyScene_InitBGs(RegisterHallOfFameData *data) {
    {
        GraphicsModes graphicsModes = sGraphicsModes_WholePartyScene;
        SetBothScreensModesAndDisable(&graphicsModes);
    }

    {
        BgTemplate bgTemplate = sBgTemplate_WholePartyScene_Main1;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_1, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_1);
        BG_ClearCharDataRange(GF_BG_LYR_MAIN_1, 0x20, 0, HEAP_ID_REGISTER_HALL_OF_FAME);
    }

    {
        BgTemplate bgTemplate = sBgTemplate_WholePartyScene_Main2;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_2, &bgTemplate, GF_BG_TYPE_TEXT);
    }

    {
        BgTemplate bgTemplate = sBgTemplate_WholePartyScene_Main3;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_3, &bgTemplate, GF_BG_TYPE_TEXT);
    }

    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_OFF);
}

static void RegisterHallOfFame_WholePartyScene_DeleteBgTilemapBuffers(RegisterHallOfFameData *data) {
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_3);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_0);
}

static void RegisterHallOfFame_WholePartyScene_LoadBgGfx(RegisterHallOfFameData *data) {
    GfGfxLoader_LoadScrnDataFromOpenNarc(data->narcA101, 5, data->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_REGISTER_HALL_OF_FAME);
    GfGfxLoader_LoadScrnDataFromOpenNarc(data->narcA101, 6, data->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_REGISTER_HALL_OF_FAME);
    GfGfxLoader_LoadCharDataFromOpenNarc(data->narcA101, 7, data->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_REGISTER_HALL_OF_FAME);
    GfGfxLoader_GXLoadPalFromOpenNarc(data->narcA101, 8, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0, 0x20, HEAP_ID_REGISTER_HALL_OF_FAME);
    BG_SetMaskColor(GF_BG_LYR_MAIN_1, RGB_BLACK);
}

static void RegisterHallOfFame_WholePartyScene_InitWindows(RegisterHallOfFameData *data) {
    for (u32 i = 0; i < 2; ++i) {
        AddWindow(data->bgConfig, &data->windows[i], &sWholePartySceneWindowTemplates[i]);
    }

    FillWindowPixelBuffer(&data->windows[0], 1);
    ReadMsgDataIntoString(data->msgData, msg_0180_00016, data->strbuf1);
    AddTextPrinterParameterizedWithColor(&data->windows[0], 0, data->strbuf1, 128 - FontID_String_GetWidth(0, data->strbuf1, 0) / 2, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 2, 0), NULL);
    CopyWindowToVram(&data->windows[0]);

    FillWindowPixelBuffer(&data->windows[1], 1);
    ReadMsgDataIntoString(data->msgData, msg_0180_00017, data->strbuf2);
    BufferPlayersName(data->msgFormat, 0, data->args->profile);
    BufferIntegerAsString(data->msgFormat, 1, PlayerProfile_GetTrainerID_VisibleHalf(data->args->profile), 5, PRINTING_MODE_LEADING_ZEROS, TRUE);
    BufferIntegerAsString(data->msgFormat, 2, GetIGTHours(data->args->igt), 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
    BufferIntegerAsString(data->msgFormat, 3, GetIGTMinutes(data->args->igt), 2, PRINTING_MODE_LEADING_ZEROS, TRUE);
    StringExpandPlaceholders(data->msgFormat, data->strbuf1, data->strbuf2);
    AddTextPrinterParameterizedWithColor(&data->windows[1], 0, data->strbuf1, 128 - FontID_String_GetWidth(0, data->strbuf1, 0) / 2, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 2, 0), NULL);
    CopyWindowToVram(&data->windows[1]);
}

static void RegisterHallOfFame_WholePartyScene_DeleteWindows(RegisterHallOfFameData *data) {
    for (u32 i = 0; i < 2; ++i) {
        RemoveWindow(&data->windows[i]);
    }
}

static void RegisterHallOfFame_WholePartyScene_CreateSprites(RegisterHallOfFameData *data) {

    UnkStruct_02070D3C sp2C;
    UnkStruct_02014E30 sp1C = ov63_0221FAF0;
    NARC *narc = NARC_New(NARC_a_0_0_8, HEAP_ID_REGISTER_HALL_OF_FAME);
    u32 i;
    int tag;
    void *r4;

    SpriteSystem_LoadCellResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 77, FALSE, 55512);
    SpriteSystem_LoadAnimResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 78, FALSE, 55512);
    for (i = 0; i < 6; ++i) {
        tag = 55512 + i;
        SpriteSystem_LoadCharResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 76, FALSE, NNS_G2D_VRAM_TYPE_2DMAIN, tag);
        SpriteSystem_LoadPlttResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 75, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, tag);
    }
    SpriteSystem_LoadCharResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 76, FALSE, NNS_G2D_VRAM_TYPE_2DMAIN, 55519);
    SpriteSystem_LoadPlttResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 75, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 55520);
    SpriteSystem_LoadPlttResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 75, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 55521);
    NARC_Delete(narc);

    SpriteSystem_LoadCellResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, data->narcA101, 17, TRUE, 55515);
    SpriteSystem_LoadAnimResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, data->narcA101, 18, TRUE, 55515);
    SpriteSystem_LoadCharResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, data->narcA101, 16, TRUE, NNS_G2D_VRAM_TYPE_2DMAIN, 55520);
    SpriteSystem_LoadPlttResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, data->narcA101, 19, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 55522);

    for (i = 0; i < 6; ++i) {
        data->monPics[REGHOF_PIC_WHOLE_MON + i] = SpriteSystem_NewSprite(data->spriteRenderer, data->spriteGfxHandler, &(sPicTemplates + 6)[i]);
        data->monPics[REGHOF_PIC_WHOLE_MON_SHADOW + i] = SpriteSystem_NewSprite(data->spriteRenderer, data->spriteGfxHandler, &(sPicTemplates + 6)[i + 6]);
        if (i < data->numMons) {
            RegisterHallOfFame_IndivMonsScene_SetPicGfxAndPltt(data, &data->mons[i], 2, REGHOF_PIC_WHOLE_MON + i);
        } else {
            ManagedSprite_SetDrawFlag(data->monPics[REGHOF_PIC_WHOLE_MON + i], FALSE);
        }
        RegisterHallOfFame_BackupMonPicPalette(data, i, REGHOF_PIC_WHOLE_MON + i);
        RegisterHallOfFame_SetSilhouettePalette(data, REGHOF_PIC_WHOLE_MON + i, REGHOF_SILHOUETTE_PAL_WHITE);
        ManagedSprite_SetAffineOverwriteMode(data->monPics[REGHOF_PIC_WHOLE_MON + i], 1);
        ManagedSprite_SetAffineScale(data->monPics[REGHOF_PIC_WHOLE_MON + i], 1.0f, 1.0f);
        ManagedSprite_SetOamMode(data->monPics[REGHOF_PIC_WHOLE_MON + i], GX_OAM_MODE_NORMAL);
        ManagedSprite_SetOamMode(data->monPics[REGHOF_PIC_WHOLE_MON_SHADOW + i], GX_OAM_MODE_XLU);
        ManagedSprite_SetDrawFlag(data->monPics[REGHOF_PIC_WHOLE_MON_SHADOW + i], FALSE);
    }
    data->monPics[REGHOF_PIC_WHOLE_PLAYER] = SpriteSystem_NewSprite(data->spriteRenderer, data->spriteGfxHandler, &sPicTemplates[18]);
    data->monPics[REGHOF_PIC_WHOLE_PLAYER_SHADOW] = SpriteSystem_NewSprite(data->spriteRenderer, data->spriteGfxHandler, &sPicTemplates[19]);
    ManagedSprite_SetAffineOverwriteMode(data->monPics[REGHOF_PIC_WHOLE_PLAYER], 1);
    ManagedSprite_SetAffineOverwriteMode(data->monPics[REGHOF_PIC_WHOLE_PLAYER_SHADOW], 1);
    ManagedSprite_SetDrawFlag(data->monPics[REGHOF_PIC_WHOLE_PLAYER], FALSE);
    ManagedSprite_SetDrawFlag(data->monPics[REGHOF_PIC_WHOLE_PLAYER_SHADOW], FALSE);

    if (PlayerProfile_GetTrainerGender(data->args->profile) == TRAINER_FEMALE) {
        sub_02070D84(TRAINERCLASS_PKMN_TRAINER_LYRA, 2, &sp2C);
    } else {
        sub_02070D84(TRAINERCLASS_PKMN_TRAINER_ETHAN, 2, &sp2C);
    }
    r4 = AllocFromHeap(HEAP_ID_REGISTER_HALL_OF_FAME, 0x1900);
    sub_020143E0(sp2C.narcId, sp2C.ncbr_id, HEAP_ID_REGISTER_HALL_OF_FAME, &sp1C, r4);
    RegisterHallOfFame_ReplaceSpriteChar(r4, NNS_G2dGetImageLocation(Sprite_GetImageProxy(data->monPics[REGHOF_PIC_WHOLE_PLAYER]->sprite), NNS_G2D_VRAM_TYPE_2DMAIN), 3200);
    FreeToHeap(r4);

    GfGfxLoader_GXLoadPal(sp2C.narcId, sp2C.nclr_id, GF_PAL_LOCATION_MAIN_OBJ, (enum GFPalSlotOffset)NNS_G2dGetImagePaletteLocation(Sprite_GetPaletteProxy(data->monPics[REGHOF_PIC_WHOLE_PLAYER]->sprite), NNS_G2D_VRAM_TYPE_2DMAIN), 0x20, HEAP_ID_REGISTER_HALL_OF_FAME);

    data->monPics[REGHOF_PIC_WHOLE_TWINKLE] = SpriteSystem_NewSprite(data->spriteRenderer, data->spriteGfxHandler, &sPicTemplates[20]);
    ManagedSprite_SetDrawFlag(data->monPics[REGHOF_PIC_WHOLE_TWINKLE], FALSE);
    RegisterHallOfFame_SetSilhouettePalette(data, REGHOF_PIC_WHOLE_PLAYER_SHADOW, REGHOF_SILHOUETTE_PAL_BLACK);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
}

static void RegisterHallOfFame_AfterWholePartyView_UnloadSpriteRes(RegisterHallOfFameData *data) {
    u32 i;
    int tag;

    for (i = 0; i < 15; ++i) {
        RegisterHallOfFame_DeletePicByIndex(data, i);
    }
    SpriteManager_UnloadPlttObjById(data->spriteGfxHandler, 55522);
    SpriteManager_UnloadCharObjById(data->spriteGfxHandler, 55520);
    SpriteManager_UnloadCellObjById(data->spriteGfxHandler, 55515);
    SpriteManager_UnloadAnimObjById(data->spriteGfxHandler, 55515);
    SpriteManager_UnloadPlttObjById(data->spriteGfxHandler, 55520);
    SpriteManager_UnloadCharObjById(data->spriteGfxHandler, 55519);
    for (i = 0; i < 6; ++i) {
        tag = 55512 + i;
        SpriteManager_UnloadPlttObjById(data->spriteGfxHandler, tag);
        SpriteManager_UnloadCharObjById(data->spriteGfxHandler, tag);
    }
    SpriteManager_UnloadCellObjById(data->spriteGfxHandler, 55514);
    SpriteManager_UnloadAnimObjById(data->spriteGfxHandler, 55514);
}

static void RegisterHallOfFame_G3Init(RegisterHallOfFameData *data) {
    NNS_G3dInit();
    G3X_InitMtxStack();
    G3X_SetShading(GX_SHADING_TOON);
    G3X_AntiAlias(TRUE);
    G3X_AlphaTest(FALSE, 0);
    G3X_AlphaBlend(TRUE);
    G3X_SetClearColor(RGB_BLACK, 0, 0x7FFF, 0x3F, FALSE);
    G3_SwapBuffers(GX_SORTMODE_AUTO, GX_BUFFERMODE_W);
    G3_ViewPort(0, 0, 255, 191);
    GF_3DVramMan_InitFrameTexVramManager(1, TRUE);
    GF_3DVramMan_InitFramePlttVramManager(0x4000, TRUE);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);
    G2_SetBG0Priority(1);
    G2_SetBlendAlpha(0, 28, 0, 0);
    RegisterHallOfFame_CreateCamera(data);
}

static void RegisterHallOfFame_CreateCamera(RegisterHallOfFameData *data) {
    data->camera = Camera_New(HEAP_ID_REGISTER_HALL_OF_FAME);
    SetVec(data->cameraTarget, 0, 0, 0);
    SetVec(data->cameraAngle, 0, 0, 0);
    Camera_Init_FromTargetDistanceAndAngle(&data->cameraTarget, FX32_CONST(5), &data->cameraAngle, 0xFA4, 0, TRUE, data->camera);
    VecFx32 camUp;
    SetVec(camUp, 0, FX32_ONE, 0);
    Camera_SetLookAtCamUp(&camUp, data->camera);
    Camera_SetStaticPtr(data->camera);
    Camera_SetPerspectiveClippingPlane(FX32_ONE, FX32_CONST(500), data->camera);
}

static void RegisterHallOfFame_DeleteCamera(RegisterHallOfFameData *data) {
    Camera_Delete(data->camera);
}

static void RegisterHallOfFame_G3Commit(RegisterHallOfFameData *data) {
    if (!G3X_IsGeometryBusy()) {
        G3X_Reset();
        NNS_G3dGePushMtx();
        RegisterHallOfFame_SpotlightsTask_G3Commit(data->spotlightsTask);
        NNS_G3dGePopMtx(1);
        NNS_G3dGePushMtx();
        RegisterHallOfFame_ConfettiTask_G3Commit(data->confettiTask);
        NNS_G3dGePopMtx(1);
        G3_SwapBuffers(GX_SORTMODE_MANUAL, GX_BUFFERMODE_Z);
    }
}

static SysTask *RegisterHallOfFame_CreateSpotlightController(RegisterHallOfFameData *data) {
    RegisterHofSpotlightTaskData *spotlight = AllocFromHeap(HEAP_ID_REGISTER_HALL_OF_FAME, sizeof(RegisterHofSpotlightTaskData));
    sSpotlightsActive = TRUE;
    sNumSpotlightTasks = 2;
    spotlight->numSpotlights = 0;
    spotlight->endMakeDLTask = SysTask_CreateOnVBlankQueue(Task_RegisterHallOfFame_Spotlights_EndMakeDL, spotlight, 3);
    spotlight->parent = data;
    return SysTask_CreateOnVBlankQueue(Task_RegisterHallOfFame_Spotlights_BeginMakeDL, spotlight, 1);
}

static void Task_RegisterHallOfFame_Spotlights_BeginMakeDL(SysTask *task, void *taskData) {
    RegisterHofSpotlightTaskData *spotlight = (RegisterHofSpotlightTaskData *)taskData;

    if (sSpotlightsActive) {
        G3_BeginMakeDL(&spotlight->gxDlInfo, spotlight->gxCommand, sizeof(spotlight->gxCommand));
        G3B_MaterialColorDiffAmb(&spotlight->gxDlInfo, RGB_WHITE, RGB(16, 16, 16), FALSE);
        G3B_MaterialColorSpecEmi(&spotlight->gxDlInfo, RGB(16, 16, 16), RGB_BLACK, FALSE);
    } else {
        --sNumSpotlightTasks;
        SysTask_Destroy(task);
    }
}

static void Task_RegisterHallOfFame_Spotlights_EndMakeDL(SysTask *task, void *taskData) {
    RegisterHofSpotlightTaskData *spotlight = (RegisterHofSpotlightTaskData *)taskData;

    if (sSpotlightsActive) {
        spotlight->gxCommandLength = G3_EndMakeDL(&spotlight->gxDlInfo);
        DC_FlushRange(spotlight->gxCommand, spotlight->gxCommandLength);
    } else {
        --sNumSpotlightTasks;
        SysTask_Destroy(task);
    }
}

static void RegisterHallOfFame_AddSpotlight(SysTask *task, int xOffset, fx32 angle) {
    RegisterHofSpotlightTaskData *spotlight = (RegisterHofSpotlightTaskData *)SysTask_GetData(task);
    if (spotlight->numSpotlights < 8) {
        spotlight->childTasks[spotlight->numSpotlights] = RegisterHallOfFame_CreateSpotlightTaskEx(spotlight, xOffset, angle, spotlight->numSpotlights);
        ++sNumSpotlightTasks;
        ++spotlight->numSpotlights;
    }
}

static SysTask *RegisterHallOfFame_CreateSpotlightTaskEx(RegisterHofSpotlightTaskData *spotlight, int xOffset, fx32 angle, int index) {
    RegisterHofSpotlightChildTaskData *child = AllocFromHeap(HEAP_ID_REGISTER_HALL_OF_FAME, sizeof(RegisterHofSpotlightChildTaskData));
    child->parent = spotlight;
    child->xOffset = xOffset;
    child->color = sSpotlightColors[index];
    child->unused_804 = 0;
    child->angle = angle;
    child->speed = 2 * sSpotlightSpeeds[index]; // UB warning: can index past end of array
    child->polygonId = index;
    SetVec(child->vertices[0], xOffset - 80, FX16_CONST(-1), 0);
    SetVec(child->vertices[1], xOffset + 80, FX16_CONST(-1), 0);
    return SysTask_CreateOnVBlankQueue(Task_RegisterHallOfFame_SpotlightInstance, child, 2);
}

static void Task_RegisterHallOfFame_SpotlightInstance(SysTask *task, void *taskData) {
    RegisterHofSpotlightChildTaskData *child = (RegisterHofSpotlightChildTaskData *)taskData;

    if (sSpotlightsActive) {
        child->angle += child->speed;
        if (child->speed > 0) {
            if (child->angle >= FX32_CONST(170)) {
                child->speed *= -1;
            }
        } else {
            if (child->angle <= FX32_CONST(10)) {
                child->speed *= -1;
            }
        }

        s32 r6 = child->angle >> FX32_SHIFT;
        fx32 cosVal = child->xOffset + FX_Mul(GF_CosDegNoWrap(r6), FX32_CONST(2.5));
        fx32 sinVal = -FX32_ONE + FX_Mul(GF_SinDegNoWrap(r6), FX32_CONST(2.5));

        SetVec(child->vertices[2], cosVal - FX32_CONST(0.140625), sinVal, 0);
        SetVec(child->vertices[3], cosVal + FX32_CONST(0.140625), sinVal, 0);

        G3B_PolygonAttr(&child->parent->gxDlInfo, GX_LIGHTID_0, GX_POLYGONMODE_MODULATE, GX_CULL_BACK, child->polygonId, 0x10, 0);
        G3B_Begin(&child->parent->gxDlInfo, GX_BEGIN_QUADS);
        G3B_Color(&child->parent->gxDlInfo, child->color);
        G3B_Vtx(&child->parent->gxDlInfo, child->vertices[0].x, child->vertices[0].y, child->vertices[0].z);
        G3B_Vtx(&child->parent->gxDlInfo, child->vertices[1].x, child->vertices[1].y, child->vertices[1].z);
        G3B_Vtx(&child->parent->gxDlInfo, child->vertices[3].x, child->vertices[3].y, child->vertices[3].z);
        G3B_Vtx(&child->parent->gxDlInfo, child->vertices[2].x, child->vertices[2].y, child->vertices[2].z);
        G3B_End(&child->parent->gxDlInfo);
    } else {
        --sNumSpotlightTasks;
        SysTask_Destroy(task);
    }
}

static void RegisterHallOfFame_SpotlightsTask_G3Commit(SysTask *task) {
    if (task != NULL) {
        RegisterHofSpotlightTaskData *spotlight = (RegisterHofSpotlightTaskData *)SysTask_GetData(task);

        G3_PushMtx();
        MI_SendGXCommand(3, spotlight->gxCommand, spotlight->gxCommandLength);
        G3_PopMtx(1);
    }
}

static void RegisterHallOfFame_DestroySpotlightsTask(SysTask *task) {
    sSpotlightsActive = FALSE;
    if (task != NULL) {
        RegisterHofSpotlightTaskData *spotlight = (RegisterHofSpotlightTaskData *)SysTask_GetData(task);

        for (int i = 0; i < spotlight->numSpotlights; ++i) {
            FreeToHeap(SysTask_GetData(spotlight->childTasks[i]));
        }
        FreeToHeap(spotlight);
    }
}

static BOOL RegisterHallOfFame_AreAllSpotlightsFinished(RegisterHallOfFameData *data) {
    return sNumSpotlightTasks == 0;
}

static SysTask *RegisterHallOfFame_CreateConfettiTask(RegisterHallOfFameData *data) {
    RegisterHofConfettiEmitterTaskData *confetti = AllocFromHeap(HEAP_ID_REGISTER_HALL_OF_FAME, sizeof(RegisterHofConfettiEmitterTaskData));
    int i;
    int j;
    u32 rand;
    u32 particleId;

    rand = LCRandom();
    SetLCRNGSeed(13716);

    for (i = 0, particleId = 0; i < 48; ++i) {
        confetti->particles[i].color = sConfettiColors[particleId];
        ++particleId;
        if (particleId >= 8) {
            particleId = 0;
        }
        fx16 sp8 = (LCRandom() % FX32_CONST(2)) - FX32_ONE;
        fx16 sp4 = (LCRandom() % FX32_CONST(2)) + FX32_ONE;
        fx16 sp0 = (LCRandom() % FX32_CONST(0.16015625)) - FX32_CONST(0.080078125);

        for (j = 0; j < 4; ++j) {
            SetVec(confetti->particles[i].unk_08[j], sp8 + sConfettiCoords[j].x, sp4 + sConfettiCoords[j].y, sp0 + sConfettiCoords[j].z);
            SetVec(confetti->particles[i].unk_20, 0, 0, 0);
            SetVec(confetti->particles[i].unk_26, (LCRandom() % FX32_CONST(0.125)) + FX32_CONST(0.125), (LCRandom() % FX32_CONST(0.125)) + FX32_CONST(0.125), (LCRandom() % FX32_CONST(0.125)) + FX32_CONST(0.125));
            MTX_Identity44(&confetti->particles[i].translationMat);
        }

        j = LCRandom() & 7;
        while (j--) {
            VEC_Fx16Add(&confetti->particles[i].unk_20, &confetti->particles[i].unk_26, &confetti->particles[i].unk_20);
        }
    }

    SetLCRNGSeed(rand);
    confetti->active = FALSE;
    confetti->requestPushGxCommand = FALSE;
    confetti->unk_8D20 = FALSE;
    G3_MtxMode(GX_MTXMODE_POSITION_VECTOR);
    return SysTask_CreateOnMainQueue(Task_RegisterHallOfFame_Confetti, confetti, 0);
}

static void RegisterHallOfFame_EndConfetti(SysTask *task) {
    if (task != NULL) {
        FreeToHeap(SysTask_GetData(task));
        SysTask_Destroy(task);
    }
}

static void RegisterHallOfFame_StartConfetti(SysTask *task) {
    if (task != NULL) {
        RegisterHofConfettiEmitterTaskData *confetti = (RegisterHofConfettiEmitterTaskData *)SysTask_GetData(task);
        confetti->active = TRUE;
    }
}

static void Task_RegisterHallOfFame_Confetti(SysTask *task, void *taskData) {
    MtxFx44 rotMatrix;
    VecFx16 lightVector;
    RegisterHofConfettiEmitterTaskData *confetti = (RegisterHofConfettiEmitterTaskData *)taskData;
    if (confetti->active) {
        G3_BeginMakeDL(&confetti->gxDlInfo, confetti->gxCommand, sizeof(confetti->gxCommand));
        G3B_PolygonAttr(&confetti->gxDlInfo, GX_LIGHTID_3, GX_POLYGONMODE_MODULATE, GX_CULL_NONE, 0x3F, 0x1F, 0);
        G3B_MaterialColorDiffAmb(&confetti->gxDlInfo, RGB(20, 20, 20), RGB_BLACK, FALSE);
        for (int i = 0; i < 48; ++i) {
            confetti->particles[i].unk_08[3].y -= 85;
            if (confetti->particles[i].unk_08[3].y <= -FX16_ONE) {
                confetti->particles[i].unk_08[3].y = confetti->particles[i].unk_08[3].y + 2 * FX16_ONE;
            }
            confetti->particles[i].unk_08[0].y = confetti->particles[i].unk_08[3].y - FX16_CONST(0.1);
            confetti->particles[i].unk_08[1].y = confetti->particles[i].unk_08[0].y;
            confetti->particles[i].unk_08[2].y = confetti->particles[i].unk_08[3].y;
            VEC_Fx16Add(&confetti->particles[i].unk_20, &confetti->particles[i].unk_26, &confetti->particles[i].unk_20);
            MTX_Identity44(&confetti->particles[i].translationMat);
            MTX_TransApply44(&confetti->particles[i].translationMat, &confetti->particles[i].translationMat, confetti->particles[i].unk_08[0].x, confetti->particles[i].unk_08[0].y, confetti->particles[i].unk_08[0].z);
            G3B_LightColor(&confetti->gxDlInfo, GX_LIGHTID_0, RGB(11, 11, 11));
            G3B_LightColor(&confetti->gxDlInfo, GX_LIGHTID_1, confetti->particles[i].color);
            SetVec(lightVector, 0, FX16_ONE - 1, -FX16_ONE + 1);
            VEC_Fx16Normalize(&lightVector, &lightVector);
            G3B_LightVector(&confetti->gxDlInfo, GX_LIGHTID_0, lightVector.x, lightVector.y, lightVector.z);
            SetVec(lightVector, 0, -FX16_ONE + 1, FX16_ONE - 1);
            VEC_Fx16Normalize(&lightVector, &lightVector);
            G3B_LightVector(&confetti->gxDlInfo, GX_LIGHTID_1, lightVector.x, lightVector.y, lightVector.z);
            MTX_RotX44(&rotMatrix, FX_SinIdx((u16)confetti->particles[i].unk_20.x), FX_CosIdx((u16)confetti->particles[i].unk_20.x));
            MTX_Concat44(&rotMatrix, &confetti->particles[i].translationMat, &confetti->particles[i].translationMat);
            MTX_RotY44(&rotMatrix, FX_SinIdx((u16)confetti->particles[i].unk_20.y), FX_CosIdx((u16)confetti->particles[i].unk_20.y));
            MTX_Concat44(&rotMatrix, &confetti->particles[i].translationMat, &confetti->particles[i].translationMat);
            MTX_RotZ44(&rotMatrix, FX_SinIdx((u16)confetti->particles[i].unk_20.z), FX_CosIdx((u16)confetti->particles[i].unk_20.z));
            MTX_Concat44(&rotMatrix, &confetti->particles[i].translationMat, &confetti->particles[i].translationMat);
            G3B_MaterialColorSpecEmi(&confetti->gxDlInfo, RGB_WHITE, confetti->particles[i].color, FALSE);
            G3B_PushMtx(&confetti->gxDlInfo);
            G3B_LoadMtx44(&confetti->gxDlInfo, &confetti->particles[i].translationMat);
            G3B_Begin(&confetti->gxDlInfo, GX_BEGIN_QUADS);
            G3B_Normal(&confetti->gxDlInfo, 0, 0, -FX16_ONE + 1);
            G3B_Vtx(&confetti->gxDlInfo, -FX16_CONST(0.038), -FX16_CONST(0.05), 0);
            G3B_Vtx(&confetti->gxDlInfo, FX16_CONST(0.038), -FX16_CONST(0.05), 0);
            G3B_Vtx(&confetti->gxDlInfo, FX16_CONST(0.038), FX16_CONST(0.05), 0);
            G3B_Vtx(&confetti->gxDlInfo, -FX16_CONST(0.038), FX16_CONST(0.05), 0);
            G3B_End(&confetti->gxDlInfo);
            G3B_PopMtx(&confetti->gxDlInfo, 1);
        }
        confetti->gxCommandLength = G3_EndMakeDL(&confetti->gxDlInfo);
        DC_FlushRange(confetti->gxCommand, confetti->gxCommandLength);
        GF_ASSERT(confetti->gxCommandLength < sizeof(confetti->gxCommand));
        confetti->requestPushGxCommand = TRUE;
    }
}

static void RegisterHallOfFame_ConfettiTask_G3Commit(SysTask *task) {
    if (task != NULL) {
        RegisterHofConfettiEmitterTaskData *confetti = (RegisterHofConfettiEmitterTaskData *)SysTask_GetData(task);
        if (confetti->requestPushGxCommand) {
            G3_PushMtx();
            MI_SendGXCommand(3, confetti->gxCommand, confetti->gxCommandLength);
            G3_PopMtx(1);
            confetti->requestPushGxCommand = FALSE;
        }
    }
}
