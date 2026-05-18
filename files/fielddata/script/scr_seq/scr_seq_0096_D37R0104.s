; Goldenrod Tunnel B2F

; Puzzle:
;   When you hit a red, green, or blue switch, any gate bordering a room of that
;   color will open if closed, or close if open.

; Gate diagram:
;  - Each gate has an index
;  - The room color is noted by a lowercase letter {r,g,b,p}
;
; [ ]--0--[ ]-----[ ]--1--[ ]
;  |       |       |       |
;  |   g   2   b   3   r   |
;  |       |       |       |
; [ ]--4--[ ]--5--[ ]--6--[ ]-----[ ]
;  |       |       |       |
;  |   b   7   r   8   g   9   p
;  |       |       |       |
; [ ]-----[ ]-----[ ]-----[ ]

; There are temp variables indicating whether each gate is open or closed. The
; temp variable corresponds to the gate's index, (e.g. gate 2 uses
; VAR_TEMP_x4002).

#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D37R0104.h"
#include "msgdata/msg/msg_0119_D37R0104.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D37R0104_000
	ScrDef scr_seq_D37R0104_001
	ScrDef scr_seq_D37R0104_002
	ScrDef scr_seq_D37R0104_003
	ScrDef scr_seq_D37R0104_004
	ScrDef scr_seq_D37R0104_005
	ScrDef scr_seq_D37R0104_006
	ScrDefEnd

scr_seq_D37R0104_006:
	SetFlag FLAG_HIDE_ROCKET_TAKEOVER_1
	Compare VAR_SCENE_ROCKET_TAKEOVER, 4
	GoToIfNe _0033
	ClearFlag FLAG_HIDE_ROCKET_TAKEOVER_1
_0033:
	SetVar VAR_TEMP_x4000, GATE_OPEN
	SetVar VAR_TEMP_x4001, GATE_OPEN
	SetVar VAR_TEMP_x4002, GATE_CLOSED
	SetVar VAR_TEMP_x4003, GATE_OPEN
	SetVar VAR_TEMP_x4004, GATE_OPEN
	SetVar VAR_TEMP_x4005, GATE_OPEN
	SetVar VAR_TEMP_x4006, GATE_OPEN
	SetVar VAR_TEMP_x4007, GATE_OPEN
	SetVar VAR_TEMP_x4008, GATE_OPEN
	SetVar VAR_TEMP_x4009, GATE_CLOSED
	End

scr_seq_D37R0104_005:
	MakeObjectVisible obj_D37R0104_stop_3
	MakeObjectVisible obj_D37R0104_stop_2
	MakeObjectVisible obj_D37R0104_stop
	MakeObjectVisible obj_D37R0104_stop_4
	MakeObjectVisible obj_D37R0104_stop_5
	MakeObjectVisible obj_D37R0104_stop_6
	GoToIfSet FLAG_OPENED_GOLDENROD_PURPLE_GATE, _open_purple_gate
	End

_open_purple_gate:
	MovePersonFacing obj_D37R0104_purplegate_left, 18, 0, 14, DIR_NORTH
	MovePersonFacing obj_D37R0104_purplegate_right, 24, 0, 14, DIR_NORTH
	MovePersonFacing obj_D37R0104_stop_6, 24, 0, 14, DIR_NORTH
	End

; Press the red switch.
scr_seq_D37R0104_002:
	ScrCmd_609
	LockAll
	PlaySE SEQ_SE_GS_ZUKAN06
	Compare VAR_TEMP_x4001, GATE_OPEN
	GoToIfNe _00F5
	ApplyMovement obj_D37R0104_gate1_left, _05CC
	ApplyMovement obj_D37R0104_gate1_right, _05D4
	ApplyMovement obj_D37R0104_stop_2, _060C
	SetVar VAR_TEMP_x4001, GATE_CLOSED
	GoTo _0113
_00F5:
	ApplyMovement obj_D37R0104_gate1_left, _05DC
	ApplyMovement obj_D37R0104_gate1_right, _05E4
	ApplyMovement obj_D37R0104_stop_2, _0614
	SetVar VAR_TEMP_x4001, GATE_OPEN
	; fallthrough

_0113:
	Compare VAR_TEMP_x4003, GATE_OPEN
	GoToIfNe _013C
	ApplyMovement obj_D37R0104_gate3_top, _05EC
	ApplyMovement obj_D37R0104_gate3_bottom, _05F4
	SetVar VAR_TEMP_x4003, GATE_CLOSED
	GoTo _0152
