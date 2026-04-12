#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D32R0301.h"
#include "msgdata/msg/msg_0107_D32R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D32R0301_000
	ScrDef scr_seq_D32R0301_001
	ScrDef scr_seq_D32R0301_002
	ScrDef scr_seq_D32R0301_003
	ScrDef scr_seq_D32R0301_004
	ScrDef scr_seq_D32R0301_005
	ScrDef scr_seq_D32R0301_006
	ScrDef scr_seq_D32R0301_007
	ScrDef scr_seq_D32R0301_008
	ScrDef scr_seq_D32R0301_009
	ScrDef scr_seq_D32R0301_010
	ScrDef scr_seq_D32R0301_011
	ScrDef scr_seq_D32R0301_012
	ScrDef scr_seq_D32R0301_013
	ScrDefEnd

scr_seq_D32R0301_013:
	End

scr_seq_D32R0301_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_TEMP_x4003, 0
	SetVar VAR_TEMP_x4004, 0
	GoTo _0074
	End

scr_seq_D32R0301_005:
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
	CallIfEq _057C
	Compare VAR_TEMP_x4004, 1
	CallIfEq _0581
	GoTo _009A
	End

_009A:
	Compare VAR_TEMP_x4004, 0
	CallIfEq _0586
	Compare VAR_TEMP_x4004, 1
	CallIfEq _05A5
	MenuItemAdd 19, 255, 2
	MenuItemAdd 20, 255, 3
	MenuExec
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _013F
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _014D
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfEq _0104
	Compare VAR_SPECIAL_RESULT, 4
	GoToIfEq _015B
	TouchscreenMenuShow
	GoTo _0126
	End

_0104:
	Compare VAR_TEMP_x4004, 0
	CallIfEq _05BC
	Compare VAR_TEMP_x4004, 1
	CallIfEq _05C1
	GoTo _009A
	End

_0126:
	GoTo _012E
	End

_012E:
	SetVar VAR_UNK_4142, 0
	NPCMsg msg_0107_D32R0301_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_013F:
	SetVar VAR_UNK_4143, 0
	GoTo _0169
	End

_014D:
	SetVar VAR_UNK_4143, 1
	GoTo _0169
	End

_015B:
	SetVar VAR_UNK_4143, 2
	GoTo _0169
	End

_0169:
	NPCMsg msg_0107_D32R0301_00007
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 21, 255, 0
	MenuItemAdd 22, 255, 1
	MenuItemAdd 23, 255, 2
	MenuExec
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01B2
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _01C0
	TouchscreenMenuShow
	GoTo _0126
	End

_01B2:
	SetVar VAR_UNK_4144, 0
	GoTo _01CE
	End

_01C0:
	SetVar VAR_UNK_4144, 1
	GoTo _01CE
	End

_01CE:
	GoTo _01D6
	End

_01D6:
	Compare VAR_UNK_4143, 0
	CallIfEq _0399
	Compare VAR_UNK_4143, 1
	CallIfEq _0399
	SetVar VAR_TEMP_x4000, 0
	HealParty
	CallStd std_prompt_save
	CopyVar VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0126
	TouchscreenMenuShow
	Compare VAR_UNK_4143, 2
	GoToIfEq _0226
	GoTo _03A1
	End

_0226:
	NPCMsg msg_0107_D32R0301_00024
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 14, 255, 0
	MenuItemAdd 15, 255, 1
	MenuItemAdd 5, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0277
	Case 1, _02F9
	TouchscreenMenuShow
	GoTo _0126
	End

_0277:
	NPCMsg msg_0107_D32R0301_00025
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0226
	TouchscreenMenuShow
	CloseMsg
	Compare VAR_UNK_4144, 0
	CallIfEq _02CF
	Compare VAR_UNK_4144, 1
	CallIfEq _02DB
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _02E7
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _02EF
	GoTo _037B
	End

_02CF:
	ScrCmd_226 27, 0, 0, VAR_SPECIAL_RESULT
	Return

_02DB:
	ScrCmd_226 28, 0, 0, VAR_SPECIAL_RESULT
	Return

_02E7:
	GoTo _0226
	End

_02EF:
	ScrCmd_283
	GoTo _0226
	End

