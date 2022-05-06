#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R11.h"
#include "msgdata/msg/msg_0346_R11.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R11_000
	scrdef scr_seq_R11_001
	scrdef scr_seq_R11_002
	scrdef scr_seq_R11_003
	scrdef_end

scr_seq_R11_001:
	goto_if_set FLAG_ENGAGING_STATIC_POKEMON, _002A
	goto_if_set FLAG_SNORLAX_MEET, _0044
	end

_002A:
	setflag FLAG_HIDE_ROUTE_11_SNORLAX
	hide_person obj_R11_kabigon
	hide_person obj_R11_gsbabyboy1_2
	hide_person obj_R11_gsbabyboy1
	hide_person obj_R11_gsbabyboy1_3
	clearflag FLAG_ENGAGING_STATIC_POKEMON
	end

_0044:
	end

scr_seq_R11_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	radio_music_is_playing 5, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _006A
	npc_msg msg_0346_R11_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_006A:
	play_cry SPECIES_SNORLAX, 0
	npc_msg msg_0346_R11_00003
	wait_cry
	closemsg
	setflag FLAG_ENGAGING_STATIC_POKEMON
	wild_battle SPECIES_SNORLAX, 50, 0
	clearflag FLAG_ENGAGING_STATIC_POKEMON
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _00B4
	scrcmd_683 VAR_TEMP_x4005
	compare VAR_TEMP_x4005, 4
	call_if_eq _00BA
	setflag FLAG_UNK_998
	setflag FLAG_SNORLAX_MEET
	releaseall
	end

_00B4:
	white_out
	releaseall
	end

_00BA:
	setflag FLAG_CAUGHT_SNORLAX
	return

scr_seq_R11_002:
	direction_signpost msg_0346_R11_00000, 1, 2, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R11_003:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0346_R11_00001, VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
