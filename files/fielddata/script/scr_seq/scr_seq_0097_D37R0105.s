#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D37R0105.h"
#include "msgdata/msg/msg_0120_D37R0105.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D37R0105_000
	ScrDef scr_seq_D37R0105_001
	ScrDefEnd

scr_seq_D37R0105_000:
	SetFlag FLAG_HIDE_ROCKET_TAKEOVER_1
	SetFlag FLAG_HIDE_ROCKET_TAKEOVER_2
	Compare VAR_SCENE_ROCKET_TAKEOVER, 4
	GoToIfNe _0027
	ClearFlag FLAG_HIDE_ROCKET_TAKEOVER_1
	ClearFlag FLAG_HIDE_ROCKET_TAKEOVER_2
_0027:
	End

scr_seq_D37R0105_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetItemQuantity ITEM_CARD_KEY, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _005B
	NPCMsg msg_0120_D37R0105_00000
	SetFlag FLAG_UNK_1C1
	GiveItemNoCheck ITEM_CARD_KEY, 1
_005B:
	NPCMsg msg_0120_D37R0105_00002
	NPCMsg msg_0120_D37R0105_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
