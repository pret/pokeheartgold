#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0238_R34R0101_0210 ; 000
	scrdef scr_seq_0238_R34R0101_000A ; 001
	scrdef_end

scr_seq_0238_R34R0101_000A:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 1, scr_seq_0238_R34R0101_0140
	apply_movement 2, scr_seq_0238_R34R0101_014C
	apply_movement 255, scr_seq_0238_R34R0101_0158
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	buffer_players_name 0
	gender_msgbox 0, 10
	closemsg
	gender_msgbox 1, 11
	closemsg
	apply_movement 1, scr_seq_0238_R34R0101_0138
	wait_movement
	gender_msgbox 2, 12
	closemsg
	gender_msgbox 3, 13
	closemsg
	apply_movement 1, scr_seq_0238_R34R0101_0164
	wait_movement
	gender_msgbox 4, 14
	closemsg
	apply_movement 1, scr_seq_0238_R34R0101_016C
	apply_movement 2, scr_seq_0238_R34R0101_0184
	wait_movement
	gender_msgbox 5, 15
	closemsg
	apply_movement 1, scr_seq_0238_R34R0101_0198
	apply_movement 2, scr_seq_0238_R34R0101_01A8
	wait_movement
	apply_movement 255, scr_seq_0238_R34R0101_0190
	wait_movement
	gender_msgbox 6, 16
	closemsg
	get_player_gender VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0238_R34R0101_00C6
	register_gear_number 4
	goto scr_seq_0238_R34R0101_00CA

scr_seq_0238_R34R0101_00C6:
	register_gear_number 3
scr_seq_0238_R34R0101_00CA:
	buffer_players_name 0
	gender_msgbox 7, 17
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	apply_movement 1, scr_seq_0238_R34R0101_01BC
	wait_movement
	gender_msgbox 8, 18
	closemsg
	apply_movement 1, scr_seq_0238_R34R0101_01C4
	apply_movement 2, scr_seq_0238_R34R0101_01CC
	wait_movement
	gender_msgbox 9, 19
	closemsg
	apply_movement 1, scr_seq_0238_R34R0101_01D4
	apply_movement 2, scr_seq_0238_R34R0101_01E8
	apply_movement 255, scr_seq_0238_R34R0101_0204
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	hide_person 1
	hide_person 2
	wait_se SEQ_SE_DP_KAIDAN2
	setvar VAR_UNK_408E, 2
	setflag FLAG_UNK_22D
	releaseall
	end

scr_seq_0238_R34R0101_0137:
	.byte 0x00

scr_seq_0238_R34R0101_0138:
	step 75, 1
	step_end

scr_seq_0238_R34R0101_0140:
	step 63, 1
	step 12, 3
	step_end

scr_seq_0238_R34R0101_014C:
	step 16, 3
	step 48, 2
	step_end

scr_seq_0238_R34R0101_0158:
	step 63, 1
	step 12, 3
	step_end

scr_seq_0238_R34R0101_0164:
	step 33, 1
	step_end

scr_seq_0238_R34R0101_016C:
	step 14, 1
	step 13, 3
	step 63, 1
	step 75, 1
	step 32, 1
	step_end

scr_seq_0238_R34R0101_0184:
	step 14, 2
	step 13, 2
	step_end

scr_seq_0238_R34R0101_0190:
	step 34, 1
	step_end

scr_seq_0238_R34R0101_0198:
	step 63, 1
	step 12, 1
	step 35, 1
	step_end

scr_seq_0238_R34R0101_01A8:
	step 35, 1
	step 71, 1
	step 54, 1
	step 72, 1
	step_end

scr_seq_0238_R34R0101_01BC:
	step 35, 1
	step_end

scr_seq_0238_R34R0101_01C4:
	step 32, 1
	step_end

scr_seq_0238_R34R0101_01CC:
	step 32, 1
	step_end

scr_seq_0238_R34R0101_01D4:
	step 13, 2
	step 15, 1
	step 13, 1
	step 69, 1
	step_end

scr_seq_0238_R34R0101_01E8:
	step 63, 1
	step 48, 2
	step 63, 1
	step 17, 3
	step 19, 2
	step 37, 1
	step_end

scr_seq_0238_R34R0101_0204:
	step 63, 2
	step 33, 1
	step_end
scr_seq_0238_R34R0101_0210:
	scrcmd_715
	end
	.balign 4, 0
