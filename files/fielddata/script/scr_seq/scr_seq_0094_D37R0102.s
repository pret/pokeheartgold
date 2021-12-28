#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0094_D37R0102_0199 ; 000
	scrdef scr_seq_0094_D37R0102_01BC ; 001
	scrdef scr_seq_0094_D37R0102_033C ; 002
	scrdef scr_seq_0094_D37R0102_04E8 ; 003
	scrdef scr_seq_0094_D37R0102_08A0 ; 004
	scrdef scr_seq_0094_D37R0102_0BD7 ; 005
	scrdef scr_seq_0094_D37R0102_0EDA ; 006
	scrdef scr_seq_0094_D37R0102_1150 ; 007
	scrdef scr_seq_0094_D37R0102_0062 ; 008
	scrdef scr_seq_0094_D37R0102_0BC4 ; 009
	scrdef scr_seq_0094_D37R0102_1163 ; 010
	scrdef scr_seq_0094_D37R0102_102C ; 011
	scrdef scr_seq_0094_D37R0102_11AC ; 012
	scrdef scr_seq_0094_D37R0102_11E9 ; 013
	scrdef scr_seq_0094_D37R0102_1226 ; 014
	scrdef scr_seq_0094_D37R0102_1263 ; 015
	scrdef scr_seq_0094_D37R0102_12A0 ; 016
	scrdef scr_seq_0094_D37R0102_12DD ; 017
	scrdef scr_seq_0094_D37R0102_131A ; 018
	scrdef scr_seq_0094_D37R0102_1357 ; 019
	scrdef scr_seq_0094_D37R0102_1394 ; 020
	scrdef scr_seq_0094_D37R0102_13D1 ; 021
	scrdef scr_seq_0094_D37R0102_140E ; 022
	scrdef scr_seq_0094_D37R0102_1456 ; 023
	scrdef_end

scr_seq_0094_D37R0102_0062:
	setflag FLAG_UNK_1B0
	setflag FLAG_UNK_1B1
	setflag FLAG_UNK_1B2
	setflag FLAG_UNK_1B3
	setflag FLAG_UNK_1B4
	setflag FLAG_UNK_1B8
	comparevartovalue VAR_UNK_4077, 2
	gotoif eq, scr_seq_0094_D37R0102_0144
	comparevartovalue VAR_UNK_4077, 4
	gotoif eq, scr_seq_0094_D37R0102_0144
	comparevartovalue VAR_UNK_4077, 3
	gotoif eq, scr_seq_0094_D37R0102_0144
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0094_D37R0102_00C0
	clearflag FLAG_UNK_1B1
	clearflag FLAG_UNK_1B3
	goto scr_seq_0094_D37R0102_0131

scr_seq_0094_D37R0102_00C0:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0094_D37R0102_00D7
	clearflag FLAG_UNK_1B2
	goto scr_seq_0094_D37R0102_0131

scr_seq_0094_D37R0102_00D7:
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_0094_D37R0102_00EE
	clearflag FLAG_UNK_1B3
	goto scr_seq_0094_D37R0102_0131

scr_seq_0094_D37R0102_00EE:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_0094_D37R0102_0105
	clearflag FLAG_UNK_1B2
	goto scr_seq_0094_D37R0102_0131

scr_seq_0094_D37R0102_0105:
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_0094_D37R0102_011C
	clearflag FLAG_UNK_1B3
	goto scr_seq_0094_D37R0102_0131

scr_seq_0094_D37R0102_011C:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_0094_D37R0102_0131
	clearflag FLAG_UNK_1B1
	clearflag FLAG_UNK_1B2
scr_seq_0094_D37R0102_0131:
	comparevartovalue VAR_TEMP_x4000, 1
	callif eq, scr_seq_0094_D37R0102_0161
	clearflag FLAG_UNK_1B8
	end

scr_seq_0094_D37R0102_0144:
	comparevartovalue VAR_UNK_409F, 1
	gotoif ne, scr_seq_0094_D37R0102_015B
	setflag FLAG_UNK_1B4
	goto scr_seq_0094_D37R0102_015F

scr_seq_0094_D37R0102_015B:
	clearflag FLAG_UNK_1B4
scr_seq_0094_D37R0102_015F:
	end

scr_seq_0094_D37R0102_0161:
	scrcmd_522 16385
	comparevartovalue VAR_TEMP_x4001, 4
	gotoif ge, scr_seq_0094_D37R0102_017C
	setflag FLAG_UNK_1B0
	goto scr_seq_0094_D37R0102_0197

