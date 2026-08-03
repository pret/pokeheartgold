#ifndef POKEHEARTGOLD_FIELD_OVERLAY_01_021EAFD4_H
#define POKEHEARTGOLD_FIELD_OVERLAY_01_021EAFD4_H

#include "field_types_def.h"

#define MAX_TEXTURE_KEYS 16

typedef struct {
    char name[16];
    u8 animationData[18][2];
} TextureAnimationData;

typedef struct TextureSlot {
    u8 *textureData;
    int textureSize;
    NNSG3dResTex *textureResource;
    void *narcData;
    TextureAnimationData *animationData;
    u16 currentFrame;
    u16 frameCounter;
} TextureSlot;

typedef struct {
    u32 textureCount;
    TextureAnimationData animationData[0];
} TextureDataHeader;

struct FieldTextureManager {
    void *dataBuffer;
    TextureDataHeader *dataHeader;
    TextureSlot textureSlots[MAX_TEXTURE_KEYS];
    u32 unk188;
};

FieldTextureManager *FieldTextureManager_Init();
void FieldTextureManager_LoadTexture(FieldTextureManager *textureManager, NNSG3dResTex *textureResource);
void FieldTextureManager_Free(FieldTextureManager *textureManager);
void FieldTextureManager_FreeAllSlots(FieldTextureManager *textureManager);
void FieldTextureManager_Destroy(FieldTextureManager *textureManager);

#endif // POKEHEARTGOLD_FIELD_OVERLAY_01_021EAFD4_H
