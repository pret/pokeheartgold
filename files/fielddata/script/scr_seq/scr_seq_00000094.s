#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000094_00000199 ; 000
	scrdef scr_seq_00000094_000001BC ; 001
	scrdef scr_seq_00000094_0000033C ; 002
	scrdef scr_seq_00000094_000004E8 ; 003
	scrdef scr_seq_00000094_000008A0 ; 004
	scrdef scr_seq_00000094_00000BD7 ; 005
	scrdef scr_seq_00000094_00000EDA ; 006
	scrdef scr_seq_00000094_00001150 ; 007
	scrdef scr_seq_00000094_00000062 ; 008
	scrdef scr_seq_00000094_00000BC4 ; 009
	scrdef scr_seq_00000094_00001163 ; 010
	scrdef scr_seq_00000094_0000102C ; 011
	scrdef scr_seq_00000094_000011AC ; 012
	scrdef scr_seq_00000094_000011E9 ; 013
	scrdef scr_seq_00000094_00001226 ; 014
	scrdef scr_seq_00000094_00001263 ; 015
	scrdef scr_seq_00000094_000012A0 ; 016
	scrdef scr_seq_00000094_000012DD ; 017
	scrdef scr_seq_00000094_0000131A ; 018
	scrdef scr_seq_00000094_00001357 ; 019
	scrdef scr_seq_00000094_00001394 ; 020
	scrdef scr_seq_00000094_000013D1 ; 021
	scrdef scr_seq_00000094_0000140E ; 022
	scrdef scr_seq_00000094_00001456 ; 023
	scrdef_end

scr_seq_00000094_00000062:
	setflag FLAG_UNK_1B0
	setflag FLAG_UNK_1B1
	setflag FLAG_UNK_1B2
	setflag FLAG_UNK_1B3
	setflag FLAG_UNK_1B4
	setflag FLAG_UNK_1B8
	comparevartovalue VAR_UNK_4077, 2
	gotoif eq, scr_seq_00000094_00000144
	comparevartovalue VAR_UNK_4077, 4
	gotoif eq, scr_seq_00000094_00000144
	comparevartovalue VAR_UNK_4077, 3
	gotoif eq, scr_seq_00000094_00000144
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000094_000000C0
	clearflag FLAG_UNK_1B1
	clearflag FLAG_UNK_1B3
	goto scr_seq_00000094_00000131

scr_seq_00000094_000000C0:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000094_000000D7
	clearflag FLAG_UNK_1B2
	goto scr_seq_00000094_00000131

scr_seq_00000094_000000D7:
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_00000094_000000EE
	clearflag FLAG_UNK_1B3
	goto scr_seq_00000094_00000131

scr_seq_00000094_000000EE:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_00000094_00000105
	clearflag FLAG_UNK_1B2
	goto scr_seq_00000094_00000131

scr_seq_00000094_00000105:
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_00000094_0000011C
	clearflag FLAG_UNK_1B3
	goto scr_seq_00000094_00000131

scr_seq_00000094_0000011C:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_00000094_00000131
	clearflag FLAG_UNK_1B1
	clearflag FLAG_UNK_1B2
scr_seq_00000094_00000131:
	comparevartovalue VAR_TEMP_x4000, 1
	callif eq, scr_seq_00000094_00000161
	clearflag FLAG_UNK_1B8
	end

scr_seq_00000094_00000144:
	comparevartovalue VAR_UNK_409F, 1
	gotoif ne, scr_seq_00000094_0000015B
	setflag FLAG_UNK_1B4
	goto scr_seq_00000094_0000015F

scr_seq_00000094_0000015B:
	clearflag FLAG_UNK_1B4
scr_seq_00000094_0000015F:
	end

scr_seq_00000094_00000161:
	scrcmd_522 16385
	comparevartovalue VAR_TEMP_x4001, 4
	gotoif ge, scr_seq_00000094_0000017C
	setflag FLAG_UNK_1B0
	goto scr_seq_00000094_00000197

