#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T22PC0101.h"
#include "msgdata/msg/msg_0559_T22PC0101.h"
#include "msgdata/msg/msg_0191.h"
#include "constants/map_sections.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T22PC0101_000
	ScrDef scr_seq_T22PC0101_001
	ScrDef scr_seq_T22PC0101_002
	ScrDef scr_seq_T22PC0101_003
	ScrDef scr_seq_T22PC0101_004
	ScrDef scr_seq_T22PC0101_005
	ScrDefEnd

scr_seq_T22PC0101_000:
	SetVar VAR_SPECIAL_x8007, 3
	CallStd std_nurse_joy
	End

scr_seq_T22PC0101_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0559_T22PC0101_00012
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _021D
	ScrCmd_815 0
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CloseMsg
	PromptEasyChat VAR_SPECIAL_RESULT, VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _021F
	NPCMsg msg_0559_T22PC0101_00013
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CloseMsg
	ScrCmd_815 0
	PromptEasyChat VAR_SPECIAL_RESULT, VAR_SPECIAL_x8002, VAR_SPECIAL_x8003
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _021F
	PrimoPasswordCheck1 VAR_SPECIAL_RESULT, VAR_SPECIAL_x8000, VAR_SPECIAL_x8001, VAR_SPECIAL_x8002, VAR_SPECIAL_x8003
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _00DD
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0212
	GoTo _022A

_00DD:
	PrimoPasswordCheck2 VAR_SPECIAL_RESULT, VAR_SPECIAL_x8000, VAR_SPECIAL_x8001, VAR_SPECIAL_x8002, VAR_SPECIAL_x8003
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _0212
	Compare VAR_SPECIAL_RESULT, 8
	GoToIfEq _011D
	Compare VAR_SPECIAL_RESULT, 9
	GoToIfEq _0157
	Compare VAR_SPECIAL_RESULT, 10
	GoToIfEq _0191
_011D:
	GoToIfSet FLAG_GOT_MAREEP_EGG_FROM_PRIMO, _0212
	GetPartyCount VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 6
	GoToIfEq _0207
	SetFlag FLAG_GOT_MAREEP_EGG_FROM_PRIMO
	NPCMsg msg_0559_T22PC0101_00018
	BufferPlayersName 0
	BufferSpeciesName 1, SPECIES_MAREEP, 0, 0
	GiveEgg SPECIES_MAREEP, MAPLOC(METLOC_PRIMO)
	GoTo _01CB

_0157:
	GoToIfSet FLAG_GOT_WOOPER_EGG_FROM_PRIMO, _0212
	GetPartyCount VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 6
	GoToIfEq _0207
	SetFlag FLAG_GOT_WOOPER_EGG_FROM_PRIMO
	NPCMsg msg_0559_T22PC0101_00018
	BufferPlayersName 0
	BufferSpeciesName 1, SPECIES_WOOPER, 0, 0
	GiveEgg SPECIES_WOOPER, MAPLOC(METLOC_PRIMO)
	GoTo _01CB

_0191:
	GoToIfSet FLAG_GOT_SLUGMA_EGG_FROM_PRIMO, _0212
	GetPartyCount VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 6
	GoToIfEq _0207
	SetFlag FLAG_GOT_SLUGMA_EGG_FROM_PRIMO
	NPCMsg msg_0559_T22PC0101_00018
	BufferPlayersName 0
	BufferSpeciesName 1, SPECIES_SLUGMA, 0, 0
	GiveEgg SPECIES_SLUGMA, MAPLOC(METLOC_PRIMO)
	GoTo _01CB

_01CB:
	CloseMsg
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _01EC
	ApplyMovement obj_T22PC0101_instructor, _023C
	GoTo _01F4

_01EC:
	ApplyMovement obj_T22PC0101_instructor, _0250
_01F4:
	WaitMovement
	PlayFanfare SEQ_ME_TAMAGO_GET
	NPCMsg msg_0559_T22PC0101_00019
	WaitFanfare
	WaitButton
	GoTo _0235

_0207:
	NPCMsg msg_0559_T22PC0101_00020
	WaitButton
	GoTo _0235

_0212:
	NPCMsg msg_0559_T22PC0101_00014
	WaitButton
	GoTo _0235

_021D:
	TouchscreenMenuShow
_021F:
	NPCMsg msg_0559_T22PC0101_00015
	WaitButton
	GoTo _0235

_022A:
	NPCMsg msg_0559_T22PC0101_00016
	WaitButton
	GoTo _0235

_0235:
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_023C:
	Delay8
	WalkOnSpotNormalNorth
	Delay8 2
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0250:
	Delay8
	WalkOnSpotNormalNorth
	Delay8 2
	WalkOnSpotNormalEast
	EndMovement

scr_seq_T22PC0101_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_2C5, _0280
	NPCMsg msg_0559_T22PC0101_00021
	GoTo _028C

_0280:
	BufferPlayerUnionAvatarClassName 0
	NPCMsg msg_0559_T22PC0101_00026
	GoTo _028C

_028C:
	NPCMsg msg_0559_T22PC0101_00022
	TouchscreenMenuHide
	BufferUnionRoomAvatarChoices
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd msg_0191_00053, 255, 0
	MenuItemAdd msg_0191_00054, 255, 1
	MenuItemAdd msg_0191_00055, 255, 2
	MenuItemAdd msg_0191_00056, 255, 3
	MenuItemAdd msg_0191_00044, 255, 4
	MenuExec
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	Switch VAR_SPECIAL_RESULT
	Case 4, _0331
	Case -2, _0331
	UnionRoomAvatarIdxToTrainerClass VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	BufferTrainerClassNameIndef 0, VAR_SPECIAL_x8005
	Capitalize 0
	NPCMsg msg_0559_T22PC0101_00023
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0313
	GoTo _028C

_0313:
	TouchscreenMenuShow
	BufferTrainerClassNameIndef 0, VAR_SPECIAL_x8005
	NPCMsg msg_0559_T22PC0101_00024
	SetFlag FLAG_UNK_2C5
	UnionRoomAvatarIdxToSprite VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	ScrCmd_289 VAR_SPECIAL_x8005
	GoTo _0333

_0331:
	TouchscreenMenuShow
_0333:
	NPCMsg msg_0559_T22PC0101_00025
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T22PC0101_001:
	SimpleNPCMsg msg_0559_T22PC0101_00009
	End

scr_seq_T22PC0101_002:
	SimpleNPCMsg msg_0559_T22PC0101_00010
	End

scr_seq_T22PC0101_003:
	SimpleNPCMsg msg_0559_T22PC0101_00011
	End
	.balign 4, 0
