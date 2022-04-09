#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D36R0101.h"
#include "msgdata/msg/msg_0115_D36R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D36R0101_000
	scrdef scr_seq_D36R0101_001
	scrdef scr_seq_D36R0101_002
	scrdef scr_seq_D36R0101_003
	scrdef scr_seq_D36R0101_004
	scrdef scr_seq_D36R0101_005
	scrdef scr_seq_D36R0101_006
	scrdef scr_seq_D36R0101_007
	scrdef scr_seq_D36R0101_008
	scrdef scr_seq_D36R0101_009
	scrdef scr_seq_D36R0101_010
	scrdef scr_seq_D36R0101_011
	scrdef scr_seq_D36R0101_012
	scrdef scr_seq_D36R0101_013
	scrdef scr_seq_D36R0101_014
	scrdef scr_seq_D36R0101_015
	scrdef scr_seq_D36R0101_016
	scrdef scr_seq_D36R0101_017
	scrdef scr_seq_D36R0101_018
	scrdef scr_seq_D36R0101_019
	scrdef scr_seq_D36R0101_020
	scrdef scr_seq_D36R0101_021
	scrdef scr_seq_D36R0101_022
	scrdef_end

scr_seq_D36R0101_000:
	get_friend_sprite VAR_OBJ_0
	goto_if_unset FLAG_UNK_189, _0077
	clearflag FLAG_UNK_189
	goto _00C3

_0077:
	check_badge BADGE_PLAIN, VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_eq _00B5
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 2
	goto_if_eq _00BF
	compare VAR_TEMP_x4000, 6
	goto_if_eq _00BF
	compare VAR_TEMP_x4000, 0
	goto_if_eq _00BF
_00B5:
	setflag FLAG_HIDE_CAMERON
	goto _00C3

_00BF:
	clearflag FLAG_HIDE_CAMERON
_00C3:
	goto_if_set FLAG_BEAT_AZALEA_ROCKETS, _00D0
	end

_00D0:
	setvar VAR_UNK_4099, 1
	setvar VAR_UNK_409A, 2
	setvar VAR_UNK_409C, 2
	setvar VAR_UNK_409D, 2
	setvar VAR_UNK_409E, 1
	setvar VAR_TEMP_x4000, 0
	setvar VAR_TEMP_x4001, 0
	setvar VAR_TEMP_x4002, 0
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 0
	goto_if_set FLAG_FOUND_FIRST_FARFETCHD, _0124
	goto_if_set FLAG_FOUND_SECOND_FARFETCHD, _0145
	end

_0124:
	goto_if_set FLAG_FOUND_SECOND_FARFETCHD, _0137
	setvar VAR_UNK_4099, 2
	end

_0137:
	setvar VAR_UNK_4099, 2
	setvar VAR_UNK_409E, 2
	end

_0145:
	setvar VAR_UNK_4099, 1
	setvar VAR_UNK_409E, 2
	end

scr_seq_D36R0101_021:
	compare VAR_UNK_412B, 1
	call_if_eq _016F
	compare VAR_UNK_40FE, 4
	call_if_eq _0189
	end

_016F:
	move_person_facing obj_D36R0101_gsoldman1, 15, 0, 58, DIR_SOUTH
	move_person_facing obj_D36R0101_tsure_poke_static_pichu_spiky, 15, 0, 59, DIR_EAST
	return

_0189:
	move_person_facing obj_D36R0101_var_1, 15, 0, 58, DIR_SOUTH
	move_person_facing obj_D36R0101_tsure_poke_static_marill, 11, 0, 58, DIR_EAST
	return

scr_seq_D36R0101_001:
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4000, 25
	goto_if_ne _01C4
	goto _01D7
	.byte 0x16, 0x00
	.byte 0x13, 0x00, 0x00, 0x00
_01C4:
	compare VAR_TEMP_x4000, 32
	goto_if_ne _01D7
	goto _020B

_01D7:
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 52
	goto_if_ne _01F8
	goto _0245
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
_01F8:
	compare VAR_TEMP_x4001, 62
	goto_if_ne _020B
	goto _0299

_020B:
	setvar VAR_TEMP_x4002, 0
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 52
	goto_if_ne _0232
	goto _03CA
	.byte 0x16, 0x00, 0x13, 0x00
	.byte 0x00, 0x00
_0232:
	compare VAR_TEMP_x4001, 62
	goto_if_ne _0245
	goto _042A

_0245:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4002, 0
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0272
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _0E18
	goto _0293

_0272:
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _0293
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _0E08
	setvar VAR_UNK_409B, 1
	setvar VAR_UNK_4099, 1
_0293:
	wait_movement
	releaseall
	end

_0299:
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _02B6
	goto _02C9
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
_02B6:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _02C9
	goto _0301

_02C9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_UNK_4099, 2
	setvar VAR_UNK_409B, 2
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _0DF8
	wait_movement
	goto_if_set FLAG_UNK_126, _02FD
	npc_msg msg_0115_D36R0101_00036
	wait_button_or_walk_away
	closemsg
	setflag FLAG_UNK_126
_02FD:
	releaseall
	end

_0301:
	compare VAR_TEMP_x4002, 1
	goto_if_eq _0346
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_UNK_4099, 2
	setvar VAR_UNK_409B, 2
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _0E18
	wait_movement
	goto_if_set FLAG_UNK_126, _0342
	npc_msg msg_0115_D36R0101_00036
	wait_button_or_walk_away
	closemsg
	setflag FLAG_UNK_126
_0342:
	releaseall
	end

_0346:
	play_se SEQ_SE_DP_SELECT
	lockall
	play_cry SPECIES_FARFETCHD, 0
	npc_msg msg_0115_D36R0101_00003
	closemsg
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _0E58
	wait_movement
	hide_person obj_D36R0101_tsure_poke_static_farfetchd
	npc_msg msg_0115_D36R0101_00037
	wait_button_or_walk_away
	closemsg
	setvar VAR_UNK_4099, 2
	setvar VAR_UNK_409B, 2
	setflag FLAG_HIDE_FARFETCHD_1_LOST
	setflag FLAG_FOUND_FIRST_FARFETCHD
	goto_if_set FLAG_FOUND_SECOND_FARFETCHD, _1207
	clearflag FLAG_HIDE_FARFETCHD_1_FOUND
	wait 20, VAR_SPECIAL_x8004
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_D36R0101, 0, 15, 65, DIR_NORTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	wait 5, VAR_SPECIAL_x8004
	npc_msg msg_0115_D36R0101_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_03CA:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _0403
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _0E08
	setvar VAR_UNK_409B, 1
	setvar VAR_UNK_4099, 1
	setvar VAR_TEMP_x4004, 1
	goto _0424

