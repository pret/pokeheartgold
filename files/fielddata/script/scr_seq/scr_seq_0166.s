#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0166.h"
#include "msgdata/msg/msg_0043.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_0166_000
	ScrDef scr_seq_0166_001
	ScrDef scr_seq_0166_002
	ScrDef scr_seq_0166_003
	ScrDef scr_seq_0166_004
	ScrDef scr_seq_0166_005
	ScrDef scr_seq_0166_006
	ScrDef scr_seq_0166_007
	ScrDef scr_seq_0166_008
	ScrDef scr_seq_0166_009
	ScrDef scr_seq_0166_010
	ScrDef scr_seq_0166_011
	ScrDef scr_seq_0166_012
	ScrDefEnd

scr_seq_0166_000:
	ScrCmd_609
	LockAll
	SetVar VAR_SPECIAL_RESULT, 7
	ClearFlag FLAG_UNK_966
	SetVar VAR_UNK_4133, 0
	ReleaseAll
	End

scr_seq_0166_001:
	End

scr_seq_0166_002:
	End

_0052:
	Return

scr_seq_0166_003:
	ScrCmd_521
	Call _0064
	Call _0052
	End

_0064:
	Return
	Return
scr_seq_0166_004:
	End
	MakeObjectVisible 0xFF
	Return
scr_seq_0166_005:
	SimpleNPCMsg msg_0043_00000
	End

scr_seq_0166_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_TEMP_x4003, 0
	SetVar VAR_SPECIAL_x8007, 2
	NPCMsg msg_0043_00003
	GoTo _00C1
	End
scr_seq_0166_007:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_TEMP_x4003, 1
	SetVar VAR_SPECIAL_x8007, 2
	NPCMsg msg_0043_00007
	GoTo _00C1
	End
_00C1:
	Compare VAR_TEMP_x4003, 1
	GoToIfEq _00D7
	NPCMsg msg_0043_00004
	GoTo _00DA

_00D7:
	NPCMsg msg_0043_00012
_00DA:
	ScrCmd_065 1, 1, 0, 1, VAR_SPECIAL_RESULT
	ScrCmd_066 msg_0043_00008, 0
	ScrCmd_066 msg_0043_00009, 1
	ScrCmd_066 msg_0043_00010, 2
	ScrCmd_067
	Switch VAR_SPECIAL_RESULT
	Case 0, _012F
	Case 1, _0137
	GoTo _0118
	End
_0118:
	ScrCmd_283
	SetVar VAR_UNK_4133, 0
	ClearFlag FLAG_UNK_966
	NPCMsg msg_0043_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

_012F:
	GoTo _0254
	End
_0137:
	Compare VAR_TEMP_x4003, 1
	GoToIfEq _014C
	GoTo _0155
	End
_014C:
	NPCMsg msg_0043_00013
	GoTo _00C1

_0155:
	NPCMsg msg_0043_00005
_0158:
	ScrCmd_064 1, 1, 0, 1, VAR_SPECIAL_RESULT
	ScrCmd_066 msg_0043_00096, 0
	ScrCmd_066 msg_0043_00097, 1
	ScrCmd_066 msg_0043_00098, 2
	ScrCmd_066 msg_0043_00099, 3
	ScrCmd_067
	Switch VAR_SPECIAL_RESULT
	Case 0, _01A7
	Case 1, _01AF
	Case 2, _01BA
	GoTo _00C1
	End
_01A7:
	GoTo _01C8
	End
_01AF:
	NPCMsg msg_0043_00018
	GoTo _0155
	End
_01BA:
	NPCMsg msg_0043_00019
	GoTo _0155
	End
_01C5:
	NPCMsg msg_0043_00117
_01C8:
	ScrCmd_065 1, 1, 0, 1, VAR_SPECIAL_RESULT
	ScrCmd_066 msg_0043_00036, 0
	ScrCmd_066 msg_0043_00037, 1
	ScrCmd_066 msg_0043_00038, 2
	ScrCmd_066 msg_0043_00039, 3
	ScrCmd_066 msg_0043_00040, 4
	ScrCmd_067
	Switch VAR_SPECIAL_RESULT
	Case 0, _0228
	Case 1, _0233
	Case 2, _023E
	Case 3, _0249
	GoTo _0158
	End
