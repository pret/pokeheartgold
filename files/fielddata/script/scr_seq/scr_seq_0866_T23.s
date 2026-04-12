#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D36R0101.h"
#include "fielddata/script/scr_seq/event_T23.h"
#include "msgdata/msg/msg_0564_T23.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T23_000
	ScrDef scr_seq_T23_001
	ScrDef scr_seq_T23_002
	ScrDef scr_seq_T23_003
	ScrDef scr_seq_T23_004
	ScrDef scr_seq_T23_005
	ScrDef scr_seq_T23_006
	ScrDef scr_seq_T23_007
	ScrDef scr_seq_T23_008
	ScrDef scr_seq_T23_009
	ScrDef scr_seq_T23_010
	ScrDef scr_seq_T23_011
	ScrDef scr_seq_T23_012
	ScrDef scr_seq_T23_013
	ScrDef scr_seq_T23_014
	ScrDef scr_seq_T23_015
	ScrDef scr_seq_T23_016
	ScrDefEnd

scr_seq_T23_004:
	Compare VAR_UNK_4080, 0
	GoToIfNe _005F
	SetFlag FLAG_UNK_19F
	ClearFlag FLAG_AZALEA_ROCKET_HARASSING_CIVILIAN
	ClearFlag FLAG_AZALEA_HARASSED_CIVILIAN
_005F:
	End

scr_seq_T23_000:
scr_seq_T23_005:
	SimpleNPCMsg msg_0564_T23_00003
	End

scr_seq_T23_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0564_T23_00009
	PlayCry SPECIES_SLOWPOKE, 0
	NPCMsg msg_0564_T23_00010
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T23_002:
	ScrCmd_609
	LockAll
	FadeOutBGM 0, 3
	ApplyMovement obj_player, _02A4
	WaitMovement
	SetVar VAR_FARFETCHD1_STICKS1, STICKS_ACTIVE
	CallStd std_play_rival_intro_music
	GetPlayerCoords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	Compare VAR_SPECIAL_x8005, 462
	GoToIfNe _00E5
	MovePersonFacing obj_T23_gsrivel, 404, 0, 463, DIR_WEST
	ApplyMovement obj_T23_gsrivel, _028C
	ApplyMovement obj_player, _02AC
	GoTo _018E

_00E5:
	Compare VAR_SPECIAL_x8005, 463
	GoToIfNe _0114
	MovePersonFacing obj_T23_gsrivel, 404, 0, 464, DIR_WEST
	ApplyMovement obj_T23_gsrivel, _028C
	ApplyMovement obj_player, _02AC
	GoTo _018E

_0114:
	Compare VAR_SPECIAL_x8005, 464
	GoToIfNe _0143
	MovePersonFacing obj_T23_gsrivel, 404, 0, 463, DIR_WEST
	ApplyMovement obj_T23_gsrivel, _0298
	ApplyMovement obj_player, _02C0
	GoTo _018E

_0143:
	Compare VAR_SPECIAL_x8005, 465
	GoToIfNe _0172
	MovePersonFacing obj_T23_gsrivel, 404, 0, 464, DIR_WEST
	ApplyMovement obj_T23_gsrivel, _0298
	ApplyMovement obj_player, _02C0
	GoTo _018E

_0172:
	MovePersonFacing obj_T23_gsrivel, 404, 0, 465, DIR_WEST
	ApplyMovement obj_T23_gsrivel, _0298
	ApplyMovement obj_player, _02C0
_018E:
	WaitMovement
	BufferRivalsName 0
	NPCMsg msg_0564_T23_00001
	CloseMsg
	GetStarterChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 152
	GoToIfNe _01B7
	TrainerBattle TRAINER_RIVAL_SILVER_7, 0, 0, 0
	GoTo _01DA

_01B7:
	Compare VAR_SPECIAL_RESULT, 155
	GoToIfNe _01D2
	TrainerBattle TRAINER_RIVAL_SILVER_10, 0, 0, 0
	GoTo _01DA

_01D2:
	TrainerBattle TRAINER_RIVAL_SILVER, 0, 0, 0
_01DA:
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0285
	CallStd std_play_rival_outro_music
	BufferRivalsName 0
	NPCMsg msg_0564_T23_00002
	CloseMsg
	SetVar VAR_UNK_4075, 2
	GetPlayerCoords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	Compare VAR_SPECIAL_x8005, 462
	GoToIfNe _021E
	ApplyMovement obj_T23_gsrivel, _02D4
	GoTo _0277

