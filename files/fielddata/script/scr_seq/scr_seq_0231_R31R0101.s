#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R31R0101.h"
#include "msgdata/msg/msg_0379_R31R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R31R0101_000
	scrdef scr_seq_R31R0101_001
	scrdef scr_seq_R31R0101_002
	scrdef_end

scr_seq_R31R0101_001:
	get_friend_sprite VAR_OBJ_0
	end

scr_seq_R31R0101_000:
	scrcmd_609
	lockall
	callstd std_play_friend_music
	apply_movement obj_R31R0101_tsure_poke_static_marill, _028C
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	move_person_facing obj_R31R0101_var_1, 10, 1, 7, DIR_WEST
	move_person_facing obj_R31R0101_tsure_poke_static_marill, 10, 1, 7, DIR_WEST
	apply_movement obj_R31R0101_var_1, _0284
	wait_movement
	wait_se SEQ_SE_DP_KAIDAN2
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	scrcmd_729 VAR_TEMP_x4002
	compare VAR_TEMP_x4002, 1
	goto_if_ne _00C3
	compare VAR_TEMP_x4001, 6
	goto_if_ne _008A
	apply_movement obj_R31R0101_var_1, _02AC
	apply_movement obj_R31R0101_tsure_poke_static_marill, _02FC
	goto _00BD

_008A:
	compare VAR_TEMP_x4001, 7
	goto_if_ne _00AD
	apply_movement obj_R31R0101_var_1, _02BC
	apply_movement obj_R31R0101_tsure_poke_static_marill, _0314
	goto _00BD

_00AD:
	apply_movement obj_R31R0101_var_1, _02C4
	apply_movement obj_R31R0101_tsure_poke_static_marill, _0324
_00BD:
	goto _0119

_00C3:
	compare VAR_TEMP_x4001, 6
	goto_if_ne _00E6
	apply_movement obj_R31R0101_var_1, _02D4
	apply_movement obj_R31R0101_tsure_poke_static_marill, _033C
	goto _0119

_00E6:
	compare VAR_TEMP_x4001, 7
	goto_if_ne _0109
	apply_movement obj_R31R0101_var_1, _02E4
	apply_movement obj_R31R0101_tsure_poke_static_marill, _0354
	goto _0119

_0109:
	apply_movement obj_R31R0101_var_1, _02EC
	apply_movement obj_R31R0101_tsure_poke_static_marill, _0364
_0119:
	wait_movement
	apply_movement obj_player, _0294
	compare VAR_TEMP_x4002, 1
	goto_if_ne _0138
	apply_movement obj_partner_poke, _0294
_0138:
	wait_movement
	buffer_players_name 0
	gender_msgbox msg_0379_R31R0101_00002, msg_0379_R31R0101_00003
	giveitem_no_check ITEM_VS__RECORDER, 1
	gender_msgbox msg_0379_R31R0101_00004, msg_0379_R31R0101_00005
	closemsg
	apply_movement obj_R31R0101_var_1, _0294
	wait_movement
	gender_msgbox msg_0379_R31R0101_00006, msg_0379_R31R0101_00007
	closemsg
	apply_movement obj_R31R0101_tsure_poke_static_marill, _02A4
	wait_movement
	compare VAR_TEMP_x4002, 1
	goto_if_ne _01DA
	compare VAR_TEMP_x4001, 6
	goto_if_ne _01A1
	apply_movement obj_R31R0101_var_1, _037C
	apply_movement obj_R31R0101_tsure_poke_static_marill, _03EC
	goto _01D4

_01A1:
	compare VAR_TEMP_x4001, 7
	goto_if_ne _01C4
	apply_movement obj_R31R0101_var_1, _038C
	apply_movement obj_R31R0101_tsure_poke_static_marill, _0404
	goto _01D4

_01C4:
	apply_movement obj_R31R0101_var_1, _03A4
	apply_movement obj_R31R0101_tsure_poke_static_marill, _0424
_01D4:
	goto _0230

