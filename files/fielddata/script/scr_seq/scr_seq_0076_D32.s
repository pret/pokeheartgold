#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D32.h"
#include "msgdata/msg/msg_0100_D32.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D32_000
	ScrDef scr_seq_D32_001
	ScrDef scr_seq_D32_002
	ScrDef scr_seq_D32_003
	ScrDef scr_seq_D32_004
	ScrDef scr_seq_D32_005
	ScrDef scr_seq_D32_006
	ScrDef scr_seq_D32_007
	ScrDef scr_seq_D32_008
	ScrDef scr_seq_D32_009
	ScrDef scr_seq_D32_010
	ScrDef scr_seq_D32_011
	ScrDef scr_seq_D32_012
	ScrDef scr_seq_D32_013
	ScrDef scr_seq_D32_014
	ScrDef scr_seq_D32_015
	ScrDef scr_seq_D32_016
	ScrDef scr_seq_D32_017
	ScrDef scr_seq_D32_018
	ScrDef scr_seq_D32_019
	ScrDef scr_seq_D32_020
	ScrDef scr_seq_D32_021
	ScrDef scr_seq_D32_022
	ScrDef scr_seq_D32_023
	ScrDef scr_seq_D32_024
	ScrDef scr_seq_D32_025
	ScrDef scr_seq_D32_026
	ScrDef scr_seq_D32_027
	ScrDef scr_seq_D32_028
	ScrDef scr_seq_D32_029
	ScrDef scr_seq_D32_030
	ScrDef scr_seq_D32_031
	ScrDef scr_seq_D32_032
	ScrDef scr_seq_D32_033
	ScrDef scr_seq_D32_034
	ScrDef scr_seq_D32_035
	ScrDef scr_seq_D32_036
	ScrDef scr_seq_D32_037
	ScrDef scr_seq_D32_038
	ScrDefEnd

scr_seq_D32_037:
	GoToIfUnset FLAG_UNK_189, _00AF
	ClearFlag FLAG_UNK_189
	End

_00AF:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 3
	GoToIfEq _00D7
	Compare VAR_TEMP_x4000, 5
	GoToIfEq _00D7
	SetFlag FLAG_HIDE_CAMERON
	GoTo _00DB

_00D7:
	SetFlag FLAG_HIDE_CAMERON
_00DB:
	SetFlag FLAG_UNK_234
	End

scr_seq_D32_038:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0209
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _021D
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _015A
	ApplyMovement obj_player, _0234
	ApplyMovement obj_D32_gsmiddleman1_2, _0280
	GoTo _01A8

_015A:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0175
	ApplyMovement obj_player, _024C
	GoTo _01A8

_0175:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _0198
	ApplyMovement obj_player, _026C
	ApplyMovement obj_D32_gsmiddleman1_2, _0280
	GoTo _01A8

_0198:
	ApplyMovement obj_player, _0258
	ApplyMovement obj_D32_gsmiddleman1_2, _0280
_01A8:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _01CF
	ApplyMovement obj_partner_poke, _028C
	WaitMovement
_01CF:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 31
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

_0209:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_021D:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0234:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_024C:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0258:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_026C:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0280:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_028C:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_D32_001:
	SimpleNPCMsg msg_0100_D32_00000
	End

scr_seq_D32_002:
	SimpleNPCMsg msg_0100_D32_00001
	End

scr_seq_D32_003:
	SimpleNPCMsg msg_0100_D32_00002
	End

scr_seq_D32_004:
	SimpleNPCMsg msg_0100_D32_00003
	End

scr_seq_D32_005:
	SimpleNPCMsg msg_0100_D32_00004
	End

scr_seq_D32_006:
	SimpleNPCMsg msg_0100_D32_00005
	End

scr_seq_D32_007:
	SimpleNPCMsg msg_0100_D32_00006
	End

scr_seq_D32_008:
	SimpleNPCMsg msg_0100_D32_00007
	End

scr_seq_D32_009:
	SimpleNPCMsg msg_0100_D32_00008
	End

scr_seq_D32_010:
	SimpleNPCMsg msg_0100_D32_00009
	End

