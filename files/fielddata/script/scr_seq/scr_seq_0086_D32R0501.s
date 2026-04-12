#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D32R0501.h"
#include "msgdata/msg/msg_0109_D32R0501.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D32R0501_000
	ScrDef scr_seq_D32R0501_001
	ScrDef scr_seq_D32R0501_002
	ScrDef scr_seq_D32R0501_003
	ScrDef scr_seq_D32R0501_004
	ScrDef scr_seq_D32R0501_005
	ScrDef scr_seq_D32R0501_006
	ScrDef scr_seq_D32R0501_007
	ScrDef scr_seq_D32R0501_008
	ScrDef scr_seq_D32R0501_009
	ScrDef scr_seq_D32R0501_010
	ScrDef scr_seq_D32R0501_011
	ScrDef scr_seq_D32R0501_012
	ScrDef scr_seq_D32R0501_013
	ScrDefEnd

scr_seq_D32R0501_013:
	End

scr_seq_D32R0501_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_TEMP_x4003, 0
	SetVar VAR_TEMP_x4004, 0
	GoTo _0074
	End

scr_seq_D32R0501_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_TEMP_x4003, 0
	SetVar VAR_TEMP_x4004, 1
	GoTo _0074
	End

_0074:
	ScrCmd_682 0
	Compare VAR_TEMP_x4004, 0
	CallIfEq _068C
	Compare VAR_TEMP_x4004, 1
	CallIfEq _0691
	GoTo _009A
	End

_009A:
	Compare VAR_TEMP_x4004, 0
	CallIfEq _0696
	Compare VAR_TEMP_x4004, 1
	CallIfEq _06B5
	MenuItemAdd 41, 255, 2
	MenuItemAdd 42, 255, 3
	MenuExec
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _013F
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _016C
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfEq _0104
	Compare VAR_SPECIAL_RESULT, 4
	GoToIfEq _0199
	TouchscreenMenuShow
	GoTo _0126
	End

_0104:
	Compare VAR_TEMP_x4004, 0
	CallIfEq _06CC
	Compare VAR_TEMP_x4004, 1
	CallIfEq _06D1
	GoTo _009A
	End

_0126:
	GoTo _012E
	End

_012E:
	SetVar VAR_UNK_4147, 0
	NPCMsg msg_0109_D32R0501_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_013F:
	SetVar VAR_UNK_4148, 0
	ScrCmd_637 0, 3, VAR_SPECIAL_RESULT
	BufferInt 0, 3
	BufferInt 1, 3
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01C6
	GoTo _01F0
	End

_016C:
	SetVar VAR_UNK_4148, 1
	ScrCmd_637 0, 3, VAR_SPECIAL_RESULT
	BufferInt 0, 3
	BufferInt 1, 3
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01C6
	GoTo _01F0
	End

_0199:
	SetVar VAR_UNK_4148, 2
	ScrCmd_637 0, 2, VAR_SPECIAL_RESULT
	BufferInt 0, 2
	BufferInt 1, 2
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01DB
	GoTo _01F0
	End

_01C6:
	NPCMsg msg_0109_D32R0501_00008
	ScrCmd_444 9, 3, 0, 0
	TouchscreenMenuShow
	GoTo _0126
	End

_01DB:
	NPCMsg msg_0109_D32R0501_00008
	ScrCmd_444 9, 2, 0, 0
	TouchscreenMenuShow
	GoTo _0126
	End

_01F0:
	NPCMsg msg_0109_D32R0501_00007
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_637 4, VAR_UNK_4148, VAR_SPECIAL_RESULT
	ScrCmd_639 VAR_TEMP_x4002, VAR_TEMP_x4005, VAR_TEMP_x4006
	Compare VAR_TEMP_x4002, 255
	GoToIfNe _0222
	ScrCmd_815 0
_0222:
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_TEMP_x4002, 255
	GoToIfEq _0126
	DaycareSanitizeMon VAR_TEMP_x4002, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _05FB
	DaycareSanitizeMon VAR_TEMP_x4005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _05FB
	Compare VAR_UNK_4148, 2
	GoToIfEq _0283
	DaycareSanitizeMon VAR_TEMP_x4006, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _05FB
_0283:
	GetPartyMonSpecies VAR_TEMP_x4002, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _029E
	TouchscreenMenuShow
	GoTo _0126

_029E:
	GoTo _02A6
	End

_02A6:
	GoTo _02AE
	End

_02AE:
	Compare VAR_UNK_4148, 0
	CallIfEq _046A
	Compare VAR_UNK_4148, 1
	CallIfEq _046A
	SetVar VAR_TEMP_x4000, 0
	HealParty
	CallStd std_prompt_save
	CopyVar VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0126
	TouchscreenMenuShow
	Compare VAR_UNK_4148, 2
	GoToIfEq _02FE
	GoTo _04CB
	End

