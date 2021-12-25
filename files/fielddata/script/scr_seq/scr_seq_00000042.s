#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000042_000000A7 ; 000
	scrdef scr_seq_00000042_00000179 ; 001
	scrdef scr_seq_00000042_00000480 ; 002
	scrdef scr_seq_00000042_00000491 ; 003
	scrdef scr_seq_00000042_000004A4 ; 004
	scrdef scr_seq_00000042_000004B7 ; 005
	scrdef scr_seq_00000042_000001D4 ; 006
	scrdef scr_seq_00000042_00000304 ; 007
	scrdef scr_seq_00000042_0000002A ; 008
	scrdef scr_seq_00000042_000003A0 ; 009
	scrdef_end

scr_seq_00000042_0000002A:
	comparevartovalue VAR_UNK_40FB, 10
	gotoif eq, scr_seq_00000042_0000003D
	goto scr_seq_00000042_0000009D

scr_seq_00000042_0000003D:
	scrcmd_529 16389
	comparevartovalue VAR_UNK_4102, 1
	gotoif eq, scr_seq_00000042_00000061
	comparevartovalue VAR_UNK_4102, 2
	gotoif eq, scr_seq_00000042_0000007F
	goto scr_seq_00000042_0000009D

scr_seq_00000042_00000061:
	scrcmd_698 1, 16389, 16391
	comparevartovalue VAR_TEMP_x4007, 1
	callif eq, scr_seq_00000042_0000009F
	scrcmd_490 16389
	scrcmd_490 16391
	end

scr_seq_00000042_0000007F:
	scrcmd_698 2, 16389, 16390
	comparevartovalue VAR_TEMP_x4006, 1
	callif eq, scr_seq_00000042_0000009F
	scrcmd_490 16389
	scrcmd_490 16390
	end

scr_seq_00000042_0000009D:
	end

scr_seq_00000042_0000009F:
	setvar VAR_UNK_40FB, 11
	return

scr_seq_00000042_000000A7:
	scrcmd_609
	lockall
	play_se SEQ_SE_GS_RAKKA01
	apply_movement 255, scr_seq_00000042_0000018C
	scrcmd_374 255
	wait_movement
	scrcmd_561 0, 1, 1, 8
	play_se SEQ_SE_DP_SUTYA2
	checkflag FLAG_UNK_111
	gotoif eq, scr_seq_00000042_0000016F
	checkflag FLAG_UNK_110
	gotoif eq, scr_seq_00000042_0000016F
	wait 5, VAR_SPECIAL_x800C
	apply_movement 3, scr_seq_00000042_00000194
	apply_movement 4, scr_seq_00000042_00000194
	apply_movement 5, scr_seq_00000042_000001B8
	apply_movement 6, scr_seq_00000042_000001B8
	wait_movement
	msgbox 0
	setvar VAR_SPECIAL_x8004, 469
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	closemsg
	apply_movement 3, scr_seq_00000042_000001A8
	apply_movement 4, scr_seq_00000042_000001B0
	apply_movement 5, scr_seq_00000042_000001CC
	apply_movement 6, scr_seq_00000042_000001CC
	wait_movement
	scrcmd_101 3
	scrcmd_101 4
	scrcmd_101 5
	scrcmd_101 6
	scrcmd_101 1
	scrcmd_101 0
	scrcmd_101 2
	setflag FLAG_UNK_235
	setflag FLAG_UNK_236
	setflag FLAG_UNK_110
	msgbox 1
	waitbutton
	closemsg
scr_seq_00000042_0000016F:
	setvar VAR_UNK_40CE, 0
	releaseall
	end

scr_seq_00000042_00000179:
	comparevartovalue VAR_UNK_40CE, 1
	gotoif ne, scr_seq_00000042_0000018A
	scrcmd_375 255
scr_seq_00000042_0000018A:
	end


scr_seq_00000042_0000018C:
	.short 68, 1
	.short 254, 0

scr_seq_00000042_00000194:
	.short 3, 1
	.short 75, 1
	.short 15, 5
	.short 13, 1
	.short 254, 0

scr_seq_00000042_000001A8:
	.short 14, 10
	.short 254, 0

scr_seq_00000042_000001B0:
	.short 12, 10
	.short 254, 0

