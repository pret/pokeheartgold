#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T03R0101.h"
#include "msgdata/msg/msg_0464_T03R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T03R0101_000
	ScrDef scr_seq_T03R0101_001
	ScrDef scr_seq_T03R0101_002
	ScrDef scr_seq_T03R0101_003
	ScrDef scr_seq_T03R0101_004
	ScrDef scr_seq_T03R0101_005
	ScrDef scr_seq_T03R0101_006
	ScrDef scr_seq_T03R0101_007
	ScrDef scr_seq_T03R0101_008
	ScrDef scr_seq_T03R0101_009
	ScrDef scr_seq_T03R0101_010
	ScrDef scr_seq_T03R0101_011
	ScrDef scr_seq_T03R0101_012
	ScrDef scr_seq_T03R0101_013
	ScrDef scr_seq_T03R0101_014
	ScrDef scr_seq_T03R0101_015
	ScrDef scr_seq_T03R0101_016
	ScrDef scr_seq_T03R0101_017
	ScrDef scr_seq_T03R0101_018
	ScrDef scr_seq_T03R0101_019
	ScrDefEnd

scr_seq_T03R0101_014:
	Compare VAR_UNK_4083, 5
	GoToIfGe _00E8
	Compare VAR_UNK_4083, 4
	GoToIfEq _00E8
	Compare VAR_UNK_4083, 3
	GoToIfEq _00D8
	Compare VAR_UNK_4083, 2
	GoToIfEq _00D8
	Compare VAR_UNK_4083, 1
	GoToIfEq _00CE
	HasItem ITEM_ENIGMA_STONE, 1, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _00F4
	ScrCmd_546 0, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _00F4
	NopVar490 VAR_TEMP_x4007
	SetVar VAR_UNK_4083, 1
	ClearFlag FLAG_HIDE_STEVEN_IN_HOUSE_BEFORE_LATIS
	SetFlag FLAG_HIDE_STEVEN_IN_HOUSE_AFTER_LATIS
	End

_00CE:
	ClearFlag FLAG_HIDE_STEVEN_IN_HOUSE_BEFORE_LATIS
	SetFlag FLAG_HIDE_STEVEN_IN_HOUSE_AFTER_LATIS
	End

_00D8:
	SetFlag FLAG_HIDE_STEVEN_IN_HOUSE_BEFORE_LATIS
	SetFlag FLAG_HIDE_STEVEN_IN_HOUSE_AFTER_LATIS
	GoTo _0104
	End

_00E8:
	SetFlag FLAG_HIDE_STEVEN_IN_HOUSE_BEFORE_LATIS
	GoTo _0104
	End

_00F4:
	NopVar490 VAR_TEMP_x4006
	SetFlag FLAG_HIDE_STEVEN_IN_HOUSE_BEFORE_LATIS
	GoTo _0104
	End

_0104:
	GoToIfUnset FLAG_UNK_189, _0115
	ClearFlag FLAG_UNK_189
	End

_0115:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfEq _0139
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _0139
	SetFlag FLAG_HIDE_CAMERON
	End

_0139:
	ClearFlag FLAG_HIDE_CAMERON
	End

scr_seq_T03R0101_017:
	End

_0141:
	NopVar490 VAR_TEMP_x4006
	End

scr_seq_T03R0101_000:
	SimpleNPCMsg msg_0464_T03R0101_00000
	End

scr_seq_T03R0101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScriptOverlayCmd 2, 0
	GoToIfSet FLAG_MAPTEMP_001, _0530
	Compare VAR_UNK_407F, 0
	GoToIfNe _0550
	NPCMsg msg_0464_T03R0101_00001
	CountFossils VAR_SPECIAL_x8000
	Compare VAR_SPECIAL_x8000, 0
	GoToIfNe _019B
	NPCMsg msg_0464_T03R0101_00006
	GoTo _05FC

