#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T20.h"
#include "msgdata/msg/msg_0542_T20.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T20_000
	ScrDef scr_seq_T20_001
	ScrDef scr_seq_T20_002
	ScrDef scr_seq_T20_003
	ScrDef scr_seq_T20_004
	ScrDef scr_seq_T20_005
	ScrDef scr_seq_T20_006
	ScrDef scr_seq_T20_007
	ScrDef scr_seq_T20_008
	ScrDef scr_seq_T20_009
	ScrDef scr_seq_T20_010
	ScrDef scr_seq_T20_011
	ScrDef scr_seq_T20_012
	ScrDef scr_seq_T20_013
	ScrDef scr_seq_T20_014
	ScrDef scr_seq_T20_015
	ScrDef scr_seq_T20_016
	ScrDef scr_seq_T20_017
	ScrDefEnd

scr_seq_T20_006:
	GetFriendSprite VAR_OBJ_0
	GoToIfUnset FLAG_UNK_189, _005F
	ClearFlag FLAG_UNK_189
	End

_005F:
	SetVar VAR_TEMP_x4007, 0
	CheckBadge BADGE_PLAIN, VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 0
	GoToIfEq _0089
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 2
	GoToIfEq _008F
_0089:
	SetFlag FLAG_HIDE_CAMERON
	End

_008F:
	ClearFlag FLAG_HIDE_CAMERON
	End

scr_seq_T20_009:
	Compare VAR_SCENE_NEW_BARK_TOWN_OW, 1
	GoToIfEq _00A4
	End

_00A4:
	ClearFlag FLAG_HIDE_NEW_BARK_FRIEND
	ShowPerson obj_T20_var_1
	ClearFlag FLAG_HIDE_NEW_BARK_MARILL
	ShowPerson obj_T20_tsure_poke_static_marill
	MovePersonFacing obj_T20_var_1, 686, 0, 396, DIR_WEST
	MovePersonFacing obj_T20_tsure_poke_static_marill, 685, 0, 396, DIR_SOUTH
	End

scr_seq_T20_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0542_T20_00013
	CloseMsg
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _00F8
	ApplyMovement obj_T20_gsrivel, _024C
	GoTo _0128

_00F8:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0113
	ApplyMovement obj_T20_gsrivel, _0244
	GoTo _0128

_0113:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _0128
	ApplyMovement obj_T20_gsrivel, _0254
_0128:
	WaitMovement
	NPCMsg msg_0542_T20_00014
	CloseMsg
	GoToIfUnset FLAG_GOT_STARTER, _0166
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0153
	GoTo _01BA

_014D:
	GoTo _0166

_0153:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _0166
	GoTo _0192

_0166:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _017F
	GoTo _0202

_0179:
	GoTo _0192

_017F:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _0192
	GoTo _01E2

_0192:
	ApplyMovement obj_T20_gsrivel, _0264
	ApplyMovement obj_partner_poke, _0224
	ApplyMovement obj_player, _0288
	WaitMovement
	ApplyMovement obj_T20_gsrivel, _0274
	WaitMovement
	ReleaseAll
	End

_01BA:
	ApplyMovement obj_T20_gsrivel, _02A0
	ApplyMovement obj_partner_poke, _0234
	ApplyMovement obj_player, _02B8
	WaitMovement
	ApplyMovement obj_T20_gsrivel, _0274
	WaitMovement
	ReleaseAll
	End

_01E2:
	ApplyMovement obj_T20_gsrivel, _0264
	ApplyMovement obj_player, _0288
	WaitMovement
	ApplyMovement obj_T20_gsrivel, _0274
	WaitMovement
	ReleaseAll
	End

_0202:
	ApplyMovement obj_T20_gsrivel, _02A0
	ApplyMovement obj_player, _02B8
	WaitMovement
	ApplyMovement obj_T20_gsrivel, _0274
	WaitMovement
	ReleaseAll
	End

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
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_NEW_BARK_TOWN_OW, 0
	GoToIfNe _02FE
	NPCMsg msg_0542_T20_00009
	GoTo _0347

_02FE:
	Compare VAR_SCENE_NEW_BARK_TOWN_OW, 1
	GoToIfNe _0314
	NPCMsg msg_0542_T20_00005
	GoTo _0347

_0314:
	Compare VAR_SCENE_NEW_BARK_TOWN_OW, 2
	GoToIfNe _032A
	NPCMsg msg_0542_T20_00005
	GoTo _0347

