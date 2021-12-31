#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11R0703.h"
#include "msgdata/msg/msg_0539_T11R0703.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T11R0703_000
	scrdef_end

scr_seq_T11R0703_000:
	scrcmd_609
	lockall
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 479
	gotoif ne, _018C
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0154
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 253, _0170
	wait_movement
	scrcmd_076 479, 0
	scrcmd_077
	npc_msg msg_0539_T11R0703_00000
	closemsg
	goto _0066
	.byte 0x5e, 0x00, 0xff, 0x00
	.byte 0xf0, 0x00, 0x00, 0x00, 0x5f, 0x00
_0066:
	scrcmd_241 16659
	copyvar VAR_SPECIAL_x8008, VAR_UNK_4113
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, _008C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _00C0
	end

_008C:
	setvar VAR_SPECIAL_x8004, 0
	call _00F4
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 402, 0, 3, 3, 1
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

_00C0:
	setvar VAR_SPECIAL_x8004, 1
	call _00F4
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 403, 0, 7, 3, 1
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

_00F4:
	wait_se SEQ_SE_DP_SELECT
	scrcmd_488 32772, 1
_00FE:
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0142
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _011E
	end

_011E:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0180
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	goto _014C

_0142:
	apply_movement obj_player, _0180
	wait_movement
_014C:
	play_se SEQ_SE_DP_KAIDAN2
	return
	.byte 0x00, 0x00

_0154:
	step 12, 2
	step 33, 1
	step_end

_0160:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end

_0170:
	step 1, 1
	step 13, 1
	step 45, 3
	step_end

_0180:
	step 13, 2
	step 33, 1
	step_end
_018C:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0154
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _01C5
	apply_movement 253, _0160
	wait_movement
_01C5:
	npc_msg msg_0539_T11R0703_00001
	closemsg
	scrcmd_241 16659
	copyvar VAR_SPECIAL_x8008, VAR_UNK_4113
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, _01F0
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _0224
	end

_01F0:
	setvar VAR_SPECIAL_x8004, 0
	call _00FE
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 403, 0, 7, 3, 1
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

_0224:
	setvar VAR_SPECIAL_x8004, 1
	call _00FE
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 402, 0, 3, 3, 1
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end
	.balign 4, 0
