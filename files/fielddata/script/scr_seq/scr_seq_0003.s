#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0003.h"
#include "msgdata/msg/msg_0040.h"
#include "msgdata/msg/msg_0191.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_0003_000
	ScrDef scr_seq_0003_001
	ScrDef scr_seq_0003_002
	ScrDef scr_seq_0003_003
	ScrDef scr_seq_0003_004
	ScrDef scr_seq_0003_005
	ScrDef scr_seq_0003_006
	ScrDef scr_seq_0003_007
	ScrDef scr_seq_0003_008
	ScrDef scr_seq_0003_009
	ScrDef scr_seq_0003_010
	ScrDef scr_seq_0003_011
	ScrDef scr_seq_0003_012
	ScrDef scr_seq_0003_013
	ScrDef scr_seq_0003_014
	ScrDef scr_seq_0003_015
	ScrDef scr_seq_0003_016
	ScrDef scr_seq_0003_017
	ScrDef scr_seq_0003_018
	ScrDef scr_seq_0003_019
	ScrDef scr_seq_0003_020
	ScrDef scr_seq_0003_021
	ScrDef scr_seq_0003_022
	ScrDef scr_seq_0003_023
	ScrDef scr_seq_0003_024
	ScrDef scr_seq_0003_025
	ScrDef scr_seq_0003_026
	ScrDef scr_seq_0003_027
	ScrDef scr_seq_0003_028
	ScrDef scr_seq_0003_029
	ScrDef scr_seq_0003_030
	ScrDef scr_seq_0003_031
	ScrDef scr_seq_0003_032
	ScrDef scr_seq_0003_033
	ScrDef scr_seq_0003_034
	ScrDef scr_seq_0003_035
	ScrDef scr_seq_0003_036
	ScrDef scr_seq_0003_037
	ScrDef scr_seq_0003_038
	ScrDef scr_seq_0003_039
	ScrDef scr_seq_0003_040
	ScrDef scr_seq_0003_041
	ScrDef scr_seq_0003_042
	ScrDef scr_seq_0003_043
	ScrDef scr_seq_0003_044
	ScrDef scr_seq_0003_045
	ScrDef scr_seq_0003_046
	ScrDef scr_seq_0003_047
	ScrDef scr_seq_0003_048
	ScrDef scr_seq_0003_049
	ScrDef scr_seq_0003_050
	ScrDef scr_seq_0003_051
	ScrDef scr_seq_0003_052
	ScrDef scr_seq_0003_053
	ScrDef scr_seq_0003_054
	ScrDef scr_seq_0003_055
	ScrDef scr_seq_0003_056
	ScrDef scr_seq_0003_057
	ScrDef scr_seq_0003_058
	ScrDef scr_seq_0003_059
	ScrDef scr_seq_0003_060
	ScrDef scr_seq_0003_061
	ScrDef scr_seq_0003_062
	ScrDef scr_seq_0003_063
	ScrDef scr_seq_0003_064
	ScrDef scr_seq_0003_065
	ScrDef scr_seq_0003_066
	ScrDef scr_seq_0003_067
	ScrDef scr_seq_0003_068
	ScrDef scr_seq_0003_069
	ScrDef scr_seq_0003_070
	ScrDef scr_seq_0003_071
	ScrDefEnd

scr_seq_0003_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetTrcardStars VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 4
	GoToIfGe _03E3
	SetVar VAR_SPECIAL_x8004, 0
	ScrCmd_379 VAR_SPECIAL_RESULT
	DebugWatch VAR_SPECIAL_RESULT
	SetVar VAR_SPECIAL_x8004, 83
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0175
	SetVar VAR_SPECIAL_x8004, 84
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0175
	SetVar VAR_SPECIAL_x8004, 0
_0175:
	NonNPCMsgVar VAR_SPECIAL_x8004
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01AA
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _019B
	End

_019B:
	NPCMsg msg_0040_00003
	WaitButton
	TouchscreenMenuShow
	CloseMsg
	ReleaseAll
	RestartCurrentScript
	End

_01AA:
	GetPlayerState VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _01C5
	SetAvatarBits PLAYER_TRANSITION_ROCKET_HEAL
	GoTo _01C9

_01C5:
	SetAvatarBits PLAYER_TRANSITION_HEAL
_01C9:
	UpdateAvatarState
	ApplyMovement obj_player, _0460
	WaitMovement
	ScrCmd_599
	GetTrcardStars VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 4
	CallIfGe _0211
	Compare VAR_SPECIAL_RESULT, 4
	CallIfLt _020C
	Call _0216
	GoToIfUnset FLAG_WAS_TOLD_ABOUT_POKERUS, _034D
	GoTo _023A

_020C:
	NPCMsg msg_0040_00001
	Return

_0211:
	NPCMsg msg_0040_00007
	Return

_0216:
	ApplyMovement VAR_SPECIAL_x8007, _1064
	WaitMovement
	PartyCountNotEgg VAR_SPECIAL_x8006
	PokeCenAnim VAR_SPECIAL_x8006
	ApplyMovement VAR_SPECIAL_x8007, _107C
	WaitMovement
	GetPartyLeadAlive VAR_SPECIAL_x8008
	HealParty
	Return

