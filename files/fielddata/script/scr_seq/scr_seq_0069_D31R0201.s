#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D31R0201.h"
#include "msgdata/msg/msg_0096_D31R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D31R0201_000
	ScrDef scr_seq_D31R0201_001
	ScrDef scr_seq_D31R0201_002
	ScrDef scr_seq_D31R0201_003
	ScrDef scr_seq_D31R0201_004
	ScrDef scr_seq_D31R0201_005
	ScrDef scr_seq_D31R0201_006
	ScrDef scr_seq_D31R0201_007
	ScrDef scr_seq_D31R0201_008
	ScrDef scr_seq_D31R0201_009
	ScrDef scr_seq_D31R0201_010
	ScrDef scr_seq_D31R0201_011
	ScrDef scr_seq_D31R0201_012
	ScrDef scr_seq_D31R0201_013
	ScrDef scr_seq_D31R0201_014
	ScrDef scr_seq_D31R0201_015
	ScrDef scr_seq_D31R0201_016
	ScrDef scr_seq_D31R0201_017
	ScrDef scr_seq_D31R0201_018
	ScrDef scr_seq_D31R0201_019
	ScrDef scr_seq_D31R0201_020
	ScrDef scr_seq_D31R0201_021
	ScrDef scr_seq_D31R0201_022
	ScrDef scr_seq_D31R0201_023
	ScrDefEnd

scr_seq_D31R0201_021:
	Compare VAR_UNK_414B, 1
	CallIfEq _00A6
	Compare VAR_UNK_414B, 3
	CallIfEq _00A6
	Compare VAR_UNK_414B, 255
	CallIfEq _00A6
	ScrCmd_415 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _00A0
	SetFlag FLAG_HIDE_BATTLE_TOWER_RECEPTIONIST
	End

_00A0:
	ClearFlag FLAG_HIDE_BATTLE_TOWER_RECEPTIONIST
	End

_00A6:
	ScrCmd_521
	Return

scr_seq_D31R0201_022:
	Compare VAR_UNK_414B, 1
	GoToIfNe _00EF
	ScrCmd_415 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _00F1
	Compare VAR_TEMP_x4000, 1
	GoToIfEq _00F1
	Compare VAR_TEMP_x4000, 2
	GoToIfEq _00F1
	Compare VAR_TEMP_x4000, 3
	GoToIfEq _00F1
_00EF:
	End

_00F1:
	ScrCmd_344 3, 2
	End

_00F9:
	SetVar VAR_UNK_414B, 255
	SetVar VAR_UNK_414D, 1
	SetVar VAR_UNK_414E, 1
	SetVar VAR_UNK_414C, 1
	Return

_0113:
	SetVar VAR_UNK_414B, 255
	SetVar VAR_UNK_414D, 3
	SetVar VAR_UNK_414F, 1
	SetVar VAR_UNK_4150, 1
	SetVar VAR_UNK_4151, 1
	Return

_0133:
	SetVar VAR_UNK_414B, 255
	SetVar VAR_UNK_414D, 1
	SetVar VAR_UNK_414E, 1
	SetVar VAR_UNK_414C, 2
	Return

scr_seq_D31R0201_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_TEMP_x4001, 0
	ScrCmd_414 VAR_TEMP_x4002
	GoTo _0167
	End

_0167:
	Switch VAR_TEMP_x4002
	Case 1, _01DA
	Case 2, _01ED
	Case 3, _0200
	Case 4, _01CF
	NPCMsg msg_0096_D31R0201_00015
	GoTo _01AC
	End

_01AC:
	WaitButton
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _01C1
	CloseMsg
	ReleaseAll
	End

_01C1:
	Call _0872
	GoTo _0860
	End

_01CF:
	NPCMsg msg_0096_D31R0201_00089
	GoTo _01AC
	End

_01DA:
	BufferInt 0, 20
	SetVar VAR_SPECIAL_x8004, 85
	GoTo _0213
	End

_01ED:
	BufferInt 0, 50
	SetVar VAR_SPECIAL_x8004, 86
	GoTo _0213
	End

_0200:
	BufferInt 0, 100
	SetVar VAR_SPECIAL_x8004, 87
	GoTo _0213
	End

_0213:
	NPCMsg msg_0096_D31R0201_00088
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	Compare VAR_SPECIAL_x8004, 85
	GoToIfNe _0233
	ClearFlag FLAG_HIDE_PLAYERS_ROOM_BRONZE_TROPHY
	GoTo _024E

