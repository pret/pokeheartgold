#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T20.h"
#include "msgdata/msg/msg_0542_T20.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T20_000
	scrdef scr_seq_T20_001
	scrdef scr_seq_T20_002
	scrdef scr_seq_T20_003
	scrdef scr_seq_T20_004
	scrdef scr_seq_T20_005
	scrdef scr_seq_T20_006
	scrdef scr_seq_T20_007
	scrdef scr_seq_T20_008
	scrdef scr_seq_T20_009
	scrdef scr_seq_T20_010
	scrdef scr_seq_T20_011
	scrdef scr_seq_T20_012
	scrdef scr_seq_T20_013
	scrdef scr_seq_T20_014
	scrdef scr_seq_T20_015
	scrdef scr_seq_T20_016
	scrdef scr_seq_T20_017
	scrdef_end

scr_seq_T20_006:
	get_friend_sprite VAR_OBJ_0
	goto_if_unset FLAG_UNK_189, _005F
	clearflag FLAG_UNK_189
	end

_005F:
	setvar VAR_TEMP_x4007, 0
	check_badge BADGE_PLAIN, VAR_TEMP_x4002
	compare VAR_TEMP_x4002, 0
	goto_if_eq _0089
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 2
	goto_if_eq _008F
_0089:
	setflag FLAG_HIDE_CAMERON
	end

_008F:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_T20_009:
	compare VAR_SCENE_NEW_BARK_TOWN_OW, 1
	goto_if_eq _00A4
	end

_00A4:
	clearflag FLAG_HIDE_NEW_BARK_FRIEND
	show_person obj_T20_var_1
	clearflag FLAG_HIDE_NEW_BARK_MARILL
	show_person obj_T20_tsure_poke_static_marill
	move_person_facing obj_T20_var_1, 686, 0, 396, DIR_WEST
	move_person_facing obj_T20_tsure_poke_static_marill, 685, 0, 396, DIR_SOUTH
	end

scr_seq_T20_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0542_T20_00013
	closemsg
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _00F8
	apply_movement obj_T20_gsrivel, _024C
	goto _0128

_00F8:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0113
	apply_movement obj_T20_gsrivel, _0244
	goto _0128

_0113:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _0128
	apply_movement obj_T20_gsrivel, _0254
_0128:
	wait_movement
	npc_msg msg_0542_T20_00014
	closemsg
	goto_if_unset FLAG_GOT_STARTER, _0166
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0153
	goto _01BA

_014D:
	goto _0166

_0153:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _0166
	goto _0192

_0166:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _017F
	goto _0202

_0179:
	goto _0192

_017F:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _0192
	goto _01E2

_0192:
	apply_movement obj_T20_gsrivel, _0264
	apply_movement obj_partner_poke, _0224
	apply_movement obj_player, _0288
	wait_movement
	apply_movement obj_T20_gsrivel, _0274
	wait_movement
	releaseall
	end

_01BA:
	apply_movement obj_T20_gsrivel, _02A0
	apply_movement obj_partner_poke, _0234
	apply_movement obj_player, _02B8
	wait_movement
	apply_movement obj_T20_gsrivel, _0274
	wait_movement
	releaseall
	end

_01E2:
	apply_movement obj_T20_gsrivel, _0264
	apply_movement obj_player, _0288
	wait_movement
	apply_movement obj_T20_gsrivel, _0274
	wait_movement
	releaseall
	end

_0202:
	apply_movement obj_T20_gsrivel, _02A0
	apply_movement obj_player, _02B8
	wait_movement
	apply_movement obj_T20_gsrivel, _0274
	wait_movement
	releaseall
	end

	.balign 4, 0
_0224:
	LockDir
	WalkSlightlyFastSouth 4
	UnlockDir
	EndMovement

	.balign 4, 0
_0234:
	LockDir
	WalkSlightlyFastSouth 6
	UnlockDir
	EndMovement

	.balign 4, 0
_0244:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_024C:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0254:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_025C:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0264:
	WalkSlightlyFastWest
	FaceSouth
	WalkSlightlyFastSouth 2
	EndMovement

	.balign 4, 0
_0274:
	FaceNorth
	WalkNormalNorth 2
	FaceEast
	WalkNormalEast
	EndMovement

	.balign 4, 0
_0288:
	FaceNorth
	LockDir
	WalkSlightlyFastSouth 2
	JumpFarSouth
	UnlockDir
	EndMovement

	.balign 4, 0
