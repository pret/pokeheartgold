; Ilex Forest

#define FARFETCHD_X_COORD                   VAR_TEMP_x4000
#define FARFETCHD_Z_COORD                   VAR_TEMP_x4001
#define FARFETCHD1_BLIND_SPOT               VAR_TEMP_x4002
#define FARFETCHD2_BLIND_SPOT               VAR_TEMP_x4003
#define FARFETCHD1_BOTTOM_RIGHT_FACING_UP   VAR_TEMP_x4004

#include "constants/events.h"
#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D36R0101.h"
#include "msgdata/msg/msg_0115_D36R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D36R0101_000
	ScrDef scr_seq_D36R0101_farfetchd1
	ScrDef scr_seq_D36R0101_002
	ScrDef scr_seq_D36R0101_farfetchd1_sticks1
	ScrDef scr_seq_D36R0101_farfetchd1_sticks2
	ScrDef scr_seq_D36R0101_farfetchd2
	ScrDef scr_seq_D36R0101_farfetchd2_sticks1
	ScrDef scr_seq_D36R0101_farfetchd2_sticks2
	ScrDef scr_seq_D36R0101_farfetchd2_sticks3
	ScrDef scr_seq_D36R0101_farfetchd2_sticks4
	ScrDef scr_seq_D36R0101_010
	ScrDef scr_seq_D36R0101_011
	ScrDef scr_seq_D36R0101_012
	ScrDef scr_seq_D36R0101_013
	ScrDef scr_seq_D36R0101_014
	ScrDef scr_seq_D36R0101_015
	ScrDef scr_seq_D36R0101_016
	ScrDef scr_seq_D36R0101_017
	ScrDef scr_seq_D36R0101_018
	ScrDef scr_seq_D36R0101_019
	ScrDef scr_seq_D36R0101_020
	ScrDef scr_seq_D36R0101_021
	ScrDef scr_seq_D36R0101_022
	ScrDefEnd

scr_seq_D36R0101_000:
	GetFriendSprite VAR_OBJ_0
	GoToIfUnset FLAG_UNK_189, _0077
	ClearFlag FLAG_UNK_189
	GoTo _00C3

_0077:
	CheckBadge BADGE_PLAIN, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _00B5
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 2
	GoToIfEq _00BF
	Compare VAR_TEMP_x4000, 6
	GoToIfEq _00BF
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _00BF
_00B5:
	SetFlag FLAG_HIDE_CAMERON
	GoTo _00C3

_00BF:
	ClearFlag FLAG_HIDE_CAMERON
_00C3:
	GoToIfSet FLAG_BEAT_AZALEA_ROCKETS, _00D0
	End

_00D0:
	SetVar VAR_FARFETCHD1_STICKS1, STICKS_ACTIVE
	SetVar VAR_FARFETCHD2_STICKS1, STICKS_INACTIVE
	SetVar VAR_FARFETCHD2_STICKS2, STICKS_INACTIVE
	SetVar VAR_FARFETCHD2_STICKS3, STICKS_INACTIVE
	SetVar VAR_FARFETCHD2_STICKS4, STICKS_ACTIVE
	SetVar VAR_TEMP_x4000, 0
	SetVar VAR_TEMP_x4001, 0
	SetVar FARFETCHD1_BLIND_SPOT, FALSE
	SetVar FARFETCHD2_BLIND_SPOT, FALSE
	SetVar FARFETCHD1_BOTTOM_RIGHT_FACING_UP, FALSE
	GoToIfSet FLAG_FOUND_FIRST_FARFETCHD, _0124
	GoToIfSet FLAG_FOUND_SECOND_FARFETCHD, _0145
	End

_0124:
	GoToIfSet FLAG_FOUND_SECOND_FARFETCHD, _0137
	SetVar VAR_FARFETCHD1_STICKS1, STICKS_INACTIVE
	End

_0137:
	SetVar VAR_FARFETCHD1_STICKS1, STICKS_INACTIVE
	SetVar VAR_FARFETCHD2_STICKS4, STICKS_INACTIVE
	End

_0145:
	SetVar VAR_FARFETCHD1_STICKS1, STICKS_ACTIVE
	SetVar VAR_FARFETCHD2_STICKS4, STICKS_INACTIVE
	End

scr_seq_D36R0101_021:
	Compare VAR_UNK_412B, 1
	CallIfEq _016F
	Compare VAR_UNK_40FE, 4
	CallIfEq _0189
	End

_016F:
	MovePersonFacing obj_D36R0101_gsoldman1, 15, 0, 58, DIR_SOUTH
	MovePersonFacing obj_D36R0101_tsure_poke_static_pichu_spiky, 15, 0, 59, DIR_EAST
	Return

_0189:
	MovePersonFacing obj_D36R0101_var_1, 15, 0, 58, DIR_SOUTH
	MovePersonFacing obj_D36R0101_tsure_poke_static_marill, 11, 0, 58, DIR_EAST
	Return

scr_seq_D36R0101_farfetchd1:
	GetPersonCoords obj_D36R0101_tsure_poke_static_farfetchd, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	Compare FARFETCHD_X_COORD, 25
	GoToIfNe _01C4
	GoTo _farfetchd1_left

_01BE:
	GoTo _farfetchd1_left

_01C4:
	Compare FARFETCHD_X_COORD, 32
	GoToIfNe _farfetchd1_left
	GoTo _farfetchd1_right

_farfetchd1_left:
	GetPersonCoords obj_D36R0101_tsure_poke_static_farfetchd, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	Compare FARFETCHD_Z_COORD, 52
	GoToIfNe _01F8
	GoTo _farfetchd1_top_left

_01F2:
	GoTo _farfetchd1_right

_01F8:
	Compare FARFETCHD_Z_COORD, 62
	GoToIfNe _farfetchd1_right
	GoTo _farfetchd1_bottom_left

_farfetchd1_right:
	SetVar FARFETCHD1_BLIND_SPOT, FALSE
	GetPersonCoords obj_D36R0101_tsure_poke_static_farfetchd, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	Compare FARFETCHD_Z_COORD, 52
	GoToIfNe _0232
	GoTo _farfetchd1_top_right

_022C:
	GoTo _farfetchd1_top_left

_0232:
	Compare FARFETCHD_Z_COORD, 62
	GoToIfNe _farfetchd1_top_left
	GoTo _farfetchd1_bottom_right

_farfetchd1_top_left:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar FARFETCHD1_BLIND_SPOT, FALSE
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, DIR_NORTH
	GoToIfNe _0272
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd, _farfetchd1_run_right
	GoTo _0293

_0272:
	Compare VAR_SPECIAL_RESULT, DIR_WEST
	GoToIfNe _0293
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd, _farfetchd_run_down
	SetVar VAR_FARFETCHD1_STICKS2, STICKS_ACTIVE
	SetVar VAR_FARFETCHD1_STICKS1, STICKS_ACTIVE
_0293:
	WaitMovement
	ReleaseAll
	End

_farfetchd1_bottom_left:
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, DIR_WEST
	GoToIfNe _02B6
	GoTo _farfetchd1_bottom_left_flee_up

_02B0:
	GoTo _farfetchd1_bottom_left_flee_up

_02B6:
	Compare VAR_SPECIAL_RESULT, DIR_SOUTH
	GoToIfNe _farfetchd1_bottom_left_flee_up
	GoTo _farfetchd1_bottom_left_flee_right

_farfetchd1_bottom_left_flee_up:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_FARFETCHD1_STICKS1, STICKS_INACTIVE
	SetVar VAR_FARFETCHD1_STICKS2, STICKS_INACTIVE
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd, _farfetchd_run_up
	WaitMovement
	GoToIfSet FLAG_UNK_126, _02FD
	NPCMsg msg_0115_D36R0101_00036
	WaitButton
	CloseMsg
	SetFlag FLAG_UNK_126
_02FD:
	ReleaseAll
	End

_farfetchd1_bottom_left_flee_right:
	Compare FARFETCHD1_BLIND_SPOT, TRUE
	GoToIfEq _farfetchd1_bottom_left_caught
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_FARFETCHD1_STICKS1, STICKS_INACTIVE
	SetVar VAR_FARFETCHD1_STICKS2, STICKS_INACTIVE
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd, _farfetchd1_run_right
	WaitMovement
	GoToIfSet FLAG_UNK_126, _0342
	NPCMsg msg_0115_D36R0101_00036
	WaitButton
	CloseMsg
	SetFlag FLAG_UNK_126
_0342:
	ReleaseAll
	End

