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
	scrcmd_147 33, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 1
	goto_if_eq _009E
	check_badge 15, VAR_TEMP_x4002
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
	get_phone_book_rematch 33, VAR_TEMP_x4001
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
	scrcmd_147 33, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 1
	goto_if_eq _01B6
	compare VAR_TEMP_x4003, 1
	goto_if_ge _01AB
	npc_msg msg_0047_D01R0101_00001
_0133:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	compare VAR_SPECIAL_x800C, 0
	goto_if_eq _0157
	compare VAR_SPECIAL_x800C, 1
	goto_if_ge _019A
	end

_0157:
	buffer_players_name 0
	npc_msg msg_0047_D01R0101_00002
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number 33
	npc_msg msg_0047_D01R0101_00003
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0x0000
	wait_fade
	setflag FLAG_UNK_262
	hide_person obj_D01R0101_gsleader14
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0x0000
	wait_fade
	releaseall
	end

_019A:
	setvar VAR_TEMP_x4003, 1
	npc_msg msg_0047_D01R0101_00004
	waitbutton
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
	goto_if_unset FLAG_UNK_165, _0292
	goto _020E

_01D8:
	compare VAR_SPECIAL_x8004, 4
	goto_if_ne _01F6
	goto_if_unset FLAG_UNK_165, _0292
	goto _020E

_01F6:
	compare VAR_SPECIAL_x8004, 6
	goto_if_ne _020E
	goto_if_unset FLAG_UNK_165, _0292
_020E:
	compare VAR_TEMP_x4000, 55
	goto_if_eq _0357
	npc_msg msg_0047_D01R0101_00006
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	compare VAR_SPECIAL_x800C, 1
	goto_if_eq _027C
	photo_album_is_full VAR_SPECIAL_x800C
	compare VAR_SPECIAL_x800C, 1
	goto_if_eq _0287
	npc_msg msg_0047_D01R0101_00007
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x0000
	wait_fade
	cameron_photo 86
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0x0000
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg msg_0047_D01R0101_00008
	waitbutton
	closemsg
	releaseall
	end

_027C:
	npc_msg msg_0047_D01R0101_00009
	waitbutton
	closemsg
	releaseall
	end

_0287:
	npc_msg msg_0047_D01R0101_00010
	waitbutton
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
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	compare VAR_SPECIAL_x800C, 1
	goto_if_eq _0346
	npc_msg msg_0047_D01R0101_00013
	closemsg
	fade_screen 6, 1, 0, 0x0000
	wait_fade
	scrcmd_566
	get_party_selection VAR_SPECIAL_x800C
	scrcmd_150
	fade_screen 6, 1, 1, 0x0000
	wait_fade
	compare VAR_SPECIAL_x800C, 255
	goto_if_eq _0346
	scrcmd_470 11
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_472 32780
	compare VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	goto_if_ne _0339
	scrcmd_473 32772
	scrcmd_474
	set_mon_move VAR_SPECIAL_x8004, 0, MOVE_THUNDER_FANG
	setflag FLAG_UNK_165
	setvar VAR_TEMP_x4000, 55
	npc_msg msg_0047_D01R0101_00016
	waitbutton
	closemsg
	releaseall
	end

_0339:
	scrcmd_474
	npc_msg msg_0047_D01R0101_00018
	waitbutton
	closemsg
	releaseall
	end

_0346:
	npc_msg msg_0047_D01R0101_00014
	waitbutton
	closemsg
	releaseall
	setvar VAR_TEMP_x4000, 111
	end

_0357:
	npc_msg msg_0047_D01R0101_00017
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D01R0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0047_D01R0101_00000
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
