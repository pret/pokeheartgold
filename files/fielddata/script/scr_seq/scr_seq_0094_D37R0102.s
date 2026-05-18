#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D37R0102.h"
#include "msgdata/msg/msg_0117_D37R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D37R0102_000
	ScrDef scr_seq_D37R0102_001
	ScrDef scr_seq_D37R0102_002
	ScrDef scr_seq_D37R0102_003
	ScrDef scr_seq_D37R0102_004
	ScrDef scr_seq_D37R0102_005
	ScrDef scr_seq_D37R0102_006
	ScrDef scr_seq_D37R0102_007
	ScrDef scr_seq_D37R0102_008
	ScrDef scr_seq_D37R0102_009
	ScrDef scr_seq_D37R0102_010
	ScrDef scr_seq_D37R0102_011
	ScrDef scr_seq_D37R0102_012
	ScrDef scr_seq_D37R0102_013
	ScrDef scr_seq_D37R0102_014
	ScrDef scr_seq_D37R0102_015
	ScrDef scr_seq_D37R0102_016
	ScrDef scr_seq_D37R0102_017
	ScrDef scr_seq_D37R0102_018
	ScrDef scr_seq_D37R0102_019
	ScrDef scr_seq_D37R0102_020
	ScrDef scr_seq_D37R0102_021
	ScrDef scr_seq_D37R0102_022
	ScrDef scr_seq_D37R0102_023
	ScrDefEnd

scr_seq_D37R0102_008:
	SetFlag FLAG_UNK_1B0
	SetFlag FLAG_UNK_1B1
	SetFlag FLAG_UNK_1B2
	SetFlag FLAG_UNK_1B3
	SetFlag FLAG_UNK_1B4
	SetFlag FLAG_HIDE_ROCKET_TAKEOVER_2
	Compare VAR_SCENE_ROCKET_TAKEOVER, 2
	GoToIfEq _0144
	Compare VAR_SCENE_ROCKET_TAKEOVER, 4
	GoToIfEq _0144
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfEq _0144
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _00C0
	ClearFlag FLAG_UNK_1B1
	ClearFlag FLAG_UNK_1B3
	GoTo _0131

_00C0:
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _00D7
	ClearFlag FLAG_UNK_1B2
	GoTo _0131

_00D7:
	Compare VAR_TEMP_x4000, 3
	GoToIfNe _00EE
	ClearFlag FLAG_UNK_1B3
	GoTo _0131

_00EE:
	Compare VAR_TEMP_x4000, 4
	GoToIfNe _0105
	ClearFlag FLAG_UNK_1B2
	GoTo _0131

_0105:
	Compare VAR_TEMP_x4000, 5
	GoToIfNe _011C
	ClearFlag FLAG_UNK_1B3
	GoTo _0131

_011C:
	Compare VAR_TEMP_x4000, 6
	GoToIfNe _0131
	ClearFlag FLAG_UNK_1B1
	ClearFlag FLAG_UNK_1B2
_0131:
	Compare VAR_TEMP_x4000, 1
	CallIfEq _0161
	ClearFlag FLAG_HIDE_ROCKET_TAKEOVER_2
	End

_0144:
	Compare VAR_UNK_409F, 1
	GoToIfNe _015B
	SetFlag FLAG_UNK_1B4
	GoTo _015F

_015B:
	ClearFlag FLAG_UNK_1B4
_015F:
	End

_0161:
	ScrCmd_522 VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 4
	GoToIfGe _017C
	SetFlag FLAG_UNK_1B0
	GoTo _0197

_017C:
	Compare VAR_TEMP_x4001, 9
	GoToIfLe _0193
	SetFlag FLAG_UNK_1B0
	GoTo _0197

_0193:
	ClearFlag FLAG_UNK_1B0
_0197:
	Return

scr_seq_D37R0102_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetFlag FLAG_SPECIAL_MART_BITTER
	NPCMsg msg_0117_D37R0102_00000
	HoldMsg
	SetVar VAR_SPECIAL_x8004, 8
	CallStd std_special_mart
	ClearFlag FLAG_SPECIAL_MART_BITTER
	ReleaseAll
	End

