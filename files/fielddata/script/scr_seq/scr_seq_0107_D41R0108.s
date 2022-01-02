#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D41R0108.h"
#include "msgdata/msg/msg_0126_D41R0108.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D41R0108_000
	scrdef_end

scr_seq_D41R0108_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0126_D41R0108_00000
	closemsg
	trainer_battle TRAINER_PKMN_TRAINER_RED_RED, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0098
	npc_msg msg_0126_D41R0108_00001
	wait 30, VAR_SPECIAL_x800C
	fade_screen 6, 1, 0, 0x00
	wait_fade
	closemsg
	hide_person obj_D41R0108_red
	setflag FLAG_UNK_25F
	setvar VAR_UNK_40FD, 1
	comparevartovalue VAR_UNK_4131, 0
	callif eq, _009E
	fade_screen 6, 1, 1, 0x00
	wait_fade
	call _00B2
	wait 60, VAR_SPECIAL_x800C
	fade_screen 6, 1, 0, 0x00
	wait_fade
	hof_credits 1
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

_0098:
	white_out
	releaseall
	end

_009E:
	setvar VAR_UNK_4131, 1
	clearflag FLAG_HIDE_OAKS_LAB_BULBASAUR_BALL
	clearflag FLAG_HIDE_OAKS_LAB_CHARMANDER_BALL
	clearflag FLAG_HIDE_OAKS_LAB_SQUIRTLE_BALL
	return

_00B2:
	get_party_count VAR_SPECIAL_x8004
	setvar VAR_SPECIAL_x8005, 0
_00BC:
	get_partymon_species VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _00D5
	give_ribbon VAR_SPECIAL_x8005, RIBBON_LEGEND
_00D5:
	addvar VAR_SPECIAL_x8005, 1
	comparevartovar VAR_SPECIAL_x8005, VAR_SPECIAL_x8004
	gotoif lt, _00BC
	return
	.balign 4, 0
