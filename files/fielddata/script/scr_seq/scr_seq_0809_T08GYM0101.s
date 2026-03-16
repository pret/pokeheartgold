#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T08GYM0101.h"
#include "msgdata/msg/msg_0514_T08GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T08GYM0101_000
	scrdef scr_seq_T08GYM0101_001
	scrdef scr_seq_T08GYM0101_002
	scrdef scr_seq_T08GYM0101_003
	scrdef scr_seq_T08GYM0101_004
	scrdef scr_seq_T08GYM0101_005
	scrdef scr_seq_T08GYM0101_006
	scrdef scr_seq_T08GYM0101_007
	scrdef scr_seq_T08GYM0101_008
	scrdef_end

scr_seq_T08GYM0101_000:
	fuchsia_gym_init
	get_phone_book_rematch PHONE_CONTACT_JANINE, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_ne _00EF
	check_registered_phone_number PHONE_CONTACT_JANINE, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 1
	goto_if_eq _00AF
	check_badge BADGE_SOUL, VAR_TEMP_x4002
	compare VAR_TEMP_x4002, 0
	goto_if_ne _006D
	goto _00E9

_0067:
	goto _0073

_006D:
	goto _0075

_0073:
	end

_0075:
	scrcmd_522 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 16
	goto_if_ne _0090
	setflag FLAG_HIDE_FUCHSIA_GYM_JANINE
	goto _00AD

_0090:
	compare VAR_TEMP_x4000, 17
	goto_if_ne _00A7
	setflag FLAG_HIDE_FUCHSIA_GYM_JANINE
	goto _00AD

_00A7:
	goto _00E9

_00AD:
	end

_00AF:
	scrcmd_522 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 18
	goto_if_ne _00CA
	setflag FLAG_HIDE_FUCHSIA_GYM_JANINE
	goto _00E7

_00CA:
	compare VAR_TEMP_x4000, 19
	goto_if_ne _00E1
	setflag FLAG_HIDE_FUCHSIA_GYM_JANINE
	goto _00E7

_00E1:
	goto _00E9

_00E7:
	end

_00E9:
	clearflag FLAG_HIDE_FUCHSIA_GYM_JANINE
	end

_00EF:
	setflag FLAG_HIDE_FUCHSIA_GYM_JANINE
	end

scr_seq_T08GYM0101_008:
	compare VAR_TEMP_x400B, 111
	goto_if_ne _012E
	call_if_not_defeated TRAINER_LASS_LINDA, _0130
	call_if_not_defeated TRAINER_CAMPER_BARRY, _0142
	call_if_not_defeated TRAINER_LASS_ALICE, _0154
	call_if_not_defeated TRAINER_PICNICKER_CINDY, _0166
_012E:
	end

_0130:
	clearflag FLAG_HIDE_FUCHSIA_GYM_LASS_LINDA_REVEALED
	show_person obj_T08GYM0101_gsgirl1
	setflag FLAG_HIDE_FUCHSIA_GYM_LASS_LINDA_DISGUISED
	hide_person obj_T08GYM0101_gsleader13_4
	return

_0142:
	clearflag FLAG_HIDE_FUCHSIA_GYM_CAMPER_BARRY_REVEALED
	show_person obj_T08GYM0101_campboy_2
	setflag FLAG_HIDE_FUCHSIA_GYM_CAMPER_BARRY_DISGUISED
	hide_person obj_T08GYM0101_gsleader13_3
	return

_0154:
	clearflag FLAG_HIDE_FUCHSIA_GYM_LASS_ALICE_REVEALED
	show_person obj_T08GYM0101_gsgirl1_2
	setflag FLAG_HIDE_FUCHSIA_GYM_LASS_ALICE_DISGUISED
	hide_person obj_T08GYM0101_gsleader13_5
	return

_0166:
	clearflag FLAG_HIDE_FUCHSIA_GYM_PICNICKER_CINDY_REVEALED
	show_person obj_T08GYM0101_picnicgirl_2
	setflag FLAG_HIDE_FUCHSIA_GYM_PICNICKER_CINDY_DISGUISED
	hide_person obj_T08GYM0101_gsleader13_2
	return

scr_seq_T08GYM0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_defeated TRAINER_LASS_LINDA, _0277
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _01AA
	apply_movement obj_T08GYM0101_gsleader13_4, _0620
	goto _01E8

_01AA:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _01C5
	apply_movement obj_T08GYM0101_gsleader13_4, _05E4
	goto _01E8

_01C5:
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _01E0
	apply_movement obj_T08GYM0101_gsleader13_4, _0604
	goto _01E8

_01E0:
	apply_movement obj_T08GYM0101_gsleader13_4, _0638
