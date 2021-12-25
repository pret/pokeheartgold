#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000030_00000085 ; 000
	scrdef scr_seq_00000030_00000098 ; 001
	scrdef scr_seq_00000030_000000AB ; 002
	scrdef scr_seq_00000030_000000BE ; 003
	scrdef scr_seq_00000030_000000D9 ; 004
	scrdef scr_seq_00000030_00000102 ; 005
	scrdef scr_seq_00000030_00000115 ; 006
	scrdef scr_seq_00000030_0000002E ; 007
	scrdef scr_seq_00000030_0000006A ; 008
	scrdef scr_seq_00000030_0000013E ; 009
	scrdef scr_seq_00000030_0000057B ; 010
	scrdef_end

scr_seq_00000030_0000002E:
	setflag FLAG_UNK_1B7
	setflag FLAG_UNK_1B8
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_00000030_0000004D
	clearflag FLAG_UNK_1B7
	goto scr_seq_00000030_00000068

scr_seq_00000030_0000004D:
	comparevartovalue VAR_UNK_4077, 2
	gotoif ge, scr_seq_00000030_00000064
	clearflag FLAG_UNK_1B8
	goto scr_seq_00000030_00000068

scr_seq_00000030_00000064:
	clearflag FLAG_UNK_1B8
scr_seq_00000030_00000068:
	end

scr_seq_00000030_0000006A:
	comparevartovalue VAR_UNK_4077, 5
	gotoif ne, scr_seq_00000030_00000083
	show_person_at 3, 2, 1, 7, 3
scr_seq_00000030_00000083:
	end

scr_seq_00000030_00000085:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000030_00000098:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000030_000000AB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000030_000000BE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 39, 0
	msgbox 3
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000030_000000D9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_00000030_000000F7
	msgbox 2
	goto scr_seq_00000030_000000FA

scr_seq_00000030_000000F7:
	msgbox 1
scr_seq_00000030_000000FA:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000030_00000102:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000030_00000115:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 5
	gotoif ne, scr_seq_00000030_00000133
	msgbox 5
	goto scr_seq_00000030_00000136

scr_seq_00000030_00000133:
	msgbox 4
scr_seq_00000030_00000136:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000030_0000013E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_00000030_0000015C
	msgbox 9
	goto scr_seq_00000030_00000162

scr_seq_00000030_0000015C:
	goto scr_seq_00000030_0000016A

scr_seq_00000030_00000162:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000030_0000016A:
	hasitem ITEM_BLUE_CARD, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_00000030_000001B5
	msgbox 10
	closemsg
	setvar VAR_SPECIAL_x8004, 472
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000030_00000539
	callstd 2033
	closemsg
	addvar VAR_UNK_4115, 1
	releaseall
	end

scr_seq_00000030_000001B5:
	comparevartovalue VAR_UNK_4115, 2
	gotoif lt, scr_seq_00000030_000001CF
	scrcmd_190 0
	scrcmd_132 12, 13
	goto scr_seq_00000030_000001D2

scr_seq_00000030_000001CF:
	msgbox 11
scr_seq_00000030_000001D2:
	closemsg
	checkflag FLAG_UNK_AB6
	gotoif eq, scr_seq_00000030_000001EA
	msgbox 28
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000030_000001EA:
	checkflag FLAG_UNK_AA3
	gotoif eq, scr_seq_00000030_00000547
	msgbox 14
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000030_00000552
	scrcmd_190 0
	comparevartovalue VAR_UNK_4115, 2
	gotoif lt, scr_seq_00000030_00000227
	scrcmd_132 17, 18
	goto scr_seq_00000030_0000022B

scr_seq_00000030_00000227:
	scrcmd_132 15, 16
scr_seq_00000030_0000022B:
	closemsg
	apply_movement 9, scr_seq_00000030_00000620
	wait_movement
	scrcmd_132 20, 21
	closemsg
	scrcmd_386 VAR_TEMP_x4000
	scrcmd_729 VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif eq, scr_seq_00000030_00000295
	scrcmd_099 253
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000030_00000279
	apply_movement 255, scr_seq_00000030_000005CC
	apply_movement 253, scr_seq_00000030_000005E0
	goto scr_seq_00000030_00000289