scr_seq_D32_011:
	SimpleNPCMsg msg_0100_D32_00010
	End

scr_seq_D32_012:
	SimpleNPCMsg msg_0100_D32_00011
	End

scr_seq_D32_013:
	SimpleNPCMsg msg_0100_D32_00012
	End

scr_seq_D32_014:
	SimpleNPCMsg msg_0100_D32_00013
	End

scr_seq_D32_015:
	SimpleNPCMsg msg_0100_D32_00014
	End

scr_seq_D32_016:
	SimpleNPCMsg msg_0100_D32_00015
	End

scr_seq_D32_017:
	SimpleNPCMsg msg_0100_D32_00016
	End

scr_seq_D32_018:
	SimpleNPCMsg msg_0100_D32_00017
	End

scr_seq_D32_019:
	SimpleNPCMsg msg_0100_D32_00018
	End

scr_seq_D32_020:
	SimpleNPCMsg msg_0100_D32_00019
	End

scr_seq_D32_021:
	SimpleNPCMsg msg_0100_D32_00020
	End

scr_seq_D32_022:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_SPECIAL_x8000, 0
	ScriptOverlayCmd 3, 0
	ScrCmd_116 1, 21, 1
	NPCMsg msg_0100_D32_00021
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	CloseMsg
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0B02
_045C:
	NPCMsg msg_0100_D32_00031
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 347, 255, 0
	MenuItemAdd 348, 255, 1
	MenuItemAdd 349, 255, 2
	MenuItemAdd 350, 255, 3
	MenuItemAdd 439, 255, 4
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _04D1
	Case 1, _0630
	Case 2, _0762
	Case 3, _08C1
	GoTo _0B02

_04D1:
	SetVar VAR_SPECIAL_x8007, 0
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 354, 396, 0
	MenuItemAdd 355, 397, 1
	MenuItemAdd 356, 398, 2
	MenuItemAdd 357, 399, 3
	MenuItemAdd 358, 400, 4
	MenuItemAdd 359, 401, 5
	MenuItemAdd 379, 402, 6
	MenuItemAdd 440, 438, 7
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0588
	Case 1, _05A0
	Case 2, _05B8
	Case 3, _05D0
	Case 4, _05E8
	Case 5, _0600
	Case 6, _0618
	GoTo _045C

_0588:
	SetVar VAR_SPECIAL_x8004, 46
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 1
	GoTo _09F3

_05A0:
	SetVar VAR_SPECIAL_x8004, 49
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 1
	GoTo _09F3

_05B8:
	SetVar VAR_SPECIAL_x8004, 47
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 1
	GoTo _09F3

_05D0:
	SetVar VAR_SPECIAL_x8004, 52
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 1
	GoTo _09F3

_05E8:
	SetVar VAR_SPECIAL_x8004, 48
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 1
	GoTo _09F3

_0600:
	SetVar VAR_SPECIAL_x8004, 45
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 1
	GoTo _09F3

_0618:
	SetVar VAR_SPECIAL_x8004, 50
	SetVar VAR_SPECIAL_x8005, 48
	SetVar VAR_SPECIAL_x8006, 48
	GoTo _09F3

_0630:
	SetVar VAR_SPECIAL_x8007, 1
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 360, 403, 0
	MenuItemAdd 361, 404, 1
	MenuItemAdd 362, 405, 2
	MenuItemAdd 363, 406, 3
	MenuItemAdd 364, 407, 4
	MenuItemAdd 365, 408, 5
	MenuItemAdd 440, 438, 6
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _06D2
	Case 1, _06EA
	Case 2, _0702
	Case 3, _071A
	Case 4, _0732
	Case 5, _074A
	GoTo _045C

_06D2:
	SetVar VAR_SPECIAL_x8004, 289
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 16
	GoTo _09F3

_06EA:
	SetVar VAR_SPECIAL_x8004, 290
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 16
	GoTo _09F3

_0702:
	SetVar VAR_SPECIAL_x8004, 291
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 16
	GoTo _09F3

_071A:
	SetVar VAR_SPECIAL_x8004, 292
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 16
	GoTo _09F3

_0732:
	SetVar VAR_SPECIAL_x8004, 293
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 16
	GoTo _09F3

