#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D32R0601.h"
#include "msgdata/msg/msg_0110_D32R0601.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D32R0601_000
	ScrDef scr_seq_D32R0601_001
	ScrDef scr_seq_D32R0601_002
	ScrDef scr_seq_D32R0601_003
	ScrDef scr_seq_D32R0601_004
	ScrDef scr_seq_D32R0601_005
	ScrDef scr_seq_D32R0601_006
	ScrDef scr_seq_D32R0601_007
	ScrDef scr_seq_D32R0601_008
	ScrDef scr_seq_D32R0601_009
	ScrDef scr_seq_D32R0601_010
	ScrDef scr_seq_D32R0601_011
	ScrDef scr_seq_D32R0601_012
	ScrDef scr_seq_D32R0601_013
	ScrDef scr_seq_D32R0601_014
	ScrDef scr_seq_D32R0601_015
	ScrDef scr_seq_D32R0601_016
	ScrDefEnd

scr_seq_D32R0601_014:
	End

scr_seq_D32R0601_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_TEMP_x4003, 0
	SetVar VAR_TEMP_x4004, 0
	GoTo _0080
	End

scr_seq_D32R0601_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_TEMP_x4003, 0
	SetVar VAR_TEMP_x4004, 1
	GoTo _0080
	End

_0080:
	ScrCmd_682 0
	Compare VAR_TEMP_x4004, 0
	CallIfEq _06A0
	Compare VAR_TEMP_x4004, 1
	CallIfEq _06A5
	GoTo _00A6
	End

_00A6:
	Compare VAR_TEMP_x4004, 0
	CallIfEq _06AA
	Compare VAR_TEMP_x4004, 1
	CallIfEq _06C9
	MenuItemAdd 41, 255, 2
	MenuItemAdd 42, 255, 3
	MenuExec
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _014B
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0178
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfEq _0110
	Compare VAR_SPECIAL_RESULT, 4
	GoToIfEq _01A5
	TouchscreenMenuShow
	GoTo _0132
	End

_0110:
	Compare VAR_TEMP_x4004, 0
	CallIfEq _06E0
	Compare VAR_TEMP_x4004, 1
	CallIfEq _06E5
	GoTo _00A6
	End

_0132:
	GoTo _013A
	End

_013A:
	SetVar VAR_UNK_414A, 0
	NPCMsg msg_0110_D32R0601_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_014B:
	SetVar VAR_UNK_4149, 0
	ScrCmd_643 0, 3, VAR_SPECIAL_RESULT
	BufferInt 0, 3
	BufferInt 1, 3
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01D2
	GoTo _01FC
	End

_0178:
	SetVar VAR_UNK_4149, 1
	ScrCmd_643 0, 3, VAR_SPECIAL_RESULT
	BufferInt 0, 3
	BufferInt 1, 3
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01D2
	GoTo _01FC
	End

_01A5:
	SetVar VAR_UNK_4149, 2
	ScrCmd_643 0, 2, VAR_SPECIAL_RESULT
	BufferInt 0, 2
	BufferInt 1, 2
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01E7
	GoTo _01FC
	End

_01D2:
	NPCMsg msg_0110_D32R0601_00008
	ScrCmd_444 9, 3, 0, 0
	TouchscreenMenuShow
	GoTo _0132
	End

_01E7:
	NPCMsg msg_0110_D32R0601_00008
	ScrCmd_444 9, 2, 0, 0
	TouchscreenMenuShow
	GoTo _0132
	End

_01FC:
	NPCMsg msg_0110_D32R0601_00007
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_643 4, VAR_UNK_4149, VAR_SPECIAL_RESULT
	ScrCmd_645 VAR_TEMP_x4002, VAR_TEMP_x4005, VAR_TEMP_x4006
	Compare VAR_TEMP_x4002, 255
	GoToIfNe _022E
	ScrCmd_815 0
_022E:
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_TEMP_x4002, 255
	GoToIfEq _0132
	DaycareSanitizeMon VAR_TEMP_x4002, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _0607
	DaycareSanitizeMon VAR_TEMP_x4005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _0607
	Compare VAR_UNK_4149, 2
	GoToIfEq _028F
	DaycareSanitizeMon VAR_TEMP_x4006, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _0607
_028F:
	GetPartyMonSpecies VAR_TEMP_x4002, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _02AA
	TouchscreenMenuShow
	GoTo _0132

_02AA:
	GoTo _02B2
	End

_02B2:
	GoTo _02BA
	End

_02BA:
	Compare VAR_UNK_4149, 0
	CallIfEq _0476
	Compare VAR_UNK_4149, 1
	CallIfEq _0476
	SetVar VAR_TEMP_x4000, 0
	HealParty
	CallStd std_prompt_save
	CopyVar VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0132
	TouchscreenMenuShow
	Compare VAR_UNK_4149, 2
	GoToIfEq _030A
	GoTo _04D7
	End

_030A:
	NPCMsg msg_0110_D32R0601_00043
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 14, 255, 0
	MenuItemAdd 15, 255, 1
	MenuItemAdd 5, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _035B
	Case 1, _03B3
	TouchscreenMenuShow
	GoTo _0132
	End

