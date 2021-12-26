#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000147_00000006 ; 000
	scrdef_end

scr_seq_00000147_00000006:
	scrcmd_609
	lockall
	scrcmd_380 32768, 5
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000147_00000059
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000147_00000073
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000147_0000008D
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000147_000000A7
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000147_000000C1
	end

scr_seq_00000147_00000059:
	apply_movement 255, scr_seq_00000147_0000014C
	apply_movement 0, scr_seq_00000147_000001F4
	wait_movement
	goto scr_seq_00000147_000000DB

scr_seq_00000147_00000071:
	.byte 0x02, 0x00
scr_seq_00000147_00000073:
	apply_movement 255, scr_seq_00000147_00000158
	apply_movement 0, scr_seq_00000147_00000204
	wait_movement
	goto scr_seq_00000147_000000DB

scr_seq_00000147_0000008B:
	.byte 0x02, 0x00
scr_seq_00000147_0000008D:
	apply_movement 255, scr_seq_00000147_00000164
	apply_movement 0, scr_seq_00000147_00000214
	wait_movement
	goto scr_seq_00000147_000000DB

scr_seq_00000147_000000A5:
	.byte 0x02, 0x00
scr_seq_00000147_000000A7:
	apply_movement 255, scr_seq_00000147_00000170
	apply_movement 0, scr_seq_00000147_00000224
	wait_movement
	goto scr_seq_00000147_000000DB

scr_seq_00000147_000000BF:
	.byte 0x02
	.byte 0x00
scr_seq_00000147_000000C1:
	apply_movement 255, scr_seq_00000147_0000017C
	apply_movement 0, scr_seq_00000147_00000234
	wait_movement
	goto scr_seq_00000147_000000DB

scr_seq_00000147_000000D9:
	.byte 0x02, 0x00
scr_seq_00000147_000000DB:
	msgbox 0
	scrcmd_049
	closemsg
	apply_movement 255, scr_seq_00000147_00000188
	apply_movement 0, scr_seq_00000147_00000244
	wait_movement
	play_se SEQ_SE_DP_TELE2
	apply_movement 255, scr_seq_00000147_000001EC
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


scr_seq_00000147_0000014C:
	.short 12, 7
	.short 14, 11
	.short 254, 0

scr_seq_00000147_00000158:
	.short 12, 7
	.short 14, 9
	.short 254, 0

scr_seq_00000147_00000164:
	.short 12, 7
	.short 14, 7
	.short 254, 0

scr_seq_00000147_00000170:
	.short 12, 7
	.short 14, 5
	.short 254, 0

scr_seq_00000147_0000017C:
	.short 12, 7
	.short 14, 3
	.short 254, 0

scr_seq_00000147_00000188:
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

scr_seq_00000147_000001EC:
	.short 67, 1
	.short 254, 0

scr_seq_00000147_000001F4:
	.short 12, 6
	.short 14, 12
	.short 35, 1
	.short 254, 0

scr_seq_00000147_00000204:
	.short 12, 6
	.short 14, 10
	.short 35, 1
	.short 254, 0

scr_seq_00000147_00000214:
	.short 12, 6
	.short 14, 8
	.short 35, 1
	.short 254, 0

scr_seq_00000147_00000224:
	.short 12, 6
	.short 14, 6
	.short 35, 1
	.short 254, 0

scr_seq_00000147_00000234:
	.short 12, 6
	.short 14, 4
	.short 35, 1
	.short 254, 0

scr_seq_00000147_00000244:
	.short 32, 1
	.short 254, 0
	.balign 4, 0
