#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D35R0103.h"
#include "msgdata/msg/msg_0113_D35R0103.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D35R0103_000
	ScrDef scr_seq_D35R0103_001
	ScrDef scr_seq_D35R0103_002
	ScrDef scr_seq_D35R0103_003
	ScrDef scr_seq_D35R0103_004
	ScrDef scr_seq_D35R0103_005
	ScrDef scr_seq_D35R0103_006
	ScrDef scr_seq_D35R0103_007
	ScrDef scr_seq_D35R0103_008
	ScrDef scr_seq_D35R0103_009
	ScrDef scr_seq_D35R0103_010
	ScrDef scr_seq_D35R0103_011
	ScrDef scr_seq_D35R0103_012
	ScrDef scr_seq_D35R0103_013
	ScrDef scr_seq_D35R0103_014
	ScrDefEnd

scr_seq_D35R0103_002:
	ScrCmd_710
	Compare VAR_UNK_40A9, 3
	GoToIfGe _004F
	End

_004F:
	MovePersonFacing obj_D35R0103_babyboy1_9, 29, 0, 22, DIR_NORTH
	MovePersonFacing obj_D35R0103_babyboy1_9_2, 29, 0, 22, DIR_NORTH
	Compare VAR_UNK_40AC, 10
	GoToIfGe _00B0
	Compare VAR_UNK_40A9, 4
	GoToIfGe _0083
	End

_0083:
	Compare VAR_TEMP_x4007, 0
	GoToIfNe _00B0
	SetVar VAR_TEMP_x4007, 77
	MovePersonFacing obj_D35R0103_wataru, 39, 0, 18, DIR_NORTH
	MovePersonFacing obj_D35R0103_tsure_poke_static_dragonite, 40, 0, 18, DIR_NORTH
	End

_00B0:
	End

scr_seq_D35R0103_007:
	GoToIfSet FLAG_ENGAGING_STATIC_POKEMON, _00BF
	End

_00BF:
	StaticWildWonOrCaughtCheck VAR_TEMP_x4000, 1
	Compare VAR_TEMP_x4000, 1
	GoToIfEq _0127
	Compare VAR_TEMP_x400A, 1
	GoToIfNe _00F4
	SetFlag FLAG_UNK_96B
	HidePerson obj_D35R0103_tsure_poke_static_electrode
	HidePerson obj_D35R0103_tsure_poke_static_electrode_4
	SetFlag FLAG_HIDE_ROCKET_HIDEOUT_B3F_ELECTRODE_1_AND_4
	GoTo _0127

_00F4:
	Compare VAR_TEMP_x400A, 2
	GoToIfNe _0117
	SetFlag FLAG_UNK_96C
	HidePerson obj_D35R0103_tsure_poke_static_electrode_2
	HidePerson obj_D35R0103_tsure_poke_static_electrode_5
	SetFlag FLAG_HIDE_ROCKET_HIDEOUT_B3F_ELECTRODE_2_AND_5
	GoTo _0127

_0117:
	SetFlag FLAG_UNK_96D
	HidePerson obj_D35R0103_tsure_poke_static_electrode_3
	HidePerson obj_D35R0103_tsure_poke_static_electrode_6
	SetFlag FLAG_HIDE_ROCKET_HIDEOUT_B3F_ELECTRODE_3_AND_6
_0127:
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	End

scr_seq_D35R0103_000:
	ScrCmd_609
	LockAll
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _01AC
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0113_D35R0103_00000
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	PlayFanfare SEQ_ME_ASA
	WaitFanfare
	HealParty
	ScrCmd_436
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	BufferPlayersName 0
	GenderMsgBox msg_0113_D35R0103_00001, msg_0113_D35R0103_00002
	CloseMsg
	ApplyMovement obj_D35R0103_wataru, _01B8
	ApplyMovement obj_D35R0103_tsure_poke_static_dragonite, _01C0
	WaitMovement
	HidePerson obj_D35R0103_wataru
	HidePerson obj_D35R0103_tsure_poke_static_dragonite
	SetFlag FLAG_UNK_1E5
	ReleaseAll
	SetVar VAR_UNK_40A9, 1
	End

	.balign 4, 0
