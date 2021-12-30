#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0906_T25R1101_0670 ; 000
	scrdef scr_seq_0906_T25R1101_07B6 ; 001
	scrdef scr_seq_0906_T25R1101_0E92 ; 002
	scrdef scr_seq_0906_T25R1101_1214 ; 003
	scrdef scr_seq_0906_T25R1101_1227 ; 004
	scrdef scr_seq_0906_T25R1101_123A ; 005
	scrdef scr_seq_0906_T25R1101_12E9 ; 006
	scrdef scr_seq_0906_T25R1101_12FC ; 007
	scrdef scr_seq_0906_T25R1101_130F ; 008
	scrdef scr_seq_0906_T25R1101_1322 ; 009
	scrdef scr_seq_0906_T25R1101_0102 ; 010
	scrdef scr_seq_0906_T25R1101_0199 ; 011
	scrdef scr_seq_0906_T25R1101_01D4 ; 012
	scrdef scr_seq_0906_T25R1101_020F ; 013
	scrdef scr_seq_0906_T25R1101_024A ; 014
	scrdef scr_seq_0906_T25R1101_0285 ; 015
	scrdef scr_seq_0906_T25R1101_02C0 ; 016
	scrdef scr_seq_0906_T25R1101_02FB ; 017
	scrdef scr_seq_0906_T25R1101_0336 ; 018
	scrdef scr_seq_0906_T25R1101_0371 ; 019
	scrdef scr_seq_0906_T25R1101_03AC ; 020
	scrdef scr_seq_0906_T25R1101_03E7 ; 021
	scrdef scr_seq_0906_T25R1101_0422 ; 022
	scrdef scr_seq_0906_T25R1101_045D ; 023
	scrdef scr_seq_0906_T25R1101_0498 ; 024
	scrdef scr_seq_0906_T25R1101_04D3 ; 025
	scrdef scr_seq_0906_T25R1101_050E ; 026
	scrdef scr_seq_0906_T25R1101_0549 ; 027
	scrdef scr_seq_0906_T25R1101_0584 ; 028
	scrdef scr_seq_0906_T25R1101_05BF ; 029
	scrdef scr_seq_0906_T25R1101_05FA ; 030
	scrdef scr_seq_0906_T25R1101_0635 ; 031
	scrdef scr_seq_0906_T25R1101_0086 ; 032
	scrdef_end

scr_seq_0906_T25R1101_0086:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0906_T25R1101_00A3
	goto scr_seq_0906_T25R1101_00AB

scr_seq_0906_T25R1101_009D:
	.byte 0x16, 0x00, 0x06
	.byte 0x00, 0x00, 0x00
scr_seq_0906_T25R1101_00A3:
	goto scr_seq_0906_T25R1101_00FC

scr_seq_0906_T25R1101_00A9:
	.byte 0x02, 0x00
scr_seq_0906_T25R1101_00AB:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_0906_T25R1101_00C6
	setflag FLAG_UNK_2DA
	goto scr_seq_0906_T25R1101_00FA

scr_seq_0906_T25R1101_00C6:
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif ne, scr_seq_0906_T25R1101_00DD
	setflag FLAG_UNK_2DA
	goto scr_seq_0906_T25R1101_00FA

scr_seq_0906_T25R1101_00DD:
	comparevartovalue VAR_TEMP_x4000, 9
	gotoif ne, scr_seq_0906_T25R1101_00F4
	setflag FLAG_UNK_2DA
	goto scr_seq_0906_T25R1101_00FA

scr_seq_0906_T25R1101_00F4:
	goto scr_seq_0906_T25R1101_00FC

scr_seq_0906_T25R1101_00FA:
	end

scr_seq_0906_T25R1101_00FC:
	clearflag FLAG_UNK_2DA
	end

scr_seq_0906_T25R1101_0102:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0906_T25R1101_013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0906_T25R1101_0139
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 0, 0
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0906_T25R1101_0139:
	releaseall
	end

