#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0803_T07R0401_03FD ; 000
	scrdef scr_seq_0803_T07R0401_05C8 ; 001
	scrdef scr_seq_0803_T07R0401_05DB ; 002
	scrdef scr_seq_0803_T07R0401_05EE ; 003
	scrdef scr_seq_0803_T07R0401_0601 ; 004
	scrdef scr_seq_0803_T07R0401_0543 ; 005
	scrdef scr_seq_0803_T07R0401_0614 ; 006
	scrdef scr_seq_0803_T07R0401_0627 ; 007
	scrdef scr_seq_0803_T07R0401_063A ; 008
	scrdef scr_seq_0803_T07R0401_064B ; 009
	scrdef scr_seq_0803_T07R0401_00BE ; 010
	scrdef scr_seq_0803_T07R0401_00F9 ; 011
	scrdef scr_seq_0803_T07R0401_0134 ; 012
	scrdef scr_seq_0803_T07R0401_016F ; 013
	scrdef scr_seq_0803_T07R0401_01AA ; 014
	scrdef scr_seq_0803_T07R0401_01E5 ; 015
	scrdef scr_seq_0803_T07R0401_0220 ; 016
	scrdef scr_seq_0803_T07R0401_025B ; 017
	scrdef scr_seq_0803_T07R0401_0296 ; 018
	scrdef scr_seq_0803_T07R0401_02D1 ; 019
	scrdef scr_seq_0803_T07R0401_030C ; 020
	scrdef scr_seq_0803_T07R0401_0347 ; 021
	scrdef scr_seq_0803_T07R0401_0382 ; 022
	scrdef scr_seq_0803_T07R0401_03C2 ; 023
	scrdef_end

scr_seq_0803_T07R0401_0062:
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0803_T07R0401_009C
	scrcmd_784 3, 0
	scrcmd_532 32780, 3
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0803_T07R0401_00AB
	scrcmd_784 3, 1
	setvar VAR_TEMP_x4001, 0
	return

scr_seq_0803_T07R0401_009C:
	npc_msg 21
	waitbutton
	closemsg
	setvar VAR_TEMP_x4001, 1
	return

scr_seq_0803_T07R0401_00AB:
	npc_msg 22
	waitbutton
	closemsg
	scrcmd_784 3, 1
	setvar VAR_TEMP_x4001, 1
	return

scr_seq_0803_T07R0401_00BE:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0803_T07R0401_0062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0803_T07R0401_00F5
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 0, 1
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0803_T07R0401_00F5:
	releaseall
	end

scr_seq_0803_T07R0401_00F9:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0803_T07R0401_0062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0803_T07R0401_0130
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 1, 1
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0803_T07R0401_0130:
	releaseall
	end

scr_seq_0803_T07R0401_0134:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0803_T07R0401_0062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0803_T07R0401_016B
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 2, 1
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0803_T07R0401_016B:
	releaseall
	end

scr_seq_0803_T07R0401_016F:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0803_T07R0401_0062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0803_T07R0401_01A6
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 3, 1
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0803_T07R0401_01A6:
	releaseall
	end

scr_seq_0803_T07R0401_01AA:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0803_T07R0401_0062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0803_T07R0401_01E1
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 4, 1
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0803_T07R0401_01E1:
	releaseall
	end

scr_seq_0803_T07R0401_01E5:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0803_T07R0401_0062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0803_T07R0401_021C
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 5, 1
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0803_T07R0401_021C:
	releaseall
	end

scr_seq_0803_T07R0401_0220:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0803_T07R0401_0062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0803_T07R0401_0257
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 6, 1
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0803_T07R0401_0257:
	releaseall
	end

scr_seq_0803_T07R0401_025B:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0803_T07R0401_0062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0803_T07R0401_0292
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 7, 1
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0803_T07R0401_0292:
	releaseall
	end

scr_seq_0803_T07R0401_0296:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0803_T07R0401_0062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0803_T07R0401_02CD
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 8, 1
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0803_T07R0401_02CD:
	releaseall
	end

scr_seq_0803_T07R0401_02D1:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0803_T07R0401_0062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0803_T07R0401_0308
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 9, 1
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0803_T07R0401_0308:
	releaseall
	end

