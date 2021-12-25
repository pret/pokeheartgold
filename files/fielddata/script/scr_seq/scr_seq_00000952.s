#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000952_00000032 ; 000
	scrdef scr_seq_00000952_0000007E ; 001
	scrdef scr_seq_00000952_0000008C ; 002
	scrdef scr_seq_00000952_0000009A ; 003
	scrdef scr_seq_00000952_000000A8 ; 004
	scrdef scr_seq_00000952_000000B6 ; 005
	scrdef scr_seq_00000952_000000C4 ; 006
	scrdef scr_seq_00000952_000000D2 ; 007
	scrdef scr_seq_00000952_000000E0 ; 008
	scrdef scr_seq_00000952_000000EE ; 009
	scrdef scr_seq_00000952_000000FC ; 010
	scrdef scr_seq_00000952_0000010A ; 011
	scrdef_end

scr_seq_00000952_00000032:
	setflag FLAG_UNK_9CB
	setvar VAR_TEMP_x4000, 0
	setvar VAR_TEMP_x4001, 653
scr_seq_00000952_00000042:
	scrcmd_807 16384, 16386
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_00000952_0000005F
	setflagvar VAR_TEMP_x4001
	goto scr_seq_00000952_00000063

scr_seq_00000952_0000005F:
	clearflagvar VAR_TEMP_x4001
scr_seq_00000952_00000063:
	addvar VAR_TEMP_x4000, 1
	addvar VAR_TEMP_x4001, 1
	comparevartovalue VAR_TEMP_x4000, 10
	gotoif lt, scr_seq_00000952_00000042
	end

scr_seq_00000952_0000007E:
	setvar VAR_TEMP_x4000, 10
	goto scr_seq_00000952_00000118

scr_seq_00000952_0000008A:
	.byte 0x02, 0x00
scr_seq_00000952_0000008C:
	setvar VAR_TEMP_x4000, 0
	goto scr_seq_00000952_00000118

scr_seq_00000952_00000098:
	.byte 0x02, 0x00
scr_seq_00000952_0000009A:
	setvar VAR_TEMP_x4000, 1
	goto scr_seq_00000952_00000118

scr_seq_00000952_000000A6:
	.byte 0x02, 0x00
scr_seq_00000952_000000A8:
	setvar VAR_TEMP_x4000, 2
	goto scr_seq_00000952_00000118

scr_seq_00000952_000000B4:
	.byte 0x02, 0x00
scr_seq_00000952_000000B6:
	setvar VAR_TEMP_x4000, 3
	goto scr_seq_00000952_00000118

scr_seq_00000952_000000C2:
	.byte 0x02, 0x00
scr_seq_00000952_000000C4:
	setvar VAR_TEMP_x4000, 4
	goto scr_seq_00000952_00000118

scr_seq_00000952_000000D0:
	.byte 0x02, 0x00
scr_seq_00000952_000000D2:
	setvar VAR_TEMP_x4000, 5
	goto scr_seq_00000952_00000118

scr_seq_00000952_000000DE:
	.byte 0x02, 0x00
scr_seq_00000952_000000E0:
	setvar VAR_TEMP_x4000, 6
	goto scr_seq_00000952_00000118

scr_seq_00000952_000000EC:
	.byte 0x02, 0x00
scr_seq_00000952_000000EE:
	setvar VAR_TEMP_x4000, 7
	goto scr_seq_00000952_00000118

scr_seq_00000952_000000FA:
	.byte 0x02, 0x00
scr_seq_00000952_000000FC:
	setvar VAR_TEMP_x4000, 8
	goto scr_seq_00000952_00000118

scr_seq_00000952_00000108:
	.byte 0x02, 0x00
scr_seq_00000952_0000010A:
	setvar VAR_TEMP_x4000, 9
	goto scr_seq_00000952_00000118

scr_seq_00000952_00000116:
	.byte 0x02, 0x00
scr_seq_00000952_00000118:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4001, 2730
	addvar VAR_TEMP_x4001, VAR_TEMP_x4000
	checkflagvar VAR_TEMP_x4001, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000952_00000186
	msgbox 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	closemsg
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000952_00000186
	scrcmd_784 4, 0
	scrcmd_809 16384
	scrcmd_049
	closemsg
	scrcmd_784 4, 1
	scrcmd_808 16384
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	callif eq, scr_seq_00000952_00000191
	setflagvar VAR_TEMP_x4001
	releaseall
	end

scr_seq_00000952_00000186:
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000952_00000191:
	msgbox 2
	scrcmd_078 1185
	scrcmd_079
	closemsg
	scrcmd_555 1
	return
	.balign 4, 0
