#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D31R0207.h"
#include "msgdata/msg/msg_0099_D31R0207.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D31R0207_000
	ScrDef scr_seq_D31R0207_001
	ScrDef scr_seq_D31R0207_002
	ScrDef scr_seq_D31R0207_003
	ScrDef scr_seq_D31R0207_004
	ScrDef scr_seq_D31R0207_005
	ScrDef scr_seq_D31R0207_006
	ScrDef scr_seq_D31R0207_007
	ScrDef scr_seq_D31R0207_008
	ScrDef scr_seq_D31R0207_009
	ScrDefEnd

scr_seq_D31R0207_006:
	Compare VAR_UNK_4151, 2
	GoToIfNe _004C
	ScrCmd_412 55, 2, VAR_TEMP_x4009
	Compare VAR_TEMP_x4009, 0
	GoToIfEq _00EA
_004C:
	ClearFlag FLAG_UNK_2AD
_0050:
	Compare VAR_UNK_4151, 2
	GoToIfNe _0072
	ScrCmd_412 55, 2, VAR_TEMP_x4009
	Compare VAR_TEMP_x4009, 1
	GoToIfEq _00F6
_0072:
	ClearFlag FLAG_UNK_2AE
_0076:
	Compare VAR_UNK_4151, 2
	GoToIfNe _0098
	ScrCmd_412 55, 2, VAR_TEMP_x4009
	Compare VAR_TEMP_x4009, 2
	GoToIfEq _0102
_0098:
	ClearFlag FLAG_UNK_2AF
_009C:
	Compare VAR_UNK_4151, 2
	GoToIfNe _00BE
	ScrCmd_412 55, 2, VAR_TEMP_x4009
	Compare VAR_TEMP_x4009, 3
	GoToIfEq _010E
_00BE:
	ClearFlag FLAG_UNK_2B0
_00C2:
	Compare VAR_UNK_4151, 2
	GoToIfNe _00E4
	ScrCmd_412 55, 2, VAR_TEMP_x4009
	Compare VAR_TEMP_x4009, 4
	GoToIfEq _011A
_00E4:
	ClearFlag FLAG_UNK_2B1
_00E8:
	End

_00EA:
	SetFlag FLAG_UNK_2AD
	GoTo _0050
	End

_00F6:
	SetFlag FLAG_UNK_2AE
	GoTo _0076
	End

_0102:
	SetFlag FLAG_UNK_2AF
	GoTo _009C
	End

_010E:
	SetFlag FLAG_UNK_2B0
	GoTo _00C2
	End

_011A:
	SetFlag FLAG_UNK_2B1
	GoTo _00E8
	End

scr_seq_D31R0207_007:
	Compare VAR_UNK_4151, 1
	CallIfEq _0142
	Compare VAR_UNK_4151, 2
	GoToIfEq _0148
	End

_0142:
	MakeObjectVisible obj_player
	Return

_0148:
	MovePersonFacing obj_D31R0207_bfsw1, 8, 0, 3, DIR_SOUTH
	End

scr_seq_D31R0207_008:
	ScrCmd_609
	LockAll
	SetVar VAR_UNK_4151, 0
	Call _048B
	NPCMsg msg_0099_D31R0207_00000
	CloseMsg
	ScrCmd_412 56, 0, 0
	ReleaseAll
	End

scr_seq_D31R0207_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	BufferPlayersName 0
	NPCMsg msg_0099_D31R0207_00001
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01A3
	NPCMsg msg_0099_D31R0207_00000
	CloseMsg
	ReleaseAll
	End

_01A3:
	CloseMsg
	ReleaseAll
	SetVar VAR_UNK_414B, 3
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_BATTLE_TOWER, 0, 11, 6, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	End

scr_seq_D31R0207_009:
	ScrCmd_609
	LockAll
	SetVar VAR_UNK_4151, 0
	NPCMsg msg_0099_D31R0207_00002
	CloseMsg
	Call _04C5
	SetVar VAR_UNK_414D, 2
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_BATTLE_TOWER_ELEVATOR, 0, 3, 6, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_0216:
	ScrCmd_413 VAR_TEMP_x4009, 0, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	BufferSpeciesName 0, VAR_SPECIAL_x8004, 0, 0
	BufferMoveName 1, VAR_SPECIAL_x8005
	ScrCmd_413 VAR_TEMP_x4009, 1, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	BufferSpeciesName 2, VAR_SPECIAL_x8004, 0, 0
	BufferMoveName 3, VAR_SPECIAL_x8005
	Return

