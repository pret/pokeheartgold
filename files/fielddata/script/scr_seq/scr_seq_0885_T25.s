#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25.h"
#include "msgdata/msg/msg_0581_T25.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T25_000
	ScrDef scr_seq_T25_001
	ScrDef scr_seq_T25_002
	ScrDef scr_seq_T25_003
	ScrDef scr_seq_T25_004
	ScrDef scr_seq_T25_005
	ScrDef scr_seq_T25_006
	ScrDef scr_seq_T25_007
	ScrDef scr_seq_T25_008
	ScrDef scr_seq_T25_009
	ScrDef scr_seq_T25_010
	ScrDef scr_seq_T25_011
	ScrDef scr_seq_T25_012
	ScrDef scr_seq_T25_013
	ScrDef scr_seq_T25_014
	ScrDef scr_seq_T25_015
	ScrDef scr_seq_T25_016
	ScrDef scr_seq_T25_017
	ScrDef scr_seq_T25_018
	ScrDef scr_seq_T25_019
	ScrDef scr_seq_T25_020
	ScrDef scr_seq_T25_021
	ScrDef scr_seq_T25_022
	ScrDef scr_seq_T25_023
	ScrDef scr_seq_T25_024
	ScrDef scr_seq_T25_025
	ScrDef scr_seq_T25_026
	ScrDef scr_seq_T25_027
	ScrDef scr_seq_T25_028
	ScrDef scr_seq_T25_029
	ScrDef scr_seq_T25_030
	ScrDef scr_seq_T25_031
	ScrDef scr_seq_T25_032
	ScrDefEnd

scr_seq_T25_018:
	SetFlag FLAG_HIDE_ROCKET_TAKEOVER_3
	SetFlag FLAG_HIDE_ROCKET_TAKEOVER_4
	SetFlag FLAG_HIDE_ROCKET_TAKEOVER_1
	SetFlag FLAG_HIDE_ROCKET_TAKEOVER_5
	SetFlag FLAG_HIDE_ROCKET_TAKEOVER_2
	Compare VAR_SCENE_ROCKET_TAKEOVER, 0
	GoToIfNe _00B5
	ClearFlag FLAG_HIDE_ROCKET_TAKEOVER_2
	ClearFlag FLAG_HIDE_ROCKET_TAKEOVER_3
	GoTo _011A

_00B5:
	Compare VAR_SCENE_ROCKET_TAKEOVER, 1
	GoToIfNe _00D4
	ClearFlag FLAG_HIDE_ROCKET_TAKEOVER_2
	ClearFlag FLAG_HIDE_ROCKET_TAKEOVER_3
	ClearFlag FLAG_HIDE_ROCKET_TAKEOVER_4
	GoTo _011A

_00D4:
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _00F7
	ClearFlag FLAG_HIDE_ROCKET_TAKEOVER_3
	ClearFlag FLAG_HIDE_ROCKET_TAKEOVER_4
	ClearFlag FLAG_HIDE_ROCKET_TAKEOVER_1
	ClearFlag FLAG_HIDE_ROCKET_TAKEOVER_5
	GoTo _011A

_00F7:
	Compare VAR_SCENE_ROCKET_TAKEOVER, 5
	GoToIfNe _010E
	ClearFlag FLAG_HIDE_ROCKET_TAKEOVER_2
	GoTo _011A

_010E:
	ClearFlag FLAG_HIDE_ROCKET_TAKEOVER_3
	ClearFlag FLAG_HIDE_ROCKET_TAKEOVER_4
	ClearFlag FLAG_HIDE_ROCKET_TAKEOVER_1
_011A:
	End

scr_seq_T25_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_40DA, 1
	GoToIfNe _013E
	Compare VAR_UNK_40DB, 0
	GoToIfEq _0149
_013E:
	NPCMsg msg_0581_T25_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0149:
	NPCMsg msg_0581_T25_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 2
	GoToIfGe _0172
	NPCMsg msg_0581_T25_00004
	GoTo _0175

_0172:
	NPCMsg msg_0581_T25_00005
_0175:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_RADIO_CARD, _019B
	NPCMsg msg_0581_T25_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_019B:
	NPCMsg msg_0581_T25_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25_003:
	SimpleNPCMsg msg_0581_T25_00008
	End

scr_seq_T25_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayerOnBikeCheck VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _01DD
	NPCMsg msg_0581_T25_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01DD:
	NPCMsg msg_0581_T25_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_40DA, 1
	GoToIfNe _020A
	Compare VAR_UNK_40DB, 0
	GoToIfEq _0215