_02A0:
	WalkSlightlyFastNorth
	FaceWest
	WalkSlightlyFastWest
	FaceSouth
	WalkSlightlyFastSouth 3
	EndMovement

	.balign 4, 0
_02B8:
	FaceEast
	LockDir
	WalkSlightlyFastWest
	UnlockDir
	FaceNorth
	LockDir
	WalkSlightlyFastSouth 3
	JumpFarSouth
	UnlockDir
	EndMovement

scr_seq_T20_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_SCENE_NEW_BARK_TOWN_OW, 0
	goto_if_ne _02FE
	npc_msg msg_0542_T20_00009
	goto _0347

_02FE:
	compare VAR_SCENE_NEW_BARK_TOWN_OW, 1
	goto_if_ne _0314
	npc_msg msg_0542_T20_00005
	goto _0347

_0314:
	compare VAR_SCENE_NEW_BARK_TOWN_OW, 2
	goto_if_ne _032A
	npc_msg msg_0542_T20_00005
	goto _0347

_032A:
	compare VAR_SCENE_NEW_BARK_WEST_EXIT, 1
	goto_if_ne _0340
	npc_msg msg_0542_T20_00000
	goto _0347

_0340:
	buffer_players_name 0
	gender_msgbox msg_0542_T20_00006, msg_0542_T20_00007
_0347:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T20_002:
	scrcmd_609
	lockall
	goto_if_set FLAG_GOT_POKEGEAR, _075A
	apply_movement obj_T20_gswoman1, _09B8
	wait_movement
	buffer_players_name 0
	gender_msgbox msg_0542_T20_00001, msg_0542_T20_00002
	wait 20, VAR_SPECIAL_RESULT
	closemsg
	apply_movement obj_player, _09D4
	wait_movement
	compare VAR_SCENE_NEW_BARK_TOWN_OW, 2
	goto_if_eq _054E
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 396
	goto_if_ne _03AF
	apply_movement obj_T20_gswoman1, _0A1C
	goto _044B

_03AF:
	compare VAR_TEMP_x4001, 397
	goto_if_ne _03CA
	apply_movement obj_T20_gswoman1, _0A2C
	goto _044B

_03CA:
	compare VAR_TEMP_x4001, 398
	goto_if_ne _03E5
	apply_movement obj_T20_gswoman1, _0A3C
	goto _044B

_03E5:
	compare VAR_TEMP_x4001, 399
	goto_if_ne _0400
	apply_movement obj_T20_gswoman1, _0A4C
	goto _044B

_0400:
	compare VAR_TEMP_x4001, 400
	goto_if_ne _041B
	apply_movement obj_T20_gswoman1, _0A54
	goto _044B

_041B:
	compare VAR_TEMP_x4001, 401
	goto_if_ne _0436
	apply_movement obj_T20_gswoman1, _0A64
	goto _044B

_0436:
	compare VAR_TEMP_x4001, 402
	goto_if_ne _044B
	apply_movement obj_T20_gswoman1, _0A74
_044B:
	wait_movement
	npc_msg msg_0542_T20_00003
	closemsg
	compare VAR_TEMP_x4001, 396
	goto_if_ne _0475
	apply_movement obj_T20_gswoman1, _0AEC
	apply_movement obj_player, _0BD4
	goto _0541

_0475:
	compare VAR_TEMP_x4001, 397
	goto_if_ne _0498
	apply_movement obj_T20_gswoman1, _0B00
	apply_movement obj_player, _0BE4
	goto _0541

_0498:
	compare VAR_TEMP_x4001, 398
	goto_if_ne _04BB
	apply_movement obj_T20_gswoman1, _0B14
	apply_movement obj_player, _0BF4
	goto _0541

_04BB:
	compare VAR_TEMP_x4001, 399
	goto_if_ne _04DE
	apply_movement obj_T20_gswoman1, _0B28
	apply_movement obj_player, _0C04
	goto _0541

_04DE:
	compare VAR_TEMP_x4001, 400
	goto_if_ne _0501
	apply_movement obj_T20_gswoman1, _0B34
	apply_movement obj_player, _0C0C
	goto _0541

_0501:
	compare VAR_TEMP_x4001, 401
	goto_if_ne _0524
	apply_movement obj_T20_gswoman1, _0B48
	apply_movement obj_player, _0C1C
	goto _0541

_0524:
	compare VAR_TEMP_x4001, 402
	goto_if_ne _0541
	apply_movement obj_T20_gswoman1, _0B58
	apply_movement obj_player, _0C2C
