#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_P01R0301.h"
#include "msgdata/msg/msg_0259_P01R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_P01R0301_000
	scrdef scr_seq_P01R0301_001
	scrdef scr_seq_P01R0301_002
	scrdef scr_seq_P01R0301_003
	scrdef scr_seq_P01R0301_004
	scrdef scr_seq_P01R0301_005
	scrdef scr_seq_P01R0301_006
	scrdef scr_seq_P01R0301_007
	scrdef scr_seq_P01R0301_008
	scrdef_end

scr_seq_P01R0301_007:
	goto_if_unset FLAG_BOAT_ARRIVED, _0031
_0031:
	end

scr_seq_P01R0301_006:
	compare VAR_BOAT_DIRECTION, 1
	goto_if_le _004F
	compare VAR_BOAT_DIRECTION, 2
	goto_if_ge _0059
	end

_004F:
	move_warp 0, 27, 20
	end

_0059:
	move_warp 12, 27, 20
	end

scr_seq_P01R0301_008:
	end

scr_seq_P01R0301_005:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _009C
	apply_movement obj_P01R0301_seaman_2_2, _00A4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_UNK_40DC, 1
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_009C:
	step 12, 4
	step_end

_00A4:
	step 71, 1
	step 10, 1
	step 72, 1
	step 3, 2
	step 65, 1
	step 11, 1
	step 0, 2
	step_end
scr_seq_P01R0301_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_BOAT_DIRECTION, 1
	goto_if_gt _00E5
	goto _00EB
	.byte 0x16
	.byte 0x00, 0x06, 0x00, 0x00, 0x00
_00E5:
	goto _0138

_00EB:
	goto_if_set FLAG_BOAT_ARRIVED, _0101
	npc_msg msg_0259_P01R0301_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0101:
	compare VAR_TEMP_x4000, 1
	goto_if_eq _012D
	npc_msg msg_0259_P01R0301_00002
	closemsg
	apply_movement obj_P01R0301_seaman_2_2, _0180
	wait_movement
	setvar VAR_UNK_40CB, 7
	setvar VAR_TEMP_x4000, 1
	releaseall
	end

_012D:
	npc_msg msg_0259_P01R0301_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0138:
	goto_if_set FLAG_BOAT_ARRIVED, _014E
	npc_msg msg_0259_P01R0301_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_014E:
	compare VAR_TEMP_x4000, 1
	goto_if_eq _0174
	npc_msg msg_0259_P01R0301_00005
	closemsg
	apply_movement obj_P01R0301_seaman_2_2, _0180
	wait_movement
	setvar VAR_TEMP_x4000, 1
	releaseall
	end

_0174:
	npc_msg msg_0259_P01R0301_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00

_0180:
	step 71, 1
	step 13, 1
	step 72, 1
	step 2, 2
	step 71, 1
	step 15, 1
	step 72, 1
	step_end
scr_seq_P01R0301_004:
	scrcmd_609
	lockall
	apply_movement obj_player, _0280
	wait_movement
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4000, 22
	goto_if_ne _01D3
	move_person_facing obj_P01R0301_gsgentleman, 31, 0, VAR_TEMP_x4001, DIR_WEST
	goto _023C

_01D3:
	compare VAR_TEMP_x4000, 23
	goto_if_ne _01F2
	move_person_facing obj_P01R0301_gsgentleman, 32, 0, VAR_TEMP_x4001, DIR_WEST
	goto _023C

_01F2:
	compare VAR_TEMP_x4000, 24
	goto_if_ne _0211
	move_person_facing obj_P01R0301_gsgentleman, 33, 0, VAR_TEMP_x4001, DIR_WEST
	goto _023C

_0211:
	compare VAR_TEMP_x4000, 25
	goto_if_ne _0230
	move_person_facing obj_P01R0301_gsgentleman, 34, 0, VAR_TEMP_x4001, DIR_WEST
	goto _023C

_0230:
	move_person_facing obj_P01R0301_gsgentleman, 35, 0, VAR_TEMP_x4001, DIR_WEST
_023C:
	apply_movement obj_P01R0301_gsgentleman, _0288
	apply_movement obj_player, _02A0
	wait_movement
	apply_movement obj_P01R0301_gsgentleman, _02B8
	wait_movement
	npc_msg msg_0259_P01R0301_00007
	closemsg
	apply_movement obj_P01R0301_gsgentleman, _02C0
	wait_movement
	hide_person obj_P01R0301_gsgentleman
	setflag FLAG_UNK_215
	setvar VAR_UNK_40CB, 2
	stop_se SEQ_SE_GS_N_UMIBE
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0280:
	step 75, 1
	step_end

_0288:
	step 18, 9
	step 71, 1
	step 55, 1
	step 72, 1
	step 65, 1
	step_end

_02A0:
	step 61, 5
	step 3, 2
	step 61, 5
	step 51, 1
	step 65, 1
	step_end

_02B8:
	step 50, 4
	step_end

_02C0:
	step 38, 2
	step 0, 2
	step 16, 1
	step 2, 2
	step 18, 10
	step_end
scr_seq_P01R0301_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	nop_var_490 VAR_UNK_40CB
	compare VAR_UNK_40CB, 7
	goto_if_lt _02FA
	npc_msg msg_0259_P01R0301_00009
	goto _02FD

_02FA:
	npc_msg msg_0259_P01R0301_00008
_02FD:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_P01R0301_002:
	simple_npc_msg msg_0259_P01R0301_00010
	end

scr_seq_P01R0301_003:
	end
	.balign 4, 0
