#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000812_0000002A ; 000
	scrdef scr_seq_00000812_000002CC ; 001
	scrdef scr_seq_00000812_000002A8 ; 002
	scrdef scr_seq_00000812_00000083 ; 003
	scrdef scr_seq_00000812_00000403 ; 004
	scrdef scr_seq_00000812_0000044F ; 005
	scrdef scr_seq_00000812_00000465 ; 006
	scrdef scr_seq_00000812_00000478 ; 007
	scrdef scr_seq_00000812_0000048B ; 008
	scrdef scr_seq_00000812_000004A4 ; 009
	scrdef_end

scr_seq_00000812_0000002A:
	checkflag FLAG_UNK_9CD
	gotoif eq, scr_seq_00000812_0000003B
	setvar VAR_UNK_4123, 2000
scr_seq_00000812_0000003B:
	clearflag FLAG_UNK_999
	setflag FLAG_UNK_9CD
	comparevartovalue VAR_UNK_4124, 0
	gotoif ne, scr_seq_00000812_00000052
	end

scr_seq_00000812_00000052:
	scrcmd_338 6, 8, 9
	scrcmd_341 6, 2
	end

scr_seq_00000812_00000062:
	comparevartovalue VAR_UNK_4123, 2000
	gotoif eq, scr_seq_00000812_00000079
	scrcmd_190 1
	scrcmd_198 2, 16675
	return

scr_seq_00000812_00000079:
	scrcmd_191 1
	scrcmd_198 2, 16675
	return

scr_seq_00000812_00000083:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_136
	gotoif eq, scr_seq_00000812_0000019B
	setflag FLAG_UNK_136
	scrcmd_190 0
	scrcmd_132 0, 1
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000812_000000C5
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000812_00000190
	end

scr_seq_00000812_000000C5:
	msgbox 2
	goto scr_seq_00000812_000000E9

scr_seq_00000812_000000CE:
	msgbox 3
	goto scr_seq_00000812_000000E9

scr_seq_00000812_000000D7:
	msgbox 4
	goto scr_seq_00000812_000000E9

scr_seq_00000812_000000E0:
	msgbox 5
	goto scr_seq_00000812_000000E9

scr_seq_00000812_000000E9:
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 194, 255, 0
	scrcmd_751 195, 255, 1
	scrcmd_751 196, 255, 2
	scrcmd_751 198, 255, 4
	scrcmd_752
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000812_000000CE
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000812_000000D7
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_00000812_000000E0
	goto scr_seq_00000812_00000144

scr_seq_00000812_00000144:
	msgbox 6
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000812_00000190
scr_seq_00000812_0000015C:
	setvar VAR_SPECIAL_x800C, 0
	scrcmd_507 32780
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif lt, scr_seq_00000812_00000274
	setvar VAR_SPECIAL_x800C, 0
	scrcmd_509 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000812_00000260
	goto scr_seq_00000812_000001FB

scr_seq_00000812_00000190:
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000812_0000019B:
	scrcmd_190 0
	scrcmd_132 8, 9
	goto scr_seq_00000812_000001A8

scr_seq_00000812_000001A8:
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 199, 255, 0
	scrcmd_751 200, 255, 1
	scrcmd_751 201, 255, 2
	scrcmd_752
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000812_0000015C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000812_0000026B
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_00000812_00000190
	goto scr_seq_00000812_00000190

scr_seq_00000812_000001FB:
	call scr_seq_00000812_00000062
	scrcmd_190 0
	scrcmd_132 10, 11
	closemsg
	apply_movement 6, scr_seq_00000812_00000280
	wait_movement
	scrcmd_600
	apply_movement 255, scr_seq_00000812_00000294
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 109, 0, 24, 47, 0
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	scrcmd_098 253
	scrcmd_606
	apply_movement 253, scr_seq_00000812_000002A0
	wait_movement
	scrcmd_099 253
	releaseall
	end

scr_seq_00000812_00000260:
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000812_0000026B:
	msgbox 13
	goto scr_seq_00000812_000000E9

scr_seq_00000812_00000274:
	msgbox 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000812_0000027F:
	.byte 0x00

scr_seq_00000812_00000280:
	.short 36, 1
	.short 12, 2
	.short 15, 1
	.short 38, 1
	.short 254, 0

scr_seq_00000812_00000294:
	.short 12, 5
	.short 69, 1
	.short 254, 0

scr_seq_00000812_000002A0:
	.short 0, 1
	.short 254, 0