_0228:
	NPCMsg msg_0043_00014
	GoTo _01C5
	End
_0233:
	NPCMsg msg_0043_00015
	GoTo _01C5
	End
_023E:
	NPCMsg msg_0043_00016
	GoTo _01C5
	End
_0249:
	NPCMsg msg_0043_00017
	GoTo _01C5
	End
_0254:
	NPCMsg msg_0043_00219
	ScrCmd_064 18, 1, 0, 1, VAR_SPECIAL_RESULT
	ScrCmd_066 msg_0043_00014, 0
	ScrCmd_066 msg_0043_00015, 1
	ScrCmd_066 msg_0043_00005, 2
	ScrCmd_067
	Switch VAR_SPECIAL_RESULT
	Case 0, _0295
	Case 1, _02E7
	GoTo _0118
	End
_0295:
	NPCMsg msg_0043_00212
	YesNo VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0254
	CloseMsg
	ScrCmd_226 8, VAR_SPECIAL_x8005, VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _02D7
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _02DF
	GoTo _0339
	End
_02D7:
	GoTo _0254
	End
_02DF:
	GoTo _0254
	End
_02E7:
	NPCMsg msg_0043_00212
	YesNo VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0254
	CloseMsg
	ScrCmd_227 8, VAR_SPECIAL_x8005, VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0329
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _0331
	GoTo _0339
	End
_0329:
	GoTo _0254
	End
_0331:
	ScrCmd_283
	CloseMsg
	ReleaseAll
	End

_0339:
	ScrCmd_234 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x8007, VAR_TEMP_x4002
	ScrCmd_232 25
	ScrCmd_233 25
_0347:
	Compare VAR_TEMP_x4003, 0
	GoToIfEq _038D
	Compare VAR_TEMP_x4003, 1
	GoToIfEq _0395
	Compare VAR_TEMP_x4003, 2
	GoToIfEq _03A7
	End
	ScrCmd_236 VAR_SPECIAL_RESULT
	AddVar VAR_SPECIAL_RESULT, 1
	NPCMsg msg_0043_00177
	ScrCmd_236 VAR_SPECIAL_RESULT
	CloseMsg
	GoTo _0347
_038D:
	GoTo _03B4
	End
_0395:
	SetFlag FLAG_UNK_966
	SetVar VAR_UNK_4133, 5
	GoTo _03B4
	End
_03A7:
	ScrCmd_048 msg_0043_00211
	CloseMsg
	GoTo _03B4
	End
_03B4:
	GetPlayerGender VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _03CD
	GoTo _03DB
	End
_03CD:
	BufferPlayersName 0
	ScrCmd_048 msg_0043_00066
	GoTo _03E9
	End
_03DB:
	BufferPlayersName 0
	ScrCmd_048 msg_0043_00067
	GoTo _03E9
	End
_03E9:
	ScrCmd_048 msg_0043_00068
	ScrCmd_232 26
	ScrCmd_233 26
	CloseMsg
	GoTo _03FE
	End
_03FE:
	ScrCmd_232 4
	ScrCmd_233 4
	ScrCmd_257 239
	Pokeathlon 1, 0, VAR_SPECIAL_x8000, VAR_SPECIAL_RESULT, VAR_SPECIAL_x8001, VAR_SPECIAL_x8002, VAR_SPECIAL_x8003
	ScrCmd_237
	ScrCmd_048 msg_0043_00078
	CloseMsg
	ScrCmd_232 24
	ScrCmd_233 24
	ScrCmd_587
	Wait 10, VAR_SPECIAL_RESULT
	ScrCmd_235 VAR_TEMP_x4002
	ClearFlag FLAG_UNK_966
	SetVar VAR_UNK_4133, 0
	GoTo _0443

_0443:
	ReleaseAll
	End