_0403:
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0424
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _0E28
	setvar VAR_UNK_4099, 2
	setvar VAR_UNK_409B, 2
_0424:
	wait_movement
	releaseall
	end

_042A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4004, 0
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _0463
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _0DF8
	setvar VAR_UNK_4099, 2
	setvar VAR_UNK_409B, 2
	goto _0484

_0463:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0484
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _0E28
	setvar VAR_UNK_4099, 1
	setvar VAR_UNK_409B, 2
_0484:
	wait_movement
	releaseall
	end

scr_seq_D36R0101_003:
	scrcmd_609
	lockall
	compare VAR_TEMP_x4004, 1
	goto_if_eq _068E
	setvar VAR_TEMP_x4002, 1
	setvar VAR_UNK_4099, 2
	setvar VAR_UNK_409B, 1
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4000, 25
	goto_if_ne _04CE
	goto _04E1
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
_04CE:
	compare VAR_TEMP_x4000, 32
	goto_if_ne _04E1
	goto _0515

_04E1:
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 52
	goto_if_ne _0502
	goto _0549
	.byte 0x16, 0x00, 0x13, 0x00
	.byte 0x00, 0x00
_0502:
	compare VAR_TEMP_x4001, 62
	goto_if_ne _0515
	goto _0557

_0515:
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 52
	goto_if_ne _0536
	goto _057B
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
_0536:
	compare VAR_TEMP_x4001, 62
	goto_if_ne _0549
	goto _0589

_0549:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _0DC8
	wait_movement
	releaseall
	end

_0557:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _0DC8
	wait_movement
	goto_if_set FLAG_UNK_125, _0577
	npc_msg msg_0115_D36R0101_00035
	wait_button_or_walk_away
	closemsg
	setflag FLAG_UNK_125
_0577:
	releaseall
	end

_057B:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _0DC8
	wait_movement
	releaseall
	end

_0589:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _0DE0
	wait_movement
	releaseall
	end

scr_seq_D36R0101_004:
	scrcmd_609
	lockall
	compare VAR_TEMP_x4004, 1
	goto_if_eq _068E
	setvar VAR_UNK_4099, 1
	setvar VAR_UNK_409B, 2
	setvar VAR_TEMP_x4002, 0
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4000, 25
	goto_if_ne _05DB
	goto _05EE
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
_05DB:
	compare VAR_TEMP_x4000, 32
	goto_if_ne _05EE
	goto _0622

_05EE:
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 52
	goto_if_ne _060F
	goto _0656
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
_060F:
	compare VAR_TEMP_x4001, 62
	goto_if_ne _0622
	goto _0664

_0622:
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 52
	goto_if_ne _0643
	goto _0672
	.byte 0x16, 0x00, 0x13
	.byte 0x00, 0x00, 0x00
_0643:
	compare VAR_TEMP_x4001, 62
	goto_if_ne _0656
	goto _0680

_0656:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _0DC8
	wait_movement
	releaseall
	end

_0664:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _0DEC
	wait_movement
	releaseall
	end

_0672:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _0DC8
	wait_movement
	releaseall
	end

_0680:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _0DE0
	wait_movement
	releaseall
	end

_068E:
	setvar VAR_UNK_4099, 2
	setvar VAR_UNK_409B, 2
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _0DE0
	wait_movement
	releaseall
	end

scr_seq_D36R0101_005:
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4000, 41
	goto_if_ne _06C9
	goto _06DC
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
_06C9:
	compare VAR_TEMP_x4000, 49
	goto_if_ne _06DC
	goto _0716

_06DC:
	setvar VAR_TEMP_x4003, 0
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 54
	goto_if_ne _0703
	goto _074A
	.byte 0x16, 0x00, 0x13
	.byte 0x00, 0x00, 0x00
_0703:
	compare VAR_TEMP_x4001, 64
	goto_if_ne _0716
	goto _07D4

_0716:
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 54
	goto_if_ne _0737
	goto _0846
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
_0737:
	compare VAR_TEMP_x4001, 64
	goto_if_ne _074A
	goto _0982

_074A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _078B
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _0E38
	wait_movement
	setvar VAR_UNK_409A, 1
	setvar VAR_UNK_409C, 1
	setvar VAR_UNK_409D, 2
	setvar VAR_UNK_409E, 2
	goto _07BA

_078B:
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _07BA
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _0E08
	wait_movement
	setvar VAR_UNK_409A, 2
	setvar VAR_UNK_409C, 2
	setvar VAR_UNK_409D, 1
	setvar VAR_UNK_409E, 2
_07BA:
	goto_if_set FLAG_UNK_126, _07D0
	npc_msg msg_0115_D36R0101_00036
	wait_button_or_walk_away
	closemsg
	setflag FLAG_UNK_126
_07D0:
	releaseall
	end

_07D4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0813
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _0E38
	setvar VAR_UNK_409A, 2
	setvar VAR_UNK_409C, 2
	setvar VAR_UNK_409D, 2
	setvar VAR_UNK_409E, 2
	goto _0840

_0813:
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _0840
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _0DF8
	setvar VAR_UNK_409A, 2
	setvar VAR_UNK_409C, 2
	setvar VAR_UNK_409D, 2
	setvar VAR_UNK_409E, 1
_0840:
	wait_movement
	releaseall
	end

_0846:
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0863
	goto _0876
	.byte 0x16, 0x00, 0x13
	.byte 0x00, 0x00, 0x00
_0863:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _0876
	goto _08A4

_0876:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_UNK_409A, 2
	setvar VAR_UNK_409C, 2
	setvar VAR_UNK_409D, 2
	setvar VAR_UNK_409E, 2
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _0E48
	wait_movement
	releaseall
	end

_08A4:
	compare VAR_TEMP_x4003, 1
	goto_if_eq _08DF
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_UNK_409A, 2
	setvar VAR_UNK_409C, 2
	setvar VAR_UNK_409D, 1
	setvar VAR_UNK_409E, 2
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _0E08
	wait_movement
	releaseall
	end

