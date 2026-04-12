#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R29.h"
#include "msgdata/msg/msg_0373_R29.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R29_000
	ScrDef scr_seq_R29_001
	ScrDef scr_seq_R29_002
	ScrDef scr_seq_R29_003
	ScrDef scr_seq_R29_004
	ScrDef scr_seq_R29_005
	ScrDef scr_seq_R29_006
	ScrDef scr_seq_R29_007
	ScrDef scr_seq_R29_008
	ScrDefEnd

scr_seq_R29_000:
	GetFriendSprite VAR_OBJ_1
	CheckBadge BADGE_ZEPHYR, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfEq _0043
	SetFlag FLAG_UNK_207
	End

_0043:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _005E
	ClearFlag FLAG_UNK_207
	GoTo _0062

_005E:
	SetFlag FLAG_UNK_207
_0062:
	End

scr_seq_R29_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetPartyLeadAlive VAR_SPECIAL_x8002
	MonHasRibbon VAR_SPECIAL_RESULT, VAR_SPECIAL_x8002, RIBBON_SHOCK
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _018A
	GoToIfSet FLAG_DAILY_GOT_SHOCK_RIBBON, _019E
	Compare VAR_NUM_MET_WEEKDAY_SIBLINGS, 7
	GoToIfEq _0138
	GoToIfSet FLAG_GOT_TWISTEDSPOON_FROM_TUSCANY, _011A
	GetWeekday VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfEq _00CB
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 7
	GoTo _0112

_00CB:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 4
	GoToIfNoItemSpace ITEM_TWISTEDSPOON, 1, _012E
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_TWISTEDSPOON_FROM_TUSCANY
	AddVar VAR_NUM_MET_WEEKDAY_SIBLINGS, 1
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
_0112:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_011A:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 6
	WaitButton
	CloseMsg
	ReleaseAll
	End

_012E:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_0138:
	GetWeekday VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfEq _015B
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 7
	GoTo _0112

_015B:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 32
	BufferMonSpeciesName 0, VAR_SPECIAL_x8002
	MsgBoxExtern VAR_SPECIAL_RESULT, 34
	GiveRibbon VAR_SPECIAL_x8002, RIBBON_SHOCK
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	SetFlag FLAG_DAILY_GOT_SHOCK_RIBBON
	WaitButton
	CloseMsg
	ReleaseAll
	End

_018A:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 33
	WaitButton
	CloseMsg
	ReleaseAll
	End

_019E:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 35
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R29_001:
	ScrCmd_609
	LockAll
	PlayCry SPECIES_MARILL, 0
	WaitCry
	ApplyMovement obj_R29_tsure_poke_static_marill, _05C4
	WaitMovement
	ApplyMovement obj_R29_var_2, _05D8
	WaitMovement
	CallStd std_play_friend_music
	GenderMsgBox msg_0373_R29_00017, msg_0373_R29_00018
	CloseMsg
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Release obj_R29_tsure_poke_static_marill
	Compare VAR_TEMP_x4001, 396
	GoToIfNe _0209
	ApplyMovement obj_R29_var_2, _0660
	ApplyMovement obj_R29_tsure_poke_static_marill, _06D4
	GoTo _02D5

_0209:
	Compare VAR_TEMP_x4001, 397
	GoToIfNe _022C
	ApplyMovement obj_R29_var_2, _067C
	ApplyMovement obj_R29_tsure_poke_static_marill, _06F4
	GoTo _02D5

_022C:
	Compare VAR_TEMP_x4001, 398
	GoToIfNe _024F
	ApplyMovement obj_R29_var_2, _068C
	ApplyMovement obj_R29_tsure_poke_static_marill, _0708
	GoTo _02D5

_024F:
	Compare VAR_TEMP_x4001, 399
	GoToIfNe _0272
	ApplyMovement obj_R29_var_2, _069C
	ApplyMovement obj_R29_tsure_poke_static_marill, _071C
	GoTo _02D5

_0272:
	Compare VAR_TEMP_x4001, 400
	GoToIfNe _0295
	ApplyMovement obj_R29_var_2, _06AC
	ApplyMovement obj_R29_tsure_poke_static_marill, _0730
	GoTo _02D5

_0295:
	Compare VAR_TEMP_x4001, 401
	GoToIfNe _02B8
	ApplyMovement obj_R29_var_2, _06B4
	ApplyMovement obj_R29_tsure_poke_static_marill, _073C
	GoTo _02D5

