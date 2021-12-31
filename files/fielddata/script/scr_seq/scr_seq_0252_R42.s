#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R42.h"
#include "msgdata/msg/msg_0399_R42.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R42_000
	scrdef scr_seq_R42_001
	scrdef scr_seq_R42_002
	scrdef scr_seq_R42_003
	scrdef scr_seq_R42_004
	scrdef scr_seq_R42_005
	scrdef_end

scr_seq_R42_000:
	scrcmd_609
	lockall
	apply_movement obj_player, _017C
	wait_movement
	get_player_coords VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	clearflag FLAG_UNK_29D
	show_person 10
	comparevartovalue VAR_SPECIAL_x8001, 172
	gotoif ne, _0051
	apply_movement obj_R42_mount_2_2, _0198
	goto _00AA

_0051:
	comparevartovalue VAR_SPECIAL_x8001, 173
	gotoif ne, _006C
	apply_movement obj_R42_mount_2_2, _01A4
	goto _00AA

_006C:
	comparevartovalue VAR_SPECIAL_x8001, 174
	gotoif ne, _0087
	apply_movement obj_R42_mount_2_2, _01B0
	goto _00AA

_0087:
	comparevartovalue VAR_SPECIAL_x8001, 175
	gotoif ne, _00A2
	apply_movement obj_R42_mount_2_2, _01BC
	goto _00AA

_00A2:
	apply_movement obj_R42_mount_2_2, _01C8
_00AA:
	wait_movement
	play_se SEQ_SE_DP_WALL_HIT2
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement obj_player, _0184
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg msg_0399_R42_00005
	closemsg
	apply_movement obj_R42_mount_2_2, _01D4
	wait_movement
	setvar VAR_SPECIAL_x8004, 423
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	npc_msg msg_0399_R42_00006
	closemsg
	comparevartovalue VAR_SPECIAL_x8001, 172
	gotoif ne, _010D
	apply_movement obj_R42_mount_2_2, _01DC
	goto _0166

_010D:
	comparevartovalue VAR_SPECIAL_x8001, 173
	gotoif ne, _0128
	apply_movement obj_R42_mount_2_2, _01F0
	goto _0166

_0128:
	comparevartovalue VAR_SPECIAL_x8001, 174
	gotoif ne, _0143
	apply_movement obj_R42_mount_2_2, _0204
	goto _0166

_0143:
	comparevartovalue VAR_SPECIAL_x8001, 175
	gotoif ne, _015E
	apply_movement obj_R42_mount_2_2, _0210
	goto _0166

_015E:
	apply_movement obj_R42_mount_2_2, _0224
_0166:
	wait_movement
	setflag FLAG_UNK_29D
	hide_person 10
	setvar VAR_UNK_4091, 1
	releaseall
	end
	.byte 0x00, 0x00

_017C:
	step 75, 1
	step_end

_0184:
	step 3, 1
	step 71, 1
	step 58, 1
	step 72, 1
	step_end

_0198:
	step 17, 1
	step 18, 1
	step_end

_01A4:
	step 17, 2
	step 18, 1
	step_end

_01B0:
	step 17, 3
	step 18, 1
	step_end

_01BC:
	step 17, 4
	step 18, 1
	step_end

_01C8:
	step 17, 5
	step 18, 1
	step_end

_01D4:
	step 14, 2
	step_end

_01DC:
	step 13, 1
	step 14, 5
	step 13, 2
	step 14, 5
	step_end

_01F0:
	step 13, 1
	step 14, 5
	step 13, 1
	step 14, 5
	step_end

_0204:
	step 13, 1
	step 14, 10
	step_end

_0210:
	step 13, 1
	step 14, 4
	step 12, 1
	step 14, 5
	step_end

_0224:
	step 12, 1
	step 14, 10
	step_end
scr_seq_R42_001:
	scrcmd_609
	lockall
	scrcmd_076 245, 0
	release obj_R42_tsure_poke_618
	scrcmd_523 11, 2, 90, 2, 0
	lock obj_R42_tsure_poke_618
	scrcmd_077
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement obj_R42_tsure_poke_618, _02EC
	apply_movement obj_player, _0308
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	clearflag FLAG_UNK_2A3
	show_person 12
	callstd 2042
	apply_movement obj_R42_minaki, _0324
	wait_movement
	npc_msg msg_0399_R42_00007
	closemsg
	apply_movement obj_R42_minaki, _0334
	wait_movement
	buffer_players_name 0
	npc_msg msg_0399_R42_00008
	closemsg
	apply_movement obj_R42_minaki, _0348
	wait_movement
	npc_msg msg_0399_R42_00009
	closemsg
	apply_movement obj_R42_minaki, _0340
	wait_movement
	callstd 2043
	hide_person 11
	hide_person 12
	setflag FLAG_UNK_29E
	setflag FLAG_UNK_2A3
	setvar VAR_UNK_4092, 0
	setvar VAR_UNK_4070, 1
	setvar VAR_UNK_4071, 1
	clearflag FLAG_UNK_29F
	releaseall
	end
	.byte 0x00, 0x00

_02EC:
	step 62, 3
	step 22, 2
	step 58, 1
	step 22, 2
	step 56, 2
	step 112, 1
	step_end

_0308:
	step 75, 1
	step 71, 1
	step 16, 4
	step 72, 1
	step 65, 1
	step 15, 1
	step_end

_0324:
	step 15, 4
	step 12, 3
	step 15, 6
	step_end

_0334:
	step 12, 1
	step 2, 1
	step_end

_0340:
	step 15, 9
	step_end

_0348:
	step 15, 1
	step_end
scr_seq_R42_002:
	scrcmd_055 0, 1, 1, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_R42_003:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 1, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_R42_004:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 2, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_R42_005:
	scrcmd_055 3, 1, 2, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
