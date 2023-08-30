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

	scrdef scr_seq_D37R0104_000
	scrdef scr_seq_D37R0104_001
	scrdef scr_seq_D37R0104_002
	scrdef scr_seq_D37R0104_003
	scrdef scr_seq_D37R0104_004
	scrdef scr_seq_D37R0104_005
	scrdef scr_seq_D37R0104_006
	scrdef_end

scr_seq_D37R0104_006:
	setflag FLAG_HIDE_ROCKET_TAKEOVER_1
	compare VAR_SCENE_ROCKET_TAKEOVER, 4
	goto_if_ne _0033
	clearflag FLAG_HIDE_ROCKET_TAKEOVER_1
_0033:
	setvar VAR_TEMP_x4000, GATE_OPEN
	setvar VAR_TEMP_x4001, GATE_OPEN
	setvar VAR_TEMP_x4002, GATE_CLOSED
	setvar VAR_TEMP_x4003, GATE_OPEN
	setvar VAR_TEMP_x4004, GATE_OPEN
	setvar VAR_TEMP_x4005, GATE_OPEN
	setvar VAR_TEMP_x4006, GATE_OPEN
	setvar VAR_TEMP_x4007, GATE_OPEN
	setvar VAR_TEMP_x4008, GATE_OPEN
	setvar VAR_TEMP_x4009, GATE_CLOSED
	end

scr_seq_D37R0104_005:
	scrcmd_375 obj_D37R0104_stop_3
	scrcmd_375 obj_D37R0104_stop_2
	scrcmd_375 obj_D37R0104_stop
	scrcmd_375 obj_D37R0104_stop_4
	scrcmd_375 obj_D37R0104_stop_5
	scrcmd_375 obj_D37R0104_stop_6
	goto_if_set FLAG_OPENED_GOLDENROD_PURPLE_GATE, _open_purple_gate
	end

_open_purple_gate:
	move_person_facing obj_D37R0104_purplegate_left, 18, 0, 14, DIR_NORTH
	move_person_facing obj_D37R0104_purplegate_right, 24, 0, 14, DIR_NORTH
	move_person_facing obj_D37R0104_stop_6, 24, 0, 14, DIR_NORTH
	end

; Press the red switch.
scr_seq_D37R0104_002:
	scrcmd_609
	lockall
	play_se SEQ_SE_GS_ZUKAN06
	compare VAR_TEMP_x4001, GATE_OPEN
	goto_if_ne _00F5
	apply_movement obj_D37R0104_gate1_left, _05CC
	apply_movement obj_D37R0104_gate1_right, _05D4
	apply_movement obj_D37R0104_stop_2, _060C
	setvar VAR_TEMP_x4001, GATE_CLOSED
	goto _0113
_00F5:
	apply_movement obj_D37R0104_gate1_left, _05DC
	apply_movement obj_D37R0104_gate1_right, _05E4
	apply_movement obj_D37R0104_stop_2, _0614
	setvar VAR_TEMP_x4001, GATE_OPEN
	; fallthrough

_0113:
	compare VAR_TEMP_x4003, GATE_OPEN
	goto_if_ne _013C
	apply_movement obj_D37R0104_gate3_top, _05EC
	apply_movement obj_D37R0104_gate3_bottom, _05F4
	setvar VAR_TEMP_x4003, GATE_CLOSED
	goto _0152
_013C:
	apply_movement obj_D37R0104_gate3_top, _05FC
	apply_movement obj_D37R0104_gate3_bottom, _0604
	setvar VAR_TEMP_x4003, GATE_OPEN
	; fallthrough

_0152:
	compare VAR_TEMP_x4005, GATE_OPEN
	goto_if_ne _0183
	apply_movement obj_D37R0104_gate5_left, _05CC
	apply_movement obj_D37R0104_gate5_right, _05D4
	apply_movement obj_D37R0104_stop_4, _060C
	setvar VAR_TEMP_x4005, GATE_CLOSED
	goto _01A1
