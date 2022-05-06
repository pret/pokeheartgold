#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11R0701.h"
#include "msgdata/msg/msg_0537_T11R0701.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T11R0701_000
	scrdef scr_seq_T11R0701_001
	scrdef scr_seq_T11R0701_002
	scrdef scr_seq_T11R0701_003
	scrdef scr_seq_T11R0701_004
	scrdef scr_seq_T11R0701_005
	scrdef_end

scr_seq_T11R0701_002:
	setvar VAR_TEMP_x4008, 0
	setvar VAR_TEMP_x4009, 0
	compare VAR_UNK_4130, 3
	goto_if_eq _0046
	player_has_species VAR_TEMP_x4000, SPECIES_ROTOM
	compare VAR_TEMP_x4000, 1
	goto_if_eq _00AB
_0046:
	setvar VAR_TEMP_x4009, 1
	clearflag FLAG_UNK_281
	clearflag FLAG_UNK_282
	goto_if_set FLAG_TRADE_STEVEN_FORRETRESS_BELDUM, _0099
	compare VAR_UNK_4130, 4
	goto_if_eq _0099
	compare VAR_UNK_4130, 1
	goto_if_le _0099
	compare VAR_UNK_40FD, 0
	goto_if_eq _0099
	clearflag FLAG_HIDE_SAFFRON_CITY_STEVEN
	compare VAR_UNK_4130, 5
	call_if_eq _00A5
	end

_0099:
	setflag FLAG_HIDE_SAFFRON_CITY_STEVEN
	call _00C3
	end

_00A5:
	setflag FLAG_HIDE_STEVEN_IN_HOUSE_AFTER_LATIS
	return

_00AB:
	setflag FLAG_UNK_0A0
	setflag FLAG_UNK_281
	setflag FLAG_UNK_282
	setflag FLAG_HIDE_SAFFRON_CITY_STEVEN
	call _00C3
	end

_00C3:
	setvar VAR_TEMP_x4008, 1
	return

scr_seq_T11R0701_005:
	compare VAR_TEMP_x4009, 1
	goto_if_ne _00E0
	move_warp 1, 23, 2
_00E0:
	compare VAR_TEMP_x4008, 0
	goto_if_ne _0106
	compare VAR_UNK_4130, 3
	goto_if_gt _0106
	move_person_facing obj_T11R0701_daigo, 22, 0, 8, DIR_NORTH
_0106:
	end

scr_seq_T11R0701_000:
	simple_npc_msg msg_0537_T11R0701_00000
	end

scr_seq_T11R0701_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_130, _015A
	npc_msg msg_0537_T11R0701_00001
	goto_if_no_item_space ITEM_UPGRADE, 1, _0165
	callstd std_give_item_verbose
	setflag FLAG_UNK_130
_015A:
	npc_msg msg_0537_T11R0701_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0165:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_T11R0701_004:
	goto_if_set FLAG_GOT_HOENN_STARTER_FROM_STEVEN, _03E8
	compare VAR_UNK_4130, 3
	goto_if_eq _039B
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_UNK_4130, 3
	npc_msg msg_0537_T11R0701_00014
	closemsg
	get_player_facing VAR_TEMP_x4002
	compare VAR_TEMP_x4002, 0
	goto_if_ne _01B7
	apply_movement obj_T11R0701_daigo, _03AC
	goto _01DA

_01B7:
	compare VAR_TEMP_x4002, 2
	goto_if_ne _01D2
	apply_movement obj_T11R0701_daigo, _03BC
	goto _01DA

_01D2:
	apply_movement obj_T11R0701_daigo, _03B4
_01DA:
	wait_movement
	apply_movement obj_T11R0701_daigo, _03C4
	wait_movement
	npc_msg msg_0537_T11R0701_00015
	compare VAR_TEMP_x4002, 0
	goto_if_ne _0204
	apply_movement obj_T11R0701_daigo, _03AC
	goto _0227

_0204:
	compare VAR_TEMP_x4002, 2
	goto_if_ne _021F
	apply_movement obj_T11R0701_daigo, _03BC
	goto _0227

_021F:
	apply_movement obj_T11R0701_daigo, _03B4
_0227:
	wait_movement
	npc_msg msg_0537_T11R0701_00016
_022C:
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_x8004
	menu_item_add 17, 255, 0
	menu_item_add 18, 255, 1
	menu_item_add 19, 255, 2
	menu_item_add 27, 255, 3
	menu_exec
	touchscreen_menu_show
	switch VAR_SPECIAL_x8004
	case 3, _0346
	get_party_count VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 6
	goto_if_eq _033B
	compare VAR_SPECIAL_x8004, 0
	goto_if_ne _0297
	setvar VAR_SPECIAL_x8004, 252
	goto _02B6

