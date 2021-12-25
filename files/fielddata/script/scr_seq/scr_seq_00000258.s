#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000258_000001AB ; 000
	scrdef scr_seq_00000258_00000051 ; 001
	scrdef scr_seq_00000258_00000016 ; 002
	scrdef scr_seq_00000258_00000198 ; 003
	scrdef scr_seq_00000258_000001C2 ; 004
	scrdef_end

scr_seq_00000258_00000016:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000258_00000027
	clearflag FLAG_UNK_189
	end

scr_seq_00000258_00000027:
	scrcmd_484 16384
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_00000258_0000004B
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif eq, scr_seq_00000258_0000004B
	setflag FLAG_UNK_27E
	end

scr_seq_00000258_0000004B:
	clearflag FLAG_UNK_27E
	end

scr_seq_00000258_00000051:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, 32780
	scrcmd_440 32780, 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000258_00000133
	scrcmd_618 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000258_00000147
	scrcmd_438 2, 32780
	scrcmd_440 32780, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000258_000000C2
	apply_movement 255, scr_seq_00000258_0000015C
	goto scr_seq_00000258_000000D2

scr_seq_00000258_000000C2:
	apply_movement 255, scr_seq_00000258_00000168
	apply_movement 14, scr_seq_00000258_0000017C
scr_seq_00000258_000000D2:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000258_000000F9
	apply_movement 253, scr_seq_00000258_00000188
	wait_movement
scr_seq_00000258_000000F9:
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 47
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

scr_seq_00000258_00000133:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000258_00000147:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000258_0000015B:
	.byte 0x00

scr_seq_00000258_0000015C:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000258_00000168:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000258_0000017C:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000258_00000188:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000258_00000198:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000258_000001AB:
	scrcmd_055 1, 1, 4, 32780
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 32780
	callstd 2000
	end

scr_seq_00000258_000001C2:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 2, 32780
	callstd 2000
	end
	.balign 4, 0
