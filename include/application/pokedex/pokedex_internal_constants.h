#ifndef GUARD_POKEHEARTGOLD_APPLICATION_POKEDEX_POKEDEX_INTERNAL_CONSTANTS_H
#define GUARD_POKEHEARTGOLD_APPLICATION_POKEDEX_POKEDEX_INTERNAL_CONSTANTS_H

#include "application/zukanlist/zkn_data/zukan_data.naix"

#define DEX_SEARCH_CRITERIA_SORT_ORDER 0
#define DEX_SEARCH_CRITERIA_LETTER     1
#define DEX_SEARCH_CRITERIA_TYPE1      2
#define DEX_SEARCH_CRITERIA_TYPE2      3
#define DEX_SEARCH_CRITERIA_HEIGHT_MIN 4
#define DEX_SEARCH_CRITERIA_HEIGHT_MAX 5
#define DEX_SEARCH_CRITERIA_WEIGHT_MIN 6
#define DEX_SEARCH_CRITERIA_WEIGHT_MAX 7
#define DEX_SEARCH_CRITERIA_AREA       8
#define DEX_SEARCH_CRITERIA_BODY_TYPE  9
#define DEX_SEARCH_CRITERIA_NUM        10

#define DEX_ORDER_NATIONAL     (NARC_zukan_data_sort_order_dex_order_national - NARC_zukan_data_sort_order_dex_order_national)
#define DEX_ORDER_JOHTO        (NARC_zukan_data_sort_order_dex_order_johto - NARC_zukan_data_sort_order_dex_order_national)
#define DEX_ORDER_ALPHABETICAL (NARC_zukan_data_sort_order_dex_order_alphabetical - NARC_zukan_data_sort_order_dex_order_national)
#define DEX_ORDER_HEAVIEST     (NARC_zukan_data_sort_order_dex_order_heaviest - NARC_zukan_data_sort_order_dex_order_national)
#define DEX_ORDER_LIGHTEST     (NARC_zukan_data_sort_order_dex_order_lightest - NARC_zukan_data_sort_order_dex_order_national)
#define DEX_ORDER_TALLEST      (NARC_zukan_data_sort_order_dex_order_tallest - NARC_zukan_data_sort_order_dex_order_national)
#define DEX_ORDER_SHORTEST     (NARC_zukan_data_sort_order_dex_order_shortest - NARC_zukan_data_sort_order_dex_order_national)
#define DEX_ORDER_QUIT         ((DEX_ORDER_SHORTEST) + 1)

