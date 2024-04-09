#include "gf_3d_vramman.h"
#include "global.h"
#include "follow_mon.h"
#include "gf_gfx_loader.h"
#include "register_hall_of_fame.h"
#include "camera.h"
#include "bg_window.h"
#include "font.h"
#include "gf_gfx_planes.h"
#include "heap.h"
#include "math_util.h"
#include "msgdata.h"
#include "message_format.h"
#include "overlay_manager.h"
#include "pokemon.h"
#include "sound_02004A44.h"
#include "sys_task_api.h"
#include "system.h"
#include "constants/sndseq.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0180.h"
#include "text.h"
#include "touchscreen.h"
#include "unk_02005D10.h"
#include "unk_0200CF18.h"
#include "unk_0200FA24.h"
#include "unk_02013FDC.h"
#include "unk_02026E84.h"
#include "unk_0206D494.h"
#include "unk_02007FD8.h"
#include "constants/map_sections.h"
#include "data/mmodel/mmodel.naix"

typedef enum RegisterHallOfFameScene {
    REGHOF_SCENE_0,
    REGHOF_SCENE_1,
    REGHOF_SCENE_2,
    REGHOF_SCENE_3,
    REGHOF_SCENE_4,
    REGHOF_SCENE_5,
    REGHOF_SCENE_6,
    REGHOF_SCENE_7,
    REGHOF_SCENE_MAX,
} RegisterHallOfFameScene;

typedef struct RegisterHofMon {
    Pokemon *mon;
    u8 tsure_param[4];
    u32 personality;
    u16 species;
    u16 level;
    u8 form;
    u8 gender;
    u8 printGender;
    u8 unk_0013;
    u32 metLocation;
    int partyIndex;
    struct UnkStruct_02072914_sub_sub unk_001C[10];
    struct UnkStruct_02072914_sub_sub unk_0044[10];
    u16 unk_006C[1600];
    u16 unk_0CEC[1600];
    u16 unk_196C[1600];
    u16 unk_25EC[1600];
    u16 unk_326C[16];
} RegisterHofMon;

typedef struct RegisterHallOfFameData {
    RegisterHallOfFameArgs *args;  // 00000
    SysTask *vblankTask;  // 00004
    BOOL (*subprocCallback)(struct RegisterHallOfFameData *);
    u16 subprocCounter;
    u16 subprocStage;
    BgConfig *bgConfig; // 00010
    Window unk_00014[7];
    MsgData *msgData; // 00084
    MessageFormat *msgFormat; // 00088
    String *unk_0008C;
    String *unk_00090;
    NARC *unk_00094;
    NARC *unk_00098;
    SpriteRenderer *spriteRenderer;  // 0009C
    SpriteGfxHandler *spriteGfxHandler;  // 000A0
    UnkImageStruct *monPics[15];
    Camera *unk_000E0;
    VecFx32 unk_000E4;
    CameraAngle unk_000F0;
    SysTask *spotlightsTask;
    SysTask *confettiTask;
    RegisterHofMon mons[PARTY_SIZE];
    u32 numMons;
    RegisterHallOfFameScene currentScene;  // 1304C
    RegisterHallOfFameScene nextScene;  // 13050
    u16 sceneSubstep;
    u16 curMonIndex;
    f32 unk_13058;
    f32 unk_1305C;
    u32 unk_13060_0:1;
    u32 unk_13060_1:1;
    u32 unk_13060_2:1;
    u32 unk_13060_3:1;
    u32 unk_13060_4:1;
    u32 unk_13060_5:1;
    u32 unk_13060_6:1;
    int unk_13064;
    u16 unk_13068;
    u16 unk_1306A;
} RegisterHallOfFameData;

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
    u8 filler_004[0x800];  // scrapped feature?
    int unk_804;
    fx32 angle;
    fx32 speed;
    int color;
    int unk_814;
    fx16 xOffset;
    VecFx16 vertices[5];
} RegisterHofSpotlightChildTaskData;

typedef struct RegHOFConfettiParticle {
    u32 unk_00;
    u8 filler_04[0x4];
    VecFx16 unk_08[4];
    VecFx16 unk_20;
    VecFx16 unk_26;
    MtxFx44 unk_2C;
    u32 unk_6C;
} RegHOFConfettiParticle;

