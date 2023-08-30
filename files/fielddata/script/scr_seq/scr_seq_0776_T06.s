#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T06.h"
#include "msgdata/msg/msg_0483_T06.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T06_000
	scrdef scr_seq_T06_001
	scrdef scr_seq_T06_002
	scrdef scr_seq_T06_003
	scrdef scr_seq_T06_004
	scrdef scr_seq_T06_005
	scrdef scr_seq_T06_006
	scrdef scr_seq_T06_007
	scrdef scr_seq_T06_008
	scrdef scr_seq_T06_009
	scrdef scr_seq_T06_010
	scrdef scr_seq_T06_011
	scrdef scr_seq_T06_012
	scrdef scr_seq_T06_013
	scrdef_end

scr_seq_T06_009:
	goto_if_unset FLAG_UNK_189, _004B
	clearflag FLAG_UNK_189
	end

_004B:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 4
	goto_if_ne _0066
	clearflag FLAG_HIDE_CAMERON
	goto _0081

_0066:
	compare VAR_TEMP_x4000, 0
	goto_if_ne _007D
	clearflag FLAG_HIDE_CAMERON
	goto _0081

_007D:
	setflag FLAG_HIDE_CAMERON
_0081:
	setvar VAR_UNK_4085, 0
	end

scr_seq_T06_013:
	scrcmd_609
	lockall
	apply_movement obj_T06_daigo, _016C
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_player, _0190
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	npc_msg msg_0483_T06_00016
	closemsg
	apply_movement obj_T06_daigo, _0180
	wait_movement
	get_game_version VAR_TEMP_x4004
	compare VAR_TEMP_x4004, 8
	goto_if_eq _0109
	scrcmd_452 SPECIES_LATIAS, 1
	npc_msg msg_0483_T06_00017
	closemsg
	create_roamer 2
	scrcmd_453
	apply_movement obj_T06_daigo, _0180
	wait_movement
	npc_msg msg_0483_T06_00019
	closemsg
	apply_movement obj_T06_daigo, _0180
	wait_movement
	npc_msg msg_0483_T06_00021
	closemsg
	goto _013F
	.byte 0x02, 0x00
_0109:
	scrcmd_452 SPECIES_LATIOS, 0
	npc_msg msg_0483_T06_00018
	closemsg
	create_roamer 3
	scrcmd_453
	apply_movement obj_T06_daigo, _0180
	wait_movement
	npc_msg msg_0483_T06_00020
	closemsg
	apply_movement obj_T06_daigo, _0180
	wait_movement
	npc_msg msg_0483_T06_00022
	closemsg
	goto _013F
	.byte 0x02, 0x00
_013F:
	apply_movement obj_T06_daigo, _0180
	wait_movement
	npc_msg msg_0483_T06_00023
	closemsg
	apply_movement obj_T06_daigo, _0188
	wait_movement
	setvar VAR_UNK_4130, 2
	hide_person obj_T06_daigo
	setflag FLAG_HIDE_VERMILION_CITY_STEVEN
	releaseall
	end
	.byte 0x00, 0x00

_016C:
	step 75, 1
	step 63, 1
	step 14, 4
	step 34, 1
	step_end

_0180:
	step 34, 1
	step_end

_0188:
	step 15, 10
	step_end

_0190:
	step 65, 4
	step 13, 1
	step 35, 1
	step_end
scr_seq_T06_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_491 247
	goto_if_set FLAG_GOT_PP_MAX_FROM_VERMILLION_CITY_MAN, _01FF
	compare VAR_UNK_4135, 8
	goto_if_ge _020A
	compare VAR_UNK_4135, 5
	goto_if_ge _01F4
	compare VAR_UNK_4135, 1
	goto_if_ge _01E9
	npc_msg msg_0483_T06_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_01E9:
	npc_msg msg_0483_T06_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_01F4:
	npc_msg msg_0483_T06_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_01FF:
	npc_msg msg_0483_T06_00009
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_020A:
	npc_msg msg_0483_T06_00007
	goto_if_no_item_space ITEM_PP_MAX, 1, _0241
	callstd std_give_item_verbose
	setflag FLAG_GOT_PP_MAX_FROM_VERMILLION_CITY_MAN
	npc_msg msg_0483_T06_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0241:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_T06_011:
	scrcmd_609
	lockall
	clearflag FLAG_HIDE_VERMILION_EUSINE
	show_person obj_T06_minaki
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4000, 1334
	goto_if_ne _0270
	goto _037F

