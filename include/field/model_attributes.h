#ifndef POKEHEARTGOLD_FIELD_MODEL_ATTRIBUTES_H
#define POKEHEARTGOLD_FIELD_MODEL_ATTRIBUTES_H

// GX_LIGHTS_COUNT == 4

#include "global.h"

typedef struct ModelAttributes {
    VecFx16 lightVectors[4];
    GXRgb lightColors[4];
    GXRgb diffuse;
    GXRgb ambient;
    GXRgb specular;
    GXRgb emission;
    BOOL setDiffuseColorAsVertexColor;
    BOOL enableSpecularReflectShininessTable;
    int lightMask;
    GXPolygonMode polygonMode;
    GXCull cullMode;
    int id;
    int alpha;
    int miscFlags;
} ModelAttributes;

ModelAttributes *ModelAttributes_Init();
void ModelAttributes_Free(ModelAttributes **modelAttributes);
void ModelAttributes_ApplyGlobal(ModelAttributes *modelAttributes, int attributes);
void ModelAttributes_SetPolygonMode(ModelAttributes *modelAttributes, GXPolygonMode polygonMode, BOOL applyGlobal);
void ModelAttributes_SetCullMode(ModelAttributes *modelAttributes, GXCull cullMode, BOOL applyGlobal);
void ModelAttributes_SetAlpha(ModelAttributes *modelAttributes, int alpha, BOOL applyGlobal);
void ModelAttributes_SetMiscAttrEnabled(ModelAttributes *modelAttributes, int miscFlagsMask, BOOL enable, BOOL applyGlobal);

#endif // POKEHEARTGOLD_FIELD_MODEL_ATTRIBUTES_H