scr_seq_00000094_0000017C:
	comparevartovalue VAR_TEMP_x4001, 9
	gotoif le, scr_seq_00000094_00000193
	setflag FLAG_UNK_1B0
	goto scr_seq_00000094_00000197

scr_seq_00000094_00000193:
	clearflag FLAG_UNK_1B0
scr_seq_00000094_00000197:
	return

scr_seq_00000094_00000199:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setflag FLAG_UNK_170
	msgbox 0
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 8
	callstd 2052
	clearflag FLAG_UNK_170
	releaseall
	end

scr_seq_00000094_000001BC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_AA0
	gotoif eq, scr_seq_00000094_00000331
	scrcmd_113 20, 2
	msgbox 10
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_000001F5
	goto scr_seq_00000094_0000030C

scr_seq_00000094_000001F3:
	.byte 0x02, 0x00
scr_seq_00000094_000001F5:
	hasenoughmoneyimmediate 32780, 500
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_00000324
	msgbox 11
	scrcmd_049
	closemsg
	scrcmd_114
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_349
	scrcmd_351 32780
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000094_00000319
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_00000319
	scrcmd_113 20, 2
	submoneyimmediate 500
	scrcmd_115
	msgbox 12
	scrcmd_049
	closemsg
	scrcmd_174 6, 1, 0, 32767
	scrcmd_175
	play_fanfare SEQ_ME_ASA
	wait_fanfare
	scrcmd_114
	scrcmd_174 6, 1, 1, 32767
	scrcmd_175
	msgbox 13
	scrcmd_049
	setflag FLAG_UNK_AA0
	call scr_seq_00000094_000004C8
	scrcmd_380 32780, 100
	comparevartovalue VAR_SPECIAL_x800C, 40
	gotoif ge, scr_seq_00000094_000002F6
	comparevartovalue VAR_SPECIAL_x800C, 10
	gotoif ge, scr_seq_00000094_000002E0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ge, scr_seq_00000094_000002CA
scr_seq_00000094_000002CA:
	scrcmd_383 1, 32773
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	msgbox 24
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000094_000002E0:
	scrcmd_383 5, 32773
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	msgbox 25
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000094_000002F6:
	scrcmd_383 10, 32773
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	msgbox 26
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000094_0000030C:
	msgbox 14
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_00000094_00000319:
	msgbox 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000094_00000324:
	msgbox 15
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_00000094_00000331:
	msgbox 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000094_0000033C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_AA0
	gotoif eq, scr_seq_00000094_000004BD
	scrcmd_113 20, 2
	msgbox 17
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_00000375
	goto scr_seq_00000094_00000498

scr_seq_00000094_00000373:
	.byte 0x02, 0x00
scr_seq_00000094_00000375:
	hasenoughmoneyimmediate 32780, 300
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_000004B0
	msgbox 18
	scrcmd_049
	closemsg
	scrcmd_114
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_349
	scrcmd_351 32780
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000094_000004A5
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_000004A5
	scrcmd_113 20, 2
	submoneyimmediate 300
	scrcmd_115
	msgbox 19
	scrcmd_049
	closemsg
	scrcmd_174 6, 1, 0, 32767
	scrcmd_175
	play_fanfare SEQ_ME_ASA
	wait_fanfare
	scrcmd_114
	scrcmd_174 6, 1, 1, 32767
	scrcmd_175
	msgbox 20
	scrcmd_049
	setflag FLAG_UNK_AA0
	scrcmd_380 32780, 100
	comparevartovalue VAR_SPECIAL_x800C, 40
	gotoif ge, scr_seq_00000094_00000444
	comparevartovalue VAR_SPECIAL_x800C, 10
	gotoif ge, scr_seq_00000094_00000460
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ge, scr_seq_00000094_0000047C
scr_seq_00000094_00000444:
	call scr_seq_00000094_000004C8
	scrcmd_383 1, 32773
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	msgbox 24
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000094_00000460:
	call scr_seq_00000094_000004C8
	scrcmd_383 5, 32773
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	msgbox 25
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000094_0000047C:
	call scr_seq_00000094_000004D8
	scrcmd_383 10, 32773
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	msgbox 26
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000094_00000498:
	msgbox 21
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_00000094_000004A5:
	msgbox 21
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000094_000004B0:
	msgbox 22
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_00000094_000004BD:
	msgbox 23
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000094_000004C8:
	scrcmd_828 32773, 1, 16
	scrcmd_828 32773, 5, 11
	return

