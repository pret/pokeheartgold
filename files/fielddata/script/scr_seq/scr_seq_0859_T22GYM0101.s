#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T22GYM0101.h"
#include "msgdata/msg/msg_0558_T22GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T22GYM0101_000
	ScrDef scr_seq_T22GYM0101_001
	ScrDef scr_seq_T22GYM0101_002
	ScrDef scr_seq_T22GYM0101_003
	ScrDef scr_seq_T22GYM0101_004
	ScrDef scr_seq_T22GYM0101_005
	ScrDefEnd

scr_seq_T22GYM0101_000:
	VioletGymInit
	GetPhoneBookRematch PHONE_CONTACT_FALKNER, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _00A7
	CheckRegisteredPhoneNumber PHONE_CONTACT_FALKNER, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _007E
	CheckBadge BADGE_SOUL, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _005B
	GoTo _00A1

_005B:
	GetWeekday VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfNe _0076
	SetFlag FLAG_HIDE_VIOLET_GYM_FALKNER
	GoTo _007C

_0076:
	GoTo _00A1

_007C:
	End

_007E:
	GetWeekday VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 3
	GoToIfNe _0099
	SetFlag FLAG_HIDE_VIOLET_GYM_FALKNER
	GoTo _009F

_0099:
	GoTo _00A1

_009F:
	End

_00A1:
	ClearFlag FLAG_HIDE_VIOLET_GYM_FALKNER
	End

_00A7:
	SetFlag FLAG_HIDE_VIOLET_GYM_FALKNER
	End

scr_seq_T22GYM0101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_ZEPHYR, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0168
	NPCMsg msg_0558_T22GYM0101_00000
	CloseMsg
	TrainerBattle TRAINER_LEADER_FALKNER_FALKNER, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _017E
	GiveBadge BADGE_ZEPHYR
	AddSpecialGameStat SCORE_EVENT_BADGE_GET
	SetTrainerFlag TRAINER_BIRD_KEEPER_GS_ROD
	SetTrainerFlag TRAINER_BIRD_KEEPER_GS_ABE
	SetVar VAR_SCENE_VIOLET_CITY_OW, 1
	SetFlag FLAG_UNK_192
	SetVar VAR_SCENE_ELMS_LAB, 6
	SetFlag FLAG_UNK_0F4
	SetFlag FLAG_HIDE_WIFI_CLUB_CLOSED_LADY
	NPCMsg msg_0558_T22GYM0101_00001
	BufferPlayersName 0
	NPCMsg msg_0558_T22GYM0101_00002
	PlayFanfare SEQ_ME_BADGE
	WaitFanfare
	NPCMsg msg_0558_T22GYM0101_00003
	GoTo _0126

_0126:
	GoToIfNoItemSpace ITEM_TM51, 1, _015E
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_TM51_FROM_FALKNER
	ClearFlag FLAG_HIDE_NEW_BARK_FRIENDS_ROOM_FRIEND
	NPCMsg msg_0558_T22GYM0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_015E:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_0168:
	GoToIfUnset FLAG_GOT_TM51_FROM_FALKNER, _0126
	NPCMsg msg_0558_T22GYM0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_017E:
	WhiteOut
	ReleaseAll
	End

scr_seq_T22GYM0101_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_ZEPHYR, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _01AA
	NPCMsg msg_0558_T22GYM0101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01AA:
	NPCMsg msg_0558_T22GYM0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T22GYM0101_005:
	SimpleNPCMsg msg_0558_T22GYM0101_00006
	End

scr_seq_T22GYM0101_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_ZEPHYR, VAR_SPECIAL_RESULT
	BufferPlayersName 0
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _01EF
	NPCMsg msg_0558_T22GYM0101_00009
	GoTo _01F2

_01EF:
	NPCMsg msg_0558_T22GYM0101_00010
_01F2:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T22GYM0101_004:
	SetVar VAR_TEMP_x4000, 0
	VioletGymElevator
	End
	.balign 4, 0