_farfetchd1_bottom_left_caught:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	PlayCry SPECIES_FARFETCHD, 0
	NPCMsg msg_0115_D36R0101_00003
	CloseMsg
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd, _walk_in_place_face_down
	WaitMovement
	HidePerson obj_D36R0101_tsure_poke_static_farfetchd
	NPCMsg msg_0115_D36R0101_00037
	WaitButton
	CloseMsg
	SetVar VAR_FARFETCHD1_STICKS1, STICKS_INACTIVE
	SetVar VAR_FARFETCHD1_STICKS2, STICKS_INACTIVE
	SetFlag FLAG_HIDE_FARFETCHD_1_LOST
	SetFlag FLAG_FOUND_FIRST_FARFETCHD
	GoToIfSet FLAG_FOUND_SECOND_FARFETCHD, _1207
	ClearFlag FLAG_HIDE_FARFETCHD_1_FOUND
	Wait 20, VAR_SPECIAL_x8004
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_ILEX_FOREST, 0, 15, 65, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Wait 5, VAR_SPECIAL_x8004
	NPCMsg msg_0115_D36R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_farfetchd1_top_right:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, DIR_EAST
	GoToIfNe _0403
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd, _farfetchd_run_down
	SetVar VAR_FARFETCHD1_STICKS2, STICKS_ACTIVE
	SetVar VAR_FARFETCHD1_STICKS1, STICKS_ACTIVE
	SetVar FARFETCHD1_BOTTOM_RIGHT_FACING_UP, TRUE
	GoTo _0424

_0403:
	Compare VAR_SPECIAL_RESULT, DIR_NORTH
	GoToIfNe _0424
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd, _farfetchd1_run_left
	SetVar VAR_FARFETCHD1_STICKS1, STICKS_INACTIVE
	SetVar VAR_FARFETCHD1_STICKS2, STICKS_INACTIVE
_0424:
	WaitMovement
	ReleaseAll
	End

_farfetchd1_bottom_right:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar FARFETCHD1_BOTTOM_RIGHT_FACING_UP, FALSE
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, DIR_EAST
	GoToIfNe _0463
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd, _farfetchd_run_up
	SetVar VAR_FARFETCHD1_STICKS1, STICKS_INACTIVE
	SetVar VAR_FARFETCHD1_STICKS2, STICKS_INACTIVE
	GoTo _0484

_0463:
	Compare VAR_SPECIAL_RESULT, DIR_SOUTH
	GoToIfNe _0484
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd, _farfetchd1_run_left
	SetVar VAR_FARFETCHD1_STICKS1, STICKS_ACTIVE
	SetVar VAR_FARFETCHD1_STICKS2, STICKS_INACTIVE
_0484:
	WaitMovement
	ReleaseAll
	End

scr_seq_D36R0101_farfetchd1_sticks1:
	ScrCmd_609
	LockAll
	Compare FARFETCHD1_BOTTOM_RIGHT_FACING_UP, TRUE
	GoToIfEq _farfetchd1_look_left
	SetVar FARFETCHD1_BLIND_SPOT, TRUE
	SetVar VAR_FARFETCHD1_STICKS1, STICKS_INACTIVE
	SetVar VAR_FARFETCHD1_STICKS2, STICKS_ACTIVE
	GetPersonCoords obj_D36R0101_tsure_poke_static_farfetchd, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	Compare FARFETCHD_X_COORD, 25
	GoToIfNe _04CE
	GoTo _sticks1_farfetchd1_left

_04B8:
	GoTo _sticks1_farfetchd1_left

_04CE:
	Compare FARFETCHD_X_COORD, 32
	GoToIfNe _sticks1_farfetchd1_left
	GoTo _sticks1_farfetchd1_right

_sticks1_farfetchd1_left:
	GetPersonCoords obj_D36R0101_tsure_poke_static_farfetchd, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	Compare FARFETCHD_Z_COORD, 52
	GoToIfNe _0502
	GoTo _sticks1_farfetchd1_top_left

_04FC:
	GoTo _sticks1_farfetchd1_right

_0502:
	Compare FARFETCHD_Z_COORD, 62
	GoToIfNe _sticks1_farfetchd1_right
	GoTo _sticks1_farfetchd1_bottom_left

_sticks1_farfetchd1_right:
	GetPersonCoords obj_D36R0101_tsure_poke_static_farfetchd, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	Compare FARFETCHD_Z_COORD, 52
	GoToIfNe _0536
	GoTo _sticks1_farfetchd1_top_right

_0530:
	GoTo _sticks1_farfetchd1_top_left

_0536:
	Compare FARFETCHD_Z_COORD, 62
	GoToIfNe _sticks1_farfetchd1_top_left
	GoTo _sticks1_farfetchd1_bottom_right

_sticks1_farfetchd1_top_left:
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd, _exclaim_face_down
	WaitMovement
	ReleaseAll
	End

_sticks1_farfetchd1_bottom_left:
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd, _exclaim_face_down
	WaitMovement
	GoToIfSet FLAG_FARFETCHD_NOTICED_YOU, _skip_farfetchd_noticed_msg
	NPCMsg msg_0115_D36R0101_00035
	WaitButton
	CloseMsg
	SetFlag FLAG_FARFETCHD_NOTICED_YOU
_skip_farfetchd_noticed_msg:
	ReleaseAll
	End

_sticks1_farfetchd1_top_right:
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd, _exclaim_face_down
	WaitMovement
	ReleaseAll
	End

_sticks1_farfetchd1_bottom_right:
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd, _exclaim_face_left
	WaitMovement
	ReleaseAll
	End

scr_seq_D36R0101_farfetchd1_sticks2:
	ScrCmd_609
	LockAll
	Compare FARFETCHD1_BOTTOM_RIGHT_FACING_UP, TRUE
	GoToIfEq _farfetchd1_look_left
	SetVar VAR_FARFETCHD1_STICKS1, STICKS_ACTIVE
	SetVar VAR_FARFETCHD1_STICKS2, STICKS_INACTIVE
	SetVar FARFETCHD1_BLIND_SPOT, FALSE
	GetPersonCoords obj_D36R0101_tsure_poke_static_farfetchd, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	Compare FARFETCHD_X_COORD, 25
	GoToIfNe _05DB
	GoTo _sticks2_farfetchd1_left

_05D5:
	GoTo _sticks2_farfetchd1_left

_05DB:
	Compare FARFETCHD_X_COORD, 32
	GoToIfNe _sticks2_farfetchd1_left
	GoTo _sticks2_farfetchd1_right

_sticks2_farfetchd1_left:
	GetPersonCoords obj_D36R0101_tsure_poke_static_farfetchd, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	Compare FARFETCHD_Z_COORD, 52
	GoToIfNe _060F
	GoTo _sticks2_farfetchd1_top_left

_0609:
	GoTo _sticks2_farfetchd1_right

_060F:
	Compare FARFETCHD_Z_COORD, 62
	GoToIfNe _sticks2_farfetchd1_right
	GoTo _sticks2_farfetchd1_bottom_left

_sticks2_farfetchd1_right:
	GetPersonCoords obj_D36R0101_tsure_poke_static_farfetchd, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	Compare FARFETCHD_Z_COORD, 52
	GoToIfNe _0643
	GoTo _sticks2_farfetchd1_top_right

_063D:
	GoTo _sticks2_farfetchd1_top_left

_0643:
	Compare FARFETCHD_Z_COORD, 62
	GoToIfNe _sticks2_farfetchd1_top_left
	GoTo _sticks2_farfetchd1_bottom_right

_sticks2_farfetchd1_top_left:
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd, _exclaim_face_down
	WaitMovement
	ReleaseAll
	End

_sticks2_farfetchd1_bottom_left:
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd, _exclaim_face_right
	WaitMovement
	ReleaseAll
	End

_sticks2_farfetchd1_top_right:
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd, _exclaim_face_down
	WaitMovement
	ReleaseAll
	End

_sticks2_farfetchd1_bottom_right:
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd, _exclaim_face_left
	WaitMovement
	ReleaseAll
	End

_farfetchd1_look_left:
	SetVar VAR_FARFETCHD1_STICKS1, STICKS_INACTIVE
	SetVar VAR_FARFETCHD1_STICKS2, STICKS_INACTIVE
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd, _exclaim_face_left
	WaitMovement
	ReleaseAll
	End

scr_seq_D36R0101_farfetchd2:
	GetPersonCoords obj_D36R0101_tsure_poke_static_farfetchd_2, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	Compare FARFETCHD_X_COORD, 41
	GoToIfNe _06C9
	GoTo _farfetchd2_left

_06C3:
	GoTo _farfetchd2_left

_06C9:
	Compare FARFETCHD_X_COORD, 49
	GoToIfNe _farfetchd2_left
	GoTo _farfetchd2_right

_farfetchd2_left:
	SetVar FARFETCHD2_BLIND_SPOT, FALSE
	GetPersonCoords obj_D36R0101_tsure_poke_static_farfetchd_2, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	Compare FARFETCHD_Z_COORD, 54
	GoToIfNe _0703
	GoTo _farfetchd_top_left

