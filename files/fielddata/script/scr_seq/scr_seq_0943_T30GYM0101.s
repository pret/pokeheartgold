#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T30GYM0101.h"
#include "msgdata/msg/msg_0631_T30GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T30GYM0101_000
	scrdef scr_seq_T30GYM0101_001
	scrdef scr_seq_T30GYM0101_002
	scrdef scr_seq_T30GYM0101_003
	scrdef scr_seq_T30GYM0101_004
	scrdef scr_seq_T30GYM0101_005
	scrdef_end

scr_seq_T30GYM0101_001:
	blackthorn_gym_init
	setvar VAR_UNK_4120, 0
	get_phone_book_rematch PHONE_CONTACT_CLAIR, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_ne _010C
	compare VAR_UNK_40FC, 2
	goto_if_ge _0044
	end

_0044:
	check_registered_phone_number PHONE_CONTACT_CLAIR, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 1
	goto_if_eq _00BD
	scrcmd_522 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 6
	goto_if_ne _0072
	setflag FLAG_UNK_2EF
	goto _00BB

_0072:
	compare VAR_TEMP_x4000, 7
	goto_if_ne _0089
	setflag FLAG_UNK_2EF
	goto _00BB

_0089:
	compare VAR_TEMP_x4000, 8
	goto_if_ne _00A0
	setflag FLAG_UNK_2EF
	goto _00BB

_00A0:
	compare VAR_TEMP_x4000, 9
	goto_if_ne _00B7
	setflag FLAG_UNK_2EF
	goto _00BB

_00B7:
	clearflag FLAG_UNK_2EF
_00BB:
	end

_00BD:
	scrcmd_522 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 16
	goto_if_ne _00D8
	setflag FLAG_UNK_2EF
	goto _010A

_00D8:
	compare VAR_TEMP_x4000, 17
	goto_if_ne _00EF
	setflag FLAG_UNK_2EF
	goto _010A

_00EF:
	compare VAR_TEMP_x4000, 18
	goto_if_ne _0106
	setflag FLAG_UNK_2EF
	goto _010A

_0106:
	clearflag FLAG_UNK_2EF
_010A:
	end

_010C:
	setflag FLAG_UNK_2EF
	end

scr_seq_T30GYM0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_0EA, _018E
	goto_if_set FLAG_UNK_0D1, _017D
	npc_msg msg_0631_T30GYM0101_00003
	closemsg
	trainer_battle TRAINER_LEADER_CLAIR_CLAIR, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0188
	settrainerflag TRAINER_ACE_TRAINER_M_PAULO
	settrainerflag TRAINER_ACE_TRAINER_M_CODY
	settrainerflag TRAINER_ACE_TRAINER_M_MIKE
	settrainerflag TRAINER_ACE_TRAINER_F_FRAN
	settrainerflag TRAINER_ACE_TRAINER_F_LOLA
	add_special_game_stat 22
	setflag FLAG_UNK_0D1
	setflag FLAG_HIDE_BLACKTHORN_DEN_GUARD_INFRONT
	clearflag FLAG_HIDE_BLACKTHRON_DEN_GUARD_ASIDE
	npc_msg msg_0631_T30GYM0101_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_017D:
	npc_msg msg_0631_T30GYM0101_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0188:
	white_out
	releaseall
	end

_018E:
	goto_if_set FLAG_GOT_TM59_FROM_CLAIR, _01C8
	npc_msg msg_0631_T30GYM0101_00006
	goto_if_no_item_space ITEM_TM59, 1, _01D3
	callstd std_give_item_verbose
	setflag FLAG_GOT_TM59_FROM_CLAIR
	npc_msg msg_0631_T30GYM0101_00007
_01C8:
	npc_msg msg_0631_T30GYM0101_00009
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_01D3:
	npc_msg msg_0631_T30GYM0101_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T30GYM0101_002:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_GYURU
	apply_movement obj_player, _0218
	wait_movement
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_T30GYM0101, 0, 8, 83, DIR_NORTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end


_0218:
	step 1, 2
	step 2, 2
	step 0, 2
	step 3, 2
	step 1, 2
	step 2, 2
	step 0, 2
	step 3, 2
	step 1, 2
	step 2, 2
	step 0, 2
	step 3, 2
	step 1, 2
	step 2, 2
	step 0, 2
	step 3, 1
	step 69, 0
	step_end
scr_seq_T30GYM0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_0D1, _0291
	npc_msg msg_0631_T30GYM0101_00000
	scrcmd_600
	set_follow_poke_inhibit_state 1
	scrcmd_607
	scrcmd_109 253, 56
	setvar VAR_UNK_4120, 1
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0291:
	npc_msg msg_0631_T30GYM0101_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T30GYM0101_004:
	scrcmd_609
	lockall
	goto_if_set FLAG_UNK_138, _0352
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4000, 12
	goto_if_ne _02D4
	apply_movement obj_T30GYM0101_sunglasses, _0370
	apply_movement obj_player, _039C
	goto _0307

_02D4:
	compare VAR_TEMP_x4000, 13
	goto_if_ne _02F7
	apply_movement obj_T30GYM0101_sunglasses, _0380
	apply_movement obj_player, _03A8
	goto _0307

_02F7:
	apply_movement obj_T30GYM0101_sunglasses, _0390
	apply_movement obj_player, _03B4
_0307:
	wait_movement
	npc_msg msg_0631_T30GYM0101_00002
	closemsg
	setflag FLAG_UNK_138
	compare VAR_TEMP_x4000, 12
	goto_if_ne _032D
	apply_movement obj_T30GYM0101_sunglasses, _03C0
	goto _0350

_032D:
	compare VAR_TEMP_x4000, 13
	goto_if_ne _0348
	apply_movement obj_T30GYM0101_sunglasses, _03CC
	goto _0350

_0348:
	apply_movement obj_T30GYM0101_sunglasses, _03D8
_0350:
	wait_movement
_0352:
	scrcmd_600
	set_follow_poke_inhibit_state 1
	scrcmd_607
	scrcmd_109 253, 56
	setvar VAR_UNK_4120, 1
	setvar VAR_UNK_4120, 1
	releaseall
	end
	.byte 0x00

_0370:
	step 2, 1
	step 75, 1
	step 14, 2
	step_end

_0380:
	step 2, 1
	step 75, 1
	step 14, 1
	step_end

_0390:
	step 2, 1
	step 75, 1
	step_end

_039C:
	step 63, 5
	step 3, 1
	step_end

_03A8:
	step 63, 4
	step 3, 1
	step_end

_03B4:
	step 63, 2
	step 3, 1
	step_end

_03C0:
	step 15, 2
	step 1, 1
	step_end

_03CC:
	step 15, 1
	step 1, 1
	step_end

_03D8:
	step 1, 1
	step_end
scr_seq_T30GYM0101_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_RISING, VAR_SPECIAL_RESULT
	buffer_players_name 0
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0407
	npc_msg msg_0631_T30GYM0101_00010
	goto _040A

_0407:
	npc_msg msg_0631_T30GYM0101_00011
_040A:
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
