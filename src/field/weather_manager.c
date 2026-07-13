#include "field/weather_manager.h"

#include "constants/weather.h"

#include "field_system.h"
#include "gf_gfx_loader.h"
#include "gf_gfx_planes.h"
#include "heap.h"
#include "math_util.h"
#include "overlay_01_02203E40.h"
#include "unk_02005D10.h"
#include "unk_0200ACF0.h"
#include "unk_0200B150.h"
#include "unk_0200FA24.h"
#include "unk_02020B8C.h"
#include "unk_02025C44.h"

static void WeatherTask_ChangeWeather(SysTask *task, void *data);
static void ov01_021EB3F0(SysTask *task, void *data);
static BOOL ov01_021EB4B4(u32 weather, u32 nextWeather);
static void WeatherDraw_Init(WeatherDraw *weatherDraw);
static void WeatherDrawTask_RendAndAnimateSprites(SysTask *task, void *data);
static void Weather_Init2DGfxRes(GF_2DGfxResHeader *headerList, u32 a1, u32 a2);
static void WeatherDraw_Delete(WeatherDraw *weatherDraw);
static void WeatherDraw_SetSpriteMatrix(Sprite *sprite, VecFx32 *matrix);
static WeatherSystem *WeatherSystem_New(FieldSystem *fieldSystem);
static void WeatherSystem_Delete(WeatherSystem **pWeatherSystem);
static BOOL WeatherSystem_Process(WeatherSystem *weatherSystem, int state, int weather);
static u16 ov01_021EB804(WeatherSystem *weatherSystem, int weather);
static void ov01_021EB818(u32 arg0, u32 arg1);
static void ov01_021EB830(UnkWeatherStruct_021EB830 *arg0, s32 arg1, s32 arg2, s32 arg3);
static BOOL ov01_021EB840(UnkWeatherStruct_021EB830 *a0);
static void ov01_021EB86C(WeatherSystem *weatherSystem, s32 arg1, WeatherSpriteResources *arg2);
static SpriteResource *Weather_AddResObjFromOpenNarc(GF_2DGfxResHeader *headerList, s32 resourceType, s32 headerIndex, GF_2DGfxResMan *resMan, NARC *narc, BOOL atEnd);
static void ov01_021EB968(WeatherSystem *weatherSystem, s32 a1, WeatherSpriteResources *a2);
static BOOL WeatherSystem_Init(WeatherSystem *weatherSystem, int weather);
static BOOL ov01_021EBA08(WeatherSystem *weatherSystem, int weather);
static BOOL WeatherSystem_Start(WeatherSystem *weatherSystem, int weather, u32 a2, u32 a3);
static void ov01_021EBB40(WeatherSystem *weatherSystem, int weather, u16 a2);
static void ov01_021EBB68(WeatherSystem *weatherSystem, int weather);
static void ov01_021EBB90(WeatherSystem *weatherSystem, u32 weather);
static void ov01_021EBCA4(WeatherSystem_Sub0 *a0);
static void ov01_021EBD18(WeatherSystem *weatherSystem, u16 a1);
static BOOL ov01_021EBD34(WeatherSystem *weatherSystem, WeatherSystem_Sub0 *a1);
static void ov01_021EBD70(SysTask *task, void *data);
static BOOL ov01_021EBE4C(WeatherSystem *weatherSystem, WeatherSystem_Sub0 *a1);
static BOOL ov01_021EBEB8(WeatherSystem_Sub0 *a0);
static void ov01_021EBEF0(WeatherSystem *weatherSystem, u32 headerIndex, WeatherSpriteResources *a2);
static void ov01_021EBF24(WeatherSystem *weatherSystem, u32 headerIndex, WeatherSpriteResources *a2);
static void ov01_021EBF58(WeatherSystem *weatherSystem, u32 headerIndex, WeatherSpriteResources *a2);
static void ov01_021EBF94(WeatherSystem *weatherSystem, u32 headerIndex, WeatherSpriteResources *a2);
static void ov01_021EBFD0(WeatherSystem *weatherSystem, WeatherSystem_Sub0 *a1);
static void ov01_021EC028(WeatherSystem_Sub0_Sub8 *a0);
static void ov01_021EC058(WeatherSystem_Sub0_Sub8 *a0);
static void ov01_021EC078(WeatherSystem *weatherSystem, u16 a1);
static void ov01_021EC0C0(WeatherSystem *weatherSystem, u16 a1);
static void ov01_021EC114(WeatherSystem *weatherSystem, u16 a1);
static void ov01_021EC1BC(WeatherObject *a0, int a1);
static void ov01_021EC1E4(WeatherObject *a0);
static void *ov01_021EC1F4(WeatherSystem_Sub0_Sub8 *a0, int a1);
static void ov01_021EC240(SpriteResourcesHeader *header, WeatherSystem *weatherSystem, WeatherSpriteResources *a2, u32 a3, u32 a4);
static void WeatherObject_Delete(WeatherObject *a0);
static void WeatherObject_DeleteAll(WeatherObject *a0);
static void ov01_021EC2E4(WeatherObject *a0, UnkLinkedListFunc func);
static void ov01_021EC300(void *data);
static VecFx32 ov01_021EC304(WeatherObject *a0);
static void ov01_021EC31C(fx32 *x, fx32 *z, WeatherSystem_Sub0_Sub8 *a0);
static void ov01_021EC470(WeatherSystem_Sub0_Sub8 *a0, int *xOut, int *zOut);
static void ov01_021EC4A8(WeatherSystem_Sub0_Sub8 *a0, fx32 *x, fx32 *y);
static void ov01_021EC504(UnkStruct_021EC504 *arg0, WeatherSystem_Sub0_Sub8 *arg1, s16 arg2, s16 arg3, s32 arg4, s32 arg5, s32 arg6, s32 arg7, s32 arg8, UnkWeatherSystemSub0Sub8Func arg9);
static void ov01_021EC52C(UnkStruct_021EC504 *arg0, s16 arg1, s16 arg2, s16 arg3, s32 arg4);
static s32 ov01_021EC538(UnkStruct_021EC504 *arg0);
static void ov01_021EC5FC(WeatherFogChange *arg0, UnkStruct_021EC774 *arg1, FogData *fog, GXFogSlope fogSlope, s32 fogOffset, GXRgb rgb, s32 arg6, s32 arg7);
static BOOL ov01_021EC650(WeatherFogChange *arg0, UnkStruct_021EC774 *arg1, s32 arg2);
static void ov01_021EC678(FogData *fog, GXFogSlope fogSlope, s32 fogOffset, GXRgb rgb);
static void ov01_021EC6A4(WeatherFogChange *fogChange, FogData *fog, s32 arg2, s32 arg3, GXRgb rgb, s32 arg5);
static BOOL ov01_021EC728(WeatherFogChange *arg0);
static void ov01_021EC774(UnkStruct_021EC774 *a0);
static void ov01_021EC790(UnkStruct_021EC774 *arg0, s32 arg1, s32 arg2);
static s32 ov01_021EC7AC(UnkStruct_021EC774 *arg0);
static void ov01_021EC7C8(UnkStruct_021EC774 *arg0);
static s32 ov01_021EC7E8(UnkStruct_021EC774 *arg0);
static void ov01_021EC828(UnkStruct_021EC774 *arg0);
static void ov01_021EC85C(WeatherSystem_Sub0_Sub8 *a0, UnkWeatherSystemSub0Sub8Func a1, int a2, int a3, int a4, UnkLinkedListFunc a5);
static WeatherObject *ov01_021EC8D8(WeatherSystem_Sub0_Sub8 *a0);
static void ov01_021EC8F8(SysTask *task, void *data);
static void ov01_021EC94C(SysTask *task, void *data);
static void ov01_021ECBB4(WeatherSystem_Sub0_Sub8 *a0, int arg1);
static void ov01_021ECC70(WeatherObject *a0);
static void ov01_021ECD08(SysTask *task, void *data);
static void ov01_021ECF4C(WeatherSystem_Sub0_Sub8 *a0, int a1);
static void ov01_021ED070(WeatherObject *a0);
static void ov01_021ED0F0(SysTask *task, void *data);
static void ov01_021ED31C(WeatherSystem_Sub0_Sub8 *a0, int a1);
static void ov01_021ED44C(WeatherObject *a0);
static void ov01_021ED474(WeatherSystem_Sub0_Sub8 *a0, UnkStruct_021ED474 *a1, GXFogSlope fogSlope, s32 arg3, GXRgb arg4, s32 arg5, s32 arg6);
static void ov01_021ED584(SysTask *task, void *data);
static void ov01_021ED710(SysTask *task, void *data);
static void ov01_021ED924(SysTask *task, void *data);
static void ov01_021EDA50(SysTask *task, void *data);
static void ov01_021EDA7C(SysTask *task, void *data);
static void ov01_021EDAB4(WeatherSystem_Sub0_Sub8 *a0, u32 sndSeq);
static void ov01_021EDAE0(WeatherSystem_Sub0_Sub8 *arg0);

struct WeatherSystem_Sub0_Sub8 {
    WeatherSystem *weatherSystem;
    WeatherSystem_Sub0 *unk4;
    WeatherSpriteResources *unk8;
    WeatherObject linkedListDummy;
    WeatherObject linkedList[64];
    SysTask *unkF48;
    VecFx32 cameraTarget;
    void *unkF58;
    u32 unkF5C;
    u16 sndSeq;
    u16 unkF62;
    u16 unkF64;
    u16 unkF66;
    s32 unkF68;
    SysTask *unkF6C;
};

struct WeatherSystem_Sub0 {
    u16 unk0;
    u16 unk2;
    int unk4;
    WeatherSystem_Sub0_Sub8 *unk8;
    WeatherSpriteResources *weatherSpriteResources;
    u16 unk10;
    u16 unk12;
    SysTask *task;
    SysTaskFunc unk18;
};

struct WeatherSystem {
    WeatherSystem_Sub0 *unk0;
    const WeatherGfxNarcData *unk4;
    WeatherDraw weatherDraw;
    FieldSystem *fieldSystem;
    NARC *narc;
};

void ov01_021EB1E8(UnkStruct_ov01_021EB1E8 *a0) {
    a0->unk188 = 1;
}

/**
 * @brief Creates the weather manager and initializes with default values
 *
 * @param fieldSystem
 *
 * @return WeatherManager *
 */
WeatherManager *WeatherManager_New(FieldSystem *fieldSystem) {
    WeatherManager *weatherManager = Heap_Alloc(HEAP_ID_FIELD1, sizeof(WeatherManager));

    memset(weatherManager, 0, sizeof(WeatherManager));

    weatherManager->weatherSystem = WeatherSystem_New(fieldSystem);
    weatherManager->weather = WEATHER_SUNNY;
    weatherManager->nextWeather = WEATHER_SUNNY;
    weatherManager->state = 6;
    weatherManager->task = NULL;
    weatherManager->unk10 = WEATHER_MAX;

    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);

    return weatherManager;
}

/**
 * @brief Deletes and frees the weather manager and embedded structs
 *
 * @param weatherManager
 */
void WeatherManager_Delete(WeatherManager *weatherManager) {
    if (weatherManager->task) {
        SysTask_Destroy(weatherManager->task);
    }

    WeatherSystem_Delete(&weatherManager->weatherSystem);

    memset(weatherManager, 0, sizeof(WeatherManager));

    Heap_Free(weatherManager);
}

