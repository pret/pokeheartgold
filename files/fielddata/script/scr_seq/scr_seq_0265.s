#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0265.h"
#include "msgdata/msg/msg_0439.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0265_000
	scrdef scr_seq_0265_001
	scrdef_end

scr_seq_0265_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	buffer_day_care_mon_nicks
	get_day_care_state VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0094
	compare VAR_SPECIAL_RESULT, 2
	goto_if_eq _0151
	compare VAR_SPECIAL_RESULT, 3
	goto_if_eq _015E
	compare VAR_UNK_408E, 4
	goto_if_eq _0057
	npc_msg msg_0439_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0057:
	buffer_players_name 0
	gender_msgbox msg_0439_00013, msg_0439_00014
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0082
	setflag FLAG_UNK_99E
	npc_msg msg_0439_00015
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0082:
	clearflag FLAG_UNK_99E
	scrcmd_149 5
	npc_msg msg_0439_00016
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0094:
	scrcmd_149 5
	npc_msg msg_0439_00001
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _00F6
	npc_msg msg_0439_00010
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _00F6
	touchscreen_menu_show
	clearflag FLAG_UNK_067
	reset_day_care_egg
	compare VAR_UNK_408E, 3
	goto_if_ne _00EB
	npc_msg msg_0439_00012
	setvar VAR_UNK_408E, 4
	setflag FLAG_UNK_992
	goto _0057

_00EB:
	npc_msg msg_0439_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_00F6:
	touchscreen_menu_show
	get_party_count VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 6
	goto_if_ne _0114
	npc_msg msg_0439_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0114:
	buffer_players_name 0
	npc_msg msg_0439_00005
	play_fanfare SEQ_ME_TAMAGO_GET
	wait_fanfare
	give_day_care_egg
	clearflag FLAG_UNK_067
	compare VAR_UNK_408E, 3
	goto_if_ne _0146
	npc_msg msg_0439_00011
	setvar VAR_UNK_408E, 4
	setflag FLAG_UNK_992
	goto _0057

_0146:
	npc_msg msg_0439_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0151:
	buffer_day_care_mon_nicks
	npc_msg msg_0439_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_015E:
	buffer_day_care_mon_nicks
	npc_msg msg_0439_00009
	get_day_care_compatibility VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0196
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _01BD
	compare VAR_SPECIAL_RESULT, 2
	goto_if_eq _01E4
	goto _020B
	.byte 0x02, 0x00
_0196:
	compare VAR_UNK_408E, 4
	goto_if_ne _01B2
	npc_msg msg_0439_00047
	goto _0057
	.byte 0x16, 0x00, 0x03, 0x00
	.byte 0x00, 0x00
_01B2:
	npc_msg msg_0439_00017
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_01BD:
	compare VAR_UNK_408E, 4
	goto_if_ne _01D9
	npc_msg msg_0439_00048
	goto _0057
	.byte 0x16, 0x00, 0x03, 0x00, 0x00, 0x00
_01D9:
	npc_msg msg_0439_00018
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_01E4:
	compare VAR_UNK_408E, 4
	goto_if_ne _0200
	npc_msg msg_0439_00049
	goto _0057
	.byte 0x16, 0x00, 0x03, 0x00, 0x00, 0x00
_0200:
	npc_msg msg_0439_00019
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_020B:
	compare VAR_UNK_408E, 4
	goto_if_ne _0227
	npc_msg msg_0439_00050
	goto _0057
	.byte 0x16, 0x00, 0x03, 0x00, 0x00, 0x00
_0227:
	npc_msg msg_0439_00020
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_0265_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	show_money_box 20, 2
	get_day_care_state VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _042E
	compare VAR_SPECIAL_RESULT, 2
	goto_if_eq _0455
	compare VAR_SPECIAL_RESULT, 3
	goto_if_eq _0620
	npc_msg msg_0439_00021
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0290
	touchscreen_menu_show
	npc_msg msg_0439_00026
	wait_button_or_walk_away
	closemsg
	hide_money_box
	releaseall
	end

_0290:
	party_count_not_egg VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _03FB
	count_alive_mons_and_pc VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 2
	goto_if_eq _041F
	npc_msg msg_0439_00022
	closemsg
	hide_money_box
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	setvar VAR_SPECIAL_RESULT, 0
_02CB:
	scrcmd_551 VAR_SPECIAL_RESULT
	scrcmd_552 VAR_SPECIAL_x8000, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _02F4
	choose_move_ui 0, VAR_SPECIAL_x8000, 0
	get_move_selection 0, VAR_SPECIAL_RESULT
	goto _02CB

_02F4:
	compare VAR_SPECIAL_x8000, 255
	goto_if_eq _03C6
	day_care_sanitize_mon VAR_SPECIAL_x8000, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 255
	goto_if_eq _03A1
	get_partymon_species VAR_SPECIAL_x8000, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _03B1
	count_alive_mons VAR_SPECIAL_RESULT, VAR_SPECIAL_x8000
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _040A
	put_mon_in_day_care VAR_SPECIAL_x8000
	call _038B
	get_tail_day_care_mon_species_and_nick VAR_SPECIAL_x8001
	setflag FLAG_UNK_068
	get_day_care_state VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 2
	goto_if_eq _0363
	goto _0374

_0363:
	play_cry VAR_SPECIAL_x8001, 0
	npc_msg msg_0439_00023
	wait_cry
	goto _03DB

