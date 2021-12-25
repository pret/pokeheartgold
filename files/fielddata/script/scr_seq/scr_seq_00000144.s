#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000144_00000012 ; 000
	scrdef scr_seq_00000144_000000B4 ; 001
	scrdef scr_seq_00000144_0000018C ; 002
	scrdef scr_seq_00000144_00000060 ; 003
	scrdef_end

scr_seq_00000144_00000012:
	scrcmd_489 0
	scrcmd_813 16384
	scrcmd_490 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000144_00000035
	setflag FLAG_UNK_2A8
	goto scr_seq_00000144_00000039

scr_seq_00000144_00000035:
	clearflag FLAG_UNK_2A8
scr_seq_00000144_00000039:
	scrcmd_489 1, VAR_UNK_4138
	comparevartovalue VAR_UNK_4138, 0
	gotoif ne, scr_seq_00000144_00000056
	setflag FLAG_UNK_2A7
	goto scr_seq_00000144_0000005A

scr_seq_00000144_00000056:
	clearflag FLAG_UNK_2A7
scr_seq_00000144_0000005A:
	scrcmd_489 7
	end

scr_seq_00000144_00000060:
	scrcmd_489 0
	scrcmd_813 16384
	scrcmd_490 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000144_00000083
	setflag FLAG_UNK_2A8
	goto scr_seq_00000144_00000087

scr_seq_00000144_00000083:
	clearflag FLAG_UNK_2A8
scr_seq_00000144_00000087:
	scrcmd_489 1, VAR_UNK_4138
	comparevartovalue VAR_UNK_4138, 0
	gotoif ne, scr_seq_00000144_000000A4
	setflag FLAG_UNK_2A7
	goto scr_seq_00000144_000000A8

scr_seq_00000144_000000A4:
	clearflag FLAG_UNK_2A7
scr_seq_00000144_000000A8:
	setvar VAR_UNK_40E5, 2
	scrcmd_489 7
	end

scr_seq_00000144_000000B4:
	scrcmd_489 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_489 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000144_0000016D
	scrcmd_379 VAR_SPECIAL_x800C
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000144_000000FD
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000144_00000109
	goto scr_seq_00000144_00000115

scr_seq_00000144_000000FD:
	scrcmd_190 0
	msgbox 0
	goto scr_seq_00000144_00000121

scr_seq_00000144_00000109:
	scrcmd_190 0
	msgbox 1
	goto scr_seq_00000144_00000121

scr_seq_00000144_00000115:
	scrcmd_190 0
	msgbox 2
	goto scr_seq_00000144_00000121

scr_seq_00000144_00000121:
	scrcmd_489 3, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000144_00000157
	play_fanfare SEQ_ME_ITEM
	scrcmd_489 5, VAR_SPECIAL_x8005, VAR_SPECIAL_x8006
	scrcmd_440 VAR_SPECIAL_x8005, VAR_SPECIAL_x8006
	wait_fanfare
	msgbox 20
	waitbutton
	scrcmd_489 4
	goto scr_seq_00000144_00000182

scr_seq_00000144_00000157:
	scrcmd_489 6, VAR_SPECIAL_x8005, VAR_SPECIAL_x8006
	scrcmd_440 VAR_SPECIAL_x8005, VAR_SPECIAL_x8006
	waitbutton
	goto scr_seq_00000144_00000178

scr_seq_00000144_0000016D:
	msgbox 3
	waitbutton
	goto scr_seq_00000144_00000178

scr_seq_00000144_00000178:
	closemsg
	releaseall
	scrcmd_489 7
	end

scr_seq_00000144_00000182:
	closemsg
	releaseall
	scrcmd_489 8
	end

scr_seq_00000144_0000018C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_813 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000144_00000232
	scrcmd_379 VAR_SPECIAL_x800C
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000144_000001CF
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000144_000001DB
	goto scr_seq_00000144_000001E7

scr_seq_00000144_000001CF:
	scrcmd_190 0
	msgbox 27
	goto scr_seq_00000144_000001F3

scr_seq_00000144_000001DB:
	scrcmd_190 0
	msgbox 28
	goto scr_seq_00000144_000001F3

scr_seq_00000144_000001E7:
	scrcmd_190 0
	msgbox 29
	goto scr_seq_00000144_000001F3

scr_seq_00000144_000001F3:
	scrcmd_811 32772, 32773
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000144_00000222
	callstd 2033
	scrcmd_812
	scrcmd_149 12
	msgbox 20
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000144_00000222:
	scrcmd_194 0, 32772
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000144_00000232:
	msgbox 30
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