scr_seq_0906_T25R1101_013D:
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0906_T25R1101_0177
	scrcmd_784 3, 0
	scrcmd_532 32780, 3
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0906_T25R1101_0186
	scrcmd_784 3, 1
	setvar VAR_TEMP_x4001, 0
	return

scr_seq_0906_T25R1101_0177:
	npc_msg 25
	waitbutton
	closemsg
	setvar VAR_TEMP_x4001, 1
	return

scr_seq_0906_T25R1101_0186:
	npc_msg 26
	waitbutton
	closemsg
	scrcmd_784 3, 1
	setvar VAR_TEMP_x4001, 1
	return

scr_seq_0906_T25R1101_0199:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0906_T25R1101_013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0906_T25R1101_01D0
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 1, 0
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0906_T25R1101_01D0:
	releaseall
	end

scr_seq_0906_T25R1101_01D4:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0906_T25R1101_013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0906_T25R1101_020B
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 2, 0
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0906_T25R1101_020B:
	releaseall
	end

scr_seq_0906_T25R1101_020F:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0906_T25R1101_013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0906_T25R1101_0246
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 3, 0
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0906_T25R1101_0246:
	releaseall
	end

scr_seq_0906_T25R1101_024A:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0906_T25R1101_013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0906_T25R1101_0281
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 4, 0
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0906_T25R1101_0281:
	releaseall
	end

scr_seq_0906_T25R1101_0285:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0906_T25R1101_013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0906_T25R1101_02BC
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 5, 0
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0906_T25R1101_02BC:
	releaseall
	end

scr_seq_0906_T25R1101_02C0:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0906_T25R1101_013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0906_T25R1101_02F7
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 6, 0
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0906_T25R1101_02F7:
	releaseall
	end

scr_seq_0906_T25R1101_02FB:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0906_T25R1101_013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0906_T25R1101_0332
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 7, 0
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0906_T25R1101_0332:
	releaseall
	end

scr_seq_0906_T25R1101_0336:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0906_T25R1101_013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0906_T25R1101_036D
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 8, 0
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0906_T25R1101_036D:
	releaseall
	end

scr_seq_0906_T25R1101_0371:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0906_T25R1101_013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0906_T25R1101_03A8
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 9, 0
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0906_T25R1101_03A8:
	releaseall
	end

scr_seq_0906_T25R1101_03AC:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0906_T25R1101_013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0906_T25R1101_03E3
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 10, 0
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0906_T25R1101_03E3:
	releaseall
	end

scr_seq_0906_T25R1101_03E7:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0906_T25R1101_013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0906_T25R1101_041E
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 11, 0
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0906_T25R1101_041E:
	releaseall
	end

scr_seq_0906_T25R1101_0422:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0906_T25R1101_013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0906_T25R1101_0459
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 21, 0
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0906_T25R1101_0459:
	releaseall
	end

scr_seq_0906_T25R1101_045D:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0906_T25R1101_013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0906_T25R1101_0494
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 12, 0
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0906_T25R1101_0494:
	releaseall
	end

scr_seq_0906_T25R1101_0498:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0906_T25R1101_013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0906_T25R1101_04CF
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 13, 0
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0906_T25R1101_04CF:
	releaseall
	end

scr_seq_0906_T25R1101_04D3:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0906_T25R1101_013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0906_T25R1101_050A
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 14, 0
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0906_T25R1101_050A:
	releaseall
	end

scr_seq_0906_T25R1101_050E:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0906_T25R1101_013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0906_T25R1101_0545
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 15, 0
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0906_T25R1101_0545:
	releaseall
	end

scr_seq_0906_T25R1101_0549:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0906_T25R1101_013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0906_T25R1101_0580
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 16, 0
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0906_T25R1101_0580:
	releaseall
	end

scr_seq_0906_T25R1101_0584:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0906_T25R1101_013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0906_T25R1101_05BB
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 17, 0
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0906_T25R1101_05BB:
	releaseall
	end