_020A:
	NPCMsg msg_0581_T25_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0215:
	NPCMsg msg_0581_T25_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_40DA, 1
	GoToIfNe _0242
	Compare VAR_UNK_40DB, 0
	GoToIfEq _024D
_0242:
	NPCMsg msg_0581_T25_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

_024D:
	NPCMsg msg_0581_T25_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25_007:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0581_T25_00013
	CloseMsg
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0284
	ApplyMovement obj_T25_rocketm, _02F8
	WaitMovement
	GoTo _02B8

_0284:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _02A1
	ApplyMovement obj_T25_rocketm, _0308
	WaitMovement
	GoTo _02B8

_02A1:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _02B8
	ApplyMovement obj_T25_rocketm, _0300
	WaitMovement
_02B8:
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _02CE
	NPCMsg msg_0581_T25_00015
	GoTo _02D1

_02CE:
	NPCMsg msg_0581_T25_00014
_02D1:
	CloseMsg
	Compare VAR_TEMP_x4001, 350
	GoToIfEq _02EA
	ApplyMovement obj_T25_rocketm, _02F0
	WaitMovement
_02EA:
	ReleaseAll
	End

	.balign 4, 0
_02F0:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_02F8:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0300:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0308:
	WalkOnSpotNormalEast
	EndMovement

scr_seq_T25_008:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _032E
	NPCMsg msg_0581_T25_00017
	GoTo _0331

_032E:
	NPCMsg msg_0581_T25_00016
_0331:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25_009:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _0357
	NPCMsg msg_0581_T25_00019
	GoTo _035A

_0357:
	NPCMsg msg_0581_T25_00018
_035A:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25_010:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _0380
	NPCMsg msg_0581_T25_00021
	GoTo _0383

_0380:
	NPCMsg msg_0581_T25_00020
_0383:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25_011:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _03A9
	NPCMsg msg_0581_T25_00023
	GoTo _03AC

_03A9:
	NPCMsg msg_0581_T25_00022
_03AC:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25_012:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _03D2
	NPCMsg msg_0581_T25_00025
	GoTo _03D5

_03D2:
	NPCMsg msg_0581_T25_00024
_03D5:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25_013:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _03FB
	NPCMsg msg_0581_T25_00030
	GoTo _03FE

_03FB:
	NPCMsg msg_0581_T25_00029
_03FE:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25_030:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0581_T25_00026
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25_032:
	SimpleNPCMsg msg_0581_T25_00028
	End

scr_seq_T25_031:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0581_T25_00027
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25_014:
	SimpleNPCMsg msg_0581_T25_00031
	End

scr_seq_T25_015:
	SimpleNPCMsg msg_0581_T25_00032
	End

scr_seq_T25_016:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _047F
	NPCMsg msg_0581_T25_00034
	GoTo _0482

_047F:
	NPCMsg msg_0581_T25_00033
_0482:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25_017:
	ScrCmd_609
	LockAll
	ApplyMovement obj_T25_rocketm_9, _06E4
	WaitMovement
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4000, 354
	GoToIfNe _04B9
	ApplyMovement obj_T25_rocketm_9, _06EC
	GoTo _05A6

_04B9:
	Compare VAR_TEMP_x4000, 355
	GoToIfNe _04D4
	ApplyMovement obj_T25_rocketm_9, _06F4
	GoTo _05A6

_04D4:
	Compare VAR_TEMP_x4000, 356
	GoToIfNe _04EF
	ApplyMovement obj_T25_rocketm_9, _06FC
	GoTo _05A6

_04EF:
	Compare VAR_TEMP_x4000, 357
	GoToIfNe _050A
	ApplyMovement obj_T25_rocketm_9, _0704
	GoTo _05A6

_050A:
	Compare VAR_TEMP_x4000, 358
	GoToIfNe _0525
	ApplyMovement obj_T25_rocketm_9, _070C
	GoTo _05A6

_0525:
	Compare VAR_TEMP_x4000, 359
	GoToIfNe _0540
	ApplyMovement obj_T25_rocketm_9, _0714
	GoTo _05A6

_0540:
	Compare VAR_TEMP_x4000, 360
	GoToIfNe _055B
	ApplyMovement obj_T25_rocketm_9, _071C
	GoTo _05A6

_055B:
	Compare VAR_TEMP_x4000, 361
	GoToIfNe _0576
	ApplyMovement obj_T25_rocketm_9, _0724
	GoTo _05A6

