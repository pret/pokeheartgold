#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000904_0000057A ; 000
	scrdef scr_seq_00000904_000005A3 ; 001
	scrdef scr_seq_00000904_000006F1 ; 002
	scrdef scr_seq_00000904_00000702 ; 003
	scrdef scr_seq_00000904_00000123 ; 004
	scrdef scr_seq_00000904_000004DF ; 005
	scrdef scr_seq_00000904_00000022 ; 006
	scrdef scr_seq_00000904_000005CC ; 007
	scrdef_end

scr_seq_00000904_00000022:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000904_00000033
	clearflag FLAG_UNK_189
	end

scr_seq_00000904_00000033:
	checkflag FLAG_UNK_964
	gotoif lt, scr_seq_00000904_0000011D
	scrcmd_142 17, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000904_0000011D
	scrcmd_147 17, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000904_000000CC
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 12
	gotoif ne, scr_seq_00000904_0000007F
	clearflag FLAG_UNK_26F
	goto scr_seq_00000904_000000CA

scr_seq_00000904_0000007F:
	comparevartovalue VAR_TEMP_x4000, 13
	gotoif ne, scr_seq_00000904_00000096
	clearflag FLAG_UNK_26F
	goto scr_seq_00000904_000000CA

scr_seq_00000904_00000096:
	comparevartovalue VAR_TEMP_x4000, 14
	gotoif ne, scr_seq_00000904_000000AD
	clearflag FLAG_UNK_26F
	goto scr_seq_00000904_000000CA

scr_seq_00000904_000000AD:
	comparevartovalue VAR_TEMP_x4000, 15
	gotoif ne, scr_seq_00000904_000000C4
	clearflag FLAG_UNK_26F
	goto scr_seq_00000904_000000CA

scr_seq_00000904_000000C4:
	goto scr_seq_00000904_0000011D

scr_seq_00000904_000000CA:
	end

scr_seq_00000904_000000CC:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 18
	gotoif ne, scr_seq_00000904_000000E7
	clearflag FLAG_UNK_26F
	goto scr_seq_00000904_0000011B

scr_seq_00000904_000000E7:
	comparevartovalue VAR_TEMP_x4000, 19
	gotoif ne, scr_seq_00000904_000000FE
	clearflag FLAG_UNK_26F
	goto scr_seq_00000904_0000011B

scr_seq_00000904_000000FE:
	comparevartovalue VAR_TEMP_x4000, 20
	gotoif ne, scr_seq_00000904_00000115
	clearflag FLAG_UNK_26F
	goto scr_seq_00000904_0000011B

scr_seq_00000904_00000115:
	goto scr_seq_00000904_0000011D

scr_seq_00000904_0000011B:
	end

scr_seq_00000904_0000011D:
	setflag FLAG_UNK_26F
	end

scr_seq_00000904_00000123:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_113 20, 2
	msgbox 10
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000904_00000156
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000904_000004A3
scr_seq_00000904_00000156:
	hasenoughmoneyimmediate 32780, 300
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000904_000004D2
	submoneyimmediate 300
	scrcmd_115
	play_se SEQ_SE_DP_REGI
	wait_se SEQ_SE_DP_REGI
	msgbox 11
	scrcmd_380 32780, 100
	comparevartovalue VAR_SPECIAL_x800C, 40
	gotoif ge, scr_seq_00000904_000001AD
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif ge, scr_seq_00000904_000002B5
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ge, scr_seq_00000904_000003AC
	end

scr_seq_00000904_000001AD:
	play_se SEQ_SE_GS_KUJI_ATARI
	scrcmd_198 0, 3
	msgbox 12
	scrcmd_380 32780, 70
	comparevartovalue VAR_SPECIAL_x800C, 60
	gotoif ge, scr_seq_00000904_0000021C
	comparevartovalue VAR_SPECIAL_x800C, 50
	gotoif ge, scr_seq_00000904_0000022E
	comparevartovalue VAR_SPECIAL_x800C, 40
	gotoif ge, scr_seq_00000904_00000240
	comparevartovalue VAR_SPECIAL_x800C, 30
	gotoif ge, scr_seq_00000904_00000252
	comparevartovalue VAR_SPECIAL_x800C, 20
	gotoif ge, scr_seq_00000904_00000264
	comparevartovalue VAR_SPECIAL_x800C, 10
	gotoif ge, scr_seq_00000904_00000276
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ge, scr_seq_00000904_00000288
	end

