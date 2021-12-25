#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000196_00000208 ; 000
	scrdef scr_seq_00000196_000002F6 ; 001
	scrdef scr_seq_00000196_00000309 ; 002
	scrdef scr_seq_00000196_000002E3 ; 003
	scrdef scr_seq_00000196_0000031C ; 004
	scrdef scr_seq_00000196_00000231 ; 005
	scrdef scr_seq_00000196_0000002A ; 006
	scrdef scr_seq_00000196_00000128 ; 007
	scrdef scr_seq_00000196_0000032F ; 008
	scrdef scr_seq_00000196_00000342 ; 009
	scrdef_end

scr_seq_00000196_0000002A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	hasitem ITEM_MACHINE_PART, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_00000196_00000071
	checkflag FLAG_UNK_120
	gotoif eq, scr_seq_00000196_0000005C
	setflag FLAG_UNK_120
	setvar VAR_UNK_411B, 1
scr_seq_00000196_0000005C:
	msgbox 13
	waitbutton
	closemsg
	apply_movement 0, scr_seq_00000196_00000100
	wait_movement
	releaseall
	end

scr_seq_00000196_00000071:
	msgbox 14
	closemsg
	takeitem ITEM_MACHINE_PART, 1, VAR_SPECIAL_x800C
	apply_movement 6, scr_seq_00000196_00000108
	wait_movement
	wait_se SEQ_SE_GS_W012
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 467, 0, 13, 7, 1
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	msgbox 15
	apply_movement 6, scr_seq_00000196_00000120
	wait_movement
	setflag FLAG_UNK_118
	msgbox 16
	setvar VAR_SPECIAL_x8004, 384
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	msgbox 17
	waitbutton
	closemsg
	setflag FLAG_UNK_258
	clearflag FLAG_UNK_259
	setflag FLAG_UNK_2FB
	clearflag FLAG_UNK_2FC
	setvar VAR_UNK_40FF, 1
	releaseall
	end

scr_seq_00000196_000000F5:
	.byte 0x14, 0x00, 0xd9, 0x07, 0x35, 0x00, 0x61, 0x00, 0x02, 0x00, 0x00

scr_seq_00000196_00000100:
	.short 1, 1
	.short 254, 0

scr_seq_00000196_00000108:
	.short 34, 1
	.short 61, 1
	.short 34, 1
	.short 61, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000196_00000120:
	.short 0, 1
	.short 254, 0
scr_seq_00000196_00000128:
	scrcmd_609
	lockall
	play_se SEQ_SE_GS_PHONE0
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement 0, scr_seq_00000196_00000198
	apply_movement 255, scr_seq_00000196_000001B4
	apply_movement 1, scr_seq_00000196_000001CC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 1
	closemsg
	apply_movement 0, scr_seq_00000196_000001D8
	apply_movement 255, scr_seq_00000196_000001FC
	wait_movement
	msgbox 2
	closemsg
	apply_movement 0, scr_seq_00000196_000001E8
	wait_movement
	clearflag FLAG_UNK_254
	setvar VAR_UNK_411B, 0
	setvar VAR_UNK_411C, 1
	releaseall
	end


scr_seq_00000196_00000198:
	.short 75, 1
	.short 13, 1
	.short 15, 2
	.short 12, 3
	.short 15, 5
	.short 12, 2
	.short 254, 0

scr_seq_00000196_000001B4:
	.short 66, 2
	.short 12, 1
	.short 1, 1
	.short 65, 1
	.short 3, 1
	.short 254, 0

scr_seq_00000196_000001CC:
	.short 66, 4
	.short 1, 1
	.short 254, 0

scr_seq_00000196_000001D8:
	.short 13, 2
	.short 14, 5
	.short 0, 1
	.short 254, 0

scr_seq_00000196_000001E8:
	.short 13, 3
	.short 14, 2
	.short 12, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000196_000001FC:
	.short 63, 7
	.short 1, 1
	.short 254, 0
scr_seq_00000196_00000208:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_120
	gotoif eq, scr_seq_00000196_00000226
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000196_00000226:
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000196_00000231:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_121
	gotoif eq, scr_seq_00000196_000002D8
	msgbox 8
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000196_000002CD
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_566
	scrcmd_351 32780
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000196_000002CD
	scrcmd_470 8
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_472 32780
	comparevartovar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	gotoif ne, scr_seq_00000196_000002C0
	scrcmd_473 32772
	scrcmd_474
	setflag FLAG_UNK_121
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000196_000002C0:
	scrcmd_474
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000196_000002CD:
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000196_000002D8:
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000196_000002E3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000196_000002F6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000196_00000309:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000196_0000031C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000196_0000032F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000196_00000342:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 19
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