_032A:
	Compare VAR_SCENE_NEW_BARK_WEST_EXIT, 1
	GoToIfNe _0340
	NPCMsg msg_0542_T20_00000
	GoTo _0347

_0340:
	BufferPlayersName 0
	GenderMsgBox msg_0542_T20_00006, msg_0542_T20_00007
_0347:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T20_002:
	ScrCmd_609
	LockAll
	GoToIfSet FLAG_GOT_POKEGEAR, _075A
	ApplyMovement obj_T20_gswoman1, _09B8
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0542_T20_00001, msg_0542_T20_00002
	Wait 20, VAR_SPECIAL_RESULT
	CloseMsg
	ApplyMovement obj_player, _09D4
	WaitMovement
	Compare VAR_SCENE_NEW_BARK_TOWN_OW, 2
	GoToIfEq _054E
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 396
	GoToIfNe _03AF
	ApplyMovement obj_T20_gswoman1, _0A1C
	GoTo _044B

_03AF:
	Compare VAR_TEMP_x4001, 397
	GoToIfNe _03CA
	ApplyMovement obj_T20_gswoman1, _0A2C
	GoTo _044B

_03CA:
	Compare VAR_TEMP_x4001, 398
	GoToIfNe _03E5
	ApplyMovement obj_T20_gswoman1, _0A3C
	GoTo _044B

_03E5:
	Compare VAR_TEMP_x4001, 399
	GoToIfNe _0400
	ApplyMovement obj_T20_gswoman1, _0A4C
	GoTo _044B

_0400:
	Compare VAR_TEMP_x4001, 400
	GoToIfNe _041B
	ApplyMovement obj_T20_gswoman1, _0A54
	GoTo _044B

_041B:
	Compare VAR_TEMP_x4001, 401
	GoToIfNe _0436
	ApplyMovement obj_T20_gswoman1, _0A64
	GoTo _044B

_0436:
	Compare VAR_TEMP_x4001, 402
	GoToIfNe _044B
	ApplyMovement obj_T20_gswoman1, _0A74
_044B:
	WaitMovement
	NPCMsg msg_0542_T20_00003
	CloseMsg
	Compare VAR_TEMP_x4001, 396
	GoToIfNe _0475
	ApplyMovement obj_T20_gswoman1, _0AEC
	ApplyMovement obj_player, _0BD4
	GoTo _0541

_0475:
	Compare VAR_TEMP_x4001, 397
	GoToIfNe _0498
	ApplyMovement obj_T20_gswoman1, _0B00
	ApplyMovement obj_player, _0BE4
	GoTo _0541

_0498:
	Compare VAR_TEMP_x4001, 398
	GoToIfNe _04BB
	ApplyMovement obj_T20_gswoman1, _0B14
	ApplyMovement obj_player, _0BF4
	GoTo _0541

_04BB:
	Compare VAR_TEMP_x4001, 399
	GoToIfNe _04DE
	ApplyMovement obj_T20_gswoman1, _0B28
	ApplyMovement obj_player, _0C04
	GoTo _0541

_04DE:
	Compare VAR_TEMP_x4001, 400
	GoToIfNe _0501
	ApplyMovement obj_T20_gswoman1, _0B34
	ApplyMovement obj_player, _0C0C
	GoTo _0541

_0501:
	Compare VAR_TEMP_x4001, 401
	GoToIfNe _0524
	ApplyMovement obj_T20_gswoman1, _0B48
	ApplyMovement obj_player, _0C1C
	GoTo _0541

_0524:
	Compare VAR_TEMP_x4001, 402
	GoToIfNe _0541
	ApplyMovement obj_T20_gswoman1, _0B58
	ApplyMovement obj_player, _0C2C
_0541:
	WaitMovement
	NPCMsg msg_0542_T20_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_054E:
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 396
	GoToIfNe _0577
	ApplyMovement obj_player, _09E8
	ApplyMovement obj_T20_gswoman1, _0A84
	GoTo _0643

_0577:
	Compare VAR_TEMP_x4001, 397
	GoToIfNe _059A
	ApplyMovement obj_player, _09E8
	ApplyMovement obj_T20_gswoman1, _0A90
	GoTo _0643

