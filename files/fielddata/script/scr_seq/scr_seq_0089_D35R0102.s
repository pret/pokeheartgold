#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D35R0102.h"
#include "msgdata/msg/msg_0112_D35R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D35R0102_000
	ScrDef scr_seq_D35R0102_001
	ScrDef scr_seq_D35R0102_002
	ScrDef scr_seq_D35R0102_003
	ScrDef scr_seq_D35R0102_004
	ScrDef scr_seq_D35R0102_005
	ScrDef scr_seq_D35R0102_006
	ScrDef scr_seq_D35R0102_007
	ScrDef scr_seq_D35R0102_008
	ScrDef scr_seq_D35R0102_009
	ScrDef scr_seq_D35R0102_010
	ScrDef scr_seq_D35R0102_011
	ScrDef scr_seq_D35R0102_012
	ScrDef scr_seq_D35R0102_013
	ScrDef scr_seq_D35R0102_014
	ScrDef scr_seq_D35R0102_015
	ScrDef scr_seq_D35R0102_016
	ScrDef scr_seq_D35R0102_017
	ScrDef scr_seq_D35R0102_018
	ScrDef scr_seq_D35R0102_019
	ScrDef scr_seq_D35R0102_020
	ScrDef scr_seq_D35R0102_021
	ScrDef scr_seq_D35R0102_022
	ScrDef scr_seq_D35R0102_023
	ScrDef scr_seq_D35R0102_024
	ScrDef scr_seq_D35R0102_025
	ScrDef scr_seq_D35R0102_026
	ScrDef scr_seq_D35R0102_027
	ScrDef scr_seq_D35R0102_028
	ScrDef scr_seq_D35R0102_029
	ScrDef scr_seq_D35R0102_030
	ScrDef scr_seq_D35R0102_031
	ScrDef scr_seq_D35R0102_032
	ScrDefEnd

scr_seq_D35R0102_032:
	End

scr_seq_D35R0102_031:
	Compare VAR_UNK_40AC, 4
	GoToIfEq _00BE
	Compare VAR_UNK_40AC, 5
	GoToIfEq _00BE
	Compare VAR_UNK_40AC, 6
	GoToIfEq _00BE
	Compare VAR_UNK_40AC, 7
	GoToIfEq _00BE
	End

_00BE:
	SetVar VAR_UNK_40AC, 8
	SetVar VAR_UNK_40A9, 2
	SetFlag FLAG_HIDE_ROCKET_HIDEOUT_B2F_MURKROW_1
	SetFlag FLAG_HIDE_ROCKET_HIDEOUT_B3F_MURKROW_2
	SetFlag FLAG_HIDE_ROCKET_HIDEOUT_B2F_MURKROW_2
	ClearFlag FLAG_HIDE_ROCKET_HIDEOUT_B2F_MURKROW_3
	End

scr_seq_D35R0102_030:
	Compare VAR_UNK_40AC, 9
	CallIfGe _025D
	Compare VAR_UNK_40AD, 2
	GoToIfNe _0108
	MovePersonFacing obj_D35R0102_aji_peru, 44, 0, 3, DIR_WEST
	GoTo _0133

_0108:
	Compare VAR_UNK_40AD, 1
	GoToIfNe _0127
	MovePersonFacing obj_D35R0102_aji_peru, 44, 0, 3, DIR_SOUTH
	GoTo _0133

_0127:
	MovePersonFacing obj_D35R0102_aji_peru, 44, 0, 3, DIR_NORTH
_0133:
	Compare VAR_UNK_40AE, 2
	GoToIfNe _0152
	MovePersonFacing obj_D35R0102_aji_peru_2, 18, 0, 3, DIR_WEST
	GoTo _017D

_0152:
	Compare VAR_UNK_40AE, 1
	GoToIfNe _0171
	MovePersonFacing obj_D35R0102_aji_peru_2, 18, 0, 3, DIR_SOUTH
	GoTo _017D

_0171:
	MovePersonFacing obj_D35R0102_aji_peru_2, 18, 0, 3, DIR_NORTH
_017D:
	Compare VAR_UNK_40AF, 2
	GoToIfNe _019C
	MovePersonFacing obj_D35R0102_aji_peru_3, 44, 0, 10, DIR_WEST
	GoTo _01C7

_019C:
	Compare VAR_UNK_40AF, 1
	GoToIfNe _01BB
	MovePersonFacing obj_D35R0102_aji_peru_3, 44, 0, 10, DIR_SOUTH
	GoTo _01C7

_01BB:
	MovePersonFacing obj_D35R0102_aji_peru_3, 44, 0, 10, DIR_NORTH