_074A:
	SetVar VAR_SPECIAL_x8004, 294
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 16
	GoTo _09F3

_0762:
	SetVar VAR_SPECIAL_x8007, 2
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 366, 409, 0
	MenuItemAdd 367, 410, 1
	MenuItemAdd 368, 411, 2
	MenuItemAdd 369, 412, 3
	MenuItemAdd 370, 413, 4
	MenuItemAdd 372, 415, 5
	MenuItemAdd 375, 418, 6
	MenuItemAdd 440, 438, 7
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0819
	Case 1, _0831
	Case 2, _0849
	Case 3, _0861
	Case 4, _0879
	Case 5, _0891
	Case 6, _08A9
	GoTo _045C

_0819:
	SetVar VAR_SPECIAL_x8004, 272
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 16
	GoTo _09F3

_0831:
	SetVar VAR_SPECIAL_x8004, 273
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 16
	GoTo _09F3

_0849:
	SetVar VAR_SPECIAL_x8004, 214
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 32
	GoTo _09F3

_0861:
	SetVar VAR_SPECIAL_x8004, 271
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 32
	GoTo _09F3

_0879:
	SetVar VAR_SPECIAL_x8004, 213
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 48
	GoTo _09F3

_0891:
	SetVar VAR_SPECIAL_x8004, 230
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 48
	GoTo _09F3

_08A9:
	SetVar VAR_SPECIAL_x8004, 275
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 48
	GoTo _09F3

_08C1:
	SetVar VAR_SPECIAL_x8007, 3
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 371, 414, 0
	MenuItemAdd 376, 419, 1
	MenuItemAdd 373, 416, 2
	MenuItemAdd 374, 417, 3
	MenuItemAdd 377, 420, 4
	MenuItemAdd 378, 421, 5
	MenuItemAdd 440, 438, 7
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0963
	Case 1, _097B
	Case 2, _0993
	Case 3, _09AB
	Case 4, _09C3
	Case 5, _09DB
	GoTo _045C

_0963:
	SetVar VAR_SPECIAL_x8004, 220
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 48
	GoTo _09F3

_097B:
	SetVar VAR_SPECIAL_x8004, 287
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 48
	GoTo _09F3

_0993:
	SetVar VAR_SPECIAL_x8004, 232
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 48
	GoTo _09F3

_09AB:
	SetVar VAR_SPECIAL_x8004, 266
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 48
	GoTo _09F3

_09C3:
	SetVar VAR_SPECIAL_x8004, 326
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 48
	GoTo _09F3

_09DB:
	SetVar VAR_SPECIAL_x8004, 327
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 48
	GoTo _09F3

_09F3:
	BufferItemName 0, VAR_SPECIAL_x8004
	BufferInt 1, VAR_SPECIAL_x8006
	NPCMsg msg_0100_D32_00023
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0A24
	Compare VAR_SPECIAL_x8000, 0
	GoToIfEq _0AB1
	GoTo _0F76

_0A24:
	CheckBattlePoints VAR_SPECIAL_x8006, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0A9B
	HasSpaceForItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0A85
	ScrCmd_556 VAR_SPECIAL_x8006
	ScrCmd_118 1
	PlaySE SEQ_SE_DP_REGI
	BufferItemName 0, VAR_SPECIAL_x8004
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 1, VAR_SPECIAL_RESULT
	NPCMsg msg_0100_D32_00026
	GiveItem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_x8000, 0
	GoToIfEq _0AB1
	GoTo _0F76

_0A85:
	NPCMsg msg_0100_D32_00029
	Compare VAR_SPECIAL_x8000, 0
	GoToIfEq _0AB1
	GoTo _0F76

_0A9B:
	NPCMsg msg_0100_D32_00027
	Compare VAR_SPECIAL_x8000, 0
	GoToIfEq _0AB1
	GoTo _0F76

_0AB1:
	Compare VAR_SPECIAL_x8007, 0
	GoToIfNe _0ACA
	GoTo _04D1

_0AC4:
	GoTo _0B02

_0ACA:
	Compare VAR_SPECIAL_x8007, 1
	GoToIfNe _0AE3
	GoTo _0630