_06FD:
	GoTo _farfetchd2_right

_0703:
	Compare FARFETCHD_Z_COORD, 64
	GoToIfNe _farfetchd2_right
	GoTo _farfetchd2_bottom_left

_farfetchd2_right:
	GetPersonCoords obj_D36R0101_tsure_poke_static_farfetchd_2, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	Compare FARFETCHD_Z_COORD, 54
	GoToIfNe _0737
	GoTo _farfetchd2_top_right

_0731:
	GoTo _farfetchd_top_left

_0737:
	Compare FARFETCHD_Z_COORD, 64
	GoToIfNe _farfetchd_top_left
	GoTo _farfetchd2_bottom_right

_farfetchd_top_left:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, DIR_NORTH
	GoToIfNe _farfetchd2_top_left_flee_down
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd_2, _farfetchd2_run_right
	WaitMovement
	SetVar VAR_FARFETCHD2_STICKS1, STICKS_ACTIVE
	SetVar VAR_FARFETCHD2_STICKS2, STICKS_ACTIVE
	SetVar VAR_FARFETCHD2_STICKS3, STICKS_INACTIVE
	SetVar VAR_FARFETCHD2_STICKS4, STICKS_INACTIVE
	GoTo _07BA

_farfetchd2_top_left_flee_down:
	Compare VAR_SPECIAL_RESULT, DIR_WEST
	GoToIfNe _07BA
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd_2, _farfetchd_run_down
	WaitMovement
	SetVar VAR_FARFETCHD2_STICKS1, STICKS_INACTIVE
	SetVar VAR_FARFETCHD2_STICKS2, STICKS_INACTIVE
	SetVar VAR_FARFETCHD2_STICKS3, STICKS_ACTIVE
	SetVar VAR_FARFETCHD2_STICKS4, STICKS_INACTIVE
_07BA:
	GoToIfSet FLAG_UNK_126, _07D0
	NPCMsg msg_0115_D36R0101_00036
	WaitButton
	CloseMsg
	SetFlag FLAG_UNK_126
_07D0:
	ReleaseAll
	End

_farfetchd2_bottom_left:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, DIR_SOUTH
	GoToIfNe _farfetchd2_bottom_left_flee_up
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd_2, _farfetchd2_run_right
	SetVar VAR_FARFETCHD2_STICKS1, STICKS_INACTIVE
	SetVar VAR_FARFETCHD2_STICKS2, STICKS_INACTIVE
	SetVar VAR_FARFETCHD2_STICKS3, STICKS_INACTIVE
	SetVar VAR_FARFETCHD2_STICKS4, STICKS_INACTIVE
	GoTo _0840

_farfetchd2_bottom_left_flee_up:
	Compare VAR_SPECIAL_RESULT, DIR_WEST
	GoToIfNe _0840
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd_2, _farfetchd_run_up
	SetVar VAR_FARFETCHD2_STICKS1, STICKS_INACTIVE
	SetVar VAR_FARFETCHD2_STICKS2, STICKS_INACTIVE
	SetVar VAR_FARFETCHD2_STICKS3, STICKS_INACTIVE
	SetVar VAR_FARFETCHD2_STICKS4, STICKS_ACTIVE
_0840:
	WaitMovement
	ReleaseAll
	End

_farfetchd2_top_right:
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, DIR_NORTH
	GoToIfNe _0863
	GoTo _farfetchd2_top_right_flee_left

_085D:
	GoTo _farfetchd2_top_right_flee_left

_0863:
	Compare VAR_SPECIAL_RESULT, DIR_EAST
	GoToIfNe _farfetchd2_top_right_flee_left
	GoTo _farfetchd2_top_right_flee_down

_farfetchd2_top_right_flee_left:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_FARFETCHD2_STICKS1, STICKS_INACTIVE
	SetVar VAR_FARFETCHD2_STICKS2, STICKS_INACTIVE
	SetVar VAR_FARFETCHD2_STICKS3, STICKS_INACTIVE
	SetVar VAR_FARFETCHD2_STICKS4, STICKS_INACTIVE
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd_2, _farfetchd2_run_left
	WaitMovement
	ReleaseAll
	End

_farfetchd2_top_right_flee_down:
	Compare FARFETCHD2_BLIND_SPOT, TRUE
	GoToIfEq _farfetchd2_top_right_caught
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_FARFETCHD2_STICKS1, STICKS_INACTIVE
	SetVar VAR_FARFETCHD2_STICKS2, STICKS_INACTIVE
	SetVar VAR_FARFETCHD2_STICKS3, STICKS_ACTIVE
	SetVar VAR_FARFETCHD2_STICKS4, STICKS_INACTIVE
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd_2, _farfetchd_run_down
	WaitMovement
	ReleaseAll
	End

_farfetchd2_top_right_caught:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	PlayCry SPECIES_FARFETCHD, 0
	NPCMsg msg_0115_D36R0101_00003
	CloseMsg
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd_2, _walk_in_place_face_right
	WaitMovement
	HidePerson obj_D36R0101_tsure_poke_static_farfetchd_2
	NPCMsg msg_0115_D36R0101_00037
	WaitButton
	CloseMsg
	CallIfUnset FLAG_FOUND_FIRST_FARFETCHD, _097A
	SetVar VAR_FARFETCHD2_STICKS1, STICKS_INACTIVE
	SetVar VAR_FARFETCHD2_STICKS2, STICKS_INACTIVE
	SetVar VAR_FARFETCHD2_STICKS3, STICKS_INACTIVE
	SetVar VAR_FARFETCHD2_STICKS4, STICKS_INACTIVE
	SetFlag FLAG_HIDE_FARFETCHD_2_LOST
	SetFlag FLAG_FOUND_SECOND_FARFETCHD
	GoToIfSet FLAG_FOUND_FIRST_FARFETCHD, _1207
	ClearFlag FLAG_HIDE_FARFETCHD_1_FOUND
	Wait 20, VAR_SPECIAL_x8004
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_ILEX_FOREST, 0, 15, 65, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Wait 5, VAR_SPECIAL_x8004
	NPCMsg msg_0115_D36R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_097A:
	SetVar VAR_FARFETCHD1_STICKS1, STICKS_ACTIVE
	Return

_farfetchd2_bottom_right:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar FARFETCHD2_BLIND_SPOT, FALSE
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, DIR_EAST
	GoToIfNe _farfetchd2_bottom_right_flee_left
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd_2, _farfetchd_run_up
	SetVar VAR_FARFETCHD2_STICKS1, STICKS_ACTIVE
	SetVar VAR_FARFETCHD2_STICKS2, STICKS_ACTIVE
	SetVar VAR_FARFETCHD2_STICKS3, STICKS_INACTIVE
	SetVar VAR_FARFETCHD2_STICKS4, STICKS_ACTIVE
	GoTo _09F4

_farfetchd2_bottom_right_flee_left:
	Compare VAR_SPECIAL_RESULT, DIR_SOUTH
	GoToIfNe _09F4
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd_2, _farfetchd2_run_left
	SetVar VAR_FARFETCHD2_STICKS1, STICKS_INACTIVE
	SetVar VAR_FARFETCHD2_STICKS2, STICKS_INACTIVE
	SetVar VAR_FARFETCHD2_STICKS3, STICKS_INACTIVE
	SetVar VAR_FARFETCHD2_STICKS4, STICKS_INACTIVE
_09F4:
	WaitMovement
	ReleaseAll
	End

scr_seq_D36R0101_farfetchd2_sticks1:
	ScrCmd_609
	LockAll
	SetVar FARFETCHD2_BLIND_SPOT, FALSE
	GetPersonCoords obj_D36R0101_tsure_poke_static_farfetchd_2, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	Compare FARFETCHD_X_COORD, 41
	GoToIfNe _0A25
	GoTo _sticks1_farfetchd2_left

_0A1F:
	GoTo _sticks1_farfetchd2_left

_0A25:
	Compare FARFETCHD_X_COORD, 49
	GoToIfNe _sticks1_farfetchd2_left
	GoTo _sticks1_farfetchd2_right

_sticks1_farfetchd2_left:
	GetPersonCoords obj_D36R0101_tsure_poke_static_farfetchd_2, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	Compare FARFETCHD_Z_COORD, 54
	GoToIfNe _0A59
	GoTo _sticks1_farfetchd2_top_left

_0A53:
	GoTo _sticks1_farfetchd2_right

_0A59:
	Compare FARFETCHD_Z_COORD, 64
	GoToIfNe _sticks1_farfetchd2_right
	GoTo _sticks1_farfetchd2_bottom_left

_sticks1_farfetchd2_right:
	GetPersonCoords obj_D36R0101_tsure_poke_static_farfetchd_2, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	Compare FARFETCHD_Z_COORD, 54
	GoToIfNe _0A8D
	GoTo _sticks1_farfetchd2_top_right