_01AC:
	WalkNormalEast 5
	WalkNormalNorth 4
	EndMovement

	.balign 4, 0
_01B8:
	WalkNormalEast 11
	EndMovement

	.balign 4, 0
_01C0:
	Delay2
	WalkNormalEast 11
	EndMovement

scr_seq_D35R0103_013:
	ScrCmd_609
	LockAll
	ApplyMovement obj_D35R0103_tsure_poke_static_murkrow, _0214
	WaitMovement
	NPCMsg msg_0113_D35R0103_00024
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_D35R0103_tsure_poke_static_murkrow, _021C
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	SetVar VAR_UNK_40AC, 5
	HidePerson obj_D35R0103_tsure_poke_static_murkrow
	SetFlag FLAG_HIDE_ROCKET_HIDEOUT_B2F_MURKROW_1
	ClearFlag FLAG_HIDE_ROCKET_HIDEOUT_B3F_MURKROW_2
	ReleaseAll
	End

	.balign 4, 0
_0214:
	JumpOnSpotFastWest 2
	EndMovement

	.balign 4, 0
_021C:
	FaceEast
	JumpOnSpotFastEast
	WalkFastEast 5
	EndMovement

	.balign 4, 0
_022C:
	Delay8
	WalkNormalEast 3
	EndMovement

scr_seq_D35R0103_014:
	ScrCmd_609
	LockAll
	ApplyMovement obj_D35R0103_tsure_poke_static_murkrow_2, _0270
	WaitMovement
	NPCMsg msg_0113_D35R0103_00025
	CloseMsg
	ApplyMovement obj_D35R0103_tsure_poke_static_murkrow_2, _0278
	WaitMovement
	SetVar VAR_UNK_40AC, 7
	HidePerson obj_D35R0103_tsure_poke_static_murkrow_2
	SetFlag FLAG_HIDE_ROCKET_HIDEOUT_B2F_MURKROW_2
	ClearFlag FLAG_HIDE_ROCKET_HIDEOUT_B2F_MURKROW_3
	ShowPerson obj_D35R0103_tsure_poke_static_murkrow_3
	ReleaseAll
	End

	.balign 4, 0
_0270:
	JumpOnSpotFastEast 2
	EndMovement

	.balign 4, 0
_0278:
	FaceWest
	JumpOnSpotFastWest
	WalkFastWest 10
	EndMovement

scr_seq_D35R0103_011:
	ScrCmd_609
	LockAll
	ApplyMovement obj_D35R0103_tsure_poke_static_murkrow_3, _0308
	WaitMovement
	NPCMsg msg_0113_D35R0103_00026
	CloseMsg
	NPCMsg msg_0113_D35R0103_00027
	CloseMsg
	PlaySE SEQ_SE_DP_DOOR10
	ApplyMovement obj_D35R0103_babyboy1_9, _03B0
	ApplyMovement obj_D35R0103_babyboy1_9_2, _03B8
	WaitMovement
	GetPlayerCoords VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	Compare VAR_SPECIAL_x8001, 24
	GoToIfNe _02D7
	ApplyMovement obj_D35R0103_tsure_poke_static_murkrow_3, _0324
	GoTo _02DF

_02D7:
	ApplyMovement obj_D35R0103_tsure_poke_static_murkrow_3, _0310
_02DF:
	WaitMovement
	SetVar VAR_UNK_40AC, 8
	HidePerson obj_D35R0103_tsure_poke_static_murkrow_3
	SetFlag FLAG_HIDE_ROCKET_HIDEOUT_B2F_MURKROW_3
	SetVar VAR_UNK_40A9, 3
	SetFlag FLAG_HIDE_ROCKET_HIDEOUT_B2F_MURKROW_1
	SetFlag FLAG_HIDE_ROCKET_HIDEOUT_B3F_MURKROW_2
	SetFlag FLAG_UNK_0D3
	ReleaseAll
	End

	.balign 4, 0
