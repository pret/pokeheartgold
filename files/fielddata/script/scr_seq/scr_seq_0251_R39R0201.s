#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R39R0201.h"
#include "msgdata/msg/msg_0398_R39R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R39R0201_000
	ScrDef scr_seq_R39R0201_001
	ScrDef scr_seq_R39R0201_002
	ScrDef scr_seq_R39R0201_003
	ScrDef scr_seq_R39R0201_004
	ScrDefEnd

scr_seq_R39R0201_004:
	ScrCmd_379 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _0047
	Compare VAR_TEMP_x4000, 1
	GoToIfEq _0047
	Compare VAR_TEMP_x4000, 2
	GoToIfEq _0047
	ClearFlag FLAG_UNK_226
	End

_0047:
	SetFlag FLAG_UNK_226
	End

scr_seq_R39R0201_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_100, _00A2
	GoToIfSet FLAG_UNK_0AA, _007E
	NPCMsg msg_0398_R39R0201_00005
	CloseMsg
_0070:
	ApplyMovement obj_R39R0201_gsbabygirl1, _021C
	WaitMovement
	ReleaseAll
	End

_007E:
	NPCMsg msg_0398_R39R0201_00006
	GiveItemNoCheck ITEM_SEAL_CASE, 1
	NPCMsg msg_0398_R39R0201_00007
	CloseMsg
	SetFlag FLAG_UNK_100
	GoTo _0070
	End

_00A2:
	NPCMsg msg_0398_R39R0201_00008
	CloseMsg
	GoTo _0070
	End

scr_seq_R39R0201_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_101, _00E0
	GoToIfSet FLAG_UNK_0AA, _00FA
	NPCMsg msg_0398_R39R0201_00000
	CloseMsg
_00D2:
	ApplyMovement obj_R39R0201_gsbabygirl1_2, _0224
	WaitMovement
	ReleaseAll
	End

_00E0:
	NPCMsg msg_0398_R39R0201_00004
	CloseMsg
	GoTo _00D2
	End

_00ED:
	NPCMsg msg_0398_R39R0201_00002
	CloseMsg
	GoTo _00D2
	End

_00FA:
	GoToIfUnset FLAG_UNK_100, _00ED
	NPCMsg msg_0398_R39R0201_00001
	SetVar VAR_SPECIAL_x8004, 29
	SetVar VAR_SPECIAL_x8005, 34
	SetVar VAR_SPECIAL_x8006, 39
	GetSealQuantity VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 99
	GoToIfEq _020C
	GetSealQuantity VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 99
	GoToIfEq _020C
	GetSealQuantity VAR_SPECIAL_x8006, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 99
	GoToIfEq _020C
	SetVar VAR_SPECIAL_x8000, 3
	SetVar VAR_SPECIAL_x8001, 3
	SetVar VAR_SPECIAL_x8002, 3
	GetSealQuantity VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 96
	GoToIfLe _01C2
	SubVar VAR_SPECIAL_RESULT, 96
	SubVar VAR_SPECIAL_x8000, VAR_SPECIAL_RESULT
	GetSealQuantity VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 96
	GoToIfLe _01C2
	SubVar VAR_SPECIAL_RESULT, 96
	SubVar VAR_SPECIAL_x8001, VAR_SPECIAL_RESULT
	GetSealQuantity VAR_SPECIAL_x8006, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 96
	GoToIfLe _01C2
	SubVar VAR_SPECIAL_RESULT, 96
	SubVar VAR_SPECIAL_x8002, VAR_SPECIAL_RESULT
_01C2:
	GiveOrTakeSeal VAR_SPECIAL_x8004, VAR_SPECIAL_x8000
	GiveOrTakeSeal VAR_SPECIAL_x8005, VAR_SPECIAL_x8001
	GiveOrTakeSeal VAR_SPECIAL_x8006, VAR_SPECIAL_x8002
	BufferSealNamePlural 0, VAR_SPECIAL_x8004
	NPCMsg msg_0398_R39R0201_00020
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	BufferSealNamePlural 0, VAR_SPECIAL_x8005
	NPCMsg msg_0398_R39R0201_00020
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	BufferSealNamePlural 0, VAR_SPECIAL_x8006
	NPCMsg msg_0398_R39R0201_00020
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	CloseMsg
	SetFlag FLAG_UNK_101
	GoTo _00D2
	End

_020C:
	NPCMsg msg_0398_R39R0201_00003
	CloseMsg
	GoTo _00D2
	End

	.balign 4, 0
_021C:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0224:
	WalkOnSpotNormalWest
	EndMovement

scr_seq_R39R0201_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_0AA, _0354
	PlayCry SPECIES_MILTANK, 11
	NPCMsg msg_0398_R39R0201_00009
	WaitCry
	GoToIfSet FLAG_UNK_0A8, _0260
	NPCMsg msg_0398_R39R0201_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0260:
	NPCMsg msg_0398_R39R0201_00010
	WaitABPress
	NPCMsg msg_0398_R39R0201_00013
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _028C
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0378
	End

_028C:
	SetVar VAR_SPECIAL_x8004, 155
	SetVar VAR_SPECIAL_x8005, 1
	HasItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _036A
	TakeItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	BufferPlayersName 0
	NPCMsg msg_0398_R39R0201_00014
	WaitButton
	CloseMsg
	GoToIfSet FLAG_UNK_0B0, _033F
	GoToIfSet FLAG_UNK_0AF, _0337
	GoToIfSet FLAG_UNK_0AE, _0328
	GoToIfSet FLAG_UNK_0AD, _0320
	GoToIfSet FLAG_UNK_0AC, _0311
	GoToIfSet FLAG_UNK_0A9, _0309
	SetFlag FLAG_UNK_0A9
	ReleaseAll
	End

_0309:
	SetFlag FLAG_UNK_0AC
	ReleaseAll
	End

_0311:
	SetFlag FLAG_UNK_0AD
	NPCMsg msg_0398_R39R0201_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0320:
	SetFlag FLAG_UNK_0AE
	ReleaseAll
	End

_0328:
	SetFlag FLAG_UNK_0AF
	NPCMsg msg_0398_R39R0201_00016
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0337:
	SetFlag FLAG_UNK_0B0
	ReleaseAll
	End

_033F:
	PlayFanfare SEQ_ME_ASA
	WaitFanfare
	NPCMsg msg_0398_R39R0201_00017
	WaitButton
	CloseMsg
	SetFlag FLAG_UNK_0AA
	ReleaseAll
	End

_0354:
	PlayCry SPECIES_MILTANK, 0
	NPCMsg msg_0398_R39R0201_00011
	WaitCry
	NPCMsg msg_0398_R39R0201_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

_036A:
	BufferPlayersName 0
	NPCMsg msg_0398_R39R0201_00018
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0378:
	BufferPlayersName 0
	NPCMsg msg_0398_R39R0201_00019
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R39R0201_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_MILTANK, 0
	NPCMsg msg_0398_R39R0201_00011
	WaitCry
	NPCMsg msg_0398_R39R0201_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