_0447: ; unreferenced
	   PlaySE SEQ_SE_DP_CON_F007
	   Compare VAR_SPECIAL_RESULT, 1
	   CallIfEq _048E
	   Compare VAR_SPECIAL_RESULT, 2
	   CallIfEq _0498
	   Compare VAR_SPECIAL_RESULT, 3
	   CallIfEq _04AC
	   Compare VAR_SPECIAL_RESULT, 4
	   CallIfEq _04C8
	   Compare VAR_SPECIAL_RESULT, 5
	   CallIfGe _04EE
	   Return

_048E:
	   PlaySE SEQ_SE_DP_CON_015
	   WaitSE SEQ_SE_DP_CON_015
	   Return

_0498:
	   PlaySE SEQ_SE_DP_CON_015
	   Wait 5, VAR_SPECIAL_RESULT
	   PlaySE SEQ_SE_DP_CON_015
	   WaitSE SEQ_SE_DP_CON_015
	   Return

_04AC:
	   PlaySE SEQ_SE_DP_CON_015
	   WaitSE SEQ_SE_DP_CON_015
	   PlaySE SEQ_SE_DP_CON_015
	   Wait 5, VAR_SPECIAL_RESULT
	   PlaySE SEQ_SE_DP_CON_015
	   WaitSE SEQ_SE_DP_CON_015
	   Return

_04C8:
	   PlaySE SEQ_SE_DP_CON_015
	   Wait 5, VAR_SPECIAL_RESULT
	   PlaySE SEQ_SE_DP_CON_015
	   WaitSE SEQ_SE_DP_CON_015
	   PlaySE SEQ_SE_DP_CON_015
	   Wait 5, VAR_SPECIAL_RESULT
	   PlaySE SEQ_SE_DP_CON_015
	   WaitSE SEQ_SE_DP_CON_015
	   Return

_04EE:
	   PlaySE SEQ_SE_DP_CON_015
	   Wait 5, VAR_SPECIAL_RESULT
	   PlaySE SEQ_SE_DP_CON_015
	   Wait 5, VAR_SPECIAL_RESULT
	   PlaySE SEQ_SE_DP_CON_015
	   Wait 10, VAR_SPECIAL_RESULT
	   PlaySE SEQ_SE_DP_CON_015
	   Wait 5, VAR_SPECIAL_RESULT
	   PlaySE SEQ_SE_DP_CON_015
	   WaitSE SEQ_SE_DP_CON_015
	   Return

	.balign 4, 0
_0520: ; unreferenced
	Delay4
	FaceEast
	Delay4
	FaceSouth
	Delay2
	FaceWest
	Delay1
	FaceNorth
	Delay1
	FaceEast
	Delay1
	FaceSouth
	EndMovement

	.balign 4, 0
_0554: ; unreferenced
	Delay8 2
	WalkOnSpotNormalWest
	Delay8
	WalkOnSpotNormalEast
	Delay8
	WalkOnSpotFastSouth
	EndMovement

	.balign 4, 0
_0570: ; unreferenced
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0578: ; unreferenced
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0580: ; unreferenced
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0588: ; unreferenced
	WalkOnSpotNormalSouth
	EndMovement

scr_seq_0166_008:
scr_seq_0166_009:
scr_seq_0166_010:
scr_seq_0166_011:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_TEMP_x4003, 2
	SetVar VAR_SPECIAL_x8004, 0
	NPCMsg msg_0043_00111
	GoTo _05AF
	End
_05AF:
	NPCMsg msg_0043_00112
	ScrCmd_065 1, 1, 0, 1, VAR_SPECIAL_RESULT
	ScrCmd_066 msg_0043_00113, 0
	ScrCmd_066 msg_0043_00114, 1
	ScrCmd_066 msg_0043_00115, 2
	ScrCmd_067
	Switch VAR_SPECIAL_RESULT
	Case 0, _05FD
	Case 1, _0872
	Case 2, _0A97
	GoTo _0A97
	End