_0541:
	wait_movement
	npc_msg msg_0542_T20_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_054E:
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 396
	goto_if_ne _0577
	apply_movement obj_player, _09E8
	apply_movement obj_T20_gswoman1, _0A84
	goto _0643

_0577:
	compare VAR_TEMP_x4001, 397
	goto_if_ne _059A
	apply_movement obj_player, _09E8
	apply_movement obj_T20_gswoman1, _0A90
	goto _0643

_059A:
	compare VAR_TEMP_x4001, 398
	goto_if_ne _05BD
	apply_movement obj_player, _09E8
	apply_movement obj_T20_gswoman1, _0A9C
	goto _0643

_05BD:
	compare VAR_TEMP_x4001, 399
	goto_if_ne _05E0
	apply_movement obj_player, _09DC
	apply_movement obj_T20_gswoman1, _0AA8
	goto _0643

_05E0:
	compare VAR_TEMP_x4001, 400
	goto_if_ne _0603
	apply_movement obj_player, _09DC
	apply_movement obj_T20_gswoman1, _0ABC
	goto _0643

_0603:
	compare VAR_TEMP_x4001, 401
	goto_if_ne _0626
	apply_movement obj_player, _09DC
	apply_movement obj_T20_gswoman1, _0AC8
	goto _0643

_0626:
	compare VAR_TEMP_x4001, 402
	goto_if_ne _0643
	apply_movement obj_player, _09DC
	apply_movement obj_T20_gswoman1, _0AD4
_0643:
	wait_movement
	npc_msg msg_0542_T20_00010
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	compare VAR_TEMP_x4001, 396
	goto_if_ne _0677
	apply_movement obj_T20_gswoman1, _0B68
	apply_movement obj_player, _0C3C
	goto _0743

_0677:
	compare VAR_TEMP_x4001, 397
	goto_if_ne _069A
	apply_movement obj_T20_gswoman1, _0B78
	apply_movement obj_player, _0C48
	goto _0743

_069A:
	compare VAR_TEMP_x4001, 398
	goto_if_ne _06BD
	apply_movement obj_T20_gswoman1, _0B88
	apply_movement obj_player, _0C54
	goto _0743

_06BD:
	compare VAR_TEMP_x4001, 399
	goto_if_ne _06E0
	apply_movement obj_T20_gswoman1, _0B94
	apply_movement obj_player, _0C60
	goto _0743

_06E0:
	compare VAR_TEMP_x4001, 400
	goto_if_ne _0703
	apply_movement obj_T20_gswoman1, _0BA8
	apply_movement obj_player, _0C74
	goto _0743

_0703:
	compare VAR_TEMP_x4001, 401
	goto_if_ne _0726
	apply_movement obj_T20_gswoman1, _0BB4
	apply_movement obj_player, _0C80
	goto _0743

_0726:
	compare VAR_TEMP_x4001, 402
	goto_if_ne _0743
	apply_movement obj_T20_gswoman1, _0BC4
	apply_movement obj_player, _0C8C
_0743:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	npc_msg msg_0542_T20_00011
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_075A:
	scrcmd_307 21, 12, 12, 9, 77
	scrcmd_310 77
	scrcmd_308 77
	show_person obj_T20_doctor
	move_person_facing obj_T20_doctor, 684, 0, 393, DIR_SOUTH
	apply_movement obj_T20_doctor, _0D08
	wait_movement
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	npc_msg msg_0542_T20_00017
	closemsg
	apply_movement obj_player, _09C8
	wait_movement
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 396
	goto_if_ne _07C6
	apply_movement obj_T20_doctor, _0C98
	apply_movement obj_player, _09FC
	goto _0892

_07C6:
	compare VAR_TEMP_x4001, 397
	goto_if_ne _07E9
	apply_movement obj_T20_doctor, _0CA8
	apply_movement obj_player, _0A0C
	goto _0892

_07E9:
	compare VAR_TEMP_x4001, 398
	goto_if_ne _080C
	apply_movement obj_T20_doctor, _0CB8
	apply_movement obj_player, _0A0C
	goto _0892

_080C:
	compare VAR_TEMP_x4001, 399
	goto_if_ne _082F
	apply_movement obj_T20_doctor, _0CC8
	apply_movement obj_player, _0A0C
	goto _0892

_082F:
	compare VAR_TEMP_x4001, 400
	goto_if_ne _0852
	apply_movement obj_T20_doctor, _0CD8
	apply_movement obj_player, _0A0C
	goto _0892

