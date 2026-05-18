#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0151.h"
#include "msgdata/msg/msg_0246.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_0151_000
	ScrDef scr_seq_0151_001
	ScrDef scr_seq_0151_002
	ScrDef scr_seq_0151_003
	ScrDef scr_seq_0151_004
	ScrDef scr_seq_0151_005
	ScrDef scr_seq_0151_006
	ScrDef scr_seq_0151_007
	ScrDef scr_seq_0151_008
	ScrDef scr_seq_0151_009
	ScrDef scr_seq_0151_010
	ScrDef scr_seq_0151_011
	ScrDef scr_seq_0151_012
	ScrDef scr_seq_0151_013
	ScrDef scr_seq_0151_014
	ScrDef scr_seq_0151_015
	ScrDef scr_seq_0151_016
	ScrDef scr_seq_0151_017
	ScrDef scr_seq_0151_018
	ScrDef scr_seq_0151_019
	ScrDef scr_seq_0151_020
	ScrDef scr_seq_0151_021
	ScrDef scr_seq_0151_022
	ScrDef scr_seq_0151_023
	ScrDef scr_seq_0151_024
	ScrDef scr_seq_0151_025
	ScrDef scr_seq_0151_026
	ScrDef scr_seq_0151_027
	ScrDef scr_seq_0151_028
	ScrDefEnd

_0076:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_NATIONAL_PARK, 0, 46, 50, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Return

scr_seq_0151_000:
	ScrCmd_609
	LockAll
	PlaySE SEQ_SE_DP_PINPON
	NPCMsg msg_0246_00000
	CloseMsg
	Call _0076
	ReleaseAll
	End

scr_seq_0151_001:
	ScrCmd_609
	LockAll
	PlaySE SEQ_SE_DP_PINPON
	NPCMsg msg_0246_00001
	CloseMsg
	Call _0076
	ReleaseAll
	End

scr_seq_0151_002:
	End

scr_seq_0151_003:
	End

scr_seq_0151_004:
	ScrCmd_609
	LockAll
	BugContestGetTimeLeft 0
	NPCMsg msg_0246_00003
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	CloseMsg
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _00F9
	Call _0076
	ReleaseAll
	End

_00F9:
	ReleaseAll
	End

scr_seq_0151_005:
	Compare VAR_BUG_CONTEST_HELD_PRIZE, 0
	GoToIfEq _0114
	Call _02BC
	RestartCurrentScript
	End

_0114:
	GoToIfSet FLAG_DAILY_DID_BUG_CONTEST, _02A6
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _0139
	NPCMsg msg_0246_00004
	GoTo _016E

_0139:
	Compare VAR_TEMP_x4000, 4
	GoToIfNe _014F
	NPCMsg msg_0246_00005
	GoTo _016E

_014F:
	Compare VAR_TEMP_x4000, 6
	GoToIfNe _0165
	NPCMsg msg_0246_00006
	GoTo _016E

_0165:
	NPCMsg msg_0246_00007
	GoTo _0260

_016E:
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _018E
	NPCMsg msg_0246_00017
	GoTo _0260
	End

_018E:
	CountPCEmptySpace VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _01B0
	GetPartyCount VAR_SPECIAL_x8004
	Compare VAR_SPECIAL_x8004, 6
	GoToIfEq _02B1
_01B0:
	CountAliveMons VAR_SPECIAL_x8005, 6
	Compare VAR_SPECIAL_x8005, 1
	GoToIfNe _01D4
	GetPartyCount VAR_SPECIAL_x8004
	Compare VAR_SPECIAL_x8004, 1
	GoToIfEq _021A
_01D4:
	GetPartyLeadAlive VAR_SPECIAL_RESULT
	BufferPartyMonNick 0, VAR_SPECIAL_RESULT
	NPCMsg msg_0246_00010
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0200
	NPCMsg msg_0246_00028
	GoTo _0260
	End

_0200:
	FadeOutBGM 0, 10
	PlayBGM SEQ_GS_TAIKAIMAE
	BufferPlayersName 0
	NPCMsg msg_0246_00013
	SetFlag FLAG_BUG_CONTEST_OTHER_POKES_HELD
	GoTo _0224

_021A:
	FadeOutBGM 0, 10
	PlayBGM SEQ_GS_TAIKAIMAE
_0224:
	BufferPlayersName 0
	NPCMsg msg_0246_00014
	NPCMsg msg_0246_00015
	SetFlag FLAG_BUG_CONTEST_ACTIVE
	SetFlag FLAG_UNK_24E
	SetVar VAR_UNK_4118, 1
	SetVar VAR_UNK_40F7, 1
	ScriptOverlayCmd 1, 0
	BugContestAction 0, VAR_TEMP_x4000
	Call _0268
	ScriptOverlayCmd 1, 1
	SetFlag FLAG_UNK_996
	GoTo _0262
	End

_0260:
	WaitButton
_0262:
	CloseMsg
	RestartCurrentScript
	End

_0268:
	SetVar VAR_SPECIAL_x8004, 0
	SetVar VAR_SPECIAL_x8005, 627
