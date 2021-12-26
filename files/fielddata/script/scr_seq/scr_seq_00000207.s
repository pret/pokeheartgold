#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000207_000000A9 ; 000
	scrdef scr_seq_00000207_00000024 ; 001
	scrdef scr_seq_00000207_00000094 ; 002
	scrdef scr_seq_00000207_00000012 ; 003
	scrdef_end

scr_seq_00000207_00000012:
	checkflag FLAG_UNK_149
	gotoif TRUE, scr_seq_00000207_0000001F
	end

scr_seq_00000207_0000001F:
	scrcmd_186 1
	end

scr_seq_00000207_00000024:
	scrcmd_609
	lockall
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000207_0000006A
	apply_movement 255, scr_seq_00000207_00000084
	wait_movement
	msgbox 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000207_0000008C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	releaseall
	end

scr_seq_00000207_0000006A:
	scrcmd_186 1
	setvar VAR_UNK_4129, 1
	setvar VAR_UNK_412A, 1
	setflag FLAG_UNK_149
	releaseall
	end

scr_seq_00000207_00000081:
	.byte 0x00, 0x00, 0x00

scr_seq_00000207_00000084:
	.short 32, 1
	.short 254, 0

scr_seq_00000207_0000008C:
	.short 15, 1
	.short 254, 0
scr_seq_00000207_00000094:
	scrcmd_186 0
	setvar VAR_UNK_4129, 0
	setvar VAR_UNK_412A, 0
	clearflag FLAG_UNK_149
	end

scr_seq_00000207_000000A9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
