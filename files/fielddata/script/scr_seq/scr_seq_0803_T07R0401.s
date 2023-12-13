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
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _009C
	script_overlay_cmd 3, 0
	check_coins_immediate VAR_SPECIAL_RESULT, 3
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _00AB
	script_overlay_cmd 3, 1
	setvar VAR_TEMP_x4001, 0
	return

_009C:
	npc_msg msg_0508_T07R0401_00021
	wait_button_or_walk_away
	closemsg
	setvar VAR_TEMP_x4001, 1
	return

_00AB:
	npc_msg msg_0508_T07R0401_00022
	wait_button_or_walk_away
	closemsg
	script_overlay_cmd 3, 1
	setvar VAR_TEMP_x4001, 1
	return

scr_seq_T07R0401_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	call _0062
	compare VAR_TEMP_x4001, 1
	goto_if_eq _00F5
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	casino_game 0, 1
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
_00F5:
	releaseall
	end

scr_seq_T07R0401_011:
	play_se SEQ_SE_DP_SELECT
	lockall
	call _0062
	compare VAR_TEMP_x4001, 1
	goto_if_eq _0130
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	casino_game 1, 1
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
_0130:
	releaseall
	end

scr_seq_T07R0401_012:
	play_se SEQ_SE_DP_SELECT
	lockall
	call _0062
	compare VAR_TEMP_x4001, 1
	goto_if_eq _016B
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	casino_game 2, 1
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
_016B:
	releaseall
	end

scr_seq_T07R0401_013:
	play_se SEQ_SE_DP_SELECT
	lockall
	call _0062
	compare VAR_TEMP_x4001, 1
	goto_if_eq _01A6
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	casino_game 3, 1
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
_01A6:
	releaseall
	end

scr_seq_T07R0401_014:
	play_se SEQ_SE_DP_SELECT
	lockall
	call _0062
	compare VAR_TEMP_x4001, 1
	goto_if_eq _01E1
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	casino_game 4, 1
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
_01E1:
	releaseall
	end

scr_seq_T07R0401_015:
	play_se SEQ_SE_DP_SELECT
	lockall
	call _0062
	compare VAR_TEMP_x4001, 1
	goto_if_eq _021C
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	casino_game 5, 1
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
_021C:
	releaseall
	end

scr_seq_T07R0401_016:
	play_se SEQ_SE_DP_SELECT
	lockall
	call _0062
	compare VAR_TEMP_x4001, 1
	goto_if_eq _0257
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	casino_game 6, 1
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
_0257:
	releaseall
	end

scr_seq_T07R0401_017:
	play_se SEQ_SE_DP_SELECT
	lockall
	call _0062
	compare VAR_TEMP_x4001, 1
	goto_if_eq _0292
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	casino_game 7, 1
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
_0292:
	releaseall
	end

scr_seq_T07R0401_018:
	play_se SEQ_SE_DP_SELECT
	lockall
	call _0062
	compare VAR_TEMP_x4001, 1
	goto_if_eq _02CD
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	casino_game 8, 1
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
_02CD:
	releaseall
	end

scr_seq_T07R0401_019:
	play_se SEQ_SE_DP_SELECT
	lockall
	call _0062
	compare VAR_TEMP_x4001, 1
	goto_if_eq _0308
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	casino_game 9, 1
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
_0308:
	releaseall
	end

scr_seq_T07R0401_020:
	play_se SEQ_SE_DP_SELECT
	lockall
	call _0062
	compare VAR_TEMP_x4001, 1
	goto_if_eq _0343
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	casino_game 10, 1
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
_0343:
	releaseall
	end

scr_seq_T07R0401_021:
	play_se SEQ_SE_DP_SELECT
	lockall
	call _0062
	compare VAR_TEMP_x4001, 1
	goto_if_eq _037E
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	casino_game 11, 1
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
_037E:
	releaseall
	end

