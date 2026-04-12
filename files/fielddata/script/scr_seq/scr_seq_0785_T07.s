#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07.h"
#include "msgdata/msg/msg_0491_T07.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T07_000
	ScrDef scr_seq_T07_001
	ScrDef scr_seq_T07_002
	ScrDef scr_seq_T07_003
	ScrDef scr_seq_T07_004
	ScrDef scr_seq_T07_005
	ScrDef scr_seq_T07_006
	ScrDef scr_seq_T07_007
	ScrDef scr_seq_T07_008
	ScrDef scr_seq_T07_009
	ScrDef scr_seq_T07_010
	ScrDef scr_seq_T07_011
	ScrDef scr_seq_T07_012
	ScrDef scr_seq_T07_013
	ScrDef scr_seq_T07_014
	ScrDef scr_seq_T07_015
	ScrDef scr_seq_T07_016
	ScrDef scr_seq_T07_017
	ScrDef scr_seq_T07_018
	ScrDefEnd

scr_seq_T07_015:
	GoToIfUnset FLAG_UNK_189, _005F
	ClearFlag FLAG_UNK_189
	End

_005F:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _007A
	ClearFlag FLAG_HIDE_CAMERON
	GoTo _0095

_007A:
	Compare VAR_TEMP_x4000, 5
	GoToIfNe _0091
	ClearFlag FLAG_HIDE_CAMERON
	GoTo _0095

_0091:
	SetFlag FLAG_HIDE_CAMERON
_0095:
	CheckRegisteredPhoneNumber PHONE_CONTACT_ERIKA, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _015E
	CheckBadge BADGE_EARTH, VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 1
	GoToIfEq _00C3
	GoTo _0198
	End

_00C3:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 6
	GoToIfNe _00E0
	GoTo _0101

_00DA:
	GoTo _00FF

_00E0:
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _00F9
	GoTo _0101

_00F3:
	GoTo _00FF

_00F9:
	GoTo _0198

_00FF:
	End

_0101:
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 14
	GoToIfNe _0120
	ClearFlag FLAG_UNK_25D
	ClearFlag FLAG_UNK_2E1
	GoTo _015C

_0120:
	Compare VAR_TEMP_x4000, 15
	GoToIfNe _013B
	ClearFlag FLAG_UNK_25D
	ClearFlag FLAG_UNK_2E1
	GoTo _015C

_013B:
	Compare VAR_TEMP_x4000, 16
	GoToIfNe _0156
	ClearFlag FLAG_UNK_25D
	ClearFlag FLAG_UNK_2E1
	GoTo _015C

_0156:
	GoTo _0198

_015C:
	End

_015E:
	GetPhoneBookRematch PHONE_CONTACT_ERIKA, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _0198
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfNe _0190
	ClearFlag FLAG_UNK_25D
	SetFlag FLAG_UNK_2E1
	GoTo _0196

_0190:
	GoTo _0198

_0196:
	End

_0198:
	SetFlag FLAG_UNK_25D
	SetFlag FLAG_UNK_2E1
	End

scr_seq_T07_000:
	SimpleNPCMsg msg_0491_T07_00000
	End

scr_seq_T07_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_POLIWRATH, 0
	NPCMsg msg_0491_T07_00001
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T07_002:
	SimpleNPCMsg msg_0491_T07_00002
	End

scr_seq_T07_003:
	SimpleNPCMsg msg_0491_T07_00003
	End

scr_seq_T07_004:
	SimpleNPCMsg msg_0491_T07_00004
	End

scr_seq_T07_005:
	SimpleNPCMsg msg_0491_T07_00005
	End

scr_seq_T07_006:
	SimpleNPCMsg msg_0491_T07_00006
	End

scr_seq_T07_007:
	SimpleNPCMsg msg_0491_T07_00007
	End

scr_seq_T07_008:
	SimpleNPCMsg msg_0491_T07_00008
	End

scr_seq_T07_009:
	DirectionSignpost msg_0491_T07_00030, 0, 7, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T07_010:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0491_T07_00031, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T07_011:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0491_T07_00032, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T07_012:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0491_T07_00033, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T07_013:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0491_T07_00034, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T07_014:
	ScrCmd_055 3, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0491_T07_00035, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T07_016:
	CheckRegisteredPhoneNumber PHONE_CONTACT_ERIKA, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _046C
	Compare VAR_TEMP_x4005, 2
	GoToIfEq _0434
	Compare VAR_TEMP_x4005, 1
	GoToIfEq _03AA