_059A:
	Compare VAR_TEMP_x4001, 398
	GoToIfNe _05BD
	ApplyMovement obj_player, _09E8
	ApplyMovement obj_T20_gswoman1, _0A9C
	GoTo _0643

_05BD:
	Compare VAR_TEMP_x4001, 399
	GoToIfNe _05E0
	ApplyMovement obj_player, _09DC
	ApplyMovement obj_T20_gswoman1, _0AA8
	GoTo _0643

_05E0:
	Compare VAR_TEMP_x4001, 400
	GoToIfNe _0603
	ApplyMovement obj_player, _09DC
	ApplyMovement obj_T20_gswoman1, _0ABC
	GoTo _0643

_0603:
	Compare VAR_TEMP_x4001, 401
	GoToIfNe _0626
	ApplyMovement obj_player, _09DC
	ApplyMovement obj_T20_gswoman1, _0AC8
	GoTo _0643

_0626:
	Compare VAR_TEMP_x4001, 402
	GoToIfNe _0643
	ApplyMovement obj_player, _09DC
	ApplyMovement obj_T20_gswoman1, _0AD4
_0643:
	WaitMovement
	NPCMsg msg_0542_T20_00010
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	Compare VAR_TEMP_x4001, 396
	GoToIfNe _0677
	ApplyMovement obj_T20_gswoman1, _0B68
	ApplyMovement obj_player, _0C3C
	GoTo _0743

_0677:
	Compare VAR_TEMP_x4001, 397
	GoToIfNe _069A
	ApplyMovement obj_T20_gswoman1, _0B78
	ApplyMovement obj_player, _0C48
	GoTo _0743

_069A:
	Compare VAR_TEMP_x4001, 398
	GoToIfNe _06BD
	ApplyMovement obj_T20_gswoman1, _0B88
	ApplyMovement obj_player, _0C54
	GoTo _0743

_06BD:
	Compare VAR_TEMP_x4001, 399
	GoToIfNe _06E0
	ApplyMovement obj_T20_gswoman1, _0B94
	ApplyMovement obj_player, _0C60
	GoTo _0743

_06E0:
	Compare VAR_TEMP_x4001, 400
	GoToIfNe _0703
	ApplyMovement obj_T20_gswoman1, _0BA8
	ApplyMovement obj_player, _0C74
	GoTo _0743

_0703:
	Compare VAR_TEMP_x4001, 401
	GoToIfNe _0726
	ApplyMovement obj_T20_gswoman1, _0BB4
	ApplyMovement obj_player, _0C80
	GoTo _0743

_0726:
	Compare VAR_TEMP_x4001, 402
	GoToIfNe _0743
	ApplyMovement obj_T20_gswoman1, _0BC4
	ApplyMovement obj_player, _0C8C
_0743:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0542_T20_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

_075A:
	ScrCmd_307 21, 12, 12, 9, 77
	ScrCmd_310 77
	ScrCmd_308 77
	ShowPerson obj_T20_doctor
	MovePersonFacing obj_T20_doctor, 684, 0, 393, DIR_SOUTH
	ApplyMovement obj_T20_doctor, _0D08
	WaitMovement
	ScrCmd_311 77
	ScrCmd_308 77
	ScrCmd_309 77
	NPCMsg msg_0542_T20_00017
	CloseMsg
	ApplyMovement obj_player, _09C8
	WaitMovement
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 396
	GoToIfNe _07C6
	ApplyMovement obj_T20_doctor, _0C98
	ApplyMovement obj_player, _09FC
	GoTo _0892

_07C6:
	Compare VAR_TEMP_x4001, 397
	GoToIfNe _07E9
	ApplyMovement obj_T20_doctor, _0CA8
	ApplyMovement obj_player, _0A0C
	GoTo _0892

_07E9:
	Compare VAR_TEMP_x4001, 398
	GoToIfNe _080C
	ApplyMovement obj_T20_doctor, _0CB8
	ApplyMovement obj_player, _0A0C
	GoTo _0892

_080C:
	Compare VAR_TEMP_x4001, 399
	GoToIfNe _082F
	ApplyMovement obj_T20_doctor, _0CC8
	ApplyMovement obj_player, _0A0C
	GoTo _0892

_082F:
	Compare VAR_TEMP_x4001, 400
	GoToIfNe _0852
	ApplyMovement obj_T20_doctor, _0CD8
	ApplyMovement obj_player, _0A0C
	GoTo _0892

