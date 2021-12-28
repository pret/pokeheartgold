#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0963_W40R0101_003E ; 000
	scrdef scr_seq_0963_W40R0101_000E ; 001
	scrdef scr_seq_0963_W40R0101_00EC ; 002
	scrdef_end

scr_seq_0963_W40R0101_000E:
	comparevartovalue VAR_UNK_40E5, 1
	gotoif ge, scr_seq_0963_W40R0101_0036
	checkflag FLAG_UNK_964
	gotoif TRUE, scr_seq_0963_W40R0101_0028
	end

scr_seq_0963_W40R0101_0028:
	move_person 0, 3, 0, 3, 0
	end

scr_seq_0963_W40R0101_0036:
	setvar VAR_UNK_40E5, 2
	end

scr_seq_0963_W40R0101_003E:
	play_se SEQ_SE_DP_SELECT
	lockall
	checkflag FLAG_UNK_0FB
	gotoif TRUE, scr_seq_0963_W40R0101_00BE
	checkflag FLAG_UNK_964
	gotoif TRUE, scr_seq_0963_W40R0101_00B1
	scrcmd_386 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_0963_W40R0101_0079
	apply_movement 0, scr_seq_0963_W40R0101_00E4
	goto scr_seq_0963_W40R0101_009C

scr_seq_0963_W40R0101_0079:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0963_W40R0101_0094
	apply_movement 0, scr_seq_0963_W40R0101_00DC
	goto scr_seq_0963_W40R0101_009C

scr_seq_0963_W40R0101_0094:
	apply_movement 0, scr_seq_0963_W40R0101_00D4
scr_seq_0963_W40R0101_009C:
	wait_movement
	npc_msg 0
	closemsg
	apply_movement 0, scr_seq_0963_W40R0101_00CC
	wait_movement
	releaseall
	end

scr_seq_0963_W40R0101_00B1:
	npc_msg 1
	closemsg
	releaseall
	setflag FLAG_UNK_0FB
	end

scr_seq_0963_W40R0101_00BE:
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0963_W40R0101_00C9:
	.byte 0x00, 0x00, 0x00

scr_seq_0963_W40R0101_00CC:
	.short 32, 1
	.short 254, 0

scr_seq_0963_W40R0101_00D4:
	.short 33, 1
	.short 254, 0

scr_seq_0963_W40R0101_00DC:
	.short 35, 1
	.short 254, 0

scr_seq_0963_W40R0101_00E4:
	.short 34, 1
	.short 254, 0
scr_seq_0963_W40R0101_00EC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_964
	gotoif TRUE, scr_seq_0963_W40R0101_0108
	npc_msg 3
	goto scr_seq_0963_W40R0101_010B

scr_seq_0963_W40R0101_0108:
	npc_msg 4
scr_seq_0963_W40R0101_010B:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
