#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0004.h"
#include "msgdata/msg/msg_0191.h"
#include "msgdata/msg/msg_0046.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_0004_000
	ScrDef scr_seq_0004_001
	ScrDef scr_seq_0004_002
	ScrDef scr_seq_0004_003
	ScrDef scr_seq_0004_004
	ScrDef scr_seq_0004_005
	ScrDef scr_seq_0004_006
	ScrDef scr_seq_0004_007
	ScrDef scr_seq_0004_008
	ScrDef scr_seq_0004_009
	ScrDef scr_seq_0004_010
	ScrDef scr_seq_0004_011
	ScrDef scr_seq_0004_012
	ScrDef scr_seq_0004_013
	ScrDef scr_seq_0004_014
	ScrDef scr_seq_0004_015
	ScrDef scr_seq_0004_016
	ScrDef scr_seq_0004_017
	ScrDefEnd

scr_seq_0004_000:
	Compare VAR_UNK_4133, 2
	GoToIfEq _0066
	Compare VAR_UNK_4133, 1
	GoToIfEq _0066
	End

_0066:
	MakeObjectVisible obj_player
	End

scr_seq_0004_012:
scr_seq_0004_014:
scr_seq_0004_015:
	ScrCmd_609
	LockAll
	ScrCmd_446 VAR_SPECIAL_RESULT
	ScrCmd_840 VAR_SPECIAL_RESULT, VAR_SPECIAL_x8004
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_SPECIAL_x8004, 0
	GoToIfNe _0099
	GoTo _027A

_0093:
	GoTo _0141

_0099:
	Compare VAR_SPECIAL_x8004, 1
	GoToIfNe _00F0
	Compare VAR_TEMP_x4000, 12
	GoToIfEq _00BF
	GoTo _027A

_00B9:
	GoTo _00D2

_00BF:
	Compare VAR_TEMP_x4001, 2
	GoToIfEq _00D2
	GoTo _027A

_00D2:
	SetVar VAR_TEMP_x4000, 12
	SetVar VAR_TEMP_x4001, 2
	SetVar VAR_TEMP_x4002, 5
	GoTo _0222

_00EA:
	GoTo _0141

_00F0:
	Compare VAR_SPECIAL_x8004, 2
	GoToIfNe _0141
	Compare VAR_TEMP_x4000, 18
	GoToIfEq _0116
	GoTo _027A

_0110:
	GoTo _0129

_0116:
	Compare VAR_TEMP_x4001, 11
	GoToIfEq _0129
	GoTo _027A

_0129:
	SetVar VAR_TEMP_x4000, 18
	SetVar VAR_TEMP_x4001, 11
	SetVar VAR_TEMP_x4002, 14
	GoTo _0222

_0141:
	GoTo _027A

scr_seq_0004_013:
	ScrCmd_609
	LockAll
	ScrCmd_446 VAR_SPECIAL_RESULT
	ScrCmd_840 VAR_SPECIAL_RESULT, VAR_SPECIAL_x8004
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_SPECIAL_x8004, 0
	GoToIfNe _0174
	GoTo _027A

_016E:
	GoTo _021C

_0174:
	Compare VAR_SPECIAL_x8004, 1
	GoToIfNe _01CB
	Compare VAR_TEMP_x4000, 7
	GoToIfEq _019A
	GoTo _027A

_0194:
	GoTo _01AD

_019A:
	Compare VAR_TEMP_x4001, 2
	GoToIfEq _01AD
	GoTo _027A

_01AD:
	SetVar VAR_TEMP_x4000, 7
	SetVar VAR_TEMP_x4001, 2
	SetVar VAR_TEMP_x4002, 5
	GoTo _0222

_01C5:
	GoTo _021C

_01CB:
	Compare VAR_SPECIAL_x8004, 2
	GoToIfNe _021C
	Compare VAR_TEMP_x4000, 4
	GoToIfEq _01F1
	GoTo _027A

_01EB:
	GoTo _0204

_01F1:
	Compare VAR_TEMP_x4001, 11
	GoToIfEq _0204
	GoTo _027A

_0204:
	SetVar VAR_TEMP_x4000, 4
	SetVar VAR_TEMP_x4001, 11
	SetVar VAR_TEMP_x4002, 14
	GoTo _0222

