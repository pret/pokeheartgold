#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R1006.h"
#include "msgdata/msg/msg_0597_T25R1006.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T25R1006_000
	scrdef scr_seq_T25R1006_001
	scrdef scr_seq_T25R1006_002
	scrdef scr_seq_T25R1006_003
	scrdef scr_seq_T25R1006_004
	scrdef scr_seq_T25R1006_005
	scrdef scr_seq_T25R1006_006
	scrdef scr_seq_T25R1006_007
	scrdef_end

scr_seq_T25R1006_006:
	goto_if_unset FLAG_UNK_189, _0033
	clearflag FLAG_UNK_189
	end

_0033:
	goto_if_unset FLAG_GAME_CLEAR, _011D
	get_phone_book_rematch PHONE_CONTACT_WHITNEY, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_ne _011D
	check_registered_phone_number PHONE_CONTACT_WHITNEY, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 1
	goto_if_eq _00CC
	scrcmd_522 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 12
	goto_if_ne _007F
	clearflag FLAG_UNK_26F
	goto _00CA

_007F:
	compare VAR_TEMP_x4000, 13
	goto_if_ne _0096
	clearflag FLAG_UNK_26F
	goto _00CA

_0096:
	compare VAR_TEMP_x4000, 14
	goto_if_ne _00AD
	clearflag FLAG_UNK_26F
	goto _00CA

_00AD:
	compare VAR_TEMP_x4000, 15
	goto_if_ne _00C4
	clearflag FLAG_UNK_26F
	goto _00CA

_00C4:
	goto _011D

_00CA:
	end

_00CC:
	scrcmd_522 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 18
	goto_if_ne _00E7
	clearflag FLAG_UNK_26F
	goto _011B

_00E7:
	compare VAR_TEMP_x4000, 19
	goto_if_ne _00FE
	clearflag FLAG_UNK_26F
	goto _011B

_00FE:
	compare VAR_TEMP_x4000, 20
	goto_if_ne _0115
	clearflag FLAG_UNK_26F
	goto _011B

_0115:
	goto _011D

_011B:
	end

_011D:
	setflag FLAG_UNK_26F
	end

scr_seq_T25R1006_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	show_money_box 20, 2
	npc_msg msg_0597_T25R1006_00010
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0156
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _04A3
_0156:
	hasenoughmoneyimmediate VAR_SPECIAL_RESULT, 300
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _04D2
	submoneyimmediate 300
	update_money_box
	play_se SEQ_SE_DP_REGI
	wait_se SEQ_SE_DP_REGI
	npc_msg msg_0597_T25R1006_00011
	random VAR_SPECIAL_RESULT, 100
	compare VAR_SPECIAL_RESULT, 40
	goto_if_ge _01AD
	compare VAR_SPECIAL_RESULT, 4
	goto_if_ge _02B5
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ge _03AC
	end

_01AD:
	play_se SEQ_SE_GS_KUJI_ATARI
	buffer_int 0, 3
	npc_msg msg_0597_T25R1006_00012
	random VAR_SPECIAL_RESULT, 70
	compare VAR_SPECIAL_RESULT, 60
	goto_if_ge _021C
	compare VAR_SPECIAL_RESULT, 50
	goto_if_ge _022E
	compare VAR_SPECIAL_RESULT, 40
	goto_if_ge _0240
	compare VAR_SPECIAL_RESULT, 30
	goto_if_ge _0252
	compare VAR_SPECIAL_RESULT, 20
	goto_if_ge _0264
	compare VAR_SPECIAL_RESULT, 10
	goto_if_ge _0276
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ge _0288
	end

_021C:
	setvar VAR_SPECIAL_x8004, 155
	setvar VAR_SPECIAL_x8005, 1
	goto _0294

_022E:
	setvar VAR_SPECIAL_x8004, 150
	setvar VAR_SPECIAL_x8005, 1
	goto _0294

_0240:
	setvar VAR_SPECIAL_x8004, 151
	setvar VAR_SPECIAL_x8005, 1
	goto _0294

_0252:
	setvar VAR_SPECIAL_x8004, 152
	setvar VAR_SPECIAL_x8005, 1
	goto _0294

_0264:
	setvar VAR_SPECIAL_x8004, 153
	setvar VAR_SPECIAL_x8005, 1
	goto _0294

_0276:
	setvar VAR_SPECIAL_x8004, 156
	setvar VAR_SPECIAL_x8005, 1
	goto _0294

_0288:
	setvar VAR_SPECIAL_x8004, 149
	setvar VAR_SPECIAL_x8005, 1
_0294:
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _04B0
	callstd std_obtain_item_verbose
	closemsg
	hide_money_box
	releaseall
	end

