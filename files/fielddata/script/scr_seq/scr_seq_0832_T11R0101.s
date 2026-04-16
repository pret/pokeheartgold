#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11R0101.h"
#include "msgdata/msg/msg_0533_T11R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T11R0101_000
	ScrDef scr_seq_T11R0101_001
	ScrDef scr_seq_T11R0101_002
	ScrDef scr_seq_T11R0101_003
	ScrDef scr_seq_T11R0101_004
	ScrDef scr_seq_T11R0101_005
	ScrDef scr_seq_T11R0101_006
	ScrDef scr_seq_T11R0101_007
	ScrDef scr_seq_T11R0101_008
	ScrDef scr_seq_T11R0101_009
	ScrDef scr_seq_T11R0101_010
	ScrDef scr_seq_T11R0101_011
	ScrDef scr_seq_T11R0101_012
	ScrDef scr_seq_T11R0101_013
	ScrDef scr_seq_T11R0101_014
	ScrDef scr_seq_T11R0101_015
	ScrDef scr_seq_T11R0101_016
	ScrDef scr_seq_T11R0101_017
	ScrDef scr_seq_T11R0101_018
	ScrDef scr_seq_T11R0101_019
	ScrDefEnd

scr_seq_T11R0101_003:
	GetPhoneBookRematch PHONE_CONTACT_WHITNEY, VAR_TEMP_x4000
	GetPhoneBookRematch PHONE_CONTACT_JANINE, VAR_TEMP_x4001
	GetPhoneBookRematch PHONE_CONTACT_CLAIR, VAR_TEMP_x4002
	GetPhoneBookRematch PHONE_CONTACT_ERIKA, VAR_TEMP_x4003
	GetPhoneBookRematch PHONE_CONTACT_MISTY, VAR_TEMP_x4004
	GetPhoneBookRematch PHONE_CONTACT_BLAINE, VAR_TEMP_x4005
	GetPhoneBookRematch PHONE_CONTACT_BLUE, VAR_TEMP_x4006
	GetPhoneBookRematch PHONE_CONTACT_CHUCK, VAR_TEMP_x4007
	GetPhoneBookRematch PHONE_CONTACT_BROCK, VAR_TEMP_x4008
	GetPhoneBookRematch PHONE_CONTACT_BUGSY, VAR_TEMP_x4009
	GetPhoneBookRematch PHONE_CONTACT_SABRINA, VAR_TEMP_x400A
	GetPhoneBookRematch PHONE_CONTACT_FALKNER, VAR_TEMP_x400B
	GetPhoneBookRematch PHONE_CONTACT_LT__SURGE, VAR_TEMP_x400C
	GetPhoneBookRematch PHONE_CONTACT_MORTY, VAR_TEMP_x400D
	GetPhoneBookRematch PHONE_CONTACT_JASMINE, VAR_TEMP_x400E
	GetPhoneBookRematch PHONE_CONTACT_PRYCE, VAR_TEMP_x400F
	Compare VAR_TEMP_x4003, 0
	GoToIfNe _00C9
	SetFlag FLAG_UNK_2B8
	GoTo _00CD

_00C9:
	ClearFlag FLAG_UNK_2B8
_00CD:
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _00E4
	SetFlag FLAG_UNK_2B5
	GoTo _00E8

_00E4:
	ClearFlag FLAG_UNK_2B5
_00E8:
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _00FF
	SetFlag FLAG_UNK_2B6
	GoTo _0103

_00FF:
	ClearFlag FLAG_UNK_2B6
_0103:
	Compare VAR_TEMP_x4002, 0
	GoToIfNe _011A
	SetFlag FLAG_UNK_2B7
	GoTo _011E

_011A:
	ClearFlag FLAG_UNK_2B7
_011E:
	Compare VAR_TEMP_x4004, 0
	GoToIfNe _0135
	SetFlag FLAG_UNK_2B9
	GoTo _0139

_0135:
	ClearFlag FLAG_UNK_2B9
_0139:
	Compare VAR_TEMP_x4005, 0
	GoToIfNe _0150
	SetFlag FLAG_UNK_2BA
	GoTo _0154

_0150:
	ClearFlag FLAG_UNK_2BA
_0154:
	Compare VAR_TEMP_x4006, 0
	GoToIfNe _016B
	SetFlag FLAG_UNK_2BB
	GoTo _016F

_016B:
	ClearFlag FLAG_UNK_2BB
_016F:
	Compare VAR_TEMP_x4007, 0
	GoToIfNe _0186
	SetFlag FLAG_UNK_2BC
	GoTo _018A