_023A:
	Compare VAR_SPECIAL_x8004, 1
	GoToIfEq _02CB
	NPCMsg msg_0040_00002
	ApplyMovement obj_player, _0468
	WaitMovement
	GetPlayerState VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _026F
	SetAvatarBits PLAYER_TRANSITION_ROCKET
	GoTo _0273

_026F:
	SetAvatarBits PLAYER_TRANSITION_WALKING
_0273:
	UpdateAvatarState
	GetPartyLeadAlive VAR_SPECIAL_x8009
	Compare VAR_SPECIAL_x8008, VAR_SPECIAL_x8009
	GoToIfEq _02B2
	Wait 15, VAR_SPECIAL_x800A
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CloseMsg
	ScrCmd_436
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	BufferPartyMonNick 0, VAR_SPECIAL_x8009
	NPCMsg msg_0040_00102
_02B2:
	ApplyMovement VAR_SPECIAL_x8007, _0454
	WaitMovement
	NPCMsg msg_0040_00003
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	RestartCurrentScript
	End

_02CB:
	NPCMsg msg_0040_00008
	ApplyMovement obj_player, _0468
	WaitMovement
	GetPlayerState VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _02F3
	SetAvatarBits PLAYER_TRANSITION_ROCKET
	GoTo _02F7

_02F3:
	SetAvatarBits PLAYER_TRANSITION_WALKING
_02F7:
	UpdateAvatarState
	GetPartyLeadAlive VAR_SPECIAL_x8009
	Compare VAR_SPECIAL_x8008, VAR_SPECIAL_x8009
	GoToIfEq _0336
	Wait 15, VAR_SPECIAL_x800A
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CloseMsg
	ScrCmd_436
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	BufferPartyMonNick 0, VAR_SPECIAL_x8009
	NPCMsg msg_0040_00102
_0336:
	ApplyMovement VAR_SPECIAL_x8007, _0454
	WaitMovement
	NPCMsg msg_0040_00009
	WaitButton
	CloseMsg
	ReleaseAll
	RestartCurrentScript
	End

_034D:
	PartyHasPokerus VAR_SPECIAL_x8006
	Compare VAR_SPECIAL_x8006, 1
	GoToIfEq _0364
	GoTo _023A

_0364:
	SetFlag FLAG_WAS_TOLD_ABOUT_POKERUS
	ScrCmd_148 1, 0
	ApplyMovement obj_player, _0468
	WaitMovement
	GetPlayerState VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _0391
	SetAvatarBits PLAYER_TRANSITION_ROCKET
	GoTo _0395

_0391:
	SetAvatarBits PLAYER_TRANSITION_WALKING
_0395:
	UpdateAvatarState
	GetPartyLeadAlive VAR_SPECIAL_x8009
	Compare VAR_SPECIAL_x8008, VAR_SPECIAL_x8009
	GoToIfEq _03D4
	Wait 15, VAR_SPECIAL_x800A
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CloseMsg
	ScrCmd_436
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	BufferPartyMonNick 0, VAR_SPECIAL_x8009
	NPCMsg msg_0040_00102
_03D4:
	NPCMsg msg_0040_00010
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	RestartCurrentScript
	End

_03E3:
	GoToIfSet FLAG_NURSE_NOTICED_CARD, _041D
	SetFlag FLAG_NURSE_NOTICED_CARD
	NPCMsg msg_0040_00004
	BufferPlayersName 0
	NPCMsg msg_0040_00005
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0445
	NPCMsg msg_0040_00009
	WaitButton
	CloseMsg
	ReleaseAll
	RestartCurrentScript
	End

_041D:
	BufferPlayersName 0
	NPCMsg msg_0040_00006
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0445
	NPCMsg msg_0040_00009
	WaitButton
	CloseMsg
	ReleaseAll
	RestartCurrentScript
	End

_0445:
	SetVar VAR_SPECIAL_x8004, 1
	GoTo _01AA

	.balign 4, 0
_0454:
	NurseJoyBow
	Delay4
	EndMovement

	.balign 4, 0
_0460:
	PlayerGive
	EndMovement

	.balign 4, 0
_0468:
	PlayerReceive
	EndMovement

scr_seq_0003_069:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_436
	PlayFanfare SEQ_ME_ASA
	WaitFanfare
	HealParty
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	RestartCurrentScript
	End

scr_seq_0003_000:
	Switch VAR_SPECIAL_RESULT
	Case 0, _04D6
	Case 1, _04DD
	ScrCmd_060 VAR_SPECIAL_RESULT
	Switch VAR_SPECIAL_RESULT
	Case 1, _04DD
	ScrCmd_057 2
	RestartCurrentScript
	End

_04D6:
	ScrCmd_057 2
	RestartCurrentScript
	End

_04DD:
	ScrCmd_057 4
	ScrCmd_058
	ScrCmd_061
	RestartCurrentScript
	End

