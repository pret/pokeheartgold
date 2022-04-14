#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D31R0202.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D31R0202_000
	scrdef scr_seq_D31R0202_001
	scrdef scr_seq_D31R0202_002
	scrdef scr_seq_D31R0202_003
	scrdef_end

scr_seq_D31R0202_000:
	compare VAR_UNK_414D, 0
	call_if_ne _008A
	scrcmd_412 43, 0, VAR_TEMP_x400A
	call _008E
	compare VAR_TEMP_x400A, 2
	call_if_eq _009E
	compare VAR_TEMP_x400A, 3
	call_if_eq _009E
	compare VAR_TEMP_x400A, 0
	call_if_eq _008E
	compare VAR_TEMP_x400A, 1
	call_if_eq _008E
	compare VAR_TEMP_x400A, 4
	call_if_eq _0096
	compare VAR_TEMP_x400A, 5
	call_if_eq _0096
	compare VAR_TEMP_x400A, 6
	call_if_eq _0096
	end

_008A:
	scrcmd_520
	return

_008E:
	setvar VAR_OBJ_10, 282
	return

_0096:
	setvar VAR_OBJ_10, 286
	return

_009E:
	setvar VAR_OBJ_10, 283
	return

_00A6:
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_412 43, 0, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 4
	goto_if_eq _0200
	compare VAR_SPECIAL_RESULT, 5
	goto_if_eq _0200
	scrcmd_436
	scrcmd_627 5
	scrcmd_150
	warp MAP_D31R0201, 0, 15, 6, DIR_NORTH
	end

_00E9:
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_436
	scrcmd_627 6
	scrcmd_150
	warp MAP_D31R0201, 0, 11, 6, DIR_NORTH
	end

_010A:
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_D31R0207, 0, 8, 2, DIR_SOUTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_0132:
	call _018E
	elevator_anim VAR_TEMP_x4000, 3
	call _019A
	return

scr_seq_D31R0202_001:
	scrcmd_609
	lockall
	setvar VAR_TEMP_x4000, 0
	call _0132
	goto _00A6
	.byte 0x02, 0x00
scr_seq_D31R0202_002:
	scrcmd_609
	lockall
	setvar VAR_TEMP_x4000, 0
	call _0132
	goto _00E9
	.byte 0x02, 0x00
scr_seq_D31R0202_003:
	scrcmd_609
	lockall
	setvar VAR_TEMP_x4000, 1
	call _0132
	goto _010A
	.byte 0x02, 0x00
_018E:
	apply_movement obj_player, _01C4
	wait_movement
	return

_019A:
	apply_movement obj_D31R0202_var_11, _01D0
	apply_movement obj_player, _01EC
	wait_movement
	return
	.byte 0x00, 0x00
	.byte 0x0c, 0x00, 0x02, 0x00, 0x03, 0x00, 0x01, 0x00, 0x0f, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00

_01C4:
	step 12, 2
	step 1, 1
	step_end

_01D0:
	step 13, 1
	step 2, 1
	step 14, 1
	step 1, 1
	step 13, 1
	step 69, 1
	step_end

_01EC:
	step 63, 2
	step 61, 1
	step 13, 2
	step 69, 1
	step_end
_0200:
	scrcmd_436
	scrcmd_627 5
	scrcmd_150
	warp MAP_D31R0201, 0, 19, 6, DIR_NORTH
	end
	.balign 4, 0
