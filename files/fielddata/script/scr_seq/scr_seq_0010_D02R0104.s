#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D02R0104.h"
#include "msgdata/msg/msg_0051_D02R0104.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D02R0104_000
	ScrDef scr_seq_D02R0104_001
	ScrDef scr_seq_D02R0104_002
	ScrDef scr_seq_D02R0104_003
	ScrDef scr_seq_D02R0104_004
	ScrDef scr_seq_D02R0104_005
	ScrDefEnd

scr_seq_D02R0104_000:
	SetFlag FLAG_UNK_298
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfNe _003B
	GoTo _0060

_0035:
	GoTo _005E

_003B:
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _0054
	GoTo _007D

_004E:
	GoTo _005E

_0054:
	SetVar VAR_UNK_40F6, 1
	SetFlag FLAG_UNK_26E
_005E:
	End

_0060:
	ScrCmd_379 VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 3
	GoToIfEq _009A
	SetVar VAR_UNK_40F6, 1
	SetFlag FLAG_UNK_26E
	End

_007D:
	ScrCmd_379 VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 4
	GoToIfEq _009A
	SetVar VAR_UNK_40F6, 1
	SetFlag FLAG_UNK_26E
	End

_009A:
	SetVar VAR_UNK_40F6, 0
	ClearFlag FLAG_UNK_26E
	End

scr_seq_D02R0104_005:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfNe _00C3
	GoTo _0113

_00BD:
	GoTo _00E2

_00C3:
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _00DC
	GoTo _012A

_00D6:
	GoTo _00E2

_00DC:
	GoTo _00E2

_00E2:
	Compare VAR_UNK_40F6, 1
	GoToIfEq _0141
	SetFlag FLAG_UNK_26E
	HidePerson obj_D02R0104_tsure_poke_static_clefairy
	HidePerson obj_D02R0104_tsure_poke_static_clefairy_2
	HidePerson obj_D02R0104_tsure_poke_static_clefairy_3
	HidePerson obj_D02R0104_tsure_poke_static_clefairy_4
	HidePerson obj_D02R0104_tsure_poke_static_clefairy_5
	HidePerson obj_D02R0104_tsure_poke_static_clefairy_6
	SetVar VAR_UNK_40F6, 1
	End

_0113:
	ScrCmd_379 VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 3
	GoToIfEq _0141
	GoTo _00E2

_012A:
	ScrCmd_379 VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 4
	GoToIfEq _0141
	GoTo _00E2

_0141:
	End

scr_seq_D02R0104_002:
	ScrCmd_609
	LockAll
	ClearFlag FLAG_UNK_298
	GetPlayerCoords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	ScrCmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	ApplyMovement 241, _0330
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy, _0344
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_2, _0350
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_3, _035C
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_4, _0368
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_5, _0374
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_6, _037C
	WaitMovement
	PlayCry SPECIES_CLEFAIRY, 0
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy, _0384
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_2, _0394
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_3, _03A4
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_4, _03B4
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_5, _03C4
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_6, _03CC
	WaitMovement
	PlayCry SPECIES_CLEFAIRY, 0
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy, _03D4
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_2, _03F0
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_3, _040C
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_4, _0428
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_5, _0444
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_6, _0468
	WaitMovement
	PlayCry SPECIES_CLEFAIRY, 0
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy, _048C
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_2, _04A8
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_3, _04C4
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_4, _04E0
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_5, _04FC
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_6, _0520
	WaitMovement
	PlayCry SPECIES_CLEFAIRY, 0
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy, _0544
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_2, _0560
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_3, _057C
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_4, _0598
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_5, _05B4
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_6, _05D8
	WaitMovement
	PlayCry SPECIES_CLEFAIRY, 0
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy, _05FC
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_2, _0614
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_3, _0630
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_4, _064C
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_5, _0668
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_6, _068C
	WaitMovement
	PlayCry SPECIES_CLEFAIRY, 0
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy, _06B0
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_2, _06D4
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_3, _06F8
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_4, _0720
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_5, _0744
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_6, _0760
	WaitMovement
	ShowPerson obj_D02R0104_monstarball
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_4, _077C
	ApplyMovement obj_D02R0104_tsure_poke_static_clefairy_6, _0798
	WaitMovement
	HidePerson obj_D02R0104_tsure_poke_static_clefairy
	HidePerson obj_D02R0104_tsure_poke_static_clefairy_2
	HidePerson obj_D02R0104_tsure_poke_static_clefairy_3
	HidePerson obj_D02R0104_tsure_poke_static_clefairy_4
	HidePerson obj_D02R0104_tsure_poke_static_clefairy_5
	HidePerson obj_D02R0104_tsure_poke_static_clefairy_6
	SetFlag FLAG_UNK_26E
	SetVar VAR_UNK_40F6, 1
	SetFlag FLAG_UNK_AB5
	ApplyMovement 241, _0338
	WaitMovement
	ScrCmd_103
	ReleaseAll
	End

	.balign 4, 0