scr_seq_0906_T25R1101_05BF:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0906_T25R1101_013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0906_T25R1101_05F6
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 18, 0
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0906_T25R1101_05F6:
	releaseall
	end

scr_seq_0906_T25R1101_05FA:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0906_T25R1101_013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0906_T25R1101_0631
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 19, 0
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0906_T25R1101_0631:
	releaseall
	end

scr_seq_0906_T25R1101_0635:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0906_T25R1101_013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0906_T25R1101_066C
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 20, 0
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0906_T25R1101_066C:
	releaseall
	end

scr_seq_0906_T25R1101_0670:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0906_T25R1101_069B
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0906_T25R1101_069B:
	scrcmd_784 3, 0
	npc_msg 2
	touchscreen_menu_hide
	scrcmd_116 0, 20, 2
	scrcmd_113 20, 7
scr_seq_0906_T25R1101_06B1:
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 127, 255, 0
	menu_item_add 128, 255, 1
	menu_item_add 129, 255, 2
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0906_T25R1101_06FE
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0906_T25R1101_074A
	npc_msg 6
	goto scr_seq_0906_T25R1101_07A4

scr_seq_0906_T25R1101_06FC:
	.byte 0x02, 0x00
scr_seq_0906_T25R1101_06FE:
	hasenoughmoneyimmediate 32780, 1000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0906_T25R1101_07A1
	checkgivecoins VAR_SPECIAL_x800C, 50
	snop
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0906_T25R1101_0796
	submoneyimmediate 1000
	scrcmd_120 50
	scrcmd_118 0
	scrcmd_115
	play_se SEQ_SE_DP_REGI
	wait_se SEQ_SE_DP_REGI
	npc_msg 3
	goto scr_seq_0906_T25R1101_06B1

scr_seq_0906_T25R1101_0748:
	.byte 0x02, 0x00
scr_seq_0906_T25R1101_074A:
	hasenoughmoneyimmediate 32780, 10000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0906_T25R1101_07A1
	checkgivecoins VAR_SPECIAL_x800C, 500
	snop
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0906_T25R1101_0796
	submoneyimmediate 10000
	scrcmd_120 500
	scrcmd_118 0
	scrcmd_115
	play_se SEQ_SE_DP_REGI
	wait_se SEQ_SE_DP_REGI
	npc_msg 3
	goto scr_seq_0906_T25R1101_06B1

scr_seq_0906_T25R1101_0794:
	.byte 0x02, 0x00
scr_seq_0906_T25R1101_0796:
	npc_msg 5
	goto scr_seq_0906_T25R1101_07A4

scr_seq_0906_T25R1101_079F:
	.byte 0x02
	.byte 0x00
scr_seq_0906_T25R1101_07A1:
	npc_msg 4
scr_seq_0906_T25R1101_07A4:
	waitbutton
	closemsg
	touchscreen_menu_show
	scrcmd_117
	scrcmd_114
	scrcmd_784 3, 1
	releaseall
	end

scr_seq_0906_T25R1101_07B6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_784 3, 0
	npc_msg 7
	touchscreen_menu_hide
	scrcmd_116 0, 20, 2
scr_seq_0906_T25R1101_07CE:
	menu_init 1, 1, 0, 1, VAR_TEMP_x4000
	menu_item_add 37, 255, 0
	menu_item_add 38, 255, 1
	menu_item_add 36, 255, 2
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0906_T25R1101_0816
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0906_T25R1101_08B2
	goto scr_seq_0906_T25R1101_11F9

scr_seq_0906_T25R1101_0816:
	menu_init 1, 1, 0, 1, VAR_TEMP_x4000
	menu_item_add 39, 255, 0
	menu_item_add 40, 255, 1
	menu_item_add 41, 255, 2
	menu_item_add 42, 255, 3
	menu_item_add 43, 255, 4
	menu_item_add 44, 255, 5
	menu_item_add 36, 255, 6
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0906_T25R1101_0924
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0906_T25R1101_09AF
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0906_T25R1101_0A3A
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0906_T25R1101_0AC5
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0906_T25R1101_0B50
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0906_T25R1101_0BDB
	goto scr_seq_0906_T25R1101_07CE