scr_seq_00000094_000004D8:
	scrcmd_828 32773, 1, 24
	scrcmd_828 32773, 5, 18
	return

scr_seq_00000094_000004E8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_AB7
	gotoif eq, scr_seq_00000094_00000895
	scrcmd_113 20, 2
	msgbox 1
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 0
	setvar VAR_TEMP_x4005, 0
	setvar VAR_TEMP_x4006, 0
	setvar VAR_TEMP_x4007, 0
scr_seq_00000094_00000522:
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 445, 255, 0
	scrcmd_751 446, 255, 1
	scrcmd_751 447, 255, 2
	scrcmd_751 448, 255, 3
	scrcmd_751 449, 255, 4
	scrcmd_751 450, 255, 7
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000094_000005AB
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000094_000005D0
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000094_000005F5
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000094_0000061A
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000094_0000063F
	goto scr_seq_00000094_00000886

scr_seq_00000094_000005AB:
	comparevartovalue VAR_TEMP_x4003, 1
	gotoif eq, scr_seq_00000094_0000086B
	setvar VAR_SPECIAL_x8004, 92
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 4500
	goto scr_seq_00000094_00000664

scr_seq_00000094_000005D0:
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif eq, scr_seq_00000094_0000086B
	setvar VAR_SPECIAL_x8004, 88
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 650
	goto scr_seq_00000094_00000664

scr_seq_00000094_000005F5:
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif eq, scr_seq_00000094_0000086B
	setvar VAR_SPECIAL_x8004, 89
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 3500
	goto scr_seq_00000094_00000664

scr_seq_00000094_0000061A:
	comparevartovalue VAR_TEMP_x4006, 1
	gotoif eq, scr_seq_00000094_0000086B
	setvar VAR_SPECIAL_x8004, 90
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 900
	goto scr_seq_00000094_00000664

scr_seq_00000094_0000063F:
	comparevartovalue VAR_TEMP_x4007, 1
	gotoif eq, scr_seq_00000094_0000086B
	setvar VAR_SPECIAL_x8004, 91
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 4600
	goto scr_seq_00000094_00000664

scr_seq_00000094_00000664:
	scrcmd_194 0, 32772
	scrcmd_198 1, 32774
	msgbox 2
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_0000068A
	closemsg
	goto scr_seq_00000094_00000522

scr_seq_00000094_0000068A:
	comparevartovalue VAR_SPECIAL_x8004, 92
	gotoif ne, scr_seq_00000094_000006CD
	hasenoughmoneyimmediate 32780, 4500
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_00000874
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_0000087D
	submoneyimmediate 4500
	goto scr_seq_00000094_000007C6

scr_seq_00000094_000006CD:
	comparevartovalue VAR_SPECIAL_x8004, 88
	gotoif ne, scr_seq_00000094_00000710
	hasenoughmoneyimmediate 32780, 650
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_00000874
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_0000087D
	submoneyimmediate 650
	goto scr_seq_00000094_000007C6

scr_seq_00000094_00000710:
	comparevartovalue VAR_SPECIAL_x8004, 89
	gotoif ne, scr_seq_00000094_00000753
	hasenoughmoneyimmediate 32780, 3500
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_00000874
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_0000087D
	submoneyimmediate 3500
	goto scr_seq_00000094_000007C6

