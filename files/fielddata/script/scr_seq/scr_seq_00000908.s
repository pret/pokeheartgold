#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000908_00000036 ; 000
	scrdef scr_seq_00000908_00000049 ; 001
	scrdef scr_seq_00000908_0000005C ; 002
	scrdef scr_seq_00000908_0000006F ; 003
	scrdef scr_seq_00000908_00000082 ; 004
	scrdef scr_seq_00000908_00000095 ; 005
	scrdef scr_seq_00000908_000000A8 ; 006
	scrdef scr_seq_00000908_000000BB ; 007
	scrdef scr_seq_00000908_000000CE ; 008
	scrdef scr_seq_00000908_000000E1 ; 009
	scrdef scr_seq_00000908_000000F2 ; 010
	scrdef scr_seq_00000908_00000103 ; 011
	scrdef scr_seq_00000908_0000019E ; 012
	scrdef_end

scr_seq_00000908_00000036:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000908_00000049:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000908_0000005C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000908_0000006F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000908_00000082:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000908_00000095:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000908_000000A8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000908_000000BB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000908_000000CE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000908_000000E1:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000908_000000F2:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000908_00000103:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8005, 6
	goto scr_seq_00000908_00000117

scr_seq_00000908_00000115:
	.byte 0x02, 0x00
scr_seq_00000908_00000117:
	msgbox 13
	scrcmd_746
	scrcmd_750 21, 11, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 15, 255, 0
	scrcmd_751 16, 255, 1
	scrcmd_751 17, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000908_0000016E
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000908_00000193
	goto scr_seq_00000908_00000166

scr_seq_00000908_00000164:
	.byte 0x02, 0x00
scr_seq_00000908_00000166:
	scrcmd_747
scr_seq_00000908_00000168:
	closemsg
	releaseall
	end

scr_seq_00000908_0000016E:
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000908_00000168
	closemsg
	scrcmd_815 0
	callstd 2046
	releaseall
	end

scr_seq_00000908_00000193:
	msgbox 14
	goto scr_seq_00000908_00000117

scr_seq_00000908_0000019C:
	.byte 0x02, 0x00
scr_seq_00000908_0000019E:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8005, 5
	goto scr_seq_00000908_000001B2

scr_seq_00000908_000001B0:
	.byte 0x02, 0x00
scr_seq_00000908_000001B2:
	msgbox 11
	scrcmd_746
	scrcmd_750 21, 11, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 15, 255, 0
	scrcmd_751 16, 255, 1
	scrcmd_751 17, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000908_00000209
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000908_0000022E
	goto scr_seq_00000908_00000201

scr_seq_00000908_000001FF:
	.byte 0x02
	.byte 0x00
scr_seq_00000908_00000201:
	scrcmd_747
scr_seq_00000908_00000203:
	closemsg
	releaseall
	end

scr_seq_00000908_00000209:
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000908_00000203
	closemsg
	scrcmd_815 0
	callstd 2046
	releaseall
	end

scr_seq_00000908_0000022E:
	msgbox 12
	goto scr_seq_00000908_000001B2

scr_seq_00000908_00000237:
	.byte 0x02, 0x00, 0x00, 0x00, 0x00
	.balign 4, 0