_02FE:
	NPCMsg msg_0109_D32R0501_00043
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 14, 255, 0
	MenuItemAdd 15, 255, 1
	MenuItemAdd 5, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _034F
	Case 1, _03A7
	TouchscreenMenuShow
	GoTo _0126
	End

_034F:
	NPCMsg msg_0109_D32R0501_00044
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _02FE
	TouchscreenMenuShow
	CloseMsg
	ScrCmd_226 31, 0, 0, VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0395
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _039D
	GoTo _03FF
	End

_0395:
	GoTo _02FE
	End

_039D:
	ScrCmd_283
	GoTo _02FE
	End

_03A7:
	NPCMsg msg_0109_D32R0501_00044
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _02FE
	TouchscreenMenuShow
	CloseMsg
	ScrCmd_227 31, 0, 0, VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _03ED
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _03F5
	GoTo _03FF
	End

_03ED:
	GoTo _02FE
	End

_03F5:
	ScrCmd_283
	GoTo _02FE
	End

_03FF:
	ScrCmd_258
	ScrCmd_257 136
	GetPartyMonSpecies VAR_TEMP_x4002, VAR_SPECIAL_x8000
	GetPartyMonSpecies VAR_TEMP_x4005, VAR_SPECIAL_x8001
	ScrCmd_638 VAR_SPECIAL_x8000, VAR_SPECIAL_x8001, VAR_SPECIAL_RESULT
	Switch VAR_SPECIAL_RESULT
	Case 1, _0472
	Case 2, _0488
	Case 3, _049E
	ScrCmd_258
	ScrCmd_257 138
	NPCMsg msg_0109_D32R0501_00045
	Compare VAR_UNK_4148, 2
	CallIfEq _046A
	Call _06FD
	GoTo _04CB
	End

_046A:
	SetVar VAR_UNK_4147, 255
	Return

_0472:
	Call _04C1
	BufferMonSpeciesName 0, VAR_TEMP_x4002
	NPCMsg msg_0109_D32R0501_00029
	GoTo _04B9
	End

_0488:
	Call _04C1
	BufferMonSpeciesName 0, VAR_TEMP_x4005
	NPCMsg msg_0109_D32R0501_00029
	GoTo _04B9
	End

_049E:
	Call _04C1
	BufferMonSpeciesName 0, VAR_TEMP_x4002
	BufferMonSpeciesName 1, VAR_TEMP_x4005
	NPCMsg msg_0109_D32R0501_00030
	GoTo _04B9
	End

_04B9:
	GoTo _0126
	End

_04C1:
	ScrCmd_258
	ScrCmd_257 139
	ScrCmd_283
	Return

_04CB:
	Compare VAR_UNK_4148, 0
	CallIfEq _0563
	Compare VAR_UNK_4148, 1
	CallIfEq _057E
	Compare VAR_UNK_4148, 2
	CallIfEq _0599
	PlaySE SEQ_SE_DP_KAIDAN2
	GoTo _04FE
	End

_04FE:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_815 0
	Compare VAR_UNK_4148, 0
	CallIfEq _05BF
	Compare VAR_UNK_4148, 1
	CallIfEq _05D3
	Compare VAR_UNK_4148, 2
	CallIfEq _05E7
	ScrCmd_420 59
	ScrCmd_436
	ScrCmd_627 11
	Compare VAR_UNK_4148, 2
	CallIfEq _055F
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ScrCmd_682 1
	End

_055F:
	ScrCmd_283
	Return

_0563:
	NPCMsg msg_0109_D32R0501_00032
	WaitABPress
	CloseMsg
	ApplyMovement obj_player, _060C
	ApplyMovement VAR_SPECIAL_LAST_TALKED, _062C
	WaitMovement
	Return

_057E:
	NPCMsg msg_0109_D32R0501_00032
	WaitABPress
	CloseMsg
	ApplyMovement obj_player, _060C
	ApplyMovement VAR_SPECIAL_LAST_TALKED, _062C
	WaitMovement
	Return

_0599:
	NPCMsgVar msg_0109_D32R0501_00032
	Wait 10, VAR_SPECIAL_RESULT
	ScrCmd_258
	ScrCmd_257 137
	CloseMsg
	ApplyMovement obj_player, _0618
	ApplyMovement VAR_SPECIAL_LAST_TALKED, _0638
	WaitMovement
	Return

_05BF:
	ApplyMovement obj_player, _064C
	ApplyMovement VAR_SPECIAL_LAST_TALKED, _0670
	WaitMovement
	Return

_05D3:
	ApplyMovement obj_player, _064C
	ApplyMovement VAR_SPECIAL_LAST_TALKED, _0670
	WaitMovement
	Return

_05E7:
	ApplyMovement obj_player, _065C
	ApplyMovement VAR_SPECIAL_LAST_TALKED, _067C
	WaitMovement
	Return

_05FB:
	TouchscreenMenuShow
	SetVar VAR_UNK_4147, 0
	CallStd std_bag_is_full_griseous_orb
	End

	.balign 4, 0
