#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11R0702.h"
#include "msgdata/msg/msg_0538_T11R0702.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T11R0702_000
	ScrDef scr_seq_T11R0702_001
	ScrDef scr_seq_T11R0702_002
	ScrDef scr_seq_T11R0702_003
	ScrDef scr_seq_T11R0702_004
	ScrDef scr_seq_T11R0702_005
	ScrDef scr_seq_T11R0702_006
	ScrDef scr_seq_T11R0702_007
	ScrDefEnd

scr_seq_T11R0702_006:
	SetFlag FLAG_HIDE_SILPH_ROTOM_HEAT
	SetFlag FLAG_HIDE_SILPH_ROTOM_WASH
	SetFlag FLAG_HIDE_SILPH_ROTOM_FROST
	SetFlag FLAG_HIDE_SILPH_ROTOM_FAN
	SetFlag FLAG_HIDE_SILPH_ROTOM_MOW
	GetOwnedRotomForms VAR_TEMP_x4000, VAR_TEMP_x4001, VAR_TEMP_x4002, VAR_TEMP_x4003, VAR_TEMP_x4004
	Compare VAR_TEMP_x4000, 0
	CallIfEq _0085
	Compare VAR_TEMP_x4001, 0
	CallIfEq _008B
	Compare VAR_TEMP_x4002, 0
	CallIfEq _0091
	Compare VAR_TEMP_x4003, 0
	CallIfEq _0097
	Compare VAR_TEMP_x4004, 0
	CallIfEq _009D
	End

_0085:
	ClearFlag FLAG_HIDE_SILPH_ROTOM_HEAT
	Return

_008B:
	ClearFlag FLAG_HIDE_SILPH_ROTOM_WASH
	Return

_0091:
	ClearFlag FLAG_HIDE_SILPH_ROTOM_FROST
	Return

_0097:
	ClearFlag FLAG_HIDE_SILPH_ROTOM_FAN
	Return

_009D:
	ClearFlag FLAG_HIDE_SILPH_ROTOM_MOW
	Return

scr_seq_T11R0702_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	SetVar VAR_SPECIAL_x8004, 1
	GoTo _0107
	End

scr_seq_T11R0702_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	SetVar VAR_SPECIAL_x8004, 4
	GoTo _0107
	End

scr_seq_T11R0702_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	SetVar VAR_SPECIAL_x8004, 3
	GoTo _0107
	End

scr_seq_T11R0702_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	SetVar VAR_SPECIAL_x8004, 2
	GoTo _0107
	End

scr_seq_T11R0702_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	SetVar VAR_SPECIAL_x8004, 5
	GoTo _0107
	End

_0107:
	PlayerHasSpecies VAR_SPECIAL_RESULT, SPECIES_ROTOM
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _07D8
	Compare VAR_SPECIAL_x8004, 1
	CallIfEq _0724
	Compare VAR_SPECIAL_x8004, 3
	CallIfEq _0729
	Compare VAR_SPECIAL_x8004, 2
	CallIfEq _072E
	Compare VAR_SPECIAL_x8004, 4
	CallIfEq _0733
	Compare VAR_SPECIAL_x8004, 5
	CallIfEq _0738
	CountTranformedRotomsInParty VAR_SPECIAL_x8003, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_x8003, 1
	GoToIfGe _01E5
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _073D
	GoTo _0189
	End

_0189:
	Compare VAR_SPECIAL_x8004, 1
	CallIfEq _06FC
	Compare VAR_SPECIAL_x8004, 3
	CallIfEq _0704
	Compare VAR_SPECIAL_x8004, 2
	CallIfEq _070C
	Compare VAR_SPECIAL_x8004, 4
	CallIfEq _0714
	Compare VAR_SPECIAL_x8004, 5
	CallIfEq _071C
	CountPartyMonsOfSpecies VAR_SPECIAL_RESULT, SPECIES_ROTOM
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _03B2
	GoTo _03C0
	End

_01E5:
	TouchscreenMenuHide
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 15, 255, 0
	MenuItemAdd 14, 255, 1
	MenuItemAdd 16, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0189
	Case 1, _0231
	GoTo _073D
	End

_0231:
	CountTranformedRotomsInParty VAR_SPECIAL_x8003, VAR_SPECIAL_RESULT
	CopyVar VAR_SPECIAL_x8000, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_x8003, 2
	GoToIfGe _0332
	GoTo _0252
	End