_0308:
	JumpOnSpotFastNorth 2
	EndMovement

	.balign 4, 0
_0310:
	JumpOnSpotFastNorth 2
	FaceWest
	Delay8
	WalkFastWest 12
	EndMovement

	.balign 4, 0
_0324:
	JumpOnSpotFastNorth 2
	FaceWest
	Delay8
	WalkFastWest 2
	JumpOnSpotFastWest 2
	WalkFastSouth
	WalkFastWest 10
	EndMovement

scr_seq_D35R0103_012:
	GoTo scr_seq_D35R0103_011
	End

	.balign 4, 0
_034C:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0354:
	WalkFastWest 9
	WalkFastNorth 5
	EndMovement

scr_seq_D35R0103_001:
	Compare VAR_UNK_40AC, 8
	GoToIfGe _03A0
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfUnset FLAG_UNK_0D3, _03A2
	BufferPlayersName 0
	NPCMsg msg_0113_D35R0103_00021
	CloseMsg
	PlaySE SEQ_SE_DP_DOOR10
	ApplyMovement obj_D35R0103_babyboy1_9, _03B0
	ApplyMovement obj_D35R0103_babyboy1_9_2, _03B8
	WaitMovement
	ReleaseAll
_03A0:
	End

_03A2:
	NPCMsg msg_0113_D35R0103_00020
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_03B0:
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_03B8:
	Delay8
	WalkNormalWest
	EndMovement

scr_seq_D35R0103_003:
	ScrCmd_609
	LockAll
	NPCMsg msg_0113_D35R0103_00003
	ApplyMovement obj_player, _0630
	WaitMovement
	CloseMsg
	ClearFlag FLAG_HIDE_ROCKET_HIDEOUT_B2F_ARIANA
	ShowPerson obj_D35R0103_rkanbuw
	ShowPerson obj_D35R0103_rocketm_4
	MovePersonFacing obj_D35R0103_rkanbuw, 32, 1, 30, DIR_EAST
	MovePersonFacing obj_D35R0103_rocketm_4, 30, 1, 30, DIR_NORTH
	StopBGM 0
	PlayBGM SEQ_GS_EYE_ROCKET
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4000, 30
	GoToIfNe _042E
	ApplyMovement obj_player, _065C
	GoTo _0436

_042E:
	ApplyMovement obj_player, _0668
