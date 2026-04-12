#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11R0802.h"
#include "msgdata/msg/msg_0541_T11R0802.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T11R0802_000
	ScrDef scr_seq_T11R0802_001
	ScrDef scr_seq_T11R0802_002
	ScrDef scr_seq_T11R0802_003
	ScrDef scr_seq_T11R0802_004
	ScrDef scr_seq_T11R0802_005
	ScrDef scr_seq_T11R0802_006
	ScrDefEnd

scr_seq_T11R0802_004:
	GetPlayerGender VAR_TEMP_x4009
	Compare VAR_TEMP_x4009, 0
	GoToIfNe _003B
	SetVar VAR_OBJ_0, 0
	GoTo _0041

_003B:
	SetVar VAR_OBJ_0, 97
_0041:
	End

scr_seq_T11R0802_005:
	Compare VAR_TEMP_x400B, 0
	GoToIfNe _005A
	HidePerson obj_T11R0802_var_1
	SetVar VAR_TEMP_x400B, 1
_005A:
	End

scr_seq_T11R0802_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetItemQuantity ITEM_PASS, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0125
	GetItemQuantity ITEM_LOST_ITEM, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _00E9
	GoToIfSet FLAG_RESTORED_POWER, _00BD
	Call _014D
	BufferPlayersName 0
	GenderMsgBox msg_0541_T11R0802_00000, msg_0541_T11R0802_00001
	CloseMsg
	Call _01DB
	NPCMsg msg_0541_T11R0802_00002
	CloseMsg
	ApplyMovement obj_T11R0802_gsgirl1, _026C
	WaitMovement
	ReleaseAll
	End

_00BD:
	SetFlag FLAG_UNK_119
	Call _014D
	BufferPlayersName 0
	GenderMsgBox msg_0541_T11R0802_00003, msg_0541_T11R0802_00004
	CloseMsg
	Call _01DB
	NPCMsg msg_0541_T11R0802_00005
	CloseMsg
	ApplyMovement obj_T11R0802_gsgirl1, _026C
	WaitMovement
	ReleaseAll
	End

_00E9:
	TakeItem ITEM_LOST_ITEM, 1, VAR_SPECIAL_RESULT
	NPCMsg msg_0541_T11R0802_00006
	ClearFlag FLAG_HIDE_SAFFRON_CITY_COPYCAT_HOUSE_CLEFAIRY_DOLL
	ShowPerson obj_T11R0802_mono_pip
	GiveItemNoCheck ITEM_PASS, 1
	NPCMsg msg_0541_T11R0802_00008
	WaitButton
	CloseMsg
	ReleaseAll
	SetFlag FLAG_UNK_087
	SetFlag FLAG_UNK_998
	SetVar VAR_UNK_40FF, 2
	End

_0125:
	Call _014D
	BufferPlayersName 0
	GenderMsgBox msg_0541_T11R0802_00009, msg_0541_T11R0802_00010
	CloseMsg
	Call _01DB
	NPCMsg msg_0541_T11R0802_00011
	CloseMsg
	ApplyMovement obj_T11R0802_gsgirl1, _026C
	WaitMovement
	ReleaseAll
	End

_014D:
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _016C
	ApplyMovement obj_T11R0802_gsgirl1, _02B0
	GoTo _018F

_016C:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0187
	ApplyMovement obj_T11R0802_gsgirl1, _0274
	GoTo _018F

_0187:
	ApplyMovement obj_T11R0802_gsgirl1, _0294
_018F:
	WaitMovement
	ShowPerson obj_T11R0802_var_1
	HidePerson obj_T11R0802_gsgirl1
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _01B4
	ApplyMovement obj_T11R0802_var_1, _0304
	GoTo _01D7

_01B4:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _01CF
	ApplyMovement obj_T11R0802_var_1, _02C8
	GoTo _01D7

_01CF:
	ApplyMovement obj_T11R0802_var_1, _02EC
_01D7:
	WaitMovement
	Return

_01DB:
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _01FA
	ApplyMovement obj_T11R0802_var_1, _02B0
	GoTo _021D

_01FA:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0215
	ApplyMovement obj_T11R0802_var_1, _0274
	GoTo _021D

_0215:
	ApplyMovement obj_T11R0802_var_1, _0294
_021D:
	WaitMovement
	ShowPerson obj_T11R0802_gsgirl1
	HidePerson obj_T11R0802_var_1
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0242
	ApplyMovement obj_T11R0802_gsgirl1, _0304
	GoTo _0265

_0242:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _025D
	ApplyMovement obj_T11R0802_gsgirl1, _02C8
	GoTo _0265

_025D:
	ApplyMovement obj_T11R0802_gsgirl1, _02EC
_0265:
	WaitMovement
	Return

	.balign 4, 0
_026C:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0274:
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
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
_02EC:
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	EndMovement

	.balign 4, 0
_0304:
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	EndMovement

scr_seq_T11R0802_003:
	Compare VAR_TEMP_x400A, 0
	GoToIfNe _03A3
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0541_T11R0802_00012
	WaitButton
	CloseMsg
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0359
	ApplyMovement obj_T11R0802_jupetta, _03C8
	GoTo _0397

_0359:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0374
	ApplyMovement obj_T11R0802_jupetta, _03C0
	GoTo _0397

_0374:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _038F
	ApplyMovement obj_T11R0802_jupetta, _03D8
	GoTo _0397

_038F:
	ApplyMovement obj_T11R0802_jupetta, _03D0
_0397:
	WaitMovement
	SetVar VAR_TEMP_x400A, 1
	ReleaseAll
	End

_03A3:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_BANETTE, 0
	NPCMsg msg_0541_T11R0802_00013
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_03C0:
	FaceNorth
	EndMovement

	.balign 4, 0
_03C8:
	FaceSouth
	EndMovement

	.balign 4, 0
_03D0:
	FaceWest
	EndMovement

	.balign 4, 0
_03D8:
	FaceEast
	EndMovement

scr_seq_T11R0802_001:
	SimpleNPCMsg msg_0541_T11R0802_00015
	End

scr_seq_T11R0802_002:
	SimpleNPCMsg msg_0541_T11R0802_00014
	End

scr_seq_T11R0802_006:
	GoToIfSet FLAG_HIDE_SAFFRON_CITY_COPYCAT_HOUSE_CLEFAIRY_DOLL, _0431
	Compare VAR_UNK_40FF, 2
	GoToIfEq _0433
	SimpleNPCMsg msg_0541_T11R0802_00016
	End

_0431:
	End

_0433:
	SimpleNPCMsg msg_0541_T11R0802_00017
	End
	.balign 4, 0