typedef struct RegisterHofConfettiEmitterTaskData {
    BOOL active;
    BOOL requestPushGxCommand;
    RegHOFConfettiParticle particles[48];
    GXDLInfo gxDlInfo;
    u8 gxCommand[0x7800];
    u32 gxCommandLength;
    BOOL unk_8D20;  // scrapped feature?
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

static void ov63_0221BFBC(void);
static void VBlankTask_RegisterHallOfFame_IndividualMonsCongrats(SysTask *task, void *taskData);
static void ov63_0221C00C(const void *pSrc, u32 offset, u32 size);
static void ov63_0221C028(const void *pSrc, u32 offset, u32 size);
static void ov63_0221C044(RegisterHallOfFameData *data);
static void ov63_0221C05C(RegisterHallOfFameData *data);
static void ov63_0221C068(RegisterHallOfFameData *data);
static void ov63_0221C118(RegisterHallOfFameData *data);
static void ov63_0221C134(RegisterHallOfFameData *data, u32 whichPic);
static void ov63_0221C14C(RegisterHallOfFameData *data);
static void ov63_0221C14C(RegisterHallOfFameData *data);
static void ov63_0221C16C(RegisterHallOfFameData *data, u32 whichPic, int animSeqNo);
static RegisterHallOfFameScene RegisterHallOfFame_FadeFromBlack(RegisterHallOfFameData *data, RegisterHallOfFameScene nextScene);
static RegisterHallOfFameScene RegisterHallOfFame_FadeToBlack(RegisterHallOfFameData *data, RegisterHallOfFameScene nextScene);
static BOOL RegisterHallOfFame_SetupSubproc(RegisterHallOfFameData *data, BOOL (*callback)(RegisterHallOfFameData *), RegisterHallOfFameScene nextScene);
static RegisterHallOfFameScene RegisterHallOfFame_Scene0(RegisterHallOfFameData *data);
static RegisterHallOfFameScene RegisterHallOfFame_Scene1(RegisterHallOfFameData *data);
static RegisterHallOfFameScene RegisterHallOfFame_Scene2(RegisterHallOfFameData *data);
static RegisterHallOfFameScene RegisterHallOfFame_Scene3(RegisterHallOfFameData *data);
static RegisterHallOfFameScene RegisterHallOfFame_Scene4(RegisterHallOfFameData *data);
static RegisterHallOfFameScene RegisterHallOfFame_Scene5(RegisterHallOfFameData *data);
static RegisterHallOfFameScene RegisterHallOfFame_Scene6(RegisterHallOfFameData *data);
static RegisterHallOfFameScene RegisterHallOfFame_Scene7(RegisterHallOfFameData *data);
static void RegisterHallOfFame_MonSpritePosScaleAnimStep(UnkImageStruct *unkImageStruct, const RegHOFSpritePosScaleAnimParam *param, u32 duration, u32 step);
static void ov63_0221C6FC(RegisterHallOfFameData *data);
static void ov63_0221C85C(RegisterHallOfFameData *data);
static void ov63_0221C8E8(RegisterHallOfFameData *data, RegisterHofMon *mon, u8 whichFacing, int a3);
static void ov63_0221C954(RegisterHallOfFameData *data, int a1, int a2);
static void ov63_0221C99C(RegisterHallOfFameData *data, int monIdx, int picIdx);
static void ov63_0221C9E0(RegisterHallOfFameData *data, int a1, int a2);
static void ov63_0221CA1C(RegisterHallOfFameData *data, RegisterHofMon *mon);
static void ov63_0221CB48(RegisterHallOfFameData *data);
static void ov63_0221CB94(RegisterHallOfFameData *data, RegisterHofMon *hofMon, int a2);
static void ov63_0221CC78(RegisterHallOfFameData *data);
static void ov63_0221CE94(RegisterHallOfFameData *data, u16 a1, int a2);
static void ov63_0221D20C(RegisterHallOfFameData *data, int a1);
static void ov63_0221D21C(RegisterHallOfFameData *data);
static void ov63_0221D240(RegisterHallOfFameData *data, int a1);
static void ov63_0221D2F8(RegisterHallOfFameData *data, RegisterHofMon *mon);
static void ov63_0221CD40(RegisterHallOfFameData *data);
static void ov63_0221CD68(RegisterHallOfFameData *data);
static void ov63_0221CDF8(RegisterHallOfFameData *data);
static void ov63_0221CE7C(RegisterHallOfFameData *data);
static void ov63_0221D21C(RegisterHallOfFameData *data);
static void ov63_0221D344(RegisterHallOfFameData *data);
static BOOL RegisterHallOfFame_ShowMon_LeftSide(RegisterHallOfFameData *data);
static BOOL RegisterHallOfFame_ShowMon_RightSide(RegisterHallOfFameData *data);
static void ov63_0221E114(RegisterHallOfFameData *data);
static int ov63_0221E310(RegisterHallOfFameData *data, Pokemon *pokemon, PlayerProfile *profile);
static int ov63_0221E404(int a0, u8 a1, u8 a2);
static void ov63_0221E450(RegisterHallOfFameData *data, int a1, int a2, int a3, int a4);
static void ov63_0221E4E0(SysTask *task, void *taskData);
static void ov63_0221E55C(RegisterHallOfFameData *data, u16 a1, u16 a2);
static BOOL ov63_0221E5A0(RegisterHallOfFameData *data);
static void ov63_0221E8AC(RegisterHallOfFameData *data);
static void ov63_0221E8D4(RegisterHallOfFameData *data);
static void VBlankTask_RegisterHallOfFame_WholePartyCongrats(SysTask *task, void *taskData);
static void ov63_0221E940(RegisterHallOfFameData *data);
static void ov63_0221E9FC(RegisterHallOfFameData *data);
static void ov63_0221EA24(RegisterHallOfFameData *data);
static void ov63_0221EAA8(RegisterHallOfFameData *data);
static void ov63_0221EC04(RegisterHallOfFameData *data);
static void ov63_0221EC1C(RegisterHallOfFameData *data);
static void ov63_0221EFD8(RegisterHallOfFameData *data);
static void ov63_0221F088(RegisterHallOfFameData *data);
static void ov63_0221F130(RegisterHallOfFameData *data);
static void ov63_0221F1C4(RegisterHallOfFameData *data);
static void ov63_0221F1D0(RegisterHallOfFameData *data);
static SysTask *RegisterHallOfFame_CreateSpotlightController(RegisterHallOfFameData *data);
static void ov63_0221F294(SysTask *task, void *taskData);
static void Task_RegisterHallOfFame_Spotlights_EndMakeDL(SysTask *task, void *taskData);
static void RegisterHallOfFame_AddSpotlight(SysTask *task, int xOffset, fx32 angle);
static SysTask *RegisterHallOfFame_CreateSpotlightTaskEx(RegisterHofSpotlightTaskData *spotlight, int xOffset, fx32 angle, int index);
static void ov63_0221F3F4(SysTask *task, void *taskData);
static void ov63_0221F580(SysTask *task);
static void ov63_0221F5B4(SysTask *task);
static BOOL ov63_0221F600(RegisterHallOfFameData *data);
static SysTask *ov63_0221F614(RegisterHallOfFameData *data);
static void ov63_0221F7C4(SysTask *task);
static void ov63_0221F7DC(SysTask *task);
static void ov63_0221F7EC(SysTask *task, void *taskData);
static void ov63_0221FAA0(SysTask *task);

static BOOL sSpotlightsActive = TRUE;
static int sNumSpotlightTasks;

static const fx16 sSpotlightSpeeds[6] = {
    FX16_CONST(0.75),
    FX16_CONST(0.6875),
    FX16_CONST(0.625),
    FX16_CONST(0.75),
    FX16_CONST(0.6875),
    FX16_CONST(0.625),
};  // ov63_0221FAE4

static const GraphicsModes ov63_0221FB10 = {
    GX_DISPMODE_GRAPHICS,
    GX_BGMODE_0,
    GX_BGMODE_0,
    GX_BG0_AS_2D,
};

static const WindowTemplate ov63_0221FB20[2] = {
    {
        .bgId = GF_BG_LYR_MAIN_1,
        .left = 0,
        .top = 0,
        .width = 32,
        .height = 2,
        .palette = 15,
        .baseTile = 0x001,
    }, {
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

static const GraphicsModes ov63_0221FB00 = {
    GX_DISPMODE_GRAPHICS,
    GX_BGMODE_0,
    GX_BGMODE_0,
    GX_BG0_AS_3D,
};

static const Unk122_021E92D0 ov63_0221FB30 = {
    0x400,
    0x10000,
    0x4000,
    0x100010,
    0x100010,
};

static const VecFx16 ov63_0221FB44[4] = {
    {
        .x = -FX16_CONST(0.038),
        .y = -FX16_CONST(0.05),
        .z = 0,
    }, {
        .x = FX16_CONST(0.038),
        .y = -FX16_CONST(0.05),
        .z = 0,
    }, {
        .x = FX16_CONST(0.038),
        .y = FX16_CONST(0.05),
        .z = 0,
    }, {
        .x = -FX16_CONST(0.038),
        .y = FX16_CONST(0.05),
        .z = 0,
    },
};

static const SpriteResourceCountsListUnion ov63_0221FB5C = {
    .numChar = 9,
    .numPltt = 11,
    .numCell = 4,
    .numAnim = 4,
    .numMcel = 0,
    .numManm = 0,
};

static const BgTemplate ov63_0221FBAC = {
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

static const BgTemplate ov63_0221FBC8 = {
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

static const BgTemplate ov63_0221FB90 = {
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

static const BgTemplate ov63_0221FBE4 = {
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

static const BgTemplate ov63_0221FC00 = {
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

static const BgTemplate ov63_0221FC1C = {
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

static const BgTemplate ov63_0221FB74 = {
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
    }, {
        10,
        0,
        10,
        10,
    },
};

static const GXRgb ov63_0221FC78[16] = {
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

static const GXRgb ov63_0221FC98[16] = {
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

static const UnkStruct_02014E30 ov63_0221FCD8[2] = {
    {
        0,
        0,
        10,
        10,
    }, {
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
};  // ov63_0221FCF8

static RegisterHallOfFameScene (*const sSceneFuncs[8])(RegisterHallOfFameData *data) = {
    RegisterHallOfFame_Scene0,
    RegisterHallOfFame_Scene1,
    RegisterHallOfFame_Scene2,
    RegisterHallOfFame_Scene3,
    RegisterHallOfFame_Scene4,
    RegisterHallOfFame_Scene5,
    RegisterHallOfFame_Scene6,
    RegisterHallOfFame_Scene7,
};  // 0221FD18

static const int ov63_0221FD38[8] = {
    RGB(16, 28, 21),
    RGB(31, 16, 29),
    RGB(8, 8, 31),
    RGB(6, 31, 31),
    RGB(31, 31, 0),
    RGB(9, 31, 0),
    RGB(31, 18, 0),
    RGB(22, 0, 31),
};

static const GXRgb ov63_0221FC58[16] = {
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

static const Unk122_021E92FC ov63_0221FCB8 = {
    0,
    0x80,
    0,
    0x20,
    0,
    0x80,
    0,
    0x20,
};

static const GraphicsBanks ov63_0221FD58 = {
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

static const WindowTemplate ov63_0221FD80[7] = {
    {
        .bgId = GF_BG_LYR_MAIN_0,
        .left = 0,
        .top = 0,
        .width = 32,
        .height = 2,
        .palette = 15,
        .baseTile = 0x001,
    }, {
        .bgId = GF_BG_LYR_MAIN_0,
        .left = 18,
        .top = 3,
        .width = 14,
        .height = 2,
        .palette = 15,
        .baseTile = 0x041,
    }, {
        .bgId = GF_BG_LYR_MAIN_0,
        .left = 18,
        .top = 6,
        .width = 14,
        .height = 4,
        .palette = 15,
        .baseTile = 0x05D,
    }, {
        .bgId = GF_BG_LYR_MAIN_0,
        .left = 18,
        .top = 12,
        .width = 14,
        .height = 9,
        .palette = 15,
        .baseTile = 0x095,
    }, {
        .bgId = GF_BG_LYR_MAIN_0,
        .left = 0,
        .top = 3,
        .width = 14,
        .height = 2,
        .palette = 15,
        .baseTile = 0x041,
    }, {
        .bgId = GF_BG_LYR_MAIN_0,
        .left = 0,
        .top = 6,
        .width = 14,
        .height = 4,
        .palette = 15,
        .baseTile = 0x05D,
    }, {
        .bgId = GF_BG_LYR_MAIN_0,
        .left = 0,
        .top = 12,
        .width = 14,
        .height = 9,
        .palette = 15,
        .baseTile = 0x095,
    },
};

static const RegHOFSpritePosScaleAnimParam ov63_0221FDB8[27] = {
    {168, -40, 96, 120, 1.0f, 1.0f},
    {-92, 88, 160, 120, 1.0f, 1.0f},
    {348, 88, 56, 104, 1.0f, 1.0f},
    {88, -40, 200, 104, 1.0f, 1.0f},
    {336, 0, 40, 80, 1.0f, 1.0f},
    {-80, 0, 216, 80, 1.0f, 1.0f},
    {93, 110, 99, 110, 1.0f, 1.0f},
    {157, 110, 163, 110, 1.0f, 1.0f},
    {53, 96, 59, 96, 1.0f, 1.0f},
    {197, 96, 203, 96, 1.0f, 1.0f},
    {37, 72, 43, 72, 1.0f, 1.0f},
    {213, 72, 219, 72, 1.0f, 1.0f},
    {125, 120, 131, 120, 1.0f, 1.0f},
    {96, 120, 108, 100, 1.0f, 0.8f},
    {160, 120, 148, 100, 1.0f, 0.8f},
    {56, 104, 84, 90, 1.0f, 0.75f},
    {200, 104, 170, 90, 1.0f, 0.75f},
    {40, 80, 64, 75, 1.0f, 0.7f},
    {216, 80, 190, 75, 1.0f, 0.7f},
    {128, 128, 128, 120, 1.0f, 0.7f},
    {96, 90, 108, 100, 1.0f, 0.9f},
    {160, 90, 148, 100, 1.0f, 0.9f},
    {56, 80, 84, 90, 1.0f, 0.8f},
    {200, 80, 170, 90, 1.0f, 0.8f},
    {40, 60, 64, 75, 1.0f, 0.75f},
    {216, 60, 190, 75, 1.0f, 0.75f},
    {128, 100, 128, 120, 1.0f, 0.8f},
};

static const UnkTemplate_0200D748 ov63_0221FF68[21] = {
    {512, 480, 0, 0, 0, 0, NNS_G2D_VRAM_TYPE_2DMAIN, {55512, 55512, 55512, 55512, -1, -1}, 2, 0},
    {512, 480, 0, 0, 1, 0, NNS_G2D_VRAM_TYPE_2DMAIN, {55512, 55513, 55512, 55512, -1, -1}, 2, 0},
    {512, 480, 0, 0, 2, 0, NNS_G2D_VRAM_TYPE_2DMAIN, {55513, 55514, 55513, 55513, -1, -1}, 3, 0},
    {512, 480, 0, 0, 3, 0, NNS_G2D_VRAM_TYPE_2DMAIN, {55513, 55515, 55513, 55513, -1, -1}, 3, 0},
    {512, 480, 0, 0, 4, 0, NNS_G2D_VRAM_TYPE_2DMAIN, {55518, 55518, 55514, 55514, -1, -1}, 2, 0},
    {512, 480, 0, 0, 5, 0, NNS_G2D_VRAM_TYPE_2DMAIN, {55518, 55519, 55514, 55514, -1, -1}, 2, 0},
    {168, -40, 0, 0, 20, 0, NNS_G2D_VRAM_TYPE_2DMAIN, {55512, 55512, 55512, 55512, -1, -1}, 2, 0},
    {-92, 88, 0, 0, 21, 0, NNS_G2D_VRAM_TYPE_2DMAIN, {55513, 55513, 55512, 55512, -1, -1}, 2, 0},
    {348, 88, 0, 0, 22, 0, NNS_G2D_VRAM_TYPE_2DMAIN, {55514, 55514, 55512, 55512, -1, -1}, 2, 0},
    {88, -40, 0, 0, 23, 0, NNS_G2D_VRAM_TYPE_2DMAIN, {55515, 55515, 55512, 55512, -1, -1}, 2, 0},
    {336, 0, 0, 0, 24, 0, NNS_G2D_VRAM_TYPE_2DMAIN, {55516, 55516, 55512, 55512, -1, -1}, 2, 0},
    {-80, 0, 0, 0, 25, 0, NNS_G2D_VRAM_TYPE_2DMAIN, {55517, 55517, 55512, 55512, -1, -1}, 2, 0},
    {93, 110, 0, 0, 40, 0, NNS_G2D_VRAM_TYPE_2DMAIN, {55512, 55521, 55512, 55512, -1, -1}, 3, 0},
    {157, 110, 0, 0, 40, 0, NNS_G2D_VRAM_TYPE_2DMAIN, {55513, 55521, 55512, 55512, -1, -1}, 3, 0},
    {53, 96, 0, 0, 40, 0, NNS_G2D_VRAM_TYPE_2DMAIN, {55514, 55521, 55512, 55512, -1, -1}, 3, 0},
    {197, 96, 0, 0, 40, 0, NNS_G2D_VRAM_TYPE_2DMAIN, {55515, 55521, 55512, 55512, -1, -1}, 3, 0},
    {37, 72, 0, 0, 40, 0, NNS_G2D_VRAM_TYPE_2DMAIN, {55516, 55521, 55512, 55512, -1, -1}, 3, 0},
    {213, 72, 0, 0, 40, 0, NNS_G2D_VRAM_TYPE_2DMAIN, {55517, 55521, 55512, 55512, -1, -1}, 3, 0},
    {128, 128, 0, 0, 10, 0, NNS_G2D_VRAM_TYPE_2DMAIN, {55519, 55520, 55512, 55512, -1, -1}, 2, 0},
    {125, 120, 0, 0, 40, 0, NNS_G2D_VRAM_TYPE_2DMAIN, {55519, 55521, 55512, 55512, -1, -1}, 3, 0},
    {0, 0, 0, 0, 0, 0, NNS_G2D_VRAM_TYPE_2DMAIN, {55520, 55522, 55515, 55515, -1, -1}, 2, 0}
 };

BOOL RegisterHallOfFame_Init(OVY_MANAGER *man, int *state) {
    Main_SetVBlankIntrCB(NULL, NULL);
    HBlankInterruptDisable();
    GfGfx_EngineASetPlanes(0);
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
    data->unk_0008C = String_New(500, HEAP_ID_REGISTER_HALL_OF_FAME);
    data->unk_00090 = String_New(500, HEAP_ID_REGISTER_HALL_OF_FAME);
    data->unk_00094 = NARC_New(NARC_a_1_0_1, HEAP_ID_REGISTER_HALL_OF_FAME);
    data->unk_00098 = NARC_New(NARC_a_1_8_0, HEAP_ID_REGISTER_HALL_OF_FAME);
    ov63_0221E114(data);
    ov63_0221BFBC();
    ov63_0221C044(data);
    ov63_0221C068(data);
    sub_02004EC4(8, SEQ_GS_E_DENDOUIRI, 1);
    sub_02004EC4(71, 0, 0);
    LoadFontPal0(GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0x1E0, HEAP_ID_REGISTER_HALL_OF_FAME);
    data->currentScene = REGHOF_SCENE_2;
    return TRUE;
}

BOOL RegisterHallOfFame_Exit(OVY_MANAGER *man, int *state) {
    RegisterHallOfFameData *data = OverlayManager_GetData(man);
    ov63_0221C118(data);
    ov63_0221C05C(data);
    NARC_Delete(data->unk_00098);
    NARC_Delete(data->unk_00094);
    String_Delete(data->unk_0008C);
    String_Delete(data->unk_00090);
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
    ov63_0221C14C(data);
    return FALSE;
}

static void ov63_0221BFBC(void) {
    GfGfx_SetBanks(&ov63_0221FD58);
}

static void VBlankTask_RegisterHallOfFame_IndividualMonsCongrats(SysTask *task, void *taskData) {
    RegisterHallOfFameData *data = (RegisterHallOfFameData *)taskData;
    if (data->subprocCallback != NULL && !data->subprocCallback(data)) {
        data->subprocCallback = NULL;
    }
    DoScheduledBgGpuUpdates(data->bgConfig);
    sub_0200D020(data->spriteGfxHandler);
    thunk_OamManager_ApplyAndResetBuffers();
    OS_SetIrqCheckFlag(OS_IE_V_BLANK);
}

static void ov63_0221C00C(const void *pSrc, u32 offset, u32 size) {
    DC_FlushRange(pSrc, size);
    GX_LoadOBJ(pSrc, offset, size);
}

static void ov63_0221C028(const void *pSrc, u32 offset, u32 size) {
    DC_FlushRange(pSrc, size);
    GX_LoadOBJPltt(pSrc, offset, size);
}

static void ov63_0221C044(RegisterHallOfFameData *data) {
    data->bgConfig = BgConfig_Alloc(HEAP_ID_REGISTER_HALL_OF_FAME);
    BG_SetMaskColor(GF_BG_LYR_SUB_0, RGB_BLACK);
}

static void ov63_0221C05C(RegisterHallOfFameData *data) {
    FreeToHeap(data->bgConfig);
}

static void ov63_0221C068(RegisterHallOfFameData *data) {
    data->spriteRenderer = SpriteRenderer_Create(HEAP_ID_REGISTER_HALL_OF_FAME);
    data->spriteGfxHandler = SpriteRenderer_CreateGfxHandler(data->spriteRenderer);

    {
        Unk122_021E92FC sp2C = ov63_0221FCB8;

        Unk122_021E92D0 sp18 = ov63_0221FB30;
        sub_0200CF70(data->spriteRenderer, &sp2C, &sp18, 0x20);
    }

    {
        SpriteResourceCountsListUnion sp00 = ov63_0221FB5C;
        sub_0200CFF4(data->spriteRenderer, data->spriteGfxHandler, 15);
        SpriteRenderer_Init2DGfxResManagersFromCountsArray(data->spriteRenderer, data->spriteGfxHandler, &sp00);
    }
    G2dRenderer_SetSubSurfaceCoords(SpriteRenderer_GetG2dRendererPtr(data->spriteRenderer), 0, FX32_CONST(1024));
}

static void ov63_0221C118(RegisterHallOfFameData *data) {
    SpriteRenderer_UnloadResourcesAndRemoveGfxHandler(data->spriteRenderer, data->spriteGfxHandler);
    SpriteRenderer_Delete(data->spriteRenderer);
}

static void ov63_0221C134(RegisterHallOfFameData *data, u32 whichPic) {
    if (data->monPics[whichPic] != NULL) {
        sub_0200D9DC(data->monPics[whichPic]);
        data->monPics[whichPic] = NULL;
    }
}

static void ov63_0221C14C(RegisterHallOfFameData *data) {
    for (u32 i = 0; i < 15; ++i) {
        if (data->monPics[i] != NULL) {
            UnkImageStruct_TickSpriteAnimation1Frame(data->monPics[i]);
        }
    }
}

static void ov63_0221C16C(RegisterHallOfFameData *data, u32 whichPic, int animSeqNo) {
    UnkImageStruct_SetSpriteAnimCtrlCurrentFrame(data->monPics[whichPic], 0);
    UnkImageStruct_SetSpriteAnimSeqNo(data->monPics[whichPic], animSeqNo);
}

static RegisterHallOfFameScene RegisterHallOfFame_FadeFromBlack(RegisterHallOfFameData *data, RegisterHallOfFameScene nextScene) {
    BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, HEAP_ID_REGISTER_HALL_OF_FAME);
    data->nextScene = nextScene;
    return REGHOF_SCENE_0;
}

static RegisterHallOfFameScene RegisterHallOfFame_FadeToBlack(RegisterHallOfFameData *data, RegisterHallOfFameScene nextScene) {
    BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, HEAP_ID_REGISTER_HALL_OF_FAME);
    data->nextScene = nextScene;
    return REGHOF_SCENE_0;
}

static BOOL RegisterHallOfFame_SetupSubproc(RegisterHallOfFameData *data, BOOL (*callback)(RegisterHallOfFameData *), RegisterHallOfFameScene nextScene) {
    data->nextScene = nextScene;
    data->subprocCounter = 0;
    data->subprocStage = 0;
    data->subprocCallback = callback;
    return TRUE;
}

static RegisterHallOfFameScene RegisterHallOfFame_Scene0(RegisterHallOfFameData *data) {
    if (IsPaletteFadeFinished() == TRUE) {
        return data->nextScene;
    } else {
        return REGHOF_SCENE_0;
    }
}

static RegisterHallOfFameScene RegisterHallOfFame_Scene1(RegisterHallOfFameData *data) {
    if (data->subprocCallback == NULL) {
        return data->nextScene;
    } else {
        return REGHOF_SCENE_1;
    }
}

static RegisterHallOfFameScene RegisterHallOfFame_Scene2(RegisterHallOfFameData *data) {
    ov63_0221CC78(data);
    ov63_0221CDF8(data);
    ov63_0221CD68(data);
    data->sceneSubstep = 0;
    data->curMonIndex = 0;
    data->vblankTask = SysTask_CreateOnVBlankQueue(VBlankTask_RegisterHallOfFame_IndividualMonsCongrats, data, 0);
    return RegisterHallOfFame_FadeFromBlack(data, REGHOF_SCENE_3);
}

static RegisterHallOfFameScene RegisterHallOfFame_Scene3(RegisterHallOfFameData *data) {
    switch (data->sceneSubstep) {
    case 0:
        ov63_0221D344(data);
        ++data->sceneSubstep;
        break;
    case 1:
        ++data->sceneSubstep;
        if ((data->curMonIndex & 1) == 0) {
            RegisterHallOfFame_SetupSubproc(data, RegisterHallOfFame_ShowMon_LeftSide, REGHOF_SCENE_3);
        } else {
            RegisterHallOfFame_SetupSubproc(data, RegisterHallOfFame_ShowMon_RightSide, REGHOF_SCENE_3);
        }
        break;
    case 2:
        if (data->subprocCallback == NULL) {
            ++data->sceneSubstep;
        } else {
            if (data->unk_13060_1 == TRUE) {
                ov63_0221E450(data, data->curMonIndex, 2, 1, 0);
                data->unk_13060_1 = FALSE;
            }
            if (data->unk_13060_0 == TRUE) {
                ov63_0221E450(data, data->curMonIndex, 0, 1, 2);
                data->unk_13060_0 = FALSE;
            }
        }
        break;
    case 3:
        ov63_0221D21C(data);
        ++data->curMonIndex;
        if (data->numMons == data->curMonIndex) {
            ++data->sceneSubstep;
        } else {
            data->sceneSubstep = 0;
        }
        break;
    case 4:
        return RegisterHallOfFame_FadeToBlack(data, REGHOF_SCENE_4);
    }
    return REGHOF_SCENE_3;
}

static RegisterHallOfFameScene RegisterHallOfFame_Scene4(RegisterHallOfFameData *data) {
    SysTask_Destroy(data->vblankTask);
    ov63_0221CE7C(data);
    ov63_0221CD40(data);
    return REGHOF_SCENE_5;
}

static RegisterHallOfFameScene RegisterHallOfFame_Scene5(RegisterHallOfFameData *data) {
    data->curMonIndex = 0;
    data->sceneSubstep = 0;
    ov63_0221E940(data);
    ov63_0221EA24(data);
    ov63_0221EAA8(data);
    ov63_0221EC1C(data);
    ov63_0221F088(data);
    data->vblankTask = SysTask_CreateOnVBlankQueue(VBlankTask_RegisterHallOfFame_WholePartyCongrats, data, 4);
    return RegisterHallOfFame_FadeFromBlack(data, REGHOF_SCENE_6);
}

static RegisterHallOfFameScene RegisterHallOfFame_Scene6(RegisterHallOfFameData *data) {
    switch (data->sceneSubstep) {
    case 0:
        ++data->sceneSubstep;
        RegisterHallOfFame_SetupSubproc(data, ov63_0221E5A0, REGHOF_SCENE_6);
        break;
    case 1:
        if (data->subprocCallback == NULL) {
            ++data->sceneSubstep;
        }
        if (data->unk_13060_2 == TRUE) {
            data->spotlightsTask = RegisterHallOfFame_CreateSpotlightController(data);
            RegisterHallOfFame_AddSpotlight(data->spotlightsTask, -2925, FX32_CONST(20));
            RegisterHallOfFame_AddSpotlight(data->spotlightsTask, -1757, FX32_CONST(60));
            RegisterHallOfFame_AddSpotlight(data->spotlightsTask, -586, FX32_CONST(40));
            RegisterHallOfFame_AddSpotlight(data->spotlightsTask, 586, FX32_CONST(140));
            RegisterHallOfFame_AddSpotlight(data->spotlightsTask, 1757, FX32_CONST(120));
            RegisterHallOfFame_AddSpotlight(data->spotlightsTask, 2925, FX32_CONST(160));
            data->confettiTask = ov63_0221F614(data);
            ov63_0221F7DC(data->confettiTask);
            GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_ON);
            GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_ON);
            GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_ON);
            UnkImageStruct_SetSpriteVisibleFlag(data->monPics[12], TRUE);
            UnkImageStruct_SetSpriteVisibleFlag(data->monPics[13], TRUE);
            for (int i = 0; i < data->numMons; ++i) {
                ov63_0221C9E0(data, i, i);
                sub_0200E024(data->monPics[i], 1.0f, 1.0f);
                UnkImageStruct_SetSpriteVisibleFlag(data->monPics[6 + i], TRUE);
                sub_0200E0FC(data->monPics[i], GX_OAM_MODE_NORMAL);
                sub_0200E0FC(data->monPics[6 + i], GX_OAM_MODE_XLU);
            }
            data->unk_13060_2 = FALSE;
        }
        if (data->unk_13060_3 == TRUE) {
            ov63_0221E8AC(data);
            PlaySE(SEQ_SE_GS_DENDOUIRI_FLASH);
            PlaySE(SEQ_SE_GS_DENDOUIRI_KANSEI);
            data->unk_13060_3 = FALSE;
        }
        if (data->unk_13060_4 == TRUE) {
            ov63_0221E8D4(data);
            data->unk_13060_4 = FALSE;
        }
        break;
    case 2:
        data->sceneSubstep = 0;
        return REGHOF_SCENE_7;
    }

    return REGHOF_SCENE_6;
}

static RegisterHallOfFameScene RegisterHallOfFame_Scene7(RegisterHallOfFameData *data) {
    switch (data->sceneSubstep) {
    case 0:
        SysTask_Destroy(data->vblankTask);
        ov63_0221F7C4(data->confettiTask);
        ov63_0221F5B4(data->spotlightsTask);
        ++data->sceneSubstep;
        break;
    case 1:
        if (ov63_0221F600(data) == TRUE) {
            ++data->sceneSubstep;
        }
        break;
    case 2:
        ov63_0221F1C4(data);
        ov63_0221EFD8(data);
        ov63_0221EC04(data);
        ov63_0221E9FC(data);
        return REGHOF_SCENE_MAX;
    }

    return REGHOF_SCENE_7;
}

static void RegisterHallOfFame_MonSpritePosScaleAnimStep(UnkImageStruct *unkImageStruct, const RegHOFSpritePosScaleAnimParam *param, u32 duration, u32 step) {
    if (step == 0) {
        UnkImageStruct_SetSpritePositionXY(unkImageStruct, param->xStart, param->yStart);
        sub_0200E024(unkImageStruct, param->scaleStart, param->scaleStart);
    } else if (step == duration) {
        UnkImageStruct_SetSpritePositionXY(unkImageStruct, param->xEnd, param->yEnd);
        sub_0200E024(unkImageStruct, param->scaleEnd, param->scaleEnd);
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
        UnkImageStruct_SetSpritePositionXY(unkImageStruct, dx, dy);

        f32 fpos = param->scaleStart + (param->scaleEnd - param->scaleStart) / (float)duration * (float)step;
        sub_0200E024(unkImageStruct, fpos, fpos);
    }
}

static void ov63_0221C6FC(RegisterHallOfFameData *data) {
    NARC *narc = NARC_New(NARC_a_0_0_8, HEAP_ID_REGISTER_HALL_OF_FAME);
    SpriteRenderer_LoadCharResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 76, FALSE, NNS_G2D_VRAM_TYPE_2DMAIN, 55512);
    SpriteRenderer_LoadCellResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 77, FALSE, 55512);
    SpriteRenderer_LoadAnimResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 78, FALSE, 55512);
    SpriteRenderer_LoadPlttResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 75, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 55512);
    SpriteRenderer_LoadPlttResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 75, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 55513);
    SpriteRenderer_LoadCharResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 76, FALSE, NNS_G2D_VRAM_TYPE_2DMAIN, 55513);
    SpriteRenderer_LoadCellResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 77, FALSE, 55513);
    SpriteRenderer_LoadAnimResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 78, FALSE, 55513);
    SpriteRenderer_LoadPlttResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 75, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 55514);
    SpriteRenderer_LoadPlttResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 75, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 55515);
    NARC_Delete(narc);
}