scr_seq_0003_001:
	Call _04F2
	RestartCurrentScript
	End

_04F2:
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	Switch VAR_SPECIAL_RESULT
	Case 7, _0574
	Case 0, _0568
	Case 4, _0568
	Case 1, _0568
	Case 2, _0568
	Case 6, _0568
	Case 5, _057A
	Case 3, _056E
	End

_0568:
	PlayFanfare SEQ_ME_ITEM
	Return

_056E:
	PlayFanfare SEQ_ME_WAZA
	Return

_0574:
	PlayFanfare SEQ_ME_KEYITEM
	Return

_057A:
	PlayFanfare SEQ_ME_HYOUKA2
	Return

_0580:
	RestartCurrentScript
	End

scr_seq_0003_003:
	ScrCmd_609
	LockAll
	GetPartyCount VAR_SPECIAL_x8004
	SetVar VAR_SPECIAL_x8005, 0
_0592:
	SurvivePoisoning VAR_SPECIAL_RESULT, VAR_SPECIAL_x8005
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _05AD
	BufferPartyMonNick 0, VAR_SPECIAL_x8005
	NPCMsg msg_0040_00053
_05AD:
	AddVar VAR_SPECIAL_x8005, 1
	Compare VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	GoToIfNe _0592
	CountAliveMons VAR_SPECIAL_RESULT, 6
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _05F5
	CloseMsg
	ReleaseAll
	End

scr_seq_0003_004:
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	WaitABPress
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	End

_05F5:
	BufferPlayersName 0
	NPCMsg msg_0040_00011
	WaitABPress
	CloseMsg
	FadeOutBGM 0, 10
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_436
	OverworldWhiteOut
	End

scr_seq_0003_005:
	ClearFlag FLAG_MAPTEMP_020
	Call _0646
	ScrCmd_347 VAR_SPECIAL_RESULT
	CloseMsg
	End

scr_seq_0003_024:
	NPCMsg msg_0040_00020
	WaitABPress
	CloseMsg
	End

scr_seq_0003_006:
	SetFlag FLAG_MAPTEMP_020
	Call _0646
	CopyVar VAR_TEMP_x4000, VAR_SPECIAL_RESULT
	RestartCurrentScript
	End

_0646:
	ShowSaveStats
	NPCMsg msg_0040_00013
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0740
	GetSaveFileState VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0698
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _06BD
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfEq _06A9
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _06C6
	End

_0698:
	HideSaveStats
	TouchscreenMenuShow
	NPCMsg msg_0040_00020
	WaitABPress
	SetVar VAR_SPECIAL_RESULT, 0
	Return

_06A9:
	NPCMsg msg_0040_00014
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0740
_06BD:
	NPCMsg msg_0040_00021
	GoTo _06F2

_06C6:
	NPCMsg msg_0040_00014
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0740
	GoToIfUnset FLAG_MAPTEMP_020, _076A
	GoToIfSet FLAG_MAPTEMP_020, _0775
	End

_06F2:
	PlayerMovementSavingSet
	Wait 2, VAR_SPECIAL_RESULT
	Call _0708
	PlayerMovementSavingClear
	GoTo _071D

_0708:
	AddWaitingIcon
	CallIfSet FLAG_MAPTEMP_020, _0762
	SaveGameNormal VAR_SPECIAL_RESULT
	RemoveWaitingIcon
	Return

_071D:
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _074C
	BufferPlayersName 0
	NPCMsg msg_0040_00016
	PlaySE SEQ_SE_DP_SAVE
	WaitSE SEQ_SE_DP_SAVE
	WaitButtonOrDelay 30
	HideSaveStats
	Return

_0740:
	HideSaveStats
	TouchscreenMenuShow
	SetVar VAR_SPECIAL_RESULT, 0
	Return

_074C:
	NPCMsg msg_0040_00018
	WaitABPress
	HideSaveStats
	TouchscreenMenuShow
	Return

_0757:
	NPCMsg msg_0040_00021
	GoTo _06F2
	End

_0762:
	SaveWipeExtraChunks
	ClearFlag FLAG_MAPTEMP_020
	Return

_076A:
	NPCMsg msg_0040_00015
	GoTo _06F2
	End

_0775:
	ScrCmd_642 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0757
	GoTo _076A
	End

scr_seq_0003_007:
	Call _07AA
	NPCMsg msg_0040_00032
	WaitABPress
	RestartCurrentScript
	End

scr_seq_0003_035:
	Call _07AA
	NPCMsg msg_0040_00090
	RestartCurrentScript
	End

_07AA:
	PlayFanfare SEQ_ME_ACCE
	ScrCmd_403 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	BufferFashionName 0, VAR_SPECIAL_x8004
	NPCMsg msg_0040_00025
	WaitFanfare
	BufferPlayersName 0
	BufferFashionName 1, VAR_SPECIAL_x8004
	Return

scr_seq_0003_026:
	Call _07E4
	NPCMsg msg_0040_00032
	WaitABPress
	RestartCurrentScript
	End