_08DF:
	play_se SEQ_SE_DP_SELECT
	lockall
	play_cry SPECIES_FARFETCHD, 0
	npc_msg msg_0115_D36R0101_00003
	closemsg
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _0E60
	wait_movement
	hide_person obj_D36R0101_tsure_poke_static_farfetchd_2
	npc_msg msg_0115_D36R0101_00037
	wait_button_or_walk_away
	closemsg
	call_if_unset FLAG_FOUND_FIRST_FARFETCHD, _097A
	setvar VAR_UNK_409A, 2
	setvar VAR_UNK_409C, 2
	setvar VAR_UNK_409D, 2
	setvar VAR_UNK_409E, 2
	setflag FLAG_HIDE_FARFETCHD_2_LOST
	setflag FLAG_FOUND_SECOND_FARFETCHD
	goto_if_set FLAG_FOUND_FIRST_FARFETCHD, _1207
	clearflag FLAG_HIDE_FARFETCHD_1_FOUND
	wait 20, VAR_SPECIAL_x8004
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_D36R0101, 0, 15, 65, DIR_NORTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	wait 5, VAR_SPECIAL_x8004
	npc_msg msg_0115_D36R0101_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_097A:
	setvar VAR_UNK_4099, 1
	return

_0982:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _09C7
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _0DF8
	setvar VAR_UNK_409A, 1
	setvar VAR_UNK_409C, 1
	setvar VAR_UNK_409D, 2
	setvar VAR_UNK_409E, 1
	goto _09F4

_09C7:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _09F4
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _0E48
	setvar VAR_UNK_409A, 2
	setvar VAR_UNK_409C, 2
	setvar VAR_UNK_409D, 2
	setvar VAR_UNK_409E, 2
_09F4:
	wait_movement
	releaseall
	end

scr_seq_D36R0101_006:
	scrcmd_609
	lockall
	setvar VAR_TEMP_x4003, 0
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4000, 41
	goto_if_ne _0A25
	goto _0A38
	.byte 0x16
	.byte 0x00, 0x13, 0x00, 0x00, 0x00
_0A25:
	compare VAR_TEMP_x4000, 49
	goto_if_ne _0A38
	goto _0A6C

_0A38:
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 54
	goto_if_ne _0A59
	goto _0AA0
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
_0A59:
	compare VAR_TEMP_x4001, 64
	goto_if_ne _0A6C
	goto _0AAE

_0A6C:
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 54
	goto_if_ne _0A8D
	goto _0ABC
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
_0A8D:
	compare VAR_TEMP_x4001, 64
	goto_if_ne _0AA0
	goto _0AE2

_0AA0:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _0DEC
	wait_movement
	releaseall
	end

_0AAE:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _0DD4
	wait_movement
	releaseall
	end

_0ABC:
	setvar VAR_UNK_409A, 2
	setvar VAR_UNK_409C, 1
	setvar VAR_UNK_409D, 2
	setvar VAR_UNK_409E, 1
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _0DD4
	wait_movement
	releaseall
	end

_0AE2:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _0DD4
	wait_movement
	releaseall
	end

scr_seq_D36R0101_007:
	scrcmd_609
	lockall
	setvar VAR_TEMP_x4003, 1
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4000, 41
	goto_if_ne _0B1B
	goto _0B2E
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
_0B1B:
	compare VAR_TEMP_x4000, 49
	goto_if_ne _0B2E
	goto _0B62

_0B2E:
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 54
	goto_if_ne _0B4F
	goto _0B96
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
_0B4F:
	compare VAR_TEMP_x4001, 64
	goto_if_ne _0B62
	goto _0BA4

_0B62:
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 54
	goto_if_ne _0B83
	goto _0BB2
	.byte 0x16, 0x00, 0x13
	.byte 0x00, 0x00, 0x00
_0B83:
	compare VAR_TEMP_x4001, 64
	goto_if_ne _0B96
	goto _0BD8

_0B96:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _0DEC
	wait_movement
	releaseall
	end

_0BA4:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _0DEC
	wait_movement
	releaseall
	end

_0BB2:
	setvar VAR_UNK_409A, 1
	setvar VAR_UNK_409C, 2
	setvar VAR_UNK_409D, 2
	setvar VAR_UNK_409E, 1
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _0DEC
	wait_movement
	releaseall
	end

_0BD8:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _0DD4
	wait_movement
	releaseall
	end

scr_seq_D36R0101_008:
	scrcmd_609
	lockall
	setvar VAR_TEMP_x4003, 0
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4000, 41
	goto_if_ne _0C11
	goto _0C24
	.byte 0x16, 0x00, 0x13, 0x00, 0x00
	.byte 0x00
_0C11:
	compare VAR_TEMP_x4000, 49
	goto_if_ne _0C24
	goto _0C58

_0C24:
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 54
	goto_if_ne _0C45
	goto _0C8C
	.byte 0x16
	.byte 0x00, 0x13, 0x00, 0x00, 0x00
_0C45:
	compare VAR_TEMP_x4001, 64
	goto_if_ne _0C58
	goto _0C9A

_0C58:
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 54
	goto_if_ne _0C79
	goto _0CAE
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
_0C79:
	compare VAR_TEMP_x4001, 64
	goto_if_ne _0C8C
	goto _0CBC

_0C8C:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _0DC8
	wait_movement
	releaseall
	end

_0C9A:
	setvar VAR_UNK_409D, 2
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _0DEC
	wait_movement
	releaseall
	end

_0CAE:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _0DC8
	wait_movement
	releaseall
	end

_0CBC:
	setvar VAR_UNK_409D, 2
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _0DE0
	wait_movement
	releaseall
	end

scr_seq_D36R0101_009:
	scrcmd_609
	lockall
	setvar VAR_TEMP_x4003, 0
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4000, 41
	goto_if_ne _0CFB
	goto _0D0E
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
_0CFB:
	compare VAR_TEMP_x4000, 49
	goto_if_ne _0D0E
	goto _0D42

_0D0E:
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 54
	goto_if_ne _0D2F
	goto _0D76
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
_0D2F:
	compare VAR_TEMP_x4001, 64
	goto_if_ne _0D42
	goto _0D8A

_0D42:
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 54
	goto_if_ne _0D63
	goto _0D98
	.byte 0x16, 0x00, 0x13
	.byte 0x00, 0x00, 0x00
_0D63:
	compare VAR_TEMP_x4001, 64
	goto_if_ne _0D76
	goto _0DB8

_0D76:
	setvar VAR_UNK_409E, 2
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _0DEC
	wait_movement
	releaseall
	end

_0D8A:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _0DD4
	wait_movement
	releaseall
	end

_0D98:
	setvar VAR_UNK_409A, 1
	setvar VAR_UNK_409C, 1
	setvar VAR_UNK_409E, 2
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _0DE0
	wait_movement
	releaseall
	end

