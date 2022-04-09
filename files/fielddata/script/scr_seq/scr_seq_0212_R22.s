#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R22.h"
#include "msgdata/msg/msg_0360_R22.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R22_000
	scrdef scr_seq_R22_001
	scrdef scr_seq_R22_002
	scrdef scr_seq_R22_003
	scrdef scr_seq_R22_004
	scrdef_end

scr_seq_R22_001:
	goto_if_unset FLAG_UNK_189, _0027
	clearflag FLAG_UNK_189
	end

_0027:
	compare VAR_UNK_40FE, 1
	goto_if_eq _005E
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 4
	goto_if_eq _0058
	compare VAR_TEMP_x4000, 0
	goto_if_eq _0058
	setflag FLAG_HIDE_CAMERON
	end

_0058:
	clearflag FLAG_HIDE_CAMERON
	end

_005E:
	setflag FLAG_HIDE_CAMERON
	end

scr_seq_R22_004:
	compare VAR_UNK_40FE, 1
	goto_if_eq _0073
	end

_0073:
	move_person_facing obj_R22_sakaki, 947, 1, 266, DIR_WEST
	move_person_facing obj_R22_gsrivel, 950, 1, 266, DIR_WEST
	move_person_facing obj_R22_var_1, 952, 1, 280, DIR_EAST
	end

scr_seq_R22_003:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _037C
	wait_movement
	apply_movement obj_R22_var_1, _02CC
	wait_movement
	gender_msgbox msg_0360_R22_00012, msg_0360_R22_00011
	closemsg
	apply_movement obj_R22_var_1, _02E0
	wait_movement
	buffer_players_name 0
	gender_msgbox msg_0360_R22_00014, msg_0360_R22_00013
	closemsg
	apply_movement obj_R22_var_1, _02FC
	wait_movement
	gender_msgbox msg_0360_R22_00016, msg_0360_R22_00015
	closemsg
	apply_movement obj_R22_var_1, _0304
	apply_movement obj_player, _03D0
	wait_movement
	gender_msgbox msg_0360_R22_00018, msg_0360_R22_00017
	closemsg
	apply_movement obj_R22_var_1, _0338
	wait_movement
	buffer_players_name 0
	gender_msgbox msg_0360_R22_00020, msg_0360_R22_00019
	closemsg
	apply_movement obj_player, _03A0
	apply_movement obj_R22_var_1, _0310
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	apply_movement 241, _03DC
	wait_movement
	fade_out_bgm 0, 30
	apply_movement obj_R22_gsrivel, _03F4
	wait_movement
	buffer_rivals_name 0
	npc_msg msg_0360_R22_00002
	closemsg
	apply_movement obj_R22_sakaki, _0438
	wait_movement
	npc_msg msg_0360_R22_00008
	closemsg
	apply_movement obj_R22_gsrivel, _03FC
	wait_movement
	buffer_rivals_name 0
	npc_msg msg_0360_R22_00003
	closemsg
	apply_movement obj_R22_sakaki, _0444
	wait_movement
	npc_msg msg_0360_R22_00009
	closemsg
	apply_movement obj_R22_gsrivel, _03F4
	wait_movement
	buffer_rivals_name 0
	npc_msg msg_0360_R22_00004
	closemsg
	apply_movement obj_R22_sakaki, _044C
	wait_movement
	npc_msg msg_0360_R22_00010
	closemsg
	apply_movement obj_R22_sakaki, _0454
	wait_movement
	apply_movement obj_R22_gsrivel, _03F4
	wait_movement
	buffer_rivals_name 0
	npc_msg msg_0360_R22_00005
	closemsg
	apply_movement obj_R22_gsrivel, _03F4
	wait_movement
	npc_msg msg_0360_R22_00006
	closemsg
	callstd std_play_rival_intro_music
	apply_movement 241, _03E8
	apply_movement obj_R22_gsrivel, _0404
	wait_movement
	scrcmd_103
	buffer_rivals_name 0
	npc_msg msg_0360_R22_00007
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement obj_R22_gsrivel, _0420
	play_se SEQ_SE_DP_WALL_HIT2
	apply_movement obj_player, _03B0
	apply_movement obj_R22_var_1, _03D0
	wait_movement
	apply_movement obj_R22_gsrivel, _042C
	apply_movement obj_player, _03D0
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	hide_person obj_R22_sakaki
	hide_person obj_R22_gsrivel
	setflag FLAG_HIDE_ROUTE_22_GIOVANNI_RIVAL
	callstd std_fade_end_rival_intro_music
	gender_msgbox msg_0360_R22_00022, msg_0360_R22_00021
	closemsg
	fade_out_bgm 20, 30
	apply_movement obj_partner_poke, _0350
	wait_movement
	play_se SEQ_SE_GS_SUZUSYUTUGEN_HO
	fade_screen 6, 6, 0, RGB_WHITE
	wait_fade
	wait 15, VAR_SPECIAL_RESULT
	fade_screen 6, 6, 1, RGB_WHITE
	wait_fade
	apply_movement obj_player, _03C4
	apply_movement obj_R22_var_1, _0320
	wait_movement
	gender_msgbox msg_0360_R22_00024, msg_0360_R22_00023
	closemsg
	play_se SEQ_SE_GS_TIMESLIP
	scrcmd_810
	setvar VAR_UNK_40FE, 2
	clearflag FLAG_HIDE_TOHJO_FALLS_GIOVANNI
	clearflag FLAG_HIDE_TOHJO_FALLS_FRIEND
	warp MAP_D45R0102, 0, 6, 8, DIR_SOUTH
	fade_screen 6, 15, 1, RGB_WHITE
	wait_fade
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_02CC:
	step 75, 1
	step 63, 1
	step 35, 1
	step 65, 1
	step_end