_0186:
	ClearFlag FLAG_UNK_2BC
_018A:
	Compare VAR_TEMP_x4008, 0
	GoToIfNe _01A1
	SetFlag FLAG_UNK_2BD
	GoTo _01A5

_01A1:
	ClearFlag FLAG_UNK_2BD
_01A5:
	Compare VAR_TEMP_x4009, 0
	GoToIfNe _01BC
	SetFlag FLAG_UNK_2BE
	GoTo _01C0

_01BC:
	ClearFlag FLAG_UNK_2BE
_01C0:
	Compare VAR_TEMP_x400A, 0
	GoToIfNe _01D7
	SetFlag FLAG_UNK_2BF
	GoTo _01DB

_01D7:
	ClearFlag FLAG_UNK_2BF
_01DB:
	Compare VAR_TEMP_x400B, 0
	GoToIfNe _01F2
	SetFlag FLAG_UNK_2C0
	GoTo _01F6

_01F2:
	ClearFlag FLAG_UNK_2C0
_01F6:
	Compare VAR_TEMP_x400C, 0
	GoToIfNe _020D
	SetFlag FLAG_UNK_2C1
	GoTo _0211

_020D:
	ClearFlag FLAG_UNK_2C1
_0211:
	Compare VAR_TEMP_x400D, 0
	GoToIfNe _0228
	SetFlag FLAG_UNK_2C2
	GoTo _022C

_0228:
	ClearFlag FLAG_UNK_2C2
_022C:
	Compare VAR_TEMP_x400E, 0
	GoToIfNe _0243
	SetFlag FLAG_UNK_2C3
	GoTo _0247

_0243:
	ClearFlag FLAG_UNK_2C3
_0247:
	Compare VAR_TEMP_x400F, 0
	GoToIfNe _025E
	SetFlag FLAG_UNK_2C4
	GoTo _0262

_025E:
	ClearFlag FLAG_UNK_2C4
_0262:
	End

scr_seq_T11R0101_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0533_T11R0101_00008
	CloseMsg
	TrainerBattle TRAINER_LEADER_WHITNEY_2, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _02C1
	NPCMsg msg_0533_T11R0101_00009
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_462 17
	SetFlag FLAG_UNK_2B5
	HidePerson obj_T11R0101_gsleader3
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_02C1:
	WhiteOut
	ReleaseAll
	End

scr_seq_T11R0101_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0533_T11R0101_00030
	CloseMsg
	TrainerBattle TRAINER_LEADER_JANINE_JANINE_2, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0324
	NPCMsg msg_0533_T11R0101_00031
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_462 26
	SetFlag FLAG_UNK_2B6
	HidePerson obj_T11R0101_gsleader13
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_0324:
	WhiteOut
	ReleaseAll
	End

scr_seq_T11R0101_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0533_T11R0101_00018
	CloseMsg
	TrainerBattle TRAINER_LEADER_CLAIR_CLAIR_2, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0387
	NPCMsg msg_0533_T11R0101_00019
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_462 27
	SetFlag FLAG_UNK_2B7
	HidePerson obj_T11R0101_gsleader8
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_0387:
	WhiteOut
	ReleaseAll
	End

scr_seq_T11R0101_007:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0533_T11R0101_00024
	CloseMsg
	TrainerBattle TRAINER_LEADER_ERIKA_ERIKA_2, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _03EA
	NPCMsg msg_0533_T11R0101_00025
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_462 28
	SetFlag FLAG_UNK_2B8
	HidePerson obj_T11R0101_gsleader12
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_03EA:
	WhiteOut
	ReleaseAll
	End

scr_seq_T11R0101_008:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0533_T11R0101_00026
	CloseMsg
	TrainerBattle TRAINER_LEADER_MISTY_MISTY_2, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _044D
	NPCMsg msg_0533_T11R0101_00027
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_462 29
	SetFlag FLAG_UNK_2B9
	HidePerson obj_T11R0101_gsleader11
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_044D:
	WhiteOut
	ReleaseAll
	End

scr_seq_T11R0101_009:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0533_T11R0101_00032
	CloseMsg
	TrainerBattle TRAINER_LEADER_BLAINE_BLAINE_2, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _04B0
	NPCMsg msg_0533_T11R0101_00033
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_462 30
	SetFlag FLAG_UNK_2BA
	HidePerson obj_T11R0101_gsleader15
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_04B0:
	WhiteOut
	ReleaseAll
	End