scr_seq_0803_T07R0401_030C:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0803_T07R0401_0062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0803_T07R0401_0343
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 10, 1
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0803_T07R0401_0343:
	releaseall
	end

scr_seq_0803_T07R0401_0347:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0803_T07R0401_0062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0803_T07R0401_037E
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 11, 1
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0803_T07R0401_037E:
	releaseall
	end

scr_seq_0803_T07R0401_0382:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0803_T07R0401_0062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0803_T07R0401_03BE
	npc_msg 20
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 12, 1
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0803_T07R0401_03BE:
	releaseall
	end

scr_seq_0803_T07R0401_03C2:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0803_T07R0401_0062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0803_T07R0401_03F9
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 13, 1
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0803_T07R0401_03F9:
	releaseall
	end

scr_seq_0803_T07R0401_03FD:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0803_T07R0401_0428
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0803_T07R0401_0428:
	scrcmd_784 3, 0
	npc_msg 2
	scrcmd_746
	scrcmd_116 0, 20, 2
	scrcmd_113 20, 7
scr_seq_0803_T07R0401_043E:
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 127, 255, 0
	scrcmd_751 128, 255, 1
	scrcmd_751 129, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0803_T07R0401_048B
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0803_T07R0401_04D7
	npc_msg 6
	goto scr_seq_0803_T07R0401_0531

scr_seq_0803_T07R0401_0489:
	.byte 0x02, 0x00
scr_seq_0803_T07R0401_048B:
	hasenoughmoneyimmediate 32780, 1000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0803_T07R0401_052E
	checkgivecoins VAR_SPECIAL_x800C, 50
	snop
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0803_T07R0401_0523
	submoneyimmediate 1000
	scrcmd_120 50
	scrcmd_118 0
	scrcmd_115
	play_se SEQ_SE_DP_REGI
	wait_se SEQ_SE_DP_REGI
	npc_msg 3
	goto scr_seq_0803_T07R0401_043E

scr_seq_0803_T07R0401_04D5:
	.byte 0x02, 0x00
scr_seq_0803_T07R0401_04D7:
	hasenoughmoneyimmediate 32780, 10000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0803_T07R0401_052E
	checkgivecoins VAR_SPECIAL_x800C, 500
	snop
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0803_T07R0401_0523
	submoneyimmediate 10000
	scrcmd_120 500
	scrcmd_118 0
	scrcmd_115
	play_se SEQ_SE_DP_REGI
	wait_se SEQ_SE_DP_REGI
	npc_msg 3
	goto scr_seq_0803_T07R0401_043E

scr_seq_0803_T07R0401_0521:
	.byte 0x02, 0x00
scr_seq_0803_T07R0401_0523:
	npc_msg 5
	goto scr_seq_0803_T07R0401_0531

scr_seq_0803_T07R0401_052C:
	.byte 0x02, 0x00
scr_seq_0803_T07R0401_052E:
	npc_msg 4
scr_seq_0803_T07R0401_0531:
	waitbutton
	closemsg
	scrcmd_747
	scrcmd_117
	scrcmd_114
	scrcmd_784 3, 1
	releaseall
	end

scr_seq_0803_T07R0401_0543:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_784 3, 0
	checkflag FLAG_UNK_17C
	gotoif TRUE, scr_seq_0803_T07R0401_059B
	npc_msg 11
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0803_T07R0401_05AA
	checkgivecoins VAR_SPECIAL_x800C, 18
	snop
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0803_T07R0401_05B9
	scrcmd_120 18
	buffer_players_name 0
	npc_msg 12
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setflag FLAG_UNK_17C
scr_seq_0803_T07R0401_059B:
	npc_msg 13
	waitbutton
	closemsg
	releaseall
	scrcmd_784 3, 1
	end

scr_seq_0803_T07R0401_05AA:
	npc_msg 14
	waitbutton
	closemsg
	releaseall
	scrcmd_784 3, 1
	end

scr_seq_0803_T07R0401_05B9:
	npc_msg 15
	waitbutton
	closemsg
	releaseall
	scrcmd_784 3, 1
	end

scr_seq_0803_T07R0401_05C8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0803_T07R0401_05DB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0803_T07R0401_05EE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0803_T07R0401_0601:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0803_T07R0401_0614:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0803_T07R0401_0627:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0803_T07R0401_063A:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0803_T07R0401_064B:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 19
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
