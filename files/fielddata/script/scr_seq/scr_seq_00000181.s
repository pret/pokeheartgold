#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000181_00000012 ; 000
	scrdef scr_seq_00000181_0000000A ; 001
	scrdef_end

scr_seq_00000181_0000000A:
	setvar VAR_TEMP_x4000, 0
	end

scr_seq_00000181_00000012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000181_000000BE
	checkflag FLAG_UNK_164
	gotoif eq, scr_seq_00000181_000000D8
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_00000181_0000006E
	hasitem ITEM_RAGECANDYBAR, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000181_0000005F
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000181_0000005F:
	msgbox 1
	closemsg
	apply_movement 0, scr_seq_00000181_00000100
	wait_movement
scr_seq_00000181_0000006E:
	msgbox 2
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000181_000000E3
	hasspaceforitem ITEM_TM64, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000181_000000F4
	scrcmd_190 0
	msgbox 3
	takeitem ITEM_RAGECANDYBAR, 1, VAR_SPECIAL_x800C
	msgbox 4
	closemsg
	setvar VAR_SPECIAL_x8004, 391
	setvar VAR_SPECIAL_x8005, 1
	callstd 2008
scr_seq_00000181_000000BE:
	msgbox 5
	closemsg
	msgbox 6
	waitbutton
	closemsg
	setvar VAR_TEMP_x4001, 1
	setflag FLAG_UNK_164
	releaseall
	end

scr_seq_00000181_000000D8:
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000181_000000E3:
	msgbox 8
	waitbutton
	closemsg
	releaseall
	setvar VAR_TEMP_x4000, 1
	end

scr_seq_00000181_000000F4:
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000181_000000FF:
	.byte 0x00

scr_seq_00000181_00000100:
	.short 75, 1
	.short 254, 0
	.balign 4, 0
