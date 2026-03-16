#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R05R0202.h"
#include "msgdata/msg/msg_0331_R05R0202.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R05R0202_000
	scrdef scr_seq_R05R0202_001
	scrdef_end

scr_seq_R05R0202_001:
	setvar VAR_TEMP_x4000, 0
	end

scr_seq_R05R0202_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_TEMP_x4001, 1
	goto_if_eq _00BE
	goto_if_set FLAG_UNK_164, _00D8
	compare VAR_TEMP_x4000, 1
	goto_if_eq _006E
	hasitem ITEM_RAGECANDYBAR, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _005F
	npc_msg msg_0331_R05R0202_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_005F:
	npc_msg msg_0331_R05R0202_00001
	closemsg
	apply_movement obj_R05R0202_gsmiddleman1, _0100
	wait_movement
_006E:
	npc_msg msg_0331_R05R0202_00002
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _00E3
	hasspaceforitem ITEM_TM64, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _00F4
	buffer_players_name 0
	npc_msg msg_0331_R05R0202_00003
	takeitem ITEM_RAGECANDYBAR, 1, VAR_SPECIAL_RESULT
	npc_msg msg_0331_R05R0202_00004
	closemsg
	setvar VAR_SPECIAL_x8004, TM_EXPLOSION
	setvar VAR_SPECIAL_x8005, 1
	callstd std_obtain_item_verbose
_00BE:
	npc_msg msg_0331_R05R0202_00005
	closemsg
	npc_msg msg_0331_R05R0202_00006
	wait_button_or_walk_away
	closemsg
	setvar VAR_TEMP_x4001, 1
	setflag FLAG_UNK_164
	releaseall
	end

_00D8:
	npc_msg msg_0331_R05R0202_00007
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_00E3:
	npc_msg msg_0331_R05R0202_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	setvar VAR_TEMP_x4000, 1
	end

_00F4:
	npc_msg msg_0331_R05R0202_00009
	wait_button_or_walk_away
	closemsg
	releaseall
	end

	.balign 4, 0
_0100:
	EmoteExclamationMark
	EndMovement
	.balign 4, 0
