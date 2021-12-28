#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0821_T10R0301_0025 ; 000
	scrdef scr_seq_0821_T10R0301_0068 ; 001
	scrdef scr_seq_0821_T10R0301_000E ; 002
	scrdef_end

scr_seq_0821_T10R0301_000E:
	checkflag FLAG_UNK_0E5
	gotoif TRUE, scr_seq_0821_T10R0301_0023
	scrcmd_375 3
	scrcmd_375 4
	end

scr_seq_0821_T10R0301_0023:
	end

scr_seq_0821_T10R0301_0025:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0821_T10R0301_0060
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	play_se SEQ_SE_DP_KI_GASYAN
	clearflag FLAG_UNK_20C
	show_person 1
	setvar VAR_TEMP_x4001, 1
	releaseall
	end

scr_seq_0821_T10R0301_005D:
	.byte 0x00, 0x00, 0x00

scr_seq_0821_T10R0301_0060:
	.short 12, 6
	.short 254, 0
scr_seq_0821_T10R0301_0068:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0E5
	gotoif TRUE, scr_seq_0821_T10R0301_00D1
	npc_msg 0
	closemsg
	comparevartovalue VAR_UNK_4135, 8
	gotoif lt, scr_seq_0821_T10R0301_009B
	trainer_battle TRAINER_ELITE_FOUR_KOGA_KOGA_2, 0, 0, 0
	goto scr_seq_0821_T10R0301_00A3

scr_seq_0821_T10R0301_009B:
	trainer_battle TRAINER_ELITE_FOUR_KOGA_KOGA, 0, 0, 0
scr_seq_0821_T10R0301_00A3:
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0821_T10R0301_00DC
	setflag FLAG_UNK_0E5
	npc_msg 1
	closemsg
	play_se SEQ_SE_DP_KI_GASYAN
	hide_person 2
	hide_person 3
	hide_person 4
	releaseall
	end

scr_seq_0821_T10R0301_00D1:
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0821_T10R0301_00DC:
	white_out
	releaseall
	end
	.balign 4, 0
