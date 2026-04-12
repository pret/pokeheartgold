#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T01R0301.h"
#include "msgdata/msg/msg_0451_T01R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T01R0301_000
	ScrDef scr_seq_T01R0301_001
	ScrDef scr_seq_T01R0301_002
	ScrDef scr_seq_T01R0301_003
	ScrDef scr_seq_T01R0301_004
	ScrDef scr_seq_T01R0301_005
	ScrDef scr_seq_T01R0301_006
	ScrDef scr_seq_T01R0301_007
	ScrDef scr_seq_T01R0301_008
	ScrDef scr_seq_T01R0301_009
	ScrDef scr_seq_T01R0301_010
	ScrDefEnd

scr_seq_T01R0301_010:
	Compare VAR_UNK_4131, 3
	GoToIfEq _0057
	Compare VAR_UNK_4131, 4
	GoToIfEq _0057
	Compare VAR_UNK_4131, 5
	GoToIfEq _0057
	End

_0057:
	SetFlag FLAG_HIDE_OAKS_LAB_BULBASAUR_BALL
	SetFlag FLAG_HIDE_OAKS_LAB_SQUIRTLE_BALL
	SetFlag FLAG_HIDE_OAKS_LAB_CHARMANDER_BALL
	SetVar VAR_UNK_4131, 6
	End

scr_seq_T01R0301_006:
	ScrCmd_609
	LockAll
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _00C8
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0451_T01R0301_00039, msg_0451_T01R0301_00040
	CloseMsg
	ApplyMovement obj_T01R0301_ookido, _00E0
	WaitMovement
	NPCMsg msg_0451_T01R0301_00041
	CloseMsg
	ApplyMovement obj_T01R0301_ookido, _00F4
	ApplyMovement obj_player, _00D0
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0451_T01R0301_00042
	WaitButton
	CloseMsg
	SetVar VAR_UNK_4131, 2
	ReleaseAll
	End

	.balign 4, 0
_00C8:
	WalkNormalNorth 5
	EndMovement

	.balign 4, 0
_00D0:
	Delay8 2
	WalkNormalNorth 3
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_00E0:
	FaceNorth
	Delay8 4
	FaceSouth
	Delay8 3
	EndMovement

	.balign 4, 0
_00F4:
	WalkNormalNorth
	WalkNormalWest 3
	FaceEast
	EndMovement

scr_seq_T01R0301_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_4096, 2
	GoToIfEq _0282
	Compare VAR_UNK_4131, 3
	GoToIfEq _0277
	Compare VAR_UNK_4131, 4
	GoToIfEq _0277
	Compare VAR_UNK_4131, 5
	GoToIfEq _0277
	Compare VAR_UNK_4131, 2
	GoToIfEq _026C
	Compare VAR_SCENE_EMBEDDED_TOWER, 7
	GoToIfEq _04B1
	Compare VAR_SCENE_EMBEDDED_TOWER, 5
	GoToIfEq _04A6
	Compare VAR_SCENE_EMBEDDED_TOWER, 4
	GoToIfEq _02CB
	GoToIfSet FLAG_GOT_HM08, _01B2
	GoToIfSet FLAG_UNK_12A, _0195
	BufferPlayersName 0
	GenderMsgBox msg_0451_T01R0301_00000, msg_0451_T01R0301_00001
	SetFlag FLAG_UNK_12A
_0195:
	Compare VAR_UNK_4135, 0
	GoToIfNe _01AB
	NPCMsg msg_0451_T01R0301_00008
	GoTo _01B2

_01AB:
	BufferPlayersName 0
	GenderMsgBox msg_0451_T01R0301_00009, msg_0451_T01R0301_00010
_01B2:
	GoToIfSet FLAG_SYS_OAK_ACKNOWLEDGED_NATIONAL_DEX_COMPLETION, _01F2
	CallStd std_in_person_evaluate_dex
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01EC
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _01EC
	CheckNationalDexComplete VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _01F0
_01EC:
	ReleaseAll
	End

_01F0:
	WaitABPress
_01F2:
	SetFlag FLAG_SYS_OAK_ACKNOWLEDGED_NATIONAL_DEX_COMPLETION
	BufferPlayersName 0
	GenderMsgBox msg_0451_T01R0301_00004, msg_0451_T01R0301_00005
	NPCMsg msg_0451_T01R0301_00028
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0256
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0261
	NPCMsg msg_0451_T01R0301_00029
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 90
	FacePlayer
	LockAll
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	NPCMsg msg_0451_T01R0301_00030
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0256:
	NPCMsg msg_0451_T01R0301_00031
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0261:
	NPCMsg msg_0451_T01R0301_00032
	WaitButton
	CloseMsg
	ReleaseAll
	End