_02B5:
	play_se SEQ_SE_GS_KUJI_ATARI
	buffer_int 0, 2
	npc_msg msg_0597_T25R1006_00012
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_ne _02E4
	setvar VAR_SPECIAL_x8004, 11
	setvar VAR_SPECIAL_x8005, 1
	goto _038B

_02E4:
	compare VAR_TEMP_x4000, 1
	goto_if_ne _0303
	setvar VAR_SPECIAL_x8004, 8
	setvar VAR_SPECIAL_x8005, 1
	goto _038B

_0303:
	compare VAR_TEMP_x4000, 2
	goto_if_ne _0322
	setvar VAR_SPECIAL_x8004, 9
	setvar VAR_SPECIAL_x8005, 1
	goto _038B

_0322:
	compare VAR_TEMP_x4000, 3
	goto_if_ne _0341
	setvar VAR_SPECIAL_x8004, 6
	setvar VAR_SPECIAL_x8005, 1
	goto _038B

_0341:
	compare VAR_TEMP_x4000, 4
	goto_if_ne _0360
	setvar VAR_SPECIAL_x8004, 15
	setvar VAR_SPECIAL_x8005, 1
	goto _038B

_0360:
	compare VAR_TEMP_x4000, 5
	goto_if_ne _037F
	setvar VAR_SPECIAL_x8004, 13
	setvar VAR_SPECIAL_x8005, 1
	goto _038B

_037F:
	setvar VAR_SPECIAL_x8004, 10
	setvar VAR_SPECIAL_x8005, 1
_038B:
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _04B0
	callstd std_obtain_item_verbose
	closemsg
	hide_money_box
	releaseall
	end

_03AC:
	play_se SEQ_SE_GS_KUJI_OOATARI
	buffer_int 0, 1
	npc_msg msg_0597_T25R1006_00012
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_ne _03DB
	setvar VAR_SPECIAL_x8004, 329
	setvar VAR_SPECIAL_x8005, 1
	goto _0482

_03DB:
	compare VAR_TEMP_x4000, 1
	goto_if_ne _03FA
	setvar VAR_SPECIAL_x8004, 392
	setvar VAR_SPECIAL_x8005, 1
	goto _0482

_03FA:
	compare VAR_TEMP_x4000, 2
	goto_if_ne _0419
	setvar VAR_SPECIAL_x8004, 418
	setvar VAR_SPECIAL_x8005, 1
	goto _0482

_0419:
	compare VAR_TEMP_x4000, 3
	goto_if_ne _0438
	setvar VAR_SPECIAL_x8004, 384
	setvar VAR_SPECIAL_x8005, 1
	goto _0482

_0438:
	compare VAR_TEMP_x4000, 4
	goto_if_ne _0457
	setvar VAR_SPECIAL_x8004, 387
	setvar VAR_SPECIAL_x8005, 1
	goto _0482

_0457:
	compare VAR_TEMP_x4000, 5
	goto_if_ne _0476
	setvar VAR_SPECIAL_x8004, 369
	setvar VAR_SPECIAL_x8005, 1
	goto _0482

_0476:
	setvar VAR_SPECIAL_x8004, 389
	setvar VAR_SPECIAL_x8005, 1
_0482:
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _04B0
	callstd std_obtain_item_verbose
	closemsg
	hide_money_box
	releaseall
	end

_04A3:
	npc_msg msg_0597_T25R1006_00014
	wait_button_or_walk_away
	closemsg
	hide_money_box
	releaseall
	end

_04B0:
	npc_msg msg_0597_T25R1006_00015
	closemsg
	addmoney 300
	update_money_box
	play_se SEQ_SE_DP_REGI
	wait_se SEQ_SE_DP_REGI
	npc_msg msg_0597_T25R1006_00017
	wait_button_or_walk_away
	closemsg
	hide_money_box
	releaseall
	end

_04D2:
	npc_msg msg_0597_T25R1006_00016
	wait_button_or_walk_away
	closemsg
	hide_money_box
	releaseall
	end

scr_seq_T25R1006_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_ne _0501
	npc_msg msg_0597_T25R1006_00018
	goto _0572

_0501:
	compare VAR_TEMP_x4000, 1
	goto_if_ne _0517
	npc_msg msg_0597_T25R1006_00019
	goto _0572

_0517:
	compare VAR_TEMP_x4000, 2
	goto_if_ne _052D
	npc_msg msg_0597_T25R1006_00020
	goto _0572

_052D:
	compare VAR_TEMP_x4000, 3
	goto_if_ne _0543
	npc_msg msg_0597_T25R1006_00021
	goto _0572

_0543:
	compare VAR_TEMP_x4000, 4
	goto_if_ne _0559
	npc_msg msg_0597_T25R1006_00022
	goto _0572

_0559:
	compare VAR_TEMP_x4000, 5
	goto_if_ne _056F
	npc_msg msg_0597_T25R1006_00023
	goto _0572

