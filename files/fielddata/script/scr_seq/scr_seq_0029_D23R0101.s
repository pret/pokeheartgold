#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D23R0101.h"
#include "msgdata/msg/msg_0065_D23R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D23R0101_000
	scrdef scr_seq_D23R0101_001
	scrdef scr_seq_D23R0101_002
	scrdef scr_seq_D23R0101_003
	scrdef scr_seq_D23R0101_004
	scrdef scr_seq_D23R0101_005
	scrdef scr_seq_D23R0101_006
	scrdef scr_seq_D23R0101_007
	scrdef scr_seq_D23R0101_008
	scrdef scr_seq_D23R0101_009
	scrdef scr_seq_D23R0101_010
	scrdef_end

scr_seq_D23R0101_008:
	setflag FLAG_HIDE_ROCKET_TAKEOVER_6
	setflag FLAG_HIDE_ROCKET_TAKEOVER_2
	compare VAR_SCENE_ROCKET_TAKEOVER, 2
	goto_if_ne _004D
	clearflag FLAG_HIDE_ROCKET_TAKEOVER_6
	goto _0085

_004D:
	compare VAR_SCENE_ROCKET_TAKEOVER, 4
	goto_if_ne _0066
	goto _008B
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
_0066:
	compare VAR_SCENE_ROCKET_TAKEOVER, 3
	goto_if_ne _0081
	clearflag FLAG_HIDE_ROCKET_TAKEOVER_6
	clearflag FLAG_HIDE_RADIO_TOWER_RIVAL
	goto _0085

_0081:
	clearflag FLAG_HIDE_ROCKET_TAKEOVER_2
_0085:
	setvar VAR_TEMP_x400A, 0
_008B:
	end

scr_seq_D23R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_SCENE_ROCKET_TAKEOVER, 2
	goto_if_ne _00AB
	npc_msg msg_0065_D23R0101_00001
	goto _00DA

_00AB:
	compare VAR_SCENE_ROCKET_TAKEOVER, 4
	goto_if_ne _00C1
	npc_msg msg_0065_D23R0101_00001
	goto _00DA

_00C1:
	compare VAR_SCENE_ROCKET_TAKEOVER, 3
	goto_if_ne _00D7
	npc_msg msg_0065_D23R0101_00002
	goto _00DA

_00D7:
	npc_msg msg_0065_D23R0101_00000
_00DA:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D23R0101_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0065_D23R0101_00014
	apply_movement obj_D23R0101_gsleader3, _036C
	wait_movement
	closemsg
	releaseall
	end

scr_seq_D23R0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_GOT_RADIO_CARD, _0243
	npc_msg msg_0065_D23R0101_00003
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0221
	npc_msg msg_0065_D23R0101_00004
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _022E
	play_se SEQ_SE_DP_PINPON
	wait_se SEQ_SE_DP_PINPON
	npc_msg msg_0065_D23R0101_00005
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _022E
	play_se SEQ_SE_DP_PINPON
	wait_se SEQ_SE_DP_PINPON
	npc_msg msg_0065_D23R0101_00006
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _022E
	play_se SEQ_SE_DP_PINPON
	wait_se SEQ_SE_DP_PINPON
	npc_msg msg_0065_D23R0101_00007
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _022E
	play_se SEQ_SE_DP_PINPON
	wait_se SEQ_SE_DP_PINPON
	npc_msg msg_0065_D23R0101_00008
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _022E
	wait 30, VAR_SPECIAL_RESULT
	play_se SEQ_SE_DP_PINPON
	wait_se SEQ_SE_DP_PINPON
	touchscreen_menu_show
	npc_msg msg_0065_D23R0101_00009
	buffer_players_name 0
	npc_msg msg_0065_D23R0101_00010
	play_fanfare SEQ_ME_KEYITEM
	wait_fanfare
	closemsg
	register_pokegear_card 2
	setflag FLAG_GOT_RADIO_CARD
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_D23R0101_gsleader3, _0250
	apply_movement obj_player, _0270
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg msg_0065_D23R0101_00015
	closemsg
	apply_movement obj_D23R0101_gsleader3, _0264
	wait 24, VAR_SPECIAL_RESULT
	apply_movement obj_player, _036C
	wait_movement
	hide_person obj_D23R0101_gsleader3
	setflag FLAG_UNK_318
	releaseall
	end

_0221:
	npc_msg msg_0065_D23R0101_00013
	wait_button_or_walk_away
	closemsg
	touchscreen_menu_show
	releaseall
	end

_022E:
	play_se SEQ_SE_DP_BOX03
	wait_se SEQ_SE_DP_BOX03
	npc_msg msg_0065_D23R0101_00012
	wait_button_or_walk_away
	closemsg
	touchscreen_menu_show
	releaseall
	end