static void ov63_0221C85C(RegisterHallOfFameData *data) {
    SpriteGfxHandler_UnloadPlttObjById(data->spriteGfxHandler, 55512);
    SpriteGfxHandler_UnloadPlttObjById(data->spriteGfxHandler, 55513);
    SpriteGfxHandler_UnloadPlttObjById(data->spriteGfxHandler, 55514);
    SpriteGfxHandler_UnloadPlttObjById(data->spriteGfxHandler, 55515);
    SpriteGfxHandler_UnloadCharObjById(data->spriteGfxHandler, 55512);
    SpriteGfxHandler_UnloadCellObjById(data->spriteGfxHandler, 55512);
    SpriteGfxHandler_UnloadAnimObjById(data->spriteGfxHandler, 55512);
    SpriteGfxHandler_UnloadCharObjById(data->spriteGfxHandler, 55513);
    SpriteGfxHandler_UnloadCellObjById(data->spriteGfxHandler, 55513);
    SpriteGfxHandler_UnloadAnimObjById(data->spriteGfxHandler, 55513);
}

static void ov63_0221C8E8(RegisterHallOfFameData *data, RegisterHofMon *hofMon, u8 whichFacing, int a3) {
    SomeDrawPokemonStruct sp8;
    GetPokemonSpriteCharAndPlttNarcIds(&sp8, hofMon->mon, whichFacing);
    ov63_0221C00C(
        whichFacing == 2 ? hofMon->unk_006C : hofMon->unk_196C,
        NNS_G2dGetImageLocation(sub_02024B1C(data->monPics[a3]->sprite), NNS_G2D_VRAM_TYPE_2DMAIN),
        3200
    );
    GfGfxLoader_GXLoadPal(
        (NarcId)sp8.narcID,
        sp8.palDataID,
        GF_PAL_LOCATION_MAIN_OBJ,
        (enum GFPalSlotOffset)NNS_G2dGetImagePaletteLocation(sub_02024B34(data->monPics[a3]->sprite), NNS_G2D_VRAM_TYPE_2DMAIN),
        0x20,
        HEAP_ID_REGISTER_HALL_OF_FAME
    );
}