scr_seq_0094_D37R0102_017C:
	comparevartovalue VAR_TEMP_x4001, 9
	gotoif le, scr_seq_0094_D37R0102_0193
	setflag FLAG_UNK_1B0
	goto scr_seq_0094_D37R0102_0197

scr_seq_0094_D37R0102_0193:
	clearflag FLAG_UNK_1B0
scr_seq_0094_D37R0102_0197:
	return

scr_seq_0094_D37R0102_0199:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setflag FLAG_UNK_170
	npc_msg 0
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 8
	callstd 2052
	clearflag FLAG_UNK_170
	releaseall
	end

scr_seq_0094_D37R0102_01BC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_AA0
	gotoif TRUE, scr_seq_0094_D37R0102_0331
	scrcmd_113 20, 2
	npc_msg 10
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_01F5
	goto scr_seq_0094_D37R0102_030C

scr_seq_0094_D37R0102_01F3:
	.byte 0x02, 0x00
scr_seq_0094_D37R0102_01F5:
	hasenoughmoneyimmediate 32780, 500
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_0324
	npc_msg 11
	scrcmd_049
	closemsg
	scrcmd_114
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_349
	scrcmd_351 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0094_D37R0102_0319
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_0319
	scrcmd_113 20, 2
	submoneyimmediate 500
	scrcmd_115
	npc_msg 12
	scrcmd_049
	closemsg
	fade_screen 6, 1, 0, 32767
	wait_fade
	play_fanfare SEQ_ME_ASA
	wait_fanfare
	scrcmd_114
	fade_screen 6, 1, 1, 32767
	wait_fade
	npc_msg 13
	scrcmd_049
	setflag FLAG_UNK_AA0
	call scr_seq_0094_D37R0102_04C8
	scrcmd_380 32780, 100
	comparevartovalue VAR_SPECIAL_x800C, 40
	gotoif ge, scr_seq_0094_D37R0102_02F6
	comparevartovalue VAR_SPECIAL_x800C, 10
	gotoif ge, scr_seq_0094_D37R0102_02E0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ge, scr_seq_0094_D37R0102_02CA
scr_seq_0094_D37R0102_02CA:
	scrcmd_383 1, 32773
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg 24
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0094_D37R0102_02E0:
	scrcmd_383 5, 32773
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg 25
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0094_D37R0102_02F6:
	scrcmd_383 10, 32773
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg 26
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0094_D37R0102_030C:
	npc_msg 14
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_0094_D37R0102_0319:
	npc_msg 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0094_D37R0102_0324:
	npc_msg 15
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_0094_D37R0102_0331:
	npc_msg 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0094_D37R0102_033C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_AA0
	gotoif TRUE, scr_seq_0094_D37R0102_04BD
	scrcmd_113 20, 2
	npc_msg 17
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_0375
	goto scr_seq_0094_D37R0102_0498

scr_seq_0094_D37R0102_0373:
	.byte 0x02, 0x00
scr_seq_0094_D37R0102_0375:
	hasenoughmoneyimmediate 32780, 300
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_04B0
	npc_msg 18
	scrcmd_049
	closemsg
	scrcmd_114
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_349
	scrcmd_351 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0094_D37R0102_04A5
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_04A5
	scrcmd_113 20, 2
	submoneyimmediate 300
	scrcmd_115
	npc_msg 19
	scrcmd_049
	closemsg
	fade_screen 6, 1, 0, 32767
	wait_fade
	play_fanfare SEQ_ME_ASA
	wait_fanfare
	scrcmd_114
	fade_screen 6, 1, 1, 32767
	wait_fade
	npc_msg 20
	scrcmd_049
	setflag FLAG_UNK_AA0
	scrcmd_380 32780, 100
	comparevartovalue VAR_SPECIAL_x800C, 40
	gotoif ge, scr_seq_0094_D37R0102_0444
	comparevartovalue VAR_SPECIAL_x800C, 10
	gotoif ge, scr_seq_0094_D37R0102_0460
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ge, scr_seq_0094_D37R0102_047C
scr_seq_0094_D37R0102_0444:
	call scr_seq_0094_D37R0102_04C8
	scrcmd_383 1, 32773
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg 24
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0094_D37R0102_0460:
	call scr_seq_0094_D37R0102_04C8
	scrcmd_383 5, 32773
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg 25
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0094_D37R0102_047C:
	call scr_seq_0094_D37R0102_04D8
	scrcmd_383 10, 32773
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg 26
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0094_D37R0102_0498:
	npc_msg 21
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_0094_D37R0102_04A5:
	npc_msg 21
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0094_D37R0102_04B0:
	npc_msg 22
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_0094_D37R0102_04BD:
	npc_msg 23
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0094_D37R0102_04C8:
	scrcmd_828 32773, 1, 16
	scrcmd_828 32773, 5, 11
	return