_0436:
	ApplyMovement obj_D35R0103_rkanbuw, _0638
	ApplyMovement obj_D35R0103_rocketm_4, _0650
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ApplyMovement obj_D35R0103_rkanbuw, _0648
	WaitMovement
	NPCMsg msg_0113_D35R0103_00004
	CloseMsg
	ClearFlag FLAG_UNK_1E5
	ShowPerson obj_D35R0103_wataru
	ShowPerson obj_D35R0103_tsure_poke_static_dragonite
	MovePersonFacing obj_D35R0103_wataru, 20, 1, 25, DIR_EAST
	MovePersonFacing obj_D35R0103_tsure_poke_static_dragonite, 19, 1, 25, DIR_NORTH
	ApplyMovement obj_D35R0103_wataru, _067C
	ApplyMovement obj_D35R0103_tsure_poke_static_dragonite, _0684
	WaitMovement
	NPCMsg msg_0113_D35R0103_00005
	CloseMsg
	ApplyMovement obj_D35R0103_tsure_poke_static_dragonite, _0690
	PlayCry SPECIES_DRAGONITE, 0
	WaitCry
	ApplyMovement obj_D35R0103_rkanbuw, _0648
	WaitMovement
	NPCMsg msg_0113_D35R0103_00006
	CloseMsg
	ApplyMovement obj_D35R0103_rkanbuw, _0698
	ApplyMovement obj_D35R0103_rocketm_4, _06A0
	WaitMovement
	MultiBattle TRAINER_PKMN_TRAINER_LANCE_LANCE, TRAINER_EXECUTIVE_ARIANA_ARIANA_2, TRAINER_TEAM_ROCKET_GRUNT_25, 1
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0620
	NPCMsg msg_0113_D35R0103_00008
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	MovePersonFacing obj_D35R0103_wataru, 28, 1, 24, DIR_SOUTH
	MovePersonFacing obj_D35R0103_tsure_poke_static_dragonite, 27, 1, 24, DIR_EAST
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _06A8
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	HidePerson obj_D35R0103_rkanbuw
	HidePerson obj_D35R0103_rocketm_4
	HidePerson obj_D35R0103_rocketm_2
	HidePerson obj_D35R0103_rocketm_3
	HidePerson obj_D35R0103_rocketm
	SetFlag FLAG_HIDE_ROCKET_HIDEOUT_B2F_ARIANA
	SetFlag FLAG_HIDE_MAHOGANY_SHOP_SHADY_SALESMAN
	SetFlag FLAG_UNK_1E8
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ApplyMovement obj_D35R0103_wataru, _06BC
	ApplyMovement obj_D35R0103_tsure_poke_static_dragonite, _06C4
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0113_D35R0103_00010, msg_0113_D35R0103_00011
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0738
	ApplyMovement obj_D35R0103_wataru, _06D0
	ApplyMovement obj_D35R0103_tsure_poke_static_dragonite, _070C
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	PlayCry SPECIES_DRAGONITE, 0
	WaitCry
	ApplyMovement obj_D35R0103_wataru, _06FC
	ApplyMovement obj_D35R0103_tsure_poke_static_dragonite, _072C
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0113_D35R0103_00012, msg_0113_D35R0103_00013
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0744
	ApplyMovement obj_D35R0103_wataru, _0758
	ApplyMovement obj_D35R0103_tsure_poke_static_dragonite, _0760
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	MovePersonFacing obj_D35R0103_wataru, 39, 0, 18, DIR_NORTH
	MovePersonFacing obj_D35R0103_tsure_poke_static_dragonite, 40, 0, 18, DIR_NORTH
	ReleaseAll
	SetVar VAR_UNK_40AC, 9
	SetVar VAR_UNK_40A9, 4
	SetFlag FLAG_UNK_998
	End

_0620:
	WhiteOut
	SetFlag FLAG_HIDE_ROCKET_HIDEOUT_B2F_ARIANA
	SetFlag FLAG_UNK_1E5
	ReleaseAll
	End

	.balign 4, 0
_0630:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0638:
	Delay8
	WalkFastNorth 6
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0648:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0650:
	Delay8 2
	WalkFastNorth 3
	EndMovement

	.balign 4, 0
_065C:
	WalkNormalSouth 5
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0668:
	WalkNormalSouth 2
	WalkNormalWest
	WalkNormalSouth 3
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_067C:
	WalkFastEast 10
	EndMovement

	.balign 4, 0
_0684:
	Delay4
	WalkFastEast 10
	EndMovement

	.balign 4, 0
_0690:
	JumpOnSpotFastEast
	EndMovement

	.balign 4, 0
_0698:
	WalkFastWest
	EndMovement

	.balign 4, 0
_06A0:
	WalkFastNorth
	EndMovement

	.balign 4, 0
_06A8:
	WalkFastNorth 2
	WalkFastEast
	WalkFastSouth 2
	FaceWest
	EndMovement

	.balign 4, 0
_06BC:
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_06C4:
	Delay2
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_06D0:
	WalkNormalNorth 6
	Delay8 2
	WalkNormalWest 2
	WalkOnSpotNormalNorth
	Delay8 2
	WalkOnSpotNormalEast
	WalkNormalEast 5
	WalkOnSpotNormalNorth
	Delay8 2
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_06FC:
	WalkNormalWest 2
	WalkOnSpotNormalSouth
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_070C:
	Delay2
	WalkNormalEast
	WalkNormalNorth 5
	WalkNormalEast 8
	WalkNormalNorth
	Delay8 4
	WalkNormalWest 4
	EndMovement

	.balign 4, 0
_072C:
	Delay4
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_0738:
	Delay8 4
	WalkNormalNorth 5
	EndMovement

	.balign 4, 0
