#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D27R0107.h"
#include "msgdata/msg/msg_0094_D27R0107.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D27R0107_000
	scrdef scr_seq_D27R0107_001
	scrdef scr_seq_D27R0107_002
	scrdef scr_seq_D27R0107_003
	scrdef scr_seq_D27R0107_004
	scrdef_end

scr_seq_D27R0107_003:
	setvar VAR_UNK_4125, 0
	end

scr_seq_D27R0107_004:
	goto_if_set FLAG_UNK_1D8, _002D
	scrcmd_375 obj_D27R0107_stop
_002D:
	end

scr_seq_D27R0107_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_GOT_SECRETPOTION, _00B5
	compare VAR_SCENE_LIGHTHOUSE_JASMINE, 0
	goto_if_eq _0062
	npc_msg msg_0094_D27R0107_00001
	closemsg
	apply_movement obj_D27R0107_gsleader6, _01B0
	wait_movement
	releaseall
	end

_0062:
	npc_msg msg_0094_D27R0107_00000
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 56
	apply_movement obj_player, _01D0
	apply_movement obj_D27R0107_gsleader6, _01B8
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	play_se SEQ_SE_DP_DOOR
	hide_person obj_D27R0107_stop
	hide_person obj_D27R0107_babyboy1_8
	wait_se SEQ_SE_DP_DOOR
	apply_movement obj_D27R0107_gsleader6, _01F0
	wait_movement
	releaseall
	setvar VAR_SCENE_LIGHTHOUSE_JASMINE, 1
	setflag FLAG_UNK_1D8
	end

_00B5:
	npc_msg msg_0094_D27R0107_00002
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _017F
	takeitem ITEM_SECRETPOTION, 1, VAR_SPECIAL_RESULT
	buffer_players_name 0
	npc_msg msg_0094_D27R0107_00003
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	npc_msg msg_0094_D27R0107_00004
	closemsg
	apply_movement obj_D27R0107_gsleader6, _01B0
	wait_movement
	npc_msg msg_0094_D27R0107_00005
	closemsg
	apply_movement obj_D27R0107_tsure_poke_static_ampharos, _01A0
	wait_movement
	play_cry SPECIES_AMPHAROS, 0
	npc_msg msg_0094_D27R0107_00006
	wait_cry
	closemsg
	scrcmd_459
	apply_movement obj_D27R0107_tsure_poke_static_ampharos, _01A8
	wait_movement
	play_cry SPECIES_AMPHAROS, 0
	wait_cry
	npc_msg msg_0094_D27R0107_00007
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 56
	apply_movement obj_player, _0218
	apply_movement obj_D27R0107_gsleader6, _0200
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	hide_person obj_D27R0107_gsleader6
	releaseall
	setflag FLAG_UNK_96A
	setvar VAR_SCENE_LIGHTHOUSE_JASMINE, 2
	setvar VAR_UNK_410E, 1
	setflag FLAG_UNK_1D7
	clearflag FLAG_HIDE_JASMINE_IN_GYM
	setflag FLAG_UNK_1DA
	setflag FLAG_UNK_1DB
	clearflag FLAG_HIDE_OLIVINE_GYM_GENTLEMAN
	clearflag FLAG_HIDE_OLIVINE_GYM_GIRL
	setflag FLAG_UNK_998
	end

_017F:
	npc_msg msg_0094_D27R0107_00008
	closemsg
	apply_movement obj_D27R0107_gsleader6, _01B0
	wait_movement
	npc_msg msg_0094_D27R0107_00009
	closemsg
	play_cry SPECIES_AMPHAROS, 12
	wait_cry
	releaseall
	end
	.byte 0x00

_01A0:
	step 30, 1
	step_end

_01A8:
	step 50, 3
	step_end

_01B0:
	step 31, 1
	step_end

_01B8:
	step 63, 1
	step 13, 3
	step 15, 1
	step 33, 1
	step 65, 1
	step_end

_01D0:
	step 2, 1
	step 71, 1
	step 15, 1
	step 72, 1
	step 63, 3
	step 62, 1
	step 33, 1
	step_end

_01F0:
	step 14, 1
	step 12, 3
	step 35, 1
	step_end

_0200:
	step 63, 1
	step 13, 1
	step 15, 2
	step 33, 1
	step 13, 1
	step_end

_0218:
	step 0, 1
	step 71, 1
	step 13, 1
	step 72, 1
	step 63, 2
	step 62, 1
	step 35, 1
	step_end
	.byte 0x0a, 0x00, 0x02, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_D27R0107_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_SCENE_LIGHTHOUSE_JASMINE, 2
	goto_if_lt _0266
	play_cry SPECIES_AMPHAROS, 0
	npc_msg msg_0094_D27R0107_00012
	wait_cry
	goto _0274

_0266:
	play_cry SPECIES_AMPHAROS, 12
	npc_msg msg_0094_D27R0107_00010
	wait_cry
	npc_msg msg_0094_D27R0107_00011
_0274:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D27R0107_002:
	end
	.balign 4, 0
