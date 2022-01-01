#ifndef POKEHEARTGOLD_CONSTANTS_STD_SCRIPT_H
#define POKEHEARTGOLD_CONSTANTS_STD_SCRIPT_H

#include "constants/trainers.h"

// The _std_XXX constants are group thresholds for
// use in fieldmap.c (sScriptBankMapping).
// The std_XXX constants (no leading underscore)
// are for use in event scripts.

#define _std_misc                       2000
#define std_signpost                    2000
#define std_nurse_joy                   2002
#define std_bag_is_full                 2009
#define std_wifi_club_closed            2025
#define std_play_friend_music           2029
#define std_fade_end_friend_music       2030
#define std_play_rival_intro_music      2031
#define std_give_item_verbose           2033
#define std_play_mom_music              2036
#define std_play_follow_music           2037
#define std_fade_end_mom_music          2038
#define std_phone_call                  2039
#define std_play_kimono_girl_music      2067
#define std_fade_end_kimono_girl_music  2068
#define std_play_rival_outro_music      2070
#define std_fade_end_rival_outro_music  2071

#define _std_bookshelves                2500

#define _std_apricorn_tree              2800

#define _std_npc_trainer                3000
#define std_trainer(trainer) ((trainer)-FIRST_TRAINER_INDEX+_std_npc_trainer)

#define _std_npc_trainer_2              5000
#define std_trainer_2(trainer) ((trainer)-FIRST_TRAINER_INDEX+_std_npc_trainer_2)

#define _std_hidden_item                8000

#define _std_chatot                     8900

#define _std_communication              9000
#define std_wireless_colosseum          9001
#define std_union_room                  9003
#define std_trainer_card_explain        9017

#define _std_dex_evaluation             9950
#define std_via_pc_evaluate_dex         9950
#define std_in_person_evaluate_dex      9951

#define _std_field_move                10000
#define std_field_cut                  10000
#define std_field_rock_smash           10001
#define std_field_strength             10002
#define std_field_rock_climb           10003
#define std_field_surf                 10004
#define std_field_waterfall            10005
#define std_field_flash                10006
#define std_menu_cut                   10007
#define std_menu_rock_smash            10008
#define std_menu_strength              10009
#define std_menu_rock_climb            10010
#define std_menu_surf                  10011
#define std_menu_waterfall             10012
#define std_menu_flash                 10013
#define std_field_headbutt             10014
#define std_boulder_fell_down          10015
#define std_field_whirlpool            10016
#define std_menu_whirlpool             10017
#define std_menu_headbutt              10018

#define _std_mystery_gift              10200
#define std_hide_show_deliverymen      10200
#define std_mystery_gift_deliveryman   10201
#define std_moms_gift_deliveryman      10202
#define std_hide_show_deliverymen_2    10203

#define _std_scratch_card              10490
#define std_scratch_card               10490

#endif //POKEHEARTGOLD_CONSTANTS_STD_SCRIPT_H