_01C7:
	Compare VAR_UNK_40B0, 2
	GoToIfNe _01E6
	MovePersonFacing obj_D35R0102_aji_peru_4, 44, 0, 28, DIR_WEST
	GoTo _0211

_01E6:
	Compare VAR_UNK_40B0, 1
	GoToIfNe _0205
	MovePersonFacing obj_D35R0102_aji_peru_4, 44, 0, 28, DIR_SOUTH
	GoTo _0211

_0205:
	MovePersonFacing obj_D35R0102_aji_peru_4, 44, 0, 28, DIR_NORTH
_0211:
	Compare VAR_UNK_40B1, 2
	GoToIfNe _0230
	MovePersonFacing obj_D35R0102_aji_peru_5, 18, 0, 28, DIR_WEST
	GoTo _025B

_0230:
	Compare VAR_UNK_40B1, 1
	GoToIfNe _024F
	MovePersonFacing obj_D35R0102_aji_peru_5, 18, 0, 28, DIR_SOUTH
	GoTo _025B

_024F:
	MovePersonFacing obj_D35R0102_aji_peru_5, 18, 0, 28, DIR_NORTH
_025B:
	End

_025D:
	SetVar VAR_UNK_40AD, 2
	SetVar VAR_UNK_40AE, 2
	SetVar VAR_UNK_40AF, 2
	SetVar VAR_UNK_40B0, 2
	SetVar VAR_UNK_40B1, 2
	Return

scr_seq_D35R0102_000:
	ScrCmd_609
	LockAll
	ApplyMovement obj_player, _0428
	WaitMovement
	ApplyMovement obj_D35R0102_aji_peru, _0454
	WaitMovement
	PlaySE SEQ_SE_GS_AJITO_SIREN
	ScrCmd_709
	StopSE SEQ_SE_GS_AJITO_SIREN
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 4
	GoToIfNe _02C4
	AddVar VAR_TEMP_x4001, 1
	GoTo _02D0

_02BE:
	GoTo _02D0

_02C4:
	SubVar VAR_TEMP_x4001, 1
	GoTo _036C

_02D0:
	MovePerson obj_D35R0102_rocketm, 33, 0
	ClearFlag FLAG_UNK_1E8
	ShowPerson obj_D35R0102_rocketm
	MovePersonFacing obj_D35R0102_rocketm, 33, 0, VAR_TEMP_x4001, DIR_WEST
	ApplyMovement obj_D35R0102_rocketm, _0460
	WaitMovement
	ApplyMovement obj_player, _0478
	WaitMovement
	NPCMsg msg_0112_D35R0102_00000
	CloseMsg
	TrainerBattle TRAINER_TEAM_ROCKET_GRUNT_20, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0C03
	ApplyMovement obj_D35R0102_rocketm, _0490
	WaitMovement
	MovePersonFacing obj_D35R0102_rocketm, 33, 0, VAR_TEMP_x4001, DIR_EAST
	ApplyMovement obj_D35R0102_rocketm, _0460
	WaitMovement
	NPCMsg msg_0112_D35R0102_00001
	CloseMsg
	TrainerBattle TRAINER_TEAM_ROCKET_GRUNT_21, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0C03
	ApplyMovement obj_D35R0102_rocketm, _0490
	WaitMovement
	GoTo _0402

_036C:
	MovePerson obj_D35R0102_rocketm, 33, 0
	ClearFlag FLAG_UNK_1E8
	ShowPerson obj_D35R0102_rocketm
	MovePersonFacing obj_D35R0102_rocketm, 33, 0, VAR_TEMP_x4001, DIR_WEST
	ApplyMovement obj_D35R0102_rocketm, _046C
	WaitMovement
	ApplyMovement obj_player, _0484
	WaitMovement
	NPCMsg msg_0112_D35R0102_00000
	CloseMsg
	TrainerBattle TRAINER_TEAM_ROCKET_GRUNT_20, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0C03
	ApplyMovement obj_D35R0102_rocketm, _0490
	WaitMovement
	MovePersonFacing obj_D35R0102_rocketm, 33, 0, VAR_TEMP_x4001, DIR_EAST
	ApplyMovement obj_D35R0102_rocketm, _046C
	WaitMovement
	NPCMsg msg_0112_D35R0102_00001
	CloseMsg
	TrainerBattle TRAINER_TEAM_ROCKET_GRUNT_21, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0C03
	ApplyMovement obj_D35R0102_rocketm, _0490
	WaitMovement
_0402:
	MovePersonFacing obj_D35R0102_rocketm, 37, 0, 0, DIR_WEST
	SetFlag FLAG_UNK_1E8
	SetVar VAR_UNK_40AD, 2
	ApplyMovement obj_D35R0102_aji_peru, _049C
	WaitMovement
	ReleaseAll
	End

	.balign 4, 0