_0852:
	compare VAR_TEMP_x4001, 401
	goto_if_ne _0875
	apply_movement obj_T20_doctor, _0CE8
	apply_movement obj_player, _09F4
	goto _0892

_0875:
	compare VAR_TEMP_x4001, 402
	goto_if_ne _0892
	apply_movement obj_T20_doctor, _0CF8
	apply_movement obj_player, _09F4
_0892:
	wait_movement
	npc_msg msg_0542_T20_00018
	register_gear_number PHONE_CONTACT_PROF__ELM
	buffer_players_name 0
	npc_msg msg_0542_T20_00019
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	npc_msg msg_0542_T20_00020
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 396
	goto_if_ne _08D5
	apply_movement obj_player, _09D4
	apply_movement obj_T20_doctor, _0D18
	goto _0981

_08D5:
	compare VAR_TEMP_x4001, 397
	goto_if_ne _08F8
	apply_movement obj_player, _09D4
	apply_movement obj_T20_doctor, _0D24
	goto _0981

_08F8:
	compare VAR_TEMP_x4001, 398
	goto_if_ne _091B
	apply_movement obj_player, _09F4
	apply_movement obj_T20_doctor, _0D30
	goto _0981

_091B:
	compare VAR_TEMP_x4001, 399
	goto_if_ne _0936
	apply_movement obj_T20_doctor, _0D40
	goto _0981

_0936:
	compare VAR_TEMP_x4001, 400
	goto_if_ne _0951
	apply_movement obj_T20_doctor, _0D50
	goto _0981

_0951:
	compare VAR_TEMP_x4001, 401
	goto_if_ne _096C
	apply_movement obj_T20_doctor, _0D60
	goto _0981

_096C:
	compare VAR_TEMP_x4001, 402
	goto_if_ne _0981
	apply_movement obj_T20_doctor, _0D70
_0981:
	wait_movement
	scrcmd_307 21, 12, 12, 9, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement obj_T20_doctor, _0D10
	wait_movement
	hide_person obj_T20_doctor
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	setvar VAR_SCENE_NEW_BARK_WEST_EXIT, 1
	releaseall
	end

	.balign 4, 0
_09B8:
	WalkOnSpotNormalWest
	EmoteExclamationMark
	Delay8
	EndMovement

	.balign 4, 0
_09C8:
	EmoteExclamationMark
	Delay8
	EndMovement

	.balign 4, 0
_09D4:
	FaceEast
	EndMovement

	.balign 4, 0
_09DC:
	Delay32 2
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_09E8:
	Delay32 2
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_09F4:
	FaceNorth
	EndMovement

	.balign 4, 0
_09FC:
	FaceEast
	Delay32 2
	FaceSouth
	EndMovement

	.balign 4, 0
_0A0C:
	FaceEast
	Delay32 2
	FaceNorth
	EndMovement

	.balign 4, 0
_0A1C:
	WalkNormalWest 3
	WalkNormalNorth 3
	WalkNormalWest 3
	EndMovement

	.balign 4, 0
_0A2C:
	WalkNormalWest 3
	WalkNormalNorth 2
	WalkNormalWest 3
	EndMovement

	.balign 4, 0
_0A3C:
	WalkNormalWest 3
	WalkNormalNorth
	WalkNormalWest 3
	EndMovement

	.balign 4, 0
_0A4C:
	WalkNormalWest 6
	EndMovement

	.balign 4, 0
_0A54:
	WalkNormalWest 3
	WalkNormalSouth
	WalkNormalWest 3
	EndMovement

	.balign 4, 0
_0A64:
	WalkNormalWest 6
	WalkNormalSouth 2
	FaceWest
	EndMovement

	.balign 4, 0
_0A74:
	WalkNormalWest 6
	WalkNormalSouth 3
	FaceWest
	EndMovement

	.balign 4, 0
