#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0026_00E0 ; 000
	scrdef scr_seq_0026_00F5 ; 001
	scrdef scr_seq_0026_010A ; 002
	scrdef scr_seq_0026_0036 ; 003
	scrdef scr_seq_0026_0047 ; 004
	scrdef scr_seq_0026_0058 ; 005
	scrdef scr_seq_0026_0069 ; 006
	scrdef scr_seq_0026_007A ; 007
	scrdef scr_seq_0026_008B ; 008
	scrdef scr_seq_0026_009C ; 009
	scrdef scr_seq_0026_00AD ; 010
	scrdef scr_seq_0026_00BE ; 011
	scrdef scr_seq_0026_00CF ; 012
	scrdef_end

scr_seq_0026_0036:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0026_0047:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0026_0058:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0026_0069:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0026_007A:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0026_008B:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0026_009C:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 21
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0026_00AD:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 24
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0026_00BE:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 27
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0026_00CF:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 30
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0026_00E0:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 0, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0026_00F5:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 1, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0026_010A:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 2, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
