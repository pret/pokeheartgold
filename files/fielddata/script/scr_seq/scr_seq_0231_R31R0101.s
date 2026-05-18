#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R31R0101.h"
#include "msgdata/msg/msg_0379_R31R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R31R0101_000
	ScrDef scr_seq_R31R0101_001
	ScrDef scr_seq_R31R0101_002
	ScrDefEnd

scr_seq_R31R0101_001:
	GetFriendSprite VAR_OBJ_0
	End

scr_seq_R31R0101_000:
	ScrCmd_609
	LockAll
	CallStd std_play_friend_music
	ApplyMovement obj_R31R0101_tsure_poke_static_marill, _028C
	WaitMovement
	PlaySE SEQ_SE_DP_KAIDAN2
	MovePersonFacing obj_R31R0101_var_1, 10, 1, 7, DIR_WEST
	MovePersonFacing obj_R31R0101_tsure_poke_static_marill, 10, 1, 7, DIR_WEST
	ApplyMovement obj_R31R0101_var_1, _0284
	WaitMovement
	WaitSE SEQ_SE_DP_KAIDAN2
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	ScrCmd_729 VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 1
	GoToIfNe _00C3
	Compare VAR_TEMP_x4001, 6
	GoToIfNe _008A
	ApplyMovement obj_R31R0101_var_1, _02AC
	ApplyMovement obj_R31R0101_tsure_poke_static_marill, _02FC
	GoTo _00BD

_008A:
	Compare VAR_TEMP_x4001, 7
	GoToIfNe _00AD
	ApplyMovement obj_R31R0101_var_1, _02BC
	ApplyMovement obj_R31R0101_tsure_poke_static_marill, _0314
	GoTo _00BD

_00AD:
	ApplyMovement obj_R31R0101_var_1, _02C4
	ApplyMovement obj_R31R0101_tsure_poke_static_marill, _0324
_00BD:
	GoTo _0119

_00C3:
	Compare VAR_TEMP_x4001, 6
	GoToIfNe _00E6
	ApplyMovement obj_R31R0101_var_1, _02D4
	ApplyMovement obj_R31R0101_tsure_poke_static_marill, _033C
	GoTo _0119

_00E6:
	Compare VAR_TEMP_x4001, 7
	GoToIfNe _0109
	ApplyMovement obj_R31R0101_var_1, _02E4
	ApplyMovement obj_R31R0101_tsure_poke_static_marill, _0354
	GoTo _0119

_0109:
	ApplyMovement obj_R31R0101_var_1, _02EC
	ApplyMovement obj_R31R0101_tsure_poke_static_marill, _0364
_0119:
	WaitMovement
	ApplyMovement obj_player, _0294
	Compare VAR_TEMP_x4002, 1
	GoToIfNe _0138
	ApplyMovement obj_partner_poke, _0294
_0138:
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0379_R31R0101_00002, msg_0379_R31R0101_00003
	GiveItemNoCheck ITEM_VS__RECORDER, 1
	GenderMsgBox msg_0379_R31R0101_00004, msg_0379_R31R0101_00005
	CloseMsg
	ApplyMovement obj_R31R0101_var_1, _0294
	WaitMovement
	GenderMsgBox msg_0379_R31R0101_00006, msg_0379_R31R0101_00007
	CloseMsg
	ApplyMovement obj_R31R0101_tsure_poke_static_marill, _02A4
	WaitMovement
	Compare VAR_TEMP_x4002, 1
	GoToIfNe _01DA
	Compare VAR_TEMP_x4001, 6
	GoToIfNe _01A1
	ApplyMovement obj_R31R0101_var_1, _037C
	ApplyMovement obj_R31R0101_tsure_poke_static_marill, _03EC
	GoTo _01D4

_01A1:
	Compare VAR_TEMP_x4001, 7
	GoToIfNe _01C4
	ApplyMovement obj_R31R0101_var_1, _038C
	ApplyMovement obj_R31R0101_tsure_poke_static_marill, _0404
	GoTo _01D4

_01C4:
	ApplyMovement obj_R31R0101_var_1, _03A4
	ApplyMovement obj_R31R0101_tsure_poke_static_marill, _0424
_01D4:
	GoTo _0230

_01DA:
	Compare VAR_TEMP_x4001, 6
	GoToIfNe _01FD
	ApplyMovement obj_R31R0101_var_1, _03B4
	ApplyMovement obj_R31R0101_tsure_poke_static_marill, _043C
	GoTo _0230