scr_seq_0003_034:
	Call _07E4
	NPCMsg msg_0040_00090
	RestartCurrentScript
	End

_07E4:
	PlayFanfare SEQ_ME_ACCE
	ScrCmd_406 VAR_SPECIAL_x8004
	BufferBackgroundName 0, VAR_SPECIAL_x8004
	NPCMsg msg_0040_00025
	WaitFanfare
	BufferPlayersName 0
	BufferBackgroundName 1, VAR_SPECIAL_x8004
	Return

scr_seq_0003_008:
	Call _080A
	RestartCurrentScript
	End

_080A:
	Call _04F2
	GiveItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 7
	CallIfEq _0892
	Compare VAR_SPECIAL_RESULT, 7
	CallIfNe _08A3
	Compare VAR_SPECIAL_x8005, 1
	GoToIfGt _084E
	NPCMsg msg_0040_00030
	GoTo _0851

_084E:
	NPCMsg msg_0040_00031
_0851:
	WaitButton
	Return

scr_seq_0003_033:
	Call _085F
	RestartCurrentScript
	End

_085F:
	Call _04F2
	GiveItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 7
	CallIfEq _0892
	Compare VAR_SPECIAL_RESULT, 7
	CallIfNe _08A3
	NPCMsg msg_0040_00089
	Return

_0892:
	BufferPlayersName 0
	BufferItemName 1, VAR_SPECIAL_x8004
	NPCMsg msg_0040_00028
	GoTo _08C9

_08A3:
	Compare VAR_SPECIAL_x8005, 1
	GoToIfGt _08BB
	BufferItemName 0, VAR_SPECIAL_x8004
	GoTo _08C0

_08BB:
	BufferItemNamePlural 0, VAR_SPECIAL_x8004
_08C0:
	NPCMsg msg_0040_00025
	GoTo _08C9

_08C9:
	WaitFanfare
	BufferPlayersName 0
	Compare VAR_SPECIAL_x8005, 1
	GoToIfGt _08E6
	BufferItemName 1, VAR_SPECIAL_x8004
	GoTo _08EB

_08E6:
	BufferItemNamePlural 1, VAR_SPECIAL_x8004
_08EB:
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	Switch VAR_SPECIAL_RESULT
	Case 7, _0972
	Case 0, _0961
	Case 4, _09B6
	Case 1, _09A5
	Case 2, _09C7
	Case 6, _0983
	Case 5, _0994
	Case 3, _09D8
	End

_0961:
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 2, VAR_SPECIAL_RESULT
	GoTo _09E9

_0972:
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 2, VAR_SPECIAL_RESULT
	GoTo _09E9

_0983:
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 2, VAR_SPECIAL_RESULT
	GoTo _09E9

_0994:
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 2, VAR_SPECIAL_RESULT
	GoTo _09E9

_09A5:
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 2, VAR_SPECIAL_RESULT
	GoTo _09E9

_09B6:
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 2, VAR_SPECIAL_RESULT
	GoTo _09E9

_09C7:
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 2, VAR_SPECIAL_RESULT
	GoTo _09E9

_09D8:
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 2, VAR_SPECIAL_RESULT
	GoTo _09E9

_09E9:
	Return

scr_seq_0003_009:
	Call _09F5
	RestartCurrentScript
	End

_09F5:
	NPCMsg msg_0040_00027
	WaitButton
	Return

scr_seq_0003_010:
	ScrCmd_609
	LockAll
	PlaySE SEQ_SE_DP_PC_ON
	Call _0A18
	BufferPlayersName 0
	NPCMsg msg_0040_00033
	TouchscreenMenuHide
	GoTo _0A2E

_0A18:
	ScrCmd_500 90
	ScrCmd_501 90
	ScrCmd_308 90
	Return

_0A23:
	ScrCmd_502 90
	ScrCmd_308 90
	ScrCmd_309 90
	Return

_0A2E:
	BufferPlayersName 0
	NPCMsg msg_0040_00034
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_x8006
	CallIfUnset FLAG_SYS_MET_BILL, _0A78
	CallIfSet FLAG_SYS_MET_BILL, _0A82
	MenuItemAdd msg_0191_00063, 255, 1
	GoToIfSet FLAG_GAME_CLEAR, _0A8C
	GoToIfUnset FLAG_GAME_CLEAR, _0AD1
	GoTo _0AD1
	End

_0A78:
	MenuItemAdd msg_0191_00061, 255, 0
	Return

_0A82:
	MenuItemAdd msg_0191_00062, 255, 0
	Return

_0A8C:
	MenuItemAdd msg_0191_00064, 255, 2
	MenuItemAdd msg_0191_00066, 255, 3
	MenuExec
	Switch VAR_SPECIAL_x8006
	Case 0, _0B01
	Case 1, _0C23
	Case 2, _0DBA
	GoTo _0DF0

_0AD1:
	MenuItemAdd msg_0191_00066, 255, 2
	MenuExec
	Switch VAR_SPECIAL_x8006
	Case 0, _0B01
	Case 1, _0C23
	GoTo _0DF0

