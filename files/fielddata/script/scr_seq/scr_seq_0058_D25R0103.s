#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D25R0103.h"
#include "msgdata/msg/msg_0089_D25R0103.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D25R0103_000
	scrdef scr_seq_D25R0103_001
	scrdef scr_seq_D25R0103_002
	scrdef_end

scr_seq_D25R0103_002:
	goto_if_set FLAG_DAILY_CAUGHT_LAPRAS, _003A
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 5
	goto_if_ne _0034
	clearflag FLAG_HIDE_UNION_CAVE_LAPRAS
	goto _0038

_0034:
	setflag FLAG_HIDE_UNION_CAVE_LAPRAS
_0038:
	end

_003A:
	setflag FLAG_HIDE_UNION_CAVE_LAPRAS
	end

scr_seq_D25R0103_001:
	goto_if_set FLAG_ENGAGING_STATIC_POKEMON, _004D
	end

_004D:
	setflag FLAG_HIDE_UNION_CAVE_LAPRAS
	hide_person obj_D25R0103_rapurasu
	end

scr_seq_D25R0103_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_LAPRAS, 0
	wait_cry
	setflag FLAG_ENGAGING_STATIC_POKEMON
	wild_battle SPECIES_LAPRAS, 20, 0
	clearflag FLAG_ENGAGING_STATIC_POKEMON
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _008F
	setflag FLAG_DAILY_CAUGHT_LAPRAS
	releaseall
	end

_008F:
	white_out
	releaseall
	end
	.balign 4, 0
