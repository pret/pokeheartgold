#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0144.h"
#include "msgdata/msg/msg_0209.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0144_000
	scrdef scr_seq_0144_001
	scrdef scr_seq_0144_002
	scrdef scr_seq_0144_003
	scrdef_end

scr_seq_0144_000:
	mystery_gift SCR_MG_BEGIN
	mom_gift_check VAR_TEMP_x4000
	nop_var_490 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_ne _0035
	setflag FLAG_HIDE_MOM_GIFT_DELIVERYMAN
	goto _0039

_0035:
	clearflag FLAG_HIDE_MOM_GIFT_DELIVERYMAN
_0039:
	mystery_gift SCR_MG_HAS_GIFT, VAR_MYSTERY_GIFT_CHECK
	compare VAR_MYSTERY_GIFT_CHECK, FALSE
	goto_if_ne _0056
	setflag FLAG_HIDE_MYSTERY_GIFT_DELIVERYMAN
	goto _005A

_0056:
	clearflag FLAG_HIDE_MYSTERY_GIFT_DELIVERYMAN
_005A:
	mystery_gift SCR_MG_END
	end

scr_seq_0144_003:
	mystery_gift SCR_MG_BEGIN
	mom_gift_check VAR_TEMP_x4000
	nop_var_490 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_ne _0083
	setflag FLAG_HIDE_MOM_GIFT_DELIVERYMAN
	goto _0087

_0083:
	clearflag FLAG_HIDE_MOM_GIFT_DELIVERYMAN
_0087:
	mystery_gift SCR_MG_HAS_GIFT, VAR_MYSTERY_GIFT_CHECK
	compare VAR_MYSTERY_GIFT_CHECK, FALSE
	goto_if_ne _00A4
	setflag FLAG_HIDE_MYSTERY_GIFT_DELIVERYMAN
	goto _00A8

_00A4:
	clearflag FLAG_HIDE_MYSTERY_GIFT_DELIVERYMAN
_00A8:
	setvar VAR_UNK_40E5, 2
	mystery_gift SCR_MG_END
	end

scr_seq_0144_001:
	mystery_gift SCR_MG_BEGIN
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	mystery_gift SCR_MG_HAS_GIFT, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, FALSE
	goto_if_eq _016D
	scrcmd_379 VAR_SPECIAL_RESULT
	switch VAR_SPECIAL_RESULT
	case 0, _00FD
	case 1, _0109
	goto _0115

_00FD:
	buffer_players_name 0
	npc_msg msg_0209_00000
	goto _0121

_0109:
	buffer_players_name 0
	npc_msg msg_0209_00001
	goto _0121

_0115:
	buffer_players_name 0
	npc_msg msg_0209_00002
	goto _0121

_0121:
	mystery_gift SCR_MG_CAN_RECEIVE, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, FALSE
	goto_if_eq _0157
	play_fanfare SEQ_ME_ITEM
	mystery_gift SCR_MG_MESSAGE_RECEIVED, VAR_SPECIAL_x8005, VAR_SPECIAL_x8006
	msgbox_extern VAR_SPECIAL_x8005, VAR_SPECIAL_x8006
	wait_fanfare
	npc_msg msg_0209_00020
	wait_button_or_walk_away
	mystery_gift SCR_MG_RECEIVE
	goto _0182

_0157:
	mystery_gift SCR_MG_MESSAGE_FAILED, VAR_SPECIAL_x8005, VAR_SPECIAL_x8006
	msgbox_extern VAR_SPECIAL_x8005, VAR_SPECIAL_x8006
	wait_button_or_walk_away
	goto _0178

_016D:
	npc_msg msg_0209_00003
	wait_button_or_walk_away
	goto _0178

_0178:
	closemsg
	releaseall
	mystery_gift SCR_MG_END
	end

_0182:
	closemsg
	releaseall
	mystery_gift SCR_MG_END2
	end

scr_seq_0144_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	mom_gift_check VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0232
	scrcmd_379 VAR_SPECIAL_RESULT
	switch VAR_SPECIAL_RESULT
	case 0, _01CF
	case 1, _01DB
	goto _01E7

_01CF:
	buffer_players_name 0
	npc_msg msg_0209_00027
	goto _01F3

_01DB:
	buffer_players_name 0
	npc_msg msg_0209_00028
	goto _01F3

_01E7:
	buffer_players_name 0
	npc_msg msg_0209_00029
	goto _01F3

_01F3:
	scrcmd_811 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0222
	callstd std_give_item_verbose
	scrcmd_812
	scrcmd_149 12
	npc_msg msg_0209_00020
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0222:
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0209_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0232:
	npc_msg msg_0209_00030
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
