#ifndef POKEHEARTGOLD_SPL_RESOURCE_H
#define POKEHEARTGOLD_SPL_RESOURCE_H

#include "spl_field.h"

#define SPL_MAX_TEX_PTN_NUM 8

typedef union {
    u32 all;
    struct {
        u32 init_pos_type : 4;
        u32 draw_type : 2;
        u32 circle_axis : 2;
        u32 use_scl_anm : 1;
        u32 use_clr_anm : 1;
        u32 use_alp_anm : 1;
        u32 use_tex_anm : 1;
        u32 use_rtt_anm : 1;
        u32 use_init_rtt_rndm : 1;
        u32 self_dest : 1;
        u32 follow_emtr : 1;
        u32 use_chld : 1;
        u32 pol_rot_axis : 2;
        u32 pol_baseplane : 1;
        u32 ptcl_random_loop_anm : 1;
        u32 draw_child_first : 1;
        u32 draw_parent : 1;
        u32 camera_offset : 1;
        u32 use_fld_grvt : 1;
        u32 use_fld_rndm : 1;
        u32 use_fld_mgnt : 1;
        u32 use_fld_spin : 1;
        u32 use_fld_scfld : 1;
        u32 use_fld_cngc : 1;
        u32 polygonID_fixed : 1;
        u32 child_polygonID_fixed : 1;
    };
} SPLResBaseFlag;

typedef union {
    u16 all;
    struct {
        u16 in : 8;
        u16 out : 8;
    };
} SPLResInOut;

typedef union {
    u32 all;
    struct {
        u32 in : 8;
        u32 peak : 8;
        u32 out : 8;
        u32 reserved : 8;
    };
} SPLResInPeakOut;

typedef struct SPLResBase {
    SPLResBaseFlag flag;
    VecFx32 pos;
    fx32 gen_num;
    fx32 radius;
    fx32 length;
    VecFx16 axis;
    GXRgb clr_n;
    fx32 init_vel_mag_pos;
    fx32 init_vel_mag_axis;
    fx32 base_scl;
    fx16 aspect;
    u16 start_offset;
    s16 rtt_min;
    s16 rtt_max;
    u16 init_rtt;
    u16 reserved0;
    u16 emtr_life;
    u16 ptcl_life;
    struct {
        u32 base_scl : 8;
        u32 ptcl_life : 8;
        u32 init_vel_mag : 8;
        u32 reserved0 : 8;
    } rndm;
    struct {
        u32 gen_intvl : 8;
        u32 base_alp : 8;
        u32 air_resist : 8;
        u32 tex_no : 8;
        u32 loop_frame : 8;
        u32 dbb_scale : 16;
        u32 tex_repeat_num_s : 2;
        u32 tex_repeat_num_t : 2;
        u32 scl_anm_direct : 3;
        u32 dpol_center : 1;
        u32 reverse_tex_s : 1;
        u32 reverse_tex_t : 1;
        u32 offset_pos : 3;
        u32 reserved1 : 27;
    } etc;
    fx16 offset_x;
    fx16 offset_y;
    struct {
        u32 flag : 8;
        u32 reserved : 24;
    } usr;
} SPLResBase;

typedef struct SPLResSclAnm {
    fx16 scl_s;
    fx16 scl_n;
    fx16 scl_e;
    SPLResInOut in_out;
    struct {
        u16 loop : 1;
        u16 reserved : 15;
    } etc;
    u16 reserved0;
} SPLResSclAnm;

typedef struct SPLResClrAnm {
    GXRgb clr_s;
    GXRgb clr_e;
    SPLResInPeakOut in_peak_out;
    struct {
        u16 use_rndm : 1;
        u16 loop : 1;
        u16 interpolation : 1;
        u16 reserved0 : 13;
    } etc;
    u16 reserved0;
} SPLResClrAnm;

typedef struct SPLResAlpAnm {
    union {
        u16 all;
        struct {
            u16 s : 5;
            u16 n : 5;
            u16 e : 5;
            u16 reserved0 : 1;
        };
    } alp;
    struct {
        u16 flick : 8;
        u16 loop : 1;
        u16 reserved0 : 7;
    } etc;
    SPLResInOut in_out;
    u16 reserved0;
} SPLResAlpAnm;

typedef struct SPLResTexAnm {
    u8 tex_no[SPL_MAX_TEX_PTN_NUM];
    struct {
        u32 use_num : 8;
        u32 diff : 8;
        u32 use_rndm : 1;
        u32 loop : 1;
        u32 reserved0 : 14;
    } etc;
} SPLResTexAnm;

typedef union {
    u16 all;
    struct {
        u16 affect_fld : 1;
        u16 use_scl_anm : 1;
        u16 use_alp_anm : 1;
        u16 rtt_type : 2;
        u16 follow_emtr : 1;
        u16 use_chld_clr : 1;
        u16 draw_type : 2;
        u16 pol_rot_axis : 2;
        u16 pol_baseplane : 1;
        u16 reserved0 : 4;
    };
} SPLResChldFlag;

typedef struct SPLResChld {
    SPLResChldFlag flag;
    fx16 init_vel_mag_rndm;
    fx16 scl_e;
    u16 life;
    struct {
        u16 vel_ratio : 8;
        u16 scl_ratio : 8;
    } ratio;
    GXRgb clr;
    struct {
        u32 gen_num : 8;
        u32 gen_start : 8;
        u32 gen_intvl : 8;
        u32 tex_no : 8;
        u32 tex_repeat_num_s : 2;
        u32 tex_repeat_num_t : 2;
        u32 reverse_tex_s : 1;
        u32 reverse_tex_t : 1;
        u32 dpol_center : 1;
        u32 reserved0 : 25;
    } etc;
} SPLResChld;

typedef struct SPLResource {
    SPLResBase *p_base;
    SPLResSclAnm *p_scl_anm;
    SPLResClrAnm *p_clr_anm;
    SPLResAlpAnm *p_alp_anm;
    SPLResTexAnm *p_tex_anm;
    SPLResChld *p_chld;
    SPLField *fld_ary;
    u16 fld_num;
    u16 reserved;
} SPLResource;

#endif // POKEHEARTGOLD_SPL_RESOURCE_H
