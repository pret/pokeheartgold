#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D32R0401.h"
#include "msgdata/msg/msg_0108_D32R0401.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D32R0401_000
	ScrDef scr_seq_D32R0401_001
	ScrDef scr_seq_D32R0401_002
	ScrDef scr_seq_D32R0401_003
	ScrDef scr_seq_D32R0401_004
	ScrDef scr_seq_D32R0401_005
	ScrDef scr_seq_D32R0401_006
	ScrDef scr_seq_D32R0401_007
	ScrDef scr_seq_D32R0401_008
	ScrDef scr_seq_D32R0401_009
	ScrDef scr_seq_D32R0401_010
	ScrDef scr_seq_D32R0401_011
	ScrDef scr_seq_D32R0401_012
	ScrDef scr_seq_D32R0401_013
	ScrDef scr_seq_D32R0401_014
	ScrDef scr_seq_D32R0401_015
	ScrDef scr_seq_D32R0401_016
	ScrDef scr_seq_D32R0401_017
	ScrDef scr_seq_D32R0401_018
	ScrDef scr_seq_D32R0401_019
	ScrDef scr_seq_D32R0401_020
	ScrDef scr_seq_D32R0401_021
	ScrDefEnd

scr_seq_D32R0401_021:
	BattleHallCountUsedSpecies VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 11
	CallIfGe _0090
	Compare VAR_TEMP_x4000, 101
	CallIfGe _007A
	End

_007A:
	MovePerson obj_D32R0401_var_10, 8, 11
	MovePersonFacing obj_D32R0401_var_10, 8, 0, 11, DIR_WEST
	Return

_0090:
	MovePerson obj_D32R0401_var_10, 13, 11
	MovePersonFacing obj_D32R0401_var_10, 13, 0, 11, DIR_WEST
	Return

scr_seq_D32R0401_020:
	Compare VAR_UNK_4145, 1
	GoToIfEq _00B5
	End

_00B5:
	Random VAR_TEMP_x4007, 100
	CallIfUnset FLAG_UNK_234, _00D5
	Compare VAR_TEMP_x4007, 30
	GoToIfLt _00DF
	End

_00D5:
	HidePerson obj_D32R0401_var_2
	SetFlag FLAG_UNK_234
	Return

_00DF:
	GoToIfUnset FLAG_UNK_AA1, _00EC
	End

_00EC:
	SetFlag FLAG_UNK_AA1
	BattleHallGetTotalStreak VAR_TEMP_x4008
	Compare VAR_TEMP_x4008, 10000
	GoToIfGe _011D
	Compare VAR_TEMP_x4008, 1000
	GoToIfGe _012B
	Compare VAR_TEMP_x4008, 500
	GoToIfGe _0139
	End

_011D:
	Random VAR_UNK_4053, 4
	GoTo _0147
	End

_012B:
	Random VAR_UNK_4053, 2
	GoTo _0147
	End

_0139:
	SetVar VAR_UNK_4053, 0
	GoTo _0147
	End

_0147:
	ClearFlag FLAG_UNK_234
	Call _017D
	ShowPerson obj_D32R0401_var_2
	End

scr_seq_D32R0401_015:
	GetPlayerGender VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	CallIfEq _01FB
	Compare VAR_TEMP_x4000, 1
	CallIfEq _0203
	Call _017D
	End

_017D:
	Compare VAR_UNK_4053, 0
	CallIfEq _01B3
	Compare VAR_UNK_4053, 1
	CallIfEq _01E3
	Compare VAR_UNK_4053, 2
	CallIfEq _01EB
	Compare VAR_UNK_4053, 3
	CallIfEq _01F3
	Return

_01B3:
	GetPlayerGender VAR_TEMP_x4009
	Compare VAR_TEMP_x4009, 0
	GoToIfEq _01D3
	Compare VAR_TEMP_x4009, 1
	GoToIfEq _01DB
	Return

_01D3:
	SetVar VAR_OBJ_1, 97
	Return

_01DB:
	SetVar VAR_OBJ_1, 0
	Return

_01E3:
	SetVar VAR_OBJ_1, 365
	Return