void WeatherManager_SetWeather(WeatherManager *weatherManager, int weather) {
    GF_ASSERT(weatherManager->state == 6);
    GF_ASSERT(weather < WEATHER_MAX);

    if (weatherManager->weather != weather) {
        GF_ASSERT(WeatherSystem_Process(weatherManager->weatherSystem, 8, weatherManager->weather));
        GF_ASSERT(WeatherSystem_Process(weatherManager->weatherSystem, 0, weather));
        GF_ASSERT(WeatherSystem_Process(weatherManager->weatherSystem, 3, weather));
        weatherManager->weather = weather;
    }
}

BOOL WeatherManager_ChangeWeather(WeatherManager *weatherManager, s32 weather) {
    GF_ASSERT(weather < WEATHER_MAX);

    if (weatherManager->state != 6) {
        weatherManager->unk10 = weather;
        return TRUE;
    }

    if (weatherManager->weather == weather) {
        return TRUE;
    }

    GF_ASSERT(weatherManager->task == NULL);

    weatherManager->nextWeather = weather;
    if (ov01_021EB4B4(weatherManager->weather, weatherManager->nextWeather) == 0) {
        weatherManager->state = 0;
        weatherManager->task = SysTask_CreateOnMainQueue(WeatherTask_ChangeWeather, weatherManager, 0);
    } else {
        weatherManager->state = 0;
        weatherManager->task = SysTask_CreateOnMainQueue(ov01_021EB3F0, weatherManager, 0);
    }

    return TRUE;
}

u32 WeatherManager_GetWeather(WeatherManager *weatherManager) {
    return weatherManager->weather;
}

static void WeatherTask_ChangeWeather(SysTask *task, void *data) {
    WeatherManager *weatherManager = data;
    switch (weatherManager->state) {
    case 0:
        GF_ASSERT(WeatherSystem_Process(weatherManager->weatherSystem, 5, weatherManager->weather));
        weatherManager->state++;
        break;
    case 1:
        if (ov01_021EB804(weatherManager->weatherSystem, weatherManager->weather) != 3) {
            GF_ASSERT(WeatherSystem_Process(weatherManager->weatherSystem, 8, weatherManager->weather));
            weatherManager->state++;
        }
        break;
    case 2:
        GF_ASSERT(WeatherSystem_Process(weatherManager->weatherSystem, 1, weatherManager->nextWeather));
        weatherManager->state++;
        break;
    case 3:
        if (ov01_021EB804(weatherManager->weatherSystem, weatherManager->nextWeather) != 1) {
            weatherManager->state++;
        }
        break;
    case 4:
        GF_ASSERT(WeatherSystem_Process(weatherManager->weatherSystem, 2, weatherManager->nextWeather));
        weatherManager->state++;
        weatherManager->weather = weatherManager->nextWeather;
        weatherManager->nextWeather = 0;
        break;
    case 5:
        weatherManager->state = 6;
        weatherManager->task = NULL;
        SysTask_Destroy(task);
        if (weatherManager->unk10 != 14) {
            WeatherManager_ChangeWeather(weatherManager, weatherManager->unk10);
            weatherManager->unk10 = 14;
        }
        break;
    }
}

static void ov01_021EB3F0(SysTask *task, void *data) {
    WeatherManager *weatherManager = data;
    switch (weatherManager->state) {
    case 0:
        GF_ASSERT(WeatherSystem_Process(weatherManager->weatherSystem, 1, weatherManager->nextWeather));
        weatherManager->state++;
        break;
    case 1:
        if (ov01_021EB804(weatherManager->weatherSystem, weatherManager->nextWeather) != 1) {
            weatherManager->state++;
        }
        break;
    case 2:
        GF_ASSERT(WeatherSystem_Process(weatherManager->weatherSystem, 7, weatherManager->weather));
        GF_ASSERT(WeatherSystem_Process(weatherManager->weatherSystem, 4, weatherManager->nextWeather));
        weatherManager->state++;
        break;
    case 3:
        if (ov01_021EB804(weatherManager->weatherSystem, weatherManager->weather) != 3) {
            GF_ASSERT(WeatherSystem_Process(weatherManager->weatherSystem, 8, weatherManager->weather));
            weatherManager->state++;
        }
        break;
    case 4:
        weatherManager->weather = weatherManager->nextWeather;
        weatherManager->nextWeather = 0;
        weatherManager->state = 6;
        weatherManager->task = NULL;
        SysTask_Destroy(task);
        if (weatherManager->unk10 != 14) {
            WeatherManager_ChangeWeather(weatherManager, weatherManager->unk10);
            weatherManager->unk10 = 14;
        }
        break;
    }
}

static BOOL ov01_021EB4B4(u32 weather, u32 nextWeather) {
    return FALSE;
}

static void WeatherDraw_Init(WeatherDraw *weatherDraw) {
    GF_InitG2dRenderer(&weatherDraw->instance, 0xFFFFF000);

    NNSG2dViewRect rect;
    rect.posTopLeft.x = 0;
    rect.posTopLeft.y = 0;
    rect.sizeView.x = 0xFF000;
    rect.sizeView.y = 0xC0000;

    sub_0200B27C(&weatherDraw->surface, &rect, NNS_G2D_VRAM_TYPE_2DMAIN, &weatherDraw->instance);

    for (int i = 0; i < 4; i++) {
        weatherDraw->resMan[i] = Create2DGfxResObjMan(14, (GfGfxResType)i, HEAP_ID_FIELD1);
    }

    weatherDraw->header = Heap_Alloc(HEAP_ID_FIELD1, 4 * GF2DGfxResHeader_sizeof());

    Weather_Init2DGfxRes(weatherDraw->header, 0, 0x39);
    Weather_Init2DGfxRes(weatherDraw->header, 1, 0x3A);
    Weather_Init2DGfxRes(weatherDraw->header, 2, 0x37);
    Weather_Init2DGfxRes(weatherDraw->header, 3, 0x38);

    SpriteListParam param;
    param.num = 0x40;
    param.rendererInstance = &weatherDraw->instance;
    param.heapID = HEAP_ID_FIELD1;

    weatherDraw->spriteList = SpriteList_Create(&param);

    weatherDraw->task = SysTask_CreateOnMainQueue(WeatherDrawTask_RendAndAnimateSprites, weatherDraw, 10);
}

static void WeatherDrawTask_RendAndAnimateSprites(SysTask *task, void *data) {
    WeatherDraw *weatherDraw = data;
    SpriteList_RenderAndAnimateSprites(weatherDraw->spriteList);
}

static void Weather_Init2DGfxRes(GF_2DGfxResHeader *headerList, u32 a1, u32 a2) {
    GF_2DGfxResHeader *header = GF2DGfxResHeader_GetByIndex(headerList, a1);
    GF_2DGfxResHeaderNarcList *headerNarcList = GfGfxLoader_LoadFromNarc(NARC_a_0_6_3, a2, 0, HEAP_ID_FIELD1, 1);
    GF2DGfxResHeader_Init(headerNarcList, header, HEAP_ID_FIELD1);
    Heap_Free(headerNarcList);
}

static void WeatherDraw_Delete(WeatherDraw *weatherDraw) {
    for (int i = 0; i < 4; i++) {
        GF2DGfxResHeader_Reset(GF2DGfxResHeader_GetByIndex(weatherDraw->header, i));
        Destroy2DGfxResObjMan(weatherDraw->resMan[i]);
    }

    Heap_Free(weatherDraw->header);
    weatherDraw->header = NULL;

    SpriteList_Delete(weatherDraw->spriteList);
    weatherDraw->spriteList = NULL;

    SysTask_Destroy(weatherDraw->task);
    weatherDraw->task = NULL;
}

static void WeatherDraw_SetSpriteMatrix(Sprite *sprite, VecFx32 *matrix) {
    if (matrix->x > 0x13F000) {
        matrix->x %= 0x13F000;
    } else if (matrix->x < (int)0xFFFC0000) {
        matrix->x += 0x13F000;
    }

    if (matrix->y > 0x100000) {
        matrix->y %= 0x100000;
    } else if (matrix->y < (int)0xFFFC0000) {
        matrix->y += 0x100000;
    }

    Sprite_SetMatrix(sprite, matrix);
}

// clang-format off
static WeatherSystem_Sub0 ov01_022098B0[] = {
    {
        .unk0 = 0xFFFF,
        .unk2 = 0xFFFF,
        .unk4 = 4,
        .unk8 = NULL,
        .weatherSpriteResources = NULL,
        .unk10 = 0,
        .unk12 = 0,
        .task = NULL,
        .unk18 = ov01_021EC8F8,
    },
    {
        .unk0 = 0,
        .unk2 = 0xFFFF,
        .unk4 = 0xDC,
        .unk8 = NULL,
        .weatherSpriteResources = NULL,
        .unk10 = 0,
        .unk12 = 0,
        .task = NULL,
        .unk18 = ov01_021EC94C,
    },
    {
        .unk0 = 0,
        .unk2 = 0xFFFF,
        .unk4 = 0xDC,
        .unk8 = NULL,
        .weatherSpriteResources = NULL,
        .unk10 = 0,
        .unk12 = 0,
        .task = NULL,
        .unk18 = ov01_021EC94C,
    },
    {
        .unk0 = 0,
        .unk2 = 0xFFFF,
        .unk4 = 0xDC,
        .unk8 = NULL,
        .weatherSpriteResources = NULL,
        .unk10 = 0,
        .unk12 = 0,
        .task = NULL,
        .unk18 = ov01_021EC94C,
    },
    {
        .unk0 = 1,
        .unk2 = 0xFFFF,
        .unk4 = 0xDC,
        .unk8 = NULL,
        .weatherSpriteResources = NULL,
        .unk10 = 0,
        .unk12 = 0,
        .task = NULL,
        .unk18 = ov01_021ECD08,
    },
    {
        .unk0 = 1,
        .unk2 = 0xFFFF,
        .unk4 = 0xDC,
        .unk8 = NULL,
        .weatherSpriteResources = NULL,
        .unk10 = 0,
        .unk12 = 0,
        .task = NULL,
        .unk18 = ov01_021ECD08,
    },
    {
        .unk0 = 1,
        .unk2 = 0xFFFF,
        .unk4 = 0xDC,
        .unk8 = NULL,
        .weatherSpriteResources = NULL,
        .unk10 = 0,
        .unk12 = 0,
        .task = NULL,
        .unk18 = ov01_021ECD08,
    },
    {
        .unk0 = 0xFFFF,
        .unk2 = 0xFFFF,
        .unk4 = 4,
        .unk8 = NULL,
        .weatherSpriteResources = NULL,
        .unk10 = 0,
        .unk12 = 0,
        .task = NULL,
        .unk18 = ov01_021EC8F8,
    },
    {
        .unk0 = 4,
        .unk2 = 0xFFFF,
        .unk4 = 0xDC,
        .unk8 = NULL,
        .weatherSpriteResources = NULL,
        .unk10 = 0,
        .unk12 = 0,
        .task = NULL,
        .unk18 = ov01_021ED0F0,
    },
    {
        .unk0 = 0xFFFF,
        .unk2 = 6,
        .unk4 = 0xAC,
        .unk8 = NULL,
        .weatherSpriteResources = NULL,
        .unk10 = 0,
        .unk12 = 0,
        .task = NULL,
        .unk18 = ov01_021ED584,
    },
    {
        .unk0 = 0xFFFF,
        .unk2 = 6,
        .unk4 = 0xAC,
        .unk8 = NULL,
        .weatherSpriteResources = NULL,
        .unk10 = 0,
        .unk12 = 0,
        .task = NULL,
        .unk18 = ov01_021ED584,
    },
    {
        .unk0 = 0xFFFF,
        .unk2 = 0xFFFF,
        .unk4 = 0x634,
        .unk8 = NULL,
        .weatherSpriteResources = NULL,
        .unk10 = 0,
        .unk12 = 0,
        .task = NULL,
        .unk18 = ov01_021ED710,
    },
    {
        .unk0 = 0xFFFF,
        .unk2 = 0xFFFF,
        .unk4 = 0x634,
        .unk8 = NULL,
        .weatherSpriteResources = NULL,
        .unk10 = 0,
        .unk12 = 0,
        .task = NULL,
        .unk18 = ov01_021ED924,
    },
    {
        .unk0 = 0xFFFF,
        .unk2 = 0xFFFF,
        .unk4 = 0xC0,
        .unk8 = NULL,
        .weatherSpriteResources = NULL,
        .unk10 = 0,
        .unk12 = 0,
        .task = NULL,
        .unk18 = ov01_021EDA50,
    },
};

