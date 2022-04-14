#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D51R0101.h"
#include "msgdata/msg/msg_0145_D51R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D51R0101_000
	scrdef scr_seq_D51R0101_001
	scrdef scr_seq_D51R0101_002
	scrdef scr_seq_D51R0101_003
	scrdef_end

scr_seq_D51R0101_002:
	compare VAR_SCENE_SINJOH_MYSTRI_ROOM, 5
	goto_if_eq _0021
	end

_0021:
	move_person_facing obj_D51R0101_mount_2, 13, 1, 28, DIR_NORTH
	end

scr_seq_D51R0101_000:
	scrcmd_609
	lockall
	apply_movement obj_D51R0101_mount_2, _007C
	wait_movement
	apply_movement obj_player, _0094
	wait_movement
	npc_msg msg_0145_D51R0101_00000
	closemsg
	apply_movement obj_D51R0101_mount_2, _009C
	wait_movement
	npc_msg msg_0145_D51R0101_00001
	closemsg
	apply_movement obj_D51R0101_mount_2, _00A8
	wait_movement
	move_person_facing obj_D51R0101_mount_2, 13, 1, 28, DIR_NORTH
	setvar VAR_SCENE_SINJOH_MYSTRI_ROOM, 5
	releaseall
	end
	.byte 0x00

_007C:
	step 32, 1
	step 75, 1
	step 63, 1
	step 12, 3
	step 34, 1
	step_end

_0094:
	step 35, 1
	step_end

_009C:
	step 75, 1
	step 63, 1
	step_end

_00A8:
	step 13, 4
	step 14, 1
	step 13, 4
	step_end
scr_seq_D51R0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0145_D51R0101_00002
	closemsg
	apply_movement obj_D51R0101_mount_2, _0108
	wait_movement
	scrcmd_307 0, 0, 20, 25, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement obj_D51R0101_mount_2, _0114
	wait_movement
	hide_person obj_D51R0101_mount_2
	setflag FLAG_UNK_2DB
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	setvar VAR_SCENE_SINJOH_MYSTRI_ROOM, 6
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0108:
	step 15, 7
	step 12, 2
	step_end

_0114:
	step 12, 1
	step_end
scr_seq_D51R0101_003:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0145_D51R0101_00007, VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