_0A87:
	GoTo _sticks1_farfetchd2_top_left

_0A8D:
	Compare FARFETCHD_Z_COORD, 64
	GoToIfNe _sticks1_farfetchd2_top_left
	GoTo _sticks1_farfetchd2_bottom_right

_sticks1_farfetchd2_top_left:
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_right
	WaitMovement
	ReleaseAll
	End

_sticks1_farfetchd2_bottom_left:
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_up
	WaitMovement
	ReleaseAll
	End

_sticks1_farfetchd2_top_right:
	SetVar VAR_FARFETCHD2_STICKS1, STICKS_INACTIVE
	SetVar VAR_FARFETCHD2_STICKS2, STICKS_ACTIVE
	SetVar VAR_FARFETCHD2_STICKS3, STICKS_INACTIVE
	SetVar VAR_FARFETCHD2_STICKS4, STICKS_ACTIVE
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_up
	WaitMovement
	ReleaseAll
	End

_sticks1_farfetchd2_bottom_right:
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_up
	WaitMovement
	ReleaseAll
	End

scr_seq_D36R0101_farfetchd2_sticks2:
	ScrCmd_609
	LockAll
	SetVar FARFETCHD2_BLIND_SPOT, TRUE
	GetPersonCoords obj_D36R0101_tsure_poke_static_farfetchd_2, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	Compare FARFETCHD_X_COORD, 41
	GoToIfNe _0B1B
	GoTo _sticks2_farfetchd2_left

_0B15:
	GoTo _sticks2_farfetchd2_left

_0B1B:
	Compare FARFETCHD_X_COORD, 49
	GoToIfNe _sticks2_farfetchd2_left
	GoTo _sticks2_farfetchd2_right

_sticks2_farfetchd2_left:
	GetPersonCoords obj_D36R0101_tsure_poke_static_farfetchd_2, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	Compare FARFETCHD_Z_COORD, 54
	GoToIfNe _0B4F
	GoTo _sticks2_farfetchd2_top_left

_0B49:
	GoTo _sticks2_farfetchd2_right

_0B4F:
	Compare FARFETCHD_Z_COORD, 64
	GoToIfNe _sticks2_farfetchd2_right
	GoTo _sticks2_farfetchd2_bottom_left

_sticks2_farfetchd2_right:
	GetPersonCoords obj_D36R0101_tsure_poke_static_farfetchd_2, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	Compare FARFETCHD_Z_COORD, 54
	GoToIfNe _0B83
	GoTo _sticks2_farfetchd2_top_right

_0B7D:
	GoTo _sticks2_farfetchd2_top_left

_0B83:
	Compare FARFETCHD_Z_COORD, 64
	GoToIfNe _sticks2_farfetchd2_top_left
	GoTo _sticks2_farfetchd2_bottom_right

_sticks2_farfetchd2_top_left:
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_right
	WaitMovement
	ReleaseAll
	End

_sticks2_farfetchd2_bottom_left:
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_right
	WaitMovement
	ReleaseAll
	End

_sticks2_farfetchd2_top_right:
	SetVar VAR_FARFETCHD2_STICKS1, STICKS_ACTIVE
	SetVar VAR_FARFETCHD2_STICKS2, STICKS_INACTIVE
	SetVar VAR_FARFETCHD2_STICKS3, STICKS_INACTIVE
	SetVar VAR_FARFETCHD2_STICKS4, STICKS_ACTIVE
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_right
	WaitMovement
	ReleaseAll
	End

_sticks2_farfetchd2_bottom_right:
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_up
	WaitMovement
	ReleaseAll
	End

scr_seq_D36R0101_farfetchd2_sticks3:
	ScrCmd_609
	LockAll
	SetVar FARFETCHD2_BLIND_SPOT, FALSE
	GetPersonCoords obj_D36R0101_tsure_poke_static_farfetchd_2, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	Compare FARFETCHD_X_COORD, 41
	GoToIfNe _0C11
	GoTo _sticks3_farfetchd2_left

_0C0B:
	GoTo _sticks3_farfetchd2_left

_0C11:
	Compare FARFETCHD_X_COORD, 49
	GoToIfNe _sticks3_farfetchd2_left
	GoTo _sticks3_farfetchd2_right

_sticks3_farfetchd2_left:
	GetPersonCoords obj_D36R0101_tsure_poke_static_farfetchd_2, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	Compare FARFETCHD_Z_COORD, 54
	GoToIfNe _0C45
	GoTo _sticks3_farfetchd2_top_left

_0C3F:
	GoTo _sticks3_farfetchd2_right

_0C45:
	Compare FARFETCHD_Z_COORD, 64
	GoToIfNe _sticks3_farfetchd2_right
	GoTo _sticks3_farfetchd2_bottom_left

_sticks3_farfetchd2_right:
	GetPersonCoords obj_D36R0101_tsure_poke_static_farfetchd_2, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	Compare FARFETCHD_Z_COORD, 54
	GoToIfNe _0C79
	GoTo _sticks3_farfetchd2_top_right

_0C73:
	GoTo _sticks3_farfetchd2_top_left

_0C79:
	Compare FARFETCHD_Z_COORD, 64
	GoToIfNe _sticks3_farfetchd2_top_left
	GoTo _sticks3_farfetchd2_bottom_right

_sticks3_farfetchd2_top_left:
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_down
	WaitMovement
	ReleaseAll
	End

_sticks3_farfetchd2_bottom_left:
	SetVar VAR_FARFETCHD2_STICKS3, STICKS_INACTIVE
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_right
	WaitMovement
	ReleaseAll
	End

_sticks3_farfetchd2_top_right:
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_down
	WaitMovement
	ReleaseAll
	End

_sticks3_farfetchd2_bottom_right:
	SetVar VAR_FARFETCHD2_STICKS3, STICKS_INACTIVE
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_left
	WaitMovement
	ReleaseAll
	End

scr_seq_D36R0101_farfetchd2_sticks4:
	ScrCmd_609
	LockAll
	SetVar FARFETCHD2_BLIND_SPOT, FALSE
	GetPersonCoords obj_D36R0101_tsure_poke_static_farfetchd_2, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	Compare FARFETCHD_X_COORD, 41
	GoToIfNe _0CFB
	GoTo _sticks4_farfetchd2_left

_0CF5:
	GoTo _sticks4_farfetchd2_left

_0CFB:
	Compare FARFETCHD_X_COORD, 49
	GoToIfNe _sticks4_farfetchd2_left
	GoTo _sticks4_farfetchd2_right

_sticks4_farfetchd2_left:
	GetPersonCoords obj_D36R0101_tsure_poke_static_farfetchd_2, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	Compare FARFETCHD_Z_COORD, 54
	GoToIfNe _0D2F
	GoTo _sticks4_farfetchd2_top_left

_0D29:
	GoTo _sticks4_farfetchd2_right

_0D2F:
	Compare FARFETCHD_Z_COORD, 64
	GoToIfNe _sticks4_farfetchd2_right
	GoTo _sticks4_farfetchd2_bottom_left

_sticks4_farfetchd2_right:
	GetPersonCoords obj_D36R0101_tsure_poke_static_farfetchd_2, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	Compare FARFETCHD_Z_COORD, 54
	GoToIfNe _0D63
	GoTo _sticks4_farfetchd2_top_right

_0D5D:
	GoTo _sticks4_farfetchd2_top_left

_0D63:
	Compare FARFETCHD_Z_COORD, 64
	GoToIfNe _sticks4_farfetchd2_top_left
	GoTo _sticks4_farfetchd2_bottom_right

_sticks4_farfetchd2_top_left:
	SetVar VAR_FARFETCHD2_STICKS4, STICKS_INACTIVE
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_right
	WaitMovement
	ReleaseAll
	End

_sticks4_farfetchd2_bottom_left:
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_up
	WaitMovement
	ReleaseAll
	End

_sticks4_farfetchd2_top_right:
	SetVar VAR_FARFETCHD2_STICKS1, STICKS_ACTIVE
	SetVar VAR_FARFETCHD2_STICKS2, STICKS_ACTIVE
	SetVar VAR_FARFETCHD2_STICKS4, STICKS_INACTIVE
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_left
	WaitMovement
	ReleaseAll
	End

_sticks4_farfetchd2_bottom_right:
	ApplyMovement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_up
	WaitMovement
	ReleaseAll
	End

	.balign 4, 0
_exclaim_face_down:
	FaceSouth
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_exclaim_face_up:
	FaceNorth
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_exclaim_face_left:
	FaceWest
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_exclaim_face_right:
	FaceEast
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_farfetchd_run_up:
	EmoteExclamationMark
	WalkFastNorth 10
	FaceSouth
	EndMovement

	.balign 4, 0