_02B8:
	Compare VAR_TEMP_x4001, 402
	GoToIfNe _02D5
	ApplyMovement obj_R29_var_2, _06C4
	ApplyMovement obj_R29_tsure_poke_static_marill, _0750
_02D5:
	WaitMovement
	Lock obj_R29_tsure_poke_static_marill
	BufferPlayersName 0
	GenderMsgBox msg_0373_R29_00000, msg_0373_R29_00001
	CloseMsg
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	GetPlayerGender VAR_TEMP_x4002
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	Compare VAR_TEMP_x4001, 396
	GoToIfNe _033E
	ApplyMovement obj_R29_var_2, _0764
	ApplyMovement obj_R29_tsure_poke_static_marill, _07B4
	Compare VAR_TEMP_x4002, 0
	GoToIfNe _0330
	ApplyMovement obj_player, _0820
	GoTo _0338

_0330:
	ApplyMovement obj_player, _08A4
_0338:
	GoTo _04DC

_033E:
	Compare VAR_TEMP_x4001, 397
	GoToIfNe _0384
	ApplyMovement obj_R29_var_2, _0770
	ApplyMovement obj_R29_tsure_poke_static_marill, _07C4
	Compare VAR_TEMP_x4002, 0
	GoToIfNe _0376
	ApplyMovement obj_player, _0834
	GoTo _037E

_0376:
	ApplyMovement obj_player, _08B8
_037E:
	GoTo _04DC

_0384:
	Compare VAR_TEMP_x4001, 398
	GoToIfNe _03CA
	ApplyMovement obj_R29_var_2, _077C
	ApplyMovement obj_R29_tsure_poke_static_marill, _07D4
	Compare VAR_TEMP_x4002, 0
	GoToIfNe _03BC
	ApplyMovement obj_player, _0848
	GoTo _03C4

_03BC:
	ApplyMovement obj_player, _08CC
_03C4:
	GoTo _04DC

_03CA:
	Compare VAR_TEMP_x4001, 399
	GoToIfNe _0410
	ApplyMovement obj_R29_var_2, _0788
	ApplyMovement obj_R29_tsure_poke_static_marill, _07E4
	Compare VAR_TEMP_x4002, 0
	GoToIfNe _0402
	ApplyMovement obj_player, _085C
	GoTo _040A

_0402:
	ApplyMovement obj_player, _08E0
_040A:
	GoTo _04DC

_0410:
	Compare VAR_TEMP_x4001, 400
	GoToIfNe _0456
	ApplyMovement obj_R29_var_2, _0794
	ApplyMovement obj_R29_tsure_poke_static_marill, _07F4
	Compare VAR_TEMP_x4002, 0
	GoToIfNe _0448
	ApplyMovement obj_player, _0870
	GoTo _0450

_0448:
	ApplyMovement obj_player, _08F4
_0450:
	GoTo _04DC

_0456:
	Compare VAR_TEMP_x4001, 401
	GoToIfNe _049C
	ApplyMovement obj_R29_var_2, _07A0
	ApplyMovement obj_R29_tsure_poke_static_marill, _0804
	Compare VAR_TEMP_x4002, 0
	GoToIfNe _048E
	ApplyMovement obj_player, _0884
	GoTo _0496

_048E:
	ApplyMovement obj_player, _0908
_0496:
	GoTo _04DC

_049C:
	Compare VAR_TEMP_x4001, 402
	GoToIfNe _04DC
	ApplyMovement obj_R29_var_2, _07AC
	ApplyMovement obj_R29_tsure_poke_static_marill, _0814
	Compare VAR_TEMP_x4002, 0
	GoToIfNe _04D4
	ApplyMovement obj_player, _0898
	GoTo _04DC

_04D4:
	ApplyMovement obj_player, _091C
_04DC:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	Compare VAR_TEMP_x4002, 0
	CallIfEq _0559
	Wait 10, VAR_SPECIAL_RESULT
	CatchingTutorial
	ApplyMovement obj_R29_var_2, _064C
	ApplyMovement obj_R29_tsure_poke_static_marill, _0654
	WaitMovement
	GenderMsgBox msg_0373_R29_00003, msg_0373_R29_00004
	GiveItemNoCheck ITEM_POKE_BALL, 5
	GenderMsgBox msg_0373_R29_00007, msg_0373_R29_00008
	CloseMsg
	ApplyMovement obj_R29_var_2, _0928
	ApplyMovement obj_R29_tsure_poke_static_marill, _093C
	WaitMovement
	HidePerson obj_R29_var_2
	HidePerson obj_R29_tsure_poke_static_marill
	SetFlag FLAG_HIDE_ROUTE_29_FRIEND
	SetFlag FLAG_HIDE_ROUTE_29_MARILL
	SetVar VAR_UNK_408B, 0
	SetFlag FLAG_UNK_09A
	ReleaseAll
	End