_0DB8:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _0DD4
	wait_movement
	releaseall
	end
	.byte 0x00, 0x00

_0DC8:
	step 1, 1
	step 75, 1
	step_end

_0DD4:
	step 0, 1
	step 75, 1
	step_end

_0DE0:
	step 2, 1
	step 75, 1
	step_end

_0DEC:
	step 3, 1
	step 75, 1
	step_end

_0DF8:
	step 75, 1
	step 16, 10
	step 1, 1
	step_end

_0E08:
	step 75, 1
	step 17, 10
	step 0, 1
	step_end

_0E18:
	step 75, 1
	step 19, 7
	step 2, 1
	step_end

_0E28:
	step 75, 1
	step 18, 7
	step 3, 1
	step_end

_0E38:
	step 75, 1
	step 19, 8
	step 2, 1
	step_end

_0E48:
	step 75, 1
	step 18, 8
	step 3, 1
	step_end

_0E58:
	step 37, 5
	step_end

_0E60:
	step 39, 5
	step_end
scr_seq_D36R0101_016:
	scrcmd_609
	lockall
	apply_movement obj_player, _0EC4
	wait_movement
	apply_movement obj_D36R0101_gsbigman, _0ED0
	wait_movement
	play_se SEQ_SE_DP_KI_GASYAN
	scrcmd_561 0, 2, 10, 5
	apply_movement obj_D36R0101_gsbigman, _0ED8
	wait_movement
	apply_movement obj_D36R0101_gsbigman, _0ED0
	wait_movement
	play_se SEQ_SE_DP_KI_GASYAN
	scrcmd_561 0, 2, 10, 5
	apply_movement obj_D36R0101_gsbigman, _0ED8
	wait_movement
	setvar VAR_UNK_40EA, 1
	releaseall
	end


_0EC4:
	step 75, 1
	step 32, 1
	step_end

_0ED0:
	step 52, 1
	step_end

_0ED8:
	step 71, 1
	step 9, 1
	step 72, 1
	step_end
scr_seq_D36R0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0115_D36R0101_00011
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _1086
	npc_msg msg_0115_D36R0101_00014
	closemsg
_0F0B:
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	party_select_ui
	get_party_selection VAR_SPECIAL_RESULT
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_SPECIAL_RESULT, 255
	goto_if_eq _1093
	get_partymon_species VAR_SPECIAL_RESULT, VAR_SPECIAL_x8005
	setorcopyvar VAR_SPECIAL_x8006, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_x8005, 0
	goto_if_eq _10A0
	mon_has_move VAR_SPECIAL_RESULT, MOVE_HEADBUTT, VAR_SPECIAL_x8006
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _10E1
	scrcmd_656 VAR_SPECIAL_x8006, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0F84
	npc_msg msg_0115_D36R0101_00016
	closemsg
	goto _0F0B

_0F84:
	count_mon_moves VAR_SPECIAL_x8002, VAR_SPECIAL_x8006
	compare VAR_SPECIAL_x8002, 3
	goto_if_le _1041
	touchscreen_menu_hide
_0F99:
	bufferpartymonnick 0, VAR_SPECIAL_x8006
	npc_msg msg_0115_D36R0101_00017
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _10C7
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	choose_move_ui 1, VAR_SPECIAL_x8006, 29
	get_move_selection 1, VAR_SPECIAL_x8001
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_SPECIAL_x8001, 4
	goto_if_eq _10AB
	buffer_party_mon_move_name 1, VAR_SPECIAL_x8006, VAR_SPECIAL_x8001
	npc_msg msg_0115_D36R0101_00018
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _10C7
	set_mon_move VAR_SPECIAL_x8006, VAR_SPECIAL_x8001, MOVE_HEADBUTT
	npc_msg msg_0115_D36R0101_00020
	play_se SEQ_SE_DP_KON
	wait_se SEQ_SE_DP_KON
	wait 30, VAR_SPECIAL_RESULT
	npc_msg msg_0115_D36R0101_00024
	wait 32, VAR_SPECIAL_RESULT
	npc_msg msg_0115_D36R0101_00025
	play_fanfare SEQ_ME_LVUP
	wait_fanfare
	wait 16, VAR_SPECIAL_RESULT
	play_cry VAR_SPECIAL_x8005, 0
	goto _1079

_1041:
	bufferpartymonnick 0, VAR_SPECIAL_x8006
	set_mon_move VAR_SPECIAL_x8006, VAR_SPECIAL_x8002, MOVE_HEADBUTT
	npc_msg msg_0115_D36R0101_00021
	wait 30, VAR_SPECIAL_RESULT
	npc_msg msg_0115_D36R0101_00026
	play_fanfare SEQ_ME_LVUP
	wait_fanfare
	wait 32, VAR_SPECIAL_RESULT
	play_cry VAR_SPECIAL_x8005, 0
	npc_msg msg_0115_D36R0101_00022
	wait_button_or_walk_away
	closemsg
	touchscreen_menu_show
	releaseall
	end

_1079:
	npc_msg msg_0115_D36R0101_00022
	wait_button_or_walk_away
	closemsg
	touchscreen_menu_show
	releaseall
	end

_1086:
	npc_msg msg_0115_D36R0101_00013
	wait_button_or_walk_away
	closemsg
	touchscreen_menu_show
	releaseall
	end

_1093:
	npc_msg msg_0115_D36R0101_00013
	wait_button_or_walk_away
	closemsg
	touchscreen_menu_show
	releaseall
	end

_10A0:
	npc_msg msg_0115_D36R0101_00015
	closemsg
	goto _0F0B

_10AB:
	npc_msg msg_0115_D36R0101_00019
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0F99
	goto _1086

_10C7:
	npc_msg msg_0115_D36R0101_00019
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0F99
	goto _1086

_10E1:
	buffer_mon_species_name 0, VAR_SPECIAL_x8006
	npc_msg msg_0115_D36R0101_00023
	closemsg
	goto _0F0B
	.byte 0x02, 0x00
scr_seq_D36R0101_010:
	goto_if_set FLAG_FOUND_FIRST_FARFETCHD, _1104
	goto _1115

_1104:
	goto_if_set FLAG_FOUND_SECOND_FARFETCHD, _1126
	goto _1139

_1115:
	goto_if_set FLAG_FOUND_SECOND_FARFETCHD, _1139
	goto _114C

_1126:
	simple_npc_msg msg_0115_D36R0101_00002
	end

_1139:
	simple_npc_msg msg_0115_D36R0101_00001
	end