_0330:
	WalkSlightlyFastNorth 2
	EndMovement

	.balign 4, 0
_0338:
	Delay16
	WalkSlightlyFastSouth 2
	EndMovement

	.balign 4, 0
_0344:
	WalkOnSpotNormalNorth 5
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0350:
	WalkOnSpotNormalWest 5
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_035C:
	WalkOnSpotNormalSouth 5
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0368:
	WalkOnSpotNormalEast 5
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0374:
	WalkOnSpotNormalWest 6
	EndMovement

	.balign 4, 0
_037C:
	WalkOnSpotNormalEast 6
	EndMovement

	.balign 4, 0
_0384:
	WalkOnSpotNormalEast 6
	WalkNormalEast
	JumpFarEast
	EndMovement

	.balign 4, 0
_0394:
	WalkOnSpotNormalNorth 6
	WalkNormalNorth
	JumpFarNorth
	EndMovement

	.balign 4, 0
_03A4:
	WalkOnSpotNormalWest 6
	WalkNormalWest
	JumpFarWest
	EndMovement

	.balign 4, 0
_03B4:
	WalkOnSpotNormalSouth 6
	WalkNormalSouth
	JumpFarSouth
	EndMovement

	.balign 4, 0
_03C4:
	WalkOnSpotNormalWest 8
	EndMovement

	.balign 4, 0
_03CC:
	WalkOnSpotNormalEast 8
	EndMovement

	.balign 4, 0
_03D4:
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkNormalNorth 4
	JumpFarNorth
	EndMovement

	.balign 4, 0
_03F0:
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkNormalWest 4
	JumpFarWest
	EndMovement

	.balign 4, 0
_040C:
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkNormalSouth 4
	JumpFarSouth
	EndMovement

	.balign 4, 0
_0428:
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkNormalEast 4
	JumpFarEast
	EndMovement

	.balign 4, 0
_0444:
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0468:
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_048C:
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkNormalWest 4
	JumpFarWest
	EndMovement

	.balign 4, 0
_04A8:
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkNormalSouth 4
	JumpFarSouth
	EndMovement

	.balign 4, 0
_04C4:
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkNormalEast 4
	JumpFarEast
	EndMovement

	.balign 4, 0
_04E0:
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkNormalNorth 4
	JumpFarNorth
	EndMovement

	.balign 4, 0
_04FC:
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0520:
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0544:
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkNormalSouth 4
	JumpFarSouth
	EndMovement

	.balign 4, 0
_0560:
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkNormalEast 4
	JumpFarEast
	EndMovement

	.balign 4, 0
_057C:
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkNormalNorth 4
	JumpFarNorth
	EndMovement

	.balign 4, 0
_0598:
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkNormalWest 4
	JumpFarWest
	EndMovement

	.balign 4, 0
_05B4:
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_05D8:
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_05FC:
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0614:
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkNormalNorth 2
	JumpFarNorth
	EndMovement

	.balign 4, 0
