#ifndef SPL_BEHAVIOR_H
#define SPL_BEHAVIOR_H

#include <nitro/types.h>

#include "spl_emitter.h"

#define SPL_SPIN_BEHAVIOR_AXIS_X 0
#define SPL_SPIN_BEHAVIOR_AXIS_Y 1
#define SPL_SPIN_BEHAVIOR_AXIS_Z 2

#define SPL_COLLISION_BEHAVIOR_TYPE_KILL   0 // Kills the particle when it collides with the plane
#define SPL_COLLISION_BEHAVIOR_TYPE_BOUNCE 1 // Bounces the particle off the plane

// Applies a gravity behavior to particles
typedef struct SPLGravityBehavior {
    VecFx16 magnitude;
    u16 padding;
} SPLGravityBehavior;

// Applies a random movement behavior to particles
typedef struct SPLRandomBehavior {
    VecFx16 magnitude;
    u16 applyInterval; // The interval, in frames, at which the random behavior is applied
} SPLRandomBehavior;

// Applies a magnetic force to particles
typedef struct SPLMagnetBehavior {
    VecFx32 target;
    fx16 force;
    u16 padding;
} SPLMagnetBehavior;

// Applies a rotational force to particles
typedef struct SPLSpinBehavior {
    u16 angle; // The angle of rotation, in "index" units, where 0x10000 is a full rotation. Applied every frame
    u16 axis; // The axis of rotation
} SPLSpinBehavior;

// Applies a collision behavior to particles
typedef struct SPLCollisionPlaneBehavior {
    fx32 y; // The Y position of the collision plane
    fx16 elasticity; // The elasticity of the collision, 1.0 being perfectly elastic and 0.0 being perfectly inelastic
    u16 collisionType : 2;
} SPLCollisionPlaneBehavior;

// Applies a convergence behavior to particles
// Similar to SPLMagnetBehavior, but it acts directly on the particle's position instead of its acceleration
typedef struct SPLConvergenceBehavior {
    VecFx32 target;
    fx16 force;
    u16 padding;
} SPLConvergenceBehavior;

void SPLBehavior_ApplyGravity(const void *obj, SPLParticle *ptcl, VecFx32 *acc, struct SPLEmitter *emtr);
void SPLBehavior_ApplyRandom(const void *obj, SPLParticle *ptcl, VecFx32 *acc, struct SPLEmitter *emtr);
void SPLBehavior_ApplyMagnet(const void *obj, SPLParticle *ptcl, VecFx32 *acc, struct SPLEmitter *emtr);
void SPLBehavior_ApplySpin(const void *obj, SPLParticle *ptcl, VecFx32 *acc, struct SPLEmitter *emtr);
void SPLBehavior_ApplyCollisionPlane(const void *obj, SPLParticle *ptcl, VecFx32 *acc, struct SPLEmitter *emtr);
void SPLBehavior_ApplyConvergence(const void *obj, SPLParticle *ptcl, VecFx32 *acc, struct SPLEmitter *emtr);

#endif // SPL_BEHAVIOR_H
