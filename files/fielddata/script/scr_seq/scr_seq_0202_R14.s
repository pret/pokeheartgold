#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R14.h"
#include "msgdata/msg/msg_0351_R14.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R14_000
	ScrDef scr_seq_R14_001
	ScrDef scr_seq_R14_002
	ScrDef scr_seq_R14_003
	ScrDef scr_seq_R14_004
	ScrDef scr_seq_R14_005
	ScrDefEnd

scr_seq_R14_001:
	GoToIfUnset FLAG_UNK_189, _002B
	ClearFlag FLAG_UNK_189
	End

_002B:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 4
	GoToIfEq _004F
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _004F
	SetFlag FLAG_HIDE_CAMERON
	End

_004F:
	ClearFlag FLAG_HIDE_CAMERON
	End

scr_seq_R14_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _017D
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0191
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _00CE
	ApplyMovement obj_player, _01A8
	ApplyMovement obj_R14_gsmiddleman1_3, _01F4
	GoTo _011C

_00CE:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _00E9
	ApplyMovement obj_player, _01C0
	GoTo _011C

_00E9:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _010C
	ApplyMovement obj_player, _01E0
	ApplyMovement obj_R14_gsmiddleman1_3, _01F4
	GoTo _011C

_010C:
	ApplyMovement obj_player, _01CC
	ApplyMovement obj_R14_gsmiddleman1_3, _01F4
_011C:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0143
	ApplyMovement obj_partner_poke, _0200
	WaitMovement
_0143:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 60
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

_017D:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0191:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_01A8:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01C0:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01CC:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01E0:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01F4:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0200:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_R14_002:
	ScrCmd_609
	LockAll
	ClearFlag FLAG_HIDE_ROUTE_14_EUSINE
	ShowPerson obj_R14_minaki
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4000, 1358
	GoToIfNe _024F
	ApplyMovement obj_player, _0450
	WaitMovement
	GoTo _027C

_0249:
	GoTo _0255

_024F:
	GoTo _0255

_0255:
	Compare VAR_TEMP_x4001, 409
	GoToIfNe _0272
	ApplyMovement obj_player, _0450
	WaitMovement
	GoTo _027C

_0272:
	ApplyMovement obj_player, _0450
	WaitMovement
_027C:
	PlayCry SPECIES_SUICUNE, 0
	Release obj_R14_tsure_poke_static_suicune
	ScrCmd_523 obj_R14_tsure_poke_static_suicune, 2, 90, 2, 0
	Lock obj_R14_tsure_poke_static_suicune
	WaitCry
	Compare VAR_TEMP_x4000, 1358
	GoToIfNe _02B1
	GoTo _02D0

_02AB:
	GoTo _02D0

_02B1:
	Compare VAR_TEMP_x4000, 1359
	GoToIfNe _02CA
	GoTo _0382

_02C4:
	GoTo _02D0

_02CA:
	GoTo _03AD

_02D0:
	Compare VAR_TEMP_x4001, 409
	GoToIfNe _02EB
	ApplyMovement obj_player, _04AC
	GoTo _037A

_02EB:
	Compare VAR_TEMP_x4001, 410
	GoToIfNe _0306
	ApplyMovement obj_player, _04C0
	GoTo _037A

_0306:
	Compare VAR_TEMP_x4001, 411
	GoToIfNe _0321
	ApplyMovement obj_player, _04D0
	GoTo _037A

_0321:
	Compare VAR_TEMP_x4001, 412
	GoToIfNe _033C
	ApplyMovement obj_player, _04E0
	GoTo _037A

_033C:
	Compare VAR_TEMP_x4001, 413
	GoToIfNe _0357
	ApplyMovement obj_player, _04E8
	GoTo _037A

_0357:
	Compare VAR_TEMP_x4001, 414
	GoToIfNe _0372
	ApplyMovement obj_player, _04F8
	GoTo _037A

_0372:
	ApplyMovement obj_player, _0508
_037A:
	WaitMovement
	GoTo _03D2

_0382:
	Compare VAR_TEMP_x4001, 409
	GoToIfNe _039D
	ApplyMovement obj_player, _051C
	GoTo _03A5

_039D:
	ApplyMovement obj_player, _0530
_03A5:
	WaitMovement
	GoTo _03D2

_03AD:
	Compare VAR_TEMP_x4001, 409
	GoToIfNe _03C8
	ApplyMovement obj_player, _0544
	GoTo _03D0

_03C8:
	ApplyMovement obj_player, _0550
_03D0:
	WaitMovement
