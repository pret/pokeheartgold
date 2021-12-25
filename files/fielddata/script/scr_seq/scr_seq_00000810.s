#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000810_00000012 ; 000
	scrdef scr_seq_00000810_0000001E ; 001
	scrdef scr_seq_00000810_00000031 ; 002
	scrdef scr_seq_00000810_00000044 ; 003
	scrdef_end

scr_seq_00000810_00000012:
	setvar VAR_SPECIAL_x8007, 0
	callstd 2002
	end

scr_seq_00000810_0000001E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000810_00000031:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000810_00000044:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000810_0000006E
	apply_movement 6, scr_seq_00000810_0000009C
	goto scr_seq_00000810_00000091

scr_seq_00000810_0000006E:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000810_00000089
	apply_movement 6, scr_seq_00000810_000000C0
	goto scr_seq_00000810_00000091

scr_seq_00000810_00000089:
	apply_movement 6, scr_seq_00000810_000000E4
scr_seq_00000810_00000091:
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_00000810_0000009C:
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000810_000000C0:
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 254, 0

scr_seq_00000810_000000E4:
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 254, 0
	.balign 4, 0
