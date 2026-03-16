#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T22FS0101.h"
#include "msgdata/msg/msg_0557_T22FS0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T22FS0101_000
	scrdef scr_seq_T22FS0101_001
	scrdef scr_seq_T22FS0101_002
	scrdef scr_seq_T22FS0101_003
	scrdef scr_seq_T22FS0101_004
	scrdef_end

scr_seq_T22FS0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd std_mart_intro
	holdmsg
	setvar VAR_SPECIAL_x8004, 1
	callstd std_pokemart
	releaseall
	end

scr_seq_T22FS0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd std_mart_intro
	holdmsg
	setvar VAR_SPECIAL_x8004, 1
	callstd std_special_mart
	releaseall
	end

scr_seq_T22FS0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_06F, _0115
	buffer_players_name 0
	gender_msgbox msg_0557_T22FS0101_00002, msg_0557_T22FS0101_00003
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _00F7
_007D:
	get_party_count VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 6
	goto_if_eq _0106
	give_togepi_egg
	setflag FLAG_GOT_EGG_FROM_ELMS_ASSISTANT
	buffer_players_name 0
	npc_msg msg_0557_T22FS0101_00004
	play_fanfare SEQ_ME_TAMAGO_GET
	wait_fanfare
	gender_msgbox msg_0557_T22FS0101_00005, msg_0557_T22FS0101_00006
	closemsg
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _00C5
	apply_movement obj_T22FS0101_assistantm, _014C
	goto _00CD

_00C5:
	apply_movement obj_T22FS0101_assistantm, _0140
_00CD:
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	hide_person obj_T22FS0101_assistantm
	wait_se SEQ_SE_DP_KAIDAN2
	setflag FLAG_HIDE_VIOLET_SHOP_LAB_AIDE
	releaseall
	setvar VAR_SCENE_VIOLET_CITY_OW, 3
	clearflag FLAG_HIDE_VIOLET_KIMONO_GIRL
	clearflag FLAG_HIDE_ELMS_LAB_AIDE
	setvar VAR_SCENE_ELMS_LAB, 7
	end

_00F7:
	npc_msg msg_0557_T22FS0101_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	setflag FLAG_UNK_06F
	end

_0106:
	npc_msg msg_0557_T22FS0101_00007
	wait_button_or_walk_away
	closemsg
	releaseall
	setflag FLAG_UNK_06F
	end

_0115:
	buffer_players_name 0
	gender_msgbox msg_0557_T22FS0101_00009, msg_0557_T22FS0101_00010
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _007D
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _00F7
	end

	.balign 4, 0
_0140:
	WalkNormalWest 2
	WalkNormalSouth 3
	EndMovement

	.balign 4, 0
_014C:
	WalkNormalSouth 2
	WalkNormalWest 2
	WalkNormalSouth
	EndMovement

scr_seq_T22FS0101_003:
	simple_npc_msg msg_0557_T22FS0101_00000
	end

scr_seq_T22FS0101_004:
	simple_npc_msg msg_0557_T22FS0101_00001
	end
	.balign 4, 0