scr_seq_D37R0102_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_DAILY_GOT_HAIRCUT, _0331
	ShowMoneyBox 20, 2
	NPCMsg msg_0117_D37R0102_00010
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01F5
	GoTo _030C
	End

_01F5:
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 500
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0324
	NPCMsg msg_0117_D37R0102_00011
	WaitABPress
	CloseMsg
	HideMoneyBox
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	PartySelectUI
	GetPartySelection VAR_SPECIAL_RESULT
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _0319
	CopyVar VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	GetPartyMonSpecies VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0319
	ShowMoneyBox 20, 2
	SubMoneyImmediate 500
	UpdateMoneyBox
	NPCMsg msg_0117_D37R0102_00012
	WaitABPress
	CloseMsg
	FadeScreen 6, 1, 0, RGB_WHITE
	WaitFade
	PlayFanfare SEQ_ME_ASA
	WaitFanfare
	HideMoneyBox
	FadeScreen 6, 1, 1, RGB_WHITE
	WaitFade
	NPCMsg msg_0117_D37R0102_00013
	WaitABPress
	SetFlag FLAG_DAILY_GOT_HAIRCUT
	Call _04C8
	Random VAR_SPECIAL_RESULT, 100
	Compare VAR_SPECIAL_RESULT, 40
	GoToIfGe _02F6
	Compare VAR_SPECIAL_RESULT, 10
	GoToIfGe _02E0
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfGe _02CA
_02CA:
	MonAddFriendship 1, VAR_SPECIAL_x8005
	BufferPartyMonNick 0, VAR_SPECIAL_x8005
	NPCMsg msg_0117_D37R0102_00024
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02E0:
	MonAddFriendship 5, VAR_SPECIAL_x8005
	BufferPartyMonNick 0, VAR_SPECIAL_x8005
	NPCMsg msg_0117_D37R0102_00025
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02F6:
	MonAddFriendship 10, VAR_SPECIAL_x8005
	BufferPartyMonNick 0, VAR_SPECIAL_x8005
	NPCMsg msg_0117_D37R0102_00026
	WaitButton
	CloseMsg
	ReleaseAll
	End

_030C:
	NPCMsg msg_0117_D37R0102_00014
	WaitButton
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_0319:
	NPCMsg msg_0117_D37R0102_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0324:
	NPCMsg msg_0117_D37R0102_00015
	WaitButton
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_0331:
	NPCMsg msg_0117_D37R0102_00016
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D37R0102_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_DAILY_GOT_HAIRCUT, _04BD
	ShowMoneyBox 20, 2
	NPCMsg msg_0117_D37R0102_00017
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0375
	GoTo _0498
	End

_0375:
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 300
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _04B0
	NPCMsg msg_0117_D37R0102_00018
	WaitABPress
	CloseMsg
	HideMoneyBox
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	PartySelectUI
	GetPartySelection VAR_SPECIAL_RESULT
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _04A5
	CopyVar VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	GetPartyMonSpecies VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _04A5
	ShowMoneyBox 20, 2
	SubMoneyImmediate 300
	UpdateMoneyBox
	NPCMsg msg_0117_D37R0102_00019
	WaitABPress
	CloseMsg
	FadeScreen 6, 1, 0, RGB_WHITE
	WaitFade
	PlayFanfare SEQ_ME_ASA
	WaitFanfare
	HideMoneyBox
	FadeScreen 6, 1, 1, RGB_WHITE
	WaitFade
	NPCMsg msg_0117_D37R0102_00020
	WaitABPress
	SetFlag FLAG_DAILY_GOT_HAIRCUT
	Random VAR_SPECIAL_RESULT, 100
	Compare VAR_SPECIAL_RESULT, 40
	GoToIfGe _0444
	Compare VAR_SPECIAL_RESULT, 10
	GoToIfGe _0460
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfGe _047C
_0444:
	Call _04C8
	MonAddFriendship 1, VAR_SPECIAL_x8005
	BufferPartyMonNick 0, VAR_SPECIAL_x8005
	NPCMsg msg_0117_D37R0102_00024
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0460:
	Call _04C8
	MonAddFriendship 5, VAR_SPECIAL_x8005
	BufferPartyMonNick 0, VAR_SPECIAL_x8005
	NPCMsg msg_0117_D37R0102_00025
	WaitButton
	CloseMsg
	ReleaseAll
	End

