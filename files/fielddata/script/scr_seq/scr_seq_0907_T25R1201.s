#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R1201.h"
#include "msgdata/msg/msg_0600_T25R1201.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T25R1201_000
	ScrDef scr_seq_T25R1201_001
	ScrDef scr_seq_T25R1201_002
	ScrDef scr_seq_T25R1201_003
	ScrDef scr_seq_T25R1201_004
	ScrDef scr_seq_T25R1201_005
	ScrDef scr_seq_T25R1201_006
	ScrDef scr_seq_T25R1201_007
	ScrDef scr_seq_T25R1201_008
	ScrDef scr_seq_T25R1201_009
	ScrDef scr_seq_T25R1201_010
	ScrDef scr_seq_T25R1201_011
	ScrDef scr_seq_T25R1201_012
	ScrDef scr_seq_T25R1201_013
	ScrDef scr_seq_T25R1201_014
	ScrDef scr_seq_T25R1201_015
	ScrDef scr_seq_T25R1201_016
	ScrDef scr_seq_T25R1201_017
	ScrDefEnd
	ScrDefEnd ; not sure why there are two of these...

scr_seq_T25R1201_001:
	Compare VAR_UNK_4133, 6
	CallIfEq _005B
	End

_005B:
	MakeObjectVisible obj_player
	Return

scr_seq_T25R1201_002:
	ScrCmd_609
	LockAll
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4000, 8
	GoToIfEq _0084
	GoTo _009D

_007E:
	GoTo _0097

_0084:
	Compare VAR_TEMP_x4001, 2
	GoToIfEq _0097
	GoTo _009D

_0097:
	Call _00A7
_009D:
	SetVar VAR_UNK_4133, 0
	ReleaseAll
	End

_00A7:
	ScrCmd_307 0, 0, 8, 2, 77
	Call _00F5
	ScrCmd_374 obj_player
	ApplyMovement obj_player, _0108
	WaitMovement
	Call _00FD
	ScrCmd_307 0, 0, 8, 4, 77
	Call _00F5
	ApplyMovement obj_player, _0118
	WaitMovement
	Call _00FD
	SetVar VAR_UNK_4133, 0
	Return

_00F5:
	ScrCmd_310 77
	ScrCmd_308 77
	Return

_00FD:
	ScrCmd_311 77
	ScrCmd_308 77
	ScrCmd_309 77
	Return

	.balign 4, 0
_0108:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_0110:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_0118:
	WalkNormalSouth 2
	EndMovement

scr_seq_T25R1201_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PartyLegalCheck VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _03C4
	GoToIfSet FLAG_UNK_112, _0354
	SetFlag FLAG_UNK_112
	NPCMsg msg_0600_T25R1201_00000
_014B:
	TouchscreenMenuHide
_014D:
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 131, 255, 0
	MenuItemAdd 130, 255, 1
	MenuItemAdd 132, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0227
	Case 1, _01A4
	Case 2, _0330
	GoTo _0330
	End

_01A4:
	NPCMsg msg_0600_T25R1201_00002
	GoTo _01AF
	End

_01AF:
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 133, 255, 0
	MenuItemAdd 134, 255, 1
	MenuItemAdd 135, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0206
	Case 1, _0211
	Case 2, _021C
	GoTo _021C
	End

_0206:
	NPCMsg msg_0600_T25R1201_00003
	GoTo _01AF
	End

_0211:
	NPCMsg msg_0600_T25R1201_00004
	GoTo _01AF
	End

_021C:
	NPCMsg msg_0600_T25R1201_00005
	GoTo _014D
	End

_0227:
	PartyCountNotEgg VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfLt _0240
	GoTo _035F
	End

_0240:
	NPCMsg msg_0600_T25R1201_00009
	WaitButton
	TouchscreenMenuShow
	CloseMsg
	ReleaseAll
	End

_024D:
	CallStd std_prompt_save
	CopyVar VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0343
	TouchscreenMenuShow
	HealParty
	SetVar VAR_UNK_4133, 6
	NPCMsg msg_0600_T25R1201_00007
	CloseMsg
	ApplyMovement obj_player, _03A0
	WaitMovement
	ScrCmd_307 0, 0, 8, 4, 77
	Call _00F5
	ApplyMovement obj_player, _03B4
	WaitMovement
	Call _00FD
	ScrCmd_307 0, 0, 8, 2, 77
	Call _00F5
	ApplyMovement obj_player, _03AC
	WaitMovement
	MakeObjectVisible obj_player
	ApplyMovement obj_player, _03BC
	WaitMovement
	Call _00FD
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_579
	ScrCmd_815 0
	ScrCmd_166 VAR_SPECIAL_RESULT
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	ScrCmd_165 VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0314
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Call _00A7
	ReleaseAll
	End

_0314:
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Call _00A7
	GoTo _0343
	End

