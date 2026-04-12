#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T29.h"
#include "msgdata/msg/msg_0626_T29.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T29_000
	ScrDef scr_seq_T29_001
	ScrDef scr_seq_T29_002
	ScrDef scr_seq_T29_003
	ScrDef scr_seq_T29_004
	ScrDef scr_seq_T29_005
	ScrDef scr_seq_T29_006
	ScrDef scr_seq_T29_007
	ScrDef scr_seq_T29_008
	ScrDef scr_seq_T29_009
	ScrDef scr_seq_T29_010
	ScrDef scr_seq_T29_011
	ScrDef scr_seq_T29_012
	ScrDef scr_seq_T29_013
	ScrDef scr_seq_T29_014
	ScrDef scr_seq_T29_015
	ScrDef scr_seq_T29_016
	ScrDef scr_seq_T29_017
	ScrDef scr_seq_T29_018
	ScrDefEnd

scr_seq_T29_000:
	GoToIfSet FLAG_GOT_RED_SCALE, _007F
	SetFlag FLAG_UNK_1FC
	SetFlag FLAG_UNK_1FE
	SetFlag FLAG_MAPTEMP_011
	SetFlag FLAG_MAPTEMP_013
	SetFlag FLAG_MAPTEMP_014
	SetFlag FLAG_MAPTEMP_015
	SetFlag FLAG_UNK_289
	SetFlag FLAG_UNK_28B
	SetFlag FLAG_UNK_28C
	End

_007F:
	GoTo _0115

_0085:
	Compare VAR_UNK_4037, 61993
	GoToIfEq _00BC
	SetFlag FLAG_UNK_1FC
	SetFlag FLAG_UNK_1FE
	ClearFlag FLAG_HIDE_LAKE_OF_RAGE_FISHERMEN
	SetFlag FLAG_MAPTEMP_011
	SetFlag FLAG_MAPTEMP_013
	SetFlag FLAG_MAPTEMP_014
	SetFlag FLAG_MAPTEMP_015
	SetFlag FLAG_UNK_289
	SetFlag FLAG_UNK_28B
	SetFlag FLAG_UNK_28C
	End

_00BC:
	ClearFlag FLAG_UNK_1FC
	ClearFlag FLAG_UNK_1FE
	SetFlag FLAG_HIDE_LAKE_OF_RAGE_FISHERMEN
	ClearFlag FLAG_UNK_289
	ClearFlag FLAG_UNK_28B
	ClearFlag FLAG_UNK_28C
	GoToIfSet FLAG_UNK_146, _00E5
	GoTo _00E9

_00E5:
	SetFlag FLAG_UNK_289
_00E9:
	GoToIfSet FLAG_UNK_147, _00FA
	GoTo _00FE

_00FA:
	SetFlag FLAG_UNK_28B
_00FE:
	GoToIfSet FLAG_UNK_148, _010F
	GoTo _0113

_010F:
	SetFlag FLAG_UNK_28C
_0113:
	End

_0115:
	CheckRegisteredPhoneNumber PHONE_CONTACT_PRYCE, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _01A7
	GoToIfSet FLAG_GAME_CLEAR, _0139
	GoTo _01A7

_0139:
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 6
	GoToIfNe _0154
	ClearFlag FLAG_HIDE_LAKE_OF_RAGE_PRYCE
	GoTo _019F

_0154:
	Compare VAR_TEMP_x4000, 7
	GoToIfNe _016B
	ClearFlag FLAG_HIDE_LAKE_OF_RAGE_PRYCE
	GoTo _019F

_016B:
	Compare VAR_TEMP_x4000, 8
	GoToIfNe _0182
	ClearFlag FLAG_HIDE_LAKE_OF_RAGE_PRYCE
	GoTo _019F

_0182:
	Compare VAR_TEMP_x4000, 9
	GoToIfNe _0199
	ClearFlag FLAG_HIDE_LAKE_OF_RAGE_PRYCE
	GoTo _019F

_0199:
	GoTo _01A7

_019F:
	GoTo _0085
	End

_01A7:
	SetFlag FLAG_HIDE_LAKE_OF_RAGE_PRYCE
	GoTo _0085
	End

scr_seq_T29_002:
	GoToIfSet FLAG_ENGAGING_STATIC_POKEMON, _01C0
	End

_01C0:
	SetFlag FLAG_HIDE_LAKE_OF_RAGE_RED_GYARADOS
	HidePerson obj_T29_rgyaradosu
	ClearFlag FLAG_HIDE_LAKE_OF_RAGE_LANCE
	ShowPerson obj_T29_wataru
	ShowPerson obj_T29_tsure_poke_static_dragonite
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	End

