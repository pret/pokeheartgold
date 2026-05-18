#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D49R0104.h"
#include "msgdata/msg/msg_0140_D49R0104.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D49R0104_000
	ScrDef scr_seq_D49R0104_001
	ScrDef scr_seq_D49R0104_002
	ScrDef scr_seq_D49R0104_003
	ScrDef scr_seq_D49R0104_004
	ScrDef scr_seq_D49R0104_005
	ScrDef scr_seq_D49R0104_006
	ScrDef scr_seq_D49R0104_007
	ScrDef scr_seq_D49R0104_008
	ScrDef scr_seq_D49R0104_009
	ScrDef scr_seq_D49R0104_010
	ScrDef scr_seq_D49R0104_011
	ScrDef scr_seq_D49R0104_012
	ScrDef scr_seq_D49R0104_013
	ScrDefEnd

scr_seq_D49R0104_012:
	GoToIfSet FLAG_UNK_0EF, _004D
	SetVar VAR_TEMP_x400B, 0
	End

_004D:
	SetVar VAR_TEMP_x400B, 1
	End

scr_seq_D49R0104_011:
	Compare VAR_TEMP_x400B, 1
	GoToIfNe _0074
	MovePersonFacing obj_D49R0104_pcwoman2_2, 2, 1, 3, DIR_EAST
	SetVar VAR_TEMP_x400B, 0
_0074:
	End

scr_seq_D49R0104_000:
	SimpleNPCMsg msg_0140_D49R0104_00000
	End

scr_seq_D49R0104_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_0EF, _00A7
	NPCMsg msg_0140_D49R0104_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00A7:
	NPCMsg msg_0140_D49R0104_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49R0104_002:
	SimpleNPCMsg msg_0140_D49R0104_00003
	End

scr_seq_D49R0104_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0140_D49R0104_00004
	CloseMsg
	ApplyMovement obj_D49R0104_tsure_poke_static_rattata, _00F0
	WaitMovement
	PlayCry SPECIES_RATTATA, 0
	NPCMsg msg_0140_D49R0104_00011
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_00F0:
	JumpOnSpotFastNorth 2
	EndMovement

scr_seq_D49R0104_004:
	SimpleNPCMsg msg_0140_D49R0104_00005
	End

scr_seq_D49R0104_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_RATTATA, 0
	NPCMsg msg_0140_D49R0104_00010
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49R0104_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_ZUBAT, 0
	NPCMsg msg_0140_D49R0104_00012
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49R0104_007:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	BufferPlayersName 0
	NPCMsg msg_0140_D49R0104_00006
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_712 0
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

scr_seq_D49R0104_008:
	SimpleNPCMsg msg_0140_D49R0104_00007
	End

scr_seq_D49R0104_009:
	SimpleNPCMsg msg_0140_D49R0104_00008
	End

scr_seq_D49R0104_010:
	SimpleNPCMsg msg_0140_D49R0104_00009
	End

scr_seq_D49R0104_013:
	SimpleNPCMsg msg_0140_D49R0104_00013
	End
	.balign 4, 0
