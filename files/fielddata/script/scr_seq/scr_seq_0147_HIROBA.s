#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0147_0006 ; 000
	scrdef_end

scr_seq_0147_0006:
	scrcmd_609
	lockall
	scrcmd_380 32768, 5
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0147_0059
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0147_0073
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0147_008D
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0147_00A7
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0147_00C1
	end

scr_seq_0147_0059:
	apply_movement 255, scr_seq_0147_014C
	apply_movement 0, scr_seq_0147_01F4
	wait_movement
	goto scr_seq_0147_00DB

scr_seq_0147_0071:
	.byte 0x02, 0x00
scr_seq_0147_0073:
	apply_movement 255, scr_seq_0147_0158
	apply_movement 0, scr_seq_0147_0204
	wait_movement
	goto scr_seq_0147_00DB

scr_seq_0147_008B:
	.byte 0x02, 0x00
scr_seq_0147_008D:
	apply_movement 255, scr_seq_0147_0164
	apply_movement 0, scr_seq_0147_0214
	wait_movement
	goto scr_seq_0147_00DB

scr_seq_0147_00A5:
	.byte 0x02, 0x00
scr_seq_0147_00A7:
	apply_movement 255, scr_seq_0147_0170
	apply_movement 0, scr_seq_0147_0224
	wait_movement
	goto scr_seq_0147_00DB

scr_seq_0147_00BF:
	.byte 0x02
	.byte 0x00
scr_seq_0147_00C1:
	apply_movement 255, scr_seq_0147_017C
	apply_movement 0, scr_seq_0147_0234
	wait_movement
	goto scr_seq_0147_00DB

scr_seq_0147_00D9:
	.byte 0x02, 0x00
scr_seq_0147_00DB:
	npc_msg 0
	scrcmd_049
	closemsg
	apply_movement 255, scr_seq_0147_0188
	apply_movement 0, scr_seq_0147_0244
	wait_movement
	play_se SEQ_SE_DP_TELE2
	apply_movement 255, scr_seq_0147_01EC
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


scr_seq_0147_014C:
	.short 12, 7
	.short 14, 11
	.short 254, 0

scr_seq_0147_0158:
	.short 12, 7
	.short 14, 9
	.short 254, 0

scr_seq_0147_0164:
	.short 12, 7
	.short 14, 7
	.short 254, 0

scr_seq_0147_0170:
	.short 12, 7
	.short 14, 5
	.short 254, 0

scr_seq_0147_017C:
	.short 12, 7
	.short 14, 3
	.short 254, 0

scr_seq_0147_0188:
	.short 12, 1
	.short 2, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	.short 0, 1
	.short 254, 0

scr_seq_0147_01EC:
	.short 67, 1
	.short 254, 0

scr_seq_0147_01F4:
	.short 12, 6
	.short 14, 12
	.short 35, 1
	.short 254, 0

scr_seq_0147_0204:
	.short 12, 6
	.short 14, 10
	.short 35, 1
	.short 254, 0

scr_seq_0147_0214:
	.short 12, 6
	.short 14, 8
	.short 35, 1
	.short 254, 0

scr_seq_0147_0224:
	.short 12, 6
	.short 14, 6
	.short 35, 1
	.short 254, 0

scr_seq_0147_0234:
	.short 12, 6
	.short 14, 4
	.short 35, 1
	.short 254, 0

scr_seq_0147_0244:
	.short 32, 1
	.short 254, 0
	.balign 4, 0