_0374:
	touchscreen_menu_show
	play_cry VAR_SPECIAL_x8001, 0
	npc_msg msg_0439_00041
	wait_button_or_walk_away
	closemsg
	wait_cry
	hide_money_box
	releaseall
	end

_038B:
	scrcmd_150
	show_money_box 20, 2
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	return

_03A1:
	call _038B
	touchscreen_menu_show
	hide_money_box
	callstd std_bag_is_full_griseous_orb
	end

_03B1:
	call _038B
	touchscreen_menu_show
	npc_msg msg_0439_00040
	wait_button_or_walk_away
	closemsg
	hide_money_box
	releaseall
	end

_03C6:
	call _038B
	touchscreen_menu_show
_03CE:
	npc_msg msg_0439_00029
	wait_button_or_walk_away
	closemsg
	hide_money_box
	releaseall
	end

_03DB:
	npc_msg msg_0439_00024
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0290
	touchscreen_menu_show
	goto _03CE
	.byte 0x02, 0x00
_03FB:
	touchscreen_menu_show
	npc_msg msg_0439_00036
	wait_button_or_walk_away
	closemsg
	hide_money_box
	releaseall
	end

_040A:
	call _038B
	touchscreen_menu_show
	npc_msg msg_0439_00038
	wait_button_or_walk_away
	closemsg
	hide_money_box
	releaseall
	end

_041F:
	touchscreen_menu_show
	npc_msg msg_0439_00039
	wait_button_or_walk_away
	closemsg
	hide_money_box
	releaseall
	end

_042E:
	npc_msg msg_0439_00025
	wait_button_or_walk_away
	closemsg
	hide_money_box
	releaseall
	end

_043B:
	npc_msg msg_0439_00031
	return

_0440:
	buffer_day_care_mon_growth VAR_SPECIAL_RESULT, VAR_SPECIAL_x8000
	compare VAR_SPECIAL_RESULT, 0
	call_if_ne _043B
	return

_0455:
	npc_msg msg_0439_00030
	setvar VAR_SPECIAL_x8000, 0
	call _0440
	npc_msg msg_0439_00024
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0290
	npc_msg msg_0439_00037
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0498
	touchscreen_menu_show
	goto _03CE

_0498:
	get_party_count VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 6
	goto_if_eq _05DC
	get_day_care_state VAR_SPECIAL_RESULT
	setvar VAR_SPECIAL_x8001, 0
	compare VAR_SPECIAL_RESULT, 2
	goto_if_eq _0520
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x8001
	buffer_day_care_mon_stats 0, 1, 2, 0
	menu_item_add 136, 255, 0
	buffer_day_care_mon_stats 0, 1, 2, 1
	menu_item_add 137, 255, 1
	menu_item_add 138, 255, 2
	menu_exec
	switch VAR_SPECIAL_x8001
	case 0, _0520
	case 1, _0520
	touchscreen_menu_show
	goto _03CE

_0520:
	buffer_day_care_withdraw_cost VAR_SPECIAL_x8004, VAR_SPECIAL_x8001
	npc_msg msg_0439_00033
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0544
	touchscreen_menu_show
	goto _03CE

_0544:
	hasenoughmoneyvar VAR_SPECIAL_RESULT, VAR_SPECIAL_x8004
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0566
	touchscreen_menu_show
	npc_msg msg_0439_00027
	wait_button_or_walk_away
	closemsg
	hide_money_box
	releaseall
	end

_0566:
	retrieve_day_care_mon VAR_SPECIAL_x8002, VAR_SPECIAL_x8001
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	update_day_care_mon_objects
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	submoneyvar VAR_SPECIAL_x8004
	update_money_box
	play_se SEQ_SE_DP_REGI
	wait_se SEQ_SE_DP_REGI
	npc_msg msg_0439_00034
	play_cry VAR_SPECIAL_x8002, 0
	buffer_players_name 1
	npc_msg msg_0439_00035
	wait_cry
	get_day_care_state VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 2
	goto_if_eq _05BE
	touchscreen_menu_show
	goto _03CE

_05BE:
	npc_msg msg_0439_00028
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0498
	touchscreen_menu_show
	goto _03CE

_05DC:
	touchscreen_menu_show
	npc_msg msg_0439_00032
	wait_button_or_walk_away
	closemsg
	hide_money_box
	releaseall
	end
	.byte 0x00, 0x3e, 0x00, 0x03, 0x00
	.byte 0x02, 0x00, 0x01, 0x00, 0x3e, 0x00, 0x03, 0x00, 0x03, 0x00, 0x01, 0x00, 0x3e, 0x00, 0x03, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x0c, 0x00, 0x02, 0x00, 0x45, 0x00, 0x01, 0x00, 0x3f, 0x00, 0x03, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x46, 0x00, 0x01, 0x00, 0x0d, 0x00, 0x02, 0x00, 0xfe, 0x00, 0x00, 0x00
_0620:
	npc_msg msg_0439_00030
	setvar VAR_SPECIAL_x8000, 0
	call _0440
	setvar VAR_SPECIAL_x8000, 1
	call _0440
	npc_msg msg_0439_00037
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0498
	touchscreen_menu_show
	npc_msg msg_0439_00029
	wait_button_or_walk_away
	closemsg
	hide_money_box
	releaseall
	end
	.byte 0x49, 0x00, 0xdc, 0x05, 0x60, 0x00, 0x2d, 0x00, 0x2a, 0x71, 0x01, 0x35, 0x00, 0x72, 0x00, 0x61
	.byte 0x00, 0x02, 0x00, 0x00
	.balign 4, 0
