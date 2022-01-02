#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D02R0101.h"
#include "msgdata/msg/msg_0049_D02R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D02R0101_000
	scrdef_end

scr_seq_D02R0101_000:
	callstd std_play_rival_intro_music
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_D02R0101_gsrivel, _00D0
	apply_movement obj_player, _00DC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	buffer_players_name 0
	buffer_rivals_name 1
	npc_msg msg_0049_D02R0101_00000
	closemsg
	get_starter_choice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 152
	gotoif ne, _005A
	trainer_battle TRAINER_RIVAL_SILVER_15, 0, 0, 0
	goto _007D

_005A:
	comparevartovalue VAR_SPECIAL_x800C, 155
	gotoif ne, _0075
	trainer_battle TRAINER_RIVAL_SILVER_16, 0, 0, 0
	goto _007D

_0075:
	trainer_battle TRAINER_RIVAL_SILVER_14, 0, 0, 0
_007D:
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _00C9
	callstd std_play_rival_outro_music
	buffer_players_name 0
	buffer_rivals_name 1
	npc_msg msg_0049_D02R0101_00001
	closemsg
	apply_movement obj_D02R0101_gsrivel, _00E8
	wait_movement
	hide_person obj_D02R0101_gsrivel
	callstd std_fade_end_rival_outro_music
	setflag FLAG_UNK_25C
	clearflag FLAG_HIDE_DRAGONS_DEN_RIVAL
	setvar VAR_UNK_40FC, 1
	setvar VAR_UNK_40F5, 1
	setflag FLAG_UNK_0E3
	end

_00C9:
	white_out
	end
	.byte 0x00, 0x00, 0x00

_00D0:
	step 75, 1
	step 14, 4
	step_end

_00DC:
	step 63, 4
	step 15, 1
	step_end

_00E8:
	step 19, 5
	step 17, 9
	step_end
	.byte 0x02, 0x00, 0x00, 0x00
	.balign 4, 0