int ov63_dummy_00(RegisterHallOfFameData *data);
int ov63_dummy_00(RegisterHallOfFameData *data) {
        return ov63_0221FCD8[data->curMonIndex].unk_0;
}

static void ov63_0221C954(RegisterHallOfFameData *data, int a1, int a2) {
    u32 dest = NNS_G2dGetImagePaletteLocation(sub_02024B34(data->monPics[a1]->sprite), NNS_G2D_VRAM_TYPE_2DMAIN);
    const u16 *pltt;

    switch (a2) {
    case 0:
        pltt = ov63_0221FC58;
        break;
    case 1:
        pltt = ov63_0221FC78;
        break;
    case 2:
        pltt = ov63_0221FC98;
        break;
    }

    ov63_0221C028(pltt, dest, 0x20);
}

static void ov63_0221C99C(RegisterHallOfFameData *data, int monIdx, int picIdx) {
    u32 dest = NNS_G2dGetImagePaletteLocation(sub_02024B34(data->monPics[picIdx]->sprite), NNS_G2D_VRAM_TYPE_2DMAIN);
    u16 *src = GetMainObjPlttAddr();
    RegisterHofMon *mon = &data->mons[monIdx];

    MI_CpuCopy8(src + (dest / 2), mon->unk_326C, 0x20);
}

static void ov63_0221C9E0(RegisterHallOfFameData *data, int a1, int a2) {
    u32 dest = NNS_G2dGetImagePaletteLocation(sub_02024B34(data->monPics[a2]->sprite), NNS_G2D_VRAM_TYPE_2DMAIN);
    RegisterHofMon *mon = &data->mons[a1];

    ov63_0221C028(mon->unk_326C, dest, 0x20);
}

static void ov63_0221CA1C(RegisterHallOfFameData *data, RegisterHofMon *mon) {
    if (mon->tsure_param[1]) {
        SpriteRenderer_LoadCharResObjFromOpenNarc(
            data->spriteRenderer,
            data->spriteGfxHandler,
            data->unk_00094,
            12,
            TRUE,
            NNS_G2D_VRAM_TYPE_2DMAIN,
            55518
        );
        SpriteRenderer_LoadCellResObjFromOpenNarc(
            data->spriteRenderer,
            data->spriteGfxHandler,
            data->unk_00094,
            13,
            TRUE,
            55514
        );
        SpriteRenderer_LoadAnimResObjFromOpenNarc(
            data->spriteRenderer,
            data->spriteGfxHandler,
            data->unk_00094,
            14,
            TRUE,
            55514
        );
    } else {
        SpriteRenderer_LoadCharResObjFromOpenNarc(
            data->spriteRenderer,
            data->spriteGfxHandler,
            data->unk_00094,
            9,
            TRUE,
            NNS_G2D_VRAM_TYPE_2DMAIN,
            55518
        );
        SpriteRenderer_LoadCellResObjFromOpenNarc(
            data->spriteRenderer,
            data->spriteGfxHandler,
            data->unk_00094,
            10,
            TRUE,
            55514
        );
        SpriteRenderer_LoadAnimResObjFromOpenNarc(
            data->spriteRenderer,
            data->spriteGfxHandler,
            data->unk_00094,
            11,
            TRUE,
            55514
        );
    }
    SpriteRenderer_LoadPlttResObjFromOpenNarc(
        data->spriteRenderer,
        data->spriteGfxHandler,
        data->unk_00094,
        15,
        FALSE,
        1,
        NNS_G2D_VRAM_TYPE_2DMAIN,
        55518
    );
    SpriteRenderer_LoadPlttResObjFromOpenNarc(
        data->spriteRenderer,
        data->spriteGfxHandler,
        data->unk_00094,
        15,
        FALSE,
        1,
        NNS_G2D_VRAM_TYPE_2DMAIN,
        55519
    );
}

static void ov63_0221CB48(RegisterHallOfFameData *data) {
    SpriteGfxHandler_UnloadPlttObjById(data->spriteGfxHandler, 55518);
    SpriteGfxHandler_UnloadPlttObjById(data->spriteGfxHandler, 55519);
    SpriteGfxHandler_UnloadCharObjById(data->spriteGfxHandler, 55518);
    SpriteGfxHandler_UnloadCellObjById(data->spriteGfxHandler, 55514);
    SpriteGfxHandler_UnloadAnimObjById(data->spriteGfxHandler, 55514);
}

static void ov63_0221CB94(RegisterHallOfFameData *data, RegisterHofMon *hofMon, int a2) {
    NNSG3dResTex *resTex;
    void *fileData;
    const void *sp18;
    u32 sp14 = NNS_G2dGetImageLocation(sub_02024B1C(data->monPics[a2]->sprite), NNS_G2D_VRAM_TYPE_2DMAIN);
    int sp10 = hofMon->tsure_param[1] ? 8 : 4;
    u32 size = 32 * sp10 * sp10;
    int fileno = ov63_0221E404(hofMon->species, hofMon->form, hofMon->gender);
    fileData = AllocAndReadWholeNarcMemberByIdPair(NARC_data_mmodel_mmodel, fileno, HEAP_ID_REGISTER_HALL_OF_FAME);
    resTex = NNS_G3dGetTex(fileData);
    sp18 = NNS_G3dGetTexData(resTex);
    void *buffer = AllocFromHeap(HEAP_ID_REGISTER_HALL_OF_FAME, size);
    for (u8 i = 0; i < 8; ++i) {
        sub_020145B4((const u8 *)sp18 + size * i, sp10, 0, 0, sp10, sp10, buffer);
        ov63_0221C00C(buffer, sp14 + size * i, size);
    }
    FreeToHeap(buffer);

    u32 plttLoc = NNS_G2dGetImagePaletteLocation(sub_02024B34(data->monPics[a2]->sprite), NNS_G2D_VRAM_TYPE_2DMAIN);
    const void *loadPos = NNS_G3dGetPlttData(resTex);
    if (MonIsShiny(hofMon->mon) == TRUE) {
        loadPos = (const u8 *)loadPos + 0x20;
    }
    ov63_0221C028(loadPos, plttLoc, 0x20);
    FreeToHeap(fileData);
}

static void ov63_0221CC78(RegisterHallOfFameData *data) {
    {
                GraphicsModes graphicsModes = ov63_0221FB10;
        SetBothScreensModesAndDisable(&graphicsModes);
    }

    {
                BgTemplate bgTemplate = ov63_0221FBAC;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_0, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_0);
        BG_ClearCharDataRange(GF_BG_LYR_MAIN_0, 0x20, 0x0000, HEAP_ID_REGISTER_HALL_OF_FAME);
    }

    {
                BgTemplate bgTemplate = ov63_0221FBC8;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_1, &bgTemplate, GF_BG_TYPE_TEXT);
    }

    {
                BgTemplate bgTemplate = ov63_0221FB74;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_2, &bgTemplate, GF_BG_TYPE_TEXT);
    }

    {
                BgTemplate bgTemplate = ov63_0221FC1C;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_3, &bgTemplate, GF_BG_TYPE_TEXT);
    }
}

static void ov63_0221CD40(RegisterHallOfFameData *data) {
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_3);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_0);
}

static void ov63_0221CD68(RegisterHallOfFameData *data) {
    GfGfxLoader_LoadScrnDataFromOpenNarc(data->unk_00094, 0, data->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, TRUE, HEAP_ID_REGISTER_HALL_OF_FAME);
    GfGfxLoader_LoadScrnDataFromOpenNarc(data->unk_00094, 1, data->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_REGISTER_HALL_OF_FAME);
    GfGfxLoader_LoadScrnDataFromOpenNarc(data->unk_00094, 2, data->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_REGISTER_HALL_OF_FAME);
    GfGfxLoader_LoadCharDataFromOpenNarc(data->unk_00094, 3, data->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, TRUE, HEAP_ID_REGISTER_HALL_OF_FAME);
    GfGfxLoader_GXLoadPalFromOpenNarc(data->unk_00094, 4, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0, 0x20, HEAP_ID_REGISTER_HALL_OF_FAME);
}

static void ov63_0221CDF8(RegisterHallOfFameData *data) {
    for (int i = 0; i < 7u; ++i) {
        AddWindow(data->bgConfig, &data->unk_00014[i], &ov63_0221FD80[i]);
    }

    FillWindowPixelBuffer(&data->unk_00014[0], 0);
    ReadMsgDataIntoString(data->msgData, msg_0180_00000, data->unk_0008C);  // The Hall of Fame!
    AddTextPrinterParameterizedWithColor(&data->unk_00014[0], 0, data->unk_0008C, 128 - FontID_String_GetWidth(0, data->unk_0008C, 0) / 2, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 2, 0), NULL);
    CopyWindowPixelsToVram_TextMode(&data->unk_00014[0]);
}

static void ov63_0221CE7C(RegisterHallOfFameData *data) {
    for (int i = 0; i < 7u; ++i) {
        RemoveWindow(&data->unk_00014[i]);
    }
}

static void ov63_0221CE94(RegisterHallOfFameData *data, u16 a1, int a2) {
    Window *windows = &data->unk_00014[a2];
    RegisterHofMon *hofMon = &data->mons[a1];
    Pokemon *mon = hofMon->mon;
    BoxPokemon *boxmon = Mon_GetBoxMon(mon);

    FillWindowPixelBuffer(&windows[0], 0);
    ReadMsgDataIntoString(data->msgData, msg_0180_00004, data->unk_0008C);
    BufferBoxMonNickname(data->msgFormat, 0, boxmon);
    StringExpandPlaceholders(data->msgFormat, data->unk_00090, data->unk_0008C);
    AddTextPrinterParameterizedWithColor(&windows[0], 0, data->unk_00090, 2, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 2, 0), NULL);
    CopyWindowPixelsToVram_TextMode(&windows[0]);

    FillWindowPixelBuffer(&windows[1], 0);
    if (hofMon->gender == 2 || hofMon->printGender == 0) {
        ReadMsgDataIntoString(data->msgData, msg_0180_00003, data->unk_0008C);
    } else if (hofMon->gender == 0) {
        ReadMsgDataIntoString(data->msgData, msg_0180_00001, data->unk_0008C);
    } else if (hofMon->gender == 1) {
        ReadMsgDataIntoString(data->msgData, msg_0180_00002, data->unk_0008C);
    } else {
        ReadMsgDataIntoString(data->msgData, msg_0180_00003, data->unk_0008C);
    }
    BufferBoxMonSpeciesName(data->msgFormat, 0, boxmon);
    StringExpandPlaceholders(data->msgFormat, data->unk_00090, data->unk_0008C);
    AddTextPrinterParameterizedWithColor(&windows[1], 0, data->unk_00090, 2, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 2, 0), NULL);

    ReadMsgDataIntoString(data->msgData, msg_0180_00005, data->unk_0008C);
    BufferIntegerAsString(data->msgFormat, 0, hofMon->level, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
    StringExpandPlaceholders(data->msgFormat, data->unk_00090, data->unk_0008C);
    AddTextPrinterParameterizedWithColor(&windows[1], 0, data->unk_00090, 2, 16, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 2, 0), NULL);
    CopyWindowPixelsToVram_TextMode(&windows[1]);

    FillWindowPixelBuffer(&windows[2], 0);
    ReadMsgDataIntoString(data->msgData, msg_0180_00006, data->unk_0008C);
    BufferBoxMonOTName(data->msgFormat, 0, boxmon);
    StringExpandPlaceholders(data->msgFormat, data->unk_00090, data->unk_0008C);
    AddTextPrinterParameterizedWithColor(&windows[2], 0, data->unk_00090, 2, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 2, 0), NULL);

    switch (ov63_0221E310(data, mon, data->args->profile)) {
    case 0:
        ReadMsgDataIntoString(data->msgData, msg_0180_00007, data->unk_0008C);
        BufferLandmarkName(data->msgFormat, 0, hofMon->metLocation);
        StringExpandPlaceholders(data->msgFormat, data->unk_00090, data->unk_0008C);
        break;
    case 1:
        ReadMsgDataIntoString(data->msgData, msg_0180_00008, data->unk_0008C);
        BufferLandmarkName(data->msgFormat, 0, hofMon->metLocation);
        StringExpandPlaceholders(data->msgFormat, data->unk_00090, data->unk_0008C);
        break;
    case 2:
        ReadMsgDataIntoString(data->msgData, msg_0180_00009, data->unk_00090);
        break;
    case 3:
        ReadMsgDataIntoString(data->msgData, msg_0180_00010, data->unk_00090);
        break;
    case 4:
        ReadMsgDataIntoString(data->msgData, msg_0180_00011, data->unk_00090);
        break;
    case 5:
        ReadMsgDataIntoString(data->msgData, msg_0180_00014, data->unk_00090);
        break;
    case 6:
        ReadMsgDataIntoString(data->msgData, msg_0180_00012, data->unk_00090);
        break;
    case 7:
        ReadMsgDataIntoString(data->msgData, msg_0180_00013, data->unk_00090);
        break;
    case 8:
    case 9:
        ReadMsgDataIntoString(data->msgData, msg_0180_00015, data->unk_0008C);
        BufferLandmarkName(data->msgFormat, 0, hofMon->metLocation);
        StringExpandPlaceholders(data->msgFormat, data->unk_00090, data->unk_0008C);
        break;
    }
    AddTextPrinterParameterizedWithColor(&windows[2], 0, data->unk_00090, 2, 24, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 2, 0), NULL);
    CopyWindowPixelsToVram_TextMode(&windows[2]);
}