_0744:
	Delay2
	Delay8
	WalkNormalNorth
	WalkNormalWest 5
	EndMovement

	.balign 4, 0
_0758:
	WalkNormalEast 6
	EndMovement

	.balign 4, 0
_0760:
	Delay2
	WalkNormalWest
	WalkNormalEast 5
	EndMovement

scr_seq_D35R0103_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_TEMP_x400A, 1
	SetFlag FLAG_ENGAGING_STATIC_POKEMON
	WildBattle SPECIES_ELECTRODE, 23, 0
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _089C
	StaticWildWonOrCaughtCheck VAR_TEMP_x4000, 0
	Compare VAR_TEMP_x4000, TRUE
	GoToIfEq _07D0
	SetFlag FLAG_REMOVED_ROCKET_HIDEOUT_B3F_ELECTRODE_1
	GoToIfUnset FLAG_REMOVED_ROCKET_HIDEOUT_B3F_ELECTRODE_2, _07D0
	GoToIfUnset FLAG_REMOVED_ROCKET_HIDEOUT_B3F_ELECTRODE_3, _07D0
	GoTo _08A2

_07D0:
	ReleaseAll
	End

scr_seq_D35R0103_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_TEMP_x400A, 2
	SetFlag FLAG_ENGAGING_STATIC_POKEMON
	WildBattle SPECIES_ELECTRODE, 23, 0
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _089C
	StaticWildWonOrCaughtCheck VAR_TEMP_x4000, 0
	Compare VAR_TEMP_x4000, TRUE
	GoToIfEq _0834
	SetFlag FLAG_REMOVED_ROCKET_HIDEOUT_B3F_ELECTRODE_2
	GoToIfUnset FLAG_REMOVED_ROCKET_HIDEOUT_B3F_ELECTRODE_1, _0834
	GoToIfUnset FLAG_REMOVED_ROCKET_HIDEOUT_B3F_ELECTRODE_3, _0834
	GoTo _08A2

_0834:
	ReleaseAll
	End

scr_seq_D35R0103_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_TEMP_x400A, 3
	SetFlag FLAG_ENGAGING_STATIC_POKEMON
	WildBattle SPECIES_ELECTRODE, 23, 0
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _089C
	StaticWildWonOrCaughtCheck VAR_TEMP_x4000, 0
	Compare VAR_TEMP_x4000, TRUE
	GoToIfEq _0898
	SetFlag FLAG_REMOVED_ROCKET_HIDEOUT_B3F_ELECTRODE_3
	GoToIfUnset FLAG_REMOVED_ROCKET_HIDEOUT_B3F_ELECTRODE_1, _0898
	GoToIfUnset FLAG_REMOVED_ROCKET_HIDEOUT_B3F_ELECTRODE_2, _0898
	GoTo _08A2

_0898:
	ReleaseAll
	End

_089C:
	WhiteOut
	ReleaseAll
	End

_08A2:
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	Compare VAR_TEMP_x4001, 16
	GoToIfNe _08CD
	ApplyMovement obj_player, _09E0
	GoTo _08F0

_08CD:
	Compare VAR_TEMP_x4001, 14
	GoToIfNe _08E8
	ApplyMovement obj_player, _09EC
	GoTo _08F0

_08E8:
	ApplyMovement obj_player, _09F8
