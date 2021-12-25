#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000080_0000003E ; 000
	scrdef scr_seq_00000080_0000008D ; 001
	scrdef scr_seq_00000080_0000017E ; 002
	scrdef scr_seq_00000080_000001CB ; 003
	scrdef scr_seq_00000080_00000218 ; 004
	scrdef scr_seq_00000080_00000265 ; 005
	scrdef scr_seq_00000080_000002B2 ; 006
	scrdef scr_seq_00000080_000003A8 ; 007
	scrdef scr_seq_00000080_000003BB ; 008
	scrdef scr_seq_00000080_000003CE ; 009
	scrdef scr_seq_00000080_000003E1 ; 010
	scrdef scr_seq_00000080_00000032 ; 011
	scrdef_end

scr_seq_00000080_00000032:
	setflag FLAG_UNK_9CB
	setvar VAR_UNK_40E5, 2
	end

scr_seq_00000080_0000003E:
	scrcmd_609
	lockall
	setvar VAR_UNK_40E6, 1
	call scr_seq_00000080_000002FF
	msgbox 0
	closemsg
	call scr_seq_00000080_00000333
	checkflag FLAG_UNK_176
	gotoif eq, scr_seq_00000080_00000077
	msgbox 1
	scrcmd_190 0
	play_fanfare SEQ_ME_ITEM
	msgbox 2
	wait_fanfare
	setflag FLAG_UNK_176
scr_seq_00000080_00000077:
	msgbox 3
	call scr_seq_00000080_000000A6
	scrcmd_747
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000080_0000008D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 4
	call scr_seq_00000080_000000A6
	goto scr_seq_00000080_0000012B

scr_seq_00000080_000000A4:
	.byte 0x02, 0x00
scr_seq_00000080_000000A6:
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 451, 255, 0
	scrcmd_751 452, 255, 1
	scrcmd_751 453, 255, 2
	scrcmd_751 454, 255, 3
	scrcmd_751 455, 255, 4
	scrcmd_751 456, 255, 5
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000080_00000138
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000080_00000170
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000080_00000146
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000080_00000154
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000080_00000162
	return

scr_seq_00000080_0000012B:
	scrcmd_747
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000080_00000138:
	msgbox 5
	msgbox 4
	goto scr_seq_00000080_000000A6

scr_seq_00000080_00000144:
	.byte 0x02, 0x00
scr_seq_00000080_00000146:
	msgbox 7
	msgbox 4
	goto scr_seq_00000080_000000A6

scr_seq_00000080_00000152:
	.byte 0x02, 0x00
scr_seq_00000080_00000154:
	msgbox 8
	msgbox 4
	goto scr_seq_00000080_000000A6

scr_seq_00000080_00000160:
	.byte 0x02, 0x00
scr_seq_00000080_00000162:
	msgbox 9
	msgbox 4
	goto scr_seq_00000080_000000A6

scr_seq_00000080_0000016E:
	.byte 0x02, 0x00
scr_seq_00000080_00000170:
	msgbox 6
	msgbox 4
	goto scr_seq_00000080_000000A6

scr_seq_00000080_0000017C:
	.byte 0x02, 0x00
scr_seq_00000080_0000017E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 17
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000080_000001AD
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000080_000001B8
	end

scr_seq_00000080_000001AD:
	msgbox 18
	goto scr_seq_00000080_000001B8

scr_seq_00000080_000001B6:
	.byte 0x02, 0x00
scr_seq_00000080_000001B8:
	msgbox 19
	goto scr_seq_00000080_000001C3

scr_seq_00000080_000001C1:
	.byte 0x02, 0x00
scr_seq_00000080_000001C3:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000080_000001CB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 20
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000080_000001FA
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000080_00000205
	end

scr_seq_00000080_000001FA:
	msgbox 21
	goto scr_seq_00000080_00000205

scr_seq_00000080_00000203:
	.byte 0x02, 0x00
scr_seq_00000080_00000205:
	msgbox 22
	goto scr_seq_00000080_00000210

scr_seq_00000080_0000020E:
	.byte 0x02, 0x00
scr_seq_00000080_00000210:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000080_00000218:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 23
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000080_00000247
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000080_00000252
	end

scr_seq_00000080_00000247:
	msgbox 24
	goto scr_seq_00000080_00000252

scr_seq_00000080_00000250:
	.byte 0x02, 0x00
scr_seq_00000080_00000252:
	msgbox 25
	goto scr_seq_00000080_0000025D

scr_seq_00000080_0000025B:
	.byte 0x02, 0x00
scr_seq_00000080_0000025D:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000080_00000265:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 26
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000080_00000294
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000080_0000029F
	end

scr_seq_00000080_00000294:
	msgbox 27
	goto scr_seq_00000080_0000029F

scr_seq_00000080_0000029D:
	.byte 0x02, 0x00
scr_seq_00000080_0000029F:
	msgbox 28
	goto scr_seq_00000080_000002AA

scr_seq_00000080_000002A8:
	.byte 0x02, 0x00
scr_seq_00000080_000002AA:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000080_000002B2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 29
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000080_000002E1
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000080_000002EC
	end

scr_seq_00000080_000002E1:
	msgbox 30
	goto scr_seq_00000080_000002EC

scr_seq_00000080_000002EA:
	.byte 0x02, 0x00
scr_seq_00000080_000002EC:
	msgbox 31
	goto scr_seq_00000080_000002F7

scr_seq_00000080_000002F5:
	.byte 0x02, 0x00
scr_seq_00000080_000002F7:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000080_000002FF:
	apply_movement 3, scr_seq_00000080_00000384
	apply_movement 4, scr_seq_00000080_00000384
	apply_movement 5, scr_seq_00000080_00000384
	apply_movement 6, scr_seq_00000080_00000384
	apply_movement 7, scr_seq_00000080_00000384
	apply_movement 8, scr_seq_00000080_00000384
	wait_movement
	return

scr_seq_00000080_00000333:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 3, scr_seq_00000080_0000038C
	apply_movement 4, scr_seq_00000080_0000038C
	apply_movement 5, scr_seq_00000080_0000038C
	apply_movement 6, scr_seq_00000080_00000394
	apply_movement 7, scr_seq_00000080_00000394
	apply_movement 8, scr_seq_00000080_00000394
	apply_movement 255, scr_seq_00000080_0000039C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	return

scr_seq_00000080_00000383:
	.byte 0x00

scr_seq_00000080_00000384:
	.short 1, 1
	.short 254, 0

scr_seq_00000080_0000038C:
	.short 3, 1
	.short 254, 0

scr_seq_00000080_00000394:
	.short 2, 1
	.short 254, 0

scr_seq_00000080_0000039C:
	.short 12, 3
	.short 34, 1
	.short 254, 0
scr_seq_00000080_000003A8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 32
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000080_000003BB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 33
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000080_000003CE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 34
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000080_000003E1:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 35
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
