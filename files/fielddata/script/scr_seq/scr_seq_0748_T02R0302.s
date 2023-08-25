#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T02R0302.h"
#include "msgdata/msg/msg_0458_T02R0302.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T02R0302_000
	scrdef scr_seq_T02R0302_001
	scrdef scr_seq_T02R0302_002
	scrdef scr_seq_T02R0302_003
	scrdef_end

scr_seq_T02R0302_002:
	scrcmd_609
	lockall
	setvar VAR_UNK_412E, 2
	npc_msg msg_0458_T02R0302_00007
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_player, _0070
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	npc_msg msg_0458_T02R0302_00008
	goto_if_set FLAG_UNK_176, _0063
	npc_msg msg_0458_T02R0302_00009
	setflag FLAG_UNK_25B
	dummy_486
	setvar VAR_UNK_40E5, 2
	npc_msg msg_0458_T02R0302_00011
	setflag FLAG_UNK_176
_0063:
	npc_msg msg_0458_T02R0302_00012
	goto _0091
	.byte 0x61, 0x00, 0x02, 0x00

_0070:
	step 14, 2
	step 13, 1
	step 14, 2
	step_end
scr_seq_T02R0302_000:
scr_seq_T02R0302_003:
	scrcmd_609
	lockall
	apply_movement obj_player, _0120
	wait_movement
	npc_msg msg_0458_T02R0302_00000
_0091:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _00ED
	set_follow_poke_inhibit_state 1
	setvar VAR_UNK_412E, 5
	callstd std_prompt_save
	copyvar VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _00ED
	touchscreen_menu_show
	scrcmd_600
	heal_party
	npc_msg msg_0458_T02R0302_00002
	closemsg
	apply_movement obj_player, _017C
	wait_movement
	scrcmd_607
	scrcmd_109 253, 56
	setvar VAR_UNK_412E, 4
	releaseall
	end

_00ED:
	set_follow_poke_inhibit_state 0
	npc_msg msg_0458_T02R0302_00003
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_player, _0184
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	setvar VAR_UNK_412E, 3
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0120:
	step 34, 1
	step_end
scr_seq_T02R0302_001:
	scrcmd_609
	lockall
	npc_msg msg_0458_T02R0302_00004
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0168
	npc_msg msg_0458_T02R0302_00005
	closemsg
	apply_movement obj_player, _0184
	wait_movement
	set_follow_poke_inhibit_state 0
	scrcmd_606
	scrcmd_109 253, 48
	setvar VAR_UNK_412E, 3
	releaseall
	end

_0168:
	npc_msg msg_0458_T02R0302_00006
	closemsg
	apply_movement obj_player, _017C
	wait_movement
	releaseall
	end
	.byte 0x00

_017C:
	step 13, 3
	step_end

_0184:
	step 15, 1
	step_end
	.balign 4, 0