_05FD:
	ScrCmd_065 1, 1, 0, 1, VAR_SPECIAL_RESULT
	ScrCmd_066 msg_0043_00155, 0
	ScrCmd_066 msg_0043_00156, 1
	ScrCmd_066 msg_0043_00157, 2
	ScrCmd_066 msg_0043_00158, 3
	ScrCmd_067
	Switch VAR_SPECIAL_RESULT
	Case 0, _064C
	Case 1, _0660
	Case 2, _067A
	GoTo _068E
	End
_064C:
	SetVar VAR_TEMP_x4004, 0
	SetVar VAR_SPECIAL_x8007, 3
	GoTo _0743
	End
_0660:
	SetVar VAR_TEMP_x4004, 1
	SetVar VAR_SPECIAL_x8005, 0
	SetVar VAR_SPECIAL_x8007, 5
	GoTo _0743
	End
_067A:
	SetVar VAR_TEMP_x4004, 0
	SetVar VAR_SPECIAL_x8007, 7
	GoTo _0743
	End
_068E:
	NPCMsg msg_0043_00159
	WaitButton
	GoTo _0A9C
	End

_069B:
	NPCMsg msg_0043_00168
	ScrCmd_065 1, 1, 0, 1, VAR_SPECIAL_RESULT
	ScrCmd_066 msg_0043_00169, 0
	ScrCmd_066 msg_0043_00170, 1
	ScrCmd_066 msg_0043_00171, 2
	ScrCmd_066 msg_0043_00172, 3
	ScrCmd_066 msg_0043_00173, 4
	ScrCmd_067
	Switch VAR_SPECIAL_RESULT
	Case 0, _06FE
	Case 1, _070C
	Case 2, _071A
	Case 3, _0728
	GoTo _0736
	End
_06FE:
	SetVar VAR_SPECIAL_x8004, 0
	GoTo _0743
	End
_070C:
	SetVar VAR_SPECIAL_x8004, 1
	GoTo _0743
	End
_071A:
	SetVar VAR_SPECIAL_x8004, 2
	GoTo _0743
	End
_0728:
	SetVar VAR_SPECIAL_x8004, 3
	GoTo _0743
	End
_0736:
	NPCMsg msg_0043_00174
	WaitButton
	GoTo _0A9C
	End
_0743:
	Compare VAR_TEMP_x4004, 1
	GoToIfEq _081D
	GoTo _0756

_0756:
	NPCMsg msg_0043_00160
	ScrCmd_065 1, 1, 0, 1, VAR_SPECIAL_RESULT
	ScrCmd_066 msg_0043_00161, 0
	ScrCmd_066 msg_0043_00162, 1
	ScrCmd_066 msg_0043_00163, 2
	ScrCmd_066 msg_0043_00164, 3
	ScrCmd_066 msg_0043_00165, 4
	ScrCmd_066 msg_0043_00166, 5
	ScrCmd_067
	Switch VAR_SPECIAL_RESULT
	Case 0, _07CA
	Case 1, _07D8
	Case 2, _07E6
	Case 3, _07F4
	Case 4, _0802
	GoTo _0810
	End
_07CA:
	SetVar VAR_SPECIAL_x8005, 0
	GoTo _081D
	End
_07D8:
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _081D
	End
_07E6:
	SetVar VAR_SPECIAL_x8005, 2
	GoTo _081D
	End
_07F4:
	SetVar VAR_SPECIAL_x8005, 3
	GoTo _081D
	End
_0802:
	SetVar VAR_SPECIAL_x8005, 4
	GoTo _081D
	End
_0810:
	NPCMsg msg_0043_00167
	WaitButton
	GoTo _0A9C
	End
_081D:
	NPCMsg msg_0043_00175
	NPCMsg msg_0043_00176
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	SetVar VAR_SPECIAL_RESULT, 0
_0837:
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _084F
	GetMoveSelection 0, VAR_SPECIAL_RESULT
	GoTo _0837

_084F:
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_TEMP_x4002, 255
	GoToIfEq _0810
	GoTo _0339
	End
_0872:
	NPCMsg msg_0043_00117