_019B:
	Compare VAR_SPECIAL_x8000, 1
	GoToIfEq _04F7
	SetVar VAR_SPECIAL_x8001, 0
	HasItem ITEM_OLD_AMBER, 1, VAR_SPECIAL_RESULT
	AddVar VAR_SPECIAL_x8001, VAR_SPECIAL_RESULT
	HasItem ITEM_HELIX_FOSSIL, 1, VAR_SPECIAL_RESULT
	AddVar VAR_SPECIAL_x8001, VAR_SPECIAL_RESULT
	HasItem ITEM_DOME_FOSSIL, 1, VAR_SPECIAL_RESULT
	AddVar VAR_SPECIAL_x8001, VAR_SPECIAL_RESULT
	HasItem ITEM_ROOT_FOSSIL, 1, VAR_SPECIAL_RESULT
	AddVar VAR_SPECIAL_x8001, VAR_SPECIAL_RESULT
	HasItem ITEM_CLAW_FOSSIL, 1, VAR_SPECIAL_RESULT
	AddVar VAR_SPECIAL_x8001, VAR_SPECIAL_RESULT
	HasItem ITEM_ARMOR_FOSSIL, 1, VAR_SPECIAL_RESULT
	AddVar VAR_SPECIAL_x8001, VAR_SPECIAL_RESULT
	HasItem ITEM_SKULL_FOSSIL, 1, VAR_SPECIAL_RESULT
	AddVar VAR_SPECIAL_x8001, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_x8001, 1
	GoToIfEq _04F7
	SetVar VAR_SPECIAL_x8004, 0
	SetVar VAR_SPECIAL_x8005, 0
	SetVar VAR_TEMP_x4000, 0
	SetVar VAR_TEMP_x4001, 0
	SetVar VAR_TEMP_x4002, 0
	SetVar VAR_TEMP_x4003, 0
	SetVar VAR_TEMP_x4004, 0
	SetVar VAR_TEMP_x4005, 0
	SetVar VAR_TEMP_x4006, 0
	SetVar VAR_TEMP_x4007, 0
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_x8000
_0263:
	Compare VAR_SPECIAL_x8005, 0
	CallIfEq _0417
	Compare VAR_SPECIAL_x8005, 1
	CallIfEq _0427
	Compare VAR_SPECIAL_x8005, 2
	CallIfEq _0437
	Compare VAR_SPECIAL_x8005, 3
	CallIfEq _0447
	Compare VAR_SPECIAL_x8005, 4
	CallIfEq _0457
	Compare VAR_SPECIAL_x8005, 5
	CallIfEq _0467
	Compare VAR_SPECIAL_x8005, 6
	CallIfEq _0477
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0340
	Compare VAR_SPECIAL_x8004, 0
	CallIfEq _0487
	Compare VAR_SPECIAL_x8004, 1
	CallIfEq _048F
	Compare VAR_SPECIAL_x8004, 2
	CallIfEq _0497
	Compare VAR_SPECIAL_x8004, 3
	CallIfEq _049F
	Compare VAR_SPECIAL_x8004, 4
	CallIfEq _04A7
	Compare VAR_SPECIAL_x8004, 5
	CallIfEq _04AF
	Compare VAR_SPECIAL_x8004, 6
	CallIfEq _04B7
	CopyVar VAR_SPECIAL_x8006, VAR_SPECIAL_x8005
	AddVar VAR_SPECIAL_x8006, 159
	MenuItemAdd VAR_SPECIAL_x8006, 255, VAR_SPECIAL_x8004
	GoTo _034C

_0340:
	AddVar VAR_SPECIAL_x8005, 1
	GoTo _0263

