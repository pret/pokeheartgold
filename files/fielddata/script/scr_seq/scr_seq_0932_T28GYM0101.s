#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T28GYM0101.h"
#include "msgdata/msg/msg_0622_T28GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T28GYM0101_000
	scrdef scr_seq_T28GYM0101_001
	scrdef_end

scr_seq_T28GYM0101_001:
	checkflag FLAG_UNK_189
	gotoif FALSE, _001B
	clearflag FLAG_UNK_189
	end

_001B:
	get_phone_book_rematch 39, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, _00B8
	checkflag FLAG_GAME_CLEAR
	gotoif FALSE, _00B2
	scrcmd_147 39, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _00B2
	scrcmd_522 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, _0067
	setflag FLAG_UNK_2EE
	goto _00B0

_0067:
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, _007E
	setflag FLAG_UNK_2EE
	goto _00B0

_007E:
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif ne, _0095
	setflag FLAG_UNK_2EE
	goto _00B0

_0095:
	comparevartovalue VAR_TEMP_x4000, 9
	gotoif ne, _00AC
	setflag FLAG_UNK_2EE
	goto _00B0

_00AC:
	clearflag FLAG_UNK_2EE
_00B0:
	end

_00B2:
	clearflag FLAG_UNK_2EE
	end

_00B8:
	setflag FLAG_UNK_2EE
	end

scr_seq_T28GYM0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 6, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0178
	npc_msg msg_0622_T28GYM0101_00000
	closemsg
	trainer_battle TRAINER_LEADER_PRYCE_PRYCE, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0172
	settrainerflag TRAINER_BOARDER_DEANDRE
	settrainerflag TRAINER_BOARDER_GERARDO
	settrainerflag TRAINER_SKIER_JILL
	settrainerflag TRAINER_SKIER_DIANA
	settrainerflag TRAINER_BOARDER_PATTON
	npc_msg msg_0622_T28GYM0101_00001
	give_badge 6
	addvar VAR_UNK_4134, 1
	add_special_game_stat 22
	comparevartovalue VAR_UNK_4134, 3
	gotoif ne, _012F
	setvar VAR_UNK_4077, 1
_012F:
	buffer_players_name 0
	npc_msg msg_0622_T28GYM0101_00002
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	npc_msg msg_0622_T28GYM0101_00003
	goto_if_no_item_space ITEM_TM07, 1, _018E
	callstd std_give_item_verbose
	setflag FLAG_UNK_0D2
	npc_msg msg_0622_T28GYM0101_00004
	waitbutton
	closemsg
	releaseall
	end

_0172:
	white_out
	releaseall
	end

_0178:
	checkflag FLAG_GAME_CLEAR
	gotoif TRUE, _0198
	npc_msg msg_0622_T28GYM0101_00005
	waitbutton
	closemsg
	releaseall
	end

_018E:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_0198:
	npc_msg msg_0622_T28GYM0101_00006
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _01F9
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0204
	npc_msg msg_0622_T28GYM0101_00007
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 40
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0x00
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg msg_0622_T28GYM0101_00008
	waitbutton
	closemsg
	releaseall
	end

_01F9:
	npc_msg msg_0622_T28GYM0101_00009
	waitbutton
	closemsg
	releaseall
	end

_0204:
	npc_msg msg_0622_T28GYM0101_00010
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