scr_seq_00000030_00000279:
	apply_movement 255, scr_seq_00000030_000005F0
	apply_movement 253, scr_seq_00000030_00000600
scr_seq_00000030_00000289:
	wait_movement
	scrcmd_098 253
	goto scr_seq_00000030_000002BA

scr_seq_00000030_00000295:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000030_000002B0
	apply_movement 255, scr_seq_00000030_000005CC
	goto scr_seq_00000030_000002B8

scr_seq_00000030_000002B0:
	apply_movement 255, scr_seq_00000030_000005F0
scr_seq_00000030_000002B8:
	wait_movement
scr_seq_00000030_000002BA:
	scrcmd_821 32768, 32769
	scrcmd_746
	scrcmd_750 1, 1, 0, 0, VAR_SPECIAL_x800C
	scrcmd_751 32768, 255, 0
	addvar VAR_SPECIAL_x8000, 1
	scrcmd_751 32768, 255, 1
	addvar VAR_SPECIAL_x8000, 1
	scrcmd_751 32768, 255, 2
	scrcmd_752
	scrcmd_747
	setflag FLAG_UNK_102
	setflag FLAG_UNK_AA3
	apply_movement 9, scr_seq_00000030_00000628
	wait_movement
	comparevartovar VAR_SPECIAL_x800C, VAR_SPECIAL_x8001
	gotoif ne, scr_seq_00000030_0000055D
	msgbox 22
	apply_movement 9, scr_seq_00000030_00000630
	wait_movement
	apply_movement 255, scr_seq_00000030_0000060C
	wait_movement
	play_se SEQ_SE_GS_OKOZUKAI
	comparevartovalue VAR_UNK_413A, 30
	gotoif ge, scr_seq_00000030_0000033F
	addvar VAR_UNK_413A, 1
scr_seq_00000030_0000033F:
	comparevartovalue VAR_UNK_413A, 30
	gotoif lt, scr_seq_00000030_00000387
	comparevartovalue VAR_UNK_4115, 2
	gotoif ge, scr_seq_00000030_00000387
	apply_movement 9, scr_seq_00000030_00000628
	wait_movement
	scrcmd_132 24, 25
	closemsg
	scrcmd_146 8
	msgbox 26
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	closemsg
	apply_movement 9, scr_seq_00000030_00000628
	wait_movement
	msgbox 27
	closemsg
scr_seq_00000030_00000387:
	comparevartovalue VAR_UNK_413A, 1
	gotoif eq, scr_seq_00000030_00000499
	comparevartovalue VAR_UNK_413A, 3
	gotoif eq, scr_seq_00000030_000004AD
	comparevartovalue VAR_UNK_413A, 5
	gotoif eq, scr_seq_00000030_000004C1
	comparevartovalue VAR_UNK_413A, 10
	gotoif eq, scr_seq_00000030_000004D5
	comparevartovalue VAR_UNK_413A, 15
	gotoif eq, scr_seq_00000030_000004E9
	comparevartovalue VAR_UNK_413A, 20
	gotoif eq, scr_seq_00000030_000004FD
	comparevartovalue VAR_UNK_413A, 25
	gotoif eq, scr_seq_00000030_00000511
	comparevartovalue VAR_UNK_413A, 30
	gotoif eq, scr_seq_00000030_00000525
	goto scr_seq_00000030_00000568

scr_seq_00000030_000003F5:
	msgbox 32
	closemsg
	apply_movement 9, scr_seq_00000030_00000638
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 8, scr_seq_00000030_00000648
	apply_movement 255, scr_seq_00000030_00000614
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_198 0, 16698
	scrcmd_194 1, 32772
	msgbox 35
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000030_00000539
	callstd 2033