_047C:
	Call _04D8
	MonAddFriendship 10, VAR_SPECIAL_x8005
	BufferPartyMonNick 0, VAR_SPECIAL_x8005
	NPCMsg msg_0117_D37R0102_00026
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0498:
	NPCMsg msg_0117_D37R0102_00021
	WaitButton
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_04A5:
	NPCMsg msg_0117_D37R0102_00021
	WaitButton
	CloseMsg
	ReleaseAll
	End

_04B0:
	NPCMsg msg_0117_D37R0102_00022
	WaitButton
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_04BD:
	NPCMsg msg_0117_D37R0102_00023
	WaitButton
	CloseMsg
	ReleaseAll
	End

_04C8:
	MonAddContestValue VAR_SPECIAL_x8005, 1, 16
	MonAddContestValue VAR_SPECIAL_x8005, 5, 11
	Return

_04D8:
	MonAddContestValue VAR_SPECIAL_x8005, 1, 24
	MonAddContestValue VAR_SPECIAL_x8005, 5, 18
	Return

scr_seq_D37R0102_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_AB7, _0895
	ShowMoneyBox 20, 2
	NPCMsg msg_0117_D37R0102_00001
	SetVar VAR_TEMP_x4003, 0
	SetVar VAR_TEMP_x4004, 0
	SetVar VAR_TEMP_x4005, 0
	SetVar VAR_TEMP_x4006, 0
	SetVar VAR_TEMP_x4007, 0
_0522:
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 445, 255, 0
	MenuItemAdd 446, 255, 1
	MenuItemAdd 447, 255, 2
	MenuItemAdd 448, 255, 3
	MenuItemAdd 449, 255, 4
	MenuItemAdd 450, 255, 7
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _05AB
	Case 1, _05D0
	Case 2, _05F5
	Case 3, _061A
	Case 4, _063F
	GoTo _0886

_05AB:
	Compare VAR_TEMP_x4003, 1
	GoToIfEq _086B
	SetVar VAR_SPECIAL_x8004, 92
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 4500
	GoTo _0664

_05D0:
	Compare VAR_TEMP_x4004, 1
	GoToIfEq _086B
	SetVar VAR_SPECIAL_x8004, 88
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 650
	GoTo _0664

_05F5:
	Compare VAR_TEMP_x4005, 1
	GoToIfEq _086B
	SetVar VAR_SPECIAL_x8004, 89
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 3500
	GoTo _0664

_061A:
	Compare VAR_TEMP_x4006, 1
	GoToIfEq _086B
	SetVar VAR_SPECIAL_x8004, 90
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 900
	GoTo _0664

_063F:
	Compare VAR_TEMP_x4007, 1
	GoToIfEq _086B
	SetVar VAR_SPECIAL_x8004, 91
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 4600
	GoTo _0664

_0664:
	BufferItemName 0, VAR_SPECIAL_x8004
	BufferInt 1, VAR_SPECIAL_x8006
	NPCMsg msg_0117_D37R0102_00002
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _068A
	CloseMsg
	GoTo _0522

_068A:
	Compare VAR_SPECIAL_x8004, 92
	GoToIfNe _06CD
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 4500
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0874
	HasSpaceForItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _087D
	SubMoneyImmediate 4500
	GoTo _07C6

_06CD:
	Compare VAR_SPECIAL_x8004, 88
	GoToIfNe _0710
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 650
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0874
	HasSpaceForItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _087D
	SubMoneyImmediate 650
	GoTo _07C6

