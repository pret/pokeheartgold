#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0964_002E ; 000
	scrdef scr_seq_0964_0030 ; 001
	scrdef scr_seq_0964_0043 ; 002
	scrdef scr_seq_0964_0056 ; 003
	scrdef scr_seq_0964_0069 ; 004
	scrdef scr_seq_0964_007C ; 005
	scrdef scr_seq_0964_008F ; 006
	scrdef scr_seq_0964_00A2 ; 007
	scrdef scr_seq_0964_00B5 ; 008
	scrdef scr_seq_0964_00C8 ; 009
	scrdef scr_seq_0964_00DB ; 010
	scrdef_end

scr_seq_0964_002E:
	end

scr_seq_0964_0030:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0964_0043:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0964_0056:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0964_0069:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0964_007C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0964_008F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0964_00A2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0964_00B5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 21
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0964_00C8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 24
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0964_00DB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 27
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
