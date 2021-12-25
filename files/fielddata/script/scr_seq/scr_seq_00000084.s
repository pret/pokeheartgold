#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000084_0000003C ; 000
	scrdef scr_seq_00000084_000005C6 ; 001
	scrdef scr_seq_00000084_000005FF ; 002
	scrdef scr_seq_00000084_0000063E ; 003
	scrdef scr_seq_00000084_000006B2 ; 004
	scrdef scr_seq_00000084_00000058 ; 005
	scrdef scr_seq_00000084_000006DC ; 006
	scrdef scr_seq_00000084_000006EF ; 007
	scrdef scr_seq_00000084_00000702 ; 008
	scrdef scr_seq_00000084_00000715 ; 009
	scrdef scr_seq_00000084_00000728 ; 010
	scrdef scr_seq_00000084_0000073B ; 011
	scrdef scr_seq_00000084_0000074E ; 012
	scrdef scr_seq_00000084_0000003A ; 013
	scrdef_end

scr_seq_00000084_0000003A:
	end

scr_seq_00000084_0000003C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 0
	goto scr_seq_00000084_00000074

scr_seq_00000084_00000056:
	.byte 0x02, 0x00
scr_seq_00000084_00000058:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 1
	goto scr_seq_00000084_00000074

scr_seq_00000084_00000072:
	.byte 0x02, 0x00
scr_seq_00000084_00000074:
	scrcmd_682 0
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, scr_seq_00000084_0000057C
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, scr_seq_00000084_00000581
	goto scr_seq_00000084_0000009A

scr_seq_00000084_00000098:
	.byte 0x02, 0x00
scr_seq_00000084_0000009A:
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, scr_seq_00000084_00000586
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, scr_seq_00000084_000005A5
	scrcmd_751 19, 255, 2
	scrcmd_751 20, 255, 3
	scrcmd_752
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000084_0000013F
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000084_0000014D
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_00000084_00000104
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_00000084_0000015B
	scrcmd_747
	goto scr_seq_00000084_00000126

scr_seq_00000084_00000102:
	.byte 0x02, 0x00
scr_seq_00000084_00000104:
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, scr_seq_00000084_000005BC
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, scr_seq_00000084_000005C1
	goto scr_seq_00000084_0000009A

scr_seq_00000084_00000124:
	.byte 0x02, 0x00
scr_seq_00000084_00000126:
	goto scr_seq_00000084_0000012E

scr_seq_00000084_0000012C:
	.byte 0x02, 0x00
scr_seq_00000084_0000012E:
	setvar VAR_UNK_4142, 0
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000084_0000013F:
	setvar VAR_UNK_4143, 0
	goto scr_seq_00000084_00000169

scr_seq_00000084_0000014B:
	.byte 0x02, 0x00
scr_seq_00000084_0000014D:
	setvar VAR_UNK_4143, 1
	goto scr_seq_00000084_00000169

scr_seq_00000084_00000159:
	.byte 0x02, 0x00
scr_seq_00000084_0000015B:
	setvar VAR_UNK_4143, 2
	goto scr_seq_00000084_00000169

scr_seq_00000084_00000167:
	.byte 0x02, 0x00
scr_seq_00000084_00000169:
	msgbox 7
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 21, 255, 0
	scrcmd_751 22, 255, 1
	scrcmd_751 23, 255, 2
	scrcmd_752
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000084_000001B2
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000084_000001C0
	scrcmd_747
	goto scr_seq_00000084_00000126

scr_seq_00000084_000001B0:
	.byte 0x02, 0x00
scr_seq_00000084_000001B2:
	setvar VAR_UNK_4144, 0
	goto scr_seq_00000084_000001CE

scr_seq_00000084_000001BE:
	.byte 0x02, 0x00
scr_seq_00000084_000001C0:
	setvar VAR_UNK_4144, 1
	goto scr_seq_00000084_000001CE

scr_seq_00000084_000001CC:
	.byte 0x02, 0x00
scr_seq_00000084_000001CE:
	goto scr_seq_00000084_000001D6

scr_seq_00000084_000001D4:
	.byte 0x02, 0x00
scr_seq_00000084_000001D6:
	comparevartovalue VAR_UNK_4143, 0
	callif eq, scr_seq_00000084_00000399
	comparevartovalue VAR_UNK_4143, 1
	callif eq, scr_seq_00000084_00000399
	setvar VAR_TEMP_x4000, 0
	scrcmd_282
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000084_00000126
	scrcmd_747
	comparevartovalue VAR_UNK_4143, 2
	gotoif eq, scr_seq_00000084_00000226
	goto scr_seq_00000084_000003A1

scr_seq_00000084_00000224:
	.byte 0x02, 0x00
scr_seq_00000084_00000226:
	msgbox 24
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 14, 255, 0
	scrcmd_751 15, 255, 1
	scrcmd_751 5, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000084_00000277
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000084_000002F9
	scrcmd_747
	goto scr_seq_00000084_00000126

scr_seq_00000084_00000275:
	.byte 0x02, 0x00
