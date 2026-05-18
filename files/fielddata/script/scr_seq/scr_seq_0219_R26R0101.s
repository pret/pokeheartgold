#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R26R0101.h"
#include "msgdata/msg/msg_0366_R26R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R26R0101_000
	ScrDef scr_seq_R26R0101_001
	ScrDefEnd

scr_seq_R26R0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0366_R26R0101_00000
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	PlayFanfare SEQ_ME_ASA
	WaitFanfare
	HealParty
	ScrCmd_436
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	NPCMsg msg_0366_R26R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R26R0101_001:
	SimpleNPCMsg msg_0366_R26R0101_00002
	End
	.balign 4, 0