_026C:
	NPCMsg msg_0451_T01R0301_00042
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0277:
	NPCMsg msg_0451_T01R0301_00053
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0282:
	GoToIfSet FLAG_GOT_HM08, _02C0
	NPCMsg msg_0451_T01R0301_00055
	GiveItemNoCheck ITEM_HM08, 1
	NPCMsg msg_0451_T01R0301_00056
	BufferPlayersName 0
	GenderMsgBox msg_0451_T01R0301_00006, msg_0451_T01R0301_00007
	SetVar VAR_UNK_4110, 2
	SetFlag FLAG_UNLOCKED_MT_SILVER
	WaitButton
	CloseMsg
	SetFlag FLAG_GOT_HM08
	ReleaseAll
	End

_02C0:
	NPCMsg msg_0451_T01R0301_00057
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02CB:
	CheckKyogreGroudonInParty VAR_SPECIAL_x8005
	Compare VAR_SPECIAL_x8005, 1
	GoToIfEq _040D
	GoToIfSet FLAG_UNK_0BC, _03DE
	BufferPlayersName 0
	GenderMsgBox msg_0451_T01R0301_00011, msg_0451_T01R0301_00012
	CloseMsg
	ApplyMovement obj_T01R0301_ookido, _04D4
	WaitMovement
	SetFlag FLAG_UNK_0BC
	NPCMsg msg_0451_T01R0301_00013
	CloseMsg
	GetPlayerFacing VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _0320
	GoTo _035A

_031A:
	GoTo _0358

_0320:
	Compare VAR_TEMP_x4001, 3
	GoToIfNe _0339
	GoTo _037B

_0333:
	GoTo _0358

_0339:
	Compare VAR_TEMP_x4001, 2
	GoToIfNe _0352
	GoTo _039C

_034C:
	GoTo _0358

_0352:
	GoTo _03BD

_0358:
	WaitMovement
_035A:
	ApplyMovement obj_T01R0301_ookido, _0500
	WaitMovement
	NPCMsg msg_0451_T01R0301_00014
	CloseMsg
	ApplyMovement obj_T01R0301_ookido, _0500
	WaitMovement
	GoTo _03DE
	End

_037B:
	ApplyMovement obj_T01R0301_ookido, _052C
	WaitMovement
	NPCMsg msg_0451_T01R0301_00014
	CloseMsg
	ApplyMovement obj_T01R0301_ookido, _052C
	WaitMovement
	GoTo _03DE
	End

_039C:
	ApplyMovement obj_T01R0301_ookido, _0558
	WaitMovement
	NPCMsg msg_0451_T01R0301_00014
	CloseMsg
	ApplyMovement obj_T01R0301_ookido, _0558
	WaitMovement
	GoTo _03DE
	End

_03BD:
	ApplyMovement obj_T01R0301_ookido, _0584
	WaitMovement
	NPCMsg msg_0451_T01R0301_00014
	CloseMsg
	ApplyMovement obj_T01R0301_ookido, _0584
	WaitMovement
	GoTo _03DE
	End

_03DE:
	GetGameVersion VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 8
	GoToIfEq _03FE
	BufferPlayersName 0
	GenderMsgBox msg_0451_T01R0301_00015, msg_0451_T01R0301_00016
	CloseMsg
	GoTo _01B2

_03FE:
	BufferPlayersName 0
	GenderMsgBox msg_0451_T01R0301_00017, msg_0451_T01R0301_00018
	CloseMsg
	GoTo _01B2

_040D:
	GoToIfUnset FLAG_UNK_0BC, _04C2
	BufferPlayersName 0
	GenderMsgBox msg_0451_T01R0301_00019, msg_0451_T01R0301_00020
	CloseMsg
_0421:
	GetPlayerFacing VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _0440
	ApplyMovement obj_T01R0301_ookido, _0500
	GoTo _047E

_0440:
	Compare VAR_TEMP_x4001, 3
	GoToIfNe _045B
	ApplyMovement obj_T01R0301_ookido, _052C
	GoTo _047E

_045B:
	Compare VAR_TEMP_x4001, 2
	GoToIfNe _0476
	ApplyMovement obj_T01R0301_ookido, _0558
	GoTo _047E

_0476:
	ApplyMovement obj_T01R0301_ookido, _0584
_047E:
	WaitMovement
	BufferPlayersName 0
	GiveItemNoCheck ITEM_JADE_ORB, 1
	CloseMsg
	NPCMsg msg_0451_T01R0301_00021
	CloseMsg
	SetVar VAR_SCENE_EMBEDDED_TOWER, 5
	GoTo _01B2