_0852:
	Compare VAR_TEMP_x4001, 401
	GoToIfNe _0875
	ApplyMovement obj_T20_doctor, _0CE8
	ApplyMovement obj_player, _09F4
	GoTo _0892

_0875:
	Compare VAR_TEMP_x4001, 402
	GoToIfNe _0892
	ApplyMovement obj_T20_doctor, _0CF8
	ApplyMovement obj_player, _09F4
_0892:
	WaitMovement
	NPCMsg msg_0542_T20_00018
	RegisterGearNumber PHONE_CONTACT_PROF__ELM
	BufferPlayersName 0
	NPCMsg msg_0542_T20_00019
	PlayFanfare SEQ_ME_POKEGEAR_REGIST
	WaitFanfare
	NPCMsg msg_0542_T20_00020
	CloseMsg
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 396
	GoToIfNe _08D5
	ApplyMovement obj_player, _09D4
	ApplyMovement obj_T20_doctor, _0D18
	GoTo _0981

_08D5:
	Compare VAR_TEMP_x4001, 397
	GoToIfNe _08F8
	ApplyMovement obj_player, _09D4
	ApplyMovement obj_T20_doctor, _0D24
	GoTo _0981

_08F8:
	Compare VAR_TEMP_x4001, 398
	GoToIfNe _091B
	ApplyMovement obj_player, _09F4
	ApplyMovement obj_T20_doctor, _0D30
	GoTo _0981

_091B:
	Compare VAR_TEMP_x4001, 399
	GoToIfNe _0936
	ApplyMovement obj_T20_doctor, _0D40
	GoTo _0981

_0936:
	Compare VAR_TEMP_x4001, 400
	GoToIfNe _0951
	ApplyMovement obj_T20_doctor, _0D50
	GoTo _0981

_0951:
	Compare VAR_TEMP_x4001, 401
	GoToIfNe _096C
	ApplyMovement obj_T20_doctor, _0D60
	GoTo _0981

_096C:
	Compare VAR_TEMP_x4001, 402
	GoToIfNe _0981
	ApplyMovement obj_T20_doctor, _0D70
_0981:
	WaitMovement
	ScrCmd_307 21, 12, 12, 9, 77
	ScrCmd_310 77
	ScrCmd_308 77
	ApplyMovement obj_T20_doctor, _0D10
	WaitMovement
	HidePerson obj_T20_doctor
	ScrCmd_311 77
	ScrCmd_308 77
	ScrCmd_309 77
	SetVar VAR_SCENE_NEW_BARK_WEST_EXIT, 1
	ReleaseAll
	End

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
	ScrCmd_609
	LockAll
	Release obj_T20_tsure_poke_static_marill
	ApplyMovement obj_T20_tsure_poke_static_marill, _0E08
	WaitMovement
	PlaySE SEQ_SE_DP_KAIDAN2
	ClearFlag FLAG_HIDE_NEW_BARK_FRIEND
	ShowPerson obj_T20_var_1
	WaitSE SEQ_SE_DP_KAIDAN2
	CallStd std_play_friend_music
	ApplyMovement obj_T20_var_1, _0EA4
	WaitMovement
	ApplyMovement obj_T20_tsure_poke_static_marill, _0E38
	WaitMovement
	ApplyMovement obj_player, _0E9C
	ApplyMovement obj_T20_var_1, _0EB8
	WaitMovement
	ApplyMovement obj_T20_tsure_poke_static_marill, _0E60
	WaitMovement
	ApplyMovement obj_T20_var_1, _0EC0
	ApplyMovement obj_T20_tsure_poke_static_marill, _0E68
	WaitMovement
	CallStd std_fade_end_friend_music
	SetVar VAR_SCENE_PLAYERS_HOUSE_1F, 2
	HidePerson obj_T20_tsure_poke_static_marill
	HidePerson obj_T20_var_1
	SetFlag FLAG_HIDE_NEW_BARK_MARILL
	SetFlag FLAG_HIDE_NEW_BARK_FRIEND
	ReleaseAll
	End

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
	BufferPlayersName 0
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0542_T20_00035, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T20_008:
	ScrCmd_609
	LockAll
	CallStd std_play_friend_music
	ApplyMovement obj_T20_var_1, _0F84
	ApplyMovement obj_T20_tsure_poke_static_marill, _0FBC
	WaitMovement
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0FE8
	ApplyMovement obj_T20_var_1, _0FF4
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	BufferPlayersName 0
	BufferPartyMonSpeciesNameIndef 1, 0
	GenderMsgBox msg_0542_T20_00015, msg_0542_T20_00016
	CloseMsg
	ApplyMovement obj_T20_var_1, _1000
	ApplyMovement obj_T20_tsure_poke_static_marill, _1014
	ApplyMovement obj_player, _1038
	WaitMovement
	ApplyMovement obj_T20_var_1, _1044
	ApplyMovement obj_T20_tsure_poke_static_marill, _104C
	WaitMovement
	HidePerson obj_T20_tsure_poke_static_marill
	HidePerson obj_T20_var_1
	SetFlag FLAG_HIDE_NEW_BARK_MARILL
	SetFlag FLAG_HIDE_NEW_BARK_FRIEND
	CallStd std_fade_end_friend_music
	SetVar VAR_SCENE_NEW_BARK_TOWN_OW, 2
	ReleaseAll
	End

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
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _1078
	ScrCmd_596 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _1078
	ScrCmd_600