#define DEX_SEARCH_LETTERS_A      (NARC_zukan_data_sort_order_letters_a - NARC_zukan_data_sort_order_letters_a)
#define DEX_SEARCH_LETTERS_B      (NARC_zukan_data_sort_order_letters_b - NARC_zukan_data_sort_order_letters_a)
#define DEX_SEARCH_LETTERS_C      (NARC_zukan_data_sort_order_letters_c - NARC_zukan_data_sort_order_letters_a)
#define DEX_SEARCH_LETTERS_D      (NARC_zukan_data_sort_order_letters_d - NARC_zukan_data_sort_order_letters_a)
#define DEX_SEARCH_LETTERS_E      (NARC_zukan_data_sort_order_letters_e - NARC_zukan_data_sort_order_letters_a)
#define DEX_SEARCH_LETTERS_F      (NARC_zukan_data_sort_order_letters_f - NARC_zukan_data_sort_order_letters_a)
#define DEX_SEARCH_LETTERS_G      (NARC_zukan_data_sort_order_letters_g - NARC_zukan_data_sort_order_letters_a)
#define DEX_SEARCH_LETTERS_H      (NARC_zukan_data_sort_order_letters_h - NARC_zukan_data_sort_order_letters_a)
#define DEX_SEARCH_LETTERS_I      (NARC_zukan_data_sort_order_letters_i - NARC_zukan_data_sort_order_letters_a)
#define DEX_SEARCH_LETTERS_J      (NARC_zukan_data_sort_order_letters_j - NARC_zukan_data_sort_order_letters_a)
#define DEX_SEARCH_LETTERS_K      (NARC_zukan_data_sort_order_letters_k - NARC_zukan_data_sort_order_letters_a)
#define DEX_SEARCH_LETTERS_L      (NARC_zukan_data_sort_order_letters_l - NARC_zukan_data_sort_order_letters_a)
#define DEX_SEARCH_LETTERS_M      (NARC_zukan_data_sort_order_letters_m - NARC_zukan_data_sort_order_letters_a)
#define DEX_SEARCH_LETTERS_N      (NARC_zukan_data_sort_order_letters_n - NARC_zukan_data_sort_order_letters_a)
#define DEX_SEARCH_LETTERS_O      (NARC_zukan_data_sort_order_letters_o - NARC_zukan_data_sort_order_letters_a)
#define DEX_SEARCH_LETTERS_P      (NARC_zukan_data_sort_order_letters_p - NARC_zukan_data_sort_order_letters_a)
#define DEX_SEARCH_LETTERS_Q      (NARC_zukan_data_sort_order_letters_q - NARC_zukan_data_sort_order_letters_a)
#define DEX_SEARCH_LETTERS_R      (NARC_zukan_data_sort_order_letters_r - NARC_zukan_data_sort_order_letters_a)
#define DEX_SEARCH_LETTERS_S      (NARC_zukan_data_sort_order_letters_s - NARC_zukan_data_sort_order_letters_a)
#define DEX_SEARCH_LETTERS_T      (NARC_zukan_data_sort_order_letters_t - NARC_zukan_data_sort_order_letters_a)
#define DEX_SEARCH_LETTERS_U      (NARC_zukan_data_sort_order_letters_u - NARC_zukan_data_sort_order_letters_a)
#define DEX_SEARCH_LETTERS_V      (NARC_zukan_data_sort_order_letters_v - NARC_zukan_data_sort_order_letters_a)
#define DEX_SEARCH_LETTERS_W      (NARC_zukan_data_sort_order_letters_w - NARC_zukan_data_sort_order_letters_a)
#define DEX_SEARCH_LETTERS_X      (NARC_zukan_data_sort_order_letters_x - NARC_zukan_data_sort_order_letters_a)
#define DEX_SEARCH_LETTERS_Y      (NARC_zukan_data_sort_order_letters_y - NARC_zukan_data_sort_order_letters_a)
#define DEX_SEARCH_LETTERS_Z      (NARC_zukan_data_sort_order_letters_z - NARC_zukan_data_sort_order_letters_a)
#define DEX_SEARCH_LETTERS_ALL    ((DEX_SEARCH_LETTERS_Z) + 1)
#define DEX_SEARCH_LETTERS_SUBMIT ((DEX_SEARCH_LETTERS_Z) + 2)
#define DEX_SEARCH_LETTERS_CANCEL ((DEX_SEARCH_LETTERS_Z) + 3)

