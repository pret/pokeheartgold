#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D17R0101.h"
#include "msgdata/msg/msg_0057_D17R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D17R0101_000
	ScrDef scr_seq_D17R0101_001
	ScrDef scr_seq_D17R0101_002
	ScrDefEnd

scr_seq_D17R0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_CAUGHT_HO_OH, _0053
	GetGameVersion VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 8
	GoToIfEq _0048
	GoToIfSet FLAG_UNK_108, _005E
	GoToIfSet FLAG_UNK_105, _0069
_0048:
	NPCMsg msg_0057_D17R0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0053:
	NPCMsg msg_0057_D17R0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_005E:
	NPCMsg msg_0057_D17R0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0069:
	NPCMsg msg_0057_D17R0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D17R0101_001:
	ScrCmd_609
	LockAll
	GetPlayerFacing VAR_TEMP_x400A
	Compare VAR_TEMP_x400A, 0
	GoToIfNe _0097
	ApplyMovement obj_D17R0101_bozu, _02D8
	GoTo _009F

_0097:
	ApplyMovement obj_D17R0101_bozu, _02E0
_009F:
	WaitMovement
	GetPlayerCoords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	Compare VAR_TEMP_x400A, 0
	CallIfEq _0150
	Compare VAR_TEMP_x400A, 2
	CallIfEq _0192
	GoToIfSet FLAG_UNK_093, _028E
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 56
	Compare VAR_TEMP_x400A, 0
	GoToIfNe _00F1
	ApplyMovement obj_player, _0344
	GoTo _0101

_00F1:
	ApplyMovement obj_D17R0101_bozu, _0354
	ApplyMovement obj_player, _0354
_0101:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	GetGameVersion VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 7
	GoToIfNe _0127
	NPCMsg msg_0057_D17R0101_00000
	GoTo _012A

_0127:
	NPCMsg msg_0057_D17R0101_00001
_012A:
	CloseMsg
	GetPlayerCoords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	Compare VAR_TEMP_x400A, 0
	CallIfEq _01EF
	Compare VAR_TEMP_x400A, 2
	CallIfEq _0231
	ReleaseAll
	End

_0150:
	Compare VAR_SPECIAL_x8004, 7
	GoToIfNe _016B
	ApplyMovement obj_D17R0101_bozu, _02EC
	GoTo _018E

_016B:
	Compare VAR_SPECIAL_x8004, 8
	GoToIfNe _0186
	ApplyMovement obj_D17R0101_bozu, _02FC
	GoTo _018E

_0186:
	ApplyMovement obj_D17R0101_bozu, _0304
_018E:
	WaitMovement
	Return

_0192:
	Compare VAR_SPECIAL_x8005, 7
	GoToIfNe _01AD
	ApplyMovement obj_D17R0101_bozu, _0314
	GoTo _01EB

_01AD:
	Compare VAR_SPECIAL_x8005, 8
	GoToIfNe _01C8
	ApplyMovement obj_D17R0101_bozu, _0324
	GoTo _01EB

_01C8:
	Compare VAR_SPECIAL_x8005, 9
	GoToIfNe _01E3
	ApplyMovement obj_D17R0101_bozu, _032C
	GoTo _01EB

_01E3:
	ApplyMovement obj_D17R0101_bozu, _0338
_01EB:
	WaitMovement
	Return

_01EF:
	Compare VAR_SPECIAL_x8004, 7
	GoToIfNe _020A
	ApplyMovement obj_D17R0101_bozu, _0364
	GoTo _022D

_020A:
	Compare VAR_SPECIAL_x8004, 8
	GoToIfNe _0225
	ApplyMovement obj_D17R0101_bozu, _0378
	GoTo _022D

_0225:
	ApplyMovement obj_D17R0101_bozu, _0384
_022D:
	WaitMovement
	Return

_0231:
	Compare VAR_SPECIAL_x8005, 7
	GoToIfNe _024C
	ApplyMovement obj_D17R0101_bozu, _0398
	GoTo _028A

_024C:
	Compare VAR_SPECIAL_x8005, 8
	GoToIfNe _0267
	ApplyMovement obj_D17R0101_bozu, _03A4
	GoTo _028A

_0267:
	Compare VAR_SPECIAL_x8005, 9
	GoToIfNe _0282
	ApplyMovement obj_D17R0101_bozu, _03B0
	GoTo _028A

_0282:
	ApplyMovement obj_D17R0101_bozu, _03C0
_028A:
	WaitMovement
	Return

_028E:
	NPCMsg msg_0057_D17R0101_00002
	CloseMsg
	ShowLegendaryWing 0
	ReleaseAll
	SetVar VAR_UNK_40F3, 1
	End

scr_seq_D17R0101_002:
	Wait 30, VAR_SPECIAL_RESULT
	Compare VAR_TEMP_x400A, 0
	GoToIfNe _02C2
	ApplyMovement obj_D17R0101_bozu, _03D0
	GoTo _02CA

_02C2:
	ApplyMovement obj_D17R0101_bozu, _03E0
_02CA:
	WaitMovement
	NPCMsg msg_0057_D17R0101_00003
	WaitButton
	CloseMsg
	End

	.balign 4, 0
_02D8:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_02E0:
	FaceEast
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_02EC:
	WalkNormalSouth 2
	WalkNormalWest
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_02FC:
	WalkNormalSouth 3
	EndMovement

	.balign 4, 0
_0304:
	WalkNormalSouth 2
	WalkNormalEast
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_0314:
	WalkNormalNorth
	WalkNormalEast 2
	WalkNormalEast
	EndMovement

	.balign 4, 0
_0324:
	WalkNormalEast 3
	EndMovement

	.balign 4, 0
_032C:
	WalkNormalSouth
	WalkNormalEast 3
	EndMovement

	.balign 4, 0
_0338:
	WalkNormalSouth 2
	WalkNormalEast 3
	EndMovement

	.balign 4, 0
_0344:
	LockDir
	WalkNormalSouth
	UnlockDir
	EndMovement

	.balign 4, 0
_0354:
	LockDir
	WalkNormalEast
	UnlockDir
	EndMovement

	.balign 4, 0
_0364:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 2
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0378:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0384:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 2
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0398:
	WalkNormalWest 4
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_03A4:
	WalkNormalWest 4
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_03B0:
	WalkNormalWest 4
	WalkNormalNorth
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_03C0:
	WalkNormalWest 4
	WalkNormalNorth 2
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_03D0:
	LockDir
	WalkSlowerNorth
	UnlockDir
	EndMovement

	.balign 4, 0
_03E0:
	LockDir
	WalkSlowerWest
	UnlockDir
	EndMovement
	.balign 4, 0
