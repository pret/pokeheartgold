#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000023_00000118 ; 000
	scrdef scr_seq_00000023_00000142 ; 001
	scrdef scr_seq_00000023_00000168 ; 002
	scrdef scr_seq_00000023_00000012 ; 003
	scrdef_end

scr_seq_00000023_00000012:
	scrcmd_609
	lockall
	callstd 2031
	apply_movement 0, scr_seq_00000023_000000D0
	wait_movement
	scrcmd_191 0
	msgbox 0
	closemsg
	get_starter_choice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 152
	gotoif ne, scr_seq_00000023_0000004B
	trainer_battle 267, 0, 0, 0
	goto scr_seq_00000023_0000006E

scr_seq_00000023_0000004B:
	comparevartovalue VAR_SPECIAL_x800C, 155
	gotoif ne, scr_seq_00000023_00000066
	trainer_battle 270, 0, 0, 0
	goto scr_seq_00000023_0000006E

scr_seq_00000023_00000066:
	trainer_battle 263, 0, 0, 0
scr_seq_00000023_0000006E:
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000023_000000C7
	callstd 2070
	scrcmd_191 0
	msgbox 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement 255, scr_seq_00000023_000000E8
	apply_movement 0, scr_seq_00000023_000000F8
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	hide_person 0
	callstd 2071
	setflag FLAG_UNK_1C6
	setvar VAR_UNK_40A6, 1
	releaseall
	end

scr_seq_00000023_000000C7:
	scrcmd_219
	releaseall
	end

scr_seq_00000023_000000CD:
	.byte 0x00, 0x00, 0x00

scr_seq_00000023_000000D0:
	.short 1, 1
	.short 75, 1
	.short 13, 4
	.short 14, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000023_000000E8:
	.short 13, 2
	.short 15, 1
	.short 2, 1
	.short 254, 0

scr_seq_00000023_000000F8:
	.short 13, 3
	.short 14, 1
	.short 13, 1
	.short 14, 3
	.short 13, 1
	.short 14, 4
	.short 13, 3
	.short 254, 0
scr_seq_00000023_00000118:
	scrcmd_609
	lockall
	callstd 2042
	apply_movement 1, scr_seq_00000023_00000158
	wait_movement
	scrcmd_190 0
	msgbox 2
	waitbutton
	closemsg
	callstd 2043
	setvar VAR_UNK_40A2, 1
	releaseall
	end

scr_seq_00000023_00000142:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000023_00000155:
	.byte 0x00, 0x00, 0x00

scr_seq_00000023_00000158:
	.short 2, 1
	.short 75, 1
	.short 14, 3
	.short 254, 0
scr_seq_00000023_00000168:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
