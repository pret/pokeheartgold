#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000155_000000A4 ; 000
	scrdef scr_seq_00000155_00000053 ; 001
	scrdef scr_seq_00000155_00000036 ; 002
	scrdef scr_seq_00000155_00000012 ; 003
	scrdef_end

scr_seq_00000155_00000012:
	checkflag FLAG_UNK_168
	gotoif eq, scr_seq_00000155_00000021
	setflag FLAG_UNK_998
scr_seq_00000155_00000021:
	scrcmd_804 2
	setflag FLAG_UNK_168
	setflag FLAG_UNK_9B5
	scrcmd_582 54, 1309, 340
	end

scr_seq_00000155_00000036:
	comparevartovalue VAR_UNK_40E1, 1
	gotoif eq, scr_seq_00000155_00000045
	end

scr_seq_00000155_00000045:
	scrcmd_339 0, 24, 0, 19, 2
	end

scr_seq_00000155_00000053:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000155_00000090
	wait_movement
	apply_movement 0, scr_seq_00000155_00000098
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_UNK_40E1, 0
	clearflag FLAG_UNK_092
	releaseall
	end

scr_seq_00000155_0000008D:
	.byte 0x00, 0x00, 0x00

scr_seq_00000155_00000090:
	.short 13, 3
	.short 254, 0

scr_seq_00000155_00000098:
	.short 14, 1
	.short 33, 1
	.short 254, 0
scr_seq_00000155_000000A4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0EB
	gotoif eq, scr_seq_00000155_00000144
	msgbox 0
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 16384
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000155_000000EF
	apply_movement 0, scr_seq_00000155_00000150
	wait_movement
	apply_movement 255, scr_seq_00000155_00000180
	goto scr_seq_00000155_00000126

scr_seq_00000155_000000EF:
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_00000155_00000114
	apply_movement 0, scr_seq_00000155_00000160
	wait_movement
	apply_movement 255, scr_seq_00000155_00000190
	goto scr_seq_00000155_00000126

scr_seq_00000155_00000114:
	apply_movement 0, scr_seq_00000155_00000170
	wait_movement
	apply_movement 255, scr_seq_00000155_000001A0
scr_seq_00000155_00000126:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	play_se SEQ_SE_DP_KAIDAN2
	scrcmd_723 1, 0, 307, 24, 19
	releaseall
	end

scr_seq_00000155_00000144:
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000155_0000014F:
	.byte 0x00

scr_seq_00000155_00000150:
	.short 2, 1
	.short 14, 1
	.short 35, 1
	.short 254, 0

scr_seq_00000155_00000160:
	.short 3, 1
	.short 15, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000155_00000170:
	.short 3, 1
	.short 15, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000155_00000180:
	.short 14, 1
	.short 0, 1
	.short 12, 2
	.short 254, 0

scr_seq_00000155_00000190:
	.short 15, 1
	.short 0, 1
	.short 12, 2
	.short 254, 0

scr_seq_00000155_000001A0:
	.short 12, 2
	.short 254, 0
	.balign 4, 0
