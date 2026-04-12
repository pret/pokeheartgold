#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D15R0103.h"
#include "msgdata/msg/msg_0056_D15R0103.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D15R0103_000
	ScrDef scr_seq_D15R0103_001
	ScrDef scr_seq_D15R0103_002
	ScrDefEnd

scr_seq_D15R0103_000:
	ClearFlag FLAG_UNK_1A3
	GoToIfSet FLAG_UNK_078, _001F
	End

_001F:
	SetFlag FLAG_UNK_1A3
	End

scr_seq_D15R0103_001:
	ScrCmd_609
	LockAll
	SetVar VAR_UNK_40A4, 1
	ApplyMovement obj_player, _00B4
	WaitMovement
	GetPlayerCoords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	ScrCmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	ApplyMovement 241, _00C0
	WaitMovement
	ApplyMovement obj_D15R0103_chourou, _00D0
	WaitMovement
	NPCMsg msg_0056_D15R0103_00000
	CloseMsg
	Wait 15, VAR_SPECIAL_RESULT
	CallStd std_play_rival_outro_music
	BufferRivalsName 0
	ApplyMovement obj_D15R0103_gsrivel, _00D8
	WaitMovement
	NPCMsg msg_0056_D15R0103_00001
	CloseMsg
	Wait 15, VAR_SPECIAL_RESULT
	BufferRivalsName 0
	NPCMsg msg_0056_D15R0103_00002
	WaitABPress
	CloseMsg
	PlaySE SEQ_SE_DP_KAIDAN2
	ApplyMovement obj_D15R0103_gsrivel, _00E0
	WaitMovement
	HidePerson obj_D15R0103_gsrivel
	SetFlag FLAG_UNK_078
	CallStd std_fade_end_rival_outro_music
	ApplyMovement 241, _00C8
	WaitMovement
	ScrCmd_103
	ReleaseAll
	End

	.balign 4, 0
_00B4:
	EmoteExclamationMark
	Delay8
	EndMovement

	.balign 4, 0
_00C0:
	WalkNormalNorth 5
	EndMovement

	.balign 4, 0
_00C8:
	WalkNormalSouth 5
	EndMovement

	.balign 4, 0
_00D0:
	WalkOnSpotNormalSouth 2
	EndMovement

	.balign 4, 0
_00D8:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_00E0:
	FaceWest 4
	FaceNorth 4
	FaceEast 4
	FaceSouth 4
	FaceWest 2
	FaceNorth 2
	FaceEast 2
	FaceSouth 2
	FaceWest 2
	FaceNorth 2
	FaceEast 2
	FaceSouth 2
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	EndMovement

scr_seq_D15R0103_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_076, _0197
	NPCMsg msg_0056_D15R0103_00003
	CloseMsg
	TrainerBattle TRAINER_ELDER_LI, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01A2
	NPCMsg msg_0056_D15R0103_00004
	GiveItemNoCheck ITEM_TM70, 1
	SetFlag FLAG_UNK_076
	SetFlag FLAG_HIDE_VIOLET_GYM_GYM_GUY_AFTER_SPROUT
	ClearFlag FLAG_HIDE_VIOLET_GYM_GYM_GUY_BEFORE_SPROUT
	NPCMsg msg_0056_D15R0103_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0197:
	NPCMsg msg_0056_D15R0103_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01A2:
	WhiteOut
	ReleaseAll
	End
	.balign 4, 0