_0233:
	Compare VAR_SPECIAL_x8004, 86
	GoToIfNe _024A
	ClearFlag FLAG_HIDE_PLAYERS_ROOM_SILVER_TROPHY
	GoTo _024E

_024A:
	ClearFlag FLAG_HIDE_PLAYERS_ROOM_GOLD_TROPHY
_024E:
	NPCMsg msg_0096_D31R0201_00015
	GoTo _01AC
	End

scr_seq_D31R0201_000:
	ScrCmd_609
	LockAll
	PlaySE SEQ_SE_DP_SELECT
	ScrCmd_409
	NPCMsg msg_0096_D31R0201_00000
	GoTo _026E
	End

_026E:
	NPCMsg msg_0096_D31R0201_00001
	Call _02AC
	Switch VAR_SPECIAL_RESULT
	Case 0, _02D2
	Case 1, _02A1
	TouchscreenMenuShow
	GoTo _085B
	End

_02A1:
	NPCMsg msg_0096_D31R0201_00003
	GoTo _026E
	End

_02AC:
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 143, 255, 0
	MenuItemAdd 144, 255, 1
	MenuItemAdd 145, 255, 2
	MenuExec
	Return

_02D2:
	NPCMsg msg_0096_D31R0201_00004
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 475, 255, 0
	MenuItemAdd 476, 255, 1
	MenuItemAdd 94, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0321
	Case 1, _0356
	TouchscreenMenuShow
	GoTo _085B
	End

_0321:
	ScrCmd_410 0, 0
	GoTo _032F
	End

_032F:
	ScrCmd_412 1, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0383
	TouchscreenMenuShow
	ScrCmd_444 91, 3, 0, 0
	GoTo _085E
	End

_0356:
	ScrCmd_410 0, 1
	ScrCmd_412 1, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _042F
	TouchscreenMenuShow
	ScrCmd_444 91, 4, 0, 0
	GoTo _085E
	End

_0383:
	NPCMsg msg_0096_D31R0201_00008
	Call _0560
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _085B
	ScrCmd_412 32, 0, VAR_SPECIAL_RESULT
	Switch VAR_SPECIAL_RESULT
	Case 1, _0546
	Case 2, _0553
	ScrCmd_412 53, 0, VAR_SPECIAL_RESULT
	DaycareSanitizeMon VAR_SPECIAL_RESULT, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _14C8
	ScrCmd_412 53, 1, VAR_SPECIAL_RESULT
	DaycareSanitizeMon VAR_SPECIAL_RESULT, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _14C8
	ScrCmd_412 53, 2, VAR_SPECIAL_RESULT
	DaycareSanitizeMon VAR_SPECIAL_RESULT, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _14C8
	ScrCmd_412 43, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 4
	GoToIfEq _0A97
	GoTo _04F6
	End

_042F:
	NPCMsg msg_0096_D31R0201_00008
	Call _0560
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _085B
	ScrCmd_412 32, 0, VAR_SPECIAL_RESULT
	Switch VAR_SPECIAL_RESULT
	Case 1, _0546
	Case 2, _0553
	ScrCmd_412 53, 0, VAR_SPECIAL_RESULT
	DaycareSanitizeMon VAR_SPECIAL_RESULT, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _14C8
	ScrCmd_412 53, 1, VAR_SPECIAL_RESULT
	DaycareSanitizeMon VAR_SPECIAL_RESULT, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _14C8
	ScrCmd_412 53, 2, VAR_SPECIAL_RESULT
	DaycareSanitizeMon VAR_SPECIAL_RESULT, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _14C8
	ScrCmd_412 53, 3, VAR_SPECIAL_RESULT
	DaycareSanitizeMon VAR_SPECIAL_RESULT, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _14C8
	ScrCmd_412 43, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 4
	GoToIfEq _0A97
	GoTo _04F6
	End

_04F6:
	Call _00F9
	ScrCmd_412 5, 0, 0
	HealParty
	Call _053A
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0855
	ScrCmd_815 0
	ScrCmd_412 57, 0, VAR_SPECIAL_RESULT
	ScrCmd_412 52, 0, 0
	NPCMsg msg_0096_D31R0201_00011
	WaitABPress
	GoTo _06CD
	End

_053A:
	CallStd std_prompt_save
	CopyVar VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	Return

