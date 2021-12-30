#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0095_D37R0103_037B ; 000
	scrdef scr_seq_0095_D37R0103_03DC ; 001
	scrdef scr_seq_0095_D37R0103_04EA ; 002
	scrdef scr_seq_0095_D37R0103_0012 ; 003
	scrdef_end

scr_seq_0095_D37R0103_0012:
	scrcmd_375 9
	scrcmd_375 10
	scrcmd_375 11
	scrcmd_375 12
	scrcmd_375 13
	scrcmd_375 14
	scrcmd_375 15
	scrcmd_375 16
	scrcmd_375 17
	checkflag FLAG_UNK_096
	gotoif TRUE, scr_seq_0095_D37R0103_0059
	checkflag FLAG_UNK_097
	gotoif TRUE, scr_seq_0095_D37R0103_01BE
	checkflag FLAG_UNK_098
	gotoif TRUE, scr_seq_0095_D37R0103_0207
	end

scr_seq_0095_D37R0103_0059:
	checkflag FLAG_UNK_097
	gotoif TRUE, scr_seq_0095_D37R0103_00B3
	checkflag FLAG_UNK_098
	gotoif TRUE, scr_seq_0095_D37R0103_013E
	scrcmd_109 0, 9
	move_person 1, 19, 0, 16, 1
	move_person 7, 19, 0, 18, 0
	move_person 9, 19, 0, 17, 0
	move_person 10, 20, 0, 17, 0
	move_person 11, 20, 0, 18, 0
	end

scr_seq_0095_D37R0103_00B3:
	checkflag FLAG_UNK_098
	gotoif TRUE, scr_seq_0095_D37R0103_02BF
	scrcmd_109 0, 9
	move_person 1, 19, 0, 16, 1
	move_person 7, 19, 0, 18, 0
	move_person 9, 19, 0, 17, 0
	move_person 10, 20, 0, 17, 0
	move_person 11, 20, 0, 18, 0
	move_person 2, 3, 0, 14, 2
	move_person 6, 1, 0, 14, 0
	move_person 12, 1, 0, 13, 0
	move_person 13, 2, 0, 13, 0
	move_person 14, 2, 0, 14, 0
	end

scr_seq_0095_D37R0103_013E:
	scrcmd_109 0, 9
	move_person 1, 19, 0, 16, 1
	move_person 7, 19, 0, 18, 0
	move_person 9, 19, 0, 17, 0
	move_person 10, 20, 0, 17, 0
	move_person 11, 20, 0, 18, 0
	move_person 3, 7, 0, 17, 3
	move_person 5, 8, 0, 18, 0
	move_person 15, 8, 0, 17, 0
	move_person 16, 9, 0, 17, 0
	move_person 17, 9, 0, 18, 0
	end

scr_seq_0095_D37R0103_01BE:
	checkflag FLAG_UNK_098
	gotoif TRUE, scr_seq_0095_D37R0103_0245
	move_person 2, 3, 0, 14, 2
	move_person 6, 1, 0, 14, 0
	move_person 12, 1, 0, 13, 0
	move_person 13, 2, 0, 13, 0
	move_person 14, 2, 0, 14, 0
	end

scr_seq_0095_D37R0103_0207:
	move_person 3, 7, 0, 17, 3
	move_person 5, 8, 0, 18, 0
	move_person 15, 8, 0, 17, 0
	move_person 16, 9, 0, 17, 0
	move_person 17, 9, 0, 18, 0
	end

scr_seq_0095_D37R0103_0245:
	move_person 2, 3, 0, 14, 2
	move_person 6, 1, 0, 14, 0
	move_person 12, 1, 0, 13, 0
	move_person 13, 2, 0, 13, 0
	move_person 14, 2, 0, 14, 0
	move_person 3, 7, 0, 17, 3
	move_person 5, 8, 0, 18, 0
	move_person 15, 8, 0, 17, 0
	move_person 16, 9, 0, 17, 0
	move_person 17, 9, 0, 18, 0
	end

