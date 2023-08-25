#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0206.h"
#include "msgdata/msg/msg_0506_T07R0206.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T07R0206_000
	scrdef_end

scr_seq_T07R0206_000:
	scrcmd_609
	lockall
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0058
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _002A
	end

_002A:
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_player, _0340
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	apply_movement obj_partner_poke, _034C
	wait_movement
	goto _0062

_0058:
	apply_movement obj_player, _0340
	wait_movement
_0062:
	get_dynamic_warp_floor_no VAR_ELEVATOR_LAST_FLOOR
	switch VAR_ELEVATOR_LAST_FLOOR
	case 3, _0095
	case 2, _00A0
	case 0, _00AA
	end

_0095:
	buffer_int 0, 0
	goto _00B4

_00A0:
	buffer_dept_store_floor_no 0, 3
	goto _00B4

_00AA:
	buffer_dept_store_floor_no 0, 1
	goto _00B4

_00B4:
	elevator_cur_floor_box 20, 1, VAR_ELEVATOR_LAST_FLOOR, VAR_ELEVATOR_LAST_FLOOR
	npc_msg msg_0506_T07R0206_00000
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 116, 255, 0
	menu_item_add 118, 255, 1
	menu_item_add 125, 255, 2
	menu_item_add 126, 255, 3
	menu_exec
	touchscreen_menu_show
	switch VAR_SPECIAL_RESULT
	case 0, _0120
	case 1, _019B
	case 2, _0216
	goto _0322

_0120:
	wait 1, VAR_SPECIAL_RESULT
	get_dynamic_warp_floor_no VAR_ELEVATOR_LAST_FLOOR
	set_dynamic_warp MAP_T07R0201, 2, 5, 3, 1
	compare VAR_ELEVATOR_LAST_FLOOR, 0
	goto_if_eq _0305
	compare VAR_ELEVATOR_LAST_FLOOR, 0
	call_if_gt _029C
	compare VAR_ELEVATOR_LAST_FLOOR, 0
	call_if_lt _0291
	compare VAR_ELEVATOR_LAST_FLOOR, 2
	goto_if_ne _0176
	setvar VAR_SPECIAL_x8005, 2
	goto _0189

_0176:
	compare VAR_ELEVATOR_LAST_FLOOR, 3
	goto_if_ne _0189
	setvar VAR_SPECIAL_x8005, 3
_0189:
	call _02A7
	setvar VAR_ELEVATOR_LAST_FLOOR, 0
	goto _02BB

_019B:
	wait 1, VAR_SPECIAL_RESULT
	get_dynamic_warp_floor_no VAR_ELEVATOR_LAST_FLOOR
	set_dynamic_warp MAP_T07R0203, 0, 5, 3, 1
	compare VAR_ELEVATOR_LAST_FLOOR, 2
	goto_if_eq _0305
	compare VAR_ELEVATOR_LAST_FLOOR, 2
	call_if_gt _029C
	compare VAR_ELEVATOR_LAST_FLOOR, 2
	call_if_lt _0291
	compare VAR_ELEVATOR_LAST_FLOOR, 0
	goto_if_ne _01F1
	setvar VAR_SPECIAL_x8005, 2
	goto _0204

_01F1:
	compare VAR_ELEVATOR_LAST_FLOOR, 3
	goto_if_ne _0204
	setvar VAR_SPECIAL_x8005, 1
_0204:
	call _02A7
	setvar VAR_ELEVATOR_LAST_FLOOR, 2
	goto _02BB

_0216:
	wait 1, VAR_SPECIAL_RESULT
	get_dynamic_warp_floor_no VAR_ELEVATOR_LAST_FLOOR
	set_dynamic_warp MAP_T07R0204, 1, 5, 3, 1
	compare VAR_ELEVATOR_LAST_FLOOR, 3
	goto_if_eq _0305
	compare VAR_ELEVATOR_LAST_FLOOR, 3
	call_if_gt _029C
	compare VAR_ELEVATOR_LAST_FLOOR, 3
	call_if_lt _0291
	compare VAR_ELEVATOR_LAST_FLOOR, 0
	goto_if_ne _026C
	setvar VAR_SPECIAL_x8005, 3
	goto _027F

_026C:
	compare VAR_ELEVATOR_LAST_FLOOR, 2
	goto_if_ne _027F
	setvar VAR_SPECIAL_x8005, 1
_027F:
	call _02A7
	setvar VAR_ELEVATOR_LAST_FLOOR, 3
	goto _02BB

_0291:
	npc_msg msg_0506_T07R0206_00002
	setvar VAR_SPECIAL_x8004, 0
	return

_029C:
	npc_msg msg_0506_T07R0206_00003
	setvar VAR_SPECIAL_x8004, 1
	return

_02A7:
	setvar VAR_ELEVATOR_LAST_FLOOR, 65535
	closemsg
	wait_se SEQ_SE_DP_SELECT
	elevator_anim VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	return

_02BB:
	switch VAR_ELEVATOR_LAST_FLOOR
	case 3, _02EA
	case 2, _02F3
	case 0, _02FC
	end

_02EA:
	npc_msg msg_0506_T07R0206_00007
	goto _032E

_02F3:
	npc_msg msg_0506_T07R0206_00006
	goto _032E

_02FC:
	npc_msg msg_0506_T07R0206_00005
	goto _032E

_0305:
	setvar VAR_ELEVATOR_LAST_FLOOR, 65535
	wait 1, VAR_SPECIAL_RESULT
	npc_msg msg_0506_T07R0206_00004
	wait_button_or_walk_away
	closemsg
	setvar VAR_UNK_4125, 1
	releaseall
	end

_0322:
	setvar VAR_ELEVATOR_LAST_FLOOR, 65535
	wait 1, VAR_SPECIAL_RESULT
_032E:
	npc_msg msg_0506_T07R0206_00001
	wait_button_or_walk_away
	closemsg
	setvar VAR_UNK_4125, 1
	releaseall
	end
	.byte 0x00

_0340:
	step 12, 2
	step 33, 1
	step_end

_034C:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
	.balign 4, 0
