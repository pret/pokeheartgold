#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T09.h"
#include "msgdata/msg/msg_0519_T09.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T09_000
	ScrDef scr_seq_T09_001
	ScrDef scr_seq_T09_002
	ScrDef scr_seq_T09_003
	ScrDef scr_seq_T09_004
	ScrDefEnd

scr_seq_T09_003:
	GoToIfUnset FLAG_UNK_189, _0027
	ClearFlag FLAG_UNK_189
	End

_0027:
	GoToIfSet FLAG_UNK_129, _0038
	SetFlag FLAG_UNK_27D
	End

_0038:
	SetFlag FLAG_UNK_25A
	GetPhoneBookRematch PHONE_CONTACT_BLUE, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _007B
	Compare VAR_UNK_40FD, 0
	GoToIfEq _007B
	GetWeekday VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 5
	GoToIfNe _0077
	ClearFlag FLAG_UNK_25A
	GoTo _007B

_0077:
	SetFlag FLAG_UNK_25A
_007B:
	CheckRegisteredPhoneNumber PHONE_CONTACT_BLAINE, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _00CC
	CheckBadge BADGE_EARTH, VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 1
	GoToIfEq _00A9
	GoTo _0102
	End

_00A9:
	GetWeekday VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 2
	GoToIfNe _00C4
	ClearFlag FLAG_UNK_27D
	GoTo _00CA

_00C4:
	GoTo _0102

_00CA:
	End

_00CC:
	GetPhoneBookRematch PHONE_CONTACT_BLAINE, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _0102
	GetWeekday VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 4
	GoToIfNe _00FA
	ClearFlag FLAG_UNK_27D
	GoTo _0100

_00FA:
	GoTo _0102

_0100:
	End

_0102:
	SetFlag FLAG_UNK_27D
	End

scr_seq_T09_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Release obj_partner_poke
	ApplyMovement obj_partner_poke, _02FC
	WaitMovement
	Lock obj_partner_poke
	Compare VAR_UNK_40FD, 0
	GoToIfNe _0304
	GoToIfSet FLAG_UNK_128, _016F
	SetFlag FLAG_UNK_128
	NPCMsg msg_0519_T09_00000
	CloseMsg
	GetPlayerFacing VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _0162
	ApplyMovement obj_T09_gsleader16, _0268
	GoTo _016A

_0162:
	ApplyMovement obj_T09_gsleader16, _0280
_016A:
	WaitMovement
	NPCMsg msg_0519_T09_00001
_016F:
	Compare VAR_UNK_4135, 7
	GoToIfGe _018C
	BufferInt 0, VAR_UNK_4135
	NPCMsg msg_0519_T09_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_018C:
	NPCMsg msg_0519_T09_00002
	CloseMsg
	GetPlayerFacing VAR_TEMP_x4000
	GetPersonCoords 253, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _01C7
	Compare VAR_SPECIAL_x8004, 1035
	GoToIfNe _01C1
	ApplyMovement obj_partner_poke, _02D4
	WaitMovement
_01C1:
	GoTo _01DE

_01C7:
	Compare VAR_SPECIAL_x8005, 495
	GoToIfNe _01DE
	ApplyMovement obj_partner_poke, _02E4
	WaitMovement
_01DE:
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _01F9
	ApplyMovement obj_T09_gsleader16, _0298
	GoTo _0201

_01F9:
	ApplyMovement obj_T09_gsleader16, _02A4
_0201:
	WaitMovement
	NPCMsg msg_0519_T09_00003
	CloseMsg
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _0233
	ApplyMovement obj_T09_gsleader16, _02B0
	ApplyMovement obj_player, _02F4
	ApplyMovement obj_partner_poke, _02F4
	GoTo _024B

_0233:
	ApplyMovement obj_T09_gsleader16, _02C0
	ApplyMovement obj_player, _02F4
	ApplyMovement obj_partner_poke, _02F4
_024B:
	WaitMovement
	HidePerson obj_T09_gsleader16
	SetFlag FLAG_UNK_25A
	SetFlag FLAG_UNK_129
	SetFlag FLAG_HIDE_VIRIDIAN_CITY_OLD_MAN_OUTSIDE_GYM_LOCKED
	ClearFlag FLAG_HIDE_VIRIDIAN_CITY_OLD_MAN_OUTSIDE_GYM_UNLOCKED
	ReleaseAll
	End

	.balign 4, 0
_0268:
	WalkOnSpotNormalEast
	Delay8 2
	WalkOnSpotNormalNorth
	Delay8 2
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0280:
	WalkOnSpotNormalNorth
	Delay8 2
	WalkOnSpotNormalEast
	Delay8 2
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0298:
	WalkNormalWest
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_02A4:
	WalkNormalSouth
	WalkNormalWest
	EndMovement

	.balign 4, 0
_02B0:
	WalkNormalSouth 2
	WalkNormalWest 2
	WalkNormalSouth 8
	EndMovement

	.balign 4, 0
_02C0:
	WalkNormalSouth
	WalkNormalSouth 2
	WalkNormalWest 2
	WalkNormalSouth 7
	EndMovement

	.balign 4, 0
_02D4:
	WalkNormalSouth
	WalkNormalEast
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_02E4:
	WalkNormalWest
	WalkNormalNorth
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_02F4:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_02FC:
	Delay1
	EndMovement

_0304:
	NPCMsg msg_0519_T09_00005
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0365
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0370
	NPCMsg msg_0519_T09_00006
	CloseMsg
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 92
	FacePlayer
	LockAll
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ClearFlag FLAG_UNK_189
	NPCMsg msg_0519_T09_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0365:
	NPCMsg msg_0519_T09_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0370:
	NPCMsg msg_0519_T09_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T09_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckRegisteredPhoneNumber PHONE_CONTACT_BLAINE, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _0429
	Compare VAR_TEMP_x4004, 1
	GoToIfGe _041E
	NPCMsg msg_0519_T09_00010
_03A6:
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _03CA
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfGe _040D
	End

_03CA:
	BufferPlayersName 0
	NPCMsg msg_0519_T09_00011
	PlayFanfare SEQ_ME_POKEGEAR_REGIST
	WaitFanfare
	RegisterGearNumber PHONE_CONTACT_BLAINE
	NPCMsg msg_0519_T09_00012
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	SetFlag FLAG_UNK_27D
	HidePerson obj_T09_gsleader15
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_040D:
	SetVar VAR_TEMP_x4004, 1
	NPCMsg msg_0519_T09_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

_041E:
	NPCMsg msg_0519_T09_00014
	GoTo _03A6
	End

_0429:
	NPCMsg msg_0519_T09_00015
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _048A
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0495
	NPCMsg msg_0519_T09_00016
	CloseMsg
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 85
	FacePlayer
	LockAll
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ClearFlag FLAG_UNK_189
	NPCMsg msg_0519_T09_00017
	WaitButton
	CloseMsg
	ReleaseAll
	End

_048A:
	NPCMsg msg_0519_T09_00018
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0495:
	NPCMsg msg_0519_T09_00019
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T09_001:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0519_T09_00020, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T09_002:
	DirectionSignpost msg_0519_T09_00021, 0, 9, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
