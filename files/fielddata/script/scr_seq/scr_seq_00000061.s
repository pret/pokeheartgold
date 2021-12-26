#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000061_00000006 ; 000
	scrdef_end

scr_seq_00000061_00000006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_07A
	gotoif TRUE, scr_seq_00000061_0000004F
	msgbox 0
	scrcmd_049
	closemsg
	setvar VAR_SPECIAL_x8004, 221
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000061_0000005A
	callstd 2033
	setflag FLAG_UNK_07A
	goto scr_seq_00000061_0000004F

scr_seq_00000061_0000004F:
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000061_0000005A:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000061_00000064:
	.byte 0x02, 0x00, 0x00, 0x00
	.balign 4, 0
