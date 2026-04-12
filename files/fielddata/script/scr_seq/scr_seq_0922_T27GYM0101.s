#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T27GYM0101.h"
#include "msgdata/msg/msg_0614_T27GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T27GYM0101_000
	ScrDef scr_seq_T27GYM0101_001
	ScrDef scr_seq_T27GYM0101_002
	ScrDef scr_seq_T27GYM0101_003
	ScrDef scr_seq_T27GYM0101_004
	ScrDef scr_seq_T27GYM0101_005
	ScrDefEnd

scr_seq_T27GYM0101_000:
	EcruteakGymInit
	GetPhoneBookRematch PHONE_CONTACT_MORTY, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _00AC
	GoToIfUnset FLAG_GAME_CLEAR, _00A6
	CheckRegisteredPhoneNumber PHONE_CONTACT_MORTY, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _0085
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfNe _0068
	SetFlag FLAG_HIDE_ECRUTEAK_GYM_MORTY
	GoTo _0083

_0068:
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _007F
	SetFlag FLAG_HIDE_ECRUTEAK_GYM_MORTY
	GoTo _0083

_007F:
	ClearFlag FLAG_HIDE_ECRUTEAK_GYM_MORTY
_0083:
	End

_0085:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 5
	GoToIfNe _00A0
	SetFlag FLAG_HIDE_ECRUTEAK_GYM_MORTY
	GoTo _00A4

_00A0:
	ClearFlag FLAG_HIDE_ECRUTEAK_GYM_MORTY
_00A4:
	End

_00A6:
	ClearFlag FLAG_HIDE_ECRUTEAK_GYM_MORTY
	End

_00AC:
	SetFlag FLAG_HIDE_ECRUTEAK_GYM_MORTY
	End

scr_seq_T27GYM0101_004:
	ScrCmd_609
	LockAll
	ApplyMovement obj_T27GYM0101_gsoldman1, _0108
	WaitMovement
	NPCMsg msg_0614_T27GYM0101_00009
	CloseMsg
	ApplyMovement obj_T27GYM0101_gsoldman1, _0118
	ApplyMovement obj_player, _0128
	WaitMovement
	SetVar VAR_UNK_4079, 1
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_ECRUTEAK, 7, 376, 182, DIR_SOUTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

	.balign 4, 0
_0108:
	EmoteExclamationMark
	WalkNormalSouth 3
	Delay8
	EndMovement

	.balign 4, 0
_0118:
	WalkSlowSouth
	LockDir
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0128:
	Delay8
	WalkNormalSouth
	Delay8
	EndMovement

scr_seq_T27GYM0101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_FOG, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _01D9
	NPCMsg msg_0614_T27GYM0101_00000
	CloseMsg
	TrainerBattle TRAINER_LEADER_MORTY_MORTY, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01EF
	NPCMsg msg_0614_T27GYM0101_00001
	GiveBadge BADGE_FOG
	AddVar VAR_MIDGAME_BADGES, 1
	AddSpecialGameStat SCORE_EVENT_BADGE_GET
	SetFlag FLAG_UNK_998
	BufferPlayersName 0
	NPCMsg msg_0614_T27GYM0101_00002
	PlayFanfare SEQ_ME_BADGE
	WaitFanfare
	NPCMsg msg_0614_T27GYM0101_00003
	GoTo _019B

_019B:
	GoToIfNoItemSpace ITEM_TM30, 1, _01CF
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_TM30_FROM_MORTY
	NPCMsg msg_0614_T27GYM0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01CF:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_01D9:
	GoToIfUnset FLAG_GOT_TM30_FROM_MORTY, _019B
	NPCMsg msg_0614_T27GYM0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01EF:
	WhiteOut
	ReleaseAll
	End

scr_seq_T27GYM0101_002:
	ScrCmd_609
	LockAll
	PlaySE SEQ_SE_DP_GYURU
	ApplyMovement obj_player, _0230
	WaitMovement
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_ECRUTEAK_GYM, 0, 16, 49, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

	.balign 4, 0
_0230:
	FaceSouth 2
	FaceWest 2
	FaceNorth 2
	FaceEast 2
	FaceSouth 2
	FaceWest 2
	FaceNorth 2
	FaceEast 2
	FaceSouth 2
	FaceWest 2
	FaceNorth 2
	FaceEast 2
	FaceSouth 2
	FaceWest 2
	FaceNorth 2
	FaceEast
	SetInvisible 0
	EndMovement

scr_seq_T27GYM0101_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_FOG, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _029E
	NPCMsg msg_0614_T27GYM0101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_029E:
	BufferPlayersName 0
	NPCMsg msg_0614_T27GYM0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T27GYM0101_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_FOG, VAR_SPECIAL_RESULT
	BufferPlayersName 0
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _02D3
	NPCMsg msg_0614_T27GYM0101_00010
	GoTo _02D6

_02D3:
	NPCMsg msg_0614_T27GYM0101_00011
_02D6:
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