_013C:
	ApplyMovement obj_D37R0104_gate3_top, _05FC
	ApplyMovement obj_D37R0104_gate3_bottom, _0604
	SetVar VAR_TEMP_x4003, GATE_OPEN
	; fallthrough

_0152:
	Compare VAR_TEMP_x4005, GATE_OPEN
	GoToIfNe _0183
	ApplyMovement obj_D37R0104_gate5_left, _05CC
	ApplyMovement obj_D37R0104_gate5_right, _05D4
	ApplyMovement obj_D37R0104_stop_4, _060C
	SetVar VAR_TEMP_x4005, GATE_CLOSED
	GoTo _01A1
_0183:
	ApplyMovement obj_D37R0104_gate5_left, _05DC
	ApplyMovement obj_D37R0104_gate5_right, _05E4
	ApplyMovement obj_D37R0104_stop_4, _0614
	SetVar VAR_TEMP_x4005, GATE_OPEN
	; fallthrough

_01A1:
	Compare VAR_TEMP_x4006, GATE_OPEN
	GoToIfNe _01D2
	ApplyMovement obj_D37R0104_gate6_left, _05CC
	ApplyMovement obj_D37R0104_gate6_right, _05D4
	ApplyMovement obj_D37R0104_stop_5, _060C
	SetVar VAR_TEMP_x4006, GATE_CLOSED
	GoTo _01F0
_01D2:
	ApplyMovement obj_D37R0104_gate6_left, _05DC
	ApplyMovement obj_D37R0104_gate6_right, _05E4
	ApplyMovement obj_D37R0104_stop_5, _0614
	SetVar VAR_TEMP_x4006, GATE_OPEN
	; fallthrough

_01F0:
	Compare VAR_TEMP_x4007, GATE_OPEN
	GoToIfNe _0219
	ApplyMovement obj_D37R0104_gate7_top, _05EC
	ApplyMovement obj_D37R0104_gate7_bottom, _05F4
	SetVar VAR_TEMP_x4007, GATE_CLOSED
	GoTo _022F
_0219:
	ApplyMovement obj_D37R0104_gate7_top, _05FC
	ApplyMovement obj_D37R0104_gate7_bottom, _0604
	SetVar VAR_TEMP_x4007, GATE_OPEN
	; fallthrough

_022F:
	Compare VAR_TEMP_x4008, GATE_OPEN
	GoToIfNe _0258
	ApplyMovement obj_D37R0104_gate8_top, _05EC
	ApplyMovement obj_D37R0104_gate8_bottom, _05F4
	SetVar VAR_TEMP_x4008, GATE_CLOSED
	GoTo _026E
_0258:
	ApplyMovement obj_D37R0104_gate8_top, _05FC
	ApplyMovement obj_D37R0104_gate8_bottom, _0604
	SetVar VAR_TEMP_x4008, GATE_OPEN
	; fallthrough

_026E:
	WaitMovement
	ReleaseAll
	End

; Press the green switch.
scr_seq_D37R0104_001:
	ScrCmd_609
	LockAll
	PlaySE SEQ_SE_GS_ZUKAN06
	Compare VAR_TEMP_x4000, GATE_OPEN
	GoToIfNe _02AD
	ApplyMovement obj_D37R0104_gate0_left, _05CC
	ApplyMovement obj_D37R0104_gate0_right, _05D4
	ApplyMovement obj_D37R0104_stop_3, _060C
	SetVar VAR_TEMP_x4000, GATE_CLOSED
	GoTo _02CB
_02AD:
	ApplyMovement obj_D37R0104_gate0_left, _05DC
	ApplyMovement obj_D37R0104_gate0_right, _05E4
	ApplyMovement obj_D37R0104_stop_3, _0614
	SetVar VAR_TEMP_x4000, GATE_OPEN
	; fallthrough

_02CB:
	Compare VAR_TEMP_x4002, GATE_OPEN
	GoToIfNe _02F4
	ApplyMovement obj_D37R0104_gate2_top, _05EC
	ApplyMovement obj_D37R0104_gate2_bottom, _05F4
	SetVar VAR_TEMP_x4002, GATE_CLOSED
	GoTo _030A
_02F4:
	ApplyMovement obj_D37R0104_gate2_top, _05FC
	ApplyMovement obj_D37R0104_gate2_bottom, _0604
	SetVar VAR_TEMP_x4002, GATE_OPEN
	; fallthrough