_0710:
	Compare VAR_SPECIAL_x8004, 89
	GoToIfNe _0753
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 3500
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0874
	HasSpaceForItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _087D
	SubMoneyImmediate 3500
	GoTo _07C6

_0753:
	Compare VAR_SPECIAL_x8004, 90
	GoToIfNe _0796
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 900
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0874
	HasSpaceForItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _087D
	SubMoneyImmediate 900
	GoTo _07C6

_0796:
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 4600
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0874
	HasSpaceForItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _087D
	SubMoneyImmediate 4600
_07C6:
	UpdateMoneyBox
	PlaySE SEQ_SE_DP_REGI
	BufferItemName 0, VAR_SPECIAL_x8004
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 1, VAR_SPECIAL_RESULT
	NPCMsg msg_0117_D37R0102_00003
	NPCMsg msg_0117_D37R0102_00004
	GiveItem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_x8004, 92
	GoToIfNe _0803
	SetVar VAR_TEMP_x4003, 1
	GoTo _0861

_0803:
	Compare VAR_SPECIAL_x8004, 88
	GoToIfNe _081C
	SetVar VAR_TEMP_x4004, 1
	GoTo _0861

_081C:
	Compare VAR_SPECIAL_x8004, 89
	GoToIfNe _0835
	SetVar VAR_TEMP_x4005, 1
	GoTo _0861

_0835:
	Compare VAR_SPECIAL_x8004, 90
	GoToIfNe _084E
	SetVar VAR_TEMP_x4006, 1
	GoTo _0861

_084E:
	Compare VAR_SPECIAL_x8004, 91
	GoToIfNe _0861
	SetVar VAR_TEMP_x4007, 1
_0861:
	SetFlag FLAG_UNK_AB7
	GoTo _0522

_086B:
	NPCMsg msg_0117_D37R0102_00005
	GoTo _0522

_0874:
	NPCMsg msg_0117_D37R0102_00006
	GoTo _0522

_087D:
	NPCMsg msg_0117_D37R0102_00007
	GoTo _0522

_0886:
	TouchscreenMenuShow
	HideMoneyBox
	NPCMsg msg_0117_D37R0102_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0895:
	NPCMsg msg_0117_D37R0102_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D37R0102_004:
	ScrCmd_609
	LockAll
	ApplyMovement obj_D37R0102_rocketm, _0AC4
	WaitMovement
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 7
	GoToIfNe _08CF
	ApplyMovement obj_D37R0102_rocketm, _0ACC
	GoTo _096B

_08CF:
	Compare VAR_TEMP_x4001, 8
	GoToIfNe _08EA
	ApplyMovement obj_D37R0102_rocketm, _0AD4
	GoTo _096B

_08EA:
	Compare VAR_TEMP_x4001, 9
	GoToIfNe _0905
	ApplyMovement obj_D37R0102_rocketm, _0ADC
	GoTo _096B

_0905:
	Compare VAR_TEMP_x4001, 10
	GoToIfNe _0920
	ApplyMovement obj_D37R0102_rocketm, _0AE4
	GoTo _096B

_0920:
	Compare VAR_TEMP_x4001, 11
	GoToIfNe _093B
	ApplyMovement obj_D37R0102_rocketm, _0AEC
	GoTo _096B

_093B:
	Compare VAR_TEMP_x4001, 12
	GoToIfNe _0956
	ApplyMovement obj_D37R0102_rocketm, _0AF4
	GoTo _096B

_0956:
	Compare VAR_TEMP_x4001, 13
	GoToIfNe _096B
	ApplyMovement obj_D37R0102_rocketm, _0AFC
_096B:
	WaitMovement
	NPCMsg msg_0117_D37R0102_00036
	CloseMsg
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	Compare VAR_TEMP_x4001, 7
	GoToIfNe _09A5
	ApplyMovement obj_D37R0102_rocketm, _0B04
	ApplyMovement obj_player, _0B70
	GoTo _0A71