scr_seq_0094_D37R0102_04D8:
	scrcmd_828 32773, 1, 24
	scrcmd_828 32773, 5, 18
	return

scr_seq_0094_D37R0102_04E8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_AB7
	gotoif TRUE, scr_seq_0094_D37R0102_0895
	scrcmd_113 20, 2
	npc_msg 1
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 0
	setvar VAR_TEMP_x4005, 0
	setvar VAR_TEMP_x4006, 0
	setvar VAR_TEMP_x4007, 0
scr_seq_0094_D37R0102_0522:
	touchscreen_menu_hide
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
	gotoif eq, scr_seq_0094_D37R0102_05AB
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0094_D37R0102_05D0
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0094_D37R0102_05F5
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0094_D37R0102_061A
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0094_D37R0102_063F
	goto scr_seq_0094_D37R0102_0886

scr_seq_0094_D37R0102_05AB:
	comparevartovalue VAR_TEMP_x4003, 1
	gotoif eq, scr_seq_0094_D37R0102_086B
	setvar VAR_SPECIAL_x8004, 92
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 4500
	goto scr_seq_0094_D37R0102_0664

scr_seq_0094_D37R0102_05D0:
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif eq, scr_seq_0094_D37R0102_086B
	setvar VAR_SPECIAL_x8004, 88
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 650
	goto scr_seq_0094_D37R0102_0664

scr_seq_0094_D37R0102_05F5:
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif eq, scr_seq_0094_D37R0102_086B
	setvar VAR_SPECIAL_x8004, 89
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 3500
	goto scr_seq_0094_D37R0102_0664

scr_seq_0094_D37R0102_061A:
	comparevartovalue VAR_TEMP_x4006, 1
	gotoif eq, scr_seq_0094_D37R0102_086B
	setvar VAR_SPECIAL_x8004, 90
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 900
	goto scr_seq_0094_D37R0102_0664

scr_seq_0094_D37R0102_063F:
	comparevartovalue VAR_TEMP_x4007, 1
	gotoif eq, scr_seq_0094_D37R0102_086B
	setvar VAR_SPECIAL_x8004, 91
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 4600
	goto scr_seq_0094_D37R0102_0664

scr_seq_0094_D37R0102_0664:
	buffer_item_name 0, 32772
	scrcmd_198 1, 32774
	npc_msg 2
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_068A
	closemsg
	goto scr_seq_0094_D37R0102_0522

scr_seq_0094_D37R0102_068A:
	comparevartovalue VAR_SPECIAL_x8004, 92
	gotoif ne, scr_seq_0094_D37R0102_06CD
	hasenoughmoneyimmediate 32780, 4500
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_0874
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_087D
	submoneyimmediate 4500
	goto scr_seq_0094_D37R0102_07C6

scr_seq_0094_D37R0102_06CD:
	comparevartovalue VAR_SPECIAL_x8004, 88
	gotoif ne, scr_seq_0094_D37R0102_0710
	hasenoughmoneyimmediate 32780, 650
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_0874
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_087D
	submoneyimmediate 650
	goto scr_seq_0094_D37R0102_07C6

scr_seq_0094_D37R0102_0710:
	comparevartovalue VAR_SPECIAL_x8004, 89
	gotoif ne, scr_seq_0094_D37R0102_0753
	hasenoughmoneyimmediate 32780, 3500
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_0874
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_087D
	submoneyimmediate 3500
	goto scr_seq_0094_D37R0102_07C6

scr_seq_0094_D37R0102_0753:
	comparevartovalue VAR_SPECIAL_x8004, 90
	gotoif ne, scr_seq_0094_D37R0102_0796
	hasenoughmoneyimmediate 32780, 900
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_0874
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_087D
	submoneyimmediate 900
	goto scr_seq_0094_D37R0102_07C6

