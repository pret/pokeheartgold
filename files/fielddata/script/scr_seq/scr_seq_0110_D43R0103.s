#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D43R0103.h"
#include "msgdata/msg/msg_0128_D43R0103.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D43R0103_000
	ScrDef scr_seq_D43R0103_001
	ScrDef scr_seq_D43R0103_002
	ScrDef scr_seq_D43R0103_003
	ScrDef scr_seq_D43R0103_004
	ScrDef scr_seq_D43R0103_005
	ScrDef scr_seq_D43R0103_006
	ScrDefEnd

scr_seq_D43R0103_000:
	ScrCmd_609
	LockAll
	ApplyMovement obj_player, _0168
	WaitMovement
	ClearFlag FLAG_HIDE_VICTORY_ROAD_RIVAL
	ShowPerson obj_D43R0103_gsrivel
	CallStd std_play_rival_intro_music
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4000, 37
	GoToIfNe _0059
	ApplyMovement obj_D43R0103_gsrivel, _0180
	GoTo _007C

_0059:
	Compare VAR_TEMP_x4000, 38
	GoToIfNe _0074
	ApplyMovement obj_D43R0103_gsrivel, _0198
	GoTo _007C

_0074:
	ApplyMovement obj_D43R0103_gsrivel, _01B0
_007C:
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0178
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	BufferPlayersName 0
	NPCMsg msg_0128_D43R0103_00000
	CloseMsg
	GetStarterChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 152
	GoToIfNe _00C1
	TrainerBattle TRAINER_RIVAL_SILVER_9, 0, 0, 0
	GoTo _00E4

_00C1:
	Compare VAR_SPECIAL_RESULT, 155
	GoToIfNe _00DC
	TrainerBattle TRAINER_RIVAL_SILVER_13, 0, 0, 0
	GoTo _00E4

_00DC:
	TrainerBattle TRAINER_RIVAL_SILVER_5, 0, 0, 0
_00E4:
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _015A
	CallStd std_play_rival_outro_music
	NPCMsg msg_0128_D43R0103_00001
	CloseMsg
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4000, 37
	GoToIfNe _011F
	ApplyMovement obj_D43R0103_gsrivel, _01C8
	GoTo _0142

_011F:
	Compare VAR_TEMP_x4000, 38
	GoToIfNe _013A
	ApplyMovement obj_D43R0103_gsrivel, _01E4
	GoTo _0142

_013A:
	ApplyMovement obj_D43R0103_gsrivel, _0200
_0142:
	WaitMovement
	SetFlag FLAG_HIDE_VICTORY_ROAD_RIVAL
	HidePerson obj_D43R0103_gsrivel
	CallStd std_fade_end_rival_outro_music
	SetVar VAR_UNK_40C5, 1
	ReleaseAll
	End

_015A:
	HidePerson obj_D43R0103_gsrivel
	SetFlag FLAG_HIDE_VICTORY_ROAD_RIVAL
	WhiteOut
	ReleaseAll
	End

	.balign 4, 0
_0168:
	EmoteExclamationMark
	Delay8 2
	FaceSouth 2
	EndMovement

	.balign 4, 0
_0178:
	WalkSlowSouth
	EndMovement

	.balign 4, 0
_0180:
	WalkFastNorth 3
	FaceEast 2
	WalkFastEast 4
	FaceNorth 2
	WalkFastNorth 3
	EndMovement

	.balign 4, 0
_0198:
	WalkFastNorth 3
	FaceEast 2
	WalkFastEast 5
	FaceNorth 2
	WalkFastNorth 3
	EndMovement

	.balign 4, 0
_01B0:
	WalkFastNorth 3
	FaceEast 2
	WalkFastEast 6
	FaceNorth 2
	WalkFastNorth 3
	EndMovement

	.balign 4, 0
_01C8:
	FaceSouth 2
	WalkNormalSouth 2
	FaceWest 2
	WalkNormalWest 5
	FaceSouth 2
	WalkNormalSouth 7
	EndMovement

	.balign 4, 0
_01E4:
	FaceSouth 2
	WalkNormalSouth 2
	FaceWest 2
	WalkNormalWest 6
	FaceSouth 2
	WalkNormalSouth 7
	EndMovement

	.balign 4, 0
_0200:
	FaceSouth 2
	WalkNormalSouth 2
	FaceWest 2
	WalkNormalWest 7
	FaceSouth 2
	WalkNormalSouth 7
	EndMovement

scr_seq_D43R0103_001:
	End

scr_seq_D43R0103_002:
	SetVar VAR_TEMP_x4000, 57
	SetVar VAR_TEMP_x4001, 42
	GoTo _0278

scr_seq_D43R0103_003:
	SetVar VAR_TEMP_x4000, 28
	SetVar VAR_TEMP_x4001, 38
	GoTo _0278

scr_seq_D43R0103_004:
	SetVar VAR_TEMP_x4000, 31
	SetVar VAR_TEMP_x4001, 44
	GoTo _0278

scr_seq_D43R0103_005:
	SetVar VAR_TEMP_x4000, 22
	SetVar VAR_TEMP_x4001, 17
	GoTo _0278

scr_seq_D43R0103_006:
	SetVar VAR_TEMP_x4000, 58
	SetVar VAR_TEMP_x4001, 28
	GoTo _0278

_0278:
	ScrCmd_609
	LockAll
	SetVar VAR_UNK_40CA, 1
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _02A9
	ApplyMovement obj_player, _0330
	ApplyMovement obj_partner_poke, _033C
	GoTo _02FF

_02A9:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _02CC
	ApplyMovement obj_player, _034C
	ApplyMovement obj_partner_poke, _0358
	GoTo _02FF

_02CC:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _02EF
	ApplyMovement obj_player, _0384
	ApplyMovement obj_partner_poke, _0390
	GoTo _02FF

_02EF:
	ApplyMovement obj_player, _0368
	ApplyMovement obj_partner_poke, _0374
_02FF:
	WaitMovement
	PlaySE SEQ_SE_GS_RAKKA01
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_VICTORY_ROAD_2F, 0, VAR_TEMP_x4000, VAR_TEMP_x4001, VAR_SPECIAL_RESULT
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

	.balign 4, 0
_0330:
	WalkOnSpotFasterNorth 4
	SetInvisible
	EndMovement

	.balign 4, 0
_033C:
	Delay4 3
	WalkFasterNorth
	SetInvisible
	EndMovement

	.balign 4, 0
_034C:
	WalkOnSpotFasterSouth 4
	SetInvisible
	EndMovement

	.balign 4, 0
_0358:
	Delay4 3
	WalkFasterSouth
	SetInvisible
	EndMovement

	.balign 4, 0
_0368:
	WalkOnSpotFasterWest 4
	SetInvisible
	EndMovement

	.balign 4, 0
_0374:
	Delay4 3
	WalkFasterWest
	SetInvisible
	EndMovement

	.balign 4, 0
_0384:
	WalkOnSpotFasterEast 4
	SetInvisible
	EndMovement

	.balign 4, 0
_0390:
	Delay4 3
	WalkFasterEast
	SetInvisible
	EndMovement
	.balign 4, 0
