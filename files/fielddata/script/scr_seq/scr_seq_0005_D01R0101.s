#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D01R0101.h"
#include "msgdata/msg/msg_0047_D01R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D01R0101_000
	scrdef scr_seq_D01R0101_001
	scrdef scr_seq_D01R0101_002
	scrdef_end

scr_seq_D01R0101_000:
	goto_if_unset FLAG_UNK_189, _001F
	clearflag FLAG_UNK_189
	end

_001F:
	check_registered_phone_number PHONE_CONTACT_BROCK, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 1
	goto_if_eq _009E
	check_badge BADGE_EARTH, VAR_TEMP_x4002
	compare VAR_TEMP_x4002, 1
	goto_if_eq _004D
	goto _0102
	.byte 0x02, 0x00
_004D:
	scrcmd_522 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 12
	goto_if_ne _0068
	clearflag FLAG_UNK_262
	goto _009C

_0068:
	compare VAR_TEMP_x4000, 13
	goto_if_ne _007F
	clearflag FLAG_UNK_262
	goto _009C

_007F:
	compare VAR_TEMP_x4000, 14
	goto_if_ne _0096
	clearflag FLAG_UNK_262
	goto _009C

_0096:
	goto _0102

_009C:
	end

_009E:
	get_phone_book_rematch PHONE_CONTACT_BROCK, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_ne _0102
	scrcmd_522 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 17
	goto_if_ne _00CC
	clearflag FLAG_UNK_262
	goto _0100

_00CC:
	compare VAR_TEMP_x4000, 18
	goto_if_ne _00E3
	clearflag FLAG_UNK_262
	goto _0100

_00E3:
	compare VAR_TEMP_x4000, 19
	goto_if_ne _00FA
	clearflag FLAG_UNK_262
	goto _0100

_00FA:
	goto _0102

_0100:
	end

_0102:
	setflag FLAG_UNK_262
	end

scr_seq_D01R0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_registered_phone_number PHONE_CONTACT_BROCK, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 1
	goto_if_eq _01B6
	compare VAR_TEMP_x4003, 1
	goto_if_ge _01AB
	npc_msg msg_0047_D01R0101_00001
_0133:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0157
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ge _019A
	end

_0157:
	buffer_players_name 0
	npc_msg msg_0047_D01R0101_00002
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number PHONE_CONTACT_BROCK
	npc_msg msg_0047_D01R0101_00003
	wait_button_or_walk_away
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	setflag FLAG_UNK_262
	hide_person obj_D01R0101_gsleader14
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_019A:
	setvar VAR_TEMP_x4003, 1
	npc_msg msg_0047_D01R0101_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_01AB:
	npc_msg msg_0047_D01R0101_00005
	goto _0133
	.byte 0x02, 0x00
_01B6:
	get_weekday VAR_SPECIAL_x8004
	compare VAR_SPECIAL_x8004, 1
	goto_if_ne _01D8
	goto_if_unset FLAG_TRADE_BROCK_BONSLY_RHYHORN, _0292
	goto _020E

_01D8:
	compare VAR_SPECIAL_x8004, 4
	goto_if_ne _01F6
	goto_if_unset FLAG_TRADE_BROCK_BONSLY_RHYHORN, _0292
	goto _020E

_01F6:
	compare VAR_SPECIAL_x8004, 6
	goto_if_ne _020E
	goto_if_unset FLAG_TRADE_BROCK_BONSLY_RHYHORN, _0292
_020E:
	compare VAR_TEMP_x4000, 55
	goto_if_eq _0357
	npc_msg msg_0047_D01R0101_00006
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _027C
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0287
	npc_msg msg_0047_D01R0101_00007
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 86
	faceplayer
	lockall
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg msg_0047_D01R0101_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_027C:
	npc_msg msg_0047_D01R0101_00009
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0287:
	npc_msg msg_0047_D01R0101_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0292:
	compare VAR_TEMP_x4000, 111
	goto_if_ne _02A8
	npc_msg msg_0047_D01R0101_00015
	goto _02AF

_02A8:
	buffer_players_name 0
	gender_msgbox msg_0047_D01R0101_00011, msg_0047_D01R0101_00012
_02AF:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0346
	npc_msg msg_0047_D01R0101_00013
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_566
	get_party_selection VAR_SPECIAL_RESULT
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_SPECIAL_RESULT, 255
	goto_if_eq _0346
	load_npc_trade 11
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	npc_trade_get_req_species VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	goto_if_ne _0339
	npc_trade_exec VAR_SPECIAL_x8004
	npc_trade_end
	set_mon_move VAR_SPECIAL_x8004, 0, MOVE_THUNDER_FANG
	setflag FLAG_TRADE_BROCK_BONSLY_RHYHORN
	setvar VAR_TEMP_x4000, 55
	npc_msg msg_0047_D01R0101_00016
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0339:
	npc_trade_end
	npc_msg msg_0047_D01R0101_00018
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0346:
	npc_msg msg_0047_D01R0101_00014
	wait_button_or_walk_away
	closemsg
	releaseall
	setvar VAR_TEMP_x4000, 111
	end

_0357:
	npc_msg msg_0047_D01R0101_00017
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D01R0101_002:
	simple_npc_msg msg_0047_D01R0101_00000
	end
	.balign 4, 0
