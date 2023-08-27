#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T27PC0101.h"
#include "msgdata/msg/msg_0615_T27PC0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T27PC0101_000
	scrdef scr_seq_T27PC0101_001
	scrdef scr_seq_T27PC0101_002
	scrdef scr_seq_T27PC0101_003
	scrdef scr_seq_T27PC0101_004
	scrdef_end

scr_seq_T27PC0101_000:
	setvar VAR_SPECIAL_x8007, 0
	callstd std_nurse_joy
	end

scr_seq_T27PC0101_001:
	scrcmd_609
	lockall
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_T27PC0101_masaki, _0084
	apply_movement obj_player, _00A0
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	buffer_players_name 0
	npc_msg msg_0615_T27PC0101_00000
	npc_msg msg_0615_T27PC0101_00001
	closemsg
	apply_movement obj_T27PC0101_masaki, _00AC
	apply_movement obj_player, _00C0
	wait_movement
	hide_person obj_T27PC0101_masaki
	setflag FLAG_UNK_1C5
	clearflag FLAG_HIDE_GOLDENROD_BILL
	setflag FLAG_SYS_MET_BILL
	setvar VAR_UNK_410D, 1
	releaseall
	end
	.byte 0x00

_0084:
	step 13, 4
	step 15, 6
	step 12, 2
	step 62, 12
	step 1, 1
	step 62, 4
	step_end

_00A0:
	step 62, 20
	step 12, 4
	step_end

_00AC:
	step 15, 1
	step 13, 4
	step 14, 1
	step 13, 2
	step_end

_00C0:
	step 62, 6
	step 1, 1
	step_end
scr_seq_T27PC0101_002:
	simple_npc_msg msg_0615_T27PC0101_00002
	end

scr_seq_T27PC0101_003:
	simple_npc_msg msg_0615_T27PC0101_00003
	end

scr_seq_T27PC0101_004:
	simple_npc_msg msg_0615_T27PC0101_00004
	end
	.balign 4, 0
