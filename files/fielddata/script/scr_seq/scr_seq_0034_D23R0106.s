#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D23R0106.h"
#include "msgdata/msg/msg_0070_D23R0106.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D23R0106_000
	ScrDef scr_seq_D23R0106_001
	ScrDefEnd

scr_seq_D23R0106_000:
	SetFlag FLAG_HIDE_ROCKET_TAKEOVER_1
	SetFlag FLAG_HIDE_ROCKET_TAKEOVER_2
	SetVar VAR_UNK_4125, 0
	Compare VAR_SCENE_ROCKET_TAKEOVER, 4
	GoToIfNe _002D
	ClearFlag FLAG_HIDE_ROCKET_TAKEOVER_1
	ClearFlag FLAG_HIDE_ROCKET_TAKEOVER_2
_002D:
	End

scr_seq_D23R0106_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0070_D23R0106_00000
	CloseMsg
	TrainerBattle TRAINER_EXECUTIVE_ARCHER_ARCHER, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _025D
	NPCMsg msg_0070_D23R0106_00001
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	HidePerson obj_D23R0106_rkanbum
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	ClearFlag FLAG_ROCKET_TAKEOVER_ACTIVE
	FadeOutBGM 0, 30
	StopBGM 0
	Wait 15, VAR_SPECIAL_RESULT
	ResetBGM
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	MovePersonFacing obj_D23R0106_gsgentleman, 8, 1, 12, DIR_SOUTH
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4000, 7
	GoToIfNe _00C1
	ApplyMovement obj_D23R0106_gsgentleman, _0288
	GoTo _0102

_00C1:
	Compare VAR_TEMP_x4000, 8
	GoToIfNe _00ED
	ApplyMovement obj_D23R0106_gsgentleman, _02A4
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	CallIfEq _0263
	GoTo _0102

_00ED:
	Compare VAR_TEMP_x4000, 9
	GoToIfNe _0102
	ApplyMovement obj_D23R0106_gsgentleman, _02C0
_0102:
	WaitMovement
	Compare VAR_TEMP_x4000, 8
	GoToIfNe _0119
	ApplyMovement obj_player, _02EC
_0119:
	WaitMovement
	NPCMsg msg_0070_D23R0106_00002
	GetGameVersion VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 7
	GoToIfNe _014E
	GiveItemNoCheck ITEM_RAINBOW_WING, 1
	SetFlag FLAG_UNK_093
	NPCMsg msg_0070_D23R0106_00005
	CloseMsg
	GoTo _0167

_014E:
	GiveItemNoCheck ITEM_SILVER_WING, 1
	SetFlag FLAG_UNK_094
	NPCMsg msg_0070_D23R0106_00006
	CloseMsg
_0167:
	Compare VAR_TEMP_x4000, 7
	GoToIfNe _0182
	ApplyMovement obj_D23R0106_gsgentleman, _02F4
	GoTo _01B2

_0182:
	Compare VAR_TEMP_x4000, 8
	GoToIfNe _019D
	ApplyMovement obj_D23R0106_gsgentleman, _0304
	GoTo _01B2

_019D:
	Compare VAR_TEMP_x4000, 9
	GoToIfNe _01B2
	ApplyMovement obj_D23R0106_gsgentleman, _0314
_01B2:
	WaitMovement
	ApplyMovement obj_D23R0106_gsgentleman, _0324
	WaitMovement
	ApplyMovement obj_player, _02EC
	WaitMovement
	GetGameVersion VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 7
	GoToIfNe _01E2
	NPCMsg msg_0070_D23R0106_00007
	GoTo _01E5

_01E2:
	NPCMsg msg_0070_D23R0106_00008
_01E5:
	CloseMsg
	ApplyMovement obj_D23R0106_gsgentleman, _032C
	WaitMovement
	NPCMsg msg_0070_D23R0106_00009
	CloseMsg
	ApplyMovement obj_D23R0106_gsgentleman, _0344
	WaitMovement
	PlaySE SEQ_SE_DP_DOOR10
	WaitSE SEQ_SE_DP_DOOR10
	Wait 8, VAR_SPECIAL_RESULT
	HidePerson obj_D23R0106_gsgentleman
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	ReleaseAll
	SetVar VAR_SCENE_ROCKET_TAKEOVER, 5
	SetFlag FLAG_BEAT_RADIO_TOWER_ROCKETS
	ClearFlag FLAG_HIDE_RADIO_TOWER_5F_OFFICE_DIRECTOR
	SetFlag FLAG_HIDE_RADIO_TOWER_5F_PETREL_REVEALED
	Compare VAR_UNK_40F8, 2
	GoToIfNe _0241
	SetVar VAR_UNK_40F8, 0
_0241:
	SetVar VAR_UNK_407A, 1
	ClearFlag FLAG_HIDE_MAHOGANY_SHOP_SALESWOMAN
	SetFlag FLAG_HIDE_BLACKTHORN_GYM_GUARD_INFRONT
	ClearFlag FLAG_HIDE_BLACKTHORN_GYM_GUARD_ASIDE
	SetFlag FLAG_UNK_998
	SetFlag FLAG_UNK_97D
	End

_025D:
	WhiteOut
	ReleaseAll
	End

_0263:
	GetPersonCoords 253, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	Compare VAR_SPECIAL_x8004, 7
	GoToIfNe _0286
	Wait 112, VAR_SPECIAL_RESULT
	ApplyMovement obj_partner_poke, _02DC
_0286:
	Return

	.balign 4, 0
_0288:
	WalkNormalSouth
	WalkNormalWest 4
	WalkNormalNorth 7
	WalkNormalEast 4
	WalkNormalNorth 3
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_02A4:
	WalkNormalSouth
	WalkNormalWest 4
	WalkNormalNorth 7
	WalkNormalEast 3
	WalkNormalNorth 2
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_02C0:
	WalkNormalSouth
	WalkNormalWest 4
	WalkNormalNorth 7
	WalkNormalEast 4
	WalkNormalNorth 3
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_02DC:
	WalkNormalNorth
	WalkNormalEast
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_02EC:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_02F4:
	WalkNormalSouth 3
	WalkNormalWest 4
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0304:
	WalkNormalSouth 2
	WalkNormalWest 3
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0314:
	WalkNormalSouth 3
	WalkNormalWest 4
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0324:
	WalkNormalEast
	EndMovement

	.balign 4, 0
_032C:
	WalkNormalWest
	WalkNormalSouth
	EmoteExclamationMark
	Delay8 3
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0344:
	WalkNormalSouth 6
	WalkNormalEast 4
	EndMovement
	.balign 4, 0
