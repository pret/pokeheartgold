#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R47.h"
#include "msgdata/msg/msg_0407_R47.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R47_000
	ScrDef scr_seq_R47_001
	ScrDef scr_seq_R47_002
	ScrDef scr_seq_R47_003
	ScrDef scr_seq_R47_004
	ScrDefEnd

scr_seq_R47_000:
	SetVar VAR_UNK_40EB, 1
	SetFlag FLAG_UNK_9C9
	GetGameVersion VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 7
	GoToIfNe _004F
	MoveWarp 4, 87, 385
	MoveWarp 5, 87, 389
	MoveWarp 6, 87, 385
	GoTo _0067

_004F:
	MoveWarp 4, 87, 389
	MoveWarp 5, 87, 385
	MoveWarp 6, 87, 385
_0067:
	Compare VAR_SCENE_EMBEDDED_TOWER, 2
	GoToIfEq _00E6
	Compare VAR_SCENE_EMBEDDED_TOWER, 3
	GoToIfEq _00E6
	Compare VAR_SCENE_EMBEDDED_TOWER, 5
	GoToIfGe _00EC
	GoToIfUnset FLAG_UNK_189, _009F
	ClearFlag FLAG_UNK_189
	End

_009F:
	GoToIfSet FLAG_GAME_CLEAR, _00B2
	GoTo _00E6
	End

_00B2:
	GetPhoneBookRematch PHONE_CONTACT_CHUCK, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _00E6
	GetWeekday VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 0
	GoToIfNe _00E0
	ClearFlag FLAG_HIDE_ROUTE_47_CHUCK
	GoTo _00E4

_00E0:
	SetFlag FLAG_HIDE_ROUTE_47_CHUCK
_00E4:
	End

_00E6:
	SetFlag FLAG_HIDE_ROUTE_47_CHUCK
	End

_00EC:
	MoveWarp 4, 87, 385
	MoveWarp 5, 87, 385
	MoveWarp 6, 87, 389
	GoTo _00E6
	End

scr_seq_R47_002:
	Compare VAR_SCENE_EMBEDDED_TOWER, 5
	GoToIfGe _0162
	GetGameVersion VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 7
	GoToIfNe _0148
	MoveWarp 4, 87, 385
	MoveWarp 5, 87, 389
	MoveWarp 6, 87, 385
	GoTo _0160

_0148:
	MoveWarp 4, 87, 389
	MoveWarp 5, 87, 385
	MoveWarp 6, 87, 385
_0160:
	End

_0162:
	MoveWarp 4, 87, 385
	MoveWarp 5, 87, 385
	MoveWarp 6, 87, 389
	End

scr_seq_R47_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_MET_ROUTE_47_EMBEDDED_TOWER_HIKER, _019E
	NPCMsg msg_0407_R47_00000
	WaitButton
	CloseMsg
	SetFlag FLAG_MET_ROUTE_47_EMBEDDED_TOWER_HIKER
	ReleaseAll
	End

_019E:
	NPCMsg msg_0407_R47_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R47_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_157, _0210
	NPCMsg msg_0407_R47_00002
	ApplyMovement obj_R47_leader3, _022C
	WaitMovement
	NPCMsg msg_0407_R47_00003
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _01EB
	ApplyMovement obj_R47_leader3, _0234
	GoTo _020E

_01EB:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _0206
	ApplyMovement obj_R47_leader3, _023C
	GoTo _020E

_0206:
	ApplyMovement obj_R47_leader3, _0244
_020E:
	WaitMovement
_0210:
	BufferPlayersName 0
	NPCMsg msg_0407_R47_00004
	CloseMsg
	ApplyMovement obj_R47_leader3, _022C
	WaitMovement
	SetFlag FLAG_UNK_157
	ReleaseAll
	End

	.balign 4, 0
_022C:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0234:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_023C:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0244:
	WalkOnSpotNormalEast
	EndMovement

scr_seq_R47_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0407_R47_00005
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _02B5
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _02C0
	NPCMsg msg_0407_R47_00006
	CloseMsg
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 91
	FacePlayer
	LockAll
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ClearFlag FLAG_UNK_189
	NPCMsg msg_0407_R47_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02B5:
	NPCMsg msg_0407_R47_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02C0:
	NPCMsg msg_0407_R47_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
