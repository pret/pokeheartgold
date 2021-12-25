#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000857_0000003E ; 000
	scrdef scr_seq_00000857_0000015B ; 001
	scrdef scr_seq_00000857_00000BF4 ; 002
	scrdef scr_seq_00000857_0000068C ; 003
	scrdef scr_seq_00000857_00000068 ; 004
	scrdef scr_seq_00000857_00000148 ; 005
	scrdef scr_seq_00000857_00000BF6 ; 006
	scrdef scr_seq_00000857_00000C09 ; 007
	scrdef scr_seq_00000857_00000C1E ; 008
	scrdef scr_seq_00000857_00000C35 ; 009
	scrdef scr_seq_00000857_00000C4A ; 010
	scrdef scr_seq_00000857_00000C5F ; 011
	scrdef scr_seq_00000857_00000C72 ; 012
	scrdef scr_seq_00000857_00000C85 ; 013
	scrdef scr_seq_00000857_00000C98 ; 014
	scrdef_end

scr_seq_00000857_0000003E:
	setflag FLAG_UNK_09F
	setvar VAR_SPECIAL_x8004, 1
	setvar VAR_SPECIAL_x8005, 2
	setvar VAR_SPECIAL_x8006, 1
	callstd 2039
	setvar VAR_UNK_4074, 2
	clearflag FLAG_UNK_197
	setflag FLAG_UNK_246
	end

scr_seq_00000857_00000068:
	scrcmd_609
	lockall
	callstd 2067
	apply_movement 7, scr_seq_00000857_000000CC
	wait_movement
	msgbox 13
	closemsg
	apply_movement 7, scr_seq_00000857_000000DC
	wait_movement
	msgbox 14
	closemsg
	apply_movement 7, scr_seq_00000857_000000E4
	wait_movement
	msgbox 15
	closemsg
	apply_movement 7, scr_seq_00000857_00000104
	wait_movement
	msgbox 16
	closemsg
	apply_movement 7, scr_seq_00000857_000000F4
	wait_movement
	callstd 2068
	scrcmd_101 7
	setflag FLAG_UNK_238
	releaseall
	setvar VAR_UNK_4074, 4
	end


scr_seq_00000857_000000CC:
	.short 75, 1
	.short 14, 5
	.short 12, 1
	.short 254, 0

scr_seq_00000857_000000DC:
	.short 12, 1
	.short 254, 0

scr_seq_00000857_000000E4:
	.short 71, 1
	.short 9, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000857_000000F4:
	.short 13, 2
	.short 14, 1
	.short 13, 7
	.short 254, 0

scr_seq_00000857_00000104:
	.short 3, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 254, 0
scr_seq_00000857_00000148:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 26
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000857_0000015B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000857_00000182
	apply_movement 2, scr_seq_00000857_00000388
	goto scr_seq_00000857_000001C0

scr_seq_00000857_00000182:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000857_0000019D
	apply_movement 2, scr_seq_00000857_000003AC
	goto scr_seq_00000857_000001C0

scr_seq_00000857_0000019D:
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000857_000001B8
	apply_movement 2, scr_seq_00000857_000003D0
	goto scr_seq_00000857_000001C0

scr_seq_00000857_000001B8:
	apply_movement 2, scr_seq_00000857_000003F4
scr_seq_00000857_000001C0:
	wait_movement
	msgbox 1
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000857_000001E9
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000857_000001F4
	end

scr_seq_00000857_000001E9:
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000857_000001F4:
	msgbox 3
	closemsg
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000857_00000218
	apply_movement 2, scr_seq_00000857_00000418
	goto scr_seq_00000857_00000256

scr_seq_00000857_00000218:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000857_00000233
	apply_movement 2, scr_seq_00000857_00000440
	goto scr_seq_00000857_00000256

scr_seq_00000857_00000233:
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000857_0000024E
	apply_movement 2, scr_seq_00000857_00000460
	goto scr_seq_00000857_00000256

scr_seq_00000857_0000024E:
	apply_movement 2, scr_seq_00000857_00000484
scr_seq_00000857_00000256:
	wait_movement
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_00000857_0000028B
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000857_000002B9
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000857_000002E7
	goto scr_seq_00000857_00000315

scr_seq_00000857_00000289:
	.byte 0x02, 0x00
scr_seq_00000857_0000028B:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 2, scr_seq_00000857_000004B0
	apply_movement 255, scr_seq_00000857_000005FC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	goto scr_seq_00000857_00000343

scr_seq_00000857_000002B7:
	.byte 0x02, 0x00
scr_seq_00000857_000002B9:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 2, scr_seq_00000857_000004B0
	apply_movement 255, scr_seq_00000857_0000061C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	goto scr_seq_00000857_00000343

