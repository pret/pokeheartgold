#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T28GYM0103.h"
#include "msgdata/msg/msg_0623_T28GYM0103.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T28GYM0103_000
	ScrDef scr_seq_T28GYM0103_001
	ScrDefEnd

scr_seq_T28GYM0103_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_GLACIER, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0030
	NPCMsg msg_0623_T28GYM0103_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0030:
	NPCMsg msg_0623_T28GYM0103_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T28GYM0103_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_GLACIER, VAR_SPECIAL_RESULT
	BufferPlayersName 0
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0062
	NPCMsg msg_0623_T28GYM0103_00002
	GoTo _0065

_0062:
	NPCMsg msg_0623_T28GYM0103_00003
_0065:
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