#define DEX_SEARCH_TYPE_NORMAL   (NARC_zukan_data_sort_order_types_normal - NARC_zukan_data_sort_order_types_normal)
#define DEX_SEARCH_TYPE_FIGHTING (NARC_zukan_data_sort_order_types_fighting - NARC_zukan_data_sort_order_types_normal)
#define DEX_SEARCH_TYPE_FLYING   (NARC_zukan_data_sort_order_types_flying - NARC_zukan_data_sort_order_types_normal)
#define DEX_SEARCH_TYPE_POISON   (NARC_zukan_data_sort_order_types_poison - NARC_zukan_data_sort_order_types_normal)
#define DEX_SEARCH_TYPE_GROUND   (NARC_zukan_data_sort_order_types_ground - NARC_zukan_data_sort_order_types_normal)
#define DEX_SEARCH_TYPE_ROCK     (NARC_zukan_data_sort_order_types_rock - NARC_zukan_data_sort_order_types_normal)
#define DEX_SEARCH_TYPE_BUG      (NARC_zukan_data_sort_order_types_bug - NARC_zukan_data_sort_order_types_normal)
#define DEX_SEARCH_TYPE_GHOST    (NARC_zukan_data_sort_order_types_ghost - NARC_zukan_data_sort_order_types_normal)
#define DEX_SEARCH_TYPE_STEEL    (NARC_zukan_data_sort_order_types_steel - NARC_zukan_data_sort_order_types_normal)
#define DEX_SEARCH_TYPE_FIRE     (NARC_zukan_data_sort_order_types_fire - NARC_zukan_data_sort_order_types_normal)
#define DEX_SEARCH_TYPE_WATER    (NARC_zukan_data_sort_order_types_water - NARC_zukan_data_sort_order_types_normal)
#define DEX_SEARCH_TYPE_GRASS    (NARC_zukan_data_sort_order_types_grass - NARC_zukan_data_sort_order_types_normal)
#define DEX_SEARCH_TYPE_ELECTRIC (NARC_zukan_data_sort_order_types_electric - NARC_zukan_data_sort_order_types_normal)
#define DEX_SEARCH_TYPE_PSYCHIC  (NARC_zukan_data_sort_order_types_psychic - NARC_zukan_data_sort_order_types_normal)
#define DEX_SEARCH_TYPE_ICE      (NARC_zukan_data_sort_order_types_ice - NARC_zukan_data_sort_order_types_normal)
#define DEX_SEARCH_TYPE_DRAGON   (NARC_zukan_data_sort_order_types_dragon - NARC_zukan_data_sort_order_types_normal)
#define DEX_SEARCH_TYPE_DARK     (NARC_zukan_data_sort_order_types_dark - NARC_zukan_data_sort_order_types_normal)
#define DEX_SEARCH_TYPE_ALL      ((DEX_SEARCH_TYPE_DARK) + 1)
#define DEX_SEARCH_TYPE_SUBMIT   ((DEX_SEARCH_TYPE_DARK) + 2)
#define DEX_SEARCH_TYPE_CANCEL   ((DEX_SEARCH_TYPE_DARK) + 3)

#define DEX_SEARCH_BODYTYPE_QUADRUPED        (NARC_zukan_data_sort_order_body_style_quadruped - NARC_zukan_data_sort_order_body_style_quadruped)
#define DEX_SEARCH_BODYTYPE_BIPEDAL_TAILLESS (NARC_zukan_data_sort_order_body_style_bipedal_tailless - NARC_zukan_data_sort_order_body_style_quadruped)
#define DEX_SEARCH_BODYTYPE_BIPEDAL_TAIL     (NARC_zukan_data_sort_order_body_style_bipedal_tail - NARC_zukan_data_sort_order_body_style_quadruped)
#define DEX_SEARCH_BODYTYPE_SERPENTINE       (NARC_zukan_data_sort_order_body_style_serpentine - NARC_zukan_data_sort_order_body_style_quadruped)
#define DEX_SEARCH_BODYTYPE_MULTIWING        (NARC_zukan_data_sort_order_body_style_multiwing - NARC_zukan_data_sort_order_body_style_quadruped)
#define DEX_SEARCH_BODYTYPE_BIWING           (NARC_zukan_data_sort_order_body_style_biwing - NARC_zukan_data_sort_order_body_style_quadruped)
#define DEX_SEARCH_BODYTYPE_INSECTOID        (NARC_zukan_data_sort_order_body_style_insectoid - NARC_zukan_data_sort_order_body_style_quadruped)
#define DEX_SEARCH_BODYTYPE_HEAD_TORSO       (NARC_zukan_data_sort_order_body_style_head_torso - NARC_zukan_data_sort_order_body_style_quadruped)
#define DEX_SEARCH_BODYTYPE_HEAD_ARMS        (NARC_zukan_data_sort_order_body_style_head_arms - NARC_zukan_data_sort_order_body_style_quadruped)
#define DEX_SEARCH_BODYTYPE_HEAD_LEGS        (NARC_zukan_data_sort_order_body_style_head_legs - NARC_zukan_data_sort_order_body_style_quadruped)
#define DEX_SEARCH_BODYTYPE_TENTACLES        (NARC_zukan_data_sort_order_body_style_tentacles - NARC_zukan_data_sort_order_body_style_quadruped)
#define DEX_SEARCH_BODYTYPE_FINS             (NARC_zukan_data_sort_order_body_style_fins - NARC_zukan_data_sort_order_body_style_quadruped)
#define DEX_SEARCH_BODYTYPE_HEAD_ONLY        (NARC_zukan_data_sort_order_body_style_head_only - NARC_zukan_data_sort_order_body_style_quadruped)
#define DEX_SEARCH_BODYTYPE_MULTIBODY        (NARC_zukan_data_sort_order_body_style_multibody - NARC_zukan_data_sort_order_body_style_quadruped)
#define DEX_SEARCH_BODYTYPE_ALL              ((DEX_SEARCH_BODYTYPE_MULTIBODY) + 1)
#define DEX_SEARCH_BODYTYPE_SUBMIT           ((DEX_SEARCH_BODYTYPE_MULTIBODY) + 2)
#define DEX_SEARCH_BODYTYPE_CANCEL           ((DEX_SEARCH_BODYTYPE_MULTIBODY) + 3)

