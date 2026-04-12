#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D46R0101.h"
#include "msgdata/msg/msg_0132_D46R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D46R0101_000
	ScrDef scr_seq_D46R0101_001
	ScrDefEnd

scr_seq_D46R0101_001:
	CheckRegisteredPhoneNumber PHONE_CONTACT_BUGSY, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _0047
	GoToIfSet FLAG_GAME_CLEAR, _0030
	GoTo _0047
	End

_0030:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 4
	GoToIfNe _0047
	ClearFlag FLAG_UNK_263
	End

_0047:
	SetFlag FLAG_UNK_263
	End

scr_seq_D46R0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_TEMP_x4002, 1
	GoToIfGe _00DD
	NPCMsg msg_0132_D46R0101_00000
_0065:
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0089
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfGe _00CC
	End

_0089:
	BufferPlayersName 0
	NPCMsg msg_0132_D46R0101_00001
	PlayFanfare SEQ_ME_POKEGEAR_REGIST
	WaitFanfare
	RegisterGearNumber PHONE_CONTACT_BUGSY
	NPCMsg msg_0132_D46R0101_00002
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	SetFlag FLAG_UNK_263
	HidePerson obj_D46R0101_gsleader2
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_00CC:
	SetVar VAR_TEMP_x4002, 1
	NPCMsg msg_0132_D46R0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00DD:
	NPCMsg msg_0132_D46R0101_00004
	GoTo _0065
	End

	.balign 4, 0
