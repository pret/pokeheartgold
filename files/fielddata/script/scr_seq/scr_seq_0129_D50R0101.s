#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0129_D50R0101_0066 ; 000
	scrdef scr_seq_0129_D50R0101_000A ; 001
	scrdef_end

scr_seq_0129_D50R0101_000A:
	scrcmd_477 2, 16384
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0129_D50R0101_0064
	move_person 1, 30, 1, 30, 0
	move_person 2, 30, 1, 30, 0
	move_person 3, 30, 1, 30, 0
	move_person 4, 30, 1, 30, 0
	move_person 5, 30, 1, 30, 0
	move_person 6, 30, 1, 30, 0
scr_seq_0129_D50R0101_0064:
	end

scr_seq_0129_D50R0101_0066:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
