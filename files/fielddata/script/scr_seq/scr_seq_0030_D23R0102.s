#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0030_D23R0102_0085 ; 000
	scrdef scr_seq_0030_D23R0102_0098 ; 001
	scrdef scr_seq_0030_D23R0102_00AB ; 002
	scrdef scr_seq_0030_D23R0102_00BE ; 003
	scrdef scr_seq_0030_D23R0102_00D9 ; 004
	scrdef scr_seq_0030_D23R0102_0102 ; 005
	scrdef scr_seq_0030_D23R0102_0115 ; 006
	scrdef scr_seq_0030_D23R0102_002E ; 007
	scrdef scr_seq_0030_D23R0102_006A ; 008
	scrdef scr_seq_0030_D23R0102_013E ; 009
	scrdef scr_seq_0030_D23R0102_057B ; 010
	scrdef_end

scr_seq_0030_D23R0102_002E:
	setflag FLAG_UNK_1B7
	setflag FLAG_UNK_1B8
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_0030_D23R0102_004D
	clearflag FLAG_UNK_1B7
	goto scr_seq_0030_D23R0102_0068

scr_seq_0030_D23R0102_004D:
	comparevartovalue VAR_UNK_4077, 2
	gotoif ge, scr_seq_0030_D23R0102_0064
	clearflag FLAG_UNK_1B8
	goto scr_seq_0030_D23R0102_0068

scr_seq_0030_D23R0102_0064:
	clearflag FLAG_UNK_1B8
scr_seq_0030_D23R0102_0068:
	end

scr_seq_0030_D23R0102_006A:
	comparevartovalue VAR_UNK_4077, 5
	gotoif ne, scr_seq_0030_D23R0102_0083
	show_person_at 3, 2, 1, 7, 3
scr_seq_0030_D23R0102_0083:
	end

scr_seq_0030_D23R0102_0085:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0030_D23R0102_0098:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0030_D23R0102_00AB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0030_D23R0102_00BE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 39, 0
	npc_msg 3
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0030_D23R0102_00D9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_0030_D23R0102_00F7
	npc_msg 2
	goto scr_seq_0030_D23R0102_00FA

scr_seq_0030_D23R0102_00F7:
	npc_msg 1
scr_seq_0030_D23R0102_00FA:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0030_D23R0102_0102:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0030_D23R0102_0115:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 5
	gotoif ne, scr_seq_0030_D23R0102_0133
	npc_msg 5
	goto scr_seq_0030_D23R0102_0136

scr_seq_0030_D23R0102_0133:
	npc_msg 4
scr_seq_0030_D23R0102_0136:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0030_D23R0102_013E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_0030_D23R0102_015C
	npc_msg 9
	goto scr_seq_0030_D23R0102_0162

scr_seq_0030_D23R0102_015C:
	goto scr_seq_0030_D23R0102_016A

scr_seq_0030_D23R0102_0162:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0030_D23R0102_016A:
	hasitem ITEM_BLUE_CARD, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_0030_D23R0102_01B5
	npc_msg 10
	closemsg
	setvar VAR_SPECIAL_x8004, 472
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0030_D23R0102_0539
	callstd std_give_item_verbose
	closemsg
	addvar VAR_UNK_4115, 1
	releaseall
	end

scr_seq_0030_D23R0102_01B5:
	comparevartovalue VAR_UNK_4115, 2
	gotoif lt, scr_seq_0030_D23R0102_01CF
	buffer_players_name 0
	gender_msgbox 12, 13
	goto scr_seq_0030_D23R0102_01D2

scr_seq_0030_D23R0102_01CF:
	npc_msg 11
scr_seq_0030_D23R0102_01D2:
	closemsg
	checkflag FLAG_UNK_AB6
	gotoif TRUE, scr_seq_0030_D23R0102_01EA
	npc_msg 28
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0030_D23R0102_01EA:
	checkflag FLAG_UNK_AA3
	gotoif TRUE, scr_seq_0030_D23R0102_0547
	npc_msg 14
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0030_D23R0102_0552
	buffer_players_name 0
	comparevartovalue VAR_UNK_4115, 2
	gotoif lt, scr_seq_0030_D23R0102_0227
	gender_msgbox 17, 18
	goto scr_seq_0030_D23R0102_022B

scr_seq_0030_D23R0102_0227:
	gender_msgbox 15, 16
