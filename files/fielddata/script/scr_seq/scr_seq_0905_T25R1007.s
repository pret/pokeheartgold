#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R1007.h"
#include "msgdata/msg/msg_0598_T25R1007.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T25R1007_000
	scrdef_end

scr_seq_T25R1007_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_dynamic_warp_floor_no VAR_ELEVATOR_LAST_FLOOR
	switch VAR_ELEVATOR_LAST_FLOOR
	case 6, _0075
	case 5, _007F
	case 4, _0089
	case 3, _0093
	case 2, _009D
	case 1, _00A7
	case 0, _00B1
	end

_0075:
	buffer_dept_store_floor_no 0, 6
	goto _00BC

_007F:
	buffer_dept_store_floor_no 0, 5
	goto _00BC

_0089:
	buffer_dept_store_floor_no 0, 4
	goto _00BC

_0093:
	buffer_dept_store_floor_no 0, 3
	goto _00BC

_009D:
	buffer_dept_store_floor_no 0, 2
	goto _00BC

_00A7:
	buffer_dept_store_floor_no 0, 1
	goto _00BC

_00B1:
	buffer_int 0, 0
	goto _00BC

_00BC:
	elevator_cur_floor_box 20, 1, VAR_ELEVATOR_LAST_FLOOR, VAR_ELEVATOR_LAST_FLOOR
	npc_msg msg_0598_T25R1007_00000
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 121, 255, 6
	menu_item_add 120, 255, 0
	menu_item_add 119, 255, 1
	menu_item_add 118, 255, 2
	menu_item_add 117, 255, 3
	menu_item_add 116, 255, 4
	menu_item_add 122, 255, 5
	menu_item_add 126, 255, 7
	menu_exec
	touchscreen_menu_show
	switch VAR_SPECIAL_RESULT
	case 6, _05D7
	case 0, _04F8
	case 1, _0419
	case 2, _033A
	case 3, _025B
	case 4, _017C
	case 5, _06B6
	goto _0898

_017C:
	wait 1, VAR_SPECIAL_RESULT
	get_dynamic_warp_floor_no VAR_ELEVATOR_LAST_FLOOR
	set_dynamic_warp MAP_GOLDENROD_DEPARTMENT_STORE_1F, 2, 19, 3, 1
	compare VAR_ELEVATOR_LAST_FLOOR, 1
	goto_if_eq _0881
	compare VAR_ELEVATOR_LAST_FLOOR, 1
	call_if_gt _07A0
	compare VAR_ELEVATOR_LAST_FLOOR, 1
	call_if_lt _0795
	compare VAR_ELEVATOR_LAST_FLOOR, 2
	goto_if_ne _01D2
	setvar VAR_SPECIAL_x8005, 1
	goto _0249

_01D2:
	compare VAR_ELEVATOR_LAST_FLOOR, 3
	goto_if_ne _01EB
	setvar VAR_SPECIAL_x8005, 2
	goto _0249

_01EB:
	compare VAR_ELEVATOR_LAST_FLOOR, 4
	goto_if_ne _0204
	setvar VAR_SPECIAL_x8005, 3
	goto _0249

_0204:
	compare VAR_ELEVATOR_LAST_FLOOR, 5
	goto_if_ne _021D
	setvar VAR_SPECIAL_x8005, 4
	goto _0249

_021D:
	compare VAR_ELEVATOR_LAST_FLOOR, 6
	goto_if_ne _0236
	setvar VAR_SPECIAL_x8005, 5
	goto _0249

_0236:
	compare VAR_ELEVATOR_LAST_FLOOR, 0
	goto_if_ne _0249
	setvar VAR_SPECIAL_x8005, 1
_0249:
	call _07AB
	setvar VAR_ELEVATOR_LAST_FLOOR, 1
	goto _07C9