static void ov63_0221D20C(RegisterHallOfFameData *data, int a1) {
    ov63_0221D240(data, a1);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
}

static void ov63_0221D21C(RegisterHallOfFameData *data) {
    for (u32 i = 0; i < 15u; ++i) {
        ov63_0221C134(data, i);
    }
    ov63_0221CB48(data);
    ov63_0221C85C(data);
}

static void ov63_0221D240(RegisterHallOfFameData *data, int a1) {
    RegisterHofMon *hofMon = &data->mons[a1];
    ov63_0221C6FC(data);
    ov63_0221CA1C(data, hofMon);
    for (int i = 0; i <= 5u; ++i) {
        data->monPics[i] = SpriteRenderer_LoadResourcesAndCreateSprite(data->spriteRenderer, data->spriteGfxHandler, &ov63_0221FF68[i]);
    }
    ov63_0221C8E8(data, hofMon, 2, 0);
    ov63_0221C8E8(data, hofMon, 0, 2);
    ov63_0221CB94(data, hofMon, 4);
    if (hofMon->species == SPECIES_KRABBY || hofMon->species == SPECIES_KINGLER) {
        ov63_0221C16C(data, 4, 2);
        ov63_0221C16C(data, 5, 2);
    }
    ov63_0221C954(data, 1, 0);
    ov63_0221C954(data, 3, 0);
    ov63_0221C954(data, 5, 0);
}

static void ov63_0221D2F8(RegisterHallOfFameData *data, RegisterHofMon *mon) {
    if (mon->tsure_param[1]) {
        UnkImageStruct_AddSpritePositionXY(data->monPics[4], -32, -32);
        UnkImageStruct_AddSpritePositionXY(data->monPics[5], -32, -32);
    } else {
        UnkImageStruct_AddSpritePositionXY(data->monPics[4], -16, -16);
        UnkImageStruct_AddSpritePositionXY(data->monPics[5], -16, -16);
    }
}

static void ov63_0221D344(RegisterHallOfFameData *data) {
    RegisterHofMon *hofMon = &data->mons[data->curMonIndex];

    ov63_0221D20C(data, data->curMonIndex);
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
        UnkImageStruct_SetSpritePositionXY(data->monPics[0], 256, -40);
        UnkImageStruct_SetSpritePositionXY(data->monPics[1], 296, -80);
        UnkImageStruct_SetSpritePositionXY(data->monPics[2], 288, 152 + hofMon->unk_0013);
        UnkImageStruct_SetSpritePositionXY(data->monPics[3], 296, 152 + hofMon->unk_0013);
        UnkImageStruct_SetSpritePositionXY(data->monPics[4], -82, -2);
        UnkImageStruct_SetSpritePositionXY(data->monPics[5], -89, -3);
        ov63_0221CE94(data, data->curMonIndex, 1);
    } else {
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SET_X, 0);
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SET_Y, 256);
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, -184);
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, 0);
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_X, 256);
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, 0);
        UnkImageStruct_SetSpritePositionXY(data->monPics[0], 0, -40);
        UnkImageStruct_SetSpritePositionXY(data->monPics[1], -40, -80);
        UnkImageStruct_SetSpritePositionXY(data->monPics[2], -80, 152 + hofMon->unk_0013);
        UnkImageStruct_SetSpritePositionXY(data->monPics[3], -92, 152 + hofMon->unk_0013);
        UnkImageStruct_SetSpritePositionXY(data->monPics[4], 338, -2);
        UnkImageStruct_SetSpritePositionXY(data->monPics[5], 345, -3);
        ov63_0221CE94(data, data->curMonIndex, 4);
    }
    sub_0200DF98(data->monPics[0], 2);
    sub_0200DF98(data->monPics[1], 2);
    sub_0200E024(data->monPics[1], 1.5, 1.5);
    ov63_0221D2F8(data, hofMon);
    ScheduleBgTilemapBufferTransfer(data->bgConfig, GF_BG_LYR_MAIN_0);
}

// Lord help me with this, just under 700 lines of asm
static BOOL RegisterHallOfFame_ShowMon_LeftSide(RegisterHallOfFameData *data) {
    switch (data->subprocStage) {
    case 0:
        if (data->subprocCounter == 10) {
            u8 r5 = data->mons[data->curMonIndex].unk_0013;
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SET_X, -72);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, 72);
            UnkImageStruct_SetSpritePositionXY(data->monPics[2], 48, r5 + 152);
            UnkImageStruct_SetSpritePositionXY(data->monPics[3], 46, r5 + 152);
            data->subprocCounter = 0;
            ++data->subprocStage;
        } else {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SUB_X, 7);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_ADD_X, 7);
            UnkImageStruct_AddSpritePositionXY(data->monPics[2], -24, 0);
            UnkImageStruct_AddSpritePositionXY(data->monPics[3], -25, 0);
            ++data->subprocCounter;
        }
        break;
    case 1:
        data->unk_13060_1 = TRUE;
        ++data->subprocStage;
        break;
    case 2:
        if (data->subprocCounter == 50) {
            data->subprocCounter = 0;
            ++data->subprocStage;
        } else {
            ++data->subprocCounter;
        }
        break;
    case 3:
        if (data->subprocCounter == 6) {
            UnkImageStruct_SetSpritePositionXY(data->monPics[4], 32, 40);
            UnkImageStruct_SetSpritePositionXY(data->monPics[5], 31, 39);
            ov63_0221D2F8(data, &data->mons[data->curMonIndex]);
            data->subprocCounter = 0;
            ++data->subprocStage;
        } else {
            UnkImageStruct_AddSpritePositionXY(data->monPics[4], 19, 7);
            UnkImageStruct_AddSpritePositionXY(data->monPics[5], 20, 7);
            ++data->subprocCounter;
        }
        break;
    case 4:
        if (data->mons[data->curMonIndex].species == SPECIES_KRABBY || data->mons[data->curMonIndex].species == SPECIES_KINGLER) {
            ov63_0221C16C(data, 4, 3);
            ov63_0221C16C(data, 5, 3);
        } else {
            ov63_0221C16C(data, 4, 1);
            ov63_0221C16C(data, 5, 1);
        }
        ++data->subprocStage;
        break;
    case 5:
        if (data->subprocCounter == 20) {
            data->subprocCounter = 0;
            ++data->subprocStage;
        } else {
            ++data->subprocCounter;
        }
        break;
    case 6:
        ScheduleWindowCopyToVram(&data->unk_00014[0]);
        ++data->subprocStage;
        break;
    case 7:
        if (data->subprocCounter == 60) {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, -16);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, 256);
            UnkImageStruct_SetSpritePriority(data->monPics[2], 2);
            UnkImageStruct_SetSpritePriority(data->monPics[3], 2);
            data->subprocCounter = 0;
            ++data->subprocStage;
        } else {
            ++data->subprocCounter;
        }
        break;
    case 8:
        if (data->subprocCounter == 8) {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, 112);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, 192);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, 256);
            UnkImageStruct_SetSpritePositionXY(data->monPics[0], 88, 88);
            UnkImageStruct_SetSpritePositionXY(data->monPics[1], 104, 72);
            data->subprocCounter = 0;
            ++data->subprocStage;
        } else {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_ADD_X, 16);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SUB_Y, 8);
            UnkImageStruct_AddSpritePositionXY(data->monPics[0], -21, 16);
            UnkImageStruct_AddSpritePositionXY(data->monPics[1], -24, 19);
            ++data->subprocCounter;
        }
        break;
    case 9:
        ScheduleWindowCopyToVram(&data->unk_00014[1]);
        ov63_0221C954(data, 2, 0);
        ov63_0221C954(data, 4, 0);
        ov63_0221C954(data, 3, 2);
        ov63_0221C954(data, 5, 2);
        ++data->subprocStage;
        break;
    case 10:
        if (data->subprocCounter == 40) {
            data->subprocCounter = 0;
            ++data->subprocStage;
        } else {
            ++data->subprocCounter;
        }
        break;
    case 11:
        ScheduleWindowCopyToVram(&data->unk_00014[2]);
        data->unk_13060_0 = TRUE;
        ++data->subprocStage;
        break;
    case 12:
        if (data->subprocCounter == 20) {
            data->subprocCounter = 0;
            ++data->subprocStage;
        } else {
            ++data->subprocCounter;
        }
        break;
    case 13:
        ScheduleWindowCopyToVram(&data->unk_00014[3]);
        ++data->subprocStage;
        break;
    case 14:
        if (data->subprocCounter == 240) {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, 72);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, 0);
            UnkImageStruct_SetSpritePriority(data->monPics[0], 3);
            UnkImageStruct_SetSpritePriority(data->monPics[1], 3);
            UnkImageStruct_SetSpritePriority(data->monPics[2], 3);
            UnkImageStruct_SetSpritePriority(data->monPics[3], 3);
            UnkImageStruct_SetSpritePriority(data->monPics[4], 3);
            UnkImageStruct_SetSpritePriority(data->monPics[5], 3);
            data->unk_13058 = 1.0f;
            data->unk_1305C = 1.5f;
            data->subprocCounter = 0;
            ++data->subprocStage;
        } else {
            ++data->subprocCounter;
        }
        break;
    case 15:
        if (data->subprocCounter == 10) {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_X, -80);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_Y, -200);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SET_X, 0);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, 0);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_X, 60);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, 226);
            UnkImageStruct_SetSpritePositionXY(data->monPics[2], 148, 252);
            UnkImageStruct_SetSpritePositionXY(data->monPics[3], 64, 192);
            UnkImageStruct_SetSpritePositionXY(data->monPics[4], -28, -30);
            UnkImageStruct_SetSpritePositionXY(data->monPics[5], -29, -31);
            UnkImageStruct_SetSpritePositionXY(data->monPics[0], 48, 128);
            UnkImageStruct_SetSpritePositionXY(data->monPics[1], 64, 112);
            sub_0200E024(data->monPics[0], 1.8f, 1.8f);
            sub_0200E024(data->monPics[1], 2.0f, 2.0f);
            data->subprocCounter = 0;
            ++data->subprocStage;
        } else {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SUB_X, 8);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_ADD_Y, 20);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_ADD_X, 7);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SUB_X, 7);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_ADD_X, 6);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SUB_Y, 3);
            UnkImageStruct_AddSpritePositionXY(data->monPics[2], 10, 10);
            UnkImageStruct_AddSpritePositionXY(data->monPics[3], 10, 10);
            UnkImageStruct_AddSpritePositionXY(data->monPics[4], -6, -7);
            UnkImageStruct_AddSpritePositionXY(data->monPics[5], -6, -7);
            UnkImageStruct_AddSpritePositionXY(data->monPics[0], -4, 4);
            UnkImageStruct_AddSpritePositionXY(data->monPics[1], -4, 4);
            data->unk_13058 += 0.08;
            data->unk_1305C += 0.05;
            sub_0200E024(data->monPics[0], data->unk_13058, data->unk_13058);
            sub_0200E024(data->monPics[1], data->unk_1305C, data->unk_1305C);
            ++data->subprocCounter;
        }
        break;
    case 16:
        if (data->subprocCounter == 60) {
            return FALSE;
        } else {
            ++data->subprocCounter;
        }
        break;
    }

    return TRUE;
}

