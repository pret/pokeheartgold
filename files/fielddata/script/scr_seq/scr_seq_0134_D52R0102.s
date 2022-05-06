#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D52R0102.h"
#include "msgdata/msg/msg_0149_D52R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D52R0102_000
	scrdef scr_seq_D52R0102_001
	scrdef scr_seq_D52R0102_002
	scrdef_end

scr_seq_D52R0102_001:
	compare VAR_SCENE_EMBEDDED_TOWER, 4
	goto_if_ge _007C
	get_game_version VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 7
	goto_if_ne _0038
	goto _004A
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
_0038:
	goto _0040
	.byte 0x02, 0x00
_0040:
	setflag FLAG_HIDE_EMBEDDED_TOWER_KYOGRE
	setflag FLAG_HIDE_EMBEDDED_TOWER_KYOGRE_HIKER
	end

_004A:
	goto_if_set FLAG_BEAT_OR_ESCAPED_FROM_GROUDON_OR_KYOGRE, _007C
	hasitem ITEM_BLUE_ORB, 1, VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 1
	goto_if_ge _0072
	goto _0040
	.byte 0x02, 0x00
_0072:
	setflag FLAG_HIDE_EMBEDDED_TOWER_KYOGRE_HIKER
	clearflag FLAG_HIDE_EMBEDDED_TOWER_KYOGRE
	end

_007C:
	end

scr_seq_D52R0102_002:
	goto_if_set FLAG_ENGAGING_STATIC_POKEMON, _008B
	end

_008B:
	setflag FLAG_HIDE_EMBEDDED_TOWER_KYOGRE
	hide_person obj_D52R0102_tsure_poke_static_kyogre
	clearflag FLAG_ENGAGING_STATIC_POKEMON
	end

scr_seq_D52R0102_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_KYOGRE, 0
	npc_msg msg_0149_D52R0102_00000
	wait_cry
	closemsg
	setflag FLAG_ENGAGING_STATIC_POKEMON
	wild_battle SPECIES_KYOGRE, 50, 0
	clearflag FLAG_ENGAGING_STATIC_POKEMON
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _019D
	scrcmd_683 VAR_TEMP_x4002
	compare VAR_TEMP_x4002, 3
	goto_if_eq _00EC
	compare VAR_TEMP_x4002, 4
	goto_if_eq _00FB
_00EC:
	npc_msg msg_0149_D52R0102_00001
	wait_button_or_walk_away
	closemsg
	setflag FLAG_BEAT_OR_ESCAPED_FROM_GROUDON_OR_KYOGRE
	releaseall
	end

_00FB:
	setvar VAR_SCENE_EMBEDDED_TOWER, 4
	setflag FLAG_CAUGHT_KYOGRE
	clearflag FLAG_HIDE_EMBEDDED_TOWER_KYOGRE_HIKER
	show_person obj_D52R0102_mount_2
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_facing VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_ne _0142
	apply_movement obj_D52R0102_mount_2, _01A4
	wait_movement
	apply_movement obj_player, _01B0
	wait_movement
	goto _0156

_0142:
	apply_movement obj_D52R0102_mount_2, _01BC
	wait_movement
	apply_movement obj_player, _01C8
	wait_movement
_0156:
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg msg_0149_D52R0102_00002
	closemsg
	apply_movement obj_D52R0102_mount_2, _01D0
	wait_movement
	npc_msg msg_0149_D52R0102_00003
	closemsg
	apply_movement obj_D52R0102_mount_2, _01E0
	wait_movement
	npc_msg msg_0149_D52R0102_00004
	closemsg
	apply_movement obj_D52R0102_mount_2, _01EC
	wait_movement
	hide_person obj_D52R0102_mount_2
	setflag FLAG_HIDE_EMBEDDED_TOWER_KYOGRE_HIKER
	setflag FLAG_HIDE_ROUTE_47_EMBEDDED_TOWER_HIKER
	releaseall
	end

_019D:
	white_out
	releaseall
	end
	.byte 0x00

_01A4:
	step 12, 8
	step 32, 1
	step_end

_01B0:
	step 33, 1
	step 13, 1
	step_end

_01BC:
	step 12, 10
	step 32, 1
	step_end

_01C8:
	step 33, 1
	step_end

_01D0:
	step 33, 1
	step 9, 2
	step 32, 1
	step_end

_01E0:
	step 12, 2
	step 32, 1
	step_end

_01EC:
	step 13, 8
	step_end
	.balign 4, 0