_0302:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	SetVar VAR_TEMP_x4005, 1
	ApplyMovement obj_T07_gsleader12, _045C
	WaitMovement
	NPCMsg msg_0491_T07_00009
	CloseMsg
	ApplyMovement obj_T07_gsleader6, _0464
	WaitMovement
	NPCMsg msg_0491_T07_00010
	CloseMsg
	ApplyMovement obj_T07_gsleader12, _045C
	WaitMovement
	NPCMsg msg_0491_T07_00011
	CloseMsg
	ApplyMovement obj_T07_gsleader6, _0464
	WaitMovement
	NPCMsg msg_0491_T07_00012
	CloseMsg
	ApplyMovement obj_T07_gsleader12, _045C
	WaitMovement
	NPCMsg msg_0491_T07_00013
	CloseMsg
	ApplyMovement obj_T07_gsleader6, _0464
	WaitMovement
	NPCMsg msg_0491_T07_00014
	CloseMsg
	ApplyMovement obj_T07_gsleader12, _045C
	WaitMovement
	NPCMsg msg_0491_T07_00015
	CloseMsg
	ApplyMovement obj_T07_gsleader6, _0464
	WaitMovement
	NPCMsg msg_0491_T07_00016
	CloseMsg
	ApplyMovement obj_T07_gsleader12, _045C
	WaitMovement
	NPCMsg msg_0491_T07_00017
	CloseMsg
	ApplyMovement obj_T07_gsleader6, _0464
	WaitMovement
	NPCMsg msg_0491_T07_00018
	WaitButton
	CloseMsg
	ReleaseAll
	End

_03AA:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_TEMP_x4005, 2
	BufferPlayersName 0
	NPCMsg msg_0491_T07_00019
_03BE:
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _03E2
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfGe _0429
	End

_03E2:
	BufferPlayersName 0
	NPCMsg msg_0491_T07_00020
	PlayFanfare SEQ_ME_POKEGEAR_REGIST
	WaitFanfare
	RegisterGearNumber PHONE_CONTACT_ERIKA
	NPCMsg msg_0491_T07_00021
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	SetFlag FLAG_UNK_25D
	HidePerson obj_T07_gsleader12
	HidePerson obj_T07_gsleader6
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_0429:
	NPCMsg msg_0491_T07_00022
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0434:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0491_T07_00023
	GoTo _03BE
	End

_0447:
	SimpleNPCMsg msg_0491_T07_00021
	End

	.balign 4, 0
_045C:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0464:
	WalkOnSpotNormalWest
	EndMovement

_046C:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0491_T07_00024
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _04D5
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _04E0
	NPCMsg msg_0491_T07_00025
	CloseMsg
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 81
	FacePlayer
	LockAll
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ClearFlag FLAG_UNK_189
	NPCMsg msg_0491_T07_00026
	WaitButton
	CloseMsg
	ReleaseAll
	End

_04D5:
	NPCMsg msg_0491_T07_00027
	WaitButton
	CloseMsg
	ReleaseAll
	End

_04E0:
	NPCMsg msg_0491_T07_00028
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T07_017:
	Compare VAR_TEMP_x4002, 1
	GoToIfGe _0500
	GoTo _0302
	End

_0500:
	SimpleNPCMsg msg_0491_T07_00029
	End

scr_seq_T07_018:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _063B
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _064F
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _058C
	ApplyMovement obj_player, _0664
	ApplyMovement obj_T07_gsmiddleman1, _06B0
	GoTo _05DA

_058C:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _05A7
	ApplyMovement obj_player, _067C
	GoTo _05DA

_05A7:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _05CA
	ApplyMovement obj_player, _069C
	ApplyMovement obj_T07_gsmiddleman1, _06B0
	GoTo _05DA

_05CA:
	ApplyMovement obj_player, _0688
	ApplyMovement obj_T07_gsmiddleman1, _06B0
_05DA:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0601
	ApplyMovement obj_partner_poke, _06BC
	WaitMovement
_0601:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 57
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

_063B:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_064F:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0664:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_067C:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0688:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_069C:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_06B0:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_06BC:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement
	.balign 4, 0
