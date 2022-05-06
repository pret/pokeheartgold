#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D18R0102.h"
#include "msgdata/msg/msg_0061_D18R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D18R0102_000
	scrdef scr_seq_D18R0102_001
	scrdef scr_seq_D18R0102_002
	scrdef_end

scr_seq_D18R0102_002:
	goto_if_set FLAG_ENGAGING_STATIC_POKEMON, _001B
	end

_001B:
	setflag FLAG_HIDE_BURNED_TOWER_STATIC_SUICUNE
	hide_person obj_D18R0102_tsure_poke_static_suicune_2
	clearflag FLAG_ENGAGING_STATIC_POKEMON
	end

scr_seq_D18R0102_000:
	scrcmd_609
	lockall
	play_cry SPECIES_RAIKOU, 0
	release obj_D18R0102_tsure_poke_static_raikou
	scrcmd_523 obj_D18R0102_tsure_poke_static_raikou, 2, 90, 2, 0
	lock obj_D18R0102_tsure_poke_static_raikou
	wait_cry
	play_cry SPECIES_ENTEI, 0
	release obj_D18R0102_tsure_poke_static_entei
	scrcmd_523 obj_D18R0102_tsure_poke_static_entei, 2, 90, 2, 0
	lock obj_D18R0102_tsure_poke_static_entei
	wait_cry
	play_cry SPECIES_SUICUNE, 0
	release obj_D18R0102_tsure_poke_static_suicune
	scrcmd_523 obj_D18R0102_tsure_poke_static_suicune, 2, 90, 2, 0
	lock obj_D18R0102_tsure_poke_static_suicune
	wait_cry
	apply_movement obj_D18R0102_tsure_poke_static_raikou, _0224
	wait_movement
	apply_movement obj_D18R0102_tsure_poke_static_entei, _0234
	wait_movement
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	compare VAR_SPECIAL_x8005, 16
	goto_if_ne _00C8
	apply_movement obj_D18R0102_tsure_poke_static_suicune, _0244
	wait_movement
	play_cry SPECIES_SUICUNE, 0
	apply_movement obj_D18R0102_tsure_poke_static_suicune, _0254
	wait_cry
	goto _00E2

_00C8:
	apply_movement obj_D18R0102_tsure_poke_static_suicune, _0268
	wait_movement
	play_cry SPECIES_SUICUNE, 0
	apply_movement obj_D18R0102_tsure_poke_static_suicune, _0278
	wait_cry
_00E2:
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _028C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setflag FLAG_HIDE_BURNED_TOWER_B1F_RAIKOU
	setflag FLAG_HIDE_BURNED_TOWER_B1F_ENTEI
	setflag FLAG_HIDE_BURNED_TOWER_B1F_SUICUNE
	hide_person obj_D18R0102_tsure_poke_static_raikou
	hide_person obj_D18R0102_tsure_poke_static_entei
	hide_person obj_D18R0102_tsure_poke_static_suicune
	create_roamer 0
	create_roamer 1
	wait 15, VAR_SPECIAL_RESULT
	clearflag FLAG_HIDE_BURNED_TOWER_B1F_EUSINE
	play_se SEQ_SE_DP_KAIDAN2
	show_person obj_D18R0102_minaki
	lock obj_D18R0102_minaki
	wait_se SEQ_SE_DP_KAIDAN2
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	compare VAR_SPECIAL_x8005, 16
	goto_if_ne _015B
	apply_movement obj_D18R0102_minaki, _029C
	goto _016B

_015B:
	apply_movement obj_D18R0102_minaki, _02B0
	apply_movement obj_player, _02D8
_016B:
	wait_movement
	npc_msg msg_0061_D18R0102_00000
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	compare VAR_SPECIAL_x8005, 16
	goto_if_ne _0191
	apply_movement obj_D18R0102_minaki, _02C4
	goto _01A1