_056F:
	npc_msg msg_0597_T25R1006_00024
_0572:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25R1006_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_SCENE_ROCKET_TAKEOVER, 3
	goto_if_ne _0598
	npc_msg msg_0597_T25R1006_00003
	goto _059B

_0598:
	npc_msg msg_0597_T25R1006_00002
_059B:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25R1006_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_SCENE_ROCKET_TAKEOVER, 3
	goto_if_ne _05C1
	npc_msg msg_0597_T25R1006_00001
	goto _05C4

_05C1:
	npc_msg msg_0597_T25R1006_00000
_05C4:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25R1006_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_registered_phone_number PHONE_CONTACT_WHITNEY, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 1
	goto_if_eq _067A
	compare VAR_TEMP_x4002, 1
	goto_if_ge _066F
	npc_msg msg_0597_T25R1006_00025
_05F7:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _061B
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ge _065E
	end

_061B:
	buffer_players_name 0
	npc_msg msg_0597_T25R1006_00026
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number PHONE_CONTACT_WHITNEY
	npc_msg msg_0597_T25R1006_00027
	wait_button_or_walk_away
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	setflag FLAG_UNK_26F
	hide_person obj_T25R1006_gsleader3
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_065E:
	setvar VAR_TEMP_x4002, 1
	npc_msg msg_0597_T25R1006_00028
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_066F:
	npc_msg msg_0597_T25R1006_00029
	goto _05F7
	end

_067A:
	npc_msg msg_0597_T25R1006_00030
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _06DB
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _06E6
	npc_msg msg_0597_T25R1006_00031
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 15
	faceplayer
	lockall
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg msg_0597_T25R1006_00032
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_06DB:
	npc_msg msg_0597_T25R1006_00033
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_06E6:
	npc_msg msg_0597_T25R1006_00034
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25R1006_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0597_T25R1006_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25R1006_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0597_T25R1006_00005
	show_money_box 20, 2
	goto _0717

_0717:
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x8000
	menu_item_add 209, 255, 0
	menu_item_add 210, 255, 1
	menu_item_add 211, 255, 2
	menu_item_add 212, 255, 3
	menu_exec
	touchscreen_menu_show
	switch VAR_SPECIAL_x8000
	case 0, _077B
	case 1, _0787
	case 2, _0793
	npc_msg msg_0597_T25R1006_00009
	goto _08BE

_077B:
	setvar VAR_SPECIAL_x8001, 30
	goto _07D5

_0787:
	setvar VAR_SPECIAL_x8001, 31
	goto _07D5

_0793:
	setvar VAR_SPECIAL_x8001, 32
	goto _07D5

_079F:
	hasenoughmoneyimmediate VAR_SPECIAL_RESULT, 200
	return

_07A9:
	hasenoughmoneyimmediate VAR_SPECIAL_RESULT, 300
	return

_07B3:
	hasenoughmoneyimmediate VAR_SPECIAL_RESULT, 350
	return

_07BD:
	submoneyimmediate 200
	return

_07C5:
	submoneyimmediate 300
	return

_07CD:
	submoneyimmediate 350
	return

_07D5:
	compare VAR_SPECIAL_x8000, 0
	call_if_eq _079F
	compare VAR_SPECIAL_x8000, 1
	call_if_eq _07A9
	compare VAR_SPECIAL_x8000, 2
	call_if_eq _07B3
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _08A9
	hasspaceforitem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _08B2
	compare VAR_SPECIAL_x8000, 0
	call_if_eq _07BD
	compare VAR_SPECIAL_x8000, 1
	call_if_eq _07C5
	compare VAR_SPECIAL_x8000, 2
	call_if_eq _07CD
	update_money_box
	buffer_item_name 0, VAR_SPECIAL_x8001
	play_se SEQ_SE_DP_JIHANKI
	buffer_item_name 0, VAR_SPECIAL_x8001
	npc_msg msg_0597_T25R1006_00006
	giveitem_no_check VAR_SPECIAL_x8001, 1
	random VAR_SPECIAL_RESULT, 64
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _08A0
	play_se SEQ_SE_DP_JIHANKI
	buffer_item_name 0, VAR_SPECIAL_x8001
	npc_msg msg_0597_T25R1006_00007
	hasspaceforitem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _08B2
	callstd std_give_item_verbose
_08A0:
	npc_msg msg_0597_T25R1006_00005
	goto _0717

_08A9:
	npc_msg msg_0597_T25R1006_00008
	goto _08BE

_08B2:
	callstd std_bag_is_full
	closemsg
	hide_money_box
	releaseall
	end

_08BE:
	wait_button_or_walk_away
	closemsg
	hide_money_box
	releaseall
	end
	.balign 4, 0