// Lord help me with this, just under 700 lines of asm
static BOOL RegisterHallOfFame_ShowMon_RightSide(RegisterHallOfFameData *data) {
    switch (data->subprocStage) {
    case 0:
        if (data->subprocCounter == 10) {
            u8 r5 = data->mons[data->curMonIndex].unk_0013;
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SET_X, 72);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, -256);
            UnkImageStruct_SetSpritePositionXY(data->monPics[2], 160, r5 + 152);
            UnkImageStruct_SetSpritePositionXY(data->monPics[3], 158, r5 + 152);
            data->subprocCounter = 0;
            ++data->subprocStage;
        } else {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_ADD_X, 7);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SUB_X, 7);
            UnkImageStruct_AddSpritePositionXY(data->monPics[2], 24, 0);
            UnkImageStruct_AddSpritePositionXY(data->monPics[3], 25, 0);
            ++data->subprocCounter;
        }
        break;
    case 1:
        data->unk_13060_1 = TRUE;
        ++data->subprocStage;
        break;
    case 2:
        if (data->subprocCounter == 50) {
            data->subprocCounter = 0;
            ++data->subprocStage;
        } else {
            ++data->subprocCounter;
        }
        break;
    case 3:
        if (data->subprocCounter == 6) {
            UnkImageStruct_SetSpritePositionXY(data->monPics[4], 224, 40);
            UnkImageStruct_SetSpritePositionXY(data->monPics[5], 225, 39);
            ov63_0221D2F8(data, &data->mons[data->curMonIndex]);
            data->subprocCounter = 0;
            ++data->subprocStage;
        } else {
            UnkImageStruct_AddSpritePositionXY(data->monPics[4], -19, 7);
            UnkImageStruct_AddSpritePositionXY(data->monPics[5], -20, 7);
            ++data->subprocCounter;
        }
        break;
    case 4:
        if (data->mons[data->curMonIndex].species == 98 || data->mons[data->curMonIndex].species == 99) {
            ov63_0221C16C(data, 4, 3);
            ov63_0221C16C(data, 5, 3);
        } else {
            ov63_0221C16C(data, 4, 1);
            ov63_0221C16C(data, 5, 1);
        }
        ++data->subprocStage;
        break;
    case 5:
        if (data->subprocCounter == 20) {
            data->subprocCounter = 0;
            ++data->subprocStage;
        } else {
            ++data->subprocCounter;
        }
        break;
    case 6:
        ScheduleWindowCopyToVram(&data->unk_00014[0]);
        ++data->subprocStage;
        break;
    case 7:
        if (data->subprocCounter == 60) {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, 272);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, 256);
            UnkImageStruct_SetSpritePriority(data->monPics[2], 2);
            UnkImageStruct_SetSpritePriority(data->monPics[3], 2);
            data->subprocCounter = 0;
            ++data->subprocStage;
        } else {
            ++data->subprocCounter;
        }
        break;
    case 8:
        if (data->subprocCounter == 8) {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, 144);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, 192);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, 256);
            UnkImageStruct_SetSpritePositionXY(data->monPics[0], 168, 88);
            UnkImageStruct_SetSpritePositionXY(data->monPics[1], 152, 72);
            data->subprocCounter = 0;
            ++data->subprocStage;
        } else {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SUB_X, 16);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SUB_Y, 8);
            UnkImageStruct_AddSpritePositionXY(data->monPics[0], 21, 16);
            UnkImageStruct_AddSpritePositionXY(data->monPics[1], 24, 19);
            ++data->subprocCounter;
        }
        break;
    case 9:
        ScheduleWindowCopyToVram(&data->unk_00014[4]);
        ov63_0221C954(data, 2, 0);
        ov63_0221C954(data, 4, 0);
        ov63_0221C954(data, 3, 2);
        ov63_0221C954(data, 5, 2);
        ++data->subprocStage;
        break;
    case 10:
        if (data->subprocCounter == 40) {
            data->subprocCounter = 0;
            ++data->subprocStage;
        } else {
            ++data->subprocCounter;
        }
        break;
    case 11:
        ScheduleWindowCopyToVram(&data->unk_00014[5]);
        data->unk_13060_0 = TRUE;
        ++data->subprocStage;
        break;
    case 12:
        if (data->subprocCounter == 20) {
            data->subprocCounter = 0;
            ++data->subprocStage;
        } else {
            ++data->subprocCounter;
        }
        break;
    case 13:
        ScheduleWindowCopyToVram(&data->unk_00014[6]);
        ++data->subprocStage;
        break;
    case 14:
        if (data->subprocCounter == 240) {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, -256);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, 0);
            UnkImageStruct_SetSpritePriority(data->monPics[0], 3);
            UnkImageStruct_SetSpritePriority(data->monPics[1], 3);
            UnkImageStruct_SetSpritePriority(data->monPics[2], 3);
            UnkImageStruct_SetSpritePriority(data->monPics[3], 3);
            UnkImageStruct_SetSpritePriority(data->monPics[4], 3);
            UnkImageStruct_SetSpritePriority(data->monPics[5], 3);
            data->unk_13058 = 1.0f;
            data->unk_1305C = 1.5f;
            data->subprocCounter = 0;
            ++data->subprocStage;
        } else {
            ++data->subprocCounter;
        }
        break;
    case 15:
        if (data->subprocCounter == 10) {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_X, 80);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_Y, -200);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SET_X, 0);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, -184);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_X, 196);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, 226);
            UnkImageStruct_SetSpritePositionXY(data->monPics[2], 260, 252);
            UnkImageStruct_SetSpritePositionXY(data->monPics[3], 192, 192);
            UnkImageStruct_SetSpritePositionXY(data->monPics[4], 164, -30);
            UnkImageStruct_SetSpritePositionXY(data->monPics[5], 165, -31);
            UnkImageStruct_SetSpritePositionXY(data->monPics[0], 208, 128);
            UnkImageStruct_SetSpritePositionXY(data->monPics[1], 192, 112);
            sub_0200E024(data->monPics[0], 1.8f, 1.8f);
            sub_0200E024(data->monPics[1], 2.0f, 2.0f);
            data->subprocCounter = 0;
            ++data->subprocStage;
        } else {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_ADD_X, 8);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_ADD_Y, 20);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SUB_X, 7);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_ADD_X, 7);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SUB_X, 6);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SUB_Y, 3);
            UnkImageStruct_AddSpritePositionXY(data->monPics[2], -10, 10);
            UnkImageStruct_AddSpritePositionXY(data->monPics[3], -10, 10);
            UnkImageStruct_AddSpritePositionXY(data->monPics[4], 6, -7);
            UnkImageStruct_AddSpritePositionXY(data->monPics[5], 6, -7);
            UnkImageStruct_AddSpritePositionXY(data->monPics[0], 4, 4);
            UnkImageStruct_AddSpritePositionXY(data->monPics[1], 4, 4);
            data->unk_13058 += 0.08;
            data->unk_1305C += 0.05;
            sub_0200E024(data->monPics[0], data->unk_13058, data->unk_13058);
            sub_0200E024(data->monPics[1], data->unk_1305C, data->unk_1305C);
            ++data->subprocCounter;
        }
        break;
    case 16:
        if (data->subprocCounter == 60) {
            return FALSE;
        } else {
            ++data->subprocCounter;
        }
        break;
    }

    return TRUE;
}

static void ov63_0221E114(RegisterHallOfFameData *data) {

    u32 i;
    SomeDrawPokemonStruct sp40;
    UnkStruct_02014E30 sp20[2];
    {
        struct tmp {
            UnkStruct_02014E30 _[2];
        };
        *(struct tmp *)sp20 = *(const struct tmp *)ov63_0221FC38;
    }
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
            hofMon->unk_0013 = sub_020708D8(hofMon->species, hofMon->gender, 0, hofMon->form, hofMon->personality) + 8;
            hofMon->metLocation = GetMonData(pokemon, MON_DATA_MET_LOCATION, NULL);
            hofMon->level = GetMonData(pokemon, MON_DATA_LEVEL, NULL);
            hofMon->partyIndex = i;
            if (hofMon->species == SPECIES_NIDORAN_F || hofMon->species == SPECIES_NIDORAN_M) {
                hofMon->printGender = FALSE;
            } else {
                hofMon->printGender = TRUE;
            }
            ReadWholeNarcMemberByIdPair(hofMon->tsure_param, NARC_fielddata_tsurepoke_tp_param, SpeciesToOverworldModelIndexOffset(hofMon->species));
            GetPokemonSpriteCharAndPlttNarcIds(&sp40, pokemon, 2);
            sub_02014510((NarcId)sp40.narcID, sp40.charDataID, HEAP_ID_REGISTER_HALL_OF_FAME, &sp20[0], hofMon->unk_006C, hofMon->personality, 1, 2, hofMon->species);
            sub_02014510((NarcId)sp40.narcID, sp40.charDataID, HEAP_ID_REGISTER_HALL_OF_FAME, &sp20[1], hofMon->unk_0CEC, hofMon->personality, 1, 2, hofMon->species);
            GetPokemonSpriteCharAndPlttNarcIds(&sp40, pokemon, 0);
            sub_02014510((NarcId)sp40.narcID, sp40.charDataID, HEAP_ID_REGISTER_HALL_OF_FAME, &sp20[0], hofMon->unk_196C, hofMon->personality, 1, 0, hofMon->species);
            sub_02014510((NarcId)sp40.narcID, sp40.charDataID, HEAP_ID_REGISTER_HALL_OF_FAME, &sp20[1], hofMon->unk_25EC, hofMon->personality, 1, 0, hofMon->species);
            sub_02072914(narc, hofMon->unk_001C, hofMon->species, 1);
            sub_02072914(narc, hofMon->unk_0044, hofMon->species, 0);
            ++data->numMons;
        }
        ReleaseMonLock(pokemon, encry);
    }
    NARC_Delete(narc);
}

static int ov63_0221E310(RegisterHallOfFameData *data, Pokemon *pokemon, PlayerProfile *profile) {
    BOOL encry = AcquireMonLock(pokemon);
    int ret;
    int version = GetMonData(pokemon, MON_DATA_GAME_VERSION, NULL);
    if (version == VERSION_SAPPHIRE || version == VERSION_RUBY || version == VERSION_EMERALD) {
        ret = 4;
    } else if (version == VERSION_FIRE_RED || version == VERSION_LEAF_GREEN) {
        ret = 3;
    } else if (version == VERSION_GAMECUBE) {
        ret = 6;
    } else if (version == VERSION_DIAMOND || version == VERSION_PEARL || version == VERSION_PLATINUM) {
        ret = 5;
    } else if (GetMonData(pokemon, MON_DATA_FATEFUL_ENCOUNTER, NULL)) {
        ret = 7;
    } else if (MonIsInGameTradePoke(pokemon, NPC_TRADE_SHUCKIE_SHUCKLE) == TRUE) {
        ret = 8;
    } else if (MonIsInGameTradePoke(pokemon, NPC_TRADE_KENYA_SPEAROW) == TRUE) {
        ret = 9;
    } else if (PlayerProfile_GetTrainerID(profile) != GetMonData(pokemon, MON_DATA_OTID, NULL)) {
        ret = 2;
    } else {
        PlayerName_FlatToString(profile, data->unk_0008C);
        GetMonData(pokemon, MON_DATA_OT_NAME_2, data->unk_00090);
        if (String_Compare(data->unk_0008C, data->unk_00090)) {
            ret = 2;
        } else if (GetMonData(pokemon, MON_DATA_MET_LOCATION, NULL) >= METLOC_DAY_CARE_COUPLE) {
            ret = 7;
        } else if (GetMonData(pokemon, MON_DATA_EGG_MET_MONTH, NULL) == 0) {
            ret = 0;
        } else {
            ret = 1;
        }
    }
    ReleaseMonLock(pokemon, encry);
    return ret;
}