_114C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0115_D36R0101_00000
	wait_button_or_walk_away
	closemsg
	setvar VAR_UNK_40F4, 0
	releaseall
	end

scr_seq_D36R0101_017:
	scrcmd_609
	lockall
	apply_movement obj_D36R0101_gsboy1, _118C
	apply_movement obj_player, _1194
	wait_movement
	npc_msg msg_0115_D36R0101_00000
	wait_button_or_walk_away
	closemsg
	setvar VAR_UNK_40F4, 0
	releaseall
	end


_118C:
	step 75, 1
	step_end

_1194:
	step 63, 2
	step 0, 1
	step_end
scr_seq_D36R0101_011:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_080, _11F2
	npc_msg msg_0115_D36R0101_00006
	goto_if_no_item_space ITEM_HM01, 1, _11FD
	callstd std_give_item_verbose
	setflag FLAG_UNK_080
	clearflag FLAG_UNK_1AE
	clearflag FLAG_UNK_1AC
	npc_msg msg_0115_D36R0101_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_11F2:
	npc_msg msg_0115_D36R0101_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_11FD:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_1207:
	clearflag FLAG_HIDE_ILEX_CUT_MASTER
	show_person obj_D36R0101_gsfighter
	clearflag FLAG_HIDE_FARFETCHD_2_FOUND
	wait 20, VAR_SPECIAL_x8004
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_D36R0101, 0, 15, 65, DIR_NORTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	wait 5, VAR_SPECIAL_x8004
	npc_msg msg_0115_D36R0101_00002
	wait_button_or_walk_away
	closemsg
	apply_movement obj_D36R0101_gsfighter, _12EC
	apply_movement obj_player, _12F8
	wait_movement
	goto_if_set FLAG_UNK_080, _12BE
	npc_msg msg_0115_D36R0101_00006
	goto_if_no_item_space ITEM_HM01, 1, _12C9
	callstd std_give_item_verbose
	setflag FLAG_HIDE_ILEX_CUT_MASTER
	setflag FLAG_HIDE_ILEX_APPRENTICE
	setflag FLAG_HIDE_FARFETCHD_1_LOST
	setflag FLAG_HIDE_FARFETCHD_2_LOST
	setflag FLAG_HIDE_FARFETCHD_1_FOUND
	setflag FLAG_HIDE_FARFETCHD_2_FOUND
	setflag FLAG_UNK_080
	clearflag FLAG_UNK_1AE
	clearflag FLAG_UNK_1AC
	npc_msg msg_0115_D36R0101_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_12BE:
	npc_msg msg_0115_D36R0101_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_12C9:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_D36R0101_014:
	play_cry SPECIES_FARFETCHD, 0
	simple_npc_msg msg_0115_D36R0101_00004
	end


_12EC:
	step 12, 10
	step 15, 3
	step_end

_12F8:
	step 63, 12
	step 2, 1
	step_end
scr_seq_D36R0101_015:
	scrcmd_609
	lockall
	callstd std_play_kimono_girl_music
	apply_movement obj_D36R0101_dancer, _1478
	wait_movement
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	compare VAR_SPECIAL_x8004, 40
	goto_if_ne _1337
	apply_movement obj_D36R0101_dancer, _1484
	goto _133F

_1337:
	apply_movement obj_D36R0101_dancer, _1494
_133F:
	wait_movement
	npc_msg msg_0115_D36R0101_00029
	closemsg
	apply_movement obj_D36R0101_dancer, _14A4
	wait_movement
	npc_msg msg_0115_D36R0101_00030
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _1371
	npc_msg msg_0115_D36R0101_00031
	goto _1374

_1371:
	npc_msg msg_0115_D36R0101_00032
_1374:
	closemsg
	get_party_lead_alive VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 50
	goto_if_eq _13D5
	compare VAR_TEMP_x4001, 51
	goto_if_eq _13D5
	release obj_partner_poke
	compare VAR_SPECIAL_x8004, 40
	goto_if_ne _13C1
	apply_movement obj_player, _14E8
	apply_movement obj_partner_poke, _14FC
	goto _13C9

_13C1:
	apply_movement obj_partner_poke, _1518
_13C9:
	wait_movement
	lock obj_partner_poke
	goto _140A

_13D5:
	release obj_partner_poke
	compare VAR_SPECIAL_x8004, 40
	goto_if_ne _13FC
	apply_movement obj_player, _14E8
	apply_movement obj_partner_poke, _1538
	goto _1404

_13FC:
	apply_movement obj_partner_poke, _1550
_1404:
	wait_movement
	lock obj_partner_poke
_140A:
	compare VAR_SPECIAL_x8004, 40
	goto_if_ne _1425
	apply_movement obj_D36R0101_dancer, _156C
	goto _142D

_1425:
	apply_movement obj_D36R0101_dancer, _1574
_142D:
	wait_movement
	npc_msg msg_0115_D36R0101_00033
	closemsg
	apply_movement obj_D36R0101_dancer, _157C
	wait_movement
	npc_msg msg_0115_D36R0101_00034
	closemsg
	apply_movement obj_D36R0101_dancer, _159C
	wait_movement
	hide_person obj_D36R0101_dancer
	setflag FLAG_UNK_23D
	callstd std_fade_end_kimono_girl_music
	release obj_partner_poke
	apply_movement obj_partner_poke, _1584
	wait_movement
	lock obj_partner_poke
	releaseall
	setvar VAR_UNK_40E9, 1
	end
	.byte 0x00, 0x00, 0x00

_1478:
	step 75, 1
	step 33, 1
	step_end

_1484:
	step 13, 1
	step 15, 2
	step 13, 1
	step_end

_1494:
	step 13, 1
	step 15, 3
	step 13, 1
	step_end

_14A4:
	step 2, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step_end

_14E8:
	step 2, 1
	step 71, 1
	step 15, 1
	step 72, 1
	step_end

_14FC:
	step 12, 2
	step 14, 1
	step 12, 2
	step 14, 3
	step 35, 1
	step 51, 3
	step_end

_1518:
	step 14, 1
	step 12, 2
	step 14, 1
	step 12, 2
	step 14, 3
	step 35, 1
	step 51, 3
	step_end

_1538:
	step 12, 2
	step 14, 1
	step 12, 2
	step 14, 3
	step 35, 1
	step_end

_1550:
	step 14, 1
	step 12, 2
	step 14, 1
	step 12, 2
	step 14, 3
	step 35, 1
	step_end

_156C:
	step 34, 1
	step_end

_1574:
	step 14, 1
	step_end

