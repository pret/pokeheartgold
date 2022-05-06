#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D52R0103.h"
#include "msgdata/msg/msg_0150_D52R0103.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D52R0103_000
	scrdef scr_seq_D52R0103_001
	scrdef scr_seq_D52R0103_002
	scrdef scr_seq_D52R0103_003
	scrdef_end

scr_seq_D52R0103_002:
	goto_if_set FLAG_ENGAGING_STATIC_POKEMON, _001F
	end

_001F:
	setflag FLAG_HIDE_EMBEDDED_TOWER_RAYQUAZA
	hide_person obj_D52R0103_tsure_poke_static_rayquaza
	end

scr_seq_D52R0103_003:
	compare VAR_SCENE_EMBEDDED_TOWER, 7
	goto_if_ge _003C
	clearflag FLAG_HIDE_EMBEDDED_TOWER_RAYQUAZA
	end

_003C:
	end

scr_seq_D52R0103_001:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _00B4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	play_cry SPECIES_RAYQUAZA, 0
	wait_cry
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _00B4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	release obj_D52R0103_tsure_poke_static_rayquaza
	scrcmd_523 obj_D52R0103_tsure_poke_static_rayquaza, 8, 90, 3, 0
	play_cry SPECIES_RAYQUAZA, 0
	npc_msg msg_0150_D52R0103_00000
	wait_cry
	lock obj_D52R0103_tsure_poke_static_rayquaza
	closemsg
	setvar VAR_SCENE_EMBEDDED_TOWER, 6
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_00B4:
	step 12, 8
	step 63, 2
	step_end
scr_seq_D52R0103_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	release obj_D52R0103_tsure_poke_static_rayquaza
	scrcmd_523 obj_D52R0103_tsure_poke_static_rayquaza, 8, 90, 3, 0
	play_cry SPECIES_RAYQUAZA, 0
	npc_msg msg_0150_D52R0103_00000
	wait_cry
	closemsg
	setflag FLAG_ENGAGING_STATIC_POKEMON
	wild_battle SPECIES_RAYQUAZA, 50, 0
	clearflag FLAG_ENGAGING_STATIC_POKEMON
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0142
	scrcmd_683 VAR_TEMP_x4002
	compare VAR_TEMP_x4002, 3
	goto_if_eq _0123
	compare VAR_TEMP_x4002, 4
	goto_if_eq _0134
_0123:
	npc_msg msg_0150_D52R0103_00001
	wait_button_or_walk_away
	closemsg
	setvar VAR_SCENE_EMBEDDED_TOWER, 9
	releaseall
	end

_0134:
	setvar VAR_SCENE_EMBEDDED_TOWER, 7
	setflag FLAG_CAUGHT_RAYQUAZA
	releaseall
	end

_0142:
	white_out
	releaseall
	end
	.balign 4, 0