_0875:
	ScrCmd_065 1, 1, 0, 1, VAR_SPECIAL_RESULT
	ScrCmd_066 msg_0043_00121, 0
	ScrCmd_066 msg_0043_00118, 1
	ScrCmd_066 msg_0043_00119, 2
	ScrCmd_066 msg_0043_00120, 3
	ScrCmd_066 msg_0043_00122, 4
	ScrCmd_067
	Switch VAR_SPECIAL_RESULT
	Case 0, _0A7E
	Case 1, _08D8
	Case 2, _0953
	Case 3, _09EA
	GoTo _05AF
	End
_08D5:
	NPCMsg msg_0043_00117
_08D8:
	ScrCmd_065 1, 1, 0, 1, VAR_SPECIAL_RESULT
	ScrCmd_066 msg_0043_00125, 0
	ScrCmd_066 msg_0043_00126, 1
	ScrCmd_066 msg_0043_00127, 2
	ScrCmd_066 msg_0043_00129, 3
	ScrCmd_067
	Switch VAR_SPECIAL_RESULT
	Case 0, _0927
	Case 1, _0932
	Case 2, _093D
	GoTo _0948
	End
_0927:
	NPCMsg msg_0043_00130
	GoTo _08D5
	End
_0932:
	NPCMsg msg_0043_00131
	GoTo _08D5
	End
_093D:
	NPCMsg msg_0043_00132
	GoTo _08D5
	End
_0948:
	GoTo _0875
	End
_0950:
	NPCMsg msg_0043_00117
_0953:
	ScrCmd_065 1, 1, 0, 1, VAR_SPECIAL_RESULT
	ScrCmd_066 msg_0043_00135, 0
	ScrCmd_066 msg_0043_00136, 1
	ScrCmd_066 msg_0043_00137, 2
	ScrCmd_066 msg_0043_00138, 3
	ScrCmd_066 msg_0043_00139, 4
	ScrCmd_067
	Switch VAR_SPECIAL_RESULT
	Case 0, _09B3
	Case 1, _09BE
	Case 2, _09C9
	Case 3, _09D4
	GoTo _09DF
	End
_09B3:
	NPCMsg msg_0043_00140
	GoTo _0950
	End
_09BE:
	NPCMsg msg_0043_00141
	GoTo _0950
	End
_09C9:
	NPCMsg msg_0043_00142
	GoTo _0950
	End
_09D4:
	NPCMsg msg_0043_00143
	GoTo _0950
	End
_09DF:
	GoTo _0875
	End
_09E7:
	NPCMsg msg_0043_00117
_09EA:
	ScrCmd_065 1, 1, 0, 1, VAR_SPECIAL_RESULT
	ScrCmd_066 msg_0043_00145, 0
	ScrCmd_066 msg_0043_00146, 1
	ScrCmd_066 msg_0043_00147, 2
	ScrCmd_066 msg_0043_00148, 3
	ScrCmd_066 msg_0043_00149, 4
	ScrCmd_067
	Switch VAR_SPECIAL_RESULT
	Case 0, _0A4A
	Case 1, _0A55
	Case 2, _0A60
	Case 3, _0A6B
	GoTo _0A76
	End
_0A4A:
	NPCMsg msg_0043_00150
	GoTo _09E7
	End
_0A55:
	NPCMsg msg_0043_00151
	GoTo _09E7
	End
_0A60:
	NPCMsg msg_0043_00152
	GoTo _09E7
	End
_0A6B:
	NPCMsg msg_0043_00153
	GoTo _09E7
	End
_0A76:
	GoTo _0875
	End
_0A7E:
	NPCMsg msg_0043_00124
	NPCMsg msg_0043_00117
	GoTo _0875
	End
_0A8C: ; unreferenced
	NPCMsg msg_0043_00123
	GoTo _0A9C
	End
_0A97:
	NPCMsg msg_0043_00116
	WaitButton
_0A9C:
	CloseMsg
	ReleaseAll
	End

scr_seq_0166_012:
	End
	.balign 4, 0
