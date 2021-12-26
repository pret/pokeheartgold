#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000262_0000001E ; 000
	scrdef scr_seq_00000262_000000BD ; 001
	scrdef scr_seq_00000262_00000181 ; 002
	scrdef scr_seq_00000262_00000198 ; 003
	scrdef scr_seq_00000262_000001AF ; 004
	scrdef scr_seq_00000262_000001C6 ; 005
	scrdef scr_seq_00000262_000001D2 ; 006
	scrdef_end

scr_seq_00000262_0000001E:
	scrcmd_609
	lockall
	scrcmd_721 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000262_0000006A
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000262_00000049
	msgbox 8
	goto scr_seq_00000262_00000062

scr_seq_00000262_00000049:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000262_0000005F
	msgbox 9
	goto scr_seq_00000262_00000062

scr_seq_00000262_0000005F:
	msgbox 10
scr_seq_00000262_00000062:
	waitbutton
	goto scr_seq_00000262_000000B5

scr_seq_00000262_0000006A:
	msgbox 4
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000262_000000B5
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	scrcmd_717 32780
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000262_000000B7
	scrcmd_718 0, 32780
	msgbox 5
	waitbutton
scr_seq_00000262_000000B5:
	closemsg
scr_seq_00000262_000000B7:
	scrcmd_747
	releaseall
	end

scr_seq_00000262_000000BD:
	scrcmd_609
	lockall
	scrcmd_719 32768, 32769
	comparevartovalue VAR_SPECIAL_x8000, 255
	gotoif eq, scr_seq_00000262_00000114
	scrcmd_718 0, 32768
	msgbox 6
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000262_00000112
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	scrcmd_720 32769
	fade_screen 6, 1, 1, 0
	wait_fade
	msgbox 7
	waitbutton
scr_seq_00000262_00000112:
	closemsg
scr_seq_00000262_00000114:
	scrcmd_747
	releaseall
	end

scr_seq_00000262_0000011A:
	scrcmd_447 1, 0
	comparevartovalue VAR_UNK_40E3, 3
	gotoif ne, scr_seq_00000262_00000155
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 173, 0, 19, 2, 1
	fade_screen 6, 1, 1, 0
	wait_fade
	goto scr_seq_00000262_00000179

scr_seq_00000262_00000155:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 173, 0, 5, 2, 1
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_00000262_00000179:
	setvar VAR_UNK_40E3, 2
	return

scr_seq_00000262_00000181:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_PINPON
	msgbox 0
	closemsg
	call scr_seq_00000262_0000011A
	releaseall
	end

scr_seq_00000262_00000198:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_PINPON
	msgbox 1
	closemsg
	call scr_seq_00000262_0000011A
	releaseall
	end

scr_seq_00000262_000001AF:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_PINPON
	msgbox 2
	closemsg
	call scr_seq_00000262_0000011A
	releaseall
	end

scr_seq_00000262_000001C6:
	setvar VAR_UNK_40E3, 2
	scrcmd_447 1, 0
	end

scr_seq_00000262_000001D2:
	scrcmd_609
	lockall
	msgbox 3
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000262_000001FA
	call scr_seq_00000262_0000011A
	releaseall
	end

scr_seq_00000262_000001FA:
	releaseall
	end
	.balign 4, 0
