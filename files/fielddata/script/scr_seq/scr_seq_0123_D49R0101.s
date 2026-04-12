#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D49R0101.h"
#include "msgdata/msg/msg_0138_D49R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D49R0101_000
	ScrDef scr_seq_D49R0101_001
	ScrDef scr_seq_D49R0101_002
	ScrDef scr_seq_D49R0101_003
	ScrDef scr_seq_D49R0101_004
	ScrDef scr_seq_D49R0101_005
	ScrDef scr_seq_D49R0101_006
	ScrDef scr_seq_D49R0101_007
	ScrDef scr_seq_D49R0101_008
	ScrDef scr_seq_D49R0101_009
	ScrDef scr_seq_D49R0101_010
	ScrDef scr_seq_D49R0101_011
	ScrDef scr_seq_D49R0101_012
	ScrDef scr_seq_D49R0101_013
	ScrDef scr_seq_D49R0101_014
	ScrDef scr_seq_D49R0101_015
	ScrDef scr_seq_D49R0101_016
	ScrDef scr_seq_D49R0101_017
	ScrDef scr_seq_D49R0101_018
	ScrDef scr_seq_D49R0101_019
	ScrDef scr_seq_D49R0101_020
	ScrDef scr_seq_D49R0101_021
	ScrDef scr_seq_D49R0101_022
	ScrDef scr_seq_D49R0101_023
	ScrDefEnd

scr_seq_D49R0101_023:
	SetFlag FLAG_SYS_FLYPOINT_POKEATHLON
	End

	.balign 4, 0
_0068:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0070:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0078:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0080:
	WalkOnSpotNormalNorth
	EndMovement

scr_seq_D49R0101_000:
	ScrCmd_609
	LockAll
	GetPlayerFacing VAR_TEMP_x400A
	Compare VAR_TEMP_x400A, 0
	GoToIfNe _00AB
	ApplyMovement obj_player, _0230
	GoTo _00B3

_00AB:
	ApplyMovement obj_player, _023C
_00B3:
	WaitMovement
	ClearFlag FLAG_HIDE_POKEATHLON_RECEPTION_WHITNEY
	ShowPerson obj_D49R0101_gsleader3
	MovePersonFacing obj_D49R0101_gsleader3, 23, 0, 20, DIR_NORTH
	Compare VAR_TEMP_x400A, 0
	GoToIfNe _00EC
	ApplyMovement obj_D49R0101_gsleader3, _0248
	ApplyMovement obj_player, _0260
	GoTo _00F4

_00EC:
	ApplyMovement obj_D49R0101_gsleader3, _0258
_00F4:
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0138_D49R0101_00080
	CloseMsg
	Wait 30, VAR_SPECIAL_RESULT
	Compare VAR_TEMP_x400A, 0
	GoToIfNe _011F
	ApplyMovement obj_D49R0101_gsleader3, _0200
	GoTo _0127

_011F:
	ApplyMovement obj_D49R0101_gsleader3, _0218
_0127:
	WaitMovement
	NPCMsg msg_0138_D49R0101_00081
	CloseMsg
	Compare VAR_TEMP_x400A, 0
	GoToIfNe _0149
	ApplyMovement obj_D49R0101_gsleader3, _0270
	GoTo _018E

_0149:
	Compare VAR_TEMP_x400A, 3
	GoToIfNe _016C
	ApplyMovement obj_D49R0101_gsleader3, _02AC
	ApplyMovement obj_player, _0070
	GoTo _018E

_016C:
	ApplyMovement obj_D49R0101_gsleader3, _02E8
	ApplyMovement obj_player, _0070
	WaitMovement
	ApplyMovement obj_D49R0101_gsleader3, _0080
	ApplyMovement obj_player, _0078
_018E:
	WaitMovement
	NPCMsg msg_0138_D49R0101_00082
	CloseMsg
	NPCMsg msg_0138_D49R0101_00083
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	NPCMsg msg_0138_D49R0101_00084
	CloseMsg
	Compare VAR_TEMP_x400A, 0
	GoToIfNe _01BE
	ApplyMovement obj_D49R0101_gsleader3, _0328
	GoTo _01E1

_01BE:
	Compare VAR_TEMP_x400A, 3
	GoToIfNe _01D9
	ApplyMovement obj_D49R0101_gsleader3, _0338
	GoTo _01E1

_01D9:
	ApplyMovement obj_D49R0101_gsleader3, _0348