_02E0:
	step 16, 2
	step 63, 1
	step 34, 1
	step 65, 1
	step 35, 1
	step 65, 1
	step_end

_02FC:
	step 13, 1
	step_end

_0304:
	step 13, 1
	step 35, 1
	step_end

_0310:
	step 12, 2
	step 14, 2
	step 12, 1
	step_end

_0320:
	step 34, 1
	step 65, 1
	step 35, 1
	step 65, 1
	step 33, 1
	step_end

_0338:
	step 75, 1
	step 63, 1
	step 12, 2
	step 15, 1
	step 12, 2
	step_end

_0350:
	step 1, 1
	step 57, 1
	step 71, 1
	step 52, 1
	step 71, 1
	step_end
	.byte 0x47, 0x00, 0x01, 0x00, 0x13, 0x00, 0x02, 0x00
	.byte 0x48, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

_037C:
	step 32, 1
	step 12, 1
	step 63, 1
	step 34, 1
	step 65, 1
	step 35, 1
	step 65, 1
	step 32, 1
	step_end

_03A0:
	step 12, 5
	step 14, 2
	step 12, 2
	step_end

_03B0:
	step 62, 1
	step 71, 1
	step 53, 1
	step 72, 1
	step_end

_03C4:
	step 75, 1
	step 63, 1
	step_end

_03D0:
	step 65, 1
	step 33, 1
	step_end

_03DC:
	step 12, 5
	step 14, 2
	step_end

_03E8:
	step 19, 2
	step 17, 4
	step_end

_03F4:
	step 14, 1
	step_end

_03FC:
	step 34, 1
	step_end

_0404:
	step 66, 1
	step 19, 6
	step 17, 4
	step 63, 1
	step 75, 1
	step 63, 1
	step_end

_0420:
	step 17, 2
	step 65, 1
	step_end

_042C:
	step 19, 1
	step 17, 8
	step_end

_0438:
	step 35, 1
	step 63, 1
	step_end

_0444:
	step 35, 1
	step_end

_044C:
	step 34, 1
	step_end

_0454:
	step 14, 6
	step_end
scr_seq_R22_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0584
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0598
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _04D5
	apply_movement obj_player, _05AC
	apply_movement obj_R22_gsmiddleman1, _05F8
	goto _0523

_04D5:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _04F0
	apply_movement obj_player, _05C4
	goto _0523

_04F0:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _0513
	apply_movement obj_player, _05E4
	apply_movement obj_R22_gsmiddleman1, _05F8
	goto _0523

_0513:
	apply_movement obj_player, _05D0
	apply_movement obj_R22_gsmiddleman1, _05F8
_0523:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _054A
	apply_movement obj_partner_poke, _0604
	wait_movement
_054A:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 71
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

_0584:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0598:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end


_05AC:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_05C4:
	step 12, 3
	step 33, 1
	step_end

_05D0:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_05E4:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_05F8:
	step 63, 1
	step 32, 1
	step_end

_0604:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_R22_002:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0360_R22_00000, VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
