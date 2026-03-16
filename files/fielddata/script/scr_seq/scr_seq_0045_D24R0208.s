#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0208.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D24R0208_000
	scrdef scr_seq_D24R0208_001
	scrdef scr_seq_D24R0208_002
	scrdef_end

scr_seq_D24R0208_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	alph_puzzle 3
	restore_overworld
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	goto_if_set FLAG_SYS_ALPH_PUZZLE_HO_OH, _0042
	releaseall
	end

_0042:
	wait 2, VAR_SPECIAL_x8004
	screen_shake 0, 2, 10, 6
	wait 10, VAR_SPECIAL_x8004
	apply_movement obj_player, _0298
	wait_movement
	hide_person obj_D24R0208_babyboy1_13
	play_se SEQ_SE_DP_KI_GASYAN
	clearflag FLAG_UNK_111
	setflag FLAG_UNK_222
	clearflag FLAG_HIDE_RUINS_OF_ALPH_ASSISTANTS
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0096
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _00A6
	end

_0096:
	apply_movement obj_player, _0228
	wait_movement
	goto _00B8

_00A6:
	apply_movement obj_player, _0228
	apply_movement obj_partner_poke, _0234
	wait_movement
_00B8:
	setvar VAR_UNK_40CE, 1
	compare VAR_UNK_40EC, 1
	goto_if_ge _0103
	play_se SEQ_SE_GS_RAKKA01
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL, 0, 5, 24, DIR_NORTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	setvar VAR_UNK_40E0, 1
	addvar VAR_UNK_40EC, 1
	releaseall
	end

_0103:
	setflag FLAG_HIDE_RUINS_OF_ALPH_ASSISTANTS
	play_se SEQ_SE_GS_RAKKA01
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL, 0, 5, 24, DIR_NORTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	setvar VAR_UNK_40E0, 1
	addvar VAR_UNK_40EC, 1
	releaseall
	end

scr_seq_D24R0208_002:
	scrcmd_609
	lockall
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0163
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0173
	end

_0163:
	apply_movement obj_player, _0228
	wait_movement
	goto _0185

_0173:
	apply_movement obj_player, _0228
	apply_movement obj_partner_poke, _0234
	wait_movement
_0185:
	setvar VAR_UNK_40CE, 1
	play_se SEQ_SE_GS_RAKKA01
	compare VAR_UNOWN_REPORT_LEVEL, 7
	goto_if_ge _01D1
	compare VAR_UNOWN_REPORT_LEVEL, 6
	goto_if_eq _01FB
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL, 0, 5, 24, DIR_NORTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
_01CD:
	releaseall
	end

_01D1:
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT_2, 0, 5, 24, DIR_NORTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	goto _01CD

_01FB:
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT, 0, 5, 24, DIR_NORTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	goto _01CD

	.balign 4, 0
_0228:
	WalkOnSpotFasterNorth 4
	SetInvisible
	EndMovement

	.balign 4, 0
_0234:
	Delay4 3
	WalkFasterNorth
	SetInvisible
	EndMovement

scr_seq_D24R0208_001:
	scrcmd_609
	lockall
	open_alph_hidden_room 3
	player_has_species VAR_SPECIAL_RESULT, SPECIES_HO_OH
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0264
	goto _0268

_0264:
	releaseall
	end

_0268:
	wait 2, VAR_SPECIAL_x8004
	screen_shake 0, 2, 10, 6
	wait 10, VAR_SPECIAL_x8004
	apply_movement obj_player, _0298
	wait_movement
	hide_person obj_D24R0208_babyboy1_12
	setflag FLAG_OPENED_ALPH_HO_OH_SECRET_ROOM
	play_se SEQ_SE_DP_UG_008
	releaseall
	end

	.balign 4, 0
_0298:
	EmoteExclamationMark
	EndMovement
	.balign 4, 0
