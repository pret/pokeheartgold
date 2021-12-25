#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000032_00000026 ; 000
	scrdef scr_seq_00000032_0000008B ; 001
	scrdef scr_seq_00000032_0000009E ; 002
	scrdef scr_seq_00000032_000000B1 ; 003
	scrdef scr_seq_00000032_000000C4 ; 004
	scrdef scr_seq_00000032_00000148 ; 005
	scrdef scr_seq_00000032_00000163 ; 006
	scrdef scr_seq_00000032_0000018C ; 007
	scrdef scr_seq_00000032_00000058 ; 008
	scrdef_end

scr_seq_00000032_00000026:
	setflag FLAG_UNK_1B7
	setflag FLAG_UNK_1B8
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_00000032_00000045
	clearflag FLAG_UNK_1B7
	goto scr_seq_00000032_00000056

scr_seq_00000032_00000045:
	comparevartovalue VAR_UNK_4077, 5
	gotoif ne, scr_seq_00000032_00000056
	clearflag FLAG_UNK_1B8
scr_seq_00000032_00000056:
	end

scr_seq_00000032_00000058:
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_00000032_00000089
	scrcmd_339 4, 18, 1, 12, 3
	scrcmd_339 5, 19, 1, 12, 1
	scrcmd_339 7, 20, 1, 12, 1
scr_seq_00000032_00000089:
	end

scr_seq_00000032_0000008B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000032_0000009E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000032_000000B1:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000032_000000C4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_00000032_000000E2
	msgbox 1
	goto scr_seq_00000032_000000E8

scr_seq_00000032_000000E2:
	goto scr_seq_00000032_000000F0

scr_seq_00000032_000000E8:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000032_000000F0:
	checkflag FLAG_UNK_091
	gotoif eq, scr_seq_00000032_0000013D
	msgbox 2
	setvar VAR_SPECIAL_x8004, 213
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000032_00000132
	callstd 2033
	msgbox 4
	waitbutton
	closemsg
	releaseall
	setflag FLAG_UNK_091
	end

scr_seq_00000032_00000132:
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000032_0000013D:
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000032_00000148:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 52, 0
	msgbox 7
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000032_00000163:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_00000032_00000181
	msgbox 10
	goto scr_seq_00000032_00000184

scr_seq_00000032_00000181:
	msgbox 11
scr_seq_00000032_00000184:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000032_0000018C:
	checktrainerflag 200
	gotoif eq, scr_seq_00000032_000001F6
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 12
	scrcmd_386 16384
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000032_000001BF
	apply_movement 2, scr_seq_00000032_00000210
	goto scr_seq_00000032_000001C7

scr_seq_00000032_000001BF:
	apply_movement 2, scr_seq_00000032_0000021C
scr_seq_00000032_000001C7:
	wait_movement
	msgbox 13
	closemsg
	scrcmd_213 200, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000032_00000209
	settrainerflag 200
	msgbox 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000032_000001F6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000032_00000209:
	scrcmd_219
	releaseall
	end

scr_seq_00000032_0000020F:
	.byte 0x00

scr_seq_00000032_00000210:
	.short 75, 1
	.short 35, 1
	.short 254, 0

scr_seq_00000032_0000021C:
	.short 75, 1
	.short 33, 1
	.short 254, 0
	.balign 4, 0