_0428:
	EmoteExclamationMark
	Delay8 2
	FaceEast 2
	Delay8
	FaceWest 2
	Delay8
	FaceEast 2
	Delay8
	FaceNorth 2
	Delay8
	EndMovement

	.balign 4, 0
_0454:
	EmoteExclamationMark
	Delay8 2
	EndMovement

	.balign 4, 0
_0460:
	WalkFasterEast 11
	FaceNorth 2
	EndMovement

	.balign 4, 0
_046C:
	WalkFasterEast 11
	FaceSouth 2
	EndMovement

	.balign 4, 0
_0478:
	FaceSouth 2
	Delay8 2
	EndMovement

	.balign 4, 0
_0484:
	FaceNorth 2
	Delay8 2
	EndMovement

	.balign 4, 0
_0490:
	FaceWest 2
	WalkFasterWest 10
	EndMovement

	.balign 4, 0
_049C:
	FaceWest
	EndMovement

	.balign 4, 0
_04A4:
	FaceSouth
	EndMovement

	.balign 4, 0
_04AC:
	FaceNorth
	EndMovement

scr_seq_D35R0102_005:
	ScrCmd_609
	LockAll
	ApplyMovement obj_player, _0428
	WaitMovement
	ApplyMovement obj_D35R0102_aji_peru_2, _0454
	WaitMovement
	PlaySE SEQ_SE_GS_AJITO_SIREN
	ScrCmd_709
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 4
	GoToIfNe _04F7
	AddVar VAR_TEMP_x4001, 1
	GoTo _0503

_04F1:
	GoTo _0503

_04F7:
	SubVar VAR_TEMP_x4001, 1
	GoTo _05A9

_0503:
	MovePerson obj_D35R0102_rocketm, 27, 0
	ClearFlag FLAG_UNK_1E8
	ShowPerson obj_D35R0102_rocketm
	MovePersonFacing obj_D35R0102_rocketm, 27, 0, VAR_TEMP_x4001, DIR_WEST
	ApplyMovement obj_D35R0102_rocketm, _0668
	WaitMovement
	ApplyMovement obj_player, _0478
	WaitMovement
	NPCMsg msg_0112_D35R0102_00000
	CloseMsg
	TrainerBattle TRAINER_TEAM_ROCKET_GRUNT_20, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0C03
	ApplyMovement obj_D35R0102_rocketm, _06C8
	WaitMovement
	MovePersonFacing obj_D35R0102_rocketm, 27, 0, VAR_TEMP_x4001, DIR_WEST
	ApplyMovement obj_D35R0102_rocketm, _0668
	WaitMovement
	ApplyMovement obj_player, _0478
	WaitMovement
	NPCMsg msg_0112_D35R0102_00001
	CloseMsg
	TrainerBattle TRAINER_TEAM_ROCKET_GRUNT_21, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0C03
	ApplyMovement obj_D35R0102_rocketm, _06C8
	WaitMovement
	GoTo _0649

_05A9:
	MovePerson obj_D35R0102_rocketm, 27, 0
	ClearFlag FLAG_UNK_1E8
	ShowPerson obj_D35R0102_rocketm
	MovePersonFacing obj_D35R0102_rocketm, 27, 0, VAR_TEMP_x4001, DIR_WEST
	ApplyMovement obj_D35R0102_rocketm, _0674
	WaitMovement
	ApplyMovement obj_player, _0484
	WaitMovement
	NPCMsg msg_0112_D35R0102_00000
	CloseMsg
	TrainerBattle TRAINER_TEAM_ROCKET_GRUNT_20, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0C03
	ApplyMovement obj_D35R0102_rocketm, _06C8
	WaitMovement
	MovePersonFacing obj_D35R0102_rocketm, 27, 0, VAR_TEMP_x4001, DIR_WEST
	ApplyMovement obj_D35R0102_rocketm, _0674
	WaitMovement
	ApplyMovement obj_player, _0484
	WaitMovement
	NPCMsg msg_0112_D35R0102_00001
	CloseMsg
	TrainerBattle TRAINER_TEAM_ROCKET_GRUNT_21, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0C03
	ApplyMovement obj_D35R0102_rocketm, _06C8
	WaitMovement
_0649:
	HidePerson obj_D35R0102_rocketm
	SetFlag FLAG_UNK_1E8
	SetVar VAR_UNK_40AE, 2
	ApplyMovement obj_D35R0102_aji_peru_2, _049C
	WaitMovement
	ReleaseAll
	End

	.balign 4, 0
_0668:
	WalkFasterWest 9
	FaceNorth 2
	EndMovement

	.balign 4, 0
_0674:
	WalkFasterWest 9
	FaceSouth 2
	EndMovement

	.balign 4, 0
