#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0810_0012 ; 000
	scrdef scr_seq_0810_001E ; 001
	scrdef scr_seq_0810_0031 ; 002
	scrdef scr_seq_0810_0044 ; 003
	scrdef_end

scr_seq_0810_0012:
	setvar VAR_SPECIAL_x8007, 0
	callstd 2002
	end

scr_seq_0810_001E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0810_0031:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0810_0044:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0810_006E
	apply_movement 6, scr_seq_0810_009C
	goto scr_seq_0810_0091

scr_seq_0810_006E:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0810_0089
	apply_movement 6, scr_seq_0810_00C0
	goto scr_seq_0810_0091

scr_seq_0810_0089:
	apply_movement 6, scr_seq_0810_00E4
scr_seq_0810_0091:
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0810_009C:
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 254, 0

scr_seq_0810_00C0:
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 254, 0

scr_seq_0810_00E4:
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
