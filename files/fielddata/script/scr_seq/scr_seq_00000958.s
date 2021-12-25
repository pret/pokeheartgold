#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000958_0000001A ; 000
	scrdef scr_seq_00000958_0000002D ; 001
	scrdef scr_seq_00000958_00000040 ; 002
	scrdef scr_seq_00000958_00000053 ; 003
	scrdef scr_seq_00000958_00000066 ; 004
	scrdef scr_seq_00000958_0000007D ; 005
	scrdef_end

scr_seq_00000958_0000001A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000958_0000002D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000958_00000040:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000958_00000053:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000958_00000066:
	scrcmd_055 4, 1, 4, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000958_0000007D:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 5, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