scr_seq_D31R0207_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_4151, 2
	GoToIfEq _02A7
	SetVar VAR_TEMP_x4009, 0
	ScrCmd_413 VAR_TEMP_x4009, 0, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	BufferSpeciesNameIndef 0, VAR_SPECIAL_x8004, 0, 0
	BufferMoveName 1, VAR_SPECIAL_x8005
	ScrCmd_413 VAR_TEMP_x4009, 1, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	BufferSpeciesNameIndef 2, VAR_SPECIAL_x8004, 0, 0
	BufferMoveName 3, VAR_SPECIAL_x8005
	NPCMsg msg_0099_D31R0207_00006
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _02B2
_02A7:
	NPCMsg msg_0099_D31R0207_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02B2:
	ScrCmd_412 50, VAR_TEMP_x4009, 0
	SetVar VAR_UNK_4151, 2
	NPCMsg msg_0099_D31R0207_00008
	CloseMsg
	ReleaseAll
	Lock obj_D31R0207_seven1
	GoTo _0541
	End

scr_seq_D31R0207_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_4151, 2
	GoToIfEq _030F
	SetVar VAR_TEMP_x4009, 1
	Call _0216
	BufferPlayersName 4
	NPCMsg msg_0099_D31R0207_00015
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _031A
_030F:
	NPCMsg msg_0099_D31R0207_00016
	WaitButton
	CloseMsg
	ReleaseAll
	End

_031A:
	ScrCmd_412 50, VAR_TEMP_x4009, 0
	SetVar VAR_UNK_4151, 2
	BufferPlayersName 0
	NPCMsg msg_0099_D31R0207_00017
	CloseMsg
	ReleaseAll
	Lock obj_D31R0207_seven5
	GoTo _0586
	End

scr_seq_D31R0207_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_4151, 2
	GoToIfEq _0377
	SetVar VAR_TEMP_x4009, 2
	Call _0216
	NPCMsg msg_0099_D31R0207_00003
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0382
_0377:
	NPCMsg msg_0099_D31R0207_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0382:
	ScrCmd_412 50, VAR_TEMP_x4009, 0
	SetVar VAR_UNK_4151, 2
	NPCMsg msg_0099_D31R0207_00005
	CloseMsg
	ReleaseAll
	Lock obj_D31R0207_seven2
	GoTo _05CB
	End

scr_seq_D31R0207_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_4151, 2
	GoToIfEq _03DC
	SetVar VAR_TEMP_x4009, 3
	Call _0216
	NPCMsg msg_0099_D31R0207_00012
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _03E7
_03DC:
	NPCMsg msg_0099_D31R0207_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

_03E7:
	ScrCmd_412 50, VAR_TEMP_x4009, 0
	SetVar VAR_UNK_4151, 2
	NPCMsg msg_0099_D31R0207_00014
	CloseMsg
	ReleaseAll
	Lock obj_D31R0207_seven3
	GoTo _0610
	End

scr_seq_D31R0207_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_4151, 2
	GoToIfEq _0441
	SetVar VAR_TEMP_x4009, 4
	Call _0216
	NPCMsg msg_0099_D31R0207_00009
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _044C
_0441:
	NPCMsg msg_0099_D31R0207_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_044C:
	ScrCmd_412 50, VAR_TEMP_x4009, 0
	SetVar VAR_UNK_4151, 2
	NPCMsg msg_0099_D31R0207_00011
	CloseMsg
	ReleaseAll
	Lock obj_D31R0207_seven4
	GoTo _0655
	End

_046D:
	ScrCmd_307 0, 0, 8, 2, 77
	ScrCmd_310 77
	ScrCmd_308 77
	Return

_0480:
	ScrCmd_311 77
	ScrCmd_308 77
	ScrCmd_309 77
	Return

_048B:
	Call _046D
	ApplyMovement obj_D31R0207_bfsw1, _06AC
	WaitMovement
	ScrCmd_374 obj_player
	ApplyMovement obj_player, _069C
	WaitMovement
	Call _0480
	ApplyMovement obj_D31R0207_bfsw1, _06BC
	WaitMovement
	ApplyMovement obj_player, _06A4
	WaitMovement
	Return

_04C5:
	Call _046D
	ApplyMovement obj_D31R0207_bfsw1, _06F0
	ApplyMovement obj_player, _06E4
	WaitMovement
	Call _0480
	Return

_04E5:
	ApplyMovement VAR_TEMP_x4000, _06FC
	WaitMovement
	ApplyMovement obj_D31R0207_bfsw1, _06C8
	WaitMovement
	Call _046D
	ApplyMovement VAR_TEMP_x4000, _0704
	WaitMovement
	Call _0480
	ApplyMovement obj_D31R0207_bfsw1, _06D8
	WaitMovement
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_BATTLE_TOWER_PARTNER_ROOM, 0, 8, 4, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_0541:
	SetVar VAR_TEMP_x4000, 1
	GetPlayerCoords VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	Compare VAR_SPECIAL_x8000, 12
	GoToIfEq _0562
	GoTo _0574
	End