_1078:
	PlaySE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_NEW_BARK_ELMS_LAB_2F, 0, 12, 6, DIR_WEST
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	WaitSE SEQ_SE_DP_KAIDAN2
	ScrCmd_582 MAP_NEW_BARK, 688, 393
	SetVar VAR_UNK_407C, 1
	End

	.balign 4, 0
_10B4:
	WalkNormalSouth
	EndMovement

scr_seq_T20_016:
	BufferFriendsName 0
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0542_T20_00035, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T20_017:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _11FC
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _1224
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _114D
	ApplyMovement obj_player, _1238
	ApplyMovement obj_T20_gsmiddleman1, _1284
	GoTo _119B

_114D:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _1168
	ApplyMovement obj_player, _1250
	GoTo _119B

_1168:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _118B
	ApplyMovement obj_player, _1270
	ApplyMovement obj_T20_gsmiddleman1, _1284
	GoTo _119B

_118B:
	ApplyMovement obj_player, _125C
	ApplyMovement obj_T20_gsmiddleman1, _1284
_119B:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _11C2
	ApplyMovement obj_partner_poke, _1290
	WaitMovement
_11C2:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 0
	LockAll
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ClearFlag FLAG_UNK_189
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 2
	WaitButton
	CloseMsg
	ReleaseAll
	End

_11FC:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1210:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 4
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1224:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

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
	ScrCmd_609
	LockAll
	Compare VAR_TEMP_x4007, 2
	GoToIfEq _144F
	ScrCmd_307 21, 12, 23, 12, 77
	ScrCmd_310 77
	ScrCmd_308 77
	PlaySE SEQ_SE_DP_KAIDAN2
	ClearFlag FLAG_HIDE_NEW_BARK_MOM
	ShowPerson obj_T20_gsmama
	WaitSE SEQ_SE_DP_KAIDAN2
	ApplyMovement obj_T20_gsmama, _1478
	WaitMovement
	Compare VAR_TEMP_x4007, 0
	GoToIfNe _12F1
	BufferPlayersName 0
	NPCMsg msg_0542_T20_00021
	CloseMsg
_12F1:
	ScrCmd_311 77
	ScrCmd_308 77
	ScrCmd_309 77
	GetPlayerCoords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	Compare VAR_SPECIAL_x8005, 398
	GoToIfNe _132D
	ApplyMovement obj_T20_gsmama, _1480
	ApplyMovement obj_player, _14A4
	GoTo _13A6

_132D:
	Compare VAR_SPECIAL_x8005, 399
	GoToIfNe _1350
	ApplyMovement obj_T20_gsmama, _148C
	ApplyMovement obj_player, _14B0
	GoTo _13A6

_1350:
	Compare VAR_SPECIAL_x8005, 400
	GoToIfNe _1373
	ApplyMovement obj_T20_gsmama, _1498
	ApplyMovement obj_player, _14BC
	GoTo _13A6

_1373:
	Compare VAR_SPECIAL_x8005, 401
	GoToIfNe _1396
	ApplyMovement obj_T20_gsmama, _1498
	ApplyMovement obj_player, _14C8
	GoTo _13A6

_1396:
	ApplyMovement obj_T20_gsmama, _1498
	ApplyMovement obj_player, _14D8
