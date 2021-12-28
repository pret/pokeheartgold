#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0162_P01R0307_0124 ; 000
	scrdef scr_seq_0162_P01R0307_002F ; 001
	scrdef scr_seq_0162_P01R0307_0012 ; 002
	scrdef scr_seq_0162_P01R0307_0153 ; 003
	scrdef_end

scr_seq_0162_P01R0307_0012:
	comparevartovalue VAR_UNK_40CB, 4
	gotoif ne, scr_seq_0162_P01R0307_0029
	clearflag FLAG_UNK_219
	goto scr_seq_0162_P01R0307_002D

scr_seq_0162_P01R0307_0029:
	setflag FLAG_UNK_219
scr_seq_0162_P01R0307_002D:
	end

scr_seq_0162_P01R0307_002F:
	scrcmd_609
	lockall
	setflag FLAG_UNK_0ED
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 19
	gotoif eq, scr_seq_0162_P01R0307_0088
	apply_movement 1, scr_seq_0162_P01R0307_00C4
	scrcmd_729 VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif eq, scr_seq_0162_P01R0307_006B
	apply_movement 253, scr_seq_0162_P01R0307_0114
scr_seq_0162_P01R0307_006B:
	apply_movement 255, scr_seq_0162_P01R0307_0104
	wait_movement
	npc_msg 0
	closemsg
	apply_movement 1, scr_seq_0162_P01R0307_00D4
	wait_movement
	releaseall
	end

scr_seq_0162_P01R0307_0088:
	apply_movement 1, scr_seq_0162_P01R0307_00E4
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif eq, scr_seq_0162_P01R0307_00A5
	apply_movement 253, scr_seq_0162_P01R0307_0114
scr_seq_0162_P01R0307_00A5:
	apply_movement 255, scr_seq_0162_P01R0307_0104
	wait_movement
	npc_msg 0
	closemsg
	apply_movement 1, scr_seq_0162_P01R0307_00F4
	wait_movement
	releaseall
	end

scr_seq_0162_P01R0307_00C2:
	.byte 0x00, 0x00

scr_seq_0162_P01R0307_00C4:
	.short 0, 2
	.short 12, 1
	.short 2, 2
	.short 254, 0

scr_seq_0162_P01R0307_00D4:
	.short 1, 2
	.short 13, 1
	.short 2, 2
	.short 254, 0

scr_seq_0162_P01R0307_00E4:
	.short 1, 2
	.short 13, 1
	.short 2, 2
	.short 254, 0

scr_seq_0162_P01R0307_00F4:
	.short 0, 2
	.short 12, 1
	.short 2, 2
	.short 254, 0

scr_seq_0162_P01R0307_0104:
	.short 71, 1
	.short 14, 1
	.short 72, 1
	.short 254, 0

scr_seq_0162_P01R0307_0114:
	.short 71, 1
	.short 14, 1
	.short 72, 1
	.short 254, 0
scr_seq_0162_P01R0307_0124:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40CB, 3
	gotoif ge, scr_seq_0162_P01R0307_0148
	npc_msg 1
	waitbutton
	closemsg
	setflag FLAG_UNK_0ED
	releaseall
	end

scr_seq_0162_P01R0307_0148:
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0162_P01R0307_0153:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	apply_movement 0, scr_seq_0162_P01R0307_020C
	wait_movement
	scrcmd_729 VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif eq, scr_seq_0162_P01R0307_0180
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
scr_seq_0162_P01R0307_0180:
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0162_P01R0307_01A7
	apply_movement 255, scr_seq_0162_P01R0307_0218
	apply_movement 0, scr_seq_0162_P01R0307_0238
	goto scr_seq_0162_P01R0307_01B7

scr_seq_0162_P01R0307_01A7:
	apply_movement 255, scr_seq_0162_P01R0307_0228
	apply_movement 0, scr_seq_0162_P01R0307_0244
scr_seq_0162_P01R0307_01B7:
	wait_movement
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif eq, scr_seq_0162_P01R0307_01D0
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
scr_seq_0162_P01R0307_01D0:
	npc_msg 6
	closemsg
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	setvar VAR_UNK_40CB, 5
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 328, 0, 9, 10, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0162_P01R0307_020B:
	.byte 0x00

scr_seq_0162_P01R0307_020C:
	.short 75, 1
	.short 63, 1
	.short 254, 0

scr_seq_0162_P01R0307_0218:
	.short 71, 1
	.short 8, 1
	.short 72, 1
	.short 254, 0

scr_seq_0162_P01R0307_0228:
	.short 71, 1
	.short 11, 2
	.short 72, 1
	.short 254, 0

scr_seq_0162_P01R0307_0238:
	.short 0, 2
	.short 8, 1
	.short 254, 0

scr_seq_0162_P01R0307_0244:
	.short 3, 2
	.short 11, 2
	.short 254, 0
	.balign 4, 0
