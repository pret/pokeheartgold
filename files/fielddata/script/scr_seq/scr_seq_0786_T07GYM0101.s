#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07GYM0101.h"
#include "msgdata/msg/msg_0492_T07GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T07GYM0101_000
	ScrDef scr_seq_T07GYM0101_001
	ScrDef scr_seq_T07GYM0101_002
	ScrDefEnd

scr_seq_T07GYM0101_002:
	GetPhoneBookRematch PHONE_CONTACT_ERIKA, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _0107
	CheckRegisteredPhoneNumber PHONE_CONTACT_ERIKA, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _00DE
	CheckBadge BADGE_EARTH, VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 1
	GoToIfEq _004F
	GoTo _0101
	End

_004F:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 6
	GoToIfNe _006C
	GoTo _008D

_0066:
	GoTo _008B

_006C:
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _0085
	GoTo _008D

_007F:
	GoTo _008B

_0085:
	GoTo _0101

_008B:
	End

_008D:
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 14
	GoToIfNe _00A8
	SetFlag FLAG_HIDE_CELADON_GYM_ERIKA
	GoTo _00DC

_00A8:
	Compare VAR_TEMP_x4000, 15
	GoToIfNe _00BF
	SetFlag FLAG_HIDE_CELADON_GYM_ERIKA
	GoTo _00DC

_00BF:
	Compare VAR_TEMP_x4000, 16
	GoToIfNe _00D6
	SetFlag FLAG_HIDE_CELADON_GYM_ERIKA
	GoTo _00DC

_00D6:
	GoTo _0101

_00DC:
	End

_00DE:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfNe _00F9
	SetFlag FLAG_HIDE_CELADON_GYM_ERIKA
	GoTo _00FF

_00F9:
	GoTo _0101

_00FF:
	End

_0101:
	ClearFlag FLAG_HIDE_CELADON_GYM_ERIKA
	End

_0107:
	SetFlag FLAG_HIDE_CELADON_GYM_ERIKA
	End

scr_seq_T07GYM0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_RAINBOW, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _01A5
	NPCMsg msg_0492_T07GYM0101_00000
	CloseMsg
	TrainerBattle TRAINER_LEADER_ERIKA_ERIKA, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01BB
	GiveBadge BADGE_RAINBOW
	AddVar VAR_UNK_4135, 1
	AddSpecialGameStat SCORE_EVENT_BADGE_GET
	SetTrainerFlag TRAINER_TWINS_JO_AND_ZOE
	SetTrainerFlag TRAINER_LASS_MICHELLE
	SetTrainerFlag TRAINER_PICNICKER_TANYA
	SetTrainerFlag TRAINER_BEAUTY_JULIA
	NPCMsg msg_0492_T07GYM0101_00001
	BufferPlayersName 0
	NPCMsg msg_0492_T07GYM0101_00002
	PlayFanfare SEQ_ME_BADGE
	WaitFanfare
	NPCMsg msg_0492_T07GYM0101_00003
	GoTo _017C

_017C:
	GoToIfNoItemSpace ITEM_TM19, 1, _01C1
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_TM19_FROM_ERIKA
_01A5:
	GoToIfUnset FLAG_GOT_TM19_FROM_ERIKA, _017C
	NPCMsg msg_0492_T07GYM0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01BB:
	WhiteOut
	ReleaseAll
	End

_01C1:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_T07GYM0101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_RAINBOW, VAR_SPECIAL_RESULT
	BufferPlayersName 0
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _01F2
	NPCMsg msg_0492_T07GYM0101_00005
	GoTo _01F5

_01F2:
	NPCMsg msg_0492_T07GYM0101_00006
_01F5:
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