scr_seq_00000084_00000277:
	msgbox 25
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000084_00000226
	scrcmd_747
	closemsg
	comparevartovalue VAR_UNK_4144, 0
	callif eq, scr_seq_00000084_000002CF
	comparevartovalue VAR_UNK_4144, 1
	callif eq, scr_seq_00000084_000002DB
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000084_000002E7
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000084_000002EF
	goto scr_seq_00000084_0000037B

scr_seq_00000084_000002CD:
	.byte 0x02, 0x00
scr_seq_00000084_000002CF:
	scrcmd_226 27, 0, 0, 32780
	return

scr_seq_00000084_000002DB:
	scrcmd_226 28, 0, 0, 32780
	return

scr_seq_00000084_000002E7:
	goto scr_seq_00000084_00000226

scr_seq_00000084_000002ED:
	.byte 0x02, 0x00
scr_seq_00000084_000002EF:
	scrcmd_283
	goto scr_seq_00000084_00000226

scr_seq_00000084_000002F7:
	.byte 0x02, 0x00
scr_seq_00000084_000002F9:
	msgbox 25
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000084_00000226
	scrcmd_747
	closemsg
	comparevartovalue VAR_UNK_4144, 0
	callif eq, scr_seq_00000084_00000351
	comparevartovalue VAR_UNK_4144, 1
	callif eq, scr_seq_00000084_0000035D
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000084_00000369
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000084_00000371
	goto scr_seq_00000084_0000037B

scr_seq_00000084_0000034F:
	.byte 0x02
	.byte 0x00
scr_seq_00000084_00000351:
	scrcmd_227 27, 0, 0, 32780
	return

scr_seq_00000084_0000035D:
	scrcmd_227 28, 0, 0, 32780
	return

scr_seq_00000084_00000369:
	goto scr_seq_00000084_00000226

scr_seq_00000084_0000036F:
	.byte 0x02
	.byte 0x00
scr_seq_00000084_00000371:
	scrcmd_283
	goto scr_seq_00000084_00000226

scr_seq_00000084_00000379:
	.byte 0x02, 0x00
scr_seq_00000084_0000037B:
	msgbox 26
	comparevartovalue VAR_UNK_4143, 2
	callif eq, scr_seq_00000084_00000399
	call scr_seq_00000084_000005ED
	goto scr_seq_00000084_000003A1

scr_seq_00000084_00000397:
	.byte 0x02, 0x00
scr_seq_00000084_00000399:
	setvar VAR_UNK_4142, 255
	return

scr_seq_00000084_000003A1:
	comparevartovalue VAR_UNK_4143, 0
	callif eq, scr_seq_00000084_00000439
	comparevartovalue VAR_UNK_4143, 1
	callif eq, scr_seq_00000084_00000454
	comparevartovalue VAR_UNK_4143, 2
	callif eq, scr_seq_00000084_0000046F
	play_se SEQ_SE_DP_KAIDAN2
	goto scr_seq_00000084_000003D4

scr_seq_00000084_000003D2:
	.byte 0x02, 0x00
scr_seq_00000084_000003D4:
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_815 0
	comparevartovalue VAR_UNK_4143, 0
	callif eq, scr_seq_00000084_00000495
	comparevartovalue VAR_UNK_4143, 1
	callif eq, scr_seq_00000084_000004A9
	comparevartovalue VAR_UNK_4143, 2
	callif eq, scr_seq_00000084_000004BD
	scrcmd_420 59
	scrcmd_436
	scrcmd_627 3
	comparevartovalue VAR_UNK_4143, 2
	callif eq, scr_seq_00000084_00000435
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	scrcmd_682 1
	end

scr_seq_00000084_00000435:
	scrcmd_283
	return

scr_seq_00000084_00000439:
	msgbox 9
	scrcmd_049
	closemsg
	apply_movement 255, scr_seq_00000084_000004D4
	apply_movement VAR_SPECIAL_x800D, scr_seq_00000084_000004FC
	wait_movement
	return

scr_seq_00000084_00000454:
	msgbox 9
	scrcmd_049
	closemsg
	apply_movement 255, scr_seq_00000084_000004D4
	apply_movement VAR_SPECIAL_x800D, scr_seq_00000084_000004FC
	wait_movement
	return

scr_seq_00000084_0000046F:
	scrcmd_047 9
	wait 15, VAR_SPECIAL_x800C
	scrcmd_258
	scrcmd_257 169
	closemsg
	apply_movement 255, scr_seq_00000084_000004E8
	apply_movement VAR_SPECIAL_x800D, scr_seq_00000084_00000510
	wait_movement
	return

scr_seq_00000084_00000495:
	apply_movement 255, scr_seq_00000084_00000524
	apply_movement VAR_SPECIAL_x800D, scr_seq_00000084_00000554
	wait_movement
	return

scr_seq_00000084_000004A9:
	apply_movement 255, scr_seq_00000084_00000524
	apply_movement VAR_SPECIAL_x800D, scr_seq_00000084_00000554
	wait_movement
	return