_09A5:
	Compare VAR_TEMP_x4001, 8
	GoToIfNe _09C8
	ApplyMovement obj_D37R0102_rocketm, _0B10
	ApplyMovement obj_player, _0B7C
	GoTo _0A71

_09C8:
	Compare VAR_TEMP_x4001, 9
	GoToIfNe _09EB
	ApplyMovement obj_D37R0102_rocketm, _0B20
	ApplyMovement obj_player, _0B88
	GoTo _0A71

_09EB:
	Compare VAR_TEMP_x4001, 10
	GoToIfNe _0A0E
	ApplyMovement obj_D37R0102_rocketm, _0B30
	ApplyMovement obj_player, _0B94
	GoTo _0A71

_0A0E:
	Compare VAR_TEMP_x4001, 11
	GoToIfNe _0A31
	ApplyMovement obj_D37R0102_rocketm, _0B40
	ApplyMovement obj_player, _0BA0
	GoTo _0A71

_0A31:
	Compare VAR_TEMP_x4001, 12
	GoToIfNe _0A54
	ApplyMovement obj_D37R0102_rocketm, _0B50
	ApplyMovement obj_player, _0BAC
	GoTo _0A71

_0A54:
	Compare VAR_TEMP_x4001, 13
	GoToIfNe _0A71
	ApplyMovement obj_D37R0102_rocketm, _0B60
	ApplyMovement obj_player, _0BB8
_0A71:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	SetAvatarBits PLAYER_TRANSITION_ROCKET
	UpdateAvatarState
	RocketCostumeFlagAction 1
	PlaySE SEQ_SE_DP_CARD2
	Wait 24, VAR_SPECIAL_RESULT
	PlaySE SEQ_SE_DP_CARD2
	WaitSE SEQ_SE_DP_CARD2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	SetVar VAR_SCENE_ROCKET_TAKEOVER, 3
	NPCMsg msg_0117_D37R0102_00037
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0AC4:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0ACC:
	Delay2
	EndMovement

	.balign 4, 0
_0AD4:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_0ADC:
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_0AE4:
	WalkNormalSouth 3
	EndMovement

	.balign 4, 0
_0AEC:
	WalkNormalSouth 4
	EndMovement

	.balign 4, 0
_0AF4:
	WalkNormalSouth 5
	EndMovement

	.balign 4, 0
_0AFC:
	WalkNormalSouth 6
	EndMovement

	.balign 4, 0
_0B04:
	WalkNormalEast
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0B10:
	WalkNormalNorth
	WalkNormalEast
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0B20:
	WalkNormalNorth 2
	WalkNormalEast
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0B30:
	WalkNormalNorth 3
	WalkNormalEast
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0B40:
	WalkNormalNorth 4
	WalkNormalEast
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0B50:
	WalkNormalNorth 5
	WalkNormalEast
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0B60:
	WalkNormalNorth 6
	WalkNormalEast
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0B70:
	WalkNormalNorth
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0B7C:
	WalkNormalNorth 2
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0B88:
	WalkNormalNorth 3
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0B94:
	WalkNormalNorth 4
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0BA0:
	WalkNormalNorth 5
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0BAC:
	WalkNormalNorth 6
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0BB8:
	WalkNormalNorth 7
	WalkOnSpotNormalEast
	EndMovement

scr_seq_D37R0102_009:
	SimpleNPCMsg msg_0117_D37R0102_00037
	End

scr_seq_D37R0102_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_SPECIAL_x8007, 0
	CallIfUnset FLAG_UNK_08C, _0C0E
	Compare VAR_TEMP_x400A, 0
	GoToIfEq _0C16
	Compare VAR_TEMP_x400A, 1
	GoToIfGe _0C1F
	ReleaseAll
	End

_0C0E:
	SetVar VAR_SPECIAL_x8007, 1
	Return

_0C16:
	NPCMsg msg_0117_D37R0102_00039
	GoTo _0C58

