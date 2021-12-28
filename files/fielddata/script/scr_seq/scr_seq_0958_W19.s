#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0958_W19_001A ; 000
	scrdef scr_seq_0958_W19_002D ; 001
	scrdef scr_seq_0958_W19_0040 ; 002
	scrdef scr_seq_0958_W19_0053 ; 003
	scrdef scr_seq_0958_W19_0066 ; 004
	scrdef scr_seq_0958_W19_007D ; 005
	scrdef_end

scr_seq_0958_W19_001A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0958_W19_002D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0958_W19_0040:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0958_W19_0053:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0958_W19_0066:
	scrcmd_055 4, 1, 4, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0958_W19_007D:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 5, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