_04A6:
	NPCMsg msg_0451_T01R0301_00022
	CloseMsg
	GoTo _01B2

_04B1:
	NPCMsg msg_0451_T01R0301_00023
	CloseMsg
	SetVar VAR_SCENE_EMBEDDED_TOWER, 8
	GoTo _01B2

_04C2:
	BufferPlayersName 0
	GenderMsgBox msg_0451_T01R0301_00024, msg_0451_T01R0301_00025
	CloseMsg
	GoTo _0421

	.balign 4, 0
_04D4:
	EmoteExclamationMark
	Delay8
	EndMovement

	.balign 4, 0
_04E0:
	WalkOnSpotNormalNorth
	WalkSlowNorth 2
	Delay8 4
	WalkOnSpotNormalSouth
	Delay8 4
	WalkSlowSouth 2
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0500:
	WalkOnSpotNormalSouth
	Delay8
	EndMovement

	.balign 4, 0
_050C:
	WalkOnSpotNormalEast
	WalkSlowEast 2
	Delay8 4
	WalkOnSpotNormalWest
	Delay8 4
	WalkSlowWest 2
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_052C:
	WalkOnSpotNormalWest
	Delay8
	EndMovement

	.balign 4, 0
_0538:
	WalkOnSpotNormalWest
	WalkSlowWest 2
	Delay8 4
	WalkOnSpotNormalEast
	Delay8 4
	WalkSlowEast 2
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0558:
	WalkOnSpotNormalEast
	Delay8
	EndMovement

	.balign 4, 0
_0564:
	WalkOnSpotNormalSouth
	WalkSlowSouth 2
	Delay8 4
	WalkOnSpotNormalNorth
	Delay8 4
	WalkSlowNorth 2
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0584:
	WalkOnSpotNormalNorth
	Delay8
	EndMovement

scr_seq_T01R0301_001:
	SimpleNPCMsg msg_0451_T01R0301_00033
	End

scr_seq_T01R0301_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	BufferPlayersName 0
	NPCMsg msg_0451_T01R0301_00034
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T01R0301_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	BufferPlayersName 0
	NPCMsg msg_0451_T01R0301_00035
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T01R0301_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0451_T01R0301_00036
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T01R0301_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	BufferPlayersName 0
	GenderMsgBox msg_0451_T01R0301_00037, msg_0451_T01R0301_00038
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T01R0301_007:
	Compare VAR_UNK_4131, 6
	GoToIfEq _0979
	Compare VAR_UNK_4131, 0
	GoToIfEq _097B
	Compare VAR_UNK_4131, 3
	GoToIfEq _097B
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_4131, 4
	GoToIfEq _097D
	Compare VAR_UNK_4131, 5
	GoToIfEq _097D
	GetPersonCoords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4000, 8
	GoToIfNe _0663
	ApplyMovement obj_T01R0301_ookido, _09C4
	GoTo _066B

_0663:
	ApplyMovement obj_T01R0301_ookido, _09BC
_066B:
	WaitMovement
	ScrCmd_452 SPECIES_BULBASAUR, 0
	PlayCry SPECIES_BULBASAUR, 0
	NPCMsg msg_0451_T01R0301_00045
	WaitCry
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _096C
	SetVar VAR_SPECIAL_x8004, 1
	SetVar VAR_SPECIAL_x8006, 3
	Call _0801
	End

scr_seq_T01R0301_008:
	Compare VAR_UNK_4131, 6
	GoToIfEq _0979
	Compare VAR_UNK_4131, 0
	GoToIfEq _097B
	Compare VAR_UNK_4131, 4
	GoToIfEq _097B
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_4131, 3
	GoToIfEq _097D
	Compare VAR_UNK_4131, 5
	GoToIfEq _097D
	GetPersonCoords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4000, 8
	GoToIfNe _0711
	ApplyMovement obj_T01R0301_ookido, _09C4
	GoTo _0719

_0711:
	ApplyMovement obj_T01R0301_ookido, _09BC
_0719:
	WaitMovement
	ScrCmd_452 SPECIES_SQUIRTLE, 0
	PlayCry SPECIES_SQUIRTLE, 0
	NPCMsg msg_0451_T01R0301_00044
	WaitCry
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _096C
	SetVar VAR_SPECIAL_x8004, 7
	SetVar VAR_SPECIAL_x8006, 4
	Call _0801
	End

