#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R30.h"
#include "msgdata/msg/msg_0375_R30.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R30_000
	ScrDef scr_seq_R30_001
	ScrDef scr_seq_R30_002
	ScrDef scr_seq_R30_003
	ScrDef scr_seq_R30_004
	ScrDef scr_seq_R30_005
	ScrDef scr_seq_R30_006
	ScrDef scr_seq_R30_007
	ScrDef scr_seq_R30_008
	ScrDef scr_seq_R30_009
	ScrDef scr_seq_R30_010
	ScrDefEnd

scr_seq_R30_001:
	SetFlag FLAG_GOT_ELMS_PANIC_CALL
	PhoneCall PHONE_CONTACT_PROF__ELM, 2, 0
	SetVar VAR_SCENE_ROUTE_30_OW, 3
	End

scr_seq_R30_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0375_R30_00000
	CloseMsg
	ApplyMovement obj_R30_tsure_poke_static_rattata, _0088
	WaitMovement
	ApplyMovement obj_R30_tsure_poke_static_pidgey, _0090
	WaitMovement
	PlaySE SEQ_SE_DP_SELECT
	FacePlayer
	NPCMsg msg_0375_R30_00001
	CloseMsg
	ApplyMovement obj_R30_gsboy2_3, _0098
	WaitMovement
	ReleaseAll
	End

	.balign 4, 0
_0088:
	JumpOnSpotFastNorth 3
	EndMovement

	.balign 4, 0
_0090:
	JumpOnSpotFastSouth 2
	EndMovement

	.balign 4, 0
_0098:
	WalkOnSpotNormalNorth
	EndMovement

scr_seq_R30_002:
	ScrCmd_609
	LockAll
	ScrCmd_307 17, 11, 11, 3, 77
	ScrCmd_310 77
	ScrCmd_308 77
	ClearFlag FLAG_HIDE_ROUTE_30_APRICORN_MAN
	ShowPerson obj_R30_gsmiddleman1
	ApplyMovement obj_R30_gsmiddleman1, _01B0
	WaitMovement
	ScrCmd_311 77
	ScrCmd_308 77
	ScrCmd_309 77
	ApplyMovement obj_R30_gsmiddleman1, _01C4
	WaitMovement
	NPCMsg msg_0375_R30_00005
	CloseMsg
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	Compare VAR_TEMP_x4000, 558
	GoToIfNe _010A
	ApplyMovement obj_player, _01D4
	GoTo _0148

_010A:
	Compare VAR_TEMP_x4000, 559
	GoToIfNe _0125
	ApplyMovement obj_player, _01E8
	GoTo _0148

_0125:
	Compare VAR_TEMP_x4000, 560
	GoToIfNe _0140
	ApplyMovement obj_player, _01FC
	GoTo _0148

_0140:
	ApplyMovement obj_player, _0210
_0148:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0375_R30_00006
	GiveItemNoCheck ITEM_APRICORN_BOX, 1
	NPCMsg msg_0375_R30_00008
	CloseMsg
	ApplyMovement obj_R30_gsmiddleman1, _01CC
	WaitMovement
	ScrCmd_307 17, 11, 11, 3, 77
	ScrCmd_310 77
	ScrCmd_308 77
	ApplyMovement obj_R30_gsmiddleman1, _01B8
	WaitMovement
	ScrCmd_311 77
	ScrCmd_308 77
	ScrCmd_309 77
	HidePerson obj_R30_gsmiddleman1
	SetFlag FLAG_HIDE_ROUTE_30_APRICORN_MAN
	ReleaseAll
	SetFlag FLAG_GOT_APRICORN_BOX
	SetVar VAR_SCENE_ROUTE_30_OW, 1
	End

	.balign 4, 0
_01B0:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_01B8:
	WalkNormalNorth
	SetInvisible
	EndMovement

	.balign 4, 0
_01C4:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_01CC:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_01D4:
	WalkNormalSouth 2
	WalkOnSpotNormalWest
	Delay8 2
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_01E8:
	WalkNormalSouth 2
	WalkOnSpotNormalWest
	Delay8 2
	WalkNormalWest 3
	EndMovement

	.balign 4, 0
_01FC:
	WalkNormalSouth 2
	WalkOnSpotNormalWest
	Delay8 2
	WalkNormalWest 4
	EndMovement

	.balign 4, 0
_0210:
	WalkNormalSouth 2
	WalkOnSpotNormalWest
	Delay8 2
	WalkNormalWest 5
	EndMovement

scr_seq_R30_003:
	SimpleNPCMsg msg_0375_R30_00013
	End

scr_seq_R30_004:
	ScrCmd_609
	LockAll
	PhoneCall PHONE_CONTACT_MOTHER, 2, 0
	SetVar VAR_SCENE_ROUTE_30_PHONE_CALL, 0
	SetFlag FLAG_TALKED_TO_MOM_AFTER_NAMING_RIVAL
	ReleaseAll
	End

scr_seq_R30_005:
	DirectionSignpost msg_0375_R30_00009, 1, 6, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R30_006:
	DirectionSignpost msg_0375_R30_00010, 1, 3, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R30_007:
	ScrCmd_055 3, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0375_R30_00012, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R30_008:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0375_R30_00011, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R30_009:
	GoToIfSet FLAG_GOT_POKEDEX, _02D5
	SimpleNPCMsg msg_0375_R30_00002
	End

_02D5:
	SimpleNPCMsg msg_0375_R30_00003
	End

scr_seq_R30_010:
	SimpleNPCMsg msg_0375_R30_00004
	End
	.balign 4, 0