scr_seq_00000042_000001B8:
	.short 2, 1
	.short 75, 1
	.short 14, 5
	.short 13, 1
	.short 254, 0

scr_seq_00000042_000001CC:
	.short 15, 10
	.short 254, 0
scr_seq_00000042_000001D4:
	scrcmd_609
	lockall
	apply_movement 7, scr_seq_00000042_000002B0
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000042_000002FC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 6
	closemsg
	apply_movement 7, scr_seq_00000042_000002BC
	wait_movement
	msgbox 7
	closemsg
	scrcmd_084 0, 30
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	scrcmd_174 6, 6, 0, 0
	scrcmd_175
	wait 1, VAR_SPECIAL_x800C
	scrcmd_174 6, 6, 1, 0
	scrcmd_175
	scrcmd_074 2305
	apply_movement 7, scr_seq_00000042_000002E4
	wait_movement
	msgbox 8
	closemsg
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	scrcmd_174 6, 6, 0, 0
	scrcmd_175
	wait 1, VAR_SPECIAL_x800C
	scrcmd_174 6, 6, 1, 0
	scrcmd_175
	scrcmd_074 2305
	setvar VAR_UNK_40FB, 3
	setflag FLAG_UNK_2E6
	setflag FLAG_UNK_2E7
	play_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 522, 0, 16, 24, 1
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000042_000002AD:
	.byte 0x00, 0x00, 0x00

scr_seq_00000042_000002B0:
	.short 14, 4
	.short 35, 1
	.short 254, 0

scr_seq_00000042_000002BC:
	.short 75, 1
	.short 63, 1
	.short 16, 3
	.short 32, 1
	.short 18, 2
	.short 32, 1
	.short 71, 1
	.short 10, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000042_000002E4:
	.short 35, 1
	.short 63, 1
	.short 34, 1
	.short 63, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000042_000002FC:
	.short 14, 4
	.short 254, 0
scr_seq_00000042_00000304:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 7, scr_seq_00000042_00000368
	apply_movement 255, scr_seq_00000042_00000398
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 255, scr_seq_00000042_00000390
	wait_movement
	msgbox 9
	closemsg
	apply_movement 7, scr_seq_00000042_00000380
	wait_movement
	msgbox 10
	closemsg
	apply_movement 7, scr_seq_00000042_00000388
	wait_movement
	scrcmd_101 7
	setflag FLAG_UNK_2E7
	setvar VAR_UNK_40FB, 10
	releaseall
	end


scr_seq_00000042_00000368:
	.short 63, 1
	.short 34, 1
	.short 75, 1
	.short 63, 1
	.short 18, 3
	.short 254, 0

scr_seq_00000042_00000380:
	.short 34, 1
	.short 254, 0

scr_seq_00000042_00000388:
	.short 15, 10
	.short 254, 0

scr_seq_00000042_00000390:
	.short 35, 1
	.short 254, 0

scr_seq_00000042_00000398:
	.short 15, 1
	.short 254, 0
scr_seq_00000042_000003A0:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000042_0000045C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	scrcmd_174 6, 6, 0, 0
	scrcmd_175
	wait 1, VAR_SPECIAL_x800C
	scrcmd_174 6, 6, 1, 0
	scrcmd_175
	scrcmd_074 2305
	apply_movement 255, scr_seq_00000042_00000468
	wait_movement
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	scrcmd_174 6, 6, 0, 0
	scrcmd_175
	wait 1, VAR_SPECIAL_x800C
	scrcmd_174 6, 6, 1, 0
	scrcmd_175
	scrcmd_074 2305
	setvar VAR_UNK_40FB, 12
	setvar VAR_UNK_4104, 1
	setflag FLAG_UNK_2DC
	setflag FLAG_UNK_2DD
	setflag FLAG_UNK_2DB
	play_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 522, 0, 16, 24, 1
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end


scr_seq_00000042_0000045C:
	.short 14, 1
	.short 13, 1
	.short 254, 0

scr_seq_00000042_00000468:
	.short 35, 1
	.short 63, 1
	.short 34, 1
	.short 63, 1
	.short 33, 1
	.short 254, 0
scr_seq_00000042_00000480:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000042_00000491:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000042_000004A4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000042_000004B7:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
