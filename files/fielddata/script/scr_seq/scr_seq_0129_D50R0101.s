#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0129_0066 ; 000
	scrdef scr_seq_0129_000A ; 001
	scrdef_end

scr_seq_0129_000A:
	scrcmd_477 2, 16384
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0129_0064
	show_person_at 1, 30, 1, 30, 0
	show_person_at 2, 30, 1, 30, 0
	show_person_at 3, 30, 1, 30, 0
	show_person_at 4, 30, 1, 30, 0
	show_person_at 5, 30, 1, 30, 0
	show_person_at 6, 30, 1, 30, 0
scr_seq_0129_0064:
	end

scr_seq_0129_0066:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
