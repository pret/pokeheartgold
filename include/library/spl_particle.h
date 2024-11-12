#ifndef POKEHEARTGOLD_SPL_PARTICLE_H
#define POKEHEARTGOLD_SPL_PARTICLE_H

#include <nitro/fx.h>
#include <nitro/gx.h>

typedef struct SPLParticle {
    struct SPLParticle *p_next;
    struct SPLParticle *p_prev;
    VecFx32 ptcl_pos;
    VecFx32 vel;
    u16 rtt;
    s16 rtt_vel;
    u16 life;
    u16 age;
    u16 life_rate_diff_loop;
    u16 life_rate_diff_noloop;
    struct {
        u16 tex_no : 8;
        u16 life_rate_offset : 8;
    } etc;
    struct {
        u16 base_alp : 5;
        u16 anm_alp : 5;
        u16 current_polygonID : 6;
    } alp;
    fx32 base_scl;
    fx16 anm_scl;
    GXRgb clr;
    VecFx32 emtr_pos;
} SPLParticle;

typedef struct SPLParticleList {
    SPLParticle *p_begin;
    int node_num;
    SPLParticle *p_end;
} SPLParticleList;

#endif // POKEHEARTGOLD_SPL_PARTICLE_H