static int ov63_0221E404(int species, u8 form, u8 gender) {
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

typedef struct UnkStruct_ov63_0221E450 {
    RegisterHofMon *hofMon;
    UnkStruct_02009264 unk_04;
    NARC *unk_18;
    u16 *unk_1C;
    u32 unk_20;
    u16 unk_24;
    int unk_28;
} UnkStruct_ov63_0221E450;

static void ov63_0221E450(RegisterHallOfFameData *data, int a1, int a2, int a3, int a4) {
    UnkStruct_ov63_0221E450 *r4 = AllocFromHeap(HEAP_ID_REGISTER_HALL_OF_FAME, sizeof(UnkStruct_ov63_0221E450));
    r4->hofMon = &data->mons[a1];
    r4->unk_28 = a3;
    r4->unk_18 = data->unk_00098;
    r4->unk_20 = NNS_G2dGetImageLocation(sub_02024B1C(data->monPics[a2]->sprite), NNS_G2D_VRAM_TYPE_2DMAIN);
    if (a4 == 2) {
        r4->unk_1C = r4->hofMon->unk_006C;
        r4->unk_24 = 1;
        sub_02009264(&r4->unk_04, r4->hofMon->unk_001C);
    } else {
        r4->unk_1C = r4->hofMon->unk_196C;
        r4->unk_24 = 0;
        sub_02009264(&r4->unk_04, r4->hofMon->unk_0044);
    }
    SysTask_CreateOnMainQueue(ov63_0221E4E0, r4, 0);
}

static void ov63_0221E4E0(SysTask *task, void *taskData) {
    u8 sp4;
    UnkStruct_ov63_0221E450 *r4 = (UnkStruct_ov63_0221E450 *)taskData;
    if (r4->unk_28 == 1) {
        sub_020729A4(r4->unk_18, &sp4, r4->hofMon->species, r4->unk_24);
        if (r4->hofMon->species == SPECIES_CHATOT) {
            sub_02006EA0(NULL, 0, 100, 0, sp4);
        } else {
            sub_020062E0(r4->hofMon->species, sp4, r4->hofMon->form);
        }
        r4->unk_28 = 0;
    }
    int r0 = sub_02009284(&r4->unk_04);
    if (r0 >= 0) {
        ov63_0221C00C(&((u8 *)r4->unk_1C)[3200 * r0], r4->unk_20, 3200);
    } else {
        FreeToHeap(r4);
        SysTask_Destroy(task);
    }
}

static void ov63_0221E55C(RegisterHallOfFameData *data, u16 a1, u16 a2) {
    if (a1 == a2) {
        G2_SetBlendAlpha(0, 28, 0, 0);
    } else {
        u32 ev = (0x100000u / a1 * a2) / 0x10000u;
        G2_SetBlendAlpha(4, 28, ev, 16 - ev);
    }
}

static BOOL ov63_0221E5A0(RegisterHallOfFameData *data) {
    if (data->unk_13060_5 == TRUE) {
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SUB_X, 2);
    }
    if (data->unk_13060_6 == TRUE) {
        if (data->unk_1306A == data->unk_13068) {
            s16 x = LCRandom() % 224 + 16;
            s16 y = LCRandom() % 64 + 16;
            UnkImageStruct_SetSpritePositionXY(data->monPics[14], x, y);
            ov63_0221C16C(data, 14, 0);
            data->unk_13068 = LCRandom() % 255 + 28;
            data->unk_1306A = 0;
        } else {
            ++data->unk_1306A;
        }
    }

    switch (data->subprocStage) {
    case 0:
        if (data->subprocCounter == 20) {
            data->subprocCounter = 0;
            ++data->subprocStage;
        } else {
            ++data->subprocCounter;
        }
        break;
    case 1:
        RegisterHallOfFame_MonSpritePosScaleAnimStep(data->monPics[data->curMonIndex], &ov63_0221FDB8[data->curMonIndex], 6, data->subprocCounter);
        if (data->subprocCounter == 6) {
            sub_0200DF98(data->monPics[data->curMonIndex], 1);
            ++data->curMonIndex;
            data->subprocCounter = 0;
            if (data->curMonIndex == 6) {
                data->curMonIndex = 0;
                ++data->subprocStage;
            }
        } else {
            ++data->subprocCounter;
        }
        break;
    case 2:
        if (data->subprocCounter == 32) {
            data->subprocCounter = 0;
            ++data->subprocStage;
        } else {
            ++data->subprocCounter;
        }
        break;
    case 3:
        data->unk_13064 = 40;
        data->unk_13060_3 = TRUE;
        data->unk_13060_2 = TRUE;
        data->unk_13060_5 = TRUE;
        data->unk_13060_6 = TRUE;
        UnkImageStruct_SetSpriteVisibleFlag(data->monPics[14], TRUE);
        ++data->subprocStage;
        break;
    case 4:
        ov63_0221E55C(data, 80, data->subprocCounter);
        for (int i = 0; i < data->numMons; ++i) {
            RegisterHallOfFame_MonSpritePosScaleAnimStep(data->monPics[6 + i], &(ov63_0221FDB8 + 6)[i], 80, data->subprocCounter);
        }
        RegisterHallOfFame_MonSpritePosScaleAnimStep(data->monPics[13], &ov63_0221FDB8[12], 80, data->subprocCounter);
        if (data->subprocCounter == 80) {
            data->subprocCounter = 0;
            ++data->subprocStage;
        } else {
            ++data->subprocCounter;
        }
        break;
    case 5:
        if (IsPaletteFadeFinished() == TRUE) {
            if ((gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B)) || System_GetTouchNew() == TRUE) {
                data->unk_13064 = 15;
                data->unk_13060_3 = TRUE;
                ++data->subprocStage;
            }
        }
        break;
    case 6:
        ov63_0221E55C(data, 60, data->subprocCounter);
        if (data->subprocCounter == 30) {
            if (IsPaletteFadeFinished() == TRUE) {
                data->unk_13064 = 15;
                data->unk_13060_4 = TRUE;
                ++data->subprocStage;
            }
        } else {
            ++data->subprocCounter;
        }
        // fallthrough
    case 7:
        for (int i = 0; i < data->numMons; ++i) {
            RegisterHallOfFame_MonSpritePosScaleAnimStep(data->monPics[i], &(ov63_0221FDB8 + 13)[i], 60, data->subprocCounter);
            RegisterHallOfFame_MonSpritePosScaleAnimStep(data->monPics[6 + i], &(ov63_0221FDB8 + 20)[i], 60, data->subprocCounter);
        }
        RegisterHallOfFame_MonSpritePosScaleAnimStep(data->monPics[12], &ov63_0221FDB8[19], 60, data->subprocCounter);
        RegisterHallOfFame_MonSpritePosScaleAnimStep(data->monPics[13], &ov63_0221FDB8[26], 60, data->subprocCounter);
        if (data->subprocStage == 7) {
            if (data->subprocCounter == 60) {
                if (IsPaletteFadeFinished() == TRUE) {
                    data->subprocCounter = 0;
                    data->subprocStage = 0;
                    return FALSE;
                }
            } else {
                ++data->subprocCounter;
            }
        }
        break;
    }

    return TRUE;
}

static void ov63_0221E8AC(RegisterHallOfFameData *data) {
    BeginNormalPaletteFade(3, 1, 1, RGB_WHITE, data->unk_13064, 1, HEAP_ID_REGISTER_HALL_OF_FAME);
}

static void ov63_0221E8D4(RegisterHallOfFameData *data) {
    BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, data->unk_13064, 1, HEAP_ID_REGISTER_HALL_OF_FAME);
}

static void VBlankTask_RegisterHallOfFame_WholePartyCongrats(SysTask *task, void *taskData) {
    RegisterHallOfFameData *data = (RegisterHallOfFameData *)taskData;
    if (data->subprocCallback != NULL && !data->subprocCallback(data)) {
        data->subprocCallback = NULL;
    }
    ov63_0221F1D0(data);
    DoScheduledBgGpuUpdates(data->bgConfig);
    sub_0200D020(data->spriteGfxHandler);
    thunk_OamManager_ApplyAndResetBuffers();
    OS_SetIrqCheckFlag(OS_IE_V_BLANK);
}

static void ov63_0221E940(RegisterHallOfFameData *data) {
    {
        GraphicsModes graphicsModes = ov63_0221FB00;
        SetBothScreensModesAndDisable(&graphicsModes);
    }

    {
        BgTemplate bgTemplate = ov63_0221FBE4;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_1, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_1);
        BG_ClearCharDataRange(GF_BG_LYR_MAIN_1, 0x20, 0, HEAP_ID_REGISTER_HALL_OF_FAME);
    }

    {
        BgTemplate bgTemplate = ov63_0221FC00;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_2, &bgTemplate, GF_BG_TYPE_TEXT);
    }

    {
        BgTemplate bgTemplate = ov63_0221FB90;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_3, &bgTemplate, GF_BG_TYPE_TEXT);
    }

    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_OFF);
}

static void ov63_0221E9FC(RegisterHallOfFameData *data) {
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_3);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_0);
}

static void ov63_0221EA24(RegisterHallOfFameData *data) {
    GfGfxLoader_LoadScrnDataFromOpenNarc(data->unk_00094, 5, data->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_REGISTER_HALL_OF_FAME);
    GfGfxLoader_LoadScrnDataFromOpenNarc(data->unk_00094, 6, data->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_REGISTER_HALL_OF_FAME);
    GfGfxLoader_LoadCharDataFromOpenNarc(data->unk_00094, 7, data->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_REGISTER_HALL_OF_FAME);
    GfGfxLoader_GXLoadPalFromOpenNarc(data->unk_00094, 8, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0, 0x20, HEAP_ID_REGISTER_HALL_OF_FAME);
    BG_SetMaskColor(GF_BG_LYR_MAIN_1, RGB_BLACK);
}

static void ov63_0221EAA8(RegisterHallOfFameData *data) {
    for (int i = 0; i < 2u; ++i) {
        AddWindow(data->bgConfig, &data->unk_00014[i], &ov63_0221FB20[i]);
    }

    FillWindowPixelBuffer(&data->unk_00014[0], 1);
    ReadMsgDataIntoString(data->msgData, msg_0180_00016, data->unk_0008C);
    AddTextPrinterParameterizedWithColor(&data->unk_00014[0], 0, data->unk_0008C, 128 - FontID_String_GetWidth(0, data->unk_0008C, 0) / 2, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 2, 0), NULL);
    CopyWindowToVram(&data->unk_00014[0]);

    FillWindowPixelBuffer(&data->unk_00014[1], 1);
    ReadMsgDataIntoString(data->msgData, msg_0180_00017, data->unk_00090);
    BufferPlayersName(data->msgFormat, 0, data->args->profile);
    BufferIntegerAsString(data->msgFormat, 1, PlayerProfile_GetTrainerID_VisibleHalf(data->args->profile), 5, PRINTING_MODE_LEADING_ZEROS, TRUE);
    BufferIntegerAsString(data->msgFormat, 2, GetIGTHours(data->args->igt), 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
    BufferIntegerAsString(data->msgFormat, 3, GetIGTMinutes(data->args->igt), 2, PRINTING_MODE_LEADING_ZEROS, TRUE);
    StringExpandPlaceholders(data->msgFormat, data->unk_0008C, data->unk_00090);
    AddTextPrinterParameterizedWithColor(&data->unk_00014[1], 0, data->unk_0008C, 128 - FontID_String_GetWidth(0, data->unk_0008C, 0) / 2, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 2, 0), NULL);
    CopyWindowToVram(&data->unk_00014[1]);
}

static void ov63_0221EC04(RegisterHallOfFameData *data) {
    for (int i = 0; i < 2u; ++i) {
        RemoveWindow(&data->unk_00014[i]);
    }
}

static void ov63_0221EC1C(RegisterHallOfFameData *data) {

    struct UnkStruct_02070D3C sp2C;
    UnkStruct_02014E30 sp1C = ov63_0221FAF0;
    NARC *narc = NARC_New(NARC_a_0_0_8, HEAP_ID_REGISTER_HALL_OF_FAME);
    u32 i;
    int tag;
    void *r4;

    SpriteRenderer_LoadCellResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 77, FALSE, 55512);
    SpriteRenderer_LoadAnimResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 78, FALSE, 55512);
    for (i = 0; i < 6; ++i) {
        tag = 55512 + i;
        SpriteRenderer_LoadCharResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 76, FALSE, NNS_G2D_VRAM_TYPE_2DMAIN, tag);
        SpriteRenderer_LoadPlttResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 75, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, tag);
    }
    SpriteRenderer_LoadCharResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 76, FALSE, NNS_G2D_VRAM_TYPE_2DMAIN, 55519);
    SpriteRenderer_LoadPlttResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 75, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 55520);
    SpriteRenderer_LoadPlttResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, narc, 75, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 55521);
    NARC_Delete(narc);

    SpriteRenderer_LoadCellResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, data->unk_00094, 17, TRUE, 55515);
    SpriteRenderer_LoadAnimResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, data->unk_00094, 18, TRUE, 55515);
    SpriteRenderer_LoadCharResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, data->unk_00094, 16, TRUE, NNS_G2D_VRAM_TYPE_2DMAIN, 55520);
    SpriteRenderer_LoadPlttResObjFromOpenNarc(data->spriteRenderer, data->spriteGfxHandler, data->unk_00094, 19, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 55522);

    for (i = 0; i < 6; ++i) {
        data->monPics[i] = SpriteRenderer_LoadResourcesAndCreateSprite(data->spriteRenderer, data->spriteGfxHandler, &(ov63_0221FF68 + 6)[i]);
        data->monPics[6 + i] = SpriteRenderer_LoadResourcesAndCreateSprite(data->spriteRenderer, data->spriteGfxHandler, &(ov63_0221FF68 + 6)[i + 6]);
        if (i < data->numMons) {
            ov63_0221C8E8(data, &data->mons[i], 2, i);
        } else {
            UnkImageStruct_SetSpriteVisibleFlag(data->monPics[i], FALSE);
        }
        ov63_0221C99C(data, i, i);
        ov63_0221C954(data, i, 1);
        sub_0200DF98(data->monPics[i], 1);
        sub_0200E024(data->monPics[i], 1.0f, 1.0f);
        sub_0200E0FC(data->monPics[i], GX_OAM_MODE_NORMAL);
        sub_0200E0FC(data->monPics[6 + i], GX_OAM_MODE_XLU);
        UnkImageStruct_SetSpriteVisibleFlag(data->monPics[6 + i], FALSE);
    }
    data->monPics[12] = SpriteRenderer_LoadResourcesAndCreateSprite(data->spriteRenderer, data->spriteGfxHandler, &ov63_0221FF68[18]);
    data->monPics[13] = SpriteRenderer_LoadResourcesAndCreateSprite(data->spriteRenderer, data->spriteGfxHandler, &ov63_0221FF68[19]);
    sub_0200DF98(data->monPics[12], 1);
    sub_0200DF98(data->monPics[13], 1);
    UnkImageStruct_SetSpriteVisibleFlag(data->monPics[12], FALSE);
    UnkImageStruct_SetSpriteVisibleFlag(data->monPics[13], FALSE);

    if (PlayerProfile_GetTrainerGender(data->args->profile) == TRAINER_FEMALE) {
        sub_02070D84(TRAINERCLASS_PKMN_TRAINER_LYRA, 2, &sp2C);
    } else {
        sub_02070D84(TRAINERCLASS_PKMN_TRAINER_ETHAN, 2, &sp2C);
    }
    r4 = AllocFromHeap(HEAP_ID_REGISTER_HALL_OF_FAME, 0x1900);
    sub_020143E0(sp2C.narcId, sp2C.ncbr_id, HEAP_ID_REGISTER_HALL_OF_FAME, &sp1C, r4);
    ov63_0221C00C(r4, NNS_G2dGetImageLocation(sub_02024B1C(data->monPics[12]->sprite), NNS_G2D_VRAM_TYPE_2DMAIN), 3200);
    FreeToHeap(r4);

    GfGfxLoader_GXLoadPal(sp2C.narcId, sp2C.nclr_id, GF_PAL_LOCATION_MAIN_OBJ, (enum GFPalSlotOffset)NNS_G2dGetImagePaletteLocation(sub_02024B34(data->monPics[12]->sprite), NNS_G2D_VRAM_TYPE_2DMAIN), 0x20, HEAP_ID_REGISTER_HALL_OF_FAME);

    data->monPics[14] = SpriteRenderer_LoadResourcesAndCreateSprite(data->spriteRenderer, data->spriteGfxHandler, &ov63_0221FF68[20]);
    UnkImageStruct_SetSpriteVisibleFlag(data->monPics[14], FALSE);
    ov63_0221C954(data, 13, 0);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
}

