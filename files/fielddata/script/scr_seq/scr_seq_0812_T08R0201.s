#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T08R0201.h"
#include "msgdata/msg/msg_0516_T08R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T08R0201_000
	ScrDef scr_seq_T08R0201_001
	ScrDef scr_seq_T08R0201_002
	ScrDef scr_seq_T08R0201_003
	ScrDef scr_seq_T08R0201_004
	ScrDef scr_seq_T08R0201_005
	ScrDef scr_seq_T08R0201_006
	ScrDef scr_seq_T08R0201_007
	ScrDef scr_seq_T08R0201_008
	ScrDef scr_seq_T08R0201_009
	ScrDefEnd

scr_seq_T08R0201_000:
	GoToIfSet FLAG_UNK_9CD, _003B
	SetVar VAR_PAL_PARK_HIGH_SCORE, 2000
_003B:
	ClearFlag FLAG_UNK_999
	SetFlag FLAG_UNK_9CD
	Compare VAR_UNK_4124, 0
	GoToIfNe _0052
	End

_0052:
	MovePerson obj_T08R0201_workman, 8, 9
	SetObjectFacing obj_T08R0201_workman, DIR_WEST
	End

_0062:
	Compare VAR_PAL_PARK_HIGH_SCORE, 2000
	GoToIfEq _0079
	BufferPlayersName 1
	BufferInt 2, VAR_PAL_PARK_HIGH_SCORE
	Return

_0079:
	BufferRivalsName 1
	BufferInt 2, VAR_PAL_PARK_HIGH_SCORE
	Return

scr_seq_T08R0201_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_136, _019B
	SetFlag FLAG_UNK_136
	BufferPlayersName 0
	GenderMsgBox msg_0516_T08R0201_00000, msg_0516_T08R0201_00001
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00C5
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0190
	End

_00C5:
	NPCMsg msg_0516_T08R0201_00002
	GoTo _00E9

_00CE:
	NPCMsg msg_0516_T08R0201_00003
	GoTo _00E9

_00D7:
	NPCMsg msg_0516_T08R0201_00004
	GoTo _00E9

_00E0:
	NPCMsg msg_0516_T08R0201_00005
	GoTo _00E9

_00E9:
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 194, 255, 0
	MenuItemAdd 195, 255, 1
	MenuItemAdd 196, 255, 2
	MenuItemAdd 198, 255, 4
	MenuExec
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00CE
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _00D7
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfEq _00E0
	GoTo _0144

_0144:
	NPCMsg msg_0516_T08R0201_00006
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0190
_015C:
	SetVar VAR_SPECIAL_RESULT, 0
	CountPCEmptySpace VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 6
	GoToIfLt _0274
	SetVar VAR_SPECIAL_RESULT, 0
	ScrCmd_509 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0260
	GoTo _01FB

_0190:
	NPCMsg msg_0516_T08R0201_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_019B:
	BufferPlayersName 0
	GenderMsgBox msg_0516_T08R0201_00008, msg_0516_T08R0201_00009
	GoTo _01A8

_01A8:
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 199, 255, 0
	MenuItemAdd 200, 255, 1
	MenuItemAdd 201, 255, 2
	MenuExec
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _015C
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _026B
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfEq _0190
	GoTo _0190

_01FB:
	Call _0062
	BufferPlayersName 0
	GenderMsgBox msg_0516_T08R0201_00010, msg_0516_T08R0201_00011
	CloseMsg
	ApplyMovement obj_T08R0201_workman, _0280
	WaitMovement
	ScrCmd_600
	ApplyMovement obj_player, _0294
	WaitMovement
	PlaySE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_PAL_PARK, 0, 24, 47, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Lock obj_partner_poke
	ScrCmd_606
	ApplyMovement obj_partner_poke, _02A0
	WaitMovement
	Release obj_partner_poke
	ReleaseAll
	End

_0260:
	NPCMsg msg_0516_T08R0201_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

