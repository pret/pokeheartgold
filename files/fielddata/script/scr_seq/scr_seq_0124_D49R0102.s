#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D49R0102.h"
#include "msgdata/msg/msg_0139_D49R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D49R0102_000
	ScrDef scr_seq_D49R0102_001
	ScrDef scr_seq_D49R0102_002
	ScrDef scr_seq_D49R0102_003
	ScrDef scr_seq_D49R0102_004
	ScrDef scr_seq_D49R0102_005
	ScrDef scr_seq_D49R0102_006
	ScrDef scr_seq_D49R0102_007
	ScrDef scr_seq_D49R0102_008
	ScrDef scr_seq_D49R0102_009
	ScrDef scr_seq_D49R0102_010
	ScrDef scr_seq_D49R0102_011
	ScrDef scr_seq_D49R0102_012
	ScrDef scr_seq_D49R0102_013
	ScrDef scr_seq_D49R0102_014
	ScrDef scr_seq_D49R0102_015
	ScrDef scr_seq_D49R0102_016
	ScrDefEnd

scr_seq_D49R0102_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	StopSE SEQ_SE_GS_N_KANSEI
	CallStd std_play_mom_music
	GoToIfUnset FLAG_UNK_0FA, _006A
	NPCMsg msg_0139_D49R0102_00001
	GoTo _0071

_006A:
	NPCMsg msg_0139_D49R0102_00000
	SetFlag FLAG_UNK_0FA
_0071:
	NPCMsg msg_0139_D49R0102_00002
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 272, 255, 0
	MenuItemAdd 296, 255, 1
	MenuItemAdd 297, 255, 2
	MenuItemAdd 12, 255, 3
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _03C5
	Case 1, _00D5
	Case 2, _03D0
	GoTo _03DB
	End

_00D5:
	NPCMsg msg_0139_D49R0102_00003
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 308, 255, 0
	MenuItemAdd 309, 255, 1
	MenuItemAdd 310, 255, 2
	MenuItemAdd 311, 255, 3
	MenuItemAdd 312, 255, 4
	MenuItemAdd 13, 255, 5
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 5, _0071
	NPCMsg msg_0139_D49R0102_00004
	Case 0, _0166
	Case 1, _01A0
	Case 2, _01DA
	Case 3, _0214
	GoTo _024E
	End

_0166:
	SetVar VAR_TEMP_x4007, 0
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 298, 255, 0
	MenuItemAdd 299, 255, 1
	MenuItemAdd 304, 255, 6
	MenuItemAdd 13, 255, 10
	MenuExec
	GoTo _0288
	End

_01A0:
	SetVar VAR_TEMP_x4007, 1
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 301, 255, 3
	MenuItemAdd 300, 255, 2
	MenuItemAdd 307, 255, 9
	MenuItemAdd 13, 255, 10
	MenuExec
	GoTo _0288
	End

_01DA:
	SetVar VAR_TEMP_x4007, 2
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 306, 255, 8
	MenuItemAdd 307, 255, 9
	MenuItemAdd 299, 255, 1
	MenuItemAdd 13, 255, 10
	MenuExec
	GoTo _0288
	End

_0214:
	SetVar VAR_TEMP_x4007, 3
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 305, 255, 7
	MenuItemAdd 304, 255, 6
	MenuItemAdd 301, 255, 3
	MenuItemAdd 13, 255, 10
	MenuExec
	GoTo _0288
	End

_024E:
	SetVar VAR_TEMP_x4007, 4
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 303, 255, 5
	MenuItemAdd 302, 255, 4
	MenuItemAdd 298, 255, 0
	MenuItemAdd 13, 255, 10
	MenuExec
	GoTo _0288
	End

_0288:
	Switch VAR_SPECIAL_RESULT
	Case 0, _0318
	Case 1, _0323
	Case 2, _032E
	Case 3, _0339
	Case 4, _0344
	Case 5, _034F
	Case 6, _035A
	Case 7, _0365
	Case 8, _0370
	Case 9, _037B
	GoTo _00D5
	End

_0318:
	NPCMsg msg_0139_D49R0102_00006
	GoTo _0386
	End

_0323:
	NPCMsg msg_0139_D49R0102_00007
	GoTo _0386
	End

_032E:
	NPCMsg msg_0139_D49R0102_00008
	GoTo _0386
	End

_0339:
	NPCMsg msg_0139_D49R0102_00009
	GoTo _0386
	End

_0344:
	NPCMsg msg_0139_D49R0102_00010
	GoTo _0386
	End

_034F:
	NPCMsg msg_0139_D49R0102_00011
	GoTo _0386
	End

_035A:
	NPCMsg msg_0139_D49R0102_00012
	GoTo _0386
	End

_0365:
	NPCMsg msg_0139_D49R0102_00013
	GoTo _0386
	End

_0370:
	NPCMsg msg_0139_D49R0102_00014
	GoTo _0386
	End

_037B:
	NPCMsg msg_0139_D49R0102_00015
	GoTo _0386
	End

_0386:
	NPCMsg msg_0139_D49R0102_00004
	Compare VAR_TEMP_x4007, 0
	GoToIfEq _0166
	Compare VAR_TEMP_x4007, 1
	GoToIfEq _01A0
	Compare VAR_TEMP_x4007, 2
	GoToIfEq _01DA
	Compare VAR_TEMP_x4007, 3
	GoToIfEq _0214
	GoTo _024E
	End

_03C5:
	NPCMsg msg_0139_D49R0102_00005
	GoTo _0071
	End

_03D0:
	NPCMsg msg_0139_D49R0102_00017
	GoTo _0071
	End