_021C:
	GoTo _027A

_0222:
	ScrCmd_307 0, 0, VAR_TEMP_x4000, VAR_TEMP_x4001, 77
	Call _0BC2
	ApplyMovement obj_player, _0288
	WaitMovement
	Call _0BCA
	ScrCmd_307 0, 0, VAR_TEMP_x4000, VAR_TEMP_x4002, 77
	Call _0BC2
	ApplyMovement obj_player, _02A0
	WaitMovement
	Call _0BCA
	ScrCmd_606
	ClearFlag FLAG_UNK_966
	SetVar VAR_UNK_4133, 0
	SetVar VAR_UNK_4133, 0
	ReleaseAll
	End

_027A:
	SetVar VAR_UNK_4133, 0
	ScrCmd_374 obj_player
	ReleaseAll
	End

	.balign 4, 0
_0288:
	FaceSouth
	SetVisible
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_0290:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_02A0:
	WalkNormalSouth 2
	EndMovement

scr_seq_0004_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PartyLegalCheck VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0F27
	GetPlayerState VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _0C10
	NPCMsg msg_0046_00000
	GoTo _02DD
	End
_02DD:
	NPCMsg msg_0046_00002
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd msg_0191_00166, 255, 0
	MenuItemAdd msg_0191_00167, 255, 1
	MenuItemAdd msg_0191_00011, 255, 2
	MenuItemAdd msg_0191_00012, 255, 3
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0364
	Case 1, _03DF
	Case 2, _033F
	GoTo _034C

_033F:
	NPCMsg msg_0046_00006
	CloseMsg
	GoTo _02DD
	End
_034C:
	NPCMsg msg_0046_00029
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	End

_0359:
	NPCMsg msg_0046_00029
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0364:
	NPCMsg msg_0046_00001
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd msg_0191_00006, 255, 0
	MenuItemAdd msg_0191_00007, 255, 1
	MenuItemAdd msg_0191_00008, 255, 2
	MenuItemAdd msg_0191_00010, 255, 3
	MenuItemAdd msg_0191_00013, 255, 4
	MenuExec
	CopyVar VAR_TEMP_x4003, VAR_SPECIAL_RESULT
	Switch VAR_SPECIAL_RESULT
	Case 0, _0415
	Case 1, _0423
	Case 2, _044D
	Case 3, _04A1
	GoTo _02DD

_03DF:
	NPCMsg msg_0046_00003
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd msg_0046_00004, 255, 0
	MenuItemAdd msg_0046_00005, 255, 1
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0477
	GoTo _02DD

_0415:
	SetVar VAR_SPECIAL_x8004, 1
	GoTo _04AF
	End
_0423:
	SetVar VAR_SPECIAL_x8004, 2
	PartyCountNotEgg VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfLt _0440
	GoTo _04AF

_0440:
	NPCMsg msg_0046_00010
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	End

_044D:
	SetVar VAR_SPECIAL_x8004, 3
	PartyCountNotEgg VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfLt _046A
	GoTo _0905

_046A:
	NPCMsg msg_0046_00141
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	End

_0477:
	SetVar VAR_SPECIAL_x8004, 4
	PartyCountNotEgg VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfLt _0494
	GoTo _0905

_0494:
	NPCMsg msg_0046_00140
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	End

_04A1:
	SetVar VAR_SPECIAL_x8004, 37
	GoTo _059A
	End
_04AF:
	NPCMsg msg_0046_00120
	MenuInit 1, 1, 0, 1, VAR_TEMP_x4000
	MenuItemAdd msg_0046_00020, 255, 12
	BufferRulesetName 0
	MenuItemAdd msg_0046_00019, 255, 0
	BufferRulesetName 1
	MenuItemAdd msg_0046_00019, 255, 1
	BufferRulesetName 2
	MenuItemAdd msg_0046_00019, 255, 2
	BufferRulesetName 3
	MenuItemAdd msg_0046_00019, 255, 3
	BufferRulesetName 4
	MenuItemAdd msg_0046_00019, 255, 4
	ScrCmd_837 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _051B
	BufferRulesetName 5
	MenuItemAdd msg_0046_00019, 255, 5
