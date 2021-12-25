#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000963_0000003E ; 000
	scrdef scr_seq_00000963_0000000E ; 001
	scrdef scr_seq_00000963_000000EC ; 002
	scrdef_end

scr_seq_00000963_0000000E:
	comparevartovalue VAR_UNK_40E5, 1
	gotoif ge, scr_seq_00000963_00000036
	checkflag FLAG_UNK_964
	gotoif eq, scr_seq_00000963_00000028
	end

scr_seq_00000963_00000028:
	scrcmd_339 0, 3, 0, 3, 0
	end

scr_seq_00000963_00000036:
	setvar VAR_UNK_40E5, 2
	end

scr_seq_00000963_0000003E:
	play_se SEQ_SE_DP_SELECT
	lockall
	checkflag FLAG_UNK_0FB
	gotoif eq, scr_seq_00000963_000000BE
	checkflag FLAG_UNK_964
	gotoif eq, scr_seq_00000963_000000B1
	scrcmd_386 16384
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_00000963_00000079
	apply_movement 0, scr_seq_00000963_000000E4
	goto scr_seq_00000963_0000009C

scr_seq_00000963_00000079:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000963_00000094
	apply_movement 0, scr_seq_00000963_000000DC
	goto scr_seq_00000963_0000009C

scr_seq_00000963_00000094:
	apply_movement 0, scr_seq_00000963_000000D4
scr_seq_00000963_0000009C:
	wait_movement
	msgbox 0
	closemsg
	apply_movement 0, scr_seq_00000963_000000CC
	wait_movement
	releaseall
	end

scr_seq_00000963_000000B1:
	msgbox 1
	closemsg
	releaseall
	setflag FLAG_UNK_0FB
	end

scr_seq_00000963_000000BE:
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000963_000000C9:
	.byte 0x00, 0x00, 0x00

scr_seq_00000963_000000CC:
	.short 32, 1
	.short 254, 0

scr_seq_00000963_000000D4:
	.short 33, 1
	.short 254, 0

scr_seq_00000963_000000DC:
	.short 35, 1
	.short 254, 0

scr_seq_00000963_000000E4:
	.short 34, 1
	.short 254, 0
scr_seq_00000963_000000EC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_964
	gotoif eq, scr_seq_00000963_00000108
	msgbox 3
	goto scr_seq_00000963_0000010B

scr_seq_00000963_00000108:
	msgbox 4
scr_seq_00000963_0000010B:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
