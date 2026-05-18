#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D41R0108.h"
#include "msgdata/msg/msg_0126_D41R0108.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D41R0108_000
	ScrDefEnd

scr_seq_D41R0108_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0126_D41R0108_00000
	CloseMsg
	TrainerBattle TRAINER_PKMN_TRAINER_RED_RED, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0098
	NPCMsg msg_0126_D41R0108_00001
	Wait 30, VAR_SPECIAL_RESULT
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CloseMsg
	HidePerson obj_D41R0108_red
	SetFlag FLAG_UNK_25F
	SetVar VAR_UNK_40FD, 1
	Compare VAR_UNK_4131, 0
	CallIfEq _009E
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Call _00B2
	Wait 60, VAR_SPECIAL_RESULT
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	HOFCredits 1
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_0098:
	WhiteOut
	ReleaseAll
	End

_009E:
	SetVar VAR_UNK_4131, 1
	ClearFlag FLAG_HIDE_OAKS_LAB_BULBASAUR_BALL
	ClearFlag FLAG_HIDE_OAKS_LAB_CHARMANDER_BALL
	ClearFlag FLAG_HIDE_OAKS_LAB_SQUIRTLE_BALL
	Return

_00B2:
	GetPartyCount VAR_SPECIAL_x8004
	SetVar VAR_SPECIAL_x8005, 0
_00BC:
	GetPartyMonSpecies VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00D5
	GiveRibbon VAR_SPECIAL_x8005, RIBBON_LEGEND
_00D5:
	AddVar VAR_SPECIAL_x8005, 1
	Compare VAR_SPECIAL_x8005, VAR_SPECIAL_x8004
	GoToIfLt _00BC
	Return
	.balign 4, 0