_157C:
	step 33, 1
	step_end

_1584:
	step 15, 3
	step 13, 2
	step 15, 1
	step 13, 1
	step 35, 1
	step_end

_159C:
	step 14, 2
	step 12, 2
	step 14, 6
	step_end
scr_seq_D36R0101_018:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _16D8
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _16EC
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _1625
	apply_movement obj_player, _1700
	apply_movement obj_D36R0101_gsmiddleman1, _174C
	goto _1677

_1625:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _1640
	apply_movement obj_player, _1718
	goto _1677

_1640:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _1663
	apply_movement obj_player, _1738
	apply_movement obj_D36R0101_gsmiddleman1, _174C
	goto _1677

_1663:
	stop_se SEQ_SE_GS_N_SESERAGI
	apply_movement obj_player, _1724
	apply_movement obj_D36R0101_gsmiddleman1, _174C
_1677:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _169E
	apply_movement obj_partner_poke, _1758
	wait_movement
_169E:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 8
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

_16D8:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_16EC:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end


_1700:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_1718:
	step 12, 3
	step 33, 1
	step_end

_1724:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_1738:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_174C:
	step 63, 1
	step 32, 1
	step_end

_1758:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_D36R0101_012:
	player_on_bike_check VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _1803
	compare VAR_UNK_412B, 2
	goto_if_ge _17C1
	compare VAR_UNK_412B, 1
	goto_if_eq _1803
	get_party_lead_alive VAR_TEMP_x4000
	follower_poke_is_event_trigger 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_ne _17B7
	goto _17C1
	.byte 0x16, 0x00, 0x0a, 0x00, 0x00, 0x00
_17B7:
	clearflag FLAG_HIDE_ILEX_FOREST_SPIKY_EAR_PICHU
	goto _1816

_17C1:
	compare VAR_UNK_40FE, 4
	goto_if_ge _1803
	goto_if_unset FLAG_BEAT_RADIO_TOWER_ROCKETS, _1803
	get_party_lead_alive VAR_TEMP_x4006
	follower_poke_is_event_trigger 3, VAR_TEMP_x4006, VAR_TEMP_x4007
	compare VAR_TEMP_x4007, 0
	goto_if_ne _17FD
	goto _1803
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
_17FD:
	goto _1F48

_1803:
	simple_npc_msg msg_0115_D36R0101_00028
	end

_1816:
	scrcmd_609
	lockall
	scrcmd_081 0
	clearflag FLAG_HIDE_ILEX_FOREST_SPIKY_EAR_PICHU
	show_person obj_D36R0101_tsure_poke_static_pichu_spiky
	apply_movement obj_D36R0101_tsure_poke_static_pichu_spiky, _1C44
	wait_movement
	play_cry SPECIES_PICHU, 0
	wait_cry
	apply_movement obj_player, _1C58
	wait_movement
	callstd std_play_pichu_music
	apply_movement obj_D36R0101_tsure_poke_static_pichu_spiky, _1C64
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _1C8C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg msg_0115_D36R0101_00038
	closemsg
	apply_movement obj_partner_poke, _1CB4
	wait_movement
	apply_movement obj_D36R0101_tsure_poke_static_pichu_spiky, _1CC4
	wait_movement
	apply_movement obj_partner_poke, _1CF8
	wait_movement
	apply_movement obj_D36R0101_tsure_poke_static_pichu_spiky, _1D08
	apply_movement obj_partner_poke, _1D2C
	wait_movement
	clearflag FLAG_HIDE_ILEX_FOREST_OLD_MAN
	show_person obj_D36R0101_gsoldman1
	apply_movement obj_D36R0101_gsoldman1, _1DE0
	apply_movement obj_D36R0101_tsure_poke_static_pichu_spiky, _1D48
	apply_movement obj_partner_poke, _1DA4
	wait_movement
	apply_movement obj_player, _1E88
	wait_movement
	npc_msg msg_0115_D36R0101_00046
	closemsg
	apply_movement obj_D36R0101_gsoldman1, _1DF4
	wait_movement
	npc_msg msg_0115_D36R0101_00047
	closemsg
	apply_movement obj_D36R0101_gsoldman1, _1E00
	apply_movement obj_D36R0101_tsure_poke_static_pichu_spiky, _1E10
	apply_movement obj_player, _1ED0
	wait_movement
	npc_msg msg_0115_D36R0101_00048
	closemsg
	apply_movement obj_D36R0101_tsure_poke_static_pichu_spiky, _1E20
	apply_movement obj_partner_poke, _1E2C
	wait_movement
	npc_msg msg_0115_D36R0101_00049
	closemsg
	apply_movement obj_partner_poke, _1E38
	wait_movement
	apply_movement obj_D36R0101_tsure_poke_static_pichu_spiky, _1E40
	wait_movement
	apply_movement obj_partner_poke, _1E48
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _1E74
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg msg_0115_D36R0101_00039
	play_cry SPECIES_PICHU, 0
	npc_msg msg_0115_D36R0101_00043
	wait_cry
	closemsg
	call _1987
	compare VAR_SPECIAL_x8004, 1
	call_if_ge _1AFB
	compare VAR_SPECIAL_x8004, 0
	call_if_eq _19AC
	releaseall
	end

_1987:
	get_party_count VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 6
	goto_if_lt _19A4
	setvar VAR_SPECIAL_x8004, 1
	goto _19AA

_19A4:
	setvar VAR_SPECIAL_x8004, 0
_19AA:
	return

_19AC:
	npc_msg msg_0115_D36R0101_00052
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _1EB4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
_19CF:
	get_player_facing VAR_TEMP_x4005
	compare VAR_TEMP_x4005, 3
	goto_if_ne _19EE
	apply_movement obj_D36R0101_gsoldman1, _1E90
	goto _19F6

_19EE:
	apply_movement obj_D36R0101_gsoldman1, _1E98
_19F6:
	wait_movement
	play_fanfare SEQ_ME_ITEM
	buffer_players_name 0
	npc_msg msg_0115_D36R0101_00044
	wait_fanfare
	npc_msg msg_0115_D36R0101_00053
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	compare VAR_TEMP_x4005, 3
	goto_if_ne _1A2C
	apply_movement obj_player, _1ED8
	goto _1A34

_1A2C:
	apply_movement obj_player, _1EE4
_1A34:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	compare VAR_TEMP_x4008, 0
	goto_if_ne _1A51
	callstd std_fade_end_pichu_music
