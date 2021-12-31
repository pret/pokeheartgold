#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D17R1101.h"
#include "msgdata/msg/msg_0059_D17R1101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D17R1101_000
	scrdef scr_seq_D17R1101_001
	scrdef_end

scr_seq_D17R1101_000:
	checkflag FLAG_UNK_189
	gotoif FALSE, _001B
	clearflag FLAG_UNK_189
	end

_001B:
	checkflag FLAG_GAME_CLEAR
	gotoif FALSE, _00A5
	get_phone_book_rematch 37, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, _00A5
	scrcmd_147 37, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _0084
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, _0067
	clearflag FLAG_UNK_2CA
	goto _0082

_0067:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, _007E
	clearflag FLAG_UNK_2CA
	goto _0082

_007E:
	setflag FLAG_UNK_2CA
_0082:
	end

_0084:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, _009F
	clearflag FLAG_UNK_2CA
	goto _00A3

_009F:
	setflag FLAG_UNK_2CA
_00A3:
	end

_00A5:
	setflag FLAG_UNK_2CA
	end

scr_seq_D17R1101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_147 37, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _0159
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ge, _014E
	npc_msg msg_0059_D17R1101_00000
_00D6:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _00FA
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, _013D
	end

_00FA:
	buffer_players_name 0
	npc_msg msg_0059_D17R1101_00001
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number 37
	npc_msg msg_0059_D17R1101_00002
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	setflag FLAG_UNK_2CA
	hide_person 0
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

_013D:
	setvar VAR_TEMP_x4002, 1
	npc_msg msg_0059_D17R1101_00003
	waitbutton
	closemsg
	releaseall
	end

_014E:
	npc_msg msg_0059_D17R1101_00004
	goto _00D6
	.byte 0x02, 0x00
_0159:
	npc_msg msg_0059_D17R1101_00005
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _01BA
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _01C5
	npc_msg msg_0059_D17R1101_00006
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 20
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0x00
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg msg_0059_D17R1101_00007
	waitbutton
	closemsg
	releaseall
	end

_01BA:
	npc_msg msg_0059_D17R1101_00008
	waitbutton
	closemsg
	releaseall
	end

_01C5:
	npc_msg msg_0059_D17R1101_00009
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
