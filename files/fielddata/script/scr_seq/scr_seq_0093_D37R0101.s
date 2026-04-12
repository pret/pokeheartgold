#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D37R0101.h"
#include "msgdata/msg/msg_0116_D37R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D37R0101_000
	ScrDef scr_seq_D37R0101_001
	ScrDef scr_seq_D37R0101_002
	ScrDef scr_seq_D37R0101_003
	ScrDefEnd

scr_seq_D37R0101_003:
	GetFriendSprite VAR_OBJ_0
	End

scr_seq_D37R0101_002:
	ScrCmd_609
	LockAll
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 3
	GoToIfEq _0228
	ClearFlag FLAG_HIDE_GOLDENROD_UNDERGROUND_FRIEND
	ShowPerson obj_D37R0101_tsure_poke_static_marill
	Compare VAR_TEMP_x4001, 30
	GoToIfNe _0050
	MovePersonFacing obj_D37R0101_tsure_poke_static_marill, 9, 0, 25, DIR_WEST
_0050:
	PlaySE SEQ_SE_DP_KAIDAN2
	ApplyMovement obj_D37R0101_tsure_poke_static_marill, _0174
	WaitMovement
	Wait 8, VAR_SPECIAL_RESULT
	PlayCry SPECIES_MARILL, 0
	WaitCry
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _01BC
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ClearFlag FLAG_HIDE_GOLDENROD_UNDERGROUND_FRIEND
	ShowPerson obj_D37R0101_var_1
	Compare VAR_TEMP_x4001, 30
	GoToIfNe _00AB
	MovePersonFacing obj_D37R0101_var_1, 9, 0, 25, DIR_WEST
_00AB:
	PlaySE SEQ_SE_DP_KAIDAN2
	CallStd std_play_friend_music
	ApplyMovement obj_D37R0101_var_1, _01C4
	WaitMovement
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00EE
	ApplyMovement obj_D37R0101_tsure_poke_static_marill, _0218
	ApplyMovement obj_player, _0218
	ApplyMovement obj_partner_poke, _0218
	WaitMovement
	GoTo _0100

_00EE:
	ApplyMovement obj_D37R0101_tsure_poke_static_marill, _0218
	ApplyMovement obj_player, _0218
	WaitMovement
_0100:
	BufferPlayersName 0
	GenderMsgBox msg_0116_D37R0101_00006, msg_0116_D37R0101_00009
	CloseMsg
	ApplyMovement obj_D37R0101_var_1, _01D0
	ApplyMovement obj_D37R0101_tsure_poke_static_marill, _01E0
	WaitMovement
	GenderMsgBox msg_0116_D37R0101_00007, msg_0116_D37R0101_00010
	GiveItemNoCheck ITEM_FASHION_CASE, 1
	Call _0354
	GenderMsgBox msg_0116_D37R0101_00008, msg_0116_D37R0101_00011
	CloseMsg
	ApplyMovement obj_D37R0101_var_1, _01F0
	ApplyMovement obj_D37R0101_tsure_poke_static_marill, _0204
	WaitMovement
	PlaySE SEQ_SE_DP_KAIDAN2
	SetFlag FLAG_HIDE_GOLDENROD_UNDERGROUND_FRIEND
	HidePerson obj_D37R0101_var_1
	HidePerson obj_D37R0101_tsure_poke_static_marill
	WaitSE SEQ_SE_DP_KAIDAN2
	CallStd std_fade_end_friend_music
	SetVar VAR_UNK_40F8, 1
	SetFlag FLAG_UNK_14C
	ReleaseAll
	End

	.balign 4, 0
_0174:
	WalkSlightlyFastWest
	WalkOnSpotFastEast
	JumpOnSpotFastWest 2
	WalkFastWest 3
	FaceNorth
	Delay1
	FaceEast
	Delay1
	FaceSouth
	Delay1
	FaceWest
	Delay1
	FaceNorth
	Delay1
	FaceEast
	Delay1
	FaceSouth
	EndMovement

	.balign 4, 0
_01BC:
	WalkNormalNorth 3
	EndMovement

	.balign 4, 0
_01C4:
	WalkNormalWest
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_01D0:
	WalkNormalWest
	WalkNormalSouth 2
	WalkNormalWest
	EndMovement

	.balign 4, 0
_01E0:
	Delay8 3
	WalkNormalEast
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_01F0:
	WalkNormalSouth 2
	WalkNormalWest
	WalkNormalSouth
	SetInvisible
	EndMovement

	.balign 4, 0
_0204:
	WalkNormalSouth 3
	WalkNormalWest
	WalkNormalSouth
	SetInvisible
	EndMovement

	.balign 4, 0
_0218:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0220:
	WalkOnSpotNormalSouth
	EndMovement

