#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R22R0101.h"
#include "msgdata/msg/msg_0361_R22R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R22R0101_000
	ScrDef scr_seq_R22R0101_001
	ScrDef scr_seq_R22R0101_002
	ScrDef scr_seq_R22R0101_003
	ScrDef scr_seq_R22R0101_004
	ScrDef scr_seq_R22R0101_005
	ScrDef scr_seq_R22R0101_006
	ScrDef scr_seq_R22R0101_007
	ScrDef scr_seq_R22R0101_008
	ScrDefEnd

scr_seq_R22R0101_006:
	GoToIfUnset FLAG_UNLOCKED_WEST_KANTO, _003D
	MovePersonFacing obj_R22R0101_policeman_3, 15, 0, 8, DIR_SOUTH
_003D:
	GoToIfUnset FLAG_UNLOCKED_MT_SILVER, _0054
	MovePersonFacing obj_R22R0101_policeman_2, 7, 0, 8, DIR_SOUTH
_0054:
	End

scr_seq_R22R0101_007:
	SetFlag FLAG_SYS_FLYPOINT_VICTORY_ROAD
	GoToIfUnset FLAG_UNK_189, _006B
	ClearFlag FLAG_UNK_189
	End

_006B:
	CheckRegisteredPhoneNumber PHONE_CONTACT_JANINE, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _00DF
	CheckBadge BADGE_SOUL, VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 0
	GoToIfNe _009D
	GoTo _012C

_0097:
	GoTo _00A3

_009D:
	GoTo _00A5

_00A3:
	End

_00A5:
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 16
	GoToIfNe _00C0
	ClearFlag FLAG_UNK_270
	GoTo _00DD

_00C0:
	Compare VAR_TEMP_x4000, 17
	GoToIfNe _00D7
	ClearFlag FLAG_UNK_270
	GoTo _00DD

_00D7:
	GoTo _012C

_00DD:
	End

_00DF:
	GetPhoneBookRematch PHONE_CONTACT_JANINE, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _012C
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 18
	GoToIfNe _010D
	ClearFlag FLAG_UNK_270
	GoTo _012A

_010D:
	Compare VAR_TEMP_x4000, 19
	GoToIfNe _0124
	ClearFlag FLAG_UNK_270
	GoTo _012A

_0124:
	GoTo _012C

_012A:
	End

_012C:
	SetFlag FLAG_UNK_270
	End

scr_seq_R22R0101_000:
	ScrCmd_609
	LockAll
	ApplyMovement obj_R22R0101_policeman, _015C
	WaitMovement
	ApplyMovement obj_player, _0164
	WaitMovement
	NPCMsg msg_0361_R22R0101_00000
	WaitButton
	CloseMsg
	SetVar VAR_UNK_4110, 1
	ReleaseAll
	End

	.balign 4, 0
_015C:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0164:
	WalkOnSpotNormalWest
	EndMovement

scr_seq_R22R0101_003:
	SimpleNPCMsg msg_0361_R22R0101_00000
	End

scr_seq_R22R0101_001:
	ScrCmd_609
	LockAll
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 8
	GoToIfNe _01A4
	ApplyMovement obj_R22R0101_policeman_3, _0264
	GoTo _01AC

_01A4:
	ApplyMovement obj_R22R0101_policeman_3, _0270
_01AC:
	WaitMovement
	Compare VAR_TEMP_x4001, 8
	GoToIfNe _01C9
	ApplyMovement obj_R22R0101_policeman_3, _027C
	GoTo _01EC

_01C9:
	Compare VAR_TEMP_x4001, 10
	GoToIfNe _01E4
	ApplyMovement obj_R22R0101_policeman_3, _028C
	GoTo _01EC

_01E4:
	ApplyMovement obj_R22R0101_policeman_3, _029C
_01EC:
	WaitMovement
	NPCMsg msg_0361_R22R0101_00005
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 56
	ApplyMovement obj_R22R0101_policeman_3, _02AC
	ApplyMovement obj_player, _02B4
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	Wait 16, VAR_SPECIAL_RESULT
	Compare VAR_TEMP_x4001, 8
	GoToIfNe _023A
	ApplyMovement obj_R22R0101_policeman_3, _02C4
	GoTo _025D

_023A:
	Compare VAR_TEMP_x4001, 10
	GoToIfNe _0255
	ApplyMovement obj_R22R0101_policeman_3, _02D0
	GoTo _025D

_0255:
	ApplyMovement obj_R22R0101_policeman_3, _02DC
_025D:
	WaitMovement
	ReleaseAll
	End

	.balign 4, 0
_0264:
	WalkOnSpotNormalNorth
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0270:
	WalkOnSpotNormalSouth
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_027C:
	WalkFastEast
	WalkFastNorth
	WalkOnSpotFastWest
	EndMovement

	.balign 4, 0
