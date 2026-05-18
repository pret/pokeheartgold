#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D49R0105.h"
#include "msgdata/msg/msg_0141_D49R0105.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D49R0105_000
	ScrDef scr_seq_D49R0105_001
	ScrDef scr_seq_D49R0105_002
	ScrDef scr_seq_D49R0105_003
	ScrDef scr_seq_D49R0105_004
	ScrDef scr_seq_D49R0105_005
	ScrDef scr_seq_D49R0105_006
	ScrDef scr_seq_D49R0105_007
	ScrDef scr_seq_D49R0105_008
	ScrDef scr_seq_D49R0105_009
	ScrDef scr_seq_D49R0105_010
	ScrDef scr_seq_D49R0105_011
	ScrDef scr_seq_D49R0105_012
	ScrDef scr_seq_D49R0105_013
	ScrDefEnd

scr_seq_D49R0105_012:
	GoToIfSet FLAG_UNK_0F0, _004D
	SetVar VAR_TEMP_x400C, 0
	End

_004D:
	SetVar VAR_TEMP_x400C, 1
	End

scr_seq_D49R0105_011:
	Compare VAR_TEMP_x400C, 1
	GoToIfNe _0074
	MovePersonFacing obj_D49R0105_pcwoman2_2, 2, 1, 3, DIR_EAST
	SetVar VAR_TEMP_x400C, 0
_0074:
	End

scr_seq_D49R0105_000:
	SimpleNPCMsg msg_0141_D49R0105_00000
	End

scr_seq_D49R0105_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_0F0, _00A7
	NPCMsg msg_0141_D49R0105_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00A7:
	NPCMsg msg_0141_D49R0105_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49R0105_002:
	SimpleNPCMsg msg_0141_D49R0105_00003
	End

scr_seq_D49R0105_003:
	SimpleNPCMsg msg_0141_D49R0105_00004
	End

scr_seq_D49R0105_004:
	SimpleNPCMsg msg_0141_D49R0105_00005
	End

scr_seq_D49R0105_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0141_D49R0105_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49R0105_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_DRATINI, 0
	NPCMsg msg_0141_D49R0105_00015
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49R0105_007:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	BufferPlayersName 0
	NPCMsg msg_0141_D49R0105_00006
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_712 1
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

scr_seq_D49R0105_008:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfUnset FLAG_HIDE_POKEATHLON_CLOTHES_SIGN, _0166
	NPCMsg msg_0141_D49R0105_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0166:
	NPCMsg msg_0141_D49R0105_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49R0105_009:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfUnset FLAG_HIDE_POKEATHLON_SHOES_SIGN, _018F
	NPCMsg msg_0141_D49R0105_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

_018F:
	NPCMsg msg_0141_D49R0105_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49R0105_010:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfUnset FLAG_HIDE_POKEATHLON_FLAG_SIGN, _01B8
	NPCMsg msg_0141_D49R0105_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01B8:
	NPCMsg msg_0141_D49R0105_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49R0105_013:
	SimpleNPCMsg msg_0141_D49R0105_00013
	End
	.balign 4, 0
