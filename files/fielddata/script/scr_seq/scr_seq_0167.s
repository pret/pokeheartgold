#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0167.h"
#include "msgdata/msg/msg_0312.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_0167_000
	ScrDef scr_seq_0167_001
	ScrDef scr_seq_0167_002
	ScrDefEnd

scr_seq_0167_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_TEMP_x400A, 0
	NPCMsg msg_0312_00000
	GoTo _0040
	End

scr_seq_0167_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_TEMP_x400A, 1
	NPCMsg msg_0312_00001
	GoTo _0040
	End

_0040:
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 271, 255, 0
	MenuItemAdd 11, 255, 1
	MenuItemAdd 12, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _01A7
	Case 1, _008C
	GoTo _07D9
	End

_008C:
	NPCMsg msg_0312_00011
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	Compare VAR_TEMP_x400A, 0
	GoToIfNe _00B4
	MenuItemAdd 272, 255, 0
	GoTo _00BC

_00B4:
	MenuItemAdd 278, 255, 7
_00BC:
	MenuItemAdd 273, 255, 1
	MenuItemAdd 274, 255, 2
	MenuItemAdd 277, 255, 3
	MenuItemAdd 275, 255, 4
	MenuItemAdd 276, 255, 5
	MenuItemAdd 13, 255, 6
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _015A
	Case 1, _0165
	Case 2, _0170
	Case 3, _017B
	Case 4, _0186
	Case 5, _0191
	Case 7, _019C
	NPCMsg msg_0312_00002
	GoTo _0040
	End

_015A:
	NPCMsg msg_0312_00012
	GoTo _008C
	End

_0165:
	NPCMsg msg_0312_00014
	GoTo _008C
	End

_0170:
	NPCMsg msg_0312_00015
	GoTo _008C
	End

_017B:
	NPCMsg msg_0312_00018
	GoTo _008C
	End

_0186:
	NPCMsg msg_0312_00016
	GoTo _008C
	End

_0191:
	NPCMsg msg_0312_00017
	GoTo _008C
	End

_019C:
	NPCMsg msg_0312_00013
	GoTo _008C
	End

_01A7:
	CountAliveMonsAndPC VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfLt _07E6
	NPCMsg msg_0312_00003
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 273, 255, 0
	MenuItemAdd 274, 255, 1
	MenuItemAdd 277, 255, 4
	MenuItemAdd 275, 255, 2
	MenuItemAdd 276, 255, 3
	MenuItemAdd 13, 255, 5
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0249
	Case 1, _0257
	Case 2, _0265
	Case 3, _0273
	Case 4, _0281
	NPCMsg msg_0312_00002
	GoTo _0040
	End

_0249:
	SetVar VAR_SPECIAL_x8000, 0
	GoTo _028F
	End

_0257:
	SetVar VAR_SPECIAL_x8000, 1
	GoTo _028F
	End

_0265:
	SetVar VAR_SPECIAL_x8000, 3
	GoTo _028F
	End

_0273:
	SetVar VAR_SPECIAL_x8000, 4
	GoTo _028F
	End

_0281:
	SetVar VAR_SPECIAL_x8000, 2
	GoTo _028F
	End

_028F:
	BufferPokeathlonCourseName 3, VAR_SPECIAL_x8000
	NPCMsg msg_0312_00004
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _01A7
	ScrCmd_815 0
	NPCMsg msg_0312_00005
	CloseMsg
	ScrCmd_600
	Call _04A3
	ScrCmd_307 0, 0, 22, 9, 77
	Call _045C
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0820
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	Call _04DE
	ApplyMovement obj_player, _0848
	Wait 40, VAR_SPECIAL_RESULT
	SetAvatarBits PLAYER_TRANSITION_POKEATHLON
	UpdateAvatarState
	WaitMovement
	PlayFanfare SEQ_ME_PT_NEW
	BufferPlayersName 0
	NPCMsg msg_0312_00008
	WaitFanfare
	Wait 30, VAR_SPECIAL_RESULT
	NPCMsg msg_0312_00006
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0828
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_309 77
	Call _0766
	SetAvatarBits PLAYER_TRANSITION_WALKING
	UpdateAvatarState
	ApplyMovement obj_player, _0934
	WaitMovement
	ScriptOverlayCmd 3, 0
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _08DC
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_307 0, 0, 22, 9, 77
	Call _045C
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _046F
	Call _0505
	Call _0540
	Call _0464
	NPCMsg msg_0312_00019
	BufferPlayersName 0
	BufferInt 1, VAR_SPECIAL_x8001
	BufferInt 2, VAR_SPECIAL_x8002
	NPCMsg msg_0312_00046
	NPCMsg msg_0312_00020
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	Compare VAR_SPECIAL_x8003, 0
	CallIfEq _05AB
	Call _0567
	Compare VAR_UNK_40E2, 1
	CallIfEq _05ED
	Compare VAR_UNK_40E2, 2
	CallIfEq _05FA
	Compare VAR_UNK_40E2, 3
	CallIfEq _0607
	CallIfSet FLAG_HIDE_POKEATHLON_SHOES_SIGN, _063E
	CallIfSet FLAG_HIDE_POKEATHLON_CLOTHES_SIGN, _0657
	CallIfSet FLAG_HIDE_POKEATHLON_FLAG_SIGN, _0670
	CallIfSet FLAG_HIDE_POKEATHLON_POKEGEAR_SIGN, _0689
	CallIfSet FLAG_HIDE_POKEATHLON_BALL_SIGN, _06A2
	NPCMsg msg_0312_00010
	WaitButton
	CloseMsg
	ReleaseAll
	ScrCmd_606
	ScriptOverlayCmd 3, 1
	End

