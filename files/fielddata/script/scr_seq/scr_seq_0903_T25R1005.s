#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R1005.h"
#include "msgdata/msg/msg_0596_T25R1005.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T25R1005_000
	ScrDef scr_seq_T25R1005_001
	ScrDef scr_seq_T25R1005_002
	ScrDef scr_seq_T25R1005_003
	ScrDef scr_seq_T25R1005_004
	ScrDef scr_seq_T25R1005_005
	ScrDef scr_seq_T25R1005_006
	ScrDefEnd

scr_seq_T25R1005_005:
	SetFlag FLAG_HIDE_GOLDENROD_DEPT_STORE_5F_RETURN_FRUSTRATION_LADY
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _0046
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _0044
	ClearFlag FLAG_HIDE_GOLDENROD_DEPT_STORE_5F_RETURN_FRUSTRATION_LADY
_0044:
	End

_0046:
	ClearFlag FLAG_HIDE_GOLDENROD_DEPT_STORE_5F_RETURN_FRUSTRATION_LADY
	End

scr_seq_T25R1005_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallStd std_mart_intro
	HoldMsg
	SetVar VAR_SPECIAL_x8004, 7
	CallStd std_special_mart
	ReleaseAll
	End

scr_seq_T25R1005_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _0086
	NPCMsg msg_0596_T25R1005_00018
	GoTo _0089

_0086:
	NPCMsg msg_0596_T25R1005_00017
_0089:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R1005_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _00AF
	NPCMsg msg_0596_T25R1005_00016
	GoTo _00B2

_00AF:
	NPCMsg msg_0596_T25R1005_00015
_00B2:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R1005_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_SYS_ROCKET_COSTUME, _017D
	GoToIfSet FLAG_TRADE_GOLDENROD_CITY_DROWZEE_MACHOP, _0172
	NPCMsg msg_0596_T25R1005_00009
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00F6
	GoTo _0167

_00F6:
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_566
	GetPartySelection VAR_SPECIAL_RESULT
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _0167
	LoadNPCTrade 1
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	GetPartyMonSpecies VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	NPCTradeGetReqSpecies VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	GoToIfNe _015A
	NPCTradeExec VAR_SPECIAL_x8004
	NPCTradeEnd
	SetFlag FLAG_TRADE_GOLDENROD_CITY_DROWZEE_MACHOP
	NPCMsg msg_0596_T25R1005_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_015A:
	NPCTradeEnd
	NPCMsg msg_0596_T25R1005_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0167:
	NPCMsg msg_0596_T25R1005_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0172:
	NPCMsg msg_0596_T25R1005_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

_017D:
	NPCMsg msg_0596_T25R1005_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R1005_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0596_T25R1005_00019
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R1005_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_08E, _0219
	GetPartyLeadAlive VAR_SPECIAL_x8000
	BufferMonSpeciesName 0, VAR_SPECIAL_x8000
	NPCMsg msg_0596_T25R1005_00000
	MonGetFriendship VAR_SPECIAL_RESULT, VAR_SPECIAL_x8000
	Compare VAR_SPECIAL_RESULT, 149
	GoToIfGe _01E3
	Compare VAR_SPECIAL_RESULT, 50
	GoToIfLe _01FE
	NPCMsg msg_0596_T25R1005_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01E3:
	NPCMsg msg_0596_T25R1005_00001
	SetVar VAR_SPECIAL_x8004, 354
	SetVar VAR_SPECIAL_x8005, 1
	CallStd std_obtain_item_verbose
	CloseMsg
	GoTo _0219

_01FE:
	NPCMsg msg_0596_T25R1005_00004
	SetVar VAR_SPECIAL_x8004, 348
	SetVar VAR_SPECIAL_x8005, 1
	CallStd std_obtain_item_verbose
	CloseMsg
	GoTo _0219

_0219:
	NPCMsg msg_0596_T25R1005_00006
	SetFlag FLAG_UNK_08E
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
