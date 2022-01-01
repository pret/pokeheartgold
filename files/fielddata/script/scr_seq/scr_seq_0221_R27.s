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
	checkflag FLAG_UNK_168
	gotoif TRUE, _0026
	scrcmd_804 1
	end

_0026:
	end

scr_seq_R27_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0369_R27_00001
	waitbutton
	closemsg
	releaseall
	end

scr_seq_R27_001:
	scrcmd_609
	lockall
	apply_movement obj_R27_gsbigman, _00A8
	wait_movement
	npc_msg msg_0369_R27_00000
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 402
	gotoif ne, _006F
	apply_movement obj_R27_gsbigman, _00C4
	goto _0092

_006F:
	comparevartovalue VAR_TEMP_x4001, 403
	gotoif ne, _008A
	apply_movement obj_R27_gsbigman, _00B0
	goto _0092

_008A:
	apply_movement obj_R27_gsbigman, _00B8
_0092:
	wait_movement
	npc_msg msg_0369_R27_00001
	waitbutton
	closemsg
	releaseall
	setvar VAR_UNK_408A, 1
	end
	.byte 0x00, 0x00, 0x00

_00A8:
	step 75, 1
	step_end

_00B0:
	step 14, 4
	step_end

_00B8:
	step 13, 1
	step 14, 4
	step_end

_00C4:
	step 12, 1
	step 14, 4
	step_end
scr_seq_R27_002:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0369_R27_00002, VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_R27_004:
	direction_signpost msg_0369_R27_00003, 1, 5, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd std_signpost
	end
	.balign 4, 0