_01FD:
	Compare VAR_TEMP_x4001, 7
	GoToIfNe _0220
	ApplyMovement obj_R31R0101_var_1, _03C4
	ApplyMovement obj_R31R0101_tsure_poke_static_marill, _0454
	GoTo _0230

_0220:
	ApplyMovement obj_R31R0101_var_1, _03DC
	ApplyMovement obj_R31R0101_tsure_poke_static_marill, _0474
_0230:
	Wait 16, VAR_SPECIAL_RESULT
	ApplyMovement obj_player, _029C
	Compare VAR_TEMP_x4002, 1
	GoToIfNe _0253
	ApplyMovement obj_partner_poke, _029C
_0253:
	WaitMovement
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	MovePersonFacing obj_R31R0101_var_1, 12, 0, 28, DIR_NORTH
	MovePersonFacing obj_R31R0101_tsure_poke_static_marill, 12, 0, 28, DIR_NORTH
	CallStd std_fade_end_friend_music
	ReleaseAll
	SetVar VAR_UNK_4132, 1
	End

	.balign 4, 0
_0284:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_028C:
	SetInvisible
	EndMovement

	.balign 4, 0
_0294:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_029C:
	WalkOnSpotFastWest
	EndMovement

	.balign 4, 0
_02A4:
	JumpOnSpotFastWest 2
	EndMovement

	.balign 4, 0
_02AC:
	WalkNormalWest 2
	WalkNormalNorth
	WalkNormalWest
	EndMovement

	.balign 4, 0
_02BC:
	WalkNormalWest 3
	EndMovement

	.balign 4, 0
_02C4:
	WalkNormalWest 2
	WalkNormalSouth
	WalkNormalWest
	EndMovement

	.balign 4, 0
_02D4:
	WalkNormalWest 2
	WalkNormalNorth
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_02E4:
	WalkNormalWest 4
	EndMovement

	.balign 4, 0
_02EC:
	WalkNormalWest 2
	WalkNormalSouth
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_02FC:
	Delay8
	SetVisible
	WalkNormalWest 2
	WalkNormalNorth
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0314:
	Delay8
	SetVisible
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_0324:
	Delay8
	SetVisible
	WalkNormalWest 2
	WalkNormalSouth
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_033C:
	Delay8
	SetVisible
	WalkNormalWest 2
	WalkNormalNorth
	WalkNormalWest
	EndMovement

	.balign 4, 0
_0354:
	Delay8
	SetVisible
	WalkNormalWest 3
	EndMovement

	.balign 4, 0
_0364:
	Delay8
	SetVisible
	WalkNormalWest 2
	WalkNormalSouth
	WalkNormalWest
	EndMovement

	.balign 4, 0
_037C:
	RunSouth
	RunWest 6
	SetInvisible
	EndMovement

	.balign 4, 0
_038C:
	RunSouth
	RunWest 4
	RunNorth
	RunWest 2
	SetInvisible
	EndMovement

	.balign 4, 0
_03A4:
	RunNorth
	RunWest 6
	SetInvisible
	EndMovement

	.balign 4, 0
_03B4:
	RunSouth
	RunWest 5
	SetInvisible
	EndMovement

	.balign 4, 0
_03C4:
	RunSouth
	RunWest 3
	RunNorth
	RunWest 2
	SetInvisible
	EndMovement

	.balign 4, 0
_03DC:
	RunNorth
	RunWest 5
	SetInvisible
	EndMovement

	.balign 4, 0
_03EC:
	Delay2
	WalkFastWest
	WalkFastSouth
	WalkFastWest 6
	SetInvisible
	EndMovement

	.balign 4, 0
_0404:
	Delay2
	WalkFastWest
	WalkFastSouth
	WalkFastWest 4
	WalkFastNorth
	WalkFastWest 2
	SetInvisible
	EndMovement

	.balign 4, 0
_0424:
	Delay2
	WalkFastWest
	WalkFastNorth
	WalkFastWest 6
	SetInvisible
	EndMovement

	.balign 4, 0
_043C:
	Delay2
	WalkFastWest
	WalkFastSouth
	WalkFastWest 5
	SetInvisible
	EndMovement

	.balign 4, 0
_0454:
	Delay2
	WalkFastWest
	WalkFastSouth
	WalkFastWest 3
	WalkFastNorth
	WalkFastWest 2
	SetInvisible
	EndMovement

	.balign 4, 0
_0474:
	Delay2
	WalkFastWest
	WalkFastNorth
	WalkFastWest 5
	SetInvisible
	EndMovement

scr_seq_R31R0101_002:
	SimpleNPCMsg msg_0379_R31R0101_00000
	End
	.balign 4, 0
