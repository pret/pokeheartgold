#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0156_P01R0301_00C4 ; 000
	scrdef scr_seq_0156_P01R0301_02D8 ; 001
	scrdef scr_seq_0156_P01R0301_0305 ; 002
	scrdef scr_seq_0156_P01R0301_0318 ; 003
	scrdef scr_seq_0156_P01R0301_01A0 ; 004
	scrdef scr_seq_0156_P01R0301_0065 ; 005
	scrdef scr_seq_0156_P01R0301_0033 ; 006
	scrdef scr_seq_0156_P01R0301_0026 ; 007
	scrdef scr_seq_0156_P01R0301_0063 ; 008
	scrdef_end

scr_seq_0156_P01R0301_0026:
	checkflag FLAG_UNK_0EB
	gotoif FALSE, scr_seq_0156_P01R0301_0031
scr_seq_0156_P01R0301_0031:
	end

scr_seq_0156_P01R0301_0033:
	comparevartovalue VAR_UNK_40E1, 1
	gotoif le, scr_seq_0156_P01R0301_004F
	comparevartovalue VAR_UNK_40E1, 2
	gotoif ge, scr_seq_0156_P01R0301_0059
	end

scr_seq_0156_P01R0301_004F:
	scrcmd_342 0, 27, 20
	end

scr_seq_0156_P01R0301_0059:
	scrcmd_342 12, 27, 20
	end

scr_seq_0156_P01R0301_0063:
	end

scr_seq_0156_P01R0301_0065:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0156_P01R0301_009C
	apply_movement 1, scr_seq_0156_P01R0301_00A4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_UNK_40DC, 1
	releaseall
	end

scr_seq_0156_P01R0301_0099:
	.byte 0x00, 0x00, 0x00

scr_seq_0156_P01R0301_009C:
	step 12, 4
	step_end

scr_seq_0156_P01R0301_00A4:
	step 71, 1
	step 10, 1
	step 72, 1
	step 3, 2
	step 65, 1
	step 11, 1
	step 0, 2
	step_end
scr_seq_0156_P01R0301_00C4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40E1, 1
	gotoif gt, scr_seq_0156_P01R0301_00E5
	goto scr_seq_0156_P01R0301_00EB

scr_seq_0156_P01R0301_00DF:
	.byte 0x16
	.byte 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_0156_P01R0301_00E5:
	goto scr_seq_0156_P01R0301_0138

scr_seq_0156_P01R0301_00EB:
	checkflag FLAG_UNK_0EB
	gotoif TRUE, scr_seq_0156_P01R0301_0101
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0156_P01R0301_0101:
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0156_P01R0301_012D
	npc_msg 2
	closemsg
	apply_movement 1, scr_seq_0156_P01R0301_0180
	wait_movement
	setvar VAR_UNK_40CB, 7
	setvar VAR_TEMP_x4000, 1
	releaseall
	end

scr_seq_0156_P01R0301_012D:
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0156_P01R0301_0138:
	checkflag FLAG_UNK_0EB
	gotoif TRUE, scr_seq_0156_P01R0301_014E
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0156_P01R0301_014E:
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0156_P01R0301_0174
	npc_msg 5
	closemsg
	apply_movement 1, scr_seq_0156_P01R0301_0180
	wait_movement
	setvar VAR_TEMP_x4000, 1
	releaseall
	end

scr_seq_0156_P01R0301_0174:
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0156_P01R0301_017F:
	.byte 0x00

scr_seq_0156_P01R0301_0180:
	step 71, 1
	step 13, 1
	step 72, 1
	step 2, 2
	step 71, 1
	step 15, 1
	step 72, 1
	step_end
scr_seq_0156_P01R0301_01A0:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0156_P01R0301_0280
	wait_movement
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 22
	gotoif ne, scr_seq_0156_P01R0301_01D3
	move_person 3, 31, 0, VAR_TEMP_x4001, 2
	goto scr_seq_0156_P01R0301_023C

scr_seq_0156_P01R0301_01D3:
	comparevartovalue VAR_TEMP_x4000, 23
	gotoif ne, scr_seq_0156_P01R0301_01F2
	move_person 3, 32, 0, VAR_TEMP_x4001, 2
	goto scr_seq_0156_P01R0301_023C

scr_seq_0156_P01R0301_01F2:
	comparevartovalue VAR_TEMP_x4000, 24
	gotoif ne, scr_seq_0156_P01R0301_0211
	move_person 3, 33, 0, VAR_TEMP_x4001, 2
	goto scr_seq_0156_P01R0301_023C

scr_seq_0156_P01R0301_0211:
	comparevartovalue VAR_TEMP_x4000, 25
	gotoif ne, scr_seq_0156_P01R0301_0230
	move_person 3, 34, 0, VAR_TEMP_x4001, 2
	goto scr_seq_0156_P01R0301_023C

scr_seq_0156_P01R0301_0230:
	move_person 3, 35, 0, VAR_TEMP_x4001, 2
scr_seq_0156_P01R0301_023C:
	apply_movement 3, scr_seq_0156_P01R0301_0288
	apply_movement 255, scr_seq_0156_P01R0301_02A0
	wait_movement
	apply_movement 3, scr_seq_0156_P01R0301_02B8
	wait_movement
	npc_msg 7
	closemsg
	apply_movement 3, scr_seq_0156_P01R0301_02C0
	wait_movement
	hide_person 3
	setflag FLAG_UNK_215
	setvar VAR_UNK_40CB, 2
	scrcmd_074 2133
	releaseall
	end

scr_seq_0156_P01R0301_027D:
	.byte 0x00, 0x00, 0x00

scr_seq_0156_P01R0301_0280:
	step 75, 1
	step_end

scr_seq_0156_P01R0301_0288:
	step 18, 9
	step 71, 1
	step 55, 1
	step 72, 1
	step 65, 1
	step_end

scr_seq_0156_P01R0301_02A0:
	step 61, 5
	step 3, 2
	step 61, 5
	step 51, 1
	step 65, 1
	step_end

scr_seq_0156_P01R0301_02B8:
	step 50, 4
	step_end

scr_seq_0156_P01R0301_02C0:
	step 38, 2
	step 0, 2
	step 16, 1
	step 2, 2
	step 18, 10
	step_end
scr_seq_0156_P01R0301_02D8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_490 16587
	comparevartovalue VAR_UNK_40CB, 7
	gotoif lt, scr_seq_0156_P01R0301_02FA
	npc_msg 9
	goto scr_seq_0156_P01R0301_02FD

scr_seq_0156_P01R0301_02FA:
	npc_msg 8
scr_seq_0156_P01R0301_02FD:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0156_P01R0301_0305:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0156_P01R0301_0318:
	end
	.balign 4, 0
