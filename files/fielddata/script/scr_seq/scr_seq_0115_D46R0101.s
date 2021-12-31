#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D46R0101.h"
#include "msgdata/msg/msg_0132_D46R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D46R0101_000
	scrdef scr_seq_D46R0101_001
	scrdef_end

scr_seq_D46R0101_001:
	scrcmd_147 34, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _0047
	checkflag FLAG_GAME_CLEAR
	gotoif TRUE, _0030
	goto _0047
	.byte 0x02, 0x00
_0030:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, _0047
	clearflag FLAG_UNK_263
	end

_0047:
	setflag FLAG_UNK_263
	end

scr_seq_D46R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ge, _00DD
	npc_msg msg_0132_D46R0101_00000
_0065:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0089
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, _00CC
	end

_0089:
	buffer_players_name 0
	npc_msg msg_0132_D46R0101_00001
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number 34
	npc_msg msg_0132_D46R0101_00002
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	setflag FLAG_UNK_263
	hide_person obj_D46R0101_gsleader2
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

_00CC:
	setvar VAR_TEMP_x4002, 1
	npc_msg msg_0132_D46R0101_00003
	waitbutton
	closemsg
	releaseall
	end

_00DD:
	npc_msg msg_0132_D46R0101_00004
	goto _0065
	.byte 0x02, 0x00
	.balign 4, 0