_0B01:
	PlaySE SEQ_SE_DP_PC_LOGIN
	BufferPlayersName 0
	NPCMsg msg_0040_00035
	Call _0B17
	GoTo _0B53

_0B17:
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd msg_0191_00067, 76, 0
	MenuItemAdd msg_0191_00068, 77, 1
	MenuItemAdd msg_0191_00069, 78, 2
	MenuItemAdd msg_0191_00070, 79, 3
	MenuItemAdd msg_0191_00072, 81, 5
	Return

_0B49:
	ScrCmd_070 71, 80, 4
	Return

_0B53:
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0BA2
	Case 1, _0BB5
	Case 2, _0BC8
	Case 3, _0BDB
	Case 4, _0BEE
	GoTo _0A2E

_0BA2:
	CloseMsg
	Call _0E16
	ScrCmd_158 0
	RestoreOverworld
	GoTo _0C01

_0BB5:
	CloseMsg
	Call _0E16
	ScrCmd_158 1
	RestoreOverworld
	GoTo _0C01

_0BC8:
	CloseMsg
	Call _0E16
	ScrCmd_158 2
	RestoreOverworld
	GoTo _0C01

_0BDB:
	CloseMsg
	Call _0E16
	ScrCmd_158 3
	RestoreOverworld
	GoTo _0C01

_0BEE:
	CloseMsg
	Call _0E16
	ScrCmd_158 4
	RestoreOverworld
	GoTo _0C01

_0C01:
	BufferPlayersName 0
	NonNPCMsg msg_0040_00034
	Call _0B17
	Call _0A18
	FadeScreen 6, 1, 1, RGB_BLACK
	GoTo _0B53

_0C23:
	PlaySE SEQ_SE_DP_PC_LOGIN
	BufferPlayersName 0
	NPCMsg msg_0040_00036
	GoTo _0C33

_0C33:
	Call _0CA7
_0C39:
	CountSavedPhotos VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _0C72
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0CEC
	Case 1, _0D3A
	GoTo _0A2E

_0C72:
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0CEC
	Case 1, _0D3A
	Case 2, _0D86
	GoTo _0A2E

_0CA7:
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd msg_0191_00073, 82, 0
	MenuItemAdd msg_0191_00074, 83, 1
	CountSavedPhotos VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _0CDA
	MenuItemAdd msg_0191_00075, 84, 2
	Return

_0CDA:
	MenuItemAdd msg_0191_00065, 85, 2
	MenuItemAdd msg_0191_00075, 84, 3
	Return

_0CEC:
	CloseMsg
	ScrCmd_377 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0D0F
	Call _0E16
	ScrCmd_376
	RestoreOverworld
	GoTo _0D18

_0D0F:
	NPCMsg msg_0040_00047
	GoTo _0C33

_0D18:
	BufferPlayersName 0
	NonNPCMsg msg_0040_00034
	Call _0CA7
	Call _0A18
	FadeScreen 6, 1, 1, RGB_BLACK
	GoTo _0C39

_0D3A:
	GetUniqueSealsQuantity VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0D5B
	CloseMsg
	Call _0E16
	ScrCmd_156
	GoTo _0D64

_0D5B:
	NPCMsg msg_0040_00079
	GoTo _0C33

_0D64:
	BufferPlayersName 0
	NonNPCMsg msg_0040_00034
	Call _0CA7
	Call _0A18
	FadeScreen 6, 1, 1, RGB_BLACK
	GoTo _0C39

_0D86:
	CloseMsg
	Call _0E16
	OpenPhotoAlbum
	RestoreOverworld
	GoTo _0D98

_0D98:
	BufferPlayersName 0
	NonNPCMsg msg_0040_00034
	Call _0CA7
	Call _0A18
	FadeScreen 6, 1, 1, RGB_BLACK
	GoTo _0C39

_0DBA:
	PlaySE SEQ_SE_DP_PC_LOGIN
	CloseMsg
	ScrCmd_706 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0DE7
	Call _0E16
	ScrCmd_164
	RestoreOverworld
	Call _0E02
	GoTo _0A2E

_0DE7:
	NPCMsg msg_0040_00094
	GoTo _0A2E

_0DF0:
	CloseMsg
	PlaySE SEQ_SE_DP_PC_LOGOFF
	Call _0A23
	TouchscreenMenuShow
	ReleaseAll
	End

_0E02:
	Call _0A18
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Return

_0E16:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_309 90
	Return

scr_seq_0003_014:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_156
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	End

scr_seq_0003_011:
	NPCMsg msg_0040_00038
	RestartCurrentScript
	End

scr_seq_0003_012:
	ScrCmd_609
	LockAll
	ApplyMovement obj_player, _1054
	ApplyMovement 0, _105C
	WaitMovement
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	BufferPlayersName 0
	NPCMsg msg_0040_00041
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CloseMsg
	PlayFanfare SEQ_ME_ASA
	WaitFanfare
	HealParty
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	NPCMsg msg_0040_00042
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0E9F:
	NPCMsg msg_0040_00042
	Return

