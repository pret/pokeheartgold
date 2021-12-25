#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000964_0000002E ; 000
	scrdef scr_seq_00000964_00000030 ; 001
	scrdef scr_seq_00000964_00000043 ; 002
	scrdef scr_seq_00000964_00000056 ; 003
	scrdef scr_seq_00000964_00000069 ; 004
	scrdef scr_seq_00000964_0000007C ; 005
	scrdef scr_seq_00000964_0000008F ; 006
	scrdef scr_seq_00000964_000000A2 ; 007
	scrdef scr_seq_00000964_000000B5 ; 008
	scrdef scr_seq_00000964_000000C8 ; 009
	scrdef scr_seq_00000964_000000DB ; 010
	scrdef_end

scr_seq_00000964_0000002E:
	end

scr_seq_00000964_00000030:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000964_00000043:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000964_00000056:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000964_00000069:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000964_0000007C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000964_0000008F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000964_000000A2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000964_000000B5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 21
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000964_000000C8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 24
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000964_000000DB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 27
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