_01DA:
	compare VAR_TEMP_x4001, 6
	goto_if_ne _01FD
	apply_movement obj_R31R0101_var_1, _03B4
	apply_movement obj_R31R0101_tsure_poke_static_marill, _043C
	goto _0230

_01FD:
	compare VAR_TEMP_x4001, 7
	goto_if_ne _0220
	apply_movement obj_R31R0101_var_1, _03C4
	apply_movement obj_R31R0101_tsure_poke_static_marill, _0454
	goto _0230

_0220:
	apply_movement obj_R31R0101_var_1, _03DC
	apply_movement obj_R31R0101_tsure_poke_static_marill, _0474
_0230:
	wait 16, VAR_SPECIAL_RESULT
	apply_movement obj_player, _029C
	compare VAR_TEMP_x4002, 1
	goto_if_ne _0253
	apply_movement obj_partner_poke, _029C
_0253:
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	move_person_facing obj_R31R0101_var_1, 12, 0, 28, DIR_NORTH
	move_person_facing obj_R31R0101_tsure_poke_static_marill, 12, 0, 28, DIR_NORTH
	callstd std_fade_end_friend_music
	releaseall
	setvar VAR_UNK_4132, 1
	end
	.byte 0x00

_0284:
	step 75, 1
	step_end

_028C:
	step 69, 1
	step_end

_0294:
	step 35, 1
	step_end

_029C:
	step 38, 1
	step_end

_02A4:
	step 50, 2
	step_end

_02AC:
	step 14, 2
	step 12, 1
	step 14, 1
	step_end

_02BC:
	step 14, 3
	step_end

_02C4:
	step 14, 2
	step 13, 1
	step 14, 1
	step_end

_02D4:
	step 14, 2
	step 12, 1
	step 14, 2
	step_end

_02E4:
	step 14, 4
	step_end

_02EC:
	step 14, 2
	step 13, 1
	step 14, 2
	step_end

_02FC:
	step 63, 1
	step 70, 1
	step 14, 2
	step 12, 1
	step 34, 1
	step_end

_0314:
	step 63, 1
	step 70, 1
	step 14, 2
	step_end

_0324:
	step 63, 1
	step 70, 1
	step 14, 2
	step 13, 1
	step 34, 1
	step_end

_033C:
	step 63, 1
	step 70, 1
	step 14, 2
	step 12, 1
	step 14, 1
	step_end

_0354:
	step 63, 1
	step 70, 1
	step 14, 3
	step_end

_0364:
	step 63, 1
	step 70, 1
	step 14, 2
	step 13, 1
	step 14, 1
	step_end

_037C:
	step 89, 1
	step 90, 6
	step 69, 1
	step_end

_038C:
	step 89, 1
	step 90, 4
	step 88, 1
	step 90, 2
	step 69, 1
	step_end

_03A4:
	step 88, 1
	step 90, 6
	step 69, 1
	step_end

_03B4:
	step 89, 1
	step 90, 5
	step 69, 1
	step_end

_03C4:
	step 89, 1
	step 90, 3
	step 88, 1
	step 90, 2
	step 69, 1
	step_end

_03DC:
	step 88, 1
	step 90, 5
	step 69, 1
	step_end

_03EC:
	step 61, 1
	step 18, 1
	step 17, 1
	step 18, 6
	step 69, 1
	step_end

_0404:
	step 61, 1
	step 18, 1
	step 17, 1
	step 18, 4
	step 16, 1
	step 18, 2
	step 69, 1
	step_end

_0424:
	step 61, 1
	step 18, 1
	step 16, 1
	step 18, 6
	step 69, 1
	step_end

_043C:
	step 61, 1
	step 18, 1
	step 17, 1
	step 18, 5
	step 69, 1
	step_end

_0454:
	step 61, 1
	step 18, 1
	step 17, 1
	step 18, 3
	step 16, 1
	step 18, 2
	step 69, 1
	step_end

_0474:
	step 61, 1
	step 18, 1
	step 16, 1
	step 18, 5
	step 69, 1
	step_end
scr_seq_R31R0101_002:
	simple_npc_msg msg_0379_R31R0101_00000
	end
	.balign 4, 0