_01E1:
	ApplyMovement obj_player, _0078
	WaitMovement
	HidePerson obj_D49R0101_gsleader3
	SetFlag FLAG_HIDE_POKEATHLON_RECEPTION_WHITNEY
	ReleaseAll
	SetVar VAR_UNK_40E2, 1
	End

	.balign 4, 0
_0200:
	LockDir
	JumpNearFastEast
	UnlockDir
	Delay16 2
	WalkFastWest
	EndMovement

	.balign 4, 0
_0218:
	LockDir
	JumpNearFastSouth
	UnlockDir
	Delay16 2
	WalkFastNorth
	EndMovement

	.balign 4, 0
_0230:
	EmoteExclamationMark
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_023C:
	EmoteExclamationMark
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0248:
	WalkFasterEast
	WalkSlightlyFastNorth 10
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0258:
	WalkSlightlyFastNorth 9
	EndMovement

	.balign 4, 0
_0260:
	Delay2
	Delay8 8
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0270:
	WalkOnSpotNormalSouth
	Delay8
	WalkOnSpotNormalNorth
	Delay8
	WalkFastEast 6
	WalkFastNorth 6
	WalkNormalWest
	SetInvisible
	Delay16 2
	FaceEast
	SetVisible
	WalkNormalEast
	WalkFastSouth 6
	WalkFastWest 6
	EndMovement

	.balign 4, 0
_02AC:
	WalkFastEast 7
	WalkOnSpotNormalSouth
	Delay8
	WalkOnSpotNormalNorth
	Delay8
	WalkFastNorth 7
	WalkNormalWest
	SetInvisible
	Delay16 2
	FaceEast
	SetVisible
	WalkNormalEast
	WalkFastSouth 6
	WalkFastWest 6
	EndMovement

	.balign 4, 0
_02E8:
	WalkFastEast 7
	WalkOnSpotNormalSouth
	Delay8
	WalkOnSpotNormalNorth
	Delay8
	WalkFastNorth 7
	WalkNormalWest
	SetInvisible
	Delay16 2
	FaceEast
	SetVisible
	WalkNormalEast
	WalkFastSouth 7
	WalkFastWest 7
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0328:
	WalkSlightlyFastSouth 2
	WalkSlightlyFastWest
	WalkSlightlyFastSouth 8
	EndMovement

	.balign 4, 0
_0338:
	WalkSlightlyFastSouth
	WalkSlightlyFastWest
	WalkSlightlyFastSouth 9
	EndMovement

	.balign 4, 0
_0348:
	WalkSlightlyFastSouth 9
	EndMovement

scr_seq_D49R0101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfUnset FLAG_UNK_114, _03F1
	ScrCmd_834 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0400
	NPCMsg msg_0138_D49R0101_00049
_0377:
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 325, 255, 0
	MenuItemAdd 324, 255, 1
	MenuItemAdd 323, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _03C7
	Case 1, _03D7
	GoTo _03E4

_03C1:
	CloseMsg
	ReleaseAll
	End

_03C7:
	HoldMsg
	ScrCmd_815 0
	ScrCmd_771
	GoTo _03E4
	End

_03D7:
	TouchscreenMenuShow
	NPCMsg msg_0138_D49R0101_00052
	GoTo _0377
	End

_03E4:
	TouchscreenMenuShow
	NPCMsg msg_0138_D49R0101_00051
	WaitButton
	CloseMsg
	ReleaseAll
	End

_03F1:
	NPCMsg msg_0138_D49R0101_00048
	SetFlag FLAG_UNK_114
	GoTo _0377
	End

_0400:
	NPCMsg msg_0138_D49R0101_00050
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49R0101_002:
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfEq _05B7
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScrCmd_835 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 27
	GoToIfEq _05A9
	GoToIfUnset FLAG_UNK_115, _0529
	NPCMsg msg_0138_D49R0101_00054
_0443:
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 325, 255, 0
	MenuItemAdd 324, 255, 1
	MenuItemAdd 323, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0493
	Case 1, _04E8
	GoTo _051C

_048D:
	CloseMsg
	ReleaseAll
	End

_0493:
	HoldMsg
	ScrCmd_815 0
	ScrCmd_772
	ScrCmd_835 VAR_SPECIAL_x8005
	Compare VAR_SPECIAL_x8005, 6
	GoToIfEq _0538
	Compare VAR_SPECIAL_x8005, 12
	GoToIfEq _054B
	Compare VAR_SPECIAL_x8005, 18
	GoToIfEq _055E
	Compare VAR_SPECIAL_x8005, 24
	GoToIfEq _0571
	Compare VAR_SPECIAL_x8005, 27
	GoToIfEq _0595
	GoTo _051C
	End