_026B:
	NPCMsg msg_0516_T08R0201_00013
	GoTo _00E9

_0274:
	NPCMsg msg_0516_T08R0201_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0280:
	WalkOnSpotFastNorth
	WalkNormalNorth 2
	WalkNormalEast
	WalkOnSpotFastWest
	EndMovement

	.balign 4, 0
_0294:
	WalkNormalNorth 5
	SetInvisible
	EndMovement

	.balign 4, 0
_02A0:
	FaceNorth
	EndMovement

scr_seq_T08R0201_002:
	ScrCmd_609
	LockAll
	SetVar VAR_UNK_4124, 0
	ApplyMovement obj_player, _03D4
	WaitMovement
	ApplyMovement obj_T08R0201_workman, _03BC
	WaitMovement
	ScrCmd_606
	ReleaseAll
	End

scr_seq_T08R0201_001:
	ScrCmd_609
	LockAll
	SetVar VAR_UNK_4124, 0
	ApplyMovement obj_player, _03DC
	ApplyMovement obj_T08R0201_workman, _03C8
	WaitMovement
	PalParkScoreGet 0, VAR_SPECIAL_RESULT
	BufferInt 0, VAR_SPECIAL_RESULT
	PalParkScoreGet 1, VAR_SPECIAL_RESULT
	BufferInt 1, VAR_SPECIAL_RESULT
	PalParkScoreGet 2, VAR_SPECIAL_RESULT
	BufferInt 2, VAR_SPECIAL_RESULT
	PalParkScoreGet 3, VAR_SPECIAL_RESULT
	BufferInt 3, VAR_SPECIAL_RESULT
	NPCMsg msg_0516_T08R0201_00016
	PalParkScoreGet 3, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, VAR_PAL_PARK_HIGH_SCORE
	GoToIfGt _0339
	NPCMsg msg_0516_T08R0201_00018
	Call _0669
	GoTo _034E

_0339:
	NPCMsg msg_0516_T08R0201_00017
	Call _0669
	PalParkScoreGet 3, VAR_PAL_PARK_HIGH_SCORE
	GoTo _034E

_034E:
	NPCMsg msg_0516_T08R0201_00019
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0391
	NPCMsg msg_0516_T08R0201_00024
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0384
	GoTo _034E

_0384:
	NPCMsg msg_0516_T08R0201_00021
	WaitABPress
	CloseMsg
	GoTo _03A1

_0391:
	ScrCmd_510
	NPCMsg msg_0516_T08R0201_00020
	NPCMsg msg_0516_T08R0201_00022
	CloseMsg
	GoTo _03A1

_03A1:
	ApplyMovement obj_player, _03E8
	WaitMovement
	ApplyMovement obj_T08R0201_workman, _03BC
	WaitMovement
	ScrCmd_606
	ReleaseAll
	End

	.balign 4, 0
_03BC:
	WalkNormalWest
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_03C8:
	Delay8 2
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_03D4:
	WalkNormalSouth 5
	EndMovement

	.balign 4, 0
_03DC:
	WalkNormalSouth 2
	WalkOnSpotFastEast
	EndMovement

	.balign 4, 0
_03E8:
	WalkNormalSouth 4
	EndMovement

_03F0:
	SimpleNPCMsg msg_0516_T08R0201_00025
	End

scr_seq_T08R0201_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	BufferPlayersName 0
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfEq _0444
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0439
	GoTo _042E

_042E:
	NPCMsg msg_0516_T08R0201_00041
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0439:
	NPCMsg msg_0516_T08R0201_00042
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0444:
	NPCMsg msg_0516_T08R0201_00043
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T08R0201_005:
	BufferPlayersName 0
	SimpleNPCMsg msg_0516_T08R0201_00044
	End

scr_seq_T08R0201_006:
	SimpleNPCMsg msg_0516_T08R0201_00045
	End

scr_seq_T08R0201_007:
	SimpleNPCMsg msg_0516_T08R0201_00033
	End