_051B:
	MenuItemAdd msg_0046_00022, 255, 255
	MenuExec
	Switch VAR_TEMP_x4000
	Case 12, _08F9
	Case 0, _058E
	Case 1, _058E
	Case 2, _058E
	Case 3, _058E
	Case 4, _058E
	Case 5, _058E
	GoTo _02DD
	End
_058E:
	ScrCmd_800 VAR_TEMP_x4000
	GoTo _0682
	End
_059A:
	SetVar VAR_SPECIAL_x8004, 37
	NPCMsg msg_0046_00120
	MenuInit 1, 1, 0, 1, VAR_TEMP_x4000
	MenuItemAdd msg_0046_00020, 255, 6
	BufferRulesetName 7
	MenuItemAdd msg_0046_00019, 255, 7
	BufferRulesetName 8
	MenuItemAdd msg_0046_00019, 255, 8
	BufferRulesetName 9
	MenuItemAdd msg_0046_00019, 255, 9
	BufferRulesetName 10
	MenuItemAdd msg_0046_00023, 255, 10
	BufferRulesetName 11
	MenuItemAdd msg_0046_00019, 255, 11
	MenuItemAdd msg_0046_00022, 255, 255
	MenuExec
	Switch VAR_TEMP_x4000
	Case 6, _08F9
	Case 7, _058E
	Case 8, _058E
	Case 9, _0653
	Case 10, _065F
	Case 11, _0653
	GoTo _02DD

_0653:
	SetVar VAR_SPECIAL_x8004, 38
	GoTo _058E

_065F:
	SetVar VAR_SPECIAL_x8004, 38
	ScrCmd_800 VAR_TEMP_x4000
	ScrCmd_803 VAR_TEMP_x4000, VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 1
	GoToIfEq _0440
	GoTo _0905

_0682:
	ScrCmd_799 VAR_TEMP_x4000
	NPCMsg msg_0046_00121
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd msg_0046_00130, 255, 0
	MenuItemAdd msg_0046_00131, 255, 1
	Compare VAR_TEMP_x4000, 11
	GoToIfNe _06B6
	MenuItemAdd msg_0046_00024, 255, 2
_06B6:
	MenuItemAdd msg_0046_00022, 255, 3
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0702
	Case 1, _0751
	Compare VAR_TEMP_x4000, 11
	GoToIfNe _06FA
	Case 2, _0778
_06FA:
	GoTo _0763
	End
_0702:
	ScrCmd_803 VAR_TEMP_x4000, VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 0
	GoToIfEq _0905
	Compare VAR_TEMP_x4002, 1
	GoToIfEq _072A
	GoTo _0744
	End
_072A:
	NPCMsg msg_0046_00122
	WaitABPress
	Compare VAR_TEMP_x4003, 3
	GoToIfEq _059A
	GoTo _04AF
	End
_0744:
	NPCMsg msg_0046_00136
	WaitABPress
	GoTo _04AF
	End
_0751:
	CloseMsg
	ScrCmd_801 VAR_TEMP_x4000
	WaitABPress
	ScrCmd_802
	GoTo _0682
	End
_0763:
	Compare VAR_TEMP_x4003, 3
	GoToIfEq _059A
	GoTo _04AF
	End
_0778:
	TouchscreenMenuShow
	BufferPlayersName 0
	NPCMsg msg_0046_00025
	SetVar VAR_TEMP_x4005, 0
	CheckMonSeen SPECIES_MEWTWO, VAR_TEMP_x4004
	Compare VAR_TEMP_x4004, 1
	GoToIfNe _07AA
	BufferSpeciesName 0, SPECIES_MEWTWO, 0, 0
	NPCMsg msg_0046_00026
	SetVar VAR_TEMP_x4005, 1
_07AA:
	CheckMonSeen SPECIES_LUGIA, VAR_TEMP_x4004
	Compare VAR_TEMP_x4004, 1
	GoToIfNe _07CE
	BufferSpeciesName 0, SPECIES_LUGIA, 0, 0
	NPCMsg msg_0046_00026
	SetVar VAR_TEMP_x4005, 1
