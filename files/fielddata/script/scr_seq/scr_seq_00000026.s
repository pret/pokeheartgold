#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000026_000000E0 ; 000
	scrdef scr_seq_00000026_000000F5 ; 001
	scrdef scr_seq_00000026_0000010A ; 002
	scrdef scr_seq_00000026_00000036 ; 003
	scrdef scr_seq_00000026_00000047 ; 004
	scrdef scr_seq_00000026_00000058 ; 005
	scrdef scr_seq_00000026_00000069 ; 006
	scrdef scr_seq_00000026_0000007A ; 007
	scrdef scr_seq_00000026_0000008B ; 008
	scrdef scr_seq_00000026_0000009C ; 009
	scrdef scr_seq_00000026_000000AD ; 010
	scrdef scr_seq_00000026_000000BE ; 011
	scrdef scr_seq_00000026_000000CF ; 012
	scrdef_end

scr_seq_00000026_00000036:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000026_00000047:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000026_00000058:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000026_00000069:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000026_0000007A:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000026_0000008B:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000026_0000009C:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 21
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000026_000000AD:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 24
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000026_000000BE:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 27
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000026_000000CF:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 30
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000026_000000E0:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 0, 32780
	callstd 2000
	end

scr_seq_00000026_000000F5:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 1, 32780
	callstd 2000
	end

scr_seq_00000026_0000010A:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 2, 32780
	callstd 2000
	end
	.balign 4, 0
