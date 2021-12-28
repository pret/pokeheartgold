#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0259_R46_000E ; 000
	scrdef scr_seq_0259_R46_0037 ; 001
	scrdef scr_seq_0259_R46_004E ; 002
	scrdef_end

scr_seq_0259_R46_000E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_079
	gotoif TRUE, scr_seq_0259_R46_002C
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0259_R46_002C:
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0259_R46_0037:
	scrcmd_055 0, 1, 3, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0259_R46_004E:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 1, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