_045C:
	ScrCmd_310 77
	ScrCmd_308 77
	Return

_0464:
	ScrCmd_311 77
	ScrCmd_308 77
	ScrCmd_309 77
	Return

_046F:
	ScriptOverlayCmd 3, 1
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _090C
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	Call _0540
	Call _0464
	ScrCmd_606
	ReleaseAll
	End

_04A3:
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	Compare VAR_TEMP_x400A, 0
	GoToIfNe _04C8
	ApplyMovement obj_player, _0814
	GoTo _04D0

_04C8:
	ApplyMovement obj_player, _083C
_04D0:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	Return

_04DE:
	Compare VAR_TEMP_x400A, 0
	GoToIfNe _04F9
	ApplyMovement 0, _0914
	GoTo _0501

_04F9:
	ApplyMovement 10, _091C
_0501:
	WaitMovement
	Return

_0505:
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	Compare VAR_TEMP_x400A, 0
	GoToIfNe _052A
	ApplyMovement obj_player, _08EC
	GoTo _0532

_052A:
	ApplyMovement obj_player, _08FC
_0532:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	Return

_0540:
	Compare VAR_TEMP_x400A, 0
	GoToIfNe _055B
	ApplyMovement 0, _0924
	GoTo _0563

_055B:
	ApplyMovement 10, _0924
_0563:
	WaitMovement
	Return

_0567:
	Compare VAR_SPECIAL_x8003, 0
	GoToIfNe _057F
	ScrCmd_725 0, 10
	GoTo _05A9

_057F:
	Compare VAR_SPECIAL_x8003, 1
	GoToIfNe _0597
	ScrCmd_725 0, 5
	GoTo _05A9

_0597:
	Compare VAR_SPECIAL_x8003, 3
	GoToIfNe _05A9
	ScrCmd_725 1, 5
_05A9:
	Return

_05AB:
	Compare VAR_TEMP_x400A, 0
	GoToIfNe _05C4
	SetVar VAR_TEMP_x4009, 100
	GoTo _05CA

_05C4:
	SetVar VAR_TEMP_x4009, 300
_05CA:
	BufferInt 2, VAR_TEMP_x4009
	NPCMsg msg_0312_00022
	GiveAthletePoints VAR_TEMP_x4009
	BufferPlayersName 0
	BufferInt 2, VAR_TEMP_x4009
	NPCMsg msg_0312_00020
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	AddSpecialGameStat SCORE_EVENT_13
	Return

_05ED:
	CallIfSet FLAG_UNK_0EF, _0614
	Return

_05FA:
	CallIfSet FLAG_UNK_0F0, _0622
	Return

_0607:
	CallIfSet FLAG_UNK_0F1, _0630
	Return

_0614:
	BufferPlayersName 0
	NPCMsg msg_0312_00023
	SetVar VAR_UNK_40E2, 2
	Return

_0622:
	BufferPlayersName 0
	NPCMsg msg_0312_00024
	SetVar VAR_UNK_40E2, 3
	Return

_0630:
	BufferPlayersName 0
	NPCMsg msg_0312_00025
	SetVar VAR_UNK_40E2, 4
	Return

_063E:
	ScrCmd_724 16, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 5000
	GoToIfLt _0655
	ClearFlag FLAG_HIDE_POKEATHLON_SHOES_SIGN