static const WeatherGfxNarcData ov01_0220675C[] = {
    {
        .paletteId = 0x15,
        .charId = 0x24,
        .screenId = 0x26,
    },
    {
        .paletteId = 0x25,
        .charId = 0x24,
        .screenId = 0x26,
    },
    {
        .paletteId = 0x9,
        .charId = 0x8,
        .screenId = 0xA,
    },
    {
        .paletteId = 0x2A,
        .charId = 0x2C,
        .screenId = 0x2B,
    },
    {
        .paletteId = 0x1E,
        .charId = 0x1D,
        .screenId = 0x1F,
    },
    {
        .paletteId = 0x2E,
        .charId = 0x2D,
        .screenId = 0x2F,
    },
    {
        .paletteId = 0x33,
        .charId = 0x2D,
        .screenId = 0x2F,
    },
    {
        .paletteId = 0x34,
        .charId = 0x35,
        .screenId = 0x36,
    },
    {
        .paletteId = 0x31,
        .charId = 0x30,
        .screenId = 0x32,
    },
};
// clang-format on

static WeatherSystem *WeatherSystem_New(FieldSystem *fieldSystem) {
    WeatherSystem *weatherSystem = Heap_Alloc(HEAP_ID_FIELD1, sizeof(WeatherSystem));

    weatherSystem->fieldSystem = fieldSystem;

    WeatherDraw_Init(&weatherSystem->weatherDraw);

    weatherSystem->unk0 = ov01_022098B0;
    weatherSystem->unk4 = ov01_0220675C;

    weatherSystem->narc = NARC_New(NARC_a_0_6_3, HEAP_ID_FIELD1);

    return weatherSystem;
}

static void WeatherSystem_Delete(WeatherSystem **pWeatherSystem) {
    if (*pWeatherSystem != NULL) {
        for (int i = 0; i < 14; i++) {
            ov01_021EBB90(*pWeatherSystem, i);
        }

        Fog_Set((*pWeatherSystem)->fieldSystem->fog, 1, FALSE, GX_FOGBLEND_COLOR_ALPHA, GX_FOGSLOPE_0x8000, 0);

        reg_G2_BG0CNT = (reg_G2_BG0CNT & ~3) | 1;

        GfGfx_EngineATogglePlanes(4, 0);

        WeatherDraw_Delete(&(*pWeatherSystem)->weatherDraw);

        NARC_Delete((*pWeatherSystem)->narc);
        Heap_FreeExplicit(HEAP_ID_FIELD1, *pWeatherSystem);

        *pWeatherSystem = NULL;
    }
}

static BOOL WeatherSystem_Process(WeatherSystem *weatherSystem, int state, int weather) {
    BOOL ret = TRUE;

    if (weather > 14) {
        return FALSE;
    }

    switch (state) {
    case WEATHER_SYS_PROC_INIT:
        ret = WeatherSystem_Init(weatherSystem, weather);
        break;
    case 1:
        ret = ov01_021EBA08(weatherSystem, weather);
        break;
    case 2:
        ret = WeatherSystem_Start(weatherSystem, weather, 0, 1);
        break;
    case 3:
        ret = WeatherSystem_Start(weatherSystem, weather, 2, 1);
        break;
    case 4:
        if (Fog_CheckActive(weatherSystem->fieldSystem->fog) == 1) {
            ret = WeatherSystem_Start(weatherSystem, weather, 0, 2);
        } else {
            ret = WeatherSystem_Start(weatherSystem, weather, 0, 1);
        }
        break;
    case 5:
        ov01_021EBB40(weatherSystem, weather, 1);
        break;
    case 6:
        ov01_021EBB68(weatherSystem, weather);
        break;
    case 7:
        ov01_021EBB40(weatherSystem, weather, 0);
        break;
    case 8:
        ov01_021EBB90(weatherSystem, weather);
        break;
    case 9:
        WeatherSystem_Sub0 *v1 = &weatherSystem->unk0[weather];
        if (v1->unk8 && v1->unk8->unkF5C == TRUE) {
            PlaySE(v1->unk8->sndSeq);
        }
        break;
    case 10:
        WeatherSystem_Sub0 *v2 = &weatherSystem->unk0[weather];
        if (v2->unk8 && v2->unk8->unkF5C == TRUE) {
            StopSE(v2->unk8->sndSeq, 0);
        }
        break;
    default:
        break;
    }

    return ret;
}

static u16 ov01_021EB804(WeatherSystem *weatherSystem, int weather) {
    if (weather >= 14) {
        return 0;
    }
    WeatherSystem_Sub0 *v0 = &weatherSystem->unk0[weather];
    return v0->unk10;
}

static void ov01_021EB818(u32 arg0, u32 arg1) {
    G2x_SetBlendAlpha_(0x04000050, 4, 0x21, arg0, arg1);
}

static void ov01_021EB830(UnkWeatherStruct_021EB830 *arg0, s32 arg1, s32 arg2, s32 arg3) {
    arg0->unk0 = arg1;
    arg0->unk4 = arg1;
    arg0->unk8 = arg2 - arg1;
    arg0->unk10 = arg3;
    arg0->unkC = 0;
}

static BOOL ov01_021EB840(UnkWeatherStruct_021EB830 *a0) {
    int v0 = a0->unk8 * a0->unkC;
    v0 /= a0->unk10;

    a0->unk0 = v0 + a0->unk4;

    if (a0->unkC + 1 <= a0->unk10) {
        a0->unkC++;
        return FALSE;
    }

    a0->unkC = a0->unk10;
    return TRUE;
}

static void ov01_021EB86C(WeatherSystem *weatherSystem, s32 arg1, WeatherSpriteResources *arg2) {
    ov01_021EBEF0(weatherSystem, arg1, arg2);
    ov01_021EBF24(weatherSystem, arg1, arg2);
    ov01_021EBF58(weatherSystem, arg1, arg2);
    ov01_021EBF94(weatherSystem, arg1, arg2);
}

static SpriteResource *Weather_AddResObjFromOpenNarc(GF_2DGfxResHeader *headerList, s32 resourceType, s32 headerIndex, GF_2DGfxResMan *resMan, NARC *narc, BOOL atEnd) {
    GF_2DGfxResHeader *header = GF2DGfxResHeader_GetByIndex(headerList, resourceType);
    u32 member = GF2DGfxResHeader_GetNarcMemberIdByIndex(header, headerIndex);
    u32 compressFlag = GF2DGfxResHeader_GetCompressFlagByIndex(header, headerIndex);
    u32 exDat0 = GF2DGfxResHeader_GetExDat0ByIndex(header, headerIndex);
    u32 exDat1 = GF2DGfxResHeader_GetExDat1ByIndex(header, headerIndex);
    u32 objID = GF2dGfxResHeader_GetObjIdByIndex(header, headerIndex);

    SpriteResource *ret;
    switch (resourceType) {
    case GF_GFX_RES_TYPE_CHAR:
        ret = AddCharResObjFromOpenNarcWithAtEndFlag(resMan, narc, member, compressFlag, objID, exDat0, HEAP_ID_FIELD1, atEnd);
        break;
    case GF_GFX_RES_TYPE_PLTT:
        ret = AddPlttResObjFromOpenNarcWithAtEndFlag(resMan, narc, member, compressFlag, objID, exDat0, exDat1, HEAP_ID_FIELD1, atEnd);
        break;
    case GF_GFX_RES_TYPE_CELL:
        ret = AddCellOrAnimResObjFromOpenNarc(resMan, narc, member, compressFlag, objID, GF_GFX_RES_TYPE_CELL, HEAP_ID_FIELD1);
        break;
    case GF_GFX_RES_TYPE_ANIM:
        ret = AddCellOrAnimResObjFromOpenNarc(resMan, narc, member, compressFlag, objID, GF_GFX_RES_TYPE_ANIM, HEAP_ID_FIELD1);
        break;
    }

    return ret;
}

static void ov01_021EB968(WeatherSystem *weatherSystem, s32 a1, WeatherSpriteResources *a2) {
    if (a1 != 0xFFFF) {
        if (a2->charResObj[GF_GFX_RES_TYPE_CHAR] != 0) {
            sub_0200AEB0(a2->charResObj[GF_GFX_RES_TYPE_CHAR]);
        }
        if (a2->charResObj[GF_GFX_RES_TYPE_PLTT] != 0) {
            sub_0200B0A8(a2->charResObj[GF_GFX_RES_TYPE_PLTT]);
        }

        for (int i = 0; i < 4; i++) {
            if (a2->charResObj[i] != 0) {
                DestroySingle2DGfxResObj(weatherSystem->weatherDraw.resMan[i], a2->charResObj[i]);
            }
        }
    }
}

static BOOL WeatherSystem_Init(WeatherSystem *weatherSystem, int weather) {
    WeatherSystem_Sub0 *v0 = &weatherSystem->unk0[weather];
    if (v0->unk8 == 0) {
        if (ov01_021EBE4C(weatherSystem, v0) == FALSE) {
            return FALSE;
        }

        if (ov01_021EBD34(weatherSystem, v0) == FALSE) {
            Heap_Free(v0->unk8);
            v0->unk8 = NULL;
            return FALSE;
        }

        v0->unk8->unk8 = v0->weatherSpriteResources;

        if (v0->unk0 != 0xFFFF) {
            ov01_021EC028(v0->unk8);
        }

        ov01_021EBD18(weatherSystem, v0->unk2);
        v0->unk10 = 2;
    }

    return TRUE;
}

static BOOL ov01_021EBA08(WeatherSystem *weatherSystem, int weather) {
    WeatherSystem_Sub0 *v0 = &weatherSystem->unk0[weather];
    if (v0->unk8) {
        return TRUE;
    }

    if (ov01_021EBE4C(weatherSystem, v0) == 0) {
        return FALSE;
    }

    v0->task = SysTask_CreateOnMainQueue(ov01_021EBD70, v0, 1);
    v0->unk10 = 1;
    v0->unk12 = 0;

    return TRUE;
}