_01EB:
	SetVar VAR_OBJ_1, 366
	Return

_01F3:
	SetVar VAR_OBJ_1, 354
	Return

_01FB:
	SetVar VAR_OBJ_9, 320
	Return

_0203:
	SetVar VAR_OBJ_9, 317
	Return

scr_seq_D32R0401_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_TEMP_x4003, 0
	SetVar VAR_TEMP_x4004, 0
	GoTo _0243
	End

scr_seq_D32R0401_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_TEMP_x4003, 0
	SetVar VAR_TEMP_x4004, 1
	GoTo _0243
	End

_0243:
	ScrCmd_682 0
	Compare VAR_TEMP_x4004, 0
	CallIfEq _0868
	Compare VAR_TEMP_x4004, 1
	CallIfEq _086D
	GoTo _0269
	End

_0269:
	Compare VAR_TEMP_x4004, 0
	CallIfEq _0872
	Compare VAR_TEMP_x4004, 1
	CallIfEq _0891
	MenuItemAdd 19, 255, 2
	MenuItemAdd 20, 255, 3
	MenuExec
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _030E
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0331
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfEq _02D3
	Compare VAR_SPECIAL_RESULT, 4
	GoToIfEq _0354
	TouchscreenMenuShow
	GoTo _02F5
	End

_02D3:
	Compare VAR_TEMP_x4004, 0
	CallIfEq _08A8
	Compare VAR_TEMP_x4004, 1
	CallIfEq _08AD
	GoTo _0269
	End

_02F5:
	GoTo _02FD
	End

_02FD:
	SetVar VAR_UNK_4145, 0
	NPCMsg msg_0108_D32R0401_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_030E:
	SetVar VAR_UNK_4146, 0
	ScrCmd_633 0, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0377
	GoTo _03A1
	End

_0331:
	SetVar VAR_UNK_4146, 1
	ScrCmd_633 0, 2, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _038C
	GoTo _03A1
	End

_0354:
	SetVar VAR_UNK_4146, 2
	ScrCmd_633 0, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0377
	GoTo _03A1
	End

_0377:
	NPCMsg msg_0108_D32R0401_00035
	ScrCmd_444 37, 1, 0, 0
	TouchscreenMenuShow
	GoTo _02F5
	End

_038C:
	NPCMsg msg_0108_D32R0401_00036
	ScrCmd_444 37, 2, 0, 0
	TouchscreenMenuShow
	GoTo _02F5
	End

_03A1:
	NPCMsg msg_0108_D32R0401_00033
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_633 4, VAR_UNK_4146, VAR_SPECIAL_RESULT
	ScrCmd_635 VAR_TEMP_x4002, VAR_TEMP_x4005
	Compare VAR_TEMP_x4002, 255
	GoToIfNe _03D1
	ScrCmd_815 0
_03D1:
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_TEMP_x4002, 255
	GoToIfEq _02F5
	DaycareSanitizeMon VAR_TEMP_x4002, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _07B9
	Compare VAR_UNK_4146, 1
	GoToIfEq _0414
	GoTo _042F
	End

_0414:
	DaycareSanitizeMon VAR_TEMP_x4005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _07B9
	GoTo _042F
	End

_042F:
	GetPartyMonSpecies VAR_TEMP_x4002, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _044A
	TouchscreenMenuShow
	GoTo _02F5

_044A:
	ScrCmd_633 1, VAR_UNK_4146, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _04D8
	ScrCmd_633 2, VAR_UNK_4146, VAR_SPECIAL_RESULT
	BufferSpeciesName 0, VAR_SPECIAL_RESULT, 0, 0
	Compare VAR_SPECIAL_RESULT, VAR_TEMP_x4001
	GoToIfEq _04D8
	GoTo _0484
	End

_0484:
	BufferSpeciesName 1, VAR_TEMP_x4001, 0, 0
	NPCMsg msg_0108_D32R0401_00034
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 1, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 42, 255, 0
	MenuItemAdd 43, 255, 1
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _04C8
	TouchscreenMenuShow
	GoTo _02F5
	End

_04C8:
	ScrCmd_633 3, VAR_UNK_4146, VAR_SPECIAL_RESULT
	GoTo _04D8
	End