_0680:
	WalkFasterEast 11
	FaceNorth 2
	EndMovement

	.balign 4, 0
_068C:
	WalkFasterEast 11
	FaceSouth 2
	EndMovement

	.balign 4, 0
_0698:
	WalkFasterEast 11
	FaceNorth 2
	EndMovement

	.balign 4, 0
_06A4:
	WalkFasterEast 11
	FaceSouth 2
	EndMovement

	.balign 4, 0
_06B0:
	WalkFasterWest 9
	FaceNorth 2
	EndMovement

	.balign 4, 0
_06BC:
	WalkFasterWest 9
	FaceSouth 2
	EndMovement

	.balign 4, 0
_06C8:
	FaceEast 2
	WalkFasterEast 10
	EndMovement

	.balign 4, 0
_06D4:
	FaceWest 2
	WalkFasterWest 10
	EndMovement

	.balign 4, 0
_06E0:
	FaceWest 2
	WalkFasterWest 10
	EndMovement

	.balign 4, 0
_06EC:
	FaceEast 2
	WalkFasterEast 10
	EndMovement

scr_seq_D35R0102_006:
	ScrCmd_609
	LockAll
	ApplyMovement obj_player, _0428
	WaitMovement
	ApplyMovement obj_D35R0102_aji_peru_3, _0454
	WaitMovement
	PlaySE SEQ_SE_GS_AJITO_SIREN
	ScrCmd_709
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 11
	GoToIfNe _073B
	AddVar VAR_TEMP_x4001, 1
	GoTo _0747

_0735:
	GoTo _0747

_073B:
	SubVar VAR_TEMP_x4001, 1
	GoTo _07ED

_0747:
	MovePerson obj_D35R0102_rocketm, 33, 0
	ClearFlag FLAG_UNK_1E8
	ShowPerson obj_D35R0102_rocketm
	MovePersonFacing obj_D35R0102_rocketm, 33, 0, VAR_TEMP_x4001, DIR_WEST
	ApplyMovement obj_D35R0102_rocketm, _0680
	WaitMovement
	ApplyMovement obj_player, _0478
	WaitMovement
	NPCMsg msg_0112_D35R0102_00000
	CloseMsg
	TrainerBattle TRAINER_TEAM_ROCKET_GRUNT_20, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0C03
	ApplyMovement obj_D35R0102_rocketm, _06D4
	WaitMovement
	MovePersonFacing obj_D35R0102_rocketm, 33, 0, VAR_TEMP_x4001, DIR_WEST
	ApplyMovement obj_D35R0102_rocketm, _0680
	WaitMovement
	ApplyMovement obj_player, _0478
	WaitMovement
	NPCMsg msg_0112_D35R0102_00001
	CloseMsg
	TrainerBattle TRAINER_TEAM_ROCKET_GRUNT_21, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0C03
	ApplyMovement obj_D35R0102_rocketm, _06D4
	WaitMovement
	GoTo _088D

_07ED:
	MovePerson obj_D35R0102_rocketm, 33, 0
	ClearFlag FLAG_UNK_1E8
	ShowPerson obj_D35R0102_rocketm
	MovePersonFacing obj_D35R0102_rocketm, 33, 0, VAR_TEMP_x4001, DIR_WEST
	ApplyMovement obj_D35R0102_rocketm, _068C
	WaitMovement
	ApplyMovement obj_player, _0484
	WaitMovement
	NPCMsg msg_0112_D35R0102_00000
	CloseMsg
	TrainerBattle TRAINER_TEAM_ROCKET_GRUNT_20, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0C03
	ApplyMovement obj_D35R0102_rocketm, _06D4
	WaitMovement
	MovePersonFacing obj_D35R0102_rocketm, 33, 0, VAR_TEMP_x4001, DIR_WEST
	ApplyMovement obj_D35R0102_rocketm, _068C
	WaitMovement
	ApplyMovement obj_player, _0484
	WaitMovement
	NPCMsg msg_0112_D35R0102_00001
	CloseMsg
	TrainerBattle TRAINER_TEAM_ROCKET_GRUNT_21, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0C03
	ApplyMovement obj_D35R0102_rocketm, _06D4
	WaitMovement
_088D:
	HidePerson obj_D35R0102_rocketm
	SetFlag FLAG_UNK_1E8
	SetVar VAR_UNK_40AF, 2
	ApplyMovement obj_D35R0102_aji_peru_3, _049C
	WaitMovement
	ReleaseAll
	End

scr_seq_D35R0102_007:
	ScrCmd_609
	LockAll
	ApplyMovement obj_player, _0428
	WaitMovement
	ApplyMovement obj_D35R0102_aji_peru_4, _0454
	WaitMovement
	PlaySE SEQ_SE_GS_AJITO_SIREN
	ScrCmd_709
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 29
	GoToIfNe _08EC
	AddVar VAR_TEMP_x4001, 1
	GoTo _08F8