_0546:
	NPCMsg msg_0096_D31R0201_00009
	TouchscreenMenuShow
	GoTo _085B
	End

_0553:
	NPCMsg msg_0096_D31R0201_00010
	TouchscreenMenuShow
	GoTo _085B
	End

_0560:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CloseMsg
	ScrCmd_412 30, 0, 0
	ScrCmd_412 31, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _058F
	ScrCmd_815 0
_058F:
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Return

scr_seq_D31R0201_004:
	ScrCmd_609
	LockAll
	SetVar VAR_UNK_414B, 0
	ScrCmd_412 4, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq scr_seq_D31R0201_005
	NPCMsg msg_0096_D31R0201_00016
	ScrCmd_410 1, 65535
	ScrCmd_412 43, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfEq _05FD
	Call _0133
	ScrCmd_412 5, 0, 0
	Call _0817
	NPCMsg msg_0096_D31R0201_00011
	WaitABPress
	GoTo _06CD
	End

_05FD:
	Call _062C
	ScrCmd_412 5, 0, 0
	Call _0817
	ScrCmd_412 51, 0, VAR_SPECIAL_RESULT
	CopyVar VAR_TEMP_x4009, VAR_SPECIAL_RESULT
	NPCMsg msg_0096_D31R0201_00032
	WaitABPress
	GoTo _06CD
	End

_062C:
	SetVar VAR_UNK_414B, 255
	SetVar VAR_UNK_414D, 2
	SetVar VAR_UNK_414F, 1
	SetVar VAR_UNK_4150, 2
	SetVar VAR_UNK_4151, 0
	Return

scr_seq_D31R0201_005:
	ScrCmd_609
	LockAll
	NPCMsg msg_0096_D31R0201_00019
	ScrCmd_412 14, 0, VAR_SPECIAL_RESULT
	Compare VAR_BATTLE_TOWER_PRINT_PROGRESS, 1
	CallIfEq _068A
	Compare VAR_BATTLE_TOWER_PRINT_PROGRESS, 3
	CallIfEq _0692
	Compare VAR_SPECIAL_RESULT, 4
	GoToIfEq _069A
	GoTo _0855
	End

_068A:
	SetVar VAR_BATTLE_TOWER_PRINT_PROGRESS, 0
	Return

_0692:
	SetVar VAR_BATTLE_TOWER_PRINT_PROGRESS, 2
	Return

_069A:
	ScrCmd_412 9, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0855
	ScrCmd_412 10, 0, VAR_SPECIAL_RESULT
	CopyVar VAR_SPECIAL_x8000, VAR_SPECIAL_RESULT
	BufferInt 0, VAR_SPECIAL_x8000
	NPCMsg msg_0096_D31R0201_00065
	GoTo _0855
	End

_06CD:
	CloseMsg
	ScrCmd_412 43, 0, VAR_SPECIAL_RESULT
	Switch VAR_SPECIAL_RESULT
	Case 4, _0733
	Case 5, _0733
	Case 2, _074D
	Case 3, _0767
	GoTo _0719
	End

_0719:
	SetVar VAR_TEMP_x4002, 0
	SetVar VAR_TEMP_x4003, 15
	Call _078F
	GoTo _0829
	End

_0733:
	SetVar VAR_TEMP_x4002, 2
	SetVar VAR_TEMP_x4003, 19
	Call _078F
	GoTo _0829
	End

_074D:
	SetVar VAR_TEMP_x4002, 1
	SetVar VAR_TEMP_x4003, 11
	Call _078F
	GoTo _07CF
	End

_0767:
	SetVar VAR_TEMP_x4002, 1
	SetVar VAR_TEMP_x4003, 11
	Call _078F
	GoTo _0781
	End

_0781:
	SetVar VAR_UNK_414D, 2
	GoTo _0829
	End

_078F:
	ApplyMovement VAR_TEMP_x4002, _1348
	ApplyMovement obj_player, _1360
	WaitMovement
	ScrCmd_307 0, 0, VAR_TEMP_x4003, 2, 77
	ScrCmd_310 77
	ScrCmd_308 77
	ApplyMovement VAR_TEMP_x4002, _1354
	ApplyMovement obj_player, _136C
	WaitMovement
	ScrCmd_311 77
	ScrCmd_308 77
	ScrCmd_309 77
	Return

_07CF:
	GoTo _0829
	End

