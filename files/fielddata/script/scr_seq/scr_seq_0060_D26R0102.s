#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D26R0102.h"
#include "msgdata/msg/msg_0091_D26R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D26R0102_000
	scrdef scr_seq_D26R0102_001
	scrdef scr_seq_D26R0102_002
	scrdef_end

scr_seq_D26R0102_000:
	simple_npc_msg msg_0091_D26R0102_00005
	end

scr_seq_D26R0102_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0091_D26R0102_00003
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0047
	closemsg
	releaseall
	end

_0047:
	buffer_players_name 0
	npc_msg msg_0091_D26R0102_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D26R0102_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0091_D26R0102_00001
	closemsg
	trainer_battle TRAINER_EXECUTIVE_PROTON_PROTON, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0193
	npc_msg msg_0091_D26R0102_00002
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	hide_person obj_D26R0102_rocketm
	hide_person obj_D26R0102_rocketm_2
	hide_person obj_D26R0102_rocketw
	hide_person obj_D26R0102_rkanbum3
	setflag FLAG_UNK_1A9
	wait 20, VAR_SPECIAL_x8004
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	move_person_facing obj_D26R0102_gantetsu, 36, 0, 7, DIR_WEST
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _00F7
	apply_movement obj_D26R0102_gantetsu, _019C
	apply_movement obj_player, _01C0
	goto _0107

_00F7:
	apply_movement obj_D26R0102_gantetsu, _019C
	apply_movement obj_player, _01DC
_0107:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	buffer_players_name 0
	npc_msg msg_0091_D26R0102_00000
	closemsg
	clearflag FLAG_UNK_19E
	clearflag FLAG_HIDE_AZALEA_SLOWPOKES
	setflag FLAG_BEAT_AZALEA_ROCKETS
	setvar VAR_UNK_4075, 1
	setvar VAR_UNK_4080, 2
	setvar VAR_UNK_4099, 1
	setvar VAR_UNK_409B, 1
	setvar VAR_UNK_409E, 1
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_T23R0501, 0, 4, 5, DIR_NORTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	setflag FLAG_UNK_1AA
	setflag FLAG_UNK_1D5
	setflag FLAG_UNK_1AC
	clearflag FLAG_HIDE_ILEX_APPRENTICE
	clearflag FLAG_HIDE_FARFETCHD_1_LOST
	clearflag FLAG_HIDE_FARFETCHD_2_LOST
	setvar VAR_UNK_40F4, 1
	releaseall
	end

_0193:
	white_out
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_019C:
	step 14, 2
	step 13, 2
	step 14, 3
	step 12, 2
	step 62, 4
	step 14, 1
	step 12, 3
	step 2, 1
	step_end

_01C0:
	step 15, 2
	step 0, 1
	step 63, 6
	step 1, 1
	step 63, 5
	step 3, 1
	step_end

_01DC:
	step 13, 1
	step 15, 1
	step 0, 1
	step 63, 6
	step 1, 1
	step 63, 5
	step 3, 1
	step_end
	.balign 4, 0