_08E6:
	GoTo _08F8

_08EC:
	SubVar VAR_TEMP_x4001, 1
	GoTo _099E

_08F8:
	MovePerson obj_D35R0102_rocketm, 33, 0
	ClearFlag FLAG_UNK_1E8
	ShowPerson obj_D35R0102_rocketm
	MovePersonFacing obj_D35R0102_rocketm, 33, 0, VAR_TEMP_x4001, DIR_WEST
	ApplyMovement obj_D35R0102_rocketm, _0698
	WaitMovement
	ApplyMovement obj_player, _0478
	WaitMovement
	NPCMsg msg_0112_D35R0102_00000
	CloseMsg
	TrainerBattle TRAINER_TEAM_ROCKET_GRUNT_20, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0C03
	ApplyMovement obj_D35R0102_rocketm, _06E0
	WaitMovement
	MovePersonFacing obj_D35R0102_rocketm, 33, 0, VAR_TEMP_x4001, DIR_WEST
	ApplyMovement obj_D35R0102_rocketm, _0698
	WaitMovement
	ApplyMovement obj_player, _0478
	WaitMovement
	NPCMsg msg_0112_D35R0102_00001
	CloseMsg
	TrainerBattle TRAINER_TEAM_ROCKET_GRUNT_21, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0C03
	ApplyMovement obj_D35R0102_rocketm, _06E0
	WaitMovement
	GoTo _0A3E

_099E:
	MovePerson obj_D35R0102_rocketm, 33, 0
	ClearFlag FLAG_UNK_1E8
	ShowPerson obj_D35R0102_rocketm
	MovePersonFacing obj_D35R0102_rocketm, 33, 0, VAR_TEMP_x4001, DIR_WEST
	ApplyMovement obj_D35R0102_rocketm, _06A4
	WaitMovement
	ApplyMovement obj_player, _0484
	WaitMovement
	NPCMsg msg_0112_D35R0102_00000
	CloseMsg
	TrainerBattle TRAINER_TEAM_ROCKET_GRUNT_20, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0C03
	ApplyMovement obj_D35R0102_rocketm, _06E0
	WaitMovement
	MovePersonFacing obj_D35R0102_rocketm, 33, 0, VAR_TEMP_x4001, DIR_WEST
	ApplyMovement obj_D35R0102_rocketm, _06A4
	WaitMovement
	ApplyMovement obj_player, _0484
	WaitMovement
	NPCMsg msg_0112_D35R0102_00001
	CloseMsg
	TrainerBattle TRAINER_TEAM_ROCKET_GRUNT_21, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0C03
	ApplyMovement obj_D35R0102_rocketm, _06E0
	WaitMovement
_0A3E:
	HidePerson obj_D35R0102_rocketm
	SetVar VAR_UNK_40B0, 2
	ApplyMovement obj_D35R0102_aji_peru_4, _049C
	WaitMovement
	ReleaseAll
	End

scr_seq_D35R0102_008:
	ScrCmd_609
	LockAll
	ApplyMovement obj_player, _0428
	WaitMovement
	ApplyMovement obj_D35R0102_aji_peru_5, _0454
	WaitMovement
	PlaySE SEQ_SE_GS_AJITO_SIREN
	ScrCmd_709
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 29
	GoToIfNe _0A99
	AddVar VAR_TEMP_x4001, 1
	GoTo _0AA5

_0A93:
	GoTo _0AA5

_0A99:
	SubVar VAR_TEMP_x4001, 1
	GoTo _0B4B

_0AA5:
	MovePerson obj_D35R0102_rocketm, 27, 0
	ClearFlag FLAG_UNK_1E8
	ShowPerson obj_D35R0102_rocketm
	MovePersonFacing obj_D35R0102_rocketm, 27, 0, VAR_TEMP_x4001, DIR_WEST
	ApplyMovement obj_D35R0102_rocketm, _06B0
	WaitMovement
	ApplyMovement obj_player, _0478
	WaitMovement
	NPCMsg msg_0112_D35R0102_00000
	CloseMsg
	TrainerBattle TRAINER_TEAM_ROCKET_GRUNT_20, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0C03
	ApplyMovement obj_D35R0102_rocketm, _06EC
	WaitMovement
	MovePersonFacing obj_D35R0102_rocketm, 27, 0, VAR_TEMP_x4001, DIR_WEST
	ApplyMovement obj_D35R0102_rocketm, _06B0
	WaitMovement
	ApplyMovement obj_player, _0478
	WaitMovement
	NPCMsg msg_0112_D35R0102_00001
	CloseMsg
	TrainerBattle TRAINER_TEAM_ROCKET_GRUNT_21, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0C03
	ApplyMovement obj_D35R0102_rocketm, _06EC
	WaitMovement
	GoTo _0BEB

