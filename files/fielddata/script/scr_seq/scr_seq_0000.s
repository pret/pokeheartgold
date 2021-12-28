#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0000_000E ; 000
	scrdef scr_seq_0000_0021 ; 001
	scrdef scr_seq_0000_004C ; 002
	scrdef_end

scr_seq_0000_000E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0000_0021:
	scrcmd_609
	lockall
	npc_msg 9
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0000_0050
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0000_0063
	end

scr_seq_0000_004C:
	scrcmd_609
	lockall
scr_seq_0000_0050:
	scrcmd_151
	npc_msg 12
	scrcmd_257 94
	closemsg
	scrcmd_587
	scrcmd_449
	releaseall
	end

scr_seq_0000_0063:
	closemsg
	releaseall
	end
	.balign 4, 0
