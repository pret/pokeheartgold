#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0265.h"
#include "msgdata/msg/msg_0439.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_0265_000
	ScrDef scr_seq_0265_001
	ScrDefEnd

scr_seq_0265_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	BufferDaycareMonNicks
	GetDaycareState VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0094
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfEq _0151
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _015E
	Compare VAR_UNK_408E, 4
	GoToIfEq _0057
	NPCMsg msg_0439_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0057:
	BufferPlayersName 0
	GenderMsgBox msg_0439_00013, msg_0439_00014
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0082
	SetFlag FLAG_UNK_99E
	NPCMsg msg_0439_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0082:
	ClearFlag FLAG_UNK_99E
	ScrCmd_149 5
	NPCMsg msg_0439_00016
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0094:
	ScrCmd_149 5
	NPCMsg msg_0439_00001
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00F6
	NPCMsg msg_0439_00010
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00F6
	TouchscreenMenuShow
	ClearFlag FLAG_UNK_067
	ResetDaycareEgg
	Compare VAR_UNK_408E, 3
	GoToIfNe _00EB
	NPCMsg msg_0439_00012
	SetVar VAR_UNK_408E, 4
	SetFlag FLAG_UNK_992
	GoTo _0057

_00EB:
	NPCMsg msg_0439_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00F6:
	TouchscreenMenuShow
	GetPartyCount VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 6
	GoToIfNe _0114
	NPCMsg msg_0439_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0114:
	BufferPlayersName 0
	NPCMsg msg_0439_00005
	PlayFanfare SEQ_ME_TAMAGO_GET
	WaitFanfare
	GiveDaycareEgg
	ClearFlag FLAG_UNK_067
	Compare VAR_UNK_408E, 3
	GoToIfNe _0146
	NPCMsg msg_0439_00011
	SetVar VAR_UNK_408E, 4
	SetFlag FLAG_UNK_992
	GoTo _0057

_0146:
	NPCMsg msg_0439_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0151:
	BufferDaycareMonNicks
	NPCMsg msg_0439_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_015E:
	BufferDaycareMonNicks
	NPCMsg msg_0439_00009
	GetDaycareCompatibility VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0196
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _01BD
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfEq _01E4
	GoTo _020B
	End

_0196:
	Compare VAR_UNK_408E, 4
	GoToIfNe _01B2
	NPCMsg msg_0439_00047
	GoTo _0057

_01AC:
	GoTo _01B5

_01B2:
	NPCMsg msg_0439_00017
_01B5:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01BD:
	Compare VAR_UNK_408E, 4
	GoToIfNe _01D9
	NPCMsg msg_0439_00048
	GoTo _0057

_01D3:
	GoTo _01DC

_01D9:
	NPCMsg msg_0439_00018
_01DC:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01E4:
	Compare VAR_UNK_408E, 4
	GoToIfNe _0200
	NPCMsg msg_0439_00049
	GoTo _0057

_01FA:
	GoTo _0203

_0200:
	NPCMsg msg_0439_00019
_0203:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_020B:
	Compare VAR_UNK_408E, 4
	GoToIfNe _0227
	NPCMsg msg_0439_00050
	GoTo _0057

_0221:
	GoTo _022A

_0227:
	NPCMsg msg_0439_00020
_022A:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_0265_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ShowMoneyBox 20, 2
	GetDaycareState VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _042E
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfEq _0455
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _0620
	NPCMsg msg_0439_00021
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0290
	TouchscreenMenuShow
	NPCMsg msg_0439_00026
	WaitButton
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_0290:
	PartyCountNotEgg VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _03FB
	CountAliveMonsAndPC VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfEq _041F
	NPCMsg msg_0439_00022
	CloseMsg
	HideMoneyBox
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	SetVar VAR_SPECIAL_RESULT, 0
_02CB:
	ScrCmd_551 VAR_SPECIAL_RESULT
	ScrCmd_552 VAR_SPECIAL_x8000, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _02F4
	PokemonSummaryScreen 0, VAR_SPECIAL_x8000, 0
	GetMoveSelection 0, VAR_SPECIAL_RESULT
	GoTo _02CB

_02F4:
	Compare VAR_SPECIAL_x8000, 255
	GoToIfEq _03C6
	DaycareSanitizeMon VAR_SPECIAL_x8000, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _03A1
	GetPartyMonSpecies VAR_SPECIAL_x8000, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _03B1
	CountAliveMons VAR_SPECIAL_RESULT, VAR_SPECIAL_x8000
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _040A
	PutMonInDaycare VAR_SPECIAL_x8000
	Call _038B
	GetTailDaycareMonSpeciesAndNick VAR_SPECIAL_x8001
	SetFlag FLAG_UNK_068
	GetDaycareState VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfEq _0363
	GoTo _0374

