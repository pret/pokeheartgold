#ifndef SPL_EMITTER_H
#define SPL_EMITTER_H

#include <nitro/types.h>

#include "spl_particle.h"
#include "spl_resource.h"

enum SPLUpdateCallbackType {
    SPL_CALLBACK_PRE_UPDATE = 0,
    SPL_CALLBACK_POST_UPDATE = 1,
};

typedef void (*SPLEmitterUpdateCallback)(struct SPLEmitter *emitter, enum SPLUpdateCallbackType type);

typedef struct SPLEmitterState {
    union {
        u32 all;
        struct
        {
            u32 terminate : 1;
            u32 emissionPaused : 1;
            u32 paused : 1;
            u32 renderingDisabled : 1;
            u32 started : 1;
            u32 : 27;
        };
    };
} SPLEmitterState;

typedef struct SPLEmitter {
    struct SPLEmitter *next;
    struct SPLEmitter *prev;
    SPLParticleList particles;
    SPLParticleList childParticles;
    SPLResource *resource;
    SPLEmitterState state;
    VecFx32 position;
    VecFx32 velocity;
    VecFx32 particleInitVelocity;
    u16 age;
    fx16 emissionCountFractional; // fractional part of the number of particles to emit (doesn't seem to be used)
    VecFx16 axis;
    u16 initAngle;
    fx32 emissionCount;
    fx32 radius;
    fx32 length;
    fx32 initVelPositionAmplifier; // amplifies the initial velocity of the particles based on their position
    fx32 initVelAxisAmplifier; // amplifies the initial velocity of the particles based on the emitter's axis
    fx32 baseScale; // base scale of the particles
    u16 particleLifeTime;
    GXRgb color;
    fx32 collisionPlaneHeight;
    fx16 textureS;
    fx16 textureT;
    fx16 childTextureS;
    fx16 childTextureT;
    struct {
        u32 emissionInterval : 8; // number of frames between particle emissions
        u32 baseAlpha : 8;
        u32 updateCycle : 3; // 0 = every frame, 1 = cycle A, 2 = cycle B, cycles A and B alternate
        u32 reserved : 13;
    } misc;
    VecFx16 crossAxis1;
    VecFx16 crossAxis2;
    SPLEmitterUpdateCallback updateCallback;

    // Fields that the game can use for custom data
    void *userDataPtr;
    union {
        u32 u32;
        u16 u16[2];
        u8 u8[4];
    } userData;
} SPLEmitter;

typedef struct SPLEmitterList {
    SPLEmitter *first;
    int count;
    SPLEmitter *last;
} SPLEmitterList;

static inline void SPLEmitter_SetPos(SPLEmitter *emtr, const VecFx32 *position)
{
    emtr->position.x = position->x + emtr->resource->header->emitterBasePos.x;
    emtr->position.y = position->y + emtr->resource->header->emitterBasePos.y;
    emtr->position.z = position->z + emtr->resource->header->emitterBasePos.z;
}

static inline void SPLEmitter_SetPosX(SPLEmitter *emtr, fx32 x)
{
    emtr->position.x = x + emtr->resource->header->emitterBasePos.x;
}

static inline void SPLEmitter_SetPosY(SPLEmitter *emtr, fx32 y)
{
    emtr->position.y = y + emtr->resource->header->emitterBasePos.y;
}

static inline void SPLEmitter_SetPosZ(SPLEmitter *emtr, fx32 z)
{
    emtr->position.z = z + emtr->resource->header->emitterBasePos.z;
}

static inline void SPLEmitter_SetAxis(SPLEmitter *emtr, const VecFx16 *axis)
{
    emtr->axis = *axis;
}

#endif // SPL_EMITTER_H
