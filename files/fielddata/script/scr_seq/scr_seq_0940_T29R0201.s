#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T29R0201.h"
#include "msgdata/msg/msg_0628_T29R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T29R0201_000
	scrdef_end

scr_seq_T29R0201_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_RED_GYARADOS_MEET, _003A
	goto_if_set FLAG_UNK_0C8, _002F
	npc_msg msg_0628_T29R0201_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_002F:
	npc_msg msg_0628_T29R0201_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_003A:
	script_overlay_cmd 0, 0
	player_has_species VAR_SPECIAL_RESULT, SPECIES_MAGIKARP
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _005A
	npc_msg msg_0628_T29R0201_00002
	goto _0146

_005A:
	npc_msg msg_0628_T29R0201_00003
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	party_select_ui
	get_party_selection VAR_SPECIAL_x8002
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_SPECIAL_x8002, 255
	goto_if_ne _0095
	npc_msg msg_0628_T29R0201_00010
	goto _0146

_0095:
	get_partymon_species VAR_SPECIAL_x8002, VAR_SPECIAL_x8001
	compare VAR_SPECIAL_x8001, 129
	goto_if_eq _00B1
	npc_msg msg_0628_T29R0201_00008
	goto _0146

_00B1:
	size_record_compare VAR_SPECIAL_RESULT, VAR_SPECIAL_x8002
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _00E3
	buffer_mon_size 0, 1, VAR_SPECIAL_x8002
	buffer_record_size 2, 3, SPECIES_MAGIKARP
	npc_msg msg_0628_T29R0201_00007
	goto _0146

_00DD:
	goto _0101

_00E3:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0101
	buffer_record_size 0, 1, SPECIES_MAGIKARP
	npc_msg msg_0628_T29R0201_00006
	goto _0146

_0101:
	buffer_mon_size 0, 1, VAR_SPECIAL_x8002
	npc_msg msg_0628_T29R0201_00004
	setvar VAR_SPECIAL_x8004, 38
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0137
	callstd std_bag_is_full
	goto _0148

_0137:
	callstd std_give_item_verbose
	size_record_update VAR_SPECIAL_x8002
	setflag FLAG_UNK_139
	npc_msg msg_0628_T29R0201_00005
_0146:
	wait_button_or_walk_away
_0148:
	closemsg
	script_overlay_cmd 0, 1
	releaseall
	end
	.balign 4, 0