scr_seq_0094_D37R0102_0796:
	hasenoughmoneyimmediate 32780, 4600
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_0874
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_087D
	submoneyimmediate 4600
scr_seq_0094_D37R0102_07C6:
	scrcmd_115
	play_se SEQ_SE_DP_REGI
	buffer_item_name 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, 32780
	npc_msg 3
	npc_msg 4
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8004, 92
	gotoif ne, scr_seq_0094_D37R0102_0803
	setvar VAR_TEMP_x4003, 1
	goto scr_seq_0094_D37R0102_0861

scr_seq_0094_D37R0102_0803:
	comparevartovalue VAR_SPECIAL_x8004, 88
	gotoif ne, scr_seq_0094_D37R0102_081C
	setvar VAR_TEMP_x4004, 1
	goto scr_seq_0094_D37R0102_0861

scr_seq_0094_D37R0102_081C:
	comparevartovalue VAR_SPECIAL_x8004, 89
	gotoif ne, scr_seq_0094_D37R0102_0835
	setvar VAR_TEMP_x4005, 1
	goto scr_seq_0094_D37R0102_0861

scr_seq_0094_D37R0102_0835:
	comparevartovalue VAR_SPECIAL_x8004, 90
	gotoif ne, scr_seq_0094_D37R0102_084E
	setvar VAR_TEMP_x4006, 1
	goto scr_seq_0094_D37R0102_0861

scr_seq_0094_D37R0102_084E:
	comparevartovalue VAR_SPECIAL_x8004, 91
	gotoif ne, scr_seq_0094_D37R0102_0861
	setvar VAR_TEMP_x4007, 1
scr_seq_0094_D37R0102_0861:
	setflag FLAG_UNK_AB7
	goto scr_seq_0094_D37R0102_0522

scr_seq_0094_D37R0102_086B:
	npc_msg 5
	goto scr_seq_0094_D37R0102_0522

scr_seq_0094_D37R0102_0874:
	npc_msg 6
	goto scr_seq_0094_D37R0102_0522

scr_seq_0094_D37R0102_087D:
	npc_msg 7
	goto scr_seq_0094_D37R0102_0522

scr_seq_0094_D37R0102_0886:
	touchscreen_menu_show
	scrcmd_114
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0094_D37R0102_0895:
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0094_D37R0102_08A0:
	scrcmd_609
	lockall
	apply_movement 8, scr_seq_0094_D37R0102_0AC4
	wait_movement
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 7
	gotoif ne, scr_seq_0094_D37R0102_08CF
	apply_movement 8, scr_seq_0094_D37R0102_0ACC
	goto scr_seq_0094_D37R0102_096B

scr_seq_0094_D37R0102_08CF:
	comparevartovalue VAR_TEMP_x4001, 8
	gotoif ne, scr_seq_0094_D37R0102_08EA
	apply_movement 8, scr_seq_0094_D37R0102_0AD4
	goto scr_seq_0094_D37R0102_096B

scr_seq_0094_D37R0102_08EA:
	comparevartovalue VAR_TEMP_x4001, 9
	gotoif ne, scr_seq_0094_D37R0102_0905
	apply_movement 8, scr_seq_0094_D37R0102_0ADC
	goto scr_seq_0094_D37R0102_096B

scr_seq_0094_D37R0102_0905:
	comparevartovalue VAR_TEMP_x4001, 10
	gotoif ne, scr_seq_0094_D37R0102_0920
	apply_movement 8, scr_seq_0094_D37R0102_0AE4
	goto scr_seq_0094_D37R0102_096B

scr_seq_0094_D37R0102_0920:
	comparevartovalue VAR_TEMP_x4001, 11
	gotoif ne, scr_seq_0094_D37R0102_093B
	apply_movement 8, scr_seq_0094_D37R0102_0AEC
	goto scr_seq_0094_D37R0102_096B

scr_seq_0094_D37R0102_093B:
	comparevartovalue VAR_TEMP_x4001, 12
	gotoif ne, scr_seq_0094_D37R0102_0956
	apply_movement 8, scr_seq_0094_D37R0102_0AF4
	goto scr_seq_0094_D37R0102_096B

scr_seq_0094_D37R0102_0956:
	comparevartovalue VAR_TEMP_x4001, 13
	gotoif ne, scr_seq_0094_D37R0102_096B
	apply_movement 8, scr_seq_0094_D37R0102_0AFC
