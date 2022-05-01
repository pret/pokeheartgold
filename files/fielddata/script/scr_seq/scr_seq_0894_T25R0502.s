#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R0502.h"
#include "msgdata/msg/msg_0588_T25R0502.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T25R0502_000
	scrdef_end

scr_seq_T25R0502_000:
	scrcmd_609
	lockall
	apply_movement obj_player, _008C
	wait_movement
	wait_se SEQ_SE_DP_KAIDAN2
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_T25R0501, 0, 3, 3, DIR_EAST
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_606
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0098
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg msg_0588_T25R0502_00000
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _00A4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	releaseall
	end
	.byte 0x00

_008C:
	step 13, 3
	step 14, 8
	step_end

_0098:
	step 15, 3
	step 13, 3
	step_end

_00A4:
	step 13, 2
	step_end
	.byte 0x02, 0x00, 0x00, 0x00
	.balign 4, 0
