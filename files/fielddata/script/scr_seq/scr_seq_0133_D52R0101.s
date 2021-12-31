#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D52R0101.h"
#include "msgdata/msg/msg_0148_D52R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D52R0101_000
	scrdef scr_seq_D52R0101_001
	scrdef scr_seq_D52R0101_002
	scrdef_end

scr_seq_D52R0101_001:
	comparevartovalue VAR_UNK_40F9, 4
	gotoif ge, _007C
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, _0038
	goto _0040
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
_0038:
	goto _004A
	.byte 0x02, 0x00
_0040:
	setflag FLAG_UNK_2D0
	setflag FLAG_UNK_2D3
	end

_004A:
	checkflag FLAG_UNK_18B
	gotoif TRUE, _007C
	hasitem ITEM_RED_ORB, 1, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ge, _0072
	goto _0040
	.byte 0x02, 0x00
_0072:
	setflag FLAG_UNK_2D3
	clearflag FLAG_UNK_2D0
	end

_007C:
	end

scr_seq_D52R0101_002:
	checkflag FLAG_UNK_0A4
	gotoif TRUE, _008B
	end

_008B:
	setflag FLAG_UNK_2D0
	hide_person 0
	clearflag FLAG_UNK_0A4
	end

scr_seq_D52R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 383, 0
	npc_msg msg_0148_D52R0101_00000
	scrcmd_077
	closemsg
	setflag FLAG_UNK_0A4
	scrcmd_589 383, 50, 0
	clearflag FLAG_UNK_0A4
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _019D
	scrcmd_683 16386
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif eq, _00EC
	comparevartovalue VAR_TEMP_x4002, 4
	gotoif eq, _00FB
_00EC:
	npc_msg msg_0148_D52R0101_00001
	waitbutton
	closemsg
	setflag FLAG_UNK_18B
	releaseall
	end

_00FB:
	setvar VAR_UNK_40F9, 4
	setflag FLAG_UNK_179
	clearflag FLAG_UNK_2D3
	show_person 1
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, _0142
	apply_movement obj_D52R0101_mount_2, _01A4
	wait_movement
	apply_movement obj_player, _01B0
	wait_movement
	goto _0156

_0142:
	apply_movement obj_D52R0101_mount_2, _01BC
	wait_movement
	apply_movement obj_player, _01C8
	wait_movement
_0156:
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg msg_0148_D52R0101_00002
	closemsg
	apply_movement obj_D52R0101_mount_2, _01D0
	wait_movement
	npc_msg msg_0148_D52R0101_00003
	closemsg
	apply_movement obj_D52R0101_mount_2, _01E0
	wait_movement
	npc_msg msg_0148_D52R0101_00004
	closemsg
	apply_movement obj_D52R0101_mount_2, _01EC
	wait_movement
	hide_person 1
	setflag FLAG_UNK_2D3
	setflag FLAG_UNK_2CF
	releaseall
	end

_019D:
	white_out
	releaseall
	end
	.byte 0x00

_01A4:
	step 12, 8
	step 32, 1
	step_end

_01B0:
	step 33, 1
	step 13, 1
	step_end

_01BC:
	step 12, 10
	step 32, 1
	step_end

_01C8:
	step 33, 1
	step_end

_01D0:
	step 33, 1
	step 9, 2
	step 32, 1
	step_end

_01E0:
	step 12, 2
	step 32, 1
	step_end

_01EC:
	step 13, 8
	step_end
	.balign 4, 0