scr_seq_0094_D37R0102_096B:
	wait_movement
	npc_msg 36
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_TEMP_x4001, 7
	gotoif ne, scr_seq_0094_D37R0102_09A5
	apply_movement 8, scr_seq_0094_D37R0102_0B04
	apply_movement 255, scr_seq_0094_D37R0102_0B70
	goto scr_seq_0094_D37R0102_0A71

scr_seq_0094_D37R0102_09A5:
	comparevartovalue VAR_TEMP_x4001, 8
	gotoif ne, scr_seq_0094_D37R0102_09C8
	apply_movement 8, scr_seq_0094_D37R0102_0B10
	apply_movement 255, scr_seq_0094_D37R0102_0B7C
	goto scr_seq_0094_D37R0102_0A71

scr_seq_0094_D37R0102_09C8:
	comparevartovalue VAR_TEMP_x4001, 9
	gotoif ne, scr_seq_0094_D37R0102_09EB
	apply_movement 8, scr_seq_0094_D37R0102_0B20
	apply_movement 255, scr_seq_0094_D37R0102_0B88
	goto scr_seq_0094_D37R0102_0A71

scr_seq_0094_D37R0102_09EB:
	comparevartovalue VAR_TEMP_x4001, 10
	gotoif ne, scr_seq_0094_D37R0102_0A0E
	apply_movement 8, scr_seq_0094_D37R0102_0B30
	apply_movement 255, scr_seq_0094_D37R0102_0B94
	goto scr_seq_0094_D37R0102_0A71

scr_seq_0094_D37R0102_0A0E:
	comparevartovalue VAR_TEMP_x4001, 11
	gotoif ne, scr_seq_0094_D37R0102_0A31
	apply_movement 8, scr_seq_0094_D37R0102_0B40
	apply_movement 255, scr_seq_0094_D37R0102_0BA0
	goto scr_seq_0094_D37R0102_0A71

scr_seq_0094_D37R0102_0A31:
	comparevartovalue VAR_TEMP_x4001, 12
	gotoif ne, scr_seq_0094_D37R0102_0A54
	apply_movement 8, scr_seq_0094_D37R0102_0B50
	apply_movement 255, scr_seq_0094_D37R0102_0BAC
	goto scr_seq_0094_D37R0102_0A71

scr_seq_0094_D37R0102_0A54:
	comparevartovalue VAR_TEMP_x4001, 13
	gotoif ne, scr_seq_0094_D37R0102_0A71
	apply_movement 8, scr_seq_0094_D37R0102_0B60
	apply_movement 255, scr_seq_0094_D37R0102_0BB8
scr_seq_0094_D37R0102_0A71:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_188 1024
	scrcmd_189
	scrcmd_620 1
	play_se SEQ_SE_DP_CARD2
	wait 24, VAR_SPECIAL_x800C
	play_se SEQ_SE_DP_CARD2
	wait_se SEQ_SE_DP_CARD2
	fade_screen 6, 1, 1, 0
	wait_fade
	setvar VAR_UNK_4077, 3
	npc_msg 37
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0094_D37R0102_0AC1:
	.byte 0x00, 0x00, 0x00

scr_seq_0094_D37R0102_0AC4:
	.short 75, 1
	.short 254, 0

scr_seq_0094_D37R0102_0ACC:
	.short 61, 1
	.short 254, 0

scr_seq_0094_D37R0102_0AD4:
	.short 13, 1
	.short 254, 0

scr_seq_0094_D37R0102_0ADC:
	.short 13, 2
	.short 254, 0

scr_seq_0094_D37R0102_0AE4:
	.short 13, 3
	.short 254, 0

scr_seq_0094_D37R0102_0AEC:
	.short 13, 4
	.short 254, 0

scr_seq_0094_D37R0102_0AF4:
	.short 13, 5
	.short 254, 0

scr_seq_0094_D37R0102_0AFC:
	.short 13, 6
	.short 254, 0

scr_seq_0094_D37R0102_0B04:
	.short 15, 1
	.short 34, 1
	.short 254, 0

scr_seq_0094_D37R0102_0B10:
	.short 12, 1
	.short 15, 1
	.short 34, 1
	.short 254, 0

scr_seq_0094_D37R0102_0B20:
	.short 12, 2
	.short 15, 1
	.short 34, 1
	.short 254, 0

scr_seq_0094_D37R0102_0B30:
	.short 12, 3
	.short 15, 1
	.short 34, 1
	.short 254, 0