scr_seq_T11R0101_010:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0533_T11R0101_00034
	CloseMsg
	TrainerBattle TRAINER_LEADER_BLUE_BLUE_2, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0513
	NPCMsg msg_0533_T11R0101_00035
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_462 31
	SetFlag FLAG_UNK_2BB
	HidePerson obj_T11R0101_gsleader16
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_0513:
	WhiteOut
	ReleaseAll
	End

scr_seq_T11R0101_011:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0533_T11R0101_00010
	CloseMsg
	TrainerBattle TRAINER_LEADER_CHUCK_CHUCK_2, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0576
	NPCMsg msg_0533_T11R0101_00011
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_462 32
	SetFlag FLAG_UNK_2BC
	HidePerson obj_T11R0101_gsleader5
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_0576:
	WhiteOut
	ReleaseAll
	End

scr_seq_T11R0101_012:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0533_T11R0101_00028
	CloseMsg
	TrainerBattle TRAINER_LEADER_BROCK_BROCK_2, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _05D9
	NPCMsg msg_0533_T11R0101_00029
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_462 33
	SetFlag FLAG_UNK_2BD
	HidePerson obj_T11R0101_gsleader14
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_05D9:
	WhiteOut
	ReleaseAll
	End

scr_seq_T11R0101_013:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0533_T11R0101_00006
	CloseMsg
	TrainerBattle TRAINER_LEADER_BUGSY_BUGSY_2, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _063C
	NPCMsg msg_0533_T11R0101_00007
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_462 34
	SetFlag FLAG_UNK_2BE
	HidePerson obj_T11R0101_gsleader2
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_063C:
	WhiteOut
	ReleaseAll
	End

scr_seq_T11R0101_014:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0533_T11R0101_00022
	CloseMsg
	TrainerBattle TRAINER_LEADER_SABRINA_SABRINA_2, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _069F
	NPCMsg msg_0533_T11R0101_00023
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_462 35
	SetFlag FLAG_UNK_2BF
	HidePerson obj_T11R0101_gsleader10
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_069F:
	WhiteOut
	ReleaseAll
	End

scr_seq_T11R0101_015:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0533_T11R0101_00004
	CloseMsg
	TrainerBattle TRAINER_LEADER_FALKNER_FALKNER_2, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0702
	NPCMsg msg_0533_T11R0101_00005
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_462 18
	SetFlag FLAG_UNK_2C0
	HidePerson obj_T11R0101_gsleader1
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_0702:
	WhiteOut
	ReleaseAll
	End

scr_seq_T11R0101_016:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0533_T11R0101_00020
	CloseMsg
	TrainerBattle TRAINER_LEADER_LT_SURGE_LT__SURGE_2, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0765
	NPCMsg msg_0533_T11R0101_00021
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_462 36
	SetFlag FLAG_UNK_2C1
	HidePerson obj_T11R0101_gsleader9
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_0765:
	WhiteOut
	ReleaseAll
	End

scr_seq_T11R0101_017:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0533_T11R0101_00014
	CloseMsg
	TrainerBattle TRAINER_LEADER_MORTY_MORTY_2, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _07C8
	NPCMsg msg_0533_T11R0101_00015
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_462 37
	SetFlag FLAG_UNK_2C2
	HidePerson obj_T11R0101_gsleader4
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_07C8:
	WhiteOut
	ReleaseAll
	End

scr_seq_T11R0101_018:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0533_T11R0101_00012
	CloseMsg
	TrainerBattle TRAINER_LEADER_JASMINE_JASMINE_2, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _082B
	NPCMsg msg_0533_T11R0101_00013
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_462 38
	SetFlag FLAG_UNK_2C3
	HidePerson obj_T11R0101_gsleader6
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_082B:
	WhiteOut
	ReleaseAll
	End

scr_seq_T11R0101_019:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0533_T11R0101_00016
	CloseMsg
	TrainerBattle TRAINER_LEADER_PRYCE_PRYCE_2, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _088E
	NPCMsg msg_0533_T11R0101_00017
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_462 39
	SetFlag FLAG_UNK_2C4
	HidePerson obj_T11R0101_gsleader7
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_088E:
	WhiteOut
	ReleaseAll
	End

scr_seq_T11R0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_BEAT_KARATE_KING, _08B2
	NPCMsg msg_0533_T11R0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_08B2:
	NPCMsg msg_0533_T11R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T11R0101_001:
	SimpleNPCMsg msg_0533_T11R0101_00002
	End

scr_seq_T11R0101_002:
	SimpleNPCMsg msg_0533_T11R0101_00003
	End
	.balign 4, 0
