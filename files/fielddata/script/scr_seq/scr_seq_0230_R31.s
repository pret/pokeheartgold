#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R31.h"
#include "msgdata/msg/msg_0378_R31.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R31_000
	ScrDef scr_seq_R31_001
	ScrDef scr_seq_R31_002
	ScrDef scr_seq_R31_003
	ScrDef scr_seq_R31_004
	ScrDef scr_seq_R31_005
	ScrDefEnd

scr_seq_R31_000:
	End

scr_seq_R31_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_LOAN_SPEAROW, 1
	GoToIfNe _003D
	GoTo _0098

_0037:
	GoTo _008D

_003D:
	Compare VAR_LOAN_SPEAROW, 2
	GoToIfNe _0056
	GoTo _01AD

_0050:
	GoTo _008D

_0056:
	Compare VAR_LOAN_SPEAROW, 4
	GoToIfNe _006F
	GoTo _01AD

_0069:
	GoTo _008D

_006F:
	Compare VAR_LOAN_SPEAROW, 6
	GoToIfNe _008D
	KenyaCheckPartyOrMailbox VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _02AE
_008D:
	NPCMsg msg_0378_R31_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0098:
	NPCMsg msg_0378_R31_00001
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	PartySelectUI
	GetPartySelection VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 255
	GoToIfEq _0206
	GetPartyMonSpecies VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfEq _021F
	KenyaCheck VAR_SPECIAL_RESULT, VAR_TEMP_x4000, 0
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0238
	KenyaCheck VAR_SPECIAL_RESULT, VAR_TEMP_x4000, 1
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0251
	CheckReturnLoanMon 7, VAR_TEMP_x4000, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _026A
	Compare VAR_SPECIAL_RESULT, 4
	GoToIfEq _0295
	ReturnLoanMon VAR_TEMP_x4000
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0149
	ApplyMovement obj_player, _02BC
	GoTo _0187

_0149:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0164
	ApplyMovement obj_player, _02C4
	GoTo _0187

_0164:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _017F
	ApplyMovement obj_player, _02CC
	GoTo _0187

_017F:
	ApplyMovement obj_player, _02D4
_0187:
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0378_R31_00005
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
_0195:
	NPCMsg msg_0378_R31_00007
	SetVar VAR_LOAN_SPEAROW, 2
	Compare VAR_TEMP_x4000, VAR_TEMP_x4001
	GoToIfNe _01AD
	ScrCmd_606
_01AD:
	GoToIfNoItemSpace ITEM_TM44, 1, _01FC
	CallStd std_give_item_verbose
	Compare VAR_LOAN_SPEAROW, 2
	GoToIfNe _01EB
	SetVar VAR_LOAN_SPEAROW, 3
	GoTo _01F1

_01EB:
	SetVar VAR_LOAN_SPEAROW, 5
_01F1:
	NPCMsg msg_0378_R31_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01FC:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_0206:
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	NPCMsg msg_0378_R31_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

_021F:
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	NPCMsg msg_0378_R31_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0238:
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	NPCMsg msg_0378_R31_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0251:
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	NPCMsg msg_0378_R31_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_026A:
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	NPCMsg msg_0378_R31_00004
	CloseMsg
	BufferPlayersName 0
	NPCMsg msg_0378_R31_00006
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	MonGiveMail VAR_TEMP_x4000
	GoTo _0195
	End

_0295:
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	NPCMsg msg_0378_R31_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02AE:
	SetVar VAR_LOAN_SPEAROW, 1
	GoTo _0098
	End


	.balign 4, 0
_02BC:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_02C4:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_02CC:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_02D4:
	WalkOnSpotNormalEast
	EndMovement

scr_seq_R31_002:
	DirectionSignpost msg_0378_R31_00013, 1, 2, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R31_003:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0378_R31_00014, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R31_004:
	SimpleNPCMsg msg_0378_R31_00012
	End

_0308:
	SimpleNPCMsg msg_0378_R31_00001
	End

scr_seq_R31_005:
	SimpleNPCMsg msg_0378_R31_00011
	End
	.balign 4, 0