_farfetchd_run_down:
	EmoteExclamationMark
	WalkFastSouth 10
	FaceNorth
	EndMovement

	.balign 4, 0
_farfetchd1_run_right:
	EmoteExclamationMark
	WalkFastEast 7
	FaceWest
	EndMovement

	.balign 4, 0
_farfetchd1_run_left:
	EmoteExclamationMark
	WalkFastWest 7
	FaceEast
	EndMovement

	.balign 4, 0
_farfetchd2_run_right:
	EmoteExclamationMark
	WalkFastEast 8
	FaceWest
	EndMovement

	.balign 4, 0
_farfetchd2_run_left:
	EmoteExclamationMark
	WalkFastWest 8
	FaceEast
	EndMovement

	.balign 4, 0
_walk_in_place_face_down:
	WalkOnSpotFastSouth 5
	EndMovement

	.balign 4, 0
_walk_in_place_face_right:
	WalkOnSpotFastEast 5
	EndMovement

scr_seq_D36R0101_016:
	ScrCmd_609
	LockAll
	ApplyMovement obj_player, _0EC4
	WaitMovement
	ApplyMovement obj_D36R0101_gsbigman, _0ED0
	WaitMovement
	PlaySE SEQ_SE_DP_KI_GASYAN
	ScreenShake 0, 2, 10, 5
	ApplyMovement obj_D36R0101_gsbigman, _0ED8
	WaitMovement
	ApplyMovement obj_D36R0101_gsbigman, _0ED0
	WaitMovement
	PlaySE SEQ_SE_DP_KI_GASYAN
	ScreenShake 0, 2, 10, 5
	ApplyMovement obj_D36R0101_gsbigman, _0ED8
	WaitMovement
	SetVar VAR_UNK_40EA, 1
	ReleaseAll
	End

	.balign 4, 0
_0EC4:
	EmoteExclamationMark
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0ED0:
	JumpNearFastNorth
	EndMovement

	.balign 4, 0
_0ED8:
	LockDir
	WalkSlowSouth
	UnlockDir
	EndMovement

scr_seq_D36R0101_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0115_D36R0101_00011
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _1086
	NPCMsg msg_0115_D36R0101_00014
	CloseMsg
_0F0B:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	PartySelectUI
	GetPartySelection VAR_SPECIAL_RESULT
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _1093
	GetPartyMonSpecies VAR_SPECIAL_RESULT, VAR_SPECIAL_x8005
	SetOrCopyVar VAR_SPECIAL_x8006, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_x8005, 0
	GoToIfEq _10A0
	MonHasMove VAR_SPECIAL_RESULT, MOVE_HEADBUTT, VAR_SPECIAL_x8006
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _10E1
	ScrCmd_656 VAR_SPECIAL_x8006, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0F84
	NPCMsg msg_0115_D36R0101_00016
	CloseMsg
	GoTo _0F0B

_0F84:
	CountMonMoves VAR_SPECIAL_x8002, VAR_SPECIAL_x8006
	Compare VAR_SPECIAL_x8002, 3
	GoToIfLe _1041
	TouchscreenMenuHide
_0F99:
	BufferPartyMonNick 0, VAR_SPECIAL_x8006
	NPCMsg msg_0115_D36R0101_00017
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _10C7
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	PokemonSummaryScreen 1, VAR_SPECIAL_x8006, 29
	GetMoveSelection 1, VAR_SPECIAL_x8001
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_x8001, 4
	GoToIfEq _10AB
	BufferPartyMonMoveName 1, VAR_SPECIAL_x8006, VAR_SPECIAL_x8001
	NPCMsg msg_0115_D36R0101_00018
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _10C7
	SetMonMove VAR_SPECIAL_x8006, VAR_SPECIAL_x8001, MOVE_HEADBUTT
	NPCMsg msg_0115_D36R0101_00020
	PlaySE SEQ_SE_DP_KON
	WaitSE SEQ_SE_DP_KON
	Wait 30, VAR_SPECIAL_RESULT
	NPCMsg msg_0115_D36R0101_00024
	Wait 32, VAR_SPECIAL_RESULT
	NPCMsg msg_0115_D36R0101_00025
	PlayFanfare SEQ_ME_LVUP
	WaitFanfare
	Wait 16, VAR_SPECIAL_RESULT
	PlayCry VAR_SPECIAL_x8005, 0
	GoTo _1079

_1041:
	BufferPartyMonNick 0, VAR_SPECIAL_x8006
	SetMonMove VAR_SPECIAL_x8006, VAR_SPECIAL_x8002, MOVE_HEADBUTT
	NPCMsg msg_0115_D36R0101_00021
	Wait 30, VAR_SPECIAL_RESULT
	NPCMsg msg_0115_D36R0101_00026
	PlayFanfare SEQ_ME_LVUP
	WaitFanfare
	Wait 32, VAR_SPECIAL_RESULT
	PlayCry VAR_SPECIAL_x8005, 0
	NPCMsg msg_0115_D36R0101_00022
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	End

_1079:
	NPCMsg msg_0115_D36R0101_00022
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	End

_1086:
	NPCMsg msg_0115_D36R0101_00013
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	End

_1093:
	NPCMsg msg_0115_D36R0101_00013
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	End

_10A0:
	NPCMsg msg_0115_D36R0101_00015
	CloseMsg
	GoTo _0F0B

_10AB:
	NPCMsg msg_0115_D36R0101_00019
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0F99
	GoTo _1086

_10C7:
	NPCMsg msg_0115_D36R0101_00019
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0F99
	GoTo _1086

_10E1:
	BufferMonSpeciesName 0, VAR_SPECIAL_x8006
	NPCMsg msg_0115_D36R0101_00023
	CloseMsg
	GoTo _0F0B
	End

scr_seq_D36R0101_010:
	GoToIfSet FLAG_FOUND_FIRST_FARFETCHD, _1104
	GoTo _1115

_1104:
	GoToIfSet FLAG_FOUND_SECOND_FARFETCHD, _1126
	GoTo _1139

_1115:
	GoToIfSet FLAG_FOUND_SECOND_FARFETCHD, _1139
	GoTo _114C

_1126:
	SimpleNPCMsg msg_0115_D36R0101_00002
	End

_1139:
	SimpleNPCMsg msg_0115_D36R0101_00001
	End

_114C:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0115_D36R0101_00000
	WaitButton
	CloseMsg
	SetVar VAR_UNK_40F4, 0
	ReleaseAll
	End

scr_seq_D36R0101_017:
	ScrCmd_609
	LockAll
	ApplyMovement obj_D36R0101_gsboy1, _118C
	ApplyMovement obj_player, _1194
	WaitMovement
	NPCMsg msg_0115_D36R0101_00000
	WaitButton
	CloseMsg
	SetVar VAR_UNK_40F4, 0
	ReleaseAll
	End

	.balign 4, 0
_118C:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_1194:
	Delay8 2
	FaceNorth
	EndMovement

scr_seq_D36R0101_011:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_HM01, _11F2
	NPCMsg msg_0115_D36R0101_00006
	GoToIfNoItemSpace ITEM_HM01, 1, _11FD
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_HM01
	ClearFlag FLAG_UNK_1AE
	ClearFlag FLAG_UNK_1AC
	NPCMsg msg_0115_D36R0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_11F2:
	NPCMsg msg_0115_D36R0101_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_11FD:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_1207:
	ClearFlag FLAG_HIDE_ILEX_CUT_MASTER
	ShowPerson obj_D36R0101_gsfighter
	ClearFlag FLAG_HIDE_FARFETCHD_2_FOUND
	Wait 20, VAR_SPECIAL_x8004
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_ILEX_FOREST, 0, 15, 65, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Wait 5, VAR_SPECIAL_x8004
	NPCMsg msg_0115_D36R0101_00002
	WaitButton
	CloseMsg
	ApplyMovement obj_D36R0101_gsfighter, _12EC
	ApplyMovement obj_player, _12F8
	WaitMovement
	GoToIfSet FLAG_GOT_HM01, _12BE
	NPCMsg msg_0115_D36R0101_00006
	GoToIfNoItemSpace ITEM_HM01, 1, _12C9
	CallStd std_give_item_verbose
	SetFlag FLAG_HIDE_ILEX_CUT_MASTER
	SetFlag FLAG_HIDE_ILEX_APPRENTICE
	SetFlag FLAG_HIDE_FARFETCHD_1_LOST
	SetFlag FLAG_HIDE_FARFETCHD_2_LOST
	SetFlag FLAG_HIDE_FARFETCHD_1_FOUND
	SetFlag FLAG_HIDE_FARFETCHD_2_FOUND
	SetFlag FLAG_GOT_HM01
	ClearFlag FLAG_UNK_1AE
	ClearFlag FLAG_UNK_1AC
	NPCMsg msg_0115_D36R0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_12BE:
	NPCMsg msg_0115_D36R0101_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_12C9:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_D36R0101_014:
	PlayCry SPECIES_FARFETCHD, 0
	SimpleNPCMsg msg_0115_D36R0101_00004
	End

	.balign 4, 0
