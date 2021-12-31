#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_HIROBA.h"
#include "msgdata/msg/msg_0212_HIROBA.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_HIROBA_000
	scrdef_end

scr_seq_HIROBA_000:
	scrcmd_609
	lockall
	scrcmd_380 32768, 5
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _0059
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, _0073
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, _008D
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, _00A7
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, _00C1
	end

_0059:
	apply_movement obj_player, _014C
	apply_movement obj_HIROBA_wifisf, _01F4
	wait_movement
	goto _00DB
	.byte 0x02, 0x00
_0073:
	apply_movement obj_player, _0158
	apply_movement obj_HIROBA_wifisf, _0204
	wait_movement
	goto _00DB
	.byte 0x02, 0x00
_008D:
	apply_movement obj_player, _0164
	apply_movement obj_HIROBA_wifisf, _0214
	wait_movement
	goto _00DB
	.byte 0x02, 0x00
_00A7:
	apply_movement obj_player, _0170
	apply_movement obj_HIROBA_wifisf, _0224
	wait_movement
	goto _00DB
	.byte 0x02
	.byte 0x00
_00C1:
	apply_movement obj_player, _017C
	apply_movement obj_HIROBA_wifisf, _0234
	wait_movement
	goto _00DB
	.byte 0x02, 0x00
_00DB:
	npc_msg msg_0212_HIROBA_00000
	scrcmd_049
	closemsg
	apply_movement obj_player, _0188
	apply_movement obj_HIROBA_wifisf, _0244
	wait_movement
	play_se SEQ_SE_DP_TELE2
	apply_movement obj_player, _01EC
	wait_movement
	fade_screen 6, 1, 0, 0x00
	wait_fade
	setvar VAR_TEMP_x4003, 1
	scrcmd_176 16470, 0, 5, 2, 1
	scrcmd_436
	scrcmd_166 32780
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_663 32772
	scrcmd_150
	setvar VAR_UNK_4137, 1
	scrcmd_375 255
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end


_014C:
	step 12, 7
	step 14, 11
	step_end

_0158:
	step 12, 7
	step 14, 9
	step_end

_0164:
	step 12, 7
	step 14, 7
	step_end

_0170:
	step 12, 7
	step 14, 5
	step_end

_017C:
	step 12, 7
	step 14, 3
	step_end

_0188:
	step 12, 1
	step 2, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 0, 1
	step_end

_01EC:
	step 67, 1
	step_end

_01F4:
	step 12, 6
	step 14, 12
	step 35, 1
	step_end

_0204:
	step 12, 6
	step 14, 10
	step 35, 1
	step_end

_0214:
	step 12, 6
	step 14, 8
	step 35, 1
	step_end

_0224:
	step 12, 6
	step 14, 6
	step 35, 1
	step_end

_0234:
	step 12, 6
	step 14, 4
	step 35, 1
	step_end

_0244:
	step 32, 1
	step_end
	.balign 4, 0
