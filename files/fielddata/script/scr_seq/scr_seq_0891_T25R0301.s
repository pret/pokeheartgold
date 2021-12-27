#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0891_000E ; 000
	scrdef scr_seq_0891_00AE ; 001
	scrdef scr_seq_0891_00C1 ; 002
	scrdef_end

scr_seq_0891_000E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_lead_mon_index VAR_SPECIAL_x8000
	npc_msg 0
	scrcmd_382 VAR_SPECIAL_x800C, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x800C, 250
	gotoif ge, scr_seq_0891_006C
	comparevartovalue VAR_SPECIAL_x800C, 200
	gotoif ge, scr_seq_0891_0077
	comparevartovalue VAR_SPECIAL_x800C, 150
	gotoif ge, scr_seq_0891_0082
	comparevartovalue VAR_SPECIAL_x800C, 100
	gotoif ge, scr_seq_0891_008D
	comparevartovalue VAR_SPECIAL_x800C, 50
	gotoif ge, scr_seq_0891_0098
	goto scr_seq_0891_00A3

scr_seq_0891_006A:
	.byte 0x02, 0x00
scr_seq_0891_006C:
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0891_0077:
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0891_0082:
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0891_008D:
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0891_0098:
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0891_00A3:
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0891_00AE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0891_00C1:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