_01E8:
	wait_movement
	clearflag FLAG_HIDE_FUCHSIA_GYM_LASS_LINDA_REVEALED
	show_person obj_T08GYM0101_gsgirl1
	setflag FLAG_HIDE_FUCHSIA_GYM_LASS_LINDA_DISGUISED
	hide_person obj_T08GYM0101_gsleader13_4
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0215
	apply_movement obj_T08GYM0101_gsgirl1, _0698
	goto _0253

_0215:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0230
	apply_movement obj_T08GYM0101_gsgirl1, _065C
	goto _0253

_0230:
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _024B
	apply_movement obj_T08GYM0101_gsgirl1, _0680
	goto _0253

_024B:
	apply_movement obj_T08GYM0101_gsgirl1, _06B4
_0253:
	wait_movement
	npc_msg msg_0514_T08GYM0101_00007
	closemsg
	trainer_battle TRAINER_LASS_LINDA, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0282
	settrainerflag TRAINER_LASS_LINDA
_0277:
	npc_msg msg_0514_T08GYM0101_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0282:
	white_out
	releaseall
	setflag FLAG_HIDE_FUCHSIA_GYM_LASS_LINDA_REVEALED
	clearflag FLAG_HIDE_FUCHSIA_GYM_LASS_LINDA_DISGUISED
	end

scr_seq_T08GYM0101_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_defeated TRAINER_CAMPER_BARRY, _038F
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _02C2
	apply_movement obj_T08GYM0101_gsleader13_3, _0620
	goto _0300

_02C2:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _02DD
	apply_movement obj_T08GYM0101_gsleader13_3, _05E4
	goto _0300

_02DD:
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _02F8
	apply_movement obj_T08GYM0101_gsleader13_3, _0604
	goto _0300

_02F8:
	apply_movement obj_T08GYM0101_gsleader13_3, _0638
_0300:
	wait_movement
	clearflag FLAG_HIDE_FUCHSIA_GYM_CAMPER_BARRY_REVEALED
	show_person obj_T08GYM0101_campboy_2
	setflag FLAG_HIDE_FUCHSIA_GYM_CAMPER_BARRY_DISGUISED
	hide_person obj_T08GYM0101_gsleader13_3
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _032D
	apply_movement obj_T08GYM0101_campboy_2, _0698
	goto _036B

_032D:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0348
	apply_movement obj_T08GYM0101_campboy_2, _065C
	goto _036B

_0348:
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _0363
	apply_movement obj_T08GYM0101_campboy_2, _0680
	goto _036B

_0363:
	apply_movement obj_T08GYM0101_campboy_2, _06B4
_036B:
	wait_movement
	npc_msg msg_0514_T08GYM0101_00009
	closemsg
	trainer_battle TRAINER_CAMPER_BARRY, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _039A
	settrainerflag TRAINER_CAMPER_BARRY
_038F:
	npc_msg msg_0514_T08GYM0101_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_039A:
	white_out
	releaseall
	setflag FLAG_HIDE_FUCHSIA_GYM_CAMPER_BARRY_REVEALED
	clearflag FLAG_HIDE_FUCHSIA_GYM_CAMPER_BARRY_DISGUISED
	end

scr_seq_T08GYM0101_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_defeated TRAINER_LASS_ALICE, _04AC
	npc_msg msg_0514_T08GYM0101_00011
	closemsg
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _03DF
	apply_movement obj_T08GYM0101_gsleader13_5, _0620
	goto _041D

_03DF:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _03FA
	apply_movement obj_T08GYM0101_gsleader13_5, _05E4
	goto _041D

_03FA:
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _0415
	apply_movement obj_T08GYM0101_gsleader13_5, _0604
	goto _041D

_0415:
	apply_movement obj_T08GYM0101_gsleader13_5, _0638
_041D:
	wait_movement
	clearflag FLAG_HIDE_FUCHSIA_GYM_LASS_ALICE_REVEALED
	show_person obj_T08GYM0101_gsgirl1_2
	setflag FLAG_HIDE_FUCHSIA_GYM_LASS_ALICE_DISGUISED
	hide_person obj_T08GYM0101_gsleader13_5
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _044A
	apply_movement obj_T08GYM0101_gsgirl1_2, _0698
	goto _0488

_044A:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0465
	apply_movement obj_T08GYM0101_gsgirl1_2, _065C
	goto _0488

_0465:
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _0480
	apply_movement obj_T08GYM0101_gsgirl1_2, _0680
	goto _0488

_0480:
	apply_movement obj_T08GYM0101_gsgirl1_2, _06B4
_0488:
	wait_movement
	npc_msg msg_0514_T08GYM0101_00012
	closemsg
	trainer_battle TRAINER_LASS_ALICE, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _04B7
	settrainerflag TRAINER_LASS_ALICE
