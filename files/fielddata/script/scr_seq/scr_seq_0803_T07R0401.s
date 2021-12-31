#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0401.h"
#include "msgdata/msg/msg_0508_T07R0401.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T07R0401_000
	scrdef scr_seq_T07R0401_001
	scrdef scr_seq_T07R0401_002
	scrdef scr_seq_T07R0401_003
	scrdef scr_seq_T07R0401_004
	scrdef scr_seq_T07R0401_005
	scrdef scr_seq_T07R0401_006
	scrdef scr_seq_T07R0401_007
	scrdef scr_seq_T07R0401_008
	scrdef scr_seq_T07R0401_009
	scrdef scr_seq_T07R0401_010
	scrdef scr_seq_T07R0401_011
	scrdef scr_seq_T07R0401_012
	scrdef scr_seq_T07R0401_013
	scrdef scr_seq_T07R0401_014
	scrdef scr_seq_T07R0401_015
	scrdef scr_seq_T07R0401_016
	scrdef scr_seq_T07R0401_017
	scrdef scr_seq_T07R0401_018
	scrdef scr_seq_T07R0401_019
	scrdef scr_seq_T07R0401_020
	scrdef scr_seq_T07R0401_021
	scrdef scr_seq_T07R0401_022
	scrdef scr_seq_T07R0401_023
	scrdef_end

_0062:
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _009C
	scrcmd_784 3, 0
	scrcmd_532 32780, 3
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _00AB
	scrcmd_784 3, 1
	setvar VAR_TEMP_x4001, 0
	return

_009C:
	npc_msg msg_0508_T07R0401_00021
	waitbutton
	closemsg
	setvar VAR_TEMP_x4001, 1
	return

_00AB:
	npc_msg msg_0508_T07R0401_00022
	waitbutton
	closemsg
	scrcmd_784 3, 1
	setvar VAR_TEMP_x4001, 1
	return

scr_seq_T07R0401_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	call _0062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _00F5
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_780 0, 1
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
_00F5:
	releaseall
	end

scr_seq_T07R0401_011:
	play_se SEQ_SE_DP_SELECT
	lockall
	call _0062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _0130
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_780 1, 1
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
_0130:
	releaseall
	end

scr_seq_T07R0401_012:
	play_se SEQ_SE_DP_SELECT
	lockall
	call _0062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _016B
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_780 2, 1
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
_016B:
	releaseall
	end

scr_seq_T07R0401_013:
	play_se SEQ_SE_DP_SELECT
	lockall
	call _0062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _01A6
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_780 3, 1
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
_01A6:
	releaseall
	end

scr_seq_T07R0401_014:
	play_se SEQ_SE_DP_SELECT
	lockall
	call _0062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _01E1
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_780 4, 1
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
_01E1:
	releaseall
	end

scr_seq_T07R0401_015:
	play_se SEQ_SE_DP_SELECT
	lockall
	call _0062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _021C
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_780 5, 1
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
_021C:
	releaseall
	end

scr_seq_T07R0401_016:
	play_se SEQ_SE_DP_SELECT
	lockall
	call _0062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _0257
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_780 6, 1
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
_0257:
	releaseall
	end

scr_seq_T07R0401_017:
	play_se SEQ_SE_DP_SELECT
	lockall
	call _0062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _0292
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_780 7, 1
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
_0292:
	releaseall
	end

scr_seq_T07R0401_018:
	play_se SEQ_SE_DP_SELECT
	lockall
	call _0062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _02CD
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_780 8, 1
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
_02CD:
	releaseall
	end

scr_seq_T07R0401_019:
	play_se SEQ_SE_DP_SELECT
	lockall
	call _0062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _0308
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_780 9, 1
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
_0308:
	releaseall
	end

scr_seq_T07R0401_020:
	play_se SEQ_SE_DP_SELECT
	lockall
	call _0062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _0343
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_780 10, 1
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
_0343:
	releaseall
	end