_0EA4:
	NPCMsg msg_0040_00043
	Return

scr_seq_0003_013:
	ScrCmd_609
	LockAll
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	GetPlayerState VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _0ED4
	SetAvatarBits PLAYER_TRANSITION_ROCKET_HEAL
	GoTo _0ED8

_0ED4:
	SetAvatarBits PLAYER_TRANSITION_HEAL
_0ED8:
	UpdateAvatarState
	ApplyMovement obj_player, _0460
	WaitMovement
	NPCMsg msg_0040_00044
	Call _0F89
	Call _0216
	CheckBadge BADGE_ZEPHYR, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0F49
	NPCMsg msg_0040_00045
	ApplyMovement obj_player, _0468
	WaitMovement
	GetPlayerState VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _0F2E
	SetAvatarBits PLAYER_TRANSITION_ROCKET
	GoTo _0F32

_0F2E:
	SetAvatarBits PLAYER_TRANSITION_WALKING
_0F32:
	UpdateAvatarState
	ApplyMovement VAR_SPECIAL_x8007, _0454
	WaitMovement
	NPCMsg msg_0040_00046
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0F49:
	ApplyMovement obj_player, _0468
	WaitMovement
	GetPlayerState VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _0F6E
	SetAvatarBits PLAYER_TRANSITION_ROCKET
	GoTo _0F72

_0F6E:
	SetAvatarBits PLAYER_TRANSITION_WALKING
_0F72:
	UpdateAvatarState
	ApplyMovement VAR_SPECIAL_x8007, _0454
	WaitMovement
	NPCMsg msg_0040_00040
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0F89:
	ScrCmd_446 VAR_SPECIAL_x8004
	Compare VAR_SPECIAL_x8004, 69
	GoToIfEq _100A
	Compare VAR_SPECIAL_x8004, 158
	GoToIfEq _1012
	Compare VAR_SPECIAL_x8004, 166
	GoToIfEq _101A
	Compare VAR_SPECIAL_x8004, 236
	GoToIfEq _1022
	Compare VAR_SPECIAL_x8004, 185
	GoToIfEq _102A
	Compare VAR_SPECIAL_x8004, 81
	GoToIfEq _1032
	Compare VAR_SPECIAL_x8004, 246
	GoToIfEq _103A
	Compare VAR_SPECIAL_x8004, 293
	GoToIfEq _1042
	Compare VAR_SPECIAL_x8004, 169
	GoToIfEq _104A
	SetVar VAR_SPECIAL_x8007, 0
	Return

_100A:
	SetVar VAR_SPECIAL_x8007, 0
	Return

_1012:
	SetVar VAR_SPECIAL_x8007, 3
	Return

_101A:
	SetVar VAR_SPECIAL_x8007, 6
	Return

_1022:
	SetVar VAR_SPECIAL_x8007, 3
	Return

_102A:
	SetVar VAR_SPECIAL_x8007, 0
	Return

_1032:
	SetVar VAR_SPECIAL_x8007, 0
	Return

_103A:
	SetVar VAR_SPECIAL_x8007, 2
	Return

_1042:
	SetVar VAR_SPECIAL_x8007, 3
	Return

_104A:
	SetVar VAR_SPECIAL_x8007, 3
	Return

	.balign 4, 0
_1054:
	FaceNorth
	EndMovement

	.balign 4, 0
_105C:
	FaceSouth
	EndMovement

	.balign 4, 0
_1064:
	FaceWest
	EndMovement

	.balign 4, 0
_106C:
	FaceNorth
	EndMovement

	.balign 4, 0
_1074:
	FaceEast
	EndMovement

	.balign 4, 0
_107C:
	FaceSouth
	EndMovement

scr_seq_0003_015:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_450
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

scr_seq_0003_016:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScrCmd_455
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_0003_017:
	SimpleNPCMsg msg_0040_00054
	End

scr_seq_0003_018:
	SimpleNPCMsg msg_0040_00057
	End

scr_seq_0003_019:
	SimpleNPCMsg msg_0040_00058
	End

scr_seq_0003_020:
	HasItem ITEM_BICYCLE, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _1163
	ScrCmd_609
	LockAll
	PlaySE SEQ_SE_DP_SELECT
	PlayerOnBikeCheck VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _1140
	NPCMsg msg_0040_00059
	YesNo VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _115D
	PlayerOnBikeSet 1
	CloseMsg
	ReleaseAll
	End

_1140:
	NPCMsg msg_0040_00060
	YesNo VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _115D
	PlayerOnBikeSet 0
	CloseMsg
	ReleaseAll
	End

_115D:
	CloseMsg
	ReleaseAll
	End

_1163:
	End

scr_seq_0003_021:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0040_00062
	WaitABPress
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CloseMsg
	EggHatchAnim
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

scr_seq_0003_022:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0040_00065
	WaitABPress
	CloseMsg
	ReleaseAll
	End

scr_seq_0003_023:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0040_00103
	TouchscreenMenuHide
