#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D02R0103.h"
#include "msgdata/msg/msg_0050_D02R0103.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D02R0103_000
	scrdef scr_seq_D02R0103_001
	scrdef scr_seq_D02R0103_002
	scrdef_end

scr_seq_D02R0103_002:
	scrcmd_375 obj_D02R0103_stop
	scrcmd_379 VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 3
	goto_if_ne _003D
	move_person_facing obj_D02R0103_stop, 18, 0, 10, DIR_SOUTH
	move_warp 2, 20, 3
	goto _005E

_003D:
	compare VAR_TEMP_x4001, 4
	goto_if_ne _005E
	move_person_facing obj_D02R0103_stop, 18, 0, 10, DIR_SOUTH
	move_warp 2, 20, 3
_005E:
	end

scr_seq_D02R0103_000:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0050_D02R0103_00000, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_D02R0103_001:
	simple_npc_msg msg_0050_D02R0103_00001
	end
	.balign 4, 0