_028C:
	WalkFastEast
	WalkFastSouth
	WalkOnSpotFastWest
	EndMovement

	.balign 4, 0
_029C:
	WalkFastEast
	WalkFastSouth 2
	WalkOnSpotFastWest
	EndMovement

	.balign 4, 0
_02AC:
	WalkNormalWest
	EndMovement

	.balign 4, 0
_02B4:
	LockDir
	WalkNormalWest
	UnlockDir
	EndMovement

	.balign 4, 0
_02C4:
	WalkNormalSouth
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_02D0:
	WalkNormalNorth
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_02DC:
	WalkNormalNorth 2
	WalkOnSpotNormalWest
	EndMovement

scr_seq_R22R0101_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNLOCKED_WEST_KANTO, _0306
	NPCMsg msg_0361_R22R0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0306:
	NPCMsg msg_0361_R22R0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R22R0101_002:
	ScrCmd_609
	LockAll
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 8
	GoToIfNe _0336
	ApplyMovement obj_R22R0101_policeman_2, _03F8
	GoTo _033E

_0336:
	ApplyMovement obj_R22R0101_policeman_2, _0404
_033E:
	WaitMovement
	Compare VAR_TEMP_x4001, 8
	GoToIfNe _035B
	ApplyMovement obj_R22R0101_policeman_2, _0410
	GoTo _037E

_035B:
	Compare VAR_TEMP_x4001, 10
	GoToIfNe _0376
	ApplyMovement obj_R22R0101_policeman_2, _0420
	GoTo _037E

_0376:
	ApplyMovement obj_R22R0101_policeman_2, _0430
_037E:
	WaitMovement
	NPCMsg msg_0361_R22R0101_00002
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 56
	ApplyMovement obj_R22R0101_policeman_2, _0440
	ApplyMovement obj_player, _0448
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	Wait 16, VAR_SPECIAL_RESULT
	Compare VAR_TEMP_x4001, 8
	GoToIfNe _03CC
	ApplyMovement obj_R22R0101_policeman_2, _0458
	GoTo _03EF

_03CC:
	Compare VAR_TEMP_x4001, 10
	GoToIfNe _03E7
	ApplyMovement obj_R22R0101_policeman_2, _0464
	GoTo _03EF

_03E7:
	ApplyMovement obj_R22R0101_policeman_2, _0470
_03EF:
	WaitMovement
	ReleaseAll
	End

	.balign 4, 0
_03F8:
	WalkOnSpotNormalNorth
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0404:
	WalkOnSpotNormalSouth
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0410:
	WalkFastWest
	WalkFastNorth
	WalkOnSpotFastEast
	EndMovement

	.balign 4, 0
_0420:
	WalkFastWest
	WalkFastSouth
	WalkOnSpotFastEast
	EndMovement

	.balign 4, 0
_0430:
	WalkFastWest
	WalkFastSouth 2
	WalkOnSpotFastEast
	EndMovement

	.balign 4, 0
_0440:
	WalkNormalEast
	EndMovement

	.balign 4, 0
_0448:
	LockDir
	WalkNormalEast
	UnlockDir
	EndMovement

	.balign 4, 0
_0458:
	WalkNormalSouth
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0464:
	WalkNormalNorth
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0470:
	WalkNormalNorth 2
	WalkOnSpotNormalEast
	EndMovement

scr_seq_R22R0101_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNLOCKED_MT_SILVER, _049A
	NPCMsg msg_0361_R22R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_049A:
	NPCMsg msg_0361_R22R0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R22R0101_008:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckRegisteredPhoneNumber PHONE_CONTACT_JANINE, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _0553
	Compare VAR_TEMP_x4005, 1
	GoToIfGe _0548
	NPCMsg msg_0361_R22R0101_00007
_04D0:
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _04F4
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfGe _0537
	End

_04F4:
	BufferPlayersName 0
	NPCMsg msg_0361_R22R0101_00008
	PlayFanfare SEQ_ME_POKEGEAR_REGIST
	WaitFanfare
	RegisterGearNumber PHONE_CONTACT_JANINE
	NPCMsg msg_0361_R22R0101_00009
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	SetFlag FLAG_UNK_270
	HidePerson obj_R22R0101_gsleader13
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_0537:
	SetVar VAR_TEMP_x4005, 1
	NPCMsg msg_0361_R22R0101_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0548:
	NPCMsg msg_0361_R22R0101_00011
	GoTo _04D0
	End

_0553:
	NPCMsg msg_0361_R22R0101_00012
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _05B4
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _05BF
	NPCMsg msg_0361_R22R0101_00013
	CloseMsg
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 70
	FacePlayer
	LockAll
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ClearFlag FLAG_UNK_189
	NPCMsg msg_0361_R22R0101_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

_05B4:
	NPCMsg msg_0361_R22R0101_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

_05BF:
	NPCMsg msg_0361_R22R0101_00016
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
