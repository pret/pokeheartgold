#ifndef POKEHEARTGOLD_FIELD_WEATHER_MANAGER_H
#define POKEHEARTGOLD_FIELD_WEATHER_MANAGER_H

#include "global.h"

#include "field/fog.h"

#include "sprite.h"
#include "task.h"

enum WeatherSystemProcess {
    WEATHER_SYS_PROC_INIT = 0,
};

typedef struct WeatherSpriteResources {
    SpriteResource *charResObj[4];
    SpriteTemplate spriteTemplate;
    SpriteResourcesHeader spriteResHeader;
} WeatherSpriteResources;

typedef struct WeatherGfxNarcData {
    u32 paletteId;
    u32 charId;
    u32 screenId;
} WeatherGfxNarcData;

typedef struct WeatherDraw {
    GF_2DGfxResMan *resMan[4];
    GF_2DGfxResHeader *header;
    NNSG2dRendererInstance instance;
    NNSG2dRenderSurface surface;
    SpriteList *spriteList;
    SysTask *task;
} WeatherDraw;

typedef struct UnkWeatherStruct_021EC078 {
    void *unk0;
    void *unk4;
    void *unk8;
    NNSG2dScreenData *unkC;
    NNSG2dCharacterData *unk10;
    NNSG2dPaletteData *unk14;
} UnkWeatherStruct_021EC078;

typedef struct WeatherSystem WeatherSystem;
typedef struct WeatherSystem_Sub0 WeatherSystem_Sub0;
typedef struct WeatherSystem_Sub0_Sub8 WeatherSystem_Sub0_Sub8;
typedef struct WeatherObject WeatherObject;
struct WeatherObject {
    WeatherSystem *weatherSystem;
    Sprite *unk4;
    u32 *unk8;
    u32 unk10[10];
    WeatherObject *next;
    WeatherObject *prev;
};

typedef struct UnkStruct_ov01_021EB1E8 {
    u8 unk0[0x188];
    u32 unk188;
} UnkStruct_ov01_021EB1E8;

typedef struct WeatherManager {
    WeatherSystem *weatherSystem;
    u32 weather;
    u32 nextWeather;
    u32 state;
    u32 unk10;
    SysTask *task;
} WeatherManager;

typedef struct UnkWeatherStruct_021EB830 {
    u32 unk0;
    u32 unk4;
    u32 unk8;
    int unkC;
    int unk10;
} UnkWeatherStruct_021EB830;
typedef void (*UnkWeatherSystemSub0Sub8Func)(WeatherSystem_Sub0_Sub8 *, int);
typedef struct UnkStruct_021EC504 {
    WeatherSystem_Sub0_Sub8 *unk0;
    s16 unk4;
    s16 unk6;
    s16 unk8;
    s16 unkA;
    s16 unkC;
    s16 unkE;
    s16 unk10;
    s16 unk12;
    s32 unk14;
    UnkWeatherSystemSub0Sub8Func unk18;
} UnkStruct_021EC504;

typedef void (*UnkLinkedListFunc)(WeatherObject *);

typedef struct WeatherFogChange {
    FogData *fog;
    UnkWeatherStruct_021EB830 unk4;
    UnkWeatherStruct_021EB830 unk18;
    UnkWeatherStruct_021EB830 unk2C;
    UnkWeatherStruct_021EB830 unk40;
    UnkWeatherStruct_021EB830 unk54;
} WeatherFogChange;

typedef struct UnkStruct_021EC774 {
    FogData *fog;
    u8 unk4[0x20];
    s32 unk24;
    s32 unk28;
    s16 unk2C;
    s16 unk2E;
} UnkStruct_021EC774;

typedef struct UnkStruct_021EC94C {
    UnkStruct_021EC504 unk0;
    UnkStruct_021EC774 unk1C;
    WeatherFogChange unk50;
    s32 data[10];
} UnkStruct_021EC94C;

typedef struct UnkStruct_021ED474 {
    UnkStruct_021EC774 unk1C;
    WeatherFogChange unk50;
    s32 data[10];
} UnkStruct_021ED474;

typedef struct UnkStruct_021ED584 {
    UnkWeatherStruct_021EB830 unk0;
    UnkStruct_021EC774 unk1C;
    WeatherFogChange unk50;
} UnkStruct_021ED584;

typedef struct UnkStruct_021ED710_Sub_Sub4 {
    fx32 unk0;
    fx32 unk4;
    fx32 unk8;
    s16 unkC;
    s16 unkE;
} UnkStruct_021ED710_Sub_Sub4;

typedef struct UnkStruct_021ED710_Sub {
    s16 x;
    s16 z;
    UnkStruct_021ED710_Sub_Sub4 unk4;
    void *unk14;
    void *unk18;
    void *unk1C[2];
    SysTask *task;
    u32 unk2C;
    u16 unk30[4][192];
} UnkStruct_021ED710_Sub;

typedef struct UnkStruct_021ED710 {
    UnkStruct_021ED710_Sub unk0;
    void *unk62C;
    u16 unk630;
    u16 unk632;
} UnkStruct_021ED710;

void ov01_021EB1E8(UnkStruct_ov01_021EB1E8 *a0);
WeatherManager *WeatherManager_New(FieldSystem *fieldSystem);
void WeatherManager_Delete(WeatherManager *weatherManager);
void WeatherManager_SetWeather(WeatherManager *weatherManager, int a1);
BOOL WeatherManager_ChangeWeather(WeatherManager *weatherManager, s32 weather);
u32 WeatherManager_GetWeather(WeatherManager *weatherManager);

#endif // POKEHEARTGOLD_FIELD_WEATHER_MANAGER_H
