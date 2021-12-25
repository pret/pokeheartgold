#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000864_0000000E ; 000
	scrdef scr_seq_00000864_00000010 ; 001
	scrdef scr_seq_00000864_000000C8 ; 002
	scrdef_end

scr_seq_00000864_0000000E:
	end

scr_seq_00000864_00000010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_071
	gotoif eq, scr_seq_00000864_000000BD
	msgbox 1
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000864_00000041
	goto scr_seq_00000864_000000B2

scr_seq_00000864_00000041:
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_566
	scrcmd_351 32780
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000864_000000B2
	scrcmd_470 0
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_472 32780
	comparevartovar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	gotoif ne, scr_seq_00000864_000000A5
	scrcmd_473 32772
	scrcmd_474
	setflag FLAG_UNK_071
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000864_000000A5:
	scrcmd_474
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000864_000000B2:
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000864_000000BD:
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000864_000000C8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
