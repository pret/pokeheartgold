#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R12.h"
#include "msgdata/msg/msg_0348_R12.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R12_000
	scrdef scr_seq_R12_001
	scrdef scr_seq_R12_002
	scrdef scr_seq_R12_003
	scrdef scr_seq_R12_004
	scrdef scr_seq_R12_005
	scrdef_end

scr_seq_R12_001:
	goto_if_unset FLAG_UNK_189, _002B
	clearflag FLAG_UNK_189
	end

_002B:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 1
	goto_if_eq _004F
	compare VAR_TEMP_x4000, 3
	goto_if_eq _004F
	setflag FLAG_HIDE_CAMERON
	end

_004F:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_R12_004:
	goto_if_set FLAG_ENGAGING_STATIC_POKEMON, _006D
	goto_if_set FLAG_SNORLAX_MEET, _0087
	end

_006D:
	setflag FLAG_HIDE_ROUTE_12_SNORLAX
	hide_person obj_R12_kabigon
	hide_person obj_R12_gsbabyboy1
	hide_person obj_R12_gsbabyboy1_2
	hide_person obj_R12_gsbabyboy1_3
	clearflag FLAG_ENGAGING_STATIC_POKEMON
	end

_0087:
	end

scr_seq_R12_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _01B1
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _01C5
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0102
	apply_movement obj_player, _01DC
	apply_movement obj_R12_gsmiddleman1, _0228
	goto _0150

_0102:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _011D
	apply_movement obj_player, _01F4
	goto _0150

_011D:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _0140
	apply_movement obj_player, _0214
	apply_movement obj_R12_gsmiddleman1, _0228
	goto _0150

_0140:
	apply_movement obj_player, _0200
	apply_movement obj_R12_gsmiddleman1, _0228
_0150:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0177
	apply_movement obj_partner_poke, _0234
	wait_movement
_0177:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 59
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

_01B1:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_01C5:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_01DC:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_01F4:
	step 12, 3
	step 33, 1
	step_end

_0200:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_0214:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_0228:
	step 63, 1
	step 32, 1
	step_end

_0234:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_R12_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	radio_music_is_playing 5, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0268
	npc_msg msg_0348_R12_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0268:
	play_cry SPECIES_SNORLAX, 0
	npc_msg msg_0348_R12_00003
	wait_cry
	closemsg
	setflag FLAG_ENGAGING_STATIC_POKEMON
	wild_battle SPECIES_SNORLAX, 50, 0
	clearflag FLAG_ENGAGING_STATIC_POKEMON
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _02AE
	scrcmd_683 VAR_TEMP_x4005
	compare VAR_TEMP_x4005, 4
	call_if_eq _02B4
	setflag FLAG_SNORLAX_MEET
	releaseall
	end

_02AE:
	white_out
	releaseall
	end

_02B4:
	setflag FLAG_CAUGHT_SNORLAX
	return
	.byte 0x61, 0x00, 0x02, 0x00
scr_seq_R12_002:
	direction_signpost msg_0348_R12_00000, 1, 3, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R12_003:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0348_R12_00001, VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