_1A51:
	give_spiky_ear_pichu
	hide_person obj_D36R0101_tsure_poke_static_pichu_spiky
	setvar VAR_UNK_412B, 2
	play_fanfare SEQ_ME_SHINKAOME
	npc_msg msg_0115_D36R0101_00040
	wait_fanfare
	touchscreen_menu_hide
	npc_msg msg_0115_D36R0101_00045
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _1AC5
	closemsg
	get_party_count VAR_TEMP_x4009
	subvar VAR_TEMP_x4009, 1
	setvar VAR_TEMP_x400A, 0
	nop_var_490 VAR_TEMP_x4009
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	nickname_input VAR_TEMP_x4009, VAR_TEMP_x400A
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_TEMP_x400A, 1
	goto_if_eq _1AC5
	bufferpartymonnick 0, VAR_TEMP_x4009
	npc_msg msg_0115_D36R0101_00054
_1AC5:
	npc_msg msg_0115_D36R0101_00051
	closemsg
	touchscreen_menu_show
	compare VAR_TEMP_x4005, 3
	goto_if_ne _1AE7
	apply_movement obj_D36R0101_gsoldman1, _1E64
	goto _1AEF

_1AE7:
	apply_movement obj_D36R0101_gsoldman1, _1E50
_1AEF:
	wait_movement
	hide_person obj_D36R0101_gsoldman1
	setflag FLAG_HIDE_ILEX_FOREST_OLD_MAN
	return

_1AFB:
	npc_msg msg_0115_D36R0101_00050
	wait_button_or_walk_away
	closemsg
	compare VAR_TEMP_x4008, 0
	goto_if_ne _1B13
	callstd std_fade_end_pichu_music
_1B13:
	setvar VAR_UNK_412B, 1
	return

scr_seq_D36R0101_019:
	scrcmd_609
	lockall
	setvar VAR_TEMP_x4008, 1
	get_player_facing VAR_TEMP_x4005
	compare VAR_TEMP_x4005, 3
	goto_if_ne _1B44
	apply_movement obj_D36R0101_tsure_poke_static_pichu_spiky, _1EF0
	goto _1B67

_1B44:
	compare VAR_TEMP_x4005, 2
	goto_if_ne _1B5F
	apply_movement obj_D36R0101_tsure_poke_static_pichu_spiky, _1EF8
	goto _1B67

_1B5F:
	apply_movement obj_D36R0101_tsure_poke_static_pichu_spiky, _1F00
_1B67:
	wait_movement
	play_cry SPECIES_PICHU, 0
	npc_msg msg_0115_D36R0101_00043
	wait_cry
	closemsg
	call _1987
	compare VAR_SPECIAL_x8004, 1
	goto_if_ge _1C36
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_facing VAR_TEMP_x4005
	compare VAR_TEMP_x4005, 3
	goto_if_ne _1BB2
	apply_movement obj_D36R0101_gsoldman1, _1E90
	goto _1BD5

_1BB2:
	compare VAR_TEMP_x4005, 2
	goto_if_ne _1BCD
	apply_movement obj_D36R0101_gsoldman1, _1E98
	goto _1BD5

_1BCD:
	apply_movement obj_D36R0101_gsoldman1, _1EA0
_1BD5:
	wait_movement
	npc_msg msg_0115_D36R0101_00052
	closemsg
	get_player_facing VAR_TEMP_x4005
	compare VAR_TEMP_x4005, 3
	goto_if_ne _1BFB
	apply_movement obj_player, _1EA8
	goto _1C1E

_1BFB:
	compare VAR_TEMP_x4005, 2
	goto_if_ne _1C16
	apply_movement obj_player, _1EB4
	goto _1C1E

_1C16:
	apply_movement obj_player, _1EC0
_1C1E:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	call _19CF
	goto _1C3D

_1C36:
	npc_msg msg_0115_D36R0101_00042
	wait_button_or_walk_away
	closemsg
_1C3D:
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_1C44:
	step 71, 1
	step 59, 1
	step 72, 1
	step 49, 2
	step_end

_1C58:
	step 75, 1
	step 63, 1
	step_end

_1C64:
	step 17, 7
	step 50, 1
	step 18, 4
	step 16, 4
	step 19, 4
	step 17, 4
	step 18, 2
	step 0, 1
	step 48, 2
	step_end

_1C8C:
	step 63, 3
	step 1, 1
	step 63, 1
	step 13, 2
	step 35, 1
	step 65, 1
	step 34, 1
	step 65, 1
	step 33, 1
	step_end

_1CB4:
	step 15, 1
	step 13, 1
	step 1, 1
	step_end

_1CC4:
	step 71, 1
	step 55, 1
	step 72, 1
	step 48, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step_end

_1CF8:
	step 75, 1
	step 63, 1
	step 49, 2
	step_end

_1D08:
	step 71, 1
	step 53, 1
	step 72, 1
	step 65, 1
	step 50, 1
	step 18, 7
	step 16, 13
	step 15, 1
	step_end

_1D2C:
	step 65, 2
	step 17, 1
	step 18, 6
	step 48, 1
	step 16, 13
	step 18, 1
	step_end

_1D48:
	step 17, 12
	step 19, 6
	step 16, 4
	step 18, 3
	step 17, 4
	step 19, 3
	step 71, 1
	step 54, 1
	step 72, 1
	step 1, 6
	step 71, 1
	step 10, 1
	step 72, 1
	step 2, 6
	step 0, 6
	step 71, 1
	step 11, 1
	step 72, 1
	step 3, 6
	step 71, 1
	step 10, 1
	step 72, 1
	step_end

_1DA4:
	step 17, 13
	step 19, 7
	step 48, 1
	step 50, 1
	step 63, 4
	step 71, 1
	step 55, 1
	step 72, 1
	step 1, 6
	step 3, 6
	step 0, 6
	step 2, 6
	step 66, 1
	step 14, 1
	step_end

_1DE0:
	step 65, 5
	step 9, 10
	step 11, 4
	step 35, 1
	step_end

_1DF4:
	step 32, 1
	step 65, 1
	step_end

_1E00:
	step 33, 1
	step 65, 1
	step 75, 1
	step_end

_1E10:
	step 65, 1
	step 32, 1
	step 65, 1
	step_end

_1E20:
	step 48, 1
	step 51, 1
	step_end

_1E2C:
	step 54, 1
	step 50, 2
	step_end

_1E38:
	step 34, 1
	step_end

_1E40:
	step 51, 2
	step_end

_1E48:
	step 48, 2
	step_end

_1E50:
	step 35, 1
	step 65, 1
	step 10, 4
	step 8, 10
	step_end

