#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R18R0101.h"
#include "msgdata/msg/msg_0359_R18R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R18R0101_000
	scrdef scr_seq_R18R0101_001
	scrdef scr_seq_R18R0101_002
	scrdef scr_seq_R18R0101_003
	scrdef_end

scr_seq_R18R0101_001:
	goto_if_set FLAG_UNK_149, _001F
	end

_001F:
	scrcmd_186 1
	end

scr_seq_R18R0101_002:
	scrcmd_609
	lockall
	player_on_bike_check VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _006A
	apply_movement obj_player, _0084
	wait_movement
	npc_msg msg_0359_R18R0101_00001
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_player, _008C
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	releaseall
	end

_006A:
	scrcmd_186 1
	setvar VAR_UNK_4129, 1
	setvar VAR_UNK_412A, 1
	setflag FLAG_UNK_149
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0084:
	step 32, 1
	step_end

_008C:
	step 15, 1
	step_end
scr_seq_R18R0101_003:
	scrcmd_186 0
	setvar VAR_UNK_4129, 0
	setvar VAR_UNK_412A, 0
	clearflag FLAG_UNK_149
	end

scr_seq_R18R0101_000:
	simple_npc_msg msg_0359_R18R0101_00000
	end
	.balign 4, 0