_0576:
	Compare VAR_TEMP_x4000, 362
	GoToIfNe _0591
	ApplyMovement obj_T25_rocketm_9, _072C
	GoTo _05A6

_0591:
	Compare VAR_TEMP_x4000, 363
	GoToIfNe _05A6
	ApplyMovement obj_T25_rocketm_9, _0734
_05A6:
	WaitMovement
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 56
	ApplyMovement obj_T25_rocketm_9, _073C
	ApplyMovement obj_player, _0744
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0581_T25_00035
	CloseMsg
	Compare VAR_TEMP_x4000, 354
	GoToIfNe _05EE
	ApplyMovement obj_T25_rocketm_9, _0754
	GoTo _06DB

_05EE:
	Compare VAR_TEMP_x4000, 355
	GoToIfNe _0609
	ApplyMovement obj_T25_rocketm_9, _0764
	GoTo _06DB

_0609:
	Compare VAR_TEMP_x4000, 356
	GoToIfNe _0624
	ApplyMovement obj_T25_rocketm_9, _0774
	GoTo _06DB

_0624:
	Compare VAR_TEMP_x4000, 357
	GoToIfNe _063F
	ApplyMovement obj_T25_rocketm_9, _0784
	GoTo _06DB

_063F:
	Compare VAR_TEMP_x4000, 358
	GoToIfNe _065A
	ApplyMovement obj_T25_rocketm_9, _0794
	GoTo _06DB

_065A:
	Compare VAR_TEMP_x4000, 359
	GoToIfNe _0675
	ApplyMovement obj_T25_rocketm_9, _07A4
	GoTo _06DB

_0675:
	Compare VAR_TEMP_x4000, 360
	GoToIfNe _0690
	ApplyMovement obj_T25_rocketm_9, _07B0
	GoTo _06DB

_0690:
	Compare VAR_TEMP_x4000, 361
	GoToIfNe _06AB
	ApplyMovement obj_T25_rocketm_9, _07C0
	GoTo _06DB

_06AB:
	Compare VAR_TEMP_x4000, 362
	GoToIfNe _06C6
	ApplyMovement obj_T25_rocketm_9, _07D0
	GoTo _06DB

_06C6:
	Compare VAR_TEMP_x4000, 363
	GoToIfNe _06DB
	ApplyMovement obj_T25_rocketm_9, _07E0
_06DB:
	WaitMovement
	ReleaseAll
	End

	.balign 4, 0
_06E4:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_06EC:
	WalkNormalWest 5
	EndMovement

	.balign 4, 0
_06F4:
	WalkNormalWest 4
	EndMovement

	.balign 4, 0
_06FC:
	WalkNormalWest 3
	EndMovement

	.balign 4, 0
_0704:
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_070C:
	WalkNormalWest
	EndMovement

	.balign 4, 0
_0714:
	Delay1
	EndMovement

	.balign 4, 0
_071C:
	WalkNormalEast
	EndMovement

	.balign 4, 0
_0724:
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_072C:
	WalkNormalEast 3
	EndMovement

	.balign 4, 0
_0734:
	WalkNormalEast 4
	EndMovement

	.balign 4, 0
_073C:
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0744:
	LockDir
	WalkNormalNorth
	UnlockDir
	EndMovement

	.balign 4, 0
_0754:
	WalkNormalSouth
	WalkNormalEast 5
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0764:
	WalkNormalSouth
	WalkNormalEast 4
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0774:
	WalkNormalSouth
	WalkNormalEast 3
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0784:
	WalkNormalSouth
	WalkNormalEast 2
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0794:
	WalkNormalSouth
	WalkNormalEast
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_07A4:
	WalkNormalSouth
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_07B0:
	WalkNormalSouth
	WalkNormalWest
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_07C0:
	WalkNormalSouth
	WalkNormalWest 2
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_07D0:
	WalkNormalSouth
	WalkNormalWest 3
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_07E0:
	WalkNormalSouth
	WalkNormalWest 4
	WalkOnSpotNormalNorth
	EndMovement

scr_seq_T25_019:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0581_T25_00036, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T25_020:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0581_T25_00037, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T25_021:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0581_T25_00038, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T25_022:
	DirectionSignpost msg_0581_T25_00039, 0, 16, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T25_023:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0581_T25_00040, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T25_024:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0581_T25_00041, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T25_025:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0581_T25_00042, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T25_026:
	ScrCmd_055 3, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0581_T25_00043, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T25_027:
	ScrCmd_055 3, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0581_T25_00044, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T25_028:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0581_T25_00045, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T25_029:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0581_T25_00046, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