_0297:
	compare VAR_SPECIAL_x8004, 1
	goto_if_ne _02B0
	setvar VAR_SPECIAL_x8004, 255
	goto _02B6

_02B0:
	setvar VAR_SPECIAL_x8004, 258
_02B6:
	buffer_species_name 1, VAR_SPECIAL_x8004, 0, 0
	buffer_players_name 0
	npc_msg msg_0537_T11R0701_00020
	play_fanfare SEQ_ME_POKEGET
	npc_msg msg_0537_T11R0701_00021
	wait_fanfare
	give_mon VAR_SPECIAL_x8004, 5, 0, 0, 0, VAR_SPECIAL_RESULT
	touchscreen_menu_hide
	npc_msg msg_0537_T11R0701_00025
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0351
	touchscreen_menu_show
_02F3:
	npc_msg msg_0537_T11R0701_00022
	closemsg
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _0317
	apply_movement obj_T11R0701_daigo, _03DC
	goto _031F

_0317:
	apply_movement obj_T11R0701_daigo, _03CC
_031F:
	wait_movement
	hide_person obj_T11R0701_daigo
	setflag FLAG_HIDE_SAFFRON_CITY_STEVEN
	setflag FLAG_GOT_HOENN_STARTER_FROM_STEVEN
	setvar VAR_UNK_4130, 4
	clearflag FLAG_HIDE_STEVEN_IN_HOUSE_AFTER_LATIS
	releaseall
	end

_033B:
	npc_msg msg_0537_T11R0701_00023
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0346:
	npc_msg msg_0537_T11R0701_00028
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0351:
	closemsg
	get_party_count VAR_SPECIAL_RESULT
	subvar VAR_SPECIAL_RESULT, 1
	setvar VAR_TEMP_x4000, 0
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_815 0
	nickname_input VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_TEMP_x4000, 1
	goto_if_eq _02F3
	npc_msg msg_0537_T11R0701_00026
	goto _02F3

_039B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0537_T11R0701_00024
	goto _022C


_03AC:
	step 33, 1
	step_end

_03B4:
	step 34, 1
	step_end

_03BC:
	step 35, 1
	step_end

_03C4:
	step 75, 1
	step_end

_03CC:
	step 14, 2
	step 13, 3
	step 14, 8
	step_end

_03DC:
	step 13, 3
	step 14, 10
	step_end
_03E8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_UNK_4130, 6
	compare VAR_TEMP_x400A, 77
	goto_if_ne _040C
	npc_msg msg_0537_T11R0701_00008
	goto _0415

_040C:
	npc_msg msg_0537_T11R0701_00007
	setvar VAR_TEMP_x400A, 77
_0415:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _04EA
	npc_msg msg_0537_T11R0701_00009
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_566
	get_party_selection VAR_SPECIAL_RESULT
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_SPECIAL_RESULT, 255
	goto_if_eq _04EA
	load_npc_trade 12
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	mon_get_friendship VAR_TEMP_x4002, VAR_SPECIAL_x8004
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	npc_trade_get_req_species VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	goto_if_ne _04F5
	npc_trade_exec VAR_SPECIAL_x8004
	npc_trade_end
	setflag FLAG_TRADE_STEVEN_FORRETRESS_BELDUM
	compare VAR_TEMP_x4002, 200
	goto_if_lt _04A2
	npc_msg msg_0537_T11R0701_00013
	goto _04A5

_04A2:
	npc_msg msg_0537_T11R0701_00012
_04A5:
	closemsg
	get_player_facing VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_ne _04C6
	apply_movement obj_T11R0701_daigo, _0504
	goto _04CE

_04C6:
	apply_movement obj_T11R0701_daigo, _051C
_04CE:
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	hide_person obj_T11R0701_daigo
	setflag FLAG_HIDE_SAFFRON_CITY_STEVEN
	setvar VAR_UNK_4130, 7
	releaseall
	end

_04EA:
	npc_msg msg_0537_T11R0701_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_04F5:
	npc_trade_end
	npc_msg msg_0537_T11R0701_00011
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00, 0x00

_0504:
	step 14, 2
	step 13, 5
	step 14, 1
	step 13, 1
	step 69, 1
	step_end

_051C:
	step 13, 5
	step 14, 3
	step 13, 1
	step 69, 1
	step_end
scr_seq_T11R0701_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0537_T11R0701_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
