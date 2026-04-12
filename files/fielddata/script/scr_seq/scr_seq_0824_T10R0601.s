#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T10R0601.h"
#include "msgdata/msg/msg_0527_T10R0601.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T10R0601_000
	ScrDef scr_seq_T10R0601_001
	ScrDef scr_seq_T10R0601_002
	ScrDefEnd

scr_seq_T10R0601_001:
	ScrCmd_609
	LockAll
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0048
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	PlaySE SEQ_SE_DP_KI_GASYAN
	ClearFlag FLAG_UNK_210
	ShowPerson obj_T10R0601_babyboy1_11
	SetVar VAR_UNK_40C8, 1
	ReleaseAll
	End

	.balign 4, 0
_0048:
	WalkNormalNorth 6
	EndMovement

scr_seq_T10R0601_002:
	SetFlag FLAG_UNK_210
	SetVar VAR_UNK_40C8, 0
	End

scr_seq_T10R0601_000:
	ScrCmd_609
	LockAll
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4000, 5
	GoToIfNe _008B
	ApplyMovement obj_player, _0298
	GoTo _00AE

_008B:
	Compare VAR_TEMP_x4000, 6
	GoToIfNe _00A6
	ApplyMovement obj_player, _02A8
	GoTo _00AE

_00A6:
	ApplyMovement obj_player, _02B0
_00AE:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ApplyMovement obj_T10R0601_wataru, _02C0
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0527_T10R0601_00000, msg_0527_T10R0601_00001
	CloseMsg
	Compare VAR_UNK_4135, 8
	GoToIfLt _00E8
	TrainerBattle TRAINER_CHAMPION_LANCE_2, 0, 0, 0
	GoTo _00F0

_00E8:
	TrainerBattle TRAINER_CHAMPION_LANCE, 0, 0, 0
_00F0:
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0290
	BufferPlayersName 0
	GenderMsgBox msg_0527_T10R0601_00002, msg_0527_T10R0601_00003
	CloseMsg
	Wait 10, VAR_SPECIAL_x8004
	PlaySE SEQ_SE_DP_KI_GASYAN
	HidePerson obj_T10R0601_leag_door2
	MovePersonFacing obj_T10R0601_kurumi, 6, 0, 20, DIR_NORTH
	MovePersonFacing obj_T10R0601_ookido, 6, 0, 17, DIR_NORTH
	Wait 30, VAR_SPECIAL_x8004
	StopBGM 0
	PlayBGM SEQ_GS_EYE_J_SHOUJO
	ApplyMovement obj_T10R0601_wataru, _02C8
	ApplyMovement obj_player, _02E0
	WaitMovement
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01A1
	Compare VAR_TEMP_x4000, 5
	GoToIfNe _017C
	ApplyMovement obj_partner_poke, _02F8
	GoTo _019F

_017C:
	Compare VAR_TEMP_x4000, 6
	GoToIfNe _0197
	ApplyMovement obj_partner_poke, _0308
	GoTo _019F

_0197:
	ApplyMovement obj_partner_poke, _0320
_019F:
	WaitMovement
_01A1:
	ApplyMovement obj_T10R0601_kurumi, _0338
	WaitMovement
	NPCMsg msg_0527_T10R0601_00005
	CloseMsg
	ApplyMovement obj_T10R0601_ookido, _0348
	ApplyMovement obj_T10R0601_kurumi, _0350
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0527_T10R0601_00006, msg_0527_T10R0601_00007
	CloseMsg
	ApplyMovement obj_T10R0601_kurumi, _0360
	WaitMovement
	NPCMsg msg_0527_T10R0601_00008
	ApplyMovement obj_T10R0601_wataru, _0368
	ApplyMovement obj_player, _0378
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0527_T10R0601_00009, msg_0527_T10R0601_00010
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_T10R0601_wataru, _0384
	ApplyMovement obj_player, _0394
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0234
	ApplyMovement obj_partner_poke, _03A4
	WaitMovement
_0234:
	PlaySE SEQ_SE_DP_KAIDAN2
	ApplyMovement obj_T10R0601_kurumi, _03AC
	WaitMovement
	NPCMsg msg_0527_T10R0601_00011
	ApplyMovement obj_T10R0601_kurumi, _03BC
	WaitMovement
	WaitABPress
	CloseMsg
	GoToIfSet FLAG_GAME_CLEAR, _0268
	ClearFlag FLAG_HIDE_OLIVINE_PORT_OAK
	SetVar VAR_UNK_411A, 1
_0268:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_POKEMON_LEAGUE_HALL_OF_FAME, 0, 6, 22, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_0290:
	WhiteOut
	ReleaseAll
	End

	.balign 4, 0
_0298:
	WalkNormalNorth 2
	WalkNormalEast
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_02A8:
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_02B0:
	WalkNormalNorth 2
	WalkNormalWest
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_02C0:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_02C8:
	FaceSouth
	EmoteExclamationMark 0
	LockDir
	WalkNormalEast
	UnlockDir
	EndMovement

	.balign 4, 0
_02E0:
	FaceSouth
	Delay8 4
	LockDir
	WalkNormalNorth 2
	UnlockDir
	EndMovement

	.balign 4, 0
_02F8:
	WalkFastNorth 3
	WalkFastEast
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0308:
	WalkFastNorth 2
	WalkFastWest
	WalkFastNorth 2
	WalkFastEast
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0320:
	WalkFastNorth
	WalkFastEast
	WalkFastNorth 2
	WalkFastWest 2
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0338:
	WalkFastNorth 12
	FaceSouth
	WalkOnSpotFastSouth 3
	EndMovement

	.balign 4, 0
_0348:
	WalkNormalNorth 8
	EndMovement

	.balign 4, 0
_0350:
	Delay8 6
	WalkNormalWest
	FaceNorth
	EndMovement

	.balign 4, 0
_0360:
	WalkOnSpotFastNorth 4
	EndMovement

	.balign 4, 0
_0368:
	WalkNormalNorth 2
	WalkNormalWest
	FaceSouth
	EndMovement

	.balign 4, 0
_0378:
	Delay8 3
	FaceNorth
	EndMovement

	.balign 4, 0
_0384:
	Delay4
	WalkNormalNorth 2
	SetInvisible
	EndMovement

	.balign 4, 0
_0394:
	WalkNormalNorth 2
	WalkNormalNorth 2
	SetInvisible
	EndMovement

	.balign 4, 0
_03A4:
	SetInvisible
	EndMovement

	.balign 4, 0
_03AC:
	WalkFastNorth 4
	EmoteExclamationMark 0
	Delay8 2
	EndMovement

	.balign 4, 0
_03BC:
	WalkFastEast
	WalkFastWest 2
	WalkFastEast 2
	WalkFastWest
	FaceNorth
	EndMovement
	.balign 4, 0
