#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000246_00000012 ; 000
	scrdef scr_seq_00000246_00000033 ; 001
	scrdef scr_seq_00000246_00000181 ; 002
	scrdef scr_seq_00000246_00000198 ; 003
	scrdef_end

scr_seq_00000246_00000012:
	scrcmd_484 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000246_0000002D
	clearflag FLAG_UNK_1C3
	goto scr_seq_00000246_00000031

scr_seq_00000246_0000002D:
	setflag FLAG_UNK_1C3
scr_seq_00000246_00000031:
	end

scr_seq_00000246_00000033:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_529 32770
	scrcmd_480 32780, 32770, 65
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000246_00000159
	checkflag FLAG_UNK_ABC
	gotoif eq, scr_seq_00000246_0000016D
	comparevartovalue VAR_UNK_4094, 7
	gotoif eq, scr_seq_00000246_00000107
	checkflag FLAG_UNK_0A5
	gotoif eq, scr_seq_00000246_000000E9
	scrcmd_484 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000246_0000009A
	scrcmd_438 0, 32780
	scrcmd_440 32780, 27
	goto scr_seq_00000246_000000E1

scr_seq_00000246_0000009A:
	scrcmd_438 0, 32780
	scrcmd_440 32780, 24
	setvar VAR_SPECIAL_x8004, 242
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000246_000000FD
	callstd 2033
	setflag FLAG_UNK_0A5
	addvar VAR_UNK_4094, 1
	scrcmd_438 0, 32780
	scrcmd_440 32780, 25
scr_seq_00000246_000000E1:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000246_000000E9:
	scrcmd_438 0, 32780
	scrcmd_440 32780, 26
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000246_000000FD:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000246_00000107:
	scrcmd_484 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000246_0000012A
	scrcmd_438 0, 32780
	scrcmd_440 32780, 27
	goto scr_seq_00000246_000000E1

scr_seq_00000246_0000012A:
	scrcmd_438 0, 32780
	scrcmd_440 32780, 52
	scrcmd_193 0, 32770
	scrcmd_440 32780, 54
	scrcmd_481 32770, 65
	scrcmd_078 1185
	scrcmd_079
	setflag FLAG_UNK_ABC
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000246_00000159:
	scrcmd_438 0, 32780
	scrcmd_440 32780, 53
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000246_0000016D:
	scrcmd_438 0, 32780
	scrcmd_440 32780, 55
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000246_00000181:
	scrcmd_055 0, 1, 3, 32780
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 32780
	callstd 2000
	end

scr_seq_00000246_00000198:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 1, 32780
	callstd 2000
	end
	.balign 4, 0
