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
	checkflag FLAG_UNK_189
	gotoif FALSE, _001F
	clearflag FLAG_UNK_189
	end

_001F:
	scrcmd_147 33, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _009E
	check_badge 15, VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif eq, _004D
	goto _0102
	.byte 0x02, 0x00
_004D:
	scrcmd_522 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 12
	gotoif ne, _0068
	clearflag FLAG_UNK_262
	goto _009C

_0068:
	comparevartovalue VAR_TEMP_x4000, 13
	gotoif ne, _007F
	clearflag FLAG_UNK_262
	goto _009C

_007F:
	comparevartovalue VAR_TEMP_x4000, 14
	gotoif ne, _0096
	clearflag FLAG_UNK_262
	goto _009C

_0096:
	goto _0102

_009C:
	end

_009E:
	get_phone_book_rematch 33, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, _0102
	scrcmd_522 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 17
	gotoif ne, _00CC
	clearflag FLAG_UNK_262
	goto _0100

_00CC:
	comparevartovalue VAR_TEMP_x4000, 18
	gotoif ne, _00E3
	clearflag FLAG_UNK_262
	goto _0100

_00E3:
	comparevartovalue VAR_TEMP_x4000, 19
	gotoif ne, _00FA
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
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _01B6
	comparevartovalue VAR_TEMP_x4003, 1
	gotoif ge, _01AB
	npc_msg msg_0047_D01R0101_00001
_0133:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0157
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, _019A
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
	fade_screen 6, 1, 0, 0x00
	wait_fade
	setflag FLAG_UNK_262
	hide_person obj_D01R0101_gsleader14
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0x00
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
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif ne, _01D8
	checkflag FLAG_UNK_165
	gotoif FALSE, _0292
	goto _020E

_01D8:
	comparevartovalue VAR_SPECIAL_x8004, 4
	gotoif ne, _01F6
	checkflag FLAG_UNK_165
	gotoif FALSE, _0292
	goto _020E

_01F6:
	comparevartovalue VAR_SPECIAL_x8004, 6
	gotoif ne, _020E
	checkflag FLAG_UNK_165
	gotoif FALSE, _0292
_020E:
	comparevartovalue VAR_TEMP_x4000, 55
	gotoif eq, _0357
	npc_msg msg_0047_D01R0101_00006
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _027C
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0287
	npc_msg msg_0047_D01R0101_00007
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 86
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0x00
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
	comparevartovalue VAR_TEMP_x4000, 111
	gotoif ne, _02A8
	npc_msg msg_0047_D01R0101_00015
	goto _02AF

_02A8:
	buffer_players_name 0
	gender_msgbox msg_0047_D01R0101_00011, msg_0047_D01R0101_00012
_02AF:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0346
	npc_msg msg_0047_D01R0101_00013
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_566
	get_party_selection VAR_SPECIAL_x800C
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, _0346
	scrcmd_470 11
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_472 32780
	comparevartovar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	gotoif ne, _0339
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
