#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T29R0201.h"
#include "msgdata/msg/msg_0628_T29R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T29R0201_000
	ScrDefEnd

scr_seq_T29R0201_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_RED_GYARADOS_MEET, _003A
	GoToIfSet FLAG_UNK_0C8, _002F
	NPCMsg msg_0628_T29R0201_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_002F:
	NPCMsg msg_0628_T29R0201_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_003A:
	ScriptOverlayCmd 0, 0
	PlayerHasSpecies VAR_SPECIAL_RESULT, SPECIES_MAGIKARP
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _005A
	NPCMsg msg_0628_T29R0201_00002
	GoTo _0146

_005A:
	NPCMsg msg_0628_T29R0201_00003
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	PartySelectUI
	GetPartySelection VAR_SPECIAL_x8002
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_x8002, 255
	GoToIfNe _0095
	NPCMsg msg_0628_T29R0201_00010
	GoTo _0146

_0095:
	GetPartyMonSpecies VAR_SPECIAL_x8002, VAR_SPECIAL_x8001
	Compare VAR_SPECIAL_x8001, 129
	GoToIfEq _00B1
	NPCMsg msg_0628_T29R0201_00008
	GoTo _0146

_00B1:
	SizeRecordCompare VAR_SPECIAL_RESULT, VAR_SPECIAL_x8002
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _00E3
	BufferMonSize 0, 1, VAR_SPECIAL_x8002
	BufferRecordSize 2, 3, SPECIES_MAGIKARP
	NPCMsg msg_0628_T29R0201_00007
	GoTo _0146

_00DD:
	GoTo _0101

_00E3:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0101
	BufferRecordSize 0, 1, SPECIES_MAGIKARP
	NPCMsg msg_0628_T29R0201_00006
	GoTo _0146

_0101:
	BufferMonSize 0, 1, VAR_SPECIAL_x8002
	NPCMsg msg_0628_T29R0201_00004
	SetVar VAR_SPECIAL_x8004, 38
	SetVar VAR_SPECIAL_x8005, 1
	HasSpaceForItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0137
	CallStd std_bag_is_full
	GoTo _0148

_0137:
	CallStd std_give_item_verbose
	SizeRecordUpdate VAR_SPECIAL_x8002
	SetFlag FLAG_UNK_139
	NPCMsg msg_0628_T29R0201_00005
_0146:
	WaitButton
_0148:
	CloseMsg
	ScriptOverlayCmd 0, 1
	ReleaseAll
	End
	.balign 4, 0