_030A:
	Compare VAR_TEMP_x4004, GATE_OPEN
	GoToIfNe _033B
	ApplyMovement obj_D37R0104_gate4_left, _05CC
	ApplyMovement obj_D37R0104_gate4_right, _05D4
	ApplyMovement obj_D37R0104_stop, _060C
	SetVar VAR_TEMP_x4004, GATE_CLOSED
	GoTo _0359
_033B:
	ApplyMovement obj_D37R0104_gate4_left, _05DC
	ApplyMovement obj_D37R0104_gate4_right, _05E4
	ApplyMovement obj_D37R0104_stop, _0614
	SetVar VAR_TEMP_x4004, GATE_OPEN
	; fallthrough

_0359:
	Compare VAR_TEMP_x4006, GATE_OPEN
	GoToIfNe _038A
	ApplyMovement obj_D37R0104_gate6_left, _05CC
	ApplyMovement obj_D37R0104_gate6_right, _05D4
	ApplyMovement obj_D37R0104_stop_5, _060C
	SetVar VAR_TEMP_x4006, GATE_CLOSED
	GoTo _03A8
_038A:
	ApplyMovement obj_D37R0104_gate6_left, _05DC
	ApplyMovement obj_D37R0104_gate6_right, _05E4
	ApplyMovement obj_D37R0104_stop_5, _0614
	SetVar VAR_TEMP_x4006, GATE_OPEN
	; fallthrough

_03A8:
	Compare VAR_TEMP_x4008, GATE_OPEN
	GoToIfNe _03D1
	ApplyMovement obj_D37R0104_gate8_top, _05EC
	ApplyMovement obj_D37R0104_gate8_bottom, _05F4
	SetVar VAR_TEMP_x4008, GATE_CLOSED
	GoTo _03E7
_03D1:
	ApplyMovement obj_D37R0104_gate8_top, _05FC
	ApplyMovement obj_D37R0104_gate8_bottom, _0604
	SetVar VAR_TEMP_x4008, GATE_OPEN
	; fallthrough

_03E7:
	Compare VAR_TEMP_x4009, GATE_OPEN
	GoToIfNe _0410
	ApplyMovement obj_D37R0104_gate9_top, _05EC
	ApplyMovement obj_D37R0104_gate9_bottom, _05F4
	SetVar VAR_TEMP_x4009, GATE_CLOSED
	GoTo _0426
_0410:
	ApplyMovement obj_D37R0104_gate9_top, _05FC
	ApplyMovement obj_D37R0104_gate9_bottom, _0604
	SetVar VAR_TEMP_x4009, GATE_OPEN
	; fallthrough

_0426:
	WaitMovement
	ReleaseAll
	End

; Press the blue switch.
scr_seq_D37R0104_000:
	ScrCmd_609
	LockAll
	PlaySE SEQ_SE_GS_ZUKAN06
	Compare VAR_TEMP_x4002, GATE_OPEN
	GoToIfNe _045D
	ApplyMovement obj_D37R0104_gate2_top, _05EC
	ApplyMovement obj_D37R0104_gate2_bottom, _05F4
	SetVar VAR_TEMP_x4002, GATE_CLOSED
	GoTo _0473
_045D:
	ApplyMovement obj_D37R0104_gate2_top, _05FC
	ApplyMovement obj_D37R0104_gate2_bottom, _0604
	SetVar VAR_TEMP_x4002, GATE_OPEN
	; fallthrough

_0473:
	Compare VAR_TEMP_x4003, GATE_OPEN
	GoToIfNe _049C
	ApplyMovement obj_D37R0104_gate3_top, _05EC
	ApplyMovement obj_D37R0104_gate3_bottom, _05F4
	SetVar VAR_TEMP_x4003, GATE_CLOSED
	GoTo _04B2
_049C:
	ApplyMovement obj_D37R0104_gate3_top, _05FC
	ApplyMovement obj_D37R0104_gate3_bottom, _0604
	SetVar VAR_TEMP_x4003, GATE_OPEN
	; fallthrough

_04B2:
	Compare VAR_TEMP_x4004, GATE_OPEN
	GoToIfNe _04E3
	ApplyMovement obj_D37R0104_gate4_left, _05CC
	ApplyMovement obj_D37R0104_gate4_right, _05D4
	ApplyMovement obj_D37R0104_stop, _060C
	SetVar VAR_TEMP_x4004, GATE_CLOSED
	GoTo _0501