scr_seq_00000812_000002A8:
	scrcmd_609
	lockall
	setvar VAR_UNK_4124, 0
	apply_movement 255, scr_seq_00000812_000003D4
	wait_movement
	apply_movement 6, scr_seq_00000812_000003BC
	wait_movement
	scrcmd_606
	releaseall
	end

scr_seq_00000812_000002CC:
	scrcmd_609
	lockall
	setvar VAR_UNK_4124, 0
	apply_movement 255, scr_seq_00000812_000003DC
	apply_movement 6, scr_seq_00000812_000003C8
	wait_movement
	scrcmd_511 0, 32780
	scrcmd_198 0, 32780
	scrcmd_511 1, 32780
	scrcmd_198 1, 32780
	scrcmd_511 2, 32780
	scrcmd_198 2, 32780
	scrcmd_511 3, 32780
	scrcmd_198 3, 32780
	msgbox 16
	scrcmd_511 3, 32780
	comparevartovar VAR_SPECIAL_x800C, VAR_UNK_4123
	gotoif gt, scr_seq_00000812_00000339
	msgbox 18
	call scr_seq_00000812_00000669
	goto scr_seq_00000812_0000034E

scr_seq_00000812_00000339:
	msgbox 17
	call scr_seq_00000812_00000669
	scrcmd_511 3, 16675
	goto scr_seq_00000812_0000034E

scr_seq_00000812_0000034E:
	msgbox 19
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000812_00000391
	msgbox 24
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000812_00000384
	goto scr_seq_00000812_0000034E

scr_seq_00000812_00000384:
	msgbox 21
	scrcmd_049
	closemsg
	goto scr_seq_00000812_000003A1

scr_seq_00000812_00000391:
	scrcmd_510
	msgbox 20
	msgbox 22
	closemsg
	goto scr_seq_00000812_000003A1

scr_seq_00000812_000003A1:
	apply_movement 255, scr_seq_00000812_000003E8
	wait_movement
	apply_movement 6, scr_seq_00000812_000003BC
	wait_movement
	scrcmd_606
	releaseall
	end

scr_seq_00000812_000003BB:
	.byte 0x00

scr_seq_00000812_000003BC:
	.short 14, 1
	.short 13, 2
	.short 254, 0

scr_seq_00000812_000003C8:
	.short 63, 2
	.short 34, 1
	.short 254, 0

scr_seq_00000812_000003D4:
	.short 13, 5
	.short 254, 0

scr_seq_00000812_000003DC:
	.short 13, 2
	.short 39, 1
	.short 254, 0

scr_seq_00000812_000003E8:
	.short 13, 4
	.short 254, 0
	.byte 0x49, 0x00, 0xdc, 0x05, 0x60, 0x00, 0x68, 0x00, 0x2d, 0x00, 0x19, 0x32, 0x00, 0x35, 0x00, 0x61
	.byte 0x00, 0x02, 0x00
scr_seq_00000812_00000403:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_190 0
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_00000812_00000444
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000812_00000439
	goto scr_seq_00000812_0000042E

scr_seq_00000812_0000042E:
	msgbox 41
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000812_00000439:
	msgbox 42
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000812_00000444:
	msgbox 43
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000812_0000044F:
	scrcmd_190 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 44
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000812_00000465:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 45
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000812_00000478:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 33
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000812_0000048B:
	call scr_seq_00000812_00000062
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 25
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000812_000004A4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_TEMP_x4009, 1
	gotoif eq, scr_seq_00000812_00000511
	scrcmd_528 32780
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_00000812_0000051C
	comparevartovalue VAR_SPECIAL_x800C, 5
	gotoif eq, scr_seq_00000812_0000055D
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000812_0000059E
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_00000812_000005D7
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000812_00000610
	goto scr_seq_00000812_00000506

scr_seq_00000812_00000504:
	.byte 0x02, 0x00
scr_seq_00000812_00000506:
	msgbox 34
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000812_00000511:
	msgbox 40
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000812_0000051C:
	hasitem ITEM_FASHION_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000812_00000506
	setvar VAR_SPECIAL_x8004, 97
	setvar VAR_SPECIAL_x8005, 1
	scrcmd_404 32772, 32773, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000812_00000506
	msgbox 35
	goto scr_seq_00000812_00000649

scr_seq_00000812_0000055B:
	.byte 0x02, 0x00