_0B4B:
	MovePerson obj_D35R0102_rocketm, 27, 0
	ClearFlag FLAG_UNK_1E8
	ShowPerson obj_D35R0102_rocketm
	MovePersonFacing obj_D35R0102_rocketm, 27, 0, VAR_TEMP_x4001, DIR_WEST
	ApplyMovement obj_D35R0102_rocketm, _06BC
	WaitMovement
	ApplyMovement obj_player, _0484
	WaitMovement
	NPCMsg msg_0112_D35R0102_00000
	CloseMsg
	TrainerBattle TRAINER_TEAM_ROCKET_GRUNT_20, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0C03
	ApplyMovement obj_D35R0102_rocketm, _06EC
	WaitMovement
	MovePersonFacing obj_D35R0102_rocketm, 27, 0, VAR_TEMP_x4001, DIR_WEST
	ApplyMovement obj_D35R0102_rocketm, _06BC
	WaitMovement
	ApplyMovement obj_player, _0484
	WaitMovement
	NPCMsg msg_0112_D35R0102_00001
	CloseMsg
	TrainerBattle TRAINER_TEAM_ROCKET_GRUNT_21, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0C03
	ApplyMovement obj_D35R0102_rocketm, _06EC
	WaitMovement
_0BEB:
	HidePerson obj_D35R0102_rocketm
	SetVar VAR_UNK_40B1, 2
	ApplyMovement obj_D35R0102_aji_peru_5, _049C
	WaitMovement
	ReleaseAll
	End

_0C03:
	WhiteOut
	ReleaseAll
	End

scr_seq_D35R0102_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Compare VAR_UNK_40AD, 0
	GoToIfNe _0C2B
	NPCMsg msg_0112_D35R0102_00002
	GoTo _0C4A

_0C25:
	GoTo _0C4A

_0C2B:
	Compare VAR_UNK_40AD, 1
	GoToIfNe _0C47
	NPCMsg msg_0112_D35R0102_00003
	GoTo _0C4A

_0C41:
	GoTo _0C4A

_0C47:
	NPCMsg msg_0112_D35R0102_00004
_0C4A:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D35R0102_009:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Compare VAR_UNK_40AE, 0
	GoToIfNe _0C74
	NPCMsg msg_0112_D35R0102_00002
	GoTo _0C4A

_0C6E:
	GoTo _0C93

_0C74:
	Compare VAR_UNK_40AE, 1
	GoToIfNe _0C90
	NPCMsg msg_0112_D35R0102_00003
	GoTo _0C4A

_0C8A:
	GoTo _0C93

_0C90:
	NPCMsg msg_0112_D35R0102_00004
_0C93:
	GoTo _0C4A

scr_seq_D35R0102_010:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Compare VAR_UNK_40AF, 0
	GoToIfNe _0CBB
	NPCMsg msg_0112_D35R0102_00002
	GoTo _0C4A

_0CB5:
	GoTo _0CDA

_0CBB:
	Compare VAR_UNK_40AF, 1
	GoToIfNe _0CD7
	NPCMsg msg_0112_D35R0102_00003
	GoTo _0C4A

_0CD1:
	GoTo _0CDA

_0CD7:
	NPCMsg msg_0112_D35R0102_00004
_0CDA:
	GoTo _0C4A

scr_seq_D35R0102_011:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Compare VAR_UNK_40B0, 0
	GoToIfNe _0D02
	NPCMsg msg_0112_D35R0102_00002
	GoTo _0C4A

_0CFC:
	GoTo _0D21

_0D02:
	Compare VAR_UNK_40B0, 1
	GoToIfNe _0D1E
	NPCMsg msg_0112_D35R0102_00003
	GoTo _0C4A

_0D08:
	GoTo _0D21

_0D1E:
	NPCMsg msg_0112_D35R0102_00004
_0D21:
	GoTo _0C4A

scr_seq_D35R0102_012:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Compare VAR_UNK_40B1, 0
	GoToIfNe _0D49
	NPCMsg msg_0112_D35R0102_00002
	GoTo _0C4A

_0D43:
	GoTo _0D68

_0D49:
	Compare VAR_UNK_40B1, 1
	GoToIfNe _0D65
	NPCMsg msg_0112_D35R0102_00003
	GoTo _0C4A

_0D5F:
	GoTo _0D68

_0D65:
	NPCMsg msg_0112_D35R0102_00004
_0D68:
	GoTo _0C4A

scr_seq_D35R0102_002:
	End

scr_seq_D35R0102_003:
	End