_0A84:
	WalkNormalWest 7
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_0A90:
	WalkNormalWest 7
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0A9C:
	WalkNormalWest 7
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0AA8:
	WalkNormalWest 3
	WalkNormalNorth
	WalkNormalWest 4
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0ABC:
	WalkNormalWest 7
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0AC8:
	WalkNormalWest 7
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_0AD4:
	WalkNormalWest 7
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_0AE0:
	WalkNormalEast 6
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0AEC:
	WalkNormalEast 3
	WalkNormalSouth 3
	WalkNormalEast 3
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0B00:
	WalkNormalEast 3
	WalkNormalSouth 2
	WalkNormalEast 3
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0B14:
	WalkNormalEast 3
	WalkNormalSouth
	WalkNormalEast 3
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0B28:
	WalkNormalEast 6
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0B34:
	WalkNormalEast 3
	WalkNormalNorth
	WalkNormalEast 3
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0B48:
	WalkNormalNorth 2
	WalkNormalEast 6
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0B58:
	WalkNormalNorth 3
	WalkNormalEast 6
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0B68:
	WalkNormalSouth 2
	WalkNormalEast 7
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0B78:
	WalkNormalSouth
	WalkNormalEast 7
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0B88:
	WalkNormalEast 7
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0B94:
	WalkNormalEast 3
	WalkNormalSouth
	WalkNormalEast 4
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0BA8:
	WalkNormalEast 7
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0BB4:
	WalkNormalNorth
	WalkNormalEast 7
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0BC4:
	WalkNormalNorth 2
	WalkNormalEast 7
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0BD4:
	WalkNormalEast 4
	WalkNormalSouth 3
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_0BE4:
	WalkNormalEast 4
	WalkNormalSouth 2
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_0BF4:
	WalkNormalEast 4
	WalkNormalSouth
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_0C04:
	WalkNormalEast 6
	EndMovement

	.balign 4, 0
_0C0C:
	WalkNormalEast 4
	WalkNormalNorth
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_0C1C:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalEast 5
	EndMovement

	.balign 4, 0
_0C2C:
	WalkNormalEast
	WalkNormalNorth 3
	WalkNormalEast 5
	EndMovement

	.balign 4, 0
_0C3C:
	WalkNormalSouth 3
	WalkNormalEast 6
	EndMovement

	.balign 4, 0
_0C48:
	WalkNormalSouth 2
	WalkNormalEast 6
	EndMovement

	.balign 4, 0
_0C54:
	WalkNormalSouth
	WalkNormalEast 6
	EndMovement

	.balign 4, 0
_0C60:
	WalkNormalNorth
	WalkNormalEast 3
	WalkNormalSouth
	WalkNormalEast 3
	EndMovement

	.balign 4, 0
_0C74:
	WalkNormalNorth
	WalkNormalEast 6
	EndMovement

	.balign 4, 0
_0C80:
	WalkNormalNorth 2
	WalkNormalEast 6
	EndMovement

	.balign 4, 0
_0C8C:
	WalkNormalNorth 3
	WalkNormalEast 6
	EndMovement

	.balign 4, 0
_0C98:
	WalkNormalSouth 3
	WalkNormalWest 8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0CA8:
	WalkNormalSouth 2
	WalkNormalWest 8
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0CB8:
	WalkNormalSouth 2
	WalkNormalWest 8
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_0CC8:
	WalkNormalSouth 2
	WalkNormalWest 8
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_0CD8:
	WalkNormalSouth 2
	WalkNormalWest 8
	WalkNormalSouth 3
	EndMovement

	.balign 4, 0
_0CE8:
	WalkNormalSouth 2
	WalkNormalWest 8
	WalkNormalSouth 4
	EndMovement

	.balign 4, 0
_0CF8:
	WalkNormalSouth 2
	WalkNormalWest 8
	WalkNormalSouth 5
	EndMovement

	.balign 4, 0
_0D08:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_0D10:
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0D18:
	WalkNormalEast 8
	WalkNormalNorth 3
	EndMovement

	.balign 4, 0
_0D24:
	WalkNormalEast 8
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_0D30:
	WalkNormalNorth
	WalkNormalEast 8
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_0D40:
	WalkNormalNorth 2
	WalkNormalEast 8
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_0D50:
	WalkNormalNorth 2
	WalkNormalEast 8
	WalkNormalNorth 3
	EndMovement

	.balign 4, 0
_0D60:
	WalkNormalNorth 2
	WalkNormalEast 8
	WalkNormalNorth 4
	EndMovement

	.balign 4, 0
_0D70:
	WalkNormalNorth 5
	WalkNormalEast 8
	WalkNormalNorth 2
	EndMovement

