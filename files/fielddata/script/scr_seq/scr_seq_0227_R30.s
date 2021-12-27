#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0227_0050 ; 000
	scrdef scr_seq_0227_002E ; 001
	scrdef scr_seq_0227_00A0 ; 002
	scrdef scr_seq_0227_0224 ; 003
	scrdef scr_seq_0227_0237 ; 004
	scrdef scr_seq_0227_025F ; 005
	scrdef scr_seq_0227_0276 ; 006
	scrdef scr_seq_0227_028D ; 007
	scrdef scr_seq_0227_02A2 ; 008
	scrdef scr_seq_0227_02B7 ; 009
	scrdef scr_seq_0227_02E8 ; 010
	scrdef_end

scr_seq_0227_002E:
	setflag FLAG_UNK_0EE
	setvar VAR_SPECIAL_x8004, 1
	setvar VAR_SPECIAL_x8005, 2
	setvar VAR_SPECIAL_x8006, 0
	callstd 2039
	setvar VAR_UNK_408C, 3
	end

scr_seq_0227_0050:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 0
	closemsg
	apply_movement 6, scr_seq_0227_0088
	wait_movement
	apply_movement 7, scr_seq_0227_0090
	wait_movement
	play_se SEQ_SE_DP_SELECT
	faceplayer
	npc_msg 1
	closemsg
	apply_movement 8, scr_seq_0227_0098
	wait_movement
	releaseall
	end


scr_seq_0227_0088:
	.short 48, 3
	.short 254, 0

scr_seq_0227_0090:
	.short 49, 2
	.short 254, 0

scr_seq_0227_0098:
	.short 32, 1
	.short 254, 0
scr_seq_0227_00A0:
	scrcmd_609
	lockall
	scrcmd_307 17, 11, 11, 3, 77
	scrcmd_310 77
	scrcmd_308 77
	clearflag FLAG_UNK_24F
	scrcmd_100 13
	apply_movement 13, scr_seq_0227_01B0
	wait_movement
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	apply_movement 13, scr_seq_0227_01C4
	wait_movement
	npc_msg 5
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_TEMP_x4000, 558
	gotoif ne, scr_seq_0227_010A
	apply_movement 255, scr_seq_0227_01D4
	goto scr_seq_0227_0148

scr_seq_0227_010A:
	comparevartovalue VAR_TEMP_x4000, 559
	gotoif ne, scr_seq_0227_0125
	apply_movement 255, scr_seq_0227_01E8
	goto scr_seq_0227_0148

scr_seq_0227_0125:
	comparevartovalue VAR_TEMP_x4000, 560
	gotoif ne, scr_seq_0227_0140
	apply_movement 255, scr_seq_0227_01FC
	goto scr_seq_0227_0148

scr_seq_0227_0140:
	apply_movement 255, scr_seq_0227_0210
scr_seq_0227_0148:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 6
	setvar VAR_SPECIAL_x8004, 468
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	npc_msg 8
	closemsg
	apply_movement 13, scr_seq_0227_01CC
	wait_movement
	scrcmd_307 17, 11, 11, 3, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement 13, scr_seq_0227_01B8
	wait_movement
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	hide_person 13
	setflag FLAG_UNK_24F
	releaseall
	setflag FLAG_UNK_06D
	setvar VAR_UNK_408C, 1
	end


scr_seq_0227_01B0:
	.short 13, 1
	.short 254, 0

scr_seq_0227_01B8:
	.short 12, 1
	.short 69, 1
	.short 254, 0

scr_seq_0227_01C4:
	.short 35, 1
	.short 254, 0

scr_seq_0227_01CC:
	.short 32, 1
	.short 254, 0

scr_seq_0227_01D4:
	.short 13, 2
	.short 34, 1
	.short 63, 2
	.short 14, 2
	.short 254, 0

scr_seq_0227_01E8:
	.short 13, 2
	.short 34, 1
	.short 63, 2
	.short 14, 3
	.short 254, 0

scr_seq_0227_01FC:
	.short 13, 2
	.short 34, 1
	.short 63, 2
	.short 14, 4
	.short 254, 0

scr_seq_0227_0210:
	.short 13, 2
	.short 34, 1
	.short 63, 2
	.short 14, 5
	.short 254, 0
scr_seq_0227_0224:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0227_0237:
	scrcmd_609
	lockall
	setvar VAR_SPECIAL_x8004, 0
	setvar VAR_SPECIAL_x8005, 2
	setvar VAR_SPECIAL_x8006, 0
	callstd 2039
	setvar VAR_UNK_4095, 0
	setflag FLAG_UNK_0A7
	releaseall
	end

scr_seq_0227_025F:
	scrcmd_055 9, 1, 6, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0227_0276:
	scrcmd_055 10, 1, 3, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0227_028D:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 12, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0227_02A2:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 11, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0227_02B7:
	checkflag FLAG_UNK_06B
	gotoif TRUE, scr_seq_0227_02D5
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0227_02D5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0227_02E8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
