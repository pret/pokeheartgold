#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0130_D51R0101_002F ; 000
	scrdef scr_seq_0130_D51R0101_00B8 ; 001
	scrdef scr_seq_0130_D51R0101_0012 ; 002
	scrdef scr_seq_0130_D51R0101_011C ; 003
	scrdef_end

scr_seq_0130_D51R0101_0012:
	comparevartovalue VAR_UNK_40FB, 5
	gotoif eq, scr_seq_0130_D51R0101_0021
	end

scr_seq_0130_D51R0101_0021:
	move_person 0, 13, 1, 28, 0
	end

scr_seq_0130_D51R0101_002F:
	scrcmd_609
	lockall
	apply_movement 0, scr_seq_0130_D51R0101_007C
	wait_movement
	apply_movement 255, scr_seq_0130_D51R0101_0094
	wait_movement
	npc_msg 0
	closemsg
	apply_movement 0, scr_seq_0130_D51R0101_009C
	wait_movement
	npc_msg 1
	closemsg
	apply_movement 0, scr_seq_0130_D51R0101_00A8
	wait_movement
	move_person 0, 13, 1, 28, 0
	setvar VAR_UNK_40FB, 5
	releaseall
	end

scr_seq_0130_D51R0101_007B:
	.byte 0x00

scr_seq_0130_D51R0101_007C:
	step 32, 1
	step 75, 1
	step 63, 1
	step 12, 3
	step 34, 1
	step_end

scr_seq_0130_D51R0101_0094:
	step 35, 1
	step_end

scr_seq_0130_D51R0101_009C:
	step 75, 1
	step 63, 1
	step_end

scr_seq_0130_D51R0101_00A8:
	step 13, 4
	step 14, 1
	step 13, 4
	step_end
scr_seq_0130_D51R0101_00B8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	closemsg
	apply_movement 0, scr_seq_0130_D51R0101_0108
	wait_movement
	scrcmd_307 0, 0, 20, 25, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement 0, scr_seq_0130_D51R0101_0114
	wait_movement
	hide_person 0
	setflag FLAG_UNK_2DB
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	setvar VAR_UNK_40FB, 6
	releaseall
	end

scr_seq_0130_D51R0101_0105:
	.byte 0x00, 0x00, 0x00

scr_seq_0130_D51R0101_0108:
	step 15, 7
	step 12, 2
	step_end

scr_seq_0130_D51R0101_0114:
	step 12, 1
	step_end
scr_seq_0130_D51R0101_011C:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 7, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