scr_seq_0906_T25R1101_08B2:
	menu_init 1, 1, 0, 1, VAR_TEMP_x4000
	menu_item_add 45, 255, 0
	menu_item_add 46, 255, 1
	menu_item_add 47, 255, 2
	menu_item_add 48, 255, 3
	menu_item_add 36, 255, 4
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0906_T25R1101_0C66
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0906_T25R1101_0CF1
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0906_T25R1101_0D7C
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0906_T25R1101_0E07
	goto scr_seq_0906_T25R1101_07CE

scr_seq_0906_T25R1101_0924:
	setvar VAR_SPECIAL_x8004, 417
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0906_T25R1101_1127
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 10
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0906_T25R1101_096D
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0906_T25R1101_0816
scr_seq_0906_T25R1101_096D:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 2000
	gotoif lt, scr_seq_0906_T25R1101_11C8
	npc_msg 11
	play_se SEQ_SE_DP_REGI
	scrcmd_121 2000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg 17
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_0906_T25R1101_0816

scr_seq_0906_T25R1101_09AD:
	.byte 0x02, 0x00
scr_seq_0906_T25R1101_09AF:
	setvar VAR_SPECIAL_x8004, 402
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0906_T25R1101_1127
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 10
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0906_T25R1101_09F8
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0906_T25R1101_0816
scr_seq_0906_T25R1101_09F8:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 4000
	gotoif lt, scr_seq_0906_T25R1101_11C8
	npc_msg 11
	play_se SEQ_SE_DP_REGI
	scrcmd_121 4000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg 17
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_0906_T25R1101_0816

scr_seq_0906_T25R1101_0A38:
	.byte 0x02, 0x00
scr_seq_0906_T25R1101_0A3A:
	setvar VAR_SPECIAL_x8004, 371
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0906_T25R1101_1127
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 10
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0906_T25R1101_0A83
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0906_T25R1101_0816
scr_seq_0906_T25R1101_0A83:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 6000
	gotoif lt, scr_seq_0906_T25R1101_11C8
	npc_msg 11
	play_se SEQ_SE_DP_REGI
	scrcmd_121 6000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg 17
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_0906_T25R1101_0816

scr_seq_0906_T25R1101_0AC3:
	.byte 0x02, 0x00
scr_seq_0906_T25R1101_0AC5:
	setvar VAR_SPECIAL_x8004, 362
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0906_T25R1101_1127
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 10
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0906_T25R1101_0B0E
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0906_T25R1101_0816
scr_seq_0906_T25R1101_0B0E:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 10000
	gotoif lt, scr_seq_0906_T25R1101_11C8
	npc_msg 11
	play_se SEQ_SE_DP_REGI
	scrcmd_121 10000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg 17
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_0906_T25R1101_0816

scr_seq_0906_T25R1101_0B4E:
	.byte 0x02, 0x00
scr_seq_0906_T25R1101_0B50:
	setvar VAR_SPECIAL_x8004, 340
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0906_T25R1101_1127
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 10
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0906_T25R1101_0B99
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0906_T25R1101_0816
scr_seq_0906_T25R1101_0B99:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 10000
	gotoif lt, scr_seq_0906_T25R1101_11C8
	npc_msg 11
	play_se SEQ_SE_DP_REGI
	scrcmd_121 10000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg 17
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_0906_T25R1101_0816

scr_seq_0906_T25R1101_0BD9:
	.byte 0x02, 0x00