scr_seq_T07R0401_022:
	play_se SEQ_SE_DP_SELECT
	lockall
	call _0062
	compare VAR_TEMP_x4001, 1
	goto_if_eq _03BE
	npc_msg msg_0508_T07R0401_00020
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	casino_game 12, 1
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
_03BE:
	releaseall
	end

scr_seq_T07R0401_023:
	play_se SEQ_SE_DP_SELECT
	lockall
	call _0062
	compare VAR_TEMP_x4001, 1
	goto_if_eq _03F9
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	casino_game 13, 1
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
_03F9:
	releaseall
	end

scr_seq_T07R0401_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0508_T07R0401_00000
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0428
	npc_msg msg_0508_T07R0401_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0428:
	script_overlay_cmd 3, 0
	npc_msg msg_0508_T07R0401_00002
	touchscreen_menu_hide
	scrcmd_116 0, 20, 2
	show_money_box 20, 7
_043E:
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 127, 255, 0
	menu_item_add 128, 255, 1
	menu_item_add 129, 255, 2
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _048B
	case 1, _04D7
	npc_msg msg_0508_T07R0401_00006
	goto _0531
	end

_048B:
	hasenoughmoneyimmediate VAR_SPECIAL_RESULT, 1000
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _052E
	checkgivecoins VAR_SPECIAL_RESULT, 50
	snop
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0523
	submoneyimmediate 1000
	give_coins 50
	scrcmd_118 0
	update_money_box
	play_se SEQ_SE_DP_REGI
	wait_se SEQ_SE_DP_REGI
	npc_msg msg_0508_T07R0401_00003
	goto _043E
	end

_04D7:
	hasenoughmoneyimmediate VAR_SPECIAL_RESULT, 10000
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _052E
	checkgivecoins VAR_SPECIAL_RESULT, 500
	snop
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0523
	submoneyimmediate 10000
	give_coins 500
	scrcmd_118 0
	update_money_box
	play_se SEQ_SE_DP_REGI
	wait_se SEQ_SE_DP_REGI
	npc_msg msg_0508_T07R0401_00003
	goto _043E
	end

_0523:
	npc_msg msg_0508_T07R0401_00005
	goto _0531
	end

_052E:
	npc_msg msg_0508_T07R0401_00004
_0531:
	wait_button_or_walk_away
	closemsg
	touchscreen_menu_show
	scrcmd_117
	hide_money_box
	script_overlay_cmd 3, 1
	releaseall
	end

scr_seq_T07R0401_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	script_overlay_cmd 3, 0
	goto_if_set FLAG_UNK_17C, _059B
	npc_msg msg_0508_T07R0401_00011
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _05AA
	checkgivecoins VAR_SPECIAL_RESULT, 18
	snop
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _05B9
	give_coins 18
	buffer_players_name 0
	npc_msg msg_0508_T07R0401_00012
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setflag FLAG_UNK_17C
_059B:
	npc_msg msg_0508_T07R0401_00013
	wait_button_or_walk_away
	closemsg
	releaseall
	script_overlay_cmd 3, 1
	end

_05AA:
	npc_msg msg_0508_T07R0401_00014
	wait_button_or_walk_away
	closemsg
	releaseall
	script_overlay_cmd 3, 1
	end

_05B9:
	npc_msg msg_0508_T07R0401_00015
	wait_button_or_walk_away
	closemsg
	releaseall
	script_overlay_cmd 3, 1
	end

scr_seq_T07R0401_001:
	simple_npc_msg msg_0508_T07R0401_00007
	end

scr_seq_T07R0401_002:
	simple_npc_msg msg_0508_T07R0401_00008
	end

scr_seq_T07R0401_003:
	simple_npc_msg msg_0508_T07R0401_00009
	end

scr_seq_T07R0401_004:
	simple_npc_msg msg_0508_T07R0401_00010
	end

scr_seq_T07R0401_006:
	simple_npc_msg msg_0508_T07R0401_00016
	end

scr_seq_T07R0401_007:
	simple_npc_msg msg_0508_T07R0401_00017
	end

scr_seq_T07R0401_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0508_T07R0401_00018
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T07R0401_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0508_T07R0401_00019
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
