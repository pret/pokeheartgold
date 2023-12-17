#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T24PC0101.h"
#include "msgdata/msg/msg_0575_T24PC0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T24PC0101_000
	scrdef scr_seq_T24PC0101_001
	scrdef scr_seq_T24PC0101_002
	scrdef scr_seq_T24PC0101_003
	scrdef_end

scr_seq_T24PC0101_000:
	setvar VAR_SPECIAL_x8007, 3
	callstd std_nurse_joy
	end

scr_seq_T24PC0101_001:
	simple_npc_msg msg_0575_T24PC0101_00000
	end

scr_seq_T24PC0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	count_pc_empty_space VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 540
	goto_if_ne _0056
	goto _005C

_0050:
	goto _005C

_0056:
	goto _00E4

_005C:
	get_party_count VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0079
	goto _007F

_0073:
	goto _007F

_0079:
	goto _00E4

_007F:
	npc_msg msg_0575_T24PC0101_00004
	buffer_players_name 0
	npc_msg msg_0575_T24PC0101_00005
	play_fanfare SEQ_ME_POKEGET
	wait_fanfare
	give_mon SPECIES_TENTACOOL, 15, 0, 0, 0, VAR_SPECIAL_RESULT
	npc_msg msg_0575_T24PC0101_00006
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _00BC
	touchscreen_menu_show
	closemsg
	goto _00E0

_00BC:
	closemsg
	scrcmd_815 0
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	nickname_input 1, VAR_SPECIAL_RESULT
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
_00E0:
	releaseall
	end

_00E4:
	npc_msg msg_0575_T24PC0101_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T24PC0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_STORM, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0115
	npc_msg msg_0575_T24PC0101_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0115:
	buffer_players_name 0
	npc_msg msg_0575_T24PC0101_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