_0655:
	Return

_0657:
	ScrCmd_724 12, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 50
	GoToIfLt _066E
	ClearFlag FLAG_HIDE_POKEATHLON_CLOTHES_SIGN
_066E:
	Return

_0670:
	ScrCmd_724 17, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 200
	GoToIfLt _0687
	ClearFlag FLAG_HIDE_POKEATHLON_FLAG_SIGN
_0687:
	Return

_0689:
	ScrCmd_724 10, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 100
	GoToIfLt _06A0
	ClearFlag FLAG_HIDE_POKEATHLON_POKEGEAR_SIGN
_06A0:
	Return

_06A2:
	ScrCmd_724 0, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 50
	GoToIfLt _0764
	ScrCmd_724 1, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 50
	GoToIfLt _0764
	ScrCmd_724 2, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 50
	GoToIfLt _0764
	ScrCmd_724 3, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 50
	GoToIfLt _0764
	ScrCmd_724 4, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 50
	GoToIfLt _0764
	ScrCmd_724 5, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 50
	GoToIfLt _0764
	ScrCmd_724 6, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 50
	GoToIfLt _0764
	ScrCmd_724 7, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 50
	GoToIfLt _0764
	ScrCmd_724 8, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 50
	GoToIfLt _0764
	ScrCmd_724 9, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 50
	GoToIfLt _0764
	ClearFlag FLAG_HIDE_POKEATHLON_BALL_SIGN
_0764:
	Return

_0766:
	Compare VAR_TEMP_x400A, 0
	GoToIfNe _0787
	Pokeathlon 0, 0, VAR_SPECIAL_x8000, VAR_SPECIAL_RESULT, VAR_SPECIAL_x8001, VAR_SPECIAL_x8002, VAR_SPECIAL_x8003
	GoTo _07D7

_0787:
	Compare VAR_TEMP_x400A, 1
	GoToIfNe _07A8
	Pokeathlon 0, 1, VAR_SPECIAL_x8000, VAR_SPECIAL_RESULT, VAR_SPECIAL_x8001, VAR_SPECIAL_x8002, VAR_SPECIAL_x8003
	GoTo _07D7

_07A8:
	Compare VAR_TEMP_x400A, 2
	GoToIfNe _07C9
	Pokeathlon 1, 0, VAR_SPECIAL_x8000, VAR_SPECIAL_RESULT, VAR_SPECIAL_x8001, VAR_SPECIAL_x8002, VAR_SPECIAL_x8003
	GoTo _07D7

_07C9:
	Pokeathlon 1, 1, VAR_SPECIAL_x8000, VAR_SPECIAL_RESULT, VAR_SPECIAL_x8001, VAR_SPECIAL_x8002, VAR_SPECIAL_x8003
_07D7:
	Return

_07D9:
	TouchscreenMenuShow
_07DB:
	NPCMsg msg_0312_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_07E6:
	TouchscreenMenuShow
	NPCMsg msg_0312_00037
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_07F4:
	WalkNormalNorth 3
	WalkNormalWest
	FaceEast
	EndMovement

	.balign 4, 0
_0804:
	Delay8 2
	WalkNormalEast
	WalkNormalSouth 3
	EndMovement

	.balign 4, 0
_0814:
	WalkNormalWest
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0820:
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_0828:
	WalkOnSpotNormalNorth
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_083C:
	WalkNormalEast
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0848:
	FaceNorth
	Delay1
	FaceEast
	Delay1
	FaceSouth
	Delay1
	FaceWest
	Delay1
	FaceNorth
	Delay1
	FaceEast
	Delay1
	FaceSouth
	Delay1
	FaceWest
	Delay1
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	Delay8
	EndMovement

	.balign 4, 0
_08DC:
	WalkNormalSouth
	WalkNormalWest
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_08EC:
	WalkNormalSouth 2
	WalkNormalEast
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_08FC:
	WalkNormalSouth 2
	WalkNormalWest
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_090C:
	WalkNormalSouth 3
	EndMovement

	.balign 4, 0
_0914:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_091C:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0924:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_092C:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0934:
	FaceSouth
	EndMovement

scr_seq_0167_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_40E2, 0
	GoToIfEq _0FE4
	SetVar VAR_TEMP_x400A, 2
	NPCMsg msg_0312_00026
_095A:
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 271, 255, 0
	MenuItemAdd 11, 255, 1
	MenuItemAdd 12, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0AB1
	Case 1, _09A6
	GoTo _07D9
	End

