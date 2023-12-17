#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0143.h"
#include "msgdata/msg/msg_0204.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0143_000
	scrdef_end

scr_seq_0143_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_465 0, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0070
	call _0122
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _003C
	goto _0055

_003C:
	scrcmd_465 3, 1, 0
	scrcmd_465 2, 1, 1
	npc_msg msg_0204_00000
	goto _00B6

_0055:
	scrcmd_465 3, 1, 0
	scrcmd_465 2, 1, 1
	npc_msg msg_0204_00001
	goto _008C
	end

_0070:
	npc_msg msg_0204_00002
_0073:
	call _0122
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _00B6
	goto _008C

_008C:
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_x8004
	menu_item_add 11, 255, 1
	menu_item_add 13, 255, 3
	menu_item_add 14, 255, 4
	menu_exec
	goto _00E2

_00B6:
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_x8004
	menu_item_add 11, 255, 1
	menu_item_add 12, 255, 2
	menu_item_add 13, 255, 3
	menu_item_add 14, 255, 4
	menu_exec
_00E2:
	switch VAR_SPECIAL_x8004
	case 1, _01EF
	case 2, _0287
	case 3, _056C
	case 4, _0577
	goto _0577

_0122:
	scrcmd_465 0, 0, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _014C
	scrcmd_465 1, 0, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01DF
_014C:
	scrcmd_465 0, 2, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0176
	scrcmd_465 1, 2, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01DF
_0176:
	scrcmd_465 0, 3, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01A0
	scrcmd_465 1, 3, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01DF
_01A0:
	scrcmd_465 0, 4, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01CA
	scrcmd_465 1, 4, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01DF
_01CA:
	scrcmd_465 0, 5, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01E7
_01DF:
	setvar VAR_SPECIAL_RESULT, 1
	return

_01E7:
	setvar VAR_SPECIAL_RESULT, 0
	return

_01EF:
	touchscreen_menu_show
	scrcmd_465 0, 0, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _021E
	npc_msg msg_0204_00005
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0579
_021E:
	npc_msg msg_0204_00006
	wait_button
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	closemsg
	scrcmd_465 4, VAR_SPECIAL_RESULT
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0579
	compare VAR_SPECIAL_RESULT, 2
	goto_if_eq _027C
	scrcmd_465 6
	scrcmd_465 2, 0, 0
	scrcmd_465 3, 0, 1
	npc_msg msg_0204_00007
	wait_button_or_walk_away
	goto _057E

_027C:
	npc_msg msg_0204_00027
	wait_button_or_walk_away
	goto _057E

_0287:
	npc_msg msg_0204_00003
	menu_init 1, 1, 0, 1, VAR_SPECIAL_x8004
	scrcmd_465 7, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0400
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _02B2
_02B2:
	scrcmd_465 0, 0, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _02EC
	scrcmd_465 1, 0, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _02EC
	scrcmd_465 2, 0, 0
	menu_item_add 15, 255, 0
_02EC:
	scrcmd_465 0, 2, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0326
	scrcmd_465 1, 2, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0326
	scrcmd_465 2, 2, 1
	menu_item_add 16, 255, 2
_0326:
	scrcmd_465 0, 3, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0360
	scrcmd_465 1, 3, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0360
	scrcmd_465 2, 3, 2
	menu_item_add 17, 255, 3
_0360:
	scrcmd_465 0, 4, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _039A
	scrcmd_465 1, 4, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _039A
	scrcmd_465 2, 4, 3
	menu_item_add 18, 255, 4
_039A:
	scrcmd_465 0, 5, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _03D4
	scrcmd_465 1, 5, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _03D4
	scrcmd_465 2, 5, 4
	menu_item_add 19, 255, 5
_03D4:
	menu_item_add 25, 255, 6
	menu_exec
	touchscreen_menu_show
	compare VAR_SPECIAL_x8004, 6
	goto_if_eq _0579
	compare VAR_SPECIAL_x8004, 65534
	goto_if_eq _0579
	goto _0528

_0400:
	scrcmd_465 0, 0, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _043A
	scrcmd_465 1, 0, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _043A
	scrcmd_465 2, 0, 0
	menu_item_add 20, 255, 0
_043A:
	scrcmd_465 0, 2, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0474
	scrcmd_465 1, 2, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0474
	scrcmd_465 2, 2, 1
	menu_item_add 21, 255, 2
_0474:
	scrcmd_465 0, 3, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _04AE
	scrcmd_465 1, 3, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _04AE
	scrcmd_465 2, 3, 2
	menu_item_add 22, 255, 3
_04AE:
	scrcmd_465 0, 4, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _04E8
	scrcmd_465 1, 4, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _04E8
	scrcmd_465 2, 4, 3
	menu_item_add 23, 255, 4
_04E8:
	scrcmd_465 0, 5, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _03D4
	scrcmd_465 1, 5, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _03D4
	scrcmd_465 2, 5, 4
	menu_item_add 24, 255, 5
	goto _03D4

_0528:
	scrcmd_465 2, VAR_SPECIAL_x8004, 0
	scrcmd_465 3, VAR_SPECIAL_x8004, 1
	npc_msg msg_0204_00008
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0287
	touchscreen_menu_show
	scrcmd_465 5, VAR_SPECIAL_x8004
	buffer_players_name 0
	scrcmd_465 2, VAR_SPECIAL_x8004, 1
	npc_msg msg_0204_00009
	wait_button_or_walk_away
	goto _057E

_056C:
	touchscreen_menu_show
	npc_msg msg_0204_00010
	goto _0073

_0577:
	touchscreen_menu_show
_0579:
	npc_msg msg_0204_00004
	wait_button_or_walk_away
_057E:
	closemsg
	releaseall
	end
	.balign 4, 0
