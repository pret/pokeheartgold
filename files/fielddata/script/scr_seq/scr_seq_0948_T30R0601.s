#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T30R0601.h"
#include "msgdata/msg/msg_0635_T30R0601.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T30R0601_000
	ScrDef scr_seq_T30R0601_001
	ScrDef scr_seq_T30R0601_002
	ScrDef scr_seq_T30R0601_003
	ScrDef scr_seq_T30R0601_004
	ScrDefEnd

scr_seq_T30R0601_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_MAPTEMP_001, _0036
	NPCMsg msg_0635_T30R0601_00000
	SetFlag FLAG_MAPTEMP_001
	GoTo _0036

_0036:
	NPCMsg msg_0635_T30R0601_00001
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _005D
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _014A
	End

_005D:
	NPCMsg msg_0635_T30R0601_00002
	CloseMsg
	GoTo _0068

_0068:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	PartySelectUI
	GetPartySelection VAR_SPECIAL_x8002
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_x8002, 255
	GoToIfEq _014A
	GetPartyMonSpecies VAR_SPECIAL_x8002, VAR_SPECIAL_x8001
	Compare VAR_SPECIAL_x8001, 0
	GoToIfEq _0134
	CountMonMoves VAR_SPECIAL_RESULT, VAR_SPECIAL_x8002
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _013F
	NPCMsg msg_0635_T30R0601_00006
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_394 VAR_SPECIAL_x8002
	ScrCmd_395 VAR_SPECIAL_x8001
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_x8001, 255
	GoToIfEq _005D
	BufferPartyMonMoveName 0, VAR_SPECIAL_x8002, VAR_SPECIAL_x8001
	NPCMsg msg_0635_T30R0601_00007
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _011D
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _005D
	End

_011D:
	MonForgetMove VAR_SPECIAL_x8002, VAR_SPECIAL_x8001
	PlayFanfare SEQ_ME_WASURE
	WaitFanfare
	NPCMsg msg_0635_T30R0601_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0134:
	NPCMsg msg_0635_T30R0601_00005
	CloseMsg
	GoTo _0068

_013F:
	NPCMsg msg_0635_T30R0601_00004
	CloseMsg
	GoTo _0068

_014A:
	NPCMsg msg_0635_T30R0601_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T30R0601_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfUnset FLAG_MET_MOVE_MANIAC, _0238
	HasItem ITEM_HEART_SCALE, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _022D
	NPCMsg msg_0635_T30R0601_00010
	NPCMsg msg_0635_T30R0601_00012
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	PartySelectUI
	GetPartySelection VAR_SPECIAL_x8005
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_x8005, 255
	GoToIfEq _022D
	GetPartyMonSpecies VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0247
	ScrCmd_466 VAR_SPECIAL_RESULT, VAR_SPECIAL_x8005
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0222
	NPCMsg msg_0635_T30R0601_00013
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	MoveRelearnerInit VAR_SPECIAL_x8005
	MoveRelearnerGetResult VAR_SPECIAL_RESULT
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _022D
	TakeItem ITEM_HEART_SCALE, 1, VAR_SPECIAL_RESULT
	BufferPlayersName 3
	NPCMsg msg_0635_T30R0601_00025
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0222:
	NPCMsg msg_0635_T30R0601_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

_022D:
	NPCMsg msg_0635_T30R0601_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0238:
	NPCMsg msg_0635_T30R0601_00009
	WaitButton
	CloseMsg
	ReleaseAll
	SetFlag FLAG_MET_MOVE_MANIAC
	End

_0247:
	NPCMsg msg_0635_T30R0601_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T30R0601_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_186, _0287
	SetFlag FLAG_UNK_186
	NPCMsg msg_0635_T30R0601_00026
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _02A5
	GoTo _02EC

_0287:
	NPCMsg msg_0635_T30R0601_00027
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _02A5
	GoTo _02EC

_02A5:
	NPCMsg msg_0635_T30R0601_00028
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02B0:
	NPCMsg msg_0635_T30R0601_00029
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02BB:
	NPCMsg msg_0635_T30R0601_00032
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02C6:
	NPCMsg msg_0635_T30R0601_00033
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02D1:
	BufferMoveName 0, MOVE_DRACO_METEOR
	NPCMsg msg_0635_T30R0601_00034
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02E1:
	NPCMsg msg_0635_T30R0601_00031
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02EC:
	GetPartyCount VAR_TEMP_x4000
_02F0:
	SubVar VAR_TEMP_x4000, 1
	GetPartyMonSpecies VAR_TEMP_x4000, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0346
	GetMonTypes VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_TEMP_x4000
	Compare VAR_SPECIAL_x8004, 16
	GoToIfEq _0331
	Compare VAR_SPECIAL_x8005, 16
	GoToIfEq _0331
	GoTo _0346

_0331:
	MonHasMove VAR_SPECIAL_RESULT, MOVE_DRACO_METEOR, VAR_TEMP_x4000
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0359
_0346:
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _02F0
	GoTo _02B0

_0359:
	NPCMsg msg_0635_T30R0601_00030
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	PartySelectUI
	GetPartySelection VAR_SPECIAL_x8000
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_x8000, 255
	GoToIfEq _02A5
	GetPartyMonSpecies VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	Compare VAR_SPECIAL_x8001, 0
	GoToIfEq _02C6
	Call _042B
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _02BB
	MonHasMove VAR_SPECIAL_RESULT, MOVE_DRACO_METEOR, VAR_SPECIAL_x8000
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _02D1
	MonGetFriendship VAR_SPECIAL_RESULT, VAR_SPECIAL_x8000
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfLt _02E1
	BufferMonSpeciesName 0, VAR_SPECIAL_x8000
	NPCMsg msg_0635_T30R0601_00062
	CloseMsg
	SetVar VAR_SPECIAL_x8003, 434
	GoTo _03EF