_0363:
	PlayCry VAR_SPECIAL_x8001, 0
	NPCMsg msg_0439_00023
	WaitCry
	GoTo _03DB

_0374:
	TouchscreenMenuShow
	PlayCry VAR_SPECIAL_x8001, 0
	NPCMsg msg_0439_00041
	WaitButton
	CloseMsg
	WaitCry
	HideMoneyBox
	ReleaseAll
	End

_038B:
	RestoreOverworld
	ShowMoneyBox 20, 2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Return

_03A1:
	Call _038B
	TouchscreenMenuShow
	HideMoneyBox
	CallStd std_bag_is_full_griseous_orb
	End

_03B1:
	Call _038B
	TouchscreenMenuShow
	NPCMsg msg_0439_00040
	WaitButton
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_03C6:
	Call _038B
	TouchscreenMenuShow
_03CE:
	NPCMsg msg_0439_00029
	WaitButton
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_03DB:
	NPCMsg msg_0439_00024
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0290
	TouchscreenMenuShow
	GoTo _03CE
	End

_03FB:
	TouchscreenMenuShow
	NPCMsg msg_0439_00036
	WaitButton
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_040A:
	Call _038B
	TouchscreenMenuShow
	NPCMsg msg_0439_00038
	WaitButton
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_041F:
	TouchscreenMenuShow
	NPCMsg msg_0439_00039
	WaitButton
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_042E:
	NPCMsg msg_0439_00025
	WaitButton
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_043B:
	NPCMsg msg_0439_00031
	Return

_0440:
	BufferDaycareMonGrowth VAR_SPECIAL_RESULT, VAR_SPECIAL_x8000
	Compare VAR_SPECIAL_RESULT, 0
	CallIfNe _043B
	Return

_0455:
	NPCMsg msg_0439_00030
	SetVar VAR_SPECIAL_x8000, 0
	Call _0440
	NPCMsg msg_0439_00024
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0290
	NPCMsg msg_0439_00037
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0498
	TouchscreenMenuShow
	GoTo _03CE

_0498:
	GetPartyCount VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 6
	GoToIfEq _05DC
	GetDaycareState VAR_SPECIAL_RESULT
	SetVar VAR_SPECIAL_x8001, 0
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfEq _0520
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_x8001
	BufferDaycareMonStats 0, 1, 2, 0
	MenuItemAdd 136, 255, 0
	BufferDaycareMonStats 0, 1, 2, 1
	MenuItemAdd 137, 255, 1
	MenuItemAdd 138, 255, 2
	MenuExec
	Switch VAR_SPECIAL_x8001
	Case 0, _0520
	Case 1, _0520
	TouchscreenMenuShow
	GoTo _03CE

_0520:
	BufferDaycareWithdrawCost VAR_SPECIAL_x8004, VAR_SPECIAL_x8001
	NPCMsg msg_0439_00033
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0544
	TouchscreenMenuShow
	GoTo _03CE

_0544:
	HasEnoughMoneyVar VAR_SPECIAL_RESULT, VAR_SPECIAL_x8004
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0566
	TouchscreenMenuShow
	NPCMsg msg_0439_00027
	WaitButton
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_0566:
	RetrieveDaycareMon VAR_SPECIAL_x8002, VAR_SPECIAL_x8001
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	UpdateDaycareMonObjects
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	SubMoneyVar VAR_SPECIAL_x8004
	UpdateMoneyBox
	PlaySE SEQ_SE_DP_REGI
	WaitSE SEQ_SE_DP_REGI
	NPCMsg msg_0439_00034
	PlayCry VAR_SPECIAL_x8002, 0
	BufferPlayersName 1
	NPCMsg msg_0439_00035
	WaitCry
	GetDaycareState VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfEq _05BE
	TouchscreenMenuShow
	GoTo _03CE

_05BE:
	NPCMsg msg_0439_00028
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0498
	TouchscreenMenuShow
	GoTo _03CE

_05DC:
	TouchscreenMenuShow
	NPCMsg msg_0439_00032
	WaitButton
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

	.balign 4, 0
_05EC:
	Delay4 3
	FaceWest
	Delay4 3
	FaceEast
	Delay4 3
	FaceNorth
	WalkNormalNorth 2
	SetInvisible
	Delay8 3
	FaceSouth
	SetVisible
	WalkNormalSouth 2
	EndMovement

_0620:
	NPCMsg msg_0439_00030
	SetVar VAR_SPECIAL_x8000, 0
	Call _0440
	SetVar VAR_SPECIAL_x8000, 1
	Call _0440
	NPCMsg msg_0439_00037
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0498
	TouchscreenMenuShow
	NPCMsg msg_0439_00029
	WaitButton
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_0660:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0439_00042
	EggHatchAnim
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End
	.balign 4, 0
