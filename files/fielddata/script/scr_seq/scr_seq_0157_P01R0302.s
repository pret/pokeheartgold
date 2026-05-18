#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_P01R0302.h"
#include "msgdata/msg/msg_0260_P01R0302.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_P01R0302_000
	ScrDef scr_seq_P01R0302_001
	ScrDef scr_seq_P01R0302_002
	ScrDefEnd

scr_seq_P01R0302_002:
	Compare VAR_UNK_40CB, 4
	GoToIfGe _001D
	End

_001D:
	SetFlag FLAG_UNK_217
	End

scr_seq_P01R0302_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_40CB, 6
	GoToIfGe _005B
	Compare VAR_UNK_40CB, 4
	GoToIfEq _0050
	NPCMsg msg_0260_P01R0302_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0050:
	NPCMsg msg_0260_P01R0302_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_005B:
	GoToIfSet FLAG_UNK_ABB, _0084
	GoToIfSet FLAG_UNK_092, _0084
	CheckBadge BADGE_EARTH, VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 1
	GoToIfEq _008F
_0084:
	NPCMsg msg_0260_P01R0302_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_008F:
	NPCMsg msg_0260_P01R0302_00007
	CloseMsg
	Compare VAR_UNK_4101, 0
	GoToIfNe _00B3
	SetVar VAR_SPECIAL_x8004, ITEM_FLAME_PLATE
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _0296

_00B3:
	Compare VAR_UNK_4101, 1
	GoToIfNe _00D2
	SetVar VAR_SPECIAL_x8004, ITEM_SPLASH_PLATE
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _0296

_00D2:
	Compare VAR_UNK_4101, 2
	GoToIfNe _00F1
	SetVar VAR_SPECIAL_x8004, ITEM_ZAP_PLATE
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _0296

_00F1:
	Compare VAR_UNK_4101, 3
	GoToIfNe _0110
	SetVar VAR_SPECIAL_x8004, ITEM_MEADOW_PLATE
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _0296

_0110:
	Compare VAR_UNK_4101, 4
	GoToIfNe _012F
	SetVar VAR_SPECIAL_x8004, ITEM_ICICLE_PLATE
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _0296

_012F:
	Compare VAR_UNK_4101, 5
	GoToIfNe _014E
	SetVar VAR_SPECIAL_x8004, ITEM_FIST_PLATE
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _0296

_014E:
	Compare VAR_UNK_4101, 6
	GoToIfNe _016D
	SetVar VAR_SPECIAL_x8004, ITEM_TOXIC_PLATE
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _0296

_016D:
	Compare VAR_UNK_4101, 7
	GoToIfNe _018C
	SetVar VAR_SPECIAL_x8004, ITEM_EARTH_PLATE
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _0296

_018C:
	Compare VAR_UNK_4101, 8
	GoToIfNe _01AB
	SetVar VAR_SPECIAL_x8004, ITEM_SKY_PLATE
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _0296

_01AB:
	Compare VAR_UNK_4101, 9
	GoToIfNe _01CA
	SetVar VAR_SPECIAL_x8004, ITEM_MIND_PLATE
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _0296

_01CA:
	Compare VAR_UNK_4101, 10
	GoToIfNe _01E9
	SetVar VAR_SPECIAL_x8004, ITEM_INSECT_PLATE
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _0296

_01E9:
	Compare VAR_UNK_4101, 11
	GoToIfNe _0208
	SetVar VAR_SPECIAL_x8004, ITEM_STONE_PLATE
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _0296

_0208:
	Compare VAR_UNK_4101, 12
	GoToIfNe _0227
	SetVar VAR_SPECIAL_x8004, ITEM_SPOOKY_PLATE
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _0296

_0227:
	Compare VAR_UNK_4101, 13
	GoToIfNe _0246
	SetVar VAR_SPECIAL_x8004, ITEM_DRACO_PLATE
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _0296

_0246:
	Compare VAR_UNK_4101, 14
	GoToIfNe _0265
	SetVar VAR_SPECIAL_x8004, ITEM_DREAD_PLATE
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _0296

_0265:
	Compare VAR_UNK_4101, 15
	GoToIfNe _0284
	SetVar VAR_SPECIAL_x8004, ITEM_IRON_PLATE
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _0296

_0284:
	SetVar VAR_SPECIAL_x8004, ITEM_NUGGET
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _029C

_0296:
	AddVar VAR_UNK_4101, 1
_029C:
	HasSpaceForItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _02C3
	CallStd std_obtain_item_verbose
	SetFlag FLAG_UNK_ABB
	SetFlag FLAG_UNK_092
	CloseMsg
	ReleaseAll
	End

_02C3:
	BufferItemName 1, VAR_SPECIAL_x8004
	NPCMsg msg_0260_P01R0302_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_P01R0302_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0260_P01R0302_00000
	CloseMsg
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _02FD
	ApplyMovement obj_P01R0302_gsbabygirl1, _0340
	GoTo _0305

_02FD:
	ApplyMovement obj_P01R0302_gsbabygirl1, _0350
_0305:
	WaitMovement
	GenderMsgBox msg_0260_P01R0302_00003, msg_0260_P01R0302_00002
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	SetVar VAR_UNK_40CB, 4
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	HidePerson obj_P01R0302_gsbabygirl1
	SetFlag FLAG_UNK_217
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

	.balign 4, 0
_0340:
	EmoteExclamationMark
	Delay8
	FaceNorth 2
	EndMovement

	.balign 4, 0
_0350:
	EmoteExclamationMark
	Delay8
	FaceEast 2
	EndMovement
	.balign 4, 0
