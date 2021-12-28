#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0805_T07R0701_00E8 ; 000
	scrdef scr_seq_0805_T07R0701_0087 ; 001
	scrdef scr_seq_0805_T07R0701_00A2 ; 002
	scrdef scr_seq_0805_T07R0701_00BD ; 003
	scrdef scr_seq_0805_T07R0701_0044 ; 004
	scrdef scr_seq_0805_T07R0701_001E ; 005
	scrdef scr_seq_0805_T07R0701_00FB ; 006
	scrdef_end

scr_seq_0805_T07R0701_001E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 6
	closemsg
	apply_movement 3, scr_seq_0805_T07R0701_003C
	wait_movement
	releaseall
	end

scr_seq_0805_T07R0701_0039:
	.byte 0x00, 0x00, 0x00

scr_seq_0805_T07R0701_003C:
	.short 35, 1
	.short 254, 0
scr_seq_0805_T07R0701_0044:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0805_T07R0701_0074
	npc_msg 4
	closemsg
	apply_movement 1, scr_seq_0805_T07R0701_00D8
	wait_movement
	releaseall
	end

scr_seq_0805_T07R0701_0074:
	npc_msg 5
	closemsg
	apply_movement 1, scr_seq_0805_T07R0701_00D8
	wait_movement
	releaseall
	end

scr_seq_0805_T07R0701_0087:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	closemsg
	apply_movement 5, scr_seq_0805_T07R0701_00E0
	wait_movement
	releaseall
	end

scr_seq_0805_T07R0701_00A2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	closemsg
	apply_movement 4, scr_seq_0805_T07R0701_00E0
	wait_movement
	releaseall
	end

scr_seq_0805_T07R0701_00BD:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	closemsg
	apply_movement 2, scr_seq_0805_T07R0701_00D8
	wait_movement
	releaseall
	end


scr_seq_0805_T07R0701_00D8:
	.short 33, 1
	.short 254, 0

scr_seq_0805_T07R0701_00E0:
	.short 32, 1
	.short 254, 0
scr_seq_0805_T07R0701_00E8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0805_T07R0701_00FB:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