scr_seq_00000094_00000753:
	comparevartovalue VAR_SPECIAL_x8004, 90
	gotoif ne, scr_seq_00000094_00000796
	hasenoughmoneyimmediate 32780, 900
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_00000874
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_0000087D
	submoneyimmediate 900
	goto scr_seq_00000094_000007C6

scr_seq_00000094_00000796:
	hasenoughmoneyimmediate 32780, 4600
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_00000874
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_0000087D
	submoneyimmediate 4600
scr_seq_00000094_000007C6:
	scrcmd_115
	play_se SEQ_SE_DP_REGI
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 3
	msgbox 4
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8004, 92
	gotoif ne, scr_seq_00000094_00000803
	setvar VAR_TEMP_x4003, 1
	goto scr_seq_00000094_00000861

scr_seq_00000094_00000803:
	comparevartovalue VAR_SPECIAL_x8004, 88
	gotoif ne, scr_seq_00000094_0000081C
	setvar VAR_TEMP_x4004, 1
	goto scr_seq_00000094_00000861

scr_seq_00000094_0000081C:
	comparevartovalue VAR_SPECIAL_x8004, 89
	gotoif ne, scr_seq_00000094_00000835
	setvar VAR_TEMP_x4005, 1
	goto scr_seq_00000094_00000861

scr_seq_00000094_00000835:
	comparevartovalue VAR_SPECIAL_x8004, 90
	gotoif ne, scr_seq_00000094_0000084E
	setvar VAR_TEMP_x4006, 1
	goto scr_seq_00000094_00000861

scr_seq_00000094_0000084E:
	comparevartovalue VAR_SPECIAL_x8004, 91
	gotoif ne, scr_seq_00000094_00000861
	setvar VAR_TEMP_x4007, 1
scr_seq_00000094_00000861:
	setflag FLAG_UNK_AB7
	goto scr_seq_00000094_00000522

scr_seq_00000094_0000086B:
	msgbox 5
	goto scr_seq_00000094_00000522

scr_seq_00000094_00000874:
	msgbox 6
	goto scr_seq_00000094_00000522

scr_seq_00000094_0000087D:
	msgbox 7
	goto scr_seq_00000094_00000522

scr_seq_00000094_00000886:
	scrcmd_747
	scrcmd_114
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000094_00000895:
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000094_000008A0:
	scrcmd_609
	lockall
	apply_movement 8, scr_seq_00000094_00000AC4
	wait_movement
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 7
	gotoif ne, scr_seq_00000094_000008CF
	apply_movement 8, scr_seq_00000094_00000ACC
	goto scr_seq_00000094_0000096B

scr_seq_00000094_000008CF:
	comparevartovalue VAR_TEMP_x4001, 8
	gotoif ne, scr_seq_00000094_000008EA
	apply_movement 8, scr_seq_00000094_00000AD4
	goto scr_seq_00000094_0000096B

scr_seq_00000094_000008EA:
	comparevartovalue VAR_TEMP_x4001, 9
	gotoif ne, scr_seq_00000094_00000905
	apply_movement 8, scr_seq_00000094_00000ADC
	goto scr_seq_00000094_0000096B

scr_seq_00000094_00000905:
	comparevartovalue VAR_TEMP_x4001, 10
	gotoif ne, scr_seq_00000094_00000920
	apply_movement 8, scr_seq_00000094_00000AE4
	goto scr_seq_00000094_0000096B

scr_seq_00000094_00000920:
	comparevartovalue VAR_TEMP_x4001, 11
	gotoif ne, scr_seq_00000094_0000093B
	apply_movement 8, scr_seq_00000094_00000AEC
	goto scr_seq_00000094_0000096B

scr_seq_00000094_0000093B:
	comparevartovalue VAR_TEMP_x4001, 12
	gotoif ne, scr_seq_00000094_00000956
	apply_movement 8, scr_seq_00000094_00000AF4
	goto scr_seq_00000094_0000096B

scr_seq_00000094_00000956:
	comparevartovalue VAR_TEMP_x4001, 13
	gotoif ne, scr_seq_00000094_0000096B
	apply_movement 8, scr_seq_00000094_00000AFC