_08F0:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ApplyMovement obj_D35R0103_wataru, _0A04
	ApplyMovement obj_D35R0103_tsure_poke_static_dragonite, _0A0C
	WaitMovement
	NPCMsg msg_0113_D35R0103_00015
	GiveItemNoCheck ITEM_HM05, 1
	NPCMsg msg_0113_D35R0103_00017
	CloseMsg
	ApplyMovement obj_D35R0103_wataru, _0A18
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0113_D35R0103_00018, msg_0113_D35R0103_00019
	CloseMsg
	ApplyMovement obj_D35R0103_wataru, _0A20
	ApplyMovement obj_D35R0103_tsure_poke_static_dragonite, _0A2C
	WaitMovement
	HidePerson obj_D35R0103_wataru
	HidePerson obj_D35R0103_tsure_poke_static_dragonite
	SetFlag FLAG_UNK_1E5
	ReleaseAll
	StopSE SEQ_SE_GS_N_MOTER
	SetFlag FLAG_RED_GYARADOS_MEET
	ClearFlag FLAG_HIDE_ROUTE_43_GATE_GUARD
	SetFlag FLAG_HIDE_ROUTE_43_GATE_ROCKETS
	SetFlag FLAG_UNK_1F9
	SetVar VAR_UNK_40AC, 10
	SetVar VAR_UNK_410F, 1
	ScrCmd_530 0, 1
	SetVar VAR_ROCKET_TRAP_KOFFING_1, 1
	SetVar VAR_ROCKET_TRAP_VOLTORB_1, 1
	SetVar VAR_ROCKET_TRAP_GEODUDE_1, 1
	SetVar VAR_ROCKET_TRAP_VOLTORB_2, 1
	SetVar VAR_ROCKET_TRAP_GEODUDE_2, 1
	SetVar VAR_ROCKET_TRAP_VOLTORB_3, 1
	SetVar VAR_ROCKET_TRAP_VOLTORB_4, 1
	SetVar VAR_ROCKET_TRAP_KOFFING_2, 1
	SetVar VAR_ROCKET_TRAP_KOFFING_3, 1
	SetVar VAR_ROCKET_TRAP_GEODUDE_3, 1
	SetVar VAR_ROCKET_TRAP_GEODUDE_4, 1
	SetVar VAR_ROCKET_TRAP_KOFFING_4, 1
	SetVar VAR_ROCKET_TRAP_VOLTORB_5, 1
	SetVar VAR_ROCKET_TRAP_VOLTORB_6, 1
	SetVar VAR_ROCKET_TRAP_KOFFING_5, 1
	SetVar VAR_ROCKET_TRAP_GEODUDE_5, 1
	End

	.balign 4, 0
_09E0:
	WalkNormalSouth 2
	WalkNormalEast 10
	EndMovement

	.balign 4, 0
_09EC:
	WalkNormalSouth 4
	WalkNormalEast 10
	EndMovement

	.balign 4, 0
_09F8:
	WalkNormalSouth 6
	WalkNormalEast 10
	EndMovement

	.balign 4, 0
_0A04:
	WalkNormalWest 8
	EndMovement

	.balign 4, 0
_0A0C:
	Delay2
	WalkNormalWest 8
	EndMovement

	.balign 4, 0
_0A18:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0A20:
	WalkFastSouth 6
	WalkFastWest 12
	EndMovement

	.balign 4, 0
_0A2C:
	Delay4
	WalkFastWest
	WalkFastSouth 6
	WalkFastWest 12
	EndMovement

scr_seq_D35R0103_008:
	ScrCmd_609
	LockAll
	NPCMsg msg_0113_D35R0103_00014
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0A6C
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ReleaseAll
	End

	.balign 4, 0
_0A6C:
	WalkNormalWest
	EndMovement

scr_seq_D35R0103_009:
	ScrCmd_609
	LockAll
	ApplyMovement obj_D35R0103_wataru, _0AAC
	WaitMovement
	NPCMsg msg_0113_D35R0103_00014
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0A6C
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ReleaseAll
	End

	.balign 4, 0
_0AAC:
	EmoteExclamationMark
	WalkOnSpotNormalWest
	EndMovement

scr_seq_D35R0103_010:
	ReleaseAll
	GoToIfUnset FLAG_REMOVED_ROCKET_HIDEOUT_B3F_ELECTRODE_1, _0AE4
	GoToIfUnset FLAG_REMOVED_ROCKET_HIDEOUT_B3F_ELECTRODE_2, _0AE4
	GoToIfUnset FLAG_REMOVED_ROCKET_HIDEOUT_B3F_ELECTRODE_3, _0AE4
	NPCMsg msg_0113_D35R0103_00023
	CloseMsg
	ReleaseAll
	End

_0AE4:
	NPCMsg msg_0113_D35R0103_00022
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