static BOOL WeatherSystem_Start(WeatherSystem *weatherSystem, int weather, u32 a2, u32 a3) {
    WeatherSystem_Sub0 *v0 = &weatherSystem->unk0[weather];

    if (v0->unk0 != 0xFFFF && v0->weatherSpriteResources == 0) {
        return FALSE;
    }

    if (v0->unk8 == NULL) {
        return FALSE;
    }

    if (v0->unk10 != 2) {
        return FALSE;
    }

    v0->unk8->unkF48 = SysTask_CreateOnMainQueue(v0->unk18, v0->unk8, 4);

    if (v0->unk8->unkF48 == NULL) {
        return FALSE;
    }

    v0->unk10 = 3;
    v0->unk8->unkF62 = a2;
    v0->unk8->unkF66 = 0;
    v0->unk8->linkedListDummy.next = &v0->unk8->linkedListDummy;
    v0->unk8->linkedListDummy.prev = &v0->unk8->linkedListDummy;
    v0->unk8->unkF64 = a3;
    v0->unk8->unkF5C = 0;

    v0->unk8->cameraTarget = NNS_G3dGlb.camTarget;

    if (v0->unk4 > 0) {
        v0->unk8->unkF58 = Heap_Alloc(HEAP_ID_FIELD1, v0->unk4);
        memset(v0->unk8->unkF58, 0, v0->unk4);
    } else {
        v0->unk8->unkF58 = NULL;
    }

    if (v0->unk2 != 0xFFFF) {
        GfGfx_EngineATogglePlanes(4, 0);
        G2_SetBG2Priority(1);
        G2_SetBG0Priority(2);
    }

    return TRUE;
}

static void ov01_021EBB40(WeatherSystem *weatherSystem, int weather, u16 a2) {
    WeatherSystem_Sub0 *v0 = &weatherSystem->unk0[weather];
    if (v0->unk10 == 3) {
        v0->unk8->unkF66 = 5;
        v0->unk8->unkF64 = a2;
    }
}

static void ov01_021EBB68(WeatherSystem *weatherSystem, int weather) {
    WeatherSystem_Sub0 *v0 = &weatherSystem->unk0[weather];
    if (ov01_021EB804(weatherSystem, weather) == 3) {
        v0->unk8->unkF62 = 5;
        v0->unk18(NULL, v0->unk8);
    }
}

static void ov01_021EBB90(WeatherSystem *weatherSystem, u32 weather) {
    WeatherSystem_Sub0 *v0 = &weatherSystem->unk0[weather];

    if (v0->unk2 != 0xFFFF) {
        GfGfx_EngineATogglePlanes(4, 0);

        G2_SetBG2Priority(3);
        G2_SetBG0Priority(1);
        G2_BlendNone();
    }

    if (v0->weatherSpriteResources) {
        ov01_021EB968(weatherSystem, v0->unk0, v0->weatherSpriteResources);
        Heap_FreeExplicit(HEAP_ID_FIELD1, v0->weatherSpriteResources);
        v0->weatherSpriteResources = NULL;
        if (v0->task) {
            SysTask_Destroy(v0->task);
            v0->task = NULL;
        }
    }

    if (v0->unk8) {
        WeatherObject_DeleteAll(&v0->unk8->linkedListDummy);

        if (v0->unk0 != 0xFFFF) {
            ov01_021EC058(v0->unk8);
        }

        if (v0->unk8->unkF5C == 1) {
            ov01_021EDAE0(v0->unk8);
        }

        if (v0->unk8->unkF58) {
            Heap_FreeExplicit(HEAP_ID_FIELD1, v0->unk8->unkF58);
            v0->unk8->unkF58 = NULL;
        }

        if (v0->unk10 == 1) {
            if (v0->task) {
                SysTask_Destroy(v0->task);
            }
        } else if (v0->unk10 == 3) {
            SysTask_Destroy(v0->unk8->unkF48);
        }

        if (v0->unk8->unkF6C) {
            SysTask_Destroy(v0->unk8->unkF6C);
        }

        Heap_FreeExplicit(HEAP_ID_FIELD1, v0->unk8);
        v0->unk8 = NULL;
    }

    Fog_Set(weatherSystem->fieldSystem->fog, 1, FALSE, GX_FOGBLEND_COLOR_ALPHA, GX_FOGSLOPE_0x8000, 0);
}

static void ov01_021EBCA4(WeatherSystem_Sub0 *a0) {
    if (a0->unk2 != 0xFFFF) {
        GfGfx_EngineATogglePlanes(4, 0);
        G2_SetBG2Priority(3);
        G2_SetBG0Priority(1);
        G2_BlendNone();
    }

    if (a0->unk8 != NULL) {
        WeatherObject_DeleteAll(&a0->unk8->linkedListDummy);

        if (a0->unk8->unkF5C == 1) {
            ov01_021EDAE0(a0->unk8);
        }

        if (a0->unk10 == 3) {
            SysTask_Destroy(a0->unk8->unkF48);
            a0->unk10 = 2;
        }
    }
}

static void ov01_021EBD18(WeatherSystem *weatherSystem, u16 a1) {
    ov01_021EC078(weatherSystem, a1);
    ov01_021EC0C0(weatherSystem, a1);
    ov01_021EC114(weatherSystem, a1);
}

static BOOL ov01_021EBD34(WeatherSystem *weatherSystem, WeatherSystem_Sub0 *a1) {
    if (a1->unk0 != 0xFFFF && a1->weatherSpriteResources == NULL) {
        if (ov01_021EBEB8(a1) == FALSE) {
            return FALSE;
        }
        ov01_021EB86C(weatherSystem, a1->unk0, a1->weatherSpriteResources);
        ov01_021EBFD0(weatherSystem, a1);
    }
    return TRUE;
}

static void ov01_021EBD70(SysTask *task, void *data) {
    WeatherSystem_Sub0 *v0 = data;
    WeatherSystem *weatherSystem = v0->unk8->weatherSystem;
    switch (v0->unk12) {
    case 0:
        GF_ASSERT(ov01_021EBEB8(v0));
        v0->unk12++;
        break;
    case 1:
        ov01_021EBEF0(weatherSystem, v0->unk0, v0->weatherSpriteResources);
        v0->unk12++;
        break;
    case 2:
        ov01_021EC078(weatherSystem, v0->unk2);
        v0->unk12++;
        break;
    case 3:
        ov01_021EBF24(weatherSystem, v0->unk0, v0->weatherSpriteResources);
        v0->unk12++;
        break;
    case 4:
        ov01_021EC0C0(weatherSystem, v0->unk2);
        v0->unk12++;
        break;
    case 5:
        ov01_021EBF58(weatherSystem, v0->unk0, v0->weatherSpriteResources);
        v0->unk12++;
        break;
    case 6:
        ov01_021EC114(weatherSystem, v0->unk2);
        v0->unk12++;
        break;
    case 7:
        ov01_021EBF94(weatherSystem, v0->unk0, v0->weatherSpriteResources);
        v0->unk12++;
        break;
    case 8:
        ov01_021EBFD0(weatherSystem, v0);
        v0->unk8->unk8 = v0->weatherSpriteResources;
        if (v0->unk0 != 0xFFFF) {
            ov01_021EC028(v0->unk8);
        }
        v0->unk10 = 2;
        v0->unk12 = 0;
        v0->task = 0;
        SysTask_Destroy(task);
    }
}

static BOOL ov01_021EBE4C(WeatherSystem *weatherSystem, WeatherSystem_Sub0 *a1) {
    if (a1->unk8) {
        return TRUE;
    }

    a1->unk8 = Heap_Alloc(HEAP_ID_FIELD1, sizeof(WeatherSystem_Sub0_Sub8));
    if (a1->unk8 == NULL) {
        return FALSE;
    }
    memset(a1->unk8, 0, sizeof(WeatherSystem_Sub0_Sub8));

    a1->unk8->weatherSystem = weatherSystem;
    a1->unk8->unkF62 = 0;
    a1->unk8->unkF66 = 0;
    a1->unk8->linkedListDummy.next = &a1->unk8->linkedListDummy;
    a1->unk8->linkedListDummy.prev = &a1->unk8->linkedListDummy;
    a1->unk8->unkF58 = NULL;
    a1->unk8->unk4 = a1;
    a1->unk8->unkF6C = NULL;

    return TRUE;
}

static BOOL ov01_021EBEB8(WeatherSystem_Sub0 *a0) {
    if (a0->unk0 != 0xFFFF) {
        if (a0->weatherSpriteResources != NULL) {
            return TRUE;
        }
        a0->weatherSpriteResources = Heap_Alloc(HEAP_ID_FIELD1, sizeof(WeatherSpriteResources));
        if (a0->weatherSpriteResources == NULL) {
            return FALSE;
        }
        memset(a0->weatherSpriteResources, 0, sizeof(WeatherSpriteResources));
    }
    return TRUE;
}

static void ov01_021EBEF0(WeatherSystem *weatherSystem, u32 headerIndex, WeatherSpriteResources *a2) {
    if (headerIndex != 0xFFFF) {
        a2->charResObj[GF_GFX_RES_TYPE_CELL] = Weather_AddResObjFromOpenNarc(weatherSystem->weatherDraw.header, GF_GFX_RES_TYPE_CELL, headerIndex, weatherSystem->weatherDraw.resMan[GF_GFX_RES_TYPE_CELL], weatherSystem->narc, 0);
    }
}

static void ov01_021EBF24(WeatherSystem *weatherSystem, u32 headerIndex, WeatherSpriteResources *a2) {
    if (headerIndex != 0xFFFF) {
        a2->charResObj[GF_GFX_RES_TYPE_ANIM] = Weather_AddResObjFromOpenNarc(weatherSystem->weatherDraw.header, GF_GFX_RES_TYPE_ANIM, headerIndex, weatherSystem->weatherDraw.resMan[GF_GFX_RES_TYPE_ANIM], weatherSystem->narc, 0);
    }
}

static void ov01_021EBF58(WeatherSystem *weatherSystem, u32 headerIndex, WeatherSpriteResources *a2) {
    if (headerIndex != 0xFFFF) {
        a2->charResObj[GF_GFX_RES_TYPE_CHAR] = Weather_AddResObjFromOpenNarc(weatherSystem->weatherDraw.header, GF_GFX_RES_TYPE_CHAR, headerIndex, weatherSystem->weatherDraw.resMan[GF_GFX_RES_TYPE_CHAR], weatherSystem->narc, 1);
        sub_0200ADA4(a2->charResObj[GF_GFX_RES_TYPE_CHAR]);
        sub_0200A740(a2->charResObj[GF_GFX_RES_TYPE_CHAR]);
    }
}

static void ov01_021EBF94(WeatherSystem *weatherSystem, u32 headerIndex, WeatherSpriteResources *a2) {
    if (headerIndex != 0xFFFF) {
        a2->charResObj[GF_GFX_RES_TYPE_PLTT] = Weather_AddResObjFromOpenNarc(weatherSystem->weatherDraw.header, GF_GFX_RES_TYPE_PLTT, headerIndex, weatherSystem->weatherDraw.resMan[GF_GFX_RES_TYPE_PLTT], weatherSystem->narc, 1);
        sub_0200B00C(a2->charResObj[GF_GFX_RES_TYPE_PLTT]);
        sub_0200A740(a2->charResObj[GF_GFX_RES_TYPE_PLTT]);
    }
}

static void ov01_021EBFD0(WeatherSystem *weatherSystem, WeatherSystem_Sub0 *a1) {
    if (a1->unk0 != 0xFFFF) {
        ov01_021EC240(&a1->weatherSpriteResources->spriteResHeader, weatherSystem, a1->weatherSpriteResources, 0, 1);
        memset(&a1->weatherSpriteResources->spriteTemplate, 0, sizeof(SpriteTemplate));
        a1->weatherSpriteResources->spriteTemplate.spriteList = weatherSystem->weatherDraw.spriteList;
        a1->weatherSpriteResources->spriteTemplate.header = &a1->weatherSpriteResources->spriteResHeader;
        a1->weatherSpriteResources->spriteTemplate.scale.x = 1 << 12;
        a1->weatherSpriteResources->spriteTemplate.scale.y = 1 << 12;
        a1->weatherSpriteResources->spriteTemplate.scale.z = 1 << 12;
        a1->weatherSpriteResources->spriteTemplate.whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN;
    }
}

