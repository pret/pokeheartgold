#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D01R0101.h"
#include "msgdata/msg/msg_0047_D01R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D01R0101_000
	ScrDef scr_seq_D01R0101_001
	ScrDef scr_seq_D01R0101_002
	ScrDefEnd

scr_seq_D01R0101_000:
	GoToIfUnset FLAG_UNK_189, _001F
	ClearFlag FLAG_UNK_189
	End

_001F:
	CheckRegisteredPhoneNumber PHONE_CONTACT_BROCK, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _009E
	CheckBadge BADGE_EARTH, VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 1
	GoToIfEq _004D
	GoTo _0102
	End

_004D:
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 12
	GoToIfNe _0068
	ClearFlag FLAG_UNK_262
	GoTo _009C

_0068:
	Compare VAR_TEMP_x4000, 13
	GoToIfNe _007F
	ClearFlag FLAG_UNK_262
	GoTo _009C

_007F:
	Compare VAR_TEMP_x4000, 14
	GoToIfNe _0096
	ClearFlag FLAG_UNK_262
	GoTo _009C

_0096:
	GoTo _0102

_009C:
	End

_009E:
	GetPhoneBookRematch PHONE_CONTACT_BROCK, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _0102
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 17
	GoToIfNe _00CC
	ClearFlag FLAG_UNK_262
	GoTo _0100

_00CC:
	Compare VAR_TEMP_x4000, 18
	GoToIfNe _00E3
	ClearFlag FLAG_UNK_262
	GoTo _0100

_00E3:
	Compare VAR_TEMP_x4000, 19
	GoToIfNe _00FA
	ClearFlag FLAG_UNK_262
	GoTo _0100

_00FA:
	GoTo _0102

_0100:
	End

_0102:
	SetFlag FLAG_UNK_262
	End

scr_seq_D01R0101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckRegisteredPhoneNumber PHONE_CONTACT_BROCK, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _01B6
	Compare VAR_TEMP_x4003, 1
	GoToIfGe _01AB
	NPCMsg msg_0047_D01R0101_00001
_0133:
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0157
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfGe _019A
	End

_0157:
	BufferPlayersName 0
	NPCMsg msg_0047_D01R0101_00002
	PlayFanfare SEQ_ME_POKEGEAR_REGIST
	WaitFanfare
	RegisterGearNumber PHONE_CONTACT_BROCK
	NPCMsg msg_0047_D01R0101_00003
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	SetFlag FLAG_UNK_262
	HidePerson obj_D01R0101_gsleader14
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_019A:
	SetVar VAR_TEMP_x4003, 1
	NPCMsg msg_0047_D01R0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01AB:
	NPCMsg msg_0047_D01R0101_00005
	GoTo _0133
	End

_01B6:
	GetWeekday VAR_SPECIAL_x8004
	Compare VAR_SPECIAL_x8004, 1
	GoToIfNe _01D8
	GoToIfUnset FLAG_TRADE_BROCK_BONSLY_RHYHORN, _0292
	GoTo _020E

_01D8:
	Compare VAR_SPECIAL_x8004, 4
	GoToIfNe _01F6
	GoToIfUnset FLAG_TRADE_BROCK_BONSLY_RHYHORN, _0292
	GoTo _020E

_01F6:
	Compare VAR_SPECIAL_x8004, 6
	GoToIfNe _020E
	GoToIfUnset FLAG_TRADE_BROCK_BONSLY_RHYHORN, _0292
_020E:
	Compare VAR_TEMP_x4000, 55
	GoToIfEq _0357
	NPCMsg msg_0047_D01R0101_00006
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _027C
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0287
	NPCMsg msg_0047_D01R0101_00007
	CloseMsg
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 86
	FacePlayer
	LockAll
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ClearFlag FLAG_UNK_189
	NPCMsg msg_0047_D01R0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_027C:
	NPCMsg msg_0047_D01R0101_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0287:
	NPCMsg msg_0047_D01R0101_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0292:
	Compare VAR_TEMP_x4000, 111
	GoToIfNe _02A8
	NPCMsg msg_0047_D01R0101_00015
	GoTo _02AF

_02A8:
	BufferPlayersName 0
	GenderMsgBox msg_0047_D01R0101_00011, msg_0047_D01R0101_00012
_02AF:
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0346
	NPCMsg msg_0047_D01R0101_00013
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_566
	GetPartySelection VAR_SPECIAL_RESULT
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _0346
	LoadNPCTrade 11
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	GetPartyMonSpecies VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	NPCTradeGetReqSpecies VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	GoToIfNe _0339
	NPCTradeExec VAR_SPECIAL_x8004
	NPCTradeEnd
	SetMonMove VAR_SPECIAL_x8004, 0, MOVE_THUNDER_FANG
	SetFlag FLAG_TRADE_BROCK_BONSLY_RHYHORN
	SetVar VAR_TEMP_x4000, 55
	NPCMsg msg_0047_D01R0101_00016
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0339:
	NPCTradeEnd
	NPCMsg msg_0047_D01R0101_00018
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0346:
	NPCMsg msg_0047_D01R0101_00014
	WaitButton
	CloseMsg
	ReleaseAll
	SetVar VAR_TEMP_x4000, 111
	End

_0357:
	NPCMsg msg_0047_D01R0101_00017
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D01R0101_002:
	SimpleNPCMsg msg_0047_D01R0101_00000
	End
	.balign 4, 0
