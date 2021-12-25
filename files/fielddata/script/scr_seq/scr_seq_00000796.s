#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000796_00000022 ; 000
	scrdef scr_seq_00000796_00000035 ; 001
	scrdef scr_seq_00000796_00000050 ; 002
	scrdef scr_seq_00000796_0000006B ; 003
	scrdef scr_seq_00000796_00000086 ; 004
	scrdef scr_seq_00000796_0000001A ; 005
	scrdef_end

scr_seq_00000796_0000001A:
	setvar VAR_UNK_4125, 0
	end

scr_seq_00000796_00000022:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000796_00000035:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 52, 0
	msgbox 1
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000796_00000050:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 35, 0
	msgbox 2
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000796_0000006B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 29, 0
	msgbox 3
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000796_00000086:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
