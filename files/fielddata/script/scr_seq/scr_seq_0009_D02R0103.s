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
	scrcmd_375 0
	scrcmd_379 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 3
	gotoif ne, _003D
	move_person 0, 18, 0, 10, 1
	scrcmd_342 2, 20, 3
	goto _005E

_003D:
	comparevartovalue VAR_TEMP_x4001, 4
	gotoif ne, _005E
	move_person 0, 18, 0, 10, 1
	scrcmd_342 2, 20, 3
_005E:
	end

scr_seq_D02R0103_000:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 0, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_D02R0103_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0050_D02R0103_00001
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
