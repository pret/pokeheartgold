#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R1006.h"
#include "msgdata/msg/msg_0597_T25R1006.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T25R1006_000
	ScrDef scr_seq_T25R1006_001
	ScrDef scr_seq_T25R1006_002
	ScrDef scr_seq_T25R1006_003
	ScrDef scr_seq_T25R1006_004
	ScrDef scr_seq_T25R1006_005
	ScrDef scr_seq_T25R1006_006
	ScrDef scr_seq_T25R1006_007
	ScrDefEnd

scr_seq_T25R1006_006:
	GoToIfUnset FLAG_UNK_189, _0033
	ClearFlag FLAG_UNK_189
	End

_0033:
	GoToIfUnset FLAG_GAME_CLEAR, _011D
	GetPhoneBookRematch PHONE_CONTACT_WHITNEY, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _011D
	CheckRegisteredPhoneNumber PHONE_CONTACT_WHITNEY, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _00CC
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 12
	GoToIfNe _007F
	ClearFlag FLAG_UNK_26F
	GoTo _00CA

_007F:
	Compare VAR_TEMP_x4000, 13
	GoToIfNe _0096
	ClearFlag FLAG_UNK_26F
	GoTo _00CA

_0096:
	Compare VAR_TEMP_x4000, 14
	GoToIfNe _00AD
	ClearFlag FLAG_UNK_26F
	GoTo _00CA

_00AD:
	Compare VAR_TEMP_x4000, 15
	GoToIfNe _00C4
	ClearFlag FLAG_UNK_26F
	GoTo _00CA

_00C4:
	GoTo _011D

_00CA:
	End

_00CC:
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 18
	GoToIfNe _00E7
	ClearFlag FLAG_UNK_26F
	GoTo _011B

_00E7:
	Compare VAR_TEMP_x4000, 19
	GoToIfNe _00FE
	ClearFlag FLAG_UNK_26F
	GoTo _011B

_00FE:
	Compare VAR_TEMP_x4000, 20
	GoToIfNe _0115
	ClearFlag FLAG_UNK_26F
	GoTo _011B

_0115:
	GoTo _011D

_011B:
	End

_011D:
	SetFlag FLAG_UNK_26F
	End

scr_seq_T25R1006_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ShowMoneyBox 20, 2
	NPCMsg msg_0597_T25R1006_00010
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0156
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _04A3
_0156:
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 300
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _04D2
	SubMoneyImmediate 300
	UpdateMoneyBox
	PlaySE SEQ_SE_DP_REGI
	WaitSE SEQ_SE_DP_REGI
	NPCMsg msg_0597_T25R1006_00011
	Random VAR_SPECIAL_RESULT, 100
	Compare VAR_SPECIAL_RESULT, 40
	GoToIfGe _01AD
	Compare VAR_SPECIAL_RESULT, 4
	GoToIfGe _02B5
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfGe _03AC
	End

_01AD:
	PlaySE SEQ_SE_GS_KUJI_ATARI
	BufferInt 0, 3
	NPCMsg msg_0597_T25R1006_00012
	Random VAR_SPECIAL_RESULT, 70
	Compare VAR_SPECIAL_RESULT, 60
	GoToIfGe _021C
	Compare VAR_SPECIAL_RESULT, 50
	GoToIfGe _022E
	Compare VAR_SPECIAL_RESULT, 40
	GoToIfGe _0240
	Compare VAR_SPECIAL_RESULT, 30
	GoToIfGe _0252
	Compare VAR_SPECIAL_RESULT, 20
	GoToIfGe _0264
	Compare VAR_SPECIAL_RESULT, 10
	GoToIfGe _0276
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfGe _0288
	End

_021C:
	SetVar VAR_SPECIAL_x8004, 155
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _0294

_022E:
	SetVar VAR_SPECIAL_x8004, 150
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _0294

_0240:
	SetVar VAR_SPECIAL_x8004, 151
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _0294

_0252:
	SetVar VAR_SPECIAL_x8004, 152
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _0294

_0264:
	SetVar VAR_SPECIAL_x8004, 153
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _0294

_0276:
	SetVar VAR_SPECIAL_x8004, 156
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _0294

_0288:
	SetVar VAR_SPECIAL_x8004, 149
	SetVar VAR_SPECIAL_x8005, 1
