#ifndef SPL_INTERNAL_H
#define SPL_INTERNAL_H

#include <nitro/gx/gxcommon.h>
#include <nitro/types.h>

#include "spl_emitter.h"
#include "spl_list.h"
#include "spl_manager.h"
#include "spl_particle.h"
#include "spl_resource.h"

#define GX_RGB_R(RGB) (((RGB) >> GX_RGB_R_SHIFT) & 31)
#define GX_RGB_G(RGB) (((RGB) >> GX_RGB_G_SHIFT) & 31)
#define GX_RGB_B(RGB) (((RGB) >> GX_RGB_B_SHIFT) & 31)

#define GX_RGB_R_(rgb) (rgb & GX_RGB_R_MASK)
#define GX_RGB_G_(rgb) (rgb & GX_RGB_G_MASK)
#define GX_RGB_B_(rgb) (rgb & GX_RGB_B_MASK)

void SPLDraw_Child_Billboard(SPLManager *mgr, SPLParticle *ptcl);
void SPLDraw_Child_DirectionalBillboard(SPLManager *mgr, SPLParticle *ptcl);
void SPLDraw_Child_Polygon(SPLManager *mgr, SPLParticle *ptcl);
void SPLDraw_Child_DirectionalPolygon(SPLManager *mgr, SPLParticle *ptcl);
void SPLDraw_Billboard(SPLManager *mgr, SPLParticle *ptcl);
void SPLDraw_DirectionalBillboard(SPLManager *mgr, SPLParticle *ptcl);
void SPLDraw_Polygon(SPLManager *mgr, SPLParticle *ptcl);
void SPLDraw_DirectionalPolygon(SPLManager *mgr, SPLParticle *ptcl);

void SPLAnim_Scale(SPLParticle *ptcl, SPLResource *res, int lifeRate);
void SPLAnim_Color(SPLParticle *ptcl, SPLResource *res, int lifeRate);
void SPLAnim_Alpha(SPLParticle *ptcl, SPLResource *res, int lifeRate);
void SPLAnim_Texture(SPLParticle *ptcl, SPLResource *res, int lifeRate);
void SPLAnim_ChildScale(SPLParticle *ptcl, SPLResource *res, int lifeRate);
void SPLAnim_ChildAlpha(SPLParticle *ptcl, SPLResource *res, int lifeRate);

void SPLEmitter_EmitParticles(SPLEmitter *emtr, SPLParticleList *list);
void SPLEmitter_EmitChildren(SPLParticle *ptcl, SPLEmitter *emtr, SPLParticleList *list);

void SPLEmitter_Update(SPLManager *mgr, SPLEmitter *emtr);
void SPLManager_DoDraw(SPLManager *mgr);
void SPLEmitter_Init(SPLEmitter *emtr, SPLResource *res, const VecFx32 *pos);
void SPLEmitter_Emit(SPLEmitter *emtr, SPLParticleList *list);

static inline void SPLParticleList_PushFront(SPLParticleList *list, SPLParticle *ptcl)
{
    SPLList_PushFront((SPLList *)list, (SPLNode *)ptcl);
}

static inline void SPLParticleList_PushBack(SPLParticleList *list, SPLParticle *ptcl)
{
    SPLList_PushBack((SPLList *)list, (SPLNode *)ptcl);
}

static inline SPLParticle *SPLParticleList_PopFront(SPLParticleList *list)
{
    return (SPLParticle *)SPLList_PopFront((SPLList *)list);
}

static inline SPLParticle *SPLParticleList_PopBack(SPLParticleList *list)
{
    return (SPLParticle *)SPLList_PopBack((SPLList *)list);
}

static inline SPLParticle *SPLParticleList_Erase(SPLParticleList *list, SPLParticle *ptcl)
{
    return (SPLParticle *)SPLList_Erase((SPLList *)list, (SPLNode *)ptcl);
}

static inline void SPLEmitterList_PushFront(SPLEmitterList *list, SPLEmitter *emtr)
{
    SPLList_PushFront((SPLList *)list, (SPLNode *)emtr);
}

static inline void SPLEmitterList_PushBack(SPLEmitterList *list, SPLEmitter *emtr)
{
    SPLList_PushBack((SPLList *)list, (SPLNode *)emtr);
}

static inline SPLEmitter *SPLEmitterList_PopFront(SPLEmitterList *list)
{
    return (SPLEmitter *)SPLList_PopFront((SPLList *)list);
}

static inline SPLEmitter *SPLEmitterList_PopBack(SPLEmitterList *list)
{
    return (SPLEmitter *)SPLList_PopBack((SPLList *)list);
}

static inline SPLEmitter *SPLEmitterList_Erase(SPLEmitterList *list, SPLEmitter *emtr)
{
    return (SPLEmitter *)SPLList_Erase((SPLList *)list, (SPLNode *)emtr);
}

#endif // SPL_INTERNAL_H