scr_seq_0906_T25R1101_0BDB:
	setvar VAR_SPECIAL_x8004, 351
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0906_T25R1101_1127
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 10
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0906_T25R1101_0C24
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0906_T25R1101_0816
scr_seq_0906_T25R1101_0C24:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 10000
	gotoif lt, scr_seq_0906_T25R1101_11C8
	npc_msg 11
	play_se SEQ_SE_DP_REGI
	scrcmd_121 10000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg 17
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_0906_T25R1101_0816

scr_seq_0906_T25R1101_0C64:
	.byte 0x02, 0x00
scr_seq_0906_T25R1101_0C66:
	setvar VAR_SPECIAL_x8004, 251
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0906_T25R1101_1127
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 10
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0906_T25R1101_0CAF
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0906_T25R1101_08B2
scr_seq_0906_T25R1101_0CAF:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, scr_seq_0906_T25R1101_11C8
	npc_msg 11
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg 17
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_0906_T25R1101_08B2

scr_seq_0906_T25R1101_0CEF:
	.byte 0x02
	.byte 0x00
scr_seq_0906_T25R1101_0CF1:
	setvar VAR_SPECIAL_x8004, 265
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0906_T25R1101_1127
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 10
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0906_T25R1101_0D3A
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0906_T25R1101_08B2
scr_seq_0906_T25R1101_0D3A:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, scr_seq_0906_T25R1101_11C8
	npc_msg 11
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg 17
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_0906_T25R1101_08B2

scr_seq_0906_T25R1101_0D7A:
	.byte 0x02, 0x00
scr_seq_0906_T25R1101_0D7C:
	setvar VAR_SPECIAL_x8004, 276
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0906_T25R1101_1127
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 10
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0906_T25R1101_0DC5
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0906_T25R1101_08B2
scr_seq_0906_T25R1101_0DC5:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, scr_seq_0906_T25R1101_11C8
	npc_msg 11
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg 17
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_0906_T25R1101_08B2

scr_seq_0906_T25R1101_0E05:
	.byte 0x02, 0x00
scr_seq_0906_T25R1101_0E07:
	setvar VAR_SPECIAL_x8004, 277
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0906_T25R1101_1127
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 10
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0906_T25R1101_0E50
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0906_T25R1101_08B2
scr_seq_0906_T25R1101_0E50:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, scr_seq_0906_T25R1101_11C8
	npc_msg 11
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg 17
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_0906_T25R1101_08B2

scr_seq_0906_T25R1101_0E90:
	.byte 0x02, 0x00
scr_seq_0906_T25R1101_0E92:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_784 3, 0
	npc_msg 16
	touchscreen_menu_hide
	scrcmd_116 0, 20, 2
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_0906_T25R1101_0EC7
	goto scr_seq_0906_T25R1101_0ECD

scr_seq_0906_T25R1101_0EC1:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_0906_T25R1101_0EC7:
	goto scr_seq_0906_T25R1101_0F2A

scr_seq_0906_T25R1101_0ECD:
	menu_init 1, 1, 0, 1, VAR_TEMP_x4000
	menu_item_add 49, 255, 0
	menu_item_add 50, 255, 1
	menu_item_add 51, 255, 2
	menu_item_add 36, 255, 3
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0906_T25R1101_0F87
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0906_T25R1101_0F93
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0906_T25R1101_0F9F
	goto scr_seq_0906_T25R1101_11F9

scr_seq_0906_T25R1101_0F2A:
	menu_init 1, 1, 0, 1, VAR_TEMP_x4000
	menu_item_add 49, 255, 0
	menu_item_add 52, 255, 1
	menu_item_add 51, 255, 2
	menu_item_add 36, 255, 3
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0906_T25R1101_0F87
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0906_T25R1101_0FAB
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0906_T25R1101_0F9F
	goto scr_seq_0906_T25R1101_11F9

scr_seq_0906_T25R1101_0F87:
	setorcopyvar VAR_TEMP_x4002, 63
	goto scr_seq_0906_T25R1101_0FB7

scr_seq_0906_T25R1101_0F93:
	setorcopyvar VAR_TEMP_x4002, 23
	goto scr_seq_0906_T25R1101_0FB7

