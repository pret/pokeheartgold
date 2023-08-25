#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D23R0107.h"
#include "msgdata/msg/msg_0071_D23R0107.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D23R0107_000
	scrdef_end

scr_seq_D23R0107_000:
	scrcmd_609
	lockall
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0058
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _002A
	end

_002A:
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_player, _00F4
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	apply_movement obj_partner_poke, _0100
	wait_movement
	goto _0062

_0058:
	apply_movement obj_player, _00F4
	wait_movement
_0062:
	get_dynamic_warp_floor_no VAR_ELEVATOR_LAST_FLOOR
	switch VAR_ELEVATOR_LAST_FLOOR
	case 0, _0088
	case 1, _00A5
	end

_0088:
	npc_msg msg_0071_D23R0107_00000
	closemsg
	set_dynamic_warp MAP_D23R0106, 0, 5, 3, 1
	setvar VAR_SPECIAL_x8004, 0
	goto _00C2

_00A5:
	npc_msg msg_0071_D23R0107_00001
	closemsg
	set_dynamic_warp MAP_D23R0105, 1, 5, 3, 1
	setvar VAR_SPECIAL_x8004, 1
	goto _00C2

_00C2:
	wait_se SEQ_SE_DP_SELECT
	elevator_anim VAR_SPECIAL_x8004, 4
	compare VAR_ELEVATOR_LAST_FLOOR, 0
	goto_if_ne _00E2
	npc_msg msg_0071_D23R0107_00002
	goto _00E5

_00E2:
	npc_msg msg_0071_D23R0107_00003
_00E5:
	wait_button_or_walk_away
	closemsg
	setvar VAR_UNK_4125, 1
	releaseall
	end
	.byte 0x00

_00F4:
	step 12, 2
	step 33, 1
	step_end

_0100:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
	.balign 4, 0
