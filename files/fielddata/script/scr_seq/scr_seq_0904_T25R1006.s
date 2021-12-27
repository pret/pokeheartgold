#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0904_057A ; 000
	scrdef scr_seq_0904_05A3 ; 001
	scrdef scr_seq_0904_06F1 ; 002
	scrdef scr_seq_0904_0702 ; 003
	scrdef scr_seq_0904_0123 ; 004
	scrdef scr_seq_0904_04DF ; 005
	scrdef scr_seq_0904_0022 ; 006
	scrdef scr_seq_0904_05CC ; 007
	scrdef_end

scr_seq_0904_0022:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0904_0033
	clearflag FLAG_UNK_189
	end

scr_seq_0904_0033:
	checkflag FLAG_UNK_964
	gotoif FALSE, scr_seq_0904_011D
	scrcmd_142 17, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0904_011D
	scrcmd_147 17, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0904_00CC
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 12
	gotoif ne, scr_seq_0904_007F
	clearflag FLAG_UNK_26F
	goto scr_seq_0904_00CA

scr_seq_0904_007F:
	comparevartovalue VAR_TEMP_x4000, 13
	gotoif ne, scr_seq_0904_0096
	clearflag FLAG_UNK_26F
	goto scr_seq_0904_00CA

scr_seq_0904_0096:
	comparevartovalue VAR_TEMP_x4000, 14
	gotoif ne, scr_seq_0904_00AD
	clearflag FLAG_UNK_26F
	goto scr_seq_0904_00CA

scr_seq_0904_00AD:
	comparevartovalue VAR_TEMP_x4000, 15
	gotoif ne, scr_seq_0904_00C4
	clearflag FLAG_UNK_26F
	goto scr_seq_0904_00CA

scr_seq_0904_00C4:
	goto scr_seq_0904_011D

scr_seq_0904_00CA:
	end

scr_seq_0904_00CC:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 18
	gotoif ne, scr_seq_0904_00E7
	clearflag FLAG_UNK_26F
	goto scr_seq_0904_011B

scr_seq_0904_00E7:
	comparevartovalue VAR_TEMP_x4000, 19
	gotoif ne, scr_seq_0904_00FE
	clearflag FLAG_UNK_26F
	goto scr_seq_0904_011B

scr_seq_0904_00FE:
	comparevartovalue VAR_TEMP_x4000, 20
	gotoif ne, scr_seq_0904_0115
	clearflag FLAG_UNK_26F
	goto scr_seq_0904_011B

scr_seq_0904_0115:
	goto scr_seq_0904_011D

scr_seq_0904_011B:
	end

scr_seq_0904_011D:
	setflag FLAG_UNK_26F
	end

scr_seq_0904_0123:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_113 20, 2
	npc_msg 10
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0904_0156
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0904_04A3
scr_seq_0904_0156:
	hasenoughmoneyimmediate 32780, 300
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0904_04D2
	submoneyimmediate 300
	scrcmd_115
	play_se SEQ_SE_DP_REGI
	wait_se SEQ_SE_DP_REGI
	npc_msg 11
	scrcmd_380 32780, 100
	comparevartovalue VAR_SPECIAL_x800C, 40
	gotoif ge, scr_seq_0904_01AD
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif ge, scr_seq_0904_02B5
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ge, scr_seq_0904_03AC
	end

scr_seq_0904_01AD:
	play_se SEQ_SE_GS_KUJI_ATARI
	scrcmd_198 0, 3
	npc_msg 12
	scrcmd_380 32780, 70
	comparevartovalue VAR_SPECIAL_x800C, 60
	gotoif ge, scr_seq_0904_021C
	comparevartovalue VAR_SPECIAL_x800C, 50
	gotoif ge, scr_seq_0904_022E
	comparevartovalue VAR_SPECIAL_x800C, 40
	gotoif ge, scr_seq_0904_0240
	comparevartovalue VAR_SPECIAL_x800C, 30
	gotoif ge, scr_seq_0904_0252
	comparevartovalue VAR_SPECIAL_x800C, 20
	gotoif ge, scr_seq_0904_0264
	comparevartovalue VAR_SPECIAL_x800C, 10
	gotoif ge, scr_seq_0904_0276
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ge, scr_seq_0904_0288
	end

