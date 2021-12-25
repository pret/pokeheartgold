#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000241_00000056 ; 000
	scrdef scr_seq_00000241_0000000A ; 001
	scrdef_end

scr_seq_00000241_0000000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_08A
	gotoif eq, scr_seq_00000241_00000028
	msgbox 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000241_00000028:
	msgbox 14
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000241_0000004B
	msgbox 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000241_0000004B:
	msgbox 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000241_00000056:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4114, 1
	gotoif eq, scr_seq_00000241_000000BC
	comparevartovalue VAR_UNK_4114, 2
	gotoif ge, scr_seq_00000241_00000104
	msgbox 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000241_000000EE
	scrcmd_332 32780
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_00000241_000000F9
	msgbox 3
	scrcmd_362 7, 20, 101
	setvar VAR_UNK_4114, 1
	scrcmd_190 0
	msgbox 4
	scrcmd_078 1210
	scrcmd_079
scr_seq_00000241_000000BC:
	scrcmd_781 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000241_00000178
	checkflag FLAG_UNK_0B5
	gotoif eq, scr_seq_00000241_000000E3
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000241_000000E3:
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000241_000000EE:
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000241_000000F9:
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000241_00000104:
	comparevartovalue VAR_UNK_4114, 4
	gotoif ge, scr_seq_00000241_0000016D
	msgbox 7
	setvar VAR_SPECIAL_x8004, 45
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000241_00000163
	callstd 2033
	comparevartovalue VAR_UNK_4114, 3
	gotoif ne, scr_seq_00000241_00000152
	setvar VAR_UNK_4114, 5
	goto scr_seq_00000241_00000158

scr_seq_00000241_00000152:
	setvar VAR_UNK_4114, 4
scr_seq_00000241_00000158:
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000241_00000163:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000241_0000016D:
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000241_00000178:
	setvar VAR_UNK_4114, 6
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
