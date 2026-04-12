#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0104.h"
#include "msgdata/msg/msg_0497_T07R0104.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T07R0104_000
	ScrDef scr_seq_T07R0104_001
	ScrDef scr_seq_T07R0104_002
	ScrDef scr_seq_T07R0104_003
	ScrDef scr_seq_T07R0104_004
	ScrDef scr_seq_T07R0104_005
	ScrDef scr_seq_T07R0104_006
	ScrDefEnd

scr_seq_T07R0104_004:
	GoToIfUnset FLAG_UNK_189, _002F
	ClearFlag FLAG_UNK_189
	End

_002F:
	CheckRegisteredPhoneNumber PHONE_CONTACT_FALKNER, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _0082
	CheckBadge BADGE_SOUL, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfEq _005B
	GoTo _00C2

_005B:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfNe _007A
	ClearFlag FLAG_UNK_260
	ClearFlag FLAG_UNK_2E2
	GoTo _0080

_007A:
	GoTo _00C2

_0080:
	End

_0082:
	GetPhoneBookRematch PHONE_CONTACT_FALKNER, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _00C2
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 3
	GoToIfNe _00BA
	ClearFlag FLAG_UNK_260
	SetFlag FLAG_UNK_2E2
	SetObjectFacing obj_T07R0104_gsleader1, DIR_SOUTH
	GoTo _00C0

_00BA:
	GoTo _00C2

_00C0:
	End

_00C2:
	SetFlag FLAG_UNK_260
	SetFlag FLAG_UNK_2E2
	End

_00CC:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	ApplyMovement obj_T07R0104_gsleader1, _026C
	WaitMovement
	NPCMsg msg_0497_T07R0104_00000
	CloseMsg
	ApplyMovement obj_T07R0104_gsleader13, _0274
	WaitMovement
	NPCMsg msg_0497_T07R0104_00001
	CloseMsg
	ApplyMovement obj_T07R0104_gsleader1, _026C
	WaitMovement
	NPCMsg msg_0497_T07R0104_00002
	CloseMsg
	ApplyMovement obj_T07R0104_gsleader13, _0274
	WaitMovement
	NPCMsg msg_0497_T07R0104_00003
	CloseMsg
	ApplyMovement obj_T07R0104_gsleader1, _027C
	WaitMovement
	NPCMsg msg_0497_T07R0104_00004
_011B:
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _013F
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfGe _0189
	End

_013F:
	NPCMsg msg_0497_T07R0104_00005
	RegisterGearNumber PHONE_CONTACT_FALKNER
	BufferPlayersName 0
	NPCMsg msg_0497_T07R0104_00006
	PlayFanfare SEQ_ME_POKEGEAR_REGIST
	WaitFanfare
	NPCMsg msg_0497_T07R0104_00007
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	SetFlag FLAG_UNK_260
	HidePerson obj_T07R0104_gsleader1
	HidePerson obj_T07R0104_gsleader13
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_0189:
	SetVar VAR_TEMP_x4004, 1
	NPCMsg msg_0497_T07R0104_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T07R0104_005:
	CheckRegisteredPhoneNumber PHONE_CONTACT_FALKNER, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _01CD
	Compare VAR_TEMP_x4004, 1
	GoToIfNe _00CC
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0497_T07R0104_00009
	GoTo _011B
	End

_01CD:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0497_T07R0104_00010
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0236
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0241
	NPCMsg msg_0497_T07R0104_00011
	CloseMsg
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 2
	FacePlayer
	LockAll
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ClearFlag FLAG_UNK_189
	NPCMsg msg_0497_T07R0104_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0236:
	NPCMsg msg_0497_T07R0104_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0241:
	NPCMsg msg_0497_T07R0104_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T07R0104_006:
	Compare VAR_TEMP_x4004, 1
	GoToIfNe _00CC
	SimpleNPCMsg msg_0497_T07R0104_00015
	End

	.balign 4, 0
_026C:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0274:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_027C:
	WalkOnSpotNormalSouth
	EndMovement

scr_seq_T07R0104_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallStd std_mart_intro
	HoldMsg
	SetVar VAR_SPECIAL_x8004, 21
	CallStd std_special_mart
	ReleaseAll
	End

scr_seq_T07R0104_001:
	SimpleNPCMsg msg_0497_T07R0104_00016
	End

scr_seq_T07R0104_002:
	SimpleNPCMsg msg_0497_T07R0104_00017
	End

scr_seq_T07R0104_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0497_T07R0104_00018
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
