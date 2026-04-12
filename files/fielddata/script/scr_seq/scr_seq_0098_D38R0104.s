#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D38R0104.h"
#include "msgdata/msg/msg_0121_D38R0104.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D38R0104_000
	ScrDefEnd

scr_seq_D38R0104_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_TYROGUE_FROM_KARATE_KING, _0097
	GoToIfSet FLAG_BEAT_KARATE_KING, _0046
	NPCMsg msg_0121_D38R0104_00000
	CloseMsg
	TrainerBattle TRAINER_BLACK_BELT_KIYO, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00CC
	SetFlag FLAG_BEAT_KARATE_KING
_0046:
	NPCMsg msg_0121_D38R0104_00001
	GetPartyCount VAR_SPECIAL_x8005
	Compare VAR_SPECIAL_x8005, 6
	GoToIfNe _0063
	NPCMsg msg_0121_D38R0104_00004
	GoTo _00D2

_0063:
	BufferPlayersName 0
	NPCMsg msg_0121_D38R0104_00002
	PlayFanfare SEQ_ME_POKEGET
	WaitFanfare
	GiveMon SPECIES_TYROGUE, 10, 0, 0, 0, VAR_SPECIAL_RESULT
	NPCMsg msg_0121_D38R0104_00005
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	CloseMsg
	Compare VAR_SPECIAL_RESULT, 0
	CallIfEq _00A6
	TouchscreenMenuShow
_0097:
	SetFlag FLAG_GOT_TYROGUE_FROM_KARATE_KING
	NPCMsg msg_0121_D38R0104_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00A6:
	SetVar VAR_TEMP_x4000, 0
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	NicknameInput VAR_SPECIAL_x8005, VAR_TEMP_x4000
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Return

_00CC:
	WhiteOut
	ReleaseAll
	End

_00D2:
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