scr_seq_T08R0201_008:
	Call _0062
	SimpleNPCMsg msg_0516_T08R0201_00025
	End

scr_seq_T08R0201_009:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_TEMP_x4009, 1
	GoToIfEq _0511
	ScrCmd_528 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 4
	GoToIfEq _051C
	Compare VAR_SPECIAL_RESULT, 5
	GoToIfEq _055D
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _059E
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfEq _05D7
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _0610
	GoTo _0506
	End

_0506:
	NPCMsg msg_0516_T08R0201_00034
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0511:
	NPCMsg msg_0516_T08R0201_00040
	WaitButton
	CloseMsg
	ReleaseAll
	End

_051C:
	HasItem ITEM_FASHION_CASE, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0506
	SetVar VAR_SPECIAL_x8004, 97
	SetVar VAR_SPECIAL_x8005, 1
	ScrCmd_404 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0506
	NPCMsg msg_0516_T08R0201_00035
	GoTo _0649
	End

_055D:
	HasItem ITEM_FASHION_CASE, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0506
	SetVar VAR_SPECIAL_x8004, 98
	SetVar VAR_SPECIAL_x8005, 1
	ScrCmd_404 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0506
	NPCMsg msg_0516_T08R0201_00036
	GoTo _0649
	End

_059E:
	HasItem ITEM_FASHION_CASE, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0506
	SetVar VAR_SPECIAL_x8004, 14
	ScrCmd_407 VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0506
	NPCMsg msg_0516_T08R0201_00037
	GoTo _0659
	End

_05D7:
	HasItem ITEM_FASHION_CASE, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0506
	SetVar VAR_SPECIAL_x8004, 15
	ScrCmd_407 VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0506
	NPCMsg msg_0516_T08R0201_00038
	GoTo _0659
	End

_0610:
	HasItem ITEM_FASHION_CASE, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0506
	SetVar VAR_SPECIAL_x8004, 16
	ScrCmd_407 VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0506
	NPCMsg msg_0516_T08R0201_00039
	GoTo _0659
	End

_0649:
	CallStd std_receive_accessory
	SetVar VAR_TEMP_x4009, 1
	CloseMsg
	ReleaseAll
	End

_0659:
	CallStd std_receive_background
	SetVar VAR_TEMP_x4009, 1
	CloseMsg
	ReleaseAll
	End

_0669:
	PalParkScoreGet 3, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 3000
	CallIfLt _06A5
	Compare VAR_SPECIAL_RESULT, 3300
	CallIfLt _071B
	Compare VAR_SPECIAL_RESULT, 3500
	CallIfLt _076A
	Compare VAR_SPECIAL_RESULT, 10000
	CallIfLt _07D3
	Return

_06A5:
	Random VAR_SPECIAL_x8006, 8
	Compare VAR_SPECIAL_x8006, 0
	CallIfEq _0861
	Compare VAR_SPECIAL_x8006, 1
	CallIfEq _0869
	Compare VAR_SPECIAL_x8006, 2
	CallIfEq _0871
	Compare VAR_SPECIAL_x8006, 3
	CallIfEq _0879
	Compare VAR_SPECIAL_x8006, 4
	CallIfEq _0881
	Compare VAR_SPECIAL_x8006, 5
	CallIfEq _0889
	Compare VAR_SPECIAL_x8006, 6
	CallIfEq _0891
	Compare VAR_SPECIAL_x8006, 7
	CallIfEq _0899
	Call _082F
	Return

_071B:
	Random VAR_SPECIAL_x8006, 5
	Compare VAR_SPECIAL_x8006, 0
	CallIfEq _08A1
	Compare VAR_SPECIAL_x8006, 1
	CallIfEq _08A9
	Compare VAR_SPECIAL_x8006, 2
	CallIfEq _08B1
	Compare VAR_SPECIAL_x8006, 3
	CallIfEq _08B9
	Compare VAR_SPECIAL_x8006, 4
	CallIfEq _08C1
	Call _082F
	Return

