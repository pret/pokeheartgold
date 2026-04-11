#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D23R0105.h"
#include "msgdata/msg/msg_0069_D23R0105.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D23R0105_000
	ScrDef scr_seq_D23R0105_001
	ScrDef scr_seq_D23R0105_002
	ScrDef scr_seq_D23R0105_003
	ScrDefEnd

scr_seq_D23R0105_000:
	SetFlag FLAG_HIDE_ROCKET_TAKEOVER_1
	SetVar VAR_UNK_4125, 0
	Compare VAR_SCENE_ROCKET_TAKEOVER, 4
	GoToIfNe _002D
	ClearFlag FLAG_HIDE_ROCKET_TAKEOVER_1
_002D:
	End

scr_seq_D23R0105_001:
	SimpleNPCMsg msg_0069_D23R0105_00007
	End

scr_seq_D23R0105_003:
	SimpleNPCMsg msg_0069_D23R0105_00008
	End

scr_seq_D23R0105_002:
	Compare VAR_SCENE_ROCKET_TAKEOVER, 4
	GoToIfEq _0075
	SimpleNPCMsg msg_0069_D23R0105_00006
	End

_0075:
	GetItemQuantity ITEM_BASEMENT_KEY, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _022B
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0069_D23R0105_00000
	CloseMsg
	Wait 16, VAR_SPECIAL_RESULT
	GetPlayerFacing VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _00B8
	ApplyMovement obj_D23R0105_gsgentleman, _0258
	GoTo _00DB

_00B8:
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _00D3
	ApplyMovement obj_D23R0105_gsgentleman, _024C
	GoTo _00DB

_00D3:
	ApplyMovement obj_D23R0105_gsgentleman, _0240
_00DB:
	WaitMovement
	Compare VAR_TEMP_x4000, 3
	GoToIfNe _00F8
	ApplyMovement obj_D23R0105_gsgentleman, _0264
	GoTo _010D

_00F8:
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _010D
	ApplyMovement obj_D23R0105_gsgentleman, _0274
_010D:
	WaitMovement
	NPCMsg msg_0069_D23R0105_00001
	CloseMsg
	Compare VAR_TEMP_x4000, 3
	GoToIfNe _012F
	ApplyMovement obj_D23R0105_gsgentleman, _0284
	GoTo _0144

_012F:
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _0144
	ApplyMovement obj_D23R0105_gsgentleman, _028C
_0144:
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0069_D23R0105_00002
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _0167
	ApplyMovement obj_D23R0105_gsgentleman, _02B0
	GoTo _018A

_0167:
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _0182
	ApplyMovement obj_D23R0105_gsgentleman, _0294
	GoTo _018A

_0182:
	ApplyMovement obj_D23R0105_gsgentleman, _02C8
_018A:
	WaitMovement
	SetFlag FLAG_HIDE_RADIO_TOWER_5F_OFFICE_DIRECTOR
	ClearFlag FLAG_HIDE_RADIO_TOWER_5F_PETREL_REVEALED
	ShowPerson obj_D23R0105_rkanbum2
	HidePerson obj_D23R0105_gsgentleman
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _01B7
	ApplyMovement obj_D23R0105_rkanbum2, _0328
	GoTo _01DA

_01B7:
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _01D2
	ApplyMovement obj_D23R0105_rkanbum2, _0310
	GoTo _01DA

_01D2:
	ApplyMovement obj_D23R0105_rkanbum2, _0344
_01DA:
	WaitMovement
	NPCMsg msg_0069_D23R0105_00003
	CloseMsg
	TrainerBattle TRAINER_EXECUTIVE_PETREL_PETREL, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _021D
	NPCMsg msg_0069_D23R0105_00004
	SetVar VAR_SPECIAL_x8004, ITEM_BASEMENT_KEY
	SetVar VAR_SPECIAL_x8005, 1
	CallStd std_obtain_item_verbose
	CloseMsg
	ReleaseAll
	SetVar VAR_UNK_40E7, 2
	ClearFlag FLAG_HIDE_UNDERGROUND_KIMONO_GIRL
	End

_021D:
	WhiteOut
	ClearFlag FLAG_HIDE_RADIO_TOWER_5F_OFFICE_DIRECTOR
	SetFlag FLAG_HIDE_RADIO_TOWER_5F_PETREL_REVEALED
	ReleaseAll
	End

_022B:
	SimpleNPCMsg msg_0069_D23R0105_00005
	End

	.balign 4, 0
_0240:
	FaceWest
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_024C:
	FaceEast
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0258:
	FaceSouth
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0264:
	LockDir
	WalkFastEast
	UnlockDir
	EndMovement

	.balign 4, 0
_0274:
	LockDir
	WalkFastWest
	UnlockDir
	EndMovement

	.balign 4, 0
_0284:
	WalkFastWest
	EndMovement

	.balign 4, 0
_028C:
	WalkFastEast
	EndMovement

	.balign 4, 0
_0294:
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	EndMovement

	.balign 4, 0
_02B0:
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	EndMovement

	.balign 4, 0
_02C8:
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	EndMovement

	.balign 4, 0
_02EC:
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
_0310:
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	EndMovement

	.balign 4, 0
_0328:
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	EndMovement

	.balign 4, 0
_0344:
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	EndMovement
	.balign 4, 0