_0243:
	npc_msg msg_0065_D23R0101_00011
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00, 0x00

_0250:
	step 75, 1
	step 50, 2
	step 76, 3
	step 78, 1
	step_end

_0264:
	step 76, 1
	step 78, 10
	step_end

_0270:
	step 63, 6
	step 76, 1
	step 3, 1
	step_end
scr_seq_D23R0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0065_D23R0101_00016
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D23R0101_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0065_D23R0101_00017
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D23R0101_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_SCENE_ROCKET_TAKEOVER, 3
	goto_if_eq _02C2
	npc_msg msg_0065_D23R0101_00018
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_02C2:
	compare VAR_TEMP_x400A, 1
	goto_if_eq _0316
	npc_msg msg_0065_D23R0101_00019
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 5
	goto_if_ne _02F5
	apply_movement obj_D23R0101_rocketm, _0354
	goto _030A

_02F5:
	compare VAR_TEMP_x4001, 6
	goto_if_ne _030A
	apply_movement obj_D23R0101_rocketm, _0360
_030A:
	wait_movement
	releaseall
	setvar VAR_TEMP_x400A, 1
	end

_0316:
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _0333
	setvar VAR_TEMP_x400B, 33
	goto _0346

_0333:
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0346
	setvar VAR_TEMP_x400B, 11
_0346:
	npc_msg msg_0065_D23R0101_00020
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0354:
	step 13, 1
	step 34, 1
	step_end

_0360:
	step 14, 1
	step 33, 1
	step_end

_036C:
	step 34, 1
	step_end
	.byte 0x23, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x21, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00
scr_seq_D23R0101_009:
	scrcmd_609
	lockall
	move_person_facing obj_D23R0101_gsrivel, 13, 1, 6, DIR_EAST
	callstd std_play_rival_intro_music
	get_person_coords 6, VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 5
	goto_if_ne _03D0
	apply_movement obj_D23R0101_gsrivel, _0670
	compare VAR_TEMP_x400B, 33
	goto_if_ne _03CA
	apply_movement obj_D23R0101_rocketm, _069C
_03CA:
	goto _03FA

_03D0:
	compare VAR_TEMP_x4001, 6
	goto_if_ne _03FA
	apply_movement obj_D23R0101_gsrivel, _067C
	compare VAR_TEMP_x400B, 11
	goto_if_ne _03FA
	apply_movement obj_D23R0101_rocketm, _06A8
_03FA:
	wait_movement
	buffer_rivals_name 1
	npc_msg msg_0065_D23R0101_00021
	closemsg
	apply_movement obj_D23R0101_gsrivel, _0664
	wait_movement
	compare VAR_TEMP_x4001, 5
	goto_if_ne _0431
	apply_movement obj_D23R0101_gsrivel, _0684
	apply_movement obj_D23R0101_rocketm, _06B4
	goto _044E

_0431:
	compare VAR_TEMP_x4001, 6
	goto_if_ne _044E
	apply_movement obj_D23R0101_gsrivel, _0690
	apply_movement obj_D23R0101_rocketm, _06C8
_044E:
	wait_movement
	compare VAR_TEMP_x4001, 5
	goto_if_ne _046B
	apply_movement obj_player, _06E4
	goto _0480

_046B:
	compare VAR_TEMP_x4001, 6
	goto_if_ne _0480
	apply_movement obj_player, _06EC
_0480:
	wait_movement
	buffer_players_name 0
	buffer_rivals_name 1
	npc_msg msg_0065_D23R0101_00022
	closemsg
	compare VAR_TEMP_x4001, 5
	goto_if_ne _04A8
	apply_movement obj_player, _06FC
	goto _04BD

_04A8:
	compare VAR_TEMP_x4001, 6
	goto_if_ne _04BD
	apply_movement obj_player, _07BC
_04BD:
	wait 50, VAR_SPECIAL_RESULT
	set_avatar_bits PLAYER_TRANSITION_WALKING
	update_avatar_state
	rocket_costume_flag_action 0
	wait_movement
	compare VAR_TEMP_x4001, 5
	goto_if_ne _04E9
	apply_movement obj_D23R0101_rocketm, _0874
	goto _04FE

_04E9:
	compare VAR_TEMP_x4001, 6
	goto_if_ne _04FE
	apply_movement obj_D23R0101_rocketm, _0890
_04FE:
	wait_movement
	compare VAR_TEMP_x4001, 5
	goto_if_ne _0523
	apply_movement obj_D23R0101_rocketm, _08AC
	apply_movement obj_D23R0101_gsrivel, _08BC
	goto _0540