_07CE:
	CheckMonSeen SPECIES_HO_OH, VAR_TEMP_x4004
	Compare VAR_TEMP_x4004, 1
	GoToIfNe _07F2
	BufferSpeciesName 0, SPECIES_HO_OH, 0, 0
	NPCMsg msg_0046_00026
	SetVar VAR_TEMP_x4005, 1
_07F2:
	CheckMonSeen SPECIES_KYOGRE, VAR_TEMP_x4004
	Compare VAR_TEMP_x4004, 1
	GoToIfNe _0816
	BufferSpeciesName 0, SPECIES_KYOGRE, 0, 0
	NPCMsg msg_0046_00026
	SetVar VAR_TEMP_x4005, 1
_0816:
	CheckMonSeen SPECIES_GROUDON, VAR_TEMP_x4004
	Compare VAR_TEMP_x4004, 1
	GoToIfNe _083A
	BufferSpeciesName 0, SPECIES_GROUDON, 0, 0
	NPCMsg msg_0046_00026
	SetVar VAR_TEMP_x4005, 1
_083A:
	CheckMonSeen SPECIES_RAYQUAZA, VAR_TEMP_x4004
	Compare VAR_TEMP_x4004, 1
	GoToIfNe _085E
	BufferSpeciesName 0, SPECIES_RAYQUAZA, 0, 0
	NPCMsg msg_0046_00026
	SetVar VAR_TEMP_x4005, 1
_085E:
	CheckMonSeen SPECIES_DIALGA, VAR_TEMP_x4004
	Compare VAR_TEMP_x4004, 1
	GoToIfNe _0882
	BufferSpeciesName 0, SPECIES_DIALGA, 0, 0
	NPCMsg msg_0046_00026
	SetVar VAR_TEMP_x4005, 1
_0882:
	CheckMonSeen SPECIES_PALKIA, VAR_TEMP_x4004
	Compare VAR_TEMP_x4004, 1
	GoToIfNe _08A6
	BufferSpeciesName 0, SPECIES_PALKIA, 0, 0
	NPCMsg msg_0046_00026
	SetVar VAR_TEMP_x4005, 1
_08A6:
	CheckMonSeen SPECIES_GIRATINA, VAR_TEMP_x4004
	Compare VAR_TEMP_x4004, 1
	GoToIfNe _08CA
	BufferSpeciesName 0, SPECIES_GIRATINA, 0, 0
	NPCMsg msg_0046_00026
	SetVar VAR_TEMP_x4005, 1
_08CA:
	Compare VAR_TEMP_x4005, 1
	GoToIfNe _08E0
	NPCMsg msg_0046_00027
	GoTo _08E3

_08E0:
	NPCMsg msg_0046_00028
_08E3:
	TouchscreenMenuHide
	GoTo _0682

_08EB:
	SetVar VAR_SPECIAL_x8005, 0
	GoTo _0905
	End
_08F9:
	ScrCmd_800 VAR_TEMP_x4000
	GoTo _0905
	End
_0905:
	CallStd std_prompt_save
	CopyVar VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0924
	GoTo _0359
	End
_0924:
	TouchscreenMenuHide
_0926:
	Compare VAR_SPECIAL_x8004, 1
	CallIfEq _09BE
	Compare VAR_SPECIAL_x8004, 2
	CallIfEq _09BE
	Compare VAR_SPECIAL_x8004, 3
	CallIfEq _09BE
	Compare VAR_SPECIAL_x8004, 37
	CallIfEq _09BE
	Compare VAR_SPECIAL_x8004, 38
	CallIfEq _09BE
	Compare VAR_SPECIAL_x8004, 4
	CallIfEq _09C3
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd msg_0191_00014, 255, 0
	MenuItemAdd msg_0191_00015, 255, 1
	MenuItemAdd msg_0191_00005, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _09C8
	Case 1, _0A41
	GoTo _034C
	End
_09BE:
	NPCMsg msg_0046_00036
	Return

_09C3:
	NPCMsg msg_0046_00057
	Return

_09C8:
	NPCMsg msg_0046_00139
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0926
	CloseMsg
	ScrCmd_226 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0A17
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _0A23
	Compare VAR_SPECIAL_RESULT, 4
	GoToIfEq _0A32
	GoTo _0ABA
	End
_0A17:
	ScrCmd_283
	TouchscreenMenuHide
	GoTo _0926
	End
