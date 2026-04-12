#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D27R0107.h"
#include "msgdata/msg/msg_0094_D27R0107.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D27R0107_000
	ScrDef scr_seq_D27R0107_001
	ScrDef scr_seq_D27R0107_002
	ScrDef scr_seq_D27R0107_003
	ScrDef scr_seq_D27R0107_004
	ScrDefEnd

scr_seq_D27R0107_003:
	SetVar VAR_UNK_4125, 0
	End

scr_seq_D27R0107_004:
	GoToIfSet FLAG_UNK_1D8, _002D
	MakeObjectVisible obj_D27R0107_stop
_002D:
	End

scr_seq_D27R0107_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_SECRETPOTION, _00B5
	Compare VAR_SCENE_LIGHTHOUSE_JASMINE, 0
	GoToIfEq _0062
	NPCMsg msg_0094_D27R0107_00001
	CloseMsg
	ApplyMovement obj_D27R0107_gsleader6, _01B0
	WaitMovement
	ReleaseAll
	End

_0062:
	NPCMsg msg_0094_D27R0107_00000
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 56
	ApplyMovement obj_player, _01D0
	ApplyMovement obj_D27R0107_gsleader6, _01B8
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	PlaySE SEQ_SE_DP_DOOR
	HidePerson obj_D27R0107_stop
	HidePerson obj_D27R0107_babyboy1_8
	WaitSE SEQ_SE_DP_DOOR
	ApplyMovement obj_D27R0107_gsleader6, _01F0
	WaitMovement
	ReleaseAll
	SetVar VAR_SCENE_LIGHTHOUSE_JASMINE, 1
	SetFlag FLAG_UNK_1D8
	End

_00B5:
	NPCMsg msg_0094_D27R0107_00002
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _017F
	TakeItem ITEM_SECRETPOTION, 1, VAR_SPECIAL_RESULT
	BufferPlayersName 0
	NPCMsg msg_0094_D27R0107_00003
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	NPCMsg msg_0094_D27R0107_00004
	CloseMsg
	ApplyMovement obj_D27R0107_gsleader6, _01B0
	WaitMovement
	NPCMsg msg_0094_D27R0107_00005
	CloseMsg
	ApplyMovement obj_D27R0107_tsure_poke_static_ampharos, _01A0
	WaitMovement
	PlayCry SPECIES_AMPHAROS, 0
	NPCMsg msg_0094_D27R0107_00006
	WaitCry
	CloseMsg
	ScrCmd_459
	ApplyMovement obj_D27R0107_tsure_poke_static_ampharos, _01A8
	WaitMovement
	PlayCry SPECIES_AMPHAROS, 0
	WaitCry
	NPCMsg msg_0094_D27R0107_00007
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 56
	ApplyMovement obj_player, _0218
	ApplyMovement obj_D27R0107_gsleader6, _0200
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	HidePerson obj_D27R0107_gsleader6
	ReleaseAll
	SetFlag FLAG_UNK_96A
	SetVar VAR_SCENE_LIGHTHOUSE_JASMINE, 2
	SetVar VAR_UNK_410E, 1
	SetFlag FLAG_UNK_1D7
	ClearFlag FLAG_HIDE_JASMINE_IN_GYM
	SetFlag FLAG_UNK_1DA
	SetFlag FLAG_UNK_1DB
	ClearFlag FLAG_HIDE_OLIVINE_GYM_GENTLEMAN
	ClearFlag FLAG_HIDE_OLIVINE_GYM_GIRL
	SetFlag FLAG_UNK_998
	End

_017F:
	NPCMsg msg_0094_D27R0107_00008
	CloseMsg
	ApplyMovement obj_D27R0107_gsleader6, _01B0
	WaitMovement
	NPCMsg msg_0094_D27R0107_00009
	CloseMsg
	PlayCry SPECIES_AMPHAROS, 12
	WaitCry
	ReleaseAll
	End

	.balign 4, 0
_01A0:
	WalkOnSpotSlowWest
	EndMovement

	.balign 4, 0
_01A8:
	JumpOnSpotFastWest 3
	EndMovement

	.balign 4, 0
_01B0:
	WalkOnSpotSlowEast
	EndMovement

	.balign 4, 0
_01B8:
	Delay8
	WalkNormalSouth 3
	WalkNormalEast
	WalkOnSpotNormalSouth
	Delay16
	EndMovement

	.balign 4, 0
_01D0:
	FaceWest
	LockDir
	WalkNormalEast
	UnlockDir
	Delay8 3
	Delay4
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01F0:
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0200:
	Delay8
	WalkNormalSouth
	WalkNormalEast 2
	WalkOnSpotNormalSouth
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_0218:
	FaceNorth
	LockDir
	WalkNormalSouth
	UnlockDir
	Delay8 2
	Delay4
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0238:
	WalkSlowWest 2
	EndMovement

scr_seq_D27R0107_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_LIGHTHOUSE_JASMINE, 2
	GoToIfLt _0266
	PlayCry SPECIES_AMPHAROS, 0
	NPCMsg msg_0094_D27R0107_00012
	WaitCry
	GoTo _0274

_0266:
	PlayCry SPECIES_AMPHAROS, 12
	NPCMsg msg_0094_D27R0107_00010
	WaitCry
	NPCMsg msg_0094_D27R0107_00011
_0274:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D27R0107_002:
	End
	.balign 4, 0