_0559:
	ApplyMovement obj_R29_var_2, _05BC
	WaitMovement
	ApplyMovement obj_R29_var_2, _05E4
	ApplyMovement obj_R29_tsure_poke_static_marill, _0600
	WaitMovement
	ApplyMovement obj_R29_var_2, _061C
	ApplyMovement obj_R29_tsure_poke_static_marill, _0624
	WaitMovement
	NPCMsg msg_0373_R29_00002
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_R29_var_2, _062C
	ApplyMovement obj_R29_tsure_poke_static_marill, _0634
	ApplyMovement obj_player, _0640
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	Return

	.balign 4, 0
_05BC:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_05C4:
	WalkFastSouth
	WalkFastEast 2
	WalkFastNorth
	JumpOnSpotFastWest 2
	EndMovement

	.balign 4, 0
_05D8:
	WalkOnSpotNormalEast
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_05E4:
	JumpOnSpotFastWest 3
	Delay16
	JumpOnSpotFastWest 3
	Delay8 3
	JumpOnSpotFastWest 3
	Delay8 3
	EndMovement

	.balign 4, 0
_0600:
	Delay8 3
	JumpFarWest
	Delay8 3
	JumpOnSpotFastWest 3
	Delay8 3
	JumpOnSpotFastWest 3
	EndMovement

	.balign 4, 0
_061C:
	WalkNormalEast 3
	EndMovement

	.balign 4, 0
_0624:
	WalkNormalEast 3
	EndMovement

	.balign 4, 0
_062C:
	WalkNormalWest 3
	EndMovement

	.balign 4, 0
_0634:
	WalkNormalEast
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_0640:
	Delay8
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_064C:
	WalkNormalEast
	EndMovement

	.balign 4, 0
_0654:
	WalkNormalWest
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0660:
	WalkFastNorth 4
	WalkFastEast 2
	WalkFastSouth 2
	WalkFastWest 2
	WalkFastNorth 2
	WalkFastEast 4
	EndMovement

	.balign 4, 0
_067C:
	WalkNormalEast 2
	WalkNormalNorth 3
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_068C:
	WalkNormalEast 2
	WalkNormalNorth 2
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_069C:
	WalkNormalEast 2
	WalkNormalNorth
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_06AC:
	WalkNormalEast 4
	EndMovement

	.balign 4, 0
_06B4:
	WalkNormalEast 2
	WalkNormalSouth
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_06C4:
	WalkNormalEast 2
	WalkNormalSouth 2
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_06D4:
	WalkFastWest
	WalkFastNorth 4
	WalkFastEast 2
	WalkFastSouth 2
	WalkFastWest 2
	WalkFastNorth 2
	WalkFastEast 3
	EndMovement

	.balign 4, 0
_06F4:
	WalkNormalWest
	WalkNormalEast 2
	WalkNormalNorth 3
	WalkNormalEast
	EndMovement

	.balign 4, 0
_0708:
	WalkNormalWest
	WalkNormalEast 2
	WalkNormalNorth 2
	WalkNormalEast
	EndMovement

	.balign 4, 0
_071C:
	WalkNormalWest
	WalkNormalEast 2
	WalkNormalNorth
	WalkNormalEast
	EndMovement

	.balign 4, 0
_0730:
	WalkNormalWest
	WalkNormalEast 3
	EndMovement

	.balign 4, 0
_073C:
	WalkNormalWest
	WalkNormalEast 2
	WalkNormalSouth
	WalkNormalEast
	EndMovement

	.balign 4, 0
_0750:
	WalkNormalWest
	WalkNormalEast 2
	WalkNormalSouth 2
	WalkNormalEast
	EndMovement

	.balign 4, 0
_0764:
	WalkNormalSouth 6
	WalkNormalWest 9
	EndMovement

	.balign 4, 0
_0770:
	WalkNormalSouth 5
	WalkNormalWest 9
	EndMovement

	.balign 4, 0
_077C:
	WalkNormalSouth 4
	WalkNormalWest 9
	EndMovement

	.balign 4, 0
_0788:
	WalkNormalSouth 3
	WalkNormalWest 9
	EndMovement

	.balign 4, 0
_0794:
	WalkNormalSouth 2
	WalkNormalWest 9
	EndMovement

	.balign 4, 0