scr_seq_T20_003:
	scrcmd_609
	lockall
	release obj_T20_tsure_poke_static_marill
	apply_movement obj_T20_tsure_poke_static_marill, _0E08
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	clearflag FLAG_HIDE_NEW_BARK_FRIEND
	show_person obj_T20_var_1
	wait_se SEQ_SE_DP_KAIDAN2
	callstd std_play_friend_music
	apply_movement obj_T20_var_1, _0EA4
	wait_movement
	apply_movement obj_T20_tsure_poke_static_marill, _0E38
	wait_movement
	apply_movement obj_player, _0E9C
	apply_movement obj_T20_var_1, _0EB8
	wait_movement
	apply_movement obj_T20_tsure_poke_static_marill, _0E60
	wait_movement
	apply_movement obj_T20_var_1, _0EC0
	apply_movement obj_T20_tsure_poke_static_marill, _0E68
	wait_movement
	callstd std_fade_end_friend_music
	setvar VAR_SCENE_PLAYERS_HOUSE_1F, 2
	hide_person obj_T20_tsure_poke_static_marill
	hide_person obj_T20_var_1
	setflag FLAG_HIDE_NEW_BARK_MARILL
	setflag FLAG_HIDE_NEW_BARK_FRIEND
	releaseall
	end

	.balign 4, 0
_0E08:
	Delay32
	WalkFastNorth 8
	LockDir
	JumpNearFastSouth
	UnlockDir
	FaceEast 5
	FaceNorth 5
	FaceWest 5
	FaceNorth 5
	WalkNormalNorth
	Delay32
	EndMovement

	.balign 4, 0
_0E38:
	FaceWest
	EmoteExclamationMark
	WalkOnSpotFastNorth 4
	FaceSouth 2
	FaceEast 2
	FaceNorth 2
	FaceWest 2
	WalkOnSpotFastWest 4
	WalkFastWest 6
	EndMovement

	.balign 4, 0
_0E60:
	JumpOnSpotFastWest 4
	EndMovement

	.balign 4, 0
_0E68:
	FaceWest
	WalkNormalWest
	FaceSouth
	WalkNormalSouth 4
	FaceWest
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_0E84:
	FaceSouth 2
	EmoteExclamationMark
	WalkNormalSouth
	FaceWest
	WalkNormalWest 6
	EndMovement

	.balign 4, 0
_0E9C:
	FaceWest 4
	EndMovement

	.balign 4, 0
_0EA4:
	Delay16
	WalkNormalSouth 6
	FaceEast
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0EB8:
	WalkOnSpotFastEast 4
	EndMovement

	.balign 4, 0
_0EC0:
	FaceSouth
	WalkNormalSouth 4
	FaceWest
	WalkNormalWest 2
	EndMovement

scr_seq_T20_007:
	buffer_players_name 0
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0542_T20_00035, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T20_008:
	scrcmd_609
	lockall
	callstd std_play_friend_music
	apply_movement obj_T20_var_1, _0F84
	apply_movement obj_T20_tsure_poke_static_marill, _0FBC
	wait_movement
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_player, _0FE8
	apply_movement obj_T20_var_1, _0FF4
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	buffer_players_name 0
	buffer_party_mon_species_name_indef 1, 0
	gender_msgbox msg_0542_T20_00015, msg_0542_T20_00016
	closemsg
	apply_movement obj_T20_var_1, _1000
	apply_movement obj_T20_tsure_poke_static_marill, _1014
	apply_movement obj_player, _1038
	wait_movement
	apply_movement obj_T20_var_1, _1044
	apply_movement obj_T20_tsure_poke_static_marill, _104C
	wait_movement
	hide_person obj_T20_tsure_poke_static_marill
	hide_person obj_T20_var_1
	setflag FLAG_HIDE_NEW_BARK_MARILL
	setflag FLAG_HIDE_NEW_BARK_FRIEND
	callstd std_fade_end_friend_music
	setvar VAR_SCENE_NEW_BARK_TOWN_OW, 2
	releaseall
	end

	.balign 4, 0
_0F84:
	Delay4 4
	Delay4 2
	WalkOnSpotFastSouth
	Delay4 2
	WalkOnSpotFastEast
	Delay4
	WalkOnSpotFastNorth
	Delay4
	WalkOnSpotFastSouth
	Delay4
	WalkOnSpotFastNorth
	Delay4
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0FBC:
	JumpOnSpotFastEast 3
	WalkFastSouth
	WalkFastEast 2
	WalkFastNorth 2
	WalkFastWest 2
	WalkFastSouth 2
	WalkFastNorth 2
	WalkFastEast 2
	WalkFastSouth
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0FE8:
	WalkNormalSouth 2
	WalkNormalEast
	EndMovement

	.balign 4, 0