_11AE:
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd msg_0191_00112, 255, 0
	MenuItemAdd msg_0191_00113, 255, 1
	MenuItemAdd msg_0191_00114, 255, 2
	MenuItemAdd msg_0191_00115, 255, 3
	MenuItemAdd msg_0191_00116, 255, 4
	MenuExec
	Compare VAR_SPECIAL_RESULT, 4
	GoToIfGe _1277
	SetVar VAR_SPECIAL_x8004, 104
	AddVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	NonNPCMsgVar VAR_SPECIAL_x8004
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CloseMsg
	SetVar VAR_SPECIAL_x8000, 2
	AddVar VAR_SPECIAL_x8000, VAR_SPECIAL_RESULT
	ScrCmd_492 VAR_SPECIAL_x8000, VAR_SPECIAL_RESULT, VAR_SPECIAL_x8001
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _1277
	NPCMsg msg_0040_00109
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _11AE
	Compare VAR_SPECIAL_x8001, 65535
	GoToIfEq _126A
	ScrCmd_494 0, VAR_SPECIAL_x8001
	NPCMsg msg_0040_00111
	GoTo _126D

_126A:
	NPCMsg msg_0040_00110
_126D:
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	End

_1277:
	NPCMsg msg_0040_00108
	GoTo _126D
	End

scr_seq_0003_025:
	SimpleNPCMsg msg_0040_00068
	End

scr_seq_0003_027:
	End

scr_seq_0003_028:
	ScrCmd_609
	LockAll
	ReleaseAll
	End

_129F:
	NPCMsg msg_0040_00088
	WaitButton
	CloseMsg
	ReleaseAll
	End

_12AA:
	CloseMsg
	ReleaseAll
	End

scr_seq_0003_029:
	StopBGM 0
	GetPlayerGender VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	CallIfEq _12D6
	Compare VAR_SPECIAL_RESULT, 1
	CallIfEq _12DC
	RestartCurrentScript
	End

_12D6:
	TempBGM SEQ_GS_E_SUPPORT_F
	Return

_12DC:
	TempBGM SEQ_GS_E_SUPPORT_M
	Return

scr_seq_0003_031:
	StopBGM 0
	TempBGM SEQ_GS_E_RIVAL1
	RestartCurrentScript
	End

scr_seq_0003_070:
	StopBGM 0
	TempBGM SEQ_GS_E_RIVAL2
	RestartCurrentScript
	End

scr_seq_0003_042:
	StopBGM 0
	TempBGM SEQ_GS_E_MINAKI
	RestartCurrentScript
	End

scr_seq_0003_044:
	StopBGM 0
	TempBGM SEQ_GS_IBUKI
	RestartCurrentScript
	End

scr_seq_0003_036:
	StopBGM 0
	TempBGM SEQ_GS_E_TSURETEKE1
	RestartCurrentScript
	End

scr_seq_0003_037:
	StopBGM 0
	TempBGM SEQ_GS_E_TSURETEKE2
	RestartCurrentScript
	End

scr_seq_0003_065:
	StopBGM 0
	TempBGM SEQ_GS_E_G_PICHU
	RestartCurrentScript
	End

scr_seq_0003_067:
	StopBGM 0
	TempBGM SEQ_GS_E_MAIKO_THEME
	RestartCurrentScript
	End

scr_seq_0003_030:
scr_seq_0003_032:
scr_seq_0003_038:
scr_seq_0003_043:
scr_seq_0003_045:
scr_seq_0003_066:
scr_seq_0003_068:
scr_seq_0003_071:
	FadeOutBGM 0, 30
	StopBGM 0
	ResetBGM
	RestartCurrentScript
	End

scr_seq_0003_039:
	SetPhoneCall VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x8006
	Call _136C
	RestartCurrentScript
	End

scr_seq_0003_047:
	Call _136C
	End

_136C:
	PlaySE SEQ_SE_GS_PHONE0
	WaitSE SEQ_SE_GS_PHONE0
	PlaySE SEQ_SE_GS_PHONE0
	WaitSE SEQ_SE_GS_PHONE0
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	RunPhoneCall
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Return

scr_seq_0003_040:
	GoToIfSet FLAG_GOT_ALL_FOUR_FRONTIER_PRINTS, _13F6
	Compare VAR_BATTLE_FACTORY_PRINT_PROGRESS, 4
	GoToIfNe _13F6
	Compare VAR_BATTLE_HALL_PRINT_PROGRESS, 4
	GoToIfNe _13F6
	Compare VAR_BATTLE_CASTLE_PRINT_PROGRESS, 4
	GoToIfNe _13F6
	Compare VAR_BATTLE_ARCADE_PRINT_PROGRESS, 4
	GoToIfNe _13F6
	Compare VAR_BATTLE_TOWER_PRINT_PROGRESS, 4
	GoToIfNe _13F6
	SetFlag FLAG_GOT_ALL_FOUR_FRONTIER_PRINTS
	AddSpecialGameStat2 31
	GoTo _13F6
	End

_13F6:
	RestartCurrentScript
	End

