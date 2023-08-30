#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T23R0501.h"
#include "msgdata/msg/msg_0571_T23R0501.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T23R0501_000
	scrdef scr_seq_T23R0501_001
	scrdef scr_seq_T23R0501_002
	scrdef scr_seq_T23R0501_003
	scrdef scr_seq_T23R0501_004
	scrdef scr_seq_T23R0501_005
	scrdef scr_seq_T23R0501_006
	scrdef_end

scr_seq_T23R0501_000:
	goto_if_set FLAG_BEAT_AZALEA_ROCKETS, _002F
	setflag FLAG_HIDE_AZALEA_SLOWPOKES
	end

_002F:
	clearflag FLAG_HIDE_AZALEA_SLOWPOKES
	end

scr_seq_T23R0501_005:
	scrcmd_609
	lockall
	setvar VAR_UNK_4080, 3
	apply_movement obj_T23R0501_gantetsu, _02B0
	wait_movement
	buffer_players_name 0
	npc_msg msg_0571_T23R0501_00001
	setvar VAR_SPECIAL_x8004, 492
	setvar VAR_SPECIAL_x8005, 1
	callstd std_obtain_item_verbose
	setflag FLAG_UNK_07C
	releaseall
	goto _011A
	.byte 0x02, 0x00
scr_seq_T23R0501_001:
	goto_if_set FLAG_UNK_07C, _011A
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	buffer_players_name 0
	npc_msg msg_0571_T23R0501_00000
	wait_button
	closemsg
	get_player_facing VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_ne _00A7
	goto _00C7
	.byte 0x16, 0x00, 0x08, 0x00, 0x00, 0x00
_00A7:
	apply_movement obj_T23R0501_gantetsu, _02E0
	wait_movement
_00B1:
	releaseall
	hide_person obj_T23R0501_gantetsu
	wait_fanfare
	setflag FLAG_UNK_077
	setflag FLAG_UNK_19E
	setflag FLAG_UNK_19F
	end

_00C7:
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 56
	get_person_coords 253, VAR_TEMP_x4002, VAR_TEMP_x4003
	compare VAR_TEMP_x4002, 5
	goto_if_ne _00F4
	apply_movement obj_T23R0501_gantetsu, _02E8
	goto _0108

_00F4:
	play_se SEQ_SE_DP_WALL_HIT
	apply_movement obj_T23R0501_gantetsu, _02E0
	apply_movement obj_player, _02C8
_0108:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	goto _00B1

_011A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_735 VAR_SPECIAL_x8000
	compare VAR_SPECIAL_x8000, 0
	goto_if_ne _01A5
	get_total_apricorn_count VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _020F
	apply_movement obj_T23R0501_gantetsu, _02BC
	wait_movement
	npc_msg msg_0571_T23R0501_00004
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_739
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	scrcmd_735 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0189
	npc_msg msg_0571_T23R0501_00006
	goto _0190

_0189:
	setflag FLAG_UNK_AA2
	npc_msg msg_0571_T23R0501_00005
_0190:
	wait_button_or_walk_away
	closemsg
	compare VAR_UNK_4080, 3
	goto_if_eq _022D
	releaseall
	end

_01A5:
	goto_if_set FLAG_UNK_AA2, _0204
	buffer_players_name 0
	npc_msg msg_0571_T23R0501_00008
	scrcmd_737 VAR_SPECIAL_x8004
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8000, VAR_SPECIAL_RESULT
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_x8000
	callstd std_give_item_verbose
	clear_kurt_apricorn
	compare VAR_UNK_413B, 10
	goto_if_ge _01EE
	addvar VAR_UNK_413B, 1
	compare VAR_UNK_413B, 10
	call_if_ge _0227
_01EE:
	npc_msg msg_0571_T23R0501_00010
	goto _021F
	.byte 0x02, 0x00, 0x2d, 0x00, 0x09, 0x16, 0x00, 0x1d, 0x00
	.byte 0x00, 0x00, 0x02, 0x00
_0204:
	npc_msg msg_0571_T23R0501_00007
	goto _021F
	.byte 0x02, 0x00
_020F:
	npc_msg msg_0571_T23R0501_00003
	compare VAR_UNK_4080, 3
	goto_if_eq _022D
_021F:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0227:
	setflag FLAG_UNK_127
	return

_022D:
	setvar VAR_UNK_4080, 4
	apply_movement obj_T23R0501_gsbabygirl1, _02FC
	wait_movement
	apply_movement obj_player, _02D4
	wait_movement
	npc_msg msg_0571_T23R0501_00015
_024A:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _026E
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ge _0289
	end

_026E:
	buffer_players_name 0
	npc_msg msg_0571_T23R0501_00016
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number PHONE_CONTACT_KURT
	npc_msg msg_0571_T23R0501_00017
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0289:
	npc_msg msg_0571_T23R0501_00018
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x5e, 0x00, 0x01, 0x00, 0x68, 0x00, 0x00, 0x00, 0x5f, 0x00, 0x61, 0x00
	.byte 0x02, 0x00
_02A2:
	npc_msg msg_0571_T23R0501_00019
	goto _024A
	.byte 0x02, 0x00, 0x00, 0x00, 0x00

_02B0:
	step 65, 1
	step 37, 1
	step_end

_02BC:
	step 75, 1
	step 63, 1
	step_end

_02C8:
	step 18, 1
	step 65, 1
	step_end

_02D4:
	step 39, 1
	step 3, 1
	step_end

_02E0:
	step 17, 5
	step_end

_02E8:
	step 18, 1
	step 17, 2
	step 19, 1
	step 17, 3
	step_end

_02FC:
	step 14, 1
	step_end
	.byte 0x27, 0x00, 0x01, 0x00, 0x0f, 0x00, 0x01, 0x00, 0x26, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00
scr_seq_T23R0501_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_077, _0332
	npc_msg msg_0571_T23R0501_00011
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0332:
	goto_if_set FLAG_BEAT_AZALEA_ROCKETS, _0348
	npc_msg msg_0571_T23R0501_00012
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0348:
	check_registered_phone_number PHONE_CONTACT_KURT, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_eq _02A2
	goto_if_set FLAG_GAME_CLEAR, _0371
	npc_msg msg_0571_T23R0501_00013
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0371:
	npc_msg msg_0571_T23R0501_00014
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T23R0501_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_SLOWPOKE, 0
	npc_msg msg_0571_T23R0501_00020
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T23R0501_004:
	simple_npc_msg msg_0571_T23R0501_00021
	end

scr_seq_T23R0501_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_SCENE_ROCKET_TAKEOVER, 2
	goto_if_ne _03C8
	npc_msg msg_0571_T23R0501_00024
	goto _03F7

_03C8:
	compare VAR_SCENE_ROCKET_TAKEOVER, 3
	goto_if_ne _03DE
	npc_msg msg_0571_T23R0501_00024
	goto _03F7

_03DE:
	compare VAR_SCENE_ROCKET_TAKEOVER, 4
	goto_if_ne _03F4
	npc_msg msg_0571_T23R0501_00024
	goto _03F7

_03F4:
	npc_msg msg_0571_T23R0501_00023
_03F7:
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
