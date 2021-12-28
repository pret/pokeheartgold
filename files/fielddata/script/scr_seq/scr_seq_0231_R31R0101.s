#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0231_R31R0101_0014 ; 000
	scrdef scr_seq_0231_R31R0101_000E ; 001
	scrdef scr_seq_0231_R31R0101_048C ; 002
	scrdef_end

scr_seq_0231_R31R0101_000E:
	scrcmd_144 VAR_OBJ_0
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
	.short 75, 1
	.short 254, 0

scr_seq_0231_R31R0101_028C:
	.short 69, 1
	.short 254, 0

scr_seq_0231_R31R0101_0294:
	.short 35, 1
	.short 254, 0

scr_seq_0231_R31R0101_029C:
	.short 38, 1
	.short 254, 0

scr_seq_0231_R31R0101_02A4:
	.short 50, 2
	.short 254, 0

scr_seq_0231_R31R0101_02AC:
	.short 14, 2
	.short 12, 1
	.short 14, 1
	.short 254, 0

scr_seq_0231_R31R0101_02BC:
	.short 14, 3
	.short 254, 0

scr_seq_0231_R31R0101_02C4:
	.short 14, 2
	.short 13, 1
	.short 14, 1
	.short 254, 0

scr_seq_0231_R31R0101_02D4:
	.short 14, 2
	.short 12, 1
	.short 14, 2
	.short 254, 0

scr_seq_0231_R31R0101_02E4:
	.short 14, 4
	.short 254, 0

scr_seq_0231_R31R0101_02EC:
	.short 14, 2
	.short 13, 1
	.short 14, 2
	.short 254, 0

scr_seq_0231_R31R0101_02FC:
	.short 63, 1
	.short 70, 1
	.short 14, 2
	.short 12, 1
	.short 34, 1
	.short 254, 0

scr_seq_0231_R31R0101_0314:
	.short 63, 1
	.short 70, 1
	.short 14, 2
	.short 254, 0

scr_seq_0231_R31R0101_0324:
	.short 63, 1
	.short 70, 1
	.short 14, 2
	.short 13, 1
	.short 34, 1
	.short 254, 0

scr_seq_0231_R31R0101_033C:
	.short 63, 1
	.short 70, 1
	.short 14, 2
	.short 12, 1
	.short 14, 1
	.short 254, 0

scr_seq_0231_R31R0101_0354:
	.short 63, 1
	.short 70, 1
	.short 14, 3
	.short 254, 0

scr_seq_0231_R31R0101_0364:
	.short 63, 1
	.short 70, 1
	.short 14, 2
	.short 13, 1
	.short 14, 1
	.short 254, 0

scr_seq_0231_R31R0101_037C:
	.short 89, 1
	.short 90, 6
	.short 69, 1
	.short 254, 0

scr_seq_0231_R31R0101_038C:
	.short 89, 1
	.short 90, 4
	.short 88, 1
	.short 90, 2
	.short 69, 1
	.short 254, 0

scr_seq_0231_R31R0101_03A4:
	.short 88, 1
	.short 90, 6
	.short 69, 1
	.short 254, 0

scr_seq_0231_R31R0101_03B4:
	.short 89, 1
	.short 90, 5
	.short 69, 1
	.short 254, 0

scr_seq_0231_R31R0101_03C4:
	.short 89, 1
	.short 90, 3
	.short 88, 1
	.short 90, 2
	.short 69, 1
	.short 254, 0

scr_seq_0231_R31R0101_03DC:
	.short 88, 1
	.short 90, 5
	.short 69, 1
	.short 254, 0

scr_seq_0231_R31R0101_03EC:
	.short 61, 1
	.short 18, 1
	.short 17, 1
	.short 18, 6
	.short 69, 1
	.short 254, 0

scr_seq_0231_R31R0101_0404:
	.short 61, 1
	.short 18, 1
	.short 17, 1
	.short 18, 4
	.short 16, 1
	.short 18, 2
	.short 69, 1
	.short 254, 0

scr_seq_0231_R31R0101_0424:
	.short 61, 1
	.short 18, 1
	.short 16, 1
	.short 18, 6
	.short 69, 1
	.short 254, 0

scr_seq_0231_R31R0101_043C:
	.short 61, 1
	.short 18, 1
	.short 17, 1
	.short 18, 5
	.short 69, 1
	.short 254, 0

scr_seq_0231_R31R0101_0454:
	.short 61, 1
	.short 18, 1
	.short 17, 1
	.short 18, 3
	.short 16, 1
	.short 18, 2
	.short 69, 1
	.short 254, 0

scr_seq_0231_R31R0101_0474:
	.short 61, 1
	.short 18, 1
	.short 16, 1
	.short 18, 5
	.short 69, 1
	.short 254, 0
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