scr_seq_0906_T25R1101_0F9F:
	setorcopyvar VAR_TEMP_x4002, 147
	goto scr_seq_0906_T25R1101_0FB7

scr_seq_0906_T25R1101_0FAB:
	setorcopyvar VAR_TEMP_x4002, 27
	goto scr_seq_0906_T25R1101_0FB7

scr_seq_0906_T25R1101_0FB7:
	get_party_count VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 6
	gotoif ne, scr_seq_0906_T25R1101_0FD5
	npc_msg 13
	waitbutton
	closemsg
	goto scr_seq_0906_T25R1101_1208

scr_seq_0906_T25R1101_0FD5:
	buffer_species_name_custom 1, VAR_TEMP_x4002, 0, 0
	npc_msg 14
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0906_T25R1101_1016
	closemsg
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_0906_T25R1101_1010
	goto scr_seq_0906_T25R1101_0ECD

scr_seq_0906_T25R1101_100A:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_0906_T25R1101_1010:
	goto scr_seq_0906_T25R1101_0F2A

scr_seq_0906_T25R1101_1016:
	comparevartovalue VAR_TEMP_x4002, 63
	gotoif ne, scr_seq_0906_T25R1101_103A
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 200
	gotoif lt, scr_seq_0906_T25R1101_11D3
	goto scr_seq_0906_T25R1101_1093

scr_seq_0906_T25R1101_103A:
	comparevartovalue VAR_TEMP_x4002, 23
	gotoif ne, scr_seq_0906_T25R1101_105E
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 700
	gotoif lt, scr_seq_0906_T25R1101_11D3
	goto scr_seq_0906_T25R1101_1093

scr_seq_0906_T25R1101_105E:
	comparevartovalue VAR_TEMP_x4002, 27
	gotoif ne, scr_seq_0906_T25R1101_1082
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 700
	gotoif lt, scr_seq_0906_T25R1101_11D3
	goto scr_seq_0906_T25R1101_1093

scr_seq_0906_T25R1101_1082:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 2100
	gotoif lt, scr_seq_0906_T25R1101_11D3
scr_seq_0906_T25R1101_1093:
	npc_msg 11
	play_se SEQ_SE_DP_REGI
	give_mon VAR_TEMP_x4002, 15, 0, 0, 0, VAR_SPECIAL_x800C
	buffer_players_name 0
	buffer_species_name_custom 1, VAR_TEMP_x4002, 0, 0
	npc_msg 15
	comparevartovalue VAR_TEMP_x4002, 63
	gotoif ne, scr_seq_0906_T25R1101_10CD
	scrcmd_121 200
	goto scr_seq_0906_T25R1101_10FF

scr_seq_0906_T25R1101_10CD:
	comparevartovalue VAR_TEMP_x4002, 23
	gotoif ne, scr_seq_0906_T25R1101_10E4
	scrcmd_121 700
	goto scr_seq_0906_T25R1101_10FF

scr_seq_0906_T25R1101_10E4:
	comparevartovalue VAR_TEMP_x4002, 27
	gotoif ne, scr_seq_0906_T25R1101_10FB
	scrcmd_121 700
	goto scr_seq_0906_T25R1101_10FF

scr_seq_0906_T25R1101_10FB:
	scrcmd_121 2100
scr_seq_0906_T25R1101_10FF:
	scrcmd_118 0
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_0906_T25R1101_111F
	goto scr_seq_0906_T25R1101_0ECD

scr_seq_0906_T25R1101_1119:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_0906_T25R1101_111F:
	goto scr_seq_0906_T25R1101_0F2A

scr_seq_0906_T25R1101_1125:
	.byte 0x02, 0x00
scr_seq_0906_T25R1101_1127:
	npc_msg 12
	closemsg
scr_seq_0906_T25R1101_112C:
	comparevartovalue VAR_SPECIAL_x8004, 417
	gotoif ne, scr_seq_0906_T25R1101_1145
	goto scr_seq_0906_T25R1101_0816

