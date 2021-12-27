#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0078_001E ; 000
	scrdef scr_seq_0078_002A ; 001
	scrdef scr_seq_0078_003D ; 002
	scrdef scr_seq_0078_0050 ; 003
	scrdef scr_seq_0078_0016 ; 004
	scrdef_end

scr_seq_0078_0016:
	setvar VAR_UNK_40E5, 2
	end

scr_seq_0078_001E:
	setvar VAR_SPECIAL_x8007, 0
	callstd 2002
	end

scr_seq_0078_002A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0078_003D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0078_0050:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