_0FF4:
	Delay8
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_1000:
	WalkNormalSouth
	WalkNormalWest 2
	WalkNormalSouth 5
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_1014:
	WalkNormalWest
	WalkNormalSouth
	WalkNormalWest 2
	WalkOnSpotNormalNorth
	Delay8 3
	WalkOnSpotNormalSouth
	WalkFastSouth 4
	JumpOnSpotFastSouth 2
	EndMovement

	.balign 4, 0
_1038:
	Delay8 2
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_1044:
	WalkNormalSouth 3
	EndMovement

	.balign 4, 0
_104C:
	WalkNormalSouth 4
	EndMovement

scr_seq_T20_010:
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _1078
	scrcmd_596 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _1078
	scrcmd_600
_1078:
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_NEW_BARK_ELMS_LAB_2F, 0, 12, 6, DIR_WEST
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_582 MAP_NEW_BARK, 688, 393
	setvar VAR_UNK_407C, 1
	end

	.balign 4, 0
_10B4:
	WalkNormalSouth
	EndMovement

scr_seq_T20_016:
	buffer_friends_name 0
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0542_T20_00035, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T20_017:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _11FC
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _1224
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _114D
	apply_movement obj_player, _1238
	apply_movement obj_T20_gsmiddleman1, _1284
	goto _119B

_114D:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _1168
	apply_movement obj_player, _1250
	goto _119B

_1168:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _118B
	apply_movement obj_player, _1270
	apply_movement obj_T20_gsmiddleman1, _1284
	goto _119B

_118B:
	apply_movement obj_player, _125C
	apply_movement obj_T20_gsmiddleman1, _1284
_119B:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _11C2
	apply_movement obj_partner_poke, _1290
	wait_movement
_11C2:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 0
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

_11FC:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_1210:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 4
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_1224:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end

	.balign 4, 0
_1238:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_1250:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_125C:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_1270:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_1284:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_1290:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_T20_011:
	scrcmd_609
	lockall
	compare VAR_TEMP_x4007, 2
	goto_if_eq _144F
	scrcmd_307 21, 12, 23, 12, 77
	scrcmd_310 77
	scrcmd_308 77
	play_se SEQ_SE_DP_KAIDAN2
	clearflag FLAG_HIDE_NEW_BARK_MOM
	show_person obj_T20_gsmama
	wait_se SEQ_SE_DP_KAIDAN2
	apply_movement obj_T20_gsmama, _1478
	wait_movement
	compare VAR_TEMP_x4007, 0
	goto_if_ne _12F1
	buffer_players_name 0
	npc_msg msg_0542_T20_00021
	closemsg
_12F1:
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	compare VAR_SPECIAL_x8005, 398
	goto_if_ne _132D
	apply_movement obj_T20_gsmama, _1480
	apply_movement obj_player, _14A4
	goto _13A6

_132D:
	compare VAR_SPECIAL_x8005, 399
	goto_if_ne _1350
	apply_movement obj_T20_gsmama, _148C
	apply_movement obj_player, _14B0
	goto _13A6

_1350:
	compare VAR_SPECIAL_x8005, 400
	goto_if_ne _1373
	apply_movement obj_T20_gsmama, _1498
	apply_movement obj_player, _14BC
	goto _13A6

_1373:
	compare VAR_SPECIAL_x8005, 401
	goto_if_ne _1396
	apply_movement obj_T20_gsmama, _1498
	apply_movement obj_player, _14C8
	goto _13A6

_1396:
	apply_movement obj_T20_gsmama, _1498
	apply_movement obj_player, _14D8
_13A6:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	compare VAR_TEMP_x4007, 0
	goto_if_ne _13C8
	npc_msg msg_0542_T20_00022
	goto _13CB

_13C8:
	npc_msg msg_0542_T20_00023
_13CB:
	closemsg
	compare VAR_SPECIAL_x8005, 398
	goto_if_ne _13EA
	apply_movement obj_T20_gsmama, _14E8
	wait_movement
	goto _1411

_13EA:
	compare VAR_SPECIAL_x8005, 399
	goto_if_ne _1407
	apply_movement obj_T20_gsmama, _14F0
	wait_movement
	goto _1411

_1407:
	apply_movement obj_T20_gsmama, _14F8
	wait_movement
_1411:
	scrcmd_307 21, 12, 23, 12, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement obj_T20_gsmama, _1500
	wait_movement
	setflag FLAG_HIDE_NEW_BARK_MOM
	play_se SEQ_SE_DP_KAIDAN2
	hide_person obj_T20_gsmama
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	addvar VAR_TEMP_x4007, 1
	releaseall
	end

