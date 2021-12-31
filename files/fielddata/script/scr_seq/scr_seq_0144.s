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
	scrcmd_489 0
	scrcmd_813 VAR_TEMP_x4000
	scrcmd_490 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, _0035
	setflag FLAG_HIDE_MOM_GIFT_DELIVERYMAN
	goto _0039

_0035:
	clearflag FLAG_HIDE_MOM_GIFT_DELIVERYMAN
_0039:
	scrcmd_489 1, VAR_UNK_4138
	comparevartovalue VAR_UNK_4138, 0
	gotoif ne, _0056
	setflag FLAG_HIDE_MYSTERY_GIFT_DELIVERYMAN
	goto _005A

_0056:
	clearflag FLAG_HIDE_MYSTERY_GIFT_DELIVERYMAN
_005A:
	scrcmd_489 7
	end

scr_seq_0144_003:
	scrcmd_489 0
	scrcmd_813 VAR_TEMP_x4000
	scrcmd_490 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, _0083
	setflag FLAG_HIDE_MOM_GIFT_DELIVERYMAN
	goto _0087

_0083:
	clearflag FLAG_HIDE_MOM_GIFT_DELIVERYMAN
_0087:
	scrcmd_489 1, VAR_UNK_4138
	comparevartovalue VAR_UNK_4138, 0
	gotoif ne, _00A4
	setflag FLAG_HIDE_MYSTERY_GIFT_DELIVERYMAN
	goto _00A8

_00A4:
	clearflag FLAG_HIDE_MYSTERY_GIFT_DELIVERYMAN
_00A8:
	setvar VAR_UNK_40E5, 2
	scrcmd_489 7
	end

scr_seq_0144_001:
	scrcmd_489 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_489 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _016D
	scrcmd_379 VAR_SPECIAL_x800C
	switch VAR_SPECIAL_x800C
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
	scrcmd_489 3, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0157
	play_fanfare SEQ_ME_ITEM
	scrcmd_489 5, VAR_SPECIAL_x8005, VAR_SPECIAL_x8006
	msgbox_extern VAR_SPECIAL_x8005, VAR_SPECIAL_x8006
	wait_fanfare
	npc_msg msg_0209_00020
	waitbutton
	scrcmd_489 4
	goto _0182

_0157:
	scrcmd_489 6, VAR_SPECIAL_x8005, VAR_SPECIAL_x8006
	msgbox_extern VAR_SPECIAL_x8005, VAR_SPECIAL_x8006
	waitbutton
	goto _0178

_016D:
	npc_msg msg_0209_00003
	waitbutton
	goto _0178

_0178:
	closemsg
	releaseall
	scrcmd_489 7
	end

_0182:
	closemsg
	releaseall
	scrcmd_489 8
	end

scr_seq_0144_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_813 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0232
	scrcmd_379 VAR_SPECIAL_x800C
	switch VAR_SPECIAL_x800C
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
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0222
	callstd std_give_item_verbose
	scrcmd_812
	scrcmd_149 12
	npc_msg msg_0209_00020
	waitbutton
	closemsg
	releaseall
	end

_0222:
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0209_00005
	waitbutton
	closemsg
	releaseall
	end

_0232:
	npc_msg msg_0209_00030
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