scr_seq_0030_D23R0102_022B:
	closemsg
	apply_movement 9, scr_seq_0030_D23R0102_0620
	wait_movement
	gender_msgbox 20, 21
	closemsg
	scrcmd_386 VAR_TEMP_x4000
	scrcmd_729 VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif eq, scr_seq_0030_D23R0102_0295
	scrcmd_099 253
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0030_D23R0102_0279
	apply_movement 255, scr_seq_0030_D23R0102_05CC
	apply_movement 253, scr_seq_0030_D23R0102_05E0
	goto scr_seq_0030_D23R0102_0289

scr_seq_0030_D23R0102_0279:
	apply_movement 255, scr_seq_0030_D23R0102_05F0
	apply_movement 253, scr_seq_0030_D23R0102_0600
scr_seq_0030_D23R0102_0289:
	wait_movement
	scrcmd_098 253
	goto scr_seq_0030_D23R0102_02BA

scr_seq_0030_D23R0102_0295:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0030_D23R0102_02B0
	apply_movement 255, scr_seq_0030_D23R0102_05CC
	goto scr_seq_0030_D23R0102_02B8

scr_seq_0030_D23R0102_02B0:
	apply_movement 255, scr_seq_0030_D23R0102_05F0
scr_seq_0030_D23R0102_02B8:
	wait_movement
scr_seq_0030_D23R0102_02BA:
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
	apply_movement 9, scr_seq_0030_D23R0102_0628
	wait_movement
	comparevartovar VAR_SPECIAL_x800C, VAR_SPECIAL_x8001
	gotoif ne, scr_seq_0030_D23R0102_055D
	npc_msg 22
	apply_movement 9, scr_seq_0030_D23R0102_0630
	wait_movement
	apply_movement 255, scr_seq_0030_D23R0102_060C
	wait_movement
	play_se SEQ_SE_GS_OKOZUKAI
	comparevartovalue VAR_UNK_413A, 30
	gotoif ge, scr_seq_0030_D23R0102_033F
	addvar VAR_UNK_413A, 1
scr_seq_0030_D23R0102_033F:
	comparevartovalue VAR_UNK_413A, 30
	gotoif lt, scr_seq_0030_D23R0102_0387
	comparevartovalue VAR_UNK_4115, 2
	gotoif ge, scr_seq_0030_D23R0102_0387
	apply_movement 9, scr_seq_0030_D23R0102_0628
	wait_movement
	gender_msgbox 24, 25
	closemsg
	scrcmd_146 8
	npc_msg 26
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	closemsg
	apply_movement 9, scr_seq_0030_D23R0102_0628
	wait_movement
	npc_msg 27
	closemsg
scr_seq_0030_D23R0102_0387:
	comparevartovalue VAR_UNK_413A, 1
	gotoif eq, scr_seq_0030_D23R0102_0499
	comparevartovalue VAR_UNK_413A, 3
	gotoif eq, scr_seq_0030_D23R0102_04AD
	comparevartovalue VAR_UNK_413A, 5
	gotoif eq, scr_seq_0030_D23R0102_04C1
	comparevartovalue VAR_UNK_413A, 10
	gotoif eq, scr_seq_0030_D23R0102_04D5
	comparevartovalue VAR_UNK_413A, 15
	gotoif eq, scr_seq_0030_D23R0102_04E9
	comparevartovalue VAR_UNK_413A, 20
	gotoif eq, scr_seq_0030_D23R0102_04FD
	comparevartovalue VAR_UNK_413A, 25
	gotoif eq, scr_seq_0030_D23R0102_0511
	comparevartovalue VAR_UNK_413A, 30
	gotoif eq, scr_seq_0030_D23R0102_0525
	goto scr_seq_0030_D23R0102_0568

scr_seq_0030_D23R0102_03F5:
	npc_msg 32
	closemsg
	apply_movement 9, scr_seq_0030_D23R0102_0638
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 8, scr_seq_0030_D23R0102_0648
	apply_movement 255, scr_seq_0030_D23R0102_0614
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_198 0, 16698
	scrcmd_194 1, 32772
	npc_msg 35
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0030_D23R0102_0539
	callstd std_give_item_verbose
scr_seq_0030_D23R0102_0450:
	comparevartovalue VAR_UNK_413A, 30
	gotoif lt, scr_seq_0030_D23R0102_0486
	npc_msg 36
	closemsg
	play_fanfare SEQ_ME_KEYITEM
	npc_msg 37
	wait_fanfare
	closemsg
	comparevartovalue VAR_UNK_4115, 255
	gotoif ge, scr_seq_0030_D23R0102_0480
	addvar VAR_UNK_4115, 1
scr_seq_0030_D23R0102_0480:
	setvar VAR_UNK_413A, 0