_0191:
	apply_movement obj_D18R0102_minaki, _02D0
	apply_movement obj_player, _02D8
_01A1:
	wait_movement
	buffer_players_name 0
	npc_msg msg_0061_D18R0102_00001
	closemsg
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	compare VAR_SPECIAL_x8005, 16
	goto_if_ne _01CC
	apply_movement obj_D18R0102_minaki, _02E8
	goto _01D4

_01CC:
	apply_movement obj_D18R0102_minaki, _02F8
_01D4:
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	wait 2, VAR_SPECIAL_RESULT
	hide_person obj_D18R0102_minaki
	wait_se SEQ_SE_DP_KAIDAN2
	setflag FLAG_HIDE_BURNED_TOWER_B1F_EUSINE
	setflag FLAG_HIDE_BURNED_TOWER_1F_EUSINE
	setflag FLAG_HIDE_BURNED_TOWER_1F_MORTY
	setflag FLAG_HIDE_BURNED_TOWER_1F_RAIKOU
	setflag FLAG_HIDE_BURNED_TOWER_1F_ENTEI
	setflag FLAG_HIDE_BURNED_TOWER_1F_SUICUNE
	clearflag FLAG_HIDE_CIANWOOD_SUICUNE
	setvar VAR_UNK_40A1, 1
	setvar VAR_UNK_4076, 1
	setvar VAR_UNK_4079, 2
	setflag FLAG_UNK_247
	clearflag FLAG_HIDE_ECRUTEAK_OLD_MAN
	releaseall
	end
	.byte 0x00, 0x00

_0224:
	step 105, 1
	step 69, 1
	step_end
	.byte 0x02, 0x00, 0x00, 0x00

_0234:
	step 106, 1
	step 69, 1
	step_end
	.byte 0x02, 0x00, 0x00, 0x00

_0244:
	step 107, 1
	step 3, 1
	step_end
	.byte 0x02, 0x00, 0x00, 0x00

_0254:
	step 62, 6
	step 108, 1
	step 69, 1
	step_end
	.byte 0x02, 0x00, 0x00, 0x00

_0268:
	step 109, 1
	step 3, 1
	step_end
	.byte 0x02, 0x00, 0x00, 0x00

_0278:
	step 62, 6
	step 110, 1
	step 69, 1
	step_end
	.byte 0x02, 0x00, 0x00, 0x00

_028C:
	step 14, 1
	step 1, 1
	step_end
	.byte 0x02, 0x00, 0x00, 0x00

_029C:
	step 17, 1
	step 18, 3
	step 1, 1
	step_end
	.byte 0x02, 0x00, 0x00, 0x00

_02B0:
	step 18, 5
	step 17, 1
	step 1, 1
	step_end
	.byte 0x02, 0x00, 0x00, 0x00

_02C4:
	step 18, 1
	step 0, 1
	step_end

_02D0:
	step 3, 1
	step_end

_02D8:
	step 62, 6
	step 2, 1
	step_end
	.byte 0x02, 0x00, 0x00, 0x00

_02E8:
	step 19, 4
	step 16, 1
	step_end
	.byte 0x02, 0x00, 0x00, 0x00

_02F8:
	step 16, 1
	step 19, 5
	step 0, 1
	step_end
	.byte 0x02, 0x00
scr_seq_D18R0102_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_SUICUNE, 0
	wait_cry
	setflag FLAG_ENGAGING_STATIC_POKEMON
	wild_battle SPECIES_SUICUNE, 40, 0
	clearflag FLAG_ENGAGING_STATIC_POKEMON
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _035C
	scrcmd_683 VAR_TEMP_x4002
	compare VAR_TEMP_x4002, 3
	goto_if_eq _0358
	compare VAR_TEMP_x4002, 4
	call_if_eq _0362
_0358:
	releaseall
	end

_035C:
	white_out
	releaseall
	end

_0362:
	setflag FLAG_CAUGHT_SUICINE
	return
	.balign 4, 0