_02F9:
	NPCMsg msg_0107_D32R0301_00025
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0226
	TouchscreenMenuShow
	CloseMsg
	Compare VAR_UNK_4144, 0
	CallIfEq _0351
	Compare VAR_UNK_4144, 1
	CallIfEq _035D
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0369
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _0371
	GoTo _037B
	End

_0351:
	ScrCmd_227 27, 0, 0, VAR_SPECIAL_RESULT
	Return

_035D:
	ScrCmd_227 28, 0, 0, VAR_SPECIAL_RESULT
	Return

_0369:
	GoTo _0226
	End

_0371:
	ScrCmd_283
	GoTo _0226
	End

_037B:
	NPCMsg msg_0107_D32R0301_00026
	Compare VAR_UNK_4143, 2
	CallIfEq _0399
	Call _05ED
	GoTo _03A1
	End

_0399:
	SetVar VAR_UNK_4142, 255
	Return

_03A1:
	Compare VAR_UNK_4143, 0
	CallIfEq _0439
	Compare VAR_UNK_4143, 1
	CallIfEq _0454
	Compare VAR_UNK_4143, 2
	CallIfEq _046F
	PlaySE SEQ_SE_DP_KAIDAN2
	GoTo _03D4
	End

_03D4:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_815 0
	Compare VAR_UNK_4143, 0
	CallIfEq _0495
	Compare VAR_UNK_4143, 1
	CallIfEq _04A9
	Compare VAR_UNK_4143, 2
	CallIfEq _04BD
	ScrCmd_420 59
	ScrCmd_436
	ScrCmd_627 3
	Compare VAR_UNK_4143, 2
	CallIfEq _0435
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ScrCmd_682 1
	End

_0435:
	ScrCmd_283
	Return

_0439:
	NPCMsg msg_0107_D32R0301_00009
	WaitABPress
	CloseMsg
	ApplyMovement obj_player, _04D4
	ApplyMovement VAR_SPECIAL_LAST_TALKED, _04FC
	WaitMovement
	Return

_0454:
	NPCMsg msg_0107_D32R0301_00009
	WaitABPress
	CloseMsg
	ApplyMovement obj_player, _04D4
	ApplyMovement VAR_SPECIAL_LAST_TALKED, _04FC
	WaitMovement
	Return

_046F:
	NPCMsgVar msg_0107_D32R0301_00009
	Wait 15, VAR_SPECIAL_RESULT
	ScrCmd_258
	ScrCmd_257 169
	CloseMsg
	ApplyMovement obj_player, _04E8
	ApplyMovement VAR_SPECIAL_LAST_TALKED, _0510
	WaitMovement
	Return

_0495:
	ApplyMovement obj_player, _0524
	ApplyMovement VAR_SPECIAL_LAST_TALKED, _0554
	WaitMovement
	Return

_04A9:
	ApplyMovement obj_player, _0524
	ApplyMovement VAR_SPECIAL_LAST_TALKED, _0554
	WaitMovement
	Return

_04BD:
	ApplyMovement obj_player, _053C
	ApplyMovement VAR_SPECIAL_LAST_TALKED, _0568
	WaitMovement
	Return

	.balign 4, 0
_04D4:
	WalkNormalNorth 3
	WalkNormalEast
	WalkNormalNorth 4
	SetInvisible
	EndMovement

	.balign 4, 0
_04E8:
	WalkNormalNorth 3
	WalkNormalWest
	WalkNormalNorth 4
	SetInvisible
	EndMovement

	.balign 4, 0
_04FC:
	WalkNormalNorth 2
	WalkNormalEast
	WalkNormalNorth 4
	SetInvisible
	EndMovement

	.balign 4, 0
_0510:
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 4
	SetInvisible
	EndMovement

	.balign 4, 0
_0524:
	WalkFasterSouth 3
	WalkFasterWest
	WalkFasterSouth 4
	FaceNorth
	SetVisible
	EndMovement

	.balign 4, 0
_053C:
	WalkFasterSouth 3
	WalkFasterEast
	WalkFasterSouth 4
	FaceNorth
	SetVisible
	EndMovement

	.balign 4, 0
_0554:
	WalkFasterSouth 2
	WalkFasterWest
	WalkFasterSouth 4
	SetVisible
	EndMovement

	.balign 4, 0