_09A6:
	NPCMsg msg_0312_00011
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 272, 255, 0
	MenuItemAdd 342, 255, 1
	MenuItemAdd 343, 255, 2
	MenuItemAdd 344, 255, 3
	MenuItemAdd 345, 255, 4
	MenuItemAdd 346, 255, 6
	CallIfUnset FLAG_HIDE_POKEATHLON_SUPREME_CUP_RECEPTIONIST, _0B93
	MenuItemAdd 13, 255, 7
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0A64
	Case 1, _0A6F
	Case 2, _0A7A
	Case 3, _0A85
	Case 4, _0A90
	Case 6, _0A9B
	Case 5, _0AA6
	NPCMsg msg_0312_00002
	GoTo _095A
	End

_0A64:
	NPCMsg msg_0312_00039
	GoTo _09A6
	End

_0A6F:
	NPCMsg msg_0312_00040
	GoTo _09A6
	End

_0A7A:
	NPCMsg msg_0312_00041
	GoTo _09A6
	End

_0A85:
	NPCMsg msg_0312_00042
	GoTo _09A6
	End

_0A90:
	NPCMsg msg_0312_00043
	GoTo _09A6
	End

_0A9B:
	NPCMsg msg_0312_00044
	GoTo _09A6
	End

_0AA6:
	NPCMsg msg_0312_00045
	GoTo _09A6
	End

_0AB1:
	CountAliveMonsAndPC VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfLt _07E6
	CallStd std_prompt_save
	CopyVar VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0AE1
	GoTo _07DB
	End

_0AE1:
	SetVar VAR_TEMP_x400A, 2
	NPCMsg msg_0312_00003
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 342, 255, 0
	MenuItemAdd 343, 255, 1
	MenuItemAdd 344, 255, 2
	MenuItemAdd 345, 255, 3
	MenuItemAdd 346, 255, 4
	CallIfUnset FLAG_HIDE_POKEATHLON_SUPREME_CUP_RECEPTIONIST, _0B93
	MenuItemAdd 12, 255, 6
	MenuExec
	CopyVar VAR_TEMP_x400B, VAR_SPECIAL_RESULT
	Switch VAR_SPECIAL_RESULT
	Case 0, _0B9D
	Case 1, _0BAB
	Case 2, _0BB9
	Case 3, _0BC7
	Case 4, _0BD5
	Case 5, _0BE3
	GoTo _07D9
	End

_0B93:
	MenuItemAdd 279, 255, 5
	Return

_0B9D:
	SetVar VAR_SPECIAL_x8000, 5
	GoTo _0BF7
	End

_0BAB:
	SetVar VAR_SPECIAL_x8000, 6
	GoTo _0BF7
	End

_0BB9:
	SetVar VAR_SPECIAL_x8000, 7
	GoTo _0BF7
	End

_0BC7:
	SetVar VAR_SPECIAL_x8000, 8
	GoTo _0BF7
	End

_0BD5:
	SetVar VAR_SPECIAL_x8000, 9
	GoTo _0BF7
	End

_0BE3:
	SetVar VAR_SPECIAL_x8000, 10
	SetVar VAR_TEMP_x400A, 3
	GoTo _0BF7
	End

_0BF7:
	TouchscreenMenuHide
	NPCMsg msg_0312_00027
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 14, 255, 0
	MenuItemAdd 15, 255, 1
	MenuItemAdd 13, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0C48
	Case 1, _0C88
	GoTo _0AE1
	End

_0C46:
	End

_0C48:
	NPCMsg msg_0312_00028
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0BF7
	ScrCmd_226 40, VAR_TEMP_x400B, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0CC8
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _0CD2
	GoTo _0CE3
	End

_0C88:
	NPCMsg msg_0312_00028
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0BF7
	ScrCmd_227 40, VAR_TEMP_x400B, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0CC8
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _0CD2
	GoTo _0CE3
	End

_0CC8:
	ScrCmd_283
	GoTo _0BF7
	End

_0CD2:
	ScrCmd_283
	TouchscreenMenuShow
	NPCMsg msg_0312_00029
	WaitButton
	CloseMsg
	ReleaseAll
	ScrCmd_606
	End