_04E3:
	ApplyMovement obj_D37R0104_gate4_left, _05DC
	ApplyMovement obj_D37R0104_gate4_right, _05E4
	ApplyMovement obj_D37R0104_stop, _0614
	SetVar VAR_TEMP_x4004, GATE_OPEN
	; fallthrough

_0501:
	Compare VAR_TEMP_x4005, GATE_OPEN
	GoToIfNe _0532
	ApplyMovement obj_D37R0104_gate5_left, _05CC
	ApplyMovement obj_D37R0104_gate5_right, _05D4
	ApplyMovement obj_D37R0104_stop_4, _060C
	SetVar VAR_TEMP_x4005, GATE_CLOSED
	GoTo _0550
_0532:
	ApplyMovement obj_D37R0104_gate5_left, _05DC
	ApplyMovement obj_D37R0104_gate5_right, _05E4
	ApplyMovement obj_D37R0104_stop_4, _0614
	SetVar VAR_TEMP_x4005, GATE_OPEN
	; fallthrough

_0550:
	Compare VAR_TEMP_x4007, GATE_OPEN
	GoToIfNe _0579
	ApplyMovement obj_D37R0104_gate7_top, _05EC
	ApplyMovement obj_D37R0104_gate7_bottom, _05F4
	SetVar VAR_TEMP_x4007, GATE_CLOSED
	GoTo _058F
_0579:
	ApplyMovement obj_D37R0104_gate7_top, _05FC
	ApplyMovement obj_D37R0104_gate7_bottom, _0604
	SetVar VAR_TEMP_x4007, GATE_OPEN
	; fallthrough

_058F:
	WaitMovement
	ReleaseAll
	End

; Press the purple switch.
scr_seq_D37R0104_003:
	GoToIfSet FLAG_OPENED_GOLDENROD_PURPLE_GATE, _05CA
	ScrCmd_609
	LockAll
	PlaySE SEQ_SE_GS_ZUKAN06
	ApplyMovement obj_D37R0104_purplegate_left, _05DC
	ApplyMovement obj_D37R0104_purplegate_right, _05E4
	ApplyMovement obj_D37R0104_stop_6, _0614
	WaitMovement
	SetFlag FLAG_OPENED_GOLDENROD_PURPLE_GATE
	ReleaseAll
	End

_05CA:
	End

	.balign 4, 0
_05CC:
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_05D4:
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_05DC:
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_05E4:
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_05EC:
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_05F4:
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_05FC:
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_0604:
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_060C:
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_0614:
	WalkNormalWest 2
	EndMovement

scr_seq_D37R0104_004:
	ScrCmd_609
	LockAll
	CallStd std_play_rival_intro_music
	MovePersonFacing obj_D37R0104_gsrivel, 28, 0, 4, DIR_WEST
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_D37R0104_gsrivel, _06E0
	ApplyMovement obj_player, _06F4
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	BufferRivalsName 0
	NPCMsg msg_0119_D37R0104_00000
	CloseMsg
	GetStarterChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 152
	GoToIfNe _067D
	TrainerBattle TRAINER_RIVAL_SILVER_18, 0, 0, 0
	GoTo _06A0

_067D:
	Compare VAR_SPECIAL_RESULT, 155
	GoToIfNe _0698
	TrainerBattle TRAINER_RIVAL_SILVER_12, 0, 0, 0
	GoTo _06A0

_0698:
	TrainerBattle TRAINER_RIVAL_SILVER_17, 0, 0, 0
_06A0:
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _06D9
	CallStd std_play_rival_outro_music
	BufferRivalsName 0
	NPCMsg msg_0119_D37R0104_00001
	CloseMsg
	SetVar VAR_UNK_40A0, 1
	ApplyMovement obj_D37R0104_gsrivel, _0700
	WaitMovement
	HidePerson obj_D37R0104_gsrivel
	CallStd std_fade_end_rival_outro_music
	ReleaseAll
	End

_06D9:
	WhiteOut
	ReleaseAll
	End

	.balign 4, 0
_06E0:
	Delay4 6
	WalkNormalWest 3
	WalkNormalSouth
	WalkNormalWest 4
	EndMovement

	.balign 4, 0
_06F4:
	EmoteExclamationMark
	WalkNormalEast
	EndMovement

	.balign 4, 0
_0700:
	WalkNormalEast 4
	WalkNormalNorth
	WalkNormalEast 4
	EndMovement
	.balign 4, 0