scr_seq_00000812_0000055D:
	hasitem ITEM_FASHION_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000812_00000506
	setvar VAR_SPECIAL_x8004, 98
	setvar VAR_SPECIAL_x8005, 1
	scrcmd_404 32772, 32773, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000812_00000506
	msgbox 36
	goto scr_seq_00000812_00000649

scr_seq_00000812_0000059C:
	.byte 0x02, 0x00
scr_seq_00000812_0000059E:
	hasitem ITEM_FASHION_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000812_00000506
	setvar VAR_SPECIAL_x8004, 14
	scrcmd_407 32772, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000812_00000506
	msgbox 37
	goto scr_seq_00000812_00000659

scr_seq_00000812_000005D5:
	.byte 0x02, 0x00
scr_seq_00000812_000005D7:
	hasitem ITEM_FASHION_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000812_00000506
	setvar VAR_SPECIAL_x8004, 15
	scrcmd_407 32772, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000812_00000506
	msgbox 38
	goto scr_seq_00000812_00000659

scr_seq_00000812_0000060E:
	.byte 0x02, 0x00
scr_seq_00000812_00000610:
	hasitem ITEM_FASHION_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000812_00000506
	setvar VAR_SPECIAL_x8004, 16
	scrcmd_407 32772, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000812_00000506
	msgbox 39
	goto scr_seq_00000812_00000659

scr_seq_00000812_00000647:
	.byte 0x02, 0x00
scr_seq_00000812_00000649:
	callstd 2007
	setvar VAR_TEMP_x4009, 1
	closemsg
	releaseall
	end

scr_seq_00000812_00000659:
	callstd 2026
	setvar VAR_TEMP_x4009, 1
	closemsg
	releaseall
	end

scr_seq_00000812_00000669:
	scrcmd_511 3, 32780
	comparevartovalue VAR_SPECIAL_x800C, 3000
	callif lt, scr_seq_00000812_000006A5
	comparevartovalue VAR_SPECIAL_x800C, 3300
	callif lt, scr_seq_00000812_0000071B
	comparevartovalue VAR_SPECIAL_x800C, 3500
	callif lt, scr_seq_00000812_0000076A
	comparevartovalue VAR_SPECIAL_x800C, 10000
	callif lt, scr_seq_00000812_000007D3
	return

scr_seq_00000812_000006A5:
	scrcmd_380 32774, 8
	comparevartovalue VAR_SPECIAL_x8006, 0
	callif eq, scr_seq_00000812_00000861
	comparevartovalue VAR_SPECIAL_x8006, 1
	callif eq, scr_seq_00000812_00000869
	comparevartovalue VAR_SPECIAL_x8006, 2
	callif eq, scr_seq_00000812_00000871
	comparevartovalue VAR_SPECIAL_x8006, 3
	callif eq, scr_seq_00000812_00000879
	comparevartovalue VAR_SPECIAL_x8006, 4
	callif eq, scr_seq_00000812_00000881
	comparevartovalue VAR_SPECIAL_x8006, 5
	callif eq, scr_seq_00000812_00000889
	comparevartovalue VAR_SPECIAL_x8006, 6
	callif eq, scr_seq_00000812_00000891
	comparevartovalue VAR_SPECIAL_x8006, 7
	callif eq, scr_seq_00000812_00000899
	call scr_seq_00000812_0000082F
	return

scr_seq_00000812_0000071B:
	scrcmd_380 32774, 5
	comparevartovalue VAR_SPECIAL_x8006, 0
	callif eq, scr_seq_00000812_000008A1
	comparevartovalue VAR_SPECIAL_x8006, 1
	callif eq, scr_seq_00000812_000008A9
	comparevartovalue VAR_SPECIAL_x8006, 2
	callif eq, scr_seq_00000812_000008B1
	comparevartovalue VAR_SPECIAL_x8006, 3
	callif eq, scr_seq_00000812_000008B9
	comparevartovalue VAR_SPECIAL_x8006, 4
	callif eq, scr_seq_00000812_000008C1
	call scr_seq_00000812_0000082F
	return

