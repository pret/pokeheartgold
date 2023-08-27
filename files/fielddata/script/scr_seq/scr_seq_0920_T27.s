#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T27.h"
#include "msgdata/msg/msg_0612_T27.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T27_000
	scrdef scr_seq_T27_001
	scrdef scr_seq_T27_002
	scrdef scr_seq_T27_003
	scrdef scr_seq_T27_004
	scrdef scr_seq_T27_005
	scrdef scr_seq_T27_006
	scrdef scr_seq_T27_007
	scrdef scr_seq_T27_008
	scrdef scr_seq_T27_009
	scrdef scr_seq_T27_010
	scrdef scr_seq_T27_011
	scrdef scr_seq_T27_012
	scrdef scr_seq_T27_013
	scrdef scr_seq_T27_014
	scrdef scr_seq_T27_015
	scrdef scr_seq_T27_016
	scrdef_end

scr_seq_T27_000:
	end

scr_seq_T27_015:
	goto_if_unset FLAG_UNK_189, _0059
	clearflag FLAG_UNK_189
	end

_0059:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 5
	goto_if_ne _0074
	clearflag FLAG_HIDE_CAMERON
	goto _0078

_0074:
	setflag FLAG_HIDE_CAMERON
_0078:
	end

scr_seq_T27_012:
	scrcmd_609
	lockall
	scrcmd_307 11, 5, 25, 23, 1
	scrcmd_310 1
	scrcmd_308 1
	apply_movement obj_player, _00D0
	wait_movement
	lock obj_partner_poke
	scrcmd_596 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _00B6
	scrcmd_606
	goto _00B8

_00B6:
	scrcmd_607
_00B8:
	release obj_partner_poke
	setvar VAR_UNK_4079, 0
	scrcmd_311 1
	scrcmd_308 1
	scrcmd_309 1
	releaseall
	end
	.byte 0x00

_00D0:
	step 17, 2
	step 63, 1
	step_end
scr_seq_T27_005:
	scrcmd_609
	lockall
	clearflag FLAG_HIDE_ECRUTEAK_RIVAL
	show_person obj_T27_gsrivel
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 56
	apply_movement obj_T27_gsrivel, _019C
	apply_movement obj_player, _01B0
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	play_se SEQ_SE_DP_WALL_HIT2
	npc_msg msg_0612_T27_00016
	wait 30, VAR_SPECIAL_RESULT
	buffer_rivals_name 1
	npc_msg msg_0612_T27_00017
	closemsg
	apply_movement obj_T27_gsrivel, _01C4
	wait_movement
	buffer_players_name 0
	buffer_rivals_name 1
	npc_msg msg_0612_T27_00018
	closemsg
	play_se SEQ_SE_DP_WALL_HIT2
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 56
	apply_movement obj_T27_gsrivel, _01D4
	apply_movement obj_player, _01B0
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	apply_movement obj_T27_gsrivel, _01E0
	apply_movement obj_player, _01F0
	wait_movement
	hide_person obj_T27_gsrivel
	setflag FLAG_HIDE_ECRUTEAK_RIVAL
	releaseall
	setvar VAR_UNK_4079, 4
	setvar VAR_UNK_410C, 4
	clearflag FLAG_HIDE_DANCE_STUDIO_KIMONO_GIRLS
	setflag FLAG_UNK_241
	end
	.byte 0x4b, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

_019C:
	step 71, 1
	step 17, 1
	step 36, 1
	step 72, 1
	step_end

_01B0:
	step 0, 1
	step 71, 1
	step 17, 1
	step 72, 1
	step_end

_01C4:
	step 75, 1
	step 63, 1
	step 33, 1
	step_end

_01D4:
	step 17, 1
	step 37, 1
	step_end

_01E0:
	step 10, 3
	step 63, 3
	step 18, 6
	step_end

_01F0:
	step 63, 3
	step 34, 1
	step_end
scr_seq_T27_013:
	simple_npc_msg msg_0612_T27_00019
	end

scr_seq_T27_014:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0314
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0328
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0288
	apply_movement obj_player, _033C
	apply_movement obj_T27_gsmiddleman1, _0374
	goto _02B3

_0288:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _02A3
	apply_movement obj_player, _0354
	goto _02B3

_02A3:
	apply_movement obj_player, _0360
	apply_movement obj_T27_gsmiddleman1, _0374
_02B3:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _02DA
	apply_movement obj_partner_poke, _0380
	wait_movement
_02DA:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 19
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

_0314:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0328:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end


_033C:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_0354:
	step 12, 3
	step 33, 1
	step_end

_0360:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_0374:
	step 63, 1
	step 32, 1
	step_end

_0380:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_T27_001:
	direction_signpost msg_0612_T27_00011, 0, 18, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T27_002:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0612_T27_00012, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T27_003:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0612_T27_00013, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T27_004:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0612_T27_00014, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T27_016:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0612_T27_00015, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T27_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_96A, _0417
	npc_msg msg_0612_T27_00008
	goto _041A

_0417:
	npc_msg msg_0612_T27_00009
_041A:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T27_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_GAME_CLEAR, _0440
	npc_msg msg_0612_T27_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0440:
	npc_msg msg_0612_T27_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T27_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_UNK_410C, 2
	goto_if_gt _0469
	npc_msg msg_0612_T27_00002
	goto _046C

_0469:
	npc_msg msg_0612_T27_00003
_046C:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T27_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_GAME_CLEAR, _04A8
	compare VAR_UNK_40A1, 0
	goto_if_ne _049D
	npc_msg msg_0612_T27_00005
	goto _04A0

_049D:
	npc_msg msg_0612_T27_00006
_04A0:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_04A8:
	npc_msg msg_0612_T27_00007
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T27_007:
	simple_npc_msg msg_0612_T27_00010
	end

scr_seq_T27_011:
	simple_npc_msg msg_0612_T27_00004
	end
	.balign 4, 0