scr_seq_0003_041:
	NPCMsg msg_0040_00093
	WaitButton
	CloseMsg
	ReleaseAll
	RestartCurrentScript
	End

scr_seq_0003_046:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_166 VAR_SPECIAL_RESULT
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	ScrCmd_662 VAR_SPECIAL_x8005, VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _1444
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	RestartCurrentScript
	End

_1444:
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	RestartCurrentScript
	End

scr_seq_0003_048:
	GoTo _145E
	End

_145E:
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd msg_0191_00321, 255, 0
	MenuItemAdd msg_0191_00322, 255, 1
	MenuItemAdd msg_0191_00323, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, scr_seq_0003_049
	Case 1, scr_seq_0003_050
	Case 2, scr_seq_0003_051
	End

scr_seq_0003_049:
	MartBuy VAR_SPECIAL_x8004
	GoTo _14DD
	End

scr_seq_0003_050:
	MartSell
	GoTo _14DD
	End

scr_seq_0003_051:
	TouchscreenMenuShow
	GetStdMsgNaix 3, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	WaitButton
	CloseMsg
	RestartCurrentScript
	End

_14DD:
	GetStdMsgNaix 3, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 6
	HoldMsg
	GoTo _145E
	End

scr_seq_0003_052:
	GoTo _14FB
	End

_14FB:
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd msg_0191_00321, 255, 0
	MenuItemAdd msg_0191_00322, 255, 1
	MenuItemAdd msg_0191_00323, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, scr_seq_0003_053
	Case 1, scr_seq_0003_054
	Case 2, scr_seq_0003_055
	End

scr_seq_0003_053:
	SpecialMartBuy VAR_SPECIAL_x8004
	GoTo _15A6
	End

scr_seq_0003_054:
	MartSell
	GoTo _15A6
	End

scr_seq_0003_055:
	TouchscreenMenuShow
	GoToIfSet FLAG_SPECIAL_MART_PHARMACY, _15E8
	GoToIfSet FLAG_SPECIAL_MART_BITTER, _160C
	GoToIfSet FLAG_SPECIAL_MART_MAHOGANY_GOOD, _1630
	GoToIfSet FLAG_SPECIAL_MART_MT_MOON, _1654
	GetStdMsgNaix 3, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
_159E:
	WaitButton
	CloseMsg
	RestartCurrentScript
	End

_15A6:
	GoToIfSet FLAG_SPECIAL_MART_PHARMACY, _15FA
	GoToIfSet FLAG_SPECIAL_MART_BITTER, _161E
	GoToIfSet FLAG_SPECIAL_MART_MAHOGANY_GOOD, _1642
	GoToIfSet FLAG_SPECIAL_MART_MT_MOON, _1666
	GetStdMsgNaix 3, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 6
_15DE:
	HoldMsg
	GoTo _14FB
	End

_15E8:
	GetStdMsgNaix 3, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 2
	GoTo _159E

_15FA:
	GetStdMsgNaix 3, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 7
	GoTo _15DE

_160C:
	GetStdMsgNaix 3, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	GoTo _159E

_161E:
	GetStdMsgNaix 3, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 8
	GoTo _15DE

_1630:
	GetStdMsgNaix 3, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 4
	GoTo _159E

_1642:
	GetStdMsgNaix 3, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 9
	GoTo _15DE

_1654:
	GetStdMsgNaix 3, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	GoTo _159E

_1666:
	GetStdMsgNaix 3, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 10
	GoTo _15DE

scr_seq_0003_056:
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd msg_0191_00321, 255, 0
	MenuItemAdd msg_0191_00324, 255, 1
	MenuItemAdd msg_0191_00323, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, scr_seq_0003_057
	Case 1, scr_seq_0003_058
	Case 2, scr_seq_0003_059
	End

scr_seq_0003_057:
	ScrCmd_771
	RestartCurrentScript
	End

scr_seq_0003_058:
	TouchscreenMenuShow
	RestartCurrentScript
	End

scr_seq_0003_059:
	TouchscreenMenuShow
	RestartCurrentScript
	End

scr_seq_0003_060:
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd msg_0191_00321, 255, 0
	MenuItemAdd msg_0191_00324, 255, 1
	MenuItemAdd msg_0191_00323, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, scr_seq_0003_061
	Case 1, scr_seq_0003_062
	Case 2, scr_seq_0003_063
	End

scr_seq_0003_061:
	ScrCmd_772
	RestartCurrentScript
	End

scr_seq_0003_062:
	TouchscreenMenuShow
	RestartCurrentScript
	End

scr_seq_0003_063:
	TouchscreenMenuShow
	RestartCurrentScript
	End

scr_seq_0003_064:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	GetFollowPokePartyIndex VAR_SPECIAL_x8005
	BufferPartyMonNick 0, VAR_SPECIAL_x8005
	NPCMsg msg_0040_00099
	CloseMsg
	ScrCmd_806
	GetFollowPokePartyIndex VAR_SPECIAL_x8005
	BufferPartyMonNick 0, VAR_SPECIAL_x8005
	NPCMsg msg_0040_00100
	WaitABPress
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