_04E8:
	TouchscreenMenuShow
	NPCMsg msg_0138_D49R0101_00055
	ScrCmd_724 12, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 100
	GoToIfLt _0509
	NPCMsg msg_0138_D49R0101_00057
	GoTo _0511

_0509:
	BufferInt 0, VAR_SPECIAL_RESULT
	NPCMsg msg_0138_D49R0101_00056
_0511:
	NPCMsg msg_0138_D49R0101_00058
	GoTo _0443
	End

_051C:
	TouchscreenMenuShow
	NPCMsg msg_0138_D49R0101_00051
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0529:
	NPCMsg msg_0138_D49R0101_00053
	SetFlag FLAG_UNK_115
	GoTo _0443
	End

_0538:
	Compare VAR_UNK_4139, 0
	GoToIfEq _0584
	GoTo _051C

_054B:
	Compare VAR_UNK_4139, 1
	GoToIfEq _0584
	GoTo _051C

_055E:
	Compare VAR_UNK_4139, 2
	GoToIfEq _0584
	GoTo _051C

_0571:
	Compare VAR_UNK_4139, 3
	GoToIfEq _0584
	GoTo _051C

_0584:
	NPCMsg msg_0138_D49R0101_00061
	WaitButton
	CloseMsg
	ReleaseAll
	AddVar VAR_UNK_4139, 1
	End

_0595:
	BufferPlayersName 0
	NPCMsg msg_0138_D49R0101_00062
	WaitButton
	CloseMsg
	ReleaseAll
	AddVar VAR_UNK_4139, 1
	End

_05A9:
	BufferPlayersName 0
	NPCMsg msg_0138_D49R0101_00060
	WaitButton
	CloseMsg
	ReleaseAll
	End

_05B7:
	End

scr_seq_D49R0101_003:
	End

scr_seq_D49R0101_004:
	SimpleNPCMsg msg_0138_D49R0101_00068
	End

scr_seq_D49R0101_005:
	SimpleNPCMsg msg_0138_D49R0101_00069
	End

scr_seq_D49R0101_006:
	SimpleNPCMsg msg_0138_D49R0101_00070
	End

scr_seq_D49R0101_007:
	SimpleNPCMsg msg_0138_D49R0101_00071
	End

scr_seq_D49R0101_008:
	SimpleNPCMsg msg_0138_D49R0101_00072
	End

scr_seq_D49R0101_009:
	SimpleNPCMsg msg_0138_D49R0101_00073
	End

scr_seq_D49R0101_010:
	SimpleNPCMsg msg_0138_D49R0101_00074
	End

scr_seq_D49R0101_011:
	SimpleNPCMsg msg_0138_D49R0101_00075
	End

scr_seq_D49R0101_012:
	SimpleNPCMsg msg_0138_D49R0101_00076
	End

scr_seq_D49R0101_013:
	SimpleNPCMsg msg_0138_D49R0101_00077
	End

scr_seq_D49R0101_015:
	SimpleNPCMsg msg_0138_D49R0101_00063
	End

scr_seq_D49R0101_016:
	SimpleNPCMsg msg_0138_D49R0101_00064
	End

scr_seq_D49R0101_017:
	SimpleNPCMsg msg_0138_D49R0101_00065
	End

scr_seq_D49R0101_018:
	SimpleNPCMsg msg_0138_D49R0101_00066
	End

scr_seq_D49R0101_019:
	SimpleNPCMsg msg_0138_D49R0101_00067
	End

scr_seq_D49R0101_014:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	ScriptOverlayCmd 3, 0
	NPCMsg msg_0138_D49R0101_00085
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_x8000
	MenuItemAdd 337, 255, 0
	MenuItemAdd 338, 255, 1
	MenuItemAdd 12, 255, 2
	MenuExec
	CopyVar VAR_TEMP_x4005, VAR_SPECIAL_x8000
	Compare VAR_TEMP_x4005, 0
	GoToIfNe _072E
	ShowMoneyBox 20, 2
	GoTo _0759

_0728:
	GoTo _0748

_072E:
	Compare VAR_TEMP_x4005, 1
	GoToIfNe _0748
	ScrCmd_116 2, 20, 2
	GoTo _0A7F

_0748:
	TouchscreenMenuShow
	NPCMsg msg_0138_D49R0101_00091
	WaitButton
	CloseMsg
	ReleaseAll
	ScriptOverlayCmd 3, 1
	End

