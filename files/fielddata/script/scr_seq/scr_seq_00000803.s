#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000803_000003FD ; 000
	scrdef scr_seq_00000803_000005C8 ; 001
	scrdef scr_seq_00000803_000005DB ; 002
	scrdef scr_seq_00000803_000005EE ; 003
	scrdef scr_seq_00000803_00000601 ; 004
	scrdef scr_seq_00000803_00000543 ; 005
	scrdef scr_seq_00000803_00000614 ; 006
	scrdef scr_seq_00000803_00000627 ; 007
	scrdef scr_seq_00000803_0000063A ; 008
	scrdef scr_seq_00000803_0000064B ; 009
	scrdef scr_seq_00000803_000000BE ; 010
	scrdef scr_seq_00000803_000000F9 ; 011
	scrdef scr_seq_00000803_00000134 ; 012
	scrdef scr_seq_00000803_0000016F ; 013
	scrdef scr_seq_00000803_000001AA ; 014
	scrdef scr_seq_00000803_000001E5 ; 015
	scrdef scr_seq_00000803_00000220 ; 016
	scrdef scr_seq_00000803_0000025B ; 017
	scrdef scr_seq_00000803_00000296 ; 018
	scrdef scr_seq_00000803_000002D1 ; 019
	scrdef scr_seq_00000803_0000030C ; 020
	scrdef scr_seq_00000803_00000347 ; 021
	scrdef scr_seq_00000803_00000382 ; 022
	scrdef scr_seq_00000803_000003C2 ; 023
	scrdef_end

scr_seq_00000803_00000062:
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000803_0000009C
	scrcmd_784 3, 0
	scrcmd_532 32780, 3
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000803_000000AB
	scrcmd_784 3, 1
	setvar VAR_TEMP_x4001, 0
	return

scr_seq_00000803_0000009C:
	msgbox 21
	waitbutton
	closemsg
	setvar VAR_TEMP_x4001, 1
	return

scr_seq_00000803_000000AB:
	msgbox 22
	waitbutton
	closemsg
	scrcmd_784 3, 1
	setvar VAR_TEMP_x4001, 1
	return

scr_seq_00000803_000000BE:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000803_00000062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000803_000000F5
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 0, 1
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000803_000000F5:
	releaseall
	end

scr_seq_00000803_000000F9:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000803_00000062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000803_00000130
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 1, 1
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000803_00000130:
	releaseall
	end

scr_seq_00000803_00000134:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000803_00000062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000803_0000016B
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 2, 1
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000803_0000016B:
	releaseall
	end

scr_seq_00000803_0000016F:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000803_00000062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000803_000001A6
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 3, 1
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000803_000001A6:
	releaseall
	end

scr_seq_00000803_000001AA:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000803_00000062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000803_000001E1
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 4, 1
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000803_000001E1:
	releaseall
	end

scr_seq_00000803_000001E5:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000803_00000062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000803_0000021C
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 5, 1
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000803_0000021C:
	releaseall
	end

scr_seq_00000803_00000220:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000803_00000062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000803_00000257
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 6, 1
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000803_00000257:
	releaseall
	end

scr_seq_00000803_0000025B:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000803_00000062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000803_00000292
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 7, 1
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000803_00000292:
	releaseall
	end

scr_seq_00000803_00000296:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000803_00000062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000803_000002CD
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 8, 1
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000803_000002CD:
	releaseall
	end

scr_seq_00000803_000002D1:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000803_00000062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000803_00000308
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 9, 1
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000803_00000308:
	releaseall
	end

scr_seq_00000803_0000030C:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000803_00000062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000803_00000343
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 10, 1
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000803_00000343:
	releaseall
	end

scr_seq_00000803_00000347:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000803_00000062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000803_0000037E
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 11, 1
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000803_0000037E:
	releaseall
	end

scr_seq_00000803_00000382:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000803_00000062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000803_000003BE
	msgbox 20
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 12, 1
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000803_000003BE:
	releaseall
	end

scr_seq_00000803_000003C2:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000803_00000062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000803_000003F9
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 13, 1
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000803_000003F9:
	releaseall
	end

scr_seq_00000803_000003FD:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000803_00000428
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000803_00000428:
	scrcmd_784 3, 0
	msgbox 2
	scrcmd_746
	scrcmd_116 0, 20, 2
	scrcmd_113 20, 7
scr_seq_00000803_0000043E:
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 127, 255, 0
	scrcmd_751 128, 255, 1
	scrcmd_751 129, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000803_0000048B
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000803_000004D7
	msgbox 6
	goto scr_seq_00000803_00000531

scr_seq_00000803_00000489:
	.byte 0x02, 0x00
scr_seq_00000803_0000048B:
	hasenoughmoneyimmediate 32780, 1000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000803_0000052E
	checkgivecoins VAR_SPECIAL_x800C, 50
	snop
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000803_00000523
	submoneyimmediate 1000
	scrcmd_120 50
	scrcmd_118 0
	scrcmd_115
	play_se SEQ_SE_DP_REGI
	wait_se SEQ_SE_DP_REGI
	msgbox 3
	goto scr_seq_00000803_0000043E

scr_seq_00000803_000004D5:
	.byte 0x02, 0x00
scr_seq_00000803_000004D7:
	hasenoughmoneyimmediate 32780, 10000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000803_0000052E
	checkgivecoins VAR_SPECIAL_x800C, 500
	snop
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000803_00000523
	submoneyimmediate 10000
	scrcmd_120 500
	scrcmd_118 0
	scrcmd_115
	play_se SEQ_SE_DP_REGI
	wait_se SEQ_SE_DP_REGI
	msgbox 3
	goto scr_seq_00000803_0000043E

scr_seq_00000803_00000521:
	.byte 0x02, 0x00
scr_seq_00000803_00000523:
	msgbox 5
	goto scr_seq_00000803_00000531

scr_seq_00000803_0000052C:
	.byte 0x02, 0x00
scr_seq_00000803_0000052E:
	msgbox 4
scr_seq_00000803_00000531:
	waitbutton
	closemsg
	scrcmd_747
	scrcmd_117
	scrcmd_114
	scrcmd_784 3, 1
	releaseall
	end

scr_seq_00000803_00000543:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_784 3, 0
	checkflag FLAG_UNK_17C
	gotoif eq, scr_seq_00000803_0000059B
	msgbox 11
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000803_000005AA
	checkgivecoins VAR_SPECIAL_x800C, 18
	snop
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000803_000005B9
	scrcmd_120 18
	scrcmd_190 0
	msgbox 12
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setflag FLAG_UNK_17C
scr_seq_00000803_0000059B:
	msgbox 13
	waitbutton
	closemsg
	releaseall
	scrcmd_784 3, 1
	end

scr_seq_00000803_000005AA:
	msgbox 14
	waitbutton
	closemsg
	releaseall
	scrcmd_784 3, 1
	end

scr_seq_00000803_000005B9:
	msgbox 15
	waitbutton
	closemsg
	releaseall
	scrcmd_784 3, 1
	end

scr_seq_00000803_000005C8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000803_000005DB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000803_000005EE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000803_00000601:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000803_00000614:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000803_00000627:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000803_0000063A:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000803_0000064B:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 19
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