_0562:
	ApplyMovement obj_D31R0207_seven1, _0710
	WaitMovement
	GoTo _04E5
	End

_0574:
	ApplyMovement obj_D31R0207_seven1, _0724
	WaitMovement
	GoTo _04E5
	End

_0586:
	SetVar VAR_TEMP_x4000, 2
	GetPlayerCoords VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	Compare VAR_SPECIAL_x8000, 4
	GoToIfEq _05A7
	GoTo _05B9
	End

_05A7:
	ApplyMovement obj_D31R0207_seven5, _073C
	WaitMovement
	GoTo _04E5
	End

_05B9:
	ApplyMovement obj_D31R0207_seven5, _074C
	WaitMovement
	GoTo _04E5
	End

_05CB:
	SetVar VAR_TEMP_x4000, 3
	GetPlayerCoords VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	Compare VAR_SPECIAL_x8001, 7
	GoToIfEq _05EC
	GoTo _05FE
	End

_05EC:
	ApplyMovement obj_D31R0207_seven2, _0758
	WaitMovement
	GoTo _04E5
	End

_05FE:
	ApplyMovement obj_D31R0207_seven2, _0768
	WaitMovement
	GoTo _04E5
	End

_0610:
	SetVar VAR_TEMP_x4000, 4
	GetPlayerCoords VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	Compare VAR_SPECIAL_x8001, 9
	GoToIfEq _0631
	GoTo _0643
	End

_0631:
	ApplyMovement obj_D31R0207_seven3, _0774
	WaitMovement
	GoTo _04E5
	End

_0643:
	ApplyMovement obj_D31R0207_seven3, _0788
	WaitMovement
	GoTo _04E5
	End

_0655:
	SetVar VAR_TEMP_x4000, 5
	GetPlayerCoords VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	Compare VAR_SPECIAL_x8000, 8
	GoToIfEq _0676
	GoTo _0688
	End

_0676:
	ApplyMovement obj_D31R0207_seven4, _079C
	WaitMovement
	GoTo _04E5
	End

_0688:
	ApplyMovement obj_D31R0207_seven4, _07AC
	WaitMovement
	GoTo _04E5
	End

	.balign 4, 0
_069C:
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_06A4:
	FaceNorth
	EndMovement

	.balign 4, 0
_06AC:
	WalkNormalSouth 2
	WalkNormalWest
	FaceEast
	EndMovement

	.balign 4, 0
_06BC:
	WalkNormalEast
	FaceSouth
	EndMovement

	.balign 4, 0
_06C8:
	FaceSouth
	WalkFastWest
	FaceEast
	EndMovement

	.balign 4, 0
_06D8:
	WalkFastEast
	FaceSouth
	EndMovement

	.balign 4, 0
_06E4:
	WalkNormalNorth 2
	SetInvisible
	EndMovement

	.balign 4, 0
_06F0:
	WalkNormalNorth
	SetInvisible
	EndMovement

	.balign 4, 0
_06FC:
	FaceNorth
	EndMovement

	.balign 4, 0
_0704:
	WalkFastNorth 2
	SetInvisible
	EndMovement

	.balign 4, 0
_0710:
	WalkFastSouth
	WalkFastWest 3
	WalkFastNorth 7
	WalkFastWest 2
	EndMovement

	.balign 4, 0
_0724:
	WalkFastWest
	WalkFastNorth
	WalkFastWest 2
	WalkFastNorth 5
	WalkFastWest 2
	EndMovement

	.balign 4, 0
_073C:
	WalkFastEast
	WalkFastNorth 2
	WalkFastEast 3
	EndMovement

	.balign 4, 0
_074C:
	WalkFastNorth 2
	WalkFastEast 4
	EndMovement

	.balign 4, 0
_0758:
	WalkFastWest
	WalkFastNorth 4
	WalkFastWest 2
	EndMovement

	.balign 4, 0
_0768:
	WalkFastNorth 4
	WalkFastWest 3
	EndMovement

	.balign 4, 0
_0774:
	WalkFastSouth
	WalkFastEast 4
	WalkFastNorth 7
	WalkFastEast 2
	EndMovement

	.balign 4, 0
_0788:
	WalkFastNorth
	WalkFastEast 4
	WalkFastNorth 5
	WalkFastEast 2
	EndMovement

	.balign 4, 0
_079C:
	WalkFastWest
	WalkFastNorth 5
	WalkFastEast 2
	EndMovement

	.balign 4, 0
_07AC:
	WalkFastEast 3
	WalkFastNorth 5
	WalkFastWest 2
	EndMovement
	.balign 4, 0
