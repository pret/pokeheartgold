#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R30R0101.h"
#include "msgdata/msg/msg_0376_R30R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R30R0101_000
	ScrDefEnd

scr_seq_R30R0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_APRICORN_BOX, _0041
	NPCMsg msg_0376_R30R0101_00000
	GiveItemNoCheck ITEM_APRICORN_BOX, 1
	SetFlag FLAG_GOT_APRICORN_BOX
	SetVar VAR_SCENE_ROUTE_30_OW, 1
	NPCMsg msg_0376_R30R0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0041:
	NPCMsg msg_0376_R30R0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