_12EC:
	WalkNormalNorth 10
	WalkNormalEast 3
	EndMovement

	.balign 4, 0
_12F8:
	Delay8 12
	FaceWest
	EndMovement

scr_seq_D36R0101_015:
	ScrCmd_609
	LockAll
	CallStd std_play_kimono_girl_music
	ApplyMovement obj_D36R0101_dancer, _1478
	WaitMovement
	GetPlayerCoords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	Compare VAR_SPECIAL_x8004, 40
	GoToIfNe _1337
	ApplyMovement obj_D36R0101_dancer, _1484
	GoTo _133F

_1337:
	ApplyMovement obj_D36R0101_dancer, _1494
_133F:
	WaitMovement
	NPCMsg msg_0115_D36R0101_00029
	CloseMsg
	ApplyMovement obj_D36R0101_dancer, _14A4
	WaitMovement
	NPCMsg msg_0115_D36R0101_00030
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _1371
	NPCMsg msg_0115_D36R0101_00031
	GoTo _1374

_1371:
	NPCMsg msg_0115_D36R0101_00032
_1374:
	CloseMsg
	GetPartyLeadAlive VAR_TEMP_x4000
	GetPartyMonSpecies VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 50
	GoToIfEq _13D5
	Compare VAR_TEMP_x4001, 51
	GoToIfEq _13D5
	Release obj_partner_poke
	Compare VAR_SPECIAL_x8004, 40
	GoToIfNe _13C1
	ApplyMovement obj_player, _14E8
	ApplyMovement obj_partner_poke, _14FC
	GoTo _13C9

_13C1:
	ApplyMovement obj_partner_poke, _1518
_13C9:
	WaitMovement
	Lock obj_partner_poke
	GoTo _140A

_13D5:
	Release obj_partner_poke
	Compare VAR_SPECIAL_x8004, 40
	GoToIfNe _13FC
	ApplyMovement obj_player, _14E8
	ApplyMovement obj_partner_poke, _1538
	GoTo _1404

_13FC:
	ApplyMovement obj_partner_poke, _1550
_1404:
	WaitMovement
	Lock obj_partner_poke
_140A:
	Compare VAR_SPECIAL_x8004, 40
	GoToIfNe _1425
	ApplyMovement obj_D36R0101_dancer, _156C
	GoTo _142D

_1425:
	ApplyMovement obj_D36R0101_dancer, _1574
_142D:
	WaitMovement
	NPCMsg msg_0115_D36R0101_00033
	CloseMsg
	ApplyMovement obj_D36R0101_dancer, _157C
	WaitMovement
	NPCMsg msg_0115_D36R0101_00034
	CloseMsg
	ApplyMovement obj_D36R0101_dancer, _159C
	WaitMovement
	HidePerson obj_D36R0101_dancer
	SetFlag FLAG_UNK_23D
	CallStd std_fade_end_kimono_girl_music
	Release obj_partner_poke
	ApplyMovement obj_partner_poke, _1584
	WaitMovement
	Lock obj_partner_poke
	ReleaseAll
	SetVar VAR_UNK_40E9, 1
	End

	.balign 4, 0
_1478:
	EmoteExclamationMark
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_1484:
	WalkNormalSouth
	WalkNormalEast 2
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_1494:
	WalkNormalSouth
	WalkNormalEast 3
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_14A4:
	FaceWest
	Delay2
	FaceNorth
	Delay2
	FaceEast
	Delay2
	FaceSouth
	Delay2
	FaceWest
	Delay2
	FaceNorth
	Delay2
	FaceEast
	Delay2
	FaceSouth
	Delay2
	EndMovement

	.balign 4, 0
_14E8:
	FaceWest
	LockDir
	WalkNormalEast
	UnlockDir
	EndMovement

	.balign 4, 0
_14FC:
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 2
	WalkNormalWest 3
	WalkOnSpotNormalEast
	JumpOnSpotFastEast 3
	EndMovement

	.balign 4, 0
_1518:
	WalkNormalWest
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 2
	WalkNormalWest 3
	WalkOnSpotNormalEast
	JumpOnSpotFastEast 3
	EndMovement

	.balign 4, 0
_1538:
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 2
	WalkNormalWest 3
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_1550:
	WalkNormalWest
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 2
	WalkNormalWest 3
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_156C:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_1574:
	WalkNormalWest
	EndMovement

	.balign 4, 0
_157C:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_1584:
	WalkNormalEast 3
	WalkNormalSouth 2
	WalkNormalEast
	WalkNormalSouth
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_159C:
	WalkNormalWest 2
	WalkNormalNorth 2
	WalkNormalWest 6
	EndMovement

scr_seq_D36R0101_018:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _16D8
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _16EC
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, DIR_NORTH
	GoToIfNe _1625
	ApplyMovement obj_player, _1700
	ApplyMovement obj_D36R0101_gsmiddleman1, _174C
	GoTo _1677

_1625:
	Compare VAR_SPECIAL_RESULT, DIR_SOUTH
	GoToIfNe _1640
	ApplyMovement obj_player, _1718
	GoTo _1677

_1640:
	Compare VAR_SPECIAL_RESULT, DIR_EAST
	GoToIfNe _1663
	ApplyMovement obj_player, _1738
	ApplyMovement obj_D36R0101_gsmiddleman1, _174C
	GoTo _1677

_1663:
	StopSE SEQ_SE_GS_N_SESERAGI
	ApplyMovement obj_player, _1724
	ApplyMovement obj_D36R0101_gsmiddleman1, _174C
_1677:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _169E
	ApplyMovement obj_partner_poke, _1758
	WaitMovement
_169E:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 8
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

_16D8:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_16EC:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_1700:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_1718:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_1724:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_1738:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_174C:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_1758:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_D36R0101_012:
	PlayerOnBikeCheck VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _1803
	Compare VAR_UNK_412B, 2
	GoToIfGe _17C1
	Compare VAR_UNK_412B, 1
	GoToIfEq _1803
	GetPartyLeadAlive VAR_TEMP_x4000
	FollowerPokeIsEventTrigger EVENT_SPIKY_EARED_PICHU, VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _17B7
	GoTo _17C1

_17B1:
	GoTo _17C1

_17B7:
	ClearFlag FLAG_HIDE_ILEX_FOREST_SPIKY_EAR_PICHU
	GoTo _1816

_17C1:
	Compare VAR_UNK_40FE, 4
	GoToIfGe _1803
	GoToIfUnset FLAG_BEAT_RADIO_TOWER_ROCKETS, _1803
	GetPartyLeadAlive VAR_TEMP_x4006
	FollowerPokeIsEventTrigger EVENT_CELEBI, VAR_TEMP_x4006, VAR_TEMP_x4007
	Compare VAR_TEMP_x4007, 0
	GoToIfNe _17FD
	GoTo _1803

_17F7:
	GoTo _1803

_17FD:
	GoTo _1F48

_1803:
	SimpleNPCMsg msg_0115_D36R0101_00028
	End

_1816:
	ScrCmd_609
	LockAll
	StopBGM 0
	ClearFlag FLAG_HIDE_ILEX_FOREST_SPIKY_EAR_PICHU
	ShowPerson obj_D36R0101_tsure_poke_static_pichu_spiky
	ApplyMovement obj_D36R0101_tsure_poke_static_pichu_spiky, _1C44
	WaitMovement
	PlayCry SPECIES_PICHU, 0
	WaitCry
	ApplyMovement obj_player, _1C58
	WaitMovement
	CallStd std_play_pichu_music
	ApplyMovement obj_D36R0101_tsure_poke_static_pichu_spiky, _1C64
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _1C8C
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0115_D36R0101_00038
	CloseMsg
	ApplyMovement obj_partner_poke, _1CB4
	WaitMovement
	ApplyMovement obj_D36R0101_tsure_poke_static_pichu_spiky, _1CC4
	WaitMovement
	ApplyMovement obj_partner_poke, _1CF8
	WaitMovement
	ApplyMovement obj_D36R0101_tsure_poke_static_pichu_spiky, _1D08
	ApplyMovement obj_partner_poke, _1D2C
	WaitMovement
	ClearFlag FLAG_HIDE_ILEX_FOREST_OLD_MAN
	ShowPerson obj_D36R0101_gsoldman1
	ApplyMovement obj_D36R0101_gsoldman1, _1DE0
	ApplyMovement obj_D36R0101_tsure_poke_static_pichu_spiky, _1D48
	ApplyMovement obj_partner_poke, _1DA4
	WaitMovement
	ApplyMovement obj_player, _1E88
	WaitMovement
	NPCMsg msg_0115_D36R0101_00046
	CloseMsg
	ApplyMovement obj_D36R0101_gsoldman1, _1DF4
	WaitMovement
	NPCMsg msg_0115_D36R0101_00047
	CloseMsg
	ApplyMovement obj_D36R0101_gsoldman1, _1E00
	ApplyMovement obj_D36R0101_tsure_poke_static_pichu_spiky, _1E10
	ApplyMovement obj_player, _1ED0
	WaitMovement
	NPCMsg msg_0115_D36R0101_00048
	CloseMsg
	ApplyMovement obj_D36R0101_tsure_poke_static_pichu_spiky, _1E20
	ApplyMovement obj_partner_poke, _1E2C
	WaitMovement
	NPCMsg msg_0115_D36R0101_00049
	CloseMsg
	ApplyMovement obj_partner_poke, _1E38
	WaitMovement
	ApplyMovement obj_D36R0101_tsure_poke_static_pichu_spiky, _1E40
	WaitMovement
	ApplyMovement obj_partner_poke, _1E48
	WaitMovement
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _1E74
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0115_D36R0101_00039
	PlayCry SPECIES_PICHU, 0
	NPCMsg msg_0115_D36R0101_00043
	WaitCry
	CloseMsg
	Call _1987
	Compare VAR_SPECIAL_x8004, 1
	CallIfGe _1AFB
	Compare VAR_SPECIAL_x8004, 0
	CallIfEq _19AC
	ReleaseAll
	End