scr_seq_00000904_0000021C:
	setvar VAR_SPECIAL_x8004, 155
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000904_00000294

scr_seq_00000904_0000022E:
	setvar VAR_SPECIAL_x8004, 150
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000904_00000294

scr_seq_00000904_00000240:
	setvar VAR_SPECIAL_x8004, 151
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000904_00000294

scr_seq_00000904_00000252:
	setvar VAR_SPECIAL_x8004, 152
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000904_00000294

scr_seq_00000904_00000264:
	setvar VAR_SPECIAL_x8004, 153
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000904_00000294

scr_seq_00000904_00000276:
	setvar VAR_SPECIAL_x8004, 156
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000904_00000294

scr_seq_00000904_00000288:
	setvar VAR_SPECIAL_x8004, 149
	setvar VAR_SPECIAL_x8005, 1
scr_seq_00000904_00000294:
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000904_000004B0
	callstd 2008
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_00000904_000002B5:
	play_se SEQ_SE_GS_KUJI_ATARI
	scrcmd_198 0, 2
	msgbox 12
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000904_000002E4
	setvar VAR_SPECIAL_x8004, 11
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000904_0000038B

scr_seq_00000904_000002E4:
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_00000904_00000303
	setvar VAR_SPECIAL_x8004, 8
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000904_0000038B

scr_seq_00000904_00000303:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000904_00000322
	setvar VAR_SPECIAL_x8004, 9
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000904_0000038B

scr_seq_00000904_00000322:
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_00000904_00000341
	setvar VAR_SPECIAL_x8004, 6
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000904_0000038B

scr_seq_00000904_00000341:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_00000904_00000360
	setvar VAR_SPECIAL_x8004, 15
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000904_0000038B

scr_seq_00000904_00000360:
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_00000904_0000037F
	setvar VAR_SPECIAL_x8004, 13
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000904_0000038B

scr_seq_00000904_0000037F:
	setvar VAR_SPECIAL_x8004, 10
	setvar VAR_SPECIAL_x8005, 1
scr_seq_00000904_0000038B:
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000904_000004B0
	callstd 2008
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_00000904_000003AC:
	play_se SEQ_SE_GS_KUJI_OOATARI
	scrcmd_198 0, 1
	msgbox 12
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000904_000003DB
	setvar VAR_SPECIAL_x8004, 329
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000904_00000482

scr_seq_00000904_000003DB:
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_00000904_000003FA
	setvar VAR_SPECIAL_x8004, 392
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000904_00000482

scr_seq_00000904_000003FA:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000904_00000419
	setvar VAR_SPECIAL_x8004, 418
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000904_00000482

scr_seq_00000904_00000419:
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_00000904_00000438
	setvar VAR_SPECIAL_x8004, 384
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000904_00000482

scr_seq_00000904_00000438:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_00000904_00000457
	setvar VAR_SPECIAL_x8004, 387
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000904_00000482

scr_seq_00000904_00000457:
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_00000904_00000476
	setvar VAR_SPECIAL_x8004, 369
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000904_00000482

scr_seq_00000904_00000476:
	setvar VAR_SPECIAL_x8004, 389
	setvar VAR_SPECIAL_x8005, 1
scr_seq_00000904_00000482:
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000904_000004B0
	callstd 2008
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_00000904_000004A3:
	msgbox 14
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_00000904_000004B0:
	msgbox 15
	closemsg
	addmoney 300
	scrcmd_115
	play_se SEQ_SE_DP_REGI
	wait_se SEQ_SE_DP_REGI
	msgbox 17
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_00000904_000004D2:
	msgbox 16
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_00000904_000004DF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000904_00000501
	msgbox 18
	goto scr_seq_00000904_00000572

scr_seq_00000904_00000501:
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_00000904_00000517
	msgbox 19
	goto scr_seq_00000904_00000572

scr_seq_00000904_00000517:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000904_0000052D
	msgbox 20
	goto scr_seq_00000904_00000572

scr_seq_00000904_0000052D:
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_00000904_00000543
	msgbox 21
	goto scr_seq_00000904_00000572

scr_seq_00000904_00000543:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_00000904_00000559
	msgbox 22
	goto scr_seq_00000904_00000572

scr_seq_00000904_00000559:
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_00000904_0000056F
	msgbox 23
	goto scr_seq_00000904_00000572

