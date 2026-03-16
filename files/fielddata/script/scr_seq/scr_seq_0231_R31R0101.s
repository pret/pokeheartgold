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

	.balign 4, 0
_0284:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_028C:
	SetInvisible
	EndMovement

	.balign 4, 0
_0294:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_029C:
	WalkOnSpotFastWest
	EndMovement

	.balign 4, 0
_02A4:
	JumpOnSpotFastWest 2
	EndMovement

	.balign 4, 0
_02AC:
	WalkNormalWest 2
	WalkNormalNorth
	WalkNormalWest
	EndMovement

	.balign 4, 0
_02BC:
	WalkNormalWest 3
	EndMovement

	.balign 4, 0
_02C4:
	WalkNormalWest 2
	WalkNormalSouth
	WalkNormalWest
	EndMovement

	.balign 4, 0
_02D4:
	WalkNormalWest 2
	WalkNormalNorth
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_02E4:
	WalkNormalWest 4
	EndMovement

	.balign 4, 0
_02EC:
	WalkNormalWest 2
	WalkNormalSouth
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_02FC:
	Delay8
	SetVisible
	WalkNormalWest 2
	WalkNormalNorth
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0314:
	Delay8
	SetVisible
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_0324:
	Delay8
	SetVisible
	WalkNormalWest 2
	WalkNormalSouth
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_033C:
	Delay8
	SetVisible
	WalkNormalWest 2
	WalkNormalNorth
	WalkNormalWest
	EndMovement

	.balign 4, 0
_0354:
	Delay8
	SetVisible
	WalkNormalWest 3
	EndMovement

	.balign 4, 0
_0364:
	Delay8
	SetVisible
	WalkNormalWest 2
	WalkNormalSouth
	WalkNormalWest
	EndMovement

	.balign 4, 0
_037C:
	RunSouth
	RunWest 6
	SetInvisible
	EndMovement

	.balign 4, 0
_038C:
	RunSouth
	RunWest 4
	RunNorth
	RunWest 2
	SetInvisible
	EndMovement

	.balign 4, 0
_03A4:
	RunNorth
	RunWest 6
	SetInvisible
	EndMovement

	.balign 4, 0
_03B4:
	RunSouth
	RunWest 5
	SetInvisible
	EndMovement

	.balign 4, 0
_03C4:
	RunSouth
	RunWest 3
	RunNorth
	RunWest 2
	SetInvisible
	EndMovement

	.balign 4, 0
_03DC:
	RunNorth
	RunWest 5
	SetInvisible
	EndMovement

	.balign 4, 0
_03EC:
	Delay2
	WalkFastWest
	WalkFastSouth
	WalkFastWest 6
	SetInvisible
	EndMovement

	.balign 4, 0
_0404:
	Delay2
	WalkFastWest
	WalkFastSouth
	WalkFastWest 4
	WalkFastNorth
	WalkFastWest 2
	SetInvisible
	EndMovement

	.balign 4, 0
_0424:
	Delay2
	WalkFastWest
	WalkFastNorth
	WalkFastWest 6
	SetInvisible
	EndMovement

	.balign 4, 0
_043C:
	Delay2
	WalkFastWest
	WalkFastSouth
	WalkFastWest 5
	SetInvisible
	EndMovement

	.balign 4, 0
_0454:
	Delay2
	WalkFastWest
	WalkFastSouth
	WalkFastWest 3
	WalkFastNorth
	WalkFastWest 2
	SetInvisible
	EndMovement

	.balign 4, 0
_0474:
	Delay2
	WalkFastWest
	WalkFastNorth
	WalkFastWest 5
	SetInvisible
	EndMovement

scr_seq_R31R0101_002:
	simple_npc_msg msg_0379_R31R0101_00000
	end
	.balign 4, 0