scr_seq_00000812_0000076A:
	scrcmd_380 32774, 7
	comparevartovalue VAR_SPECIAL_x8006, 0
	callif eq, scr_seq_00000812_000008C9
	comparevartovalue VAR_SPECIAL_x8006, 1
	callif eq, scr_seq_00000812_000008D1
	comparevartovalue VAR_SPECIAL_x8006, 2
	callif eq, scr_seq_00000812_000008D9
	comparevartovalue VAR_SPECIAL_x8006, 3
	callif eq, scr_seq_00000812_000008E1
	comparevartovalue VAR_SPECIAL_x8006, 4
	callif eq, scr_seq_00000812_000008E9
	comparevartovalue VAR_SPECIAL_x8006, 5
	callif eq, scr_seq_00000812_000008F1
	comparevartovalue VAR_SPECIAL_x8006, 6
	callif eq, scr_seq_00000812_000008F9
	call scr_seq_00000812_0000082F
	return

scr_seq_00000812_000007D3:
	scrcmd_380 32774, 6
	comparevartovalue VAR_SPECIAL_x8006, 0
	callif eq, scr_seq_00000812_00000901
	comparevartovalue VAR_SPECIAL_x8006, 1
	callif eq, scr_seq_00000812_00000909
	comparevartovalue VAR_SPECIAL_x8006, 2
	callif eq, scr_seq_00000812_00000911
	comparevartovalue VAR_SPECIAL_x8006, 3
	callif eq, scr_seq_00000812_00000919
	comparevartovalue VAR_SPECIAL_x8006, 4
	callif eq, scr_seq_00000812_00000921
	comparevartovalue VAR_SPECIAL_x8006, 5
	callif eq, scr_seq_00000812_00000929
	call scr_seq_00000812_0000082F
	return

scr_seq_00000812_0000082F:
	hasspaceforitem VAR_SPECIAL_x8006, 1, VAR_SPECIAL_x8007
	comparevartovalue VAR_SPECIAL_x8007, 0
	callif ne, scr_seq_00000812_0000084C
	setvar VAR_SPECIAL_x800C, 10000
	return

scr_seq_00000812_0000084C:
	msgbox 23
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x8006
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	return

scr_seq_00000812_00000861:
	setvar VAR_SPECIAL_x8006, 149
	return

scr_seq_00000812_00000869:
	setvar VAR_SPECIAL_x8006, 150
	return

scr_seq_00000812_00000871:
	setvar VAR_SPECIAL_x8006, 151
	return

scr_seq_00000812_00000879:
	setvar VAR_SPECIAL_x8006, 152
	return

scr_seq_00000812_00000881:
	setvar VAR_SPECIAL_x8006, 153
	return

scr_seq_00000812_00000889:
	setvar VAR_SPECIAL_x8006, 154
	return

scr_seq_00000812_00000891:
	setvar VAR_SPECIAL_x8006, 155
	return

scr_seq_00000812_00000899:
	setvar VAR_SPECIAL_x8006, 156
	return

scr_seq_00000812_000008A1:
	setvar VAR_SPECIAL_x8006, 159
	return

scr_seq_00000812_000008A9:
	setvar VAR_SPECIAL_x8006, 160
	return

scr_seq_00000812_000008B1:
	setvar VAR_SPECIAL_x8006, 161
	return

scr_seq_00000812_000008B9:
	setvar VAR_SPECIAL_x8006, 162
	return

scr_seq_00000812_000008C1:
	setvar VAR_SPECIAL_x8006, 163
	return

scr_seq_00000812_000008C9:
	setvar VAR_SPECIAL_x8006, 164
	return

scr_seq_00000812_000008D1:
	setvar VAR_SPECIAL_x8006, 165
	return

scr_seq_00000812_000008D9:
	setvar VAR_SPECIAL_x8006, 166
	return

scr_seq_00000812_000008E1:
	setvar VAR_SPECIAL_x8006, 167
	return

scr_seq_00000812_000008E9:
	setvar VAR_SPECIAL_x8006, 168
	return

scr_seq_00000812_000008F1:
	setvar VAR_SPECIAL_x8006, 157
	return

scr_seq_00000812_000008F9:
	setvar VAR_SPECIAL_x8006, 158
	return

scr_seq_00000812_00000901:
	setvar VAR_SPECIAL_x8006, 169
	return

scr_seq_00000812_00000909:
	setvar VAR_SPECIAL_x8006, 170
	return

scr_seq_00000812_00000911:
	setvar VAR_SPECIAL_x8006, 171
	return

scr_seq_00000812_00000919:
	setvar VAR_SPECIAL_x8006, 172
	return

scr_seq_00000812_00000921:
	setvar VAR_SPECIAL_x8006, 173
	return

scr_seq_00000812_00000929:
	setvar VAR_SPECIAL_x8006, 174
	return
	.balign 4, 0