_0A23:
	ScrCmd_283
	TouchscreenMenuShow
	NPCMsg msg_0046_00030
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0A32:
	ScrCmd_283
	NPCMsg msg_0046_00029
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	End

_0A41:
	NPCMsg msg_0046_00139
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0926
	CloseMsg
	ScrCmd_227 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0A90
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _0A9C
	Compare VAR_SPECIAL_RESULT, 4
	GoToIfEq _0AAB
	GoTo _0ABA
	End
_0A90:
	ScrCmd_283
	TouchscreenMenuHide
	GoTo _0926
	End
_0A9C:
	ScrCmd_283
	NPCMsg msg_0046_00030
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	End

_0AAB:
	ScrCmd_283
	NPCMsg msg_0046_00029
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	End

_0ABA:
	SetVar VAR_UNK_4133, 1
	SetFlag FLAG_UNK_966
	NPCMsgVar msg_0046_00066
	WaitButtonOrDelay 45
	ScrCmd_257 96
	CloseMsg
	ScrCmd_600
	HealParty
	ScrCmd_815 0
	ScrCmd_446 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 300
	GoToIfNe _0B13
	ApplyMovement obj_player, _0BE8
	WaitMovement
	SetVar VAR_TEMP_x4000, 18
	SetVar VAR_TEMP_x4001, 11
	SetVar VAR_TEMP_x4002, 14
	GoTo _0B35

_0B0D:
	GoTo _0B35

_0B13:
	ApplyMovement obj_player, _0BDC
	WaitMovement
	SetVar VAR_TEMP_x4000, 12
	SetVar VAR_TEMP_x4001, 2
	SetVar VAR_TEMP_x4002, 5
	GoTo _0B35

_0B35:
	ScrCmd_307 0, 0, VAR_TEMP_x4000, VAR_TEMP_x4002, 77
	Call _0BC2
	ApplyMovement obj_player, _0BF4
	WaitMovement
	Call _0BCA
	ApplyMovement obj_player, _0BFC
	WaitMovement
	ScrCmd_307 0, 0, VAR_TEMP_x4000, VAR_TEMP_x4001, 77
	Call _0BC2
	ApplyMovement obj_player, _0C04
	WaitMovement
	Call _0BCA
	Compare VAR_SPECIAL_x8004, 4
	GoToIfEq _0BA8
	ScrCmd_451 VAR_SPECIAL_RESULT
	AddVar VAR_SPECIAL_RESULT, 7
	ScrCmd_448 MAP_WIFI_SINGLE_BATTLE_AREA, 0, VAR_SPECIAL_RESULT, 11, DIR_NORTH
	ReleaseAll
	End

_0BA8:
	ScrCmd_451 VAR_SPECIAL_RESULT
	AddVar VAR_SPECIAL_RESULT, 6
	ScrCmd_448 MAP_WIFI_MULTI_BATTLE_AREA, 0, VAR_SPECIAL_RESULT, 11, DIR_NORTH
	ReleaseAll
	End

_0BC2:
	ScrCmd_310 77
	ScrCmd_308 77
	Return

_0BCA:
	ScrCmd_311 77
	ScrCmd_308 77
	ScrCmd_309 77
	Return

scr_seq_0004_002:
	ScrCmd_230
	ScrCmd_284
	End

	.balign 4, 0
_0BDC:
	WalkNormalEast
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0BE8:
	WalkNormalWest
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0BF4:
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_0BFC:
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0C04:
	WalkNormalNorth
	SetInvisible
	EndMovement

_0C10:
	NPCMsg msg_0046_00144
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_0004_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PartyLegalCheck VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0F27
	GetPlayerState VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _0E3A
	GetPartyCount VAR_TEMP_x4009
	SetVar VAR_TEMP_x400A, 0
_0C4F:
	GetPartyMonSpecies VAR_TEMP_x400A, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 172
	GoToIfNe _0C7B
	GetPartyMonForm2 VAR_TEMP_x400A, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0C7B
	GoTo _0E45

_0C7B:
	AddVar VAR_TEMP_x400A, 1
	Compare VAR_TEMP_x400A, VAR_TEMP_x4009
	GoToIfGe _0C94
	GoTo _0C4F

