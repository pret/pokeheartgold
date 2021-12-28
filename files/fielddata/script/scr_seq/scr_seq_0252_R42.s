#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0252_R42_001A ; 000
	scrdef scr_seq_0252_R42_0230 ; 001
	scrdef scr_seq_0252_R42_0350 ; 002
	scrdef scr_seq_0252_R42_0367 ; 003
	scrdef scr_seq_0252_R42_037C ; 004
	scrdef scr_seq_0252_R42_0391 ; 005
	scrdef_end

scr_seq_0252_R42_001A:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0252_R42_017C
	wait_movement
	get_player_coords VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	clearflag FLAG_UNK_29D
	show_person 10
	comparevartovalue VAR_SPECIAL_x8001, 172
	gotoif ne, scr_seq_0252_R42_0051
	apply_movement 10, scr_seq_0252_R42_0198
	goto scr_seq_0252_R42_00AA

scr_seq_0252_R42_0051:
	comparevartovalue VAR_SPECIAL_x8001, 173
	gotoif ne, scr_seq_0252_R42_006C
	apply_movement 10, scr_seq_0252_R42_01A4
	goto scr_seq_0252_R42_00AA

scr_seq_0252_R42_006C:
	comparevartovalue VAR_SPECIAL_x8001, 174
	gotoif ne, scr_seq_0252_R42_0087
	apply_movement 10, scr_seq_0252_R42_01B0
	goto scr_seq_0252_R42_00AA

scr_seq_0252_R42_0087:
	comparevartovalue VAR_SPECIAL_x8001, 175
	gotoif ne, scr_seq_0252_R42_00A2
	apply_movement 10, scr_seq_0252_R42_01BC
	goto scr_seq_0252_R42_00AA

scr_seq_0252_R42_00A2:
	apply_movement 10, scr_seq_0252_R42_01C8
scr_seq_0252_R42_00AA:
	wait_movement
	play_se SEQ_SE_DP_WALL_HIT2
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement 255, scr_seq_0252_R42_0184
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 5
	closemsg
	apply_movement 10, scr_seq_0252_R42_01D4
	wait_movement
	setvar VAR_SPECIAL_x8004, 423
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	npc_msg 6
	closemsg
	comparevartovalue VAR_SPECIAL_x8001, 172
	gotoif ne, scr_seq_0252_R42_010D
	apply_movement 10, scr_seq_0252_R42_01DC
	goto scr_seq_0252_R42_0166

scr_seq_0252_R42_010D:
	comparevartovalue VAR_SPECIAL_x8001, 173
	gotoif ne, scr_seq_0252_R42_0128
	apply_movement 10, scr_seq_0252_R42_01F0
	goto scr_seq_0252_R42_0166

scr_seq_0252_R42_0128:
	comparevartovalue VAR_SPECIAL_x8001, 174
	gotoif ne, scr_seq_0252_R42_0143
	apply_movement 10, scr_seq_0252_R42_0204
	goto scr_seq_0252_R42_0166

scr_seq_0252_R42_0143:
	comparevartovalue VAR_SPECIAL_x8001, 175
	gotoif ne, scr_seq_0252_R42_015E
	apply_movement 10, scr_seq_0252_R42_0210
	goto scr_seq_0252_R42_0166

scr_seq_0252_R42_015E:
	apply_movement 10, scr_seq_0252_R42_0224
scr_seq_0252_R42_0166:
	wait_movement
	setflag FLAG_UNK_29D
	hide_person 10
	setvar VAR_UNK_4091, 1
	releaseall
	end

scr_seq_0252_R42_017A:
	.byte 0x00, 0x00

scr_seq_0252_R42_017C:
	.short 75, 1
	.short 254, 0

scr_seq_0252_R42_0184:
	.short 3, 1
	.short 71, 1
	.short 58, 1
	.short 72, 1
	.short 254, 0

scr_seq_0252_R42_0198:
	.short 17, 1
	.short 18, 1
	.short 254, 0

scr_seq_0252_R42_01A4:
	.short 17, 2
	.short 18, 1
	.short 254, 0

scr_seq_0252_R42_01B0:
	.short 17, 3
	.short 18, 1
	.short 254, 0

scr_seq_0252_R42_01BC:
	.short 17, 4
	.short 18, 1
	.short 254, 0

scr_seq_0252_R42_01C8:
	.short 17, 5
	.short 18, 1
	.short 254, 0

scr_seq_0252_R42_01D4:
	.short 14, 2
	.short 254, 0

scr_seq_0252_R42_01DC:
	.short 13, 1
	.short 14, 5
	.short 13, 2
	.short 14, 5
	.short 254, 0

scr_seq_0252_R42_01F0:
	.short 13, 1
	.short 14, 5
	.short 13, 1
	.short 14, 5
	.short 254, 0

scr_seq_0252_R42_0204:
	.short 13, 1
	.short 14, 10
	.short 254, 0

scr_seq_0252_R42_0210:
	.short 13, 1
	.short 14, 4
	.short 12, 1
	.short 14, 5
	.short 254, 0

scr_seq_0252_R42_0224:
	.short 12, 1
	.short 14, 10
	.short 254, 0
scr_seq_0252_R42_0230:
	scrcmd_609
	lockall
	scrcmd_076 245, 0
	scrcmd_099 11
	scrcmd_523 11, 2, 90, 2, 0
	scrcmd_098 11
	scrcmd_077
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement 11, scr_seq_0252_R42_02EC
	apply_movement 255, scr_seq_0252_R42_0308
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	clearflag FLAG_UNK_2A3
	show_person 12
	callstd 2042
	apply_movement 12, scr_seq_0252_R42_0324
	wait_movement
	npc_msg 7
	closemsg
	apply_movement 12, scr_seq_0252_R42_0334
	wait_movement
	buffer_players_name 0
	npc_msg 8
	closemsg
	apply_movement 12, scr_seq_0252_R42_0348
	wait_movement
	npc_msg 9
	closemsg
	apply_movement 12, scr_seq_0252_R42_0340
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

scr_seq_0252_R42_02EA:
	.byte 0x00, 0x00

scr_seq_0252_R42_02EC:
	.short 62, 3
	.short 22, 2
	.short 58, 1
	.short 22, 2
	.short 56, 2
	.short 112, 1
	.short 254, 0

scr_seq_0252_R42_0308:
	.short 75, 1
	.short 71, 1
	.short 16, 4
	.short 72, 1
	.short 65, 1
	.short 15, 1
	.short 254, 0

scr_seq_0252_R42_0324:
	.short 15, 4
	.short 12, 3
	.short 15, 6
	.short 254, 0

scr_seq_0252_R42_0334:
	.short 12, 1
	.short 2, 1
	.short 254, 0

scr_seq_0252_R42_0340:
	.short 15, 9
	.short 254, 0

scr_seq_0252_R42_0348:
	.short 15, 1
	.short 254, 0
scr_seq_0252_R42_0350:
	scrcmd_055 0, 1, 1, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0252_R42_0367:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 1, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0252_R42_037C:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 2, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0252_R42_0391:
	scrcmd_055 3, 1, 2, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