_0C1F:
	NPCMsg msg_0117_D37R0102_00049
	GoTo _0C58

_0C28:
	NPCMsg msg_0117_D37R0102_00041
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0C4F
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0CA0
	End

_0C4F:
	NPCMsg msg_0117_D37R0102_00044
	GoTo _0C7C

_0C58:
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0C28
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0DDA
	End

_0C7C:
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0CA0
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0DDA
	End

_0CA0:
	GetPartyCount VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0CC0
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0CCC
	End

_0CC0:
	SetVar VAR_TEMP_x4002, 0
	GoTo _0D17

_0CCC:
	NPCMsg msg_0117_D37R0102_00042
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	PartySelectUI
	GetPartySelection VAR_TEMP_x4002
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_TEMP_x4002, 255
	GoToIfEq _0DDA
	GetPartyMonSpecies VAR_TEMP_x4002, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0DE5
	GoTo _0D17

_0D17:
	NPCMsg msg_0117_D37R0102_00043
	CloseMsg
	GetPlayerFacing VAR_SPECIAL_x8006
	Compare VAR_SPECIAL_x8006, 0
	GoToIfEq _0D49
	Compare VAR_SPECIAL_x8006, 2
	GoToIfEq _0D4F
	Compare VAR_SPECIAL_x8006, 3
	GoToIfEq _0D55
	End

_0D49:
	GoTo _0D5B

_0D4F:
	GoTo _0D5B

_0D55:
	GoTo _0D5B

_0D5B:
	SetFlag FLAG_UNK_08C
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_154 VAR_TEMP_x4002, VAR_SPECIAL_x8005, VAR_SPECIAL_x8007
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_x8006, 0
	GoToIfEq _0DAA
	Compare VAR_SPECIAL_x8006, 2
	GoToIfEq _0DB0
	Compare VAR_SPECIAL_x8006, 3
	GoToIfEq _0DB6
	End

_0DAA:
	GoTo _0DBC

_0DB0:
	GoTo _0DBC

_0DB6:
	GoTo _0DBC

_0DBC:
	Compare VAR_SPECIAL_x8005, 0
	GoToIfEq _0E40
	SetVar VAR_TEMP_x400A, 1
	NPCMsg msg_0117_D37R0102_00045
	CloseMsg
	GoTo _0DEE

_0DDA:
	NPCMsg msg_0117_D37R0102_00040
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0DE5:
	NPCMsg msg_0117_D37R0102_00051
	GoTo _0CCC

_0DEE:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_492 0, VAR_SPECIAL_RESULT, VAR_SPECIAL_x8004
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0E35
	ScrCmd_256 VAR_SPECIAL_x8004
	ScrCmd_494 0, VAR_SPECIAL_x8004
	NPCMsg msg_0117_D37R0102_00046
	NPCMsg msg_0117_D37R0102_00052
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0E35:
	NPCMsg msg_0117_D37R0102_00047
	CloseMsg
	GoTo _0DEE

_0E40:
	NPCMsg msg_0117_D37R0102_00048
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0E4C:
	WalkSlowNorth 2
	EndMovement

	.balign 4, 0
_0E54:
	WalkSlowWest
	WalkSlowNorth
	EndMovement

	.balign 4, 0
_0E60:
	WalkSlowEast
	WalkSlowNorth
	EndMovement

	.balign 4, 0
_0E6C:
	FaceSouth
	EndMovement

	.balign 4, 0
_0E74:
	WalkSlowSouth 2
	FaceNorth
	EndMovement

	.balign 4, 0
_0E80:
	WalkNormalWest
	FaceEast
	EndMovement

	.balign 4, 0
_0E8C:
	WalkNormalWest
	FaceEast
	EndMovement

	.balign 4, 0
_0E98:
	WalkNormalEast
	FaceWest
	EndMovement

	.balign 4, 0
_0EA4:
	WalkNormalEast
	FaceSouth
	EndMovement

	.balign 4, 0
