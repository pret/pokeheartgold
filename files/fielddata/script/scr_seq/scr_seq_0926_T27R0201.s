#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0926_T27R0201_002D ; 000
	scrdef scr_seq_0926_T27R0201_0114 ; 001
	scrdef scr_seq_0926_T27R0201_016D ; 002
	scrdef scr_seq_0926_T27R0201_0012 ; 003
	scrdef_end

scr_seq_0926_T27R0201_0012:
	checkflag FLAG_UNK_108
	gotoif TRUE, scr_seq_0926_T27R0201_001F
	end

scr_seq_0926_T27R0201_001F:
	move_person 0, 16, 0, 8, 2
	end

scr_seq_0926_T27R0201_002D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_108
	gotoif TRUE, scr_seq_0926_T27R0201_00E8
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ge, scr_seq_0926_T27R0201_00C9
	scrcmd_386 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0926_T27R0201_00D4
	check_badge 3, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0926_T27R0201_0096
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_0926_T27R0201_008B
	npc_msg 0
	goto scr_seq_0926_T27R0201_008E

scr_seq_0926_T27R0201_008B:
	npc_msg 1
scr_seq_0926_T27R0201_008E:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0926_T27R0201_0096:
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_0926_T27R0201_00B0
	npc_msg 2
	goto scr_seq_0926_T27R0201_00B3

scr_seq_0926_T27R0201_00B0:
	npc_msg 3
scr_seq_0926_T27R0201_00B3:
	closemsg
	apply_movement 0, scr_seq_0926_T27R0201_00F4
	wait_movement
	setvar VAR_TEMP_x4002, 1
	releaseall
	end

scr_seq_0926_T27R0201_00C9:
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0926_T27R0201_00D4:
	apply_movement 0, scr_seq_0926_T27R0201_0104
	wait_movement
	setvar VAR_TEMP_x4002, 1
	releaseall
	end

scr_seq_0926_T27R0201_00E8:
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0926_T27R0201_00F3:
	.byte 0x00

scr_seq_0926_T27R0201_00F4:
	.short 12, 1
	.short 15, 1
	.short 2, 1
	.short 254, 0

scr_seq_0926_T27R0201_0104:
	.short 13, 1
	.short 15, 1
	.short 2, 1
	.short 254, 0
scr_seq_0926_T27R0201_0114:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_108
	gotoif TRUE, scr_seq_0926_T27R0201_0162
	checkflag FLAG_UNK_103
	gotoif TRUE, scr_seq_0926_T27R0201_0157
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_0926_T27R0201_014C
	npc_msg 6
	goto scr_seq_0926_T27R0201_014F

scr_seq_0926_T27R0201_014C:
	npc_msg 7
scr_seq_0926_T27R0201_014F:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0926_T27R0201_0157:
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0926_T27R0201_0162:
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0926_T27R0201_016D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