_076A:
	Random VAR_SPECIAL_x8006, 7
	Compare VAR_SPECIAL_x8006, 0
	CallIfEq _08C9
	Compare VAR_SPECIAL_x8006, 1
	CallIfEq _08D1
	Compare VAR_SPECIAL_x8006, 2
	CallIfEq _08D9
	Compare VAR_SPECIAL_x8006, 3
	CallIfEq _08E1
	Compare VAR_SPECIAL_x8006, 4
	CallIfEq _08E9
	Compare VAR_SPECIAL_x8006, 5
	CallIfEq _08F1
	Compare VAR_SPECIAL_x8006, 6
	CallIfEq _08F9
	Call _082F
	Return

_07D3:
	Random VAR_SPECIAL_x8006, 6
	Compare VAR_SPECIAL_x8006, 0
	CallIfEq _0901
	Compare VAR_SPECIAL_x8006, 1
	CallIfEq _0909
	Compare VAR_SPECIAL_x8006, 2
	CallIfEq _0911
	Compare VAR_SPECIAL_x8006, 3
	CallIfEq _0919
	Compare VAR_SPECIAL_x8006, 4
	CallIfEq _0921
	Compare VAR_SPECIAL_x8006, 5
	CallIfEq _0929
	Call _082F
	Return

_082F:
	HasSpaceForItem VAR_SPECIAL_x8006, 1, VAR_SPECIAL_x8007
	Compare VAR_SPECIAL_x8007, 0
	CallIfNe _084C
	SetVar VAR_SPECIAL_RESULT, 10000
	Return

_084C:
	NPCMsg msg_0516_T08R0201_00023
	GiveItemNoCheck VAR_SPECIAL_x8006, 1
	Return

_0861:
	SetVar VAR_SPECIAL_x8006, 149
	Return

_0869:
	SetVar VAR_SPECIAL_x8006, 150
	Return

_0871:
	SetVar VAR_SPECIAL_x8006, 151
	Return

_0879:
	SetVar VAR_SPECIAL_x8006, 152
	Return

_0881:
	SetVar VAR_SPECIAL_x8006, 153
	Return

_0889:
	SetVar VAR_SPECIAL_x8006, 154
	Return

_0891:
	SetVar VAR_SPECIAL_x8006, 155
	Return

_0899:
	SetVar VAR_SPECIAL_x8006, 156
	Return

_08A1:
	SetVar VAR_SPECIAL_x8006, 159
	Return

_08A9:
	SetVar VAR_SPECIAL_x8006, 160
	Return

_08B1:
	SetVar VAR_SPECIAL_x8006, 161
	Return

_08B9:
	SetVar VAR_SPECIAL_x8006, 162
	Return

_08C1:
	SetVar VAR_SPECIAL_x8006, 163
	Return

_08C9:
	SetVar VAR_SPECIAL_x8006, 164
	Return

_08D1:
	SetVar VAR_SPECIAL_x8006, 165
	Return

_08D9:
	SetVar VAR_SPECIAL_x8006, 166
	Return

_08E1:
	SetVar VAR_SPECIAL_x8006, 167
	Return

_08E9:
	SetVar VAR_SPECIAL_x8006, 168
	Return

_08F1:
	SetVar VAR_SPECIAL_x8006, 157
	Return

_08F9:
	SetVar VAR_SPECIAL_x8006, 158
	Return

_0901:
	SetVar VAR_SPECIAL_x8006, 169
	Return

_0909:
	SetVar VAR_SPECIAL_x8006, 170
	Return

_0911:
	SetVar VAR_SPECIAL_x8006, 171
	Return

_0919:
	SetVar VAR_SPECIAL_x8006, 172
	Return

_0921:
	SetVar VAR_SPECIAL_x8006, 173
	Return

_0929:
	SetVar VAR_SPECIAL_x8006, 174
	Return
	.balign 4, 0
