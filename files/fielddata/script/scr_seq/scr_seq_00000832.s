#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000832_00000894 ; 000
	scrdef scr_seq_00000832_000008BD ; 001
	scrdef scr_seq_00000832_000008D0 ; 002
	scrdef scr_seq_00000832_00000052 ; 003
	scrdef scr_seq_00000832_00000264 ; 004
	scrdef scr_seq_00000832_000002C7 ; 005
	scrdef scr_seq_00000832_0000032A ; 006
	scrdef scr_seq_00000832_0000038D ; 007
	scrdef scr_seq_00000832_000003F0 ; 008
	scrdef scr_seq_00000832_00000453 ; 009
	scrdef scr_seq_00000832_000004B6 ; 010
	scrdef scr_seq_00000832_00000519 ; 011
	scrdef scr_seq_00000832_0000057C ; 012
	scrdef scr_seq_00000832_000005DF ; 013
	scrdef scr_seq_00000832_00000642 ; 014
	scrdef scr_seq_00000832_000006A5 ; 015
	scrdef scr_seq_00000832_00000708 ; 016
	scrdef scr_seq_00000832_0000076B ; 017
	scrdef scr_seq_00000832_000007CE ; 018
	scrdef scr_seq_00000832_00000831 ; 019
	scrdef_end

scr_seq_00000832_00000052:
	scrcmd_142 17, 16384
	scrcmd_142 26, 16385
	scrcmd_142 27, 16386
	scrcmd_142 28, 16387
	scrcmd_142 29, 16388
	scrcmd_142 30, 16389
	scrcmd_142 31, 16390
	scrcmd_142 32, 16391
	scrcmd_142 33, 16392
	scrcmd_142 34, 16393
	scrcmd_142 35, 16394
	scrcmd_142 18, 16395
	scrcmd_142 36, 16396
	scrcmd_142 37, 16397
	scrcmd_142 38, 16398
	scrcmd_142 39, 16399
	comparevartovalue VAR_TEMP_x4003, 0
	gotoif ne, scr_seq_00000832_000000C9
	setflag FLAG_UNK_2B8
	goto scr_seq_00000832_000000CD

scr_seq_00000832_000000C9:
	clearflag FLAG_UNK_2B8
scr_seq_00000832_000000CD:
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000832_000000E4
	setflag FLAG_UNK_2B5
	goto scr_seq_00000832_000000E8

scr_seq_00000832_000000E4:
	clearflag FLAG_UNK_2B5
scr_seq_00000832_000000E8:
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000832_000000FF
	setflag FLAG_UNK_2B6
	goto scr_seq_00000832_00000103

scr_seq_00000832_000000FF:
	clearflag FLAG_UNK_2B6
scr_seq_00000832_00000103:
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_00000832_0000011A
	setflag FLAG_UNK_2B7
	goto scr_seq_00000832_0000011E

scr_seq_00000832_0000011A:
	clearflag FLAG_UNK_2B7
scr_seq_00000832_0000011E:
	comparevartovalue VAR_TEMP_x4004, 0
	gotoif ne, scr_seq_00000832_00000135
	setflag FLAG_UNK_2B9
	goto scr_seq_00000832_00000139

scr_seq_00000832_00000135:
	clearflag FLAG_UNK_2B9
scr_seq_00000832_00000139:
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_00000832_00000150
	setflag FLAG_UNK_2BA
	goto scr_seq_00000832_00000154

scr_seq_00000832_00000150:
	clearflag FLAG_UNK_2BA
scr_seq_00000832_00000154:
	comparevartovalue VAR_TEMP_x4006, 0
	gotoif ne, scr_seq_00000832_0000016B
	setflag FLAG_UNK_2BB
	goto scr_seq_00000832_0000016F

scr_seq_00000832_0000016B:
	clearflag FLAG_UNK_2BB
