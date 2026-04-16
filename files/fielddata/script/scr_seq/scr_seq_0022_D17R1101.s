#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D17R1101.h"
#include "msgdata/msg/msg_0059_D17R1101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D17R1101_000
	ScrDef scr_seq_D17R1101_001
	ScrDefEnd

scr_seq_D17R1101_000:
	GoToIfUnset FLAG_UNK_189, _001B
	ClearFlag FLAG_UNK_189
	End

_001B:
	GoToIfUnset FLAG_GAME_CLEAR, _00A5
	GetPhoneBookRematch PHONE_CONTACT_MORTY, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _00A5
	CheckRegisteredPhoneNumber PHONE_CONTACT_MORTY, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _0084
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfNe _0067
	ClearFlag FLAG_UNK_2CA
	GoTo _0082

_0067:
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _007E
	ClearFlag FLAG_UNK_2CA
	GoTo _0082

_007E:
	SetFlag FLAG_UNK_2CA
_0082:
	End

_0084:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 5
	GoToIfNe _009F
	ClearFlag FLAG_UNK_2CA
	GoTo _00A3

_009F:
	SetFlag FLAG_UNK_2CA
_00A3:
	End

_00A5:
	SetFlag FLAG_UNK_2CA
	End

scr_seq_D17R1101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckRegisteredPhoneNumber PHONE_CONTACT_MORTY, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _0159
	Compare VAR_TEMP_x4002, 1
	GoToIfGe _014E
	NPCMsg msg_0059_D17R1101_00000
_00D6:
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00FA
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfGe _013D
	End

_00FA:
	BufferPlayersName 0
	NPCMsg msg_0059_D17R1101_00001
	PlayFanfare SEQ_ME_POKEGEAR_REGIST
	WaitFanfare
	RegisterGearNumber PHONE_CONTACT_MORTY
	NPCMsg msg_0059_D17R1101_00002
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	SetFlag FLAG_UNK_2CA
	HidePerson obj_D17R1101_gsleader4
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_013D:
	SetVar VAR_TEMP_x4002, 1
	NPCMsg msg_0059_D17R1101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_014E:
	NPCMsg msg_0059_D17R1101_00004
	GoTo _00D6
	End

_0159:
	NPCMsg msg_0059_D17R1101_00005
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _01BA
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _01C5
	NPCMsg msg_0059_D17R1101_00006
	CloseMsg
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 20
	FacePlayer
	LockAll
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ClearFlag FLAG_UNK_189
	NPCMsg msg_0059_D17R1101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01BA:
	NPCMsg msg_0059_D17R1101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01C5:
	NPCMsg msg_0059_D17R1101_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