scr_seq_00000094_0000096B:
	wait_movement
	msgbox 36
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_TEMP_x4001, 7
	gotoif ne, scr_seq_00000094_000009A5
	apply_movement 8, scr_seq_00000094_00000B04
	apply_movement 255, scr_seq_00000094_00000B70
	goto scr_seq_00000094_00000A71

scr_seq_00000094_000009A5:
	comparevartovalue VAR_TEMP_x4001, 8
	gotoif ne, scr_seq_00000094_000009C8
	apply_movement 8, scr_seq_00000094_00000B10
	apply_movement 255, scr_seq_00000094_00000B7C
	goto scr_seq_00000094_00000A71

scr_seq_00000094_000009C8:
	comparevartovalue VAR_TEMP_x4001, 9
	gotoif ne, scr_seq_00000094_000009EB
	apply_movement 8, scr_seq_00000094_00000B20
	apply_movement 255, scr_seq_00000094_00000B88
	goto scr_seq_00000094_00000A71

scr_seq_00000094_000009EB:
	comparevartovalue VAR_TEMP_x4001, 10
	gotoif ne, scr_seq_00000094_00000A0E
	apply_movement 8, scr_seq_00000094_00000B30
	apply_movement 255, scr_seq_00000094_00000B94
	goto scr_seq_00000094_00000A71

scr_seq_00000094_00000A0E:
	comparevartovalue VAR_TEMP_x4001, 11
	gotoif ne, scr_seq_00000094_00000A31
	apply_movement 8, scr_seq_00000094_00000B40
	apply_movement 255, scr_seq_00000094_00000BA0
	goto scr_seq_00000094_00000A71

scr_seq_00000094_00000A31:
	comparevartovalue VAR_TEMP_x4001, 12
	gotoif ne, scr_seq_00000094_00000A54
	apply_movement 8, scr_seq_00000094_00000B50
	apply_movement 255, scr_seq_00000094_00000BAC
	goto scr_seq_00000094_00000A71

scr_seq_00000094_00000A54:
	comparevartovalue VAR_TEMP_x4001, 13
	gotoif ne, scr_seq_00000094_00000A71
	apply_movement 8, scr_seq_00000094_00000B60
	apply_movement 255, scr_seq_00000094_00000BB8
scr_seq_00000094_00000A71:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_188 1024
	scrcmd_189
	scrcmd_620 1
	play_se SEQ_SE_DP_CARD2
	wait 24, VAR_SPECIAL_x800C
	play_se SEQ_SE_DP_CARD2
	wait_se SEQ_SE_DP_CARD2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	setvar VAR_UNK_4077, 3
	msgbox 37
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000094_00000AC1:
	.byte 0x00, 0x00, 0x00

scr_seq_00000094_00000AC4:
	.short 75, 1
	.short 254, 0

scr_seq_00000094_00000ACC:
	.short 61, 1
	.short 254, 0

scr_seq_00000094_00000AD4:
	.short 13, 1
	.short 254, 0

scr_seq_00000094_00000ADC:
	.short 13, 2
	.short 254, 0

scr_seq_00000094_00000AE4:
	.short 13, 3
	.short 254, 0

scr_seq_00000094_00000AEC:
	.short 13, 4
	.short 254, 0

scr_seq_00000094_00000AF4:
	.short 13, 5
	.short 254, 0

scr_seq_00000094_00000AFC:
	.short 13, 6
	.short 254, 0

scr_seq_00000094_00000B04:
	.short 15, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000094_00000B10:
	.short 12, 1
	.short 15, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000094_00000B20:
	.short 12, 2
	.short 15, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000094_00000B30:
	.short 12, 3
	.short 15, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000094_00000B40:
	.short 12, 4
	.short 15, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000094_00000B50:
	.short 12, 5
	.short 15, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000094_00000B60:
	.short 12, 6
	.short 15, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000094_00000B70:
	.short 12, 1
	.short 35, 1
	.short 254, 0