_021E:
	Compare VAR_SPECIAL_x8005, 463
	GoToIfNe _0239
	ApplyMovement obj_T23_gsrivel, _02DC
	GoTo _0277

_0239:
	Compare VAR_SPECIAL_x8005, 464
	GoToIfNe _0254
	ApplyMovement obj_T23_gsrivel, _02D4
	GoTo _0277

_0254:
	Compare VAR_SPECIAL_x8005, 465
	GoToIfNe _026F
	ApplyMovement obj_T23_gsrivel, _02DC
	GoTo _0277

_026F:
	ApplyMovement obj_T23_gsrivel, _02EC
_0277:
	WaitMovement
	HidePerson obj_T23_gsrivel
	CallStd std_fade_end_rival_outro_music
	ReleaseAll
	End

_0285:
	WhiteOut
	ReleaseAll
	End

	.balign 4, 0
_028C:
	WalkNormalWest 9
	FaceNorth
	EndMovement

	.balign 4, 0
_0298:
	WalkNormalWest 9
	FaceSouth
	EndMovement

	.balign 4, 0
_02A4:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_02AC:
	FaceEast
	Delay4 6
	Delay8 7
	FaceSouth
	EndMovement

	.balign 4, 0
_02C0:
	FaceEast
	Delay4 6
	Delay8 7
	FaceNorth
	EndMovement

	.balign 4, 0
_02D4:
	WalkNormalWest 3
	EndMovement

	.balign 4, 0
_02DC:
	WalkNormalWest
	WalkNormalNorth
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_02EC:
	WalkNormalWest
	WalkNormalNorth 2
	WalkNormalWest 2
	EndMovement

scr_seq_T23_003:
	ScrCmd_609
	LockAll
	ApplyMovement obj_T23_rocketm_3, _0350
	WaitMovement
	NPCMsg msg_0564_T23_00016
	PlaySE SEQ_SE_DP_WALL_HIT
	NPCMsg msg_0564_T23_00017
	CloseMsg
	ApplyMovement obj_T23_gsmiddleman1_2, _0358
	WaitMovement
	MovePersonFacing obj_T23_gsmiddleman1_2, 23, 0, 16, DIR_EAST
	ApplyMovement obj_T23_rocketm_3, _0374
	WaitMovement
	HidePerson obj_T23_gsmiddleman1_2
	SetFlag FLAG_AZALEA_HARASSED_CIVILIAN
	SetFlag FLAG_AZALEA_ROCKET_HARASSING_CIVILIAN
	ClearFlag FLAG_UNK_19F
	SetVar VAR_UNK_4080, 1
	ReleaseAll
	End

	.balign 4, 0
_0350:
	WalkOnSpotNormalWest 2
	EndMovement

	.balign 4, 0
_0358:
	LockDir
	WalkFasterWest
	Delay8 2
	WalkSlowWest 2
	UnlockDir
	WalkFastWest 9
	EndMovement

	.balign 4, 0
_0374:
	WalkNormalNorth 2
	WalkOnSpotNormalSouth
	EndMovement

scr_seq_T23_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_BEAT_AZALEA_ROCKETS, _039C
	NPCMsg msg_0564_T23_00018
	GoTo _039F

_039C:
	NPCMsg msg_0564_T23_00019
_039F:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T23_007:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_BEAT_AZALEA_ROCKETS, _03C3
	NPCMsg msg_0564_T23_00005
	GoTo _039F

_03C3:
	NPCMsg msg_0564_T23_00006
	GoTo _039F

scr_seq_T23_008:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0564_T23_00012, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T23_009:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0564_T23_00013, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T23_010:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0564_T23_00015, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T23_011:
	DirectionSignpost msg_0564_T23_00011, 0, 14, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T23_012:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0564_T23_00014, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T23_013:
	DirectionSignpost msg_0564_T23_00000, 1, 2, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T23_014:
	SimpleNPCMsg msg_0564_T23_00004
	End

scr_seq_T23_015:
	SimpleNPCMsg msg_0564_T23_00007
	End

scr_seq_T23_016:
	SimpleNPCMsg msg_0564_T23_00008
	End
	.balign 4, 0