_0183:
	apply_movement obj_D37R0104_gate5_left, _05DC
	apply_movement obj_D37R0104_gate5_right, _05E4
	apply_movement obj_D37R0104_stop_4, _0614
	setvar VAR_TEMP_x4005, GATE_OPEN
	; fallthrough

_01A1:
	compare VAR_TEMP_x4006, GATE_OPEN
	goto_if_ne _01D2
	apply_movement obj_D37R0104_gate6_left, _05CC
	apply_movement obj_D37R0104_gate6_right, _05D4
	apply_movement obj_D37R0104_stop_5, _060C
	setvar VAR_TEMP_x4006, GATE_CLOSED
	goto _01F0
_01D2:
	apply_movement obj_D37R0104_gate6_left, _05DC
	apply_movement obj_D37R0104_gate6_right, _05E4
	apply_movement obj_D37R0104_stop_5, _0614
	setvar VAR_TEMP_x4006, GATE_OPEN
	; fallthrough

_01F0:
	compare VAR_TEMP_x4007, GATE_OPEN
	goto_if_ne _0219
	apply_movement obj_D37R0104_gate7_top, _05EC
	apply_movement obj_D37R0104_gate7_bottom, _05F4
	setvar VAR_TEMP_x4007, GATE_CLOSED
	goto _022F
_0219:
	apply_movement obj_D37R0104_gate7_top, _05FC
	apply_movement obj_D37R0104_gate7_bottom, _0604
	setvar VAR_TEMP_x4007, GATE_OPEN
	; fallthrough

_022F:
	compare VAR_TEMP_x4008, GATE_OPEN
	goto_if_ne _0258
	apply_movement obj_D37R0104_gate8_top, _05EC
	apply_movement obj_D37R0104_gate8_bottom, _05F4
	setvar VAR_TEMP_x4008, GATE_CLOSED
	goto _026E
_0258:
	apply_movement obj_D37R0104_gate8_top, _05FC
	apply_movement obj_D37R0104_gate8_bottom, _0604
	setvar VAR_TEMP_x4008, GATE_OPEN
	; fallthrough

_026E:
	wait_movement
	releaseall
	end

; Press the green switch.
scr_seq_D37R0104_001:
	scrcmd_609
	lockall
	play_se SEQ_SE_GS_ZUKAN06
	compare VAR_TEMP_x4000, GATE_OPEN
	goto_if_ne _02AD
	apply_movement obj_D37R0104_gate0_left, _05CC
	apply_movement obj_D37R0104_gate0_right, _05D4
	apply_movement obj_D37R0104_stop_3, _060C
	setvar VAR_TEMP_x4000, GATE_CLOSED
	goto _02CB
_02AD:
	apply_movement obj_D37R0104_gate0_left, _05DC
	apply_movement obj_D37R0104_gate0_right, _05E4
	apply_movement obj_D37R0104_stop_3, _0614
	setvar VAR_TEMP_x4000, GATE_OPEN
	; fallthrough

_02CB:
	compare VAR_TEMP_x4002, GATE_OPEN
	goto_if_ne _02F4
	apply_movement obj_D37R0104_gate2_top, _05EC
	apply_movement obj_D37R0104_gate2_bottom, _05F4
	setvar VAR_TEMP_x4002, GATE_CLOSED
	goto _030A
_02F4:
	apply_movement obj_D37R0104_gate2_top, _05FC
	apply_movement obj_D37R0104_gate2_bottom, _0604
	setvar VAR_TEMP_x4002, GATE_OPEN
	; fallthrough

_030A:
	compare VAR_TEMP_x4004, GATE_OPEN
	goto_if_ne _033B
	apply_movement obj_D37R0104_gate4_left, _05CC
	apply_movement obj_D37R0104_gate4_right, _05D4
	apply_movement obj_D37R0104_stop, _060C
	setvar VAR_TEMP_x4004, GATE_CLOSED
	goto _0359