scr_seq_00000857_000002E5:
	.byte 0x02, 0x00
scr_seq_00000857_000002E7:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 2, scr_seq_00000857_000004FC
	apply_movement 255, scr_seq_00000857_0000063C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	goto scr_seq_00000857_00000343

scr_seq_00000857_00000313:
	.byte 0x02, 0x00
scr_seq_00000857_00000315:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 2, scr_seq_00000857_000004B0
	apply_movement 255, scr_seq_00000857_00000670
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	goto scr_seq_00000857_00000343

scr_seq_00000857_00000341:
	.byte 0x02, 0x00
scr_seq_00000857_00000343:
	msgbox 4
	closemsg
	apply_movement 2, scr_seq_00000857_000005EC
	wait_movement
	scrcmd_307 15, 8, 15, 1, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement 2, scr_seq_00000857_000005F4
	wait_movement
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	scrcmd_101 2
	setflag FLAG_UNK_19A
	clearflag FLAG_UNK_19B
	releaseall
	end

scr_seq_00000857_00000386:
	.byte 0x00, 0x00

scr_seq_00000857_00000388:
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 254, 0

scr_seq_00000857_000003AC:
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 254, 0

scr_seq_00000857_000003D0:
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000857_000003F4:
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 254, 0

scr_seq_00000857_00000418:
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000857_00000440:
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000857_00000460:
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000857_00000484:
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000857_000004B0:
	.short 17, 8
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 19, 21
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 16, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000857_000004FC:
	.short 18, 2
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 17, 3
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 19, 2
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 17, 5
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 19, 21
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 16, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000857_000005EC:
	.short 12, 2
	.short 254, 0

scr_seq_00000857_000005F4:
	.short 12, 1
	.short 254, 0

scr_seq_00000857_000005FC:
	.short 63, 1
	.short 90, 1
	.short 89, 8
	.short 35, 1
	.short 62, 1
	.short 91, 21
	.short 32, 1
	.short 254, 0

scr_seq_00000857_0000061C:
	.short 63, 1
	.short 91, 1
	.short 89, 8
	.short 35, 1
	.short 62, 1
	.short 91, 21
	.short 32, 1
	.short 254, 0

scr_seq_00000857_0000063C:
	.short 17, 1
	.short 19, 1
	.short 38, 1
	.short 63, 2
	.short 37, 1
	.short 63, 2
	.short 18, 1
	.short 89, 6
	.short 35, 1
	.short 62, 1
	.short 91, 21
	.short 32, 1
	.short 254, 0

scr_seq_00000857_00000670:
	.short 63, 1
	.short 89, 9
	.short 35, 1
	.short 62, 1
	.short 91, 21
	.short 32, 1
	.short 254, 0
scr_seq_00000857_0000068C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	call scr_seq_00000857_00000ADD
	call scr_seq_00000857_00000A57
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif eq, scr_seq_00000857_000006BC
	msgbox 17
	closemsg
	call scr_seq_00000857_00000ADD
	releaseall
	end

scr_seq_00000857_000006BC:
	msgbox 18
scr_seq_00000857_000006BF:
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8000, 1
	gotoif ne, scr_seq_00000857_000006DE
	scrcmd_751 205, 255, 0
scr_seq_00000857_000006DE:
	comparevartovalue VAR_SPECIAL_x8001, 1
	gotoif ne, scr_seq_00000857_000006F3
	scrcmd_751 206, 255, 1
scr_seq_00000857_000006F3:
	comparevartovalue VAR_SPECIAL_x8002, 1
	gotoif ne, scr_seq_00000857_00000708
	scrcmd_751 207, 255, 2
scr_seq_00000857_00000708:
	comparevartovalue VAR_SPECIAL_x8003, 1
	gotoif ne, scr_seq_00000857_0000071D
	scrcmd_751 208, 255, 3
scr_seq_00000857_0000071D:
	scrcmd_751 126, 255, 4
	scrcmd_752
	scrcmd_747
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000857_00000769
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000857_0000080D
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000857_000008B1
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000857_00000955
	goto scr_seq_00000857_000009F9

scr_seq_00000857_00000769:
	msgbox 21
	setvar VAR_SPECIAL_x8004, 149
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000857_00000A08
	setvar VAR_SPECIAL_x8004, 151
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000857_00000A08
	setvar VAR_SPECIAL_x8004, 154
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000857_00000A08
	setvar VAR_SPECIAL_x8004, 149
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	setvar VAR_SPECIAL_x8004, 151
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	setvar VAR_SPECIAL_x8004, 154
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	takeitem ITEM_RED_SHARD, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000857_00000A17