static void ov01_021EC028(WeatherSystem_Sub0_Sub8 *a0) {
    for (int i = 0; i < 64; i++) {
        a0->linkedList[i].unk4 = Sprite_CreateAffine(&a0->unk8->spriteTemplate);
        Sprite_SetDrawFlag(a0->linkedList[i].unk4, 0);
        GF_ASSERT(a0->linkedList[i].unk4);
    }
}

static void ov01_021EC058(WeatherSystem_Sub0_Sub8 *a0) {
    for (int i = 0; i < 64; i++) {
        if (a0->linkedList[i].unk4) {
            Sprite_Delete(a0->linkedList[i].unk4);
            a0->linkedList[i].unk4 = NULL;
        }
    }
}

static void ov01_021EC078(WeatherSystem *weatherSystem, u16 a1) {
    UnkWeatherStruct_021EC078 v0;
    if (a1 != 0xFFFF) {
        v0.unk0 = NARC_AllocAndReadWholeMember(weatherSystem->narc, weatherSystem->unk4[a1].paletteId, HEAP_ID_FIELD1);
        NNS_G2dGetUnpackedPaletteData(v0.unk0, &v0.unk14);
        BG_LoadPlttData(2, v0.unk14->pRawData, 32, 0xc0);
        Heap_Free(v0.unk0);
        v0.unk0 = NULL;
    }
}

static void ov01_021EC0C0(WeatherSystem *weatherSystem, u16 a1) {
    UnkWeatherStruct_021EC078 v0;
    if (a1 != 0xFFFF) {
        v0.unk4 = NARC_AllocAndReadWholeMember(weatherSystem->narc, weatherSystem->unk4[a1].charId, HEAP_ID_FIELD1);
        NNS_G2dGetUnpackedCharacterData(v0.unk4, &v0.unk10);
        BG_LoadCharTilesData(weatherSystem->fieldSystem->bgConfig, 2, v0.unk10->pRawData, v0.unk10->szByte, 0);
        Heap_Free(v0.unk4);
        v0.unk4 = NULL;
    }
}

static void ov01_021EC114(WeatherSystem *weatherSystem, u16 a1) {
    UnkWeatherStruct_021EC078 v0;
    if (a1 != 0xFFFF) {
        GfGfx_EngineATogglePlanes(4, 0);
        v0.unk8 = NARC_AllocAndReadWholeMember(weatherSystem->narc, weatherSystem->unk4[a1].screenId, HEAP_ID_FIELD1);
        GF_ASSERT(v0.unk8);
        NNS_G2dGetUnpackedScreenData(v0.unk8, &v0.unkC);
        BgCopyOrUncompressTilemapBufferRangeToVram(weatherSystem->fieldSystem->bgConfig, 2, v0.unkC->rawData, v0.unkC->szByte, 0);
        BG_LoadScreenTilemapData(weatherSystem->fieldSystem->bgConfig, 2, v0.unkC->rawData, v0.unkC->szByte);
        BgTilemapRectChangePalette(weatherSystem->fieldSystem->bgConfig, 2, 0, 0, 32, 32, 6);
        BgCommitTilemapBufferToVram(weatherSystem->fieldSystem->bgConfig, 2);
        Heap_Free(v0.unk8);
        v0.unk8 = NULL;
    }
}

static void ov01_021EC1BC(WeatherObject *a0, int a1) {
    GF_ASSERT(a0->unk8 == 0);
    GF_ASSERT(a1 > 0);
    GF_ASSERT(a1 <= 0x28u);
    a0->unk8 = a0->unk10;
}

static void ov01_021EC1E4(WeatherObject *a0) {
    a0->unk8 = NULL;
    memset(a0->unk10, 0, 10 * sizeof(u32));
}

static void *ov01_021EC1F4(WeatherSystem_Sub0_Sub8 *a0, int a1) {
    WeatherSystem *weatherSystem = a0->weatherSystem;
    WeatherObject *v0 = ov01_021EC8D8(a0);
    if (v0 == NULL) {
        return NULL;
    }
    v0->weatherSystem = weatherSystem;
    v0->next = &a0->linkedListDummy;
    v0->prev = a0->linkedListDummy.prev;
    a0->linkedListDummy.prev->next = v0;
    a0->linkedListDummy.prev = v0;

    ov01_021EC1BC(v0, a1);
    if (v0->unk8 == NULL) {
        return NULL;
    }

    GF_ASSERT(v0->unk4);
    Sprite_SetDrawFlag(v0->unk4, 1);
    return v0;
}

static void ov01_021EC240(SpriteResourcesHeader *header, WeatherSystem *weatherSystem, WeatherSpriteResources *a2, u32 a3, u32 a4) {
    int resID[4];

    for (int i = 0; i < 4; i++) {
        resID[i] = GF2DGfxResObj_GetResID(a2->charResObj[i]);
    }

    CreateSpriteResourcesHeader(header, resID[0], resID[1], resID[2], resID[3], -1, -1, a3, a4, weatherSystem->weatherDraw.resMan[0], weatherSystem->weatherDraw.resMan[1], weatherSystem->weatherDraw.resMan[2], weatherSystem->weatherDraw.resMan[3], NULL, NULL);
}

static void WeatherObject_Delete(WeatherObject *a0) {
    a0->prev->next = a0->next;
    a0->next->prev = a0->prev;

    Sprite_SetDrawFlag(a0->unk4, 0);
    ov01_021EC1E4(a0);

    Sprite *temp = a0->unk4;
    memset(a0, 0, sizeof(WeatherObject));
    a0->unk4 = temp;
}

static void WeatherObject_DeleteAll(WeatherObject *a0) {
    WeatherObject *cur = a0->next;
    WeatherObject *next;

    while (cur != a0) {
        next = cur->next;
        WeatherObject_Delete(cur);
        cur = next;
    }
}

static void ov01_021EC2E4(WeatherObject *a0, UnkLinkedListFunc func) {
    WeatherObject *cur = a0->next;
    WeatherObject *next = cur->next;

    while (cur != a0) {
        func(cur);
        cur = next;
        next = cur->next;
    }
}

static void ov01_021EC300(void *data) {
}

static VecFx32 ov01_021EC304(WeatherObject *a0) {
    return *Sprite_GetMatrixPtr(a0->unk4);
}

static void ov01_021EC31C(fx32 *x, fx32 *z, WeatherSystem_Sub0_Sub8 *a0) {
    VecFx32 cameraTarget = NNS_G3dGlb.camTarget;
    fx32 xScale, zScale;
    fx32 dx, dz;
    fx32 xDist, zDist;
    int v7;
    fx32 aspect;

    xDist = (cameraTarget.x - a0->cameraTarget.x);
    zDist = (cameraTarget.z - a0->cameraTarget.z);

    aspect = FX_Div(FX32_CONST(4), FX32_CONST(3));

    sub_02020E10(Camera_GetPerspectiveAngle(a0->weatherSystem->fieldSystem->camera), Camera_GetDistance(a0->weatherSystem->fieldSystem->camera), aspect, &dx, &dz);

    dx = FX_Div(dx, 256 * FX32_ONE);

    if (zDist <= 0) {
        dz = FX_Div(dz, 0xbe8d0);
    } else {
        dz = FX_Div(dz, 0xbe811);
    }

    v7 = FX32_ONE;
    if (xDist < 0) {
        v7 = -FX32_ONE;
        xDist = FX_MUL(xDist, -FX32_ONE);
    }
    xScale = FX_Div(xDist, dx);
    if (v7 < 0) {
        xScale = FX_MUL(xScale, v7);
    }

    v7 = FX32_ONE;
    if (zDist < 0) {
        v7 = -FX32_ONE;
        zDist = FX_MUL(zDist, -FX32_ONE);
    }
    zScale = FX_Div(zDist, dz);
    if (v7 < 0) {
        zScale = FX_MUL(zScale, v7);
    }

    if (xScale + zScale != 0) {
        a0->cameraTarget = cameraTarget;
    }

    *x = xScale;
    *z = zScale;
}

static void ov01_021EC470(WeatherSystem_Sub0_Sub8 *a0, int *xOut, int *zOut) {
    fx32 x, z;
    ov01_021EC4A8(a0, &x, &z);

    if (xOut) {
        *xOut = x >> FX32_SHIFT;
        if (*xOut < 0) {
            *xOut += FX32_ONE;
        }
    }
    if (zOut) {
        *zOut = z >> FX32_SHIFT;
        if (*zOut < 0) {
            *zOut += 1;
        }
    }
}

static void ov01_021EC4A8(WeatherSystem_Sub0_Sub8 *a0, fx32 *x, fx32 *y) {
    WeatherObject *cur;
    fx32 xScale, yScale;
    VecFx32 matrix;
    ov01_021EC31C(&xScale, &yScale, a0);

    cur = a0->linkedListDummy.next;
    while (cur != &a0->linkedListDummy) {
        matrix = ov01_021EC304(cur);

        matrix.x -= xScale;
        matrix.y -= yScale;

        WeatherDraw_SetSpriteMatrix(cur->unk4, &matrix);

        cur = cur->next;
    }

    if (x != NULL) {
        *x = xScale;
    }
    if (y != NULL) {
        *y = yScale;
    }
}

static void ov01_021EC504(UnkStruct_021EC504 *arg0, WeatherSystem_Sub0_Sub8 *arg1, s16 arg2, s16 arg3, s32 arg4, s32 arg5, s32 arg6, s32 arg7, s32 arg8, UnkWeatherSystemSub0Sub8Func arg9) {
    arg0->unk0 = arg1;
    arg0->unk4 = arg2;
    arg0->unk6 = 0;
    arg0->unk8 = arg3;
    arg0->unkA = 0;
    arg0->unkC = (s16)arg4;
    arg0->unkE = (s16)arg5;
    arg0->unk10 = (s16)arg6;
    arg0->unk12 = (s16)arg7;
    arg0->unk14 = arg8;
    arg0->unk18 = arg9;
}

static void ov01_021EC52C(UnkStruct_021EC504 *arg0, s16 arg1, s16 arg2, s16 arg3, s32 arg4) {
    arg0->unkC = arg1;
    arg0->unkE = arg2;
    arg0->unk10 = arg3;
    arg0->unk14 = arg4;
}