_025B:
	wait 1, VAR_SPECIAL_RESULT
	get_dynamic_warp_floor_no VAR_ELEVATOR_LAST_FLOOR
	set_dynamic_warp MAP_GOLDENROD_DEPARTMENT_STORE_2F, 2, 19, 3, 1
	compare VAR_ELEVATOR_LAST_FLOOR, 2
	goto_if_eq _0881
	compare VAR_ELEVATOR_LAST_FLOOR, 2
	call_if_gt _07A0
	compare VAR_ELEVATOR_LAST_FLOOR, 2
	call_if_lt _0795
	compare VAR_ELEVATOR_LAST_FLOOR, 1
	goto_if_ne _02B1
	setvar VAR_SPECIAL_x8005, 1
	goto _0328

_02B1:
	compare VAR_ELEVATOR_LAST_FLOOR, 3
	goto_if_ne _02CA
	setvar VAR_SPECIAL_x8005, 1
	goto _0328

_02CA:
	compare VAR_ELEVATOR_LAST_FLOOR, 4
	goto_if_ne _02E3
	setvar VAR_SPECIAL_x8005, 2
	goto _0328

_02E3:
	compare VAR_ELEVATOR_LAST_FLOOR, 5
	goto_if_ne _02FC
	setvar VAR_SPECIAL_x8005, 3
	goto _0328

_02FC:
	compare VAR_ELEVATOR_LAST_FLOOR, 6
	goto_if_ne _0315
	setvar VAR_SPECIAL_x8005, 4
	goto _0328

_0315:
	compare VAR_ELEVATOR_LAST_FLOOR, 0
	goto_if_ne _0328
	setvar VAR_SPECIAL_x8005, 2
_0328:
	call _07AB
	setvar VAR_ELEVATOR_LAST_FLOOR, 2
	goto _07C9

_033A:
	wait 1, VAR_SPECIAL_RESULT
	get_dynamic_warp_floor_no VAR_ELEVATOR_LAST_FLOOR
	set_dynamic_warp MAP_GOLDENROD_DEPARTMENT_STORE_3F, 2, 19, 3, 1
	compare VAR_ELEVATOR_LAST_FLOOR, 3
	goto_if_eq _0881
	compare VAR_ELEVATOR_LAST_FLOOR, 3
	call_if_gt _07A0
	compare VAR_ELEVATOR_LAST_FLOOR, 3
	call_if_lt _0795
	compare VAR_ELEVATOR_LAST_FLOOR, 1
	goto_if_ne _0390
	setvar VAR_SPECIAL_x8005, 2
	goto _0407

_0390:
	compare VAR_ELEVATOR_LAST_FLOOR, 2
	goto_if_ne _03A9
	setvar VAR_SPECIAL_x8005, 1
	goto _0407

_03A9:
	compare VAR_ELEVATOR_LAST_FLOOR, 4
	goto_if_ne _03C2
	setvar VAR_SPECIAL_x8005, 1
	goto _0407

_03C2:
	compare VAR_ELEVATOR_LAST_FLOOR, 5
	goto_if_ne _03DB
	setvar VAR_SPECIAL_x8005, 2
	goto _0407

_03DB:
	compare VAR_ELEVATOR_LAST_FLOOR, 6
	goto_if_ne _03F4
	setvar VAR_SPECIAL_x8005, 3
	goto _0407

_03F4:
	compare VAR_ELEVATOR_LAST_FLOOR, 0
	goto_if_ne _0407
	setvar VAR_SPECIAL_x8005, 3
_0407:
	call _07AB
	setvar VAR_ELEVATOR_LAST_FLOOR, 3
	goto _07C9

_0419:
	wait 1, VAR_SPECIAL_RESULT
	get_dynamic_warp_floor_no VAR_ELEVATOR_LAST_FLOOR
	set_dynamic_warp MAP_GOLDENROD_DEPARTMENT_STORE_4F, 2, 19, 3, 1
	compare VAR_ELEVATOR_LAST_FLOOR, 4
	goto_if_eq _0881
	compare VAR_ELEVATOR_LAST_FLOOR, 4
	call_if_gt _07A0
	compare VAR_ELEVATOR_LAST_FLOOR, 4
	call_if_lt _0795
	compare VAR_ELEVATOR_LAST_FLOOR, 1
	goto_if_ne _046F
	setvar VAR_SPECIAL_x8005, 3
	goto _04E6

_046F:
	compare VAR_ELEVATOR_LAST_FLOOR, 2
	goto_if_ne _0488
	setvar VAR_SPECIAL_x8005, 2
	goto _04E6

