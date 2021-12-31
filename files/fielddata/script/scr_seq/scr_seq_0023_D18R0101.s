#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D18R0101.h"
#include "msgdata/msg/msg_0060_D18R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D18R0101_000
	scrdef scr_seq_D18R0101_001
	scrdef scr_seq_D18R0101_002
	scrdef scr_seq_D18R0101_003
	scrdef_end

scr_seq_D18R0101_003:
	scrcmd_609
	lockall
	callstd std_play_rival_intro_music
	apply_movement obj_D18R0101_gsrivel, _00D0
	wait_movement
	buffer_rivals_name 0
	npc_msg msg_0060_D18R0101_00000
	closemsg
	get_starter_choice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 152
	gotoif ne, _004B
	trainer_battle TRAINER_RIVAL_SILVER_8, 0, 0, 0
	goto _006E

_004B:
	comparevartovalue VAR_SPECIAL_x800C, 155
	gotoif ne, _0066
	trainer_battle TRAINER_RIVAL_SILVER_11, 0, 0, 0
	goto _006E

_0066:
	trainer_battle TRAINER_RIVAL_SILVER_4, 0, 0, 0
_006E:
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _00C7
	callstd std_play_rival_outro_music
	buffer_rivals_name 0
	npc_msg msg_0060_D18R0101_00001
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement obj_player, _00E8
	apply_movement obj_D18R0101_gsrivel, _00F8
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	hide_person 0
	callstd std_fade_end_rival_outro_music
	setflag FLAG_UNK_1C6
	setvar VAR_UNK_40A6, 1
	releaseall
	end

_00C7:
	white_out
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_00D0:
	step 1, 1
	step 75, 1
	step 13, 4
	step 14, 1
	step 1, 1
	step_end

_00E8:
	step 13, 2
	step 15, 1
	step 2, 1
	step_end

_00F8:
	step 13, 3
	step 14, 1
	step 13, 1
	step 14, 3
	step 13, 1
	step 14, 4
	step 13, 3
	step_end
scr_seq_D18R0101_000:
	scrcmd_609
	lockall
	callstd 2042
	apply_movement obj_D18R0101_minaki, _0158
	wait_movement
	buffer_players_name 0
	npc_msg msg_0060_D18R0101_00002
	waitbutton
	closemsg
	callstd 2043
	setvar VAR_UNK_40A2, 1
	releaseall
	end

scr_seq_D18R0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0060_D18R0101_00003
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0158:
	step 2, 1
	step 75, 1
	step 14, 3
	step_end
scr_seq_D18R0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0060_D18R0101_00004
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
