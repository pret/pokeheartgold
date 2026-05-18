#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D23R0103.h"
#include "msgdata/msg/msg_0067_D23R0103.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D23R0103_000
	ScrDef scr_seq_D23R0103_001
	ScrDef scr_seq_D23R0103_002
	ScrDef scr_seq_D23R0103_003
	ScrDef scr_seq_D23R0103_004
	ScrDef scr_seq_D23R0103_005
	ScrDef scr_seq_D23R0103_006
	ScrDef scr_seq_D23R0103_007
	ScrDefEnd

scr_seq_D23R0103_000:
	SetFlag FLAG_HIDE_ROCKET_TAKEOVER_1
	SetFlag FLAG_HIDE_ROCKET_TAKEOVER_2
	Compare VAR_SCENE_ROCKET_TAKEOVER, 4
	GoToIfNe _0041
	ClearFlag FLAG_HIDE_ROCKET_TAKEOVER_1
	GoTo _0052

_0041:
	Compare VAR_SCENE_ROCKET_TAKEOVER, 5
	GoToIfNe _0052
	ClearFlag FLAG_HIDE_ROCKET_TAKEOVER_2
_0052:
	End

scr_seq_D23R0103_001:
	SimpleNPCMsg msg_0067_D23R0103_00015
	End

scr_seq_D23R0103_002:
	SimpleNPCMsg msg_0067_D23R0103_00016
	End

scr_seq_D23R0103_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 4
	GoToIfNe _0098
	NPCMsg msg_0067_D23R0103_00001
	GoTo _009B

_0098:
	NPCMsg msg_0067_D23R0103_00002
_009B:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D23R0103_004:
	SimpleNPCMsg msg_0067_D23R0103_00000
	End

scr_seq_D23R0103_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 4
	GoToIfNe _00E7
	GetItemQuantity ITEM_BASEMENT_KEY, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _00F5
	NPCMsg msg_0067_D23R0103_00003
	GoTo _00ED

_00E7:
	GoTo _0100

_00ED:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00F5:
	NPCMsg msg_0067_D23R0103_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0100:
	GoToIfSet FLAG_GOT_TM11_FROM_RADIO_TOWER_WOMAN, _014D
	NPCMsg msg_0067_D23R0103_00005
	GoToIfNoItemSpace ITEM_TM11, 1, _0142
	CallStd std_give_item_verbose
	NPCMsg msg_0067_D23R0103_00007
	WaitButton
	CloseMsg
	ReleaseAll
	SetFlag FLAG_GOT_TM11_FROM_RADIO_TOWER_WOMAN
	End

_0142:
	NPCMsg msg_0067_D23R0103_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_014D:
	NPCMsg msg_0067_D23R0103_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D23R0103_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetItemQuantity ITEM_CARD_KEY, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _01B4
	NPCMsg msg_0067_D23R0103_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D23R0103_007:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_090, _01E2
	NPCMsg msg_0067_D23R0103_00011
	CloseMsg
	GetItemQuantity ITEM_CARD_KEY, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _01B4
	NPCMsg msg_0067_D23R0103_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01B4:
	BufferPlayersName 0
	NPCMsg msg_0067_D23R0103_00012
	CloseMsg
	ApplyMovement obj_D23R0103_babyboy1_9, _01F0
	ApplyMovement obj_D23R0103_babyboy1_9_2, _01F8
	WaitMovement
	ReleaseAll
	SetFlag FLAG_UNK_1BF
	HidePerson obj_D23R0103_babyboy1_9
	HidePerson obj_D23R0103_babyboy1_9_2
	SetFlag FLAG_UNK_090
	End

_01E2:
	NPCMsg msg_0067_D23R0103_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_01F0:
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_01F8:
	WalkNormalEast 2
	EndMovement
	.balign 4, 0