_035B:
	NPCMsg msg_0110_D32R0601_00044
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _030A
	TouchscreenMenuShow
	CloseMsg
	ScrCmd_226 32, 0, 0, VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _03A1
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _03A9
	GoTo _040B
	End

_03A1:
	GoTo _030A
	End

_03A9:
	ScrCmd_283
	GoTo _030A
	End

_03B3:
	NPCMsg msg_0110_D32R0601_00044
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _030A
	TouchscreenMenuShow
	CloseMsg
	ScrCmd_227 32, 0, 0, VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _03F9
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _0401
	GoTo _040B
	End

_03F9:
	GoTo _030A
	End

_0401:
	ScrCmd_283
	GoTo _030A
	End

_040B:
	ScrCmd_258
	ScrCmd_257 154
	GetPartyMonSpecies VAR_TEMP_x4002, VAR_SPECIAL_x8000
	GetPartyMonSpecies VAR_TEMP_x4005, VAR_SPECIAL_x8001
	ScrCmd_644 VAR_SPECIAL_x8000, VAR_SPECIAL_x8001, VAR_SPECIAL_RESULT
	Switch VAR_SPECIAL_RESULT
	Case 1, _047E
	Case 2, _0494
	Case 3, _04AA
	ScrCmd_258
	ScrCmd_257 156
	NPCMsg msg_0110_D32R0601_00045
	Compare VAR_UNK_4149, 2
	CallIfEq _0476
	Call _0711
	GoTo _04D7
	End

_0476:
	SetVar VAR_UNK_414A, 255
	Return

_047E:
	Call _04CD
	BufferMonSpeciesName 0, VAR_TEMP_x4002
	NPCMsg msg_0110_D32R0601_00029
	GoTo _04C5
	End

_0494:
	Call _04CD
	BufferMonSpeciesName 0, VAR_TEMP_x4005
	NPCMsg msg_0110_D32R0601_00029
	GoTo _04C5
	End

_04AA:
	Call _04CD
	BufferMonSpeciesName 0, VAR_TEMP_x4002
	BufferMonSpeciesName 1, VAR_TEMP_x4005
	NPCMsg msg_0110_D32R0601_00030
	GoTo _04C5
	End

_04C5:
	GoTo _0132
	End

_04CD:
	ScrCmd_258
	ScrCmd_257 157
	ScrCmd_283
	Return

_04D7:
	Compare VAR_UNK_4149, 0
	CallIfEq _056F
	Compare VAR_UNK_4149, 1
	CallIfEq _058A
	Compare VAR_UNK_4149, 2
	CallIfEq _05A5
	PlaySE SEQ_SE_DP_KAIDAN2
	GoTo _050A
	End

_050A:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_815 0
	Compare VAR_UNK_4149, 0
	CallIfEq _05CB
	Compare VAR_UNK_4149, 1
	CallIfEq _05DF
	Compare VAR_UNK_4149, 2
	CallIfEq _05F3
	ScrCmd_420 59
	ScrCmd_436
	ScrCmd_627 15
	Compare VAR_UNK_4149, 2
	CallIfEq _056B
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ScrCmd_682 1
	End

_056B:
	ScrCmd_283
	Return

_056F:
	NPCMsg msg_0110_D32R0601_00032
	WaitABPress
	CloseMsg
	ApplyMovement obj_player, _0618
	ApplyMovement VAR_SPECIAL_LAST_TALKED, _0638
	WaitMovement
	Return

_058A:
	NPCMsg msg_0110_D32R0601_00032
	WaitABPress
	CloseMsg
	ApplyMovement obj_player, _0618
	ApplyMovement VAR_SPECIAL_LAST_TALKED, _0638
	WaitMovement
	Return

_05A5:
	NPCMsgVar msg_0110_D32R0601_00032
	Wait 10, VAR_SPECIAL_RESULT
	ScrCmd_258
	ScrCmd_257 155
	CloseMsg
	ApplyMovement obj_player, _062C
	ApplyMovement VAR_SPECIAL_LAST_TALKED, _064C
	WaitMovement
	Return

_05CB:
	ApplyMovement obj_player, _0658
	ApplyMovement VAR_SPECIAL_LAST_TALKED, _0680
	WaitMovement
	Return

_05DF:
	ApplyMovement obj_player, _0658
	ApplyMovement VAR_SPECIAL_LAST_TALKED, _0680
	WaitMovement
	Return

_05F3:
	ApplyMovement obj_player, _0670
	ApplyMovement VAR_SPECIAL_LAST_TALKED, _0694
	WaitMovement
	Return

_0607:
	TouchscreenMenuShow
	SetVar VAR_UNK_414A, 0
	CallStd std_bag_is_full_griseous_orb
	End

	.balign 4, 0
_0618:
	WalkNormalNorth 2
	WalkNormalEast
	WalkNormalNorth 2
	SetInvisible
	EndMovement

	.balign 4, 0
