#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D47.h"
#include "msgdata/msg/msg_0133_D47.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D47_000
	scrdef scr_seq_D47_001
	scrdef scr_seq_D47_002
	scrdef scr_seq_D47_003
	scrdef scr_seq_D47_004
	scrdef scr_seq_D47_005
	scrdef scr_seq_D47_006
	scrdef scr_seq_D47_007
	scrdef scr_seq_D47_008
	scrdef scr_seq_D47_009
	scrdef scr_seq_D47_010
	scrdef scr_seq_D47_011
	scrdef scr_seq_D47_012
	scrdef scr_seq_D47_013
	scrdef scr_seq_D47_014
	scrdef scr_seq_D47_015
	scrdef scr_seq_D47_016
	scrdef_end

scr_seq_D47_014:
	goto_if_unset FLAG_UNK_189, _0057
	clearflag FLAG_UNK_189
	end

_0057:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 2
	goto_if_eq _007B
	compare VAR_TEMP_x4000, 4
	goto_if_eq _007B
	setflag FLAG_HIDE_CAMERON
	end

_007B:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_D47_000:
	simple_npc_msg msg_0133_D47_00002
	end

scr_seq_D47_001:
	simple_npc_msg msg_0133_D47_00003
	end

scr_seq_D47_002:
	simple_npc_msg msg_0133_D47_00004
	end

scr_seq_D47_003:
	simple_npc_msg msg_0133_D47_00005
	end

scr_seq_D47_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_JIGGLYPUFF, 0
	npc_msg msg_0133_D47_00006
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D47_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_TEMP_x400B, 0
	goto_if_ne _0106
	npc_msg msg_0133_D47_00007
	goto _0109

_0106:
	npc_msg msg_0133_D47_00008
_0109:
	wait_button_or_walk_away
	closemsg
	releaseall
	compare VAR_TEMP_x400B, 0
	goto_if_ne _0128
	addvar VAR_TEMP_x400B, 1
	goto _012E

_0128:
	setvar VAR_TEMP_x400B, 0
_012E:
	end

scr_seq_D47_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0133_D47_00009
	callstd std_mart_intro
	holdmsg
	setvar VAR_SPECIAL_x8004, 6
	callstd std_special_mart
	releaseall
	end

scr_seq_D47_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0133_D47_00010
	callstd std_mart_intro
	holdmsg
	setvar VAR_SPECIAL_x8004, 14
	callstd std_special_mart
	releaseall
	end

scr_seq_D47_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_BUTTERFREE, 0
	npc_msg msg_0133_D47_00011
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D47_009:
	simple_npc_msg msg_0133_D47_00012
	end

scr_seq_D47_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_SLOWPOKE, 0
	npc_msg msg_0133_D47_00013
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D47_011:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0133_D47_00017, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_D47_012:
	simple_npc_msg msg_0133_D47_00014
	end

scr_seq_D47_013:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0307
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _031B
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0258
	apply_movement obj_player, _0330
	apply_movement obj_D47_gsmiddleman1, _037C
	goto _02A6

_0258:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0273
	apply_movement obj_player, _0348
	goto _02A6

_0273:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _0296
	apply_movement obj_player, _0368
	apply_movement obj_D47_gsmiddleman1, _037C
	goto _02A6

_0296:
	apply_movement obj_player, _0354
	apply_movement obj_D47_gsmiddleman1, _037C
_02A6:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _02CD
	apply_movement obj_partner_poke, _0388
	wait_movement
_02CD:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 38
	lockall
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	clearflag FLAG_UNK_189
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 2
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0307:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_031B:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00

_0330:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_0348:
	step 12, 3
	step 33, 1
	step_end

_0354:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_0368:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_037C:
	step 63, 1
	step 32, 1
	step_end

_0388:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_D47_015:
	simple_npc_msg msg_0133_D47_00015
	end

scr_seq_D47_016:
	simple_npc_msg msg_0133_D47_00016
	end
	.balign 4, 0