_0C94:
	GoTo _0C9C
	End
_0C9C:
	NPCMsg msg_0046_00071
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd msg_0191_00042, 255, 0
	MenuItemAdd msg_0191_00011, 255, 1
	MenuItemAdd msg_0191_00045, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0D14
	Case 1, _0CF8
	Case 2, _034C
	GoTo _034C
	End
_0CF8:
	NPCMsg msg_0046_00072
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0D14
	GoTo _034C
	End
_0D14:
	SetVar VAR_SPECIAL_x8004, 9
	NPCMsg msg_0046_00139
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _034C
	CommSanitizeParty VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _0E34
	SetVar VAR_UNK_4133, 2
	SetFlag FLAG_UNK_966
	CallStd std_prompt_save
	CopyVar VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0D70
	SetVar VAR_UNK_4133, 0
	ClearFlag FLAG_UNK_966
	GoTo _0359

_0D70:
	SetVar VAR_UNK_4133, 2
	SetFlag FLAG_UNK_966
	NPCMsg msg_0046_00077
	CloseMsg
	ScrCmd_600
	HealParty
	ApplyMovement obj_player, _0BDC
	WaitMovement
	ScrCmd_815 0
	GoTo _0D99
	End
_0D99:
	ScrCmd_446 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 300
	GoToIfNe _0DC8
	SetVar VAR_TEMP_x4000, 4
	SetVar VAR_TEMP_x4001, 11
	SetVar VAR_TEMP_x4002, 14
	GoTo _0DE2

_0DC2:
	GoTo _0DE0

_0DC8:
	SetVar VAR_TEMP_x4000, 7
	SetVar VAR_TEMP_x4001, 2
	SetVar VAR_TEMP_x4002, 5
	GoTo _0DE2

_0DE0:
	End

_0DE2:
	ScrCmd_307 0, 0, VAR_TEMP_x4000, VAR_TEMP_x4002, 77
	Call _0BC2
	ApplyMovement obj_player, _0BF4
	WaitMovement
	Call _0BCA
	ApplyMovement obj_player, _0BFC
	WaitMovement
	ScrCmd_307 0, 0, VAR_TEMP_x4000, VAR_TEMP_x4001, 77
	Call _0BC2
	ApplyMovement obj_player, _0C04
	WaitMovement
	Call _0BCA
	ReleaseAll
	ScrCmd_286
	End

_0E34:
	CallStd std_bag_is_full_griseous_orb
	End

_0E3A:
	NPCMsg msg_0046_00146
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0E45:
	Compare VAR_UNK_412F, 0
	GoToIfNe _0E5B
	NPCMsg msg_0046_00172
	GoTo _0E5E

_0E5B:
	NPCMsg msg_0046_00147
_0E5E:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_0004_004:
	End

scr_seq_0004_005:
	End

scr_seq_0004_006:
	End

scr_seq_0004_007:
	End

scr_seq_0004_008:
	End

scr_seq_0004_009:
	End

scr_seq_0004_010:
	ScrCmd_436
	ScrCmd_152
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	End

scr_seq_0004_011:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetFlag FLAG_UNK_066
	NPCMsg msg_0046_00116
	GoTo _0E9D
	End
_0E9D:
	NPCMsg msg_0046_00117
	ScrCmd_064 1, 1, 0, 1, VAR_SPECIAL_RESULT
	ScrCmd_066 msg_0046_00042, 0
	ScrCmd_066 msg_0046_00043, 1
	ScrCmd_066 msg_0046_00011, 2
	ScrCmd_067
	Switch VAR_SPECIAL_RESULT
	Case 0, _0EF6
	Case 1, _0F1C
	Case 2, _0EEB
	GoTo _0F1C
	End
_0EEB:
	NPCMsg msg_0046_00119
	GoTo _0E9D
	End
_0EF6:
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_252
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	GoTo _0F1C
	End
_0F1C:
	NPCMsg msg_0046_00118
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0F27:
	Call _0F3F
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_0004_016:
	Call _0F3F
	RestartCurrentScript
	End

_0F3F:
	NPCMsg msg_0046_00142
	Return

scr_seq_0004_017:
	SimpleNPCMsg msg_0046_00149
	End
	.balign 4, 0