_060C:
	WalkNormalWest 6
	SetInvisible
	EndMovement

	.balign 4, 0
_0618:
	WalkNormalWest 3
	WalkNormalNorth
	WalkNormalWest 3
	SetInvisible
	EndMovement

	.balign 4, 0
_062C:
	WalkNormalWest 5
	SetInvisible
	EndMovement

	.balign 4, 0
_0638:
	WalkNormalWest 2
	WalkNormalNorth
	WalkNormalWest 3
	SetInvisible
	EndMovement

	.balign 4, 0
_064C:
	WalkFasterEast 6
	SetVisible
	FaceWest
	EndMovement

	.balign 4, 0
_065C:
	WalkFasterEast 6
	WalkFasterSouth
	SetVisible
	FaceWest
	EndMovement

	.balign 4, 0
_0670:
	WalkFasterEast 5
	SetVisible
	EndMovement

	.balign 4, 0
_067C:
	WalkFasterSouth
	WalkFasterEast 5
	SetVisible
	EndMovement

_068C:
	NPCMsg msg_0109_D32R0501_00000
	Return

_0691:
	NPCMsg msg_0109_D32R0501_00003
	Return

_0696:
	NPCMsg msg_0109_D32R0501_00001
	TouchscreenMenuHide
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 38, 255, 0
	MenuItemAdd 39, 255, 1
	Return

_06B5:
	NPCMsg msg_0109_D32R0501_00004
	TouchscreenMenuHide
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 40, 255, 4
	Return

_06CC:
	NPCMsg msg_0109_D32R0501_00002
	Return

_06D1:
	NPCMsg msg_0109_D32R0501_00005
	Return

scr_seq_D32R0501_001:
	ScrCmd_682 0
	SetVar VAR_TEMP_x4003, 1
	SetVar VAR_UNK_4147, 0
	NPCMsg msg_0109_D32R0501_00033
	Call _046A
	Call _06FD
	GoTo _04CB
	End

_06FD:
	AddWaitingIcon
	SaveGameNormal VAR_SPECIAL_RESULT
	RemoveWaitingIcon
	PlaySE SEQ_SE_DP_SAVE
	WaitSE SEQ_SE_DP_SAVE
	Return

scr_seq_D32R0501_002:
	LockAll
	FacePlayer
	NPCMsg msg_0109_D32R0501_00034
	ScrCmd_640 VAR_UNK_4148
	Compare VAR_BATTLE_CASTLE_PRINT_PROGRESS, 1
	CallIfEq _073C
	Compare VAR_BATTLE_CASTLE_PRINT_PROGRESS, 3
	CallIfEq _0744
	GoTo _0126
	End

_073C:
	SetVar VAR_BATTLE_CASTLE_PRINT_PROGRESS, 0
	Return

_0744:
	SetVar VAR_BATTLE_CASTLE_PRINT_PROGRESS, 2
	Return

scr_seq_D32R0501_003:
	Compare VAR_UNK_4148, 0
	CallIfEq _0788
	Compare VAR_UNK_4148, 1
	CallIfEq _0788
	Compare VAR_BATTLE_CASTLE_PRINT_PROGRESS, 1
	CallIfEq _078E
	Compare VAR_BATTLE_CASTLE_PRINT_PROGRESS, 3
	CallIfEq _07A5
	GoTo _0126
	End

_0788:
	AddSpecialGameStat2 28
	Return

_078E:
	NPCMsg msg_0109_D32R0501_00035
	BufferPlayersName 0
	NPCMsg msg_0109_D32R0501_00037
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	SetVar VAR_BATTLE_CASTLE_PRINT_PROGRESS, 2
	Return

_07A5:
	NPCMsg msg_0109_D32R0501_00035
	BufferPlayersName 0
	NPCMsg msg_0109_D32R0501_00036
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	SetVar VAR_BATTLE_CASTLE_PRINT_PROGRESS, 4
	CallStd std_frontier_gold_prints_check
	Return

scr_seq_D32R0501_004:
	GoTo _0126
	End

	.balign 4, 0
_07C8:
	WalkNormalNorth 2
	Delay8
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_07D8:
	WalkNormalNorth 2
	Delay8
	WalkNormalNorth
	EndMovement

scr_seq_D32R0501_006:
	SimpleNPCMsg msg_0109_D32R0501_00046
	End

scr_seq_D32R0501_007:
	SimpleNPCMsg msg_0109_D32R0501_00047
	End

scr_seq_D32R0501_008:
	SimpleNPCMsg msg_0109_D32R0501_00048
	End

scr_seq_D32R0501_009:
	SimpleNPCMsg msg_0109_D32R0501_00049
	End

scr_seq_D32R0501_010:
	SimpleNPCMsg msg_0109_D32R0501_00050
	End

scr_seq_D32R0501_011:
	SimpleNPCMsg msg_0109_D32R0501_00051
	End

scr_seq_D32R0501_012:
	SimpleNPCMsg msg_0109_D32R0501_00052
	End
	.balign 4, 0