static s32 ov01_021EC538(UnkStruct_021EC504 *arg0) {
    s16 temp_r0;
    s16 temp_r0_2;
    s16 temp_r0_4;
    s16 temp_r1;
    s16 temp_r1_2;
    s32 temp_r0_3;
    s32 var_r2;
    s32 var_r2_2;
    s32 var_r4;

    temp_r0 = arg0->unk10;
    var_r4 = 0;
    if (temp_r0 == 0) {
        var_r4 |= 1;
    } else {
        if ((s32)temp_r0 <= 0) {
            var_r2 = 1;
        } else {
            var_r2 = 0;
        }
        temp_r1 = arg0->unkE;
        temp_r0_2 = arg0->unk8;
        if ((((s32)temp_r0_2 >= (s32)temp_r1) && (var_r2 == 0)) || (((s32)temp_r0_2 <= (s32)temp_r1) && (var_r2 == 1))) {
            var_r4 |= 1;
            arg0->unk8 = temp_r1;
        }
    }
    temp_r0_3 = arg0->unk14;
    if (temp_r0_3 == 0) {
        var_r4 |= 2;
    } else {
        if (temp_r0_3 <= 0) {
            var_r2_2 = 1;
        } else {
            var_r2_2 = 0;
        }
        temp_r1_2 = arg0->unkC;
        temp_r0_4 = arg0->unk4;
        if ((((s32)temp_r0_4 >= (s32)temp_r1_2) && (var_r2_2 == 0)) || (((s32)temp_r0_4 <= (s32)temp_r1_2) && (var_r2_2 == 1))) {
            var_r4 |= 2;
            arg0->unk4 = temp_r1_2;
        }
    }
    arg0->unk6 = (s16)(arg0->unk6 - 1);
    if ((s32)arg0->unk6 <= 0) {
        arg0->unk18(arg0->unk0, arg0->unk4);
        arg0->unk6 = (s16)arg0->unk8;
        if (!(1 & var_r4)) {
            arg0->unk8 = (s16)(arg0->unk8 + arg0->unk10);
        }
        if (!(2 & var_r4)) {
            arg0->unkA = (s16)(arg0->unkA + 1);
            if ((s32)arg0->unkA >= (s32)arg0->unk12) {
                arg0->unkA = 0;
                arg0->unk4 = (s16)(arg0->unk4 + arg0->unk14);
            }
        }
    }
    return var_r4;
}

static void ov01_021EC5FC(WeatherFogChange *arg0, UnkStruct_021EC774 *arg1, FogData *fog, GXFogSlope fogSlope, s32 fogOffset, GXRgb rgb, s32 arg6, s32 arg7) {
    arg1->fog = fog;
    if (arg7 != 0) {
        if (arg7 == 1) {
            ov01_021EC678(fog, fogSlope, fogOffset, rgb);
            ov01_021EC774(arg1);
            ov01_021EC790(arg1, arg6, 1);
        } else if (arg7 == 2) {
            ov01_021EC6A4(arg0, fog, fogSlope, fogOffset, rgb, 0x7F * arg6);
        }
    }
}

static BOOL ov01_021EC650(WeatherFogChange *arg0, UnkStruct_021EC774 *arg1, s32 arg2) {
    s32 var_r4;

    var_r4 = 1;
    if (arg2 != 0) {
        if (arg2 == 1) {
            var_r4 = ov01_021EC7AC(arg1);
        } else if (arg2 == 2) {
            if (ov01_021EC728(arg0) == 0) {
                var_r4 = 0;
            }
        }
    }
    return var_r4;
}

static void ov01_021EC678(FogData *fog, GXFogSlope fogSlope, s32 fogOffset, GXRgb rgb) {
    Fog_Set(fog, -1, TRUE, GX_FOGBLEND_COLOR_ALPHA, fogSlope, fogOffset);
    ov01_021EA89C(fog, -1, rgb, 0x1F);
}

static void ov01_021EC6A4(WeatherFogChange *fogChange, FogData *fog, s32 arg2, s32 arg3, GXRgb rgb, s32 arg5) {
    int slope = Fog_GetSlope(fog);
    int offset = Fog_GetOffset(fog);
    GXRgb rgb2 = ov01_021EA860(fog);

    fogChange->fog = fog;

    ov01_021EB830(&fogChange->unk4, offset, arg3, arg5);
    ov01_021EB830(&fogChange->unk18, rgb2 & GX_RGB_R_MASK, rgb & GX_RGB_R_MASK, arg5);
    ov01_021EB830(&fogChange->unk2C, (rgb2 >> GX_RGB_G_SHIFT) & 0x1F, (rgb >> GX_RGB_G_SHIFT) & 0x1F, arg5);
    ov01_021EB830(&fogChange->unk40, (rgb2 >> GX_RGB_B_SHIFT) & 0x1F, (rgb >> GX_RGB_B_SHIFT) & 0x1F, arg5);
    ov01_021EB830(&fogChange->unk54, slope, arg2, arg5);
}

static BOOL ov01_021EC728(WeatherFogChange *arg0) {
    BOOL ret = ov01_021EB840(&arg0->unk4);
    ov01_021EB840(&arg0->unk18);
    ov01_021EB840(&arg0->unk2C);
    ov01_021EB840(&arg0->unk40);
    ov01_021EB840(&arg0->unk54);
    ov01_021EC678(arg0->fog, (GXFogSlope)arg0->unk54.unk0, arg0->unk4.unk0, GX_RGB(arg0->unk18.unk0, arg0->unk2C.unk0, arg0->unk40.unk0));

    return ret;
}

static void ov01_021EC774(UnkStruct_021EC774 *a0) {
    for (int i = 0; i < 32; i++) {
        a0->unk4[i] = 0;
    }
    ov01_021EA8C4(a0->fog, a0->unk4);
}

static void ov01_021EC790(UnkStruct_021EC774 *arg0, s32 arg1, s32 arg2) {
    arg0->unk24 = 0x7F;
    arg0->unk28 = 0;
    arg0->unk2C = arg1;
    if (arg2 == 1) {
        arg0->unk2E = 1;
        return;
    }
    arg0->unk2E = -1;
}

static s32 ov01_021EC7AC(UnkStruct_021EC774 *arg0) {
    s32 temp_r4;

    temp_r4 = ov01_021EC7E8(arg0);
    if (arg0->unk28 == 0) {
        ov01_021EA8C4(arg0->fog, arg0->unk4);
    }
    return temp_r4;
}

static void ov01_021EC7C8(UnkStruct_021EC774 *arg0) {
    arg0->unk24 = 1;
    arg0->unk28 = 0;
    arg0->unk2C = 0;
    arg0->unk2E = 1;
    ov01_021EC828(arg0);
    ov01_021EA8C4(arg0->fog, arg0->unk4);
}

static s32 ov01_021EC7E8(UnkStruct_021EC774 *arg0) {
    s32 temp_r0;
    s32 temp_r2;
    s32 var_r4;

    var_r4 = 0;
    if (arg0->unk2E == 0) {
        var_r4 = 1;
    } else if ((s32)arg0->unk24 <= 0) {
        var_r4 = 1;
    } else {
        temp_r2 = arg0->unk28 + 1;
        arg0->unk28 = temp_r2;
        if (temp_r2 >= (s32)arg0->unk2C) {
            arg0->unk28 = 0;
            ov01_021EC828(arg0);
            temp_r0 = arg0->unk24 - 1;
            arg0->unk24 = temp_r0;
            if (temp_r0 <= 0) {
                var_r4 = 1;
            }
        }
    }
    return var_r4;
}

static void ov01_021EC828(UnkStruct_021EC774 *arg0) {
    int i;
    int v0;
    int v1;

    if (arg0->unk2E < 0) {
        v1 = 0x7F - arg0->unk24;
    } else {
        v1 = arg0->unk24;
    }

    v0 = v1 / 4;
    for (i = 31; i > v0; i--) {
        arg0->unk4[i] = (i - v0) * 4;
    }
}

static void ov01_021EC85C(WeatherSystem_Sub0_Sub8 *a0, UnkWeatherSystemSub0Sub8Func a1, int a2, int a3, int a4, UnkLinkedListFunc a5) {
    a1(a0, a2);

    int i, j;
    int v0 = 0;
    WeatherObject *cur = a0->linkedListDummy.next;
    WeatherObject *next = cur->next;

    for (i = 0; i < a2; i++) {
        if (cur == &a0->linkedListDummy) {
            break;
        }

        for (j = 0; j < v0; j++) {
            a5(cur);

            if (cur->unk8 == NULL) {
                break;
            }
        }

        cur = next;
        next = cur->next;

        if (i >= a3 && (i % a3) == 0) {
            v0 += a4;
        }
    }
}

static WeatherObject *ov01_021EC8D8(WeatherSystem_Sub0_Sub8 *a0) {
    for (int i = 0; i < 64; i++) {
        if (a0->linkedList[i].weatherSystem == NULL) {
            return &a0->linkedList[i];
        }
    }
    return NULL;
}

static void ov01_021EC8F8(SysTask *task, void *data) {
    WeatherSystem_Sub0_Sub8 *arg1 = data;
    u16 temp_r2 = arg1->unkF62;
    switch (temp_r2) {
    case 0:
        arg1->unkF62 = 1;
        break;
    case 1:
        arg1->unkF62 = 3;
        break;
    case 2:
        arg1->unkF62 = 3;
        break;
    case 3:
        if (arg1->unkF66 == 5) {
            arg1->unkF62 = 4;
        }
        break;
    case 4:
        arg1->unkF62 = 5;
        break;
    case 5:
        ov01_021EBCA4(arg1->unk4);
        break;
    }
}

static void ov01_021EC94C(SysTask *task, void *data) {
    WeatherSystem_Sub0_Sub8 *v0 = data;

    UnkStruct_021EC94C *v1 = v0->unkF58;

    switch (v0->unkF62) {
    case 0:
        ov01_021EC504(&v1->unk0, v0, 1, 8, 20, 1, -1, 1, 2, ov01_021ECBB4);
        ov01_021EC5FC(&v1->unk50, &v1->unk1C, v0->weatherSystem->fieldSystem->fog, GX_FOGSLOPE_0x1000, 0x726F, 0x6b5a, 1, v0->unkF64);

        v1->data[0] = 0;
        v0->unkF6C = SysTask_CreateOnMainQueue(ov01_021EDA7C, v0, 100);
        v0->unkF68 = 30;
        v0->unkF62 = 1;
        break;
    case 1:
        int v2 = ov01_021EC538(&v1->unk0);
        if (v1->data[0] > 0) {
            v1->data[0]--;
        } else {
            int v3 = ov01_021EC650(&v1->unk50, &v1->unk1C, v0->unkF64);
            if (v3 == 1 && v2 == 3) {
                v0->unkF62 = 3;
            }
        }
        break;
    case 2:
        ov01_021EC504(&v1->unk0, v0, 20, 1, 20, 1, -1, 1, 2, ov01_021ECBB4);

        if (v0->unkF64) {
            v1->unk1C.fog = v0->weatherSystem->fieldSystem->fog;
            ov01_021EC678(v1->unk1C.fog, GX_FOGSLOPE_0x1000, 0x726f, GX_RGB(26, 26, 26));
            ov01_021EC7C8(&v1->unk1C);
        }

        ov01_021EC85C(v0, ov01_021ECBB4, 20, 10, 1, ov01_021ECC70);

        v0->unkF6C = SysTask_CreateOnMainQueue(ov01_021EDA7C, v0, 100);
        v0->unkF68 = 30;
        v0->unkF62 = 3;
        break;
    case 3:
        if (v1->unk0.unk6-- <= 0) {
            ov01_021ECBB4(v0, v1->unk0.unk4);
            v1->unk0.unk6 = v1->unk0.unk8;
        }

        if (v0->unkF66 == 5) {
            ov01_021EC52C(&v1->unk0, 0, 8, 1, -2);

            if (v0->unkF64) {
                ov01_021EC790(&v1->unk1C, 1, 0);
            }
            v1->data[0] = 0;
            v0->unkF62 = 4;
            ov01_021EDAE0(v0);
        }
        break;
    case 4:
        int ret = ov01_021EC538(&v1->unk0);
        if (v1->data[0] > 0) {
            v1->data[0]--;
        } else {
            int vUnk;
            if (v0->unkF64) {
                vUnk = ov01_021EC7AC(&v1->unk1C);
            } else {
                vUnk = 1;
            }

            if (vUnk == 1 && ret == 3) {
                if (v0->linkedListDummy.next == &v0->linkedListDummy) {
                    v0->unkF62 = 5;
                }
            }
        }
        break;
    case 5:
        if (v0->unkF64) {
            Fog_Set(v1->unk1C.fog, 1, FALSE, GX_FOGBLEND_COLOR_ALPHA, GX_FOGSLOPE_0x8000, 0);
        }
        ov01_021EBCA4(v0->unk4);
        break;
    }

    if (v0->unkF62 != 5 && v0->unkF62 != 0) {
        ov01_021EC2E4(&v0->linkedListDummy, ov01_021ECC70);
        ov01_021EC470(v0, NULL, NULL);
        ov01_021EC300(v0);
    }
}