scr_seq_00000832_0000016F:
	comparevartovalue VAR_TEMP_x4007, 0
	gotoif ne, scr_seq_00000832_00000186
	setflag FLAG_UNK_2BC
	goto scr_seq_00000832_0000018A

scr_seq_00000832_00000186:
	clearflag FLAG_UNK_2BC
scr_seq_00000832_0000018A:
	comparevartovalue VAR_TEMP_x4008, 0
	gotoif ne, scr_seq_00000832_000001A1
	setflag FLAG_UNK_2BD
	goto scr_seq_00000832_000001A5

scr_seq_00000832_000001A1:
	clearflag FLAG_UNK_2BD
scr_seq_00000832_000001A5:
	comparevartovalue VAR_TEMP_x4009, 0
	gotoif ne, scr_seq_00000832_000001BC
	setflag FLAG_UNK_2BE
	goto scr_seq_00000832_000001C0

scr_seq_00000832_000001BC:
	clearflag FLAG_UNK_2BE
scr_seq_00000832_000001C0:
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_00000832_000001D7
	setflag FLAG_UNK_2BF
	goto scr_seq_00000832_000001DB

scr_seq_00000832_000001D7:
	clearflag FLAG_UNK_2BF
scr_seq_00000832_000001DB:
	comparevartovalue VAR_TEMP_x400B, 0
	gotoif ne, scr_seq_00000832_000001F2
	setflag FLAG_UNK_2C0
	goto scr_seq_00000832_000001F6

scr_seq_00000832_000001F2:
	clearflag FLAG_UNK_2C0
scr_seq_00000832_000001F6:
	comparevartovalue VAR_TEMP_x400C, 0
	gotoif ne, scr_seq_00000832_0000020D
	setflag FLAG_UNK_2C1
	goto scr_seq_00000832_00000211

scr_seq_00000832_0000020D:
	clearflag FLAG_UNK_2C1
scr_seq_00000832_00000211:
	comparevartovalue VAR_TEMP_x400D, 0
	gotoif ne, scr_seq_00000832_00000228
	setflag FLAG_UNK_2C2
	goto scr_seq_00000832_0000022C

scr_seq_00000832_00000228:
	clearflag FLAG_UNK_2C2
scr_seq_00000832_0000022C:
	comparevartovalue VAR_TEMP_x400E, 0
	gotoif ne, scr_seq_00000832_00000243
	setflag FLAG_UNK_2C3
	goto scr_seq_00000832_00000247

scr_seq_00000832_00000243:
	clearflag FLAG_UNK_2C3
scr_seq_00000832_00000247:
	comparevartovalue VAR_TEMP_x400F, 0
	gotoif ne, scr_seq_00000832_0000025E
	setflag FLAG_UNK_2C4
	goto scr_seq_00000832_00000262

scr_seq_00000832_0000025E:
	clearflag FLAG_UNK_2C4
scr_seq_00000832_00000262:
	end

scr_seq_00000832_00000264:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 8
	closemsg
	trainer_battle 714, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000832_000002C1
	msgbox 9
	waitbutton
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_462 17
	setflag FLAG_UNK_2B5
	hide_person 1
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000832_000002C1:
	scrcmd_219
	releaseall
	end

scr_seq_00000832_000002C7:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 30
	closemsg
	trainer_battle 724, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000832_00000324
	msgbox 31
	waitbutton
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_462 26
	setflag FLAG_UNK_2B6
	hide_person 2
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000832_00000324:
	scrcmd_219
	releaseall
	end

scr_seq_00000832_0000032A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 18
	closemsg
	trainer_battle 719, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000832_00000387
	msgbox 19
	waitbutton
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_462 27
	setflag FLAG_UNK_2B7
	hide_person 3
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000832_00000387:
	scrcmd_219
	releaseall
	end