_07A0:
	WalkNormalSouth
	WalkNormalWest 9
	EndMovement

	.balign 4, 0
_07AC:
	WalkNormalWest 9
	EndMovement

	.balign 4, 0
_07B4:
	WalkNormalEast
	WalkNormalSouth 6
	WalkNormalWest 8
	EndMovement

	.balign 4, 0
_07C4:
	WalkNormalEast
	WalkNormalSouth 5
	WalkNormalWest 8
	EndMovement

	.balign 4, 0
_07D4:
	WalkNormalEast
	WalkNormalSouth 4
	WalkNormalWest 8
	EndMovement

	.balign 4, 0
_07E4:
	WalkNormalEast
	WalkNormalSouth 3
	WalkNormalWest 8
	EndMovement

	.balign 4, 0
_07F4:
	WalkNormalEast
	WalkNormalSouth 2
	WalkNormalWest 8
	EndMovement

	.balign 4, 0
_0804:
	WalkNormalEast
	WalkNormalSouth
	WalkNormalWest 8
	EndMovement

	.balign 4, 0
_0814:
	WalkNormalEast
	WalkNormalWest 8
	EndMovement

	.balign 4, 0
_0820:
	Delay8
	WalkNormalWest
	WalkNormalSouth 6
	WalkNormalWest 5
	EndMovement

	.balign 4, 0
_0834:
	Delay8
	WalkNormalWest
	WalkNormalSouth 5
	WalkNormalWest 5
	EndMovement

	.balign 4, 0
_0848:
	Delay8
	WalkNormalWest
	WalkNormalSouth 4
	WalkNormalWest 5
	EndMovement

	.balign 4, 0
_085C:
	Delay8
	WalkNormalWest
	WalkNormalSouth 3
	WalkNormalWest 5
	EndMovement

	.balign 4, 0
_0870:
	Delay8
	WalkNormalWest
	WalkNormalSouth 2
	WalkNormalWest 5
	EndMovement

	.balign 4, 0
_0884:
	Delay8
	WalkNormalWest
	WalkNormalSouth
	WalkNormalWest 5
	EndMovement

	.balign 4, 0
_0898:
	Delay8
	WalkNormalWest 6
	EndMovement

	.balign 4, 0
_08A4:
	Delay8
	WalkNormalWest
	WalkNormalSouth 6
	WalkNormalWest 7
	EndMovement

	.balign 4, 0
_08B8:
	Delay8
	WalkNormalWest
	WalkNormalSouth 5
	WalkNormalWest 7
	EndMovement

	.balign 4, 0
_08CC:
	Delay8
	WalkNormalWest
	WalkNormalSouth 4
	WalkNormalWest 7
	EndMovement

	.balign 4, 0
_08E0:
	Delay8
	WalkNormalWest
	WalkNormalSouth 3
	WalkNormalWest 7
	EndMovement

	.balign 4, 0
_08F4:
	Delay8
	WalkNormalWest
	WalkNormalSouth 2
	WalkNormalWest 7
	EndMovement

	.balign 4, 0
_0908:
	Delay8
	WalkNormalWest
	WalkNormalSouth
	WalkNormalWest 7
	EndMovement

	.balign 4, 0
_091C:
	Delay8
	WalkNormalWest 8
	EndMovement

	.balign 4, 0
_0928:
	WalkNormalSouth 2
	WalkNormalWest 4
	WalkNormalSouth 4
	WalkNormalWest 3
	EndMovement

	.balign 4, 0
_093C:
	WalkNormalEast
	WalkNormalSouth 2
	WalkNormalWest 4
	WalkNormalSouth 4
	WalkNormalWest 2
	EndMovement

scr_seq_R29_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScrCmd_379 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0976
	NPCMsg msg_0373_R29_00012
	GoTo _09A5

_0976:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _098C
	NPCMsg msg_0373_R29_00013
	GoTo _09A5

_098C:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _09A2
	NPCMsg msg_0373_R29_00013
	GoTo _09A5

_09A2:
	NPCMsg msg_0373_R29_00014
_09A5:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R29_004:
	DirectionSignpost msg_0373_R29_00016, 1, 1, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R29_005:
	DirectionSignpost msg_0373_R29_00015, 1, 2, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R29_006:
	SimpleNPCMsg msg_0373_R29_00009
	End

scr_seq_R29_007:
	SimpleNPCMsg msg_0373_R29_00011
	End

scr_seq_R29_008:
	SimpleNPCMsg msg_0373_R29_00010
	End
	.balign 4, 0