_04D8:
	GoTo _04E0
	End

_04E0:
	Compare VAR_UNK_4146, 0
	CallIfEq _066C
	Compare VAR_UNK_4146, 1
	CallIfEq _066C
	SetVar VAR_TEMP_x4000, 0
	HealParty
	CallStd std_prompt_save
	CopyVar VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _02F5
	Compare VAR_UNK_4146, 2
	GoToIfEq _052E
	GoTo _0689
	End

_052E:
	NPCMsg msg_0108_D32R0401_00030
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 14, 255, 0
	MenuItemAdd 15, 255, 1
	MenuItemAdd 5, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _057F
	Case 1, _05D7
	TouchscreenMenuShow
	GoTo _02F5
	End

_057F:
	NPCMsg msg_0108_D32R0401_00031
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _052E
	TouchscreenMenuShow
	CloseMsg
	ScrCmd_226 30, 0, 0, VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _05C5
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _05CD
	GoTo _062F
	End

_05C5:
	GoTo _052E
	End

_05CD:
	ScrCmd_283
	GoTo _052E
	End

_05D7:
	NPCMsg msg_0108_D32R0401_00031
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _052E
	TouchscreenMenuShow
	CloseMsg
	ScrCmd_227 30, 0, 0, VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _061D
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _0625
	GoTo _062F
	End

_061D:
	GoTo _052E
	End

_0625:
	ScrCmd_283
	GoTo _052E
	End

_062F:
	ScrCmd_258
	ScrCmd_257 108
	ScrCmd_634 VAR_TEMP_x4001, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0674
	ScrCmd_258
	ScrCmd_257 110
	NPCMsg msg_0108_D32R0401_00032
	Compare VAR_UNK_4146, 2
	CallIfEq _066C
	Call _08D9
	GoTo _0689
	End

_066C:
	SetVar VAR_UNK_4145, 255
	Return

_0674:
	Call _0685
	NPCMsg msg_0108_D32R0401_00057
	GoTo _02F5
	End

_0685:
	ScrCmd_283
	Return

_0689:
	Compare VAR_UNK_4146, 0
	CallIfEq _0721
	Compare VAR_UNK_4146, 1
	CallIfEq _073C
	Compare VAR_UNK_4146, 2
	CallIfEq _0757
	PlaySE SEQ_SE_DP_KAIDAN2
	GoTo _06BC
	End

_06BC:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_815 0
	Compare VAR_UNK_4146, 0
	CallIfEq _077D
	Compare VAR_UNK_4146, 1
	CallIfEq _0791
	Compare VAR_UNK_4146, 2
	CallIfEq _07A5
	ScrCmd_420 59
	ScrCmd_436
	ScrCmd_627 9
	Compare VAR_UNK_4146, 2
	CallIfEq _071D
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ScrCmd_682 1
	End

_071D:
	ScrCmd_283
	Return

_0721:
	NPCMsg msg_0108_D32R0401_00009
	WaitABPress
	CloseMsg
	ApplyMovement obj_player, _07C8
	ApplyMovement VAR_SPECIAL_LAST_TALKED, _07F0
	WaitMovement
	Return

_073C:
	NPCMsg msg_0108_D32R0401_00009
	WaitABPress
	CloseMsg
	ApplyMovement obj_player, _07C8
	ApplyMovement VAR_SPECIAL_LAST_TALKED, _07F0
	WaitMovement
	Return

_0757:
	NPCMsgVar msg_0108_D32R0401_00009
	Wait 10, VAR_SPECIAL_RESULT
	ScrCmd_258
	ScrCmd_257 109
	CloseMsg
	ApplyMovement obj_player, _07D8
	ApplyMovement VAR_SPECIAL_LAST_TALKED, _0800
	WaitMovement
	Return

_077D:
	ApplyMovement obj_player, _0818
	ApplyMovement VAR_SPECIAL_LAST_TALKED, _0848
	WaitMovement
	Return

_0791:
	ApplyMovement obj_player, _0818
	ApplyMovement VAR_SPECIAL_LAST_TALKED, _0848
	WaitMovement
	Return