_0ADD:
	GoTo _0B02

_0AE3:
	Compare VAR_SPECIAL_x8007, 2
	GoToIfNe _0AFC
	GoTo _0762

_0AF6:
	GoTo _0B02

_0AFC:
	GoTo _08C1

_0B02:
	ScrCmd_117
	TouchscreenMenuShow
	NPCMsg msg_0100_D32_00022
	WaitButton
	CloseMsg
	ReleaseAll
	ScriptOverlayCmd 3, 1
	End

scr_seq_D32_024:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_SPECIAL_x8000, 1
	ScriptOverlayCmd 3, 0
	ScrCmd_116 1, 21, 1
	NPCMsg msg_0100_D32_00021
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0B02
_0B44:
	NPCMsg msg_0100_D32_00030
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 351, 255, 0
	MenuItemAdd 352, 255, 1
	MenuItemAdd 353, 255, 2
	MenuItemAdd 439, 255, 4
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0BA4
	Case 1, _0CFA
	Case 2, _0DEA
	GoTo _0B02

_0BA4:
	SetVar VAR_SPECIAL_x8007, 0
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 380, 422, 0
	MenuItemAdd 381, 423, 1
	MenuItemAdd 382, 424, 2
	MenuItemAdd 383, 425, 3
	MenuItemAdd 384, 426, 4
	MenuItemAdd 385, 427, 5
	MenuItemAdd 440, 438, 6
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0C46
	Case 1, _0C64
	Case 2, _0C82
	Case 3, _0CA0
	Case 4, _0CBE
	Case 5, _0CDC
	GoTo _0B44

_0C46:
	SetVar VAR_SPECIAL_x8004, 367
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 40
	SetVar VAR_SPECIAL_x8001, 332
	GoTo _0F40

_0C64:
	SetVar VAR_SPECIAL_x8004, 358
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 40
	SetVar VAR_SPECIAL_x8001, 280
	GoTo _0F40

_0C82:
	SetVar VAR_SPECIAL_x8004, 416
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 40
	SetVar VAR_SPECIAL_x8001, 369
	GoTo _0F40

_0CA0:
	SetVar VAR_SPECIAL_x8004, 408
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 64
	SetVar VAR_SPECIAL_x8001, 404
	GoTo _0F40

_0CBE:
	SetVar VAR_SPECIAL_x8004, 398
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 80
	SetVar VAR_SPECIAL_x8001, 444
	GoTo _0F40

_0CDC:
	SetVar VAR_SPECIAL_x8004, 353
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 80
	SetVar VAR_SPECIAL_x8001, 89
	GoTo _0F40

_0CFA:
	SetVar VAR_SPECIAL_x8007, 1
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 386, 428, 0
	MenuItemAdd 387, 429, 1
	MenuItemAdd 388, 430, 2
	MenuItemAdd 389, 431, 3
	MenuItemAdd 440, 438, 4
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0D72
	Case 1, _0D90
	Case 2, _0DAE
	Case 3, _0DCC
	GoTo _0B44

_0D72:
	SetVar VAR_SPECIAL_x8004, 357
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 64
	SetVar VAR_SPECIAL_x8001, 247
	GoTo _0F40

_0D90:
	SetVar VAR_SPECIAL_x8004, 380
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 64
	SetVar VAR_SPECIAL_x8001, 412
	GoTo _0F40

_0DAE:
	SetVar VAR_SPECIAL_x8004, 363
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 80
	SetVar VAR_SPECIAL_x8001, 188
	GoTo _0F40

_0DCC:
	SetVar VAR_SPECIAL_x8004, 386
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 80
	SetVar VAR_SPECIAL_x8001, 406
	GoTo _0F40

_0DEA:
	SetVar VAR_SPECIAL_x8007, 2
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 390, 432, 0
	MenuItemAdd 391, 433, 1
	MenuItemAdd 392, 434, 2
	MenuItemAdd 393, 435, 3
	MenuItemAdd 394, 436, 4
	MenuItemAdd 395, 437, 5
	MenuItemAdd 440, 438, 6
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0E8C
	Case 1, _0EAA
	Case 2, _0EC8
	Case 3, _0EE6
	Case 4, _0F04
	Case 5, _0F22
	GoTo _0B44