_0EB0:
	WalkNormalEast
	FaceSouth
	EndMovement

	.balign 4, 0
_0EBC:
	WalkNormalWest
	FaceSouth
	EndMovement

	.balign 4, 0
_0EC8:
	FaceEast
	EndMovement

	.balign 4, 0
_0ED0:
	FaceSouth
	EndMovement

_0ED8:
	End

scr_seq_D37R0102_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0117_D37R0102_00029
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0F05
	NPCMsg msg_0117_D37R0102_00034
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0F05:
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0FDA
	NPCMsg msg_0117_D37R0102_00030
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	SetAvatarBits PLAYER_TRANSITION_ROCKET
	UpdateAvatarState
	RocketCostumeFlagAction 1
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0FE8
	ApplyMovement obj_D37R0102_gsmiddleman1, _1000
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0F79
	Release obj_partner_poke
	ApplyMovement obj_partner_poke, _0FF8
	Lock obj_partner_poke
	WaitMovement
_0F79:
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	NPCMsg msg_0117_D37R0102_00031
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 10
	LockAll
	SetAvatarBits PLAYER_TRANSITION_WALKING
	UpdateAvatarState
	RocketCostumeFlagAction 0
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _1010
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	NPCMsg msg_0117_D37R0102_00032
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0FDA:
	NPCMsg msg_0117_D37R0102_00035
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0FE8:
	WalkFasterNorth 3
	WalkFasterWest 2
	FaceSouth
	EndMovement

	.balign 4, 0
_0FF8:
	FaceSouth
	EndMovement

	.balign 4, 0
_1000:
	WalkFasterSouth 2
	WalkFasterWest 4
	FaceNorth
	EndMovement

	.balign 4, 0
_1010:
	WalkFasterSouth 3
	WalkFasterEast 2
	EndMovement

	.balign 4, 0
_101C:
	WalkFasterNorth 2
	WalkFasterEast 4
	FaceWest
	EndMovement

scr_seq_D37R0102_011:
	ScrCmd_609
	LockAll
	CallStd std_play_kimono_girl_music
	GetPlayerCoords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	Compare VAR_SPECIAL_x8005, 31
	GoToIfNe _1055
	ApplyMovement obj_D37R0102_dancer, _10B4
	GoTo _105D

_1055:
	ApplyMovement obj_D37R0102_dancer, _10C8
_105D:
	WaitMovement
	NPCMsg msg_0117_D37R0102_00055
	CloseMsg
	ApplyMovement obj_D37R0102_dancer, _10E4
	WaitMovement
	NPCMsg msg_0117_D37R0102_00056
	CloseMsg
	GetPlayerCoords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	Compare VAR_SPECIAL_x8005, 31
	GoToIfNe _1094
	ApplyMovement obj_D37R0102_dancer, _10F0
	GoTo _109C

_1094:
	ApplyMovement obj_D37R0102_dancer, _1120
_109C:
	WaitMovement
	HidePerson obj_D37R0102_dancer
	SetFlag FLAG_HIDE_UNDERGROUND_KIMONO_GIRL
	CallStd std_fade_end_kimono_girl_music
	ReleaseAll
	SetVar VAR_UNK_40E7, 3
	End

	.balign 4, 0
_10B4:
	EmoteExclamationMark
	WalkOnSpotNormalWest
	Delay8
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_10C8:
	EmoteExclamationMark
	WalkOnSpotNormalWest
	Delay8
	WalkNormalWest
	WalkNormalSouth
	WalkNormalWest
	EndMovement

	.balign 4, 0
_10E4:
	EmoteExclamationMark
	Delay16
	EndMovement

	.balign 4, 0
_10F0:
	WalkNormalSouth
	WalkNormalWest 3
	FaceNorth
	Delay2
	FaceEast
	Delay2
	FaceSouth
	Delay2
	FaceWest
	Delay2
	WalkNormalWest 7
	EndMovement

	.balign 4, 0
