#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0939_0006 ; 000
	scrdef_end

scr_seq_0939_0006:
	checkflag FLAG_UNK_0C7
	gotoif TRUE, scr_seq_0939_005A
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	setvar VAR_SPECIAL_x8004, 337
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0939_006B
	callstd 2033
	setflag FLAG_UNK_0C7
	npc_msg 2
	waitbutton
	closemsg
	apply_movement 0, scr_seq_0939_0078
	wait_movement
	releaseall
	end

scr_seq_0939_005A:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0939_006B:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_0939_0075:
	.byte 0x00, 0x00, 0x00

scr_seq_0939_0078:
	.short 3, 1
	.short 254, 0
	.balign 4, 0
