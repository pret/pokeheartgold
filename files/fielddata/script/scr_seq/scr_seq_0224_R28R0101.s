#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0224_R28R0101_002C ; 000
	scrdef scr_seq_0224_R28R0101_0170 ; 001
	scrdef scr_seq_0224_R28R0101_000E ; 002
	scrdef_end

scr_seq_0224_R28R0101_000E:
	apply_movement 0, scr_seq_0224_R28R0101_0020
	wait_movement
	setvar VAR_UNK_4126, 1
	end


scr_seq_0224_R28R0101_0020:
	.short 1, 1
	.short 75, 1
	.short 254, 0
scr_seq_0224_R28R0101_002C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_137
	gotoif TRUE, scr_seq_0224_R28R0101_012A
	faceplayer
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0224_R28R0101_0060
	apply_movement 0, scr_seq_0224_R28R0101_0140
	goto scr_seq_0224_R28R0101_009E

scr_seq_0224_R28R0101_0060:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0224_R28R0101_007B
	apply_movement 0, scr_seq_0224_R28R0101_014C
	goto scr_seq_0224_R28R0101_009E

scr_seq_0224_R28R0101_007B:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0224_R28R0101_0096
	apply_movement 0, scr_seq_0224_R28R0101_0158
	goto scr_seq_0224_R28R0101_009E

scr_seq_0224_R28R0101_0096:
	apply_movement 0, scr_seq_0224_R28R0101_0164
scr_seq_0224_R28R0101_009E:
	wait_movement
	npc_msg 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0224_R28R0101_00BE
	apply_movement 0, scr_seq_0224_R28R0101_0164
	goto scr_seq_0224_R28R0101_00FC

scr_seq_0224_R28R0101_00BE:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0224_R28R0101_00D9
	apply_movement 0, scr_seq_0224_R28R0101_0158
	goto scr_seq_0224_R28R0101_00FC

scr_seq_0224_R28R0101_00D9:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0224_R28R0101_00F4
	apply_movement 0, scr_seq_0224_R28R0101_014C
	goto scr_seq_0224_R28R0101_00FC

scr_seq_0224_R28R0101_00F4:
	apply_movement 0, scr_seq_0224_R28R0101_0140
scr_seq_0224_R28R0101_00FC:
	wait_movement
	npc_msg 1
	setvar VAR_SPECIAL_x8004, 374
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0224_R28R0101_0135
	callstd std_give_item_verbose
	setflag FLAG_UNK_137
scr_seq_0224_R28R0101_012A:
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0224_R28R0101_0135:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_0224_R28R0101_013F:
	.byte 0x00

scr_seq_0224_R28R0101_0140:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0224_R28R0101_014C:
	.short 63, 1
	.short 34, 1
	.short 254, 0

scr_seq_0224_R28R0101_0158:
	.short 63, 1
	.short 35, 1
	.short 254, 0

scr_seq_0224_R28R0101_0164:
	.short 63, 1
	.short 33, 1
	.short 254, 0
scr_seq_0224_R28R0101_0170:
	scrcmd_076 22, 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	scrcmd_077
	end
	.balign 4, 0
