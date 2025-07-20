#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D10R0101.h"
#include "msgdata/msg/msg_0052_D10R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D10R0101_000
	scrdef scr_seq_D10R0101_001
	scrdef scr_seq_D10R0101_002
	scrdef scr_seq_D10R0101_003
	scrdef scr_seq_D10R0101_004
	scrdef scr_seq_D10R0101_005
	scrdef_end

scr_seq_D10R0101_000:
	palpark_action 2
	end

scr_seq_D10R0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	non_npc_msg msg_0052_D10R0101_00006
	wait 30, VAR_SPECIAL_RESULT
	non_npc_msg msg_0052_D10R0101_00007
	play_se SEQ_SE_DP_DECIDE
	wait 30, VAR_SPECIAL_RESULT
	non_npc_msg msg_0052_D10R0101_00008
	play_se SEQ_SE_DP_DECIDE
	wait 30, VAR_SPECIAL_RESULT
	non_npc_msg msg_0052_D10R0101_00009
	play_se SEQ_SE_DP_DECIDE
	wait 30, VAR_SPECIAL_RESULT
	non_npc_msg msg_0052_D10R0101_00010
	play_se SEQ_SE_DP_CON_016
	wait 30, VAR_SPECIAL_RESULT
	palpark_action 0
	setvar VAR_UNK_4124, 1
	closemsg
	releaseall
	end

	; unreferenced
	palpark_action 0
	setvar VAR_UNK_4124, 1
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D10R0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	play_se SEQ_SE_DP_PINPON
	buffer_players_name 0
	npc_msg msg_0052_D10R0101_00004
	play_bgm SEQ_SILENCE_DUNGEON
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	closemsg
	releaseall
	setvar VAR_UNK_4124, 1
	call _01D4
	end

scr_seq_D10R0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0052_D10R0101_00005
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	closemsg
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _00D5
	releaseall
	end

_00D5:
	setvar VAR_UNK_4124, 2
	releaseall
	call _01D4
	end

scr_seq_D10R0101_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	call _0180
	closemsg
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0110
	setvar VAR_UNK_4124, 2
	releaseall
	call _01D4
	end

_0110:
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_player, _0134
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	releaseall
	end

	.balign 4, 0
_0134:
	step 12, 1
	step_end

scr_seq_D10R0101_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	call _0180
	closemsg
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0169
	setvar VAR_UNK_4124, 2
	releaseall
	call _01D4
	end

_0169:
	apply_movement obj_D10R0101_mount_2, _0178
	wait_movement
	releaseall
	end

	.balign 4, 0
_0178:
	step 34, 1
	step_end

_0180:
	npc_msg msg_0052_D10R0101_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01C9
	get_player_gender VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _01B9
	buffer_players_name 0
	npc_msg msg_0052_D10R0101_00002
	wait_button_or_walk_away
	setvar VAR_SPECIAL_RESULT, 0
	return

_01B9:
	buffer_players_name 0
	npc_msg msg_0052_D10R0101_00003
	wait_button_or_walk_away
	setvar VAR_SPECIAL_RESULT, 0
	return

_01C9:
	npc_msg msg_0052_D10R0101_00001
	setvar VAR_SPECIAL_RESULT, 1
	return

_01D4:
	palpark_action 1
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_FUCHSIA_PAL_PARK_ENTRANCE, 0, 7, 7, DIR_SOUTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	return
	.balign 4, 0