static void ov63_0221EFD8(RegisterHallOfFameData *data) {
    u32 i;
    int tag;

    for (i = 0; i < 15; ++i) {
        ov63_0221C134(data, i);
    }
    SpriteGfxHandler_UnloadPlttObjById(data->spriteGfxHandler, 55522);
    SpriteGfxHandler_UnloadCharObjById(data->spriteGfxHandler, 55520);
    SpriteGfxHandler_UnloadCellObjById(data->spriteGfxHandler, 55515);
    SpriteGfxHandler_UnloadAnimObjById(data->spriteGfxHandler, 55515);
    SpriteGfxHandler_UnloadPlttObjById(data->spriteGfxHandler, 55520);
    SpriteGfxHandler_UnloadCharObjById(data->spriteGfxHandler, 55519);
    for (i = 0; i < 6; ++i) {
        tag = 55512 + i;
        SpriteGfxHandler_UnloadPlttObjById(data->spriteGfxHandler, tag);
        SpriteGfxHandler_UnloadCharObjById(data->spriteGfxHandler, tag);
    }
    SpriteGfxHandler_UnloadCellObjById(data->spriteGfxHandler, 55514);
    SpriteGfxHandler_UnloadAnimObjById(data->spriteGfxHandler, 55514);
}

static void ov63_0221F088(RegisterHallOfFameData *data) {
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
    ov63_0221F130(data);
}

static void ov63_0221F130(RegisterHallOfFameData *data) {
    data->unk_000E0 = Camera_New(HEAP_ID_REGISTER_HALL_OF_FAME);
    SetVec(data->unk_000E4, 0, 0, 0);
    SetVec(data->unk_000F0, 0, 0, 0);
    Camera_Init_FromTargetDistanceAndAngle(&data->unk_000E4, FX32_CONST(5), &data->unk_000F0, 0xFA4, 0, TRUE, data->unk_000E0);
    VecFx32 spC;
    SetVec(spC, 0, FX32_ONE, 0);
    Camera_SetLookAtCamUp(&spC, data->unk_000E0);
    Camera_SetStaticPtr(data->unk_000E0);
    Camera_SetPerspectiveClippingPlane(FX32_ONE, FX32_CONST(500), data->unk_000E0);
}

static void ov63_0221F1C4(RegisterHallOfFameData *data) {
    Camera_Delete(data->unk_000E0);
}

static void ov63_0221F1D0(RegisterHallOfFameData *data) {
    if (!G3X_IsGeometryBusy()) {
        G3X_Reset();
        NNS_G3dGePushMtx();
        ov63_0221F580(data->spotlightsTask);
        NNS_G3dGePopMtx(1);
        NNS_G3dGePushMtx();
        ov63_0221FAA0(data->confettiTask);
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
    return SysTask_CreateOnVBlankQueue(ov63_0221F294, spotlight, 1);
}

static void ov63_0221F294(SysTask *task, void *taskData) {
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
    child->unk_804 = 0;
    child->angle = angle;
    child->speed = 2 * sSpotlightSpeeds[index];  // UB warning: can index past end of array
    child->unk_814 = index;
    SetVec(child->vertices[0], xOffset - 80, FX16_CONST(-1), 0);
    SetVec(child->vertices[1], xOffset + 80, FX16_CONST(-1), 0);
    return SysTask_CreateOnVBlankQueue(ov63_0221F3F4, child, 2);
}

static void ov63_0221F3F4(SysTask *task, void *taskData) {
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

        G3B_PolygonAttr(&child->parent->gxDlInfo, GX_LIGHTID_0, GX_POLYGONMODE_MODULATE, GX_CULL_BACK, child->unk_814, 0x10, 0);
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

static void ov63_0221F580(SysTask *task) {
    if (task != NULL) {
        RegisterHofSpotlightTaskData *spotlight = (RegisterHofSpotlightTaskData *)SysTask_GetData(task);

        G3_PushMtx();
        MI_SendGXCommand(3, spotlight->gxCommand, spotlight->gxCommandLength);
        G3_PopMtx(1);
    }
}

static void ov63_0221F5B4(SysTask *task) {
    sSpotlightsActive = FALSE;
    if (task != NULL) {
        RegisterHofSpotlightTaskData *spotlight = (RegisterHofSpotlightTaskData *)SysTask_GetData(task);

        for (int i = 0; i < spotlight->numSpotlights; ++i) {
            FreeToHeap(SysTask_GetData(spotlight->childTasks[i]));
        }
        FreeToHeap(spotlight);
    }
}

static BOOL ov63_0221F600(RegisterHallOfFameData *data) {
    return sNumSpotlightTasks == 0;
}

static SysTask *ov63_0221F614(RegisterHallOfFameData *data) {
    RegisterHofConfettiEmitterTaskData *confetti = AllocFromHeap(HEAP_ID_REGISTER_HALL_OF_FAME, sizeof(RegisterHofConfettiEmitterTaskData));
    int i;
    int j;
    u32 rand;
    u32 sp1C;

    rand = LCRandom();
    SetLCRNGSeed(13716);

    for (i = 0, sp1C = 0; i < 48; ++i) {
        confetti->particles[i].unk_00 = ov63_0221FD38[sp1C];
        ++sp1C;
        if (sp1C >= 8) {
            sp1C = 0;
        }
        fx16 sp8 = (LCRandom() % FX32_CONST(2)) - FX32_ONE;
        fx16 sp4 = (LCRandom() % FX32_CONST(2)) + FX32_ONE;
        fx16 sp0 = (LCRandom() % FX32_CONST(0.16015625)) - FX32_CONST(0.080078125);

        for (j = 0; j < 4; ++j) {
            SetVec(confetti->particles[i].unk_08[j], sp8 + ov63_0221FB44[j].x, sp4 + ov63_0221FB44[j].y, sp0 + ov63_0221FB44[j].z);
            SetVec(confetti->particles[i].unk_20, 0, 0, 0);
            SetVec(confetti->particles[i].unk_26, (LCRandom() % FX32_CONST(0.125)) + FX32_CONST(0.125), (LCRandom() % FX32_CONST(0.125)) + FX32_CONST(0.125), (LCRandom() % FX32_CONST(0.125)) + FX32_CONST(0.125));
            MTX_Identity44(&confetti->particles[i].unk_2C);
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
    return SysTask_CreateOnMainQueue(ov63_0221F7EC, confetti, 0);
}

 void ov63_0221F7C4(SysTask *task) {
    if (task != NULL) {
        FreeToHeap(SysTask_GetData(task));
        SysTask_Destroy(task);
    }
 }

 void ov63_0221F7DC(SysTask *task) {
    if (task != NULL) {
        RegisterHofConfettiEmitterTaskData *confetti = (RegisterHofConfettiEmitterTaskData *)SysTask_GetData(task);

        confetti->active = TRUE;
    }
 }

 void ov63_0221F7EC(SysTask *task, void *taskData) {
    MtxFx44 sp28;
    VecFx16 sp20;

    RegisterHofConfettiEmitterTaskData *confetti = (RegisterHofConfettiEmitterTaskData *)taskData;

    if (confetti->active) {
        G3_BeginMakeDL(&confetti->gxDlInfo, confetti->gxCommand, sizeof(confetti->gxCommand));
        G3B_PolygonAttr(&confetti->gxDlInfo, GX_LIGHTID_3, GX_POLYGONMODE_MODULATE, GX_CULL_NONE, 0x3F, 0x1F, 0);
        G3B_MaterialColorDiffAmb(&confetti->gxDlInfo, RGB(20, 20, 20), RGB_BLACK, FALSE);

        for (int i = 0; i < 48; ++i) {
            // sp1C: i
            // sp18: sub->unk_20
            // sp14: sub->unk_26
            // sp10: sub->unk_20
            // spC:  sub->unk_2C
            confetti->particles[i].unk_08[3].y -= 85;
            if (confetti->particles[i].unk_08[3].y <= -FX16_ONE) {
                confetti->particles[i].unk_08[3].y = confetti->particles[i].unk_08[3].y + 2 *FX16_ONE;
            }
            confetti->particles[i].unk_08[0].y = confetti->particles[i].unk_08[3].y - FX16_CONST(0.1);
            confetti->particles[i].unk_08[1].y = confetti->particles[i].unk_08[0].y;
            confetti->particles[i].unk_08[2].y = confetti->particles[i].unk_08[3].y;
            VEC_Fx16Add(&confetti->particles[i].unk_20, &confetti->particles[i].unk_26, &confetti->particles[i].unk_20);
            MTX_Identity44(&confetti->particles[i].unk_2C);
            MTX_TransApply44(&confetti->particles[i].unk_2C, &confetti->particles[i].unk_2C, confetti->particles[i].unk_08[0].x, confetti->particles[i].unk_08[0].y, confetti->particles[i].unk_08[0].z);
            G3B_LightColor(&confetti->gxDlInfo, GX_LIGHTID_0, RGB(11, 11, 11));
            G3B_LightColor(&confetti->gxDlInfo, GX_LIGHTID_1, confetti->particles[i].unk_00);

            SetVec(sp20, 0, FX16_ONE - 1, -FX16_ONE + 1);
            VEC_Fx16Normalize(&sp20, &sp20);
            G3B_LightVector(&confetti->gxDlInfo, GX_LIGHTID_0, sp20.x, sp20.y, sp20.z);

            SetVec(sp20, 0, -FX16_ONE + 1, FX16_ONE - 1);
            VEC_Fx16Normalize(&sp20, &sp20);
            G3B_LightVector(&confetti->gxDlInfo, GX_LIGHTID_1, sp20.x, sp20.y, sp20.z);

            MTX_RotX44(&sp28, FX_SinIdx((u16)confetti->particles[i].unk_20.x), FX_CosIdx((u16)confetti->particles[i].unk_20.x));
            MTX_Concat44(&sp28, &confetti->particles[i].unk_2C, &confetti->particles[i].unk_2C);

            MTX_RotY44(&sp28, FX_SinIdx((u16)confetti->particles[i].unk_20.y), FX_CosIdx((u16)confetti->particles[i].unk_20.y));
            MTX_Concat44(&sp28, &confetti->particles[i].unk_2C, &confetti->particles[i].unk_2C);

            MTX_RotZ44(&sp28, FX_SinIdx((u16)confetti->particles[i].unk_20.z), FX_CosIdx((u16)confetti->particles[i].unk_20.z));
            MTX_Concat44(&sp28, &confetti->particles[i].unk_2C, &confetti->particles[i].unk_2C);

            G3B_MaterialColorSpecEmi(&confetti->gxDlInfo, RGB_WHITE, confetti->particles[i].unk_00, FALSE);
            G3B_PushMtx(&confetti->gxDlInfo);
            G3B_LoadMtx44(&confetti->gxDlInfo, &confetti->particles[i].unk_2C);
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

 void ov63_0221FAA0(SysTask *task) {
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