#define DEX_SEARCH_LETTERGROUP_ABC (NARC_zukan_data_sort_order_letter_groups_abc - NARC_zukan_data_sort_order_letter_groups_abc)
#define DEX_SEARCH_LETTERGROUP_DEF (NARC_zukan_data_sort_order_letter_groups_def - NARC_zukan_data_sort_order_letter_groups_abc)
#define DEX_SEARCH_LETTERGROUP_GHI (NARC_zukan_data_sort_order_letter_groups_ghi - NARC_zukan_data_sort_order_letter_groups_abc)
#define DEX_SEARCH_LETTERGROUP_JKL (NARC_zukan_data_sort_order_letter_groups_jkl - NARC_zukan_data_sort_order_letter_groups_abc)
#define DEX_SEARCH_LETTERGROUP_MNO (NARC_zukan_data_sort_order_letter_groups_mno - NARC_zukan_data_sort_order_letter_groups_abc)
#define DEX_SEARCH_LETTERGROUP_PQR (NARC_zukan_data_sort_order_letter_groups_pqr - NARC_zukan_data_sort_order_letter_groups_abc)
#define DEX_SEARCH_LETTERGROUP_STU (NARC_zukan_data_sort_order_letter_groups_stu - NARC_zukan_data_sort_order_letter_groups_abc)
#define DEX_SEARCH_LETTERGROUP_VWX (NARC_zukan_data_sort_order_letter_groups_vwx - NARC_zukan_data_sort_order_letter_groups_abc)
#define DEX_SEARCH_LETTERGROUP_YZ  (NARC_zukan_data_sort_order_letter_groups_yz - NARC_zukan_data_sort_order_letter_groups_abc)

#define DEX_SEARCH_AREA_UNKNOWN 0
#define DEX_SEARCH_AREA_JOHTO   1
#define DEX_SEARCH_AREA_KANTO   2
#define DEX_SEARCH_AREA_ALL     (DEX_SEARCH_AREA_KANTO + 1)
#define DEX_SEARCH_AREA_SUBMIT  (DEX_SEARCH_AREA_KANTO + 2)
#define DEX_SEARCH_AREA_CANCEL  (DEX_SEARCH_AREA_KANTO + 3)

#endif // GUARD_POKEHEARTGOLD_APPLICATION_POKEDEX_POKEDEX_INTERNAL_CONSTANTS_H