scr_seq_0904_021C:
	setvar VAR_SPECIAL_x8004, 155
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0904_0294

scr_seq_0904_022E:
	setvar VAR_SPECIAL_x8004, 150
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0904_0294

scr_seq_0904_0240:
	setvar VAR_SPECIAL_x8004, 151
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0904_0294

scr_seq_0904_0252:
	setvar VAR_SPECIAL_x8004, 152
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0904_0294

scr_seq_0904_0264:
	setvar VAR_SPECIAL_x8004, 153
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0904_0294

scr_seq_0904_0276:
	setvar VAR_SPECIAL_x8004, 156
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0904_0294

scr_seq_0904_0288:
	setvar VAR_SPECIAL_x8004, 149
	setvar VAR_SPECIAL_x8005, 1
scr_seq_0904_0294:
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0904_04B0
	callstd 2008
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_0904_02B5:
	play_se SEQ_SE_GS_KUJI_ATARI
	scrcmd_198 0, 2
	npc_msg 12
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0904_02E4
	setvar VAR_SPECIAL_x8004, 11
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0904_038B

scr_seq_0904_02E4:
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_0904_0303
	setvar VAR_SPECIAL_x8004, 8
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0904_038B

scr_seq_0904_0303:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0904_0322
	setvar VAR_SPECIAL_x8004, 9
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0904_038B

scr_seq_0904_0322:
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_0904_0341
	setvar VAR_SPECIAL_x8004, 6
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0904_038B

scr_seq_0904_0341:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_0904_0360
	setvar VAR_SPECIAL_x8004, 15
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0904_038B

scr_seq_0904_0360:
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_0904_037F
	setvar VAR_SPECIAL_x8004, 13
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0904_038B

scr_seq_0904_037F:
	setvar VAR_SPECIAL_x8004, 10
	setvar VAR_SPECIAL_x8005, 1
scr_seq_0904_038B:
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0904_04B0
	callstd 2008
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_0904_03AC:
	play_se SEQ_SE_GS_KUJI_OOATARI
	scrcmd_198 0, 1
	npc_msg 12
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0904_03DB
	setvar VAR_SPECIAL_x8004, 329
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0904_0482

scr_seq_0904_03DB:
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_0904_03FA
	setvar VAR_SPECIAL_x8004, 392
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0904_0482

scr_seq_0904_03FA:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0904_0419
	setvar VAR_SPECIAL_x8004, 418
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0904_0482

scr_seq_0904_0419:
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_0904_0438
	setvar VAR_SPECIAL_x8004, 384
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0904_0482

scr_seq_0904_0438:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_0904_0457
	setvar VAR_SPECIAL_x8004, 387
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0904_0482

scr_seq_0904_0457:
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_0904_0476
	setvar VAR_SPECIAL_x8004, 369
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0904_0482

scr_seq_0904_0476:
	setvar VAR_SPECIAL_x8004, 389
	setvar VAR_SPECIAL_x8005, 1
scr_seq_0904_0482:
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0904_04B0
	callstd 2008
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_0904_04A3:
	npc_msg 14
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_0904_04B0:
	npc_msg 15
	closemsg
	addmoney 300
	scrcmd_115
	play_se SEQ_SE_DP_REGI
	wait_se SEQ_SE_DP_REGI
	npc_msg 17
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_0904_04D2:
	npc_msg 16
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_0904_04DF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0904_0501
	npc_msg 18
	goto scr_seq_0904_0572

scr_seq_0904_0501:
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_0904_0517
	npc_msg 19
	goto scr_seq_0904_0572

scr_seq_0904_0517:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0904_052D
	npc_msg 20
	goto scr_seq_0904_0572

scr_seq_0904_052D:
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_0904_0543
	npc_msg 21
	goto scr_seq_0904_0572

scr_seq_0904_0543:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_0904_0559
	npc_msg 22
	goto scr_seq_0904_0572

scr_seq_0904_0559:
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_0904_056F
	npc_msg 23
	goto scr_seq_0904_0572

scr_seq_0904_056F:
	npc_msg 24
