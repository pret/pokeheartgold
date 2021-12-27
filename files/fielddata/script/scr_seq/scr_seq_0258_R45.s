#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0258_01AB ; 000
	scrdef scr_seq_0258_0051 ; 001
	scrdef scr_seq_0258_0016 ; 002
	scrdef scr_seq_0258_0198 ; 003
	scrdef scr_seq_0258_01C2 ; 004
	scrdef_end

scr_seq_0258_0016:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0258_0027
	clearflag FLAG_UNK_189
	end

scr_seq_0258_0027:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_0258_004B
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif eq, scr_seq_0258_004B
	setflag FLAG_UNK_27E
	end

scr_seq_0258_004B:
	clearflag FLAG_UNK_27E
	end

scr_seq_0258_0051:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0258_0133
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0258_0147
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0258_00C2
	apply_movement 255, scr_seq_0258_015C
	goto scr_seq_0258_00D2

scr_seq_0258_00C2:
	apply_movement 255, scr_seq_0258_0168
	apply_movement 14, scr_seq_0258_017C
scr_seq_0258_00D2:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0258_00F9
	apply_movement 253, scr_seq_0258_0188
	wait_movement
scr_seq_0258_00F9:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 47
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0258_0133:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0258_0147:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0258_015B:
	.byte 0x00

scr_seq_0258_015C:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0258_0168:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0258_017C:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0258_0188:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_0258_0198:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0258_01AB:
	scrcmd_055 1, 1, 4, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0258_01C2:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 2, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