scr_seq_0906_T25R1101_113F:
	.byte 0x16
	.byte 0x00, 0x83, 0x00, 0x00, 0x00
scr_seq_0906_T25R1101_1145:
	comparevartovalue VAR_SPECIAL_x8004, 402
	gotoif ne, scr_seq_0906_T25R1101_115E
	goto scr_seq_0906_T25R1101_0816

scr_seq_0906_T25R1101_1158:
	.byte 0x16, 0x00, 0x6a, 0x00, 0x00, 0x00
scr_seq_0906_T25R1101_115E:
	comparevartovalue VAR_SPECIAL_x8004, 371
	gotoif ne, scr_seq_0906_T25R1101_1177
	goto scr_seq_0906_T25R1101_0816

scr_seq_0906_T25R1101_1171:
	.byte 0x16, 0x00, 0x51, 0x00, 0x00, 0x00
scr_seq_0906_T25R1101_1177:
	comparevartovalue VAR_SPECIAL_x8004, 362
	gotoif ne, scr_seq_0906_T25R1101_1190
	goto scr_seq_0906_T25R1101_0816

scr_seq_0906_T25R1101_118A:
	.byte 0x16, 0x00, 0x38, 0x00, 0x00, 0x00
scr_seq_0906_T25R1101_1190:
	comparevartovalue VAR_SPECIAL_x8004, 340
	gotoif ne, scr_seq_0906_T25R1101_11A9
	goto scr_seq_0906_T25R1101_0816

scr_seq_0906_T25R1101_11A3:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_0906_T25R1101_11A9:
	comparevartovalue VAR_SPECIAL_x8004, 351
	gotoif ne, scr_seq_0906_T25R1101_11C2
	goto scr_seq_0906_T25R1101_0816

scr_seq_0906_T25R1101_11BC:
	.byte 0x16, 0x00, 0x06, 0x00
	.byte 0x00, 0x00
scr_seq_0906_T25R1101_11C2:
	goto scr_seq_0906_T25R1101_08B2

scr_seq_0906_T25R1101_11C8:
	npc_msg 9
	goto scr_seq_0906_T25R1101_112C

scr_seq_0906_T25R1101_11D1:
	.byte 0x02, 0x00
scr_seq_0906_T25R1101_11D3:
	npc_msg 9
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_0906_T25R1101_11F3
	goto scr_seq_0906_T25R1101_0ECD

scr_seq_0906_T25R1101_11ED:
	.byte 0x16, 0x00, 0x06
	.byte 0x00, 0x00, 0x00
scr_seq_0906_T25R1101_11F3:
	goto scr_seq_0906_T25R1101_0F2A

scr_seq_0906_T25R1101_11F9:
	npc_msg 8
	waitbutton
	closemsg
	goto scr_seq_0906_T25R1101_1208

scr_seq_0906_T25R1101_1206:
	.byte 0x02, 0x00
scr_seq_0906_T25R1101_1208:
	scrcmd_117
	touchscreen_menu_show
	scrcmd_784 3, 1
	releaseall
	end

scr_seq_0906_T25R1101_1214:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0906_T25R1101_1227:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0906_T25R1101_123A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 27
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0906_T25R1101_12DE
	npc_msg 31
	waitbutton
	npc_msg 28
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0906_T25R1101_12DE
	npc_msg 32
	waitbutton
	npc_msg 28
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0906_T25R1101_12DE
	npc_msg 33
	waitbutton
	npc_msg 28
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0906_T25R1101_12DE
	npc_msg 34
	waitbutton
	npc_msg 28
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0906_T25R1101_12DE
	npc_msg 35
	waitbutton
	npc_msg 30
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0906_T25R1101_12DE:
	npc_msg 29
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0906_T25R1101_12E9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 21
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0906_T25R1101_12FC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 22
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0906_T25R1101_130F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 23
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0906_T25R1101_1322:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 24
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
