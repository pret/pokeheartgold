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
	random VAR_SPECIAL_x8000, 5
	switch VAR_SPECIAL_x8000
	case 0, _0059
	case 1, _0073
	case 2, _008D
	case 3, _00A7
	case 4, _00C1
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
	wait_button
	closemsg
	apply_movement obj_player, _0188
	apply_movement obj_HIROBA_wifisf, _0244
	wait_movement
	play_se SEQ_SE_DP_TELE2
	apply_movement obj_player, _01EC
	wait_movement
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	setvar VAR_TEMP_x4003, 1
	warp VAR_UNK_4056, 0, 5, 2, DIR_SOUTH
	scrcmd_436
	scrcmd_166 VAR_SPECIAL_RESULT
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	scrcmd_663 VAR_SPECIAL_x8004
	scrcmd_150
	setvar VAR_UNK_4137, 1
	scrcmd_375 obj_player
	fade_screen 6, 1, 1, RGB_BLACK
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
