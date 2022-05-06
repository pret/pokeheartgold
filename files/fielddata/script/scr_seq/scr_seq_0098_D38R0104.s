#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D38R0104.h"
#include "msgdata/msg/msg_0121_D38R0104.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D38R0104_000
	scrdef_end

scr_seq_D38R0104_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_GOT_TYROGUE_FROM_KARATE_KING, _0097
	goto_if_set FLAG_BEAT_KARATE_KING, _0046
	npc_msg msg_0121_D38R0104_00000
	closemsg
	trainer_battle TRAINER_BLACK_BELT_KIYO, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _00CC
	setflag FLAG_BEAT_KARATE_KING
_0046:
	npc_msg msg_0121_D38R0104_00001
	get_party_count VAR_SPECIAL_x8005
	compare VAR_SPECIAL_x8005, 6
	goto_if_ne _0063
	npc_msg msg_0121_D38R0104_00004
	goto _00D2

_0063:
	buffer_players_name 0
	npc_msg msg_0121_D38R0104_00002
	play_fanfare SEQ_ME_POKEGET
	wait_fanfare
	give_mon SPECIES_TYROGUE, 10, 0, 0, 0, VAR_SPECIAL_RESULT
	npc_msg msg_0121_D38R0104_00005
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	closemsg
	compare VAR_SPECIAL_RESULT, 0
	call_if_eq _00A6
	touchscreen_menu_show
_0097:
	setflag FLAG_GOT_TYROGUE_FROM_KARATE_KING
	npc_msg msg_0121_D38R0104_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_00A6:
	setvar VAR_TEMP_x4000, 0
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	nickname_input VAR_SPECIAL_x8005, VAR_TEMP_x4000
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	return

_00CC:
	white_out
	releaseall
	end

_00D2:
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