_0630:
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkNormalWest 2
	JumpFarWest
	EndMovement

	.balign 4, 0
_064C:
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkNormalSouth 2
	JumpFarSouth
	EndMovement

	.balign 4, 0
_0668:
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_068C:
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_06B0:
	JumpOnSpotFastNorth 3
	WalkFastEast 6
	WalkFastNorth 3
	WalkFastEast 3
	WalkFastSouth 3
	WalkFastEast
	JumpFarEast
	WalkFastEast 2
	EndMovement

	.balign 4, 0
_06D4:
	WalkOnSpotNormalSouth
	EmoteExclamationMark
	WalkFastSouth
	WalkFastEast 3
	WalkFastSouth 2
	WalkFastEast
	JumpFarEast
	WalkFastEast 2
	EndMovement

	.balign 4, 0
_06F8:
	WalkOnSpotNormalSouth
	EmoteExclamationMark
	WalkFastEast 4
	WalkFastSouth 3
	WalkFastEast 3
	WalkFastSouth 2
	WalkFastEast
	JumpFarEast
	WalkFastEast 2
	EndMovement

	.balign 4, 0
_0720:
	WalkOnSpotNormalSouth
	EmoteExclamationMark
	WalkFastSouth 2
	WalkFastEast 6
	WalkFastNorth 3
	WalkFastEast 2
	WalkFastSouth 3
	JumpOnSpotFastWest 2
	EndMovement

	.balign 4, 0
_0744:
	WalkOnSpotNormalSouth
	EmoteExclamationMark
	WalkFastSouth 2
	WalkFastEast 2
	JumpFarEast
	WalkFastEast 3
	EndMovement

	.balign 4, 0
_0760:
	WalkOnSpotNormalSouth
	EmoteExclamationMark
	WalkNormalEast 2
	WalkNormalSouth 3
	WalkNormalEast 5
	JumpOnSpotFastEast 2
	EndMovement

	.balign 4, 0
_077C:
	WalkOnSpotFastWest 2
	WalkOnSpotFastNorth 4
	JumpOnSpotFastNorth 2
	WalkFastEast 2
	JumpFarEast
	WalkFastEast 3
	EndMovement

	.balign 4, 0
_0798:
	WalkNormalEast
	WalkNormalNorth 3
	WalkNormalEast 3
	WalkNormalSouth 3
	WalkNormalEast
	JumpFarEast
	WalkNormalEast 3
	EndMovement

	.balign 4, 0
_07B8:
	SetVisible
	EndMovement

scr_seq_D02R0104_001:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0051_D02R0104_00001, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_D02R0104_003:
	SetVar VAR_SPECIAL_x8008, 81
	SetVar VAR_SPECIAL_x8009, 1
	GoTo _07E9
	End

_07E9:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	WaitSE SEQ_SE_DP_SELECT
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_x8008
	CopyVar VAR_SPECIAL_x8005, VAR_SPECIAL_x8009
	HasSpaceForItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0825
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0866
	End

_0825:
	CallStd std_hidden_item_fanfare
	HidePerson VAR_SPECIAL_LAST_TALKED
	GiveItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	BufferPlayersName 0
	BufferItemName 1, VAR_SPECIAL_x8004
	NPCMsg msg_0051_D02R0104_00002
	WaitFanfare
	BufferPlayersName 0
	BufferItemName 1, VAR_SPECIAL_x8004
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 2, VAR_SPECIAL_RESULT
	NPCMsg msg_0051_D02R0104_00003
	WaitButton
	SetVar VAR_SPECIAL_RESULT, 1
_0860:
	CloseMsg
	ReleaseAll
	End

_0866:
	BufferItemName 0, VAR_SPECIAL_x8004
	NPCMsg msg_0051_D02R0104_00004
	WaitButton
	SetVar VAR_SPECIAL_RESULT, 0
	GoTo _0860
	End

scr_seq_D02R0104_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0051_D02R0104_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