scr_seq_0030_D23R0102_0486:
	npc_msg 38
	closemsg
	apply_movement 8, scr_seq_0030_D23R0102_0654
	wait_movement
	releaseall
	end

scr_seq_0030_D23R0102_0499:
	setvar VAR_SPECIAL_x8004, 4
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0030_D23R0102_03F5

scr_seq_0030_D23R0102_04AB:
	.byte 0x02, 0x00
scr_seq_0030_D23R0102_04AD:
	setvar VAR_SPECIAL_x8004, 23
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0030_D23R0102_03F5

scr_seq_0030_D23R0102_04BF:
	.byte 0x02
	.byte 0x00
scr_seq_0030_D23R0102_04C1:
	setvar VAR_SPECIAL_x8004, 46
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0030_D23R0102_03F5

scr_seq_0030_D23R0102_04D3:
	.byte 0x02, 0x00
scr_seq_0030_D23R0102_04D5:
	setvar VAR_SPECIAL_x8004, 47
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0030_D23R0102_03F5

scr_seq_0030_D23R0102_04E7:
	.byte 0x02, 0x00
scr_seq_0030_D23R0102_04E9:
	setvar VAR_SPECIAL_x8004, 48
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0030_D23R0102_03F5

scr_seq_0030_D23R0102_04FB:
	.byte 0x02, 0x00
scr_seq_0030_D23R0102_04FD:
	setvar VAR_SPECIAL_x8004, 92
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0030_D23R0102_03F5

scr_seq_0030_D23R0102_050F:
	.byte 0x02
	.byte 0x00
scr_seq_0030_D23R0102_0511:
	setvar VAR_SPECIAL_x8004, 50
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0030_D23R0102_03F5

scr_seq_0030_D23R0102_0523:
	.byte 0x02, 0x00
scr_seq_0030_D23R0102_0525:
	setvar VAR_SPECIAL_x8004, 45
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0030_D23R0102_03F5

scr_seq_0030_D23R0102_0537:
	.byte 0x02, 0x00
scr_seq_0030_D23R0102_0539:
	callstd 2009
	closemsg
	goto scr_seq_0030_D23R0102_0450

scr_seq_0030_D23R0102_0545:
	.byte 0x02, 0x00
scr_seq_0030_D23R0102_0547:
	npc_msg 29
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0030_D23R0102_0552:
	npc_msg 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0030_D23R0102_055D:
	npc_msg 23
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0030_D23R0102_0568:
	npc_msg 32
	closemsg
	apply_movement 9, scr_seq_0030_D23R0102_0638
	wait_movement
	releaseall
	end

scr_seq_0030_D23R0102_057B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 4
	gotoif eq, scr_seq_0030_D23R0102_05C0
	hasitem ITEM_BLUE_CARD, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_0030_D23R0102_05B0
	npc_msg 33
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0030_D23R0102_05B0:
	scrcmd_198 0, 16698
	npc_msg 34
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0030_D23R0102_05C0:
	npc_msg 39
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0030_D23R0102_05CB:
	.byte 0x00

scr_seq_0030_D23R0102_05CC:
	.short 1, 1
	.short 13, 2
	.short 14, 1
	.short 34, 1
	.short 254, 0

scr_seq_0030_D23R0102_05E0:
	.short 13, 2
	.short 14, 1
	.short 32, 1
	.short 254, 0

scr_seq_0030_D23R0102_05F0:
	.short 1, 1
	.short 13, 1
	.short 34, 1
	.short 254, 0

scr_seq_0030_D23R0102_0600:
	.short 13, 1
	.short 32, 1
	.short 254, 0

scr_seq_0030_D23R0102_060C:
	.short 32, 1
	.short 254, 0

scr_seq_0030_D23R0102_0614:
	.short 13, 1
	.short 14, 2
	.short 254, 0

scr_seq_0030_D23R0102_0620:
	.short 34, 1
	.short 254, 0

scr_seq_0030_D23R0102_0628:
	.short 33, 1
	.short 254, 0

scr_seq_0030_D23R0102_0630:
	.short 13, 1
	.short 254, 0

scr_seq_0030_D23R0102_0638:
	.short 0, 1
	.short 12, 1
	.short 34, 1
	.short 254, 0

scr_seq_0030_D23R0102_0648:
	.short 13, 2
	.short 15, 3
	.short 254, 0

scr_seq_0030_D23R0102_0654:
	.short 14, 3
	.short 12, 2
	.short 33, 1
	.short 254, 0
	.balign 4, 0