_1987:
	GetPartyCount VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 6
	GoToIfLt _19A4
	SetVar VAR_SPECIAL_x8004, 1
	GoTo _19AA

_19A4:
	SetVar VAR_SPECIAL_x8004, 0
_19AA:
	Return

_19AC:
	NPCMsg msg_0115_D36R0101_00052
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _1EB4
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
_19CF:
	GetPlayerFacing VAR_TEMP_x4005
	Compare VAR_TEMP_x4005, 3
	GoToIfNe _19EE
	ApplyMovement obj_D36R0101_gsoldman1, _1E90
	GoTo _19F6

_19EE:
	ApplyMovement obj_D36R0101_gsoldman1, _1E98
_19F6:
	WaitMovement
	PlayFanfare SEQ_ME_ITEM
	BufferPlayersName 0
	NPCMsg msg_0115_D36R0101_00044
	WaitFanfare
	NPCMsg msg_0115_D36R0101_00053
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	Compare VAR_TEMP_x4005, 3
	GoToIfNe _1A2C
	ApplyMovement obj_player, _1ED8
	GoTo _1A34

_1A2C:
	ApplyMovement obj_player, _1EE4
_1A34:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	Compare VAR_TEMP_x4008, 0
	GoToIfNe _1A51
	CallStd std_fade_end_pichu_music
_1A51:
	GiveSpikyEarPichu
	HidePerson obj_D36R0101_tsure_poke_static_pichu_spiky
	SetVar VAR_UNK_412B, 2
	PlayFanfare SEQ_ME_SHINKAOME
	NPCMsg msg_0115_D36R0101_00040
	WaitFanfare
	TouchscreenMenuHide
	NPCMsg msg_0115_D36R0101_00045
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _1AC5
	CloseMsg
	GetPartyCount VAR_TEMP_x4009
	SubVar VAR_TEMP_x4009, 1
	SetVar VAR_TEMP_x400A, 0
	NopVar490 VAR_TEMP_x4009
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	NicknameInput VAR_TEMP_x4009, VAR_TEMP_x400A
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_TEMP_x400A, 1
	GoToIfEq _1AC5
	BufferPartyMonNick 0, VAR_TEMP_x4009
	NPCMsg msg_0115_D36R0101_00054
_1AC5:
	NPCMsg msg_0115_D36R0101_00051
	CloseMsg
	TouchscreenMenuShow
	Compare VAR_TEMP_x4005, 3
	GoToIfNe _1AE7
	ApplyMovement obj_D36R0101_gsoldman1, _1E64
	GoTo _1AEF

_1AE7:
	ApplyMovement obj_D36R0101_gsoldman1, _1E50
_1AEF:
	WaitMovement
	HidePerson obj_D36R0101_gsoldman1
	SetFlag FLAG_HIDE_ILEX_FOREST_OLD_MAN
	Return

_1AFB:
	NPCMsg msg_0115_D36R0101_00050
	WaitButton
	CloseMsg
	Compare VAR_TEMP_x4008, 0
	GoToIfNe _1B13
	CallStd std_fade_end_pichu_music
_1B13:
	SetVar VAR_UNK_412B, 1
	Return

scr_seq_D36R0101_019:
	ScrCmd_609
	LockAll
	SetVar VAR_TEMP_x4008, 1
	GetPlayerFacing VAR_TEMP_x4005
	Compare VAR_TEMP_x4005, 3
	GoToIfNe _1B44
	ApplyMovement obj_D36R0101_tsure_poke_static_pichu_spiky, _1EF0
	GoTo _1B67

_1B44:
	Compare VAR_TEMP_x4005, 2
	GoToIfNe _1B5F
	ApplyMovement obj_D36R0101_tsure_poke_static_pichu_spiky, _1EF8
	GoTo _1B67

_1B5F:
	ApplyMovement obj_D36R0101_tsure_poke_static_pichu_spiky, _1F00
_1B67:
	WaitMovement
	PlayCry SPECIES_PICHU, 0
	NPCMsg msg_0115_D36R0101_00043
	WaitCry
	CloseMsg
	Call _1987
	Compare VAR_SPECIAL_x8004, 1
	GoToIfGe _1C36
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_TEMP_x4005
	Compare VAR_TEMP_x4005, 3
	GoToIfNe _1BB2
	ApplyMovement obj_D36R0101_gsoldman1, _1E90
	GoTo _1BD5

_1BB2:
	Compare VAR_TEMP_x4005, 2
	GoToIfNe _1BCD
	ApplyMovement obj_D36R0101_gsoldman1, _1E98
	GoTo _1BD5

_1BCD:
	ApplyMovement obj_D36R0101_gsoldman1, _1EA0
_1BD5:
	WaitMovement
	NPCMsg msg_0115_D36R0101_00052
	CloseMsg
	GetPlayerFacing VAR_TEMP_x4005
	Compare VAR_TEMP_x4005, 3
	GoToIfNe _1BFB
	ApplyMovement obj_player, _1EA8
	GoTo _1C1E

_1BFB:
	Compare VAR_TEMP_x4005, 2
	GoToIfNe _1C16
	ApplyMovement obj_player, _1EB4
	GoTo _1C1E

_1C16:
	ApplyMovement obj_player, _1EC0
_1C1E:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	Call _19CF
	GoTo _1C3D

_1C36:
	NPCMsg msg_0115_D36R0101_00042
	WaitButton
	CloseMsg
_1C3D:
	ReleaseAll
	End

	.balign 4, 0
_1C44:
	LockDir
	JumpFarEast
	UnlockDir
	JumpOnSpotFastSouth 2
	EndMovement

	.balign 4, 0
_1C58:
	EmoteExclamationMark
	Delay8
	EndMovement

	.balign 4, 0
_1C64:
	WalkFastSouth 7
	JumpOnSpotFastWest
	WalkFastWest 4
	WalkFastNorth 4
	WalkFastEast 4
	WalkFastSouth 4
	WalkFastWest 2
	FaceNorth
	JumpOnSpotFastNorth 2
	EndMovement

	.balign 4, 0
_1C8C:
	Delay8 3
	FaceSouth
	Delay8
	WalkNormalSouth 2
	WalkOnSpotNormalEast
	Delay16
	WalkOnSpotNormalWest
	Delay16
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_1CB4:
	WalkNormalEast
	WalkNormalSouth
	FaceSouth
	EndMovement

	.balign 4, 0
_1CC4:
	LockDir
	JumpNearFastEast
	UnlockDir
	JumpOnSpotFastNorth
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
_1CF8:
	EmoteExclamationMark
	Delay8
	JumpOnSpotFastSouth 2
	EndMovement

	.balign 4, 0
_1D08:
	LockDir
	JumpNearFastSouth
	UnlockDir
	Delay16
	JumpOnSpotFastWest
	WalkFastWest 7
	WalkFastNorth 13
	WalkNormalEast
	EndMovement

	.balign 4, 0
_1D2C:
	Delay16 2
	WalkFastSouth
	WalkFastWest 6
	JumpOnSpotFastNorth
	WalkFastNorth 13
	WalkFastWest
	EndMovement

	.balign 4, 0
