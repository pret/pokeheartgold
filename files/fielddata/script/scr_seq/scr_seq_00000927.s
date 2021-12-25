#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000927_0000000C ; 000
	scrdef scr_seq_00000927_0000001F ; 001
	scrdef_end


scr_seq_00000927_0000000A:
	.byte 0x02, 0x00
scr_seq_00000927_0000000C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000927_0000001F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
