#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T03GYM0101.h"
#include "msgdata/msg/msg_0462_T03GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T03GYM0101_000
	ScrDef scr_seq_T03GYM0101_001
	ScrDef scr_seq_T03GYM0101_002
	ScrDef scr_seq_T03GYM0101_003
	ScrDefEnd

scr_seq_T03GYM0101_003:
	GetPhoneBookRematch PHONE_CONTACT_BROCK, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _00FB
	CheckRegisteredPhoneNumber PHONE_CONTACT_BROCK, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _00A4
	CheckBadge BADGE_EARTH, VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 1
	GoToIfEq _0053
	GoTo _00F5
	End

_0053:
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 12
	GoToIfNe _006E
	SetFlag FLAG_HIDE_PEWTER_GYM_BROCK
	GoTo _00A2

_006E:
	Compare VAR_TEMP_x4000, 13
	GoToIfNe _0085
	SetFlag FLAG_HIDE_PEWTER_GYM_BROCK
	GoTo _00A2

_0085:
	Compare VAR_TEMP_x4000, 14
	GoToIfNe _009C
	SetFlag FLAG_HIDE_PEWTER_GYM_BROCK
	GoTo _00A2

_009C:
	GoTo _00F5

_00A2:
	End

_00A4:
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 17
	GoToIfNe _00BF
	SetFlag FLAG_HIDE_PEWTER_GYM_BROCK
	GoTo _00F3

_00BF:
	Compare VAR_TEMP_x4000, 18
	GoToIfNe _00D6
	SetFlag FLAG_HIDE_PEWTER_GYM_BROCK
	GoTo _00F3

_00D6:
	Compare VAR_TEMP_x4000, 19
	GoToIfNe _00ED
	SetFlag FLAG_HIDE_PEWTER_GYM_BROCK
	GoTo _00F3

_00ED:
	GoTo _00F5

_00F3:
	End

_00F5:
	ClearFlag FLAG_HIDE_PEWTER_GYM_BROCK
	End

_00FB:
	SetFlag FLAG_HIDE_PEWTER_GYM_BROCK
	End

scr_seq_T03GYM0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_BOULDER, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0195
	NPCMsg msg_0462_T03GYM0101_00000
	CloseMsg
	TrainerBattle TRAINER_LEADER_BROCK_BROCK, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01B8
	GiveBadge BADGE_BOULDER
	AddVar VAR_UNK_4135, 1
	AddSpecialGameStat SCORE_EVENT_BADGE_GET
	SetTrainerFlag TRAINER_CAMPER_JERRY
	SetTrainerFlag TRAINER_HIKER_EDWIN
	NPCMsg msg_0462_T03GYM0101_00001
	BufferPlayersName 0
	NPCMsg msg_0462_T03GYM0101_00002
	PlayFanfare SEQ_ME_BADGE
	WaitFanfare
	BufferPlayersName 0
	GenderMsgBox msg_0462_T03GYM0101_00003, msg_0462_T03GYM0101_00004
	GoTo _016C

_016C:
	GoToIfNoItemSpace ITEM_TM80, 1, _01AE
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_TM80_FROM_BROCK
_0195:
	GoToIfUnset FLAG_GOT_TM80_FROM_BROCK, _016C
	BufferPlayersName 0
	NPCMsg msg_0462_T03GYM0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01AE:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_01B8:
	WhiteOut
	ReleaseAll
	End

scr_seq_T03GYM0101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_BOULDER, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _01E4
	NPCMsg msg_0462_T03GYM0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01E4:
	NPCMsg msg_0462_T03GYM0101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T03GYM0101_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_BOULDER, VAR_SPECIAL_RESULT
	BufferPlayersName 0
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0216
	NPCMsg msg_0462_T03GYM0101_00008
	GoTo _0219

_0216:
	NPCMsg msg_0462_T03GYM0101_00009
_0219:
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
