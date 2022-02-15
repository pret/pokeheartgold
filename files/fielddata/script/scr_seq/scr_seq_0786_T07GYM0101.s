#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07GYM0101.h"
#include "msgdata/msg/msg_0492_T07GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T07GYM0101_000
	scrdef scr_seq_T07GYM0101_001
	scrdef scr_seq_T07GYM0101_002
	scrdef_end

scr_seq_T07GYM0101_002:
	get_phone_book_rematch PHONE_CONTACT_ERIKA, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_ne _0107
	check_registered_phone_number PHONE_CONTACT_ERIKA, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 1
	goto_if_eq _00DE
	check_badge 15, VAR_TEMP_x4002
	compare VAR_TEMP_x4002, 1
	goto_if_eq _004F
	goto _0101
	.byte 0x02, 0x00
_004F:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 6
	goto_if_ne _006C
	goto _008D
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
_006C:
	compare VAR_TEMP_x4000, 0
	goto_if_ne _0085
	goto _008D
	.byte 0x16
	.byte 0x00, 0x06, 0x00, 0x00, 0x00
_0085:
	goto _0101
	.byte 0x02, 0x00
_008D:
	scrcmd_522 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 14
	goto_if_ne _00A8
	setflag FLAG_UNK_2F2
	goto _00DC

_00A8:
	compare VAR_TEMP_x4000, 15
	goto_if_ne _00BF
	setflag FLAG_UNK_2F2
	goto _00DC

_00BF:
	compare VAR_TEMP_x4000, 16
	goto_if_ne _00D6
	setflag FLAG_UNK_2F2
	goto _00DC

_00D6:
	goto _0101

_00DC:
	end

_00DE:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 1
	goto_if_ne _00F9
	setflag FLAG_UNK_2F2
	goto _00FF

_00F9:
	goto _0101

_00FF:
	end

_0101:
	clearflag FLAG_UNK_2F2
	end

_0107:
	setflag FLAG_UNK_2F2
	end

scr_seq_T07GYM0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 11, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _01A5
	npc_msg msg_0492_T07GYM0101_00000
	closemsg
	trainer_battle TRAINER_LEADER_ERIKA_ERIKA, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01BB
	give_badge 11
	addvar VAR_UNK_4135, 1
	add_special_game_stat 22
	settrainerflag TRAINER_TWINS_JO_AND_ZOE
	settrainerflag TRAINER_LASS_MICHELLE
	settrainerflag TRAINER_PICNICKER_TANYA
	settrainerflag TRAINER_BEAUTY_JULIA
	npc_msg msg_0492_T07GYM0101_00001
	buffer_players_name 0
	npc_msg msg_0492_T07GYM0101_00002
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	npc_msg msg_0492_T07GYM0101_00003
	goto _017C

_017C:
	goto_if_no_item_space ITEM_TM19, 1, _01C1
	callstd std_give_item_verbose
	setflag FLAG_UNK_124
_01A5:
	goto_if_unset FLAG_UNK_124, _017C
	npc_msg msg_0492_T07GYM0101_00004
	waitbutton
	closemsg
	releaseall
	end

_01BB:
	white_out
	releaseall
	end

_01C1:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_T07GYM0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 11, VAR_SPECIAL_RESULT
	buffer_players_name 0
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _01F2
	npc_msg msg_0492_T07GYM0101_00005
	goto _01F5

_01F2:
	npc_msg msg_0492_T07GYM0101_00006
_01F5:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