_03DB:
	NPCMsg msg_0139_D49R0102_00016
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	StopBGM 0
	ResetBGM
	ScrCmd_726
	ReleaseAll
	End

scr_seq_D49R0102_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScrCmd_724 11, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 500
	GoToIfLt _0417
	BufferPlayersName 0
	NPCMsg msg_0139_D49R0102_00025
	GoTo _041A

_0417:
	NPCMsg msg_0139_D49R0102_00024
_041A:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49R0102_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScrCmd_724 11, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 51
	GoToIfLt _0449
	BufferPlayersName 0
	NPCMsg msg_0139_D49R0102_00027
	GoTo _044C

_0449:
	NPCMsg msg_0139_D49R0102_00026
_044C:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49R0102_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScrCmd_724 11, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 150
	GoToIfLt _047B
	BufferPlayersName 0
	NPCMsg msg_0139_D49R0102_00029
	GoTo _047E

_047B:
	NPCMsg msg_0139_D49R0102_00028
_047E:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49R0102_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScrCmd_724 11, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1000
	GoToIfLt _04AD
	BufferPlayersName 0
	NPCMsg msg_0139_D49R0102_00031
	GoTo _04B0

_04AD:
	NPCMsg msg_0139_D49R0102_00030
_04B0:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49R0102_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScrCmd_724 11, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 10001
	GoToIfLt _04DF
	BufferPlayersName 0
	NPCMsg msg_0139_D49R0102_00033
	GoTo _04E2

_04DF:
	NPCMsg msg_0139_D49R0102_00032
_04E2:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49R0102_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScrCmd_724 11, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 75
	GoToIfLt _0511
	BufferPlayersName 0
	NPCMsg msg_0139_D49R0102_00035
	GoTo _0514

_0511:
	NPCMsg msg_0139_D49R0102_00034
_0514:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49R0102_007:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScrCmd_724 11, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 26
	GoToIfLt _0544
	BufferPlayersName 0
	GenderMsgBox msg_0139_D49R0102_00037, msg_0139_D49R0102_00038
	GoTo _0547

_0544:
	NPCMsg msg_0139_D49R0102_00036
_0547:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49R0102_008:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScrCmd_724 11, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 20001
	GoToIfLt _0576
	BufferPlayersName 0
	NPCMsg msg_0139_D49R0102_00040
	GoTo _0579

_0576:
	NPCMsg msg_0139_D49R0102_00039
_0579:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49R0102_009:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScrCmd_724 11, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 800
	GoToIfLt _05A5
	NPCMsg msg_0139_D49R0102_00043
	GoTo _05A8

_05A5:
	NPCMsg msg_0139_D49R0102_00041
_05A8:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49R0102_010:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScrCmd_724 11, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 800
	GoToIfLt _05D7
	BufferPlayersName 0
	NPCMsg msg_0139_D49R0102_00046
	GoTo _05DA

_05D7:
	NPCMsg msg_0139_D49R0102_00045
_05DA:
	CloseMsg
	ApplyMovement obj_D49R0102_gsmiddleman1, _0610
	WaitMovement
	Compare VAR_TEMP_x4000, 800
	GoToIfLt _05FC
	NPCMsg msg_0139_D49R0102_00044
	GoTo _05FF

_05FC:
	NPCMsg msg_0139_D49R0102_00042
_05FF:
	CloseMsg
	ApplyMovement obj_D49R0102_gsmiddleman1, _0618
	WaitMovement
	ReleaseAll
	End

	.balign 4, 0
_0610:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0618:
	WalkOnSpotNormalNorth
	EndMovement

scr_seq_D49R0102_011:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScrCmd_724 11, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 201
	GoToIfLt _0647
	BufferPlayersName 0
	NPCMsg msg_0139_D49R0102_00048
	GoTo _064A

_0647:
	NPCMsg msg_0139_D49R0102_00047
_064A:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49R0102_012:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScrCmd_724 11, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 250
	GoToIfLt _0679
	BufferPlayersName 0
	NPCMsg msg_0139_D49R0102_00050
	GoTo _067C

_0679:
	NPCMsg msg_0139_D49R0102_00049
_067C:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49R0102_013:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScrCmd_724 11, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 101
	GoToIfLt _06AB
	BufferPlayersName 0
	NPCMsg msg_0139_D49R0102_00052
	GoTo _06AE

_06AB:
	NPCMsg msg_0139_D49R0102_00051
_06AE:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49R0102_014:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScrCmd_724 11, VAR_TEMP_x4000
	PlayCry SPECIES_RATTATA, 0
	Compare VAR_TEMP_x4000, 15000
	GoToIfLt _06E3
	BufferPlayersName 0
	NPCMsg msg_0139_D49R0102_00019
	GoTo _06E6

_06E3:
	NPCMsg msg_0139_D49R0102_00018
_06E6:
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49R0102_015:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScrCmd_724 11, VAR_TEMP_x4000
	PlayCry SPECIES_MACHOP, 0
	Compare VAR_TEMP_x4000, 15000
	GoToIfLt _071D
	BufferPlayersName 0
	NPCMsg msg_0139_D49R0102_00021
	GoTo _0720

_071D:
	NPCMsg msg_0139_D49R0102_00020
_0720:
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49R0102_016:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScrCmd_724 11, VAR_TEMP_x4000
	PlayCry SPECIES_BUTTERFREE, 0
	Compare VAR_TEMP_x4000, 15000
	GoToIfLt _0757
	BufferPlayersName 0
	NPCMsg msg_0139_D49R0102_00023
	GoTo _075A

_0757:
	NPCMsg msg_0139_D49R0102_00022
_075A:
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