_07A5:
	ApplyMovement obj_player, _082C
	ApplyMovement VAR_SPECIAL_LAST_TALKED, _0858
	WaitMovement
	Return

_07B9:
	TouchscreenMenuShow
	SetVar VAR_UNK_4145, 0
	CallStd std_bag_is_full_griseous_orb
	End

	.balign 4, 0
_07C8:
	WalkNormalWest 4
	WalkNormalSouth 3
	SetInvisible
	EndMovement

	.balign 4, 0
_07D8:
	WalkNormalWest 2
	WalkNormalNorth
	WalkNormalWest 2
	WalkNormalSouth 3
	SetInvisible
	EndMovement

	.balign 4, 0
_07F0:
	WalkNormalWest 3
	WalkNormalSouth 3
	SetInvisible
	EndMovement

	.balign 4, 0
_0800:
	WalkNormalWest
	WalkNormalNorth
	WalkNormalWest 2
	WalkNormalSouth 3
	SetInvisible
	EndMovement

	.balign 4, 0
_0818:
	WalkFasterEast 4
	WalkFasterNorth 3
	FaceWest
	SetVisible
	EndMovement

	.balign 4, 0
_082C:
	WalkFasterEast 2
	WalkFasterSouth
	WalkFasterEast 2
	WalkFasterNorth 3
	FaceWest
	SetVisible
	EndMovement

	.balign 4, 0
_0848:
	WalkFasterNorth 3
	WalkFasterEast 3
	SetVisible
	EndMovement

	.balign 4, 0
_0858:
	WalkFasterNorth 2
	WalkFasterEast 3
	SetVisible
	EndMovement

_0868:
	NPCMsg msg_0108_D32R0401_00000
	Return

_086D:
	NPCMsg msg_0108_D32R0401_00003
	Return

_0872:
	NPCMsg msg_0108_D32R0401_00001
	TouchscreenMenuHide
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 16, 255, 0
	MenuItemAdd 17, 255, 1
	Return

_0891:
	NPCMsg msg_0108_D32R0401_00004
	TouchscreenMenuHide
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 18, 255, 4
	Return

_08A8:
	NPCMsg msg_0108_D32R0401_00002
	Return

_08AD:
	NPCMsg msg_0108_D32R0401_00005
	Return

scr_seq_D32R0401_001:
	ScrCmd_682 0
	SetVar VAR_TEMP_x4003, 1
	SetVar VAR_UNK_4145, 0
	NPCMsg msg_0108_D32R0401_00011
	Call _066C
	Call _08D9
	GoTo _0689
	End

_08D9:
	AddWaitingIcon
	SaveGameNormal VAR_SPECIAL_RESULT
	RemoveWaitingIcon
	PlaySE SEQ_SE_DP_SAVE
	WaitSE SEQ_SE_DP_SAVE
	Return

scr_seq_D32R0401_002:
	NPCMsg msg_0108_D32R0401_00012
	ScrCmd_636 VAR_UNK_4146
	Compare VAR_BATTLE_HALL_PRINT_PROGRESS, 1
	CallIfEq _0914
	Compare VAR_BATTLE_HALL_PRINT_PROGRESS, 3
	CallIfEq _091C
	GoTo _02F5
	End

_0914:
	SetVar VAR_BATTLE_HALL_PRINT_PROGRESS, 0
	Return

_091C:
	SetVar VAR_BATTLE_HALL_PRINT_PROGRESS, 2
	Return

scr_seq_D32R0401_003:
	Compare VAR_UNK_4146, 0
	CallIfEq _0960
	Compare VAR_UNK_4146, 1
	CallIfEq _0960
	Compare VAR_BATTLE_HALL_PRINT_PROGRESS, 1
	CallIfEq _0966
	Compare VAR_BATTLE_HALL_PRINT_PROGRESS, 3
	CallIfEq _097D
	GoTo _02F5
	End

_0960:
	AddSpecialGameStat2 29
	Return

_0966:
	NPCMsg msg_0108_D32R0401_00013
	BufferPlayersName 0
	NPCMsg msg_0108_D32R0401_00015
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	SetVar VAR_BATTLE_HALL_PRINT_PROGRESS, 2
	Return

