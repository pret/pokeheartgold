#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_P01R0102.h"
#include "msgdata/msg/msg_0256_P01R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_P01R0102_000
	ScrDef scr_seq_P01R0102_001
	ScrDef scr_seq_P01R0102_002
	ScrDef scr_seq_P01R0102_003
	ScrDef scr_seq_P01R0102_004
	ScrDef scr_seq_P01R0102_005
	ScrDef scr_seq_P01R0102_006
	ScrDefEnd

scr_seq_P01R0102_001:
	Compare VAR_BOAT_DIRECTION, 2
	GoToIfEq _002D
	End

_002D:
	MovePersonFacing obj_P01R0102_seaman_2, 28, 0, 22, DIR_WEST
	End

scr_seq_P01R0102_005:
	ScrCmd_582 MAP_OLIVINE, 279, 276
	GoToIfUnset FLAG_UNK_189, _0054
	ClearFlag FLAG_UNK_189
	End

_0054:
	CheckRegisteredPhoneNumber PHONE_CONTACT_SABRINA, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _0097
	CheckBadge BADGE_MARSH, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfEq _0080
	GoTo _00C1

_0080:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 5
	GoToIfNe _00C1
	ClearFlag FLAG_UNK_2C9
	End

_0097:
	GetPhoneBookRematch PHONE_CONTACT_SABRINA, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _00C1
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfNe _00C1
	ClearFlag FLAG_UNK_2C9
	End

_00C1:
	SetFlag FLAG_UNK_2C9
	End

scr_seq_P01R0102_002:
	ScrCmd_609
	LockAll
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0104
	WaitMovement
	ApplyMovement obj_P01R0102_seaman_2, _010C
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	SetVar VAR_BOAT_DIRECTION, 0
	ClearFlag FLAG_UNK_092
	ReleaseAll
	End

	.balign 4, 0
_0104:
	WalkNormalSouth 3
	EndMovement

	.balign 4, 0
_010C:
	WalkNormalWest
	WalkOnSpotNormalSouth
	EndMovement

scr_seq_P01R0102_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0256_P01R0102_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_P01R0102_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0256_P01R0102_00003
	CloseMsg
	ApplyMovement obj_P01R0102_gswoman2, _0144
	WaitMovement
	ReleaseAll
	End

	.balign 4, 0
_0144:
	WalkOnSpotNormalNorth
	EndMovement

scr_seq_P01R0102_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_BOAT_ARRIVED, _0211
	NPCMsg msg_0256_P01R0102_00000
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _0197
	ApplyMovement obj_P01R0102_seaman_2, _021C
	WaitMovement
	ApplyMovement obj_player, _024C
	GoTo _01F3

_0197:
	Compare VAR_TEMP_x4000, 3
	GoToIfNe _01BC
	ApplyMovement obj_P01R0102_seaman_2, _022C
	WaitMovement
	ApplyMovement obj_player, _025C
	GoTo _01F3

_01BC:
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _01E1
	ApplyMovement obj_P01R0102_seaman_2, _023C
	WaitMovement
	ApplyMovement obj_player, _026C
	GoTo _01F3

_01E1:
	ApplyMovement obj_P01R0102_seaman_2, _023C
	WaitMovement
	ApplyMovement obj_player, _026C
_01F3:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	PlaySE SEQ_SE_DP_KAIDAN2
	ScrCmd_723 0, 0, 307, 24, 19
	ReleaseAll
	End

_0211:
	NPCMsg msg_0256_P01R0102_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_021C:
	FaceWest
	WalkNormalWest
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_022C:
	FaceEast
	WalkNormalEast
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_023C:
	FaceEast
	WalkNormalEast
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_024C:
	WalkNormalWest
	FaceNorth
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_025C:
	WalkNormalEast
	FaceNorth
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_026C:
	WalkNormalNorth 2
	EndMovement

scr_seq_P01R0102_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckRegisteredPhoneNumber PHONE_CONTACT_SABRINA, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _0322
	Compare VAR_TEMP_x4004, 1
	GoToIfGe _0317
	NPCMsg msg_0256_P01R0102_00004
_029F:
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _02C3
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfGe _0306
	End

_02C3:
	BufferPlayersName 0
	NPCMsg msg_0256_P01R0102_00005
	PlayFanfare SEQ_ME_POKEGEAR_REGIST
	WaitFanfare
	RegisterGearNumber PHONE_CONTACT_SABRINA
	NPCMsg msg_0256_P01R0102_00006
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	SetFlag FLAG_UNK_2C9
	HidePerson obj_P01R0102_gsleader10
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_0306:
	SetVar VAR_TEMP_x4004, 1
	NPCMsg msg_0256_P01R0102_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0317:
	NPCMsg msg_0256_P01R0102_00008
	GoTo _029F
	End

_0322:
	NPCMsg msg_0256_P01R0102_00009
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0383
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _038E
	NPCMsg msg_0256_P01R0102_00010
	CloseMsg
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 88
	FacePlayer
	LockAll
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ClearFlag FLAG_UNK_189
	NPCMsg msg_0256_P01R0102_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0383:
	NPCMsg msg_0256_P01R0102_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

_038E:
	NPCMsg msg_0256_P01R0102_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