scr_seq_00000857_0000080D:
	msgbox 22
	setvar VAR_SPECIAL_x8004, 155
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000857_00000A08
	setvar VAR_SPECIAL_x8004, 150
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000857_00000A08
	setvar VAR_SPECIAL_x8004, 160
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000857_00000A08
	setvar VAR_SPECIAL_x8004, 155
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	setvar VAR_SPECIAL_x8004, 150
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	setvar VAR_SPECIAL_x8004, 160
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	takeitem ITEM_BLUE_SHARD, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000857_00000A17

scr_seq_00000857_000008B1:
	msgbox 23
	setvar VAR_SPECIAL_x8004, 153
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000857_00000A08
	setvar VAR_SPECIAL_x8004, 158
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000857_00000A08
	setvar VAR_SPECIAL_x8004, 163
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000857_00000A08
	setvar VAR_SPECIAL_x8004, 153
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	setvar VAR_SPECIAL_x8004, 158
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	setvar VAR_SPECIAL_x8004, 163
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	takeitem ITEM_YELLOW_SHARD, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000857_00000A17

scr_seq_00000857_00000955:
	msgbox 24
	setvar VAR_SPECIAL_x8004, 152
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000857_00000A08
	setvar VAR_SPECIAL_x8004, 157
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000857_00000A08
	setvar VAR_SPECIAL_x8004, 162
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000857_00000A08
	setvar VAR_SPECIAL_x8004, 152
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	setvar VAR_SPECIAL_x8004, 157
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	setvar VAR_SPECIAL_x8004, 162
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	takeitem ITEM_GREEN_SHARD, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000857_00000A17

scr_seq_00000857_000009F9:
	msgbox 20
	closemsg
	call scr_seq_00000857_00000ADD
	releaseall
	end

scr_seq_00000857_00000A08:
	msgbox 25
	closemsg
	call scr_seq_00000857_00000ADD
	releaseall
	end

scr_seq_00000857_00000A17:
	setvar VAR_SPECIAL_x8000, 0
	setvar VAR_SPECIAL_x8001, 0
	setvar VAR_SPECIAL_x8002, 0
	setvar VAR_SPECIAL_x8003, 0
	setvar VAR_SPECIAL_x8006, 0
	call scr_seq_00000857_00000A57
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, scr_seq_00000857_00000A51
	msgbox 19
	goto scr_seq_00000857_000006BF

scr_seq_00000857_00000A51:
	goto scr_seq_00000857_000009F9

scr_seq_00000857_00000A57:
	hasitem ITEM_RED_SHARD, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000857_00000A78
	setvar VAR_SPECIAL_x8000, 1
	setvar VAR_SPECIAL_x8006, 1
scr_seq_00000857_00000A78:
	hasitem ITEM_BLUE_SHARD, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000857_00000A99
	setvar VAR_SPECIAL_x8001, 1
	setvar VAR_SPECIAL_x8006, 1
scr_seq_00000857_00000A99:
	hasitem ITEM_YELLOW_SHARD, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000857_00000ABA
	setvar VAR_SPECIAL_x8002, 1
	setvar VAR_SPECIAL_x8006, 1
scr_seq_00000857_00000ABA:
	hasitem ITEM_GREEN_SHARD, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000857_00000ADB
	setvar VAR_SPECIAL_x8003, 1
	setvar VAR_SPECIAL_x8006, 1
scr_seq_00000857_00000ADB:
	return

scr_seq_00000857_00000ADD:
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000857_00000AFE
	apply_movement 10, scr_seq_00000857_00000B28
	wait_movement
	goto scr_seq_00000857_00000B25

scr_seq_00000857_00000AFE:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000857_00000B1B
	apply_movement 10, scr_seq_00000857_00000B6C
	wait_movement
	goto scr_seq_00000857_00000B25

scr_seq_00000857_00000B1B:
	apply_movement 10, scr_seq_00000857_00000BB0
	wait_movement
scr_seq_00000857_00000B25:
	return

scr_seq_00000857_00000B27:
	.byte 0x00

scr_seq_00000857_00000B28:
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000857_00000B6C:
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 254, 0

scr_seq_00000857_00000BB0:
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 254, 0
scr_seq_00000857_00000BF4:
	end

scr_seq_00000857_00000BF6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 27
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000857_00000C09:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 12, 32780
	callstd 2000
	end

scr_seq_00000857_00000C1E:
	scrcmd_055 9, 0, 13, 32780
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 32780
	callstd 2000
	end

scr_seq_00000857_00000C35:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 10, 32780
	callstd 2000
	end

scr_seq_00000857_00000C4A:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 11, 32780
	callstd 2000
	end

scr_seq_00000857_00000C5F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000857_00000C72:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000857_00000C85:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000857_00000C98:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
