#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0128_D49R0107_01A4 ; 000
	scrdef scr_seq_0128_D49R0107_01BA ; 001
	scrdef scr_seq_0128_D49R0107_01E8 ; 002
	scrdef scr_seq_0128_D49R0107_01FB ; 003
	scrdef scr_seq_0128_D49R0107_020E ; 004
	scrdef scr_seq_0128_D49R0107_00A8 ; 005
	scrdef scr_seq_0128_D49R0107_0043 ; 006
	scrdef scr_seq_0128_D49R0107_0022 ; 007
	scrdef_end

scr_seq_0128_D49R0107_0022:
	comparevartovalue VAR_UNK_40D3, 1
	gotoif ne, scr_seq_0128_D49R0107_003B
	setvar VAR_TEMP_x400E, 1
	goto scr_seq_0128_D49R0107_0041

scr_seq_0128_D49R0107_003B:
	setvar VAR_TEMP_x400E, 0
scr_seq_0128_D49R0107_0041:
	end

scr_seq_0128_D49R0107_0043:
	comparevartovalue VAR_TEMP_x400F, 0
	gotoif ne, scr_seq_0128_D49R0107_0058
	scrcmd_744
	setvar VAR_TEMP_x400F, 1
scr_seq_0128_D49R0107_0058:
	get_player_gender VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0128_D49R0107_007B
	move_person 2, 28, 0, 28, 0
	goto scr_seq_0128_D49R0107_0087

scr_seq_0128_D49R0107_007B:
	move_person 1, 28, 0, 28, 0
scr_seq_0128_D49R0107_0087:
	comparevartovalue VAR_TEMP_x400E, 1
	gotoif ne, scr_seq_0128_D49R0107_00A6
	move_person 0, 9, 0, 9, 1
	setvar VAR_TEMP_x400E, 0
scr_seq_0128_D49R0107_00A6:
	end

scr_seq_0128_D49R0107_00A8:
	scrcmd_609
	lockall
	apply_movement 0, scr_seq_0128_D49R0107_015C
	wait_movement
	npc_msg 0
	closemsg
	apply_movement 0, scr_seq_0128_D49R0107_0164
	wait_movement
	wait 15, VAR_SPECIAL_x800C
	buffer_players_name 0
	npc_msg 1
	closemsg
	apply_movement 0, scr_seq_0128_D49R0107_016C
	wait_movement
	npc_msg 2
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 0, scr_seq_0128_D49R0107_0174
	apply_movement 255, scr_seq_0128_D49R0107_0180
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	buffer_players_name 0
	npc_msg 3
	closemsg
	apply_movement 0, scr_seq_0128_D49R0107_0188
	wait_movement
	npc_msg 4
	closemsg
	apply_movement 0, scr_seq_0128_D49R0107_0164
	wait_movement
	npc_msg 5
	closemsg
	apply_movement 0, scr_seq_0128_D49R0107_0190
	wait_movement
	releaseall
	setvar VAR_UNK_40D3, 1
	nat_dex_flag_action 2, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	callif eq, scr_seq_0128_D49R0107_0154
	end

scr_seq_0128_D49R0107_0154:
	clearflag FLAG_UNK_2B3
	return

scr_seq_0128_D49R0107_015A:
	.byte 0x00, 0x00

scr_seq_0128_D49R0107_015C:
	step 75, 1
	step_end

scr_seq_0128_D49R0107_0164:
	step 33, 1
	step_end

scr_seq_0128_D49R0107_016C:
	step 13, 3
	step_end

scr_seq_0128_D49R0107_0174:
	step 12, 3
	step 33, 1
	step_end

scr_seq_0128_D49R0107_0180:
	step 12, 3
	step_end

scr_seq_0128_D49R0107_0188:
	step 8, 1
	step_end

scr_seq_0128_D49R0107_0190:
	step 34, 1
	step 71, 1
	step 11, 2
	step 72, 1
	step_end
scr_seq_0128_D49R0107_01A4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	buffer_players_name 0
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0128_D49R0107_01BA:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 7
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_712 3
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_0128_D49R0107_01E8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0128_D49R0107_01FB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0128_D49R0107_020E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
