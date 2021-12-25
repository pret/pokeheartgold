#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000909_00000032 ; 000
	scrdef scr_seq_00000909_00000045 ; 001
	scrdef scr_seq_00000909_00000058 ; 002
	scrdef scr_seq_00000909_0000006B ; 003
	scrdef scr_seq_00000909_0000007E ; 004
	scrdef scr_seq_00000909_00000091 ; 005
	scrdef scr_seq_00000909_000000A4 ; 006
	scrdef scr_seq_00000909_000000B7 ; 007
	scrdef scr_seq_00000909_000000CA ; 008
	scrdef scr_seq_00000909_000000DD ; 009
	scrdef scr_seq_00000909_000000EE ; 010
	scrdef scr_seq_00000909_000000FF ; 011
	scrdef_end

scr_seq_00000909_00000032:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000909_00000045:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000909_00000058:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000909_0000006B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000909_0000007E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000909_00000091:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000909_000000A4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000909_000000B7:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000909_000000CA:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000909_000000DD:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000909_000000EE:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000909_000000FF:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_00000909_00000113

scr_seq_00000909_00000111:
	.byte 0x02, 0x00
scr_seq_00000909_00000113:
	msgbox 11
	scrcmd_746
	scrcmd_750 21, 11, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 13, 255, 0
	scrcmd_751 14, 255, 1
	scrcmd_751 15, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000909_0000016A
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000909_0000018F
	goto scr_seq_00000909_00000162

scr_seq_00000909_00000160:
	.byte 0x02, 0x00
scr_seq_00000909_00000162:
	scrcmd_747
scr_seq_00000909_00000164:
	closemsg
	releaseall
	end

scr_seq_00000909_0000016A:
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000909_00000164
	closemsg
	scrcmd_815 0
	callstd 2046
	releaseall
	end

scr_seq_00000909_0000018F:
	msgbox 12
	goto scr_seq_00000909_00000113

scr_seq_00000909_00000198:
	.byte 0x02, 0x00, 0x00, 0x00
	.balign 4, 0