scr_seq_D31R0201_007:
	ScrCmd_609
	LockAll
	Call _0807
	ScrCmd_412 100, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _085B
	NPCMsg msg_0096_D31R0201_00056
	Call _0817
	GoTo _0855
	End

_0807:
	Call _0890
	ScrCmd_412 6, 0, 0
	Return

_0817:
	AddWaitingIcon
	SaveGameNormal VAR_SPECIAL_RESULT
	RemoveWaitingIcon
	PlaySE SEQ_SE_DP_SAVE
	WaitSE SEQ_SE_DP_SAVE
	Return

_0829:
	ScrCmd_420 59
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_BATTLE_TOWER_ELEVATOR, 0, 3, 6, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_0855:
	Call _0872
_085B:
	NPCMsg msg_0096_D31R0201_00002
_085E:
	WaitButton
_0860:
	CloseMsg
	Call _088C
	Call _0890
	ReleaseAll
	End

_0872:
	ScrCmd_412 6, 0, 0
	Call _0882
	Return

_0882:
	ScrCmd_412 3, 0, 0
	Return

_088C:
	ScrCmd_411
	Return

_0890:
	SetVar VAR_UNK_414B, 0
	SetVar VAR_UNK_414D, 0
	SetVar VAR_UNK_414E, 0
	SetVar VAR_UNK_414F, 0
	SetVar VAR_UNK_414C, 0
	SetVar VAR_UNK_4150, 0
	SetVar VAR_UNK_4151, 0
	Return

scr_seq_D31R0201_002:
	ScrCmd_609
	LockAll
	PlaySE SEQ_SE_DP_SELECT
	ScrCmd_409
	ScrCmd_412 12, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _09F7
	NPCMsg msg_0096_D31R0201_00036
	GoTo _08E6
	End

_08E6:
	ScrCmd_412 15, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0974
	GoTo _0903
	End

_0903:
	NPCMsg msg_0096_D31R0201_00037
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 143, 255, 0
	MenuItemAdd 155, 255, 1
	MenuItemAdd 144, 255, 2
	MenuItemAdd 145, 255, 3
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0B97
	Case 1, _0B46
	Case 2, _0969
	TouchscreenMenuShow
	GoTo _085B
	End

_0969:
	NPCMsg msg_0096_D31R0201_00038
	GoTo _08E6
	End

_0974:
	NPCMsg msg_0096_D31R0201_00037
	Call _09C1
	Switch VAR_SPECIAL_RESULT
	Case 0, _0B97
	Case 1, _0B46
	Case 2, _0BA5
	Case 3, _0969
	TouchscreenMenuShow
	GoTo _085B
	End

_09C1:
	TouchscreenMenuHide
	MenuInitStdGmm 12, 7, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 143, 255, 0
	MenuItemAdd 153, 255, 1
	MenuItemAdd 154, 255, 2
	MenuItemAdd 144, 255, 3
	MenuItemAdd 145, 255, 4
	MenuExec
	Return

_09F7:
	NPCMsg msg_0096_D31R0201_00061
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _08E6
	Call _053A
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _085B
	ScrCmd_815 0
	Call _0A42
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _085B
	NPCMsg msg_0096_D31R0201_00060
	GoTo _085B
	End

_0A42:
	CloseMsg
	SetVar VAR_TEMP_x4001, 1
	Call _0A52
	Return

_0A52:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_166 VAR_TEMP_x4000
	ScrCmd_412 16, VAR_TEMP_x4001, VAR_TEMP_x4000
	CopyVar VAR_TEMP_x4001, VAR_TEMP_x4000
	Compare VAR_TEMP_x4001, 0
	GoToIfEq _0A81
	ScrCmd_815 0
_0A81:
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	CopyVar VAR_SPECIAL_RESULT, VAR_TEMP_x4001
	Return

_0A97:
	HealParty
	Call _053A
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0855
	Call _00F9
	ScrCmd_412 5, 0, 0
	HealParty
	CloseMsg
	SetVar VAR_TEMP_x4001, 0
	Call _0A52
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0855
	GoTo _0ADF
	End

_0ADF:
	NPCMsg msg_0096_D31R0201_00047
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _06CD
	NPCMsg msg_0096_D31R0201_00048
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0ADF
	SetVar VAR_UNK_414B, 2
	ScrCmd_412 39, 0, 0
	ScrCmd_411
	NPCMsg msg_0096_D31R0201_00056
	Call _0817
	WaitButtonOrDelay 30
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CloseMsg
	ScrCmd_412 2, 0, 0
	ReleaseAll
	End

