#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000881_00000006 ; 000
	scrdef_end

scr_seq_00000881_00000006:
	checkflag FLAG_UNK_0B9
	gotoif eq, scr_seq_00000881_00000024
	comparevartovalue VAR_UNK_40A5, 1
	gotoif eq, scr_seq_00000881_00000051
	goto scr_seq_00000881_00000024

scr_seq_00000881_00000024:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setflag FLAG_UNK_16F
	msgbox 3
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 11
	callstd 2052
	apply_movement 0, scr_seq_00000881_000000A8
	wait_movement
	clearflag FLAG_UNK_16F
	releaseall
	end

scr_seq_00000881_00000051:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	scrcmd_049
	setvar VAR_SPECIAL_x8004, 464
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000881_0000009C
	callstd 2033
	setflag FLAG_UNK_0B9
	msgbox 2
	scrcmd_049
	closemsg
	apply_movement 0, scr_seq_00000881_000000A8
	wait_movement
	releaseall
	end

scr_seq_00000881_0000009C:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000881_000000A6:
	.byte 0x00, 0x00

scr_seq_00000881_000000A8:
	.short 0, 1
	.short 254, 0
	.balign 4, 0