_1D48:
	WalkFastSouth 12
	WalkFastEast 6
	WalkFastNorth 4
	WalkFastWest 3
	WalkFastSouth 4
	WalkFastEast 3
	LockDir
	JumpNearFastWest
	UnlockDir
	FaceSouth 6
	LockDir
	WalkSlowWest
	UnlockDir
	FaceWest 6
	FaceNorth 6
	LockDir
	WalkSlowEast
	UnlockDir
	FaceEast 6
	LockDir
	WalkSlowWest
	UnlockDir
	EndMovement

	.balign 4, 0
_1DA4:
	WalkFastSouth 13
	WalkFastEast 7
	JumpOnSpotFastNorth
	JumpOnSpotFastWest
	Delay8 4
	LockDir
	JumpNearFastEast
	UnlockDir
	FaceSouth 6
	FaceEast 6
	FaceNorth 6
	FaceWest 6
	Delay32
	WalkNormalWest
	EndMovement

	.balign 4, 0
_1DE0:
	Delay16 5
	WalkSlowSouth 10
	WalkSlowEast 4
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_1DF4:
	WalkOnSpotNormalNorth
	Delay16
	EndMovement

	.balign 4, 0
_1E00:
	WalkOnSpotNormalSouth
	Delay16
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_1E10:
	Delay16
	WalkOnSpotNormalNorth
	Delay16
	EndMovement

	.balign 4, 0
_1E20:
	JumpOnSpotFastNorth
	JumpOnSpotFastEast
	EndMovement

	.balign 4, 0
_1E2C:
	JumpNearFastWest
	JumpOnSpotFastWest 2
	EndMovement

	.balign 4, 0
_1E38:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_1E40:
	JumpOnSpotFastEast 2
	EndMovement

	.balign 4, 0
_1E48:
	JumpOnSpotFastNorth 2
	EndMovement

	.balign 4, 0
_1E50:
	WalkOnSpotNormalEast
	Delay16
	WalkSlowWest 4
	WalkSlowNorth 10
	EndMovement

	.balign 4, 0
_1E64:
	WalkSlowSouth 2
	WalkSlowWest 4
	WalkSlowNorth 12
	EndMovement

	.balign 4, 0
_1E74:
	EmoteExclamationMark
	Delay8
	WalkNormalSouth
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_1E88:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_1E90:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_1E98:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_1EA0:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_1EA8:
	WalkNormalNorth
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_1EB4:
	WalkNormalNorth
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_1EC0:
	WalkNormalEast
	WalkNormalNorth 2
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_1ED0:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_1ED8:
	WalkNormalSouth
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_1EE4:
	WalkNormalSouth
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_1EF0:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_1EF8:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_1F00:
	WalkOnSpotNormalSouth
	EndMovement

scr_seq_D36R0101_020:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_TEMP_x4008, 1
	Call _1987
	Compare VAR_SPECIAL_x8004, 0
	GoToIfNe _1F35
	Call _1F3F
	GoTo _1F3B

_1F35:
	Call _1AFB
_1F3B:
	ReleaseAll
	End

_1F3F:
	NPCMsg msg_0115_D36R0101_00055
	WaitButton
	CloseMsg
	Return

_1F48:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ApplyMovement obj_partner_poke, _2038
	WaitMovement
	FadeOutBGM 0, 30
	CallStd std_play_friend_music
	TouchscreenMenuHide
	ClearFlag FLAG_HIDE_ILEX_FOREST_FRIEND
	ShowPerson obj_D36R0101_var_1
	ShowPerson obj_D36R0101_tsure_poke_static_marill
	ApplyMovement obj_D36R0101_var_1, _2054
	ApplyMovement obj_D36R0101_tsure_poke_static_marill, _2060
	WaitMovement
	ApplyMovement obj_player, _200C
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0115_D36R0101_00057, msg_0115_D36R0101_00056
	CloseMsg
	CallStd std_fade_end_friend_music
	PlaySE SEQ_SE_GS_SUZUSYUTUGEN_HO
	FadeScreen 6, 6, 0, RGB_WHITE
	WaitFade
	Wait 15, VAR_SPECIAL_RESULT
	FadeScreen 6, 6, 1, RGB_WHITE
	WaitFade
	ApplyMovement obj_player, _2014
	ApplyMovement obj_D36R0101_var_1, _208C
	WaitMovement
	GenderMsgBox msg_0115_D36R0101_00059, msg_0115_D36R0101_00058
	CloseMsg
	PlaySE SEQ_SE_GS_TIMESLIP
	ScrCmd_810
	SetVar VAR_UNK_40FE, 1
	ClearFlag FLAG_HIDE_ROUTE_22_GIOVANNI_RIVAL
	ClearFlag FLAG_HIDE_ROUTE_22_FRIEND
	SetFlag FLAG_HIDE_ILEX_FOREST_FRIEND
	Warp MAP_ROUTE_22, 0, 954, 280, DIR_SOUTH
	FadeScreen 6, 15, 1, RGB_WHITE
	WaitFade
	ReleaseAll
	End

	.balign 4, 0
_200C:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_2014:
	EmoteExclamationMark
	Delay8
	WalkOnSpotNormalNorth
	Delay8
	WalkOnSpotNormalWest
	Delay8
	WalkOnSpotNormalSouth
	Delay8
	EndMovement

	.balign 4, 0
_2038:
	FaceSouth
	FaceSouth
	JumpFarSouth
	LockDir
	JumpNearFastNorth
	LockDir
	EndMovement

	.balign 4, 0
_2054:
	WalkNormalSouth 11
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_2060:
	WalkNormalSouth 8
	WalkOnSpotNormalEast
	WalkNormalEast
	LockDir
	WalkNormalSouth
	Delay8
	UnlockDir
	WalkOnSpotNormalWest
	Delay8
	WalkNormalWest
	EndMovement

	.balign 4, 0
_208C:
	Delay16
	WalkNormalEast 2
	WalkNormalNorth 2
	WalkOnSpotNormalEast
	EndMovement

scr_seq_D36R0101_022:
	ScrCmd_609
	LockAll
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_D36R0101_var_1, _2148
	ApplyMovement obj_player, _21F4
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	GenderMsgBox msg_0115_D36R0101_00061, msg_0115_D36R0101_00060
	CloseMsg
	ApplyMovement obj_D36R0101_tsure_poke_static_marill, _2170
	WaitMovement
	CallStd std_play_friend_music
	ApplyMovement obj_D36R0101_var_1, _215C
	WaitMovement
	GenderMsgBox msg_0115_D36R0101_00063, msg_0115_D36R0101_00062
	CloseMsg
	ApplyMovement obj_D36R0101_var_1, _218C
	WaitMovement
	GenderMsgBox msg_0115_D36R0101_00065, msg_0115_D36R0101_00064
	CloseMsg
	ApplyMovement obj_D36R0101_var_1, _219C
	ApplyMovement obj_D36R0101_tsure_poke_static_marill, _21A4
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0115_D36R0101_00067, msg_0115_D36R0101_00066
	CloseMsg
	ApplyMovement obj_D36R0101_var_1, _21AC
	ApplyMovement obj_D36R0101_tsure_poke_static_marill, _21C4
	WaitMovement
	CallStd std_fade_end_friend_music
	TouchscreenMenuShow
	SetVar VAR_UNK_40FE, 5
	HidePerson obj_D36R0101_var_1
	HidePerson obj_D36R0101_tsure_poke_static_marill
	SetFlag FLAG_HIDE_ILEX_FOREST_FRIEND
	ReleaseAll
	End

	.balign 4, 0
_2148:
	WalkOnSpotNormalWest
	Delay8
	WalkOnSpotNormalEast
	Delay8
	EndMovement

	.balign 4, 0
_215C:
	WalkOnSpotNormalWest
	EmoteExclamationMark
	Delay8
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_2170:
	Delay8
	JumpOnSpotFastEast 2
	LockDir
	JumpNearFastNorth
	JumpNearFastSouth
	UnlockDir
	EndMovement

	.balign 4, 0
_218C:
	WalkNormalWest 3
	Delay16
	JumpOnSpotFastWest 2
	EndMovement

	.balign 4, 0
_219C:
	WalkNormalEast 3
	EndMovement

	.balign 4, 0
_21A4:
	WalkNormalEast 3
	EndMovement

	.balign 4, 0
_21AC:
	WalkNormalWest 4
	WalkNormalNorth 6
	WalkOnSpotNormalSouth
	Delay8 6
	WalkNormalNorth 5
	EndMovement

	.balign 4, 0
_21C4:
	LockDir
	JumpNearFastSouth
	UnlockDir
	WalkOnSpotNormalNorth
	WalkNormalWest 3
	Delay8
	WalkOnSpotNormalEast
	Delay8 4
	WalkOnSpotNormalNorth
	JumpOnSpotFastNorth
	WalkNormalNorth 10
	EndMovement

	.balign 4, 0
_21F4:
	WalkNormalSouth
	Delay8
	EndMovement

scr_seq_D36R0101_013:
	ScrCmd_055 3, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0115_D36R0101_00027, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