_034C:
	AddVar VAR_SPECIAL_x8004, 1
	AddVar VAR_SPECIAL_x8005, 1
	Compare VAR_SPECIAL_x8004, VAR_SPECIAL_x8001
	GoToIfNe _0263
	MenuItemAdd 45, 255, VAR_SPECIAL_x8004
	MenuExec
	TouchscreenMenuShow
	Compare VAR_SPECIAL_x8000, 255
	GoToIfEq _053F
	Compare VAR_SPECIAL_x8000, 0
	CallIfEq _04BF
	Compare VAR_SPECIAL_x8000, 1
	CallIfEq _04C7
	Compare VAR_SPECIAL_x8000, 2
	CallIfEq _04CF
	Compare VAR_SPECIAL_x8000, 3
	CallIfEq _04D7
	Compare VAR_SPECIAL_x8000, 4
	CallIfEq _04DF
	Compare VAR_SPECIAL_x8000, 5
	CallIfEq _04E7
	Compare VAR_SPECIAL_x8000, 6
	CallIfEq _04EF
	GetFossilPokemon VAR_UNK_407F, VAR_SPECIAL_x8002
	Compare VAR_UNK_407F, 0
	GoToIfEq _053F
	BufferItemName 0, VAR_SPECIAL_x8002
	NPCMsg msg_0464_T03R0101_00007
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _053F
	TakeItem VAR_SPECIAL_x8002, 1, VAR_SPECIAL_RESULT
	GoTo _0530

_0417:
	SetVar VAR_TEMP_x4000, 103
	HasItem VAR_TEMP_x4000, 1, VAR_SPECIAL_RESULT
	Return

_0427:
	SetVar VAR_TEMP_x4000, 101
	HasItem VAR_TEMP_x4000, 1, VAR_SPECIAL_RESULT
	Return

_0437:
	SetVar VAR_TEMP_x4000, 102
	HasItem VAR_TEMP_x4000, 1, VAR_SPECIAL_RESULT
	Return

_0447:
	SetVar VAR_TEMP_x4000, 99
	HasItem VAR_TEMP_x4000, 1, VAR_SPECIAL_RESULT
	Return

_0457:
	SetVar VAR_TEMP_x4000, 100
	HasItem VAR_TEMP_x4000, 1, VAR_SPECIAL_RESULT
	Return

_0467:
	SetVar VAR_TEMP_x4000, 104
	HasItem VAR_TEMP_x4000, 1, VAR_SPECIAL_RESULT
	Return

_0477:
	SetVar VAR_TEMP_x4000, 105
	HasItem VAR_TEMP_x4000, 1, VAR_SPECIAL_RESULT
	Return

_0487:
	CopyVar VAR_TEMP_x4001, VAR_TEMP_x4000
	Return

_048F:
	CopyVar VAR_TEMP_x4002, VAR_TEMP_x4000
	Return

_0497:
	CopyVar VAR_TEMP_x4003, VAR_TEMP_x4000
	Return

_049F:
	CopyVar VAR_TEMP_x4004, VAR_TEMP_x4000
	Return

_04A7:
	CopyVar VAR_TEMP_x4005, VAR_TEMP_x4000
	Return

_04AF:
	CopyVar VAR_TEMP_x4006, VAR_TEMP_x4000
	Return

_04B7:
	CopyVar VAR_TEMP_x4007, VAR_TEMP_x4000
	Return

_04BF:
	CopyVar VAR_SPECIAL_x8002, VAR_TEMP_x4001
	Return

_04C7:
	CopyVar VAR_SPECIAL_x8002, VAR_TEMP_x4002
	Return

_04CF:
	CopyVar VAR_SPECIAL_x8002, VAR_TEMP_x4003
	Return

_04D7:
	CopyVar VAR_SPECIAL_x8002, VAR_TEMP_x4004
	Return

_04DF:
	CopyVar VAR_SPECIAL_x8002, VAR_TEMP_x4005
	Return

_04E7:
	CopyVar VAR_SPECIAL_x8002, VAR_TEMP_x4006
	Return

_04EF:
	CopyVar VAR_SPECIAL_x8002, VAR_TEMP_x4007
	Return

