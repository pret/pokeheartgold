#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T26.h"
#include "msgdata/msg/msg_0604_T26.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T26_000
	ScrDef scr_seq_T26_001
	ScrDef scr_seq_T26_002
	ScrDef scr_seq_T26_003
	ScrDef scr_seq_T26_004
	ScrDef scr_seq_T26_005
	ScrDef scr_seq_T26_006
	ScrDef scr_seq_T26_007
	ScrDef scr_seq_T26_008
	ScrDef scr_seq_T26_009
	ScrDef scr_seq_T26_010
	ScrDef scr_seq_T26_011
	ScrDef scr_seq_T26_012
	ScrDefEnd

scr_seq_T26_002:
	SetVar VAR_SCENE_ROCKET_TAKEOVER, 2
	SetFlag FLAG_UNK_0C5
	SetFlag FLAG_ROCKET_TAKEOVER_ACTIVE
	Compare VAR_UNK_40F8, 0
	GoToIfNe _0057
	SetVar VAR_UNK_40F8, 2
_0057:
	PhoneCall PHONE_CONTACT_PROF__ELM, 2, 2
	SetVar VAR_MIDGAME_BADGES, 5
	End

scr_seq_T26_003:
	SetFlag FLAG_UNK_0F5
	SetVar VAR_UNK_4057, 1
	PhoneCall PHONE_CONTACT_BAOBA, 2, 0
	SetFlag FLAG_UNK_249
	SetVar VAR_SCENE_LIGHTHOUSE_JASMINE, 3
	End

scr_seq_T26_012:
	GoToIfUnset FLAG_UNK_189, _00B2
	ClearFlag FLAG_UNK_189
	End

_00B2:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfNe _00CD
	ClearFlag FLAG_HIDE_CAMERON
	GoTo _00E8

_00CD:
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _00E4
	ClearFlag FLAG_HIDE_CAMERON
	GoTo _00E8

_00E4:
	SetFlag FLAG_HIDE_CAMERON
_00E8:
	End

	.balign 4, 0
_00EC:
	EmoteExclamationMark
	EndMovement

scr_seq_T26_000:
	End

scr_seq_T26_001:
	ScrCmd_609
	LockAll
	FadeOutBGM 0, 3
	ScrCmd_307 8, 7, 13, 14, 77
	ScrCmd_310 77
	ScrCmd_308 77
	ClearFlag FLAG_HIDE_OLIVINE_RIVAL
	ShowPerson obj_T26_gsrivel
	ApplyMovement obj_T26_gsrivel, _02B4
	WaitMovement
	ScrCmd_311 77
	ScrCmd_308 77
	ScrCmd_309 77
	ApplyMovement obj_player, _02C0
	WaitMovement
	CallStd std_play_rival_intro_music
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 239
	GoToIfNe _015B
	ApplyMovement obj_T26_gsrivel, _02CC
	GoTo _01C1

_015B:
	Compare VAR_TEMP_x4001, 240
	GoToIfNe _0176
	ApplyMovement obj_T26_gsrivel, _02DC
	GoTo _01C1

_0176:
	Compare VAR_TEMP_x4001, 241
	GoToIfNe _0191
	ApplyMovement obj_T26_gsrivel, _02F0
	GoTo _01C1

_0191:
	Compare VAR_TEMP_x4001, 242
	GoToIfNe _01AC
	ApplyMovement obj_T26_gsrivel, _0304
	GoTo _01C1

_01AC:
	Compare VAR_TEMP_x4001, 243
	GoToIfNe _01C1
	ApplyMovement obj_T26_gsrivel, _0318
_01C1:
	WaitMovement
	BufferRivalsName 0
	NPCMsg msg_0604_T26_00000
	CloseMsg
	Compare VAR_TEMP_x4001, 239
	GoToIfNe _01F6
	ApplyMovement obj_T26_gsrivel, _032C
	ApplyMovement obj_player, _037C
	ApplyMovement obj_partner_poke, _03C4
	GoTo _029C

_01F6:
	Compare VAR_TEMP_x4001, 240
	GoToIfNe _0221
	ApplyMovement obj_T26_gsrivel, _033C
	ApplyMovement obj_player, _037C
	ApplyMovement obj_partner_poke, _03C4
	GoTo _029C

_0221:
	Compare VAR_TEMP_x4001, 241
	GoToIfNe _024C
	ApplyMovement obj_T26_gsrivel, _034C
	ApplyMovement obj_player, _037C
	ApplyMovement obj_partner_poke, _03C4
	GoTo _029C