scr_seq_D35R0102_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_40AC, 9
	GoToIfGe _0F24
	GoToIfSet FLAG_UNK_0D6, _0E58
	NPCMsg msg_0112_D35R0102_00005
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0DB7
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0F1E
_0DB7:
	PlaySE SEQ_SE_DP_DENSI01
	NPCMsg msg_0112_D35R0102_00007
	CloseMsg
	SetFlag FLAG_UNK_0D6
	Compare VAR_UNK_40AD, 2
	GoToIfGe _0DDF
	SetVar VAR_UNK_40AD, 1
	ApplyMovement obj_D35R0102_aji_peru, _04A4
_0DDF:
	Compare VAR_UNK_40AE, 2
	GoToIfGe _0DFA
	SetVar VAR_UNK_40AE, 1
	ApplyMovement obj_D35R0102_aji_peru_2, _04A4
_0DFA:
	Compare VAR_UNK_40AF, 2
	GoToIfGe _0E15
	SetVar VAR_UNK_40AF, 1
	ApplyMovement obj_D35R0102_aji_peru_3, _04A4
_0E15:
	Compare VAR_UNK_40B0, 2
	GoToIfGe _0E30
	SetVar VAR_UNK_40B0, 1
	ApplyMovement obj_D35R0102_aji_peru_4, _04A4
_0E30:
	Compare VAR_UNK_40B1, 2
	GoToIfGe _0E4D
	SetVar VAR_UNK_40B1, 1
	ApplyMovement obj_D35R0102_aji_peru_5, _04A4
	WaitMovement
_0E4D:
	NPCMsg msg_0112_D35R0102_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0E58:
	NPCMsg msg_0112_D35R0102_00006
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0E7D
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0F1E
_0E7D:
	PlaySE SEQ_SE_DP_DENSI01
	NPCMsg msg_0112_D35R0102_00007
	CloseMsg
	ClearFlag FLAG_UNK_0D6
	Compare VAR_UNK_40AD, 2
	GoToIfGe _0EA5
	SetVar VAR_UNK_40AD, 0
	ApplyMovement obj_D35R0102_aji_peru, _04AC
_0EA5:
	Compare VAR_UNK_40AE, 2
	GoToIfGe _0EC0
	SetVar VAR_UNK_40AE, 0
	ApplyMovement obj_D35R0102_aji_peru_2, _04AC
_0EC0:
	Compare VAR_UNK_40AF, 2
	GoToIfGe _0EDB
	SetVar VAR_UNK_40AF, 0
	ApplyMovement obj_D35R0102_aji_peru_3, _04AC
_0EDB:
	Compare VAR_UNK_40B0, 2
	GoToIfGe _0EF6
	SetVar VAR_UNK_40B0, 0
	ApplyMovement obj_D35R0102_aji_peru_4, _04AC
_0EF6:
	Compare VAR_UNK_40B1, 2
	GoToIfGe _0F13
	SetVar VAR_UNK_40B1, 0
	ApplyMovement obj_D35R0102_aji_peru_5, _04AC
	WaitMovement
_0F13:
	NPCMsg msg_0112_D35R0102_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0F1E:
	CloseMsg
	ReleaseAll
	End

_0F24:
	NPCMsg msg_0112_D35R0102_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D35R0102_013:
	ScrCmd_609
	LockAll
	ScrCmd_708 1
	PlaySE SEQ_SE_GS_DOKU_TRAP
	RocketTrapBattle SPECIES_KOFFING, 21
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _11FF
	SetVar VAR_ROCKET_TRAP_KOFFING_1, 1
	ReleaseAll
	End

scr_seq_D35R0102_014:
	ScrCmd_609
	LockAll
	ScrCmd_708 0
	PlaySE SEQ_SE_GS_DENKI_TRAP
	RocketTrapBattle SPECIES_VOLTORB, 23
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _11FF
	SetVar VAR_ROCKET_TRAP_VOLTORB_1, 1
	ReleaseAll
	End

scr_seq_D35R0102_015:
	ScrCmd_609
	LockAll
	ScrCmd_708 2
	PlaySE SEQ_SE_GS_IWA_TRAP
	RocketTrapBattle SPECIES_GEODUDE, 21
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _11FF
	SetVar VAR_ROCKET_TRAP_GEODUDE_1, 1
	ReleaseAll
	End

scr_seq_D35R0102_016:
	ScrCmd_609
	LockAll
	ScrCmd_708 0
	PlaySE SEQ_SE_GS_DENKI_TRAP
	RocketTrapBattle SPECIES_VOLTORB, 23
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _11FF
	SetVar VAR_ROCKET_TRAP_VOLTORB_2, 1
	ReleaseAll
	End