scr_seq_00000030_00000450:
	comparevartovalue VAR_UNK_413A, 30
	gotoif lt, scr_seq_00000030_00000486
	msgbox 36
	closemsg
	play_fanfare SEQ_ME_KEYITEM
	msgbox 37
	wait_fanfare
	closemsg
	comparevartovalue VAR_UNK_4115, 255
	gotoif ge, scr_seq_00000030_00000480
	addvar VAR_UNK_4115, 1
scr_seq_00000030_00000480:
	setvar VAR_UNK_413A, 0
scr_seq_00000030_00000486:
	msgbox 38
	closemsg
	apply_movement 8, scr_seq_00000030_00000654
	wait_movement
	releaseall
	end

scr_seq_00000030_00000499:
	setvar VAR_SPECIAL_x8004, 4
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000030_000003F5

scr_seq_00000030_000004AB:
	.byte 0x02, 0x00
scr_seq_00000030_000004AD:
	setvar VAR_SPECIAL_x8004, 23
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000030_000003F5

scr_seq_00000030_000004BF:
	.byte 0x02
	.byte 0x00
scr_seq_00000030_000004C1:
	setvar VAR_SPECIAL_x8004, 46
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000030_000003F5

scr_seq_00000030_000004D3:
	.byte 0x02, 0x00
scr_seq_00000030_000004D5:
	setvar VAR_SPECIAL_x8004, 47
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000030_000003F5

scr_seq_00000030_000004E7:
	.byte 0x02, 0x00
scr_seq_00000030_000004E9:
	setvar VAR_SPECIAL_x8004, 48
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000030_000003F5

scr_seq_00000030_000004FB:
	.byte 0x02, 0x00
scr_seq_00000030_000004FD:
	setvar VAR_SPECIAL_x8004, 92
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000030_000003F5

scr_seq_00000030_0000050F:
	.byte 0x02
	.byte 0x00
scr_seq_00000030_00000511:
	setvar VAR_SPECIAL_x8004, 50
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000030_000003F5

scr_seq_00000030_00000523:
	.byte 0x02, 0x00
scr_seq_00000030_00000525:
	setvar VAR_SPECIAL_x8004, 45
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000030_000003F5

scr_seq_00000030_00000537:
	.byte 0x02, 0x00
scr_seq_00000030_00000539:
	callstd 2009
	closemsg
	goto scr_seq_00000030_00000450

scr_seq_00000030_00000545:
	.byte 0x02, 0x00
scr_seq_00000030_00000547:
	msgbox 29
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000030_00000552:
	msgbox 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000030_0000055D:
	msgbox 23
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000030_00000568:
	msgbox 32
	closemsg
	apply_movement 9, scr_seq_00000030_00000638
	wait_movement
	releaseall
	end

scr_seq_00000030_0000057B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 4
	gotoif eq, scr_seq_00000030_000005C0
	hasitem ITEM_BLUE_CARD, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_00000030_000005B0
	msgbox 33
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000030_000005B0:
	scrcmd_198 0, 16698
	msgbox 34
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000030_000005C0:
	msgbox 39
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000030_000005CB:
	.byte 0x00

scr_seq_00000030_000005CC:
	.short 1, 1
	.short 13, 2
	.short 14, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000030_000005E0:
	.short 13, 2
	.short 14, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000030_000005F0:
	.short 1, 1
	.short 13, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000030_00000600:
	.short 13, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000030_0000060C:
	.short 32, 1
	.short 254, 0

scr_seq_00000030_00000614:
	.short 13, 1
	.short 14, 2
	.short 254, 0

scr_seq_00000030_00000620:
	.short 34, 1
	.short 254, 0

scr_seq_00000030_00000628:
	.short 33, 1
	.short 254, 0

scr_seq_00000030_00000630:
	.short 13, 1
	.short 254, 0

scr_seq_00000030_00000638:
	.short 0, 1
	.short 12, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000030_00000648:
	.short 13, 2
	.short 15, 3
	.short 254, 0

scr_seq_00000030_00000654:
	.short 14, 3
	.short 12, 2
	.short 33, 1
	.short 254, 0
	.balign 4, 0
