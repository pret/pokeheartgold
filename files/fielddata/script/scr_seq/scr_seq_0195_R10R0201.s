#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R10R0201.h"
#include "msgdata/msg/msg_0344_R10R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R10R0201_000
	scrdef scr_seq_R10R0201_001
	scrdef scr_seq_R10R0201_002
	scrdef scr_seq_R10R0201_003
	scrdef scr_seq_R10R0201_004
	scrdef scr_seq_R10R0201_005
	scrdef scr_seq_R10R0201_006
	scrdef scr_seq_R10R0201_007
	scrdef scr_seq_R10R0201_008
	scrdef_end

scr_seq_R10R0201_000:
	simple_npc_msg msg_0344_R10R0201_00003
	end

scr_seq_R10R0201_001:
	simple_npc_msg msg_0344_R10R0201_00004
	end

scr_seq_R10R0201_002:
	simple_npc_msg msg_0344_R10R0201_00005
	end

scr_seq_R10R0201_003:
	simple_npc_msg msg_0344_R10R0201_00006
	end

scr_seq_R10R0201_004:
	simple_npc_msg msg_0344_R10R0201_00007
	end

scr_seq_R10R0201_005:
	simple_npc_msg msg_0344_R10R0201_00008
	end

scr_seq_R10R0201_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_TRADE_POWER_PLANT_DUGTRIO_MAGNETON, _013F
	npc_msg msg_0344_R10R0201_00009
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0134
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_566
	get_party_selection VAR_SPECIAL_RESULT
	restore_overworld
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_SPECIAL_RESULT, 255
	goto_if_eq _0134
	load_npc_trade 8
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	npc_trade_get_req_species VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	goto_if_ne _0127
	npc_trade_exec VAR_SPECIAL_x8004
	npc_trade_end
	setflag FLAG_TRADE_POWER_PLANT_DUGTRIO_MAGNETON
	npc_msg msg_0344_R10R0201_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0127:
	npc_trade_end
	npc_msg msg_0344_R10R0201_00011
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0134:
	npc_msg msg_0344_R10R0201_00012
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_013F:
	npc_msg msg_0344_R10R0201_00013
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_R10R0201_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0344_R10R0201_00014
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_R10R0201_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0344_R10R0201_00015
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