_0759:
	NPCMsg msg_0138_D49R0101_00086
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_x8000
	MenuItemAdd 209, 255, 0
	MenuItemAdd 210, 255, 1
	MenuItemAdd 211, 255, 2
	MenuItemAdd 212, 255, 3
	MenuExec
	Switch VAR_SPECIAL_x8000
	Case 0, _07C0
	Case 1, _07CC
	Case 2, _07D8
	TouchscreenMenuShow
	NPCMsg msg_0138_D49R0101_00091
	GoTo _0A5C

_07C0:
	SetVar VAR_SPECIAL_x8001, 30
	GoTo _08F8

_07CC:
	SetVar VAR_SPECIAL_x8001, 31
	GoTo _08F8

_07D8:
	SetVar VAR_SPECIAL_x8001, 32
	GoTo _08F8

_07E4:
	Compare VAR_TEMP_x4005, 0
	GoToIfNe _07FF
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 200
	GoTo _0812

_07FF:
	Compare VAR_TEMP_x4005, 1
	GoToIfNe _0812
	CheckAthletePoints VAR_SPECIAL_RESULT, 50
_0812:
	Return

_0814:
	Compare VAR_TEMP_x4005, 0
	GoToIfNe _082F
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 300
	GoTo _0842

_082F:
	Compare VAR_TEMP_x4005, 1
	GoToIfNe _0842
	CheckAthletePoints VAR_SPECIAL_RESULT, 80
_0842:
	Return

_0844:
	Compare VAR_TEMP_x4005, 0
	GoToIfNe _085F
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 350
	GoTo _0872

_085F:
	Compare VAR_TEMP_x4005, 1
	GoToIfNe _0872
	CheckAthletePoints VAR_SPECIAL_RESULT, 100
_0872:
	Return

_0874:
	Compare VAR_TEMP_x4005, 0
	GoToIfNe _088D
	SubMoneyImmediate 200
	GoTo _089E

_088D:
	Compare VAR_TEMP_x4005, 1
	GoToIfNe _089E
	TakeAthletePoints 50
_089E:
	Return

_08A0:
	Compare VAR_TEMP_x4005, 0
	GoToIfNe _08B9
	SubMoneyImmediate 300
	GoTo _08CA

_08B9:
	Compare VAR_TEMP_x4005, 1
	GoToIfNe _08CA
	TakeAthletePoints 80
_08CA:
	Return

_08CC:
	Compare VAR_TEMP_x4005, 0
	GoToIfNe _08E5
	SubMoneyImmediate 350
	GoTo _08F6

_08E5:
	Compare VAR_TEMP_x4005, 1
	GoToIfNe _08F6
	TakeAthletePoints 100
_08F6:
	Return

_08F8:
	Compare VAR_SPECIAL_x8000, 0
	CallIfEq _07E4
	Compare VAR_SPECIAL_x8000, 1
	CallIfEq _0814
	Compare VAR_SPECIAL_x8000, 2
	CallIfEq _0844
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0A07
	HasSpaceForItem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0A35
	Compare VAR_SPECIAL_x8000, 0
	CallIfEq _0874
	Compare VAR_SPECIAL_x8000, 1
	CallIfEq _08A0
	Compare VAR_SPECIAL_x8000, 2
	CallIfEq _08CC
	Compare VAR_TEMP_x4005, 0
	GoToIfNe _097D
	UpdateMoneyBox
	GoTo _098D

_097D:
	Compare VAR_TEMP_x4005, 1
	GoToIfNe _098D
	ScrCmd_118 2
_098D:
	BufferItemName 0, VAR_SPECIAL_x8001
	PlaySE SEQ_SE_DP_JIHANKI
	BufferItemName 0, VAR_SPECIAL_x8001
	NPCMsg msg_0138_D49R0101_00087
	GiveItemNoCheck VAR_SPECIAL_x8001, 1
	Random VAR_SPECIAL_RESULT, 64
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _09E6
	PlaySE SEQ_SE_DP_JIHANKI
	BufferItemName 0, VAR_SPECIAL_x8001
	NPCMsg msg_0138_D49R0101_00088
	HasSpaceForItem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0A35
	CallStd std_give_item_verbose
_09E6:
	Compare VAR_TEMP_x4005, 0
	GoToIfNe _09FF
	GoTo _0759

_09F9:
	GoTo _0A05

_09FF:
	GoTo _0A7F

_0A05:
	End

_0A07:
	TouchscreenMenuShow
	Compare VAR_TEMP_x4005, 0
	GoToIfNe _0A1F
	NPCMsg msg_0138_D49R0101_00089
	GoTo _0A2F