_1E64:
	step 9, 2
	step 10, 4
	step 8, 12
	step_end

_1E74:
	step 75, 1
	step 63, 1
	step 13, 1
	step 34, 1
	step_end

_1E88:
	step 34, 1
	step_end

_1E90:
	step 34, 1
	step_end

_1E98:
	step 35, 1
	step_end

_1EA0:
	step 33, 1
	step_end

_1EA8:
	step 12, 1
	step 35, 1
	step_end

_1EB4:
	step 12, 1
	step 34, 1
	step_end

_1EC0:
	step 15, 1
	step 12, 2
	step 34, 1
	step_end

_1ED0:
	step 33, 1
	step_end

_1ED8:
	step 13, 1
	step 35, 1
	step_end

_1EE4:
	step 13, 1
	step 34, 1
	step_end

_1EF0:
	step 34, 1
	step_end

_1EF8:
	step 35, 1
	step_end

_1F00:
	step 33, 1
	step_end
scr_seq_D36R0101_020:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4008, 1
	call _1987
	compare VAR_SPECIAL_x8004, 0
	goto_if_ne _1F35
	call _1F3F
	goto _1F3B

_1F35:
	call _1AFB
_1F3B:
	releaseall
	end

_1F3F:
	npc_msg msg_0115_D36R0101_00055
	wait_button_or_walk_away
	closemsg
	return

_1F48:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	apply_movement obj_partner_poke, _2038
	wait_movement
	fade_out_bgm 0, 30
	callstd std_play_friend_music
	touchscreen_menu_hide
	clearflag FLAG_HIDE_ILEX_FOREST_FRIEND
	show_person obj_D36R0101_var_1
	show_person obj_D36R0101_tsure_poke_static_marill
	apply_movement obj_D36R0101_var_1, _2054
	apply_movement obj_D36R0101_tsure_poke_static_marill, _2060
	wait_movement
	apply_movement obj_player, _200C
	wait_movement
	buffer_players_name 0
	gender_msgbox msg_0115_D36R0101_00057, msg_0115_D36R0101_00056
	closemsg
	callstd std_fade_end_friend_music
	play_se SEQ_SE_GS_SUZUSYUTUGEN_HO
	fade_screen 6, 6, 0, RGB_WHITE
	wait_fade
	wait 15, VAR_SPECIAL_RESULT
	fade_screen 6, 6, 1, RGB_WHITE
	wait_fade
	apply_movement obj_player, _2014
	apply_movement obj_D36R0101_var_1, _208C
	wait_movement
	gender_msgbox msg_0115_D36R0101_00059, msg_0115_D36R0101_00058
	closemsg
	play_se SEQ_SE_GS_TIMESLIP
	scrcmd_810
	setvar VAR_UNK_40FE, 1
	clearflag FLAG_HIDE_ROUTE_22_GIOVANNI_RIVAL
	clearflag FLAG_HIDE_ROUTE_22_FRIEND
	setflag FLAG_HIDE_ILEX_FOREST_FRIEND
	warp MAP_R22, 0, 954, 280, DIR_SOUTH
	fade_screen 6, 15, 1, RGB_WHITE
	wait_fade
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_200C:
	step 34, 1
	step_end

_2014:
	step 75, 1
	step 63, 1
	step 32, 1
	step 63, 1
	step 34, 1
	step 63, 1
	step 33, 1
	step 63, 1
	step_end

_2038:
	step 1, 1
	step 1, 1
	step 57, 1
	step 71, 1
	step 52, 1
	step 71, 1
	step_end

_2054:
	step 13, 11
	step 15, 2
	step_end

_2060:
	step 13, 8
	step 35, 1
	step 15, 1
	step 71, 1
	step 13, 1
	step 63, 1
	step 72, 1
	step 34, 1
	step 63, 1
	step 14, 1
	step_end

_208C:
	step 65, 1
	step 15, 2
	step 12, 2
	step 35, 1
	step_end
scr_seq_D36R0101_022:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_D36R0101_var_1, _2148
	apply_movement obj_player, _21F4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	gender_msgbox msg_0115_D36R0101_00061, msg_0115_D36R0101_00060
	closemsg
	apply_movement obj_D36R0101_tsure_poke_static_marill, _2170
	wait_movement
	callstd std_play_friend_music
	apply_movement obj_D36R0101_var_1, _215C
	wait_movement
	gender_msgbox msg_0115_D36R0101_00063, msg_0115_D36R0101_00062
	closemsg
	apply_movement obj_D36R0101_var_1, _218C
	wait_movement
	gender_msgbox msg_0115_D36R0101_00065, msg_0115_D36R0101_00064
	closemsg
	apply_movement obj_D36R0101_var_1, _219C
	apply_movement obj_D36R0101_tsure_poke_static_marill, _21A4
	wait_movement
	buffer_players_name 0
	gender_msgbox msg_0115_D36R0101_00067, msg_0115_D36R0101_00066
	closemsg
	apply_movement obj_D36R0101_var_1, _21AC
	apply_movement obj_D36R0101_tsure_poke_static_marill, _21C4
	wait_movement
	callstd std_fade_end_friend_music
	touchscreen_menu_show
	setvar VAR_UNK_40FE, 5
	hide_person obj_D36R0101_var_1
	hide_person obj_D36R0101_tsure_poke_static_marill
	setflag FLAG_HIDE_ILEX_FOREST_FRIEND
	releaseall
	end
	.byte 0x00

_2148:
	step 34, 1
	step 63, 1
	step 35, 1
	step 63, 1
	step_end

_215C:
	step 34, 1
	step 75, 1
	step 63, 1
	step 34, 1
	step_end

_2170:
	step 63, 1
	step 51, 2
	step 71, 1
	step 52, 1
	step 53, 1
	step 72, 1
	step_end

_218C:
	step 14, 3
	step 65, 1
	step 50, 2
	step_end

_219C:
	step 15, 3
	step_end

_21A4:
	step 15, 3
	step_end

_21AC:
	step 14, 4
	step 12, 6
	step 33, 1
	step 63, 6
	step 12, 5
	step_end

_21C4:
	step 71, 1
	step 53, 1
	step 72, 1
	step 32, 1
	step 14, 3
	step 63, 1
	step 35, 1
	step 63, 4
	step 32, 1
	step 48, 1
	step 12, 10
	step_end

_21F4:
	step 13, 1
	step 63, 1
	step_end
scr_seq_D36R0101_013:
	scrcmd_055 3, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0115_D36R0101_00027, VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
