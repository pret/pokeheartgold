#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000767_00000022 ; 000
	scrdef scr_seq_00000767_00000035 ; 001
	scrdef scr_seq_00000767_00000048 ; 002
	scrdef scr_seq_00000767_0000005B ; 003
	scrdef scr_seq_00000767_0000006E ; 004
	scrdef scr_seq_00000767_00000085 ; 005
	scrdef scr_seq_00000767_0000009A ; 006
	scrdef scr_seq_00000767_000000AF ; 007
	scrdef_end

scr_seq_00000767_00000022:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000767_00000035:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000767_00000048:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000767_0000005B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000767_0000006E:
	scrcmd_055 4, 0, 5, 32780
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 32780
	callstd 2000
	end

scr_seq_00000767_00000085:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 5, 32780
	callstd 2000
	end

scr_seq_00000767_0000009A:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 6, 32780
	callstd 2000
	end

scr_seq_00000767_000000AF:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 7, 32780
	callstd 2000
	end
	.balign 4, 0