_0A1F:
	Compare VAR_TEMP_x4005, 1
	GoToIfNe _0A2F
	NPCMsg msg_0138_D49R0101_00090
_0A2F:
	GoTo _0A5C

_0A35:
	TouchscreenMenuShow
	CallStd std_bag_is_full
	CloseMsg
	Compare VAR_TEMP_x4005, 0
	GoToIfNe _0A52
	HideMoneyBox
	GoTo _0A54

_0A52:
	ScrCmd_117
_0A54:
	ScriptOverlayCmd 3, 1
	ReleaseAll
	End

_0A5C:
	WaitButton
	CloseMsg
	Compare VAR_TEMP_x4005, 0
	GoToIfNe _0A75
	HideMoneyBox
	GoTo _0A77

_0A75:
	ScrCmd_117
_0A77:
	ScriptOverlayCmd 3, 1
	ReleaseAll
	End

_0A7F:
	NPCMsg msg_0138_D49R0101_00086
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_x8000
	MenuItemAdd 339, 255, 0
	MenuItemAdd 340, 255, 1
	MenuItemAdd 341, 255, 2
	MenuItemAdd 212, 255, 3
	MenuExec
	Switch VAR_SPECIAL_x8000
	Case 0, _07C0
	Case 1, _07CC
	Case 2, _07D8
	TouchscreenMenuShow
	NPCMsg msg_0138_D49R0101_00091
	GoTo _0A5C
	End

scr_seq_D49R0101_020:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0138_D49R0101_00092
_0AF3:
	NPCMsg msg_0138_D49R0101_00093
	TouchscreenMenuHide
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 94, 255, 0
	MenuItemAdd 95, 255, 1
	MenuItemAdd 96, 255, 2
	MenuItemAdd 97, 255, 3
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0B57
	Case 1, _0B65
	Case 2, _0B73
	GoTo _0BA5
	End

_0B57:
	SetVar VAR_TEMP_x4007, 0
	GoTo _0B81
	End

_0B65:
	SetVar VAR_TEMP_x4007, 1
	GoTo _0B81
	End

_0B73:
	SetVar VAR_TEMP_x4007, 2
	GoTo _0B81
	End

_0B81:
	NPCMsg msg_0138_D49R0101_00098
	Wait 4, VAR_SPECIAL_RESULT
	NPCMsg msg_0138_D49R0101_00099
	Wait 4, VAR_SPECIAL_RESULT
	CloseMsg
	PlaySE SEQ_SE_DP_DECIDE
	ScrCmd_743 VAR_TEMP_x4007
	GoTo _0AF3
	End

_0BA5:
	TouchscreenMenuShow
	NPCMsg msg_0138_D49R0101_00101
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49R0101_021:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_152, _0C4C
	NPCMsg msg_0138_D49R0101_00103
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0BFE
	NPCMsg msg_0138_D49R0101_00105
	ScrCmd_724 14, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1000
	GoToIfGe _0C09
	NPCMsg msg_0138_D49R0101_00106
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0BFE:
	NPCMsg msg_0138_D49R0101_00104
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0C09:
	NPCMsg msg_0138_D49R0101_00107
	GoToIfNoItemSpace ITEM_RARE_CANDY, 1, _0C42
	CallStd std_give_item_verbose
	ScrCmd_725 0, 100
	SetFlag FLAG_UNK_152
	GoTo _0C4C
	End

_0C42:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_0C4C:
	NPCMsg msg_0138_D49R0101_00108
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49R0101_022:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_153, _0CF0
	ScrCmd_724 15, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 500
	GoToIfGe _0C86
	NPCMsg msg_0138_D49R0101_00109
	GoTo _0C9F

_0C86:
	Compare VAR_TEMP_x4000, 1000
	GoToIfGe _0C9C
	NPCMsg msg_0138_D49R0101_00111
	GoTo _0C9F

_0C9C:
	NPCMsg msg_0138_D49R0101_00112
_0C9F:
	Compare VAR_TEMP_x4000, 2001
	GoToIfGe _0CB7
	NPCMsg msg_0138_D49R0101_00110
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0CB7:
	NPCMsg msg_0138_D49R0101_00113
	GoToIfNoItemSpace ITEM_RARE_CANDY, 1, _0C42
	CallStd std_give_item_verbose
	ScrCmd_725 0, 100
	SetFlag FLAG_UNK_153
	GoTo _0CF0
	End

_0CF0:
	NPCMsg msg_0138_D49R0101_00114
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
