#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0231_R31R0101_0014 ; 000
	scrdef scr_seq_0231_R31R0101_000E ; 001
	scrdef scr_seq_0231_R31R0101_048C ; 002
	scrdef_end

scr_seq_0231_R31R0101_000E:
	get_friend_sprite VAR_OBJ_0
	end

scr_seq_0231_R31R0101_0014:
	scrcmd_609
	lockall
	callstd std_play_friend_music
	apply_movement 2, scr_seq_0231_R31R0101_028C
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	move_person 1, 10, 1, 7, 2
	move_person 2, 10, 1, 7, 2
	apply_movement 1, scr_seq_0231_R31R0101_0284
	wait_movement
	wait_se SEQ_SE_DP_KAIDAN2
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	scrcmd_729 VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ne, scr_seq_0231_R31R0101_00C3
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, scr_seq_0231_R31R0101_008A
	apply_movement 1, scr_seq_0231_R31R0101_02AC
	apply_movement 2, scr_seq_0231_R31R0101_02FC
	goto scr_seq_0231_R31R0101_00BD

scr_seq_0231_R31R0101_008A:
	comparevartovalue VAR_TEMP_x4001, 7
	gotoif ne, scr_seq_0231_R31R0101_00AD
	apply_movement 1, scr_seq_0231_R31R0101_02BC
	apply_movement 2, scr_seq_0231_R31R0101_0314
	goto scr_seq_0231_R31R0101_00BD

scr_seq_0231_R31R0101_00AD:
	apply_movement 1, scr_seq_0231_R31R0101_02C4
	apply_movement 2, scr_seq_0231_R31R0101_0324
scr_seq_0231_R31R0101_00BD:
	goto scr_seq_0231_R31R0101_0119

scr_seq_0231_R31R0101_00C3:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, scr_seq_0231_R31R0101_00E6
	apply_movement 1, scr_seq_0231_R31R0101_02D4
	apply_movement 2, scr_seq_0231_R31R0101_033C
	goto scr_seq_0231_R31R0101_0119

scr_seq_0231_R31R0101_00E6:
	comparevartovalue VAR_TEMP_x4001, 7
	gotoif ne, scr_seq_0231_R31R0101_0109
	apply_movement 1, scr_seq_0231_R31R0101_02E4
	apply_movement 2, scr_seq_0231_R31R0101_0354
	goto scr_seq_0231_R31R0101_0119

scr_seq_0231_R31R0101_0109:
	apply_movement 1, scr_seq_0231_R31R0101_02EC
	apply_movement 2, scr_seq_0231_R31R0101_0364
scr_seq_0231_R31R0101_0119:
	wait_movement
	apply_movement 255, scr_seq_0231_R31R0101_0294
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ne, scr_seq_0231_R31R0101_0138
	apply_movement 253, scr_seq_0231_R31R0101_0294
scr_seq_0231_R31R0101_0138:
	wait_movement
	buffer_players_name 0
	gender_msgbox 2, 3
	setvar VAR_SPECIAL_x8004, 465
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	gender_msgbox 4, 5
	closemsg
	apply_movement 1, scr_seq_0231_R31R0101_0294
	wait_movement
	gender_msgbox 6, 7
	closemsg
	apply_movement 2, scr_seq_0231_R31R0101_02A4
	wait_movement
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ne, scr_seq_0231_R31R0101_01DA
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, scr_seq_0231_R31R0101_01A1
	apply_movement 1, scr_seq_0231_R31R0101_037C
	apply_movement 2, scr_seq_0231_R31R0101_03EC
	goto scr_seq_0231_R31R0101_01D4

scr_seq_0231_R31R0101_01A1:
	comparevartovalue VAR_TEMP_x4001, 7
	gotoif ne, scr_seq_0231_R31R0101_01C4
	apply_movement 1, scr_seq_0231_R31R0101_038C
	apply_movement 2, scr_seq_0231_R31R0101_0404
	goto scr_seq_0231_R31R0101_01D4

scr_seq_0231_R31R0101_01C4:
	apply_movement 1, scr_seq_0231_R31R0101_03A4
	apply_movement 2, scr_seq_0231_R31R0101_0424
scr_seq_0231_R31R0101_01D4:
	goto scr_seq_0231_R31R0101_0230

scr_seq_0231_R31R0101_01DA:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, scr_seq_0231_R31R0101_01FD
	apply_movement 1, scr_seq_0231_R31R0101_03B4
	apply_movement 2, scr_seq_0231_R31R0101_043C
	goto scr_seq_0231_R31R0101_0230

scr_seq_0231_R31R0101_01FD:
	comparevartovalue VAR_TEMP_x4001, 7
	gotoif ne, scr_seq_0231_R31R0101_0220
	apply_movement 1, scr_seq_0231_R31R0101_03C4
	apply_movement 2, scr_seq_0231_R31R0101_0454
	goto scr_seq_0231_R31R0101_0230