static void ov01_021ECBB4(WeatherSystem_Sub0_Sub8 *a0, int arg1) {
    for (int i = 0; i < arg1; i++) {
        WeatherObject *v0 = ov01_021EC1F4(a0, 32);
        if (v0 == NULL) {
            break;
        }

        u32 *data = v0->unk8;
        u32 rand = MTRandom();

        data[0] = 0;
        int frame = rand % 3;
        Sprite_SetAnimationFrame(v0->unk4, frame);

        int v1 = rand % 20;
        data[2] = 10 * (frame + 1) + v1;
        if (frame == 2) {
            data[2] += 10;
        }

        v1 /= -5;
        data[4] = -5 * (frame + 1) + v1;
        if (frame == 2) {
            data[4] -= 5;
        }
        data[3] = 0;
        data[1] = 1 + (rand % 3);

        VecFx32 vec;

        vec.x = (15 * frame + (rand % 270)) << FX32_SHIFT;
        vec.y = 0xFFFA0 << FX32_SHIFT;
        vec.z = 0;
        WeatherDraw_SetSpriteMatrix(v0->unk4, &vec);
    }
}

static void ov01_021ECC70(WeatherObject *a0) {
    int i;
    s32 *data = a0->unk8;
    VecFx32 vec;
    vec = ov01_021EC304(a0);
    switch (data[3]) {
    case 0:
        for (i = 0; i < 2; i++) {
            vec.x += data[4] << FX32_SHIFT;
            vec.y += data[2] << FX32_SHIFT;

            if (data[0]++ > data[1]) {
                if (((u32)MTRandom() % 10) < 7) {
                    data[3] = 2;
                } else {
                    data[3] = 1;
                    data[0] = 4;
                    Sprite_SetAnimationFrame(a0->unk4, 3);
                }
            }
        }
        WeatherDraw_SetSpriteMatrix(a0->unk4, &vec);
        break;
    case 1:
        if (data[0]-- <= 0) {
            data[3] = 2;
        }
        break;
    case 2:
        WeatherObject_Delete(a0);
        break;
    }
}

static void ov01_021ECD08(SysTask *task, void *data) {
    WeatherSystem_Sub0_Sub8 *v0 = data;

    UnkStruct_021EC94C *v1 = v0->unkF58;

    switch (v0->unkF62) {
    case 0:
        ov01_021EC504(&v1->unk0, v0, 1, 30, 6, 3, -5, 2, 1, ov01_021ECF4C);

        ov01_021EC5FC(&v1->unk50, &v1->unk1C, v0->weatherSystem->fieldSystem->fog, GX_FOGSLOPE_0x1000, 0x726F, GX_RGB(24, 24, 24), 2, v0->unkF64);

        v1->data[0] = 8;
        v1->data[1] = 0;
        v0->unkF62 = 1;
        break;
    case 1:
        int v2 = ov01_021EC538(&v1->unk0);
        if (v1->data[0] > 0) {
            v1->data[0]--;
        } else {
            int v3 = ov01_021EC650(&v1->unk50, &v1->unk1C, v0->unkF64);
            if (v3 == 1 && v2 == 3) {
                v0->unkF62 = 3;
            }
        }
        break;
    case 2:
        ov01_021EC504(&v1->unk0, v0, 6, 3, 6, 3, -5, 2, 1, ov01_021ECF4C);

        if (v0->unkF64) {
            v1->unk1C.fog = v0->weatherSystem->fieldSystem->fog;
            ov01_021EC678(v1->unk1C.fog, GX_FOGSLOPE_0x1000, 0x726f, GX_RGB(24, 24, 24));
            ov01_021EC7C8(&v1->unk1C);
        }

        v1->data[1] = 0;

        ov01_021EC85C(v0, ov01_021ECF4C, 20, 2, 3, ov01_021ED070);

        v0->unkF62 = 3;
        break;
    case 3:
        if (v1->unk0.unk6-- <= 0) {
            ov01_021ECF4C(v0, v1->unk0.unk4);
            v1->unk0.unk6 = v1->unk0.unk8;
        }

        if (v0->unkF66 == 5) {
            ov01_021EC52C(&v1->unk0, 0, 30, 5, -3);

            if (v0->unkF64) {
                ov01_021EC790(&v1->unk1C, 1, 0);
            }
            v1->data[0] = 0;
            v0->unkF62 = 4;
        }
        break;
    case 4:
        int ret = ov01_021EC538(&v1->unk0);
        if (v1->data[0] > 0) {
            v1->data[0]--;
        } else {
            int vUnk;
            if (v0->unkF64) {
                vUnk = ov01_021EC7AC(&v1->unk1C);
            } else {
                vUnk = 1;
            }

            if (vUnk == 1 && ret == 3) {
                if (v0->linkedListDummy.next == &v0->linkedListDummy) {
                    v0->unkF62 = 5;
                }
            }
        }
        break;
    case 5:
        if (v0->unkF64) {
            Fog_Set(v1->unk1C.fog, 1, FALSE, GX_FOGBLEND_COLOR_ALPHA, GX_FOGSLOPE_0x8000, 0);
        }
        ov01_021EBCA4(v0->unk4);
        break;
    }

    if (v0->unkF62 != 5 && v0->unkF62 != 0) {
        ov01_021EC2E4(&v0->linkedListDummy, ov01_021ED070);
        ov01_021EC470(v0, NULL, NULL);
        ov01_021EC300(v0);
    }
}

static const ov01_0220674C[] = { 2, 2, 2, 2 };
static const ov01_0220673C[] = { 16, 32, 16, 10 };

static void ov01_021ECF4C(WeatherSystem_Sub0_Sub8 *a0, int a1) {
    int table0[4];
    table0 = ov01_0220673C;
    int table1[4];
    table1 = ov01_0220674C;
    UnkStruct_021EC94C *v0 = a0->unkF58;

    for (int i = 0; i < a1; i++) {
        WeatherObject *v1 = ov01_021EC1F4(a0, 32);
        if (v1 == NULL) {
            break;
        }

        s32 *data = v1->unk8;

        v0->data[1]++;
        if (v0->data[1] >= 800) {
            v0->data[1] = 0;
        }
        int index = v0->data[1] / 200;
        data[5] = table0[index];

        data[0] = 0;
        data[1] = 4 + (MTRandom() % 42);

        int frame = (data[1] - 4) / 15;
        Sprite_SetAnimationFrame(v1->unk4, frame);

        data[4] = -(frame + 1);
        data[2] = table1[index] * (frame + 1);
        data[3] = 0;

        VecFx32 vec = ov01_021EC304(v1);

        vec.x = -20 + (frame * 20) + (MTRandom() % 420);
        vec.y = -8;
        vec.z = 0;
        vec.x <<= FX32_SHIFT;
        vec.y <<= FX32_SHIFT;

        WeatherDraw_SetSpriteMatrix(v1->unk4, &vec);
    }
}

static void ov01_021ED070(WeatherObject *a0) {
    s32 *data = a0->unk8;
    VecFx32 vec = ov01_021EC304(a0);

    switch (data[3]) {
    case 0:
        vec.x += data[4] << FX32_SHIFT;
        vec.y += data[2] << FX32_SHIFT;

        if (data[0]++ > data[1]) {
            data[3] = 1;
        }

        if (data[0] % data[5] == 0) {
            data[4]--;

            if (data[2] > 1) {
                data[2]--;
            }
        }

        WeatherDraw_SetSpriteMatrix(a0->unk4, &vec);
        break;
    case 1:
        WeatherObject_Delete(a0);
        break;
    }
}

static void ov01_021ED0F0(SysTask *task, void *data) {
    WeatherSystem_Sub0_Sub8 *v0 = data;

    UnkStruct_021EC94C *v1 = v0->unkF58;

    switch (v0->unkF62) {
    case 0:
        ov01_021EC504(&v1->unk0, v0, 2, 16, 20, 2, -2, 4, 2, ov01_021ED31C);

        ov01_021EC5FC(&v1->unk50, &v1->unk1C, v0->weatherSystem->fieldSystem->fog, GX_FOGSLOPE_0x1000, 0x716F, GX_RGB(26, 26, 26), 1, v0->unkF64);

        v1->data[0] = 0;
        v0->unkF62 = 1;
        break;
    case 1:
        int v2 = ov01_021EC538(&v1->unk0);
        if (v1->data[0] > 0) {
            v1->data[0]--;
        } else {
            int v3 = ov01_021EC650(&v1->unk50, &v1->unk1C, v0->unkF64);
            if (v3 == 1 && v2 == 3) {
                v0->unkF62 = 3;
            }
        }
        break;
    case 2:
        ov01_021EC504(&v1->unk0, v0, 20, 2, 20, 2, -2, 4, 2, ov01_021ED31C);

        if (v0->unkF64) {
            v1->unk1C.fog = v0->weatherSystem->fieldSystem->fog;
            ov01_021EC678(v1->unk1C.fog, GX_FOGSLOPE_0x1000, 0x716f, GX_RGB(26, 26, 26));
            ov01_021EC7C8(&v1->unk1C);
        }

        ov01_021EC85C(v0, ov01_021ED31C, 20, 10, 1, ov01_021ED44C);

        v0->unkF62 = 3;
        break;
    case 3:
        if (v1->unk0.unk6-- <= 0) {
            ov01_021ED31C(v0, v1->unk0.unk4);
            v1->unk0.unk6 = v1->unk0.unk8;
        }

        if (v0->unkF66 == 5) {
            ov01_021EC52C(&v1->unk0, 0, 16, 6, -10);

            if (v0->unkF64) {
                ov01_021EC790(&v1->unk1C, 1, 0);
            }
            v1->data[0] = 20;
            v0->unkF62 = 4;
        }
        break;
    case 4:
        int ret = ov01_021EC538(&v1->unk0);
        if (v1->data[0] > 0) {
            v1->data[0]--;
        } else {
            int vUnk = ov01_021EC650(&v1->unk50, &v1->unk1C, v0->unkF64);

            if (vUnk == 1 && ret == 3) {
                if (v0->linkedListDummy.next == &v0->linkedListDummy) {
                    v0->unkF62 = 5;
                }
            }
        }
        break;
    case 5:
        if (v0->unkF64) {
            Fog_Set(v1->unk1C.fog, 1, FALSE, GX_FOGBLEND_COLOR_ALPHA, GX_FOGSLOPE_0x8000, 0);
        }
        ov01_021EBCA4(v0->unk4);
        break;
    }

    if (v0->unkF62 != 5 && v0->unkF62 != 0) {
        ov01_021EC2E4(&v0->linkedListDummy, ov01_021ED44C);
        ov01_021EC470(v0, NULL, NULL);
        ov01_021EC300(v0);
    }
}