_062C:
	WalkNormalNorth 4
	SetInvisible
	EndMovement

	.balign 4, 0
_0638:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 2
	SetInvisible
	EndMovement

	.balign 4, 0
_064C:
	WalkNormalNorth 3
	SetInvisible
	EndMovement

	.balign 4, 0
_0658:
	WalkFasterSouth 2
	WalkFasterWest
	WalkFasterSouth 2
	FaceNorth
	SetVisible
	EndMovement

	.balign 4, 0
_0670:
	WalkFasterSouth 4
	FaceNorth
	SetVisible
	EndMovement

	.balign 4, 0
_0680:
	WalkFasterSouth
	WalkFasterWest
	WalkFasterSouth 2
	SetVisible
	EndMovement

	.balign 4, 0
_0694:
	WalkFasterSouth 3
	SetVisible
	EndMovement

_06A0:
	NPCMsg msg_0110_D32R0601_00000
	Return

_06A5:
	NPCMsg msg_0110_D32R0601_00003
	Return

_06AA:
	NPCMsg msg_0110_D32R0601_00001
	TouchscreenMenuHide
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 38, 255, 0
	MenuItemAdd 39, 255, 1
	Return

_06C9:
	NPCMsg msg_0110_D32R0601_00004
	TouchscreenMenuHide
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 40, 255, 4
	Return

_06E0:
	NPCMsg msg_0110_D32R0601_00002
	Return

_06E5:
	NPCMsg msg_0110_D32R0601_00005
	Return

scr_seq_D32R0601_001:
	ScrCmd_682 0
	SetVar VAR_TEMP_x4003, 1
	SetVar VAR_UNK_414A, 0
	NPCMsg msg_0110_D32R0601_00033
	Call _0476
	Call _0711
	GoTo _04D7
	End

_0711:
	AddWaitingIcon
	SaveGameNormal VAR_SPECIAL_RESULT
	RemoveWaitingIcon
	PlaySE SEQ_SE_DP_SAVE
	WaitSE SEQ_SE_DP_SAVE
	Return

scr_seq_D32R0601_002:
	NPCMsg msg_0110_D32R0601_00034
	ScrCmd_646 VAR_UNK_4149
	Compare VAR_BATTLE_ARCADE_PRINT_PROGRESS, 1
	CallIfEq _074C
	Compare VAR_BATTLE_ARCADE_PRINT_PROGRESS, 3
	CallIfEq _0754
	GoTo _0132
	End

_074C:
	SetVar VAR_BATTLE_ARCADE_PRINT_PROGRESS, 0
	Return

_0754:
	SetVar VAR_BATTLE_ARCADE_PRINT_PROGRESS, 2
	Return

scr_seq_D32R0601_003:
	Compare VAR_UNK_4149, 0
	CallIfEq _0798
	Compare VAR_UNK_4149, 1
	CallIfEq _0798
	Compare VAR_BATTLE_ARCADE_PRINT_PROGRESS, 1
	CallIfEq _079E
	Compare VAR_BATTLE_ARCADE_PRINT_PROGRESS, 3
	CallIfEq _07B5
	GoTo _0132
	End

_0798:
	AddSpecialGameStat2 30
	Return

_079E:
	NPCMsg msg_0110_D32R0601_00035
	BufferPlayersName 0
	NPCMsg msg_0110_D32R0601_00037
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	SetVar VAR_BATTLE_ARCADE_PRINT_PROGRESS, 2
	Return

_07B5:
	NPCMsg msg_0110_D32R0601_00035
	BufferPlayersName 0
	NPCMsg msg_0110_D32R0601_00036
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	SetVar VAR_BATTLE_ARCADE_PRINT_PROGRESS, 4
	CallStd std_frontier_gold_prints_check
	Return

scr_seq_D32R0601_004:
	GoTo _0132
	End

	.balign 4, 0
_07D8:
	WalkNormalNorth 2
	Delay8
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_07E8:
	WalkNormalNorth 2
	Delay8
	WalkNormalNorth
	EndMovement

scr_seq_D32R0601_006:
	SimpleNPCMsg msg_0110_D32R0601_00046
	End

scr_seq_D32R0601_007:
	SimpleNPCMsg msg_0110_D32R0601_00047
	End

scr_seq_D32R0601_008:
	SimpleNPCMsg msg_0110_D32R0601_00048
	End

scr_seq_D32R0601_009:
	SimpleNPCMsg msg_0110_D32R0601_00049
	End

scr_seq_D32R0601_010:
	SimpleNPCMsg msg_0110_D32R0601_00050
	End

scr_seq_D32R0601_011:
	SimpleNPCMsg msg_0110_D32R0601_00051
	End

scr_seq_D32R0601_012:
	SimpleNPCMsg msg_0110_D32R0601_00052
	End

scr_seq_D32R0601_013:
	SimpleNPCMsg msg_0110_D32R0601_00053
	End

scr_seq_D32R0601_015:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0110_D32R0601_00054
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D32R0601_016:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0110_D32R0601_00055
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