_0CE3:
	ScrCmd_815 0
	NPCMsg msg_0312_00036
	Wait 30, VAR_SPECIAL_x8004
	CloseMsg
	ScrCmd_600
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0814
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_307 0, 0, 10, 9, 77
	Call _045C
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0820
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ApplyMovement 2, _0914
	ApplyMovement obj_player, _0848
	Wait 40, VAR_SPECIAL_RESULT
	SetAvatarBits PLAYER_TRANSITION_POKEATHLON
	UpdateAvatarState
	WaitMovement
	PlayFanfare SEQ_ME_PT_NEW
	BufferPlayersName 0
	NPCMsg msg_0312_00035
	Wait 30, VAR_SPECIAL_x8004
	WaitFanfare
	BufferPokeathlonCourseName 3, VAR_SPECIAL_x8000
	ScrCmd_451 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _0D96
	NPCMsg msg_0312_00030
	Wait 30, VAR_SPECIAL_x8004
	GoTo _0DD7

_0D96:
	Compare VAR_TEMP_x4000, 1
	GoToIfNe _0DB2
	NPCMsg msg_0312_00031
	Wait 30, VAR_SPECIAL_x8004
	GoTo _0DD7

_0DB2:
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _0DCE
	NPCMsg msg_0312_00032
	Wait 30, VAR_SPECIAL_x8004
	GoTo _0DD7

_0DCE:
	NPCMsg msg_0312_00033
	Wait 30, VAR_SPECIAL_x8004
_0DD7:
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0FD4
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_309 77
	ScrCmd_257 239
	Call _0766
	ScrCmd_283
	SetAvatarBits PLAYER_TRANSITION_WALKING
	UpdateAvatarState
	ApplyMovement obj_player, _0934
	WaitMovement
	ScriptOverlayCmd 3, 0
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0FDC
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_307 0, 0, 10, 9, 77
	Call _045C
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _08EC
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ApplyMovement 2, _0924
	WaitMovement
	Call _0464
	NPCMsg msg_0312_00019
	BufferPlayersName 0
	BufferInt 1, VAR_SPECIAL_x8001
	BufferInt 2, VAR_SPECIAL_x8002
	Compare VAR_SPECIAL_x8000, 10
	GoToIfLt _0EB5
	NPCMsg msg_0312_00047
	GoTo _0EB8

_0EB5:
	NPCMsg msg_0312_00046
_0EB8:
	NPCMsg msg_0312_00020
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	Compare VAR_SPECIAL_x8003, 1
	CallIfLe _0F43
	Call _0F8D
	Compare VAR_UNK_40E2, 1
	CallIfEq _05ED
	Compare VAR_UNK_40E2, 2
	CallIfEq _05FA
	Compare VAR_UNK_40E2, 3
	CallIfEq _0607
	CallIfSet FLAG_HIDE_POKEATHLON_SHOES_SIGN, _063E
	CallIfSet FLAG_HIDE_POKEATHLON_CLOTHES_SIGN, _0657
	CallIfSet FLAG_HIDE_POKEATHLON_FLAG_SIGN, _0670
	CallIfSet FLAG_HIDE_POKEATHLON_POKEGEAR_SIGN, _0689
	CallIfSet FLAG_HIDE_POKEATHLON_BALL_SIGN, _06A2
	NPCMsg msg_0312_00010
	WaitButton
	CloseMsg
	ReleaseAll
	ScrCmd_606
	ScriptOverlayCmd 3, 1
	End

_0F43:
	Compare VAR_SPECIAL_x8003, 0
	GoToIfNe _0F68
	SetVar VAR_TEMP_x4009, 500
	BufferInt 2, VAR_TEMP_x4009
	NPCMsg msg_0312_00022
	AddSpecialGameStat SCORE_EVENT_18
	GoTo _0F76

_0F68:
	SetVar VAR_TEMP_x4009, 200
	BufferInt 2, VAR_TEMP_x4009
	NPCMsg msg_0312_00034
_0F76:
	GiveAthletePoints VAR_TEMP_x4009
	BufferPlayersName 0
	BufferInt 2, VAR_TEMP_x4009
	NPCMsg msg_0312_00020
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	Return

_0F8D:
	Compare VAR_SPECIAL_x8003, 0
	GoToIfNe _0FA5
	ScrCmd_725 0, 15
	GoTo _0FCF

_0FA5:
	Compare VAR_SPECIAL_x8003, 1
	GoToIfNe _0FBD
	ScrCmd_725 0, 10
	GoTo _0FCF

_0FBD:
	Compare VAR_SPECIAL_x8003, 3
	GoToIfNe _0FCF
	ScrCmd_725 1, 5
_0FCF:
	Return

	.balign 4, 0
_0FD4:
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_0FDC:
	WalkNormalSouth 2
	EndMovement

_0FE4:
	NPCMsg msg_0312_00038
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