_144F:
	npc_msg msg_0542_T20_00024
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_player, _1508
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	releaseall
	end

	.balign 4, 0
_1478:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_1480:
	WalkNormalSouth
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_148C:
	WalkNormalSouth 2
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_1498:
	WalkNormalSouth 3
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_14A4:
	WalkOnSpotNormalWest
	WalkNormalWest 4
	EndMovement

	.balign 4, 0
_14B0:
	WalkOnSpotNormalWest
	WalkNormalWest 4
	EndMovement

	.balign 4, 0
_14BC:
	WalkOnSpotNormalWest
	WalkNormalWest 4
	EndMovement

	.balign 4, 0
_14C8:
	WalkNormalWest 2
	WalkNormalNorth
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_14D8:
	WalkNormalWest 2
	WalkNormalNorth 2
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_14E8:
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_14F0:
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_14F8:
	WalkNormalNorth 3
	EndMovement

	.balign 4, 0
_1500:
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_1508:
	WalkNormalWest
	EndMovement

scr_seq_T20_012:
	scrcmd_609
	lockall
	apply_movement obj_T20_var_1_2, _1644
	wait_movement
	buffer_players_name 0
	gender_msgbox msg_0542_T20_00027, msg_0542_T20_00028
	closemsg
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	compare VAR_SPECIAL_x8005, 398
	goto_if_ne _1552
	apply_movement obj_T20_var_1_2, _1650
	goto _15AB

_1552:
	compare VAR_SPECIAL_x8005, 399
	goto_if_ne _156D
	apply_movement obj_T20_var_1_2, _1658
	goto _15AB

_156D:
	compare VAR_SPECIAL_x8005, 399
	goto_if_ne _1588
	apply_movement obj_T20_var_1_2, _1660
	goto _15AB

_1588:
	compare VAR_SPECIAL_x8005, 399
	goto_if_ne _15A3
	apply_movement obj_T20_var_1_2, _1668
	goto _15AB

_15A3:
	apply_movement obj_T20_var_1_2, _1670
_15AB:
	apply_movement obj_player, _1678
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	buffer_players_name 0
	gender_msgbox msg_0542_T20_00029, msg_0542_T20_00030
	closemsg
	compare VAR_SPECIAL_x8005, 398
	goto_if_ne _15E3
	apply_movement obj_T20_var_1_2, _1680
	goto _163C

_15E3:
	compare VAR_SPECIAL_x8005, 399
	goto_if_ne _15FE
	apply_movement obj_T20_var_1_2, _1688
	goto _163C

_15FE:
	compare VAR_SPECIAL_x8005, 399
	goto_if_ne _1619
	apply_movement obj_T20_var_1_2, _1690
	goto _163C

_1619:
	compare VAR_SPECIAL_x8005, 399
	goto_if_ne _1634
	apply_movement obj_T20_var_1_2, _1698
	goto _163C

_1634:
	apply_movement obj_T20_var_1_2, _16A0
_163C:
	wait_movement
	releaseall
	end

	.balign 4, 0
_1644:
	FaceEast
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_1650:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_1658:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_1660:
	WalkNormalEast
	EndMovement

	.balign 4, 0
_1668:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_1670:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_1678:
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_1680:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_1688:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_1690:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_1698:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_16A0:
	WalkOnSpotNormalWest
	EndMovement

scr_seq_T20_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	gender_msgbox msg_0542_T20_00025, msg_0542_T20_00026
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T20_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_MARILL, 0
	npc_msg msg_0542_T20_00033
	wait_cry
	closemsg
	apply_movement obj_T20_tsure_poke_static_marill_2, _16F4
	wait_movement
	apply_movement obj_T20_var_1_2, _1700
	wait_movement
	gender_msgbox msg_0542_T20_00031, msg_0542_T20_00032
	wait_button_or_walk_away
	closemsg
	releaseall
	end

	.balign 4, 0
_16F4:
	JumpOnSpotSlowEast
	JumpOnSpotSlowEast
	EndMovement

	.balign 4, 0
_1700:
	WalkOnSpotNormalWest
	EndMovement

scr_seq_T20_013:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0542_T20_00036, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T20_014:
	direction_signpost msg_0542_T20_00034, 0, 11, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T20_015:
	buffer_players_name 0
	simple_npc_msg msg_0542_T20_00012
	end
	.balign 4, 0
