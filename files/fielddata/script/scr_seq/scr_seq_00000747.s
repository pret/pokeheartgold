#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000747_00000022 ; 000
	scrdef scr_seq_00000747_00000035 ; 001
	scrdef scr_seq_00000747_00000048 ; 002
	scrdef scr_seq_00000747_0000005B ; 003
	scrdef scr_seq_00000747_0000006E ; 004
	scrdef scr_seq_00000747_00000081 ; 005
	scrdef scr_seq_00000747_00000092 ; 006
	scrdef scr_seq_00000747_000000A3 ; 007
	scrdef_end

scr_seq_00000747_00000022:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000747_00000035:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000747_00000048:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000747_0000005B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000747_0000006E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000747_00000081:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000747_00000092:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000747_000000A3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