scr_seq_00000084_000004BD:
	apply_movement 255, scr_seq_00000084_0000053C
	apply_movement VAR_SPECIAL_x800D, scr_seq_00000084_00000568
	wait_movement
	return

scr_seq_00000084_000004D1:
	.byte 0x00, 0x00, 0x00

scr_seq_00000084_000004D4:
	.short 12, 3
	.short 15, 1
	.short 12, 4
	.short 69, 1
	.short 254, 0

scr_seq_00000084_000004E8:
	.short 12, 3
	.short 14, 1
	.short 12, 4
	.short 69, 1
	.short 254, 0

scr_seq_00000084_000004FC:
	.short 12, 2
	.short 15, 1
	.short 12, 4
	.short 69, 1
	.short 254, 0

scr_seq_00000084_00000510:
	.short 12, 2
	.short 14, 1
	.short 12, 4
	.short 69, 1
	.short 254, 0

scr_seq_00000084_00000524:
	.short 21, 3
	.short 22, 1
	.short 21, 4
	.short 0, 1
	.short 70, 1
	.short 254, 0

scr_seq_00000084_0000053C:
	.short 21, 3
	.short 23, 1
	.short 21, 4
	.short 0, 1
	.short 70, 1
	.short 254, 0

scr_seq_00000084_00000554:
	.short 21, 2
	.short 22, 1
	.short 21, 4
	.short 70, 1
	.short 254, 0

scr_seq_00000084_00000568:
	.short 21, 2
	.short 23, 1
	.short 21, 4
	.short 70, 1
	.short 254, 0
scr_seq_00000084_0000057C:
	msgbox 0
	return

scr_seq_00000084_00000581:
	msgbox 3
	return

scr_seq_00000084_00000586:
	msgbox 1
	scrcmd_746
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 16, 255, 0
	scrcmd_751 17, 255, 1
	return

scr_seq_00000084_000005A5:
	msgbox 4
	scrcmd_746
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 18, 255, 4
	return

scr_seq_00000084_000005BC:
	msgbox 2
	return

scr_seq_00000084_000005C1:
	msgbox 5
	return

scr_seq_00000084_000005C6:
	scrcmd_682 0
	setvar VAR_TEMP_x4003, 1
	setvar VAR_UNK_4142, 0
	msgbox 11
	call scr_seq_00000084_00000399
	call scr_seq_00000084_000005ED
	goto scr_seq_00000084_000003A1

scr_seq_00000084_000005EB:
	.byte 0x02, 0x00
scr_seq_00000084_000005ED:
	scrcmd_345
	scrcmd_254 32780
	scrcmd_346
	play_se SEQ_SE_DP_SAVE
	wait_se SEQ_SE_DP_SAVE
	return

scr_seq_00000084_000005FF:
	lockall
	faceplayer
	msgbox 12
	scrcmd_628 16707, 16708
	comparevartovalue VAR_UNK_404E, 1
	callif eq, scr_seq_00000084_0000062E
	comparevartovalue VAR_UNK_404E, 3
	callif eq, scr_seq_00000084_00000636
	goto scr_seq_00000084_00000126

scr_seq_00000084_0000062C:
	.byte 0x02, 0x00
scr_seq_00000084_0000062E:
	setvar VAR_UNK_404E, 0
	return

scr_seq_00000084_00000636:
	setvar VAR_UNK_404E, 2
	return

scr_seq_00000084_0000063E:
	comparevartovalue VAR_UNK_4143, 0
	callif eq, scr_seq_00000084_0000067A
	comparevartovalue VAR_UNK_4143, 1
	callif eq, scr_seq_00000084_0000067A
	comparevartovalue VAR_UNK_404E, 1
	callif eq, scr_seq_00000084_00000680
	comparevartovalue VAR_UNK_404E, 3
	callif eq, scr_seq_00000084_00000697
	goto scr_seq_00000084_00000126

scr_seq_00000084_00000678:
	.byte 0x02, 0x00
scr_seq_00000084_0000067A:
	scrcmd_680 27
	return

scr_seq_00000084_00000680:
	msgbox 13
	scrcmd_190 0
	msgbox 15
	scrcmd_078 1185
	scrcmd_079
	setvar VAR_UNK_404E, 2
	return

scr_seq_00000084_00000697:
	msgbox 13
	scrcmd_190 0
	msgbox 14
	scrcmd_078 1185
	scrcmd_079
	setvar VAR_UNK_404E, 4
	callstd 2040
	return

scr_seq_00000084_000006B2:
	goto scr_seq_00000084_00000126

scr_seq_00000084_000006B8:
	.byte 0x02, 0x00, 0x00, 0x00, 0x0c, 0x00, 0x02, 0x00
	.byte 0x3f, 0x00, 0x01, 0x00, 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x0c, 0x00, 0x02, 0x00
	.byte 0x3f, 0x00, 0x01, 0x00, 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_00000084_000006DC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 27
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000084_000006EF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 28
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000084_00000702:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 29
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000084_00000715:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 30
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000084_00000728:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 31
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000084_0000073B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 32
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000084_0000074E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 33
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