_033B:
	apply_movement obj_D37R0104_gate4_left, _05DC
	apply_movement obj_D37R0104_gate4_right, _05E4
	apply_movement obj_D37R0104_stop, _0614
	setvar VAR_TEMP_x4004, GATE_OPEN
	; fallthrough

_0359:
	compare VAR_TEMP_x4006, GATE_OPEN
	goto_if_ne _038A
	apply_movement obj_D37R0104_gate6_left, _05CC
	apply_movement obj_D37R0104_gate6_right, _05D4
	apply_movement obj_D37R0104_stop_5, _060C
	setvar VAR_TEMP_x4006, GATE_CLOSED
	goto _03A8
_038A:
	apply_movement obj_D37R0104_gate6_left, _05DC
	apply_movement obj_D37R0104_gate6_right, _05E4
	apply_movement obj_D37R0104_stop_5, _0614
	setvar VAR_TEMP_x4006, GATE_OPEN
	; fallthrough

_03A8:
	compare VAR_TEMP_x4008, GATE_OPEN
	goto_if_ne _03D1
	apply_movement obj_D37R0104_gate8_top, _05EC
	apply_movement obj_D37R0104_gate8_bottom, _05F4
	setvar VAR_TEMP_x4008, GATE_CLOSED
	goto _03E7
_03D1:
	apply_movement obj_D37R0104_gate8_top, _05FC
	apply_movement obj_D37R0104_gate8_bottom, _0604
	setvar VAR_TEMP_x4008, GATE_OPEN
	; fallthrough

_03E7:
	compare VAR_TEMP_x4009, GATE_OPEN
	goto_if_ne _0410
	apply_movement obj_D37R0104_gate9_top, _05EC
	apply_movement obj_D37R0104_gate9_bottom, _05F4
	setvar VAR_TEMP_x4009, GATE_CLOSED
	goto _0426
_0410:
	apply_movement obj_D37R0104_gate9_top, _05FC
	apply_movement obj_D37R0104_gate9_bottom, _0604
	setvar VAR_TEMP_x4009, GATE_OPEN
	; fallthrough

_0426:
	wait_movement
	releaseall
	end

; Press the blue switch.
scr_seq_D37R0104_000:
	scrcmd_609
	lockall
	play_se SEQ_SE_GS_ZUKAN06
	compare VAR_TEMP_x4002, GATE_OPEN
	goto_if_ne _045D
	apply_movement obj_D37R0104_gate2_top, _05EC
	apply_movement obj_D37R0104_gate2_bottom, _05F4
	setvar VAR_TEMP_x4002, GATE_CLOSED
	goto _0473
_045D:
	apply_movement obj_D37R0104_gate2_top, _05FC
	apply_movement obj_D37R0104_gate2_bottom, _0604
	setvar VAR_TEMP_x4002, GATE_OPEN
	; fallthrough

_0473:
	compare VAR_TEMP_x4003, GATE_OPEN
	goto_if_ne _049C
	apply_movement obj_D37R0104_gate3_top, _05EC
	apply_movement obj_D37R0104_gate3_bottom, _05F4
	setvar VAR_TEMP_x4003, GATE_CLOSED
	goto _04B2
_049C:
	apply_movement obj_D37R0104_gate3_top, _05FC
	apply_movement obj_D37R0104_gate3_bottom, _0604
	setvar VAR_TEMP_x4003, GATE_OPEN
	; fallthrough

_04B2:
	compare VAR_TEMP_x4004, GATE_OPEN
	goto_if_ne _04E3
	apply_movement obj_D37R0104_gate4_left, _05CC
	apply_movement obj_D37R0104_gate4_right, _05D4
	apply_movement obj_D37R0104_stop, _060C
	setvar VAR_TEMP_x4004, GATE_CLOSED
	goto _0501
_04E3:
	apply_movement obj_D37R0104_gate4_left, _05DC
	apply_movement obj_D37R0104_gate4_right, _05E4
	apply_movement obj_D37R0104_stop, _0614
	setvar VAR_TEMP_x4004, GATE_OPEN
	; fallthrough