_0568:
	WalkFasterSouth 2
	WalkFasterEast
	WalkFasterSouth 4
	SetVisible
	EndMovement

_057C:
	NPCMsg msg_0107_D32R0301_00000
	Return

_0581:
	NPCMsg msg_0107_D32R0301_00003
	Return

_0586:
	NPCMsg msg_0107_D32R0301_00001
	TouchscreenMenuHide
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 16, 255, 0
	MenuItemAdd 17, 255, 1
	Return

_05A5:
	NPCMsg msg_0107_D32R0301_00004
	TouchscreenMenuHide
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 18, 255, 4
	Return

_05BC:
	NPCMsg msg_0107_D32R0301_00002
	Return

_05C1:
	NPCMsg msg_0107_D32R0301_00005
	Return

scr_seq_D32R0301_001:
	ScrCmd_682 0
	SetVar VAR_TEMP_x4003, 1
	SetVar VAR_UNK_4142, 0
	NPCMsg msg_0107_D32R0301_00011
	Call _0399
	Call _05ED
	GoTo _03A1
	End

_05ED:
	AddWaitingIcon
	SaveGameNormal VAR_SPECIAL_RESULT
	RemoveWaitingIcon
	PlaySE SEQ_SE_DP_SAVE
	WaitSE SEQ_SE_DP_SAVE
	Return

scr_seq_D32R0301_002:
	LockAll
	FacePlayer
	NPCMsg msg_0107_D32R0301_00012
	ScrCmd_628 VAR_UNK_4143, VAR_UNK_4144
	Compare VAR_BATTLE_FACTORY_PRINT_PROGRESS, 1
	CallIfEq _062E
	Compare VAR_BATTLE_FACTORY_PRINT_PROGRESS, 3
	CallIfEq _0636
	GoTo _0126
	End

_062E:
	SetVar VAR_BATTLE_FACTORY_PRINT_PROGRESS, 0
	Return

_0636:
	SetVar VAR_BATTLE_FACTORY_PRINT_PROGRESS, 2
	Return

scr_seq_D32R0301_003:
	Compare VAR_UNK_4143, 0
	CallIfEq _067A
	Compare VAR_UNK_4143, 1
	CallIfEq _067A
	Compare VAR_BATTLE_FACTORY_PRINT_PROGRESS, 1
	CallIfEq _0680
	Compare VAR_BATTLE_FACTORY_PRINT_PROGRESS, 3
	CallIfEq _0697
	GoTo _0126
	End

_067A:
	AddSpecialGameStat2 27
	Return

_0680:
	NPCMsg msg_0107_D32R0301_00013
	BufferPlayersName 0
	NPCMsg msg_0107_D32R0301_00015
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	SetVar VAR_BATTLE_FACTORY_PRINT_PROGRESS, 2
	Return

_0697:
	NPCMsg msg_0107_D32R0301_00013
	BufferPlayersName 0
	NPCMsg msg_0107_D32R0301_00014
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	SetVar VAR_BATTLE_FACTORY_PRINT_PROGRESS, 4
	CallStd std_frontier_gold_prints_check
	Return

scr_seq_D32R0301_004:
	GoTo _0126
	End

	.balign 4, 0
_06BC:
	WalkNormalNorth 2
	Delay8
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_06CC:
	WalkNormalNorth 2
	Delay8
	WalkNormalNorth
	EndMovement

scr_seq_D32R0301_006:
	SimpleNPCMsg msg_0107_D32R0301_00027
	End

scr_seq_D32R0301_007:
	SimpleNPCMsg msg_0107_D32R0301_00028
	End

scr_seq_D32R0301_008:
	SimpleNPCMsg msg_0107_D32R0301_00029
	End

scr_seq_D32R0301_009:
	SimpleNPCMsg msg_0107_D32R0301_00030
	End

scr_seq_D32R0301_010:
	SimpleNPCMsg msg_0107_D32R0301_00031
	End

scr_seq_D32R0301_011:
	SimpleNPCMsg msg_0107_D32R0301_00032
	End

scr_seq_D32R0301_012:
	SimpleNPCMsg msg_0107_D32R0301_00033
	End
	.balign 4, 0