_0B46:
	Call _053A
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _085B
	CloseMsg
	SetVar VAR_TEMP_x4001, 2
	ScrCmd_815 0
	Call _0A52
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _085B
	ScrCmd_418 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	BufferInt 0, VAR_SPECIAL_x8004
	BufferIntEx 1, VAR_SPECIAL_x8005, 2, 3
	NPCMsg msg_0096_D31R0201_00052
	WaitABPress
	GoTo _0860
	End

_0B97:
	ScrCmd_410 0, 4
	GoTo _032F
	End

_0BA5:
	ScrCmd_410 0, 5
	GoTo _032F
	End

_0BB3:
	ApplyMovement obj_player, _1378
	WaitMovement
	Return

scr_seq_D31R0201_001:
	ScrCmd_609
	LockAll
	PlaySE SEQ_SE_DP_SELECT
	ScrCmd_409
	NPCMsg msg_0096_D31R0201_00020
	GoTo _0BD4
	End

_0BD4:
	NPCMsg msg_0096_D31R0201_00021
	Call _02AC
	Switch VAR_SPECIAL_RESULT
	Case 0, _0C12
	Case 1, _0C07
	TouchscreenMenuShow
	GoTo _085B
	End

_0C07:
	NPCMsg msg_0096_D31R0201_00023
	GoTo _0BD4
	End

_0C12:
	ScrCmd_412 1, 2, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0C39
	TouchscreenMenuShow
	ScrCmd_444 91, 2, 0, 0
	GoTo _085E
	End

_0C39:
	NPCMsg msg_0096_D31R0201_00026
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0C69
	GoTo _0C55
	End

_0C55:
	ScrCmd_410 0, 2
	SetVar VAR_TEMP_x4001, 0
	GoTo _0C7D
	End

_0C69:
	ScrCmd_410 0, 3
	SetVar VAR_TEMP_x4001, 1
	GoTo _0C7D
	End

_0C7D:
	NPCMsg msg_0096_D31R0201_00008
	Call _0560
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _085B
	ScrCmd_412 32, 0, VAR_SPECIAL_RESULT
	Switch VAR_SPECIAL_RESULT
	Case 1, _0546
	Case 2, _0553
	ScrCmd_412 53, 0, VAR_SPECIAL_RESULT
	DaycareSanitizeMon VAR_SPECIAL_RESULT, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _14C8
	ScrCmd_412 53, 1, VAR_SPECIAL_RESULT
	DaycareSanitizeMon VAR_SPECIAL_RESULT, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _14C8
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _0D40
	Call _0113
	ScrCmd_412 5, 0, 0
	HealParty
	Call _053A
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0855
	ScrCmd_815 0
	ScrCmd_412 57, 0, VAR_SPECIAL_RESULT
	ScrCmd_412 52, 0, 0
	NPCMsg msg_0096_D31R0201_00035
	GoTo _06CD
	End

_0D40:
	HealParty
	Call _053A
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0855
_0D55:
	NPCMsg msg_0096_D31R0201_00027
	TouchscreenMenuHide
	MenuInitStdGmm 18, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 14, 255, 0
	MenuItemAdd 15, 255, 1
	MenuItemAdd 5, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0DA6
	Case 1, _0DFE
	TouchscreenMenuShow
	GoTo _0855
	End

_0DA6:
	NPCMsg msg_0096_D31R0201_00112
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0D55
	TouchscreenMenuShow
	CloseMsg
	ScrCmd_226 16, 0, 0, VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0DEC
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _0DF4
	GoTo _0E56
	End

_0DEC:
	GoTo _0D55
	End

_0DF4:
	ScrCmd_283
	GoTo _0D55
	End

_0DFE:
	NPCMsg msg_0096_D31R0201_00112
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0D55
	TouchscreenMenuShow
	CloseMsg
	ScrCmd_227 16, 0, 0, VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0E44
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _0E4C
	GoTo _0E56
	End

_0E44:
	GoTo _0D55
	End

_0E4C:
	ScrCmd_283
	GoTo _0D55
	End

_0E56:
	ScrCmd_258
	ScrCmd_257 1
	ScrCmd_412 58, 0, 0
	GoTo _0E6C
	End

