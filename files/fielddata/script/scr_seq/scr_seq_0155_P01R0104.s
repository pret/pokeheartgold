#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_P01R0104.h"
#include "msgdata/msg/msg_0258_P01R0104.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_P01R0104_000
	scrdef scr_seq_P01R0104_001
	scrdef scr_seq_P01R0104_002
	scrdef scr_seq_P01R0104_003
	scrdef_end

scr_seq_P01R0104_003:
	checkflag FLAG_UNK_168
	gotoif TRUE, _0021
	setflag FLAG_UNK_998
_0021:
	scrcmd_804 2
	setflag FLAG_UNK_168
	setflag FLAG_UNK_9B5
	scrcmd_582 54, 1309, 340
	end

scr_seq_P01R0104_002:
	comparevartovalue VAR_UNK_40E1, 1
	gotoif eq, _0045
	end

_0045:
	move_person 0, 24, 0, 19, 2
	end

scr_seq_P01R0104_001:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0090
	wait_movement
	apply_movement obj_P01R0104_seaman_2, _0098
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_UNK_40E1, 0
	clearflag FLAG_UNK_092
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0090:
	step 13, 3
	step_end

_0098:
	step 14, 1
	step 33, 1
	step_end
scr_seq_P01R0104_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0EB
	gotoif TRUE, _0144
	npc_msg msg_0258_P01R0104_00000
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, _00EF
	apply_movement obj_P01R0104_seaman_2, _0150
	wait_movement
	apply_movement obj_player, _0180
	goto _0126

_00EF:
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, _0114
	apply_movement obj_P01R0104_seaman_2, _0160
	wait_movement
	apply_movement obj_player, _0190
	goto _0126

_0114:
	apply_movement obj_P01R0104_seaman_2, _0170
	wait_movement
	apply_movement obj_player, _01A0
_0126:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	play_se SEQ_SE_DP_KAIDAN2
	scrcmd_723 1, 0, 307, 24, 19
	releaseall
	end

_0144:
	npc_msg msg_0258_P01R0104_00001
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00

_0150:
	step 2, 1
	step 14, 1
	step 35, 1
	step_end

_0160:
	step 3, 1
	step 15, 1
	step 34, 1
	step_end

_0170:
	step 3, 1
	step 15, 1
	step 34, 1
	step_end

_0180:
	step 14, 1
	step 0, 1
	step 12, 2
	step_end

_0190:
	step 15, 1
	step 0, 1
	step 12, 2
	step_end

_01A0:
	step 12, 2
	step_end
	.balign 4, 0