scr_seq_0094_D37R0102_0B40:
	.short 12, 4
	.short 15, 1
	.short 34, 1
	.short 254, 0

scr_seq_0094_D37R0102_0B50:
	.short 12, 5
	.short 15, 1
	.short 34, 1
	.short 254, 0

scr_seq_0094_D37R0102_0B60:
	.short 12, 6
	.short 15, 1
	.short 34, 1
	.short 254, 0

scr_seq_0094_D37R0102_0B70:
	.short 12, 1
	.short 35, 1
	.short 254, 0

scr_seq_0094_D37R0102_0B7C:
	.short 12, 2
	.short 35, 1
	.short 254, 0

scr_seq_0094_D37R0102_0B88:
	.short 12, 3
	.short 35, 1
	.short 254, 0

scr_seq_0094_D37R0102_0B94:
	.short 12, 4
	.short 35, 1
	.short 254, 0

scr_seq_0094_D37R0102_0BA0:
	.short 12, 5
	.short 35, 1
	.short 254, 0

scr_seq_0094_D37R0102_0BAC:
	.short 12, 6
	.short 35, 1
	.short 254, 0

scr_seq_0094_D37R0102_0BB8:
	.short 12, 7
	.short 35, 1
	.short 254, 0
scr_seq_0094_D37R0102_0BC4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 37
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0094_D37R0102_0BD7:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_SPECIAL_x8007, 0
	checkflag FLAG_UNK_08C
	callif FALSE, scr_seq_0094_D37R0102_0C0E
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif eq, scr_seq_0094_D37R0102_0C16
	comparevartovalue VAR_TEMP_x400A, 1
	gotoif ge, scr_seq_0094_D37R0102_0C1F
	releaseall
	end

scr_seq_0094_D37R0102_0C0E:
	setvar VAR_SPECIAL_x8007, 1
	return

scr_seq_0094_D37R0102_0C16:
	npc_msg 39
	goto scr_seq_0094_D37R0102_0C58

scr_seq_0094_D37R0102_0C1F:
	npc_msg 49
	goto scr_seq_0094_D37R0102_0C58

scr_seq_0094_D37R0102_0C28:
	npc_msg 41
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_0C4F
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0094_D37R0102_0CA0
	end

scr_seq_0094_D37R0102_0C4F:
	npc_msg 44
	goto scr_seq_0094_D37R0102_0C7C

scr_seq_0094_D37R0102_0C58:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_0C28
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0094_D37R0102_0DDA
	end

scr_seq_0094_D37R0102_0C7C:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_0CA0
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0094_D37R0102_0DDA
	end

scr_seq_0094_D37R0102_0CA0:
	get_party_count VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0094_D37R0102_0CC0
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0094_D37R0102_0CCC
	end

scr_seq_0094_D37R0102_0CC0:
	setvar VAR_TEMP_x4002, 0
	goto scr_seq_0094_D37R0102_0D17

scr_seq_0094_D37R0102_0CCC:
	npc_msg 42
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_349
	scrcmd_351 16386
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_TEMP_x4002, 255
	gotoif eq, scr_seq_0094_D37R0102_0DDA
	get_partymon_species VAR_TEMP_x4002, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_0DE5
	goto scr_seq_0094_D37R0102_0D17

scr_seq_0094_D37R0102_0D17:
	npc_msg 43
	closemsg
	scrcmd_386 VAR_SPECIAL_x8006
	comparevartovalue VAR_SPECIAL_x8006, 0
	gotoif eq, scr_seq_0094_D37R0102_0D49
	comparevartovalue VAR_SPECIAL_x8006, 2
	gotoif eq, scr_seq_0094_D37R0102_0D4F
	comparevartovalue VAR_SPECIAL_x8006, 3
	gotoif eq, scr_seq_0094_D37R0102_0D55
	end

scr_seq_0094_D37R0102_0D49:
	goto scr_seq_0094_D37R0102_0D5B

scr_seq_0094_D37R0102_0D4F:
	goto scr_seq_0094_D37R0102_0D5B

scr_seq_0094_D37R0102_0D55:
	goto scr_seq_0094_D37R0102_0D5B

scr_seq_0094_D37R0102_0D5B:
	setflag FLAG_UNK_08C
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_154 16386, 32773, 32775
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x8006, 0
	gotoif eq, scr_seq_0094_D37R0102_0DAA
	comparevartovalue VAR_SPECIAL_x8006, 2
	gotoif eq, scr_seq_0094_D37R0102_0DB0
	comparevartovalue VAR_SPECIAL_x8006, 3
	gotoif eq, scr_seq_0094_D37R0102_0DB6
	end

