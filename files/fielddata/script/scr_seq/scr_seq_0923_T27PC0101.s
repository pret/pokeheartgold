#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0923_T27PC0101_0016 ; 000
	scrdef scr_seq_0923_T27PC0101_0022 ; 001
	scrdef scr_seq_0923_T27PC0101_00CC ; 002
	scrdef scr_seq_0923_T27PC0101_00DF ; 003
	scrdef scr_seq_0923_T27PC0101_00F2 ; 004
	scrdef_end

scr_seq_0923_T27PC0101_0016:
	setvar VAR_SPECIAL_x8007, 0
	callstd std_nurse_joy
	end

scr_seq_0923_T27PC0101_0022:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 4, scr_seq_0923_T27PC0101_0084
	apply_movement 255, scr_seq_0923_T27PC0101_00A0
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	buffer_players_name 0
	npc_msg 0
	npc_msg 1
	closemsg
	apply_movement 4, scr_seq_0923_T27PC0101_00AC
	apply_movement 255, scr_seq_0923_T27PC0101_00C0
	wait_movement
	hide_person 4
	setflag FLAG_UNK_1C5
	clearflag FLAG_UNK_23E
	setflag FLAG_UNK_976
	setvar VAR_UNK_410D, 1
	releaseall
	end

scr_seq_0923_T27PC0101_0083:
	.byte 0x00

scr_seq_0923_T27PC0101_0084:
	step 13, 4
	step 15, 6
	step 12, 2
	step 62, 12
	step 1, 1
	step 62, 4
	step_end

scr_seq_0923_T27PC0101_00A0:
	step 62, 20
	step 12, 4
	step_end

scr_seq_0923_T27PC0101_00AC:
	step 15, 1
	step 13, 4
	step 14, 1
	step 13, 2
	step_end

scr_seq_0923_T27PC0101_00C0:
	step 62, 6
	step 1, 1
	step_end
scr_seq_0923_T27PC0101_00CC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0923_T27PC0101_00DF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0923_T27PC0101_00F2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