scr_seq_0231_R31R0101_0220:
	apply_movement 1, scr_seq_0231_R31R0101_03DC
	apply_movement 2, scr_seq_0231_R31R0101_0474
scr_seq_0231_R31R0101_0230:
	wait 16, VAR_SPECIAL_x800C
	apply_movement 255, scr_seq_0231_R31R0101_029C
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ne, scr_seq_0231_R31R0101_0253
	apply_movement 253, scr_seq_0231_R31R0101_029C
scr_seq_0231_R31R0101_0253:
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	move_person 1, 12, 0, 28, 0
	move_person 2, 12, 0, 28, 0
	callstd std_fade_end_friend_music
	releaseall
	setvar VAR_UNK_4132, 1
	end

scr_seq_0231_R31R0101_0283:
	.byte 0x00

scr_seq_0231_R31R0101_0284:
	step 75, 1
	step_end

scr_seq_0231_R31R0101_028C:
	step 69, 1
	step_end

scr_seq_0231_R31R0101_0294:
	step 35, 1
	step_end

scr_seq_0231_R31R0101_029C:
	step 38, 1
	step_end

scr_seq_0231_R31R0101_02A4:
	step 50, 2
	step_end

scr_seq_0231_R31R0101_02AC:
	step 14, 2
	step 12, 1
	step 14, 1
	step_end

scr_seq_0231_R31R0101_02BC:
	step 14, 3
	step_end

scr_seq_0231_R31R0101_02C4:
	step 14, 2
	step 13, 1
	step 14, 1
	step_end

scr_seq_0231_R31R0101_02D4:
	step 14, 2
	step 12, 1
	step 14, 2
	step_end

scr_seq_0231_R31R0101_02E4:
	step 14, 4
	step_end

scr_seq_0231_R31R0101_02EC:
	step 14, 2
	step 13, 1
	step 14, 2
	step_end

scr_seq_0231_R31R0101_02FC:
	step 63, 1
	step 70, 1
	step 14, 2
	step 12, 1
	step 34, 1
	step_end

scr_seq_0231_R31R0101_0314:
	step 63, 1
	step 70, 1
	step 14, 2
	step_end

scr_seq_0231_R31R0101_0324:
	step 63, 1
	step 70, 1
	step 14, 2
	step 13, 1
	step 34, 1
	step_end

scr_seq_0231_R31R0101_033C:
	step 63, 1
	step 70, 1
	step 14, 2
	step 12, 1
	step 14, 1
	step_end

scr_seq_0231_R31R0101_0354:
	step 63, 1
	step 70, 1
	step 14, 3
	step_end

scr_seq_0231_R31R0101_0364:
	step 63, 1
	step 70, 1
	step 14, 2
	step 13, 1
	step 14, 1
	step_end

scr_seq_0231_R31R0101_037C:
	step 89, 1
	step 90, 6
	step 69, 1
	step_end

scr_seq_0231_R31R0101_038C:
	step 89, 1
	step 90, 4
	step 88, 1
	step 90, 2
	step 69, 1
	step_end

scr_seq_0231_R31R0101_03A4:
	step 88, 1
	step 90, 6
	step 69, 1
	step_end

scr_seq_0231_R31R0101_03B4:
	step 89, 1
	step 90, 5
	step 69, 1
	step_end

scr_seq_0231_R31R0101_03C4:
	step 89, 1
	step 90, 3
	step 88, 1
	step 90, 2
	step 69, 1
	step_end

scr_seq_0231_R31R0101_03DC:
	step 88, 1
	step 90, 5
	step 69, 1
	step_end

scr_seq_0231_R31R0101_03EC:
	step 61, 1
	step 18, 1
	step 17, 1
	step 18, 6
	step 69, 1
	step_end

scr_seq_0231_R31R0101_0404:
	step 61, 1
	step 18, 1
	step 17, 1
	step 18, 4
	step 16, 1
	step 18, 2
	step 69, 1
	step_end

scr_seq_0231_R31R0101_0424:
	step 61, 1
	step 18, 1
	step 16, 1
	step 18, 6
	step 69, 1
	step_end

scr_seq_0231_R31R0101_043C:
	step 61, 1
	step 18, 1
	step 17, 1
	step 18, 5
	step 69, 1
	step_end

scr_seq_0231_R31R0101_0454:
	step 61, 1
	step 18, 1
	step 17, 1
	step 18, 3
	step 16, 1
	step 18, 2
	step 69, 1
	step_end

scr_seq_0231_R31R0101_0474:
	step 61, 1
	step 18, 1
	step 16, 1
	step 18, 5
	step 69, 1
	step_end
scr_seq_0231_R31R0101_048C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