scr_seq_0094_D37R0102_0DAA:
	goto scr_seq_0094_D37R0102_0DBC

scr_seq_0094_D37R0102_0DB0:
	goto scr_seq_0094_D37R0102_0DBC

scr_seq_0094_D37R0102_0DB6:
	goto scr_seq_0094_D37R0102_0DBC

scr_seq_0094_D37R0102_0DBC:
	comparevartovalue VAR_SPECIAL_x8005, 0
	gotoif eq, scr_seq_0094_D37R0102_0E40
	setvar VAR_TEMP_x400A, 1
	npc_msg 45
	closemsg
	goto scr_seq_0094_D37R0102_0DEE

scr_seq_0094_D37R0102_0DDA:
	npc_msg 40
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0094_D37R0102_0DE5:
	npc_msg 51
	goto scr_seq_0094_D37R0102_0CCC

scr_seq_0094_D37R0102_0DEE:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_492 0, VAR_SPECIAL_x800C, VAR_SPECIAL_x8004
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_0E35
	scrcmd_256 32772
	scrcmd_494 0, VAR_SPECIAL_x8004
	npc_msg 46
	npc_msg 52
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0094_D37R0102_0E35:
	npc_msg 47
	closemsg
	goto scr_seq_0094_D37R0102_0DEE

scr_seq_0094_D37R0102_0E40:
	npc_msg 48
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0094_D37R0102_0E4B:
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
scr_seq_0094_D37R0102_0EDA:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 29
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_0F05
	npc_msg 34
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0094_D37R0102_0F05:
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0094_D37R0102_0FDA
	npc_msg 30
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_188 1024
	scrcmd_189
	scrcmd_620 1
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0094_D37R0102_0FE8
	apply_movement 10, scr_seq_0094_D37R0102_1000
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0094_D37R0102_0F79
	scrcmd_099 253
	apply_movement 253, scr_seq_0094_D37R0102_0FF8
	scrcmd_098 253
	wait_movement
scr_seq_0094_D37R0102_0F79:
	fade_screen 6, 1, 1, 0
	wait_fade
	npc_msg 31
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 10
	lockall
	scrcmd_188 1
	scrcmd_189
	scrcmd_620 0
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0094_D37R0102_1010
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	fade_screen 6, 1, 1, 0
	wait_fade
	npc_msg 32
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0094_D37R0102_0FDA:
	npc_msg 35
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0094_D37R0102_0FE5:
	.byte 0x00, 0x00, 0x00

scr_seq_0094_D37R0102_0FE8:
	.short 20, 3
	.short 22, 2
	.short 1, 1
	.short 254, 0

scr_seq_0094_D37R0102_0FF8:
	.short 1, 1
	.short 254, 0

scr_seq_0094_D37R0102_1000:
	.short 21, 2
	.short 22, 4
	.short 0, 1
	.short 254, 0

scr_seq_0094_D37R0102_1010:
	.short 21, 3
	.short 23, 2
	.short 254, 0
	.byte 0x14, 0x00, 0x02, 0x00
	.byte 0x17, 0x00, 0x04, 0x00, 0x02, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_0094_D37R0102_102C:
	scrcmd_609
	lockall
	callstd std_play_kimono_girl_music
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 31
	gotoif ne, scr_seq_0094_D37R0102_1055
	apply_movement 12, scr_seq_0094_D37R0102_10B4
	goto scr_seq_0094_D37R0102_105D

scr_seq_0094_D37R0102_1055:
	apply_movement 12, scr_seq_0094_D37R0102_10C8
scr_seq_0094_D37R0102_105D:
	wait_movement
	npc_msg 55
	closemsg
	apply_movement 12, scr_seq_0094_D37R0102_10E4
	wait_movement
	npc_msg 56
	closemsg
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 31
	gotoif ne, scr_seq_0094_D37R0102_1094
	apply_movement 12, scr_seq_0094_D37R0102_10F0
	goto scr_seq_0094_D37R0102_109C

scr_seq_0094_D37R0102_1094:
	apply_movement 12, scr_seq_0094_D37R0102_1120
scr_seq_0094_D37R0102_109C:
	wait_movement
	hide_person 12
	setflag FLAG_UNK_237
	callstd std_fade_end_kimono_girl_music
	releaseall
	setvar VAR_UNK_40E7, 3
	end