_0488:
	compare VAR_ELEVATOR_LAST_FLOOR, 3
	goto_if_ne _04A1
	setvar VAR_SPECIAL_x8005, 1
	goto _04E6

_04A1:
	compare VAR_ELEVATOR_LAST_FLOOR, 5
	goto_if_ne _04BA
	setvar VAR_SPECIAL_x8005, 1
	goto _04E6

_04BA:
	compare VAR_ELEVATOR_LAST_FLOOR, 6
	goto_if_ne _04D3
	setvar VAR_SPECIAL_x8005, 2
	goto _04E6

_04D3:
	compare VAR_ELEVATOR_LAST_FLOOR, 0
	goto_if_ne _04E6
	setvar VAR_SPECIAL_x8005, 4
_04E6:
	call _07AB
	setvar VAR_ELEVATOR_LAST_FLOOR, 4
	goto _07C9

_04F8:
	wait 1, VAR_SPECIAL_RESULT
	get_dynamic_warp_floor_no VAR_ELEVATOR_LAST_FLOOR
	set_dynamic_warp MAP_GOLDENROD_DEPARTMENT_STORE_5F, 2, 19, 3, 1
	compare VAR_ELEVATOR_LAST_FLOOR, 5
	goto_if_eq _0881
	compare VAR_ELEVATOR_LAST_FLOOR, 5
	call_if_gt _07A0
	compare VAR_ELEVATOR_LAST_FLOOR, 5
	call_if_lt _0795
	compare VAR_ELEVATOR_LAST_FLOOR, 1
	goto_if_ne _054E
	setvar VAR_SPECIAL_x8005, 4
	goto _05C5

_054E:
	compare VAR_ELEVATOR_LAST_FLOOR, 2
	goto_if_ne _0567
	setvar VAR_SPECIAL_x8005, 3
	goto _05C5

_0567:
	compare VAR_ELEVATOR_LAST_FLOOR, 3
	goto_if_ne _0580
	setvar VAR_SPECIAL_x8005, 2
	goto _05C5

_0580:
	compare VAR_ELEVATOR_LAST_FLOOR, 4
	goto_if_ne _0599
	setvar VAR_SPECIAL_x8005, 1
	goto _05C5

_0599:
	compare VAR_ELEVATOR_LAST_FLOOR, 6
	goto_if_ne _05B2
	setvar VAR_SPECIAL_x8005, 1
	goto _05C5

_05B2:
	compare VAR_ELEVATOR_LAST_FLOOR, 0
	goto_if_ne _05C5
	setvar VAR_SPECIAL_x8005, 5
_05C5:
	call _07AB
	setvar VAR_ELEVATOR_LAST_FLOOR, 5
	goto _07C9

_05D7:
	wait 1, VAR_SPECIAL_RESULT
	get_dynamic_warp_floor_no VAR_ELEVATOR_LAST_FLOOR
	set_dynamic_warp MAP_GOLDENROD_DEPARTMENT_STORE_6F, 1, 19, 3, 1
	compare VAR_ELEVATOR_LAST_FLOOR, 6
	goto_if_eq _0881
	compare VAR_ELEVATOR_LAST_FLOOR, 6
	call_if_gt _07A0
	compare VAR_ELEVATOR_LAST_FLOOR, 6
	call_if_lt _0795
	compare VAR_ELEVATOR_LAST_FLOOR, 1
	goto_if_ne _062D
	setvar VAR_SPECIAL_x8005, 5
	goto _06A4

_062D:
	compare VAR_ELEVATOR_LAST_FLOOR, 2
	goto_if_ne _0646
	setvar VAR_SPECIAL_x8005, 4
	goto _06A4

_0646:
	compare VAR_ELEVATOR_LAST_FLOOR, 3
	goto_if_ne _065F
	setvar VAR_SPECIAL_x8005, 3
	goto _06A4

_065F:
	compare VAR_ELEVATOR_LAST_FLOOR, 4
	goto_if_ne _0678
	setvar VAR_SPECIAL_x8005, 2
	goto _06A4