scr_seq_00000904_0000056F:
	msgbox 24
scr_seq_00000904_00000572:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000904_0000057A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000904_00000598
	msgbox 3
	goto scr_seq_00000904_0000059B

scr_seq_00000904_00000598:
	msgbox 2
scr_seq_00000904_0000059B:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000904_000005A3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000904_000005C1
	msgbox 1
	goto scr_seq_00000904_000005C4

scr_seq_00000904_000005C1:
	msgbox 0
scr_seq_00000904_000005C4:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000904_000005CC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_147 17, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000904_0000067A
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ge, scr_seq_00000904_0000066F
	msgbox 25
scr_seq_00000904_000005F7:
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000904_0000061B
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_00000904_0000065E
	end

scr_seq_00000904_0000061B:
	scrcmd_190 0
	msgbox 26
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	scrcmd_146 17
	msgbox 27
	waitbutton
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	setflag FLAG_UNK_26F
	hide_person 3
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000904_0000065E:
	setvar VAR_TEMP_x4002, 1
	msgbox 28
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000904_0000066F:
	msgbox 29
	goto scr_seq_00000904_000005F7

scr_seq_00000904_00000678:
	.byte 0x02, 0x00
scr_seq_00000904_0000067A:
	msgbox 30
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000904_000006DB
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000904_000006E6
	msgbox 31
	closemsg
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 15
	faceplayer
	lockall
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	clearflag FLAG_UNK_189
	msgbox 32
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000904_000006DB:
	msgbox 33
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000904_000006E6:
	msgbox 34
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000904_000006F1:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000904_00000702:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 5
	scrcmd_113 20, 2
	goto scr_seq_00000904_00000717

scr_seq_00000904_00000717:
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
	gotoif eq, scr_seq_00000904_0000077B
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000904_00000787
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000904_00000793
	msgbox 9
	goto scr_seq_00000904_000008BE

scr_seq_00000904_0000077B:
	setvar VAR_SPECIAL_x8001, 30
	goto scr_seq_00000904_000007D5

scr_seq_00000904_00000787:
	setvar VAR_SPECIAL_x8001, 31
	goto scr_seq_00000904_000007D5

scr_seq_00000904_00000793:
	setvar VAR_SPECIAL_x8001, 32
	goto scr_seq_00000904_000007D5

scr_seq_00000904_0000079F:
	hasenoughmoneyimmediate 32780, 200
	return

scr_seq_00000904_000007A9:
	hasenoughmoneyimmediate 32780, 300
	return

scr_seq_00000904_000007B3:
	hasenoughmoneyimmediate 32780, 350
	return

scr_seq_00000904_000007BD:
	submoneyimmediate 200
	return

scr_seq_00000904_000007C5:
	submoneyimmediate 300
	return

scr_seq_00000904_000007CD:
	submoneyimmediate 350
	return

scr_seq_00000904_000007D5:
	comparevartovalue VAR_SPECIAL_x8000, 0
	callif eq, scr_seq_00000904_0000079F
	comparevartovalue VAR_SPECIAL_x8000, 1
	callif eq, scr_seq_00000904_000007A9
	comparevartovalue VAR_SPECIAL_x8000, 2
	callif eq, scr_seq_00000904_000007B3
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000904_000008A9
	hasspaceforitem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000904_000008B2
	comparevartovalue VAR_SPECIAL_x8000, 0
	callif eq, scr_seq_00000904_000007BD
	comparevartovalue VAR_SPECIAL_x8000, 1
	callif eq, scr_seq_00000904_000007C5
	comparevartovalue VAR_SPECIAL_x8000, 2
	callif eq, scr_seq_00000904_000007CD
	scrcmd_115
	scrcmd_194 0, 32769
	play_se SEQ_SE_DP_JIHANKI
	scrcmd_194 0, 32769
	msgbox 6
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x8001
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	scrcmd_380 32780, 64
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000904_000008A0
	play_se SEQ_SE_DP_JIHANKI
	scrcmd_194 0, 32769
	msgbox 7
	hasspaceforitem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000904_000008B2
	callstd 2033
scr_seq_00000904_000008A0:
	msgbox 5
	goto scr_seq_00000904_00000717

scr_seq_00000904_000008A9:
	msgbox 8
	goto scr_seq_00000904_000008BE

scr_seq_00000904_000008B2:
	callstd 2009
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_00000904_000008BE:
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end
	.balign 4, 0