scr_seq_T01R0301_009:
	Compare VAR_UNK_4131, 6
	GoToIfEq _0979
	Compare VAR_UNK_4131, 0
	GoToIfEq _097B
	Compare VAR_UNK_4131, 5
	GoToIfEq _097B
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_4131, 3
	GoToIfEq _097D
	Compare VAR_UNK_4131, 4
	GoToIfEq _097D
	GetPersonCoords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4000, 8
	GoToIfNe _07BF
	ApplyMovement obj_T01R0301_ookido, _09C4
	GoTo _07C7

_07BF:
	ApplyMovement obj_T01R0301_ookido, _09BC
_07C7:
	WaitMovement
	ScrCmd_452 SPECIES_CHARMANDER, 0
	PlayCry SPECIES_CHARMANDER, 0
	NPCMsg msg_0451_T01R0301_00043
	WaitCry
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _096C
	SetVar VAR_SPECIAL_x8004, 4
	SetVar VAR_SPECIAL_x8006, 5
	Call _0801
	End

_0801:
	ScrCmd_453
	GetPartyCount VAR_SPECIAL_x8005
	Compare VAR_SPECIAL_x8005, 6
	GoToIfEq _098B
	Compare VAR_SPECIAL_x8004, 1
	GoToIfNe _082F
	HidePerson obj_T01R0301_monstarball_3
	SetFlag FLAG_HIDE_OAKS_LAB_BULBASAUR_BALL
	GoTo _0852

_082F:
	Compare VAR_SPECIAL_x8004, 7
	GoToIfNe _084A
	HidePerson obj_T01R0301_monstarball_2
	SetFlag FLAG_HIDE_OAKS_LAB_SQUIRTLE_BALL
	GoTo _0852

_084A:
	HidePerson obj_T01R0301_monstarball
	SetFlag FLAG_HIDE_OAKS_LAB_CHARMANDER_BALL
_0852:
	BufferPlayersName 0
	BufferSpeciesName 1, VAR_SPECIAL_x8004, 0, 0
	NPCMsg msg_0451_T01R0301_00046
	NPCMsg msg_0451_T01R0301_00048
	PlayFanfare SEQ_ME_POKEGET
	WaitFanfare
	GiveMon VAR_SPECIAL_x8004, 5, 0, 0, 0, VAR_SPECIAL_RESULT
	BufferSpeciesName 1, VAR_SPECIAL_x8004, 0, 0
	NPCMsg msg_0451_T01R0301_00049
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	CloseMsg
	Compare VAR_SPECIAL_RESULT, 0
	CallIfEq _0929
	TouchscreenMenuShow
	GetPersonCoords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4000, 8
	GoToIfEq _0908
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	Compare VAR_SPECIAL_x8004, 1
	GoToIfNe _08D3
	ApplyMovement obj_player, _0998
	GoTo _08F6

_08D3:
	Compare VAR_SPECIAL_x8004, 7
	GoToIfNe _08EE
	ApplyMovement obj_player, _09A4
	GoTo _08F6

_08EE:
	ApplyMovement obj_player, _09B0
_08F6:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	GoTo _0912

_0908:
	ApplyMovement obj_player, _09CC
	WaitMovement
_0912:
	NPCMsg msg_0451_T01R0301_00052
	WaitButton
	CloseMsg
	ReleaseAll
	CopyVar VAR_UNK_4131, VAR_SPECIAL_x8006
	SetVar VAR_SCENE_EMBEDDED_TOWER, 1
	Return

_0929:
	SetVar VAR_TEMP_x4000, 0
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	NicknameInput VAR_SPECIAL_x8005, VAR_TEMP_x4000
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	TouchscreenMenuHide
	BufferPartyMonNick 1, VAR_SPECIAL_x8005
	NPCMsg msg_0451_T01R0301_00050
	GetMenuChoice VAR_SPECIAL_RESULT
	CloseMsg
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0929
	Return

_096C:
	ScrCmd_453
	NPCMsg msg_0451_T01R0301_00047
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
_0979:
	End

_097B:
	End

_097D:
	BufferRivalsName 1
	NPCMsg msg_0451_T01R0301_00054
	WaitButton
	CloseMsg
	ReleaseAll
	End

_098B:
	TouchscreenMenuShow
	NPCMsg msg_0451_T01R0301_00051
	WaitButton
	CloseMsg
	ReleaseAll
	Return

	.balign 4, 0
_0998:
	WalkNormalSouth
	WalkNormalWest 3
	EndMovement

	.balign 4, 0
_09A4:
	WalkNormalSouth
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_09B0:
	WalkNormalSouth
	WalkNormalWest
	EndMovement

	.balign 4, 0
_09BC:
	FaceEast
	EndMovement

	.balign 4, 0
_09C4:
	FaceNorth
	EndMovement

	.balign 4, 0
_09CC:
	FaceSouth
	EndMovement
	.balign 4, 0
