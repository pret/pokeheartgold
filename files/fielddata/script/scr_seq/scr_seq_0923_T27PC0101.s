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
	callstd 2002
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
	.short 13, 4
	.short 15, 6
	.short 12, 2
	.short 62, 12
	.short 1, 1
	.short 62, 4
	.short 254, 0

scr_seq_0923_T27PC0101_00A0:
	.short 62, 20
	.short 12, 4
	.short 254, 0

scr_seq_0923_T27PC0101_00AC:
	.short 15, 1
	.short 13, 4
	.short 14, 1
	.short 13, 2
	.short 254, 0

scr_seq_0923_T27PC0101_00C0:
	.short 62, 6
	.short 1, 1
	.short 254, 0
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