scr_seq_00000094_00000B7C:
	.short 12, 2
	.short 35, 1
	.short 254, 0

scr_seq_00000094_00000B88:
	.short 12, 3
	.short 35, 1
	.short 254, 0

scr_seq_00000094_00000B94:
	.short 12, 4
	.short 35, 1
	.short 254, 0

scr_seq_00000094_00000BA0:
	.short 12, 5
	.short 35, 1
	.short 254, 0

scr_seq_00000094_00000BAC:
	.short 12, 6
	.short 35, 1
	.short 254, 0

scr_seq_00000094_00000BB8:
	.short 12, 7
	.short 35, 1
	.short 254, 0
scr_seq_00000094_00000BC4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 37
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000094_00000BD7:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_SPECIAL_x8007, 0
	checkflag FLAG_UNK_08C
	callif lt, scr_seq_00000094_00000C0E
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif eq, scr_seq_00000094_00000C16
	comparevartovalue VAR_TEMP_x400A, 1
	gotoif ge, scr_seq_00000094_00000C1F
	releaseall
	end

scr_seq_00000094_00000C0E:
	setvar VAR_SPECIAL_x8007, 1
	return

scr_seq_00000094_00000C16:
	msgbox 39
	goto scr_seq_00000094_00000C58

scr_seq_00000094_00000C1F:
	msgbox 49
	goto scr_seq_00000094_00000C58

scr_seq_00000094_00000C28:
	msgbox 41
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_00000C4F
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000094_00000CA0
	end

scr_seq_00000094_00000C4F:
	msgbox 44
	goto scr_seq_00000094_00000C7C

scr_seq_00000094_00000C58:
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_00000C28
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000094_00000DDA
	end

scr_seq_00000094_00000C7C:
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_00000CA0
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000094_00000DDA
	end

scr_seq_00000094_00000CA0:
	scrcmd_332 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000094_00000CC0
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000094_00000CCC
	end

scr_seq_00000094_00000CC0:
	setvar VAR_TEMP_x4002, 0
	goto scr_seq_00000094_00000D17

scr_seq_00000094_00000CCC:
	msgbox 42
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_349
	scrcmd_351 16386
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	comparevartovalue VAR_TEMP_x4002, 255
	gotoif eq, scr_seq_00000094_00000DDA
	get_partymon_species VAR_TEMP_x4002, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_00000DE5
	goto scr_seq_00000094_00000D17

scr_seq_00000094_00000D17:
	msgbox 43
	closemsg
	scrcmd_386 VAR_SPECIAL_x8006
	comparevartovalue VAR_SPECIAL_x8006, 0
	gotoif eq, scr_seq_00000094_00000D49
	comparevartovalue VAR_SPECIAL_x8006, 2
	gotoif eq, scr_seq_00000094_00000D4F
	comparevartovalue VAR_SPECIAL_x8006, 3
	gotoif eq, scr_seq_00000094_00000D55
	end

scr_seq_00000094_00000D49:
	goto scr_seq_00000094_00000D5B

scr_seq_00000094_00000D4F:
	goto scr_seq_00000094_00000D5B

scr_seq_00000094_00000D55:
	goto scr_seq_00000094_00000D5B

scr_seq_00000094_00000D5B:
	setflag FLAG_UNK_08C
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_154 16386, 32773, 32775
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	comparevartovalue VAR_SPECIAL_x8006, 0
	gotoif eq, scr_seq_00000094_00000DAA
	comparevartovalue VAR_SPECIAL_x8006, 2
	gotoif eq, scr_seq_00000094_00000DB0
	comparevartovalue VAR_SPECIAL_x8006, 3
	gotoif eq, scr_seq_00000094_00000DB6
	end

scr_seq_00000094_00000DAA:
	goto scr_seq_00000094_00000DBC

scr_seq_00000094_00000DB0:
	goto scr_seq_00000094_00000DBC

scr_seq_00000094_00000DB6:
	goto scr_seq_00000094_00000DBC