scr_seq_0094_D37R0102_10B4:
	.short 75, 1
	.short 34, 1
	.short 63, 1
	.short 14, 2
	.short 254, 0

scr_seq_0094_D37R0102_10C8:
	.short 75, 1
	.short 34, 1
	.short 63, 1
	.short 14, 1
	.short 13, 1
	.short 14, 1
	.short 254, 0

scr_seq_0094_D37R0102_10E4:
	.short 75, 1
	.short 65, 1
	.short 254, 0

scr_seq_0094_D37R0102_10F0:
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

scr_seq_0094_D37R0102_1120:
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
scr_seq_0094_D37R0102_1150:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 27
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0094_D37R0102_1163:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	getitemquantity 476, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0094_D37R0102_1189
	npc_msg 27
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0094_D37R0102_1189:
	buffer_players_name 0
	npc_msg 28
	closemsg
	apply_movement 11, scr_seq_0094_D37R0102_11A4
	wait_movement
	releaseall
	setflag FLAG_UNK_1C0
	end

scr_seq_0094_D37R0102_11A3:
	.byte 0x00

scr_seq_0094_D37R0102_11A4:
	.short 15, 2
	.short 254, 0
scr_seq_0094_D37R0102_11AC:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_144B
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_155 0, 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0094_D37R0102_11E9:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 1, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_144B
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_155 1, 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0094_D37R0102_1226:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 2, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_144B
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_155 2, 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0094_D37R0102_1263:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 3, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_144B
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_155 3, 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0094_D37R0102_12A0:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 4, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_144B
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_155 4, 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0094_D37R0102_12DD:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 5, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_144B
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_155 5, 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0094_D37R0102_131A:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 6, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_144B
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_155 6, 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0094_D37R0102_1357:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 7, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_144B
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_155 7, 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0094_D37R0102_1394:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 8, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_144B
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_155 8, 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0094_D37R0102_13D1:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 9, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_144B
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_155 9, 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0094_D37R0102_140E:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 10, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_144B
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_155 10, 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0094_D37R0102_144B:
	npc_msg 53
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0094_D37R0102_1456:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_830 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0094_D37R0102_1480
	scrcmd_832 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0094_D37R0102_1521
scr_seq_0094_D37R0102_1480:
	npc_msg 57
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0094_D37R0102_1530
	hasenoughmoneyimmediate 32780, 100
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_153F
	submoneyimmediate 100
	scrcmd_553 5, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0094_D37R0102_154E
	scrcmd_831 32772
	scrcmd_404 32772, 1, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0094_D37R0102_155B
	npc_msg 61
	setvar VAR_SPECIAL_x8005, 1
	callstd 2007
scr_seq_0094_D37R0102_14EB:
	scrcmd_832 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0094_D37R0102_1530
	scrcmd_553 95, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0094_D37R0102_1530
	scrcmd_833 32772
	npc_msg 62
	callstd 2026
	goto scr_seq_0094_D37R0102_1530

scr_seq_0094_D37R0102_151F:
	.byte 0x02
	.byte 0x00
scr_seq_0094_D37R0102_1521:
	npc_msg 58
	waitbutton
	closemsg
	goto scr_seq_0094_D37R0102_1568

scr_seq_0094_D37R0102_152E:
	.byte 0x02, 0x00
scr_seq_0094_D37R0102_1530:
	npc_msg 59
	waitbutton
	closemsg
	goto scr_seq_0094_D37R0102_1568

scr_seq_0094_D37R0102_153D:
	.byte 0x02, 0x00
scr_seq_0094_D37R0102_153F:
	npc_msg 60
	waitbutton
	closemsg
	goto scr_seq_0094_D37R0102_1568

scr_seq_0094_D37R0102_154C:
	.byte 0x02, 0x00
scr_seq_0094_D37R0102_154E:
	npc_msg 64
	closemsg
	goto scr_seq_0094_D37R0102_1530

scr_seq_0094_D37R0102_1559:
	.byte 0x02, 0x00
scr_seq_0094_D37R0102_155B:
	npc_msg 64
	closemsg
	goto scr_seq_0094_D37R0102_14EB

scr_seq_0094_D37R0102_1566:
	.byte 0x02, 0x00
scr_seq_0094_D37R0102_1568:
	releaseall
	end
	.balign 4, 0