scr_seq_T29_017:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_TEMP_x4004, 1
	GoToIfGe _026A
	NPCMsg msg_0626_T29_00013
_01F2:
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0216
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfGe _0259
	End

_0216:
	BufferPlayersName 0
	NPCMsg msg_0626_T29_00014
	PlayFanfare SEQ_ME_POKEGEAR_REGIST
	WaitFanfare
	RegisterGearNumber PHONE_CONTACT_PRYCE
	NPCMsg msg_0626_T29_00015
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	SetFlag FLAG_HIDE_LAKE_OF_RAGE_PRYCE
	HidePerson obj_T29_gsleader7
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_0259:
	SetVar VAR_TEMP_x4004, 1
	NPCMsg msg_0626_T29_00016
	WaitButton
	CloseMsg
	ReleaseAll
	End

_026A:
	NPCMsg msg_0626_T29_00017
	GoTo _01F2
	End

scr_seq_T29_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetPartyLeadAlive VAR_SPECIAL_x8002
	MonHasRibbon VAR_SPECIAL_RESULT, VAR_SPECIAL_x8002, RIBBON_DOWNCAST
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _039B
	GoToIfSet FLAG_DAILY_GOT_SHOCK_RIBBON, _03AF
	Compare VAR_NUM_MET_WEEKDAY_SIBLINGS, 7
	GoToIfEq _0349
	GoToIfSet FLAG_GOT_BLACK_BELT_FROM_WESLEY, _032B
	GetWeekday VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _02DC
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 11
	GoTo _0323

_02DC:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 8
	GoToIfNoItemSpace ITEM_BLACK_BELT, 1, _033F
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_BLACK_BELT_FROM_WESLEY
	AddVar VAR_NUM_MET_WEEKDAY_SIBLINGS, 1
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 9
_0323:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_032B:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 10
	WaitButton
	CloseMsg
	ReleaseAll
	End

_033F:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_0349:
	GetWeekday VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _036C
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 11
	GoTo _0323

_036C:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 36
	BufferMonSpeciesName 0, VAR_SPECIAL_x8002
	MsgBoxExtern VAR_SPECIAL_RESULT, 38
	GiveRibbon VAR_SPECIAL_x8002, RIBBON_DOWNCAST
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	SetFlag FLAG_DAILY_GOT_SHOCK_RIBBON
	WaitButton
	CloseMsg
	ReleaseAll
	End

_039B:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 37
	WaitButton
	CloseMsg
	ReleaseAll
	End

_03AF:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 39
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T29_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_GYARADOS, 0
	NPCMsg msg_0626_T29_00000
	WaitCry
	CloseMsg
	SetFlag FLAG_ENGAGING_STATIC_POKEMON
	WildBattle SPECIES_GYARADOS, 30, 1
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0456
	GetStaticEncounterOutcome VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 3
	GoToIfEq _0452
	Compare VAR_TEMP_x4002, 4
	CallIfEq _0466
	GoToIfSet FLAG_GOT_RED_SCALE, _046C
	OpenMsg
	GoToIfNoItemSpace ITEM_RED_SCALE, 1, _045C
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_RED_SCALE
	ClearFlag FLAG_HIDE_LAKE_OF_RAGE_ACE_TRAINER_LOIS
	CloseMsg
_0452:
	ReleaseAll
	End

_0456:
	WhiteOut
	ReleaseAll
	End

_045C:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_0466:
	SetFlag FLAG_CAUGHT_RED_GYARADOS
	Return

_046C:
	ClearFlag FLAG_HIDE_LAKE_OF_RAGE_LANCE
	HidePerson obj_T29_wataru
	HidePerson obj_T29_tsure_poke_static_dragonite
	ReleaseAll
	End

scr_seq_T29_003:
	GoToIfSet FLAG_UNK_0C3, _0509
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0626_T29_00002
	FacePlayer
	BufferPlayersName 0
	GenderMsgBox msg_0626_T29_00003, msg_0626_T29_00004
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _04BB
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _04FA
_04BB:
	BufferPlayersName 0
	GenderMsgBox msg_0626_T29_00005, msg_0626_T29_00006
	WaitButton
	CloseMsg
	ApplyMovement obj_T29_tsure_poke_static_dragonite, _0538
	WaitMovement
	ApplyMovement obj_T29_wataru, _0544
	WaitMovement
	ScrCmd_775 8, 10
	SetFlag FLAG_HIDE_LAKE_OF_RAGE_LANCE
	HidePerson obj_T29_wataru
	HidePerson obj_T29_tsure_poke_static_dragonite
	ClearFlag FLAG_HIDE_MAHOGANY_SHOP_LANCE
	SetVar VAR_UNK_40A8, 1
	ReleaseAll
	End