_0252:
	BufferPartyMonNick 0, VAR_SPECIAL_x8000
	NPCMsg msg_0538_T11R0702_00011
	UpdateRotomForm VAR_SPECIAL_x8000, 0, 0, 0
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CloseMsg
	GetPartyMonForm VAR_SPECIAL_x8000, VAR_SPECIAL_x8004
	Compare VAR_SPECIAL_x8004, 1
	CallIfEq _0300
	Compare VAR_SPECIAL_x8004, 3
	CallIfEq _030A
	Compare VAR_SPECIAL_x8004, 2
	CallIfEq _0314
	Compare VAR_SPECIAL_x8004, 4
	CallIfEq _031E
	Compare VAR_SPECIAL_x8004, 5
	CallIfEq _0328
	GoTo _02C1
	End

_02C1:
	ScrCmd_815 0
	GetPlayerCoords VAR_SPECIAL_x8006, VAR_SPECIAL_x8007
	GetPlayerFacing VAR_SPECIAL_RESULT
	Warp MAP_SAFFRON_SILPH_CO_ROTOM_ROOM, 0, VAR_SPECIAL_x8006, VAR_SPECIAL_x8007, VAR_SPECIAL_RESULT
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	NopVar490 VAR_TEMP_x400B
	Compare VAR_TEMP_x400A, 1
	CallIfEq _07BA
	GoTo _08A4
	End

_0300:
	ClearFlag FLAG_HIDE_SILPH_ROTOM_HEAT
	ShowPerson obj_T11R0702_rotomf
	Return

_030A:
	ClearFlag FLAG_HIDE_SILPH_ROTOM_FROST
	ShowPerson obj_T11R0702_rotomi
	Return

_0314:
	ClearFlag FLAG_HIDE_SILPH_ROTOM_WASH
	ShowPerson obj_T11R0702_rotomw
	Return

_031E:
	ClearFlag FLAG_HIDE_SILPH_ROTOM_FAN
	ShowPerson obj_T11R0702_rotoms
	Return

_0328:
	ClearFlag FLAG_HIDE_SILPH_ROTOM_MOW
	ShowPerson obj_T11R0702_rotomg
	Return

_0332:
	NPCMsg msg_0538_T11R0702_00007
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CloseMsg
	PartySelectUI
	GetPartySelection VAR_SPECIAL_x8000
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_x8000, 255
	GoToIfEq _03AC
	GetPartyMonSpecies VAR_SPECIAL_x8000, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _041A
	Compare VAR_SPECIAL_RESULT, 479
	GoToIfNe _0427
	GetPartyMonForm VAR_SPECIAL_x8000, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _039F
	GoTo _0252
	End

_039F:
	NPCMsg msg_0538_T11R0702_00017
	WaitButton
	GoTo _089C
	End

_03AC:
	TouchscreenMenuShow
	ReleaseAll
	End

_03B2:
	GetPartySlotWithSpecies VAR_SPECIAL_x8000, SPECIES_ROTOM
	GoTo _0434
	End

_03C0:
	NPCMsg msg_0538_T11R0702_00007
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CloseMsg
	PartySelectUI
	GetPartySelection VAR_SPECIAL_x8000
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_x8000, 255
	GoToIfEq _073D
	GetPartyMonSpecies VAR_SPECIAL_x8000, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _041A
	Compare VAR_SPECIAL_RESULT, 479
	GoToIfNe _0427
	GoTo _0434
	End

_041A:
	NPCMsg msg_0538_T11R0702_00008
	WaitButton
	GoTo _089C
	End

_0427:
	NPCMsg msg_0538_T11R0702_00009
	WaitButton
	GoTo _089C
	End

_0434:
	MonHasMove VAR_SPECIAL_RESULT, MOVE_OVERHEAT, VAR_SPECIAL_x8000
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _04BE
	MonHasMove VAR_SPECIAL_RESULT, MOVE_BLIZZARD, VAR_SPECIAL_x8000
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _04BE
	MonHasMove VAR_SPECIAL_RESULT, MOVE_HYDRO_PUMP, VAR_SPECIAL_x8000
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _04BE
	MonHasMove VAR_SPECIAL_RESULT, MOVE_AIR_SLASH, VAR_SPECIAL_x8000
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _04BE
	MonHasMove VAR_SPECIAL_RESULT, MOVE_LEAF_STORM, VAR_SPECIAL_x8000
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _04BE
	CountMonMoves VAR_SPECIAL_RESULT, VAR_SPECIAL_x8000
	CopyVar VAR_SPECIAL_x8002, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 4
	GoToIfEq _051C
	GoTo _04CC
	End