_024C:
	Compare VAR_TEMP_x4001, 242
	GoToIfNe _0277
	ApplyMovement obj_T26_gsrivel, _035C
	ApplyMovement obj_player, _037C
	ApplyMovement obj_partner_poke, _03C4
	GoTo _029C

_0277:
	Compare VAR_TEMP_x4001, 243
	GoToIfNe _029C
	ApplyMovement obj_T26_gsrivel, _036C
	ApplyMovement obj_player, _03A0
	ApplyMovement obj_partner_poke, _03E0
_029C:
	WaitMovement
	SetVar VAR_UNK_4078, 1
	HidePerson obj_T26_gsrivel
	SetFlag FLAG_HIDE_OLIVINE_RIVAL
	CallStd std_fade_end_rival_intro_music
	ReleaseAll
	End

	.balign 4, 0
_02B4:
	WalkNormalSouth
	Delay15
	EndMovement

	.balign 4, 0
_02C0:
	EmoteExclamationMark
	Delay8
	EndMovement

	.balign 4, 0
_02CC:
	FaceSouth 2
	WalkNormalEast 2
	Delay15
	EndMovement

	.balign 4, 0
_02DC:
	WalkNormalSouth
	FaceSouth 2
	WalkNormalEast 2
	Delay15
	EndMovement

	.balign 4, 0
_02F0:
	WalkNormalSouth 2
	FaceSouth 2
	WalkNormalEast 2
	Delay15
	EndMovement

	.balign 4, 0
_0304:
	WalkNormalSouth 3
	FaceSouth 2
	WalkNormalEast 2
	Delay15
	EndMovement

	.balign 4, 0
_0318:
	WalkNormalSouth 4
	FaceSouth 2
	WalkNormalEast 2
	Delay15
	EndMovement

	.balign 4, 0
_032C:
	WalkNormalEast 6
	FaceNorth 2
	WalkNormalNorth 10
	EndMovement

	.balign 4, 0
_033C:
	WalkNormalEast 6
	FaceNorth 2
	WalkNormalNorth 11
	EndMovement

	.balign 4, 0
_034C:
	WalkNormalEast 6
	FaceNorth 2
	WalkNormalNorth 12
	EndMovement

	.balign 4, 0
_035C:
	WalkNormalEast 6
	FaceNorth 2
	WalkNormalNorth 13
	EndMovement

	.balign 4, 0
_036C:
	WalkNormalEast 6
	FaceNorth 2
	WalkNormalNorth 14
	EndMovement

	.balign 4, 0
_037C:
	FaceNorth 2
	LockDir
	WalkSlightlyFastSouth
	UnlockDir
	Delay15
	WalkOnSpotNormalEast
	Delay15
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_03A0:
	FaceSouth 2
	LockDir
	WalkSlightlyFastNorth
	UnlockDir
	Delay15
	WalkOnSpotNormalEast
	Delay15
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_03C4:
	FaceNorth 2
	LockDir
	WalkSlightlyFastSouth
	UnlockDir
	Delay32 2
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_03E0:
	FaceSouth 2
	LockDir
	WalkSlightlyFastNorth
	UnlockDir
	EndMovement

scr_seq_T26_011:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _051C
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0530
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _046D
	ApplyMovement obj_player, _0544
	ApplyMovement obj_T26_gsmiddleman1, _0590
	GoTo _04BB

_046D:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0488
	ApplyMovement obj_player, _055C
	GoTo _04BB

_0488:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _04AB
	ApplyMovement obj_player, _057C
	ApplyMovement obj_T26_gsmiddleman1, _0590
	GoTo _04BB

_04AB:
	ApplyMovement obj_player, _0568
	ApplyMovement obj_T26_gsmiddleman1, _0590
_04BB:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _04E2
	ApplyMovement obj_partner_poke, _059C
	WaitMovement
_04E2:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 23
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

_051C:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0530:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0544:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_055C:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0568:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_057C:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0590:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_059C:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_T26_004:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0604_T26_00007, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T26_005:
	DirectionSignpost msg_0604_T26_00005, 0, 17, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T26_006:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0604_T26_00006, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T26_007:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0604_T26_00008, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T26_008:
	SimpleNPCMsg msg_0604_T26_00001
	End

scr_seq_T26_009:
	SimpleNPCMsg msg_0604_T26_00002
	End

scr_seq_T26_010:
	SimpleNPCMsg msg_0604_T26_00004
	End
	.balign 4, 0
