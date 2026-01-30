#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R27.h"
#include "msgdata/msg/msg_0369_R27.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R27_000
	scrdef scr_seq_R27_001
	scrdef scr_seq_R27_002
	scrdef scr_seq_R27_003
	scrdef scr_seq_R27_004
	scrdef_end

scr_seq_R27_003:
	goto_if_set FLAG_UNK_168, _0026
	scrcmd_804 1
	end

_0026:
	end

scr_seq_R27_000:
	simple_npc_msg msg_0369_R27_00001
	end

scr_seq_R27_001:
	scrcmd_609
	lockall
	apply_movement obj_R27_gsbigman, _00A8
	wait_movement
	npc_msg msg_0369_R27_00000
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 402
	goto_if_ne _006F
	apply_movement obj_R27_gsbigman, _00C4
	goto _0092

_006F:
	compare VAR_TEMP_x4001, 403
	goto_if_ne _008A
	apply_movement obj_R27_gsbigman, _00B0
	goto _0092

_008A:
	apply_movement obj_R27_gsbigman, _00B8
_0092:
	wait_movement
	npc_msg msg_0369_R27_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	setvar VAR_UNK_408A, 1
	end

	.balign 4, 0
_00A8:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_00B0:
	WalkNormalWest 4
	EndMovement

	.balign 4, 0
_00B8:
	WalkNormalSouth
	WalkNormalWest 4
	EndMovement

	.balign 4, 0
_00C4:
	WalkNormalNorth
	WalkNormalWest 4
	EndMovement

scr_seq_R27_002:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0369_R27_00002, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R27_004:
	direction_signpost msg_0369_R27_00003, 1, 5, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