_097D:
	NPCMsg msg_0108_D32R0401_00013
	BufferPlayersName 0
	NPCMsg msg_0108_D32R0401_00014
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	SetVar VAR_BATTLE_HALL_PRINT_PROGRESS, 4
	CallStd std_frontier_gold_prints_check
	Return

scr_seq_D32R0401_004:
	GoTo _02F5
	End

	.balign 4, 0
_09A0:
	WalkNormalNorth 2
	Delay8
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_09B0:
	WalkNormalNorth 2
	Delay8
	WalkNormalNorth
	EndMovement

scr_seq_D32R0401_006:
	SimpleNPCMsg msg_0108_D32R0401_00059
	End

scr_seq_D32R0401_007:
	SimpleNPCMsg msg_0108_D32R0401_00060
	End

scr_seq_D32R0401_008:
	SimpleNPCMsg msg_0108_D32R0401_00061
	End

scr_seq_D32R0401_009:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	WaitSE SEQ_SE_DP_SELECT
	PlayCry SPECIES_SLOWBRO, 0
	NPCMsg msg_0108_D32R0401_00062
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D32R0401_010:
	SimpleNPCMsg msg_0108_D32R0401_00063
	End

scr_seq_D32R0401_011:
	SimpleNPCMsg msg_0108_D32R0401_00064
	End

scr_seq_D32R0401_012:
	SimpleNPCMsg msg_0108_D32R0401_00065
	End

scr_seq_D32R0401_013:
	SimpleNPCMsg msg_0108_D32R0401_00066
	End

scr_seq_D32R0401_014:
	SimpleNPCMsg msg_0108_D32R0401_00067
	End

scr_seq_D32R0401_016:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfUnset FLAG_MET_HALL_STREAK_TRACKER_DUDE, _0AFF
	BufferBattleHallStreak 1, 2, 3, 4, VAR_BATTLE_HALL_WIN_STREAK_LEVEL, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0AD5
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfEq _0AE0
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _0AF1
	BufferPlayersName 0
	NPCMsg msg_0108_D32R0401_00069
	NPCMsg msg_0108_D32R0401_00070
	PlayFanfare SEQ_ME_BPGET
	NPCMsg msg_0108_D32R0401_00072
	WaitFanfare
	GoTo _0B0E
	End

_0AD5:
	NPCMsg msg_0108_D32R0401_00068
	GoTo _0B0E
	End

_0AE0:
	BufferPlayersName 0
	NPCMsg msg_0108_D32R0401_00073
	NPCMsg msg_0108_D32R0401_00071
	GoTo _0B0E
	End

_0AF1:
	BufferPlayersName 0
	NPCMsg msg_0108_D32R0401_00074
	GoTo _0B0E
	End

_0AFF:
	SetFlag FLAG_MET_HALL_STREAK_TRACKER_DUDE
	NPCMsg msg_0108_D32R0401_00068
	GoTo _0B0E
	End

_0B0E:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D32R0401_017:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetPlayerGender VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0C4A
	GoTo _0B37
	End

_0B37:
	BufferPlayersName 0
	BattleHallCountUsedSpecies VAR_SPECIAL_x8005
	Compare VAR_SPECIAL_x8005, 475
	GoToIfGe _0BBE
	Compare VAR_SPECIAL_x8005, 351
	GoToIfGe _0BC9
	Compare VAR_SPECIAL_x8005, 251
	GoToIfGe _0BD4
	Compare VAR_SPECIAL_x8005, 151
	GoToIfGe _0BDF
	Compare VAR_SPECIAL_x8005, 101
	GoToIfGe _0BEA
	Compare VAR_SPECIAL_x8005, 51
	GoToIfGe _0BF5
	Compare VAR_SPECIAL_x8005, 31
	GoToIfGe _0C00
	Compare VAR_SPECIAL_x8005, 11
	GoToIfGe _0C0B
	Compare VAR_SPECIAL_x8005, 1
	GoToIfGe _0C16
	NPCMsg msg_0108_D32R0401_00075
	GoTo _0C21
	End