_04F7:
	GetFossilMinimumAmount VAR_SPECIAL_x8002, VAR_SPECIAL_x8004, 1
	BufferItemName 0, VAR_SPECIAL_x8002
	NPCMsg msg_0464_T03R0101_00007
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _053F
	GetFossilPokemon VAR_UNK_407F, VAR_SPECIAL_x8002
	TakeItem VAR_SPECIAL_x8002, 1, VAR_SPECIAL_RESULT
	GoTo _0530

_0530:
	SetFlag FLAG_MAPTEMP_001
	NPCMsg msg_0464_T03R0101_00003
	GoTo _05FC
	End

_053F:
	SetVar VAR_UNK_407F, 0
	NPCMsg msg_0464_T03R0101_00002
	GoTo _05FC
	End

_0550:
	BufferSpeciesName 0, VAR_UNK_407F, 0, 0
	NPCMsg msg_0464_T03R0101_00004
	GetPartyCount VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 6
	GoToIfNe _0575
	NPCMsg msg_0464_T03R0101_00005
	GoTo _05FC

_0575:
	BufferSpeciesName 1, VAR_UNK_407F, 0, 0
	BufferPlayersName 0
	PlayFanfare SEQ_ME_POKEGET
	NPCMsg msg_0464_T03R0101_00008
	WaitFanfare
	GiveMon VAR_UNK_407F, 20, 0, 0, 0, VAR_SPECIAL_RESULT
	ScrCmd_420 116
	SetVar VAR_UNK_407F, 0
	NPCMsg msg_0464_T03R0101_00009
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	CloseMsg
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0600
	GetPartyCount VAR_TEMP_x4000
	SubVar VAR_TEMP_x4000, 1
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	NicknameInput VAR_TEMP_x4000, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _05E8
	ScrCmd_420 50
_05E8:
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ScriptOverlayCmd 2, 1
	ReleaseAll
	End

_05FC:
	WaitButton
	CloseMsg
_0600:
	ScriptOverlayCmd 2, 1
	ReleaseAll
	End

scr_seq_T03R0101_013:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _070D
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0721
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0681
	ApplyMovement obj_player, _0738
	ApplyMovement obj_T03R0101_gsmiddleman1, _0770
	GoTo _06AC

_0681:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _069C
	ApplyMovement obj_player, _0750
	GoTo _06AC

_069C:
	ApplyMovement obj_player, _075C
	ApplyMovement obj_T03R0101_gsmiddleman1, _0770
_06AC:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _06D3
	ApplyMovement obj_partner_poke, _077C
	WaitMovement
_06D3:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 65
	LockAll
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ClearFlag FLAG_UNK_189
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 2
	WaitButton
	CloseMsg
	ReleaseAll
	End

_070D:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0721:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0738:
	WalkNormalWest
	WalkNormalNorth 2
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0750:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_075C:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0770:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_077C:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_T03R0101_019:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0464_T03R0101_00013
	WaitButton
	CloseMsg
	SetVar VAR_UNK_4130, 5
	ReleaseAll
	End

scr_seq_T03R0101_015:
	End

scr_seq_T03R0101_018:
	Compare VAR_UNK_4083, 0
	GoToIfEq _07BF
	Compare VAR_UNK_4083, 1
	GoToIfEq _07C1
_07BF:
	End

_07C1:
	NopVar490 VAR_UNK_4083
	ScrCmd_344 0, 0
	MovePersonFacing obj_T03R0101_daigo, 26, 0, 7, DIR_SOUTH
	GoTo _07BF
	End

scr_seq_T03R0101_016:
	ScrCmd_609
	LockAll
	HasItem ITEM_ENIGMA_STONE, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0963
	ScrCmd_546 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0963
	ApplyMovement obj_T03R0101_daigo, _0968
	WaitMovement
	NPCMsg msg_0464_T03R0101_00014
	CloseMsg
	ApplyMovement obj_T03R0101_daigo, _0970
	WaitMovement
	NPCMsg msg_0464_T03R0101_00015
	NPCMsg msg_0464_T03R0101_00016
	CloseMsg
	ApplyMovement obj_T03R0101_daigo, _097C
	ApplyMovement obj_T03R0101_gsassistantm, _09C8
	WaitMovement
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	Compare VAR_TEMP_x4001, 6
	GoToIfNe _0868
	ApplyMovement obj_player, _0998
	GoTo _0870