_0523:
	compare VAR_TEMP_x4001, 6
	goto_if_ne _0540
	apply_movement obj_D23R0101_rocketm, _08B4
	apply_movement obj_D23R0101_gsrivel, _08D4
_0540:
	wait_movement
	npc_msg msg_0065_D23R0101_00023
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_3, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0655
	npc_msg msg_0065_D23R0101_00024
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	compare VAR_TEMP_x4001, 5
	goto_if_ne _0592
	apply_movement obj_D23R0101_rocketm, _08EC
	apply_movement obj_player, _0900
	goto _05AF

_0592:
	compare VAR_TEMP_x4001, 6
	goto_if_ne _05AF
	apply_movement obj_D23R0101_rocketm, _08F4
	apply_movement obj_player, _0914
_05AF:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	hide_person obj_D23R0101_rocketm
	callstd std_play_rival_outro_music
	compare VAR_TEMP_x4001, 5
	goto_if_ne _05DE
	apply_movement obj_D23R0101_gsrivel, _0928
	goto _05F3

_05DE:
	compare VAR_TEMP_x4001, 6
	goto_if_ne _05F3
	apply_movement obj_D23R0101_gsrivel, _0930
_05F3:
	wait_movement
	compare VAR_TEMP_x4001, 5
	goto_if_ne _0610
	apply_movement obj_player, _06DC
	goto _0625

_0610:
	compare VAR_TEMP_x4001, 6
	goto_if_ne _0625
	apply_movement obj_player, _06F4
_0625:
	wait_movement
	buffer_rivals_name 1
	npc_msg msg_0065_D23R0101_00025
	closemsg
	apply_movement obj_D23R0101_gsrivel, _0938
	wait_movement
	hide_person obj_D23R0101_gsrivel
	callstd std_fade_end_rival_outro_music
	releaseall
	setvar VAR_SCENE_ROCKET_TAKEOVER, 4
	setflag FLAG_HIDE_RADIO_TOWER_RIVAL
	setvar VAR_UNK_409F, 1
	end

_0655:
	setvar VAR_SCENE_ROCKET_TAKEOVER, 2
	white_out
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0664:
	step 65, 1
	step 75, 1
	step_end

_0670:
	step 19, 9
	step 32, 1
	step_end

_067C:
	step 19, 9
	step_end

_0684:
	step 12, 1
	step 35, 1
	step_end

_0690:
	step 15, 1
	step 32, 1
	step_end

_069C:
	step 62, 9
	step 33, 1
	step_end

_06A8:
	step 62, 9
	step 34, 1
	step_end

_06B4:
	step 3, 1
	step 71, 1
	step 14, 1
	step 72, 1
	step_end

_06C8:
	step 0, 1
	step 71, 1
	step 13, 1
	step 72, 1
	step_end

_06DC:
	step 34, 1
	step_end

_06E4:
	step 35, 1
	step_end

_06EC:
	step 32, 1
	step_end

_06F4:
	step 33, 1
	step_end

_06FC:
	step 62, 1
	step 3, 1
	step 62, 1
	step 1, 1
	step 62, 1
	step 2, 1
	step 62, 1
	step 0, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 0, 1
	step 60, 1
	step 3, 1
	step 60, 1
	step 1, 1
	step 60, 1
	step 2, 1
	step 60, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step 60, 1
	step 0, 1
	step 60, 1
	step 3, 1
	step 60, 1
	step 1, 1
	step 60, 1
	step 2, 1
	step 60, 1
	step 0, 1
	step 61, 1
	step 3, 1
	step 62, 1
	step 1, 1
	step 62, 1
	step 2, 1
	step_end

_07BC:
	step 62, 1
	step 2, 1
	step 62, 1
	step 0, 1
	step 62, 1
	step 3, 1
	step 62, 1
	step 1, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 3, 1
	step 60, 1
	step 1, 1
	step 60, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 60, 1
	step 2, 1
	step 60, 1
	step 0, 1
	step 60, 1
	step 3, 1
	step 60, 1
	step 1, 1
	step 60, 1
	step 2, 1
	step 61, 1
	step 0, 1
	step 62, 1
	step 3, 1
	step 62, 1
	step 1, 1
	step_end

_0874:
	step 65, 1
	step 3, 1
	step 71, 1
	step 18, 2
	step 72, 1
	step 75, 1
	step_end

_0890:
	step 65, 1
	step 0, 1
	step 71, 1
	step 17, 2
	step 72, 1
	step 75, 1
	step_end

_08AC:
	step 19, 3
	step_end

_08B4:
	step 16, 3
	step_end

