#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R37.h"
#include "msgdata/msg/msg_0393_R37.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R37_000
	ScrDef scr_seq_R37_001
	ScrDef scr_seq_R37_002
	ScrDef scr_seq_R37_003
	ScrDefEnd

scr_seq_R37_000:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _002D
	ClearFlag FLAG_UNK_1C3
	GoTo _0031

_002D:
	SetFlag FLAG_UNK_1C3
_0031:
	End

scr_seq_R37_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetPartyLeadAlive VAR_SPECIAL_x8002
	MonHasRibbon VAR_SPECIAL_RESULT, VAR_SPECIAL_x8002, RIBBON_SMILE
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0159
	GoToIfSet FLAG_DAILY_GOT_SHOCK_RIBBON, _016D
	Compare VAR_NUM_MET_WEEKDAY_SIBLINGS, 7
	GoToIfEq _0107
	GoToIfSet FLAG_GOT_MAGNET_FROM_SUNNY, _00E9
	GetWeekday VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _009A
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 27
	GoTo _00E1

_009A:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 24
	GoToIfNoItemSpace ITEM_MAGNET, 1, _00FD
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_MAGNET_FROM_SUNNY
	AddVar VAR_NUM_MET_WEEKDAY_SIBLINGS, 1
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 25
_00E1:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00E9:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 26
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00FD:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_0107:
	GetWeekday VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _012A
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 27
	GoTo _00E1

_012A:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 52
	BufferMonSpeciesName 0, VAR_SPECIAL_x8002
	MsgBoxExtern VAR_SPECIAL_RESULT, 54
	GiveRibbon VAR_SPECIAL_x8002, RIBBON_SMILE
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	SetFlag FLAG_DAILY_GOT_SHOCK_RIBBON
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0159:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 53
	WaitButton
	CloseMsg
	ReleaseAll
	End

_016D:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 55
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R37_002:
	DirectionSignpost msg_0393_R37_00000, 1, 3, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R37_003:
	ScrCmd_055 3, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0393_R37_00001, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