static void ov01_021ED31C(WeatherSystem_Sub0_Sub8 *a0, int a1) {
    VecFx32 vec;
    for (int i = 0; i < a1; i++) {
        WeatherObject *v0 = ov01_021EC1F4(a0, 32);
        if (v0 == NULL) {
            break;
        }

        u32 *data = v0->unk8;

        data[0] = 0;
        data[1] = 7 + (MTRandom() % 5);

        int rand = MTRandom() % 1000;

        if ((rand % 2) == 0) {
            data[2] = 1;
        } else {
            data[2] = -1;
        }

        data[3] = 1;
        data[4] = 3 + (MTRandom() % 6);
        data[5] = 4 + (MTRandom() % 5);

        int frame = MTRandom() % 20;

        vec = ov01_021EC304(v0);
        vec.x = -64 + (MTRandom() % 384);
        vec.y = -8 + ((u32)MTRandom() % 256);
        vec.x <<= FX32_SHIFT;
        vec.y <<= FX32_SHIFT;
        vec.z = 0;
        WeatherDraw_SetSpriteMatrix(v0->unk4, &vec);
        vec.x >>= FX32_SHIFT;
        vec.y >>= FX32_SHIFT;

        int v1 = 50 - vec.x / 3;
        int v2 = 206 - vec.x / 3;
        int v3;
        if (v2 < 0) {
            v2 *= -1;
            v3 = v1 - (MTRandom() % v2);
        } else {
            v3 = v1 + (MTRandom() % v2);
        }

        if (v1 <= vec.y && v3 >= vec.y) {
            data[1] *= 2;
        } else {
            frame = MTRandom() & 3;
        }
        Sprite_SetAnimationFrame(v0->unk4, frame);
    }
}

static void ov01_021ED44C(WeatherObject *a0) {
    s32 *data = a0->unk8;
    ov01_021EC304(a0);
    if (++data[0] >= data[1]) {
        WeatherObject_Delete(a0);
    }
}

static void ov01_021ED474(WeatherSystem_Sub0_Sub8 *a0, UnkStruct_021ED474 *a1, GXFogSlope fogSlope, s32 arg3, GXRgb arg4, s32 arg5, s32 arg6) {
    switch (a0->unkF62) {
    case 0:
        ov01_021EC5FC(&a1->unk50, &a1->unk1C, a0->weatherSystem->fieldSystem->fog, fogSlope, arg3, arg4, arg5, a0->unkF64);
        a0->unkF62 = 1;
        break;
    case 1:
        int v3 = ov01_021EC650(&a1->unk50, &a1->unk1C, a0->unkF64);
        if (v3 == 1) {
            a0->unkF62 = 3;
        }
        break;
    case 2:
        if (a0->unkF64 != 0) {
            a1->unk1C.fog = a0->weatherSystem->fieldSystem->fog;
            ov01_021EC678(a1->unk1C.fog, fogSlope, arg3, arg4);
            ov01_021EC7C8(&a1->unk1C);
        }
        a0->unkF62 = 3;
        break;
    case 3:
        if (a0->unkF66 == 5) {
            if (a0->unkF64 != 0) {
                ov01_021EC790(&a1->unk1C, arg6, 0);
            }
            a0->unkF62 = 4;
        }
        break;
    case 4:
        int ret;
        if (a0->unkF64 != 0) {
            ret = ov01_021EC7AC(&a1->unk1C);
        } else {
            ret = 1;
        }

        if (ret == 1) {
            a0->unkF62 = 5;
        }
        break;
    case 5:
        if (a0->unkF64 != 0) {
            Fog_Set(a1->unk1C.fog, 1, FALSE, GX_FOGBLEND_COLOR_ALPHA, GX_FOGSLOPE_0x8000, 0);
        }
        ov01_021EBCA4(a0->unk4);
        break;
    }
}

static void ov01_021ED584(SysTask *task, void *data) {
    WeatherSystem_Sub0_Sub8 *v0 = data;
    UnkStruct_021ED584 *v1 = v0->unkF58;

    switch (v0->unkF62) {
    case 0:
        ov01_021EC5FC(&v1->unk50, &v1->unk1C, v0->weatherSystem->fieldSystem->fog, GX_FOGSLOPE_0x0200, 0x7555, 0x7fff, 1, v0->unkF64);
        ov01_021EB830(&v1->unk0, 0, 9, 30);
        ov01_021EB818(0, 16);
        GfGfx_EngineATogglePlanes(4, 1);
        v0->unkF62 = 1;
        break;
    case 1:
        int v2 = ov01_021EC7AC(&v1->unk1C);
        int v3 = ov01_021EB840(&v1->unk0);
        ov01_021EB818(v1->unk0.unk0, 16 - v1->unk0.unk0);
        if (v2 == 1 && v3 == 1) {
            v0->unkF62 = 3;
        }
        break;
    case 2:
        if (v0->unkF64 != 0) {
            v1->unk1C.fog = v0->weatherSystem->fieldSystem->fog;
            ov01_021EC678(v1->unk1C.fog, GX_FOGSLOPE_0x0200, 0x7555, 0x7fff);
            ov01_021EC7C8(&v1->unk1C);
        }
        ov01_021EB818(9, 7);
        GfGfx_EngineATogglePlanes(4, 1);
        v0->unkF62 = 3;
        break;
    case 3:
        if (v0->unkF66 == 5) {
            if (v0->unkF64 != 0) {
                ov01_021EC790(&v1->unk1C, 1, 0);
            }
            ov01_021EB830(&v1->unk0, 9, 0, 30);
            v0->unkF62 = 4;
        }
        break;
    case 4:
        int v4;
        if (v0->unkF64 != 0) {
            v4 = ov01_021EC7AC(&v1->unk1C);
        } else {
            v4 = 1;
        }

        int v5 = ov01_021EB840(&v1->unk0);
        ov01_021EB818(v1->unk0.unk0, 16 - v1->unk0.unk0);
        if (v4 == 1 && v5 == 1) {
            v0->unkF62 = 5;
        }
        break;
    case 5:
        if (v0->unkF64 != 0) {
            Fog_Set(v1->unk1C.fog, 1, FALSE, GX_FOGBLEND_COLOR_ALPHA, GX_FOGSLOPE_0x8000, 0);
        }
        ov01_021EBCA4(v0->unk4);
        break;
    }
}

static void ov01_021ED710(SysTask *task, void *data) {
    WeatherSystem_Sub0_Sub8 *v0 = data;
    WeatherSystem *weatherSystem = v0->weatherSystem;
    FieldSystem *fieldSystem = weatherSystem->fieldSystem;
    UnkStruct_021ED710 *v1 = v0->unkF58;

    switch (v0->unkF62) {
    case 0:
        v1->unk62C = ov01_02203EA0(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar));
        Fog_Set(fieldSystem->fog, -1, TRUE, GX_FOGBLEND_COLOR_ALPHA, GX_FOGSLOPE_0x0020, 0);
        ov01_021EA89C(fieldSystem->fog, -1, 0, 0);
        {
            s8 v2[32];
            for (int i = 0; i < 32; i++) {
                v2[i] = -1;
            }
            ov01_021EA8C4(fieldSystem->fog, v2);
        }
        v1->unk630 = 0;
        v0->unkF62 = 1;
        break;
    case 1:
        v0->unkF62 = 3;
        break;
    case 2:
        v1->unk62C = ov01_02203EA0(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar));
        Fog_Set(fieldSystem->fog, -1, TRUE, GX_FOGBLEND_COLOR_ALPHA, GX_FOGSLOPE_0x0020, 0);
        ov01_021EA89C(fieldSystem->fog, -1, 0, 0);
        {
            s8 v2[32];
            for (int i = 0; i < 32; i++) {
                v2[i] = -1;
            }
            ov01_021EA8C4(fieldSystem->fog, v2);
        }
        v1->unk630 = 0;
        v0->unkF62 = 3;
        break;
    case 3:
        if (v0->unkF66 == 5) {
            v1->unk632 = 0;
            v0->unkF62 = 4;
        }
        break;
    case 4:
        switch (v1->unk632) {
        case 0:
            BeginNormalPaletteFade(3, 0, 0, 0x7FFF, 6, 1, HEAP_ID_FIELD1);
            v1->unk632++;
            break;
        case 1:
            if (IsPaletteFadeFinished()) {
                BeginNormalPaletteFade(3, 1, 1, 0x7FFF, 6, 1, HEAP_ID_FIELD1);
                v1->unk632++;
            }
            break;
        case 2:
            if (IsPaletteFadeFinished()) {
                v1->unk632++;
            }
            break;
        case 3:
            v1->unk630++;
            float v3 = 1.0 + (v1->unk630 * 3.0) / 24.0;
            ov01_02203F2C(v1->unk62C, v3);
            if (v3 >= 4.0) {
                v0->unkF62 = 5;
            }
            break;
        }
        break;
    case 5:
        ov01_021EBCA4(v0->unk4);
        break;
    }
}

static void ov01_021ED924(SysTask *task, void *data) {
    WeatherSystem_Sub0_Sub8 *v0 = data;
    WeatherSystem *weatherSystem = v0->weatherSystem;
    FieldSystem *fieldSystem = weatherSystem->fieldSystem;
    UnkStruct_021ED710 *v1 = v0->unkF58;

    switch (v0->unkF62) {
    case 0:
        v1->unk62C = ov01_02203EA0(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar));
        Fog_Set(fieldSystem->fog, -1, TRUE, GX_FOGBLEND_COLOR_ALPHA, GX_FOGSLOPE_0x0020, 0);
        ov01_021EA89C(fieldSystem->fog, -1, 0, 0);
        {
            s8 v2[32];
            for (int i = 0; i < 32; i++) {
                v2[i] = -1;
            }
            ov01_021EA8C4(fieldSystem->fog, v2);
        }
        ov01_02203F2C(v1->unk62C, 4);
        v0->unkF62 = 1;
        break;
    case 1:
        v0->unkF62 = 3;
        break;
    case 2:
        v1->unk62C = ov01_02203EA0(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar));
        Fog_Set(fieldSystem->fog, -1, TRUE, GX_FOGBLEND_COLOR_ALPHA, GX_FOGSLOPE_0x0020, 0);
        ov01_021EA89C(fieldSystem->fog, -1, 0, 0);
        {
            s8 v2[32];
            for (int i = 0; i < 32; i++) {
                v2[i] = -1;
            }
            ov01_021EA8C4(fieldSystem->fog, v2);
        }
        ov01_02203F2C(v1->unk62C, 4);
        v0->unkF62 = 3;
        break;
    case 3:
        if (v0->unkF66 == 5) {
            v0->unkF62 = 4;
        }
        break;
    case 4:
        v0->unkF62 = 5;
        break;
    case 5:
        ov01_021EBCA4(v0->unk4);
        break;
    }
}

static void ov01_021EDA50(SysTask *task, void *data) {
    WeatherSystem_Sub0_Sub8 *v0 = data;
    ov01_021ED474(v0, v0->unkF58, GX_FOGSLOPE_0x4000, 0x4B6F, 0x421, 0, 0);
}

static void ov01_021EDA7C(SysTask *task, void *data) {
    WeatherSystem_Sub0_Sub8 *v0 = data;
    if (--v0->unkF68 <= 0) {
        ov01_021EDAB4(v0, SEQ_SE_DP_T_AME);
        SysTask_Destroy(task);
        v0->unkF6C = 0;
    }
}

static void ov01_021EDAB4(WeatherSystem_Sub0_Sub8 *a0, u32 sndSeq) {
    GF_ASSERT(a0->unkF5C == 0);

    a0->unkF5C = 1;
    a0->sndSeq = sndSeq;
    PlaySE(sndSeq);
}

static void ov01_021EDAE0(WeatherSystem_Sub0_Sub8 *arg0) {
    StopSE(arg0->sndSeq, 0);
    arg0->unkF5C = 0;
}
