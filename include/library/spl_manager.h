#ifndef POKEHEARTGOLD_SPL_MANAGER_H
#define POKEHEARTGOLD_SPL_MANAGER_H

#include "spl_emitter.h"
#include "spl_texture.h"

typedef void *(*SPLAlloc)(u32);

typedef struct SPLManager {
    SPLAlloc alloc;
    SPLEmitterList act_emtr_list;
    SPLEmitterList ina_emtr_list;
    SPLParticleList ina_ptcl_list;
    SPLResource *res_ary;
    SPLTexture *tex_ary;
    u16 res_num;
    u16 tex_num;
    u16 max_emtr_num;
    u16 max_ptcl_num;
    struct {
        u32 min : 6;
        u32 max : 6;
        u32 current : 6;
        u32 fix : 6;
        u32 drawOrder : 1;
        u32 reserved : 7;
    } polygonID;
    s32 misc_flag;
    struct {
        SPLEmitter *p_emtr;
        const MtxFx43 *p_cmr;
    } current_state;
    u16 uCurrentCycle;
    u16 reserved;
} SPLManager;

#endif // POKEHEARTGOLD_SPL_MANAGER_H