_0BBE:
	NPCMsg msg_0108_D32R0401_00084
	GoTo _0C21
	End

_0BC9:
	NPCMsg msg_0108_D32R0401_00083
	GoTo _0C21
	End

_0BD4:
	NPCMsg msg_0108_D32R0401_00082
	GoTo _0C21
	End

_0BDF:
	NPCMsg msg_0108_D32R0401_00081
	GoTo _0C21
	End

_0BEA:
	NPCMsg msg_0108_D32R0401_00080
	GoTo _0C21
	End

_0BF5:
	NPCMsg msg_0108_D32R0401_00079
	GoTo _0C21
	End

_0C00:
	NPCMsg msg_0108_D32R0401_00078
	GoTo _0C21
	End

_0C0B:
	NPCMsg msg_0108_D32R0401_00077
	GoTo _0C21
	End

_0C16:
	NPCMsg msg_0108_D32R0401_00076
	GoTo _0C21
	End

_0C21:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D32R0401_018:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetPlayerGender VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0B37
	GoTo _0C4A
	End

_0C4A:
	BufferPlayersName 0
	BattleHallCountUsedSpecies VAR_SPECIAL_x8005
	Compare VAR_SPECIAL_x8005, 475
	GoToIfGe _0CD1
	Compare VAR_SPECIAL_x8005, 351
	GoToIfGe _0CDC
	Compare VAR_SPECIAL_x8005, 251
	GoToIfGe _0CE7
	Compare VAR_SPECIAL_x8005, 151
	GoToIfGe _0CF2
	Compare VAR_SPECIAL_x8005, 101
	GoToIfGe _0CFD
	Compare VAR_SPECIAL_x8005, 51
	GoToIfGe _0D08
	Compare VAR_SPECIAL_x8005, 31
	GoToIfGe _0D13
	Compare VAR_SPECIAL_x8005, 11
	GoToIfGe _0D1E
	Compare VAR_SPECIAL_x8005, 1
	GoToIfGe _0D29
	NPCMsg msg_0108_D32R0401_00085
	GoTo _0D34
	End

_0CD1:
	NPCMsg msg_0108_D32R0401_00094
	GoTo _0D34
	End

_0CDC:
	NPCMsg msg_0108_D32R0401_00093
	GoTo _0D34
	End

_0CE7:
	NPCMsg msg_0108_D32R0401_00092
	GoTo _0D34
	End

_0CF2:
	NPCMsg msg_0108_D32R0401_00091
	GoTo _0D34
	End

_0CFD:
	NPCMsg msg_0108_D32R0401_00090
	GoTo _0D34
	End

_0D08:
	NPCMsg msg_0108_D32R0401_00089
	GoTo _0D34
	End

_0D13:
	NPCMsg msg_0108_D32R0401_00088
	GoTo _0D34
	End

_0D1E:
	NPCMsg msg_0108_D32R0401_00087
	GoTo _0D34
	End

_0D29:
	NPCMsg msg_0108_D32R0401_00086
	GoTo _0D34
	End

_0D34:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D32R0401_019:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	BufferPlayersName 0
	CopyVar VAR_TEMP_x4001, VAR_OBJ_1
	Compare VAR_TEMP_x4001, 0
	GoToIfEq _0D90
	Compare VAR_TEMP_x4001, 97
	GoToIfEq _0D9B
	Compare VAR_TEMP_x4001, 365
	GoToIfEq _0DA6
	Compare VAR_TEMP_x4001, 366
	GoToIfEq _0DB1
	Compare VAR_TEMP_x4001, 354
	GoToIfEq _0DBC
	End

_0D90:
	NPCMsg msg_0108_D32R0401_00096
	GoTo _0DC7
	End

_0D9B:
	NPCMsg msg_0108_D32R0401_00095
	GoTo _0DC7
	End

_0DA6:
	NPCMsg msg_0108_D32R0401_00097
	GoTo _0DC7
	End

_0DB1:
	NPCMsg msg_0108_D32R0401_00098
	GoTo _0DC7
	End

_0DBC:
	NPCMsg msg_0108_D32R0401_00099
	GoTo _0DC7
	End

_0DC7:
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
