#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T28GYM0101.h"
#include "msgdata/msg/msg_0622_T28GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T28GYM0101_000
	ScrDef scr_seq_T28GYM0101_001
	ScrDefEnd

scr_seq_T28GYM0101_001:
	GoToIfUnset FLAG_UNK_189, _001B
	ClearFlag FLAG_UNK_189
	End

_001B:
	GetPhoneBookRematch PHONE_CONTACT_PRYCE, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _00B8
	GoToIfUnset FLAG_GAME_CLEAR, _00B2
	CheckRegisteredPhoneNumber PHONE_CONTACT_PRYCE, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _00B2
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 6
	GoToIfNe _0067
	SetFlag FLAG_HIDE_MAHOGANY_GYM_PRYCE
	GoTo _00B0

_0067:
	Compare VAR_TEMP_x4000, 7
	GoToIfNe _007E
	SetFlag FLAG_HIDE_MAHOGANY_GYM_PRYCE
	GoTo _00B0

_007E:
	Compare VAR_TEMP_x4000, 8
	GoToIfNe _0095
	SetFlag FLAG_HIDE_MAHOGANY_GYM_PRYCE
	GoTo _00B0

_0095:
	Compare VAR_TEMP_x4000, 9
	GoToIfNe _00AC
	SetFlag FLAG_HIDE_MAHOGANY_GYM_PRYCE
	GoTo _00B0

_00AC:
	ClearFlag FLAG_HIDE_MAHOGANY_GYM_PRYCE
_00B0:
	End

_00B2:
	ClearFlag FLAG_HIDE_MAHOGANY_GYM_PRYCE
	End

_00B8:
	SetFlag FLAG_HIDE_MAHOGANY_GYM_PRYCE
	End

// This script contains a programming mistake where if the
// player has 99 TM07, the TM07 from Pryce is permanently
// lost. This is unlike every other script for obtaining a
// TM from someone, which all attempt to give the TM until
// the player can accept it.
// FLAG_GOT_TM07_FROM_PRYCE is used here but no code in the
// game ever checks what it is, meaning that flag is useless.
scr_seq_T28GYM0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_GLACIER, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0178
	NPCMsg msg_0622_T28GYM0101_00000
	CloseMsg
	TrainerBattle TRAINER_LEADER_PRYCE_PRYCE, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0172
	SetTrainerFlag TRAINER_BOARDER_DEANDRE
	SetTrainerFlag TRAINER_BOARDER_GERARDO
	SetTrainerFlag TRAINER_SKIER_JILL
	SetTrainerFlag TRAINER_SKIER_DIANA
	SetTrainerFlag TRAINER_BOARDER_PATTON
	NPCMsg msg_0622_T28GYM0101_00001
	GiveBadge BADGE_GLACIER
	AddVar VAR_MIDGAME_BADGES, 1
	AddSpecialGameStat SCORE_EVENT_BADGE_GET
	Compare VAR_MIDGAME_BADGES, 3
	GoToIfNe _012F
	SetVar VAR_SCENE_ROCKET_TAKEOVER, 1
_012F:
	BufferPlayersName 0
	NPCMsg msg_0622_T28GYM0101_00002
	PlayFanfare SEQ_ME_BADGE
	WaitFanfare
	NPCMsg msg_0622_T28GYM0101_00003
	GoToIfNoItemSpace ITEM_TM07, 1, _018E
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_TM07_FROM_PRYCE
	NPCMsg msg_0622_T28GYM0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0172:
	WhiteOut
	ReleaseAll
	End

_0178:
	GoToIfSet FLAG_GAME_CLEAR, _0198
	NPCMsg msg_0622_T28GYM0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_018E:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_0198:
	NPCMsg msg_0622_T28GYM0101_00006
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _01F9
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0204
	NPCMsg msg_0622_T28GYM0101_00007
	CloseMsg
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 40
	FacePlayer
	LockAll
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ClearFlag FLAG_UNK_189
	NPCMsg msg_0622_T28GYM0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01F9:
	NPCMsg msg_0622_T28GYM0101_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0204:
	NPCMsg msg_0622_T28GYM0101_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