_0270:
	apply_movement obj_player, _040C
	wait_movement
	play_cry SPECIES_SUICUNE, 0
	release obj_T06_tsure_poke_static_suicune
	scrcmd_523 obj_T06_tsure_poke_static_suicune, 2, 90, 2, 0
	lock obj_T06_tsure_poke_static_suicune
	wait_cry
	callstd std_play_eusine_music
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 331
	goto_if_ne _02D5
	apply_movement obj_player, _0460
	apply_movement obj_T06_minaki, _0490
	apply_movement obj_T06_tsure_poke_static_suicune, _0414
	goto _0318

_02D5:
	compare VAR_TEMP_x4001, 332
	goto_if_ne _0300
	apply_movement obj_player, _0470
	apply_movement obj_T06_minaki, _04A0
	apply_movement obj_T06_tsure_poke_static_suicune, _0420
	goto _0318

_0300:
	apply_movement obj_player, _0480
	apply_movement obj_T06_minaki, _04B0
	apply_movement obj_T06_tsure_poke_static_suicune, _042C
_0318:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	npc_msg msg_0483_T06_00014
	closemsg
	apply_movement obj_T06_minaki, _04D0
	wait_movement
	buffer_players_name 0
	npc_msg msg_0483_T06_00015
	closemsg
	apply_movement obj_T06_minaki, _04E8
	apply_movement obj_player, _04F0
	wait_movement
_034D:
	callstd std_fade_end_eusine_music
	hide_person obj_T06_minaki
	hide_person obj_T06_tsure_poke_static_suicune
	setflag FLAG_HIDE_VERMILION_EUSINE
	setflag FLAG_HIDE_VERMILION_EUSINE_2
	setflag FLAG_HIDE_VERMILION_SUICUNE
	setvar VAR_UNK_4070, 0
	setvar VAR_UNK_4071, 0
	clearflag FLAG_HIDE_ROUTE_14_SUICUNE
	setvar VAR_UNK_4086, 1
	releaseall
	end

_037F:
	apply_movement obj_player, _040C
	apply_movement obj_T06_tsure_poke_static_suicune, _0458
	wait_movement
	play_cry SPECIES_SUICUNE, 0
	release obj_T06_tsure_poke_static_suicune
	scrcmd_523 obj_T06_tsure_poke_static_suicune, 2, 90, 2, 0
	lock obj_T06_tsure_poke_static_suicune
	wait_cry
	callstd std_play_eusine_music
	apply_movement obj_T06_tsure_poke_static_suicune, _0438
	apply_movement obj_T06_minaki, _04C0
	apply_movement obj_player, _04F8
	wait_movement
	apply_movement obj_T06_minaki, _04E0
	apply_movement obj_player, _0504
	wait_movement
	npc_msg msg_0483_T06_00014
	closemsg
	apply_movement obj_T06_minaki, _04D8
	wait_movement
	npc_msg msg_0483_T06_00015
	closemsg
	apply_movement obj_T06_minaki, _04E8
	apply_movement obj_player, _04F0
	wait_movement
	goto _034D
	.byte 0x00, 0x00, 0x00

_040C:
	step 75, 1
	step_end

_0414:
	step 62, 9
	step 112, 1
	step_end

_0420:
	step 62, 11
	step 112, 1
	step_end

_042C:
	step 62, 13
	step 112, 1
	step_end

_0438:
	step 62, 4
	step 21, 2
	step 53, 1
	step 57, 1
	step 21, 2
	step 53, 1
	step 57, 2
	step_end

_0458:
	step 35, 1
	step_end

_0460:
	step 15, 2
	step 12, 2
	step 15, 1
	step_end

_0470:
	step 15, 2
	step 12, 3
	step 15, 1
	step_end

_0480:
	step 15, 2
	step 12, 4
	step 15, 1
	step_end

_0490:
	step 63, 1
	step 17, 6
	step 19, 1
	step_end

_04A0:
	step 62, 3
	step 17, 6
	step 19, 1
	step_end

_04B0:
	step 62, 5
	step 17, 6
	step 19, 1
	step_end

_04C0:
	step 62, 2
	step 19, 1
	step 17, 2
	step_end

_04D0:
	step 1, 1
	step_end

_04D8:
	step 3, 1
	step_end

_04E0:
	step 49, 3
	step_end

_04E8:
	step 12, 8
	step_end

_04F0:
	step 0, 1
	step_end

_04F8:
	step 62, 4
	step 1, 1
	step_end

