#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0078_D32PC0101_001E ; 000
	scrdef scr_seq_0078_D32PC0101_002A ; 001
	scrdef scr_seq_0078_D32PC0101_003D ; 002
	scrdef scr_seq_0078_D32PC0101_0050 ; 003
	scrdef scr_seq_0078_D32PC0101_0016 ; 004
	scrdef_end

scr_seq_0078_D32PC0101_0016:
	setvar VAR_UNK_40E5, 2
	end

scr_seq_0078_D32PC0101_001E:
	setvar VAR_SPECIAL_x8007, 0
	callstd 2002
	end

scr_seq_0078_D32PC0101_002A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0078_D32PC0101_003D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0078_D32PC0101_0050:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
