#ifndef POKEHEARTGOLD_POKEPIC_H
#define POKEHEARTGOLD_POKEPIC_H

#include "global.h"

#include "filesystem_files_def.h"
#include "heap.h"
#include "pokemon_types_def.h"

typedef enum PokepicAttr {
    POKEPIC_X,
    POKEPIC_Y,
    POKEPIC_Z,
    POKEPIC_XOFFSET,
    POKEPIC_YOFFSET,
    POKEPIC_ZOFFSET,
    POKEPIC_VANISHED,
    POKEPIC_XROT,
    POKEPIC_YROT,
    POKEPIC_ZROT,
    POKEPIC_XPIVOT,
    POKEPIC_YPIVOT,
    POKEPIC_AFFINEW,
    POKEPIC_AFFINEH,
    POKEPIC_VISIBLE,
    POKEPIC_XOFF2,
    POKEPIC_YOFF2,
    POKEPIC_W,
    POKEPIC_H,
    POKEPIC_SHADOW_X,
    POKEPIC_SHADOW_Y,
    POKEPIC_SHADOW_XOFFSET,
    POKEPIC_SHADOW_YOFFSET,
    POKEPIC_ALPHA,
    POKEPIC_DIFFUSE_R,
    POKEPIC_DIFFUSE_G,
    POKEPIC_DIFFUSE_B,
    POKEPIC_AMBIENT_R,
    POKEPIC_AMBIENT_G,
    POKEPIC_AMBIENT_B,
    POKEPIC_FADE,
    POKEPIC_FADE_COLOR,
    POKEPIC_FADE_BLDY,
    POKEPIC_FADE_BLDY_TARGET,
    POKEPIC_FADE_SPEED,
    POKEPIC_HFLIP,
    POKEPIC_VFLIP,
    POKEPIC_NODRAW,
    POKEPIC_ANIM_STEP,
    POKEPIC_39,
    POKEPIC_MOSAIC,
    POKEPIC_SHADOW_H,
    POKEPIC_SHADOW_PLTT,
    POKEPIC_SHADOW_XADJ_REQ,
    POKEPIC_SHADOW_YADJ_REQ,
    POKEPIC_SHADOW_AFFINE,
    POKEPIC_SHADOW_SIZE,
} PokepicAttr;

typedef struct PokepicAnimScript {
    s8 next;
    u8 duration;
    s8 xOffset;
    s8 unk_3;
} PokepicAnimScript;

typedef struct PokepicAnim {
    u8 active;
    u8 animStep;
    u8 animId;
    u8 stepDelay;
    u8 loopTimers[10];
    PokepicAnimScript *animScript;
} PokepicAnim;

typedef struct PokepicDrawParam {
    s16 xCenter;
    s16 yCenter;
    int zCenter;
    s16 xOffset;
    s16 yOffset;
    int zOffset;
    s16 affineWidth;
    s16 affineHeight;
    u16 rotX;
    u16 rotY;
    u16 rotZ;
    u16 unk_1A;
    s16 xPivot;
    s16 yPivot;
    u8 xOffset2;
    u8 yOffset2;
    u8 width;
    u8 height;
    u8 fadeCur;
    u8 fadeEnd;
    u8 fadeDelayCounter;
    u8 fadeDelayLength;
    u32 fadeTargetColor;
    u32 diffuseR : 5;
    u32 diffuseG : 5;
    u32 diffuseB : 5;
    u32 ambientR : 5;
    u32 ambientG : 5;
    u32 ambientB : 5;
    u32 filler_2C_30 : 2;
    u32 hasVanished : 1;
    u32 visible : 1;
    u32 alpha : 5;
    u32 unk_30_07 : 1;
    u32 unk_30_08 : 1;
    u32 hflip : 1;
    u32 vflip : 1;
    u32 dontDraw : 1;
    u32 fadeActive : 1;
    u32 mosaic : 4;
    u32 filler_30_11 : 15;
} PokepicDrawParam;

typedef struct PokepicShadow {
    u16 palSlot : 2;
    u16 shouldAdjustX : 1;
    u16 shouldAdjustY : 1;
    u16 isAffine : 1;
    u16 size : 2;
    u16 filler_0_7 : 9;
    s8 height;
    u8 filler_3[1];
    s16 x;
    s16 y;
    s16 xOffset;
    s16 yOffset;
} PokepicShadow;

struct Pokepic;

typedef void (*PokepicCallback)(struct Pokepic *, PokepicDrawParam *);

typedef struct Pokepic {
    u32 active : 1;
    u32 polygonId : 6;
    u32 needReloadChar : 1;
    u32 needReloadPltt : 1;
    u32 filler_00_09 : 23;
    PokepicTemplate template;
    PokepicTemplate templateBak;
    PokepicDrawParam drawParam;
    u8 animActive;
    u8 whichAnim;
    u8 animStepDelay;
    u8 whichAnimStep;
    u8 animLoopTimers[10];
    u8 filler_66[2];
    PokepicCallback callback;
    PokepicShadow shadow;
    PokepicShadow shadowBak;
    PokepicAnimScript animScript[10];
} Pokepic; // size: 0xAC