_0501:
	compare VAR_TEMP_x4005, GATE_OPEN
	goto_if_ne _0532
	apply_movement obj_D37R0104_gate5_left, _05CC
	apply_movement obj_D37R0104_gate5_right, _05D4
	apply_movement obj_D37R0104_stop_4, _060C
	setvar VAR_TEMP_x4005, GATE_CLOSED
	goto _0550
_0532:
	apply_movement obj_D37R0104_gate5_left, _05DC
	apply_movement obj_D37R0104_gate5_right, _05E4
	apply_movement obj_D37R0104_stop_4, _0614
	setvar VAR_TEMP_x4005, GATE_OPEN
	; fallthrough

_0550:
	compare VAR_TEMP_x4007, GATE_OPEN
	goto_if_ne _0579
	apply_movement obj_D37R0104_gate7_top, _05EC
	apply_movement obj_D37R0104_gate7_bottom, _05F4
	setvar VAR_TEMP_x4007, GATE_CLOSED
	goto _058F
_0579:
	apply_movement obj_D37R0104_gate7_top, _05FC
	apply_movement obj_D37R0104_gate7_bottom, _0604
	setvar VAR_TEMP_x4007, GATE_OPEN
	; fallthrough

_058F:
	wait_movement
	releaseall
	end

; Press the purple switch.
scr_seq_D37R0104_003:
	goto_if_set FLAG_OPENED_GOLDENROD_PURPLE_GATE, _05CA
	scrcmd_609
	lockall
	play_se SEQ_SE_GS_ZUKAN06
	apply_movement obj_D37R0104_purplegate_left, _05DC
	apply_movement obj_D37R0104_purplegate_right, _05E4
	apply_movement obj_D37R0104_stop_6, _0614
	wait_movement
	setflag FLAG_OPENED_GOLDENROD_PURPLE_GATE
	releaseall
	end

_05CA:
	end


_05CC:
	step 15, 2
	step_end

_05D4:
	step 14, 2
	step_end

_05DC:
	step 14, 2
	step_end

_05E4:
	step 15, 2
	step_end

_05EC:
	step 13, 2
	step_end

_05F4:
	step 12, 2
	step_end

_05FC:
	step 12, 2
	step_end

_0604:
	step 13, 2
	step_end

_060C:
	step 15, 2
	step_end

_0614:
	step 14, 2
	step_end
scr_seq_D37R0104_004:
	scrcmd_609
	lockall
	callstd std_play_rival_intro_music
	move_person_facing obj_D37R0104_gsrivel, 28, 0, 4, DIR_WEST
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_D37R0104_gsrivel, _06E0
	apply_movement obj_player, _06F4
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	buffer_rivals_name 0
	npc_msg msg_0119_D37R0104_00000
	closemsg
	get_starter_choice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 152
	goto_if_ne _067D
	trainer_battle TRAINER_RIVAL_SILVER_18, 0, 0, 0
	goto _06A0

_067D:
	compare VAR_SPECIAL_RESULT, 155
	goto_if_ne _0698
	trainer_battle TRAINER_RIVAL_SILVER_12, 0, 0, 0
	goto _06A0

_0698:
	trainer_battle TRAINER_RIVAL_SILVER_17, 0, 0, 0
_06A0:
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _06D9
	callstd std_play_rival_outro_music
	buffer_rivals_name 0
	npc_msg msg_0119_D37R0104_00001
	closemsg
	setvar VAR_UNK_40A0, 1
	apply_movement obj_D37R0104_gsrivel, _0700
	wait_movement
	hide_person obj_D37R0104_gsrivel
	callstd std_fade_end_rival_outro_music
	releaseall
	end

_06D9:
	white_out
	releaseall
	end
	.byte 0x00

_06E0:
	step 62, 6
	step 14, 3
	step 13, 1
	step 14, 4
	step_end

_06F4:
	step 75, 1
	step 15, 1
	step_end

_0700:
	step 15, 4
	step 12, 1
	step 15, 4
	step_end
	.balign 4, 0
