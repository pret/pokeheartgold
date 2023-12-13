#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T05R0401.h"
#include "msgdata/msg/msg_0480_T05R0401.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T05R0401_000
	scrdef_end

scr_seq_T05R0401_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0480_T05R0401_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _002E
	goto _00B3
	end

_002E:
	npc_msg msg_0480_T05R0401_00001
	wait_button
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	party_select_ui
	get_party_selection VAR_SPECIAL_RESULT
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_SPECIAL_RESULT, 255
	goto_if_eq _00B3
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	get_partymon_species VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _00BE
	partymon_is_mine VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _00C9
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg msg_0480_T05R0401_00002
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _00D9
	goto _00B3
	end

_00B3:
	npc_msg msg_0480_T05R0401_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_00BE:
	npc_msg msg_0480_T05R0401_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_00C9:
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg msg_0480_T05R0401_00007
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_00D9:
	npc_msg msg_0480_T05R0401_00003
	closemsg
	setvar VAR_SPECIAL_RESULT, 0
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	nickname_input VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _011F
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg msg_0480_T05R0401_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_011F:
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg msg_0480_T05R0401_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