scr_seq_00000094_00000DBC:
	comparevartovalue VAR_SPECIAL_x8005, 0
	gotoif eq, scr_seq_00000094_00000E40
	setvar VAR_TEMP_x400A, 1
	msgbox 45
	closemsg
	goto scr_seq_00000094_00000DEE

scr_seq_00000094_00000DDA:
	msgbox 40
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000094_00000DE5:
	msgbox 51
	goto scr_seq_00000094_00000CCC

scr_seq_00000094_00000DEE:
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_492 0, VAR_SPECIAL_x800C, VAR_SPECIAL_x8004
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_00000E35
	scrcmd_256 32772
	scrcmd_494 0, VAR_SPECIAL_x8004
	msgbox 46
	msgbox 52
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000094_00000E35:
	msgbox 47
	closemsg
	goto scr_seq_00000094_00000DEE

scr_seq_00000094_00000E40:
	msgbox 48
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000094_00000E4B:
	.byte 0x00, 0x08, 0x00, 0x02, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00, 0x0a, 0x00, 0x01, 0x00, 0x08, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
	.byte 0x0b, 0x00, 0x01, 0x00, 0x08, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00, 0x09, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
	.byte 0x0e, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x0e, 0x00, 0x01, 0x00
	.byte 0x03, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x0f, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00, 0x0f, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
	.byte 0x0f, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x0e, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x03, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x02, 0x00
scr_seq_00000094_00000EDA:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 29
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_00000F05
	msgbox 34
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000094_00000F05:
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000094_00000FDA
	msgbox 30
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_188 1024
	scrcmd_189
	scrcmd_620 1
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000094_00000FE8
	apply_movement 10, scr_seq_00000094_00001000
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000094_00000F79
	scrcmd_099 253
	apply_movement 253, scr_seq_00000094_00000FF8
	scrcmd_098 253
	wait_movement
scr_seq_00000094_00000F79:
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	msgbox 31
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 10
	lockall
	scrcmd_188 1
	scrcmd_189
	scrcmd_620 0
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000094_00001010
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	msgbox 32
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000094_00000FDA:
	msgbox 35
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000094_00000FE5:
	.byte 0x00, 0x00, 0x00

scr_seq_00000094_00000FE8:
	.short 20, 3
	.short 22, 2
	.short 1, 1
	.short 254, 0

scr_seq_00000094_00000FF8:
	.short 1, 1
	.short 254, 0

scr_seq_00000094_00001000:
	.short 21, 2
	.short 22, 4
	.short 0, 1
	.short 254, 0

scr_seq_00000094_00001010:
	.short 21, 3
	.short 23, 2
	.short 254, 0
	.byte 0x14, 0x00, 0x02, 0x00
	.byte 0x17, 0x00, 0x04, 0x00, 0x02, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_00000094_0000102C:
	scrcmd_609
	lockall
	callstd 2067
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 31
	gotoif ne, scr_seq_00000094_00001055
	apply_movement 12, scr_seq_00000094_000010B4
	goto scr_seq_00000094_0000105D

scr_seq_00000094_00001055:
	apply_movement 12, scr_seq_00000094_000010C8
scr_seq_00000094_0000105D:
	wait_movement
	msgbox 55
	closemsg
	apply_movement 12, scr_seq_00000094_000010E4
	wait_movement
	msgbox 56
	closemsg
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 31
	gotoif ne, scr_seq_00000094_00001094
	apply_movement 12, scr_seq_00000094_000010F0
	goto scr_seq_00000094_0000109C

scr_seq_00000094_00001094:
	apply_movement 12, scr_seq_00000094_00001120
scr_seq_00000094_0000109C:
	wait_movement
	hide_person 12
	setflag FLAG_UNK_237
	callstd 2068
	releaseall
	setvar VAR_UNK_40E7, 3
	end


scr_seq_00000094_000010B4:
	.short 75, 1
	.short 34, 1
	.short 63, 1
	.short 14, 2
	.short 254, 0