_0E6C:
	ScrCmd_416 0, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0E6C
	ScrCmd_417 0, VAR_TEMP_x4000
	Switch VAR_TEMP_x4000
	Case 1, _0EE1
	Case 2, _0EFF
	Case 3, _0F1D
	ScrCmd_258
	ScrCmd_257 2
	ScrCmd_412 57, 0, VAR_SPECIAL_x8004
	ScrCmd_451 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0F84
	ScrCmd_417 1, VAR_TEMP_x4000
	GoTo _0F52
	End

_0EE1:
	Call _0F48
	ScrCmd_412 53, 0, VAR_SPECIAL_RESULT
	BufferMonSpeciesName 0, VAR_SPECIAL_RESULT
	NPCMsg msg_0096_D31R0201_00033
	GoTo _0855
	End

_0EFF:
	Call _0F48
	ScrCmd_412 53, 1, VAR_SPECIAL_RESULT
	BufferMonSpeciesName 0, VAR_SPECIAL_RESULT
	NPCMsg msg_0096_D31R0201_00033
	GoTo _0855
	End

_0F1D:
	Call _0F48
	ScrCmd_412 53, 0, VAR_SPECIAL_RESULT
	BufferMonSpeciesName 0, VAR_SPECIAL_RESULT
	ScrCmd_412 53, 1, VAR_SPECIAL_RESULT
	BufferMonSpeciesName 1, VAR_SPECIAL_RESULT
	NPCMsg msg_0096_D31R0201_00034
	GoTo _0855
	End

_0F48:
	ScrCmd_258
	ScrCmd_257 8
	ScrCmd_283
	Return

_0F52:
	Call _0113
	ScrCmd_412 5, 0, 0
	HealParty
	NPCMsg msg_0096_D31R0201_00069
	Call _0817
	BattleTowerSetUpMultiBattle
	NPCMsg msg_0096_D31R0201_00032
	Wait 30, VAR_SPECIAL_RESULT
	ScrCmd_258
	ScrCmd_257 3
	GoTo _06CD
	End

_0F84:
	ScrCmd_412 52, 0, 0
	ScrCmd_412 58, 0, 0
	GoTo _0F9C
	End

_0F9C:
	ScrCmd_416 1, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0F9C
	GoTo _0F52
	End

scr_seq_D31R0201_003:
	ScrCmd_609
	LockAll
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Call _0807
	ScrCmd_412 100, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _085B
	ScrCmd_412 35, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _107A
	GoTo _1001
	End

_1001:
	NPCMsg msg_0096_D31R0201_00053
	ScrCmd_412 43, 0, VAR_SPECIAL_RESULT
	CopyVar VAR_TEMP_x4000, VAR_SPECIAL_RESULT
	Switch VAR_TEMP_x4000
	Case 5, _104F
	Case 4, _12B6
	ScrCmd_412 49, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	CallIfEq _106F
	GoTo _104F
	End

_104F:
	NPCMsg msg_0096_D31R0201_00056
	Call _0817
	CloseMsg
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _1286
	GoTo _0855
	End

_106F:
	NPCMsg msg_0096_D31R0201_00073
	PlayFanfare SEQ_ME_LVUP
	WaitFanfare
	Return

_107A:
	ScrCmd_412 43, 0, VAR_SPECIAL_RESULT
	CopyVar VAR_TEMP_x4000, VAR_SPECIAL_RESULT
	Compare VAR_TEMP_x4000, 5
	GoToIfEq _1268
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _118D
	Compare VAR_TEMP_x4000, 4
	GoToIfEq _10E6
	ScrCmd_412 49, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _10D2
	Call _1263
	GoTo _1273
	End

_10D2:
	NPCMsg msg_0096_D31R0201_00012
	NPCMsg msg_0096_D31R0201_00073
	PlayFanfare SEQ_ME_LVUP
	WaitFanfare
	GoTo _1273
	End

_10E6:
	NPCMsg msg_0096_D31R0201_00012
	ScrCmd_412 54, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _115A
	GoTo _1106
	End

_1106:
	ScrCmd_412 10, 0, VAR_SPECIAL_RESULT
	CopyVar VAR_TEMP_x4000, VAR_SPECIAL_RESULT
	BufferPlayersName 0
	BufferInt 1, VAR_TEMP_x4000
	NPCMsg msg_0096_D31R0201_00055
	GoTo _1127
	End

_1127:
	ScrCmd_412 49, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _12F1
	GoTo _1144
	End

