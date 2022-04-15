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
	goto_if_set FLAG_UNK_168, _0021
	setflag FLAG_UNK_998
_0021:
	scrcmd_804 2
	setflag FLAG_UNK_168
	setflag FLAG_SYS_FLYPOINT_VERMILION
	scrcmd_582 MAP_T06, 1309, 340
	end

scr_seq_P01R0104_002:
	compare VAR_BOAT_DIRECTION, 1
	goto_if_eq _0045
	end

_0045:
	move_person_facing obj_P01R0104_seaman_2, 24, 0, 19, DIR_WEST
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
	setvar VAR_BOAT_DIRECTION, 0
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
	goto_if_set FLAG_BOAT_ARRIVED, _0144
	npc_msg msg_0258_P01R0104_00000
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_facing VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 2
	goto_if_ne _00EF
	apply_movement obj_P01R0104_seaman_2, _0150
	wait_movement
	apply_movement obj_player, _0180
	goto _0126

_00EF:
	compare VAR_TEMP_x4000, 3
	goto_if_ne _0114
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
	wait_button_or_walk_away
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