_0678:
	compare VAR_ELEVATOR_LAST_FLOOR, 5
	goto_if_ne _0691
	setvar VAR_SPECIAL_x8005, 1
	goto _06A4

_0691:
	compare VAR_ELEVATOR_LAST_FLOOR, 0
	goto_if_ne _06A4
	setvar VAR_SPECIAL_x8005, 6
_06A4:
	call _07AB
	setvar VAR_ELEVATOR_LAST_FLOOR, 6
	goto _07C9

_06B6:
	wait 1, VAR_SPECIAL_RESULT
	get_dynamic_warp_floor_no VAR_ELEVATOR_LAST_FLOOR
	set_dynamic_warp MAP_GOLDENROD_DEPARTMENT_STORE_BASEMENT, 1, 19, 3, 1
	compare VAR_ELEVATOR_LAST_FLOOR, 0
	goto_if_eq _0881
	compare VAR_ELEVATOR_LAST_FLOOR, 0
	call_if_gt _07A0
	compare VAR_ELEVATOR_LAST_FLOOR, 0
	call_if_lt _0795
	compare VAR_ELEVATOR_LAST_FLOOR, 1
	goto_if_ne _070C
	setvar VAR_SPECIAL_x8005, 1
	goto _0783

_070C:
	compare VAR_ELEVATOR_LAST_FLOOR, 2
	goto_if_ne _0725
	setvar VAR_SPECIAL_x8005, 2
	goto _0783

_0725:
	compare VAR_ELEVATOR_LAST_FLOOR, 3
	goto_if_ne _073E
	setvar VAR_SPECIAL_x8005, 3
	goto _0783

_073E:
	compare VAR_ELEVATOR_LAST_FLOOR, 4
	goto_if_ne _0757
	setvar VAR_SPECIAL_x8005, 4
	goto _0783

_0757:
	compare VAR_ELEVATOR_LAST_FLOOR, 5
	goto_if_ne _0770
	setvar VAR_SPECIAL_x8005, 5
	goto _0783

_0770:
	compare VAR_ELEVATOR_LAST_FLOOR, 6
	goto_if_ne _0783
	setvar VAR_SPECIAL_x8005, 6
_0783:
	call _07AB
	setvar VAR_ELEVATOR_LAST_FLOOR, 0
	goto _07C9

_0795:
	npc_msg msg_0598_T25R1007_00002
	setvar VAR_SPECIAL_x8004, 0
	return

_07A0:
	npc_msg msg_0598_T25R1007_00003
	setvar VAR_SPECIAL_x8004, 1
	return

_07AB:
	setvar VAR_ELEVATOR_LAST_FLOOR, 65535
	closemsg
	apply_movement obj_T25R1007_gswoman6, _08B0
	wait_movement
	wait_se SEQ_SE_DP_SELECT
	elevator_anim VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	return

_07C9:
	switch VAR_ELEVATOR_LAST_FLOOR
	case 6, _082C
	case 5, _0837
	case 4, _0842
	case 3, _084D
	case 2, _0858
	case 1, _0863
	case 0, _086E
	end

_082C:
	npc_msg msg_0598_T25R1007_00010
	goto _0879
	end

_0837:
	npc_msg msg_0598_T25R1007_00009
	goto _0879
	end

_0842:
	npc_msg msg_0598_T25R1007_00008
	goto _0879
	end

_084D:
	npc_msg msg_0598_T25R1007_00007
	goto _0879
	end

_0858:
	npc_msg msg_0598_T25R1007_00006
	goto _0879
	end

_0863:
	npc_msg msg_0598_T25R1007_00005
	goto _0879
	end

_086E:
	npc_msg msg_0598_T25R1007_00011
	goto _0879
	end

_0879:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0881:
	setvar VAR_ELEVATOR_LAST_FLOOR, 65535
	wait 1, VAR_SPECIAL_RESULT
	npc_msg msg_0598_T25R1007_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0898:
	setvar VAR_ELEVATOR_LAST_FLOOR, 65535
	wait 1, VAR_SPECIAL_RESULT
	npc_msg msg_0598_T25R1007_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

	.balign 4, 0
_08B0:
	WalkOnSpotNormalSouth
	EndMovement
	.balign 4, 0