scr_seq_0904_0572:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0904_057A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0904_0598
	npc_msg 3
	goto scr_seq_0904_059B

scr_seq_0904_0598:
	npc_msg 2
scr_seq_0904_059B:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0904_05A3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0904_05C1
	npc_msg 1
	goto scr_seq_0904_05C4

scr_seq_0904_05C1:
	npc_msg 0
scr_seq_0904_05C4:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0904_05CC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_147 17, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0904_067A
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ge, scr_seq_0904_066F
	npc_msg 25
scr_seq_0904_05F7:
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0904_061B
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_0904_065E
	end

scr_seq_0904_061B:
	buffer_players_name 0
	npc_msg 26
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	scrcmd_146 17
	npc_msg 27
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	setflag FLAG_UNK_26F
	hide_person 3
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0904_065E:
	setvar VAR_TEMP_x4002, 1
	npc_msg 28
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0904_066F:
	npc_msg 29
	goto scr_seq_0904_05F7

scr_seq_0904_0678:
	.byte 0x02, 0x00
scr_seq_0904_067A:
	npc_msg 30
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0904_06DB
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0904_06E6
	npc_msg 31
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 15
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg 32
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0904_06DB:
	npc_msg 33
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0904_06E6:
	npc_msg 34
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0904_06F1:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0904_0702:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 5
	scrcmd_113 20, 2
	goto scr_seq_0904_0717

scr_seq_0904_0717:
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x8000
	scrcmd_751 209, 255, 0
	scrcmd_751 210, 255, 1
	scrcmd_751 211, 255, 2
	scrcmd_751 212, 255, 3
	scrcmd_752
	scrcmd_747
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0904_077B
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0904_0787
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0904_0793
	npc_msg 9
	goto scr_seq_0904_08BE

scr_seq_0904_077B:
	setvar VAR_SPECIAL_x8001, 30
	goto scr_seq_0904_07D5

scr_seq_0904_0787:
	setvar VAR_SPECIAL_x8001, 31
	goto scr_seq_0904_07D5

scr_seq_0904_0793:
	setvar VAR_SPECIAL_x8001, 32
	goto scr_seq_0904_07D5

scr_seq_0904_079F:
	hasenoughmoneyimmediate 32780, 200
	return

scr_seq_0904_07A9:
	hasenoughmoneyimmediate 32780, 300
	return

scr_seq_0904_07B3:
	hasenoughmoneyimmediate 32780, 350
	return

scr_seq_0904_07BD:
	submoneyimmediate 200
	return

scr_seq_0904_07C5:
	submoneyimmediate 300
	return

scr_seq_0904_07CD:
	submoneyimmediate 350
	return

scr_seq_0904_07D5:
	comparevartovalue VAR_SPECIAL_x8000, 0
	callif eq, scr_seq_0904_079F
	comparevartovalue VAR_SPECIAL_x8000, 1
	callif eq, scr_seq_0904_07A9
	comparevartovalue VAR_SPECIAL_x8000, 2
	callif eq, scr_seq_0904_07B3
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0904_08A9
	hasspaceforitem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0904_08B2
	comparevartovalue VAR_SPECIAL_x8000, 0
	callif eq, scr_seq_0904_07BD
	comparevartovalue VAR_SPECIAL_x8000, 1
	callif eq, scr_seq_0904_07C5
	comparevartovalue VAR_SPECIAL_x8000, 2
	callif eq, scr_seq_0904_07CD
	scrcmd_115
	scrcmd_194 0, 32769
	play_se SEQ_SE_DP_JIHANKI
	scrcmd_194 0, 32769
	npc_msg 6
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x8001
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	scrcmd_380 32780, 64
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0904_08A0
	play_se SEQ_SE_DP_JIHANKI
	scrcmd_194 0, 32769
	npc_msg 7
	hasspaceforitem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0904_08B2
	callstd 2033
scr_seq_0904_08A0:
	npc_msg 5
	goto scr_seq_0904_0717

scr_seq_0904_08A9:
	npc_msg 8
	goto scr_seq_0904_08BE

scr_seq_0904_08B2:
	callstd 2009
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_0904_08BE:
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end
	.balign 4, 0
