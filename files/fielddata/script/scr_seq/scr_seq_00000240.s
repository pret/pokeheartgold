#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000240_00000210 ; 000
	scrdef scr_seq_00000240_00000016 ; 001
	scrdef scr_seq_00000240_0000023E ; 002
	scrdef scr_seq_00000240_00000092 ; 003
	scrdef scr_seq_00000240_00000227 ; 004
	scrdef_end

scr_seq_00000240_00000016:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000240_00000027
	clearflag FLAG_UNK_189
	end

scr_seq_00000240_00000027:
	scrcmd_484 16384
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_00000240_0000005C
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_00000240_0000005C
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_00000240_0000005C
	setflag FLAG_UNK_27E
	goto scr_seq_00000240_00000060

scr_seq_00000240_0000005C:
	clearflag FLAG_UNK_27E
scr_seq_00000240_00000060:
	scrcmd_379 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_00000240_00000088
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_00000240_00000088
	clearflag FLAG_UNK_1CD
	setflag FLAG_UNK_1CE
	end

scr_seq_00000240_00000088:
	clearflag FLAG_UNK_1CE
	setflag FLAG_UNK_1CD
	end

scr_seq_00000240_00000092:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, 32780
	scrcmd_440 32780, 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000240_00000197
	scrcmd_618 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000240_000001AB
	scrcmd_438 2, 32780
	scrcmd_440 32780, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000240_0000010B
	apply_movement 255, scr_seq_00000240_000001C0
	apply_movement 12, scr_seq_00000240_000001F4
	goto scr_seq_00000240_00000136

scr_seq_00000240_0000010B:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000240_00000126
	apply_movement 255, scr_seq_00000240_000001D4
	goto scr_seq_00000240_00000136

scr_seq_00000240_00000126:
	apply_movement 255, scr_seq_00000240_000001E0
	apply_movement 12, scr_seq_00000240_000001F4
scr_seq_00000240_00000136:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000240_0000015D
	apply_movement 253, scr_seq_00000240_00000200
	wait_movement
scr_seq_00000240_0000015D:
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 11
	lockall
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	clearflag FLAG_UNK_189
	scrcmd_438 2, 32780
	scrcmd_440 32780, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000240_00000197:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000240_000001AB:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000240_000001BF:
	.byte 0x00

scr_seq_00000240_000001C0:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000240_000001D4:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000240_000001E0:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000240_000001F4:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000240_00000200:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000240_00000210:
	scrcmd_055 28, 1, 4, 32780
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 32780
	callstd 2000
	end

scr_seq_00000240_00000227:
	scrcmd_055 29, 1, 19, 32780
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 32780
	callstd 2000
	end

scr_seq_00000240_0000023E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 21
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
