#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000031_00000022 ; 000
	scrdef scr_seq_00000031_00000054 ; 001
	scrdef scr_seq_00000031_00000067 ; 002
	scrdef scr_seq_00000031_0000007A ; 003
	scrdef scr_seq_00000031_000000A3 ; 004
	scrdef scr_seq_00000031_000000B6 ; 005
	scrdef scr_seq_00000031_00000158 ; 006
	scrdef scr_seq_00000031_0000017E ; 007
	scrdef_end

scr_seq_00000031_00000022:
	setflag FLAG_UNK_1B7
	setflag FLAG_UNK_1B8
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_00000031_00000041
	clearflag FLAG_UNK_1B7
	goto scr_seq_00000031_00000052

scr_seq_00000031_00000041:
	comparevartovalue VAR_UNK_4077, 5
	gotoif ne, scr_seq_00000031_00000052
	clearflag FLAG_UNK_1B8
scr_seq_00000031_00000052:
	end

scr_seq_00000031_00000054:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000031_00000067:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000031_0000007A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_00000031_00000098
	msgbox 1
	goto scr_seq_00000031_0000009B

scr_seq_00000031_00000098:
	msgbox 2
scr_seq_00000031_0000009B:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000031_000000A3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000031_000000B6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_00000031_000000E7
	getitemquantity 476, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000031_000000F5
	msgbox 3
	goto scr_seq_00000031_000000ED

scr_seq_00000031_000000E7:
	goto scr_seq_00000031_00000100

scr_seq_00000031_000000ED:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000031_000000F5:
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000031_00000100:
	checkflag FLAG_UNK_08F
	gotoif TRUE, scr_seq_00000031_0000014D
	msgbox 5
	setvar VAR_SPECIAL_x8004, 338
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000031_00000142
	callstd 2033
	msgbox 7
	waitbutton
	closemsg
	releaseall
	setflag FLAG_UNK_08F
	end

scr_seq_00000031_00000142:
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000031_0000014D:
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000031_00000158:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	getitemquantity 475, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000031_000001B4
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000031_0000017E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_090
	gotoif TRUE, scr_seq_00000031_000001E2
	msgbox 11
	closemsg
	getitemquantity 475, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000031_000001B4
	msgbox 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000031_000001B4:
	buffer_players_name 0
	msgbox 12
	closemsg
	apply_movement 7, scr_seq_00000031_000001F0
	apply_movement 8, scr_seq_00000031_000001F8
	wait_movement
	releaseall
	setflag FLAG_UNK_1BF
	hide_person 7
	hide_person 8
	setflag FLAG_UNK_090
	end

scr_seq_00000031_000001E2:
	msgbox 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000031_000001ED:
	.byte 0x00, 0x00, 0x00

scr_seq_00000031_000001F0:
	.short 14, 2
	.short 254, 0

scr_seq_00000031_000001F8:
	.short 15, 2
	.short 254, 0
	.balign 4, 0