_04AC:
	npc_msg msg_0514_T08GYM0101_00013
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_04B7:
	white_out
	releaseall
	setflag FLAG_HIDE_FUCHSIA_GYM_LASS_ALICE_REVEALED
	clearflag FLAG_HIDE_FUCHSIA_GYM_LASS_ALICE_DISGUISED
	end

scr_seq_T08GYM0101_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_defeated TRAINER_PICNICKER_CINDY, _05C9
	npc_msg msg_0514_T08GYM0101_00014
	closemsg
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _04FC
	apply_movement obj_T08GYM0101_gsleader13_2, _0620
	goto _053A

_04FC:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0517
	apply_movement obj_T08GYM0101_gsleader13_2, _05E4
	goto _053A

_0517:
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _0532
	apply_movement obj_T08GYM0101_gsleader13_2, _0604
	goto _053A

_0532:
	apply_movement obj_T08GYM0101_gsleader13_2, _0638
_053A:
	wait_movement
	clearflag FLAG_HIDE_FUCHSIA_GYM_PICNICKER_CINDY_REVEALED
	show_person obj_T08GYM0101_picnicgirl_2
	setflag FLAG_HIDE_FUCHSIA_GYM_PICNICKER_CINDY_DISGUISED
	hide_person obj_T08GYM0101_gsleader13_2
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0567
	apply_movement obj_T08GYM0101_picnicgirl_2, _0698
	goto _05A5

_0567:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0582
	apply_movement obj_T08GYM0101_picnicgirl_2, _065C
	goto _05A5

_0582:
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _059D
	apply_movement obj_T08GYM0101_picnicgirl_2, _0680
	goto _05A5

_059D:
	apply_movement obj_T08GYM0101_picnicgirl_2, _06B4
_05A5:
	wait_movement
	npc_msg msg_0514_T08GYM0101_00015
	closemsg
	trainer_battle TRAINER_PICNICKER_CINDY, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _05D4
	settrainerflag TRAINER_PICNICKER_CINDY
_05C9:
	npc_msg msg_0514_T08GYM0101_00016
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_05D4:
	white_out
	releaseall
	setflag FLAG_HIDE_FUCHSIA_GYM_PICNICKER_CINDY_REVEALED
	clearflag FLAG_HIDE_FUCHSIA_GYM_PICNICKER_CINDY_DISGUISED
	end

	.balign 4, 0
_05E4:
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	EndMovement

	.balign 4, 0
_0604:
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	EndMovement

	.balign 4, 0
_0620:
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	EndMovement

	.balign 4, 0
_0638:
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	EndMovement

	.balign 4, 0
_065C:
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	EndMovement

	.balign 4, 0
_0680:
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	EndMovement

	.balign 4, 0
_0698:
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	EndMovement

	.balign 4, 0
_06B4:
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	EndMovement

scr_seq_T08GYM0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_SOUL, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0778
	npc_msg msg_0514_T08GYM0101_00000
	closemsg
	setvar VAR_TEMP_x400B, 111
	trainer_battle TRAINER_LEADER_JANINE_JANINE, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _078E
	setvar VAR_TEMP_x400B, 0
	give_badge BADGE_SOUL
	addvar VAR_UNK_4135, 1
	add_special_game_stat SCORE_EVENT_BADGE_GET
	settrainerflag TRAINER_PICNICKER_CINDY
	settrainerflag TRAINER_CAMPER_BARRY
	settrainerflag TRAINER_LASS_LINDA
	settrainerflag TRAINER_LASS_ALICE
	npc_msg msg_0514_T08GYM0101_00001
	buffer_players_name 0
	npc_msg msg_0514_T08GYM0101_00002
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	npc_msg msg_0514_T08GYM0101_00003
	goto _074F

_074F:
	goto_if_no_item_space ITEM_TM84, 1, _0794
	callstd std_give_item_verbose
	setflag FLAG_GOT_TM84_FROM_JANINE
_0778:
	goto_if_unset FLAG_GOT_TM84_FROM_JANINE, _074F
	npc_msg msg_0514_T08GYM0101_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_078E:
	white_out
	releaseall
	end

_0794:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_T08GYM0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_SOUL, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _07C4
	npc_msg msg_0514_T08GYM0101_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_07C4:
	npc_msg msg_0514_T08GYM0101_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T08GYM0101_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_SOUL, VAR_SPECIAL_RESULT
	buffer_players_name 0
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _07F6
	npc_msg msg_0514_T08GYM0101_00017
	goto _07F9

_07F6:
	npc_msg msg_0514_T08GYM0101_00018
_07F9:
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