scr_seq_00000094_000010C8:
	.short 75, 1
	.short 34, 1
	.short 63, 1
	.short 14, 1
	.short 13, 1
	.short 14, 1
	.short 254, 0

scr_seq_00000094_000010E4:
	.short 75, 1
	.short 65, 1
	.short 254, 0

scr_seq_00000094_000010F0:
	.short 13, 1
	.short 14, 3
	.short 0, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 14, 7
	.short 254, 0

scr_seq_00000094_00001120:
	.short 12, 1
	.short 14, 3
	.short 0, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 14, 7
	.short 254, 0
scr_seq_00000094_00001150:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 27
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000094_00001163:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	getitemquantity 476, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000094_00001189
	msgbox 27
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000094_00001189:
	scrcmd_190 0
	msgbox 28
	closemsg
	apply_movement 11, scr_seq_00000094_000011A4
	wait_movement
	releaseall
	setflag FLAG_UNK_1C0
	end

scr_seq_00000094_000011A3:
	.byte 0x00

scr_seq_00000094_000011A4:
	.short 15, 2
	.short 254, 0
scr_seq_00000094_000011AC:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_0000144B
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_155 0, 32780
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000094_000011E9:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 1, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_0000144B
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_155 1, 32780
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000094_00001226:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 2, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_0000144B
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_155 2, 32780
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000094_00001263:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 3, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_0000144B
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_155 3, 32780
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000094_000012A0:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 4, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_0000144B
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_155 4, 32780
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000094_000012DD:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 5, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_0000144B
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_155 5, 32780
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000094_0000131A:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 6, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_0000144B
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_155 6, 32780
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000094_00001357:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 7, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_0000144B
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_155 7, 32780
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000094_00001394:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 8, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_0000144B
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_155 8, 32780
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000094_000013D1:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 9, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_0000144B
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_155 9, 32780
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000094_0000140E:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 10, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_0000144B
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_155 10, 32780
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000094_0000144B:
	msgbox 53
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000094_00001456:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_830 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000094_00001480
	scrcmd_832 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000094_00001521
scr_seq_00000094_00001480:
	msgbox 57
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000094_00001530
	hasenoughmoneyimmediate 32780, 100
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_0000153F
	submoneyimmediate 100
	scrcmd_553 5, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000094_0000154E
	scrcmd_831 32772
	scrcmd_404 32772, 1, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000094_0000155B
	msgbox 61
	setvar VAR_SPECIAL_x8005, 1
	callstd 2007
scr_seq_00000094_000014EB:
	scrcmd_832 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000094_00001530
	scrcmd_553 95, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000094_00001530
	scrcmd_833 32772
	msgbox 62
	callstd 2026
	goto scr_seq_00000094_00001530

scr_seq_00000094_0000151F:
	.byte 0x02
	.byte 0x00
scr_seq_00000094_00001521:
	msgbox 58
	waitbutton
	closemsg
	goto scr_seq_00000094_00001568

scr_seq_00000094_0000152E:
	.byte 0x02, 0x00
scr_seq_00000094_00001530:
	msgbox 59
	waitbutton
	closemsg
	goto scr_seq_00000094_00001568

scr_seq_00000094_0000153D:
	.byte 0x02, 0x00
scr_seq_00000094_0000153F:
	msgbox 60
	waitbutton
	closemsg
	goto scr_seq_00000094_00001568

scr_seq_00000094_0000154C:
	.byte 0x02, 0x00
scr_seq_00000094_0000154E:
	msgbox 64
	closemsg
	goto scr_seq_00000094_00001530

scr_seq_00000094_00001559:
	.byte 0x02, 0x00
scr_seq_00000094_0000155B:
	msgbox 64
	closemsg
	goto scr_seq_00000094_000014EB

scr_seq_00000094_00001566:
	.byte 0x02, 0x00
scr_seq_00000094_00001568:
	releaseall
	end
	.balign 4, 0
