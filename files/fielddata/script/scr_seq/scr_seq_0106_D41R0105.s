#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D41R0105.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D41R0105_000
	scrdef scr_seq_D41R0105_001
	scrdef_end

scr_seq_D41R0105_001:
	goto_if_set FLAG_ENGAGING_STATIC_POKEMON, _0017
	end

_0017:
	setflag FLAG_HIDE_MT_SILVER_CAVE_MOLTRES
	hide_person obj_D41R0105_tsure_poke_static_moltres
	clearflag FLAG_ENGAGING_STATIC_POKEMON
	end

scr_seq_D41R0105_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_MOLTRES, 0
	wait_cry
	setflag FLAG_ENGAGING_STATIC_POKEMON
	wild_battle SPECIES_MOLTRES, 50, 0
	clearflag FLAG_ENGAGING_STATIC_POKEMON
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0077
	scrcmd_683 VAR_TEMP_x4002
	compare VAR_TEMP_x4002, 3
	goto_if_eq _0073
	compare VAR_TEMP_x4002, 4
	call_if_eq _007D
_0073:
	releaseall
	end

_0077:
	white_out
	releaseall
	end

_007D:
	setflag FLAG_CAUGHT_MOLTRES
	return
	.balign 4, 0
