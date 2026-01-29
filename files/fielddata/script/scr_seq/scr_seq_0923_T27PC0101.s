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

	.balign 4, 0
_0084:
	WalkNormalSouth 4
	WalkNormalEast 6
	WalkNormalNorth 2
	Delay4 12
	FaceSouth
	Delay4 4
	EndMovement

	.balign 4, 0
_00A0:
	Delay4 20
	WalkNormalNorth 4
	EndMovement

	.balign 4, 0
_00AC:
	WalkNormalEast
	WalkNormalSouth 4
	WalkNormalWest
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_00C0:
	Delay4 6
	FaceSouth
	EndMovement

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