_0504:
	step 2, 1
	step_end
scr_seq_T06_012:
	scrcmd_609
	lockall
	clearflag FLAG_HIDE_VERMILION_EUSINE_2
	show_person obj_T06_minaki_2
	apply_movement obj_player, _040C
	wait_movement
	play_cry SPECIES_SUICUNE, 0
	release obj_T06_tsure_poke_static_suicune
	scrcmd_523 obj_T06_tsure_poke_static_suicune, 2, 90, 2, 0
	lock obj_T06_tsure_poke_static_suicune
	wait_cry
	callstd std_play_eusine_music
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4000, 1324
	goto_if_ne _057D
	apply_movement obj_T06_minaki_2, _0654
	apply_movement obj_player, _0630
	apply_movement obj_T06_tsure_poke_static_suicune, _0414
	goto _05C0

_057D:
	compare VAR_TEMP_x4000, 1325
	goto_if_ne _05A8
	apply_movement obj_T06_minaki_2, _0668
	apply_movement obj_player, _063C
	apply_movement obj_T06_tsure_poke_static_suicune, _0420
	goto _05C0

_05A8:
	apply_movement obj_T06_minaki_2, _067C
	apply_movement obj_player, _0648
	apply_movement obj_T06_tsure_poke_static_suicune, _042C
_05C0:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	npc_msg msg_0483_T06_00014
	closemsg
	apply_movement obj_T06_minaki_2, _0690
	apply_movement obj_player, _06A4
	wait_movement
	buffer_players_name 0
	npc_msg msg_0483_T06_00015
	closemsg
	apply_movement obj_T06_minaki_2, _0698
	apply_movement obj_player, _06AC
	wait_movement
	callstd std_fade_end_eusine_music
	hide_person obj_T06_minaki_2
	hide_person obj_T06_tsure_poke_static_suicune
	setflag FLAG_HIDE_VERMILION_EUSINE
	setflag FLAG_HIDE_VERMILION_EUSINE_2
	setflag FLAG_HIDE_VERMILION_SUICUNE
	setvar VAR_UNK_4070, 0
	setvar VAR_UNK_4071, 0
	clearflag FLAG_HIDE_ROUTE_14_SUICUNE
	setvar VAR_UNK_4086, 1
	releaseall
	end
	.byte 0x00

_0630:
	step 13, 4
	step 15, 2
	step_end

_063C:
	step 13, 4
	step 15, 1
	step_end

_0648:
	step 13, 4
	step 3, 1
	step_end

_0654:
	step 63, 1
	step 19, 7
	step 16, 3
	step 19, 1
	step_end

_0668:
	step 63, 2
	step 19, 7
	step 16, 3
	step 19, 1
	step_end

_067C:
	step 63, 3
	step 19, 7
	step 16, 3
	step 19, 1
	step_end

_0690:
	step 0, 1
	step_end

_0698:
	step 14, 2
	step 12, 13
	step_end

_06A4:
	step 1, 1
	step_end

_06AC:
	step 63, 2
	step 2, 1
	step 63, 1
	step 0, 1
	step_end
scr_seq_T06_001:
	simple_npc_msg msg_0483_T06_00000
	end

scr_seq_T06_002:
	simple_npc_msg msg_0483_T06_00003
	end

scr_seq_T06_003:
	simple_npc_msg msg_0483_T06_00001
	end

scr_seq_T06_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_MACHOP, 0
	npc_msg msg_0483_T06_00002
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T06_005:
	direction_signpost msg_0483_T06_00010, 0, 6, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T06_006:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0483_T06_00011, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T06_007:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0483_T06_00012, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T06_008:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0483_T06_00013, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T06_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _086F
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0883
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _07DB
	apply_movement obj_player, _0898
	goto _080E

_07DB:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _07FE
	apply_movement obj_player, _08B8
	apply_movement obj_T06_gsmiddleman1_2, _08CC
	goto _080E

_07FE:
	apply_movement obj_player, _08A4
	apply_movement obj_T06_gsmiddleman1_2, _08CC
_080E:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0835
	apply_movement obj_partner_poke, _08D8
	wait_movement
_0835:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 50
	lockall
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	clearflag FLAG_UNK_189
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 2
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_086F:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0883:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00

_0898:
	step 12, 3
	step 33, 1
	step_end

_08A4:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_08B8:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_08CC:
	step 63, 1
	step 32, 1
	step_end

_08D8:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
	.balign 4, 0
