#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0147_HIROBA_0006 ; 000
	scrdef_end

scr_seq_0147_HIROBA_0006:
	scrcmd_609
	lockall
	scrcmd_380 32768, 5
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0147_HIROBA_0059
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0147_HIROBA_0073
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0147_HIROBA_008D
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0147_HIROBA_00A7
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0147_HIROBA_00C1
	end

scr_seq_0147_HIROBA_0059:
	apply_movement 255, scr_seq_0147_HIROBA_014C
	apply_movement 0, scr_seq_0147_HIROBA_01F4
	wait_movement
	goto scr_seq_0147_HIROBA_00DB

scr_seq_0147_HIROBA_0071:
	.byte 0x02, 0x00
scr_seq_0147_HIROBA_0073:
	apply_movement 255, scr_seq_0147_HIROBA_0158
	apply_movement 0, scr_seq_0147_HIROBA_0204
	wait_movement
	goto scr_seq_0147_HIROBA_00DB

scr_seq_0147_HIROBA_008B:
	.byte 0x02, 0x00
scr_seq_0147_HIROBA_008D:
	apply_movement 255, scr_seq_0147_HIROBA_0164
	apply_movement 0, scr_seq_0147_HIROBA_0214
	wait_movement
	goto scr_seq_0147_HIROBA_00DB

scr_seq_0147_HIROBA_00A5:
	.byte 0x02, 0x00
scr_seq_0147_HIROBA_00A7:
	apply_movement 255, scr_seq_0147_HIROBA_0170
	apply_movement 0, scr_seq_0147_HIROBA_0224
	wait_movement
	goto scr_seq_0147_HIROBA_00DB

scr_seq_0147_HIROBA_00BF:
	.byte 0x02
	.byte 0x00
scr_seq_0147_HIROBA_00C1:
	apply_movement 255, scr_seq_0147_HIROBA_017C
	apply_movement 0, scr_seq_0147_HIROBA_0234
	wait_movement
	goto scr_seq_0147_HIROBA_00DB

scr_seq_0147_HIROBA_00D9:
	.byte 0x02, 0x00
scr_seq_0147_HIROBA_00DB:
	npc_msg 0
	scrcmd_049
	closemsg
	apply_movement 255, scr_seq_0147_HIROBA_0188
	apply_movement 0, scr_seq_0147_HIROBA_0244
	wait_movement
	play_se SEQ_SE_DP_TELE2
	apply_movement 255, scr_seq_0147_HIROBA_01EC
	wait_movement
	fade_screen 6, 1, 0, 0
	wait_fade
	setvar VAR_TEMP_x4003, 1
	scrcmd_176 16470, 0, 5, 2, 1
	scrcmd_436
	scrcmd_166 32780
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_663 32772
	scrcmd_150
	setvar VAR_UNK_4137, 1
	scrcmd_375 255
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end


scr_seq_0147_HIROBA_014C:
	step 12, 7
	step 14, 11
	step_end

scr_seq_0147_HIROBA_0158:
	step 12, 7
	step 14, 9
	step_end

scr_seq_0147_HIROBA_0164:
	step 12, 7
	step 14, 7
	step_end

scr_seq_0147_HIROBA_0170:
	step 12, 7
	step 14, 5
	step_end

scr_seq_0147_HIROBA_017C:
	step 12, 7
	step 14, 3
	step_end

scr_seq_0147_HIROBA_0188:
	step 12, 1
	step 2, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 0, 1
	step_end

scr_seq_0147_HIROBA_01EC:
	step 67, 1
	step_end

scr_seq_0147_HIROBA_01F4:
	step 12, 6
	step 14, 12
	step 35, 1
	step_end

scr_seq_0147_HIROBA_0204:
	step 12, 6
	step 14, 10
	step 35, 1
	step_end

scr_seq_0147_HIROBA_0214:
	step 12, 6
	step 14, 8
	step 35, 1
	step_end

scr_seq_0147_HIROBA_0224:
	step 12, 6
	step 14, 6
	step 35, 1
	step_end

scr_seq_0147_HIROBA_0234:
	step 12, 6
	step 14, 4
	step 35, 1
	step_end

scr_seq_0147_HIROBA_0244:
	step 32, 1
	step_end
	.balign 4, 0