_08BC:
	step 62, 1
	step 0, 1
	step 71, 1
	step 17, 1
	step 72, 1
	step_end

_08D4:
	step 62, 1
	step 3, 1
	step 71, 1
	step 18, 1
	step 72, 1
	step_end

_08EC:
	step 15, 2
	step_end

_08F4:
	step 12, 1
	step 15, 1
	step_end

_0900:
	step 0, 1
	step 71, 1
	step 13, 1
	step 72, 1
	step_end

_0914:
	step 3, 1
	step 71, 1
	step 14, 1
	step 72, 1
	step_end

_0928:
	step 35, 1
	step_end

_0930:
	step 32, 1
	step_end

_0938:
	step 14, 9
	step_end
scr_seq_D23R0101_006:
	simple_npc_msg msg_0065_D23R0101_00026
	end

scr_seq_D23R0101_007:
	simple_npc_msg msg_0065_D23R0101_00027
	end

scr_seq_D23R0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_UNK_4136, 0
	goto_if_ne _0B86
	goto_if_set FLAG_UNK_AA6, _09CF
	goto_if_set FLAG_UNK_AA5, _09AF
	npc_msg msg_0065_D23R0101_00028
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _09E5
	goto _09DA

_09AF:
	npc_msg msg_0065_D23R0101_00045
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _09E5
	goto _09DA
	.byte 0x02, 0x00
_09CF:
	npc_msg msg_0065_D23R0101_00029
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_09DA:
	npc_msg msg_0065_D23R0101_00030
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_09E5:
	setflag FLAG_UNK_AA5
	npc_msg msg_0065_D23R0101_00031
	loto_id_get VAR_SPECIAL_x8000
	buffer_int_ex 0, VAR_SPECIAL_x8000, 2, 5
	npc_msg msg_0065_D23R0101_00032
	loto_id_search VAR_SPECIAL_x8001, VAR_SPECIAL_x8002, VAR_SPECIAL_x8003, VAR_SPECIAL_x8000
	compare VAR_SPECIAL_x8002, 0
	goto_if_eq _0A24
	compare VAR_SPECIAL_x8003, 0
	goto_if_eq _0A2F
	goto _0A3D

_0A24:
	npc_msg msg_0065_D23R0101_00035
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0A2F:
	bufferpartymonnick 0, VAR_SPECIAL_x8001
	npc_msg msg_0065_D23R0101_00033
	goto _0A4B

_0A3D:
	bufferboxmonnick 0, VAR_SPECIAL_x8001
	npc_msg msg_0065_D23R0101_00034
	goto _0A4B

_0A4B:
	switch VAR_SPECIAL_x8002
	case 1, _0A94
	case 2, _0A9F
	case 3, _0AA8
	case 4, _0AB1
	case 5, _0ABA
	end

_0A94:
	npc_msg msg_0065_D23R0101_00036
	goto _0AC3
	.byte 0x02, 0x00
_0A9F:
	npc_msg msg_0065_D23R0101_00038
	goto _0AC3

_0AA8:
	npc_msg msg_0065_D23R0101_00039
	goto _0AC3

_0AB1:
	npc_msg msg_0065_D23R0101_00040
	goto _0AC3

_0ABA:
	npc_msg msg_0065_D23R0101_00041
	goto _0AC3

_0AC3:
	switch VAR_SPECIAL_x8002
	case 1, _0B0C
	case 2, _0B1A
	case 3, _0B26
	case 4, _0B32
	case 5, _0B3E
	end

_0B0C:
	setvar VAR_SPECIAL_x8003, 2
	goto _0B4A
	.byte 0x02, 0x00
_0B1A:
	setvar VAR_SPECIAL_x8003, 51
	goto _0B4A

_0B26:
	setvar VAR_SPECIAL_x8003, 216
	goto _0B4A

_0B32:
	setvar VAR_SPECIAL_x8003, 29
	goto _0B4A

_0B3E:
	setvar VAR_SPECIAL_x8003, 1
	goto _0B4A

_0B4A:
	goto_if_no_item_space VAR_SPECIAL_x8003, 1, _0B75
	callstd std_give_item_verbose
	goto _0B98

_0B75:
	copyvar VAR_UNK_4136, VAR_SPECIAL_x8002
	npc_msg msg_0065_D23R0101_00042
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0B86:
	buffer_players_name 0
	npc_msg msg_0065_D23R0101_00043
	copyvar VAR_SPECIAL_x8002, VAR_UNK_4136
	goto _0AC3

_0B98:
	setvar VAR_UNK_4136, 0
	setflag FLAG_UNK_AA6
	npc_msg msg_0065_D23R0101_00044
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