scr_seq_D35R0102_017:
	ScrCmd_609
	LockAll
	ScrCmd_708 2
	PlaySE SEQ_SE_GS_IWA_TRAP
	RocketTrapBattle SPECIES_GEODUDE, 21
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _11FF
	SetVar VAR_ROCKET_TRAP_GEODUDE_2, 1
	ReleaseAll
	End

scr_seq_D35R0102_018:
	ScrCmd_609
	LockAll
	ScrCmd_708 0
	PlaySE SEQ_SE_GS_DENKI_TRAP
	RocketTrapBattle SPECIES_VOLTORB, 23
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _11FF
	SetVar VAR_ROCKET_TRAP_VOLTORB_3, 1
	ReleaseAll
	End

scr_seq_D35R0102_019:
	ScrCmd_609
	LockAll
	ScrCmd_708 0
	PlaySE SEQ_SE_GS_DENKI_TRAP
	RocketTrapBattle SPECIES_VOLTORB, 23
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _11FF
	SetVar VAR_ROCKET_TRAP_VOLTORB_4, 1
	ReleaseAll
	End

scr_seq_D35R0102_020:
	ScrCmd_609
	LockAll
	ScrCmd_708 1
	PlaySE SEQ_SE_GS_DOKU_TRAP
	RocketTrapBattle SPECIES_KOFFING, 21
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _11FF
	SetVar VAR_ROCKET_TRAP_KOFFING_2, 1
	ReleaseAll
	End

scr_seq_D35R0102_021:
	ScrCmd_609
	LockAll
	ScrCmd_708 1
	PlaySE SEQ_SE_GS_DOKU_TRAP
	RocketTrapBattle SPECIES_KOFFING, 21
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _11FF
	SetVar VAR_ROCKET_TRAP_KOFFING_3, 1
	ReleaseAll
	End

scr_seq_D35R0102_022:
	ScrCmd_609
	LockAll
	ScrCmd_708 2
	PlaySE SEQ_SE_GS_IWA_TRAP
	RocketTrapBattle SPECIES_GEODUDE, 21
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _11FF
	SetVar VAR_ROCKET_TRAP_GEODUDE_3, 1
	ReleaseAll
	End

scr_seq_D35R0102_023:
	ScrCmd_609
	LockAll
	ScrCmd_708 2
	PlaySE SEQ_SE_GS_IWA_TRAP
	RocketTrapBattle SPECIES_GEODUDE, 21
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _11FF
	SetVar VAR_ROCKET_TRAP_GEODUDE_4, 1
	ReleaseAll
	End

scr_seq_D35R0102_024:
	ScrCmd_609
	LockAll
	ScrCmd_708 1
	PlaySE SEQ_SE_GS_DOKU_TRAP
	RocketTrapBattle SPECIES_KOFFING, 21
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _11FF
	SetVar VAR_ROCKET_TRAP_KOFFING_4, 1
	ReleaseAll
	End

scr_seq_D35R0102_025:
	ScrCmd_609
	LockAll
	ScrCmd_708 0
	PlaySE SEQ_SE_GS_DENKI_TRAP
	RocketTrapBattle SPECIES_VOLTORB, 23
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _11FF
	SetVar VAR_ROCKET_TRAP_VOLTORB_5, 1
	ReleaseAll
	End

scr_seq_D35R0102_026:
	ScrCmd_609
	LockAll
	ScrCmd_708 0
	PlaySE SEQ_SE_GS_DENKI_TRAP
	RocketTrapBattle SPECIES_VOLTORB, 23
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _11FF
	SetVar VAR_ROCKET_TRAP_VOLTORB_6, 1
	ReleaseAll
	End

scr_seq_D35R0102_027:
	ScrCmd_609
	LockAll
	ScrCmd_708 1
	PlaySE SEQ_SE_GS_DOKU_TRAP
	RocketTrapBattle SPECIES_KOFFING, 21
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _11FF
	SetVar VAR_ROCKET_TRAP_KOFFING_5, 1
	ReleaseAll
	End

scr_seq_D35R0102_028:
	ScrCmd_609
	LockAll
	ScrCmd_708 2
	PlaySE SEQ_SE_GS_IWA_TRAP
	RocketTrapBattle SPECIES_GEODUDE, 21
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _11FF
	SetVar VAR_ROCKET_TRAP_GEODUDE_5, 1
	ReleaseAll
	End

_11FF:
	WhiteOut
	ReleaseAll
	End

scr_seq_D35R0102_029:
	ScrCmd_609
	LockAll
	PlaySE SEQ_SE_PL_BOWABOWA
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Wait 15, VAR_SPECIAL_RESULT
	Warp MAP_TEAM_ROCKET_HEADQUARTERS_B1F, 0, 50, 4, DIR_WEST
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End
	.balign 4, 0