_03D2:
	ApplyMovement obj_R14_tsure_poke_static_suicune, _0488
	ApplyMovement obj_player, _055C
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	CallStd std_play_eusine_music
	ApplyMovement obj_R14_minaki, _057C
	ApplyMovement obj_player, _056C
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0351_R14_00006
	WaitButton
	CloseMsg
	CallStd std_fade_end_eusine_music
	HidePerson obj_R14_tsure_poke_static_suicune
	SetFlag FLAG_HIDE_ROUTE_14_SUICUNE
	SetFlag FLAG_HIDE_ROUTE_14_EUSINE
	ClearFlag FLAG_HIDE_ROUTE_14_EUSINE_2
	SetVar VAR_UNK_4086, 0
	SetFlag FLAG_UNK_14D
	CheckBadge BADGE_CASCADE, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0449
	ClearFlag FLAG_HIDE_ROUTE_25_SUICUNE
	SetVar VAR_SCENE_ROUTE_25, 1
_0449:
	ReleaseAll
	End

	.balign 4, 0
_0450:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0458:
	Delay4
	FaceWest
	EndMovement

	.balign 4, 0
_0464:
	Delay4
	FaceNorth
	EndMovement

	.balign 4, 0
_0470:
	Delay4
	FaceSouth
	EndMovement

	.balign 4, 0
_047C:
	JumpFartherEast
	FaceWest
	EndMovement

	.balign 4, 0
_0488:
	WalkFasterNorth 2
	JumpNearFastNorth
	JumpFarNorth
	WalkFasterNorth 2
	JumpNearFastNorth
	JumpFarNorth 2
	WalkFasterNorth 2
	JumpNearFastNorth
	EndMovement

	.balign 4, 0
_04AC:
	WalkNormalSouth
	WalkNormalEast 3
	WalkNormalSouth 2
	FaceEast
	EndMovement

	.balign 4, 0
_04C0:
	WalkNormalEast 3
	WalkNormalSouth 2
	FaceEast
	EndMovement

	.balign 4, 0
_04D0:
	WalkNormalEast 3
	WalkNormalSouth
	FaceEast
	EndMovement

	.balign 4, 0
_04E0:
	WalkNormalEast 3
	EndMovement

	.balign 4, 0
_04E8:
	WalkNormalEast 3
	WalkNormalNorth
	FaceEast
	EndMovement

	.balign 4, 0
_04F8:
	WalkNormalEast 3
	WalkNormalNorth 2
	FaceEast
	EndMovement

	.balign 4, 0
_0508:
	WalkNormalNorth
	WalkNormalEast 3
	WalkNormalNorth 2
	FaceEast
	EndMovement

	.balign 4, 0
_051C:
	WalkNormalSouth
	WalkNormalEast 2
	WalkNormalSouth 2
	FaceEast
	EndMovement

	.balign 4, 0
_0530:
	WalkNormalNorth
	WalkNormalEast 2
	WalkNormalNorth 2
	FaceEast
	EndMovement

	.balign 4, 0
_0544:
	WalkNormalSouth 3
	FaceEast
	EndMovement

	.balign 4, 0
_0550:
	WalkNormalNorth 3
	FaceEast
	EndMovement

	.balign 4, 0
_055C:
	Delay8
	FaceNorth
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_056C:
	Delay16 5
	FaceWest
	EndMovement

	.balign 4, 0
_0578:
	EndMovement

	.balign 4, 0
_057C:
	WalkFastNorth 11
	WalkNormalNorth 2
	WalkSlowerNorth
	Delay8 3
	WalkSlowSouth
	FaceEast
	EndMovement

scr_seq_R14_003:
	BufferPlayersName 0
	SimpleNPCMsg msg_0351_R14_00007
	End

scr_seq_R14_004:
	BufferPlayersName 0
	SimpleNPCMsg msg_0351_R14_00007
	End

scr_seq_R14_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_LUCKY_PUNCH_FROM_ROUTE_14_WOMAN, _0658
	NPCMsg msg_0351_R14_00000
	PlayerOnBikeCheck VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0602
	GetPartyLeadAlive VAR_TEMP_x4000
	GetPartyMonSpecies VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 113
	GoToIfEq _060D
_0602:
	NPCMsg msg_0351_R14_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_060D:
	ApplyMovement obj_R14_gswoman1, _0698
	WaitMovement
	NPCMsg msg_0351_R14_00002
	GoToIfNoItemSpace ITEM_LUCKY_PUNCH, 1, _064E
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_LUCKY_PUNCH_FROM_ROUTE_14_WOMAN
	NPCMsg msg_0351_R14_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_064E:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_0658:
	PlayerOnBikeCheck VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0680
	GetPartyLeadAlive VAR_TEMP_x4000
	GetPartyMonSpecies VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 113
	GoToIfEq _068B
_0680:
	NPCMsg msg_0351_R14_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_068B:
	NPCMsg msg_0351_R14_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0698:
	EmoteExclamationMark
	Delay4
	EndMovement
	.balign 4, 0