_0274:
	IsBugContestantRegistered VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _028B
	SetFlagVar VAR_SPECIAL_x8005
_028B:
	AddVar VAR_SPECIAL_x8004, 1
	AddVar VAR_SPECIAL_x8005, 1
	Compare VAR_SPECIAL_x8004, 10
	GoToIfLt _0274
	Return

_02A6:
	NPCMsg msg_0246_00018
	GoTo _0260
	End

_02B1:
	NPCMsg msg_0246_00016
	GoTo _0260
	End

_02BC:
	BufferPlayersName 0
	NPCMsg msg_0246_00020
	HasSpaceForItem VAR_BUG_CONTEST_HELD_PRIZE, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _02F3
	CopyVar VAR_SPECIAL_x8004, VAR_BUG_CONTEST_HELD_PRIZE
	SetVar VAR_SPECIAL_x8005, 1
	CallStd std_obtain_item_verbose
	SetVar VAR_BUG_CONTEST_HELD_PRIZE, 0
	GoTo _02F8

_02F3:
	NPCMsg msg_0246_00021
	WaitButton
_02F8:
	CloseMsg
	Return

_02FC:
	NPCMsg msg_0246_00018
	GoTo _0260
	End

scr_seq_0151_006:
	BugContestGetTimeLeft 0
	NPCMsg msg_0246_00023
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _032B
	NPCMsg msg_0246_00026
	CloseMsg
	RestartCurrentScript
	End

_032B:
	NPCMsg msg_0246_00027
	CloseMsg
	SetVar VAR_UNK_4118, 2
	Call _0076
	RestartCurrentScript
	End

scr_seq_0151_007:
	ScrCmd_609
	LockAll
	SetVar VAR_UNK_4118, 0
	SetVar VAR_UNK_40F7, 0
	ScriptOverlayCmd 1, 0
	JudgeBugContest VAR_TEMP_x4000, VAR_TEMP_x4001, VAR_TEMP_x4002
	GetPlayerCoords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	ScrCmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	ApplyMovement 241, _053C
	WaitMovement
	NPCMsg msg_0246_00029
	BufferBugContestWinner 2
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _038E
	NPCMsg msg_0246_00030
	GoTo _0391

_038E:
	NPCMsg msg_0246_00031
_0391:
	PlayFanfare SEQ_ME_MUSHITORI3
	WaitFanfare
	NPCMsg msg_0246_00032
	BufferBugContestWinner 1
	Compare VAR_TEMP_x4000, 1
	GoToIfNe _03B3
	NPCMsg msg_0246_00033
	GoTo _03B6

_03B3:
	NPCMsg msg_0246_00034
_03B6:
	PlayFanfare SEQ_ME_MUSHITORI2
	WaitFanfare
	NPCMsg msg_0246_00032
	BufferBugContestWinner 0
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _03DC
	SetFlag FLAG_WON_THIS_BUG_CONTEST
	NPCMsg msg_0246_00035
	GoTo _03E3

_03DC:
	ClearFlag FLAG_WON_THIS_BUG_CONTEST
	NPCMsg msg_0246_00036
_03E3:
	PlayFanfare SEQ_ME_MUSHITORI1
	WaitFanfare
	NPCMsg msg_0246_00032
	BufferPlayersName 0
	BufferItemName 3, VAR_TEMP_x4001
	SetVar VAR_SPECIAL_x8004, 37
	AddVar VAR_SPECIAL_x8004, VAR_TEMP_x4000
	NonNPCMsgVar VAR_SPECIAL_x8004
	CopyVar VAR_SPECIAL_x8004, VAR_TEMP_x4001
	SetVar VAR_SPECIAL_x8005, 1
	HasSpaceForItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _042F
	CallStd std_give_item_verbose
	GoTo _043B

_042F:
	BufferPlayersName 0
	NPCMsg msg_0246_00045
	CopyVar VAR_BUG_CONTEST_HELD_PRIZE, VAR_TEMP_x4001
_043B:
	CallIfSet FLAG_BUG_CONTEST_OTHER_POKES_HELD, _04F6
	NPCMsg msg_0246_00042
	Compare VAR_TEMP_x4002, 0
	GoToIfNe _045E
	CloseMsg
	GoTo _04B5

_045E:
	BufferSpeciesName 1, VAR_TEMP_x4002, 2, 1
	NPCMsg msg_0246_00043
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	CloseMsg
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _049E
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	NicknameInput 255, VAR_SPECIAL_RESULT
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_049E:
	BufferBugContestMonNick 5, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _04B5
	NPCMsg msg_0246_00046
	CloseMsg
_04B5:
	ApplyMovement 241, _0544
	WaitMovement
	FadeOutBGM 0, 10
	PlayBGM SEQ_GS_D_KOUEN
	ScrCmd_103
	Call _04FD
	SetFlag FLAG_DAILY_DID_BUG_CONTEST
	ClearFlag FLAG_BUG_CONTEST_ACTIVE
	ClearFlag FLAG_UNK_24E
	ClearFlag FLAG_BUG_CONTEST_OTHER_POKES_HELD
	BugContestAction 1, 0
	ScriptOverlayCmd 1, 1
	FadeOutBGM 0, 30
	ResetBGM
	ReleaseAll
	End