_0E8C:
	SetVar VAR_SPECIAL_x8004, 333
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 32
	SetVar VAR_SPECIAL_x8001, 92
	GoTo _0F40

_0EAA:
	SetVar VAR_SPECIAL_x8004, 400
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 32
	SetVar VAR_SPECIAL_x8001, 86
	GoTo _0F40

_0EC8:
	SetVar VAR_SPECIAL_x8004, 388
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 32
	SetVar VAR_SPECIAL_x8001, 261
	GoTo _0F40

_0EE6:
	SetVar VAR_SPECIAL_x8004, 372
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 32
	SetVar VAR_SPECIAL_x8001, 213
	GoTo _0F40

_0F04:
	SetVar VAR_SPECIAL_x8004, 335
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 48
	SetVar VAR_SPECIAL_x8001, 339
	GoTo _0F40

_0F22:
	SetVar VAR_SPECIAL_x8004, 331
	SetVar VAR_SPECIAL_x8005, 1
	SetVar VAR_SPECIAL_x8006, 48
	SetVar VAR_SPECIAL_x8001, 347
	GoTo _0F40

_0F40:
	BufferItemName 0, VAR_SPECIAL_x8004
	BufferMoveName 1, VAR_SPECIAL_x8001
	BufferInt 2, VAR_SPECIAL_x8006
	NPCMsg msg_0100_D32_00024
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0A24
	Compare VAR_SPECIAL_x8000, 0
	GoToIfEq _0AB1
	GoTo _0F76

_0F76:
	Compare VAR_SPECIAL_x8007, 0
	GoToIfNe _0F8F
	GoTo _0BA4

_0F89:
	GoTo scr_seq_D32_023

_0F8F:
	Compare VAR_SPECIAL_x8007, 1
	GoToIfNe _0FA8
	GoTo _0CFA

_0FA2:
	GoTo scr_seq_D32_023

_0FA8:
	GoTo _0DEA

scr_seq_D32_023:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScratchOffCard
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

scr_seq_D32_025:
	ScrCmd_055 3, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0100_D32_00034, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_D32_026:
	ScrCmd_055 3, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0100_D32_00035, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_D32_027:
	ScrCmd_055 3, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0100_D32_00036, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_D32_028:
	ScrCmd_055 3, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0100_D32_00037, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_D32_029:
	ScrCmd_055 3, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0100_D32_00038, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_D32_030:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0100_D32_00039
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D32_031:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0100_D32_00040
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D32_032:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0100_D32_00041
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D32_033:
	ScrCmd_609
	LockAll
	ScrCmd_600
	ApplyMovement obj_player, _10B0
	WaitMovement
	PlaySE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_BATTLE_FRONTIER_BATTLE_HALL, 0, 25, 9, DIR_WEST
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

	.balign 4, 0
_10B0:
	WalkFastWest 5
	EndMovement

scr_seq_D32_034:
	ScrCmd_609
	LockAll
	ScrCmd_600
	ApplyMovement obj_player, _10F4
	WaitMovement
	PlaySE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_BATTLE_FRONTIER_BATTLE_CASTLE, 0, 21, 9, DIR_WEST
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

	.balign 4, 0
_10F4:
	WalkFastWest 6
	EndMovement

scr_seq_D32_035:
	ScrCmd_609
	LockAll
	ScrCmd_600
	ApplyMovement obj_player, _1138
	WaitMovement
	PlaySE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_BATTLE_FRONTIER_BATTLE_ARCADE, 0, 1, 6, DIR_EAST
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

	.balign 4, 0
_1138:
	WalkFastEast 5
	EndMovement

scr_seq_D32_036:
	ScrCmd_609
	LockAll
	ScrCmd_600
	ApplyMovement obj_player, _117C
	WaitMovement
	PlaySE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_BATTLE_FRONTIER_BATTLE_FACTORY, 0, 1, 7, DIR_EAST
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

	.balign 4, 0
_117C:
	WalkFastEast 6
	EndMovement

scr_seq_D32_000:
	End
	.balign 4, 0
