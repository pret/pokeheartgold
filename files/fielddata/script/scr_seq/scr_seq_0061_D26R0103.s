#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0061_D26R0103_0006 ; 000
	scrdef_end

scr_seq_0061_D26R0103_0006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_07A
	gotoif TRUE, scr_seq_0061_D26R0103_004F
	npc_msg 0
	scrcmd_049
	closemsg
	setvar VAR_SPECIAL_x8004, 221
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0061_D26R0103_005A
	callstd std_give_item_verbose
	setflag FLAG_UNK_07A
	goto scr_seq_0061_D26R0103_004F

scr_seq_0061_D26R0103_004F:
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0061_D26R0103_005A:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_0061_D26R0103_0064:
	.byte 0x02, 0x00, 0x00, 0x00
	.balign 4, 0
