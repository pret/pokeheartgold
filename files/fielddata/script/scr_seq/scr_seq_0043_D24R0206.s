#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0206.h"
#include "msgdata/msg/msg_0077_D24R0206.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D24R0206_000
	scrdef scr_seq_D24R0206_001
	scrdef scr_seq_D24R0206_002
	scrdef scr_seq_D24R0206_003
	scrdef_end

scr_seq_D24R0206_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	alph_puzzle 2
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	goto_if_set FLAG_SYS_ALPH_PUZZLE_OMANYTE, _0046
	releaseall
	end

_0046:
	wait 2, VAR_SPECIAL_x8004
	scrcmd_561 0, 2, 10, 6
	wait 10, VAR_SPECIAL_x8004
	apply_movement obj_player, _02A4
	wait_movement
	hide_person obj_D24R0206_babyboy1_13
	play_se SEQ_SE_DP_KI_GASYAN
	clearflag FLAG_UNK_111
	setflag FLAG_UNK_220
	clearflag FLAG_HIDE_RUINS_OF_ALPH_ASSISTANTS
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _009A
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _00AA
	end

_009A:
	apply_movement obj_player, _022C
	wait_movement
	goto _00BC

_00AA:
	apply_movement obj_player, _022C
	apply_movement obj_partner_poke, _0238
	wait_movement
_00BC:
	setvar VAR_UNK_40CE, 1
	compare VAR_UNK_40EC, 1
	goto_if_ge _0107
	play_se SEQ_SE_GS_RAKKA01
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_D24R0205, 0, 5, 42, DIR_NORTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	setvar VAR_UNK_40DF, 1
	addvar VAR_UNK_40EC, 1
	releaseall
	end

_0107:
	setflag FLAG_HIDE_RUINS_OF_ALPH_ASSISTANTS
	play_se SEQ_SE_GS_RAKKA01
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_D24R0205, 0, 5, 42, DIR_NORTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	setvar VAR_UNK_40DF, 1
	addvar VAR_UNK_40EC, 1
	releaseall
	end

scr_seq_D24R0206_003:
	scrcmd_609
	lockall
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0167
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0177
	end

_0167:
	apply_movement obj_player, _022C
	wait_movement
	goto _0189

_0177:
	apply_movement obj_player, _022C
	apply_movement obj_partner_poke, _0238
	wait_movement
_0189:
	setvar VAR_UNK_40CE, 1
	play_se SEQ_SE_GS_RAKKA01
	compare VAR_UNOWN_REPORT_LEVEL, 7
	goto_if_ge _01D5
	compare VAR_UNOWN_REPORT_LEVEL, 6
	goto_if_eq _01FF
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_D24R0205, 0, 5, 42, DIR_NORTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
_01D1:
	releaseall
	end

_01D5:
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_D24R0218, 0, 5, 42, DIR_NORTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	goto _01D1

_01FF:
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_D24R0216, 0, 5, 42, DIR_NORTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	goto _01D1
	.byte 0x00, 0x00, 0x00

_022C:
	step 40, 4
	step 69, 1
	step_end

_0238:
	step 62, 3
	step 20, 1
	step 69, 1
	step_end
scr_seq_D24R0206_001:
	scrcmd_609
	lockall
	scrcmd_714 2
	releaseall
	end

scr_seq_D24R0206_002:
	scrcmd_609
	lockall
	goto_if_set FLAG_OPENED_ALPH_WATER_STONE_SECRET_ROOM, _0292
	wait 2, VAR_SPECIAL_x8004
	scrcmd_561 0, 2, 10, 6
	wait 10, VAR_SPECIAL_x8004
	apply_movement obj_player, _02A4
	wait_movement
	hide_person obj_D24R0206_babyboy1_12
	setflag FLAG_OPENED_ALPH_WATER_STONE_SECRET_ROOM
	play_se SEQ_SE_DP_UG_008
	releaseall
	end

_0292:
	wait 10, VAR_SPECIAL_x8004
	npc_msg msg_0077_D24R0206_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00

_02A4:
	step 75, 1
	step_end
	.balign 4, 0
