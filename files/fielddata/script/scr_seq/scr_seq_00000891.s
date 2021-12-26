#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000891_0000000E ; 000
	scrdef scr_seq_00000891_000000AE ; 001
	scrdef scr_seq_00000891_000000C1 ; 002
	scrdef_end

scr_seq_00000891_0000000E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_lead_mon_index VAR_SPECIAL_x8000
	msgbox 0
	scrcmd_382 VAR_SPECIAL_x800C, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x800C, 250
	gotoif ge, scr_seq_00000891_0000006C
	comparevartovalue VAR_SPECIAL_x800C, 200
	gotoif ge, scr_seq_00000891_00000077
	comparevartovalue VAR_SPECIAL_x800C, 150
	gotoif ge, scr_seq_00000891_00000082
	comparevartovalue VAR_SPECIAL_x800C, 100
	gotoif ge, scr_seq_00000891_0000008D
	comparevartovalue VAR_SPECIAL_x800C, 50
	gotoif ge, scr_seq_00000891_00000098
	goto scr_seq_00000891_000000A3

scr_seq_00000891_0000006A:
	.byte 0x02, 0x00
scr_seq_00000891_0000006C:
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000891_00000077:
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000891_00000082:
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000891_0000008D:
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000891_00000098:
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000891_000000A3:
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000891_000000AE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000891_000000C1:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