_13A6:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	Compare VAR_TEMP_x4007, 0
	GoToIfNe _13C8
	NPCMsg msg_0542_T20_00022
	GoTo _13CB

_13C8:
	NPCMsg msg_0542_T20_00023
_13CB:
	CloseMsg
	Compare VAR_SPECIAL_x8005, 398
	GoToIfNe _13EA
	ApplyMovement obj_T20_gsmama, _14E8
	WaitMovement
	GoTo _1411

_13EA:
	Compare VAR_SPECIAL_x8005, 399
	GoToIfNe _1407
	ApplyMovement obj_T20_gsmama, _14F0
	WaitMovement
	GoTo _1411

_1407:
	ApplyMovement obj_T20_gsmama, _14F8
	WaitMovement
_1411:
	ScrCmd_307 21, 12, 23, 12, 77
	ScrCmd_310 77
	ScrCmd_308 77
	ApplyMovement obj_T20_gsmama, _1500
	WaitMovement
	SetFlag FLAG_HIDE_NEW_BARK_MOM
	PlaySE SEQ_SE_DP_KAIDAN2
	HidePerson obj_T20_gsmama
	WaitSE SEQ_SE_DP_KAIDAN2
	ScrCmd_311 77
	ScrCmd_308 77
	ScrCmd_309 77
	AddVar VAR_TEMP_x4007, 1
	ReleaseAll
	End

_144F:
	NPCMsg msg_0542_T20_00024
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _1508
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ReleaseAll
	End

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
	ScrCmd_609
	LockAll
	ApplyMovement obj_T20_var_1_2, _1644
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0542_T20_00027, msg_0542_T20_00028
	CloseMsg
	GetPlayerCoords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	Compare VAR_SPECIAL_x8005, 398
	GoToIfNe _1552
	ApplyMovement obj_T20_var_1_2, _1650
	GoTo _15AB

_1552:
	Compare VAR_SPECIAL_x8005, 399
	GoToIfNe _156D
	ApplyMovement obj_T20_var_1_2, _1658
	GoTo _15AB

_156D:
	Compare VAR_SPECIAL_x8005, 399
	GoToIfNe _1588
	ApplyMovement obj_T20_var_1_2, _1660
	GoTo _15AB

_1588:
	Compare VAR_SPECIAL_x8005, 399
	GoToIfNe _15A3
	ApplyMovement obj_T20_var_1_2, _1668
	GoTo _15AB

_15A3:
	ApplyMovement obj_T20_var_1_2, _1670
_15AB:
	ApplyMovement obj_player, _1678
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	BufferPlayersName 0
	GenderMsgBox msg_0542_T20_00029, msg_0542_T20_00030
	CloseMsg
	Compare VAR_SPECIAL_x8005, 398
	GoToIfNe _15E3
	ApplyMovement obj_T20_var_1_2, _1680
	GoTo _163C

_15E3:
	Compare VAR_SPECIAL_x8005, 399
	GoToIfNe _15FE
	ApplyMovement obj_T20_var_1_2, _1688
	GoTo _163C

_15FE:
	Compare VAR_SPECIAL_x8005, 399
	GoToIfNe _1619
	ApplyMovement obj_T20_var_1_2, _1690
	GoTo _163C

_1619:
	Compare VAR_SPECIAL_x8005, 399
	GoToIfNe _1634
	ApplyMovement obj_T20_var_1_2, _1698
	GoTo _163C

_1634:
	ApplyMovement obj_T20_var_1_2, _16A0
_163C:
	WaitMovement
	ReleaseAll
	End

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
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GenderMsgBox msg_0542_T20_00025, msg_0542_T20_00026
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T20_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_MARILL, 0
	NPCMsg msg_0542_T20_00033
	WaitCry
	CloseMsg
	ApplyMovement obj_T20_tsure_poke_static_marill_2, _16F4
	WaitMovement
	ApplyMovement obj_T20_var_1_2, _1700
	WaitMovement
	GenderMsgBox msg_0542_T20_00031, msg_0542_T20_00032
	WaitButton
	CloseMsg
	ReleaseAll
	End

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
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0542_T20_00036, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T20_014:
	DirectionSignpost msg_0542_T20_00034, 0, 11, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T20_015:
	BufferPlayersName 0
	SimpleNPCMsg msg_0542_T20_00012
	End
	.balign 4, 0