typedef struct PokepicManager {
    Pokepic pics[4];
    NNSG2dImageProxy imageProxy;
    NNSG2dImagePaletteProxy paletteProxy;
    HeapID heapId;
    u32 charBaseAddr;
    u32 charSize;
    u32 plttBaseAddr;
    u32 plttSize;
    u8 *charRawData;
    u16 *plttRawData;
    u16 *plttRawDataUnfaded;
    NNSG2dCharacterData charData;
    NNSG2dPaletteData plttData;
    u8 unread_330;
    u8 needLoadImage;
    u8 needLoadPltt;
    u8 needG3Identity;
    u32 flags;
} PokepicManager; // size: 0x338

// Allocates PokepicManager and auxiliary buffers
PokepicManager *PokepicManager_Create(HeapID heapId);

// Frame update pics
void PokepicManager_DrawAll(PokepicManager *pokepicManager);

// Releases buffers and the Manager itself to the heap
void PokepicManager_Delete(PokepicManager *pokepicManager);

// Sets Pokepic animation active
void Pokepic_StartAnim(Pokepic *pokepic);

// Copies the PokepicAnimScript to the Pokepic
void Pokepic_SetAnimScript(Pokepic *pokepic, PokepicAnimScript *animScript);

// Returns TRUE if the Pokepic animation is finished
BOOL Pokepic_IsAnimFinished(Pokepic *pokepic);

// Finds an empty Pokepic slot and creates a Pokepic there
Pokepic *PokepicManager_CreatePokepic(PokepicManager *pokepicManager, PokepicTemplate *template, int x, int y, int z, int polygonId, PokepicAnimScript *animScript, PokepicCallback callback);

// Initializes the Pokepic from arguments at the given position
Pokepic *PokepicManager_CreatePokepicAt(PokepicManager *pokepicManager, PokepicTemplate *template, int x, int y, int z, int polygonId, int picIndex, PokepicAnimScript *animScript, PokepicCallback callback);

// Sets the pic inactive
void Pokepic_Delete(Pokepic *pokepic);

// Sets all pics inactive
void PokepicManager_DeleteAllPics(PokepicManager *pokepicManager);

// Sets Pokepic attribute to value by index
void Pokepic_SetAttr(Pokepic *pokepic, int attr, int value);

// Returns the Pokepic attribute by index
int Pokepic_GetAttr(Pokepic *pokepic, int attr);

// Adds addend value to Pokepic attribute by index
void Pokepic_AddAttr(Pokepic *pokepic, int attr, int addend);

// Updates Pokepic dimensions and sets visible=TRUE
void Pokepic_SetVisible(Pokepic *pokepic, int x, int y, int width, int height);

// Starts palette fade for the specified Pokepic
void Pokepic_StartPaletteFade(Pokepic *pokepic, int start, int end, int framesPer, int targetColor);

// Starts palette fade for all pics managed by this manager
void Pokepic_StartPaletteFadeAll(PokepicManager *pokepicManager, int start, int end, int framesPer, int targetColor);

// Forces palette fade to resume if it had been paused
BOOL Pokepic_ResumePaletteFade(Pokepic *pokepic);

// The purpose of this routine is not clear
void sub_0200914C(Pokepic *pokepic, int y);

// Starts the PokepicAnim
void PokepicAnim_Init(PokepicAnim *anim, PokepicAnimScript *animScript);

// Runs one frame of the PokepicAnim, if active
int PokepicAnim_Exec(PokepicAnim *anim);

// Schedules pokepic load to VRAM
void Pokepic_ScheduleReloadFromNarc(Pokepic *pokepic);

// Backs up the pokepic draw data
void Pokepic_Push(Pokepic *pokepic);

// Restores the backed-up pokepic draw data and schedules load to VRAM
void Pokepic_Pop(Pokepic *pokepic);

// Sets the character load region for the PokepicManager
void PokepicManager_SetCharBaseAddrAndSize(PokepicManager *pokepicManager, int addr, int size);

// Sets the palette load region for the PokepicManager
void PokepicManager_SetPlttBaseAddrAndSize(PokepicManager *pokepicManager, int addr, int size);

// Returns a pointer to the Pokepic template
PokepicTemplate *Pokepic_GetTemplate(Pokepic *pokepic);

// Handles transfer of character and/or palette data from buffer if the corresponding request flags are set.
void PokepicManager_HandleLoadImgAndOrPltt(PokepicManager *pokepicManager);

// If needG3Identity is TRUE, the GPU will receive Identity instructions for each pic and shadow to be drawn.
void PokepicManager_SetNeedG3IdentityFlag(PokepicManager *pokepicManager, BOOL needG3Identity);

// Returns TRUE if the Pokepic active flag is TRUE.
BOOL Pokepic_IsActive(Pokepic *pokepic);

// Sets the specified bits of pokepicManager->flags. Only bit 0 appears to be used.
void PokepicManager_SetG3UpdateFlagsMask(PokepicManager *pokepicManager, u32 mask);

// Clears the specified bits of pokepicManager->flags. Only bit 0 appears to be used.
void PokepicManager_ResetG3UpdateFlagsMask(PokepicManager *pokepicManager, u32 mask);

// Updates the character data at pRawData with the Spinda spots based on PID. A second frame exists at x+=80 when isAnimated is TRUE.
void RawChardata_PlaceSpindaSpots(u8 *pRawData, u32 pid, BOOL isAnimated);

// Reverses the -scanXXX arguments passed to nitrogfx
void UnscanPokepic(u8 *pRawData, NarcId narcId);

#endif // POKEHEARTGOLD_POKEPIC_H