_1144:
	BufferInt 0, VAR_TEMP_x4000
	NPCMsg msg_0096_D31R0201_00070
	PlayFanfare SEQ_ME_LVUP
	WaitFanfare
	GoTo _12F1
	End

_115A:
	ScrCmd_412 49, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _12F1
	GoTo _1177
	End

_1177:
	BufferInt 0, VAR_TEMP_x4000
	NPCMsg msg_0096_D31R0201_00132
	PlayFanfare SEQ_ME_LVUP
	WaitFanfare
	GoTo _12F1
	End

_118D:
	ScrCmd_412 45, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _11AA
	GoTo _11F1
	End

_11AA:
	Call _1263
	GoTo _11B8
	End

_11B8:
	NPCMsg msg_0096_D31R0201_00014
	Call _0817
	ScrCmd_414 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0855
	NPCMsg msg_0096_D31R0201_00113
	CloseMsg
	CopyVar VAR_TEMP_x4002, VAR_SPECIAL_RESULT
	SetVar VAR_TEMP_x4001, 1
	Call _0BB3
	GoTo _0167
	End

_11F1:
	Compare VAR_BATTLE_TOWER_PRINT_PROGRESS, 1
	CallIfEq _1231
	Compare VAR_BATTLE_TOWER_PRINT_PROGRESS, 3
	CallIfEq _1248
	ScrCmd_412 48, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _11B8
	NPCMsg msg_0096_D31R0201_00084
	PlayFanfare SEQ_ME_LVUP
	WaitFanfare
	GoTo _11B8
	End

_1231:
	NPCMsg msg_0096_D31R0201_00085
	BufferPlayersName 0
	NPCMsg msg_0096_D31R0201_00087
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	SetVar VAR_BATTLE_TOWER_PRINT_PROGRESS, 2
	Return

_1248:
	NPCMsg msg_0096_D31R0201_00085
	BufferPlayersName 0
	NPCMsg msg_0096_D31R0201_00086
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	SetVar VAR_BATTLE_TOWER_PRINT_PROGRESS, 4
	CallStd std_frontier_gold_prints_check
	Return

_1263:
	NPCMsg msg_0096_D31R0201_00012
	Return

_1268:
	NPCMsg msg_0096_D31R0201_00054
	GoTo _1273
	End

_1273:
	NPCMsg msg_0096_D31R0201_00014
	Call _0817
	CloseMsg
	GoTo _0855
	End

_1286:
	ScrCmd_414 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0855
	NPCMsg msg_0096_D31R0201_00113
	CloseMsg
	CopyVar VAR_TEMP_x4002, VAR_SPECIAL_RESULT
	SetVar VAR_TEMP_x4001, 1
	Call _0BB3
	GoTo _0167
	End

_12B6:
	ScrCmd_412 9, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _12D3
	GoTo _12F1
	End

_12D3:
	ScrCmd_412 10, 0, VAR_SPECIAL_RESULT
	CopyVar VAR_SPECIAL_x8000, VAR_SPECIAL_RESULT
	BufferInt 0, VAR_SPECIAL_x8000
	NPCMsg msg_0096_D31R0201_00065
	GoTo _12F1
	End

_12F1:
	ScrCmd_412 11, 1, 0
	GoTo _1301
	End

_1301:
	Call _0872
	NPCMsg msg_0096_D31R0201_00056
	Call _0817
	NPCMsg msg_0096_D31R0201_00057
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _085B
	Call _0A42
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _085B
	NPCMsg msg_0096_D31R0201_00060
	GoTo _085B
	End

	.balign 4, 0
_1348:
	Delay4
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_1354:
	WalkNormalNorth
	SetInvisible
	EndMovement

	.balign 4, 0
_1360:
	Delay4
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_136C:
	WalkNormalNorth 2
	SetInvisible
	EndMovement

	.balign 4, 0
_1378:
	FaceEast
	EndMovement

scr_seq_D31R0201_009:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	SetVar VAR_SPECIAL_x8000, 0
	SetVar VAR_SPECIAL_x8001, 0
	Call _1404
	End

scr_seq_D31R0201_010:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	SetVar VAR_SPECIAL_x8000, 0
	SetVar VAR_SPECIAL_x8001, 1
	Call _1404
	End

scr_seq_D31R0201_011:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	SetVar VAR_SPECIAL_x8000, 0
	SetVar VAR_SPECIAL_x8001, 2
	Call _1404
	End

