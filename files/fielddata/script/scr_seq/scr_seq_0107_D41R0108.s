#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0107_D41R0108_0006 ; 000
	scrdef_end

scr_seq_0107_D41R0108_0006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	closemsg
	trainer_battle TRAINER_PKMN_TRAINER_RED_RED, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0107_D41R0108_0098
	npc_msg 1
	wait 30, VAR_SPECIAL_x800C
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	hide_person 0
	setflag FLAG_UNK_25F
	setvar VAR_UNK_40FD, 1
	comparevartovalue VAR_UNK_4131, 0
	callif eq, scr_seq_0107_D41R0108_009E
	fade_screen 6, 1, 1, 0
	wait_fade
	call scr_seq_0107_D41R0108_00B2
	wait 60, VAR_SPECIAL_x800C
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_163 1
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0107_D41R0108_0098:
	white_out
	releaseall
	end

scr_seq_0107_D41R0108_009E:
	setvar VAR_UNK_4131, 1
	clearflag FLAG_UNK_2FE
	clearflag FLAG_UNK_300
	clearflag FLAG_UNK_2FF
	return

scr_seq_0107_D41R0108_00B2:
	get_party_count VAR_SPECIAL_x8004
	setvar VAR_SPECIAL_x8005, 0
scr_seq_0107_D41R0108_00BC:
	get_partymon_species VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0107_D41R0108_00D5
	give_ribbon VAR_SPECIAL_x8005, RIBBON_LEGEND
scr_seq_0107_D41R0108_00D5:
	addvar VAR_SPECIAL_x8005, 1
	comparevartovar VAR_SPECIAL_x8005, VAR_SPECIAL_x8004
	gotoif lt, scr_seq_0107_D41R0108_00BC
	return
	.balign 4, 0
