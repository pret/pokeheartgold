#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D46R0101.h"
#include "msgdata/msg/msg_0132_D46R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D46R0101_000
	scrdef scr_seq_D46R0101_001
	scrdef_end

scr_seq_D46R0101_001:
	check_registered_phone_number PHONE_CONTACT_BUGSY, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 1
	goto_if_eq _0047
	goto_if_set FLAG_GAME_CLEAR, _0030
	goto _0047
	end

_0030:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 4
	goto_if_ne _0047
	clearflag FLAG_UNK_263
	end

_0047:
	setflag FLAG_UNK_263
	end

scr_seq_D46R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_TEMP_x4002, 1
	goto_if_ge _00DD
	npc_msg msg_0132_D46R0101_00000
_0065:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0089
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ge _00CC
	end

_0089:
	buffer_players_name 0
	npc_msg msg_0132_D46R0101_00001
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number PHONE_CONTACT_BUGSY
	npc_msg msg_0132_D46R0101_00002
	wait_button_or_walk_away
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	setflag FLAG_UNK_263
	hide_person obj_D46R0101_gsleader2
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_00CC:
	setvar VAR_TEMP_x4002, 1
	npc_msg msg_0132_D46R0101_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_00DD:
	npc_msg msg_0132_D46R0101_00004
	goto _0065
	end

	.balign 4, 0