_04BE:
	SetVar VAR_SPECIAL_x8002, 0
	GoTo _04CC
	End

_04CC:
	NopVar490 VAR_TEMP_x4005
	GetPartyLeadAlive VAR_TEMP_x4000
	GetPartyMonSpecies VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 479
	GoToIfNe _050C
	Compare VAR_TEMP_x4000, VAR_SPECIAL_x8000
	GoToIfNe _0506
	Release obj_partner_poke
	ApplyMovement obj_partner_poke, _06F0
	WaitMovement
	Lock obj_partner_poke
_0506:
	SetVar VAR_TEMP_x400A, 1
_050C:
	BufferPartyMonNick 0, VAR_SPECIAL_x8000
	NPCMsg msg_0538_T11R0702_00010
	GoTo _0671
	End

_051C:
	NopVar490 VAR_TEMP_x4007
	GetPartyLeadAlive VAR_TEMP_x4000
	GetPartyMonSpecies VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 479
	GoToIfNe _0564
	NopVar490 VAR_TEMP_x4000
	NopVar490 VAR_SPECIAL_x8000
	Compare VAR_TEMP_x4000, VAR_SPECIAL_x8000
	GoToIfNe _055E
	Release obj_partner_poke
	ApplyMovement obj_partner_poke, _06F0
	WaitMovement
	Lock obj_partner_poke
_055E:
	SetVar VAR_TEMP_x400A, 1
_0564:
	BufferPartyMonNick 0, VAR_SPECIAL_x8000
	BufferMoveName 1, VAR_SPECIAL_x8001
	NPCMsg msg_0538_T11R0702_00000
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0649
	GoTo _058A
	End

_058A:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CloseMsg
	PokemonSummaryScreen 1, VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	GetMoveSelection 1, VAR_SPECIAL_x8002
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_x8002, 4
	GoToIfEq _0628
	MonGetMove VAR_SPECIAL_RESULT, VAR_SPECIAL_x8000, VAR_SPECIAL_x8002
	BufferMoveName 1, VAR_SPECIAL_RESULT
	NPCMsg msg_0538_T11R0702_00003
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0649
	BufferPartyMonNick 0, VAR_SPECIAL_x8000
	MonGetMove VAR_SPECIAL_RESULT, VAR_SPECIAL_x8000, VAR_SPECIAL_x8002
	BufferMoveName 1, VAR_SPECIAL_RESULT
	NPCMsg msg_0538_T11R0702_00004
	PlaySE SEQ_SE_DP_KON
	WaitSE SEQ_SE_DP_KON
	Wait 30, VAR_SPECIAL_RESULT
	NPCMsg msg_0538_T11R0702_00005
	Wait 32, VAR_SPECIAL_RESULT
	BufferMoveName 1, VAR_SPECIAL_x8001
	NPCMsg msg_0538_T11R0702_00006
	PlayFanfare SEQ_ME_LVUP
	WaitFanfare
	Wait 16, VAR_SPECIAL_RESULT
	GoTo _0671
	End

_0628:
	BufferMoveName 1, VAR_SPECIAL_x8001
	NPCMsg msg_0538_T11R0702_00001
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _058A
	GoTo _0649
	End

_0649:
	BufferPartyMonNick 0, VAR_SPECIAL_x8000
	BufferMoveName 1, VAR_SPECIAL_x8001
	NPCMsg msg_0538_T11R0702_00002
	WaitButton
	Compare VAR_TEMP_x400A, 1
	CallIfEq _07BA
	NopVar490 VAR_TEMP_x400D
	GoTo _089C
	End

_0671:
	UpdateRotomForm VAR_SPECIAL_x8000, VAR_SPECIAL_x8002, VAR_SPECIAL_x8001, VAR_SPECIAL_x8004
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CloseMsg
	Compare VAR_SPECIAL_x8004, 1
	CallIfEq _06D2
	Compare VAR_SPECIAL_x8004, 4
	CallIfEq _06D8
	Compare VAR_SPECIAL_x8004, 3
	CallIfEq _06DE
	Compare VAR_SPECIAL_x8004, 2
	CallIfEq _06E4
	Compare VAR_SPECIAL_x8004, 5
	CallIfEq _06EA
	GoTo _02C1
	End