_03EF:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	MoveTutorInit VAR_SPECIAL_x8000, MOVE_DRACO_METEOR
	MoveRelearnerGetResult VAR_SPECIAL_RESULT
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _02A5
	NPCMsg msg_0635_T30R0601_00042
	WaitButton
	CloseMsg
	ReleaseAll
	End

_042B:
	GetMonTypes VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x8000
	Compare VAR_SPECIAL_x8004, 16
	GoToIfEq _0455
	Compare VAR_SPECIAL_x8005, 16
	GoToIfEq _0455
	SetVar VAR_SPECIAL_RESULT, 0
	Return

_0455:
	SetVar VAR_SPECIAL_RESULT, 1
	Return

scr_seq_T30R0601_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_187, _0490
	SetFlag FLAG_UNK_187
	NPCMsg msg_0635_T30R0601_00043
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _04AC
	GoTo _06EE

_0490:
	NPCMsg msg_0635_T30R0601_00044
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _04AC
	GoTo _06EE

_04AC:
	NPCMsg msg_0635_T30R0601_00045
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	PartySelectUI
	GetPartySelection VAR_SPECIAL_x8000
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_x8000, 255
	GoToIfEq _06EE
	GetPartyMonSpecies VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	Compare VAR_SPECIAL_x8001, 0
	GoToIfEq _0708
	Call _05F4
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _06FB
	CopyVar VAR_SPECIAL_x8002, VAR_SPECIAL_RESULT
	Call _06B0
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0722
	MonGetFriendship VAR_SPECIAL_RESULT, VAR_SPECIAL_x8000
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfLt _0715
	BufferMonSpeciesName 0, VAR_SPECIAL_x8000
	Compare VAR_SPECIAL_x8002, 1
	GoToIfEq _0555
	Compare VAR_SPECIAL_x8002, 2
	GoToIfEq _0577
	GoTo _0599

_0555:
	NPCMsg msg_0635_T30R0601_00052
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _06EE
	SetVar VAR_SPECIAL_x8003, 307
	GoTo _05BB

_0577:
	NPCMsg msg_0635_T30R0601_00053
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _06EE
	SetVar VAR_SPECIAL_x8003, 308
	GoTo _05BB

_0599:
	NPCMsg msg_0635_T30R0601_00054
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _06EE
	SetVar VAR_SPECIAL_x8003, 338
	GoTo _05BB

_05BB:
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	MoveTutorInit VAR_SPECIAL_x8000, VAR_SPECIAL_x8003
	MoveRelearnerGetResult VAR_SPECIAL_RESULT
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _06EE
	TouchscreenMenuShow
	ReleaseAll
	End

_05F4:
	Compare VAR_SPECIAL_x8001, 6
	GoToIfEq _0698
	Compare VAR_SPECIAL_x8001, 157
	GoToIfEq _0698
	Compare VAR_SPECIAL_x8001, 257
	GoToIfEq _0698
	Compare VAR_SPECIAL_x8001, 392
	GoToIfEq _0698
	Compare VAR_SPECIAL_x8001, 9
	GoToIfEq _06A0
	Compare VAR_SPECIAL_x8001, 160
	GoToIfEq _06A0
	Compare VAR_SPECIAL_x8001, 260
	GoToIfEq _06A0
	Compare VAR_SPECIAL_x8001, 395
	GoToIfEq _06A0
	Compare VAR_SPECIAL_x8001, 3
	GoToIfEq _06A8
	Compare VAR_SPECIAL_x8001, 154
	GoToIfEq _06A8
	Compare VAR_SPECIAL_x8001, 254
	GoToIfEq _06A8
	Compare VAR_SPECIAL_x8001, 389
	GoToIfEq _06A8
	SetVar VAR_SPECIAL_RESULT, 0
	Return

_0698:
	SetVar VAR_SPECIAL_RESULT, 1
	Return

_06A0:
	SetVar VAR_SPECIAL_RESULT, 2
	Return

_06A8:
	SetVar VAR_SPECIAL_RESULT, 3
	Return

_06B0:
	Compare VAR_SPECIAL_x8002, 1
	GoToIfEq _06D0
	Compare VAR_SPECIAL_x8002, 2
	GoToIfEq _06DA
	GoTo _06E4

_06D0:
	MonHasMove VAR_SPECIAL_RESULT, MOVE_BLAST_BURN, VAR_SPECIAL_x8000
	Return

_06DA:
	MonHasMove VAR_SPECIAL_RESULT, MOVE_HYDRO_CANNON, VAR_SPECIAL_x8000
	Return

_06E4:
	MonHasMove VAR_SPECIAL_RESULT, MOVE_FRENZY_PLANT, VAR_SPECIAL_x8000
	Return

_06EE:
	NPCMsg msg_0635_T30R0601_00046
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	End

_06FB:
	NPCMsg msg_0635_T30R0601_00048
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	End

_0708:
	NPCMsg msg_0635_T30R0601_00049
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	End

_0715:
	NPCMsg msg_0635_T30R0601_00050
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	End

_0722:
	NPCMsg msg_0635_T30R0601_00051
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	End

scr_seq_T30R0601_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0635_T30R0601_00061
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