_0330:
	SetVar VAR_UNK_4133, 0
	TouchscreenMenuShow
	NPCMsg msg_0600_T25R1201_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0343:
	SetVar VAR_UNK_4133, 0
	NPCMsg msg_0600_T25R1201_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0354:
	NPCMsg msg_0600_T25R1201_00001
	GoTo _014B
	End

_035F:
	GetPartyCount VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 6
	GoToIfEq _0378
	GoTo _024D
	End

_0378:
	CountPCEmptySpace VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0391
	GoTo _024D
	End

_0391:
	TouchscreenMenuShow
	NPCMsg msg_0600_T25R1201_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_03A0:
	WalkNormalEast
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_03AC:
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_03B4:
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_03BC:
	FaceSouth
	EndMovement

_03C4:
	CallStd std_party_illegal
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R1201_003:
	SimpleNPCMsg msg_0600_T25R1201_00010
	End

scr_seq_T25R1201_004:
	SimpleNPCMsg msg_0600_T25R1201_00011
	End

scr_seq_T25R1201_005:
	SimpleNPCMsg msg_0600_T25R1201_00012
	End

scr_seq_T25R1201_006:
	SimpleNPCMsg msg_0600_T25R1201_00013
	End

scr_seq_T25R1201_007:
	SimpleNPCMsg msg_0600_T25R1201_00014
	End

scr_seq_T25R1201_008:
	SimpleNPCMsg msg_0600_T25R1201_00015
	End

scr_seq_T25R1201_009:
	SimpleNPCMsg msg_0600_T25R1201_00016
	End

scr_seq_T25R1201_010:
	SimpleNPCMsg msg_0600_T25R1201_00017
	End

scr_seq_T25R1201_011:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	SetVar VAR_SPECIAL_x8005, 3
	GoTo _047C
	End

_047C:
	NPCMsg msg_0600_T25R1201_00031
	TouchscreenMenuHide
	MenuInit 21, 11, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 33, 255, 0
	MenuItemAdd 34, 255, 1
	MenuItemAdd 35, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _04D3
	Case 1, _04F8
	GoTo _04CB
	End

_04CB:
	TouchscreenMenuShow
_04CD:
	CloseMsg
	ReleaseAll
	End

_04D3:
	CallStd std_prompt_save
	CopyVar VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _04CD
	CloseMsg
	ScrCmd_815 0
	CallStd std_enter_global_terminal
	ReleaseAll
	End

_04F8:
	NPCMsg msg_0600_T25R1201_00032
	GoTo _047C
	End

scr_seq_T25R1201_012:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	SetVar VAR_SPECIAL_x8005, 4
	GoTo _0517
	End

_0517:
	NPCMsg msg_0600_T25R1201_00029
	TouchscreenMenuHide
	MenuInit 21, 11, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 33, 255, 0
	MenuItemAdd 34, 255, 1
	MenuItemAdd 35, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _056E
	Case 1, _0593
	GoTo _0566
	End

_0566:
	TouchscreenMenuShow
_0568:
	CloseMsg
	ReleaseAll
	End

_056E:
	CallStd std_prompt_save
	CopyVar VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0568
	CloseMsg
	ScrCmd_815 0
	CallStd std_enter_global_terminal
	ReleaseAll
	End

_0593:
	NPCMsg msg_0600_T25R1201_00030
	GoTo _0517
	End

scr_seq_T25R1201_013:
	SimpleNPCMsg msg_0600_T25R1201_00027
	End

scr_seq_T25R1201_014:
	SimpleNPCMsg msg_0600_T25R1201_00028
	End

scr_seq_T25R1201_015:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PartyLegalCheck VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0622
	SetVar VAR_SPECIAL_x8000, 0
	GetPartyMonSpecies VAR_SPECIAL_x8000, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _064D
	BufferMonSpeciesName 0, 0
	NPCMsg msg_0600_T25R1201_00018
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _062D
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _063A
	End

_0622:
	NPCMsg msg_0600_T25R1201_00023
	GoTo _067F
	End

_062D:
	SetFavoriteMon
	NPCMsg msg_0600_T25R1201_00020
	GoTo _067F
	End

_063A:
	BufferMonSpeciesName 0, 0
	NPCMsg msg_0600_T25R1201_00021
	GoTo _067F
	End

_064A:
	NPCMsg msg_0600_T25R1201_00018
_064D:
	NPCMsg msg_0600_T25R1201_00019
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _062D
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0674
	End

_0674:
	NPCMsg msg_0600_T25R1201_00022
	GoTo _067F
	End

_067F:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R1201_016:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0600_T25R1201_00024
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _06D1
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CloseMsg
	ScrCmd_681 VAR_SPECIAL_x8004
	Compare VAR_SPECIAL_x8004, 0
	GoToIfEq _06D1
	NPCMsg msg_0600_T25R1201_00025
	WaitButton
	CloseMsg
	ReleaseAll
	End

_06D1:
	NPCMsg msg_0600_T25R1201_00026
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R1201_017:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0600_T25R1201_00036
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