_0294:
	HasSpaceForItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _04B0
	CallStd std_obtain_item_verbose
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_02B5:
	PlaySE SEQ_SE_GS_KUJI_ATARI
	BufferInt 0, 2
	NPCMsg msg_0597_T25R1006_00012
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _02E4
	SetVar VAR_SPECIAL_x8004, 11
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _038B

_02E4:
	Compare VAR_TEMP_x4000, 1
	GoToIfNe _0303
	SetVar VAR_SPECIAL_x8004, 8
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _038B

_0303:
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _0322
	SetVar VAR_SPECIAL_x8004, 9
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _038B

_0322:
	Compare VAR_TEMP_x4000, 3
	GoToIfNe _0341
	SetVar VAR_SPECIAL_x8004, 6
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _038B

_0341:
	Compare VAR_TEMP_x4000, 4
	GoToIfNe _0360
	SetVar VAR_SPECIAL_x8004, 15
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _038B

_0360:
	Compare VAR_TEMP_x4000, 5
	GoToIfNe _037F
	SetVar VAR_SPECIAL_x8004, 13
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _038B

_037F:
	SetVar VAR_SPECIAL_x8004, 10
	SetVar VAR_SPECIAL_x8005, 1
_038B:
	HasSpaceForItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _04B0
	CallStd std_obtain_item_verbose
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_03AC:
	PlaySE SEQ_SE_GS_KUJI_OOATARI
	BufferInt 0, 1
	NPCMsg msg_0597_T25R1006_00012
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _03DB
	SetVar VAR_SPECIAL_x8004, 329
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _0482

_03DB:
	Compare VAR_TEMP_x4000, 1
	GoToIfNe _03FA
	SetVar VAR_SPECIAL_x8004, 392
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _0482

_03FA:
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _0419
	SetVar VAR_SPECIAL_x8004, 418
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _0482

_0419:
	Compare VAR_TEMP_x4000, 3
	GoToIfNe _0438
	SetVar VAR_SPECIAL_x8004, 384
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _0482

_0438:
	Compare VAR_TEMP_x4000, 4
	GoToIfNe _0457
	SetVar VAR_SPECIAL_x8004, 387
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _0482

_0457:
	Compare VAR_TEMP_x4000, 5
	GoToIfNe _0476
	SetVar VAR_SPECIAL_x8004, 369
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _0482

_0476:
	SetVar VAR_SPECIAL_x8004, 389
	SetVar VAR_SPECIAL_x8005, 1
_0482:
	HasSpaceForItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _04B0
	CallStd std_obtain_item_verbose
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_04A3:
	NPCMsg msg_0597_T25R1006_00014
	WaitButton
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_04B0:
	NPCMsg msg_0597_T25R1006_00015
	CloseMsg
	AddMoney 300
	UpdateMoneyBox
	PlaySE SEQ_SE_DP_REGI
	WaitSE SEQ_SE_DP_REGI
	NPCMsg msg_0597_T25R1006_00017
	WaitButton
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_04D2:
	NPCMsg msg_0597_T25R1006_00016
	WaitButton
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

scr_seq_T25R1006_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _0501
	NPCMsg msg_0597_T25R1006_00018
	GoTo _0572

_0501:
	Compare VAR_TEMP_x4000, 1
	GoToIfNe _0517
	NPCMsg msg_0597_T25R1006_00019
	GoTo _0572

_0517:
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _052D
	NPCMsg msg_0597_T25R1006_00020
	GoTo _0572

_052D:
	Compare VAR_TEMP_x4000, 3
	GoToIfNe _0543
	NPCMsg msg_0597_T25R1006_00021
	GoTo _0572

_0543:
	Compare VAR_TEMP_x4000, 4
	GoToIfNe _0559
	NPCMsg msg_0597_T25R1006_00022
	GoTo _0572

_0559:
	Compare VAR_TEMP_x4000, 5
	GoToIfNe _056F
	NPCMsg msg_0597_T25R1006_00023
	GoTo _0572

_056F:
	NPCMsg msg_0597_T25R1006_00024
_0572:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R1006_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _0598
	NPCMsg msg_0597_T25R1006_00003
	GoTo _059B

_0598:
	NPCMsg msg_0597_T25R1006_00002
_059B:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R1006_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _05C1
	NPCMsg msg_0597_T25R1006_00001
	GoTo _05C4

_05C1:
	NPCMsg msg_0597_T25R1006_00000