_04FA:
	SetFlag FLAG_UNK_0C3
	NPCMsg msg_0626_T29_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0509:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0626_T29_00008
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _04BB
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _04FA
	End

	.balign 4, 0
_0538:
	WalkOnSpotNormalWest
	JumpOnSpotFastWest 2
	EndMovement

	.balign 4, 0
_0544:
	WalkOnSpotNormalSouth
	EndMovement

scr_seq_T29_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_RED_GYARADOS_MEET, _056A
	NPCMsg msg_0626_T29_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

_056A:
	NPCMsg msg_0626_T29_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End
	End

scr_seq_T29_006:
	GoToIfSet FLAG_UNK_139, _0597
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0626_T29_00031, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

_0597:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScriptOverlayCmd 0, 0
	BufferRecordSize 0, 1, SPECIES_MAGIKARP
	ScriptOverlayCmd 0, 1
	BufferPlayersName 2
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0626_T29_00032, VAR_SPECIAL_RESULT
	CallStd std_signpost
	Dummy486
	Dummy486
	ReleaseAll
	End

scr_seq_T29_014:
	SetVar VAR_TEMP_x4001, 1
	SetVar VAR_SPECIAL_x8008, 27
	SetVar VAR_SPECIAL_x8009, 1
	GoTo _061B
	End

scr_seq_T29_015:
	SetVar VAR_TEMP_x4001, 2
	SetVar VAR_SPECIAL_x8008, 29
	SetVar VAR_SPECIAL_x8009, 1
	GoTo _061B
	End

scr_seq_T29_016:
	SetVar VAR_TEMP_x4001, 3
	SetVar VAR_SPECIAL_x8008, 23
	SetVar VAR_SPECIAL_x8009, 1
	GoTo _061B
	End

_061B:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	WaitSE SEQ_SE_DP_SELECT
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_x8008
	CopyVar VAR_SPECIAL_x8005, VAR_SPECIAL_x8009
	HasSpaceForItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0657
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _06CA
	End

_0657:
	CallStd std_hidden_item_fanfare
	HidePerson VAR_SPECIAL_LAST_TALKED
	Compare VAR_TEMP_x4001, 1
	GoToIfNe _0676
	SetFlag FLAG_UNK_146
	GoTo _0691

_0676:
	Compare VAR_TEMP_x4001, 2
	GoToIfNe _068D
	SetFlag FLAG_UNK_147
	GoTo _0691

_068D:
	SetFlag FLAG_UNK_148
_0691:
	GiveItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	BufferPlayersName 0
	BufferItemName 1, VAR_SPECIAL_x8004
	NPCMsg msg_0626_T29_00033
	WaitFanfare
	BufferPlayersName 0
	BufferItemName 1, VAR_SPECIAL_x8004
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 2, VAR_SPECIAL_RESULT
	NPCMsg msg_0626_T29_00034
	WaitButton
	SetVar VAR_SPECIAL_RESULT, 1
_06C4:
	CloseMsg
	ReleaseAll
	End

_06CA:
	BufferItemName 0, VAR_SPECIAL_x8004
	NPCMsg msg_0626_T29_00035
	WaitButton
	SetVar VAR_SPECIAL_RESULT, 0
	GoTo _06C4
	End

scr_seq_T29_018:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_DRAGONITE, 0
	NPCMsg msg_0626_T29_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T29_007:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0626_T29_00030, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

_0710:
	SimpleNPCMsg msg_0626_T29_00009
	End

scr_seq_T29_008:
	SimpleNPCMsg msg_0626_T29_00012
	End

scr_seq_T29_009:
	SimpleNPCMsg msg_0626_T29_00011
	End

_0749:
	SimpleNPCMsg msg_0626_T29_00000
	End

scr_seq_T29_010:
	SimpleNPCMsg msg_0626_T29_00018
	End

scr_seq_T29_011:
	SimpleNPCMsg msg_0626_T29_00021
	End

scr_seq_T29_012:
	SimpleNPCMsg msg_0626_T29_00024
	End

scr_seq_T29_013:
	SimpleNPCMsg msg_0626_T29_00027
	End
	.balign 4, 0