scr_seq_D31R0201_012:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	ScrCmd_419 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _13F9
	SetVar VAR_SPECIAL_x8000, 1
	SetVar VAR_SPECIAL_x8001, 0
	Call _1404
	End

_13F9:
	NPCMsg msg_0096_D31R0201_00111
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1404:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_408 VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	Return

scr_seq_D31R0201_013:
	SimpleNPCMsg msg_0096_D31R0201_00074
	End

scr_seq_D31R0201_014:
	SimpleNPCMsg msg_0096_D31R0201_00075
	End

scr_seq_D31R0201_015:
	SimpleNPCMsg msg_0096_D31R0201_00076
	End

scr_seq_D31R0201_016:
	SimpleNPCMsg msg_0096_D31R0201_00077
	End

scr_seq_D31R0201_017:
	SimpleNPCMsg msg_0096_D31R0201_00078
	End

scr_seq_D31R0201_018:
	SimpleNPCMsg msg_0096_D31R0201_00079
	End

scr_seq_D31R0201_019:
	SimpleNPCMsg msg_0096_D31R0201_00080
	End

scr_seq_D31R0201_008:
	End

scr_seq_D31R0201_020:
	PlayCry SPECIES_PIKACHU, 0
	SimpleNPCMsg msg_0096_D31R0201_00081
	End

_14C8:
	TouchscreenMenuShow
	Call _088C
	Call _0890
	CallStd std_bag_is_full_griseous_orb
	End

scr_seq_D31R0201_023:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallIfUnset FLAG_GOT_JUDGE_EXPLANATION, _158E
	CallIfSet FLAG_GOT_JUDGE_EXPLANATION, _1593
	SetFlag FLAG_GOT_JUDGE_EXPLANATION
	GoTo _1506
	End

_1506:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CloseMsg
	PartySelectUI
	GetPartySelection VAR_SPECIAL_RESULT
	RestoreOverworld
	CopyVar VAR_SPECIAL_x8000, VAR_SPECIAL_RESULT
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_x8000, 255
	GoToIfEq _1645
	GetPartyMonSpecies VAR_SPECIAL_x8000, VAR_SPECIAL_x8004
	Compare VAR_SPECIAL_x8004, 0
	GoToIfEq _1598
	StatJudge VAR_SPECIAL_x8000, VAR_SPECIAL_x8001, VAR_SPECIAL_x8002, VAR_SPECIAL_x8003
	Compare VAR_SPECIAL_x8001, 90
	GoToIfLe _15E5
	Compare VAR_SPECIAL_x8001, 120
	GoToIfLe _15F0
	Compare VAR_SPECIAL_x8001, 150
	GoToIfLe _15FB
	Compare VAR_SPECIAL_x8001, 151
	GoToIfGe _1606
	End

_158E:
	NPCMsg msg_0096_D31R0201_00114
	Return

_1593:
	NPCMsg msg_0096_D31R0201_00115
	Return

_1598:
	NPCMsg msg_0096_D31R0201_00117
	GoTo _1506
	End

_15A3:
	NonNPCMsgVar VAR_SPECIAL_x8002
	GoTo _15AF
	End

_15AF:
	Compare VAR_SPECIAL_x8003, 15
	GoToIfLe _1611
	Compare VAR_SPECIAL_x8003, 25
	GoToIfLe _161C
	Compare VAR_SPECIAL_x8003, 30
	GoToIfLe _1627
	Compare VAR_SPECIAL_x8003, 31
	GoToIfGe _1632
	End

_15E5:
	NPCMsg msg_0096_D31R0201_00118
	GoTo _15A3
	End

_15F0:
	NPCMsg msg_0096_D31R0201_00119
	GoTo _15A3
	End

_15FB:
	NPCMsg msg_0096_D31R0201_00120
	GoTo _15A3
	End

_1606:
	NPCMsg msg_0096_D31R0201_00121
	GoTo _15A3
	End

_1611:
	NPCMsg msg_0096_D31R0201_00128
	GoTo _163D
	End

_161C:
	NPCMsg msg_0096_D31R0201_00129
	GoTo _163D
	End

_1627:
	NPCMsg msg_0096_D31R0201_00130
	GoTo _163D
	End

_1632:
	NPCMsg msg_0096_D31R0201_00131
	GoTo _163D
	End

_163D:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1645:
	NPCMsg msg_0096_D31R0201_00116
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