_1120:
	WalkNormalNorth
	WalkNormalWest 3
	FaceNorth
	Delay2
	FaceEast
	Delay2
	FaceSouth
	Delay2
	FaceWest
	Delay2
	WalkNormalWest 7
	EndMovement

scr_seq_D37R0102_007:
	SimpleNPCMsg msg_0117_D37R0102_00027
	End

scr_seq_D37R0102_010:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetItemQuantity ITEM_BASEMENT_KEY, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _1189
	NPCMsg msg_0117_D37R0102_00027
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1189:
	BufferPlayersName 0
	NPCMsg msg_0117_D37R0102_00028
	CloseMsg
	ApplyMovement obj_D37R0102_babyboy1_8, _11A4
	WaitMovement
	ReleaseAll
	SetFlag FLAG_UNK_1C0
	End

	.balign 4, 0
_11A4:
	WalkNormalEast 2
	EndMovement

scr_seq_D37R0102_012:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	ScrCmd_255 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _144B
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_155 0, VAR_SPECIAL_RESULT
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

scr_seq_D37R0102_013:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	ScrCmd_255 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _144B
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_155 1, VAR_SPECIAL_RESULT
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

scr_seq_D37R0102_014:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	ScrCmd_255 2, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _144B
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_155 2, VAR_SPECIAL_RESULT
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

scr_seq_D37R0102_015:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	ScrCmd_255 3, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _144B
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_155 3, VAR_SPECIAL_RESULT
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

scr_seq_D37R0102_016:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	ScrCmd_255 4, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _144B
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_155 4, VAR_SPECIAL_RESULT
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

scr_seq_D37R0102_017:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	ScrCmd_255 5, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _144B
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_155 5, VAR_SPECIAL_RESULT
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

scr_seq_D37R0102_018:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	ScrCmd_255 6, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _144B
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_155 6, VAR_SPECIAL_RESULT
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

scr_seq_D37R0102_019:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	ScrCmd_255 7, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _144B
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_155 7, VAR_SPECIAL_RESULT
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

scr_seq_D37R0102_020:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	ScrCmd_255 8, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _144B
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_155 8, VAR_SPECIAL_RESULT
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

scr_seq_D37R0102_021:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	ScrCmd_255 9, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _144B
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_155 9, VAR_SPECIAL_RESULT
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

scr_seq_D37R0102_022:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	ScrCmd_255 10, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _144B
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_155 10, VAR_SPECIAL_RESULT
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_144B:
	NPCMsg msg_0117_D37R0102_00053
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D37R0102_023:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScrCmd_830 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _1480
	ScrCmd_832 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _1521
_1480:
	NPCMsg msg_0117_D37R0102_00057
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _1530
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 100
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _153F
	SubMoneyImmediate 100
	ScrCmd_553 5, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _154E
	ScrCmd_831 VAR_SPECIAL_x8004
	ScrCmd_404 VAR_SPECIAL_x8004, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _155B
	NPCMsg msg_0117_D37R0102_00061
	SetVar VAR_SPECIAL_x8005, 1
	CallStd std_receive_accessory
_14EB:
	ScrCmd_832 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _1530
	ScrCmd_553 95, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _1530
	ScrCmd_833 VAR_SPECIAL_x8004
	NPCMsg msg_0117_D37R0102_00062
	CallStd std_receive_background
	GoTo _1530
	End

_1521:
	NPCMsg msg_0117_D37R0102_00058
	WaitButton
	CloseMsg
	GoTo _1568
	End

_1530:
	NPCMsg msg_0117_D37R0102_00059
	WaitButton
	CloseMsg
	GoTo _1568
	End

_153F:
	NPCMsg msg_0117_D37R0102_00060
	WaitButton
	CloseMsg
	GoTo _1568
	End

_154E:
	NPCMsg msg_0117_D37R0102_00064
	CloseMsg
	GoTo _1530
	End

_155B:
	NPCMsg msg_0117_D37R0102_00064
	CloseMsg
	GoTo _14EB
	End

_1568:
	ReleaseAll
	End
	.balign 4, 0
