#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0103_D40R0104_004E ; 000
	scrdef scr_seq_0103_D40R0104_001A ; 001
	scrdef scr_seq_0103_D40R0104_0118 ; 002
	scrdef scr_seq_0103_D40R0104_0012 ; 003
	scrdef_end

scr_seq_0103_D40R0104_0012:
	setvar VAR_TEMP_x4003, 111
	end

scr_seq_0103_D40R0104_001A:
	comparevartovalue VAR_TEMP_x4003, 111
	gotoif ne, scr_seq_0103_D40R0104_0032
	checkflag FLAG_UNK_106
	gotoif TRUE, scr_seq_0103_D40R0104_003A
scr_seq_0103_D40R0104_0032:
	setvar VAR_TEMP_x4003, 0
	end

scr_seq_0103_D40R0104_003A:
	move_person 0, 34, 1, 29, 3
	setvar VAR_TEMP_x4003, 0
	end

scr_seq_0103_D40R0104_004E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_117
	gotoif TRUE, scr_seq_0103_D40R0104_010D
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 8
	gotoif eq, scr_seq_0103_D40R0104_0093
	checkflag FLAG_UNK_106
	gotoif TRUE, scr_seq_0103_D40R0104_00C5
	checkflag FLAG_UNK_094
	gotoif TRUE, scr_seq_0103_D40R0104_00B4
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0103_D40R0104_0093:
	checkflag FLAG_UNK_106
	gotoif TRUE, scr_seq_0103_D40R0104_00C5
	checkflag FLAG_UNK_094
	gotoif TRUE, scr_seq_0103_D40R0104_00B4
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0103_D40R0104_00B4:
	npc_msg 2
	closemsg
	scrcmd_774 1
	releaseall
	setflag FLAG_UNK_106
	end

scr_seq_0103_D40R0104_00C5:
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 8
	gotoif ne, scr_seq_0103_D40R0104_00EC
	checkflag FLAG_UNK_109
	gotoif TRUE, scr_seq_0103_D40R0104_00F7
	checkflag FLAG_UNK_105
	gotoif TRUE, scr_seq_0103_D40R0104_0102
scr_seq_0103_D40R0104_00EC:
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0103_D40R0104_00F7:
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0103_D40R0104_0102:
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0103_D40R0104_010D:
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0103_D40R0104_0118:
	wait 60, VAR_SPECIAL_x800C
	npc_msg 3
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0103_D40R0104_0142
	apply_movement 0, scr_seq_0103_D40R0104_0168
	goto scr_seq_0103_D40R0104_014A

scr_seq_0103_D40R0104_0142:
	apply_movement 0, scr_seq_0103_D40R0104_0154
scr_seq_0103_D40R0104_014A:
	wait_movement
	wait 30, VAR_SPECIAL_x800C
	end


scr_seq_0103_D40R0104_0154:
	.short 1, 1
	.short 71, 1
	.short 12, 1
	.short 72, 1
	.short 254, 0

scr_seq_0103_D40R0104_0168:
	.short 3, 1
	.short 71, 1
	.short 14, 1
	.short 72, 1
	.short 254, 0
	.balign 4, 0