_0228:
	ClearFlag FLAG_HIDE_GOLDENROD_UNDERGROUND_FRIEND
	ShowPerson obj_D37R0101_var_1
	ClearFlag FLAG_HIDE_GOLDENROD_UNDERGROUND_FRIEND
	ShowPerson obj_D37R0101_tsure_poke_static_marill
	Lock obj_D37R0101_tsure_poke_static_marill
	CallStd std_play_friend_music
	MovePersonFacing obj_D37R0101_var_1, 25, 0, 9, DIR_NORTH
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	ApplyMovement obj_player, _0220
	ApplyMovement obj_D37R0101_var_1, _0308
	WaitMovement
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0310
	ApplyMovement obj_D37R0101_var_1, _0318
	Wait 8, VAR_SPECIAL_RESULT
	MovePersonFacing obj_D37R0101_tsure_poke_static_marill, 25, 0, 9, DIR_NORTH
	ApplyMovement obj_D37R0101_tsure_poke_static_marill, _0320
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	BufferPlayersName 0
	GenderMsgBox msg_0116_D37R0101_00006, msg_0116_D37R0101_00009
	GenderMsgBox msg_0116_D37R0101_00007, msg_0116_D37R0101_00010
	GiveItemNoCheck ITEM_FASHION_CASE, 1
	Call _0354
	GenderMsgBox msg_0116_D37R0101_00008, msg_0116_D37R0101_00011
	CloseMsg
	ApplyMovement obj_D37R0101_var_1, _0328
	ApplyMovement obj_D37R0101_tsure_poke_static_marill, _033C
	WaitMovement
	PlaySE SEQ_SE_DP_KAIDAN2
	SetFlag FLAG_HIDE_GOLDENROD_UNDERGROUND_FRIEND
	HidePerson obj_D37R0101_var_1
	HidePerson obj_D37R0101_tsure_poke_static_marill
	WaitSE SEQ_SE_DP_KAIDAN2
	CallStd std_fade_end_friend_music
	SetVar VAR_UNK_40F8, 1
	SetFlag FLAG_UNK_14C
	ReleaseAll
	End

	.balign 4, 0
_0308:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0310:
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_0318:
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_0320:
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0328:
	WalkNormalEast
	WalkNormalNorth 4
	WalkNormalWest 2
	SetInvisible
	EndMovement

	.balign 4, 0
_033C:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 4
	WalkNormalWest 2
	SetInvisible
	EndMovement

_0354:
	Call _03A8
	Call _03A8
	Call _03A8
	Call _03A8
	Call _03A8
	Call _03C2
	Call _03C2
	Call _03C2
	Call _03C2
	Call _03C2
	ScrCmd_406 0
	SetVar VAR_TEMP_x4001, 9999
	Call _03DC
	Call _03DC
	Return

_03A8:
	Random VAR_SPECIAL_RESULT, 6
	SetVar VAR_SPECIAL_x8004, 0
	AddVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	ScrCmd_403 VAR_SPECIAL_x8004, 1
	Return

_03C2:
	Random VAR_SPECIAL_RESULT, 6
	SetVar VAR_SPECIAL_x8004, 18
	AddVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	ScrCmd_403 VAR_SPECIAL_x8004, 1
	Return

_03DC:
	Random VAR_SPECIAL_RESULT, 8
	Compare VAR_TEMP_x4001, VAR_SPECIAL_RESULT
	GoToIfEq _03DC
	CopyVar VAR_TEMP_x4001, VAR_SPECIAL_RESULT
	SetVar VAR_SPECIAL_x8004, 1
	AddVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	ScrCmd_406 VAR_SPECIAL_x8004
	Return

scr_seq_D37R0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 2
	GoToIfNe _0425
	NPCMsg msg_0116_D37R0101_00002
	GoTo _0454

_0425:
	Compare VAR_SCENE_ROCKET_TAKEOVER, 4
	GoToIfNe _043B
	NPCMsg msg_0116_D37R0101_00002
	GoTo _0454

_043B:
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _0451
	NPCMsg msg_0116_D37R0101_00001
	GoTo _0454

_0451:
	NPCMsg msg_0116_D37R0101_00000
_0454:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D37R0101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 2
	GoToIfNe _047A
	NPCMsg msg_0116_D37R0101_00005
	GoTo _04A9

_047A:
	Compare VAR_SCENE_ROCKET_TAKEOVER, 4
	GoToIfNe _0490
	NPCMsg msg_0116_D37R0101_00005
	GoTo _04A9

_0490:
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _04A6
	NPCMsg msg_0116_D37R0101_00004
	GoTo _04A9

_04A6:
	NPCMsg msg_0116_D37R0101_00003
_04A9:
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