scr_seq_00000832_0000038D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 24
	closemsg
	trainer_battle 723, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000832_000003EA
	msgbox 25
	waitbutton
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_462 28
	setflag FLAG_UNK_2B8
	hide_person 4
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000832_000003EA:
	scrcmd_219
	releaseall
	end

scr_seq_00000832_000003F0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 26
	closemsg
	trainer_battle 721, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000832_0000044D
	msgbox 27
	waitbutton
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_462 29
	setflag FLAG_UNK_2B9
	hide_person 5
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000832_0000044D:
	scrcmd_219
	releaseall
	end

scr_seq_00000832_00000453:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 32
	closemsg
	trainer_battle 726, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000832_000004B0
	msgbox 33
	waitbutton
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_462 30
	setflag FLAG_UNK_2BA
	hide_person 16
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000832_000004B0:
	scrcmd_219
	releaseall
	end

scr_seq_00000832_000004B6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 34
	closemsg
	trainer_battle 727, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000832_00000513
	msgbox 35
	waitbutton
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_462 31
	setflag FLAG_UNK_2BB
	hide_person 6
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000832_00000513:
	scrcmd_219
	releaseall
	end

scr_seq_00000832_00000519:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 10
	closemsg
	trainer_battle 718, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000832_00000576
	msgbox 11
	waitbutton
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_462 32
	setflag FLAG_UNK_2BC
	hide_person 7
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000832_00000576:
	scrcmd_219
	releaseall
	end

scr_seq_00000832_0000057C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 28
	closemsg
	trainer_battle 720, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000832_000005D9
	msgbox 29
	waitbutton
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_462 33
	setflag FLAG_UNK_2BD
	hide_person 8
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000832_000005D9:
	scrcmd_219
	releaseall
	end

scr_seq_00000832_000005DF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 6
	closemsg
	trainer_battle 713, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000832_0000063C
	msgbox 7
	waitbutton
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_462 34
	setflag FLAG_UNK_2BE
	hide_person 9
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000832_0000063C:
	scrcmd_219
	releaseall
	end

scr_seq_00000832_00000642:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 22
	closemsg
	trainer_battle 725, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000832_0000069F
	msgbox 23
	waitbutton
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_462 35
	setflag FLAG_UNK_2BF
	hide_person 10
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000832_0000069F:
	scrcmd_219
	releaseall
	end

scr_seq_00000832_000006A5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 4
	closemsg
	trainer_battle 712, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000832_00000702
	msgbox 5
	waitbutton
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_462 18
	setflag FLAG_UNK_2C0
	hide_person 11
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000832_00000702:
	scrcmd_219
	releaseall
	end

scr_seq_00000832_00000708:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 20
	closemsg
	trainer_battle 722, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000832_00000765
	msgbox 21
	waitbutton
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_462 36
	setflag FLAG_UNK_2C1
	hide_person 12
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000832_00000765:
	scrcmd_219
	releaseall
	end

scr_seq_00000832_0000076B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 14
	closemsg
	trainer_battle 715, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000832_000007C8
	msgbox 15
	waitbutton
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_462 37
	setflag FLAG_UNK_2C2
	hide_person 13
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000832_000007C8:
	scrcmd_219
	releaseall
	end

scr_seq_00000832_000007CE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 12
	closemsg
	trainer_battle 717, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000832_0000082B
	msgbox 13
	waitbutton
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_462 38
	setflag FLAG_UNK_2C3
	hide_person 14
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000832_0000082B:
	scrcmd_219
	releaseall
	end

scr_seq_00000832_00000831:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 16
	closemsg
	trainer_battle 716, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000832_0000088E
	msgbox 17
	waitbutton
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_462 39
	setflag FLAG_UNK_2C4
	hide_person 15
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000832_0000088E:
	scrcmd_219
	releaseall
	end

scr_seq_00000832_00000894:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_10D
	gotoif eq, scr_seq_00000832_000008B2
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000832_000008B2:
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000832_000008BD:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000832_000008D0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