_05C4:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R1006_007:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckRegisteredPhoneNumber PHONE_CONTACT_WHITNEY, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _067A
	Compare VAR_TEMP_x4002, 1
	GoToIfGe _066F
	NPCMsg msg_0597_T25R1006_00025
_05F7:
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _061B
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfGe _065E
	End

_061B:
	BufferPlayersName 0
	NPCMsg msg_0597_T25R1006_00026
	PlayFanfare SEQ_ME_POKEGEAR_REGIST
	WaitFanfare
	RegisterGearNumber PHONE_CONTACT_WHITNEY
	NPCMsg msg_0597_T25R1006_00027
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	SetFlag FLAG_UNK_26F
	HidePerson obj_T25R1006_gsleader3
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_065E:
	SetVar VAR_TEMP_x4002, 1
	NPCMsg msg_0597_T25R1006_00028
	WaitButton
	CloseMsg
	ReleaseAll
	End

_066F:
	NPCMsg msg_0597_T25R1006_00029
	GoTo _05F7
	End

_067A:
	NPCMsg msg_0597_T25R1006_00030
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _06DB
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _06E6
	NPCMsg msg_0597_T25R1006_00031
	CloseMsg
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 15
	FacePlayer
	LockAll
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ClearFlag FLAG_UNK_189
	NPCMsg msg_0597_T25R1006_00032
	WaitButton
	CloseMsg
	ReleaseAll
	End

_06DB:
	NPCMsg msg_0597_T25R1006_00033
	WaitButton
	CloseMsg
	ReleaseAll
	End

_06E6:
	NPCMsg msg_0597_T25R1006_00034
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R1006_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0597_T25R1006_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R1006_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0597_T25R1006_00005
	ShowMoneyBox 20, 2
	GoTo _0717

_0717:
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_x8000
	MenuItemAdd 209, 255, 0
	MenuItemAdd 210, 255, 1
	MenuItemAdd 211, 255, 2
	MenuItemAdd 212, 255, 3
	MenuExec
	TouchscreenMenuShow
	Switch VAR_SPECIAL_x8000
	Case 0, _077B
	Case 1, _0787
	Case 2, _0793
	NPCMsg msg_0597_T25R1006_00009
	GoTo _08BE

_077B:
	SetVar VAR_SPECIAL_x8001, 30
	GoTo _07D5

_0787:
	SetVar VAR_SPECIAL_x8001, 31
	GoTo _07D5

_0793:
	SetVar VAR_SPECIAL_x8001, 32
	GoTo _07D5

_079F:
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 200
	Return

_07A9:
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 300
	Return

_07B3:
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 350
	Return

_07BD:
	SubMoneyImmediate 200
	Return

_07C5:
	SubMoneyImmediate 300
	Return

_07CD:
	SubMoneyImmediate 350
	Return

_07D5:
	Compare VAR_SPECIAL_x8000, 0
	CallIfEq _079F
	Compare VAR_SPECIAL_x8000, 1
	CallIfEq _07A9
	Compare VAR_SPECIAL_x8000, 2
	CallIfEq _07B3
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _08A9
	HasSpaceForItem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _08B2
	Compare VAR_SPECIAL_x8000, 0
	CallIfEq _07BD
	Compare VAR_SPECIAL_x8000, 1
	CallIfEq _07C5
	Compare VAR_SPECIAL_x8000, 2
	CallIfEq _07CD
	UpdateMoneyBox
	BufferItemName 0, VAR_SPECIAL_x8001
	PlaySE SEQ_SE_DP_JIHANKI
	BufferItemName 0, VAR_SPECIAL_x8001
	NPCMsg msg_0597_T25R1006_00006
	GiveItemNoCheck VAR_SPECIAL_x8001, 1
	Random VAR_SPECIAL_RESULT, 64
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _08A0
	PlaySE SEQ_SE_DP_JIHANKI
	BufferItemName 0, VAR_SPECIAL_x8001
	NPCMsg msg_0597_T25R1006_00007
	HasSpaceForItem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _08B2
	CallStd std_give_item_verbose
_08A0:
	NPCMsg msg_0597_T25R1006_00005
	GoTo _0717

_08A9:
	NPCMsg msg_0597_T25R1006_00008
	GoTo _08BE

_08B2:
	CallStd std_bag_is_full
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_08BE:
	WaitButton
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End
	.balign 4, 0
