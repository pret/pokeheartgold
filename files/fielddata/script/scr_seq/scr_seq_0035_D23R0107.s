#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D23R0107.h"
#include "msgdata/msg/msg_0071_D23R0107.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D23R0107_000
	scrdef_end

scr_seq_D23R0107_000:
	scrcmd_609
	lockall
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0058
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _002A
	end

_002A:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _00F4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 253, _0100
	wait_movement
	goto _0062

_0058:
	apply_movement obj_player, _00F4
	wait_movement
_0062:
	scrcmd_241 16659
	copyvar VAR_SPECIAL_x8008, VAR_UNK_4113
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _0088
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, _00A5
	end

_0088:
	npc_msg msg_0071_D23R0107_00000
	closemsg
	scrcmd_240 190, 0, 5, 3, 1
	setvar VAR_SPECIAL_x8004, 0
	goto _00C2

_00A5:
	npc_msg msg_0071_D23R0107_00001
	closemsg
	scrcmd_240 189, 1, 5, 3, 1
	setvar VAR_SPECIAL_x8004, 1
	goto _00C2

_00C2:
	wait_se SEQ_SE_DP_SELECT
	scrcmd_488 32772, 4
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, _00E2
	npc_msg msg_0071_D23R0107_00002
	goto _00E5

_00E2:
	npc_msg msg_0071_D23R0107_00003
_00E5:
	waitbutton
	closemsg
	setvar VAR_UNK_4125, 1
	releaseall
	end
	.byte 0x00

_00F4:
	step 12, 2
	step 33, 1
	step_end

_0100:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
	.balign 4, 0
