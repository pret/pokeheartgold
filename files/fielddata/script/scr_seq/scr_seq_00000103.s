#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000103_0000004E ; 000
	scrdef scr_seq_00000103_0000001A ; 001
	scrdef scr_seq_00000103_00000118 ; 002
	scrdef scr_seq_00000103_00000012 ; 003
	scrdef_end

scr_seq_00000103_00000012:
	setvar VAR_TEMP_x4003, 111
	end

scr_seq_00000103_0000001A:
	comparevartovalue VAR_TEMP_x4003, 111
	gotoif ne, scr_seq_00000103_00000032
	checkflag FLAG_UNK_106
	gotoif eq, scr_seq_00000103_0000003A
scr_seq_00000103_00000032:
	setvar VAR_TEMP_x4003, 0
	end

scr_seq_00000103_0000003A:
	show_person_at 0, 34, 1, 29, 3
	setvar VAR_TEMP_x4003, 0
	end

scr_seq_00000103_0000004E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_117
	gotoif eq, scr_seq_00000103_0000010D
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 8
	gotoif eq, scr_seq_00000103_00000093
	checkflag FLAG_UNK_106
	gotoif eq, scr_seq_00000103_000000C5
	checkflag FLAG_UNK_094
	gotoif eq, scr_seq_00000103_000000B4
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000103_00000093:
	checkflag FLAG_UNK_106
	gotoif eq, scr_seq_00000103_000000C5
	checkflag FLAG_UNK_094
	gotoif eq, scr_seq_00000103_000000B4
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000103_000000B4:
	msgbox 2
	closemsg
	scrcmd_774 1
	releaseall
	setflag FLAG_UNK_106
	end

scr_seq_00000103_000000C5:
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 8
	gotoif ne, scr_seq_00000103_000000EC
	checkflag FLAG_UNK_109
	gotoif eq, scr_seq_00000103_000000F7
	checkflag FLAG_UNK_105
	gotoif eq, scr_seq_00000103_00000102
scr_seq_00000103_000000EC:
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000103_000000F7:
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000103_00000102:
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000103_0000010D:
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000103_00000118:
	wait 60, VAR_SPECIAL_x800C
	msgbox 3
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000103_00000142
	apply_movement 0, scr_seq_00000103_00000168
	goto scr_seq_00000103_0000014A

scr_seq_00000103_00000142:
	apply_movement 0, scr_seq_00000103_00000154
scr_seq_00000103_0000014A:
	wait_movement
	wait 30, VAR_SPECIAL_x800C
	end


scr_seq_00000103_00000154:
	.short 1, 1
	.short 71, 1
	.short 12, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000103_00000168:
	.short 3, 1
	.short 71, 1
	.short 14, 1
	.short 72, 1
	.short 254, 0
	.balign 4, 0