scr_seq_0095_D37R0103_02BF:
	scrcmd_109 0, 9
	move_person 1, 19, 0, 16, 1
	move_person 7, 19, 0, 18, 0
	move_person 9, 19, 0, 17, 0
	move_person 10, 20, 0, 17, 0
	move_person 11, 20, 0, 18, 0
	move_person 2, 3, 0, 14, 2
	move_person 6, 1, 0, 14, 0
	move_person 12, 1, 0, 13, 0
	move_person 13, 2, 0, 13, 0
	move_person 14, 2, 0, 14, 0
	move_person 3, 7, 0, 17, 3
	move_person 5, 8, 0, 18, 0
	move_person 15, 8, 0, 17, 0
	move_person 16, 9, 0, 17, 0
	move_person 17, 9, 0, 18, 0
	end

scr_seq_0095_D37R0103_037B:
	checkflag FLAG_UNK_096
	gotoif TRUE, scr_seq_0095_D37R0103_03C9
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 0
	closemsg
	apply_movement 1, scr_seq_0095_D37R0103_0504
	apply_movement 7, scr_seq_0095_D37R0103_0504
	apply_movement 9, scr_seq_0095_D37R0103_0504
	apply_movement 10, scr_seq_0095_D37R0103_0504
	apply_movement 11, scr_seq_0095_D37R0103_0504
	wait_movement
	setflag FLAG_UNK_096
	scrcmd_109 0, 9
	releaseall
	end

scr_seq_0095_D37R0103_03C9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0095_D37R0103_03DC:
	get_person_coords 4, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 15
	gotoif ne, scr_seq_0095_D37R0103_03FD
	goto scr_seq_0095_D37R0103_041C

scr_seq_0095_D37R0103_03F7:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_0095_D37R0103_03FD:
	comparevartovalue VAR_TEMP_x4001, 16
	gotoif ne, scr_seq_0095_D37R0103_0416
	goto scr_seq_0095_D37R0103_0483

scr_seq_0095_D37R0103_0410:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_0095_D37R0103_0416:
	goto scr_seq_0095_D37R0103_03C9

scr_seq_0095_D37R0103_041C:
	checkflag FLAG_UNK_097
	gotoif TRUE, scr_seq_0095_D37R0103_03C9
	scrcmd_622 4, 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0095_D37R0103_0440
	goto scr_seq_0095_D37R0103_0446

scr_seq_0095_D37R0103_0440:
	goto scr_seq_0095_D37R0103_03C9

scr_seq_0095_D37R0103_0446:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 0
	closemsg
	apply_movement 2, scr_seq_0095_D37R0103_050C
	apply_movement 6, scr_seq_0095_D37R0103_050C
	apply_movement 12, scr_seq_0095_D37R0103_050C
	apply_movement 13, scr_seq_0095_D37R0103_050C
	apply_movement 14, scr_seq_0095_D37R0103_050C
	wait_movement
	setflag FLAG_UNK_097
	releaseall
	end

scr_seq_0095_D37R0103_0483:
	checkflag FLAG_UNK_098
	gotoif TRUE, scr_seq_0095_D37R0103_03C9
	scrcmd_622 4, 16384
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_0095_D37R0103_04A7
	goto scr_seq_0095_D37R0103_04AD

scr_seq_0095_D37R0103_04A7:
	goto scr_seq_0095_D37R0103_03C9

scr_seq_0095_D37R0103_04AD:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 0
	closemsg
	apply_movement 3, scr_seq_0095_D37R0103_0514
	apply_movement 5, scr_seq_0095_D37R0103_0514
	apply_movement 15, scr_seq_0095_D37R0103_0514
	apply_movement 16, scr_seq_0095_D37R0103_0514
	apply_movement 17, scr_seq_0095_D37R0103_0514
	wait_movement
	setflag FLAG_UNK_098
	releaseall
	end

scr_seq_0095_D37R0103_04EA:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_076 67, 0
	npc_msg 2
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0095_D37R0103_0503:
	.byte 0x00

scr_seq_0095_D37R0103_0504:
	step 9, 2
	step_end

scr_seq_0095_D37R0103_050C:
	step 10, 2
	step_end

scr_seq_0095_D37R0103_0514:
	step 11, 2
	step_end
	.balign 4, 0