_06D2:
	HidePerson obj_T11R0702_rotomf
	Return

_06D8:
	HidePerson obj_T11R0702_rotoms
	Return

_06DE:
	HidePerson obj_T11R0702_rotomi
	Return

_06E4:
	HidePerson obj_T11R0702_rotomw
	Return

_06EA:
	HidePerson obj_T11R0702_rotomg
	Return

	.balign 4, 0
_06F0:
	JumpOnSpotSlowSouth 2
	SetInvisible
	EndMovement

_06FC:
	SetVar VAR_SPECIAL_x8001, 315
	Return

_0704:
	SetVar VAR_SPECIAL_x8001, 59
	Return

_070C:
	SetVar VAR_SPECIAL_x8001, 56
	Return

_0714:
	SetVar VAR_SPECIAL_x8001, 403
	Return

_071C:
	SetVar VAR_SPECIAL_x8001, 437
	Return

_0724:
	NPCMsg msg_0538_T11R0702_00021
	Return

_0729:
	NPCMsg msg_0538_T11R0702_00024
	Return

_072E:
	NPCMsg msg_0538_T11R0702_00027
	Return

_0733:
	NPCMsg msg_0538_T11R0702_00030
	Return

_0738:
	NPCMsg msg_0538_T11R0702_00033
	Return

_073D:
	Compare VAR_SPECIAL_x8004, 1
	CallIfEq _0797
	Compare VAR_SPECIAL_x8004, 3
	CallIfEq _079E
	Compare VAR_SPECIAL_x8004, 2
	CallIfEq _07A5
	Compare VAR_SPECIAL_x8004, 4
	CallIfEq _07AC
	Compare VAR_SPECIAL_x8004, 5
	CallIfEq _07B3
	Compare VAR_TEMP_x400A, 1
	CallIfEq _07BA
	NopVar490 VAR_TEMP_x4006
	GoTo _089C
	End

_0797:
	NPCMsg msg_0538_T11R0702_00022
	WaitButton
	Return

_079E:
	NPCMsg msg_0538_T11R0702_00025
	WaitButton
	Return

_07A5:
	NPCMsg msg_0538_T11R0702_00028
	WaitButton
	Return

_07AC:
	NPCMsg msg_0538_T11R0702_00031
	WaitButton
	Return

_07B3:
	NPCMsg msg_0538_T11R0702_00034
	WaitButton
	Return

_07BA:
	Release obj_partner_poke
	ApplyMovement obj_partner_poke, _07D0
	WaitMovement
	Lock obj_partner_poke
	Return

	.balign 4, 0
_07D0:
	SetVisible
	EndMovement

_07D8:
	Compare VAR_SPECIAL_x8004, 1
	CallIfEq _0821
	Compare VAR_SPECIAL_x8004, 3
	CallIfEq _0826
	Compare VAR_SPECIAL_x8004, 2
	CallIfEq _082B
	Compare VAR_SPECIAL_x8004, 4
	CallIfEq _0830
	Compare VAR_SPECIAL_x8004, 5
	CallIfEq _0835
	GoTo _089C
	End

_0821:
	NPCMsg msg_0538_T11R0702_00020
	Return

_0826:
	NPCMsg msg_0538_T11R0702_00023
	Return

_082B:
	NPCMsg msg_0538_T11R0702_00026
	Return

_0830:
	NPCMsg msg_0538_T11R0702_00029
	Return

_0835:
	NPCMsg msg_0538_T11R0702_00032
	Return

scr_seq_T11R0702_007:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	CountTranformedRotomsInParty VAR_SPECIAL_x8003, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_x8003, 0
	GoToIfEq _088D
	NPCMsg msg_0538_T11R0702_00013
	TouchscreenMenuHide
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 14, 255, 0
	MenuItemAdd 19, 255, 1
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0231
	GoTo _089C
	End

_088D:
	NPCMsg msg_0538_T11R0702_00018
	WaitButton
	CloseMsg
	GoTo _08A4
	End

_089C:
	TouchscreenMenuShow
	CloseMsg
	ReleaseAll
	End

_08A4:
	ReleaseAll
	End

scr_seq_T11R0702_000:
	SimpleNPCMsg msg_0538_T11R0702_00035
	End
	.balign 4, 0
