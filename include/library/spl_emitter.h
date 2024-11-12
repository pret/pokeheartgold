#ifndef POKEHEARTGOLD_SPL_EMITTER_H
#define POKEHEARTGOLD_SPL_EMITTER_H

#include <nitro.h>

#include "spl_particle.h"
#include "spl_resource.h"

typedef struct SPLEmitterFlag {
    union {
        u32 all;
        struct {
            u32 terminate : 1;
            u32 stop_generate : 1;
            u32 stop_calc : 1;
            u32 stop_draw : 1;
            u32 started : 1;
            u32 reserved0 : 27;
        };
    };
} SPLEmitterFlag;

typedef struct SPLEmitter {
    struct SPLEmitter *p_next;     // 0
    struct SPLEmitter *p_prev;     // 4
    SPLParticleList act_ptcl_list; // 8
    SPLParticleList act_chld_list; // 14
    SPLResource *p_res;            // 20
    SPLEmitterFlag flag;           // 24
    VecFx32 emtr_pos;              // 28
    VecFx32 emtr_vel;              // 34
    VecFx32 emtr_init_vel;
    u16 age;
    fx16 gen_num_dec;
    VecFx16 axis;
    u16 init_rtt;
    fx32 gen_num;
    fx32 radius;
    fx32 length;
    fx32 init_vel_mag_pos;
    fx32 init_vel_mag_axis;
    fx32 base_scl;
    u16 ptcl_life;
    GXRgb clr;
    fx32 simple_collision_y;
    fx16 tex_s;
    fx16 tex_t;
    fx16 chld_tex_s;
    fx16 chld_tex_t;
    struct {
        u32 gen_intvl : 8;
        u32 base_alp : 8;
        u32 calc_cycle : 3;
        u32 reserved : 13;
    } etc;
    VecFx16 cross_to_axis_1;
    VecFx16 cross_to_axis_2;
    void (*callbackfunc)(struct SPLEmitter *, unsigned int uFlag);
    void *emtr_userdata;
    union {
        u32 uw_u32;
        u16 uw_u16[2];
        u8 uw_u8[4];
    } userwork;
} SPLEmitter;

typedef struct SPLEmitterList {
    SPLEmitter *p_begin;
    int node_num;
    SPLEmitter *p_end;
} SPLEmitterList;

static inline void SPL_SetEmitterPosition(SPLEmitter *p_emtr, const VecFx32 *p_pos) {
    p_emtr->emtr_pos.x = p_pos->x + p_emtr->p_res->p_base->pos.x;
    p_emtr->emtr_pos.y = p_pos->y + p_emtr->p_res->p_base->pos.y;
    p_emtr->emtr_pos.z = p_pos->z + p_emtr->p_res->p_base->pos.z;
}

static inline void SPL_SetEmitterPositionX(SPLEmitter *p_emtr, fx32 x) {
    p_emtr->emtr_pos.x = x + p_emtr->p_res->p_base->pos.x;
}

static inline void SPL_SetEmitterPositionY(SPLEmitter *p_emtr, fx32 y) {
    p_emtr->emtr_pos.y = y + p_emtr->p_res->p_base->pos.y;
}

static inline void SPL_SetEmitterPositionZ(SPLEmitter *p_emtr, fx32 z) {
    p_emtr->emtr_pos.z = z + p_emtr->p_res->p_base->pos.z;
}

static inline void SPL_SetEmitterAxis(SPLEmitter *p_emtr, const VecFx16 *axis) {
    p_emtr->axis = *axis;
}

#endif // POKEHEARTGOLD_SPL_EMITTER_H
