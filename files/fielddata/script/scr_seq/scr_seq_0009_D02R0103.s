#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0009_D02R0103_0060 ; 000
	scrdef scr_seq_0009_D02R0103_0075 ; 001
	scrdef scr_seq_0009_D02R0103_000E ; 002
	scrdef_end

scr_seq_0009_D02R0103_000E:
	scrcmd_375 0
	scrcmd_379 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 3
	gotoif ne, scr_seq_0009_D02R0103_003D
	show_person_at 0, 18, 0, 10, 1
	scrcmd_342 2, 20, 3
	goto scr_seq_0009_D02R0103_005E

scr_seq_0009_D02R0103_003D:
	comparevartovalue VAR_TEMP_x4001, 4
	gotoif ne, scr_seq_0009_D02R0103_005E
	show_person_at 0, 18, 0, 10, 1
	scrcmd_342 2, 20, 3
scr_seq_0009_D02R0103_005E:
	end

scr_seq_0009_D02R0103_0060:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 0, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0009_D02R0103_0075:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