_0868:
	ApplyMovement obj_player, _098C
_0870:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ApplyMovement obj_player, _09A4
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0464_T03R0101_00017
	CloseMsg
	ApplyMovement obj_T03R0101_gsassistantm, _09D0
	WaitMovement
	NPCMsg msg_0464_T03R0101_00018
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Wait 30, VAR_SPECIAL_RESULT
	Release obj_T03R0101_daigo
	MovePersonFacing obj_T03R0101_daigo, 25, 0, 7, DIR_SOUTH
	Wait 10, VAR_SPECIAL_RESULT
	Lock obj_T03R0101_daigo
	Compare VAR_TEMP_x4001, 6
	GoToIfEq _08F1
	ScrCmd_729 VAR_TEMP_x4009
	Compare VAR_TEMP_x4009, 0
	GoToIfEq _08F1
	ApplyMovement obj_partner_poke, _09F0
	WaitMovement
_08F1:
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Wait 10, VAR_SPECIAL_RESULT
	ApplyMovement obj_T03R0101_gsassistantm, _09D0
	WaitMovement
	NPCMsg msg_0464_T03R0101_00019
	CloseMsg
	ApplyMovement obj_T03R0101_gsassistantm, _09D8
	WaitMovement
	TakeItem ITEM_ENIGMA_STONE, 1, VAR_SPECIAL_RESULT
	SetVar VAR_SPECIAL_x8004, 225
	SetVar VAR_SPECIAL_x8005, 1
	CallStd std_obtain_item_verbose
	CloseMsg
	ApplyMovement obj_T03R0101_daigo, _09B8
	WaitMovement
	ApplyMovement obj_player, _0968
	WaitMovement
	NPCMsg msg_0464_T03R0101_00021
	CloseMsg
	ApplyMovement obj_T03R0101_daigo, _09C0
	WaitMovement
	SetVar VAR_UNK_4083, 2
	HidePerson obj_T03R0101_daigo
_0963:
	ReleaseAll
	End

	.balign 4, 0
_0968:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0970:
	Delay8
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_097C:
	LockDir
	WalkNormalEast
	UnlockDir
	EndMovement

	.balign 4, 0
_098C:
	WalkNormalEast
	FaceSouth
	EndMovement

	.balign 4, 0
_0998:
	WalkNormalEast
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_09A4:
	WalkNormalSouth
	Delay8
	WalkNormalNorth
	FaceSouth
	EndMovement

	.balign 4, 0
_09B8:
	FaceEast
	EndMovement

	.balign 4, 0
_09C0:
	WalkNormalWest 8
	EndMovement

	.balign 4, 0
_09C8:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_09D0:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_09D8:
	WalkNormalNorth
	WalkOnSpotNormalNorth
	LockDir
	WalkNormalSouth
	UnlockDir
	EndMovement

	.balign 4, 0
_09F0:
	WalkFasterNorth
	WalkFasterEast
	FaceSouth
	EndMovement

scr_seq_T03R0101_002:
	SimpleNPCMsg msg_0464_T03R0101_00010
	End

scr_seq_T03R0101_003:
	SimpleNPCMsg msg_0464_T03R0101_00011
	End

scr_seq_T03R0101_004:
	SimpleNPCMsg msg_0464_T03R0101_00012
	End

scr_seq_T03R0101_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0464_T03R0101_00022
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T03R0101_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0464_T03R0101_00023
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T03R0101_007:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0464_T03R0101_00024
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T03R0101_008:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0464_T03R0101_00025
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T03R0101_009:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0464_T03R0101_00026
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T03R0101_010:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0464_T03R0101_00027
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T03R0101_011:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0464_T03R0101_00028
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T03R0101_012:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0464_T03R0101_00029
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