_04F6:
	NPCMsg msg_0246_00047
	CloseMsg
	Return

_04FD:
	SetVar VAR_SPECIAL_x8004, 0
	SetVar VAR_SPECIAL_x8005, 10
	SetVar VAR_SPECIAL_x8006, 627
_050F:
	ScrCmd_109 VAR_SPECIAL_x8005, 2
	ClearFlagVar VAR_SPECIAL_x8006
	AddVar VAR_SPECIAL_x8004, 1
	AddVar VAR_SPECIAL_x8005, 1
	AddVar VAR_SPECIAL_x8006, 1
	Compare VAR_SPECIAL_x8004, 10
	GoToIfLt _050F
	Return

	.balign 4, 0
_053C:
	WalkNormalEast 5
	EndMovement

	.balign 4, 0
_0544:
	WalkNormalWest 5
	EndMovement

scr_seq_0151_008:
	SimpleNPCMsg msg_0246_00048
	End

scr_seq_0151_009:
	GoToIfSet FLAG_WON_THIS_BUG_CONTEST, _0581
	SimpleNPCMsg msg_0246_00049
	GoTo _0592

_0581:
	SimpleNPCMsg msg_0246_00050
_0592:
	End

scr_seq_0151_010:
	SimpleNPCMsg msg_0246_00051
	End

scr_seq_0151_011:
	GoToIfSet FLAG_WON_THIS_BUG_CONTEST, _05C9
	SimpleNPCMsg msg_0246_00052
	GoTo _05DA

_05C9:
	SimpleNPCMsg msg_0246_00053
_05DA:
	End

scr_seq_0151_012:
	SimpleNPCMsg msg_0246_00054
	End

scr_seq_0151_013:
	GoToIfSet FLAG_WON_THIS_BUG_CONTEST, _0611
	SimpleNPCMsg msg_0246_00055
	GoTo _0622

_0611:
	SimpleNPCMsg msg_0246_00056
_0622:
	End

scr_seq_0151_014:
	SimpleNPCMsg msg_0246_00057
	End

scr_seq_0151_015:
	GoToIfSet FLAG_WON_THIS_BUG_CONTEST, _0659
	SimpleNPCMsg msg_0246_00058
	GoTo _066A

_0659:
	SimpleNPCMsg msg_0246_00059
_066A:
	End

scr_seq_0151_016:
	SimpleNPCMsg msg_0246_00060
	End

scr_seq_0151_017:
	GoToIfSet FLAG_WON_THIS_BUG_CONTEST, _06A1
	SimpleNPCMsg msg_0246_00061
	GoTo _06B2

_06A1:
	SimpleNPCMsg msg_0246_00062
_06B2:
	End

scr_seq_0151_018:
	SimpleNPCMsg msg_0246_00063
	End

scr_seq_0151_019:
	GoToIfSet FLAG_WON_THIS_BUG_CONTEST, _06E9
	SimpleNPCMsg msg_0246_00064
	GoTo _06FA

_06E9:
	SimpleNPCMsg msg_0246_00065
_06FA:
	End

scr_seq_0151_020:
	SimpleNPCMsg msg_0246_00066
	End

scr_seq_0151_021:
	GoToIfSet FLAG_WON_THIS_BUG_CONTEST, _0731
	SimpleNPCMsg msg_0246_00067
	GoTo _0742

_0731:
	SimpleNPCMsg msg_0246_00068
_0742:
	End

scr_seq_0151_022:
	SimpleNPCMsg msg_0246_00069
	End

scr_seq_0151_023:
	GoToIfSet FLAG_WON_THIS_BUG_CONTEST, _0779
	SimpleNPCMsg msg_0246_00070
	GoTo _078A

_0779:
	SimpleNPCMsg msg_0246_00071
_078A:
	End

scr_seq_0151_024:
	SimpleNPCMsg msg_0246_00072
	End

scr_seq_0151_025:
	GoToIfSet FLAG_WON_THIS_BUG_CONTEST, _07C1
	SimpleNPCMsg msg_0246_00073
	GoTo _07D2

_07C1:
	SimpleNPCMsg msg_0246_00074
_07D2:
	End

scr_seq_0151_026:
	SimpleNPCMsg msg_0246_00075
	End

scr_seq_0151_027:
	GoToIfSet FLAG_WON_THIS_BUG_CONTEST, _0809
	SimpleNPCMsg msg_0246_00076
	GoTo _081A

_0809:
	SimpleNPCMsg msg_0246_00077
_081A:
	End

scr_seq_0151_028:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_BUG_CONTEST_HELD_PRIZE, 0
	GoToIfEq _083D
	Call _02BC
	GoTo _0844

_083D:
	NPCMsg msg_0246_00022
	WaitButton
	CloseMsg
_0844:
	ReleaseAll
	End
	.balign 4, 0