scr_seq_T07R0401_021:
	play_se SEQ_SE_DP_SELECT
	lockall
	call _0062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _037E
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_780 11, 1
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
_037E:
	releaseall
	end

scr_seq_T07R0401_022:
	play_se SEQ_SE_DP_SELECT
	lockall
	call _0062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _03BE
	npc_msg msg_0508_T07R0401_00020
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_780 12, 1
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
_03BE:
	releaseall
	end

scr_seq_T07R0401_023:
	play_se SEQ_SE_DP_SELECT
	lockall
	call _0062
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _03F9
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_780 13, 1
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
_03F9:
	releaseall
	end

scr_seq_T07R0401_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0508_T07R0401_00000
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0428
	npc_msg msg_0508_T07R0401_00001
	waitbutton
	closemsg
	releaseall
	end

_0428:
	scrcmd_784 3, 0
	npc_msg msg_0508_T07R0401_00002
	touchscreen_menu_hide
	scrcmd_116 0, 20, 2
	scrcmd_113 20, 7
_043E:
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 127, 255, 0
	menu_item_add 128, 255, 1
	menu_item_add 129, 255, 2
	menu_exec
	switch VAR_SPECIAL_x800C
	case 0, _048B
	case 1, _04D7
	npc_msg msg_0508_T07R0401_00006
	goto _0531
	.byte 0x02, 0x00
_048B:
	hasenoughmoneyimmediate 32780, 1000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _052E
	checkgivecoins VAR_SPECIAL_x800C, 50
	snop
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0523
	submoneyimmediate 1000
	scrcmd_120 50
	scrcmd_118 0
	scrcmd_115
	play_se SEQ_SE_DP_REGI
	wait_se SEQ_SE_DP_REGI
	npc_msg msg_0508_T07R0401_00003
	goto _043E
	.byte 0x02, 0x00
_04D7:
	hasenoughmoneyimmediate 32780, 10000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _052E
	checkgivecoins VAR_SPECIAL_x800C, 500
	snop
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0523
	submoneyimmediate 10000
	scrcmd_120 500
	scrcmd_118 0
	scrcmd_115
	play_se SEQ_SE_DP_REGI
	wait_se SEQ_SE_DP_REGI
	npc_msg msg_0508_T07R0401_00003
	goto _043E
	.byte 0x02, 0x00
_0523:
	npc_msg msg_0508_T07R0401_00005
	goto _0531
	.byte 0x02, 0x00
_052E:
	npc_msg msg_0508_T07R0401_00004
_0531:
	waitbutton
	closemsg
	touchscreen_menu_show
	scrcmd_117
	scrcmd_114
	scrcmd_784 3, 1
	releaseall
	end

scr_seq_T07R0401_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_784 3, 0
	checkflag FLAG_UNK_17C
	gotoif TRUE, _059B
	npc_msg msg_0508_T07R0401_00011
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _05AA
	checkgivecoins VAR_SPECIAL_x800C, 18
	snop
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _05B9
	scrcmd_120 18
	buffer_players_name 0
	npc_msg msg_0508_T07R0401_00012
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setflag FLAG_UNK_17C
_059B:
	npc_msg msg_0508_T07R0401_00013
	waitbutton
	closemsg
	releaseall
	scrcmd_784 3, 1
	end

_05AA:
	npc_msg msg_0508_T07R0401_00014
	waitbutton
	closemsg
	releaseall
	scrcmd_784 3, 1
	end

_05B9:
	npc_msg msg_0508_T07R0401_00015
	waitbutton
	closemsg
	releaseall
	scrcmd_784 3, 1
	end

scr_seq_T07R0401_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0508_T07R0401_00007
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0401_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0508_T07R0401_00008
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0401_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0508_T07R0401_00009
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0401_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0508_T07R0401_00010
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0401_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0508_T07R0401_00016
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0401_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0508_T07R0401_00017
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0401_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0508_T07R0401_00018
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0401_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0508_T07R0401_00019
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
